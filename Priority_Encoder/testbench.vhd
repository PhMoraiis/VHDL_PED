library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder_tb is
end priority_encoder_tb;

architecture Behavioral of priority_encoder_tb is
    -- Componente a ser testado
    component priority_encoder
    Port ( p0 : in STD_LOGIC;
           p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           p3 : in STD_LOGIC;
           x0 : out STD_LOGIC;
           x1 : out STD_LOGIC;
           int : out STD_LOGIC);
    end component;
    
    -- Sinais de entrada
    signal p0, p1, p2, p3 : STD_LOGIC := '0';
    
    -- Sinais de saída
    signal x0, x1, int : STD_LOGIC;
begin
    -- Instância do Device Under Test (DUT)
    DUT: priority_encoder PORT MAP (
        p0 => p0,
        p1 => p1,
        p2 => p2,
        p3 => p3,
        x0 => x0,
        x1 => x1,
        int => int
    );
    
    -- Processo de estímulo
    stim_proc: process
    begin
        -- Teste de todas as 16 combinações possíveis
        for i in 0 to 15 loop
            p3 <= std_logic(to_unsigned(i, 4)(3));
            p2 <= std_logic(to_unsigned(i, 4)(2));
            p1 <= std_logic(to_unsigned(i, 4)(1));
            p0 <= std_logic(to_unsigned(i, 4)(0));
            
            wait for 10 ns;  -- Aguarda para estabilização
        end loop;
        
        wait;  -- Para a simulação
    end process;
end Behavioral;