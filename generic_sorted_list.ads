with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

generic
   
   type Item_Type is private;
   type Key_Type is private;
   with procedure Put(Item : in Item_Type);
   with function Get_Key(Item : Item_Type) return Key_Type;
   with function "<"(LKey_Type, RKey_Type : Key_Type) return Boolean;
   with function ">"(LKey_Type, RKey_Type : Key_Type) return Boolean;
   with function "="(LKey_Type, RKey_Type : Key_Type) return Boolean;
   
package Generic_Sorted_List is
   
   type List_Type is private;
   
   --Del C
   function Empty(List : List_Type) return Boolean;
   procedure Insert(List : in out List_Type; Item : in Item_Type);
   procedure Put(List : in List_Type);
   function Member(List : List_Type; Item : Key_Type) return Boolean;
   procedure Remove(List : in out List_Type; Item : in Key_Type);
   procedure Delete(List : in out List_Type);
   function Find(List : List_Type; Item : Key_Type) return Item_Type;
   procedure Find(List : in List_Type; SearchKey : in Key_Type; ReturnItem : out Item_Type);
   function Length(List : List_Type) return Integer;
   procedure Pop(List : in out List_Type; Item : out Item_Type);
   
   ItemNotFound_Error : exception;
   
private
   
   type Node;
   type List_Type is access Node; 
   type Node is record
      Item : Item_Type;
      NextNode : List_Type;
   end record;
   
   procedure FreeMemory is new Ada.Unchecked_Deallocation(Object => Node, Name => List_Type);
   
end Generic_Sorted_List;

