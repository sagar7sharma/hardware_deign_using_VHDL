--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:01:51 12/17/2014
-- Design Name:   
-- Module Name:   /afs/tu-berlin.de/home/s/sagar.sharma/irb-ubuntu/movaverfilter/CarrySaveAdderTB.vhd
-- Project Name:  movaverfilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: carrysave
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CarrySaveAdderTB IS
END CarrySaveAdderTB;
 
ARCHITECTURE behavior OF CarrySaveAdderTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carrysave
    PORT(
         i0 : IN  std_logic_vector(10 downto 0);
         i1 : IN  std_logic_vector(10 downto 0);
         i2 : IN  std_logic_vector(10 downto 0);
         i3 : IN  std_logic_vector(10 downto 0);
         i4 : IN  std_logic_vector(10 downto 0);
         i5 : IN  std_logic_vector(10 downto 0);
         i6 : IN  std_logic_vector(10 downto 0);
         i7 : IN  std_logic_vector(10 downto 0);
         i8 : IN  std_logic_vector(10 downto 0);
         i9 : IN  std_logic_vector(10 downto 0);
         i10 : IN  std_logic_vector(10 downto 0);
         i11 : IN  std_logic_vector(10 downto 0);
         i12 : IN  std_logic_vector(10 downto 0);
         i13 : IN  std_logic_vector(10 downto 0);
         i14 : IN  std_logic_vector(10 downto 0);
         i15 : IN  std_logic_vector(10 downto 0);
         f : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i0 : std_logic_vector(10 downto 0) := (others => '0');
   signal i1 : std_logic_vector(10 downto 0) := (others => '0');
   signal i2 : std_logic_vector(10 downto 0) := (others => '0');
   signal i3 : std_logic_vector(10 downto 0) := (others => '0');
   signal i4 : std_logic_vector(10 downto 0) := (others => '0');
   signal i5 : std_logic_vector(10 downto 0) := (others => '0');
   signal i6 : std_logic_vector(10 downto 0) := (others => '0');
   signal i7 : std_logic_vector(10 downto 0) := (others => '0');
   signal i8 : std_logic_vector(10 downto 0) := (others => '0');
   signal i9 : std_logic_vector(10 downto 0) := (others => '0');
   signal i10 : std_logic_vector(10 downto 0) := (others => '0');
   signal i11 : std_logic_vector(10 downto 0) := (others => '0');
   signal i12 : std_logic_vector(10 downto 0) := (others => '0');
   signal i13 : std_logic_vector(10 downto 0) := (others => '0');
   signal i14 : std_logic_vector(10 downto 0) := (others => '0');
   signal i15 : std_logic_vector(10 downto 0) := (others => '0');

 	--Outputs
   signal f : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
---   constant <clock>_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carrysave PORT MAP (
          i0 => i0,
          i1 => i1,
          i2 => i2,
          i3 => i3,
          i4 => i4,
          i5 => i5,
          i6 => i6,
          i7 => i7,
          i8 => i8,
          i9 => i9,
          i10 => i10,
          i11 => i11,
          i12 => i12,
          i13 => i13,
          i14 => i14,
          i15 => i15,
          f => f
        );

stim_proc: process
 begin		
			i0 <= "11000000000";
			i1 <= "10000100111";
			i2 <= "01110111110";
			i3 <= "00100001001";
			i4 <= "01111111111";
			i5 <= "00001101110";
			i6 <= "10110111000";
			i7 <= "11110000011";
			i8 <= "00010011110";
			i9 <= "01111010010";
			i10 <= "11011110011";
			i11 <= "00101101101";
			i12 <= "01100011011";
			i13 <= "00011111110";
			i14 <= "10010001000";
			i15 <= "11000110110";
			
			
		wait for 1000 ns;
			i0 <= "01111011001";
			i1 <= "10000000000";
			i2 <= "01111000101";
			i3 <= "01101001111";
			i4 <= "11101100010";
			i5 <= "10000010111";
			i6 <= "10010101010";
			i7 <= "01110111101";
			i8 <= "01101101010";
			i9 <= "01101111111";
			i10 <= "00011111110";
			i11 <= "01101111000";
			i12 <= "01111011001";
			i13 <= "01101101010";
			i14 <= "10101110100";
			i15 <= "11100111000";
			
			wait;
   end process;

END;
