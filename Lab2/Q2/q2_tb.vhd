LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_decoder4x16 IS
END ENTITY;

ARCHITECTURE arch OF testbench_decoder4x16 IS
    COMPONENT decoder4x16
        PORT (
            a, b, c, d, enable : IN STD_LOGIC;
            dec : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
    END COMPONENT;
    SIGNAL I : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL O : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL E : STD_LOGIC;
BEGIN
    code1 : decoder4x16
    PORT MAP(a => I(0), b => I(1), c => I(2), d => I(3), enable => E, dec => O);
    E <= '1';
    PROCESS
    BEGIN
        I <= "0000";
        WAIT FOR 1 ns;
        LOOP
            I <= STD_LOGIC_VECTOR(unsigned(I) + 1);
            EXIT WHEN I = "1111";
            WAIT FOR 1 ns;
        END LOOP;
    END PROCESS;
END ARCHITECTURE;