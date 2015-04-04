WITH Ada.Text_Io;
WITH Ada.Numerics.Float_Random;
USE Ada.Numerics.Float_Random;
WITH Manager_Package;
USE Manager_Package;

PACKAGE Server_Package IS

   Wait : Duration := 3.0;

   TASK TYPE Server IS
      entry Start(Id_In : in Integer; MyManager_In : in Manager);
   END Server;

   TYPE Server_Type IS ACCESS Server;

--   PROCEDURE Get (
--         Server_In :   OUT Server_Type;
--         Id        : IN     Integer);

END Server_Package;
