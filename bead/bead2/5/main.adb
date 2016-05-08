with Ada.Integer_Text_IO, tools, Garden_Pkg;
use Ada.Integer_Text_IO, tools;

procedure main is
  numberOfFields : Positive;
begin
  Output.Puts("Number of fields: ", 0);
  Get(numberOfFields);

  declare
    subtype Position is Positive range 1 .. numberOfFields;
    package Garden is new Garden_Pkg(Position);
  begin
    Garden.Start;
  end;
end main;
