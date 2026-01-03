LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.sp_memory_util_pkg.ALL; -- Assuming pkg is compiled

ENTITY sp_memory_axi IS
    GENERIC (
        WIDTH      : INTEGER := 32;
        DEPTH      : INTEGER := 1024;
        PIPELINE   : INTEGER := 0;
        PARITY     : INTEGER := 0;
        ECC        : INTEGER := 0;
        TECHNOLOGY : STRING  := "GENERIC"
    );
    PORT (
        aclk    : IN STD_LOGIC;
        aresetn : IN STD_LOGIC;

        -- Sideband Signals
        sleep          : IN  STD_LOGIC := '0';
        bist_en        : IN  STD_LOGIC := '0';
        bist_done      : OUT STD_LOGIC;
        bist_pass      : OUT STD_LOGIC;
        err_parity     : OUT STD_LOGIC;
        err_ecc_single : OUT STD_LOGIC;
        err_ecc_double : OUT STD_LOGIC;
        
        -- Write Address
        awaddr  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        awlen   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        awsize  : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        awburst : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        awprot  : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        awvalid : IN  STD_LOGIC;
        awready : OUT STD_LOGIC;

        -- Write Data
        wdata  : IN  STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
        wstrb  : IN  STD_LOGIC_VECTOR((WIDTH / 8) - 1 DOWNTO 0);
        wlast  : IN  STD_LOGIC;
        wvalid : IN  STD_LOGIC;
        wready : OUT STD_LOGIC;

        -- Write Response
        bresp  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        bvalid : OUT STD_LOGIC;
        bready : IN  STD_LOGIC;

        -- Read Address
        araddr  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        arlen   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        arsize  : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        arburst : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        arprot  : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        arvalid : IN  STD_LOGIC;
        arready : OUT STD_LOGIC;

        -- Read Data
        rdata  : OUT STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
        rresp  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        rlast  : OUT STD_LOGIC;
        rvalid : OUT STD_LOGIC;
        rready : IN  STD_LOGIC
    );
END ENTITY sp_memory_axi;

ARCHITECTURE rtl OF sp_memory_axi IS

    -- Core Component
    COMPONENT sp_memory
        GENERIC (
            WIDTH      : INTEGER;
            DEPTH      : INTEGER;
            TECHNOLOGY : STRING;
            PIPELINE   : INTEGER;
            PARITY     : INTEGER;
            ECC        : INTEGER
        );
        PORT (
            clk            : IN  STD_LOGIC;
            rst_n          : IN  STD_LOGIC;
            cs             : IN  STD_LOGIC;
            we             : IN  STD_LOGIC;
            addr           : IN  STD_LOGIC_VECTOR;
            wdata          : IN  STD_LOGIC_VECTOR;
            wstrb          : IN  STD_LOGIC_VECTOR;
            rdata          : OUT STD_LOGIC_VECTOR;
            sleep          : IN  STD_LOGIC := '0';
            bist_en        : IN  STD_LOGIC := '0';
            bist_done      : OUT STD_LOGIC;
            bist_pass      : OUT STD_LOGIC;
            err_parity     : OUT STD_LOGIC;
            err_ecc_single : OUT STD_LOGIC;
            err_ecc_double : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Constants
    CONSTANT ADDR_LSB : INTEGER := function_log2(WIDTH / 8);
    CONSTANT ADDR_BITS : INTEGER := function_log2(DEPTH);

    -- Internal Signals
    SIGNAL mem_cs    : STD_LOGIC;
    SIGNAL mem_we    : STD_LOGIC;
    SIGNAL mem_addr  : STD_LOGIC_VECTOR(ADDR_BITS - 1 DOWNTO 0);
    SIGNAL mem_wdata : STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
    SIGNAL mem_wstrb : STD_LOGIC_VECTOR((WIDTH / 8) - 1 DOWNTO 0);
    SIGNAL mem_rdata : STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);

    -- State Machine
    TYPE state_type IS (IDLE, WRITE_DATA, WRITE_RESP, READ_DATA);
    SIGNAL state : state_type;

    SIGNAL curr_awaddr, curr_araddr : UNSIGNED(31 DOWNTO 0);
    SIGNAL len_awcount, len_arcount : UNSIGNED(7 DOWNTO 0);

    SIGNAL w_addr_ok, r_addr_ok : BOOLEAN;

