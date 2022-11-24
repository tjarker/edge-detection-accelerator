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
    signal left_shift_reg, left_shift_reg_next: std_logic_vector(31 downto 0);
    signal right_shift_reg, right_shift_reg_next: std_logic_vector(31 downto 0);

    signal address_reg, address_reg_next: unsigned(15 downto 0);
    signal x_reg, x_reg_next: unsigned(7 downto 0);

begin

    process(all) begin
    
        left_shift_reg_next <= left_shift_reg(31 downto 8) & pixel_left when valid = '1' else left_shift_reg;
        right_shift_reg_next <= right_shift_reg(31 downto 8) & pixel_right when valid = '1' else right_shift_reg;
        counter_next <= counter + 1 when valid = '1' else counter;
        left_block_next <= left_shift_reg when new_blocks= '1' else left_block; 
        right_block_next <= right_shift_reg when new_blocks= '1' else right_block; 

        address_reg_next <= address_reg;
        request <= '0';
        done <= '0';
        address <= std_logic_vector(address_reg);
        write_data <= left_block;

        x_reg_next <= x_reg;
        
        new_blocks_next <= '1' when valid = '1' and counter = "11" else '0';
        

        case state is
            when CollectIdle =>
                state_next <= WriteLeft when new_blocks = '1' else CollectIdle;
                done <= '1';
            when Collect =>
                state_next <= WriteLeft when new_blocks = '1' else Collect;
            when WriteLeft =>
                state_next <= WriteRight when granted  = '1' else WriteLeft;
                request <= '1';
            when WriteRight =>
                if granted = '1' then
                    x_reg_next <= (others => '0') when x_reg = to_unsigned(87,16) else x_reg + 1;
                    address_reg_next <= address_reg + to_unsigned(89,16) when x_reg = to_unsigned(87,16) else address_reg + 1;
                    if address_reg = to_unsigned(25255, 16) then
                        state_next <= CollectIdle;
                    else
                        state_next <= Collect;
                    end if;
                else
                    state_next <= WriteRight;
                end if;
                request <= '1';
                address <= std_logic_vector(address_reg + to_unsigned(88,16));
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
            address_reg <= (others => '0') when reset = '1' else address_reg_next;
            x_reg <= (others => '0') when reset = '1' else x_reg_next;
        end if;
    end process;




end architecture;
    
    
    
    
--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;
--use ieee.std_logic_unsigned.all;
--use work.types.all;


--entity Writer is
--    port(
--        clock: in std_logic;
--        reset: in std_logic;

--        pixel_left: in byte_t;
--        pixel_right: in byte_t;
--        valid: in std_logic;
    
--        done: out std_logic;

--        request: out bit_t;
--        granted: in bit_t;
--        address   : out halfword_t;
--        write_data : out word_t
--    );
--end entity;

--architecture Behavioral of Writer is

--    type state_type is(pipeline, write1, write2);
--    signal state, next_state: state_type;
--    signal sr1, sr1_next, sr2, sr2_next, word1, word2 : std_logic_vector(31 downto 0);
--    signal valid_count, valid_count_next : std_logic_vector(1 downto 0);
--    signal address_next : std_logic_vector(15 downto 0);


--begin
    
--    combinatorial : process(all)
--        begin
--            sr1_next <= sr1;
--            sr2_next <= sr2;
--            valid_count_next <= valid_count;
--            next_state <= state;
--            request <= '0';
--            address_next <= address;
--            write_data <= word1;
--            sr1_next <= sr1;
--            sr2_next <= sr2;
                    
--            if(valid) then
--                sr1_next <= sr1(31 downto 8) & pixel_right;
--                sr2_next <= sr2(31 downto 8) & pixel_left;
--                valid_count_next <= valid_count + 1;
--            end if;
                
--            if(address = "1100010111111111") then
--                done <= '1';
--                address <= "0110001100000000";
--                next_state <= pipeline;
--                valid_count_next <= "00";
                
--            end if;
            
--            case state is
--                when pipeline =>
--                    if(valid_count = "11") then
--                        next_state <= write1;
--                    end if;
                
--                when write1 =>
--                    request <= '1';
--                    if(granted = '1') then
--                        next_state <= write2;
--                        address_next <= address + "100000";
--                    end if;
                
--                when write2 =>
--                    write_data <= word2;
--                    address_next <= address + "100000";
--                    next_state <= pipeline;
                    
--            end case;
--        end process combinatorial;
    
    
--    sequential : process(clock)
--        begin
--        if(rising_edge(clock)) then
--            sr1 <= sr1_next;
--            sr2 <= sr2_next;
--            if reset = '1' then
--                address <= "0110001100000000";
--                state <= pipeline;
--                valid_count <= "00";
--                word1 <= (others => '0');
--                word2 <= (others => '0');
                            
--            else
--                address <= address_next;
--                state <= next_state;
--                valid_count <= valid_count_next;
--                if(valid_count = "11") then
--                    word1 <= sr1;
--                    word2 <= sr2;
--                else
--                    word1 <= word1;
--                    word2 <= word2;
--                end if;
                
--            end if;
--        end if;
    
--    end process sequential;               



--end architecture;
