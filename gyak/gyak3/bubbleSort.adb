with Ada.Text_IO;
use Ada.Text_IO;

procedure BubbleSort is

    type Index is new Integer;
    type Elem is new Integer;
    type Arr is array (Index range <>) of Elem;

    function Max_Hely ( T: Arr ) return Index is
        Mh: Index := T'First;
    begin
        for I in T'Range loop
            if T(Mh) < T(I) then
                Mh := I;
            end if;
        end loop;
        return Mh;
    end Max_Hely;

    procedure Swap ( A, B: in out Elem ) is
        Tmp: Elem := A;
    begin
        A := B;
        B := Tmp;
    end Swap;

    procedure Rendez ( T: in out Arr ) is
        Mh: Index;
    begin
        for I in reverse T'Range loop
            Mh := Max_Hely( T(T'First..I) );
	    Swap( T(I), T(Mh) );
        end loop;
    end Rendez;

    function Sort ( T: Arr ) return Arr is
        Uj: Arr := T;
    begin
        Rendez(Uj);
        return Uj;
    end Sort;

    A: Arr := (3,6,1,5,3);

begin
    A := Sort(A);
    for I in A'Range loop
       Put_Line( Elem'Image( A(I) ) );
    end loop;
end BubbleSort;
