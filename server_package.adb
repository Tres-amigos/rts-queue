PACKAGE BODY Server_Package IS
   TASK BODY Server IS
      Id : Integer;
      MyManager : Manager;
      Length : Integer;
   BEGIN
      ACCEPT Start(Id_In : in Integer; MyManager_In : in Manager) DO
         Id := Id_In;
         MyManager := MyManager_In;
      END Start;
      Ada.Text_Io.Put_Line("Task (Server) " & Positive'Image(Id)  & " started.");


      loop
         MyManager.Length(Length);
         if Length /= 0 then
            MyManager.Get;
            Ada.Text_IO.Put_Line("Got new customer.");
            delay 4.0 * Id;
         else
            Ada.Text_IO.Put_Line("No customers found.");
            delay 2.0 * Id;
         end if;
      end loop;
   END Server;
   
END Server_Package;

