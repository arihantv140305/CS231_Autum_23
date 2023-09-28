LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY encoder4x2 IS
    PORT (
        I : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Y : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END ENTITY;

ARCHITECTURE arch OF encoder4x2 IS

    COMPONENT OR_Gate IS
        PORT (
            x1 : IN STD_LOGIC;
            x2 : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT;

BEGIN

    or1 : OR_Gate
    PORT MAP(x1 => I(3), x2 => I(1), y => Y(0));
    or2 : OR_Gate
    PORT MAP(x1 => I(3), x2 => I(2), y => Y(1));

END ARCHITECTURE;