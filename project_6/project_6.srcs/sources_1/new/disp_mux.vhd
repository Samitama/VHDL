library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity disp_hex_mux is
    port(
        clk,rst : in std_logic;
        hex3,hex2 : in std_logic_vector(3 downto 0);
        hex1,hex0 : in std_logic_vector(3 downto 0);
        an: out std_logic_vector(3 downto 0);
        sseg : out std_logic_vector(7 downto 0)
        );
end disp_hex_mux;

architecture arch of disp_hex_mux is
    constant N : integer := 18;
    signal q_reg : unsigned(N-1 downto 0);
    signal q_next : unsigned(N-1 downto 0);
    signal sel : std_logic_vector(1 downto 0);
    signal hex : std_logic_vector(3 downto 0);
begin
    process(clk,rst)
    begin
        if(rst = '1') then 
            q_reg <= (others => '0');
        elsif(rising_edge(clk)) then
            q_reg <= q_next;
        end if;
    end process;
    
    q_next <= q_reg + 1;
    
    sel <= std_logic_vector(q_reg(N-1 downto N-2));
    process(sel,hex0,hex1,hex2,hex3)
    begin
        case sel is
            when "00" =>
                an(3 downto 0)  <= "1110";
                hex             <= hex0;
            when "01" =>
                 an(3 downto 0)  <= "1101";
                 hex             <= hex1;
            when "10" =>
                 an(3 downto 0)  <= "1011";
                 hex             <= hex3;
            when others =>
                 an(3 downto 0)  <= "0111";
                 hex             <= hex3;
        end case;
    end process; 
    
    with hex select 
        sseg(6 downto 0) <= 
            "1000000" when "0000",
            "1111001" when "0001",
            "0100100" when "0010",
            "0011001" when "0011",
            "0010010" when "0100",
            "0000010" when "0101",
            "1111000" when "0110",
            "0000000" when "0111",
            "0010000" when "1000",
            "0001000" when "1001",
            "0000011" when "1010",
            "1000110" when "1011",
            "0100001" when "1100",
            "0000110" when "1101",
            "0001110" when others;
     sseg(7) <= '1';
end arch;
            
             

