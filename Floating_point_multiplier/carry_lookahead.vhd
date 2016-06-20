----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:06:54 01/20/2015 
-- Design Name: 
-- Module Name:    carry_lookahead - Behavioral 
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

entity carry_lookahead is
PORT
        (
         a  :  IN   STD_LOGIC_VECTOR(31 DOWNTO 0);
         b  :  IN   STD_LOGIC_VECTOR(31 DOWNTO 0);
         ci :  IN   STD_LOGIC;
         s  :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
         co :  OUT  STD_LOGIC
        );
end carry_lookahead;

architecture Behavioral of carry_lookahead is
SIGNAL    h_s  :    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL    g    :    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL    p    :    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL    cin  :    STD_LOGIC_VECTOR(31 DOWNTO 1);
begin
	 h_s <= a XOR b;
    g <= a AND b;
    p <= a OR b;
    PROCESS (g,p,cin)
    BEGIN
    cin(1) <= g(0) OR (p(0) AND ci);
        inst: FOR i IN 1 TO 30 LOOP
              cin(i+1) <= g(i) OR (p(i) AND cin(i));
              END LOOP;
    co <= g(31) OR (p(31) AND cin(31));
    END PROCESS;

    s(0) <= h_s(0) XOR ci;
    s(31 DOWNTO 1) <= h_s(31 DOWNTO 1) XOR cin(31 DOWNTO 1);

end Behavioral;

