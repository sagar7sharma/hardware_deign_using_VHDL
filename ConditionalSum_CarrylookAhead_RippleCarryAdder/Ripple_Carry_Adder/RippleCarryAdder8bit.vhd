----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:14 11/05/2014 
-- Design Name: 
-- Module Name:    RippleCarryAdder8bit - Behavioral 
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

entity RippleCarryAdder8bit is
Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
b : in STD_LOGIC_VECTOR (7 downto 0);
c : in STD_LOGIC;
s : out STD_LOGIC_VECTOR (7 downto 0);
co : out STD_LOGIC);

end RippleCarryAdder8bit;

architecture Behavioral of RippleCarryAdder8bit is
component fulladder is
Port ( a : in STD_LOGIC;
b : in STD_LOGIC;
c : in STD_LOGIC;
s : out STD_LOGIC;
co : out STD_LOGIC);
end component;
signal ci : STD_LOGIC_VECTOR (6 downto 0);

begin
u1 : fulladder port map (a=>a(0),b=>b(0),c=>c,s=>s(0),co=>ci(0));
u2 : fulladder port map (a=>a(1),b=>b(1),c=>ci(0),s=>s(1),co=>ci(1));
u3 : fulladder port map (a=>a(2),b=>b(2),c=>ci(1),s=>s(2),co=>ci(2));
u4 : fulladder port map (a=>a(3),b=>b(3),c=>ci(2),s=>s(3),co=>ci(3));
u5 : fulladder port map (a=>a(4),b=>b(4),c=>ci(3),s=>s(4),co=>ci(4));
u6 : fulladder port map (a=>a(5),b=>b(5),c=>ci(4),s=>s(5),co=>ci(5));
u7 : fulladder port map (a=>a(6),b=>b(6),c=>ci(5),s=>s(6),co=>ci(6));
u8 : fulladder port map (a=>a(7),b=>b(7),c=>ci(6),s=>s(7),co=>co);

end Behavioral;

