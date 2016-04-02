package J_String_Pkg is

  subtype Length is Natural range 0 .. 1024;
  type J_String(size : Length := 20) is private;

  -- functions
  function Create(Str : String) return J_String;
  function Value_Of(S : J_String) return String;
  function Char_At(S : J_String; P : Positive) return Character;
  function Compare_To(S_Left, S_Right : J_String) return Boolean;
  function Concat(S_Left, S_Right : J_String) return J_String;
  function Contains(S : J_String; Pattern : String) return Boolean;
  function Ends_With(S : J_String; Ch : Character) return Boolean;
  --
  private
  type J_String(size : Length := 20) is record
    value : String(1 .. size);
  end record;

end J_String_Pkg;
