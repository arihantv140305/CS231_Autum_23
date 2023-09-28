LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_mux IS
END ENTITY;

ARCHITECTURE arch OF testbench_mux IS

    COMPONENT mux4x2
        PORT (
            D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            Y : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL D1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL S1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Y1 : STD_LOGIC;

BEGIN

    mux : mux4x2
    PORT MAP(D => D1, S => S1, Y => Y1);
    PROCESS
    BEGIN
        D1(0) <= '1';
        D1(1) <= '0';
        D1(2) <= '0';
        D1(3) <= '0';
        S1(0) <= '0';
        S1(1) <= '0';
        WAIT FOR 1 ns;

        D1(0) <= '1';
        D1(1) <= '0';
        D1(2) <= '1';
        D1(3) <= '1';
        S1(0) <= '0';
        S1(1) <= '1';
        WAIT FOR 1 ns;

        D1(0) <= '0';
        D1(1) <= '0';
        D1(2) <= '1';
        D1(3) <= '1';
        S1(0) <= '1';
        S1(1) <= '0';
        WAIT FOR 1 ns;

        D1(0) <= '1';
        D1(1) <= '0';
        D1(2) <= '0';
        D1(3) <= '1';
        S1(0) <= '1';
        S1(1) <= '1';
        WAIT FOR 1 ns;

        D1(0) <= '1';
        D1(1) <= '0';
        D1(2) <= '0';
        D1(3) <= '1';
        S1(0) <= '1';
        S1(1) <= '0';
        WAIT FOR 1 ns;

        D1(0) <= '1';
        D1(1) <= '1';
        D1(2) <= '0';
        D1(3) <= '0';
        S1(0) <= '0';
        S1(1) <= '1';
        WAIT FOR 1 ns;
    END PROCESS;
END ARCHITECTURE;