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
ENTITY encoder IS
PORT (
clk_in : IN STD_LOGIC ;
PB_in: IN STD_LOGIC_VECTOR(4 downto 0);

Rx_QPS_1 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_1 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_1 : OUT STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_1 : OUT STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_1 : OUT STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_1 : OUT STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_1 : OUT STD_LOGIC;
Tx_SW_1 : OUT STD_LOGIC;
Rx_EN_1 : OUT STD_LOGIC;
Tx_EN_1 : OUT STD_LOGIC;
Rx_VGA_B_1 : OUT STD_LOGIC_VECTOR(3 downto 0);
LNA_B_1 : OUT STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_1 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR1_B_1 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR2_B_1 : OUT STD_LOGIC_VECTOR(3 downto 0);
PA_B_1 : OUT STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_2 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_2 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_2 : OUT STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_2 : OUT STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_2 : OUT STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_2 : OUT STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_2 : OUT STD_LOGIC;
Tx_SW_2 : OUT STD_LOGIC;
Rx_EN_2 : OUT STD_LOGIC;
Tx_EN_2 : OUT STD_LOGIC;
Rx_VGA_B_2 : OUT STD_LOGIC_VECTOR(3 downto 0);
LNA_B_2 : OUT STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_2 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR1_B_2 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR2_B_2 : OUT STD_LOGIC_VECTOR(3 downto 0);
PA_B_2 : OUT STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_3 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_3 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_3 : OUT STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_3 : OUT STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_3 : OUT STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_3 : OUT STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_3 : OUT STD_LOGIC;
Tx_SW_3 : OUT STD_LOGIC;
Rx_EN_3 : OUT STD_LOGIC;
Tx_EN_3 : OUT STD_LOGIC;
Rx_VGA_B_3 : OUT STD_LOGIC_VECTOR(3 downto 0);
LNA_B_3 : OUT STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_3 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR1_B_3 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR2_B_3 : OUT STD_LOGIC_VECTOR(3 downto 0);
PA_B_3 : OUT STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_4 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_4 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_4 : OUT STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_4 : OUT STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_4 : OUT STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_4 : OUT STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_4 : OUT STD_LOGIC;
Tx_SW_4 : OUT STD_LOGIC;
Rx_EN_4 : OUT STD_LOGIC;
Tx_EN_4 : OUT STD_LOGIC;
Rx_VGA_B_4 : OUT STD_LOGIC_VECTOR(3 downto 0);
LNA_B_4 : OUT STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_4 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR1_B_4 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR2_B_4 : OUT STD_LOGIC_VECTOR(3 downto 0);
PA_B_4 : OUT STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_5 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_5 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_5 : OUT STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_5 : OUT STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_5 : OUT STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_5 : OUT STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_5 : OUT STD_LOGIC;
Tx_SW_5 : OUT STD_LOGIC;
Rx_EN_5 : OUT STD_LOGIC;
Tx_EN_5 : OUT STD_LOGIC;
Rx_VGA_B_5 : OUT STD_LOGIC_VECTOR(3 downto 0);
LNA_B_5 : OUT STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_5 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR1_B_5 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR2_B_5 : OUT STD_LOGIC_VECTOR(3 downto 0);
PA_B_5 : OUT STD_LOGIC_VECTOR(3 downto 0);

Rx_QPS_6 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_6 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_6 : OUT STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_6 : OUT STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_6 : OUT STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_6 : OUT STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_6 : OUT STD_LOGIC;
Tx_SW_6 : OUT STD_LOGIC;
Rx_EN_6 : OUT STD_LOGIC;
Tx_EN_6 : OUT STD_LOGIC;
Rx_VGA_B_6 : OUT STD_LOGIC_VECTOR(3 downto 0);
LNA_B_6 : OUT STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_6 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR1_B_6 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR2_B_6 : OUT STD_LOGIC_VECTOR(3 downto 0);
PA_B_6 : OUT STD_LOGIC_VECTOR(3 downto 0);
 
Rx_QPS_7 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_7 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_7 : OUT STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_7 : OUT STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_7 : OUT STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_7 : OUT STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_7 : OUT STD_LOGIC;
Tx_SW_7 : OUT STD_LOGIC;
Rx_EN_7 : OUT STD_LOGIC;
Tx_EN_7 : OUT STD_LOGIC;
Rx_VGA_B_7 : OUT STD_LOGIC_VECTOR(3 downto 0);
LNA_B_7 : OUT STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_7 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR1_B_7 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR2_B_7 : OUT STD_LOGIC_VECTOR(3 downto 0);
PA_B_7 : OUT STD_LOGIC_VECTOR(3 downto 0); 

Rx_QPS_8 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_IPS_8 : OUT STD_LOGIC_VECTOR(4 downto 0);
Rx_VGA_8 : OUT STD_LOGIC_VECTOR(2 downto 0);
Tx_QPS_8 : OUT STD_LOGIC_VECTOR(4 downto 0); 
Tx_IPS_8 : OUT STD_LOGIC_VECTOR(4 downto 0);
Tx_VGA_8 : OUT STD_LOGIC_VECTOR(2 downto 0);
Rx_SW_8 : OUT STD_LOGIC;
Tx_SW_8 : OUT STD_LOGIC;
Rx_EN_8 : OUT STD_LOGIC;
Tx_EN_8 : OUT STD_LOGIC;
Rx_VGA_B_8 : OUT STD_LOGIC_VECTOR(3 downto 0);
LNA_B_8 : OUT STD_LOGIC_VECTOR(3 downto 0);
Tx_VGA_B_8 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR1_B_8 : OUT STD_LOGIC_VECTOR(3 downto 0);
DR2_B_8 : OUT STD_LOGIC_VECTOR(3 downto 0);
PA_B_8 : OUT STD_LOGIC_VECTOR(3 downto 0); 

ENCH1 : OUT STD_LOGIC;
ENCH2 : OUT STD_LOGIC;
ENCH3 : OUT STD_LOGIC;
ENCH4 : OUT STD_LOGIC; 
ENCH5 : OUT STD_LOGIC;
ENCH6 : OUT STD_LOGIC;
ENCH7 : OUT STD_LOGIC;
ENCH8 : OUT STD_LOGIC;
 
Data_delay_out : OUT STD_LOGIC_VECTOR(4 downto 0);
Clk_delay_out : OUT STD_LOGIC_VECTOR(4 downto 0);
HEX_out : out STD_LOGIC_VECTOR(6 downto 0);
--HEX1_out : out STD_LOGIC_VECTOR(6 downto 0);
--HEX2_out : out STD_LOGIC_VECTOR(6 downto 0);
--HEX3_out : out STD_LOGIC_VECTOR(6 downto 0);
--HEX4_out : out STD_LOGIC_VECTOR(6 downto 0);
--HEX5_out : out STD_LOGIC_VECTOR(6 downto 0);
Anode_ctrl_out : out STD_LOGIC_VECTOR(5 downto 0);
dec_pt_out : out STD_LOGIC; -- Decimal point (active low)
reset_enc : out STD_LOGIC;
transmit_enc : out STD_LOGIC
) ;
END encoder ;


