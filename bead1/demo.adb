with J_String_Pkg, Text_IO, Ada.Integer_Text_IO;
use J_String_Pkg, Text_IO, Ada.Integer_Text_IO;

procedure demo is
  Str : String := "test";
  JS : J_String;
begin
  JS := Create(Str);
  Put_Line(Value_Of(JS));
end demo;
