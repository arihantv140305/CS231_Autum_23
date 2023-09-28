LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY NOT_Gate IS
    PORT (
        x : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE arch OF NOT_Gate IS
BEGIN
    y <= NOT x;
END ARCHITECTURE;