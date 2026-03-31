--Swiftlink Technologies Inc.
--VHDL Progam for SPI signal generation for SLW7308
--Created by: Donuwan Navaratne
--Date: May 13, 2025
--Rev 0.0

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

-- Top-level entity
ENTITY SLW7308_SPI IS
PORT (KEY : IN STD_LOGIC_VECTOR(4 downto 0);
SW : IN STD_LOGIC_VECTOR(9 downto 0);
CLOCK_50 : IN STD_LOGIC ;
Din, Clk, Latch, Clk_out, DLOOP : OUT STD_LOGIC; 
HEX : out STD_LOGIC_VECTOR(6 downto 0);
--HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
--HEX2 : out STD_LOGIC_VECTOR(6 downto 0);
--HEX3 : out STD_LOGIC_VECTOR(6 downto 0);
--HEX4 : out STD_LOGIC_VECTOR(6 downto 0);
--HEX5 : out STD_LOGIC_VECTOR(6 downto 0);
dec_pt : out STD_LOGIC;
Anode_ctrl : out STD_LOGIC_VECTOR(5 downto 0)
) ;
END SLW7308_SPI ;

--Behaviour of the SPI
ARCHITECTURE Behaviour OF SLW7308_SPI IS

constant MAX_DELAY : integer := 32; -- Max delay supported
constant MAX_CLK_DELAY : integer := 32; -- Max delay supported

--initializing variables
--signal P: STD_LOGIC_VECTOR(3 downto 0);
--signal S: STD_LOGIC_VECTOR(2 downto 0);
--signal VCO_CB: STD_LOGIC_VECTOR(4 downto 0);
--signal VbiasRF: STD_LOGIC_VECTOR(5 downto 0);
--signal VbiasLO: STD_LOGIC_VECTOR(5 downto 0);
--signal DAC_VGS: STD_LOGIC_VECTOR(5 downto 0);
--signal ICP: STD_LOGIC_VECTOR(3 downto 0);
signal Rx_QPS_1x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_1x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_1x : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_1x : STD_LOGIC_VECTOR(4 downto 0); 
signal Tx_IPS_1x : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_1x : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_SW_1x : STD_LOGIC;
signal Tx_SW_1x : STD_LOGIC;
signal Rx_EN_1x : STD_LOGIC;
signal Tx_EN_1x : STD_LOGIC;
signal Rx_VGA_B_1x : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_1x : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_1x : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_1x : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_1x : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_1x : STD_LOGIC_VECTOR(3 downto 0);

signal Rx_QPS_2x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_2x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_2x : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_2x : STD_LOGIC_VECTOR(4 downto 0); 
signal Tx_IPS_2x : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_2x : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_SW_2x : STD_LOGIC;
signal Tx_SW_2x : STD_LOGIC;
signal Rx_EN_2x : STD_LOGIC;
signal Tx_EN_2x : STD_LOGIC;
signal Rx_VGA_B_2x : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_2x : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_2x : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_2x : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_2x : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_2x : STD_LOGIC_VECTOR(3 downto 0);

signal Rx_QPS_3x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_3x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_3x : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_3x : STD_LOGIC_VECTOR(4 downto 0); 
signal Tx_IPS_3x : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_3x : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_SW_3x : STD_LOGIC;
signal Tx_SW_3x : STD_LOGIC;
signal Rx_EN_3x : STD_LOGIC;
signal Tx_EN_3x : STD_LOGIC;
signal Rx_VGA_B_3x : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_3x : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_3x : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_3x : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_3x : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_3x : STD_LOGIC_VECTOR(3 downto 0);

signal Rx_QPS_4x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_4x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_4x : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_4x : STD_LOGIC_VECTOR(4 downto 0); 
signal Tx_IPS_4x : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_4x : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_SW_4x : STD_LOGIC;
signal Tx_SW_4x : STD_LOGIC;
signal Rx_EN_4x : STD_LOGIC;
signal Tx_EN_4x : STD_LOGIC;
signal Rx_VGA_B_4x : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_4x : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_4x : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_4x : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_4x : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_4x : STD_LOGIC_VECTOR(3 downto 0);

