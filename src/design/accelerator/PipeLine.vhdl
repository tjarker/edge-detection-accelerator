library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;


entity Pipeline is
    port(
        clock: in std_logic;
        reset: in std_logic;

        step: in std_logic;

        in_window: in window_t;
        in_valid: in std_logic;

        out_pixel_left: out byte_t;
        out_pixel_right: out byte_t;
        out_valid: out std_logic
    );
end entity;

architecture Behavioral of Pipeline is

    signal x_reg, x_reg_next: unsigned(8 downto 0);
    signal y_reg, y_reg_next: unsigned(8 downto 0);
    signal end_row, last_pixel: boolean;

begin

    process(all) begin 

        end_row <= x_reg = to_unsigned(351, 9);
        last_pixel <= end_row and y_reg = to_unsigned(287, 9);

        if step = '1' and not last_pixel then
            x_reg_next <= (others => '0') when end_row else x_reg + 1;
            y_reg_next <= y_reg + 1;
        else
            x_reg_next <= x_reg;
            y_reg_next <= y_reg;
        end if;
        
    end process;



    process(clock) begin
        if rising_edge(clock) then

            x_reg <= (others => '0') when reset = '1' else x_reg_next;
            y_reg <= (others => '0') when reset = '1' else y_reg_next;

        end if;
    end process;



end architecture;