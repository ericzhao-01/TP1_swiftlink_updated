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

constant DEBOUNCE_TIME : integer := 250000; -- ~5ms at 50MHz

type config_state_t is (TXMAX, RXMAX, TXMID, RXMID, TXMIN, RXMIN);
signal cfg_state : config_state_t := TXMAX;
signal cfg_state_prev : config_state_t := TXMAX;

signal rqp, rip, tqp, tip, del, cyd : std_logic_vector(4 downto 0);
signal rva, tva : std_logic_vector(2 downto 0);
signal rsa, tsa, ren, ten : std_logic;
signal rvb, lab, tvb, d1b, d2b, pab : std_logic_vector(3 downto 0);

type button_state is record
    sync : std_logic_vector(1 downto 0);
    button_stable : std_logic;
    counter : integer range 0 to DEBOUNCE_TIME;
    edge : std_logic;
    prev : std_logic;
end record;

signal rst_btn, mode_btn, prev_btn, transmit_btn : button_state := (
    sync => (others => '0'),
    button_stable => '0',
    counter => 0,
    edge => '0',
    prev => '0'
);

signal refresh_counter : unsigned(15 downto 0) := (others => '0');
signal digit_select : unsigned(2 downto 0) := (others => '0');
signal seg_internal : std_logic_vector(6 downto 0);

signal HEX0_out : std_logic_vector(6 downto 0) := (others => '1');
signal HEX1_out : std_logic_vector(6 downto 0) := (others => '1');
signal HEX2_out : std_logic_vector(6 downto 0) := (others => '1');
signal HEX3_out : std_logic_vector(6 downto 0) := (others => '1');
signal HEX4_out : std_logic_vector(6 downto 0) := (others => '1');
signal HEX5_out : std_logic_vector(6 downto 0) := (others => '1');

signal state_change_pulse : std_logic := '0';

function to_7seg(input : character) return std_logic_vector is
    variable seg : std_logic_vector(6 downto 0);
begin
    case input is
        when '0' => seg := "1000000";
        when '1' => seg := "1111001";
        when '2' => seg := "0100100";
        when '3' => seg := "0110000";
        when '4' => seg := "0011001";
        when '5' => seg := "0010010";
        when '6' => seg := "0000010";
        when '7' => seg := "1110001";
        when '8' => seg := "0000000";
        when '9' => seg := "0010000";
        when 'T' => seg := "0001110";
        when 'R' => seg := "1000111";
        when others => seg := "1111111";
    end case;
    return seg;
end function;

procedure debounce_button(signal raw_input : in std_logic; variable btn : inout button_state) is
    variable input_level : std_logic;
begin
    input_level := not raw_input;
    btn.sync := btn.sync(0) & input_level;

    if btn.sync(1) = btn.button_stable then
        btn.counter := 0;
    else
        btn.counter := btn.counter + 1;
        if btn.counter = DEBOUNCE_TIME then
            btn.button_stable := btn.sync(1);
            btn.counter := 0;
        end if;
    end if;

    btn.edge := '0';
    if btn.button_stable = '1' and btn.prev = '0' then
        btn.edge := '1';
    end if;
    btn.prev := btn.button_stable;
end procedure;

begin

process(clk_in)
    variable rst_btn_var, mode_btn_var, prev_btn_var, transmit_btn_var : button_state;
begin
    if rising_edge(clk_in) then
        rst_btn_var := rst_btn;
        mode_btn_var := mode_btn;
        prev_btn_var := prev_btn;
        transmit_btn_var := transmit_btn;

        debounce_button(PB_in(3), rst_btn_var);
        debounce_button(PB_in(0), mode_btn_var);
        debounce_button(PB_in(1), prev_btn_var);
        debounce_button(PB_in(4), transmit_btn_var);

        rst_btn <= rst_btn_var;
        mode_btn <= mode_btn_var;
        prev_btn <= prev_btn_var;
        transmit_btn <= transmit_btn_var;

        state_change_pulse <= '0';

        if rst_btn_var.edge = '1' then
            cfg_state <= TXMAX;
        elsif mode_btn_var.edge = '1' then
            case cfg_state is
                when TXMAX => cfg_state <= RXMAX;
                when RXMAX => cfg_state <= TXMID;
                when TXMID => cfg_state <= RXMID;
                when RXMID => cfg_state <= TXMIN;
                when TXMIN => cfg_state <= RXMIN;
                when RXMIN => cfg_state <= TXMAX;
            end case;
        elsif prev_btn_var.edge = '1' then
            case cfg_state is
                when TXMAX => cfg_state <= RXMIN;
                when RXMAX => cfg_state <= TXMAX;
                when TXMID => cfg_state <= RXMAX;
                when RXMID => cfg_state <= TXMID;
                when TXMIN => cfg_state <= RXMID;
                when RXMIN => cfg_state <= TXMIN;
            end case;
        end if;

        if cfg_state /= cfg_state_prev then
            state_change_pulse <= '1';
        end if;
        cfg_state_prev <= cfg_state;

        refresh_counter <= refresh_counter + 1;
    end if;
