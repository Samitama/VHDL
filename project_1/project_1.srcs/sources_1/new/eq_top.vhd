library IEEE;
use IEEE.std_logic_1164.all;

entity eq_top is
    port(
        SW : in std_logic_vector(3 downto 0);
        LED : out std_logic_vector(0 downto 0)
    );
end eq_top;

architecture struc_arch of eq_top is
begin
    eq2_unit : entity work.eq2(struc_arch)
        port map(
        a => SW(3 downto 2),
        b => SW(1 downto 0),
        aeqb => LED(0)
        );
end struc_arch;