----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:09 01/20/2015 
-- Design Name: 
-- Module Name:    reciprocal - Behavioral 
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

entity reciprocal is
port (
        b : in  std_logic_vector (15 downto 0);
        r : out std_logic_vector (15 downto 0)
    );
end reciprocal;

architecture Behavioral of reciprocal is

begin
	r <=	"1100000000000000" when b               = "0000000000000000" else
         "0110000000000000" when b(15 downto  1) = "000000000000000" else
         "0011000000000000" when b(15 downto  2) = "00000000000000" else
         "0001100000000000" when b(15 downto  3) = "0000000000000" else
         "0000110000000000" when b(15 downto  4) = "000000000000" else
         "0000011000000000" when b(15 downto  5) = "00000000000" else
         "0000001100000000" when b(15 downto  6) = "0000000000" else
         "0000000110000000" when b(15 downto  7) = "000000000" else
         "0000000011000000" when b(15 downto  8) = "00000000" else
         "0000000001100000" when b(15 downto  9) = "0000000" else
         "0000000000110000" when b(15 downto 10) = "000000" else
         "0000000000011000" when b(15 downto 11) = "00000" else
         "0000000000001100" when b(15 downto 12) = "0000" else
         "0000000000000110" when b(15 downto 13) = "000" else
         "0000000000000011" when b(15 downto 14) = "00" else
         "0000000000000001" when b(15)           = '0' else
         "0000000000000000";

end Behavioral;

