with Get_Discreet, Text_IO; use Text_IO;
procedure Proba is
   function Get_Int is new Get_Discreet(Character);
begin
   Put_Line( Character'Image(Get_Int) );
end Proba;
