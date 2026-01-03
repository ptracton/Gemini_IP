LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.sp_memory_util_pkg.ALL;

ENTITY sp_memory_apb IS
    GENERIC (
        WIDTH      : INTEGER := 32;
        DEPTH      : INTEGER := 1024;
        TECHNOLOGY : STRING  := "GENERIC"
    );
    PORT (
        pclk    : IN STD_LOGIC;
        presetn : IN STD_LOGIC;
        
        paddr   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        psel    : IN STD_LOGIC;
        penable : IN STD_LOGIC;
        pwrite  : IN STD_LOGIC;
        pwdata  : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
        pstrb   : IN STD_LOGIC_VECTOR((WIDTH/8)-1 DOWNTO 0);
        pprot   : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        
        pready  : OUT STD_LOGIC;
        prdata  : OUT STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
        pslverr : OUT STD_LOGIC
    );
END ENTITY sp_memory_apb;

ARCHITECTURE rtl OF sp_memory_apb IS

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

    CONSTANT ADDR_LSB : INTEGER := function_log2(WIDTH/8);
    CONSTANT ADDR_BITS : INTEGER := function_log2(DEPTH);

    SIGNAL mem_cs   : STD_LOGIC;
    SIGNAL mem_we   : STD_LOGIC;
    SIGNAL mem_addr : STD_LOGIC_VECTOR(ADDR_BITS-1 DOWNTO 0);

BEGIN
    
    pready  <= '1'; -- Always ready
    pslverr <= '0';

    mem_cs <= psel AND ((NOT pwrite) OR penable);
    mem_we <= pwrite;
    mem_addr <= paddr(ADDR_BITS+ADDR_LSB-1 DOWNTO ADDR_LSB);

    core : sp_memory
    GENERIC MAP (
        WIDTH => WIDTH,
        DEPTH => DEPTH,
        TECHNOLOGY => TECHNOLOGY
    )
    PORT MAP (
        clk   => pclk,
        rst_n => presetn,
        cs    => mem_cs,
        we    => mem_we,
        addr  => mem_addr,
        wdata => pwdata,
        wstrb => pstrb,
        rdata => prdata
    );

END ARCHITECTURE rtl;
