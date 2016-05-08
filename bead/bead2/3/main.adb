with Ada.Text_IO, Ada.Integer_Text_IO, Garden_Pkg, tools;
use Ada.Text_IO, Ada.Integer_Text_IO, tools;

procedure main is

  task type Gardener;
  task type Mantis;

  type Gardener_Access is access Gardener;
  type Mantis_Array is array (Integer range <>) of Mantis;
  type Mantis_Array_Access is access Mantis_Array;

  mantises : access Mantis_Array;

  task body Mantis is
    pos : Position := GetRandPos;
    hp : Natural := 1;

    procedure MantisPoisoned is
    begin
      hp := hp - 1;
      Output.Puts("Mantis died - pos:" & Position'Image(pos), 1);
    end MantisPoisoned;

  begin
    while hp > 0 loop
      if GetField(pos) = true then
        MantisPoisoned;
      else
        pos := GetRandPos;
        Output.Puts("Mantis jumped - pos:" & Position'Image(pos), 1);
        if GetField(pos) = true then
          MantisPoisoned;
        end if;
      end if;
      delay 0.1;
    end loop;
  end Mantis;

  task body Gardener is
    pos : Position := GetRandPos;
    isOneMantisAlive : Boolean := true;
  begin
    while isOneMantisAlive loop
      pos := GetRandPos;
      SprayField(pos);
      Output.Puts("Gardener sprayed - pos:" & Position'Image(pos), 1);
      delay 0.2;
      SprayAbsorbed;
      Output.Puts("Spray absorbed", 1);
    end loop;
  end Gardener;

  numberOfMantises : Positive;
  numberOfFields : Positive;

begin
  Output.Puts("Number of mantises:", 0);
  Get(numberOfMantises);

  Output.Puts("Number of fields:", 0);
  Get(numberOfFields);

  mantises := new Mantis_Array(1 .. numberOfMantises + 1);

  declare
    subtype Position is Positive range 1 .. numberOfFields;
    package Garden is new Garden_Pkg(Position);

    gardenerMan : Gardener_Access := new Gardener;
  begin
    null;
  end;
end main;
