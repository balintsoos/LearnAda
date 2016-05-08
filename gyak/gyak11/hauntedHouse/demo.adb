with hauntedhouse, tools;
use hauntedhouse;

procedure Demo is

  -- Princess
  task princess is
     entry scare(ghostPos: Position);
  end princess;

  task body princess is
     pos : Position := (1,3);
     hp : Natural := 3;
  begin
    while hp > 0 loop
     select
       when IsCorridor(pos) => accept scare(ghostPos: Position) do
         if ghostPos.x = pos.x and ghostPos.y = pos.y then
           hp := hp - 1;
           tools.Output.Puts("Princess scared - hp:" & Natural'Image(hp), 1);
         end if;
       end scare;
     end select;
    end loop;
    tools.Output.Puts("Princess dead", 1);
  end princess;

  -- Ghost
  task type Ghost;

  task body Ghost is
     pos : Position;
  begin
     while princess'Callable loop
       pos := GetRandPos;
       tools.Output.Puts("Ghost" & Natural'Image(pos.x) & "," & Natural'Image(pos.y), 1);
       princess.scare(pos);
       delay 0.2;
     end loop;
  end Ghost;

  ghosts : array (1 .. 3) of Ghost;
begin
  null;
end Demo;
