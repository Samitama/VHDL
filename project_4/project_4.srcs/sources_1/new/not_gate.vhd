library ieee;
use ieee.std_logic_1164.all;

entity gates is
    port(
        SW : in std_logic_vector(1 downto 0);
        LED : out std_logic_vector(4 downto 0)
        );
end gates;

architecture arch of gates is
begin
    LED(0) <= SW(0);
    LED(1) <= not SW(1);
    LED(2) <= SW(1) and SW(0);
    LED(3) <= SW(1) or SW(0);
    LED(4) <= SW(1) xor SW(0);
end arch;