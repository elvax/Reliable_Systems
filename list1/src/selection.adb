package body Selection with SPARK_Mode => On is

   procedure Sort (A : in out Arr) is
      Tmp : Integer;
      Min_Id : Integer;
   begin

      if A'Length <= 1 then
         return;
      end if;
      
      for I in A'First .. A'Last-1 loop
         Min_Id := I;
         for J in I .. A'Last loop
            if A(J) < A(Min_Id) then
               Min_Id := J;
            end if;
            pragma Loop_Invariant ( Min_Id in I .. A'Last );
            pragma Loop_Invariant (for all K in I .. J => A(Min_Id) <= A(K) );
         end loop;

         if Min_Id /= I then
            Tmp := A(I);
            A(I) := A(Min_Id);
            A(Min_Id) := Tmp;
         end if;
         
         pragma Loop_Invariant
           (for all K1 in A'First .. I =>
              (for all K2 in K1 + 1 .. A'Last =>
                   A (K1) <= A (K2)));

         pragma Loop_Invariant ( Sorted( A(A'First .. I) ) );

      end loop;
      pragma Assert ( Sorted( A(A'Range) ) );
   end Sort;
   
               

end Selection;
