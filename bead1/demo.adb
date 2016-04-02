with J_String_Pkg, Text_IO, Ada.Integer_Text_IO;
use J_String_Pkg, Text_IO, Ada.Integer_Text_IO;

procedure demo is
  Str : String := "test";
  Js : J_String := Create(Str);

  Js1 : J_String := Create("test");
  Js2 : J_String := Create("tes");
  Js3 : J_String;

begin
  Put_Line(Value_Of(Js));
  Put_Line(""&Char_At(Js, 1));

  if Compare_To(Js, Js1) then
    Put_Line("it's the same");
  end if;

  if Compare_To(Js, Js2) = false then
    Put_Line("it's not the same");
  end if;

  Js3 := Concat(Js1, Js2);
  Put_Line(Value_Of(Js3));

  if Contains(Js1, Value_Of(Js2)) then
    Put_Line("true");
  end if;

  if Contains(Js2, Value_Of(Js1)) = false then
    Put_Line("false");
  end if;

  if Ends_With(Js1, 't') then
    Put_Line("true");
  end if;

  if Ends_With(Js1, 'a') = false then
    Put_Line("false");
  end if;


end demo;
