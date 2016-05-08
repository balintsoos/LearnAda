with Ada.Text_IO, Ada.Calendar, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure Utkereszt is

  type lampaszinek is (piros, pirossarga, zold, sarga);


  protected jelzolampa is
      procedure valt;
      function szin return lampaszinek;
      private aktszin : lampaszinek := piros;
  end jelzolampa;

  protected body jelzolampa is
    procedure valt is
    begin -- valt
      if aktszin = sarga then
        aktszin := piros;
      else
        aktszin := lampaszinek'Succ(aktszin);
      end if;
      Put_Line("Lampa szine: " & lampaszinek'Image(aktszin));
    end valt;

    function szin return lampaszinek is
    begin -- szin
      return aktszin;
    end szin;
  end jelzolampa;

  task utemezo;

  task body utemezo is
  begin
    for i in 1 .. 3 loop
      jelzolampa.valt;
      delay 3.0;
      jelzolampa.valt;
      delay 0.5;
      jelzolampa.valt;
      delay 2.0;
      jelzolampa.valt;
      delay 1.0;
    end loop;
  end utemezo;

  type String_Access is access String;
  type Duration_Access is access Duration;
  task type Auto( rendszam: String_Access; menetidoalampaig: Duration_Access );
  type Auto_Access is access Auto;

  task body Auto is
    Atment : Boolean := false;
  begin
     Put_Line(rendszam.all & "elindult");
     delay(menetidoalampaig.all);
     Put_Line(rendszam.all & "odaert a lampahoz");
     while not Atment loop
       select
       jelzolampa.athalad;
       Atment := true;
       or
       delay 0.2;
       Put_Line(rendszam.all & "varakozik a lampanal");
     end select;
     end loop;
  end Auto;

  autok : array(1 .. 3) of Auto_Access;

begin -- Utkereszt
  autok(1) := new Auto(new String("AAA-111"), new Duration'(1.5));
  autok(2) := new Auto(new String("BBB-111"), new Duration'(3.3));
  autok(3) := new Auto(new String("CCC-111"), new Duration'(7.5));
end Utkereszt;
