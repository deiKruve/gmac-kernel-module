--  Avoid the warning for using an internal unit.
pragma Warnings (Off);
with System.Secondary_Stack;
pragma Warnings (On);
with Last_Chance_Handler;

with System.Storage_Elements;

package body Secondary_Stack is
   
   package Lch renames Last_Chance_Handler;
   package SSS renames System.Secondary_Stack;
   package SSE renames System.Storage_Elements;

   Default_Size : constant := 10 * 1_024;

   Chunk : array (1 .. Default_Size) of
      SSE.Storage_Element;

   Uninitialized : Boolean := True;

   function Get_Sec_Stack return System.Address is
      use type System.Address;
   begin
      if Uninitialized then
	 if Chunk'Address = System.Null_Address then
	    Lch.Spin ("Secondary_Stack : could not be obtained");
	 else
	    Uninitialized := False;
	    SSS.SS_Init (Chunk'Address, Default_Size);
	 end if;
      end if;
      return Chunk'Address;
   end Get_Sec_Stack;

end Secondary_Stack;
