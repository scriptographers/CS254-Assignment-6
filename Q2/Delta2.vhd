-- Component: Delta2 Function
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity Delta2 is
  port (
    u, s2, s1, s0 : in std_logic;
    t2 : out std_logic
  );
end entity;

architecture struct of Delta2 is

	signal nu, ns2, ns1, ns0, nus1s2, uns0s2, s2ns1s0, term1, term2: std_logic;
	signal temp : std_logic_vector (6 downto 0);

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
	
	component AndGate3 is
	  port (
		 a, b, c : in std_logic;
		 z : out std_logic
	  );
	end component;
	
	component OrGate is
		port (
			a, b : in std_logic;
			z : out std_logic
		);
	end component;
	

begin
	
	not_1: NotGate
	port map(a => u, z => nu);
	
	not_2: NotGate
	port map(a => s2, z => ns2);
	
	not_3: NotGate
	port map(a => s1, z => ns1);
	
	not_4: NotGate
	port map(a => s0, z => ns0);
	
	
	and_1: AndGate3
	port map(a => nu, b => s1, c=> s2, z => nus1s2); 
	
	and_2: AndGate3
	port map(a => u, b => ns0, c=> s2, z => uns0s2);
	
	and_3: AndGate3
	port map(a => s2, b => ns1, c=> s0, z => s2ns1s0);
	
	
	and_4: AndGate
	port map(a => nu, b => ns2, z => temp(0));
	
	and_5: AndGate
	port map(a => ns1, b => ns0, z => temp(1));
	
	and_6: AndGate
	port map(a => temp(0), b => temp(1), z => term1);
	
	
	and_7: AndGate
	port map(a => u, b => ns2, z => temp(2));
	
	and_8: AndGate
	port map(a => s1, b => s0, z => temp(3));
	
	and_9: AndGate
	port map(a => temp(2), b => temp(3), z => term2);
	
	
	or_1: OrGate
	port map(a => term1, b => term2, z => temp(4));
	
	or_2: OrGate
	port map(a => nus1s2, b => uns0s2, z => temp(5));
	
	or_3: OrGate
	port map(a => temp(4), b => temp(5), z => temp(6));
	
	or_4: OrGate
	port map(a => temp(6), b => s2ns1s0, z => t2);
	

end architecture;