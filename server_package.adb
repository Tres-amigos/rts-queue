PACKAGE BODY Server_Package IS
   TASK BODY Server IS
      Id : Integer;
      MyManager : Manager;
      Length : Integer;
      Customer : Customer_Type;

      Timeout : Integer := 10;
   BEGIN
      ACCEPT Start(Id_In : in Integer; MyManager_In : in Manager) DO
         Id := Id_In;
         MyManager := MyManager_In;
      END Start;
      Ada.Text_Io.Put_Line("Task (Server) " & Positive'Image(Id)  & " started.");


      loop
         MyManager.Length(Length);
         if Length /= 0 then
            MyManager.Get(Customer);
            Ada.Text_IO.Put_Line("Got new customer.");
            Ada.Text_IO.Put("    "); Put(Customer);
            delay 4.0 * Id;
         else
            Ada.Text_IO.Put_Line("No customers found.");
            Timeout := Timeout - 1;
            if Timeout = 0 then
               exit;
            else
               delay 2.0 * Id;
            end if;
         end if;
      end loop;
      Ada.Text_IO.Put_Line("Dying now. Cya");
   END Server;

END Server_Package;

