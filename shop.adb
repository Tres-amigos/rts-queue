WITH Text_Io;
USE Text_Io;
WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
WITH Ada.Numerics.Float_Random;
USE Ada.Numerics.Float_Random;
WITH Ada.Numerics.Discrete_Random;
WITH Customer_Package;
USE Customer_Package;
WITH Manager_Package; USE Manager_Package;

PROCEDURE Shop IS
   G                   :          Generator;
   Number_Of_Customers : CONSTANT           := 40;
   Number_Of_Servers   : CONSTANT           := 7;
   Interarrival_Time   : CONSTANT           := 2.0;
   Priority_Level      : CONSTANT           := 3;
   Ts                  : CONSTANT           := 0.3;
   MyManager             :          Manager;

   SUBTYPE Rand_Range IS Positive RANGE Positive'First .. Priority_Level;
   PACKAGE Rand_Int IS NEW Ada.Numerics.Discrete_Random(Rand_Range);
   Seed : Rand_Int.Generator;
   Num  : Rand_Range;

   PROCEDURE Customer_Enter(ID : Integer) IS
      Prio         : Integer;
      New_Customer : Customer_Type;
   BEGIN
      Rand_Int.Reset(Seed);
      Prio := Integer(Rand_Int.Random(Seed)); --Set Priority
      Put_Line(Rand_Range'Image(Num));
      Get(New_Customer, ID , Prio);
      --New_Customer
      --Queue_Manager.Add(New_Customer);
      MyManager := new Queue_Manager;--Queue_Manager;
   END Customer_Enter;



BEGIN
   Reset(G);

   FOR I IN 1..Number_Of_Servers LOOP --Create Servers
      --Service_Counter(I).Your_Num_Is(I);
      --Server_Mgr.Free(I);
      Put("Här var det servrar");
   END LOOP;


   FOR I IN 1..Number_Of_Customers LOOP --Create Customers
      Customer_Enter(I);
      DELAY Duration(Ts*(Random(G) * Interarrival_Time));
   END LOOP;

   -- LOOP --Wait until done, then finnish.
   --    IF Manager.Customers_Waiting = 0 THEN
   --       EXIT;
   --    ELSE
   --       DELAY 1.0;
   --    END IF;
   -- END LOOP;
END Shop;
