with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
with Mat; -- use Mat;
procedure factorial is
   N : Natural;
begin
   Get( N );
   Put( Mat.factorial(N) );
end factorial;
