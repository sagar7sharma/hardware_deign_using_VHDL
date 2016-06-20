----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:51:42 01/20/2015 
-- Design Name: 
-- Module Name:    booth_enc_r4 - Behavioral 
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

entity booth_enc_r4 is
Port ( a : in  std_logic_vector (15 downto 0);
		 d : in  std_logic_vector (2 downto 0);
       m : out std_logic_vector (16 downto 0));
end booth_enc_r4;

architecture Behavioral of booth_enc_r4 is
component carry_lookahead16 is
        port (
            a  : in  std_logic_vector (15 downto 0);
            b  : in  std_logic_vector (15 downto 0);
            ci : in  std_logic;
            s  : out std_logic_vector (15 downto 0);
            co : out std_logic
        );
    end component;
	 signal ai : std_logic_vector(15 DOWNTO 0);
    signal an : std_logic_vector(15 DOWNTO 0);
begin
	 ai <= not a;
    cla_stage: carry_lookahead16 port map(
      a => ai, b => "0000000000000001", ci => '0', s => an
    );
	 with d select
        m <=a(15)  & a   when "001", 
            a(15)  & a   when "010", 
            a      & "0" when "011", 
            an     & "0" when "100", 
            an(15) & an  when "101", 
            an(15) & an  when "110",
            "00000000000000000" when others;
end Behavioral;

