library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity projeto_senha is
	Port(
		clk : in std_logic;
		rst : in std_logic;
		B_0 : in std_logic;
		B_1 : in std_logic;
		B_2 : in std_logic;
		B_3 : in std_logic;
		A : in std_logic;
		disp : out std_logic_vector(6 downto 0);
		an : out std_logic_vector(3 downto 0)
		leds : out std_logic_vector(7 downto 0););

end projeto_senha;

architecture comportamental of projeto_senha is
type estado_botao is(b1, b2, b3, b4);
signal contagem : Integer range 0 to 24_999;
signal estado_atual_b, proximo_estado_b : estado_b;

begin

--Comparador de igualdade--

process(A,B)
begin
	if A=B then
	A_Igual_B <= '1';
	else
	A_Igual_B <= '0';
	end if;
end process;


--Contador decrescente 250k--

process(clk)
begin
	if rising_edge(clk) then
		if c='0' then
			contagem <= IN;
		else
			contagem <= contagem -1;
			if contagem = 0 then
				contagem 249_999_999;
			end if;
		end if;
	end if;
end process;

TC <= '1' when contagem = 0 else '0';

--Contador decrescente 500--

process(clk)
begin
	if rising_edge(clk) then
		cont_500 <= cont_500 -1;
		if cont_500 = 0 then
			cont_500 <= 99_999;
		end if;
	end if;
end process;

en500hz <= '1' when cont500=0 else '0';

--???????--

process(clk)
begin
	if rising_edge(clk) then
		if en500hz = '1' then
			vet_b <= ???
		end if;
	end if;
end process;

--Tempo--

process (clk)
begin
	if rising_edge(clk) then	
		estado_atual_b <= proximo_estado_b;
	end if;
end process;


--Debounce1--
process(estado_atual_b, vet_b)
begin
	B_0 <= '0',
	proximo_estado_b = estado_atual_b;
	case estado_b is
	when zero => B_0<= '0';
		if vet_b = "1111" then
			proximo_estado_b <= um;
		else
			proximo_estado_b <= espera;
		end if;
	when um => B_0 <= '1';
		if vet_b = "0000" then
			proximo_estado_b <= zero;
		else
			proximo_estado_b <= espera;
		end if;
	end case;
end process;

--Debounce2--

D <= '1' when B_0 = '1' or B_1 = '1' or B_2 = '1' or B_3 = '1' else '0';

process(B_0, B_1, B_2, B_3)
begin
	if B_0= '1' then
		digito <= "00"; -- D<='1'
	elsif B_1= '1' then
		digito <= "01"; -- D<='1'
	elsif B_2= '1' then
		digito <= "10"; -- D<='1'
	elsif B_3= '1' then
		digito <= "11"; -- D<='1' 
	else
		digito <= "00"; -- D<='0'
	end if;
end process;
