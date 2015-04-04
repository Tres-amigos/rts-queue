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

      My_List : List_Type;
      My_Customer : Customer_Type;

   BEGIN
      loop
         select
            accept Length(Number : out Integer) do
               Number := Length(My_List);
            end Length;
         or
            when Length(My_List) /= 0 =>
            accept Get(Customer : out Customer_Type) do
               Ada.Text_IO.Put_Line("Pop Customer");
               Pop(My_List, My_Customer);
               Customer := My_Customer;
               --Ada.Text_IO.Put_Line("Length after pop: " & Integer'Image(Length(My_List)));
               --Put(My_List);
               --Ada.Text_IO.Put_Line("-----------------------------");
            end Get;
         or 
            accept Add(Customer : in Customer_Type) do
               Insert(My_List, Customer);
            end Add;
         or when Length(My_List) /= 0 =>
            accept Remove(Customer : in Customer_Type) do
               Remove(My_List, Customer);
            end Remove;
         or
            terminate;
         end select;
      end loop;
   END Queue_Manager;

end Manager_Package;
