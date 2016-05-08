generic
  type Position is (<>);

package Garden_Pkg is

  function GetRandPos return Position;
  function GetField(pos : Position) return Natural;
  procedure SetAllFields(value : Natural);
  procedure ResetFields;
  procedure Start;

  task type Gardener;
  task type Mantis;

  type Mantis_Access is access Mantis;
  type Mantis_Array is array (Integer range <>) of Mantis_Access;

  numberOfMantises : Natural;
  daysOfSprayEffect : Positive;

  John : access Gardener;
  Fields : array(Position) of Natural;

end Garden_Pkg;
