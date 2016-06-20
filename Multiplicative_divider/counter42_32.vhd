----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:52:53 01/20/2015 
-- Design Name: 
-- Module Name:    counter42_32 - Behavioral 
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

entity counter42_32 is
port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
       b : in  STD_LOGIC_VECTOR (31 downto 0);
       c : in  STD_LOGIC_VECTOR (31 downto 0);
       d : in  STD_LOGIC_VECTOR (31 downto 0);
       s : out  STD_LOGIC_VECTOR (31 downto 0);
       co : out  STD_LOGIC_VECTOR (31 downto 0));
end counter42_32;

architecture Behavioral of counter42_32 is
signal si : STD_LOGIC_VECTOR (31 downto 0);
signal ti : STD_LOGIC_VECTOR (32 downto 0);
begin
	 ti(0) <= '0';
    counter_loop: for j in 0 to 31 generate
        si(j) <=  c(j) xor b(j) xor a(j);
        ti(j+1) <= (c(j) and b(j)) or ((b(j) xor c(j)) and a(j));

        s(j) <= si(j) xor d(j) xor ti(j);
        co(j) <= (si(j) and d(j)) or ((si(j) xor d(j)) and ti(j));
    end generate;

end Behavioral;

