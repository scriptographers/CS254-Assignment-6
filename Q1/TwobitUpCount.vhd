-- TOP MODULE: TwobitUpCount
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity TwobitUpCount is
  port (
    clk, rst : in std_logic;
    count    : out std_logic_vector (1 downto 0));
end entity;

architecture struct of TwobitUpCount is

  signal s, t : std_logic_vector (1 downto 0);

  component DFlipFlop is
    port (
      clk, rst, d : in std_logic;
      q           : out std_logic);
  end component;

  component XorGate is
    port (
      a, b : in std_logic;
      z    : out std_logic
    );
  end component;

  component NotGate is
    port (
      a : in std_logic;
      z : out std_logic
    );
  end component;

begin

  -- Storage Element s1
  s1_storage : DFlipFlop
  port map(clk => clk, rst => rst, d => t(1), q => s(1));

  -- Storage Element s0
  s0_storage : DFlipFlop
  port map(clk => clk, rst => rst, d => t(0), q => s(0));

  -- Function delta1
  del1 : XorGate
  port map(a => s(1), b => s(0), z => t(1));

  -- Function delta0
  del0 : NotGate
  port map(a => s(0), z => t(0));

  count <= s;

end architecture;
