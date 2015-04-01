package body Manager_Package is

   task body Queue_Manager IS

      FUNCTION Get_Key (
            Item : Customer_Type)
        RETURN Customer_Type IS
      BEGIN
         RETURN Item;
      END Get_Key;

      PACKAGE Customer_List_Package IS NEW Generic_Sorted_List(Customer_Type, Customer_Type, Put, Get_Key, "<", ">", "=");
      USE Customer_List_Package;

      Numbers_Of_Customers : Natural := 0;
      Next_Customer : Customer_Type;
      My_List       : List_Type;

   BEGIN
      loop 
         accept Add(Customer_In : in Customer_Type) do
            Numbers_Of_Customers := Numbers_Of_Customers +1;
            Insert(My_List, Customer_In);
         end Add;
      end loop;
   END Queue_Manager;

end Manager_Package;
