with Ada.Text_IO, Ada.Integer_Text_IO, Garden_Pkg, tools;
use Ada.Text_IO, Ada.Integer_Text_IO, Garden_Pkg, tools;

procedure main is

  task type Mantis;

  task Gardener is
    entry MantisBorn;
    entry MantisDied;
  end Gardener;

  type Mantis_Access is access Mantis;
  type Mantis_Array is array (Integer range <>) of Mantis_Access;

  task body Mantis is
    pos : Position := GetRandPos;
    hp : Natural := 1;

    procedure MantisPoisoned is
    begin
      hp := hp - 1;
      Output.Puts("Mantis died - pos:" & Position'Image(pos), 1);
      Gardener.MantisDied;
    end MantisPoisoned;

  begin
    Gardener.MantisBorn;

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
    numberOfAliveMantises : Boolean := 0;
  begin
    loop
      select
      accept MantisBorn do
        numberOfAliveMantises := numberOfAliveMantises + 1;
      end MantisBorn;



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

begin
  Get(numberOfMantises);

  declare
    mantises : Mantis_Array (1 .. numberOfMantises) := (others => new Mantis);
  begin
    null;
  end;

end main;
