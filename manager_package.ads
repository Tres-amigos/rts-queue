WITH Ada.Text_IO;

WITH Generic_Sorted_List;
WITH Customer_Package;
USE Customer_Package;
with Ada.Task_Identification; use Ada.Task_Identification;

package Manager_Package is
	task type Queue_Manager is
		entry Add(Customer : in Customer_Type);
		entry Remove(Customer : in Customer_Type);
	end Queue_Manager;

	type Manager is access Queue_Manager;

end Manager_Package;
