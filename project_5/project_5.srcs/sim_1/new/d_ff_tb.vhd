library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_ff_tb is
end d_ff_tb;

architecture arch of d_ff_tb is 
    signal t_rst : std_logic;       
    signal t_clk : std_logic;
    signal t_q : std_logic_vector(99 downto 0);
    signal max_tick : std_logic;
    constant clk_period : time := 10ns;
begin
    uut : entity work.deneme(arch)
    port map(
        clk => t_clk,
        rst => t_rst,
        max_tick => max_tick,
        q => t_q
        );
    process
        begin
            t_clk <= '0';
            wait for clk_period/2;
            t_clk <= '1';
            wait for clk_period/2;
    end process;
    
    t_rst <= '1' , '0' after clk_period/2;
   
    process
    begin 
        for i in 1 to 1000 loop
            wait until falling_edge(t_clk);
        end loop;
        wait for clk_period;
        assert false
            report "Simulation Completed"
        severity failure;
    end process;
end arch;            