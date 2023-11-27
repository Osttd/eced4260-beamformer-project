library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity RX is
port(
	CLK : in std_logic;
	RX_LINE : in std_logic;
	DATA : out std_logic_vector (7 downto 0);
	BUSY : out std_logic
);
end RX;

architecture MAIN of RX is
signal PRSCL : integer range 0 to 5208 := 0; --counter for baud rate of 9600
signal INDEX : integer range 0 to 9 := 0; --index to tell which bit in word has been received
signal DATAFLL : std_logic_vector (9 downto 0); --data with stop bit
signal RX_FLG : std_logic := '0';
begin
	process (CLK)
	begin
		if (CLK'EVENT and CLK = '1') then
			if (RX_FLG='0' and RX_LINE = '0') then --tell fpga when data is present on RX line
					INDEX <= 0;
					PRSCL <= 0;
					BUSY <= '1';
					RX_FLG <= '1';
			end if;
			
			if (RX_FLG = '1') then
				DATAFLL(INDEX) <= RX_LINE;
				if (PRSCL < 5207) then --used to set baud rate 50M/5207 approx = 9600
											  --it is not exact which leads to the occasional erroneous bit
					PRSCL <= PRSCL + 1;
				else
					PRSCL <= 0;
				end if;
				
				if (PRSCL = 2500) then --prepare data for transmit, allows for slack for data to latch
											  --needs more slack than transmit
					if (INDEX<9) then
						INDEX <= INDEX + 1;
					else
						if (DATAFLL(0)='0' and DATAFLL(9) = '1') then --recieve data based on start bit
							DATA <= DATAFLL (8 downto 1);
						else
							DATA <= (OTHERS=>'0'); --otherwise clear data register
						end if;
						RX_FLG <= '0';
						BUSY <= '0';
					end if;
				end if;
				
			end if;
			
		end if;
	end process;
end MAIN;