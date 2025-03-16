library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity car_alarm is
    Port ( 
        -- Entradas dos switches da Basys 3
        sw0 : in STD_LOGIC;  -- Estado da porta do motorista (0: fechado, 1: aberto)
        sw1 : in STD_LOGIC;  -- Estado da ignição (0: desligada, 1: ligada)
        sw2 : in STD_LOGIC;  -- Estado dos faróis (0: apagados, 1: acesos)
        
        -- Saída para o LED
        led0 : out STD_LOGIC  -- LED indicador do alarme
    );
end car_alarm;

architecture Behavioral of car_alarm is
begin
    -- Lógica de ativação do alarme
    process(sw0, sw1, sw2)
    begin
        -- Caso 1: Faróis acesos e ignição desligada
        -- Caso 2: Porta aberta e ignição ligada
        if (sw2 = '1' and sw1 = '0') or (sw0 = '1' and sw1 = '1') then
            led0 <= '1';  -- Ativa o alarme (LED aceso)
        else
            led0 <= '0';  -- Desativa o alarme (LED apagado)
        end if;
    end process;
end Behavioral;