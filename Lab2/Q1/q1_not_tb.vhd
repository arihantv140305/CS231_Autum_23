LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_not IS
END ENTITY;

ARCHITECTURE tb OF testbench_not IS
    SIGNAL i, o : STD_LOGIC; -- Corrected y1 to x2
    COMPONENT NOT_Gate IS
        PORT (
            x : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    inst : NOT_Gate
    PORT MAP(x => i, y => o); -- Corrected port map arrows

    PROCESS
    BEGIN
        i <= '0';
        WAIT FOR 1 ns;
        i <= '1';
        WAIT FOR 1 ns;
    END PROCESS; -- Added missing end process label
END ARCHITECTURE;