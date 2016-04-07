with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

with bintree;

procedure demo is

  type Tomb is array (Integer range <>) of Integer;

  function beta(item : Integer; parent : Integer) return Boolean is
	begin
		return item / 2 = parent;
	end beta;

  function tree is new bintree(Integer, Tomb, beta);

  result : Boolean;
  arrLength : Integer := 10000;
  arrItem : Integer;
  arr : Tomb(1 .. arrLength);

begin
  Put("Length of array: ");
  Get(arrLength);

  for i in 1 .. arrLength loop
    Put("Item ");
    Put(i, 0);
    Put(": ");

    Get(arrItem);
    arr(i) := arrItem;
  end loop;


  result := tree(arr);

  if result then
    Put("true");
  else
    Put("false");
  end if;

end demo;
