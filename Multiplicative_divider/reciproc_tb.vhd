--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:06:36 01/21/2015
-- Design Name:   
-- Module Name:   /afs/tu-berlin.de/home/s/sonali.deo/projects/ZedBoard/pcores/mycore_v1_00_a/devl/goldschmidt_division/reciproc_tb.vhd
-- Project Name:  goldschmidt_division
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reciprocal
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
 
ENTITY reciproc_tb IS
END reciproc_tb;
 
ARCHITECTURE behavior OF reciproc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reciprocal
    PORT(
         b : IN  std_logic_vector(15 downto 0);
         r : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal b : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal r : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reciprocal PORT MAP (
          b => b,
          r => r
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		b <= "0000000111111101";
      wait for 100 ns;
		b <= "0001111000011110";
      -- insert stimulus here 

      wait;
   end process;

END;
