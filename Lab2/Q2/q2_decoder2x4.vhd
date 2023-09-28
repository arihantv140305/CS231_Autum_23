LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY decoder2x4 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        E : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY;

ARCHITECTURE arch OF decoder2x4 IS
    SIGNAL A0, A1 : STD_LOGIC;
    SIGNAL t : STD_LOGIC_VECTOR(3 DOWNTO 0);
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
BEGIN
    --A0 <= NOT A(0);
    not1 : NOT_Gate
    PORT MAP(x => A(0), y => A0);
    --A1 <= NOT A(1);
    not2 : NOT_Gate
    PORT MAP(x => A(1), y => A1);
    --t(0) <= A0 AND A1;
    and1 : AND_Gate
    PORT MAP(x1 => A0, x2 => A1, y => t(0));
    --t(1) <= A(0) AND A1;
    and2 : AND_Gate
    PORT MAP(x1 => A(0), x2 => A1, y => t(1));
    --t(2) <= A0 AND A(1);
    and3 : AND_Gate
    PORT MAP(x1 => A(1), x2 => A0, y => t(2));
    -- t(3) <= A(0) AND A(1);
    and4 : AND_Gate
    PORT MAP(x1 => A(0), x2 => A(1), y => t(3));
    --Y(0) <= t(0) AND E;
    and5 : AND_Gate
    PORT MAP(x1 => t(0), x2 => E, y => Y(0));
    -- Y(1) <= t(1) AND E;
    and6 : AND_Gate
    PORT MAP(x1 => t(1), x2 => E, y => Y(1));
    --Y(2) <= t(2) AND E;
    and7 : AND_Gate
    PORT MAP(x1 => t(2), x2 => E, y => Y(2));
    --Y(3) <= t(3) AND E;
    and8 : AND_Gate
    PORT MAP(x1 => t(3), x2 => E, y => Y(3));
END ARCHITECTURE;