package body Linked_List_Pkg is

      procedure Push( L : in out Linked_List; E : in Elem ) is
      begin
        if Is_Empty(L) then
          L.back := new Vertex'(E, null);
          L.front := L.back;
        else
          L.back.next := new Vertex'(E, null);
          L.back := L.back.next;
        end if;
        L.size := L.size + 1;
      end;

      procedure Pop( L : in out Linked_List; E : out Elem ) is
      begin
        if Is_Empty(L) = false then
          E := L.front.data;
          L.front := L.front.next;
          L.size := L.size - 1;
        end if;
        -- TODO: Exception hadling
      end;

      function Is_Empty( L : Linked_List ) return Boolean is
      begin
          return L.size = 0;
      end;

      function Size( L : Linked_List ) return Natural is
      begin
          return L.size;
      end;

end Linked_List_Pkg;
