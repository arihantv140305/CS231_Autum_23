LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_decoder2x4 IS
END ENTITY;

ARCHITECTURE arch OF testbench_decoder2x4 IS

    COMPONENT decoder2x4
        PORT (
            A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            E : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    SIGNAL A1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Y1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL e : STD_LOGIC;
BEGIN
    decode : decoder2x4
    PORT MAP(A => A1, E => e, Y => Y1);

    PROCESS
    BEGIN
        e <= '1';
        A1(0) <= '0';
        A1(1) <= '0';
        WAIT FOR 1 ns;

        A1(0) <= '1';
        A1(1) <= '0';
        WAIT FOR 1 ns;

        A1(0) <= '0';
        A1(1) <= '1';
        WAIT FOR 1 ns;

        A1(0) <= '1';
        A1(1) <= '1';
        WAIT FOR 1 ns;

        e <= '0';
        A1(0) <= '0';
        A1(1) <= '0';
        WAIT FOR 1 ns;

        A1(0) <= '1';
        A1(1) <= '0';
        WAIT FOR 1 ns;

        A1(0) <= '0';
        A1(1) <= '1';
        WAIT FOR 1 ns;

        A1(0) <= '1';
        A1(1) <= '1';
        WAIT FOR 1 ns;
    END PROCESS;
END ARCHITECTURE;