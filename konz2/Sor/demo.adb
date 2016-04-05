with sor;
--use sor; -> you can't do this because it's a generic


procedure demo is
	package sorom is new sor(Integer);
	package sorom2 is new sor(Character);

	a: sorom.sora(10);
	b: sorom2.sora(10);
begin
	sorom.push(a, 100);
	sorom.push(a, 342);
	sorom.pop(a);
	--sorom.kiir(a);

	sorom2.push(b, 'a');
	sorom2.push(b, 'b');
	sorom2.pop(b);
	--sorom2.kiir(b);

end demo;
