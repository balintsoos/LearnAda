generic
  type Elem is (<>);
  type Tomb is array(Integer range <>) of Elem;
  with function beta(item : Elem; parent : Elem) return Boolean;

function bintree(t : in out Tomb) return Boolean;
