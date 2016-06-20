----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:31 12/17/2014 
-- Design Name: 
-- Module Name:    MovingAverageFilter - Behavioral 
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

entity MovingAverageFilter is
    Port ( ip : in  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           op : out  STD_LOGIC_VECTOR (10 downto 0));
end MovingAverageFilter;

architecture Behavioral of MovingAverageFilter is

component RegisterArray11bit is
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
end component;

component carrysave is
    Port ( i0 : in  STD_LOGIC_VECTOR (10 downto 0);
           i1 : in  STD_LOGIC_VECTOR (10 downto 0);
           i2 : in  STD_LOGIC_VECTOR (10 downto 0);
           i3 : in  STD_LOGIC_VECTOR (10 downto 0);
			  i4 : in  STD_LOGIC_VECTOR (10 downto 0);
           i5 : in  STD_LOGIC_VECTOR (10 downto 0);
           i6 : in  STD_LOGIC_VECTOR (10 downto 0);
           i7 : in  STD_LOGIC_VECTOR (10 downto 0);
			  i8 : in  STD_LOGIC_VECTOR (10 downto 0);
           i9 : in  STD_LOGIC_VECTOR (10 downto 0);
           i10 : in  STD_LOGIC_VECTOR (10 downto 0);
           i11 : in  STD_LOGIC_VECTOR (10 downto 0);
			  i12 : in  STD_LOGIC_VECTOR (10 downto 0);
           i13 : in  STD_LOGIC_VECTOR (10 downto 0);
           i14 : in  STD_LOGIC_VECTOR (10 downto 0);
           i15 : in  STD_LOGIC_VECTOR (10 downto 0);
           f : out  STD_LOGIC_VECTOR (14 downto 0));
end component;

component Divider16 is
    Port ( div : in  STD_LOGIC_VECTOR (14 downto 0);
           quo : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

type ibus is array(15 downto 0) of std_logic_vector(10 downto 0);
signal iw : ibus;

signal iw15  : std_logic_vector (14 downto 0);

begin

u0 : RegisterArray11bit port map (ip=>ip,clk=>clk,rst=>rst,s15=>iw(15),s14=>iw(14),s13=>iw(13),s12=>iw(12),s11=>iw(11),s10=>iw(10),s9=>iw(9),s8=>iw(8),s7=>iw(7),s6=>iw(6),s5=>iw(5),s4=>iw(4),s3=>iw(3),s2=>iw(2),s1=>iw(1),s0=>iw(0));
u1 : carrysave port map (i0=>iw(0),i1=>iw(1),i2=>iw(2),i3=>iw(3),i4=>iw(4),i5=>iw(5),i6=>iw(6),i7=>iw(7),i8=>iw(8),i9=>iw(9),i10=>iw(10),i11=>iw(11),i12=>iw(12),i13=>iw(13),i14=>iw(14),i15=>iw(15),f=>iw15);
u3 : Divider16 port map (div=>iw15,quo=>op);

end Behavioral;


