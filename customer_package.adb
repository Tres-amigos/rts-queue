package body Customer_Package is

	protected Counter is
		procedure Take_Number(Count  : out Positive);
	private
		Tally : Positive := 1;
	end Counter;

	protected body Counter is
		procedure Take_Number(Count : out Positive) is
		begin
			Count := Tally;
			Tally := Tally + 1;
		end Take_Number;
	end Counter;

	task body Customer is
		Id : Integer;
	begin
		Counter.Take_Number(Id);
		Ada.Text_Io.Put_Line("Task" & Positive'Image(Id) & " with priority" & Natural'Image(Priority)& " started.");
	end Customer;

	procedure Get(Customer_In : out Customer_Type) is
	begin
		Customer_In := new Customer;
	end Get;

	procedure Put(Customer : in Customer_Type) is 
	begin
		--Ada.Text_Io.Put_Line(Integer'Image(Customer.Id));
		Ada.Text_Io.Put_Line("Testing");
	end Put;

	function "="(RCustomer, LCustomer : Customer_Type) return Boolean is
	begin
		return 1 < 2;
	end "=";

	function "<"(RCustomer, LCustomer : Customer_Type) return Boolean is
	begin
		return 1 < 2;
	end "<";

	function ">"(RCustomer, LCustomer : Customer_Type) return Boolean is
	begin
		return 1 < 2;
	end ">";

end Customer_Package;
