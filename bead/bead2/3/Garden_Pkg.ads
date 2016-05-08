generic
  type Position is (<>);

package Garden_Pkg is

  function GetRandPos return Position;
  function GetField(pos : Position) return Boolean;
  procedure SprayField(pos : Position);
  procedure SprayAbsorbed;

  Fields : array(Position) of Boolean;

end Garden_Pkg;
