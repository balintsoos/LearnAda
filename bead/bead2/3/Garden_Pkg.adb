with Ada.Text_IO, tools;
use Ada.Text_IO;

package body Garden_Pkg is

  package Position_Generator is new tools.Random_Generator(Position);

  function GetRandPos return Position is
  begin
    return Position_Generator.GetRandom;
  end GetRandPos;

  function GetField(pos : Position) return Boolean is
  begin
    return Garden(pos);
  end GetField;

  procedure SprayField(pos : Position) is
  begin
    Garden(pos) := true;
  end SprayField;

  procedure SprayAbsorbed is
  begin
    Garden := (1..10 => false);
  end SprayAbsorbed;

end Garden_Pkg;
