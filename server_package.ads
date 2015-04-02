WITH Ada.Text_Io;
WITH Ada.Numerics.Float_Random;
USE Ada.Numerics.Float_Random;
WITH Ada.Calendar;
USE Ada.Calendar;

PACKAGE Server_Package IS

   TYPE Server_Type IS PRIVATE;
   Busy : BOOLEAN  := False;
   Wait : Duration := 3.0;

   TASK TYPE Server(Id : Integer := 0) IS
      ENTRY Receive_Customer (
            Customer : IN     Customer_Type);
   END Server;

   PROCEDURE Get (
         Id : IN     Integer);

PRIVATE
   TYPE Server_Type IS
      RECORD
         Identify    : Integer;
         Server_Item :          ACCESS Server;
END RECORD;
END Server_Package;
