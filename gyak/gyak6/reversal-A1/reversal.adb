with Cserel;
procedure Reversal (T: in out Tomb) is
  procedure ElemCsere is new Cserel(Elem);
  I : Index := T'First;
  J : Index := T'Last;
begin
  for S in 1 .. (T'Length / 2) loop
    ElemCsere(T(I), T(J));
    I := Index'Succ(I);
    J := Index'Pred(J);
  end loop;
end Reversal;

-- http://zsv.web.elte.hu/ada_regizhk/
-- http://zsv.web.elte.hu/ada_regizhk/regizh.pdf
