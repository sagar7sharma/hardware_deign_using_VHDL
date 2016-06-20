--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:58:25 11/18/2014
-- Design Name:   
-- Module Name:   /afs/tu-berlin.de/home/s/sagar.sharma/irb-ubuntu/Carry_Look_Ahead/Carry_Look_Ahead_Testbench.vhd
-- Project Name:  Carry_Look_Ahead
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Carry_Look_Ahead
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
 
ENTITY Carry_Look_Ahead_Testbench IS
END Carry_Look_Ahead_Testbench;
 
ARCHITECTURE behavior OF Carry_Look_Ahead_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Carry_Look_Ahead
    PORT(
         x_in : IN  std_logic_vector(7 downto 0);
         y_in : IN  std_logic_vector(7 downto 0);
         carry_in : IN  std_logic;
         sum : OUT  std_logic_vector(7 downto 0);
         carry_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x_in : std_logic_vector(7 downto 0) := (others => '0');
   signal y_in : std_logic_vector(7 downto 0) := (others => '0');
   signal carry_in : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(7 downto 0);
   signal carry_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Carry_Look_Ahead PORT MAP (
          x_in => x_in,
          y_in => y_in,
          carry_in => carry_in,
          sum => sum,
          carry_out => carry_out
        );

      -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		x_in <= "01010101";
	   y_in <= "10101010";
	   carry_in <= '0';


      wait for 100 ns;
		
		x_in <= "10101010";
		y_in <= "01010101";
		carry_in <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
