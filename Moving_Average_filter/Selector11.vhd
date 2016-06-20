----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:57 12/17/2014 
-- Design Name: 
-- Module Name:    Selector11 - Behavioral 
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

entity Selector11 is
    Port ( cs : in  STD_LOGIC_VECTOR (1 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so : out  STD_LOGIC_VECTOR (1 downto 0);
           co : out  STD_LOGIC_VECTOR (1 downto 0));
end Selector11;

architecture Behavioral of Selector11 is

component Mux2X1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           o : out  STD_LOGIC);
end component;

begin

u0 : Mux2X1 port map (a=>s(0),b=>s(1),s=>cs(0),o=>so(0));
u1 : Mux2X1 port map (a=>s(0),b=>s(1),s=>cs(1),o=>so(1));
u2 : Mux2X1 port map (a=>c(0),b=>c(1),s=>cs(0),o=>co(0));
u3 : Mux2X1 port map (a=>c(0),b=>c(1),s=>cs(1),o=>co(1));


end Behavioral;


