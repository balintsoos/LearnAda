with Garden_Pkg, tools;
use Garden_Pkg, tools;

procedure main is

  task Mantis;
  task Gardener;

  task body Mantis is
    pos : Position := GetRandPos;
    hp : Natural := 1;
  begin
    while hp > 0 loop
      if GetField(pos) = true then
        hp := hp - 1;
        Output.Puts("Mantis died - pos:" & Position'Image(pos), 1);
      else
        pos := GetRandPos;
        Output.Puts("Mantis jumped - pos:" & Position'Image(pos), 1);
        if GetField(pos) = true then
          hp := hp - 1;
          Output.Puts("Mantis died - pos:" & Position'Image(pos), 1);
        end if;
      end if;
      delay 0.1;
    end loop;
  end Mantis;

  task body Gardener is
    pos : Position := GetRandPos;
  begin
    while Mantis'Callable loop
      pos := GetRandPos;
      SprayField(pos);
      Output.Puts("Gardener sprayed - pos:" & Position'Image(pos), 1);
      delay 0.2;
      SprayAbsorbed;
      Output.Puts("Spray absorbed", 1);
    end loop;
  end Gardener;

begin
  null;

exception
  when others => Output.Puts("Catched an exception in main.");

end main;
