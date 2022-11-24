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

    type state_type is ( idle, delay0, delay1, delay2, busy, finished );

    signal state, next_state: state_type;


    component Pipeline is
        port(
            clock: in  bit_t;
            reset: in  bit_t;
    
            -- memory port
            mem_enable: out bit_t;
            mem_address: out halfword_t;
            mem_read_data: in  word_t;
            mem_write_data: out word_t;
            mem_write: out bit_t;
    
            fetcher_start: in bit_t;
            fetcher_done: out bit_t;
    
            sequencer_start: in bit_t;
    
            writer_done: out bit_t        
        );
    end component;

    signal fetcher_start, fetcher_done: bit_t;
    signal sequencer_start: bit_t;
    signal writer_done: bit_t;

begin

    pipe: Pipeline port map(
        clock => clk,
        reset => reset,
        mem_enable => en,
        mem_address => addr,
        mem_read_data => dataR,
        mem_write_data => dataW,
        mem_write => we,
        fetcher_start => fetcher_start,
        fetcher_done => fetcher_done,
        sequencer_start => sequencer_start,
        writer_done => writer_done
    );

    process(all) begin

        fetcher_start <= '0';
        sequencer_start <= '0';
        finish <= '0';
        next_state <= state;

        case state is
            when idle =>
                fetcher_start <= start;
                next_state <= delay1 when start = '1' else idle;
            when delay0 =>
                next_state <= delay1;
            when delay1 =>
                next_state <= delay2;
            when delay2 =>
                sequencer_start <= '1';
                next_state <= busy;
            when busy =>
                next_state <= finished when writer_done = '1' else busy;
            when finished =>
                finish <= '1';
                next_state <= delay0 when start = '1' else finished;
            when others =>
        end case;

    end process;

    process(clk) begin
        if rising_edge(clk) then
            state <= idle when reset = '1' else next_state;
        end if;
    end process;

end rtl;
