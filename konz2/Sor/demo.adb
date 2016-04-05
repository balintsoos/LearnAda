with sor;
with Ada.Text_IO;
use Ada.Text_IO;
--use sor; -> you can't do this because it's a generic

procedure demo is

	procedure alma(A : integer) is
	begin
		Put_Line(Integer'image(A));
	end alma;

	procedure korte(A : Character) is
	begin
		Put_Line(Character'image(A));
	end korte;

	function fele(i : Integer) return Integer is
	begin
		return i / 2;
	end fele;

	package sorom is new sor(Integer, alma);
	package sorom2 is new sor(Character, korte);

	procedure peldany is new sorom.feltetelesKiiras(fele);

	a: sorom.sora(10);
	b: sorom2.sora(10);
begin
	sorom.push(a, 100);
	sorom.push(a, 342);
	sorom.pop(a);

	sorom.push(a, 1);
	sorom.kiir(a);

	peldany(a);

	sorom2.push(b, 'a');
	sorom2.push(b, 'b');
	sorom2.pop(b);
	sorom2.kiir(b);

end demo;
