library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deneme is
    generic( N: integer := 10;
             M: integer := 100
            );
    port(
        clk : in std_logic;
        rst : in std_logic;
        max_tick : out std_logic;
        q : out std_logic_vector(N-1 downto 0)
        );
end deneme;

architecture arch of deneme is
    signal r_reg, r_next : unsigned(N-1 downto 0);
begin
    process(clk,rst)
    begin
        if(rst = '1') then
            r_reg <= (Others=>'0');
        elsif(rising_edge(clk)) then
            r_reg <= r_next;
        end if;
    end process;
    r_next <= (Others =>'0') when r_reg = M-1 else r_reg +1;
    q <= std_logic_vector(r_reg);
    max_tick <= '1' when r_reg < 5 else '0';
end arch;