with Ada.Text_IO, Reversal;
use Ada.Text_IO;

procedure Reversalas is

    type Tomb is array (Character range <>) of Float;
    procedure Revelsald is new Reversal(Float,Character,Tomb);

    T: Tomb := (3.0,6.2,1.7,5.2,3.9);

begin
    Revelsald(T);
    for I in T'Range loop
       Put_Line( Float'Image( T(I) ) );
    end loop;
end Reversalas;
