-- Component: 3-input AND Gate using structural modelling
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity AndGate3 is
  port (
    a, b, c : in std_logic;
    z       : out std_logic
  );
end entity;

architecture struct of AndGate3 is
begin

  z <= (a and b and c);

end architecture;
