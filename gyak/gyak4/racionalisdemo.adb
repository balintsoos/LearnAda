with Racionalisok, Ada.Integer_Text_IO, Ada.Text_IO;
use Racionalisok, Ada.Integer_Text_IO, Ada.Text_IO;

procedure RacionalisDemo is

    X: Racionalis := 1/2;
    Y: Racionalis := 3/5;
    R: Racionalis := 1/1;
    -- X: Racionális := 3/4/5;

begin

    --R := R / (R/2);
    --Put( Szamlalo(R) );
    --Put( '/' );
    --Put( Nevezo(R) );

    R := X + Y;
    Put( Szamlalo(R) );
    Put( '/' );
    Put( Nevezo(R) );

end;
