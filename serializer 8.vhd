--Swiftlink Technologies Inc.
--VHDL Progam for SPI signal generation for SLW5008
--Created by: Donuwan Navaratne
--Date: May 13, 2025
--Rev 0.0

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_misc.all;

-- Top-level entity
ENTITY serializer IS
PORT (
clk_50 : IN STD_LOGIC ; -- 50MHz system clock
clk_in : IN STD_LOGIC ; -- slow data clock
rst : IN STD_LOGIC ;
transmit : IN STD_LOGIC ;
SW_in : IN STD_LOGIC_VECTOR(9 downto 0);

Rx_QPS_1_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_1_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_1_in : IN STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_1_in : IN STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_1_in : IN STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_1_in : IN STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_1_in : IN STD_LOGIC;
Tx_SW_1_in : IN STD_LOGIC;
Rx_EN_1_in : IN STD_LOGIC;
Tx_EN_1_in : IN STD_LOGIC;
Rx_VGA_B_1_in : IN STD_LOGIC_VECTOR(3 downto 0);
LNA_B_1_in : IN STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_1_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR1_B_1_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR2_B_1_in : IN STD_LOGIC_VECTOR(3 downto 0);
PA_B_1_in : IN STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_2_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_2_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_2_in : IN STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_2_in : IN STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_2_in : IN STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_2_in : IN STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_2_in : IN STD_LOGIC;
Tx_SW_2_in : IN STD_LOGIC;
Rx_EN_2_in : IN STD_LOGIC;
Tx_EN_2_in : IN STD_LOGIC;
Rx_VGA_B_2_in : IN STD_LOGIC_VECTOR(3 downto 0);
LNA_B_2_in : IN STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_2_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR1_B_2_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR2_B_2_in : IN STD_LOGIC_VECTOR(3 downto 0);
PA_B_2_in : IN STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_3_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_3_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_3_in : IN STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_3_in : IN STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_3_in : IN STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_3_in : IN STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_3_in : IN STD_LOGIC;
Tx_SW_3_in : IN STD_LOGIC;
Rx_EN_3_in : IN STD_LOGIC;
Tx_EN_3_in : IN STD_LOGIC;
Rx_VGA_B_3_in : IN STD_LOGIC_VECTOR(3 downto 0);
LNA_B_3_in : IN STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_3_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR1_B_3_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR2_B_3_in : IN STD_LOGIC_VECTOR(3 downto 0);
PA_B_3_in : IN STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_4_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_4_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_4_in : IN STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_4_in : IN STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_4_in : IN STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_4_in : IN STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_4_in : IN STD_LOGIC;
Tx_SW_4_in : IN STD_LOGIC;
Rx_EN_4_in : IN STD_LOGIC;
Tx_EN_4_in : IN STD_LOGIC;
Rx_VGA_B_4_in : IN STD_LOGIC_VECTOR(3 downto 0);
LNA_B_4_in : IN STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_4_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR1_B_4_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR2_B_4_in : IN STD_LOGIC_VECTOR(3 downto 0);
PA_B_4_in : IN STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_5_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_5_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_5_in : IN STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_5_in : IN STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_5_in : IN STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_5_in : IN STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_5_in : IN STD_LOGIC;
Tx_SW_5_in : IN STD_LOGIC;
Rx_EN_5_in : IN STD_LOGIC;
Tx_EN_5_in : IN STD_LOGIC;
Rx_VGA_B_5_in : IN STD_LOGIC_VECTOR(3 downto 0);
LNA_B_5_in : IN STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_5_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR1_B_5_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR2_B_5_in : IN STD_LOGIC_VECTOR(3 downto 0);
PA_B_5_in : IN STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_6_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_6_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_6_in : IN STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_6_in : IN STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_6_in : IN STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_6_in : IN STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_6_in : IN STD_LOGIC;
Tx_SW_6_in : IN STD_LOGIC;
Rx_EN_6_in : IN STD_LOGIC;
Tx_EN_6_in : IN STD_LOGIC;
Rx_VGA_B_6_in : IN STD_LOGIC_VECTOR(3 downto 0);
LNA_B_6_in : IN STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_6_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR1_B_6_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR2_B_6_in : IN STD_LOGIC_VECTOR(3 downto 0);
PA_B_6_in : IN STD_LOGIC_VECTOR(3 downto 0);
 
Rx_QPS_7_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_7_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_7_in : IN STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_7_in : IN STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_7_in : IN STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_7_in : IN STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_7_in : IN STD_LOGIC;
Tx_SW_7_in : IN STD_LOGIC;
Rx_EN_7_in : IN STD_LOGIC;
Tx_EN_7_in : IN STD_LOGIC;
Rx_VGA_B_7_in : IN STD_LOGIC_VECTOR(3 downto 0);
LNA_B_7_in : IN STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_7_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR1_B_7_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR2_B_7_in : IN STD_LOGIC_VECTOR(3 downto 0);
PA_B_7_in : IN STD_LOGIC_VECTOR(3 downto 0); 

Rx_QPS_8_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_8_in : IN STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_8_in : IN STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_8_in : IN STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_8_in : IN STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_8_in : IN STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_8_in : IN STD_LOGIC;
Tx_SW_8_in : IN STD_LOGIC;
Rx_EN_8_in : IN STD_LOGIC;
Tx_EN_8_in : IN STD_LOGIC;
Rx_VGA_B_8_in : IN STD_LOGIC_VECTOR(3 downto 0);
LNA_B_8_in : IN STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_8_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR1_B_8_in : IN STD_LOGIC_VECTOR(3 downto 0);
DR2_B_8_in : IN STD_LOGIC_VECTOR(3 downto 0);
PA_B_8_in : IN STD_LOGIC_VECTOR(3 downto 0); 

ENCH1_in : IN STD_LOGIC;
ENCH2_in : IN STD_LOGIC;
ENCH3_in : IN STD_LOGIC;
ENCH4_in : IN STD_LOGIC; 
ENCH5_in : IN STD_LOGIC;
ENCH6_in : IN STD_LOGIC;
ENCH7_in : IN STD_LOGIC;
ENCH8_in : IN STD_LOGIC;


--Data_delay_in : IN STD_LOGIC_VECTOR(4 downto 0);
Dbit : OUT STD_LOGIC;
Dclk : OUT STD_LOGIC;
Dlatch : OUT STD_LOGIC;
clk_out : OUT STD_LOGIC;
Dloop : OUT STD_LOGIC
) ;
END serializer ;

