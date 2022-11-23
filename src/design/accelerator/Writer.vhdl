library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;


entity Writer is
    port(
        clock: in std_logic;
        reset: in std_logic;

        pixel_left: in byte_t;
        pixel_right: in byte_t;
        valid: in std_logic;
    
        done: out std_logic;

        request: out bit_t;
        granted: in bit_t;
        address   : out halfword_t;
        write_data : out word_t
    );
end entity;

architecture Behavioral of Writer is

    type state_t is (Collect, WriteLeft, WriteRight);
    signal state, state_next: state_t;

    signal counter, counter_next: unsigned(2 downto 0);
    signal left_block, left_block_next: std_logic_vector(31 downto 0);
    signal right_block, right_block_next: std_logic_vector(31 downto 0);
    signal left_shift_reg, left_shift_reg_next: std_logic_vector(31 downto 0);
    signal right_shift_reg, right_shift_reg_next: std_logic_vector(31 downto 0);

    signal address_reg, address_reg_next: unsigned(15 downto 0);
    signal x_reg, x_reg_next: unsigned(7 downto 0);

begin

    process(all) begin
    
        left_shift_reg_next <= left_shift_reg(31 downto 8) & pixel_left when valid = '1' else left_shift_reg;
        right_shift_reg_next <= right_shift_reg(31 downto 8) & pixel_right when valid = '1' else right_shift_reg;
        counter_next <= counter + 1 when valid = '1' else counter;
        left_block_next <= left_shift_reg when counter = "100" else left_block; -- might be wrong
        right_block_next <= right_shift_reg when counter = "100" else right_block; -- might be wrong
        if counter(2) = '1' then
            counter_next(2) <= '0';
        end if;

        address_reg_next <= address_reg;
        request <= '0';
        done <= '1' when address_reg = to_unsigned(25343, 16) else '0';
        address <= std_logic_vector(address_reg);
        write_data <= left_block;

        x_reg_next <= x_reg;
        

        case state is
            when Collect =>
                state_next <= WriteLeft when counter = "100" else Collect;
            when WriteLeft =>
                state_next <= WriteRight when granted  = '1' else WriteLeft;
                request <= '1';
            when WriteRight =>
                state_next <= Collect when granted = '1' else WriteRight;
                request <= '1';
                address <= std_logic_vector(address_reg + to_unsigned(88,16));
                x_reg_next <= (others => '0') when x_reg = to_unsigned(43,16) else x_reg + 1;
                address_reg_next <= address_reg + to_unsigned(88,16) when x_reg = to_unsigned(43,16) else address_reg + 1;
        end case;
    end process;

    process(clock) begin 
        if rising_edge(clock) then
            state <= Collect when reset = '1' else state_next;
            counter <= (others => '0') when reset = '1' else counter_next;
            left_block <= (others => '0') when reset = '1' else left_block_next;
            right_block <= (others => '0') when reset = '1' else right_block_next;
            left_shift_reg <= (others => '0') when reset = '1' else left_shift_reg_next;
            right_shift_reg <= (others => '0') when reset = '1' else right_shift_reg_next;
            address_reg <= (others => '0') when reset = '1' else address_reg_next;
            x_reg <= (others => '0') when reset = '1' else x_reg_next;
        end if;
    end process;




end architecture;