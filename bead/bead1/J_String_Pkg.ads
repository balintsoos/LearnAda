package J_String_Pkg is

  subtype J_Length is Natural range 0 .. 1024;

  type J_String(size : J_Length := 20) is private;

  -- functions
  function Create(Str : String) return J_String;
  function Value_Of(S : J_String) return String;
  function Char_At(S : J_String; P : Positive) return Character;
  function Compare_To(S_Left, S_Right : J_String) return Boolean;
  function Concat(S_Left, S_Right : J_String) return J_String;
  function Contains(S : J_String; Pattern : String) return Boolean;
  function Ends_With(S : J_String; Ch : Character) return Boolean;
  function Ends_With(S : J_String; Pattern : String) return Boolean;
  function "="(S_Left, S_Right : J_String) return Boolean;
  function Index_Of(S : J_String; Ch : Character) return Integer;
  function Index_Of(S : J_String; Ch : Character; From_Index : Positive) return Integer;
  function Index_Of(S : J_String; Pattern : String) return Integer;
  function Is_Empty(S : J_String) return Boolean;
  function Last_Index_Of(S : J_String; Ch : Character) return Integer;
  function Last_Index_Of(S : J_String; Ch : Character; From_Index : Positive) return Integer;
  function Length(S : J_String) return Natural;
  function Replace(S : J_String; Old_Ch, New_Ch : Character) return J_String;
  function Starts_With(S : J_String; Ch : Character) return Boolean;
  function Starts_With(S : J_String; Pattern : String) return Boolean;
  function Substring(S : J_String; Begin_Index : Positive) return J_String;
  function Substring(S : J_String; Begin_Index, End_Index : Positive) return J_String;

  -- private J_String type
  private
  type J_String(size : J_Length := 20) is record
    value : String(1 .. size);
  end record;

end J_String_Pkg;
