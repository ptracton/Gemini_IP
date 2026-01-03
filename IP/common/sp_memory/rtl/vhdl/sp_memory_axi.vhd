LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.sp_memory_util_pkg.ALL; -- Assuming pkg is compiled

ENTITY sp_memory_axi IS
    GENERIC (
        WIDTH      : INTEGER := 32;
        DEPTH      : INTEGER := 1024;
        TECHNOLOGY : STRING  := "GENERIC"
    );
    PORT (
        aclk    : IN STD_LOGIC;
        aresetn : IN STD_LOGIC;
        
        -- Write Address
        awaddr  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        awprot  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        awvalid : IN STD_LOGIC;
        awready : OUT STD_LOGIC;
        
        -- Write Data
        wdata   : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
        wstrb   : IN STD_LOGIC_VECTOR((WIDTH/8)-1 DOWNTO 0);
        wvalid  : IN STD_LOGIC;
        wready  : OUT STD_LOGIC;
        
        -- Write Response
        bresp   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        bvalid  : OUT STD_LOGIC;
        bready  : IN STD_LOGIC;
        
        -- Read Address
        araddr  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        arprot  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        arvalid : IN STD_LOGIC;
        arready : OUT STD_LOGIC;
        
        -- Read Data
        rdata   : OUT STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
        rresp   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        rvalid  : OUT STD_LOGIC;
        rready  : IN STD_LOGIC
    );
END ENTITY sp_memory_axi;

ARCHITECTURE rtl OF sp_memory_axi IS

    -- Core Component
    COMPONENT sp_memory
        GENERIC (
            WIDTH      : INTEGER;
            DEPTH      : INTEGER;
            TECHNOLOGY : STRING
        );
        PORT (
            clk   : IN STD_LOGIC;
            rst_n : IN STD_LOGIC;
            cs    : IN STD_LOGIC;
            we    : IN STD_LOGIC;
            addr  : IN STD_LOGIC_VECTOR;
            wdata : IN STD_LOGIC_VECTOR;
            wstrb : IN STD_LOGIC_VECTOR;
            rdata : OUT STD_LOGIC_VECTOR
        );
    END COMPONENT;

    -- Constants
    CONSTANT ADDR_LSB : INTEGER := function_log2(WIDTH/8);
    CONSTANT ADDR_BITS : INTEGER := function_log2(DEPTH);

    -- Internal Signals
    SIGNAL mem_cs    : STD_LOGIC;
    SIGNAL mem_we    : STD_LOGIC;
    SIGNAL mem_addr  : STD_LOGIC_VECTOR(ADDR_BITS-1 DOWNTO 0);
    SIGNAL mem_wdata : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
    SIGNAL mem_wstrb : STD_LOGIC_VECTOR((WIDTH/8)-1 DOWNTO 0);
    SIGNAL mem_rdata : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);

    -- Registers
    SIGNAL aw_done, w_done, ar_done : STD_LOGIC;
    SIGNAL latched_waddr, latched_raddr : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL latched_wdata : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
    SIGNAL latched_wstrb : STD_LOGIC_VECTOR((WIDTH/8)-1 DOWNTO 0);
    
    -- Output registers
    SIGNAL awready_reg, wready_reg, bvalid_reg, arready_reg, rvalid_reg : STD_LOGIC;

