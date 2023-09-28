LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY mux4x2 IS
    PORT (
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Y : OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE arch OF mux4x2 IS
    SIGNAL T : STD_LOGIC_VECTOR(10 DOWNTO 0);

    COMPONENT AND_Gate IS
        PORT (
            x1 : IN STD_LOGIC;
            x2 : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT NOT_Gate IS
        PORT (
            x : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT OR_Gate IS
        PORT (
            x1 : IN STD_LOGIC;
            x2 : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT;

BEGIN

    not1 : NOT_Gate
    PORT MAP(x => S(0), y => T(9));
    not2 : NOT_Gate
    PORT MAP(x => S(1), y => T(10));
    and1 : AND_Gate
    PORT MAP(x1 => D(0), x2 => T(9), y => T(0));
    and2 : AND_Gate
    PORT MAP(x1 => D(1), x2 => S(0), y => T(1));
    and3 : AND_Gate
    PORT MAP(x1 => D(2), x2 => T(9), y => T(2));
    and4 : AND_Gate
    PORT MAP(x1 => D(3), x2 => S(0), y => T(3));
    or1 : OR_Gate
    PORT MAP(x1 => T(0), x2 => T(1), y => T(4));
    or2 : OR_Gate
    PORT MAP(x1 => T(2), x2 => T(3), y => T(5));
    and5 : AND_Gate
    PORT MAP(x1 => T(4), x2 => T(10), y => T(6));
    and6 : AND_Gate
    PORT MAP(x1 => T(5), x2 => S(1), y => T(7));
    or3 : OR_Gate
    PORT MAP(x1 => T(6), x2 => T(7), y => T(8));
    Y <= T(8);

END ARCHITECTURE;