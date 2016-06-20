----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:51:54 11/18/2014 
-- Design Name: 
-- Module Name:    Carry_Look_Ahead - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Carry_Look_Ahead is
	port(
         x_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         y_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_in  :  IN   STD_LOGIC;
         sum       :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out :  OUT  STD_LOGIC
        );
end Carry_Look_Ahead;

architecture Behavioral of Carry_Look_Ahead is


signal    h_sum              :    STD_LOGIC_VECTOR(7 DOWNTO 0);
signal    carry_generate     :    STD_LOGIC_VECTOR(7 DOWNTO 0);
signal    carry_propagate    :    STD_LOGIC_VECTOR(7 DOWNTO 0);
signal    carry_in_internal  :    STD_LOGIC_VECTOR(7 DOWNTO 1);

begin
    h_sum <= x_in XOR y_in;
    carry_generate <= x_in AND y_in;
    carry_propagate <= x_in OR y_in;
    PROCESS (carry_generate,carry_propagate,carry_in_internal)
    begin
    carry_in_internal(1) <= carry_generate(0) OR (carry_propagate(0) AND carry_in);
        inst: FOR i IN 1 TO 6 LOOP
              carry_in_internal(i+1) <= carry_generate(i) OR (carry_propagate(i) AND carry_in_internal(i));
              END LOOP;
    carry_out <= carry_generate(7) OR (carry_propagate(7) AND carry_in_internal(7));
    end PROCESS;

    sum(0) <= h_sum(0) XOR carry_in;
    sum(7 DOWNTO 1) <= h_sum(7 DOWNTO 1) XOR carry_in_internal(7 DOWNTO 1);


end Behavioral;

