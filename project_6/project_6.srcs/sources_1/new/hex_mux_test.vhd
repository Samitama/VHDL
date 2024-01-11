library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hex_mux_test is
    port(
        clk : in std_logic;
        btn : in std_logic_vector(3 downto 0);
        sw : in std_logic_vector(7 downto 0);
        an: out std_logic_vector(3 downto 0);
        sseg : out std_logic_vector(7 downto 0)
        );
end hex_mux_test;

architecture arch of hex_mux_test is
    signal d3_reg, d2_reg : std_logic_vector(7 downto 0);
    signal d1_reg,d0_reg : std_logic_vector(7 downto 0);
begin
    disp_unit : entity work.disp_hex_mux
        port map(
            clk => clk,
            rst => '0',
            hex3 => d3_reg(7 downto 4),
            hex2 => d2_reg(3 downto 0),
            hex1 => d1_reg(7 downto 4),
            hex0 => d0_reg(3 downto 0),
            an => "11110000",
            sseg => sseg
            );
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(btn(3) = '1') then
                d3_reg <= sw;
            end if;
            if(btn(2) = '1') then
                d2_reg <= sw;
            end if;
            if(btn(1) = '1') then
                d1_reg <= sw;
             end if;
            if(btn(0) = '1') then
                d0_reg <= sw;
             end if;
         end if;
    end process;
end arch; 