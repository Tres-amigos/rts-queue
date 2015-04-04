package body Generic_Sorted_List is
   
   function Empty(List : List_Type) return Boolean is
   begin
      return (List = null);
   end Empty;
   
   procedure Insert(List : in out List_Type; Item : in Item_Type) is
   begin
      if Empty(List) then
         List := new Node'(Item => Item, NextNode => null);
      elsif (Get_Key(List.Item) > Get_Key(Item)) then
         List := new Node'(Item => Item, NextNode => List);
      else
         Insert(List.NextNode, Item);
      end if;
   end Insert;
   
   
   procedure Put(List : in List_Type) is
   begin
      if not Empty(List) then
         Put(List.Item);
         Put(List.NextNode);
      end if;
   end Put;
   
   
   function Member(List : List_Type; Item : Key_Type) return Boolean is
   begin
      if not Empty(List) then
         if (Get_Key(List.Item) = Item) then
            return True;
         else
            return Member(List.NextNode, Item);
         end if;
      else
         return False;
      end if;
   end Member;
   
   
   procedure Remove(List : in out List_Type; Item : in Key_Type) is
      RemoveThis : List_Type := List;
   begin
      if not Empty(List) then
         if (Get_Key(List.Item) = Item) then
            List := List.NextNode;
            FreeMemory(RemoveThis);
         else
            Remove(List.NextNode, Item);
         end if;
      else
         raise ItemNotFound_Error;
      end if;	    
   end Remove;
   
   
   procedure Delete(List : in out List_Type) is
      NextNode : List_Type;
   begin
      if not Empty(List) then
         NextNode := List.NextNode;
         FreeMemory(List);
         Delete(NextNode);
      end if;
   end Delete;
   
   
   function Find(List : List_Type; Item : Key_Type) return Item_Type is
   begin
      if not Empty(List) then
         if Get_Key(List.Item) = Item then
            return List.Item;
         else
            return Find(List.NextNode, Item);
         end if;
      else
         raise ItemNotFound_Error;
      end if;
   end Find;
   
   
   procedure Find(List : in List_Type; SearchKey : in Key_Type; ReturnItem : out Item_Type) is
      
   begin
      ReturnItem := Find(List, SearchKey);
   end Find;
   
   
   function Length(List : List_Type) return Integer is
   begin
      if Empty(List) then
         return 0;
      else
         return 1 + Length(List.NextNode);
      end if;
   end Length;

   procedure Pop(List : in out List_Type; Item : out Item_Type) is
   begin
      if not Empty(List) then
         List := List.NextNode;
         Item := List.Item;
      else
         raise ItemNotFound_Error;
      end if;
   end Pop;
   
   
end Generic_Sorted_List;
