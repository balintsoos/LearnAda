package body Sorok is

      procedure Hiext( S: in out Sor; E: in Elem ) is
      begin
        if not Is_Full(S) then
          S.Size := S.Size + 1;
          S.Adatok(S.Size) := E;
        end if;
      end;

      procedure Lopop( S: in out Sor; E: out Elem ) is
      begin
          E := Lov(S);
          for I in 1..S.Size-1 loop
            S.Adatok(I) := S.Adatok(I + 1);
          end loop;
          S.Size := S.Size - 1;
      end;

      function Lov( S: Sor ) return Elem is
      begin
          return S.Adatok(1);
      end;

      function Is_Empty( S: Sor ) return Boolean is
      begin
          return Size(S) = 0;
      end;

      function Is_Full( S: Sor ) return Boolean is
      begin
          return Size(S) = S.Max;
      end;

      function Size( S: Sor ) return Natural is
      begin
          return S.Size;
      end;

end Sorok;
