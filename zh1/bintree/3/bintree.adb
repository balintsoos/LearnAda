
function bintree(t : in out Tomb) return Boolean is
  l : Boolean := false;
  item : Elem;
  parent : Elem;
  parentIndex : Integer;
begin -- bintree

  for i in t'range loop
    item := t(i);
    parentIndex := i / 2;

    if parentIndex < 1 then
      parentIndex := 1;
    end if;

    parent := t(parentIndex);

    if beta(item, parent) then
      l := true;
    end if;
  end loop;

  return l;
  
end bintree;
