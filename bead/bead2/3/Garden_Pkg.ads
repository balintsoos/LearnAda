package Garden_Pkg is

  subtype Position is Positive range 1..10;

  function GetRandPos return Position;
  function GetField(pos : Position) return Boolean;
  procedure SprayField(pos : Position);
  procedure SprayAbsorbed;

  private
  type Fields is array(Integer range <>) of Boolean;
  Garden : Fields(1..10) := (1..10 => false);

end Garden_Pkg;
