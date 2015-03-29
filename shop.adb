WITH Text_Io;
USE Text_Io;
WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
WITH Ada.Numerics.Float_Random;
USE Ada.Numerics.Float_Random;
WITH Ada.Numerics.Discrete_Random;
WITH Customer_Package;
USE Customer_Package;
WITH Queue_Manager;

PROCEDURE Shop IS
   G                   :          Generator;
   Number_Of_Customers : CONSTANT           := 40;
   Number_Of_Servers   : CONSTANT           := 7;
   Interarrival_Time   : CONSTANT           := 2.0;
   Priority_Level      : CONSTANT           := 3;
   Ts                  : CONSTANT           := 0.3;
   --Manager             :          Queue_Manager;
   Next_Customer : Customer;

   TYPE Rand_Range IS RANGE 0 .. Priority_Level;
   PACKAGE Rand_Int IS NEW Ada.Numerics.Discrete_Random(Rand_Range);
   Seed : Rand_Int.Generator;
   Num  : Rand_Range;

   PROCEDURE Customer_Enter IS
      Prio         : Integer;
      New_Customer : Customer;
   BEGIN
      Rand_Int.Reset(Seed);
      Prio := Integer(Rand_Int.Random(Seed)); --Set Priority
      Put_Line(Rand_Range'Image(Num));
      --New_Customer
      --Queue_Manager.Add(New_Customer);
   END Customer_Enter;



BEGIN
   Reset(G);

   FOR I IN 1..Number_Of_Servers LOOP --Create Servers
      --Service_Counter(I).Your_Num_Is(I);
      --Server_Mgr.Free(I);
      Put("Här var det servrar");
   END LOOP;


   FOR I IN 1..Number_Of_Customers LOOP --Create Customers
      Next_Customer := NEW Customer;
      DELAY Duration(Ts*(Random(G) * Interarrival_Time));
   END LOOP;

   LOOP --Wait until done, then finnish.
      IF Queue_Manager.Customers_Waiting = 0 THEN
         EXIT;
      ELSE
         DELAY 1.0;
      END IF;
   END LOOP;
END Shop;
