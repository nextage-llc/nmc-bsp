library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PulseGenerator is
    Port ( 
        clk     : in std_logic;      -- 100 MHz clock
        reset   : in std_logic;      -- Active low reset (based on your previous code)
        pulse_out : out std_logic    -- Toggles every second
    );
end PulseGenerator;

architecture Behavioral of PulseGenerator is
    -- 100 MHz = 100,000,000 cycles per second.
    -- We count 0 to 99,999,999.
    constant MAX_COUNT : integer := 100000000 - 1;
    
    -- Counter signal (integer is easier to read for specific limits)
    signal timer : integer range 0 to MAX_COUNT;
    
    -- Register to hold the current state of the output
    signal state : std_logic := '0';

begin

process(clk)
begin
    if(rising_edge(clk)) then
        -- Active low reset (matches your original code's logic)
        if(reset = '0') then
            timer <= 0;
            state <= '0';
        else
            if(timer = MAX_COUNT) then
                -- 1 second has passed
                timer <= 0;          -- Reset counter
                state <= not state;  -- Toggle output (High -> Low or Low -> High)
            else
                -- Keep counting
                timer <= timer + 1;
            end if;
        end if;
    end if;
end process;

-- Assign the internal signal to the output port
pulse_out <= state;

end Behavioral;