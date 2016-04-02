with J_String_Pkg, Text_IO, Ada.Integer_Text_IO;
use J_String_Pkg, Text_IO, Ada.Integer_Text_IO;

procedure demo is
  Str : String := "test";
  Js : J_String := Create(Str);
  Js1 : J_String := Create("test");
  Js2 : J_String := Create("tes");

  numberOfTests : Natural := 14;
  numberOfpassedTests : Natural := 0;

  procedure passed(Func : String) is
  begin
    Put_Line(Func & " - passed");
    numberOfpassedTests := numberOfpassedTests + 1;
  end passed;

begin
  if Value_Of(Create("asd")) = "asd" then
    passed("Create");
  end if;

  if Value_Of(Js) = "test" then
    passed("Value_Of");
  end if;

  if Char_At(Js, 1) = 't' then
    passed("Char_At");
  end if;

  if Compare_To(Js, Js1) then
    passed("Compare_To");
  end if;

  if Compare_To(Js, Js2) = false then
    passed("Compare_To");
  end if;

  if Value_Of(Concat(Js1, Js2)) = "testtes" then
    passed("Concat");
  end if;

  if Contains(Js1, Value_Of(Js2)) then
    passed("Contains");
  end if;

  if Contains(Js2, Value_Of(Js1)) = false then
    passed("Contains");
  end if;

  if Ends_With(Js1, 't') then
    passed("Ends_With");
  end if;

  if Ends_With(Js1, 'a') = false then
    passed("Ends_With");
  end if;

  if Ends_With(Js1, "st") then
    passed("Ends_With");
  end if;

  if Ends_With(Js1, "at") = false then
    passed("Ends_With");
  end if;

  if Js = Js1 then
    passed("=");
  end if;

  if Js1 /= Js2 then
    passed("=");
  end if;

  Put(numberOfpassedTests);
  Put(" / ");
  Put(numberOfTests);
  Put(" passed");
end demo;
