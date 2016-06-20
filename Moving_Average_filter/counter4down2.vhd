----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:54 12/17/2014 
-- Design Name: 
-- Module Name:    counter4down2 - Behavioral 
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

entity counter4down2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           ti : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC;
           tout : out  STD_LOGIC);
end counter4down2;

architecture Behavioral of counter4down2 is

component FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

signal iw : std_logic;

begin

u0 : FullAdder port map (a=>b,b=>c,c=>a,s=>iw,co=>tout);
u1 : FullAdder port map (a=>iw,b=>d,c=>ti,s=>s,co=>co);

end Behavioral;
