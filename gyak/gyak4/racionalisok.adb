with Lnko;

package body Racionalisok is

    function Szamlalo ( R: Racionalis ) return Integer is
    begin
        return R.Szamlalo;
    end;

    function Nevezo ( R: Racionalis ) return Positive is
    begin
        return R.Nevezo;
    end;

    function Normalizalva ( Szamlalo: Integer; Nevezo: Positive )
    return Racionalis is
    begin
        if Szamlalo = 0 then
            return (0,1);
        else
            declare
                H: Positive := Lnko( abs Szamlalo, Nevezo );
            begin
                return (Szamlalo/H, Nevezo/H);
            end;
        end if;
    end;

    function "/" ( Szamlalo: Integer; Nevezo: Positive ) return Racionalis is
    begin
        return Normalizalva( Szamlalo, Nevezo );
    end;

    function "/" ( X, Y: Racionalis ) return Racionalis is
    begin
        return Normalizalva( X.Szamlalo * Y.Nevezo,  X.Nevezo * Y.Szamlalo );
    end;

    function "/" ( X: Racionalis; Y: Positive ) return Racionalis is
    begin
        return Normalizalva( X.Szamlalo,  X.Nevezo * Y );
    end;

    function "+" ( Szamlalo: Integer; Nevezo: Positive ) return Racionalis is
    begin
      return Normalizalva(Szamlalo + Nevezo, 1);
    end;

    function "+" ( X, Y: Racionalis ) return Racionalis is
    begin
      return Normalizalva(X.Szamlalo * Y.Nevezo + X.Nevezo * Y.Szamlalo, X.Nevezo * Y.Nevezo);
    end;

    function "+" ( X: Racionalis; Y: Positive ) return Racionalis is
    begin
      return Normalizalva(X.Szamlalo + X.Nevezo * Y, X.Nevezo);
    end;

    function "*" ( Szamlalo: Integer; Nevezo: Positive ) return Racionalis is
    begin
      return Normalizalva(Szamlalo * Nevezo, 1);
    end;

    function "*" ( X, Y: Racionalis ) return Racionalis is
    begin
      return Normalizalva(X.Szamlalo * Y.Szamlalo, X.Nevezo * Y.Nevezo);
    end;

    function "*" ( X: Racionalis; Y: Positive ) return Racionalis is
    begin
      return Normalizalva(X.Szamlalo * Y, X.Nevezo);
    end;

    -- function "=" ( X, Y: Racionalis ) return Boolean is
    -- begin
    --     return X.Szamlalo * Y.Nevezo = Y.Szamlalo * X.Nevezo;
    -- end;

end Racionalisok;
