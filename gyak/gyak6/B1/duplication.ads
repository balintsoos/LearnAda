generic
  type Elem is private;
  type Index is (<>);
  type Tomb is array (Index range <>) of Elem;

function Duplication (T: in out Tomb) return Boolean;
