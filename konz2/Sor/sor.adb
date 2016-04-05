with ada.text_io;
use ada.text_IO;

Package body sor is

	procedure push(s: in out sora; e:integer) is
	begin
		s.hossz:=s.hossz+1;
		s.t(s.hossz):=e;
	end;
	
	procedure pop(s:in out sora) is
	begin
		for i in 2..s.hossz loop
			s.t(i-1):=s.t(i);
		end loop;
		s.hossz:=s.hossz-1;
	end;
	
	
	procedure kiir(s:sora) is
	begin
		for i in 1..s.hossz loop
			put(integer'image(s.t(i)) );
		end loop;
	end;



end;