signal Rx_QPS_5x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_5x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_5x : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_5x : STD_LOGIC_VECTOR(4 downto 0); 
signal Tx_IPS_5x : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_5x : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_SW_5x : STD_LOGIC;
signal Tx_SW_5x : STD_LOGIC;
signal Rx_EN_5x : STD_LOGIC;
signal Tx_EN_5x : STD_LOGIC;
signal Rx_VGA_B_5x : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_5x : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_5x : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_5x : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_5x : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_5x : STD_LOGIC_VECTOR(3 downto 0);

signal Rx_QPS_6x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_6x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_6x : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_6x : STD_LOGIC_VECTOR(4 downto 0); 
signal Tx_IPS_6x : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_6x : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_SW_6x : STD_LOGIC;
signal Tx_SW_6x : STD_LOGIC;
signal Rx_EN_6x : STD_LOGIC;
signal Tx_EN_6x : STD_LOGIC;
signal Rx_VGA_B_6x : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_6x : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_6x : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_6x : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_6x : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_6x : STD_LOGIC_VECTOR(3 downto 0);
 
signal Rx_QPS_7x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_7x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_7x : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_7x : STD_LOGIC_VECTOR(4 downto 0); 
signal Tx_IPS_7x : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_7x : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_SW_7x : STD_LOGIC;
signal Tx_SW_7x : STD_LOGIC;
signal Rx_EN_7x : STD_LOGIC;
signal Tx_EN_7x : STD_LOGIC;
signal Rx_VGA_B_7x : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_7x : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_7x : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_7x : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_7x : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_7x : STD_LOGIC_VECTOR(3 downto 0); 

signal Rx_QPS_8x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_IPS_8x : STD_LOGIC_VECTOR(4 downto 0);
signal Rx_VGA_8x : STD_LOGIC_VECTOR(2 downto 0);
signal Tx_QPS_8x : STD_LOGIC_VECTOR(4 downto 0); 
signal Tx_IPS_8x : STD_LOGIC_VECTOR(4 downto 0);
signal Tx_VGA_8x : STD_LOGIC_VECTOR(2 downto 0);
signal Rx_SW_8x : STD_LOGIC;
signal Tx_SW_8x : STD_LOGIC;
signal Rx_EN_8x : STD_LOGIC;
signal Tx_EN_8x : STD_LOGIC;
signal Rx_VGA_B_8x : STD_LOGIC_VECTOR(3 downto 0);
signal LNA_B_8x : STD_LOGIC_VECTOR(3 downto 0);
signal Tx_VGA_B_8x : STD_LOGIC_VECTOR(3 downto 0);
signal DR1_B_8x : STD_LOGIC_VECTOR(3 downto 0);
signal DR2_B_8x : STD_LOGIC_VECTOR(3 downto 0);
signal PA_B_8x : STD_LOGIC_VECTOR(3 downto 0); 

signal ENCH1x : STD_LOGIC;
signal ENCH2x : STD_LOGIC;
signal ENCH3x : STD_LOGIC;
signal ENCH4x : STD_LOGIC; 
signal ENCH5x : STD_LOGIC;
signal ENCH6x : STD_LOGIC;
signal ENCH7x : STD_LOGIC;
signal ENCH8x : STD_LOGIC;

signal Din_shift : STD_LOGIC_VECTOR(MAX_DELAY - 1 downto 0);
signal Clk_shift : STD_LOGIC_VECTOR(MAX_CLK_DELAY - 1 downto 0);
signal delay_int : integer range 0 to MAX_DELAY := 0;
signal clk_delay_int : integer range 0 to MAX_CLK_DELAY := 0;
signal data_delay: STD_LOGIC_VECTOR(4 downto 0);
signal clk_delay: STD_LOGIC_VECTOR(4 downto 0);
signal dd_counter : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
signal Din_wo, Clk_wo, Ds, clk_50, clk_i, clk_q, Ls, Reset, Transmit, ps_counter_reset: STD_LOGIC;  
signal SWITCH: STD_LOGIC_VECTOR(9 downto 0);
signal clk_25 : STD_LOGIC := '0';
signal clk_12 : STD_LOGIC := '0';
signal clk_6 : STD_LOGIC := '0';
signal clk_3 : STD_LOGIC := '0';
signal clk_1p5 : STD_LOGIC := '0';
signal clk_0p7 : STD_LOGIC := '0';
signal clk_0p35 : STD_LOGIC := '0';
signal clk_0p175 : STD_LOGIC := '0';
signal clk_0p0875 : STD_LOGIC := '0';
signal clk_0p04375 : STD_LOGIC := '0';
signal clk_0p022 : STD_LOGIC := '0';
signal clk_0p011 : STD_LOGIC := '0';
signal clk_0p0055 : STD_LOGIC := '0';

