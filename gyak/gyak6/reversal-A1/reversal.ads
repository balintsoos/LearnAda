generic
  type Elem is private;
  type Index is (<>);
  type Tomb is array (Index range <>) of Elem;

procedure Reversal (T: in out Tomb);
