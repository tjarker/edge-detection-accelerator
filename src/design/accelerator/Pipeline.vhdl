library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;

entity Pipeline is
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
end entity;


architecture Behavioral of Pipeline is

    component Fetcher is
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
    end component;
    
    component CoordinateSequencer is
        port(
            clock: in std_logic;
            reset: in std_logic;
    
            start: in std_logic;
            stall: in std_logic;
    
            x: out unsigned(8 downto 0);
            y: out unsigned(8 downto 0);
            valid: out std_logic
        );
    end component;

    component CacheWrapper is
        port(
            clock: in std_logic;
            reset: in std_logic;
    
            write_x: in unsigned(8 downto 0);
            write_y: in unsigned(1 downto 0);
            write_data: in word_t;
            write_enable: in std_logic;
    
            in_x: in unsigned(8 downto 0);
            in_y: in unsigned(8 downto 0);
            in_valid: in std_logic;
    
            out_window: out window_t;
            out_valid: out std_logic
        );
    end component;

    component Convolver is
        port(
            neighborhood: in neighborhood_t;
            pixel: out byte_t
        );
    end component;

    component Writer is
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
    end component;


    signal stall_pipeline: bit_t;
    signal fetcher_using_mem, fetcher_mem_en, writer_mem_request, writer_mem_granted: bit_t;
    signal fetcher_address, writer_address: halfword_t;

    signal cache_write_x: unsigned(8 downto 0);
    signal cache_write_y: unsigned(1 downto 0);
    signal cache_write_enable: bit_t;
    signal cache_write_data: word_t;

    signal cache_read_window: window_t;
    signal cache_read_valid: bit_t;

    signal seq_valid: bit_t;
    signal seq_x, seq_y: unsigned(8 downto 0);

    signal left_neighborhood, right_neighborhood: neighborhood_t;
    signal left_pixel, right_pixel: byte_t;
    signal pixel_valid: bit_t;

begin

    fetch: Fetcher port map(
        clock => clock,
        reset => reset,
        start => fetcher_start,
        done => fetcher_done,
        stall => stall_pipeline,
        using_memory => fetcher_using_mem,
        en => fetcher_mem_en,
        address => fetcher_address,
        read_data => mem_read_data,
        cache_x => cache_write_x,
        cache_y => cache_write_y,
        cache_write => cache_write_enable,
        cache_data => cache_write_data
    );

    coords: CoordinateSequencer port map(
        clock => clock,
        reset => reset,
        start => sequencer_start,
        stall => stall_pipeline,
        x => seq_x,
        y => seq_y,
        valid => seq_valid
    );

    cache: CacheWrapper port map(
        clock => clock,
        reset => reset,
        write_x => cache_write_x,
        write_y => cache_write_y,
        write_data => cache_write_data,
        write_enable => cache_write_enable,
        in_x => seq_x,
        in_y => seq_y,
        in_valid => seq_valid,
        out_window => cache_read_window,
        out_valid => cache_read_valid
    );

    conv0: Convolver port map(
        neighborhood => left_neighborhood,
        pixel => left_pixel
    );

    conv1: Convolver port map(
        neighborhood => right_neighborhood,
        pixel => right_pixel
    );

    write: Writer port map(
        clock => clock,
        reset => reset,
        pixel_left => left_pixel,
        pixel_right => right_pixel,
        valid => cache_read_valid,
        done => writer_done,
        request => writer_mem_request,
        granted => writer_mem_granted,
        address => writer_address,
        write_data => mem_write_data
    );


    left_neighborhood(0,0) <= cache_read_window(0,0);
    left_neighborhood(0,1) <= cache_read_window(0,1);
    left_neighborhood(0,2) <= cache_read_window(0,2);
    left_neighborhood(1,0) <= cache_read_window(1,0);
    left_neighborhood(1,1) <= cache_read_window(1,1);
    left_neighborhood(1,2) <= cache_read_window(1,2);
    left_neighborhood(2,0) <= cache_read_window(2,0);
    left_neighborhood(2,1) <= cache_read_window(2,1);
    left_neighborhood(2,2) <= cache_read_window(2,2);
    
    right_neighborhood(0,0) <= cache_read_window(1,0);
    right_neighborhood(0,1) <= cache_read_window(1,1);
    right_neighborhood(0,2) <= cache_read_window(1,2);
    right_neighborhood(1,0) <= cache_read_window(2,0);
    right_neighborhood(1,1) <= cache_read_window(2,1);
    right_neighborhood(1,2) <= cache_read_window(2,2);
    right_neighborhood(2,0) <= cache_read_window(3,0);
    right_neighborhood(2,1) <= cache_read_window(3,1);
    right_neighborhood(2,2) <= cache_read_window(3,2);


    process(all) begin
        mem_enable <= writer_mem_request or fetcher_mem_en;
        writer_mem_granted <= not fetcher_using_mem;
        
        if writer_mem_request = '1' and fetcher_using_mem = '0' then
            mem_address <= writer_address;
            mem_write <= '1';
        else
            mem_address <= fetcher_address;
            mem_write <= '0';
        end if;

    end process;
   
    

    

    
    
    
end architecture;