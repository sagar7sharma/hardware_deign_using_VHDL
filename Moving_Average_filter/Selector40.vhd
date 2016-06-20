----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:03 12/17/2014 
-- Design Name: 
-- Module Name:    Selector40 - Behavioral 
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

entity Selector40 is
    Port ( cs : in  STD_LOGIC;
           s0 : in  STD_LOGIC_VECTOR (1 downto 0);
           s1 : in  STD_LOGIC_VECTOR (1 downto 0);
           s2 : in  STD_LOGIC_VECTOR (1 downto 0);
           s3 : in  STD_LOGIC_VECTOR (1 downto 0);
           s4 : in  STD_LOGIC_VECTOR (1 downto 0);
           s5 : in  STD_LOGIC_VECTOR (1 downto 0);
           s6 : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so0 : out  STD_LOGIC;
           so1 : out  STD_LOGIC;
           so2 : out  STD_LOGIC;
           so3 : out  STD_LOGIC;
           so4 : out  STD_LOGIC;
           so5 : out  STD_LOGIC;
           so6 : out  STD_LOGIC;
           co : out  STD_LOGIC);
end Selector40;

architecture Behavioral of Selector40 is

component Mux2X1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           o : out  STD_LOGIC);
end component;

component Selector30 is
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
end component;

begin

u0 : Selector30 port map (cs=>cs,s0=>s0,s1=>s1,s2=>s2,s3=>s3,c=>c,so0=>so0,so1=>so1,so2=>so2,so3=>so3,co=>co);
u1 : Mux2X1 port map (a=>s4(0),b=>s4(1),s=>cs,o=>so4);
u2 : Mux2X1 port map (a=>s5(0),b=>s5(1),s=>cs,o=>so5);
u3 : Mux2X1 port map (a=>s6(0),b=>s6(1),s=>cs,o=>so6);

end Behavioral;


