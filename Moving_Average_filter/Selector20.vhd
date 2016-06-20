----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:51:59 12/17/2014 
-- Design Name: 
-- Module Name:    Selector20 - Behavioral 
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

entity Selector20 is
    Port ( cs : in  STD_LOGIC;
           s0 : in  STD_LOGIC_VECTOR (1 downto 0);
           s1 : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so0 : out  STD_LOGIC;
           so1 : out  STD_LOGIC;
           co : out  STD_LOGIC);
end Selector20;

architecture Behavioral of Selector20 is

component Mux2X1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           o : out  STD_LOGIC);
end component;

component Selector10 is
    Port ( cs : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

begin

u0 : Selector10 port map (cs=>cs,s=>s0,c=>c,so=>so0,co=>co);
u1 : Mux2X1 port map (a=>s1(0),b=>s1(1),s=>cs,o=>so1);

end Behavioral;
