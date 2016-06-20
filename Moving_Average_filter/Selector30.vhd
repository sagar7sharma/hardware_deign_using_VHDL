----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:34 12/17/2014 
-- Design Name: 
-- Module Name:    Selector30 - Behavioral 
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

entity Selector30 is
    Port ( cs : in  STD_LOGIC;
           s0 : in  STD_LOGIC_VECTOR (1 downto 0);
           s1 : in  STD_LOGIC_VECTOR (1 downto 0);
           s2 : in  STD_LOGIC_VECTOR (1 downto 0);
           s3 : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so0 : out  STD_LOGIC;
           so1 : out  STD_LOGIC;
           so2 : out  STD_LOGIC;
           so3 : out  STD_LOGIC;
           co : out  STD_LOGIC);
end Selector30;

architecture Behavioral of Selector30 is

component Mux2X1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           o : out  STD_LOGIC);
end component;

component Selector20 is
    Port ( cs : in  STD_LOGIC;
           s0 : in  STD_LOGIC_VECTOR (1 downto 0);
           s1 : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so0 : out  STD_LOGIC;
           so1 : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

begin

u0 : Selector20 port map (cs=>cs,s0=>s0,s1=>s1,c=>c,so0=>so0,so1=>so1,co=>co);
u1 : Mux2X1 port map (a=>s2(0),b=>s2(1),s=>cs,o=>so2);
u2 : Mux2X1 port map (a=>s3(0),b=>s3(1),s=>cs,o=>so3);

end Behavioral;

