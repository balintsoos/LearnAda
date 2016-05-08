with Ada.Integer_Text_IO, tools;
use Ada.Integer_Text_IO, tools;

package body Garden_Pkg is

  package Position_Generator is new Random_Generator(Position);

  function GetRandPos return Position is
  begin
    return Position_Generator.GetRandom;
  end GetRandPos;

  function GetField(pos : Position) return Boolean is
  begin
    return Fields(pos);
  end GetField;

  task body Mantis is
    pos : Position := GetRandPos;
    alive : Boolean := true;

    procedure Jump is
    begin
      pos := GetRandPos;
      Output.Puts("Mantis jumped - pos:" & Position'Image(pos), 1);
    end Jump;

    procedure Poisoned is
    begin
      alive := false;
      Output.Puts("Mantis died - pos:" & Position'Image(pos), 1);
      numberOfMantises := numberOfMantises - 1;
    end Poisoned;

  begin
    Output.Puts("Mantis created - pos:" & Position'Image(pos), 1);
    while alive and John'Callable loop
      if GetField(pos) = true then
        Poisoned;
      else
        Jump;
        if GetField(pos) = true then
          Poisoned;
        end if;
      end if;
      delay 0.1;
    end loop;
  end Mantis;

  task body Gardener is
    pos : Position := GetRandPos;

    procedure SprayField is
    begin
      Fields(pos) := true;
      Output.Puts("Gardener sprayed - pos:" & Position'Image(pos), 1);
    end SprayField;

    procedure SprayAbsorbed is
    begin
      for i in Position'Range loop
        Fields(i) := false;
      end loop;
      Output.Puts("Spray absorbed", 1);
    end SprayAbsorbed;

  begin
    Output.Puts("Gardener created - pos:" & Position'Image(pos), 1);
    while numberOfMantises > 0 loop
      pos := GetRandPos;
      SprayField;
      delay 0.2;
      SprayAbsorbed;
    end loop;
  end Gardener;

  procedure Start is
    numberOfLarvae : Natural;
  begin
    Output.Puts("Number of mantise larvae:", 0);
    Get(numberOfLarvae);

    numberOfMantises := numberOfLarvae + 1;

    declare
      mantises : Mantis_Array(1 .. numberOfMantises);

      procedure createMantises is
      begin
        for i in 1 .. numberOfMantises loop
          mantises(i) := new Mantis;
        end loop;
      end createMantises;

      procedure createFields is
      begin
        for i in Position'Range loop
          Fields(i) := false;
        end loop;
      end createFields;

    begin
      John := new Gardener;
      createFields;
      createMantises;
    end;

  end Start;

end Garden_Pkg;