BEGIN
    -- Assignments
    awready <= awready_reg;
    wready  <= wready_reg;
    bvalid  <= bvalid_reg;
    arready <= arready_reg;
    rvalid  <= rvalid_reg;
    rdata   <= mem_rdata; -- BRAM output is registered, so valid when rvalid asserted
    bresp   <= "00"; -- OKAY
    rresp   <= "00"; -- OKAY

    PROCESS (aclk, aresetn)
    BEGIN
        IF aresetn = '0' THEN
            awready_reg <= '0';
            wready_reg  <= '0';
            bvalid_reg  <= '0';
            arready_reg <= '0';
            rvalid_reg  <= '0';
            aw_done <= '0';
            w_done  <= '0';
            ar_done <= '0';
            latched_waddr <= (OTHERS => '0');
            latched_wdata <= (OTHERS => '0');
            latched_wstrb <= (OTHERS => '0');
            latched_raddr <= (OTHERS => '0');
        ELSIF rising_edge(aclk) THEN
            
            -- WRITE CHANNEL
            IF awvalid = '1' AND awready_reg = '0' AND aw_done = '0' THEN
                awready_reg <= '1';
            ELSE
                awready_reg <= '0';
            END IF;

            IF wvalid = '1' AND wready_reg = '0' AND w_done = '0' THEN
                wready_reg <= '1';
            ELSE
                wready_reg <= '0';
            END IF;

            IF awready_reg = '1' AND awvalid = '1' THEN
                aw_done <= '1';
                latched_waddr <= awaddr;
            END IF;
            
            IF wready_reg = '1' AND wvalid = '1' THEN
                w_done <= '1';
                latched_wdata <= wdata;
                latched_wstrb <= wstrb;
            END IF;

            IF aw_done = '1' AND w_done = '1' AND bvalid_reg = '0' THEN
                bvalid_reg <= '1';
                aw_done <= '0';
                w_done <= '0';
            ELSIF bready = '1' AND bvalid_reg = '1' THEN
                bvalid_reg <= '0';
            END IF;

            -- READ CHANNEL
            IF arvalid = '1' AND arready_reg = '0' AND ar_done = '0' THEN
                arready_reg <= '1';
                ar_done <= '1';
                latched_raddr <= araddr;
            ELSE
                arready_reg <= '0';
            END IF;

            IF rready = '1' AND rvalid_reg = '1' THEN
                rvalid_reg <= '0';
                ar_done <= '0';
            ELSIF ar_done = '1' AND rvalid_reg = '0' THEN
                -- Latency match: If CS asserted cycle N, Data valid N+1
                -- We asserted CS below in COMB process? No wait.
                -- Logic here ensures state progression.
                rvalid_reg <= '1';
            END IF;
            
        END IF;
    END PROCESS;

    -- Combinatorial Memory Control
    PROCESS (aw_done, w_done, bvalid_reg, arvalid, arready_reg, latched_waddr, latched_wdata, latched_wstrb, araddr, rvalid_reg)
    BEGIN
        mem_cs <= '0';
        mem_we <= '0';
        mem_addr <= (OTHERS => '0');
        mem_wdata <= (OTHERS => '0');
        mem_wstrb <= (OTHERS => '0');

        IF aw_done = '1' AND w_done = '1' AND bvalid_reg = '0' THEN
            -- Trigger Write
            mem_cs <= '1';
            mem_we <= '1';
            mem_addr <= latched_waddr(ADDR_BITS+ADDR_LSB-1 DOWNTO ADDR_LSB);
            mem_wdata <= latched_wdata;
            mem_wstrb <= latched_wstrb;
        ELSIF arvalid = '1' AND arready_reg = '1' THEN
            -- Trigger Read
            -- Note: arready_reg is high for 1 cycle when we capture address
            mem_cs <= '1';
            mem_we <= '0';
            mem_addr <= araddr(ADDR_BITS+ADDR_LSB-1 DOWNTO ADDR_LSB);
        END IF;
    END PROCESS;

    -- Instantiate Core
    core : sp_memory
    GENERIC MAP (
        WIDTH => WIDTH,
        DEPTH => DEPTH,
        TECHNOLOGY => TECHNOLOGY
    )
    PORT MAP (
        clk   => aclk,
        rst_n => aresetn,
        cs    => mem_cs,
        we    => mem_we,
        addr  => mem_addr,
        wdata => mem_wdata,
        wstrb => mem_wstrb,
        rdata => mem_rdata
    );

END ARCHITECTURE rtl;
