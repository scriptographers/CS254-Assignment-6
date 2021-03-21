-- TOP MODULE: ThreebitUpDownCount
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity ThreebitUpDownCount is
	port(
		clk, rst, up : in std_logic;
		count : out std_logic_vector (2 downto 0)
	);
end entity;

architecture struct of ThreebitUpDownCount is

	signal s, t : std_logic_vector (2 downto 0);

	component DFlipFlop is
		port(
			clk, rst, d : in std_logic;
			q           : out std_logic
		);
	end component;
	
	component NotGate is
		port (
			a : in std_logic;
			z : out std_logic
		);
	end component;
	
	component Delta1 is
		port (
			u, s1, s0 : in std_logic;
			t1 : out std_logic
		);
	end component;

begin

	-- Storage Element s2
  s2_storage : DFlipFlop
  port map(clk => clk, rst => rst, d => t(2), q => s(2));

	-- Storage Element s1
  s1_storage : DFlipFlop
  port map(clk => clk, rst => rst, d => t(1), q => s(1));

  -- Storage Element s0
  s0_storage : DFlipFlop
  port map(clk => clk, rst => rst, d => t(0), q => s(0));
  
  -- Function delta0 = lambda0
  del0 : NotGate
  port map(a => s(0), z => t(0));
  
  -- Function delta1 = lambda1
  del1 : Delta1
  port map(u => up, s1 => s(1), s0 => s(0), t1 => t(1));

end architecture;