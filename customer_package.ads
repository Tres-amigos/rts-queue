with Ada.Text_Io;

package Customer_Package is

	task type Customer (Priority : Natural := 1) is
	end Customer;

	type Customer_Type is private;

	procedure Get(Customer_In : out Customer_Type);
	procedure Put(Customer : in Customer_Type);

	function "<"(RCustomer, LCustomer : Customer_Type) return Boolean;
	function ">"(RCustomer, LCustomer : Customer_Type) return Boolean;
	function "="(RCustomer, LCustomer : Customer_Type) return Boolean;

private
	type Customer_Type is access Customer;
end Customer_Package;