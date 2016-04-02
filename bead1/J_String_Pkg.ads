package J_String_Pkg is

  subtype Length is Natural range 0 .. 1024;
  type J_String(size : Length := 20) is private;

  -- functions
  function Create(Str : String) return J_String;
  function Value_Of(S : J_String) return String;
  
  --
  private
  type J_String(size : Length := 20) is record
    value : String(1 .. size);
  end record;

end J_String_Pkg;
