----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:47 12/17/2014 
-- Design Name: 
-- Module Name:    Divider16 - Behavioral 
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

entity Divider16 is
    Port ( div : in  STD_LOGIC_VECTOR (14 downto 0);
           quo : out  STD_LOGIC_VECTOR (10 downto 0));
end Divider16;

architecture Behavioral of Divider16 is

begin

quo<=div(14)&div(13)&div(12)&div(11)&div(10)&div(9)&div(8)&div(7)&div(6)&div(5)&div(4);

end Behavioral;

