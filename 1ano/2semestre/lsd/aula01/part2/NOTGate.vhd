library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOTGate is
    port (
        inPort : in std_logic;
        outPort : out std_logic
    );
end NOTGate;

architecture Behavioral of NOTGate is
begin
    outPort <= not inPort;
end Behavioral;