library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder is
    Port ( p0 : in STD_LOGIC;
           p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           p3 : in STD_LOGIC;
           x0 : out STD_LOGIC;
           x1 : out STD_LOGIC;
           int : out STD_LOGIC);
end priority_encoder;

architecture Behavioral of priority_encoder is
begin
    process(p0, p1, p2, p3)
    begin
        -- Verifica se há alguma entrada em nível alto
        if (p0 = '1' or p1 = '1' or p2 = '1' or p3 = '1') then
            int <= '1';  -- Sinaliza interrupção
        else
            int <= '0';  -- Sem interrupção
        end if;
        
        -- Decodificação de prioridade (p0 tem maior prioridade)
        if p0 = '1' then
            x0 <= '0';
            x1 <= '0';
        elsif p1 = '1' then
            x0 <= '0';
            x1 <= '1';
        elsif p2 = '1' then
            x0 <= '1';
            x1 <= '0';
        elsif p3 = '1' then
            x0 <= '1';
            x1 <= '1';
        else
            x0 <= '0';
            x1 <= '0';
        end if;
    end process;
end Behavioral;