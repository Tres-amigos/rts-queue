with Ada.Text_IO;

with Generic_Sorted_List;
with Customer_Package; use Customer_Package;


procedure Queue_Manager is

	function Get_Key(Item : Customer_Type) return Customer_Type is
	begin
		return Item;
	end Get_Key;

	package Customer_List_Package is new Generic_Sorted_List(Customer_Type, Customer_Type, Put, Get_Key, "<", ">", "=");
	use Customer_List_Package;

	Next_Customer : Customer_Type;
	My_List : List_Type;
begin

	for I in 1..3 loop
        Get(Next_Customer, I, 10-I);
        Insert(My_List, Next_Customer);

        delay Duration(0.5);  -- wait between customers
    end loop;
    Ada.Text_IO.Put_Line("Klar");
    Put(My_List);
end Queue_Manager;