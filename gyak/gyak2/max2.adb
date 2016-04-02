with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Mat; -- use Mat;
procedure Max2 is
   A, B : Positive;
begin
   Get( A );
   Get( B );
   Put( Mat.Max2(A,B) );
end Max2;
