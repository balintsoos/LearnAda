with ada.text_io;
use ada.text_IO;

Package body sor is

	procedure push(s : in out sora; e : elem) is
	begin
		s.hossz := s.hossz+1;
		s.t(s.hossz) := e;
	end;

	procedure pop(s : in out sora) is
	begin
		for i in 2 .. s.hossz loop
			s.t(i-1) := s.t(i);
		end loop;
		s.hossz := s.hossz-1;
	end;

	procedure kiir(s : sora) is
	begin
		for i in 1..s.hossz loop
			kiirok(s.t(i));
		end loop;
	end;

	procedure feltetelesKiiras(s : sora) is
	begin
		Put_Line(elem'image(s.t(felt(s.hossz))));
	end;

end;
