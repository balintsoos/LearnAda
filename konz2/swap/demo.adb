with swap, ada.text_io;
use ada.text_io;

procedure demo is
a:integer:=3;
b:integer:=5;
begin
put_line("A:"&integer'image(a)&", B:"&integer'image(b));
swap(a,b);
put_line("A:"&integer'image(a)&", B:"&integer'image(b));

end demo;