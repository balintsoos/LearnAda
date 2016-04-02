with Ada.Text_IO;
use Ada.Text_IO;

procedure SumDiagonal is

  type Index is new Integer;
  type Elem is new Integer;
  type Matrix is array (Index range <>, Index range <>) of Elem;

  procedure Print ( M: in Matrix ) is
  begin
      for I in M'Range(1) loop
          for J in M'Range(2) loop
              Put( Elem'Image(M(I,J)) );
              Put( Ascii.HT );
          end loop;
          New_Line;
      end loop;
  end Print;

  function Sum (M: Matrix) return Elem is
    S: Elem := 0;
  begin
    for I in M'Range(1) loop
      S := S + M(I, I - M'First(1) + M'First(2));
    end loop;
    return S;
  end Sum;

  M: Matrix := ((1,2,3),(1,2,3),(1,2,3));
  S: Elem := 0;

begin
  Print(M);
  S := Sum(M);
  Put( Elem'Image(S) );
end SumDiagonal;
