with Ada.Text_IO;
use Ada.Text_IO;

procedure Szummazas_Rek is

    type Index is new Integer;
    type Elem is new Integer;
    type Tomb is array (Index range <>) of Elem;

    function Szumma ( T: Tomb; S: Elem ) return Elem is
    begin
      if T'Length > 1 then
        return Szumma(T(T'First..Index'Pred(T'Last)), S + T(T'Last));
      else
        return S + T(T'Last);
      end if;
    end Szumma;

    function Szumma2 ( T: Tomb ) return Elem is
    begin
      if T'Length > 1 then
        return T(T'Last) + Szumma2(T(T'First..Index'Pred(T'Last)));
      else
        return T(T'Last);
      end if;
    end Szumma2;

begin

    Put_Line( Elem'Image( Szumma((3,2,5,7,1), 0) ) );
    Put_Line( Elem'Image( Szumma2((3,2,5,7,1)) ) );

end Szummazas_Rek;
