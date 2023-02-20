-- Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Interface (portos)
entity AND2Gate is
    port(
        inPort0 : in std_logic;
        inPort1 : in std_logic;
        outPort : out std_logic
    );
end AND2Gate;

-- Implementação (descrição do funcionalidade)
architecture Behavioral of AND2Gate is begin
    outPort <= inPort0 and inPort1;
end Behavioral;