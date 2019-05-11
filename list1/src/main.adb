with Ada.Text_IO; use Ada.Text_IO;
with Smallest_factor;
with Poly;
with Selection;

procedure Main is
   N : Positive := 49;
   Factor : Positive;
   Array1 : Selection.Arr := (5, 2, 3, 4, 1);
begin
   Put_Line("Before N:" & N'Image);
   Smallest_Factor (N, Factor);
   Put_Line ("After N:" & N'Image & " Factor:" & Factor'Image );


   for I in Array1'Range loop
      Put (Array1(I)'Image & " ");
   end loop;
   Put_Line("");
   Put_Line("Sorted:");
   Selection.Sort(Array1);
   for I in Array1'Range loop
      Put (Array1(I)'Image & " ");
   end loop;



end Main;
