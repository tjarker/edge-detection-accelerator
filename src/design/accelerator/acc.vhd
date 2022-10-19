-- -----------------------------------------------------------------------------
--
--  Title      :  Edge-Detection design project - task 2.
--             :
--  Developers :  YOUR NAME HERE - s??????@student.dtu.dk
--             :  YOUR NAME HERE - s??????@student.dtu.dk
--             :
--  Purpose    :  This design contains an entity for the accelerator that must be build
--             :  in task two of the Edge Detection design project. It contains an
--             :  architecture skeleton for the entity as well.
--             :
--  Revision   :  1.0   ??-??-??     Final version
--             :
--
-- -----------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- The entity for task two. Notice the additional signals for the memory.
-- reset is active high.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;

entity acc is
    port(
        clk    : in  bit_t;             -- The clock.
        reset  : in  bit_t;             -- The reset signal. Active high.
        addr   : out halfword_t;        -- Address bus for data.
        dataR  : in  word_t;            -- The data bus.
        dataW  : out word_t;            -- The data bus.
        en     : out bit_t;             -- Request signal for data.
        we     : out bit_t;             -- Read/Write signal for data.
        start  : in  bit_t;
        finish : out bit_t
    );
end acc;

--------------------------------------------------------------------------------
-- The desription of the accelerator.
--------------------------------------------------------------------------------

architecture rtl of acc is

    type state_type is ( idle, request, receive, invert, write, done );

    signal state, next_state: state_type;

    signal read_pointer, next_read_pointer, write_pointer, next_write_pointer: unsigned(15 downto 0);
    signal data, next_data: word_t;

begin

    process(all) begin
        addr <= std_logic_vector(read_pointer);
        dataW <= data;
        en <= '0';
        we <= '0';
        finish <= '0';
        next_data <= data;
        next_read_pointer <= read_pointer;
        next_write_pointer <= write_pointer;

        case state is
            when idle =>
                next_state <= request when start = '1' else idle;
            when request =>
                en <= '1';
                next_state <= receive;
            when receive =>
                next_data <= dataR;
                next_state <= invert;
            when invert =>
                next_data <= not data;
                next_state <= write;
            when write =>
                en <= '1';
                we <= '1';
                addr <= std_logic_vector(write_pointer);
                next_read_pointer <= read_pointer + x"0001";
                next_write_pointer <= write_pointer + x"0001";
                next_state <= done when read_pointer = x"62FF" else request;
            when done =>
                finish <= '1';
                next_state <= done;
            when others =>
        end case;

    end process;

    process(clk) begin
        if rising_edge(clk) then
            state <= request when reset = '1' else next_state;
            read_pointer <= x"0000" when reset = '1' else next_read_pointer;
            write_pointer <= x"6300" when reset = '1' else next_write_pointer;
            data <= x"00000000" when reset = '1' else next_data;
        end if;
    end process;

end rtl;
