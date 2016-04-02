with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;

with Mat; -- use Mat;
procedure signOf is
   N : Integer;
begin
   Get( N );
   Put( Mat.signof(N));
end signOf;
