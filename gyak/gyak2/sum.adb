with Ada.Integer_Text_IO;
procedure Sum is
   N : Integer;
   Sum : Integer := 1;
begin
   Ada.Integer_Text_IO.Get( N );
   for I in 1..N loop
      Sum := Sum + I;
   end loop;
   Ada.Integer_Text_IO.Put( Sum );
end Sum;
