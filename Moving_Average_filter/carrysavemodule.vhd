----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:37 12/17/2014 
-- Design Name: 
-- Module Name:    carrysavemodule - Behavioral 
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

entity carrysavemodule is
    Port ( a : in  STD_LOGIC_VECTOR (14 downto 0);
           b : in  STD_LOGIC_VECTOR (14 downto 0);
           c : in  STD_LOGIC_VECTOR (14 downto 0);
           d : in  STD_LOGIC_VECTOR (14 downto 0);
           s : out  STD_LOGIC_VECTOR (14 downto 0);
           co : out  STD_LOGIC_VECTOR (14 downto 0));
end carrysavemodule;

architecture Behavioral of carrysavemodule is

component counter4down2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           ti : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC;
           tout : out  STD_LOGIC);
end component;

signal iw : std_logic_vector (13 downto 0);
Constant L : std_logic := '0';

begin
u0 : counter4down2 port map (a=>a(0),b=>b(0),c=>c(0),d=>d(0),ti=>L,s=>s(0),co=>co(1),tout=>iw(0));
u1 : counter4down2 port map (a=>a(1),b=>b(1),c=>c(1),d=>d(1),ti=>iw(0),s=>s(1),co=>co(2),tout=>iw(1));
u2 : counter4down2 port map (a=>a(2),b=>b(2),c=>c(2),d=>d(2),ti=>iw(1),s=>s(2),co=>co(3),tout=>iw(2));
u3 : counter4down2 port map (a=>a(3),b=>b(3),c=>c(3),d=>d(3),ti=>iw(2),s=>s(3),co=>co(4),tout=>iw(3));
u4 : counter4down2 port map (a=>a(4),b=>b(4),c=>c(4),d=>d(4),ti=>iw(3),s=>s(4),co=>co(5),tout=>iw(4));
u5 : counter4down2 port map (a=>a(5),b=>b(5),c=>c(5),d=>d(5),ti=>iw(4),s=>s(5),co=>co(6),tout=>iw(5));
u6 : counter4down2 port map (a=>a(6),b=>b(6),c=>c(6),d=>d(6),ti=>iw(5),s=>s(6),co=>co(7),tout=>iw(6));
u7 : counter4down2 port map (a=>a(7),b=>b(7),c=>c(7),d=>d(7),ti=>iw(6),s=>s(7),co=>co(8),tout=>iw(7));
u8 : counter4down2 port map (a=>a(8),b=>b(8),c=>c(8),d=>d(8),ti=>iw(7),s=>s(8),co=>co(9),tout=>iw(8));
u9 : counter4down2 port map (a=>a(9),b=>b(9),c=>c(9),d=>d(9),ti=>iw(8),s=>s(9),co=>co(10),tout=>iw(9));
u10 : counter4down2 port map (a=>a(10),b=>b(10),c=>c(10),d=>d(10),ti=>iw(9),s=>s(10),co=>co(11),tout=>iw(10));
u11 : counter4down2 port map (a=>a(11),b=>b(11),c=>c(11),d=>d(11),ti=>iw(10),s=>s(11),co=>co(12),tout=>iw(11));
u12 : counter4down2 port map (a=>a(12),b=>b(12),c=>c(12),d=>d(12),ti=>iw(11),s=>s(12),co=>co(13),tout=>iw(12));
u13 : counter4down2 port map (a=>a(13),b=>b(13),c=>c(13),d=>d(13),ti=>iw(12),s=>s(13),co=>co(14),tout=>iw(13));
u14 : counter4down2 port map (a=>a(14),b=>b(14),c=>c(14),d=>d(14),ti=>iw(13),s=>s(14),co=>open,tout=>open);

co(0)<= '0';

end Behavioral;

