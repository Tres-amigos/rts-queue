WITH Ada.Text_IO;

WITH Generic_Sorted_List;
WITH Customer_Package;
USE Customer_Package;

package Manager_Package is

   task type Queue_Manager is
   end Queue_Manager;

   type Manager is access Queue_Manager;

end Manager_Package;
