package body Customer_Package is

	task body Customer is
	begin
		Ada.Text_Io.Put_Line("Task" & Positive'Image(Id) & " with priority" & Natural'Image(Priority)& " started.");
	end Customer;

	procedure Get(Customer_In : out Customer_Type; Id : in Integer; Prio : in Positive) is
	begin
		Customer_In := (Identify => Id, Priority => Prio, Customer_Item => new Customer(Id => Id, Priority => Prio));
	end Get;

	procedure Put(Customer : in Customer_Type) is 
	begin
		Ada.Text_Io.Put_Line(Positive'Image(Customer.Priority));
	end Put;

	function "="(RCustomer, LCustomer : Customer_Type) return Boolean is
	begin
		return (RCustomer.Priority = LCustomer.Priority);
	end "=";

	function "<"(RCustomer, LCustomer : Customer_Type) return Boolean is
	begin
		return (RCustomer.Priority < LCustomer.Priority);
	end "<";

	function ">"(RCustomer, LCustomer : Customer_Type) return Boolean is
	begin
		return (RCustomer.Priority > LCustomer.Priority);
	end ">";

end Customer_Package;
