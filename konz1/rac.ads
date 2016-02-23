package Rac is

  type Raci is record
    szamlalo: Integer;
    nevezo: Positive;
  end record;

  function "/" (A: Integer; B: Positive) return Raci;
  function "+" (A: Raci; B: Raci) return Raci;

end Rac;
