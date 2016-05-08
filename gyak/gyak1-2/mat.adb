package body Mat is

   function Lnko ( A, B : Positive ) return Positive is
      X: Positive := A;
      Y: Positive := B;
   begin
      while X /= Y loop
         if X > Y then
            X := X - Y;
         else
            Y := Y - X;
         end if;
      end loop;
      return X;
   end Lnko;

   function Faktorialis( N: Natural ) return Positive is
      Fakt : Positive := 1;
   begin
      for I in 1..N loop
         Fakt := Fakt * I;
      end loop;
      return Fakt;
   end Faktorialis;

   function Max2 ( A, B : Natural ) return Natural is
      X: Natural := A;
      Y: Natural := B;
   begin
      if X >= Y then
          return X;
      else
          return Y;
      end if;
   end Max2;

   function Max3 ( A, B, C : Natural ) return Natural is
      X: Natural := Max2(A,B);
      Y: Natural := C;
   begin
      return Max2(X,Y);
   end Max3;

   function isEven ( N : Natural ) return Boolean is
   begin
      return (N mod 2 = 0);
   end isEven;

   function signof ( N : Integer ) return Integer is
   begin
      if N > 0 then
          return 1;
      elsif N = 0 then
            return 0;
      else
            return -1;
      end if;
   end signof;

   function powerof ( X, N : Integer ) return Integer is
   begin
      if N > 1 then
         return X * powerof(X, N - 1);
      elsif N = 0 then
         return 1;
      else
         return X;
      end if;
   end powerof;

   function factorial ( N : Natural ) return Natural is
   begin
      if N <= 1 then
         return 1;
      else
         return N * factorial(N - 1);
      end if;
   end factorial;

   function digitSum ( N : Natural ) return Natural is
   begin
      return 0;
   end digitSum;

end Mat;
