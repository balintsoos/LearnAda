generic

      type Elem is (<>);

package Linked_List_Pkg is

      type Linked_List is limited private;
      type Vertex is private;

      Empty_Linked_List : exception;

      procedure Push( L : in out Linked_List; E : in Elem );
      procedure Pop( L : in out Linked_List; E : out Elem );
        -- can raise Empty_Linked_List exception;

      function Is_Empty( L : Linked_List ) return Boolean;
      function Size( L : Linked_List ) return Natural;

private
      type Pointer is access Vertex;

      type Vertex is record
        data: Elem;
        next: Pointer := null;
      end record;

      type Linked_List is record
        size: Natural := 0;
        front: Pointer := null;
        back: Pointer := null;
      end record;
end Linked_List_Pkg;
