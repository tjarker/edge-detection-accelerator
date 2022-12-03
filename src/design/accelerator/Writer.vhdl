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

    type state_t is (CollectIdle, Collect, WriteLeft, WriteRight);
    signal state, state_next: state_t;

    signal counter, counter_next: unsigned(1 downto 0);
    signal new_blocks, new_blocks_next: std_logic;
    signal left_block, left_block_next: std_logic_vector(31 downto 0);
    signal right_block, right_block_next: std_logic_vector(31 downto 0);
    signal left_shift_reg, left_shift_reg_next: std_logic_vector(23 downto 0);
    signal right_shift_reg, right_shift_reg_next: std_logic_vector(23 downto 0);

    signal address_reg, address_reg_next: unsigned(15 downto 0);
    signal x_reg, x_reg_next: unsigned(7 downto 0);

    signal valid_counter, valid_counter_next: unsigned(15 downto 0);

begin

    process(all) begin
    
        left_shift_reg_next <= pixel_left & left_shift_reg(23 downto 8)  when valid = '1' else left_shift_reg;
        right_shift_reg_next <=  pixel_right & right_shift_reg(23 downto 8) when valid = '1' else right_shift_reg;
        counter_next <= counter + 1 when valid = '1' else counter;
        left_block_next <=  pixel_left & left_shift_reg when counter = "11" and valid = '1' else left_block; 
        right_block_next <= pixel_right & right_shift_reg when counter = "11" and valid = '1' else right_block; 

        address_reg_next <= address_reg;
        request <= '0';
        done <= '0';
        address <= std_logic_vector(address_reg);
        write_data <= left_block;

        x_reg_next <= x_reg;
        
        valid_counter_next <= valid_counter + 1 when valid = '1' else valid_counter;
        
        new_blocks_next <= '1' when valid = '1' and counter = "11" else '0';
        

        case state is
            when CollectIdle =>
                state_next <= WriteLeft when counter = "11" and valid = '1' else CollectIdle;
                done <= '1';
                address_reg_next <= x"6300";
            when Collect =>
                state_next <= WriteLeft when counter = "11" and valid = '1' else Collect;
            when WriteLeft =>
                state_next <= WriteRight when granted  = '1' else WriteLeft;
                request <= '1';
            when WriteRight =>
                if granted = '1' then
                    x_reg_next <= (others => '0') when x_reg = to_unsigned(87,16) else x_reg + 1;
                    address_reg_next <= address_reg + to_unsigned(89,16) when x_reg = to_unsigned(87,16) else address_reg + 1;
                    if address_reg = to_unsigned(50599, 16) then
                        state_next <= CollectIdle;
                    else
                        state_next <= Collect;
                    end if;
                else
                    state_next <= WriteRight;
                end if;
                request <= '1';
                address <= std_logic_vector(address_reg + to_unsigned(88,16));
                write_data <= right_block;
            when others =>
        end case;
    end process;

    process(clock) begin 
        if rising_edge(clock) then
            state <= Collect when reset = '1' else state_next;
            counter <= (others => '0') when reset = '1' else counter_next;
            new_blocks <= '0' when reset = '1' else new_blocks_next;
            left_block <= (others => '0') when reset = '1' else left_block_next;
            right_block <= (others => '0') when reset = '1' else right_block_next;
            left_shift_reg <= (others => '0') when reset = '1' else left_shift_reg_next;
            right_shift_reg <= (others => '0') when reset = '1' else right_shift_reg_next;
            address_reg <= x"6300" when reset = '1' else address_reg_next;
            x_reg <= (others => '0') when reset = '1' else x_reg_next;
            valid_counter <= (others => '0') when reset = '1' else valid_counter_next;
        end if;
    end process;




end architecture;
