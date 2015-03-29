WITH Ada.Text_IO;

WITH Generic_Sorted_List;
WITH Customer_Package;
USE Customer_Package;


PROCEDURE Queue_Manager IS
   Numbers_Of_Customers : Integer := 0;

   FUNCTION Customers_Waiting RETURN Integer IS
   BEGIN
      RETURN Numbers_Of_Customers;
   END Customers_Waiting;

   FUNCTION Get_Key (
         Item : Customer_Type)
     RETURN Customer_Type IS
   BEGIN
      RETURN Item;
   END Get_Key;

   PACKAGE Customer_List_Package IS NEW Generic_Sorted_List(Customer_Type, Customer_Type, Put, Get_Key, "<", ">", "=");
   USE Customer_List_Package;

   Next_Customer : Customer_Type;
   My_List       : List_Type;

   PROCEDURE Add(Customer_In : Customer_Type) IS
   BEGIN
      Insert(My_List, Customer_In);
   END Add;

BEGIN

   FOR I IN 1..3 LOOP
      Get(Next_Customer, I, 10-I);
      Insert(My_List, Next_Customer);

      DELAY Duration(0.5);  -- wait between customers
   END LOOP;
   Ada.Text_IO.Put_Line("Klar");
   Put(My_List);
END Queue_Manager;