with J_String_Pkg, Text_IO, Ada.Integer_Text_IO;
use J_String_Pkg, Text_IO, Ada.Integer_Text_IO;

procedure spec is
  Str : String := "test";
  Js : J_String := Create(Str);
  Js1 : J_String := Create("test");
  Js2 : J_String := Create("tes");

  numberOfTests : Natural := 34;
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

  if Contains(Js1, "es") then
    passed("Contains");
  end if;

  if Contains(Js2, "os") = false then
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

  if Index_Of(Js1, 's') = 3 then
    passed("Index_Of");
  end if;

  if Index_Of(Js1, 't') = 1 then
    passed("Index_Of");
  end if;

  if Index_Of(Js1, 'x') = -1 then
    passed("Index_Of");
  end if;

  if Index_Of(Js1, 'e', 5) = -1 then
    passed("Index_Of");
  end if;

  if Index_Of(Js1, "est") = 2 then
    passed("Index_Of");
  end if;

  if Index_Of(Js1, "tes") = 1 then
    passed("Index_Of");
  end if;

  if Index_Of(Js1, "testt") = -1 then
    passed("Index_Of");
  end if;

  if Index_Of(Js1, "os") = -1 then
    passed("Index_Of");
  end if;

  if Is_Empty(Create("")) then
    passed("Is_Empty");
  end if;

  if Is_Empty(Create("a")) = false then
    passed("Is_Empty");
  end if;

  if Last_Index_Of(Create("abca"), 'a') = 4 then
    passed("Last_Index_Of");
  end if;

  if Last_Index_Of(Create("abca"), 'x') = -1 then
    passed("Last_Index_Of");
  end if;

  if Last_Index_Of(Create("abca"), 'a', 3) = 1 then
    passed("Last_Index_Of");
  end if;

  if Last_Index_Of(Create("abca"), 'c', 2) = -1 then
    passed("Last_Index_Of");
  end if;

  if Last_Index_Of(Create("abc"), 'c', 4) = -1 then
    passed("Last_Index_Of");
  end if;

  if Length(Create("abc")) = 3 then
    passed("Length");
  end if;

  if Length(Create("a")) = 1 then
    passed("Length");
  end if;

  if Length(Create("")) = 0 then
    passed("Length");
  end if;

  if Value_Of(Replace(Create("abc"), 'b', 'x')) = "axc" then
    passed("Replace");
  end if;

  if Value_Of(Replace(Create("abca"), 'a', 'x')) = "xbcx" then
    passed("Replace");
  end if;

  Put_Line("===============");
  Put(numberOfpassedTests, 0);
  Put(" / ");
  Put(numberOfTests, 0);
  Put(" passed");
end spec;
