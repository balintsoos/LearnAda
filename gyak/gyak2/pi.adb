with Ada.Float_Text_IO;
with Ada.Numerics;
 procedure Pi (Value : in Value_Type);
   Prod : Float := 1.0;
   Szamlalo : Float := 0.0;
   Diff: constant Float := 0.0001;
   Pi : Value_Type := Ada.Numerics.Pi;
procedure Pi (Value : in Value_Type) is
begin
   loop
      Szamlalo := Szamlalo + 2.0;
      Prod := Prod * (Szamlalo / (Szamlalo - 1.0)) * (Szamlalo / (Szamlalo + 1.0));
      exit when abs (Pi / 2.00 - Prod ) < Diff;
   end loop;
   Ada.Float_Text_IO.Put( 2.0 * Prod );
end Pi;
