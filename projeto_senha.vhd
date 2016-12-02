entity projeto_senha is
	Port(
		  clk :	in std_logic;
		  rst : in std_logic;
		  disp : out std_logic_vector(6 downto 0);
		  an : out std_logic_vector(3 downto 0));

end projeto_senha;

architecture comportamental of projeto_senha is

type estado is(digito1, digito2, digito3, digito4);
signal estado_atual, proximo_estado : estado;
signal leds : std_logic_vector(6 downto 0);

begin
