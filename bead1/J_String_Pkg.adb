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
  begin
    return Index_Of(S, Pattern) /= -1;
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

  function Index_Of(S : J_String; Ch : Character) return Integer is
  begin
    return Index_Of(S, Ch, 1);
  end Index_Of;

  function Index_Of(S : J_String; Ch : Character; From_Index : Positive) return Integer is
    index : Integer := -1;
  begin
    if From_Index > S.size then
      return index;
    end if;
    for i in From_Index .. S.size loop
      if S.value(i) = Ch then
        index := i;
        exit;
      end if;
    end loop;
    return index;
  end Index_Of;

  function Index_Of(S : J_String; Pattern : String) return Integer is
    index : Integer := -1;
    l : Boolean := true;
  begin
    if Pattern'length > S.size then
      return index;
    end if;

    for i in 1 .. (S.size - Pattern'length + 1) loop
      l := true;
      for j in 1 .. Pattern'length loop
        if S.value(i + j - 1) /= Pattern(j) then
          l := false;
          exit;
        end if;
      end loop;
      if l then
        index := i;
      end if;
    end loop;

    return index;
  end Index_Of;

  function Is_Empty(S : J_String) return Boolean is
  begin
    return S.size = 0;
  end Is_Empty;

  function Last_Index_Of(S : J_String; Ch : Character) return Integer is
  begin
    return Last_Index_Of(S, Ch, S.size);
  end Last_Index_Of;

  function Last_Index_Of(S : J_String; Ch : Character; From_Index : Positive) return Integer is
    index : Integer := -1;
  begin
    if From_Index > S.size then
      return index;
    end if;
    for i in 1 .. From_Index loop
      if S.value(i) = Ch then
        index := i;
      end if;
    end loop;
    return index;
  end Last_Index_Of;

  function Length(S : J_String) return Natural is
  begin
    return S.size;
  end Length;

  function Replace(S : J_String; Old_Ch, New_Ch : Character) return J_String is
    New_S : J_String := S;
  begin
    for i in 1 .. New_S.size loop
      if New_S.value(i) = Old_Ch then
        New_S.value(i) := New_Ch;
      end if;
    end loop;
    return New_S;
  end Replace;

end J_String_Pkg;
