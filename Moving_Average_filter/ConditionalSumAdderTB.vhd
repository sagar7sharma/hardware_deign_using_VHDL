--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:16 12/17/2014
-- Design Name:   
-- Module Name:   /afs/tu-berlin.de/home/s/sagar.sharma/irb-ubuntu/movaverfilter/ConditionalSumAdderTB.vhd
-- Project Name:  movaverfilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ConditionalSumAdder
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
 
ENTITY ConditionalSumAdderTB IS
END ConditionalSumAdderTB;
 
ARCHITECTURE behavior OF ConditionalSumAdderTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ConditionalSumAdder
    PORT(
         a : IN  std_logic_vector(14 downto 0);
         b : IN  std_logic_vector(14 downto 0);
         s : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(14 downto 0) := (others => '0');
   signal b : std_logic_vector(14 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
---   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ConditionalSumAdder PORT MAP (
          a => a,
          b => b,
          s => s
        );

   -- Stimulus process
   stim_proc: process
 begin		

		a <="010111010001011";
		b <="110011110010011"; 
		
		wait for 100 ns;
		a <="110000011011101";
		b <="100100100011010"; 

      wait for 100 ns;
		a(3) <='1';
		b(5)<='1';
		wait;
   end process;


END;