--Behaviour of the encoder
ARCHITECTURE Behavioral OF encoder IS

--Constants
constant DEBOUNCE_TIME : integer := 250000; -- ~5ms at 50MHz 
constant NUM_COUNTERS : integer := 26;

type button_state is record
	sync : std_logic_vector(1 downto 0);
	button_stable : std_logic;
	counter : integer range 0 to DEBOUNCE_TIME;
	edge : std_logic;	
	prev : std_logic;
end record;

signal rst_btn, upp_btn, dwn_btn, sel_btn, transmit_btn : button_state := (
		sync => (others => '0'),
		button_stable => '0',
		counter => 0,
		edge => '0',
		prev => '0'
);

signal current_index : integer range 0 to NUM_COUNTERS-1 := 0;

--Control signals 

--signal counter_Rx_SW : STD_LOGIC := '0';
--signal counter_Tx_SW : STD_LOGIC := '0';
--signal counter_Rx_EN : STD_LOGIC := '0';
--signal counter_Tx_EN : STD_LOGIC := '0';

--Mixed-width counters
signal counter_Rx_QPS : unsigned(4 downto 0) := (others => '0');
signal counter_Rx_IPS : unsigned(4 downto 0) := (others => '0');
signal counter_Rx_VGA : unsigned(2 downto 0) := (others => '0');
signal counter_Tx_QPS : unsigned(4 downto 0) := (others => '0');
signal counter_Tx_IPS : unsigned(4 downto 0) := (others => '0');
signal counter_Tx_VGA : unsigned(2 downto 0) := (others => '0');
signal counter_Rx_VGA_B : unsigned(3 downto 0) := (others => '0');
signal counter_LNA_B : unsigned(3 downto 0) := (others => '0');
signal counter_Tx_VGA_B : unsigned(3 downto 0) := (others => '0');
signal counter_DR1_B : unsigned(3 downto 0) := (others => '0');
signal counter_DR2_B : unsigned(3 downto 0) := (others => '0');
signal counter_PA_B : unsigned(3 downto 0) := (others => '0');
signal counter_Rx_SW : unsigned(1 downto 0) := (others => '0');
signal counter_Tx_SW : unsigned(1 downto 0) := (others => '0');
signal counter_Rx_EN : unsigned(1 downto 0) := (others => '0');
signal counter_Tx_EN : unsigned(1 downto 0) := (others => '0');
signal counter_ENCH1 : unsigned(1 downto 0) := (others => '0');
signal counter_ENCH2 : unsigned(1 downto 0) := (others => '0');
signal counter_ENCH3 : unsigned(1 downto 0) := (others => '0');
signal counter_ENCH4 : unsigned(1 downto 0) := (others => '0');
signal counter_ENCH5 : unsigned(1 downto 0) := (others => '0');
signal counter_ENCH6 : unsigned(1 downto 0) := (others => '0');
signal counter_ENCH7 : unsigned(1 downto 0) := (others => '0');
signal counter_ENCH8 : unsigned(1 downto 0) := (others => '0');
signal counter_I : unsigned(4 downto 0) := (others => '0');
signal counter_J : unsigned(4 downto 0) := (others => '0');

signal HEX0_out : std_logic_vector(6 downto 0) := (others => '0');
signal HEX1_out : std_logic_vector(6 downto 0) := (others => '0');
signal HEX2_out : std_logic_vector(6 downto 0) := (others => '0');
signal HEX3_out : std_logic_vector(6 downto 0) := (others => '0');
signal HEX4_out : std_logic_vector(6 downto 0) := (others => '0');
signal HEX5_out : std_logic_vector(6 downto 0) := (others => '0');

signal wraparound_flag : std_logic := '0';
--type counter_array is array (0 to NUM_COUNTERS-1) of unsigned(5 downto 0);
--signal counters : counter_array := (others => (others => '0'));
signal Rx_QPS_ctrl: STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_ctrl: STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_ctrl : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_ctrl : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_IPS_ctrl : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_ctrl : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_VGA_B_ctrl : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_ctrl : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_ctrl : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_ctrl : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_ctrl : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_ctrl : STD_LOGIC_VECTOR(3 downto 0);
signal delay_ctrl : STD_LOGIC_VECTOR(4 downto 0);
signal clk_delay_ctrl : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_SW_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal Tx_SW_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal Rx_EN_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal Tx_EN_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal ENCH1_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal ENCH2_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal ENCH3_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal ENCH4_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal ENCH5_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal ENCH6_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal ENCH7_ctrl : STD_LOGIC_VECTOR(1 downto 0);
signal ENCH8_ctrl : STD_LOGIC_VECTOR(1 downto 0);

--initializing variables
signal clk: STD_LOGIC;

signal refresh_counter : unsigned(15 downto 0) := (others => '0');  -- ~16-bit counter
signal digit_select    : unsigned(2 downto 0) := (others => '0');   -- 0 to 5
signal current_digit   : std_logic_vector(3 downto 0);
signal seg_internal    : std_logic_vector(6 downto 0);

--7-segment decoder
function to_7seg(input : character) return std_logic_vector is
	variable seg : std_logic_vector(6 downto 0);
	
