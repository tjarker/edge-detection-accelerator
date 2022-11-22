library IEEE;
use IEEE.std_logic_1164.all;
use work.types.all;
use IEEE.NUMERIC_STD.ALL;


entity Fetcher is
    port(
        clock: in std_logic;
        reset: in std_logic;

        start: in std_logic;
        done: out std_logic;

        stall: out std_logic;                       -- stall into ppipeline during first line

        using_memory : out STD_LOGIC;               -- for the writer

        en : out STD_LOGIC;                         -- enable main memory
        address: out STD_LOGIC_VECTOR (15 downto 0);   -- reading from main memory 
        read_data : in STD_LOGIC_VECTOR (31 downto 0); -- reading from main memory

        cache_x: out unsigned(8 downto 0);            -- writing to cache
        cache_y: out unsigned(1 downto 0);            -- writing to cache
        cache_write: out bit_t;                         --enable writing to cache
        cache_data  : out STD_LOGIC_VECTOR (31 downto 0) -- writing to cache
    );
end entity;

architecture Behavioral of Fetcher is

type state_type is (Setup_read_1, Setup_read_2, Loop_1st_row_A, Loop_1st_row_B, Loop_1st_row_C, 
 Loop_1st_row_DW,  Loop_1st_row_EW, Mainloop_switchrow, Mainloop_A, Mainloop_B, Mainloop_C, 
 Mainloop_switch_column, Loop_last_row_A, Loop_last_row_B,Loop_last_row_C, Loop_last_row_D, ending); -- Input your own state names
signal width : unsigned(8 downto 0) := ("001011000");
signal widthdec : unsigned(8 downto 0) := ("001010111");
signal width2dec : unsigned(8 downto 0) := ("010101111");
signal height : unsigned(8 downto 0) := ("100100000");
signal heightdecdec : unsigned(8 downto 0) := ("100011110");

signal state, next_state : state_type;
signal next_addr_x, next_addr_y : unsigned(8 downto 0);
signal next_next_addr_x, next_next_addr_y : unsigned(8 downto 0);
signal next_addr, current_addr:  unsigned (15 downto 0);
signal net:  STD_LOGIC_VECTOR (16 downto 0);
signal current_addr_x, current_addr_y:  unsigned (8 downto 0);
signal un_x, un_y: unsigned(8 downto 0);

begin
comb : process (state, current_addr, current_addr_x, current_addr_y, start, next_addr, next_addr_x, next_addr_y, read_data, 
width, widthdec, width2dec, heightdecdec) 
begin
next_addr_x <=  current_addr_x;
next_addr_y <= current_addr_y; 
next_addr <= current_addr;
done <= '0';
stall <= '0';
cache_data <= read_data;
en <= '1';
using_memory <= '1';
cache_write <= '0';
case(state) is
    when Setup_read_1 => 
        if(start = '1') then
            next_addr_y <= current_addr_y + 1;
            next_addr <= current_addr + width;
            next_state <= Setup_read_2;
        else
            using_memory <= '0';
            next_state <= Setup_read_1;
        end if;
    when Setup_read_2 =>
            cache_write <= '1';
            next_addr_y <= current_addr_y + 1;
            next_addr <= current_addr + width;
            next_state <= Loop_1st_row_A;
    when Loop_1st_row_A =>
            if(current_addr_x /= 0) then
                stall <= '1';
                cache_write <= '0';
            else 
                cache_write <= '1';
            end if; 
            next_addr_x <= current_addr_x + 1;
            next_addr_y <= current_addr_y - 2;
            next_addr <= current_addr - width2dec;   
            next_state <= Loop_1st_row_B;
    when Loop_1st_row_B =>    
            cache_write <= '1';
            next_addr_y <= current_addr_y + 1; 
            next_addr <= current_addr + width;
            next_state <= Loop_1st_row_C;
    when Loop_1st_row_C =>    
            cache_write <= '1';
            next_addr_x <= current_addr_x;
            next_addr_y <= current_addr_y + 1; 
            next_addr <= current_addr + width;
            next_state <= Loop_1st_row_DW;
    when Loop_1st_row_DW => 
            cache_write <= '1';
            using_memory <= '0';
            next_state <= Loop_1st_row_EW;
    when Loop_1st_row_EW =>  
            using_memory <= '0';
            if(current_addr_x = widthdec) then
                next_state <= Mainloop_switchrow;
            else
                next_state <= Loop_1st_row_A;
            end if;
      when Mainloop_switchrow =>
            next_addr_x <= (others => '0');
            next_addr_y <= current_addr_y + 1; 
            next_addr <= current_addr + 1;
            next_state <= Mainloop_A;
      when Mainloop_A =>
            cache_write <= '1';
            next_addr_y <= current_addr_y + 1; 
            next_addr <= current_addr + width;
            next_state <= Mainloop_B;
      when Mainloop_B =>
            cache_write <= '1';
            using_memory <= '0';
            next_state <= Mainloop_C;  
      when Mainloop_C => 
            if(current_addr_x = widthdec) then
                 next_state <= Mainloop_switchrow; 
                 if(current_addr_y = heightdecdec) then
                    next_state <= Loop_last_row_A;
                 end if;
            else
                next_state <= Mainloop_switch_column; 
            end if;
            using_memory <= '0';
      when Mainloop_switch_column => 
                next_addr_x <= current_addr_x + 1;
                next_addr_y <= current_addr_y - 1;
                next_addr <= current_addr - widthdec;
                next_state <= Mainloop_A;
       when Loop_last_row_A =>  
                if(current_addr_x = widthdec) then   
                    next_addr_x <= (others => '0');
                else
                    next_addr_x <= current_addr_x + 1;
                end if;
                next_addr <= current_addr + 1; 
                next_state <= Loop_last_row_B;               
       when Loop_last_row_B =>
                cache_write <= '1'; 
                using_memory <= '0';
                next_state <= Loop_last_row_C;
       when Loop_last_row_C =>
                using_memory <= '0';
                next_state <= Loop_last_row_D;
       when Loop_last_row_D =>
                using_memory <= '0';
                if(current_addr_x = widthdec) then
                    next_state <= ending;
                else
                    next_state <= Loop_last_row_A;  
                end if;                   
       when ending =>    
                 done <= '1';   
                 using_memory <= '0';
                 next_state <= ending;                                        
        end case;
   
end process comb;

seq: process(clock)
begin
    if rising_edge(clock) then
        if (reset = '1') then
            current_addr_x <= (others => '0');
            current_addr_y <= (others => '0');
            current_addr <= (others => '0');
            state <= Setup_read_1;
        else
            cache_x <= next_next_addr_x(6 downto 0) & "00";
            cache_y(0) <= next_next_addr_y(0);
            cache_y(1) <= next_next_addr_y(1);
            next_next_addr_y <= next_addr_y;
            next_next_addr_x <= next_addr_x;
            address <= std_logic_vector(next_addr); 
            state <= next_state;
            current_addr_x <= next_addr_x; 
            current_addr_y <= next_addr_y; 
            current_addr <= next_addr;
        end if;
    end if;  

    end process seq;


end architecture;