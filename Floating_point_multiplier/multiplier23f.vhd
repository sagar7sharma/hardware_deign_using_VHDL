----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:25:48 01/25/2015 
-- Design Name: 
-- Module Name:    multiplier23f - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier23f is
Port ( x : in  STD_LOGIC_VECTOR (22 downto 0);
       y : in  STD_LOGIC_VECTOR (22 downto 0);
       z : out STD_LOGIC_VECTOR (22 downto 0));
end multiplier23f;

architecture Behavioral of multiplier23f is
	component booth_multiplier is
        port (
            a : in  STD_LOGIC_VECTOR (15 downto 0);
            b : in  STD_LOGIC_VECTOR (15 downto 0);
            m : out STD_LOGIC_VECTOR (31 downto 0)
        );
   end component;
		signal xm_unpacked : STD_LOGIC_VECTOR (15 downto 0);
		signal ym_unpacked : STD_LOGIC_VECTOR (15 downto 0);
		signal booth_prod : STD_LOGIC_VECTOR (31 downto 0);
begin
		
		multiply_stage: booth_multiplier port map(a => xm_unpacked, b => ym_unpacked, m => booth_prod);
	process(x,y)

variable x_mantissa : STD_LOGIC_VECTOR (13 downto 0);
variable x_exponent : STD_LOGIC_VECTOR (7 downto 0);
variable x_sign : STD_LOGIC;
variable y_mantissa : STD_LOGIC_VECTOR (13 downto 0);
variable y_exponent : STD_LOGIC_VECTOR (7 downto 0);
variable y_sign : STD_LOGIC;
variable z_mantissa : STD_LOGIC_VECTOR (13 downto 0);
variable z_exponent : STD_LOGIC_VECTOR (7 downto 0);
variable z_sign : STD_LOGIC;
variable to_add : STD_LOGIC;
--variable mantissa_prod : STD_LOGIC_VECTOR (29 downto 0);
variable exponent_sum : STD_LOGIC_VECTOR (8 downto 0);


	begin
		x_mantissa := x(13 downto 0);
		x_exponent := x(21 downto 14);
		x_sign := x(22);
		y_mantissa := y(13 downto 0);
		y_exponent := y(21 downto 14);
		y_sign := y(22);
		
		xm_unpacked <= "01" & x_mantissa;
		ym_unpacked <= "01" & y_mantissa;
--checking if mantissa & exponents are zero
if (x_exponent="00000000" or y_exponent= "00000000" or x_mantissa="00000000000000" or y_mantissa="00000000000000") then 
	z_exponent := (others => '0');
	z_mantissa := (others => '0');
	z_sign := '0';
	
else
--multiply significant bits (including hidden bits) of operands
--zero pre-appended so that 16-bit booth multiplier can be used
--	process(x_mantissa, y_mantissa)
--	begin
	
	

--	end process;
	--mantissa_prod := booth_prod(29 downto 0);
		if (booth_prod(31)='1') then 
		  --shift left and add one to exponent
		  z_mantissa := std_logic_vector(unsigned(booth_prod(30 downto 17))); -- with rounding
		  to_add := '1';
		else
		  z_mantissa := std_logic_vector(unsigned(booth_prod(29 downto 16))); -- with rounding
		  to_add := '0';
		end if;
	
-- calculate exponent
	exponent_sum := std_logic_vector(unsigned('0' & x_exponent(7 downto 0)) + unsigned('0' & y_exponent(7 downto 0)) + 
	("0000000" & to_add)- 127); -- (-127 = + "10000001")

		if (exponent_sum(8)='1') then 
			  if (exponent_sum(7)='0') then --overflow
					 z_exponent := "11111111";
					 z_mantissa := (others => '0');
					 z_sign := x_sign xor y_sign;
			  else                          --underflow
					 z_exponent := (others => '0');
					 z_mantissa := (others => '0');
					 z_sign := '0';
			  end if;
		else                               --alright
			z_exponent := exponent_sum(7 downto 0);
			z_sign := x_sign xor y_sign;
		end if;
end if;
	z(13 downto 0) <= z_mantissa;
	z(21 downto 14) <= z_exponent;
	z(22) <= z_sign;

	end process;
end Behavioral;

