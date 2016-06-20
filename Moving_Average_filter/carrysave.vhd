----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:01 12/17/2014 
-- Design Name: 
-- Module Name:    carrysave - Behavioral 
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

entity carrysave is
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
end carrysave;

architecture Behavioral of carrysave is

component carrysavemodule is
    Port ( a : in  STD_LOGIC_VECTOR (14 downto 0);
           b : in  STD_LOGIC_VECTOR (14 downto 0);
           c : in  STD_LOGIC_VECTOR (14 downto 0);
           d : in  STD_LOGIC_VECTOR (14 downto 0);
           s : out  STD_LOGIC_VECTOR (14 downto 0);
           co : out  STD_LOGIC_VECTOR (14 downto 0));
end component;

component ConditionalSumAdder is
    Port ( a : in  STD_LOGIC_VECTOR (14 downto 0);
           b : in  STD_LOGIC_VECTOR (14 downto 0);
           s : out  STD_LOGIC_VECTOR (14 downto 0));
end component;

--internal wiring and sign extension
type ibus is array(40 downto 0) of std_logic_vector(14 downto 0);
signal iw : ibus;

begin

--Sign extension
iw(0)<=i0(10)&i0(10)&i0(10)&i0(10)&i0;
iw(1)<=i1(10)&i1(10)&i1(10)&i1(10)&i1;
iw(2)<=i2(10)&i2(10)&i2(10)&i2(10)&i2;
iw(3)<=i3(10)&i3(10)&i3(10)&i3(10)&i3;
iw(4)<=i4(10)&i4(10)&i4(10)&i4(10)&i4;
iw(5)<=i5(10)&i5(10)&i5(10)&i5(10)&i5;
iw(6)<=i6(10)&i6(10)&i6(10)&i6(10)&i6;
iw(7)<=i7(10)&i7(10)&i7(10)&i7(10)&i7;
iw(8)<=i8(10)&i8(10)&i8(10)&i8(10)&i8;
iw(9)<=i9(10)&i9(10)&i9(10)&i9(10)&i9;
iw(10)<=i10(10)&i10(10)&i10(10)&i10(10)&i10;
iw(11)<=i11(10)&i11(10)&i11(10)&i11(10)&i11;
iw(12)<=i12(10)&i12(10)&i12(10)&i12(10)&i12;
iw(13)<=i13(10)&i13(10)&i13(10)&i13(10)&i13;
iw(14)<=i14(10)&i14(10)&i14(10)&i14(10)&i14;
iw(15)<=i15(10)&i15(10)&i15(10)&i15(10)&i15;

--Level 0
u0 : carrysavemodule port map (a=>iw(0),b=>iw(1),c=>iw(2),d=>iw(3),s=>iw(16),co=>iw(17));
u1 : carrysavemodule port map (a=>iw(4),b=>iw(5),c=>iw(6),d=>iw(7),s=>iw(18),co=>iw(19));
u2 : carrysavemodule port map (a=>iw(8),b=>iw(9),c=>iw(10),d=>iw(11),s=>iw(20),co=>iw(21));
u3 : carrysavemodule port map (a=>iw(12),b=>iw(13),c=>iw(14),d=>iw(15),s=>iw(22),co=>iw(23));

--Level 1
u4 : carrysavemodule port map (a=>iw(16),b=>iw(17),c=>iw(18),d=>iw(19),s=>iw(24),co=>iw(25));
u5 : carrysavemodule port map (a=>iw(20),b=>iw(21),c=>iw(22),d=>iw(23),s=>iw(26),co=>iw(27));

--Level 2
u6 : carrysavemodule port map (a=>iw(24),b=>iw(25),c=>iw(26),d=>iw(27),s=>iw(28),co=>iw(29));

--Level 3
u7 : ConditionalSumAdder port map (a=>iw(28),b=>iw(29),s=>f);

end Behavioral;
