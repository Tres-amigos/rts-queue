WITH Text_Io;
USE Text_Io;
WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
WITH Ada.Numerics.Float_Random;
USE Ada.Numerics.Float_Random;
WITH Ada.Numerics.Discrete_Random;
WITH Customer_Package;
USE Customer_Package;
WITH Server_Package;
USE Server_Package;
WITH Manager_Package;
USE Manager_Package;
WITH Ada.Exceptions;

PROCEDURE Shop IS
   G                   :          Generator;
   Number_Of_Customers : CONSTANT           := 40;
   Number_Of_Servers   : CONSTANT           := 5;
   Interarrival_Time   : CONSTANT           := 2.0;
   Priority_Level      : CONSTANT           := 3;
   Ts                  : CONSTANT           := 0.3;
   MyManager           : Manager   := NEW Queue_Manager;
   MyServer : Server_Type;

   SUBTYPE Rand_Range IS Positive RANGE Positive'First .. Priority_Level;
   PACKAGE Rand_Int IS NEW Ada.Numerics.Discrete_Random(Rand_Range);
   Seed : Rand_Int.Generator;
   Num  : Rand_Range;

   PROCEDURE Customer_Enter (
         ID : Integer) IS
      Prio         : Integer;
      New_Customer : Customer_Type;
   BEGIN
      Rand_Int.Reset(Seed);
      Prio := Integer(Rand_Int.Random(Seed)); --Set Priority
      Get(New_Customer, ID , Prio);
      Put(New_Customer);
      MyManager.Add(New_Customer);
   END Customer_Enter;

BEGIN
   Reset(G);
   FOR I IN 1..Number_Of_Servers LOOP --Create Servers
      MyServer := NEW Server;
      MyServer.Start(I, MyManager);
   END LOOP;

   Put_Line("Done with Servers");

   FOR I IN 1..Number_Of_Customers LOOP --Create Customers
      Customer_Enter(I);
      DELAY Duration(Ts*(Random(G) * Interarrival_Time));
   END LOOP;

   exception 
      when Error : others =>
         Put_Line("exception: " & Ada.Exceptions.Exception_Information(Error));
END Shop;
