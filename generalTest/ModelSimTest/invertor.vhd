
library ieee;

-- Commonly imported packages:

-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
use ieee.std_logic_1164.all;

-- SIGNED and UNSIGNED types, and relevant functions
use ieee.numeric_std.all;

-- Basic sequential functions and concurrent procedures
use ieee.VITAL_Primitives.all;

use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity Invertor is

	port
	(
		-- clock interface
		clk		:	in std_logic;
		
		testInput :	 in std_logic;
		
		testOutput:	out std_logic
	);
end Invertor;


architecture InvertorArchitecture of Invertor is
  
  begin
  testOutput <= not testInput;
    
  shift: process(clk) is
  begin
  end process shift;
	
end InvertorArchitecture;





