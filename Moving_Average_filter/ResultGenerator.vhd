----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:54 12/17/2014 
-- Design Name: 
-- Module Name:    ResultGenerator - Behavioral 
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

entity ResultGenerator is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (1 downto 0);
           c : out  STD_LOGIC_VECTOR (1 downto 0));
end ResultGenerator;

architecture Behavioral of ResultGenerator is

begin
s(0) <= a xor b;
c(0) <= a and b;
s(1) <= a xnor b;
c(1) <= a or b;

end Behavioral;

