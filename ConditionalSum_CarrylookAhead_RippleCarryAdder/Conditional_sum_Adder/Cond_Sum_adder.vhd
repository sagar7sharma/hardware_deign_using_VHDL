----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:13 11/18/2014 
-- Design Name: 
-- Module Name:    Cond_Sum_adder - Behavioral 
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

entity Cond_Sum_Adder is
	port (A:in STD_LOGIC_VECTOR(7 downto 0);
			B:in STD_LOGIC_VECTOR(7 downto 0);
			Cin:in STD_LOGIC;
			sum:out STD_LOGIC_VECTOR(7 downto 0);
			co:out STD_LOGIC
			);
end Cond_Sum_Adder;

architecture Behavioral of Cond_Sum_Adder is

component FA is 
port ( a : in STD_LOGIC;
b : in STD_LOGIC;
c : in STD_LOGIC;
s : out STD_LOGIC;
co : out STD_LOGIC);
end component;

component Mux4down2 is
	port ( din_0   :in  std_logic;-- Mux first input
			 din_1   :in  std_logic;-- Mux Second input
			 sel     :in  std_logic;-- Select input
			mux_out :out std_logic -- Mux output
		);
end component;




signal s,c : std_logic_vector(14 downto 0);
signal y:std_logic_vector(28 downto 1);
begin
A0  : FA port map(A(0),B(0),Cin,s(0),c(0));
A1a : FA port map(A(1),B(1),'0',s(1),c(1));
A1b : FA port map(A(1),B(1),'1',s(2),c(2));
A2a : FA port map(A(2),B(2),'0',s(3),c(3));
A2b : FA port map(A(2),B(2),'1',s(4),c(4));
A3a : FA port map(A(3),B(3),'0',s(5),c(5));
A3b : FA port map(A(3),B(3),'1',s(6),c(6));
A4a : FA port map(A(4),B(4),'0',s(7),c(7));
A4b : FA port map(A(4),B(4),'1',s(8),c(8));
A5a : FA port map(A(5),B(5),'0',s(9),c(9));
A5b : FA port map(A(5),B(5),'1',s(10),c(10));
A6a : FA port map(A(6),B(6),'0',s(11),c(11));
A6b : FA port map(A(6),B(6),'1',s(12),c(12));
A7a : FA port map(A(7),B(7),'0',s(13),c(13));
A7b : FA port map(A(7),B(7),'1',s(14),c(14));

M1  : Mux4down2 port map(s(1),s(2),c(0),y(1));
M2  : Mux4down2 port map(c(1),c(2),c(0),y(2));
M3a : Mux4down2 port map(s(5),s(6),c(3),y(3));
M3b : Mux4down2 port map(s(5),s(6),c(4),y(4));
M4a : Mux4down2 port map(c(5),c(6),c(3),y(5));
M4b : Mux4down2 port map(c(5),c(6),c(4),y(6));
M5a : Mux4down2 port map(s(9),s(10),c(7),y(7));
M5b : Mux4down2 port map(s(9),s(10),c(8),y(8));
M6a : Mux4down2 port map(c(9),c(10),c(7),y(9));
M6b : Mux4down2 port map(c(9),c(10),c(8),y(10));
M7a : Mux4down2 port map(s(13),s(14),c(11),y(11));
M7b : Mux4down2 port map(s(13),s(14),c(12),y(12));
M8a : Mux4down2 port map(c(13),c(14),c(11),y(13));
M8b : Mux4down2 port map(c(13),c(14),c(12),y(14));


M9a  : Mux4down2 port map(s(3),s(4),y(2),y(15));
M9b  : Mux4down2 port map(y(3),y(4),y(2),y(16));
M9c  : Mux4down2 port map(y(5),y(6),y(2),y(17));
M10a : Mux4down2 port map(s(11),s(12),y(9),y(18));
M10b : Mux4down2 port map(s(11),s(12),y(10),y(19));
M11a : Mux4down2 port map(y(11),y(12),y(9),y(20));
M11b : Mux4down2 port map(y(11),y(12),y(10),y(21));
M12a : Mux4down2 port map(y(13),y(14),y(9),y(22));
M12b : Mux4down2 port map(y(13),y(14),y(10),y(23));
M13a : Mux4down2 port map(s(7),s(8),y(17),y(24));
M13b : Mux4down2 port map(y(7),y(8),y(17),y(25));
M14a : Mux4down2 port map(y(18),y(19),y(17),y(26));
M14b : Mux4down2 port map(y(20),y(21),y(17),y(27));
M15a : Mux4down2 port map(y(22),y(23),y(17),y(28));

sum(0)<=s(0);
sum(1)<=y(1);
sum(2)<=y(15);
sum(3)<=y(16);
sum(4)<=y(24);
sum(5)<= y(25);
sum(6)<= y(26);
sum(7)<=y(27);
co<= y(28);





end Behavioral;

