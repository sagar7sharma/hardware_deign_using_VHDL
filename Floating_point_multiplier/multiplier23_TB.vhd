--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:16:52 02/11/2015
-- Design Name:   
-- Module Name:   /afs/tu-berlin.de/home/s/sonali.deo/projects/ZedBoard/pcores/mycore_v1_00_a/devl/Floating_mult/multiplier23_TB.vhd
-- Project Name:  Floating_mult
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplier23f
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
 
ENTITY multiplier23_TB IS
END multiplier23_TB;
 
ARCHITECTURE behavior OF multiplier23_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplier23f
    PORT(
         x : IN  std_logic_vector(22 downto 0);
         y : IN  std_logic_vector(22 downto 0);
         z : OUT  std_logic_vector(22 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(22 downto 0) := (others => '0');
   signal y : std_logic_vector(22 downto 0) := (others => '0');

 	--Outputs
   signal z : std_logic_vector(22 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplier23f PORT MAP (
          x => x,
          y => y,
          z => z
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		x <= "01000010001001000000000";	--41
		y <= "00110111011000000000000";	--0.875x2^-16
      wait for 100 ns;
		x <= "11000000000100000000000";	-- -4.5x2^-1
		y <= "01000011100000000000000";	-- 0.0625x2^12
      -- insert stimulus here 

      wait;
   end process;

END;
