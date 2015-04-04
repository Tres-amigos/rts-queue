PACKAGE BODY Server_Package IS
   TASK BODY Server IS
      Id : Integer;
      MyManager : Manager;
   BEGIN
      ACCEPT Start(Id_In : in Integer; MyManager_In : in Manager) DO
         Ada.Text_IO.Put_Line("Started");
         Id := Id_In;
         MyManager := MyManager_In;
      END Start;


      LOOP
         Ada.Text_Io.Put_Line("Task (Server) " & Positive'Image(Id)  &
            " started.");
         Busy := True;
         --QueueManager is called and one customer is removed from the queue.

         --Manager.Remove();
         DELAY Wait;
         Busy := False;

      END LOOP;
   END Server;

   --TODO: gets customer, timer starts, server busy, timer ends, server available

   --   PROCEDURE Get (
   --      Server_In : OUT Server_Type;
   --      Id          : IN     Integer) IS
   --   BEGIN
   --      Server_In := (Identify => Id, Server_Item => NEW Server(Id => Id));
   --   END Get;
END Server_Package;

