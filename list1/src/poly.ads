package Poly with spark_mode is
--     package Poly with SPARK_Mode is
   
   type Vector is array (Natural range <>) of Integer;

--     function Naive(X : Integer; A : Vector) return Integer
--       with
--         Ghost;
   
   function Horner (X : Integer; A : Vector) return Integer
     with
       SPARK_Mode,
       Pre => A'Length > 0;
--         Post => Horner'Result = Naive(X, A);
   
       

end Poly;
