library ieee;

-- Commonly imported packages:

-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
use ieee.std_logic_1164.all;

-- SIGNED and UNSIGNED types, and relevant functions
use ieee.numeric_std.all;

-- Basic sequential functions and concurrent procedures
use ieee.VITAL_Primitives.all;

use work.DE2_CONSTANTS.all;

entity my_sev_seg is

	port
	(
		-- clock interface
		clk		:	in std_logic;
		
		-- reset interface
		reset_n		:	in std_logic;
		
		-- conduit interface for one seven segment device
		-- adding the other 7 is left as an optional exercise
		-- for the students
		coe_hex1			:	out std_logic_vector (6 downto 0)
		

	);
end my_sev_seg;


architecture avalon of my_sev_seg is

-- My component needs to write a single value to the seven segment display
-- use gfedcba - active low for our seven segment displays
-- see en.wikipedia.org/wiki/Seven-segment_display
-- and the schematics for the DE2 board

-- Procedure convert_hex_to_sev_seg
-- Inputs: nibble std_logic_vector (3 downto 0)
--					single nibble to be converted
-- Outputs: signal sev_seg 	: out std_logic_vector ( 6 downto 0)
--					signal(s) of 7 bit wide pattern that corresponds 
--					to our seven segment displays. Our displays use the gfedcba pattern
--					and they are connected active low. All hex values can be displayed
--					see the constants in the DE2_CONSTANTS package


signal hex	: std_logic_vector ( 6 downto 0);

begin

	coe_hex1 <= sev_seg_8;


end avalon;