begin 


	case input is
		
		--Digits
		when '0' => seg := "1000000"; -- 0
		when '1' => seg := "1111001"; -- 1
		when '2' => seg := "0100100"; -- 2
		when '3' => seg := "0110000"; -- 3
		when '4' => seg := "0011001"; -- 4
		when '5' => seg := "0010010"; -- 5
		when '6' => seg := "0000010"; -- 6
		when '7' => seg := "1110001"; -- 7
		when '8' => seg := "0000000"; -- 8
		when '9' => seg := "0010000"; -- 9
		
		--Letters A-Z (approximate)
		when 'A' => seg := "0000001";
		when 'B' => seg := "0001010";
		when 'C' => seg := "1000110";
		when 'D' => seg := "0101000";
		when 'E' => seg := "0000110";
		when 'F' => seg := "0000111";
		when 'G' => seg := "1000010";
		when 'H' => seg := "0001011";
		when 'I' => seg := "1111001";
		when 'J' => seg := "1100001";
		when 'K' => seg := "0001101";
		when 'L' => seg := "1001110"; --"0000111"
		when 'M' => seg := "0000001";
		when 'N' => seg := "1000001";
		when 'O' => seg := "1000000";
		when 'P' => seg := "0000101";
		when 'Q' => seg := "0010001"; --"0001000"
		when 'R' => seg := "1000111"; --"0011101"
		when 'S' => seg := "0010010"; --"0010010"
		when 'T' => seg := "0001110";
		when 'U' => seg := "1000001";
		when 'V' => seg := "1001000";
		when 'W' => seg := "0001000"; --"0101010" 
		when 'X' => seg := "0001001";
		when 'Y' => seg := "0011001";
		when 'Z' => seg := "0100100";
		
		
	-- Default (blank)
		when others => seg := "1111111"; -- blank
	end case;
	return seg;
end function;

		
--Debounce procedure
procedure debounce_button(signal raw_input : in std_logic; variable btn : inout button_state) is
	variable input_level : std_logic;

begin 
		--Invert input : active-low becomes active-high
		input_level := not raw_input;
		--Sync
		btn.sync := btn.sync(0) & input_level;
		
		--Debounce
		if btn.sync(1) = btn.button_stable then
			btn.counter := 0;
		else
			btn.counter := btn.counter + 1;
			if btn.counter = DEBOUNCE_TIME then
			btn.button_stable := btn.sync(1);
			btn.counter := 0;
			end if;
		end if;
		
		-- Edge detection
		btn.edge := '0';
		if btn.button_stable = '1' and btn.prev = '0' then
		btn.edge := '1';
		end if;
		btn.prev := btn.button_stable;
end procedure;

begin 

clk <= clk_in;

--process(rst_btn.edge)

--begin
--if rising_edge(rst_btn.edge) then	
--			case current_index is
--			when 0 => counter_A <= (others => '0');
--			when 1 => counter_B <= (others => '0');
--			when 2 => counter_C <= (others => '0');
--			when 3 => counter_D <= (others => '0');
--			when 4 => counter_E <= (others => '0');
--			when others => null;
--		end case;

--end if;
--end process;

process(clk)

variable rst_btn_var, upp_btn_var, dwn_btn_var, sel_btn_var, transmit_btn_var : button_state;

begin

	if rising_edge(clk) then
	
	--Copy signals into variables
	rst_btn_var := rst_btn;
	upp_btn_var := upp_btn;
	dwn_btn_var := dwn_btn;
	sel_btn_var := sel_btn;
	transmit_btn_var := transmit_btn;
	
	--Debounce and detect edges
	debounce_button(PB_in(4), transmit_btn_var);
	debounce_button(PB_in(3), rst_btn_var);
	debounce_button(PB_in(2), sel_btn_var);
	debounce_button(PB_in(1), upp_btn_var);
	debounce_button(PB_in(0), dwn_btn_var);
	
	--Copy variables back into signals
	transmit_btn <= transmit_btn_var;
	rst_btn <= rst_btn_var;
	upp_btn <= upp_btn_var;
	dwn_btn <= dwn_btn_var;
	sel_btn <= sel_btn_var;
	
	
	--Select button cycles through the counters
	if sel_btn.edge = '1' then
			current_index <= (current_index + 1) mod NUM_COUNTERS;
	end if;
		
		wraparound_flag <= '0';

		--if rst_btn.edge = '1' then
		if rst_btn.edge = '1' then	
