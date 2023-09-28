LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY decoder4x16 IS
    PORT (
        a, b, c, d, enable : IN STD_LOGIC;
        dec : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END ENTITY;

ARCHITECTURE arch OF decoder4x16 IS

    COMPONENT decoder2x4
        PORT (
            A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            E : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    SIGNAL o : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    code1 : decoder2x4
    PORT MAP(A(1) => d, A(0) => c, E => enable, Y => o);
    code2 : decoder2x4
    PORT MAP(A(1) => b, A(0) => a, E => o(0), Y => dec(3 DOWNTO 0));
    code3 : decoder2x4
    PORT MAP(A(1) => b, A(0) => a, E => o(1), Y => dec(7 DOWNTO 4));
    code4 : decoder2x4
    PORT MAP(A(1) => b, A(0) => a, E => o(2), Y => dec(11 DOWNTO 8));
    code5 : decoder2x4
    PORT MAP(A(1) => b, A(0) => a, E => o(3), Y => dec(15 DOWNTO 12));
END ARCHITECTURE;