package Racionalisok is

    type Racionalis is private;

    function Szamlalo ( R: Racionalis ) return Integer;
    function Nevezo ( R: Racionalis ) return Positive;

    function "/" ( Szamlalo: Integer; Nevezo: Positive ) return Racionalis;
    function "/" ( X, Y: Racionalis ) return Racionalis;
    function "/" ( X: Racionalis; Y: Positive ) return Racionalis;

    function "+" ( Szamlalo: Integer; Nevezo: Positive ) return Racionalis;
    function "+" ( X, Y: Racionalis ) return Racionalis;
    function "+" ( X: Racionalis; Y: Positive ) return Racionalis;

    function "*" ( Szamlalo: Integer; Nevezo: Positive ) return Racionalis;
    function "*" ( X, Y: Racionalis ) return Racionalis;
    function "*" ( X: Racionalis; Y: Positive ) return Racionalis;


    -- function "=" ( X, Y: Racionalis ) return Boolean;

private

    type Racionalis is record
      Szamlalo: Integer := 0;
      Nevezo: Positive := 1;
    end record;

end Racionalisok;
