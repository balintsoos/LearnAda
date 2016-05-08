with Ada.Text_IO;
use Ada.Text_IO;

with Linked_List_Pkg;

procedure demo is
  package List is new Linked_List_Pkg(Integer);
  use List;

  L : Linked_List;
begin
  Put_Line(Boolean'Image(Is_Empty(L)));
end demo;
