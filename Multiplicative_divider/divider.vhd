----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:06:25 01/20/2015 
-- Design Name: 
-- Module Name:    divider - Behavioral 
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

entity divider is
port (
        a   : in std_logic_vector (15 downto 0);   -- Dividend
        b   : in std_logic_vector (15 downto 0);   -- Divisor
        c   : in std_logic_vector (2 downto 0);    -- count
        clk : in std_logic;
        load : in std_logic;
		 -- rst : in std_logic;
        q   : out std_logic_vector (15 downto 0)   -- Quotient
    );
end divider;

architecture Behavioral of divider is
	component booth_multiplier is
        port (
            a : in  std_logic_vector (15 downto 0);
            b : in  std_logic_vector (15 downto 0);
            m : out std_logic_vector (31 downto 0)
        );
    end component;
	 
	component carry_lookahead16 is
        port (
            a  : in  std_logic_vector (15 downto 0);
            b  : in  std_logic_vector (15 downto 0);
            ci : in  std_logic;
            s  : out std_logic_vector (15 downto 0);
            co : out std_logic
        );
    end component;

	component reciprocal is
        port (
            b : in  std_logic_vector (15 downto 0);
            r : out std_logic_vector (15 downto 0)
        );
    end component;
	 -- Counter register
    signal counter : std_logic_vector(2 downto 0);
    signal counter_decrement : std_logic_vector(2 downto 0);
	 
	 -- Intermediate output signals
    signal nop : std_logic_vector(31 downto 0);
    signal dop : std_logic_vector(31 downto 0);
    signal dos : std_logic_vector(15 downto 0);
    signal don : std_logic_vector(15 downto 0);
	 
	 -- Current iteration outputs
    signal no : std_logic_vector(15 downto 0);
    signal do : std_logic_vector(15 downto 0);
    signal fo : std_logic_vector(15 downto 0);

    -- Previous iteration registers
    signal np : std_logic_vector(15 downto 0);
    signal dp : std_logic_vector(15 downto 0);
    signal fp : std_logic_vector(15 downto 0);

    -- Initial reciprocal
    signal ir : std_logic_vector(15 downto 0);
begin
	-- Registers for N, D and F
    sync_process: process(clk, counter)
    begin
--		  if (rst = '1') then
--		    np <=(others=>'0');
--			 dp <=(others=>'0');
--			 fp <=(others=>'0');
--			 no <=(others=>'0');
--			 do <=(others=>'0');
--			 fo <=(others=>'0');
--			 counter <=(others=>'0');
--			 counter_decrement <=(others=>'0');
--			 nop <=(others=>'0');
--			 dop <=(others=>'0');
--			 dos <=(others=>'0');
--			 don <=(others=>'0');
--			 ir <=(others=>'0');
		if (load = '1') then 
				counter <= c;
				np <= a;
				dp <= b;
				fp <= ir;
        elsif rising_edge(clk) then
          -- if (load = '1') then
					
			--  else	
					counter <= counter_decrement;
					np <= no;
					dp <= do;
					fp <= fo;
			 --  end if;	-- commented this as test bench throws error with 'reset' signal
        end if;
    end process;
	
	initial_reciprocal: reciprocal port map(b=>b, r=>ir);

    -- states of decrement iteration counter
    counter_decrement <=
        "110" when counter = "111" else
        "101" when counter = "110" else
        "100" when counter = "101" else
        "011" when counter = "100" else
        "010" when counter = "011" else
        "001" when counter = "010" else
        "000";

    -- Multiply input F and input N
    n_stage: booth_multiplier port map(a=>fp, b=>np, m=>nop);

    -- Multiply input F and input D
    d_stage: booth_multiplier port map(a=>fp, b=>dp, m=>dop);

    -- Round output N
    no <= nop(23 downto 8);

    -- Round output D
    dos <= dop(23 downto 8);

    -- Find two's complement of output D
    don <= not dos;

    -- Perform 2-D
    f_stage: carry_lookahead16 port map(a=>"0000001000000000", b=>don, ci=>'1', s=>fo);
    do <= dos;
	 -- assign Q <- N on convergence
    q <= no;

end Behavioral;

