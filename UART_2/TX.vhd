library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity TX is
port (
	CLK : in std_logic;
	START : in std_logic;
	BUSY : out std_logic;
	DATA : in std_logic_vector (7 downto 0);
	TX_LINE : out std_logic
);
end TX;

architecture MAIN of TX is

signal PRSCL : integer range 0 to 5208 := 0; --counter for baud rate of 9600
signal INDEX : integer range 0 to 9 := 0; --index to tell which bit in word has been send
signal DATAFLL : std_logic_vector (9 downto 0); --data with stop bit
signal TX_FLG : std_logic := '0';
begin
	process (CLK)
	begin
		if (CLK'EVENT and CLK = '1') then
			if (TX_FLG='0' and START='1') then --start transmit
				TX_FLG <= '1';
				BUSY <= '1';
				DATAFLL(0) <= '0'; --set start and stop bits
				DATAFLL(9) <= '1';
				DATAFLL (8 downto 1) <= DATA; --set data bits
			end if;
			
			if (TX_FLG='1') then
				if(PRSCL<5207) then --used to set baud rate 50M/5207 approx = 9600
										  it is not exact which leads to the occasional erroneous bit
					PRSCL <= PRSCL+1;
				else
					PRSCL <= 0;
				end if;
				if (PRSCL=2607) Then --prepare data for transmit, allows for slack for data to latch
					TX_LINE <= DATAFLL(INDEX);
					if (INDEX < 9) then
						INDEX <= INDEX + 1;
					else
						TX_FLG <= '0';
						BUSY <= '0';
						INDEX <= 0;
					end if;
				end if;
			end if;
		end if;
	end process;
end MAIN;