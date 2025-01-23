library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClockDivider is
    Port (
        CLK_IN : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLK_OUT : out STD_LOGIC
    );
end ClockDivider;

architecture Behavioral of ClockDivider is
    constant DIVISOR : integer := 100_000_000 / 2; -- Divisão para 1 Hz
    signal counter : integer := 0;
    signal clk_reg : STD_LOGIC := '0';
begin
    process (CLK_IN, RST)
    begin
        if RST = '0' then
            counter <= 0;
            clk_reg <= '0';
        elsif rising_edge(CLK_IN) then
            if counter = DIVISOR - 1 then
                counter <= 0;
                clk_reg <= not clk_reg;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    CLK_OUT <= clk_reg;
end Behavioral;
