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

architecture struct of TwobitUpCount is

	component DFlipFlop is
		port(
			clk, rst, d : in std_logic;
			q           : out std_logic
		);
	end component;

begin

  

end architecture;