--			case current_index is
--			when 0 => counter_A <= (others => '0');
--			when 1 => counter_B <= (others => '0');
--			when 2 => counter_C <= (others => '0');
--			when 3 => counter_D <= (others => '0');
--			when 4 => counter_E <= (others => '0');
--			when others => null;
--		end case;
	           counter_Rx_QPS <= (others => '0');
	           counter_Rx_IPS <= (others => '0');
	           counter_Rx_VGA <= (others => '0');
	           counter_Tx_QPS <= (others => '0');
	           counter_Tx_IPS <= (others => '0');
	           counter_Tx_VGA <= (others => '0');
	           counter_Rx_SW <= (others => '0');
	           counter_Tx_SW <= (others => '0');
	           counter_Rx_EN <= (others => '0');
	           counter_Tx_EN <= (others => '0');
	           counter_Rx_VGA_B <= (others => '0');
	           counter_LNA_B <= (others => '0');
	           counter_Tx_VGA_B <= (others => '0');
	           counter_DR1_B <= (others => '0');
	           counter_DR2_B <= (others => '0');
	           counter_PA_B <= (others => '0');
	           counter_ENCH1 <= (others => '0');
	           counter_ENCH2 <= (others => '0');
	           counter_ENCH3 <= (others => '0');
	           counter_ENCH4 <= (others => '0');
	           counter_ENCH5 <= (others => '0');
	           counter_ENCH6 <= (others => '0');
	           counter_ENCH7 <= (others => '0');
	           counter_ENCH8 <= (others => '0');
	           counter_I <= (others => '0');
	           counter_J <= (others => '0');
	           
		elsif upp_btn.edge = '1' then
		case current_index is
			when 0 => if counter_Rx_QPS = "11111" then wraparound_flag <= '1'; end if; counter_Rx_QPS <= counter_Rx_QPS + 1;
			when 1 => if counter_Rx_IPS = "11111" then wraparound_flag <= '1'; end if; counter_Rx_IPS <= counter_Rx_IPS + 1;
			when 2 => if counter_Rx_VGA = "111" then wraparound_flag <= '1'; end if; counter_Rx_VGA <= counter_Rx_VGA + 1;
			when 3 => if counter_Tx_QPS = "11111" then wraparound_flag <= '1'; end if; counter_Tx_QPS <= counter_Tx_QPS + 1;
			when 4 => if counter_Tx_IPS = "11111" then wraparound_flag <= '1'; end if; counter_Tx_IPS <= counter_Tx_IPS + 1;
			when 5 => if counter_Tx_VGA = "111" then wraparound_flag <= '1'; end if; counter_Tx_VGA <= counter_Tx_VGA + 1;
			when 6 => if counter_Rx_SW = "01" then wraparound_flag <= '1'; end if; counter_Rx_SW <= counter_Rx_SW + 1;
			when 7 => if counter_Tx_SW = "01" then wraparound_flag <= '1'; end if; counter_Tx_SW <= counter_Tx_SW + 1;
			when 8 => if counter_Rx_EN = "01" then wraparound_flag <= '1'; end if; counter_Rx_EN <= counter_Rx_EN + 1;
			when 9 => if counter_Tx_EN = "01" then wraparound_flag <= '1'; end if; counter_Tx_EN <= counter_Tx_EN + 1;
			when 10 => if counter_Rx_VGA_B = "1111" then wraparound_flag <= '1'; end if; counter_Rx_VGA_B <= counter_Rx_VGA_B + 1;
			when 11 => if counter_LNA_B = "1111" then wraparound_flag <= '1'; end if; counter_LNA_B <= counter_LNA_B + 1;
			when 12 => if counter_Tx_VGA_B = "1111" then wraparound_flag <= '1'; end if; counter_Tx_VGA_B <= counter_Tx_VGA_B + 1;
			when 13 => if counter_DR1_B = "1111" then wraparound_flag <= '1'; end if; counter_DR1_B <= counter_DR1_B + 1;
			when 14 => if counter_DR2_B = "1111" then wraparound_flag <= '1'; end if; counter_DR2_B <= counter_DR2_B + 1;
			when 15 => if counter_PA_B = "1111" then wraparound_flag <= '1'; end if; counter_PA_B <= counter_PA_B + 1;
			when 16 => if counter_ENCH1 = "01" then wraparound_flag <= '1'; end if; counter_ENCH1 <= counter_ENCH1 + 1;
			when 17 => if counter_ENCH2 = "01" then wraparound_flag <= '1'; end if; counter_ENCH2 <= counter_ENCH2 + 1;
			when 18 => if counter_ENCH3 = "01" then wraparound_flag <= '1'; end if; counter_ENCH3 <= counter_ENCH3 + 1;
			when 19 => if counter_ENCH4 = "01" then wraparound_flag <= '1'; end if; counter_ENCH4 <= counter_ENCH4 + 1;
			when 20 => if counter_ENCH5 = "01" then wraparound_flag <= '1'; end if; counter_ENCH5 <= counter_ENCH5 + 1;
			when 21 => if counter_ENCH6 = "01" then wraparound_flag <= '1'; end if; counter_ENCH6 <= counter_ENCH6 + 1;
			when 22 => if counter_ENCH7 = "01" then wraparound_flag <= '1'; end if; counter_ENCH7 <= counter_ENCH7 + 1;
			when 23 => if counter_ENCH8 = "01" then wraparound_flag <= '1'; end if; counter_ENCH8 <= counter_ENCH8 + 1;
			when 24 => if counter_I = "11111" then wraparound_flag <= '1'; end if; counter_I <= counter_I + 1;
			when 25 => if counter_J = "11111" then wraparound_flag <= '1'; end if; counter_J <= counter_J + 1;
			when others => null;
		end case;
		
		elsif dwn_btn.edge = '1' then
		case current_index is
			when 0 => if counter_Rx_QPS = "00000" then wraparound_flag <= '1'; end if; counter_Rx_QPS <= counter_Rx_QPS - 1;
			when 1 => if counter_Rx_IPS = "00000" then wraparound_flag <= '1'; end if; counter_Rx_IPS <= counter_Rx_IPS - 1;
			when 2 => if counter_Rx_VGA = "000" then wraparound_flag <= '1'; end if; counter_Rx_VGA <= counter_Rx_VGA - 1;
			when 3 => if counter_Tx_QPS = "00000" then wraparound_flag <= '1'; end if; counter_Tx_QPS <= counter_Tx_QPS - 1;
			when 4 => if counter_Tx_IPS = "00000" then wraparound_flag <= '1'; end if; counter_Tx_IPS <= counter_Tx_IPS - 1;
			when 5 => if counter_Tx_VGA = "000" then wraparound_flag <= '1'; end if; counter_Tx_VGA <= counter_Tx_VGA - 1;
			when 6 => if counter_Rx_SW = "00" then wraparound_flag <= '1'; end if; counter_Rx_SW <= counter_Rx_SW - 1;
			when 7 => if counter_Tx_SW = "00" then wraparound_flag <= '1'; end if; counter_Tx_SW <= counter_Tx_SW - 1;
			when 8 => if counter_Rx_EN = "00" then wraparound_flag <= '1'; end if; counter_Rx_EN <= counter_Rx_EN - 1; 
			when 9 => if counter_Tx_EN = "00" then wraparound_flag <= '1'; end if; counter_Tx_EN <= counter_Tx_EN - 1; 
			when 10 => if counter_Rx_VGA_B = "0000" then wraparound_flag <= '1'; end if; counter_Rx_VGA_B <= counter_Rx_VGA_B - 1;
			when 11 => if counter_LNA_B = "0000" then wraparound_flag <= '1'; end if; counter_LNA_B <= counter_LNA_B - 1;
			when 12 => if counter_Tx_VGA_B = "0000" then wraparound_flag <= '1'; end if; counter_Tx_VGA_B <= counter_Tx_VGA_B - 1;
	        when 13 => if counter_DR1_B = "0000" then wraparound_flag <= '1'; end if; counter_DR1_B <= counter_DR1_B - 1;   
			when 14 => if counter_DR2_B = "0000" then wraparound_flag <= '1'; end if; counter_DR2_B <= counter_DR2_B - 1;
			when 15 => if counter_PA_B = "0000" then wraparound_flag <= '1'; end if; counter_PA_B <= counter_PA_B - 1;
			when 16 => if counter_ENCH1 = "00" then wraparound_flag <= '1'; end if; counter_ENCH1 <= counter_ENCH1 - 1;
            when 17 => if counter_ENCH2 = "00" then wraparound_flag <= '1'; end if; counter_ENCH2 <= counter_ENCH2 - 1;
			when 18 => if counter_ENCH3 = "00" then wraparound_flag <= '1'; end if; counter_ENCH3 <= counter_ENCH3 - 1;
			when 19 => if counter_ENCH4 = "00" then wraparound_flag <= '1'; end if; counter_ENCH4 <= counter_ENCH4 - 1;
			when 20 => if counter_ENCH5 = "00" then wraparound_flag <= '1'; end if; counter_ENCH5 <= counter_ENCH5 - 1;
			when 21 => if counter_ENCH6 = "00" then wraparound_flag <= '1'; end if; counter_ENCH6 <= counter_ENCH6 - 1;
			when 22 => if counter_ENCH7 = "00" then wraparound_flag <= '1'; end if; counter_ENCH7 <= counter_ENCH7 - 1;
			when 23 => if counter_ENCH8 = "00" then wraparound_flag <= '1'; end if; counter_ENCH8 <= counter_ENCH8 - 1;
			when 24 => if counter_I = "00000" then wraparound_flag <= '1'; end if; counter_I <= counter_I - 1;
			when 25 => if counter_J = "00000" then wraparound_flag <= '1'; end if; counter_J <= counter_J - 1;
			when others => null;
		end case;
		end if;
	end if;

