----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:17 12/17/2014 
-- Design Name: 
-- Module Name:    ConditionalSumAdder - Behavioral 
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

entity ConditionalSumAdder is
    Port ( a : in  STD_LOGIC_VECTOR (14 downto 0);
           b : in  STD_LOGIC_VECTOR (14 downto 0);
           s : out  STD_LOGIC_VECTOR (14 downto 0));
end ConditionalSumAdder;

architecture Behavioral of ConditionalSumAdder is

component HalfAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end component;

component ResultGenerator is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (1 downto 0);
           c : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component Selector10 is
    Port ( cs : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

component Selector11 is
    Port ( cs : in  STD_LOGIC_VECTOR (1 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so : out  STD_LOGIC_VECTOR (1 downto 0);
           co : out  STD_LOGIC_VECTOR (1 downto 0));
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

component Selector21 is
    Port ( cs : in  STD_LOGIC_VECTOR (1 downto 0);
           s0 : in  STD_LOGIC_VECTOR (1 downto 0);
           s1 : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so0 : out  STD_LOGIC_VECTOR (1 downto 0);
           so1 : out  STD_LOGIC_VECTOR (1 downto 0);
           co : out  STD_LOGIC_VECTOR (1 downto 0));
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

component Selector31 is
    Port ( cs : in  STD_LOGIC_VECTOR (1 downto 0);
           s0 : in  STD_LOGIC_VECTOR (1 downto 0);
           s1 : in  STD_LOGIC_VECTOR (1 downto 0);
           s2 : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           so0 : out  STD_LOGIC_VECTOR (1 downto 0);
           so1 : out  STD_LOGIC_VECTOR (1 downto 0);
           so2 : out  STD_LOGIC_VECTOR (1 downto 0);
           co : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component Selector40 is
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
end component;

signal iw1 : std_logic_vector (3 downto 0);
type w2 is array(51 downto 0) of std_logic_vector(1 downto 0);
signal iw2 : w2;

begin

--Level 0
u0 : HalfAdder port map (a=>a(0),b=>b(0),s=>s(0),c=>iw1(0));
u1 : ResultGenerator port map (a=>a(1),b=>b(1),s=>iw2(0),c=>iw2(1));
u2 : ResultGenerator port map (a=>a(2),b=>b(2),s=>iw2(2),c=>iw2(3));
u3 : ResultGenerator port map (a=>a(3),b=>b(3),s=>iw2(4),c=>iw2(5));
u4 : ResultGenerator port map (a=>a(4),b=>b(4),s=>iw2(6),c=>iw2(7));
u5 : ResultGenerator port map (a=>a(5),b=>b(5),s=>iw2(8),c=>iw2(9));
u6 : ResultGenerator port map (a=>a(6),b=>b(6),s=>iw2(10),c=>iw2(11));
u7 : ResultGenerator port map (a=>a(7),b=>b(7),s=>iw2(12),c=>iw2(13));
u8 : ResultGenerator port map (a=>a(8),b=>b(8),s=>iw2(14),c=>iw2(15));
u9 : ResultGenerator port map (a=>a(9),b=>b(9),s=>iw2(16),c=>iw2(17));
u10 : ResultGenerator port map (a=>a(10),b=>b(10),s=>iw2(18),c=>iw2(19));
u11 : ResultGenerator port map (a=>a(11),b=>b(11),s=>iw2(20),c=>iw2(21));
u12 : ResultGenerator port map (a=>a(12),b=>b(12),s=>iw2(22),c=>iw2(23));
u13 : ResultGenerator port map (a=>a(13),b=>b(13),s=>iw2(24),c=>iw2(25));
u14 : ResultGenerator port map (a=>a(14),b=>b(14),s=>iw2(26),c=>iw2(27));

--Level 1
u15 : Selector10 port map (cs=>iw1(0),s=>iw2(0),c=>iw2(1),so=>s(1),co=>iw1(1));
u16 : Selector11 port map (cs=>iw2(3),s=>iw2(4),c=>iw2(5),so=>iw2(28),co=>iw2(29));
u17 : Selector11 port map (cs=>iw2(7),s=>iw2(8),c=>iw2(9),so=>iw2(30),co=>iw2(31));
u18 : Selector11 port map (cs=>iw2(11),s=>iw2(12),c=>iw2(13),so=>iw2(32),co=>iw2(33));
u19 : Selector11 port map (cs=>iw2(15),s=>iw2(16),c=>iw2(17),so=>iw2(34),co=>iw2(35));
u20 : Selector11 port map (cs=>iw2(19),s=>iw2(20),c=>iw2(21),so=>iw2(36),co=>iw2(37));
u21 : Selector11 port map (cs=>iw2(23),s=>iw2(24),c=>iw2(25),so=>iw2(38),co=>iw2(39));


--Level 2
u22 : Selector20 port map (cs=>iw1(1),s0=>iw2(2),s1=>iw2(28),c=>iw2(29),so0=>s(2),so1=>s(3),co=>iw1(2));
u23 : Selector21 port map (cs=>iw2(31),s0=>iw2(10),s1=>iw2(32),c=>iw2(33),so0=>iw2(40),so1=>iw2(41),co=>iw2(42));
u24 : Selector21 port map (cs=>iw2(35),s0=>iw2(18),s1=>iw2(36),c=>iw2(37),so0=>iw2(43),so1=>iw2(44),co=>iw2(45));
u25 : Selector11 port map (cs=>iw2(39),s=>iw2(26),c=>iw2(27),so=>iw2(46),co=>iw2(47));


--Level 3
u26 : Selector30 port map (cs=>iw1(2),s0=>iw2(6),s1=>iw2(30),s2=>iw2(40),s3=>iw2(41),c=>iw2(42),so0=>s(4),so1=>s(5),so2=>s(6),so3=>s(7),co=>iw1(3));
u27 : Selector31 port map (cs=>iw2(45),s0=>iw2(22),s1=>iw2(38),s2=>iw2(46),c=>iw2(47),so0=>iw2(48),so1=>iw2(49),so2=>iw2(50),co=>iw2(51));


--Level 4
u28 : Selector40 port map (cs=>iw1(3),s0=>iw2(14),s1=>iw2(34),s2=>iw2(43),s3=>iw2(44),s4=>iw2(48),s5=>iw2(49),s6=>iw2(50),c=>iw2(51),so0=>s(8),so1=>s(9),so2=>s(10),so3=>s(11),so4=>s(12),so5=>s(13),so6=>s(14),co=>open);
 
end Behavioral;

