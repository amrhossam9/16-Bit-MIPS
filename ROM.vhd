
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ROM IS
	GENERIC(
		address_bits     : INTEGER := 4;
		words            : INTEGER := 16;
		instruction_bits : INTEGER := 16
	);
	PORT(
		address  : IN STD_LOGIC_VECTOR(address_bits - 1 DOWNTO 0);
		inst_out : OUT STD_LOGIC_VECTOR(instruction_bits - 1 DOWNTO 0)
	);
END ROM;

ARCHITECTURE Behavioral OF ROM IS 
TYPE memory IS ARRAY(0 TO words - 1) OF STD_LOGIC_VECTOR(instruction_bits - 1 DOWNTO 0);
CONSTANT rom1 : memory :=(
	"0111000000000000",	
	"0111001000000001",
	"0111010000001010",
	"0001000001000000",
	"1010010000000110",
	"1111000000000011",
	"1111000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000"
);
BEGIN   
	inst_out <= rom1(TO_INTEGER(UNSIGNED(address)));
END Behavioral;