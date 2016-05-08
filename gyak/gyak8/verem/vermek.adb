package body Vermek is

      procedure Push( V: in out Verem; E: in Elem ) is
      begin
          V.Veremtető := new Csúcs'(E,V.Veremtető);
          V.Méret := V.Méret + 1;
      end;

      procedure Pop( V: in out Verem; E: out Elem ) is
      begin
          E := Top(V);
          V.Veremtető := V.Veremtető.Következő;
          V.Méret := V.Méret - 1;
      end;

      function Top( V: Verem ) return Elem is
      begin
          return V.Veremtető.Adat;
      exception
          when Constraint_Error => raise Üres_A_Verem;
      end;

      function Is_Empty( V: Verem ) return Boolean is
      begin
          return V.Méret = 0;
      end;

      function Is_Full( V: Verem ) return Boolean is
      begin
          return False;
      end;

      function Size( V: Verem ) return Natural is
      begin
          return V.Méret;
      end;

end Vermek;
