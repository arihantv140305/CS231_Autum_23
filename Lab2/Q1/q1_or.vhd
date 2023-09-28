LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY OR_Gate IS
    PORT (
        x1 : IN STD_LOGIC;
        x2 : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE arch OF OR_Gate IS
BEGIN
    y <= x1 OR x2;
END ARCHITECTURE;