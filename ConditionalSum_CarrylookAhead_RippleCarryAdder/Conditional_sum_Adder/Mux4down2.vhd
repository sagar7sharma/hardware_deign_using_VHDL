----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:59 11/18/2014 
-- Design Name: 
-- Module Name:    Mux4down2 - Behavioral 
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

entity Mux4down2 is
	port ( din_0   :in  std_logic;-- Mux first input
			 din_1   :in  std_logic;-- Mux Second input
			 sel     :in  std_logic;-- Select input
			mux_out :out std_logic -- Mux output
		);
end Mux4down2;

architecture Behavioral of Mux4down2 is

begin
  with (sel) select
		mux_out <= din_0 when '0',
		din_1 when others;

end Behavioral;