end process;

process(cfg_state)
begin
    case cfg_state is
        when TXMAX =>
            rqp <= "00000"; rip <= "00000"; rva <= "000";
            tqp <= "00000"; tip <= "00000"; tva <= "111";
            rsa <= '0'; tsa <= '1'; ren <= '0'; ten <= '1';
            rvb <= "0000"; lab <= "0000";
            tvb <= "1111"; d1b <= "1111"; d2b <= "1111"; pab <= "1111";
            del <= "00100"; cyd <= "00010";
        when RXMAX =>
            rqp <= "00000"; rip <= "00000"; rva <= "111";
            tqp <= "00000"; tip <= "00000"; tva <= "000";
            rsa <= '1'; tsa <= '0'; ren <= '1'; ten <= '0';
            rvb <= "1111"; lab <= "1111";
            tvb <= "0000"; d1b <= "0000"; d2b <= "0000"; pab <= "0000";
            del <= "00100"; cyd <= "00010";
        when TXMID =>
            rqp <= "00000"; rip <= "00000"; rva <= "000";
            tqp <= "00000"; tip <= "00000"; tva <= "011";
            rsa <= '0'; tsa <= '1'; ren <= '0'; ten <= '1';
            rvb <= "0000"; lab <= "0000";
            tvb <= "0111"; d1b <= "0111"; d2b <= "0111"; pab <= "0111";
            del <= "00100"; cyd <= "00010";
        when RXMID =>
            rqp <= "00000"; rip <= "00000"; rva <= "011";
            tqp <= "00000"; tip <= "00000"; tva <= "000";
            rsa <= '1'; tsa <= '0'; ren <= '1'; ten <= '0';
            rvb <= "0111"; lab <= "0111";
            tvb <= "0000"; d1b <= "0000"; d2b <= "0000"; pab <= "0000";
            del <= "00100"; cyd <= "00010";
        when TXMIN =>
            rqp <= "00000"; rip <= "00000"; rva <= "000";
            tqp <= "00000"; tip <= "00000"; tva <= "000";
            rsa <= '0'; tsa <= '1'; ren <= '0'; ten <= '1';
            rvb <= "0000"; lab <= "0000";
            tvb <= "0000"; d1b <= "0000"; d2b <= "0000"; pab <= "0000";
            del <= "00100"; cyd <= "00010";
        when RXMIN =>
            rqp <= "00000"; rip <= "00000"; rva <= "000";
            tqp <= "00000"; tip <= "00000"; tva <= "000";
            rsa <= '1'; tsa <= '0'; ren <= '1'; ten <= '0';
            rvb <= "0000"; lab <= "0000";
            tvb <= "0000"; d1b <= "0000"; d2b <= "0000"; pab <= "0000";
            del <= "00100"; cyd <= "00010";
    end case;
end process;

process(cfg_state)
begin
    HEX2_out <= to_7seg(' ');
    HEX3_out <= to_7seg(' ');
    HEX4_out <= to_7seg(' ');
    HEX5_out <= to_7seg(' ');
    case cfg_state is
        when TXMAX => HEX1_out <= to_7seg('T'); HEX0_out <= to_7seg('2');
        when RXMAX => HEX1_out <= to_7seg('R'); HEX0_out <= to_7seg('2');
        when TXMID => HEX1_out <= to_7seg('T'); HEX0_out <= to_7seg('1');
        when RXMID => HEX1_out <= to_7seg('R'); HEX0_out <= to_7seg('1');
        when TXMIN => HEX1_out <= to_7seg('T'); HEX0_out <= to_7seg('0');
        when RXMIN => HEX1_out <= to_7seg('R'); HEX0_out <= to_7seg('0');
    end case;
end process;

digit_select <= refresh_counter(15 downto 13);

process(digit_select, HEX0_out, HEX1_out, HEX2_out, HEX3_out, HEX4_out, HEX5_out)
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

process(digit_select)
begin
    case digit_select is
        when "000" => Anode_ctrl_out <= "111110";
        when "001" => Anode_ctrl_out <= "111101";
        when "010" => Anode_ctrl_out <= "111011";
        when "011" => Anode_ctrl_out <= "110111";
        when "100" => Anode_ctrl_out <= "101111";
        when others => Anode_ctrl_out <= "011111";
    end case;
end process;

HEX_out <= seg_internal;
dec_pt_out <= '1';

Rx_QPS_1 <= rqp; Rx_IPS_1 <= rip; Rx_VGA_1 <= rva; Tx_QPS_1 <= tqp; Tx_IPS_1 <= tip; Tx_VGA_1 <= tva;
Rx_SW_1 <= rsa; Tx_SW_1 <= tsa; Rx_EN_1 <= ren; Tx_EN_1 <= ten; Rx_VGA_B_1 <= rvb; LNA_B_1 <= lab;
Tx_VGA_B_1 <= tvb; DR1_B_1 <= d1b; DR2_B_1 <= d2b; PA_B_1 <= pab;

