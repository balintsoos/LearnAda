generic
  type Position is (<>);

package Garden_Pkg is

  function GetRandPos return Position;
  function GetField(pos : Position) return Boolean;
  procedure Start;

  task type Gardener;
  task type Mantis;

  type Mantis_Access is access Mantis;
  type Mantis_Array is array (Integer range <>) of Mantis_Access;

  numberOfMantises : Natural;

  John : access Gardener;

  Fields : array(Position) of Boolean;

end Garden_Pkg;
