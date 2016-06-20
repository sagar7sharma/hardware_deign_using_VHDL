----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:22 12/17/2014 
-- Design Name: 
-- Module Name:    Register11bit - Behavioral 
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

entity Register11bit is
    Port ( d : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (10 downto 0));
end Register11bit;

architecture Behavioral of Register11bit is

begin
	ureg : process(rst, clk)
		begin
			if rst = '1' then
				q <= (others=>'0');
			else
				if clk'event and clk='1' then
					q <= d;
				end if;
			end if;
end process;
end Behavioral;