reset_enc <=  rst_btn.edge;
transmit_enc <= transmit_btn.edge;
	
end process;

--Map outputs
Rx_QPS_ctrl <= std_logic_vector(counter_Rx_QPS);
Rx_IPS_ctrl <= std_logic_vector(counter_Rx_IPS);
Rx_VGA_ctrl <= std_logic_vector(counter_Rx_VGA);
Tx_QPS_ctrl <= std_logic_vector(counter_Tx_QPS);
Tx_IPS_ctrl <= std_logic_vector(counter_Tx_IPS);
Tx_VGA_ctrl <= std_logic_vector(counter_Tx_VGA);
Rx_SW_ctrl <= std_logic_vector(counter_Rx_SW);
Tx_SW_ctrl <= std_logic_vector(counter_Tx_SW);
Rx_EN_ctrl <= std_logic_vector(counter_Rx_EN);
Tx_EN_ctrl <= std_logic_vector(counter_Tx_EN);
Rx_VGA_B_ctrl <= std_logic_vector(counter_Rx_VGA_B);
LNA_B_ctrl <= std_logic_vector(counter_LNA_B);
Tx_VGA_B_ctrl <= std_logic_vector(counter_Tx_VGA_B);
DR1_B_ctrl <= std_logic_vector(counter_DR1_B);
DR2_B_ctrl <= std_logic_vector(counter_DR2_B);
PA_B_ctrl <= std_logic_vector(counter_PA_B);
ENCH1_ctrl <= std_logic_vector(counter_ENCH1);
ENCH2_ctrl <= std_logic_vector(counter_ENCH2);
ENCH3_ctrl <= std_logic_vector(counter_ENCH3);
ENCH4_ctrl <= std_logic_vector(counter_ENCH4);
ENCH5_ctrl <= std_logic_vector(counter_ENCH5);
ENCH6_ctrl <= std_logic_vector(counter_ENCH6);
ENCH7_ctrl <= std_logic_vector(counter_ENCH7);
ENCH8_ctrl <= std_logic_vector(counter_ENCH8);
Data_delay_out <= std_logic_vector(counter_I);
Clk_delay_out <= std_logic_vector(counter_J);

Rx_QPS_1 <= Rx_QPS_ctrl;
Rx_IPS_1 <= Rx_IPS_ctrl;
Rx_VGA_1 <= Rx_VGA_ctrl;
Tx_QPS_1 <= Tx_QPS_ctrl;
Tx_IPS_1 <= Tx_IPS_ctrl;
Tx_VGA_1 <= Tx_VGA_ctrl;
Rx_SW_1 <= Rx_SW_ctrl(0);
Tx_SW_1 <= Tx_SW_ctrl(0);
Rx_EN_1 <= Rx_EN_ctrl(0);
Tx_EN_1 <= Tx_EN_ctrl(0);
Rx_VGA_B_1 <= Rx_VGA_B_ctrl;
LNA_B_1 <= LNA_B_ctrl;
Tx_VGA_B_1 <= Tx_VGA_B_ctrl;
DR1_B_1 <= DR1_B_ctrl;
DR2_B_1 <= DR2_B_ctrl;
PA_B_1 <= PA_B_ctrl;

Rx_QPS_2 <= Rx_QPS_ctrl;
Rx_IPS_2 <= Rx_IPS_ctrl;
Rx_VGA_2 <= Rx_VGA_ctrl;
Tx_QPS_2 <= Tx_QPS_ctrl;
Tx_IPS_2 <= Tx_IPS_ctrl;
Tx_VGA_2 <= Tx_VGA_ctrl;
Rx_SW_2 <= Rx_SW_ctrl(0);
Tx_SW_2 <= Tx_SW_ctrl(0);
Rx_EN_2 <= Rx_EN_ctrl(0);
Tx_EN_2 <= Tx_EN_ctrl(0);
Rx_VGA_B_2 <= Rx_VGA_B_ctrl;
LNA_B_2 <= LNA_B_ctrl;
Tx_VGA_B_2 <= Tx_VGA_B_ctrl;
DR1_B_2 <= DR1_B_ctrl;
DR2_B_2 <= DR2_B_ctrl;
PA_B_2 <= PA_B_ctrl;

