with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
with Mat; -- use Mat;
procedure powerof is
   X : Integer;
   N : Integer;
begin
Get( X );
Get( N );
   Put( Mat.powerof(X,N) );
end powerof;
