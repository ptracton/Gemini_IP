LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.sp_memory_util_pkg.ALL;

ENTITY sp_memory_ahb IS
    GENERIC (
        WIDTH      : INTEGER := 32;
        DEPTH      : INTEGER := 1024;
        PIPELINE   : INTEGER := 0;
        PARITY     : INTEGER := 0;
        ECC        : INTEGER := 0;
        TECHNOLOGY : STRING  := "GENERIC"
    );
    PORT (
        hclk      : IN STD_LOGIC;
        hresetn   : IN STD_LOGIC;

        -- Sideband Signals
        sleep          : IN  STD_LOGIC := '0';
        bist_en        : IN  STD_LOGIC := '0';
        bist_done      : OUT STD_LOGIC;
        bist_pass      : OUT STD_LOGIC;
        err_parity     : OUT STD_LOGIC;
        err_ecc_single : OUT STD_LOGIC;
        err_ecc_double : OUT STD_LOGIC;
        
        haddr     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        hwrite    : IN STD_LOGIC;
        hsize     : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        hburst    : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        hprot     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        htrans    : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        hmastlock : IN STD_LOGIC;
        hwdata    : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
        hsel      : IN STD_LOGIC;
        hready    : IN STD_LOGIC;
        
        hreadyout : OUT STD_LOGIC;
        hrdata    : OUT STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
        hresp     : OUT STD_LOGIC
    );
END ENTITY sp_memory_ahb;

ARCHITECTURE rtl OF sp_memory_ahb IS

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

    CONSTANT ADDR_LSB : INTEGER := function_log2(WIDTH/8);
    CONSTANT ADDR_BITS : INTEGER := function_log2(DEPTH);

    SIGNAL mem_cs    : STD_LOGIC;
    SIGNAL mem_we    : STD_LOGIC;
    SIGNAL mem_addr  : STD_LOGIC_VECTOR(ADDR_BITS-1 DOWNTO 0);
    SIGNAL mem_wdata : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
    SIGNAL mem_wstrb : STD_LOGIC_VECTOR((WIDTH/8)-1 DOWNTO 0);

    -- Pipeline Registers
    SIGNAL addr_phase : STD_LOGIC;
    SIGNAL write_phase : STD_LOGIC;
    SIGNAL latched_addr : STD_LOGIC_VECTOR(ADDR_BITS-1 DOWNTO 0);
    SIGNAL latched_size : STD_LOGIC_VECTOR(2 DOWNTO 0);


    
    -- Read Wait State Logic
    SIGNAL data_ready : STD_LOGIC;
    SIGNAL addr_ok    : BOOLEAN;

BEGIN

    addr_ok   <= unsigned(haddr) < (to_unsigned(DEPTH, 32) sll ADDR_LSB);
    hreadyout <= NOT (addr_phase AND (NOT write_phase) AND (NOT data_ready));
    -- Wait state during Read Data Phase if data not ready

    hresp <= '1' WHEN addr_phase = '1' AND NOT addr_ok ELSE '0';

    PROCESS (hclk, hresetn)
    BEGIN
        IF hresetn = '0' THEN
            addr_phase   <= '0';
            write_phase  <= '0';
            latched_addr <= (OTHERS => '0');
            latched_size <= (OTHERS => '0');
            data_ready   <= '0';
        ELSIF rising_edge(hclk) THEN

            IF hready = '1' THEN
                data_ready <= '0'; -- Clear on new transaction acceptance

                IF hsel = '1' AND htrans(1) = '1' THEN -- NONSEQ or SEQ
                    addr_phase   <= '1';
                    write_phase  <= hwrite;
                    latched_addr <= haddr(ADDR_BITS + ADDR_LSB - 1 DOWNTO ADDR_LSB);
                    latched_size <= hsize;
                ELSE
                    addr_phase  <= '0';
                    write_phase <= '0';
                END IF;
            ELSIF addr_phase = '1' AND write_phase = '0' AND data_ready = '0' THEN
                data_ready <= '1'; -- Stalling for Read
            END IF;

        END IF;
    END PROCESS;

    PROCESS (addr_phase, write_phase, latched_addr, hwdata, data_ready)
    BEGIN
        mem_cs    <= '0';
        mem_we    <= '0';
        mem_addr  <= latched_addr; -- Default to latched address (for both read/write now)
        mem_wdata <= hwdata;
        mem_wstrb <= (OTHERS => '0');
        -- Simplified Byte Enable (Always Word)

        IF addr_phase = '1' AND write_phase = '1' THEN
            mem_cs    <= '1';
            mem_we    <= '1';
            mem_wstrb <= (OTHERS => '1');
        ELSIF addr_phase = '1' AND write_phase = '0' AND data_ready = '0' THEN
            -- Read in Wait State
            mem_cs <= '1';
            mem_we <= '0';
        END IF;
    END PROCESS;

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
        clk            => hclk,
        rst_n          => hresetn,
        cs             => mem_cs,
        we             => mem_we,
        addr           => mem_addr,
        wdata          => hwdata,
        wstrb          => mem_wstrb,
        rdata          => hrdata,
        sleep          => sleep,
        bist_en        => bist_en,
        bist_done      => bist_done,
        bist_pass      => bist_pass,
        err_parity     => err_parity,
        err_ecc_single => err_ecc_single,
        err_ecc_double => err_ecc_double
    );

END ARCHITECTURE rtl;