Rx_QPS_3 <= Rx_QPS_ctrl;
Rx_IPS_3 <= Rx_IPS_ctrl;
Rx_VGA_3 <= Rx_VGA_ctrl;
Tx_QPS_3 <= Tx_QPS_ctrl;
Tx_IPS_3 <= Tx_IPS_ctrl;
Tx_VGA_3 <= Tx_VGA_ctrl;
Rx_SW_3 <= Rx_SW_ctrl(0);
Tx_SW_3 <= Tx_SW_ctrl(0);
Rx_EN_3 <= Rx_EN_ctrl(0);
Tx_EN_3 <= Tx_EN_ctrl(0);
Rx_VGA_B_3 <= Rx_VGA_B_ctrl;
LNA_B_3 <= LNA_B_ctrl;
Tx_VGA_B_3 <= Tx_VGA_B_ctrl;
DR1_B_3 <= DR1_B_ctrl;
DR2_B_3 <= DR2_B_ctrl;
PA_B_3 <= PA_B_ctrl;

Rx_QPS_4 <= Rx_QPS_ctrl;
Rx_IPS_4 <= Rx_IPS_ctrl;
Rx_VGA_4 <= Rx_VGA_ctrl;
Tx_QPS_4 <= Tx_QPS_ctrl;
Tx_IPS_4 <= Tx_IPS_ctrl;
Tx_VGA_4 <= Tx_VGA_ctrl;
Rx_SW_4 <= Rx_SW_ctrl(0);
Tx_SW_4 <= Tx_SW_ctrl(0);
Rx_EN_4 <= Rx_EN_ctrl(0);
Tx_EN_4 <= Tx_EN_ctrl(0);
Rx_VGA_B_4 <= Rx_VGA_B_ctrl;
LNA_B_4 <= LNA_B_ctrl;
Tx_VGA_B_4 <= Tx_VGA_B_ctrl;
DR1_B_4 <= DR1_B_ctrl;
DR2_B_4 <= DR2_B_ctrl;
PA_B_4 <= PA_B_ctrl;

Rx_QPS_5 <= Rx_QPS_ctrl;
Rx_IPS_5 <= Rx_IPS_ctrl;
Rx_VGA_5 <= Rx_VGA_ctrl;
Tx_QPS_5 <= Tx_QPS_ctrl;
Tx_IPS_5 <= Tx_IPS_ctrl;
Tx_VGA_5 <= Tx_VGA_ctrl;
Rx_SW_5 <= Rx_SW_ctrl(0);
Tx_SW_5 <= Tx_SW_ctrl(0);
Rx_EN_5 <= Rx_EN_ctrl(0);
Tx_EN_5 <= Tx_EN_ctrl(0);
Rx_VGA_B_5 <= Rx_VGA_B_ctrl;
LNA_B_5 <= LNA_B_ctrl;
Tx_VGA_B_5 <= Tx_VGA_B_ctrl;
DR1_B_5 <= DR1_B_ctrl;
DR2_B_5 <= DR2_B_ctrl;
PA_B_5 <= PA_B_ctrl;

Rx_QPS_6 <= Rx_QPS_ctrl;
Rx_IPS_6 <= Rx_IPS_ctrl;
Rx_VGA_6 <= Rx_VGA_ctrl;
Tx_QPS_6 <= Tx_QPS_ctrl;
Tx_IPS_6 <= Tx_IPS_ctrl;
Tx_VGA_6 <= Tx_VGA_ctrl;
Rx_SW_6 <= Rx_SW_ctrl(0);
Tx_SW_6 <= Tx_SW_ctrl(0);
Rx_EN_6 <= Rx_EN_ctrl(0);
Tx_EN_6 <= Tx_EN_ctrl(0);
Rx_VGA_B_6 <= Rx_VGA_B_ctrl;
LNA_B_6 <= LNA_B_ctrl;
Tx_VGA_B_6 <= Tx_VGA_B_ctrl;
DR1_B_6 <= DR1_B_ctrl;
DR2_B_6 <= DR2_B_ctrl;
PA_B_6 <= PA_B_ctrl;

Rx_QPS_7 <= Rx_QPS_ctrl;
Rx_IPS_7 <= Rx_IPS_ctrl;
Rx_VGA_7 <= Rx_VGA_ctrl;
Tx_QPS_7 <= Tx_QPS_ctrl;
Tx_IPS_7 <= Tx_IPS_ctrl;
Tx_VGA_7 <= Tx_VGA_ctrl;
Rx_SW_7 <= Rx_SW_ctrl(0);
Tx_SW_7 <= Tx_SW_ctrl(0);
Rx_EN_7 <= Rx_EN_ctrl(0);
Tx_EN_7 <= Tx_EN_ctrl(0);
Rx_VGA_B_7 <= Rx_VGA_B_ctrl;
LNA_B_7 <= LNA_B_ctrl;
Tx_VGA_B_7 <= Tx_VGA_B_ctrl;
DR1_B_7 <= DR1_B_ctrl;
DR2_B_7 <= DR2_B_ctrl;
PA_B_7 <= PA_B_ctrl;

Rx_QPS_8 <= Rx_QPS_ctrl;
Rx_IPS_8 <= Rx_IPS_ctrl;
Rx_VGA_8 <= Rx_VGA_ctrl;
Tx_QPS_8 <= Tx_QPS_ctrl;
Tx_IPS_8 <= Tx_IPS_ctrl;
Tx_VGA_8 <= Tx_VGA_ctrl;
Rx_SW_8 <= Rx_SW_ctrl(0);
Tx_SW_8 <= Tx_SW_ctrl(0);
Rx_EN_8 <= Rx_EN_ctrl(0);
Tx_EN_8 <= Tx_EN_ctrl(0);
Rx_VGA_B_8 <= Rx_VGA_B_ctrl;
LNA_B_8 <= LNA_B_ctrl;
Tx_VGA_B_8 <= Tx_VGA_B_ctrl;
DR1_B_8 <= DR1_B_ctrl;
DR2_B_8 <= DR2_B_ctrl;
PA_B_8 <= PA_B_ctrl;

ENCH1 <= ENCH1_ctrl(0);
ENCH2 <= ENCH2_ctrl(0);
ENCH3 <= ENCH3_ctrl(0);
ENCH4 <= ENCH4_ctrl(0);
ENCH5 <= ENCH5_ctrl(0);
ENCH6 <= ENCH6_ctrl(0);
ENCH7 <= ENCH7_ctrl(0);
ENCH8 <= ENCH8_ctrl(0);

