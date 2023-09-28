LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_and IS
END ENTITY;

ARCHITECTURE tb OF testbench_and IS
    SIGNAL y1, y2, g : STD_LOGIC; -- Corrected y1 to x2
    COMPONENT AND_Gate IS
        PORT (
            x1 : IN STD_LOGIC;
            x2 : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    inst : AND_Gate
    PORT MAP(x1 => y1, x2 => y2, y => g); -- Corrected port map arrows

    PROCESS
    BEGIN
        y1 <= '0';
        y2 <= '0';
        WAIT FOR 1 ns;
        y1 <= '1';
        y2 <= '0';
        WAIT FOR 1 ns;
        y1 <= '0';
        y2 <= '1';
        WAIT FOR 1 ns;
        y1 <= '1';
        y2 <= '1';
        WAIT FOR 1 ns;
    END PROCESS; -- Added missing end process label
END ARCHITECTURE;