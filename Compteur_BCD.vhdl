entity TIMER is
    Port (
        CLK : in std_logic;
        LOAD : in std_logic;
        D : in std_logic_vector(7 downto 0);
        Q : out std_logic_vector(7 downto 0);
        BORROW : out std_logic
    );
end entity TIMER;

architecture ARCHI of TIMER is
    signal count : std_logic_vector(7 downto 0);
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if LOAD = '0' then
                count <= D;
                BORROW <= '0';
            else
                if count = "0000_0000" then
                    BORROW <= '1';
                else
                    count <= count - 1;
                end if;
            end if;
        end if;
    end process;

    Q <= count;
end architecture ARCHI;
