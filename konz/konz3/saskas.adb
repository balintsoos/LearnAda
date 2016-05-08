with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;
use Ada.Text_IO;
procedure Saskas is

	subtype Rand1_10 is Integer range 1..10;
	package RandomPos is new Ada.Numerics.Discrete_Random(Rand1_10);
	seed: RandomPos.Generator;

	protected Kiiro is
		entry Kiir(mit: String);
	end Kiiro;

	protected body Kiiro is
		entry Kiir(mit: String) when true is
		begin
			Put_Line(mit);
		end Kiir;
	end Kiiro;

	type KertParcella is array(Integer range <>) of Boolean;

	protected Kert is
		procedure Ugrik(pos: Integer; elet: in out integer);
		procedure Permetez(pos: Integer);
		procedure Felszivodik;
		private
			K: KertParcella(1..10) := (1..10 => false);
	end Kert;

	protected body Kert is
		procedure Ugrik(pos: Integer; elet: in out integer) is
		begin
			if(K(pos) = true) then
				elet := elet -1;
				Kiiro.Kiir("Saska: Meghaltam"); 
			end if;
		end Ugrik;
		
		procedure Permetez(pos: Integer) is
		begin
			Felszivodik;
			K(pos) := true;
		end Permetez;
		
		procedure Felszivodik is
		begin
			K := (1..10 => false);
		end Felszivodik;
	end Kert;

	task Saska is
	end Saska;

	task body Saska is
		Pozicio: Integer;
		Elet: Natural := 1;
	begin
		while Elet > 0 loop
			Pozicio := RandomPos.Random(seed);
			Kiiro.Kiir("Saska: Ugrok egyet ide: " & Integer'Image(Pozicio)); 
			Kert.Ugrik(Pozicio,Elet);
			delay 1.0;
		end loop;
	end Saska;

	task Kertesz is
	end Kertesz;

	task body Kertesz is
		PermetPos: Integer;
	begin
		while Saska'Callable loop
			PermetPos := RandomPos.Random(seed);
			Kiiro.Kiir("Kertesz: Permetezek egyet itt: " & Integer'Image(PermetPos)); 
			Kert.Permetez(PermetPos);
			delay 1.0;
		end loop;
	end Kertesz;
	

	
begin 
	RandomPos.Reset(seed);
end Saskas;