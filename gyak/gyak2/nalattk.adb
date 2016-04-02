with Ada.Integer_Text_IO;
procedure nAlattK is
   N, K : Positive;
   Result : Positive := 1;
begin
   Ada.Integer_Text_IO.Get( N );   -- Constraint_Error!
   Ada.Integer_Text_IO.Get( K );
   for I in 1..K loop
      Result := Result * (N - I + 1) / I;
   end loop;
   Ada.Integer_Text_IO.Put( Result );
end nAlattK;
