generic
  type Elem is limited private;
  type Index is (<>);
  type Tomb is array (Index range <>) of Elem;
  with procedure Swap (A, B: in out Elem);

procedure Reversal (T: in out Tomb);
