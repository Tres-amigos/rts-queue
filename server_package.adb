WITH Ada.Numerics.Float_Random;
USE Ada.Numerics.Float_Random;
WITH Ada.Calendar;
USE Ada.Calendar;

PACKAGE BODY Server_Package IS

   TASK BODY Server IS
   BEGIN
      Ada.Text_Io.Put_Line("Task (Server) " & Positive'Image(Id)  & " started.");
      SELECT
         ACCEPT Receive_Customer (
               Customer : IN  Customer_Type) DO
            Busy := True;
            DELAY Wait;
            Busy := False;
         END Receive_Customer;
      END SELECT;
   END Server;

   PROCEDURE Get (
      Server_In : OUT Server_Type;
      Id          : IN     Integer) IS
   BEGIN
      Server_In := (Identify => Id);
   END Get;



   --TODO: gets customer, timer starts, server busy, timer ends, server available

   --   FUNCTION "=" (
   --         RCustomer,
   --         LCustomer : Customer_Type)
   --     RETURN Boolean I
   --   BEGIN
   --      RETURN (RCustomer.Priority = LCustomer.Priority);
   --   END "=";

END Server_Package;

