package sor is
	type sora(max:positive:=10) is private;
	
	procedure push(s:in out sora; e:integer);
	procedure pop(s:in out sora);
	procedure kiir(s:sora);
	
	private
		type tomb is array(integer range <>) of integer;
		type sora(max:positive:=10) is record
			t:tomb(1..max);
			--t:array(1..max)of integer;
			hossz : natural:=0;
		end record;

end;
