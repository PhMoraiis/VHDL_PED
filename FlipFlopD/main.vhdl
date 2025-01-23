library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port (
        SWITCHES : in STD_LOGIC_VECTOR(3 downto 0);
        CLK_IN : in STD_LOGIC;
        RST : in STD_LOGIC;
        LEDS : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Main;

architecture Behavioral of Main is
    signal CLK_1HZ : STD_LOGIC;
    component ClockDivider
        Port (
            CLK_IN : in STD_LOGIC;
            RST : in STD_LOGIC;
            CLK_OUT : out STD_LOGIC
        );
    end component;

    component DFlipFlop
        Port (
            D : in STD_LOGIC;
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;

    signal Q : STD_LOGIC_VECTOR(3 downto 0);
begin
    -- Instância do divisor de clock
    ClockDivider_inst: ClockDivider
        Port map (
            CLK_IN => CLK_IN,
            RST => RST,
            CLK_OUT => CLK_1HZ
        );

    -- Instâncias dos flip-flops
    gen_flip_flops: for i in 0 to 3 generate
        DFlipFlop_inst: DFlipFlop
            Port map (
                D => SWITCHES(i),
                CLK => CLK_1HZ,
                RST => RST,
                Q => Q(i)
            );
    end generate;

    -- Saída dos LEDs
    LEDS <= Q;
end Behavioral;