--Behaviour of the encoder
ARCHITECTURE Behavioral OF serializer IS

constant TRANSMIT_TIME : integer := 1000;
constant CLK_DIV : integer := 4;  		-- 50MHz/4 = 12.5MHz
constant TOTAL_BITS : integer := 440;
constant START_DELAY : integer := 2;	-- Optional small delay after load	

signal clk_div_cnt : integer range 0 to (2 * CLK_DIV - 1) := 0;
signal clk: STD_LOGIC;
signal clock_50 : STD_LOGIC;
signal shift_reg : STD_LOGIC_VECTOR(439 downto 0) := (others => '0');
signal data_in : STD_LOGIC_VECTOR(439 downto 0);
signal ch1_in : STD_LOGIC_VECTOR(53 downto 0);
signal ch2_in : STD_LOGIC_VECTOR(53 downto 0);
signal ch3_in : STD_LOGIC_VECTOR(53 downto 0);
signal ch4_in : STD_LOGIC_VECTOR(53 downto 0);
signal ch5_in : STD_LOGIC_VECTOR(53 downto 0);
signal ch6_in : STD_LOGIC_VECTOR(53 downto 0);
signal ch7_in : STD_LOGIC_VECTOR(53 downto 0);
signal ch8_in : STD_LOGIC_VECTOR(53 downto 0);
signal ENCH_in : STD_LOGIC_VECTOR(7 downto 0);
signal enable: STD_LOGIC;
--signal ps_counter_reset : STD_LOGIC;
signal bit_cnt : INTEGER range 0 to TOTAL_BITS := 0; 
signal delay_counter : INTEGER range 0 to START_DELAY := 0;
signal clk_gen_active : STD_LOGIC := '0';
signal clk_phase : STD_LOGIC := '0';	-- 0 = prepare bit, 1 = clk high phase
signal shifting : STD_LOGIC := '0';
signal counter : INTEGER range 0 to 35 := 0;
signal serial_clk_i : STD_LOGIC:= '0';
signal start : STD_LOGIC := '0';	  
--signal clk_enable : STD_LOGIC := '0'; 	-- Enables clock toggling during transmit
signal load : STD_LOGIC := '0'; 			-- Manual load trigger
signal delay_done : STD_LOGIC := '0'; 	-- Tracks 1-cycle delay after load 
signal done_waiting : STD_LOGIC := '0';
signal done_wait_count : INTEGER range 0 to 100 := 0;
signal rst_mode : STD_LOGIC := '0';
signal start_transfer : STD_LOGIC := '0';
signal clk_i_phase : STD_LOGIC := '0';
signal transmit_toggle_fast : STD_LOGIC := '0';
signal transmit_counter : integer range 0 to TRANSMIT_TIME-1 := 0;
signal transmit_limit : integer range 0 to TRANSMIT_TIME-1:= 0;
--signal transmit_counter : STD_LOGIC := '0';
signal toggle_sync_0 : STD_LOGIC := '0';
signal toggle_sync_1 : STD_LOGIC := '0';
signal toggle_prev : STD_LOGIC := '0';
signal transmit_rst : STD_LOGIC := '0';

