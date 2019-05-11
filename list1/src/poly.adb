with Ada.Text_IO; use Ada.Text_IO;

package body Poly with spark_mode is
--  package body Poly with SPARK_Mode  is

--     function Naive(X : Integer; A : Vector) return Integer is
--        Result : Integer := 0;
--     begin
--        for I in A'Range loop
--           Result := Result + A(I) * (X ** I);
--        end loop;
--        return Result;
--     end Naive;
   

   function Horner (X : Integer; A : Vector) return Integer is
      Y : Integer := 0;
      Naive : Integer := 0 with Ghost;
   begin
      for J in reverse A'Range loop
         Y := A (J) + Y * X;
         Naive := A(J) * X ** (J - A'First) + Naive;
         pragma Loop_Invariant (Y * X ** (J - A'First) = Naive);
      end loop;
      pragma Assert (Y = Naive);

      return Y;
   end Horner;
   

end Poly;
