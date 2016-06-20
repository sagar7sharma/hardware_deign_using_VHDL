--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:03:59 12/17/2014
-- Design Name:   
-- Module Name:   /afs/tu-berlin.de/home/s/sagar.sharma/irb-ubuntu/movaverfilter/CarrySaveAdderModuleTB.vhd
-- Project Name:  movaverfilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: carrysavemodule
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
 
ENTITY CarrySaveAdderModuleTB IS
END CarrySaveAdderModuleTB;
 
ARCHITECTURE behavior OF CarrySaveAdderModuleTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carrysavemodule
    PORT(
         a : IN  std_logic_vector(14 downto 0);
         b : IN  std_logic_vector(14 downto 0);
         c : IN  std_logic_vector(14 downto 0);
         d : IN  std_logic_vector(14 downto 0);
         s : OUT  std_logic_vector(14 downto 0);
         co : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(14 downto 0) := (others => '0');
   signal b : std_logic_vector(14 downto 0) := (others => '0');
   signal c : std_logic_vector(14 downto 0) := (others => '0');
   signal d : std_logic_vector(14 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(14 downto 0);
   signal co : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carrysavemodule PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          s => s,
          co => co
        );

      -- Stimulus process
   stim_proc: process
   begin		
			a <= "001111111111110";
			b <= "100010001000000";
			c <= "000110011100000";
			d <= "101011110100000";
		
			
		wait for 1000 ns;
			i0 <= "010101110100000";
			i1 <= "010101101010000";
			i2 <= "100111010100000";
			i3 <= "101011010100000";
      wait;
   end process;

END;