process(all)
	variable value : integer;
	variable tens : character;
	variable ones : character;
	variable L1 : character;
	variable L2 : character;
	variable L3 : character;
	
begin

	-- Determine selected couter's value and label.
	case current_index is 
		when 0 => value := to_integer(counter_Rx_QPS);
					 L1 := 'R';
					 L2 := 'Q';
					 L3 := 'P';
		when 1 => value := to_integer(counter_Rx_IPS);
					 L1 := 'R';
					 L2 := 'I';
					 L3 := 'P';						
		when 2 => value := to_integer(counter_Rx_VGA);
					 L1 := 'R';
					 L2 := 'V';
					 L3 := 'A';	
		when 3 => value := to_integer(counter_Tx_QPS);
					 L1 := 'T';
					 L2 := 'Q';
					 L3 := 'P';	
		when 4 => value := to_integer(counter_Tx_IPS);
					 L1 := 'T';
					 L2 := 'I';
					 L3 := 'P';
		when 5 => value := to_integer(counter_Tx_VGA);
		             L1 := 'T';
		             L2 := 'V';
		             L3 := 'A';
		when 6 => value := to_integer(counter_Rx_SW);
                     L1 := 'R';
		             L2 := 'S';
		             L3 := 'W';
		when 7 => value := to_integer(counter_Tx_SW);
		             L1 := 'T';
		             L2 := 'S';
		             L3 := 'W';		
		when 8 => value := to_integer(counter_Rx_EN);
		             L1 := 'R';
		             L2 := 'E';
		             L3 := 'N';
		when 9 => value := to_integer(counter_Tx_EN);
		             L1 := 'T';
		             L2 := 'E';
		             L3 := 'N';               
		when 10 => value := to_integer(counter_Rx_VGA_B);
		             L1 := 'R';
		             L2 := 'V';
		             L3 := 'B';
		when 11 => value := to_integer(counter_LNA_B);
		             L1 := 'L';
		             L2 := 'A';
		             L3 := 'B';             
	    when 12 => value := to_integer(counter_Tx_VGA_B);
		             L1 := 'T';
		             L2 := 'V';
		             L3 := 'B';
		when 13 => value := to_integer(counter_DR1_B);
		             L1 := 'D';
		             L2 := '1';
		             L3 := 'B';                  
		when 14 => value := to_integer(counter_DR2_B);
		             L1 := 'D';
		             L2 := '2';
		             L3 := 'B';             
	    when 15 => value := to_integer(counter_PA_B);
		             L1 := 'P';
		             L2 := 'A';
		             L3 := 'B';
		when 16 => value := to_integer(counter_ENCH1);
		             L1 := 'E';
		             L2 := 'N';
		             L3 := '1';             
        when 17 => value := to_integer(counter_ENCH2);
		             L1 := 'E';
		             L2 := 'N';
		             L3 := '2';
		when 18 => value := to_integer(counter_ENCH3);
		             L1 := 'E';
		             L2 := 'N';
		             L3 := '3';
		when 19 => value := to_integer(counter_ENCH4);
		             L1 := 'E';
		             L2 := 'N';
		             L3 := '4';
        when 20 => value := to_integer(counter_ENCH5);
		             L1 := 'E';
		             L2 := 'N';
		             L3 := '5';
        when 21 => value := to_integer(counter_ENCH6);
		             L1 := 'E';
		             L2 := 'N';
		             L3 := '6';
		when 22 => value := to_integer(counter_ENCH7);
		             L1 := 'E';
		             L2 := 'N';
		             L3 := '7';
        when 23 => value := to_integer(counter_ENCH8);
		             L1 := 'E';
		             L2 := 'N';
		             L3 := '8';		             		             		                          		             
		when 24 => value := to_integer(counter_I);
		             L1 := 'D';
		             L2 := 'E';
		             L3 := 'L';      
		when 25 => value := to_integer(counter_J);
		             L1 := 'C';
		             L2 := 'K';
		             L3 := 'D';                     
		when others => value := 0;
					 L1 := ' ';
					 L2 := ' ';
					 L3 := ' '; 
	end case;
	
	tens := character'VAL(CHARACTER'POS('0') + (value / 10));
	ones := character'VAL(CHARACTER'POS('0') + (value mod 10));
	
	HEX0_out <= to_7seg(ones);
	HEX1_out <= to_7seg(tens);
	HEX2_out <= to_7seg('0'); -- Optional placeholder or blank
	HEX3_out <= to_7seg(L3);
	HEX4_out <= to_7seg(L2);
	HEX5_out <= to_7seg(L1);		
end process;

