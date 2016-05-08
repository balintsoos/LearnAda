with Ada.Integer_Text_IO, tools;
use Ada.Integer_Text_IO, tools;

package body Garden_Pkg is

  package Position_Generator is new Random_Generator(Position);
  subtype Chance is Positive range 1 .. 100;
  package Chance_Generator is new Random_Generator(Chance);

  function GetRandPos return Position is
  begin
    return Position_Generator.GetRandom;
  end GetRandPos;

  function GetField(pos : Position) return Natural is
  begin
    return Fields(pos);
  end GetField;

  procedure SetAllFields(value : Natural) is
  begin
    for i in Position'Range loop
      Fields(i) := value;
    end loop;
  end;

  procedure ResetFields is
  begin
    SetAllFields(0);
  end;

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
      if GetField(pos) > 0 then
        Poisoned;
      else
        Jump;
        if GetField(pos) > 0 then
          Poisoned;
        end if;
      end if;
      delay 0.1;
    end loop;
  end Mantis;

  task body Gardener is
    pos : Position := GetRandPos;
    overdose : Natural := 0;

    procedure IncreaseDaysOfSprayEffect is
    begin
      daysOfSprayEffect := daysOfSprayEffect + 1;
      Output.Puts("Look, a mantis!", 1);
    end IncreaseDaysOfSprayEffect;

    procedure SprayField is
    begin
      Fields(pos) := daysOfSprayEffect;
      Output.Puts("Gardener sprayed - pos:" & Position'Image(pos), 1);
    end SprayField;

    procedure DecreaseSprayEffectOnAllFields is
    begin
      for i in Position'Range loop
        if Fields(i) > 0 then
          Fields(i) := Fields(i) - 1;
        end if;
      end loop;
    end DecreaseSprayEffectOnAllFields;

  begin
    Output.Puts("Gardener created - pos:" & Position'Image(pos), 1);
    while numberOfMantises > 0 and overdose < 3 loop
      pos := GetRandPos;

      if Chance_Generator.GetRandom <= 20 then
        IncreaseDaysOfSprayEffect;
			end if;

      SprayField;

      if Chance_Generator.GetRandom <= 30 then
        overdose := overdose + 1;
        Output.Puts("Overdose for the" & Natural'Image(overdose) & ". time in a row", 1);
      else
        overdose := 0;
			end if;

      delay 0.5; -- 1 day
      DecreaseSprayEffectOnAllFields;
    end loop;

    if numberOfMantises = 0 then
      Output.Puts("Every mantis is dead", 1);
    elsif overdose = 3 then
      Output.Puts("John is dead", 1);
    end if;
  end Gardener;

  procedure Start is
    numberOfLarvae : Natural;
  begin
    Output.Puts("Number of mantise larvae: ", 0);
    Get(numberOfLarvae);

    Output.Puts("Spray effect (in days): ", 0);
    Get(daysOfSprayEffect);

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
        ResetFields;
      end createFields;

    begin
      John := new Gardener;
      createFields;
      createMantises;
    end;

  end Start;

end Garden_Pkg;
