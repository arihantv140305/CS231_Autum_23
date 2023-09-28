LIBRARY ieee, std;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_textio.ALL;
USE std.textio.ALL;

ENTITY ASCII_Read_test_2 IS
END ENTITY;

ARCHITECTURE reader OF ASCII_Read_test_2 IS
	COMPONENT CHORD_Encoder
		PORT (
			clk, rst : IN STD_LOGIC;
			a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			data_valid : OUT STD_LOGIC;
			z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	SIGNAL input_sig, output_sig : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL clk, rst, data_valid : STD_LOGIC;
BEGIN
	dut_instance : CHORD_Encoder
	PORT MAP(a => input_sig, clk => clk, z => output_sig, data_valid => data_valid, rst => rst);

	PROCESS
		FILE input_file : text OPEN read_mode IS "test.txt";
		FILE output_file : text OPEN write_mode IS "out.txt";
		VARIABLE input_line, output_line : line;
		VARIABLE input_var, output_var : STD_LOGIC_VECTOR (7 DOWNTO 0);
	BEGIN
		WHILE NOT endfile(input_file) LOOP
			clk <= '1';
			WAIT FOR 1 ns;
			IF data_valid /= '1' THEN
				readline (input_file, input_line);
				read (input_line, input_var);
				input_sig <= input_var;
			END IF;
			clk <= '0';
			WAIT FOR 1 ns;
			IF data_valid = '1' THEN
				output_var := output_sig;
				write (output_line, output_var);
				writeline (output_file, output_line);
			END IF;
		END LOOP;
		input_sig <= "00000000";
		FOR k IN 0 TO 12 LOOP
			clk <= '1';
			WAIT FOR 1 ns;
			clk <= '0';
			WAIT FOR 1 ns;
			IF data_valid = '1' THEN
				output_var := output_sig;
				write (output_line, output_var);
				writeline (output_file, output_line);
			END IF;
		END LOOP;
		WAIT;
	END PROCESS;

END ARCHITECTURE;