--Refesh counter (to multiplex at ~1kHz per digit
process (clk)
begin
    if rising_edge(clk) then
    if rst_btn.edge = '1' then
        refresh_counter <= (others => '0');
    else
        refresh_counter <= refresh_counter + 1;
    end if;
    end if;
end process;

--Use bits 15--13 for 6-digit selection (~6kHz)
digit_select <= refresh_counter(15 downto 13); -- counts 0 to 7, but we use only 0 to 5

--Digit selection
process(digit_select,HEX0_out, HEX1_out, HEX2_out, HEX3_out, HEX4_out, HEX5_out)
begin
    case digit_select is
        when "000" => seg_internal <= HEX0_out;
        when "001" => seg_internal <= HEX1_out;
        when "010" => seg_internal <= HEX2_out;
        when "011" => seg_internal <= HEX3_out;
        when "100" => seg_internal <= HEX4_out;
        when others => seg_internal <= HEX5_out;
    end case;
end process;

--Assign outputs
HEX_out <= seg_internal;
dec_pt_out <= '1'; --Decimal point off (active low) 

--Anode control (active low)
process(digit_select)
begin
 --   Anode_ctrl_out <= "111111" --All off
    case digit_select is
        when "000" => Anode_ctrl_out <= "111110";
        when "001" => Anode_ctrl_out <= "111101";
        when "010" => Anode_ctrl_out <= "111011";
        when "011" => Anode_ctrl_out <= "110111";
        when "100" => Anode_ctrl_out <= "101111";
        when others => Anode_ctrl_out <= "011111"; -- default: 101, so digit 5
    end case;
end process;
        

--PROCESS (div_ctrl)
--BEGIN
--		CASE div_ctrl IS
--				WHEN "000000" =>
--						P_out <= "1010";
--						S_out <= "101";
--						VCO_CB_out <= "11111";
--						-- Divide Ratio = 178 = 188
--				WHEN "000001" =>
--						P_out <= "1010";
--						S_out <= "001";
--						VCO_CB_out <= "11111";
--						-- Divide Ratio = 180
--				WHEN "000010" =>
--						P_out <= "1010";
--						S_out <= "010";
--						VCO_CB_out <= "11110";
--						-- Divide Ratio = 182
--				WHEN "000011" =>
--						P_out <= "1010";
--						S_out <= "011";
--						VCO_CB_out <= "11100";
--						-- Divide Ratio = 184
--				WHEN "000100" =>
--						P_out <= "1010";
--						S_out <= "100";
--						VCO_CB_out <= "11011";
--						-- Divide Ratio = 186
--				WHEN "000101" =>
--						P_out <= "1010";
--						S_out <= "101";
--						VCO_CB_out <= "11010";
--						-- Divide Ratio = 188
--				WHEN "000110" =>
--						P_out <= "1010";
--						S_out <= "110";
--						VCO_CB_out <= "11001";
--						-- Divide Ratio = 190
--				WHEN "000111" =>
--						P_out <= "1010";
--						S_out <= "111";
--						VCO_CB_out <= "11000";
--						-- Divide Ratio = 192
--				WHEN "001000" =>
--						P_out <= "1011";
--						S_out <= "000";
--						VCO_CB_out <= "10110";
--						-- Divide Ratio = 194
--				WHEN "001001" =>
--						P_out <= "1011";
--						S_out <= "001";
--						VCO_CB_out <= "10101";
--						-- Divide Ratio = 196
--				WHEN "001010" =>
--						P_out <= "1011";
--						S_out <= "010";
--						VCO_CB_out <= "10100";
--						-- Divide Ratio = 198
--				WHEN "001011" =>
--						P_out <= "1011";
--						S_out <= "011";
--						VCO_CB_out <= "10010";
--						-- Divide Ratio = 200
--				WHEN "001100" =>
--						P_out <= "1011";
--						S_out <= "100";
--						VCO_CB_out <= "10001";
--						-- Divide Ratio = 202
--				WHEN "001101" =>
--						P_out <= "1011";
--						S_out <= "101";
--						VCO_CB_out <= "10000";
--						-- Divide Ratio = 204
--				WHEN "001110" =>
--						P_out <= "1011";
--						S_out <= "110";
--						VCO_CB_out <= "01111";
--						-- Divide Ratio = 206
--				WHEN "001111" =>
--						P_out <= "1011";
--						S_out <= "111";
--						VCO_CB_out <= "01110";
--						-- Divide Ratio = 208
--				WHEN "010000" =>
--						P_out <= "1100";
--						S_out <= "000";
--						VCO_CB_out <= "01101";
--						-- Divide Ratio = 210		
--				WHEN "010001" =>
--						P_out <= "1100";
--						S_out <= "001";
--						VCO_CB_out <= "01100";
--						-- Divide Ratio = 212
--				WHEN "010010" =>
--						P_out <= "1100";
--						S_out <= "010";
--						VCO_CB_out <= "01011";
--						-- Divide Ratio = 214
--				WHEN "010011" =>
--						P_out <= "1100";
--						S_out <= "011";
--						VCO_CB_out <= "01010";
--						-- Divide Ratio = 216
--				WHEN "010100" =>
--						P_out <= "1100";
--						S_out <= "100";
--						VCO_CB_out <= "01001";
--						-- Divide Ratio = 218
--				WHEN "010101" =>
--						P_out <= "1100";
--						S_out <= "101";
--						VCO_CB_out <= "01000";
--						-- Divide Ratio = 220
--				WHEN "010110" =>
--						P_out <= "1100";
--						S_out <= "110";
--						VCO_CB_out <= "00111";
--						-- Divide Ratio = 222
--				WHEN "010111" =>
--						P_out <= "1100";
--						S_out <= "111";
--						VCO_CB_out <= "00111";
--						-- Divide Ratio = 224
--				WHEN "011000" =>
--						P_out <= "1101";
--						S_out <= "000";
--						VCO_CB_out <= "00110";
--						-- Divide Ratio = 226
--				WHEN "011001" =>
--						P_out <= "1101";
--						S_out <= "001";
--						VCO_CB_out <= "00101";
--						-- Divide Ratio = 228
--				WHEN "011010" =>
--						P_out <= "1101";
--						S_out <= "010";
--						VCO_CB_out <= "00100";
--						-- Divide Ratio = 230
--				WHEN "011011" =>
--						P_out <= "1101";
--						S_out <= "011";
--						VCO_CB_out <= "00100";
--						-- Divide Ratio = 232
--				WHEN "011100" =>
--						P_out <= "1101";
--						S_out <= "100";
--						VCO_CB_out <= "00011";
--						-- Divide Ratio = 234
--				WHEN "011101" =>
--						P_out <= "1101";
--						S_out <= "101";
--						VCO_CB_out <= "00010";
--						-- Divide Ratio = 236
--				WHEN "011110" =>
--						P_out <= "1101";
--						S_out <= "110";
--						VCO_CB_out <= "00010";
--						-- Divide Ratio = 238
--				WHEN "011111" =>
--						P_out <= "1101";
--						S_out <= "111";	
--						VCO_CB_out <= "00001";
--						-- Divide Ratio = 240
--				WHEN "100000" =>
--						P_out <= "1110";
--						S_out <= "000";
--						VCO_CB_out <= "00001";
--						-- Divide Ratio = 242
--				WHEN "100001" =>
--						P_out <= "1110";
--						S_out <= "001";
--						VCO_CB_out <= "00000";
--						-- Divide Ratio = 244
--				WHEN "100010" =>
--						P_out <= "1110";
--						S_out <= "010";
--						VCO_CB_out <= "00000";
--						-- Divide Ratio = 246
--				WHEN "100011" =>
--						P_out <= "1110";
--						S_out <= "011";
--						VCO_CB_out <= "00000";
--						-- Divide Ratio = 248
--				WHEN others => null;	
						
--		END CASE;
--END PROCESS;

end Behavioral;


	
	
	