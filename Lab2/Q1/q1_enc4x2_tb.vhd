LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY testbench_enc IS
END ENTITY;

ARCHITECTURE arch OF testbench_enc IS

    SIGNAL I1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL y1 : STD_LOGIC_VECTOR(1 DOWNTO 0);

    COMPONENT encoder4x2
        PORT (
            I : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
    END COMPONENT;

BEGIN
    enc : encoder4x2
    PORT MAP(I => I1, Y => Y1);
    PROCESS
    BEGIN
        I1(0) <= '1';
        I1(1) <= '0';
        I1(2) <= '0';
        I1(3) <= '0';
        WAIT FOR 1 ns;

        I1(0) <= '0';
        I1(1) <= '1';
        I1(2) <= '0';
        I1(3) <= '0';
        WAIT FOR 1 ns;

        I1(0) <= '0';
        I1(1) <= '0';
        I1(2) <= '1';
        I1(3) <= '0';
        WAIT FOR 1 ns;

        I1(0) <= '0';
        I1(1) <= '0';
        I1(2) <= '0';
        I1(3) <= '1';
        WAIT FOR 1 ns;
    END PROCESS;
END ARCHITECTURE;