--signal data_delay : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
--signal data_delay_counter : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');

begin 

--clk_div_cnt <=  3;
clk <= clk_in;
clock_50 <= clk_50;
enable <= '1';
--ps_counter_reset <= '0';
--load <= transmit;
--load <= '0';

process(clock_50) 
begin
    if rising_edge(clock_50) then
        if transmit_rst = '1' then
            load <= '0';
            transmit_counter <= 0;
         --   transmit_rst <= '0'; 
        elsif transmit = '1' and transmit_counter < TRANSMIT_TIME then
            load <= '1';
            transmit_counter <= transmit_counter + 1;
         elsif load = '1' and transmit_counter < TRANSMIT_TIME then
            transmit_counter <= transmit_counter + 1;   
         elsif load = '1' and transmit_counter > TRANSMIT_TIME - 1  then
 --        elsif load = '1' and rising_edge(clk)  then   
            load <= '0';
            transmit_counter <= 0; 
       --  else
       --  load <= '0'; 
        end if;
 --   load <= '1';
 --  elsif transmit = '0' then
 --   load <= '0';
    end if;
end process;     
 
process(clk) 
begin
    if rising_edge(clk) then
        if load = '1' then
        transmit_rst <= '1';
--        load <= '0';
--    --    transmit_counter <= TRANSMIT_TIME;
--        transmit_limit <= 1;
        elsif load = '0' and transmit = '0' then
        transmit_rst <= '0';
        end if;    
        
 end if;
 end process;
 
        
-- process(clk)
-- begin 
--    if rising_edge(clk) then
--        toggle_sync_0 <= transmit_toggle_fast;
--        toggle_sync_1 <= toggle_sync_0;
     -- Detect change in toggle 
--        if toggle_sync_1 /= toggle_prev then
--            load <= '1';
--        else 
--            load <= '0';
--        end if;
        
--        toggle_prev <= toggle_sync_1;
--    end if;
-- end process;   
            
--data_delay <= Data_delay_in;

-- Control logic
--process(rst)
--begin
--if rising_edge(rst) then
--		--Begin reset-mode: transmit 36 zeros
--		clk_div_cnt <= 0;
--		clk_phase <= '0';
--		serial_clk_i <= '0';
--		clk_gen_active <= '0';
--		delay_counter <= 0;
--		shift_reg <= (others => '0'); -- all zeros
--		Dbit <= '0';
--		bit_cnt <= 1;
--		--shifting <= '0';
--		--clk_enable <= '0';
--		delay_done <= '0';
--		done_waiting <= '0';
--		done_wait_count <= 0;
--		rst_mode <= '1'; 					-- flag reset-mode
--		start_transfer <= '1';			--begin after delay
--else 
--rst_mode <= '0';
--end if;
--end process;

