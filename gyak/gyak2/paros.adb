with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
with Mat; -- use Mat;
procedure paros is
   N : Natural;
begin
   Get( N );
   Put( Boolean'image(Mat.isEven(N)));
end paros;
