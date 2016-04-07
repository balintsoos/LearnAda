with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

with bintree;

procedure demo is

  type Tomb is array (Integer range <>) of Integer;

  arr : Tomb(1 .. 3) := (1,2,3);

  function beta(item : Integer; parent : Integer) return Boolean is
	begin
		return item / 2 = parent;
	end beta;

  function tree is new bintree(Integer, Tomb, beta);

  result : Boolean;

begin
  result := tree(arr);

  if result then
    Put("true");
  else
    Put("false");
  end if;

end demo;