--instantiating clock divider module component
--COMPONENT clk_div_4
--PORT (
--clk_in : IN STD_LOGIC;
--clki_out : OUT STD_LOGIC;
--clkq_out : OUT STD_LOGIC ) ;
--END COMPONENT;

--instantiating switch decoder component
--COMPONENT switch_decoder
--PORT (
--SW_in : IN STD_LOGIC_VECTOR(9 downto 0);
--P_out : OUT STD_LOGIC_VECTOR(3 downto 0);
--S_out : OUT STD_LOGIC_VECTOR(2 downto 0);
--ICP_out : OUT STD_LOGIC_VECTOR(2 downto 0);
--VCO_CB_out : OUT STD_LOGIC_VECTOR(4 downto 0) ) ;
--END COMPONENT;

COMPONENT encoder
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
END COMPONENT;

COMPONENT serializer
PORT (
clk_50 : IN STD_LOGIC ;
clk_in : IN STD_LOGIC ; -- 50MHz system clock
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
END COMPONENT;


 
BEGIN
--Begin Logic
--Reset <= KEY(0);
clk_50 <= CLOCK_50;
SWITCH <= SW;

process(CLOCK_50)
begin
 if rising_edge(CLOCK_50) then
    clk_25 <= not clk_25;
 end if;
 end process;
 
 process(clk_25)
 begin
    if rising_edge(clk_25) then
    clk_12 <= not clk_12;
end if;
end process;

 process(clk_12)
 begin
    if rising_edge(clk_12) then
    clk_6 <= not clk_6;
end if;
end process;

 process(clk_6)
 begin
    if rising_edge(clk_6) then
    clk_3 <= not clk_3;
end if;
end process;

process(clk_3)
 begin
    if rising_edge(clk_3) then
    clk_1p5 <= not clk_1p5;
end if;
end process;

process(clk_1p5)
 begin
    if rising_edge(clk_1p5) then
    clk_0p7 <= not clk_0p7;
end if;
end process;

process(clk_0p7)
 begin
    if rising_edge(clk_0p7) then
    clk_0p35 <= not clk_0p35;
end if;
end process;

process(clk_0p35)
 begin
    if rising_edge(clk_0p35) then
    clk_0p175 <= not clk_0p175;
end if;
end process;

process(clk_0p175)
 begin
    if rising_edge(clk_0p175) then
    clk_0p0875 <= not clk_0p0875;
end if;
end process;

process(clk_0p0875)
 begin
    if rising_edge(clk_0p0875) then
    clk_0p04375 <= not clk_0p04375;
end if;
end process;

process(clk_0p04375)
 begin
    if rising_edge(clk_0p04375) then
    clk_0p022 <= not clk_0p022;
end if;
end process;

process(clk_0p022)
 begin
    if rising_edge(clk_0p022) then
    clk_0p011 <= not clk_0p011;
end if;
end process;

process(clk_0p011)
 begin
    if rising_edge(clk_0p011) then
    clk_0p0055 <= not clk_0p0055;
end if;
end process;


--process(clk_25)
--begin
--- if rising_edge(clk_25) then
--    clk_12 <= not clk_12;
-- end if;
-- end process; 

--Clock divider port map
--CLK_div_4_block: clk_div_4 
--	PORT MAP (CLOCK_50, clk_i, clk_q);
--Switch decoder port map
--Switch_decoder_block: switch_decoder
--	PORT MAP (SW(9 downto 0), P(3 downto 0), S(2 downto 0), ICP(2 downto 0), VCO_CB(4 downto 0));
Button_encoder_block: encoder
	PORT MAP (clk_12, KEY(4 downto 0), 
	Rx_QPS_1x(4 downto 0), Rx_IPS_1x(4 downto 0), Rx_VGA_1x(2 downto 0), Tx_QPS_1x(4 downto 0), Tx_IPS_1x(4 downto 0), Tx_VGA_1x(2 downto 0), Rx_SW_1x, Tx_SW_1x, Rx_EN_1x, Tx_EN_1x, Rx_VGA_B_1x(3 downto 0), LNA_B_1x(3 downto 0), Tx_VGA_B_1x(3 downto 0), DR1_B_1x(3 downto 0), DR2_B_1x(3 downto 0), PA_B_1x(3 downto 0), 
	Rx_QPS_2x(4 downto 0), Rx_IPS_2x(4 downto 0), Rx_VGA_2x(2 downto 0), Tx_QPS_2x(4 downto 0), Tx_IPS_2x(4 downto 0), Tx_VGA_2x(2 downto 0), Rx_SW_2x, Tx_SW_2x, Rx_EN_2x, Tx_EN_2x, Rx_VGA_B_2x(3 downto 0), LNA_B_2x(3 downto 0), Tx_VGA_B_2x(3 downto 0), DR1_B_2x(3 downto 0), DR2_B_2x(3 downto 0), PA_B_2x(3 downto 0),
	Rx_QPS_3x(4 downto 0), Rx_IPS_3x(4 downto 0), Rx_VGA_3x(2 downto 0), Tx_QPS_3x(4 downto 0), Tx_IPS_3x(4 downto 0), Tx_VGA_3x(2 downto 0), Rx_SW_3x, Tx_SW_3x, Rx_EN_3x, Tx_EN_3x, Rx_VGA_B_3x(3 downto 0), LNA_B_3x(3 downto 0), Tx_VGA_B_3x(3 downto 0), DR1_B_3x(3 downto 0), DR2_B_3x(3 downto 0), PA_B_3x(3 downto 0),
	Rx_QPS_4x(4 downto 0), Rx_IPS_4x(4 downto 0), Rx_VGA_4x(2 downto 0), Tx_QPS_4x(4 downto 0), Tx_IPS_4x(4 downto 0), Tx_VGA_4x(2 downto 0), Rx_SW_4x, Tx_SW_4x, Rx_EN_4x, Tx_EN_4x, Rx_VGA_B_4x(3 downto 0), LNA_B_4x(3 downto 0), Tx_VGA_B_4x(3 downto 0), DR1_B_4x(3 downto 0), DR2_B_4x(3 downto 0), PA_B_4x(3 downto 0),
	Rx_QPS_5x(4 downto 0), Rx_IPS_5x(4 downto 0), Rx_VGA_5x(2 downto 0), Tx_QPS_5x(4 downto 0), Tx_IPS_5x(4 downto 0), Tx_VGA_5x(2 downto 0), Rx_SW_5x, Tx_SW_5x, Rx_EN_5x, Tx_EN_5x, Rx_VGA_B_5x(3 downto 0), LNA_B_5x(3 downto 0), Tx_VGA_B_5x(3 downto 0), DR1_B_5x(3 downto 0), DR2_B_5x(3 downto 0), PA_B_5x(3 downto 0),
	Rx_QPS_6x(4 downto 0), Rx_IPS_6x(4 downto 0), Rx_VGA_6x(2 downto 0), Tx_QPS_6x(4 downto 0), Tx_IPS_6x(4 downto 0), Tx_VGA_6x(2 downto 0), Rx_SW_6x, Tx_SW_6x, Rx_EN_6x, Tx_EN_6x, Rx_VGA_B_6x(3 downto 0), LNA_B_6x(3 downto 0), Tx_VGA_B_6x(3 downto 0), DR1_B_6x(3 downto 0), DR2_B_6x(3 downto 0), PA_B_6x(3 downto 0),
	Rx_QPS_7x(4 downto 0), Rx_IPS_7x(4 downto 0), Rx_VGA_7x(2 downto 0), Tx_QPS_7x(4 downto 0), Tx_IPS_7x(4 downto 0), Tx_VGA_7x(2 downto 0), Rx_SW_7x, Tx_SW_7x, Rx_EN_7x, Tx_EN_7x, Rx_VGA_B_7x(3 downto 0), LNA_B_7x(3 downto 0), Tx_VGA_B_7x(3 downto 0), DR1_B_7x(3 downto 0), DR2_B_7x(3 downto 0), PA_B_7x(3 downto 0),
	Rx_QPS_8x(4 downto 0), Rx_IPS_8x(4 downto 0), Rx_VGA_8x(2 downto 0), Tx_QPS_8x(4 downto 0), Tx_IPS_8x(4 downto 0), Tx_VGA_8x(2 downto 0), Rx_SW_8x, Tx_SW_8x, Rx_EN_8x, Tx_EN_8x, Rx_VGA_B_8x(3 downto 0), LNA_B_8x(3 downto 0), Tx_VGA_B_8x(3 downto 0), DR1_B_8x(3 downto 0), DR2_B_8x(3 downto 0), PA_B_8x(3 downto 0),
	ENCH1x, ENCH2x, ENCH3x, ENCH4x, ENCH5x, ENCH6x, ENCH7x, ENCH8x,
	data_delay(4 downto 0), clk_delay(4 downto 0), HEX(6 downto 0), Anode_ctrl, dec_pt, Reset, Transmit);
--Serializer port map
Serializer_block: serializer
	PORT MAP (CLOCK_50, clk_0p0055, Reset, Transmit, SW(9 downto 0), 
	Rx_QPS_1x(4 downto 0), Rx_IPS_1x(4 downto 0), Rx_VGA_1x(2 downto 0), Tx_QPS_1x(4 downto 0), Tx_IPS_1x(4 downto 0), Tx_VGA_1x(2 downto 0), Rx_SW_1x, Tx_SW_1x, Rx_EN_1x, Tx_EN_1x, Rx_VGA_B_1x(3 downto 0), LNA_B_1x(3 downto 0), Tx_VGA_B_1x(3 downto 0), DR1_B_1x(3 downto 0), DR2_B_1x(3 downto 0), PA_B_1x(3 downto 0), 
	Rx_QPS_2x(4 downto 0), Rx_IPS_2x(4 downto 0), Rx_VGA_2x(2 downto 0), Tx_QPS_2x(4 downto 0), Tx_IPS_2x(4 downto 0), Tx_VGA_2x(2 downto 0), Rx_SW_2x, Tx_SW_2x, Rx_EN_2x, Tx_EN_2x, Rx_VGA_B_2x(3 downto 0), LNA_B_2x(3 downto 0), Tx_VGA_B_2x(3 downto 0), DR1_B_2x(3 downto 0), DR2_B_2x(3 downto 0), PA_B_2x(3 downto 0),
	Rx_QPS_3x(4 downto 0), Rx_IPS_3x(4 downto 0), Rx_VGA_3x(2 downto 0), Tx_QPS_3x(4 downto 0), Tx_IPS_3x(4 downto 0), Tx_VGA_3x(2 downto 0), Rx_SW_3x, Tx_SW_3x, Rx_EN_3x, Tx_EN_3x, Rx_VGA_B_3x(3 downto 0), LNA_B_3x(3 downto 0), Tx_VGA_B_3x(3 downto 0), DR1_B_3x(3 downto 0), DR2_B_3x(3 downto 0), PA_B_3x(3 downto 0),
	Rx_QPS_4x(4 downto 0), Rx_IPS_4x(4 downto 0), Rx_VGA_4x(2 downto 0), Tx_QPS_4x(4 downto 0), Tx_IPS_4x(4 downto 0), Tx_VGA_4x(2 downto 0), Rx_SW_4x, Tx_SW_4x, Rx_EN_4x, Tx_EN_4x, Rx_VGA_B_4x(3 downto 0), LNA_B_4x(3 downto 0), Tx_VGA_B_4x(3 downto 0), DR1_B_4x(3 downto 0), DR2_B_4x(3 downto 0), PA_B_4x(3 downto 0),
	Rx_QPS_5x(4 downto 0), Rx_IPS_5x(4 downto 0), Rx_VGA_5x(2 downto 0), Tx_QPS_5x(4 downto 0), Tx_IPS_5x(4 downto 0), Tx_VGA_5x(2 downto 0), Rx_SW_5x, Tx_SW_5x, Rx_EN_5x, Tx_EN_5x, Rx_VGA_B_5x(3 downto 0), LNA_B_5x(3 downto 0), Tx_VGA_B_5x(3 downto 0), DR1_B_5x(3 downto 0), DR2_B_5x(3 downto 0), PA_B_5x(3 downto 0),
	Rx_QPS_6x(4 downto 0), Rx_IPS_6x(4 downto 0), Rx_VGA_6x(2 downto 0), Tx_QPS_6x(4 downto 0), Tx_IPS_6x(4 downto 0), Tx_VGA_6x(2 downto 0), Rx_SW_6x, Tx_SW_6x, Rx_EN_6x, Tx_EN_6x, Rx_VGA_B_6x(3 downto 0), LNA_B_6x(3 downto 0), Tx_VGA_B_6x(3 downto 0), DR1_B_6x(3 downto 0), DR2_B_6x(3 downto 0), PA_B_6x(3 downto 0),
	Rx_QPS_7x(4 downto 0), Rx_IPS_7x(4 downto 0), Rx_VGA_7x(2 downto 0), Tx_QPS_7x(4 downto 0), Tx_IPS_7x(4 downto 0), Tx_VGA_7x(2 downto 0), Rx_SW_7x, Tx_SW_7x, Rx_EN_7x, Tx_EN_7x, Rx_VGA_B_7x(3 downto 0), LNA_B_7x(3 downto 0), Tx_VGA_B_7x(3 downto 0), DR1_B_7x(3 downto 0), DR2_B_7x(3 downto 0), PA_B_7x(3 downto 0),
	Rx_QPS_8x(4 downto 0), Rx_IPS_8x(4 downto 0), Rx_VGA_8x(2 downto 0), Tx_QPS_8x(4 downto 0), Tx_IPS_8x(4 downto 0), Tx_VGA_8x(2 downto 0), Rx_SW_8x, Tx_SW_8x, Rx_EN_8x, Tx_EN_8x, Rx_VGA_B_8x(3 downto 0), LNA_B_8x(3 downto 0), Tx_VGA_B_8x(3 downto 0), DR1_B_8x(3 downto 0), DR2_B_8x(3 downto 0), PA_B_8x(3 downto 0),
	ENCH1x, ENCH2x, ENCH3x, ENCH4x, ENCH5x, ENCH6x, ENCH7x, ENCH8x,
	Din_wo, Clk_wo, Latch, Clk_out, DLOOP);   

delay_int <= to_integer(unsigned(data_delay));
clk_delay_int <= to_integer(unsigned(clk_delay));

process(clk_0p0055)	
begin
    if rising_edge(clk_0p0055) then
        Din_shift <= Din_shift(MAX_DELAY - 2 downto 0) & Din_wo;
        end if;
 end process;

Din <= Din_shift(delay_int - 1) when delay_int > 0 else Din;

process(clk_0p0055)	
begin
    if rising_edge(clk_0p0055) then
        Clk_shift <= Clk_shift(MAX_CLK_DELAY - 2 downto 0) & Clk_wo;
        end if;

Clk <= Clk_shift(clk_delay_int - 1) when clk_delay_int > 0 else Clk;        

 end process;


--Din <= Din_wo;

--PROCESS (Reset, clk_50)
--BEGIN
-- Reset is active low an asynchronous
--IF Reset = '0' THEN
--	P <= "0000";
--	S <= "000";
--	VCO_CB <= "00000";
--	ICP <= "0000";
--	VbiasRF <= "000000";
--	VbiasLO <= "000000";
--	DAC_VGS <= "000000";
	
-- Clock is active on the rising edge
--ELSIF clk_50' EVENT AND clk_50 = '1' THEN
	
	
--Output signals

--END IF;



--END PROCESS;
	
END Behaviour;








