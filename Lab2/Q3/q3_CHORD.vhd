LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CHORD_Encoder IS
    PORT (
        clk, rst : IN STD_LOGIC;
        a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_valid : OUT STD_LOGIC;
        z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;

ARCHITECTURE arch OF CHORD_Encoder IS
    SIGNAL clk_tick : INTEGER := 0;
    SIGNAL h : INTEGER := 0;
    SIGNAL t : INTEGER := 0;
    SIGNAL buff : INTEGER := 0;
    SIGNAL temp : INTEGER;
    TYPE queue IS ARRAY (INTEGER RANGE 0 TO 5) OF INTEGER;
    SIGNAL q : queue;
    TYPE map1 IS ARRAY (INTEGER RANGE <>) OF INTEGER;
    CONSTANT btoi : map1 := (
        0 => 17,
        1 TO 30 => 0,
        32 TO 54 => 0,
        56 TO 64 => 0,
        72 TO 76 => 0,
        78 TO 96 => 0,
        99 => 0,
        102 => 0,
        104 TO 108 => 0,
        110 TO 114 => 0,
        67 => 0,
        100 => 1,
        68 => 2,
        101 => 3,
        69 => 4,
        70 => 5,
        103 => 6,
        71 => 7,
        97 => 8,
        65 => 9,
        98 => 10,
        66 => 11,
        31 => 12,
        77 => 13,
        109 => 14,
        115 => 15,
        55 => 16
    );

    TYPE map2 IS ARRAY (INTEGER RANGE <>) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    CONSTANT itob : map2 := (
        0 => "01000011",
        1 => "01100100",
        2 => "01000100",
        3 => "01100101",
        4 => "01000101",
        5 => "01000110",
        6 => "01100111",
        7 => "01000111",
        8 => "01100001",
        9 => "01000001",
        10 => "01100010",
        11 => "01000010",
        12 => "00011111",
        13 => "01001101",
        14 => "01101101",
        15 => "01110011",
        16 => "00110111"
    );
BEGIN
    PROCESS (clk)
    BEGIN
        IF falling_edge(clk) THEN
            IF buff = 0 THEN
                IF (btoi(to_integer(signed(a))) = 12) THEN
                    q((t - 1)MOD 6) <= (q((t - 1)MOD 6) + 1)MOD 12;
                ELSE
                    q(t) <= btoi(to_integer(signed(a)));
                    t <= (t + 1) MOD 6;
                END IF;
            END IF;
            IF (t - h) MOD 6 > 4 THEN
                IF q(h) = 17 AND buff = 0 THEN
                    data_valid <= '0';
                ELSE
                    IF (q((h + 1) MOD 6) = (q(h) + 4)MOD 12 AND q((h + 2)MOD 6) = (q((h + 1)MOD 6) + 3)MOD 12 AND q((h + 3)MOD 6) = (q((h + 2)MOD 6) + 3)MOD 12) THEN
                        IF buff = 0 THEN
                            z <= itob(q(h));
                            h <= (h + 4) MOD 6;
                            temp <= 16;
                            data_valid <= '1';
                            buff <= 1;
                        END IF;
                    ELSIF (q((h + 1) MOD 6) = (q(h) + 4)MOD 12 AND q((h + 2)MOD 6) = (q((h + 1)MOD 6) + 3)MOD 12) THEN
                        IF buff = 0 THEN
                            z <= itob(q(h));
                            h <= (h + 3) MOD 6;
                            temp <= 13;
                            data_valid <= '1';
                            buff <= 1;
                        END IF;
                    ELSIF (q((h + 1) MOD 6) = (q(h) + 3)MOD 12 AND q((h + 2)MOD 6) = (q((h + 1)MOD 6) + 4)MOD 12) THEN
                        IF buff = 0 THEN
                            z <= itob(q(h));
                            h <= (h + 3) MOD 6;
                            temp <= 14;
                            data_valid <= '1';
                            buff <= 1;
                        END IF;
                    ELSIF (q((h + 1) MOD 6) = (q(h) + 5)MOD 12 AND q((h + 2)MOD 6) = (q((h + 1)MOD 6) + 2)MOD 12) THEN
                        IF buff = 0 THEN
                            z <= itob(q(h));
                            h <= (h + 3) MOD 6;
                            temp <= 15;
                            data_valid <= '1';
                            buff <= 1;
                        END IF;
                    ELSE
                        z <= itob(q(h));
                        h <= (h + 1) MOD 6;
                        data_valid <= '1';
                        buff <= 2;
                    END IF;
                END IF;
            END IF;
            IF buff = 1 THEN
                z <= itob(temp);
                data_valid <= '1';
                buff <= 2;
            END IF;
        END IF;
        IF rising_edge(clk) THEN
            IF buff = 2 THEN
                data_valid <= '0';
                buff <= 0;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;