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

  function Char_At(S : J_String; P : Positive) return Character is
  begin
    return S.value(P);
  end Char_At;

  function Compare_To(S_Left, S_Right : J_String) return Boolean is
  begin
    return S_Left.value = S_Right.value;
  end Compare_To;

  function Concat(S_Left, S_Right : J_String) return J_String is
    S : J_String(S_Left.size + S_Right.size);
  begin
    S.value := S_Left.value & S_Right.value;
    return S;
  end Concat;

  function Contains(S : J_String; Pattern : String) return Boolean is
    l : Boolean := false;
  begin
    for i in 1 .. (S.size - Pattern'length + 1) loop
      l := true;
      for j in 1 .. Pattern'length loop
        if S.value(i + j - 1) /= Pattern(j) then
          l := false;
        end if;
      end loop;
      exit when l = true;
    end loop;
    return l;
  end Contains;

  function Ends_With(S : J_String; Ch : Character) return Boolean is
  begin
    return S.value(S.size) = Ch;
  end Ends_With;

  function Ends_With(S : J_String; Pattern : String) return Boolean is
    l : Boolean := true;
  begin
    if Pattern'length > S.size then
      return false;
    end if;
    for i in S.size - Pattern'length + 1 .. S.size loop
      if S.value(i) /= Pattern(i - S.size + Pattern'length) then
  			l := false;
  		end if;
    end loop;
    return l;
  end Ends_With;

  function "="(S_Left, S_Right : J_String) return Boolean is
  begin
    return Compare_To(S_Left, S_Right);
  end "=";
end J_String_Pkg;
