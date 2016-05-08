with Ada.Text_IO;
use Ada.Text_IO;

procedure CipoPor is
    -- task Por
    task Por is
        entry labnyom;
    end Por;

    task body Por is
    begin
        for I in 1..10 loop
            accept labnyom do
                Put_Line("Labnyom a homokban");
            end labnyom;
        end loop;
    end Por;
  -- end task Por

    -- task type Cipo
    task type Cipo;

    task body Cipo is
    begin
        Por.labnyom;
        Put_Line("Lepek");
        delay 0.1;
        loop
            Por.labnyom;
            Put_Line("Lepek");
            delay 0.1;
        end loop;
    end Cipo;
    -- end task type Cipo

    type Cipo_Access is access Cipo;
    C: Cipo_Access;

begin
    for I in 1..5 loop
        delay 3.0;
        Put_Line("Egy cipo a porban");
        C := new Cipo;
    end loop;
end CipoPor;
