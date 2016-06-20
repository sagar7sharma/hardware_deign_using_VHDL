----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:59 12/17/2014 
-- Design Name: 
-- Module Name:    RegisterArray11bit - Behavioral 
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

entity RegisterArray11bit is
    Port ( ip : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           s15 : out  STD_LOGIC_VECTOR (10 downto 0);
           s14 : out  STD_LOGIC_VECTOR (10 downto 0);
           s13 : out  STD_LOGIC_VECTOR (10 downto 0);
           s12 : out  STD_LOGIC_VECTOR (10 downto 0);
           s11 : out  STD_LOGIC_VECTOR (10 downto 0);
           s10 : out  STD_LOGIC_VECTOR (10 downto 0);
           s9 : out  STD_LOGIC_VECTOR (10 downto 0);
           s8 : out  STD_LOGIC_VECTOR (10 downto 0);
           s7 : out  STD_LOGIC_VECTOR (10 downto 0);
           s6 : out  STD_LOGIC_VECTOR (10 downto 0);
           s5 : out  STD_LOGIC_VECTOR (10 downto 0);
           s4 : out  STD_LOGIC_VECTOR (10 downto 0);
           s3 : out  STD_LOGIC_VECTOR (10 downto 0);
           s2 : out  STD_LOGIC_VECTOR (10 downto 0);
           s1 : out  STD_LOGIC_VECTOR (10 downto 0);
           s0 : out  STD_LOGIC_VECTOR (10 downto 0));
end RegisterArray11bit;

architecture Behavioral of RegisterArray11bit is

component Register11bit is
    Port ( d : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

type ibus is array(14 downto 0) of std_logic_vector(10 downto 0);
signal iw : ibus;

begin

u0 : Register11bit port map (d=>ip,clk=>clk,rst=>rst,q=>iw(14));
u1 : Register11bit port map (d=>iw(14),clk=>clk,rst=>rst,q=>iw(13));
u2 : Register11bit port map (d=>iw(13),clk=>clk,rst=>rst,q=>iw(12));
u3 : Register11bit port map (d=>iw(12),clk=>clk,rst=>rst,q=>iw(11));
u4 : Register11bit port map (d=>iw(11),clk=>clk,rst=>rst,q=>iw(10));
u5 : Register11bit port map (d=>iw(10),clk=>clk,rst=>rst,q=>iw(9));
u6 : Register11bit port map (d=>iw(9),clk=>clk,rst=>rst,q=>iw(8));
u7 : Register11bit port map (d=>iw(8),clk=>clk,rst=>rst,q=>iw(7));
u8 : Register11bit port map (d=>iw(7),clk=>clk,rst=>rst,q=>iw(6));
u9 : Register11bit port map (d=>iw(6),clk=>clk,rst=>rst,q=>iw(5));
u10 : Register11bit port map (d=>iw(5),clk=>clk,rst=>rst,q=>iw(4));
u11 : Register11bit port map (d=>iw(4),clk=>clk,rst=>rst,q=>iw(3));
u12 : Register11bit port map (d=>iw(3),clk=>clk,rst=>rst,q=>iw(2));
u13 : Register11bit port map (d=>iw(2),clk=>clk,rst=>rst,q=>iw(1));
u14 : Register11bit port map (d=>iw(1),clk=>clk,rst=>rst,q=>iw(0));
u15 : Register11bit port map (d=>iw(0),clk=>clk,rst=>rst,q=>s0);

s15<=iw(14);
s14<=iw(13);
s13<=iw(12);
s12<=iw(11);
s11<=iw(10);
s10<=iw(9);
s9<=iw(8);
s8<=iw(7);
s7<=iw(6);
s6<=iw(5);
s5<=iw(4);
s4<=iw(3);
s3<=iw(2);
s2<=iw(1);
s1<=iw(0);

end Behavioral;

