library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;


entity cache is
    port(
        clock: in std_logic;

        write_x: in coordinate_t;
        write_y: in coordinate_t;
        write_data: in word_t;
        write_enable: in std_logic;

        read_x: in coordinate_t;
        read_block_even: out block_t;
        read_block_odd: out block_t
    );
end entity;

architecture Behavioral of cache is

    type mem_array_t is array (0 to 7, 0 to 43) of word_t;
    signal mem_array: mem_array_t;

    signal write_memory_select: integer range 0 to 7;
    signal write_address, read_address: integer range 0 to 43;

    type mem_out_t is array (0 to 7) of word_t;
    signal read_words: mem_out_t;

begin

    process(all) begin 

        write_memory_select <= to_integer(unsigned(write_x(2) & write_y(1 downto 0)));
        write_address <= to_integer(unsigned(write_x(8 downto 3)));
        read_address <= to_integer(unsigned(read_x(8 downto 3)));

        for i in 0 to 3 loop
            read_block_even(i,0) <= read_words(i)(7 downto 0);
            read_block_even(i,1) <= read_words(i)(15 downto 8);
            read_block_even(i,2) <= read_words(i)(23 downto 16);
            read_block_even(i,3) <= read_words(i)(31 downto 24);
        end loop;

        for i in 0 to 3 loop
            read_block_odd(i,0) <= read_words(i+4)(7 downto 0);
            read_block_odd(i,1) <= read_words(i+4)(15 downto 8);
            read_block_odd(i,2) <= read_words(i+4)(23 downto 16);
            read_block_odd(i,3) <= read_words(i+4)(31 downto 24);
        end loop;

    end process;

    process(clock) begin

        if rising_edge(clock) then

            if write_enable = '1' then 
                mem_array(write_memory_select, write_address) <= write_data;
            end if;

            for i in 0 to 7 loop
                read_words(i) <= mem_array(i, read_address);
            end loop;

        end if;
        

    end process;

end architecture;