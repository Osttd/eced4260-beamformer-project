library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART is
port (
	CLOCK_50 : in std_logic;  
	SW : in std_logic_vector (9 downto 0); --set transmit data
	KEY : in std_logic_vector (3 downto 0); --used to start transmission
	LEDR : out std_logic_vector (9 downto 0); --display received data
	LEDG : out std_logic_vector (7 downto 0); --display transmit data
	UART_TXD : out std_logic; -- transmit bit
	UART_RXD : in std_logic -- received bit
);

end UART;

architecture MAIN of UART is
	
	signal TX_DATA : std_logic_vector (7 downto 0); --data to transmit
	signal TX_START : std_logic := '0';
	signal TX_BUSY : std_logic; --used to prevent a transmit event during transmit stream
	
	signal RX_DATA : std_logic_vector (7 downto 0); --store recieved data
	signal RX_BUSY : std_logic; --used to prevent a receive event during receive stream
	
----------------------------------------------------------------
	
	component TX
	port (
		CLK : in std_logic;
		START : in std_logic;
		BUSY : out std_logic;
		DATA : in std_logic_vector (7 downto 0);
		TX_LINE : out std_logic
	);
	end component TX;
	
----------------------------------------------------------------

-- Map components to handle transmit and receive
component RX
	port (
		CLK : in std_logic;
		RX_LINE : in std_logic;
		DATA : out std_logic_vector (7 downto 0);
		BUSY : out std_logic
	);
	end component RX;

----------------------------------------------------------------	
	
begin
	C1 : TX port map ( CLOCK_50,TX_START,TX_BUSY,TX_DATA,UART_TXD );
	
	C2 : RX port map ( CLOCK_50,UART_RXD,RX_DATA,RX_BUSY );
	
	process (RX_BUSY)
	begin
		if(RX_BUSY'EVENT and RX_BUSY='0') then --set leds to received data
			LEDR (7 downto 0) <= RX_DATA;
		end if;
	end process;
	
	process (CLOCK_50)
	begin
	
		if (CLOCK_50'event and CLOCK_50='1') then
			if (KEY(0) = '0' and TX_BUSY = '0') then --on key press and while a stream isn't happening
				TX_DATA <= SW(7 downto 0);
				TX_START <= '1'; -- start
				LEDG <= TX_DATA;
			else
				TX_START <= '0'; --set back to zero when busy goes back to 0
			end if;
		end if;
	
	end process;
end MAIN;