BEGIN

    w_addr_ok <= unsigned(awaddr) < (to_unsigned(DEPTH, 32) sll ADDR_LSB);
    r_addr_ok <= unsigned(araddr) < (to_unsigned(DEPTH, 32) sll ADDR_LSB);

    PROCESS (aclk, aresetn)
    BEGIN
        IF aresetn = '0' THEN
            state       <= IDLE;
            awready     <= '0';
            wready      <= '0';
            bvalid      <= '0';
            bresp       <= "00";
            arready     <= '0';
            rvalid      <= '0';
            rresp       <= "00";
            rlast       <= '0';
            len_awcount <= (OTHERS => '0');
            len_arcount <= (OTHERS => '0');
        ELSIF rising_edge(aclk) THEN
            CASE state IS
                WHEN IDLE =>
                    IF awvalid = '1' THEN
                        awready     <= '1';
                        curr_awaddr <= unsigned(awaddr);
                        len_awcount <= unsigned(awlen);
                        IF w_addr_ok THEN
                            bresp <= "00";
                        ELSE
                            bresp <= "11";
                        END IF;
                        state <= WRITE_DATA;
                    ELSIF arvalid = '1' THEN
                        arready     <= '1';
                        curr_araddr <= unsigned(araddr);
                        len_arcount <= unsigned(arlen);
                        IF r_addr_ok THEN
                            rresp <= "00";
                        ELSE
                            rresp <= "11";
                        END IF;
                        state <= READ_DATA;
                    END IF;

                WHEN WRITE_DATA =>
                    awready <= '0';
                    wready  <= '1';
                    IF wvalid = '1' AND wready = '1' THEN
                        curr_awaddr <= curr_awaddr + (2**ADDR_LSB);
                        IF len_awcount = 0 OR wlast = '1' THEN
                            wready <= '0';
                            state  <= WRITE_RESP;
                        ELSE
                            len_awcount <= len_awcount - 1;
                        END IF;
                    END IF;

                WHEN WRITE_RESP =>
                    wready <= '0';
                    bvalid <= '1';
                    IF bvalid = '1' AND bready = '1' THEN
                        bvalid <= '0';
                        state  <= IDLE;
                    END IF;

                WHEN READ_DATA =>
                    arready <= '0';
                    rvalid  <= '1';
                    IF len_arcount = 0 THEN
                        rlast <= '1';
                    ELSE
                        rlast <= '0';
                    END IF;

                    IF rvalid = '1' AND rready = '1' THEN
                        curr_araddr <= curr_araddr + (2**ADDR_LSB);
                        IF len_arcount = 0 THEN
                            rvalid <= '0';
                            rlast  <= '0';
                            state  <= IDLE;
                        ELSE
                            len_arcount <= len_arcount - 1;
                        END IF;
                    END IF;

            END CASE;
        END IF;
    END PROCESS;

    -- Memory mapping
    PROCESS (state, wvalid, curr_awaddr, curr_araddr, wdata, wstrb)
    BEGIN
        mem_cs    <= '0';
        mem_we    <= '0';
        mem_addr  <= (OTHERS => '0');
        mem_wdata <= (OTHERS => '0');
        mem_wstrb <= (OTHERS => '0');

        IF state = WRITE_DATA AND wvalid = '1' THEN
            mem_cs    <= '1';
            mem_we    <= '1';
            mem_addr  <= std_logic_vector(curr_awaddr(ADDR_BITS + ADDR_LSB - 1 DOWNTO ADDR_LSB));
            mem_wdata <= wdata;
            mem_wstrb <= wstrb;
        ELSIF state = READ_DATA THEN
            mem_cs   <= '1';
            mem_we   <= '0';
            mem_addr <= std_logic_vector(curr_araddr(ADDR_BITS + ADDR_LSB - 1 DOWNTO ADDR_LSB));
        END IF;
    END PROCESS;

    -- Instantiate Core
    core_inst : sp_memory
    GENERIC MAP (
        WIDTH      => WIDTH,
        DEPTH      => DEPTH,
        TECHNOLOGY => TECHNOLOGY,
        PIPELINE   => PIPELINE,
        PARITY     => PARITY,
        ECC        => ECC
    )
    PORT MAP (
        clk            => aclk,
        rst_n          => aresetn,
        cs             => mem_cs,
        we             => mem_we,
        addr           => mem_addr,
        wdata          => mem_wdata,
        wstrb          => mem_wstrb,
        rdata          => mem_rdata,
        sleep          => sleep,
        bist_en        => bist_en,
        bist_done      => bist_done,
        bist_pass      => bist_pass,
        err_parity     => err_parity,
        err_ecc_single => err_ecc_single,
        err_ecc_double => err_ecc_double
    );

    rdata <= mem_rdata;

END ARCHITECTURE rtl;
