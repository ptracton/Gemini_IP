LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE sp_memory_util_pkg IS
    FUNCTION function_log2(n : NATURAL) RETURN NATURAL;
END PACKAGE;

PACKAGE BODY sp_memory_util_pkg IS
    FUNCTION function_log2(n : NATURAL) RETURN NATURAL IS
        VARIABLE i : NATURAL := 0;
        VARIABLE m : NATURAL := 1;
    BEGIN
        WHILE m < n LOOP
            i := i + 1;
            m := m * 2;
        END LOOP;
        RETURN i;
    END FUNCTION;
END PACKAGE BODY;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.sp_memory_util_pkg.ALL;

ENTITY sp_memory IS
    GENERIC (
        WIDTH      : INTEGER := 32;
        DEPTH      : INTEGER := 1024;
        TECHNOLOGY : STRING  := "GENERIC"
    );
    PORT (
        clk   : IN STD_LOGIC;
        rst_n : IN STD_LOGIC;
        cs    : IN STD_LOGIC;
        we    : IN STD_LOGIC;
        addr  : IN STD_LOGIC_VECTOR((function_log2(DEPTH) - 1) DOWNTO 0);
        wdata : IN STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
        wstrb : IN STD_LOGIC_VECTOR((WIDTH / 8) - 1 DOWNTO 0);
        rdata : OUT STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0)
    );
END ENTITY sp_memory;

ARCHITECTURE rtl OF sp_memory IS

    -- Define memory array type
    TYPE mem_type IS ARRAY (0 TO DEPTH - 1) OF STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
    SIGNAL mem : mem_type;

BEGIN

    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF cs = '1' THEN
                -- Write Logic with Byte Enables
                IF we = '1' THEN
                    FOR i IN 0 TO (WIDTH / 8) - 1 LOOP
                        IF wstrb(i) = '1' THEN
                            mem(to_integer(unsigned(addr)))((i * 8) + 7 DOWNTO i * 8) <= wdata((i * 8) + 7 DOWNTO i * 8);
                        END IF;
                    END LOOP;
                END IF;

                -- Read Logic (Synchronous)
                -- Usually recommend Read-First or Write-First depending on tech.
                -- This template (read logic outside write if) infers Read-Before-Write (old data) typically,
                -- or Write-Through depending on tool. 
                -- Ideally for portable inference, we separate reliable read from write.
                rdata <= mem(to_integer(unsigned(addr)));
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE rtl;