Rx_QPS_2 <= rqp; Rx_IPS_2 <= rip; Rx_VGA_2 <= rva; Tx_QPS_2 <= tqp; Tx_IPS_2 <= tip; Tx_VGA_2 <= tva;
Rx_SW_2 <= rsa; Tx_SW_2 <= tsa; Rx_EN_2 <= ren; Tx_EN_2 <= ten; Rx_VGA_B_2 <= rvb; LNA_B_2 <= lab;
Tx_VGA_B_2 <= tvb; DR1_B_2 <= d1b; DR2_B_2 <= d2b; PA_B_2 <= pab;

Rx_QPS_3 <= rqp; Rx_IPS_3 <= rip; Rx_VGA_3 <= rva; Tx_QPS_3 <= tqp; Tx_IPS_3 <= tip; Tx_VGA_3 <= tva;
Rx_SW_3 <= rsa; Tx_SW_3 <= tsa; Rx_EN_3 <= ren; Tx_EN_3 <= ten; Rx_VGA_B_3 <= rvb; LNA_B_3 <= lab;
Tx_VGA_B_3 <= tvb; DR1_B_3 <= d1b; DR2_B_3 <= d2b; PA_B_3 <= pab;

Rx_QPS_4 <= rqp; Rx_IPS_4 <= rip; Rx_VGA_4 <= rva; Tx_QPS_4 <= tqp; Tx_IPS_4 <= tip; Tx_VGA_4 <= tva;
Rx_SW_4 <= rsa; Tx_SW_4 <= tsa; Rx_EN_4 <= ren; Tx_EN_4 <= ten; Rx_VGA_B_4 <= rvb; LNA_B_4 <= lab;
Tx_VGA_B_4 <= tvb; DR1_B_4 <= d1b; DR2_B_4 <= d2b; PA_B_4 <= pab;

Rx_QPS_5 <= rqp; Rx_IPS_5 <= rip; Rx_VGA_5 <= rva; Tx_QPS_5 <= tqp; Tx_IPS_5 <= tip; Tx_VGA_5 <= tva;
Rx_SW_5 <= rsa; Tx_SW_5 <= tsa; Rx_EN_5 <= ren; Tx_EN_5 <= ten; Rx_VGA_B_5 <= rvb; LNA_B_5 <= lab;
Tx_VGA_B_5 <= tvb; DR1_B_5 <= d1b; DR2_B_5 <= d2b; PA_B_5 <= pab;

Rx_QPS_6 <= rqp; Rx_IPS_6 <= rip; Rx_VGA_6 <= rva; Tx_QPS_6 <= tqp; Tx_IPS_6 <= tip; Tx_VGA_6 <= tva;
Rx_SW_6 <= rsa; Tx_SW_6 <= tsa; Rx_EN_6 <= ren; Tx_EN_6 <= ten; Rx_VGA_B_6 <= rvb; LNA_B_6 <= lab;
Tx_VGA_B_6 <= tvb; DR1_B_6 <= d1b; DR2_B_6 <= d2b; PA_B_6 <= pab;

Rx_QPS_7 <= rqp; Rx_IPS_7 <= rip; Rx_VGA_7 <= rva; Tx_QPS_7 <= tqp; Tx_IPS_7 <= tip; Tx_VGA_7 <= tva;
Rx_SW_7 <= rsa; Tx_SW_7 <= tsa; Rx_EN_7 <= ren; Tx_EN_7 <= ten; Rx_VGA_B_7 <= rvb; LNA_B_7 <= lab;
Tx_VGA_B_7 <= tvb; DR1_B_7 <= d1b; DR2_B_7 <= d2b; PA_B_7 <= pab;

Rx_QPS_8 <= rqp; Rx_IPS_8 <= rip; Rx_VGA_8 <= rva; Tx_QPS_8 <= tqp; Tx_IPS_8 <= tip; Tx_VGA_8 <= tva;
Rx_SW_8 <= rsa; Tx_SW_8 <= tsa; Rx_EN_8 <= ren; Tx_EN_8 <= ten; Rx_VGA_B_8 <= rvb; LNA_B_8 <= lab;
Tx_VGA_B_8 <= tvb; DR1_B_8 <= d1b; DR2_B_8 <= d2b; PA_B_8 <= pab;

ENCH1 <= '0'; ENCH2 <= '0'; ENCH3 <= '0'; ENCH4 <= '0';
ENCH5 <= '0'; ENCH6 <= '0'; ENCH7 <= '0'; ENCH8 <= '0';

Data_delay_out <= del;
Clk_delay_out <= cyd;

reset_enc <= rst_btn.edge;
transmit_enc <= transmit_btn.edge or state_change_pulse;

END Behavioral;
