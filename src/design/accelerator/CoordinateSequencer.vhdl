library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;


entity CoordinateSequencer is
    port(
        clock: in std_logic;
        reset: in std_logic;

        start: in std_logic;
        stall: in std_logic;

        x: out unsigned(8 downto 0);
        y: out unsigned(8 downto 0);
        valid: out std_logic
    );
end entity;

architecture Behavioral of CoordinateSequencer is

    signal running_reg, running_reg_next: std_logic;
    signal x_reg, x_reg_next: unsigned(8 downto 0);
    signal y_reg, y_reg_next: unsigned(8 downto 0);
    signal end_row, last_pixel: boolean;

begin

    process(all) begin
        if last_pixel then
            running_reg_next <= '0';
        elsif start = '1' then
            running_reg_next <= '1';
        else
            running_reg_next <= running_reg;
        end if;
    end process;

    process(all) begin 

        x <= x_reg;
        y <= y_reg;
        valid <= running_reg and not stall;

        end_row <= x_reg = to_unsigned(351, 9);
        last_pixel <= end_row and y_reg = to_unsigned(286, 9);

        if stall = '0' and running_reg = '1' then
            x_reg_next <= (others => '0') when end_row else x_reg + 1;
            y_reg_next <= (others => '0') when last_pixel else y_reg + 2 when end_row else y_reg;
        else
            x_reg_next <= x_reg;
            y_reg_next <= y_reg;
        end if;
        
    end process;



    process(clock) begin
        if rising_edge(clock) then

            x_reg <= (others => '0') when reset = '1' else x_reg_next;
            y_reg <= (others => '0') when reset = '1' else y_reg_next;

            running_reg <= '0' when reset = '1' else running_reg_next;

        end if;
    end process;



end architecture;