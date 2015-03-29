PACKAGE BODY Customer_Package IS

   TASK BODY Customer IS
   BEGIN
      Ada.Text_Io.Put_Line("Task" & Positive'Image(Id) & " with priority" & Natural'Image(Priority)& " started.");
   END Customer;

   PROCEDURE Get (
         Customer_In :    OUT Customer_Type;
         Id          : IN     Integer;
         Prio        : IN     Positive) IS
   BEGIN
      Customer_In := (Identify => Id, Priority => Prio, Customer_Item => NEW Customer(Id => Id, Priority => Prio));
   END Get;

   PROCEDURE Put (
         Customer : IN     Customer_Type) IS
   BEGIN
      Ada.Text_Io.Put_Line(Positive'Image(Customer.Priority));
   END Put;

   FUNCTION "=" (
         RCustomer,
         LCustomer : Customer_Type)
     RETURN Boolean IS
   BEGIN
      RETURN (RCustomer.Priority = LCustomer.Priority);
   END "=";

   FUNCTION "<" (
         RCustomer,
         LCustomer : Customer_Type)
     RETURN Boolean IS
   BEGIN
      RETURN (RCustomer.Priority < LCustomer.Priority);
   END "<";

   FUNCTION ">" (
         RCustomer,
         LCustomer : Customer_Type)
     RETURN Boolean IS
   BEGIN
      RETURN (RCustomer.Priority > LCustomer.Priority);
   END ">";

END Customer_Package;
