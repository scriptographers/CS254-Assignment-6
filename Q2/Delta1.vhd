-- Component: Delta1 Function
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity Delta1 is
  port (
    u, s1, s0 : in std_logic;
    t1 : out std_logic
  );
end entity;

architecture struct of Delta1 is

	signal nu, s0_xor_s1, n_s0_xor_s1, temp1, temp2: std_logic;

	component NotGate is
		port (
			a: in std_logic;
			z : out std_logic
		);
	end component;
	
	component AndGate is
		port (
			a, b : in std_logic;
			z : out std_logic
		);
	end component;
	
	component OrGate is
		port (
			a, b : in std_logic;
			z : out std_logic
		);
	end component;
	
	component XorGate is
		port (
			a, b : in std_logic;
			z : out std_logic
		);
	end component;

begin

	xor_1: XorGate
	port map(a => s1, b => s0, z => s0_xor_s1);
	
	not_1: NotGate
	port map(a => s0_xor_s1, z => n_s0_xor_s1);
	
	not_2: NotGate
	port map(a => u, z => nu);
	
	and_1: AndGate
	port map(a => u, b => s0_xor_s1, z => temp1);

	and_2: AndGate
	port map(a => nu, b => n_s0_xor_s1, z => temp2);
	
	or_1: OrGate
	port map(a => temp1, b => temp2, z => t1);

end architecture;