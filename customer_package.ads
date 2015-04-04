with Ada.Text_Io;

package Customer_Package is

	type Customer_Type;

	task type Customer (Id : Integer := 0; Priority : Positive := 1) is
	end Customer;

	procedure Get(Customer_In : out Customer_Type; Id : in Integer; Prio : in Positive);
	procedure Put(Customer : in Customer_Type);

	function "<"(RCustomer, LCustomer : Customer_Type) return Boolean;
	function ">"(RCustomer, LCustomer : Customer_Type) return Boolean;
	function "="(RCustomer, LCustomer : Customer_Type) return Boolean;

	type Customer_Type is record
		Identify : Integer;
		Priority : Positive;
		Customer_Item : access Customer;
	end record;
end Customer_Package;