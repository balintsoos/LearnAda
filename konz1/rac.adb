with Ada.Text_IO;
use Ada.Text_IO;

package body Rac is

  procedure egyszerusit (A: Raci) is
  begin
    null;
  end egyszerusit;

  function "/" (A: Integer; B: Positive) return Raci is
    C: Raci;
  begin
    C.szamlalo := A;
    C.nevezo := B;
    return C;
  end "/";

  function "+" (A: Raci; B: Raci) return Raci is
    C: Raci;
  begin
    C.nevezo := A.nevezo * B.nevezo;
    C.szamlalo := (A.szamlalo * B.nevezo) + (A.nevezo * B.szamlalo);
    return C;
  end "+";

  procedure kiir (A: in out Raci) is
  begin
    Put_Line(Integer'image(A.szamlalo) & "/" & Positive'image(A.nevezo));
  end kiir;

end Rac;