ch1_in <= Rx_QPS_1_in & Rx_IPS_1_in & Rx_VGA_1_in & Tx_QPS_1_in & Tx_IPS_1_in & Tx_VGA_1_in & Rx_SW_1_in & Tx_SW_1_in & Rx_EN_1_in & Tx_EN_1_in & Rx_VGA_B_1_in & LNA_B_1_in & Tx_VGA_B_1_in & DR1_B_1_in & DR2_B_1_in & PA_B_1_in;
ch2_in <= Rx_QPS_2_in & Rx_IPS_2_in & Rx_VGA_2_in & Tx_QPS_2_in & Tx_IPS_2_in & Tx_VGA_2_in & Rx_SW_2_in & Tx_SW_2_in & Rx_EN_2_in & Tx_EN_2_in & Rx_VGA_B_2_in & LNA_B_2_in & Tx_VGA_B_2_in & DR1_B_2_in & DR2_B_2_in & PA_B_2_in;
ch3_in <= Rx_QPS_3_in & Rx_IPS_3_in & Rx_VGA_3_in & Tx_QPS_3_in & Tx_IPS_3_in & Tx_VGA_3_in & Rx_SW_3_in & Tx_SW_3_in & Rx_EN_3_in & Tx_EN_3_in & Rx_VGA_B_3_in & LNA_B_3_in & Tx_VGA_B_3_in & DR1_B_3_in & DR2_B_3_in & PA_B_3_in;
ch4_in <= Rx_QPS_4_in & Rx_IPS_4_in & Rx_VGA_4_in & Tx_QPS_4_in & Tx_IPS_4_in & Tx_VGA_4_in & Rx_SW_4_in & Tx_SW_4_in & Rx_EN_4_in & Tx_EN_4_in & Rx_VGA_B_4_in & LNA_B_4_in & Tx_VGA_B_4_in & DR1_B_4_in & DR2_B_4_in & PA_B_4_in;
ch5_in <= Rx_QPS_5_in & Rx_IPS_5_in & Rx_VGA_5_in & Tx_QPS_5_in & Tx_IPS_5_in & Tx_VGA_5_in & Rx_SW_5_in & Tx_SW_5_in & Rx_EN_5_in & Tx_EN_5_in & Rx_VGA_B_5_in & LNA_B_5_in & Tx_VGA_B_5_in & DR1_B_5_in & DR2_B_5_in & PA_B_5_in;
ch6_in <= Rx_QPS_6_in & Rx_IPS_6_in & Rx_VGA_6_in & Tx_QPS_6_in & Tx_IPS_6_in & Tx_VGA_6_in & Rx_SW_6_in & Tx_SW_6_in & Rx_EN_6_in & Tx_EN_6_in & Rx_VGA_B_6_in & LNA_B_6_in & Tx_VGA_B_6_in & DR1_B_6_in & DR2_B_6_in & PA_B_6_in;
ch7_in <= Rx_QPS_7_in & Rx_IPS_7_in & Rx_VGA_7_in & Tx_QPS_7_in & Tx_IPS_7_in & Tx_VGA_7_in & Rx_SW_7_in & Tx_SW_7_in & Rx_EN_7_in & Tx_EN_7_in & Rx_VGA_B_7_in & LNA_B_7_in & Tx_VGA_B_7_in & DR1_B_7_in & DR2_B_7_in & PA_B_7_in;
ch8_in <= Rx_QPS_8_in & Rx_IPS_8_in & Rx_VGA_8_in & Tx_QPS_8_in & Tx_IPS_8_in & Tx_VGA_8_in & Rx_SW_8_in & Tx_SW_8_in & Rx_EN_8_in & Tx_EN_8_in & Rx_VGA_B_8_in & LNA_B_8_in & Tx_VGA_B_8_in & DR1_B_8_in & DR2_B_8_in & PA_B_8_in;
ENCH_in <= ENCH8_in & ENCH7_in & ENCH6_in & ENCH5_in & ENCH4_in & ENCH3_in & ENCH2_in & ENCH1_in;

process(clk, rst)
begin
	if rising_edge(clk) then
	--if rst_mode = '1' then
	if rst = '1' then
	--if rising_edge(rst) then
		--Begin reset-mode: transmit 36 zeros
		clk_div_cnt <= 0;
		clk_phase <= '0';
		serial_clk_i <= '0';
--		clk_i_phase <= '0';
		clk_gen_active <= '0';
		delay_counter <= 0;
