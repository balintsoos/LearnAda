package body J_String_Pkg is

  function Create(Str : String) return J_String is
    S : J_String(Str'length);
  begin
    S.value := Str;
    return S;
  end Create;

  function Value_Of(S : J_String) return String is
    Str : String(1 .. S.size);
  begin
    Str := S.value;
    return Str;
  end Value_Of;

end J_String_Pkg;