--		data_delay_counter <= (others => '0');
		shift_reg <= (others => '0'); -- all zeros
		Dbit <= '0';
		bit_cnt <= 1;
		--shifting <= '0';
		--clk_enable <= '0';
		delay_done <= '0';
		done_waiting <= '0';
		done_wait_count <= 0;
		rst_mode <= '1'; 					-- flag reset-mode
		start_transfer <= '1';			--begin after delay
	elsif load = '1' and clk_gen_active = '0' and rst_mode = '0' and start_transfer = '0' then
	--elsif rising_edge(load) and clk_gen_active = '0' and rst_mode = '0' and start_transfer = '0' then
		-- Load all inputs into shift register (MSB first)
		data_in <= ch8_in & ch7_in & ch6_in & ch5_in & ch4_in & ch3_in & ch2_in & ch1_in & ENCH_in;
		shift_reg <= ch8_in & ch7_in & ch6_in & ch5_in & ch4_in & ch3_in & ch2_in & ch1_in & ENCH_in;
		Dbit <= data_in(439); -- First bit
		bit_cnt <= 1;
		--clk_div_cnt <= 0;
		delay_counter <= 0;
		start_transfer <= '1';		-- start delay before output
		--clk_gen_active <= '0';
		--clk_phase <= '0';
		--serial_clk_i <= '0';
		--shifting <= '1';
		--clk_enable <= '0'; -- Wait one cycle before starting clock
		--delay_done <= '0';
		--done_waiting <= '0';
		--done_wait_count <= 0;
	elsif start_transfer = '1' then
			if delay_counter < START_DELAY then
				delay_counter <= delay_counter + 1;
			else
				clk_gen_active <= '1';
				start_transfer <= '0';
			end if;
	
	--elsif delay_counter < START_DELAY then
		--delay_counter <= delay_counter + 1;
	
--	elsif delay_counter = START_DELAY and clk_gen_active = '0' then
	--	clk_gen_active <= '1';
	
--	elsif clk_gen_active = '1' then
	elsif clk_gen_active = '1' and done_waiting = '0' then
			-- Clock division and phase control
			if clk_div_cnt = CLK_DIV - 1 then
				clk_phase <= not clk_phase;
				clk_div_cnt <= 0;
			
			if clk_phase = '0' then
				-- Phase 0: update Dbit before clk rising 
				if bit_cnt < TOTAL_BITS then
					Dbit <= shift_reg(438);
					shift_reg <= shift_reg(438 downto 0) & '0';
					bit_cnt <= bit_cnt + 1;
			--	elsif bit_cnt > TOTAL_BITS - 1 and done_waiting = '0' then 
			else	
					-- All bits sent, begin done wait
					clk_gen_active <= '0';
					serial_clk_i <= '0';
--					clk_i_phase <= serial_clk_i;
 ----                   clk_i_phase <= '0';
					done_waiting <= '1';
					done_wait_count <= 0;
					rst_mode <= '0'; 		-- exit reset mode after done
				end if;
			else
			--elsif clk_phase = '1' then	
				-- Phase 1: generate rising edge of serial_clk_i
				serial_clk_i <= '1';
	----			clk_i_phase <= '1';
--				    if clk_phase = '1' then
--				       clk_i_phase <= '0';
--				    else 
--				    clk_i_phase <= '1';
-- 				    end if;
				    
			end if;
	else
		clk_div_cnt <= clk_div_cnt + 1;
		
		-- Reset serial clock after short high pulse
		if clk_phase = '1' and clk_div_cnt = 1 then
				serial_clk_i <= '0';
--				clk_i_phase <= serial_clk_i;
	----			clk_i_phase <= '0';
		end if;
		end if;
		
		elsif done_waiting = '1' then
			done_wait_count <= done_wait_count + 1;
			
			if done_wait_count = (CLK_DIV *2) then
				-- After 1 serial_clk_i cycle
				delay_done <= '1';
			
--			elsif done_wait_count = (CLK_DIV *2 + CLK_DIV * 8) then
			elsif done_wait_count = (CLK_DIV *2 + CLK_DIV * 20) then
				-- After 4 more serial_clk_i cycles
				delay_done <= '0';
				done_waiting <= '0';
				done_wait_count <= 0;
			end if;
		end if;
		end if;
--end process;

--process(serial_clk_i)
--begin
--    if serial_clk_i = '1' and clk_phase = '1' then
--        clk_i_phase <= '0';
--    else
--        clk_i_phase <= serial_clk_i;
--    end if;




end process;

process(clk_phase)
begin
   if clk_phase = '1' and serial_clk_i = '1' then
        clk_i_phase <= '0';
    else
        clk_i_phase <= serial_clk_i;
    end if;
end process;

--Dclk <= serial_clk_i;
Dclk <= clk_i_phase;
Dlatch <= delay_done;
clk_out <= clk_in;



start <= '1';
process(clk)

begin
	if rising_edge(clk) then
		if start = '1' then
			shifting <= '1';
		end if;
	if shifting = '1' then
		Dloop <= data_in(counter);
		
		if counter = 35 then
			counter <= 0; -- loop back to start
		else
			counter <= counter + 1;
		end if;
	end if;
	end if;
end process;

end Behavioral;
