--with System.Standard_Library;
pragma Restrictions (No_Exception_Propagation);
--  Only local exception handling is supported in this profile

pragma Restrictions (No_Exception_Registration);
--  Disable exception name registration. This capability is not used because
--  it is only required by exception stream attributes which are not supported
--  in this run time.

pragma Restrictions (No_Implicit_Dynamic_Code);
--  Pointers to nested subprograms are not allowed in this run time, in order
--  to prevent the compiler from building "trampolines".

pragma Restrictions (No_Finalization);
--  Controlled types are not supported in this run time

with Ada.Unchecked_Conversion; pragma Unreferenced (Ada.Unchecked_Conversion);

with System.Memory;  pragma Unreferenced (System.Memory);
-- we need to have to have a bit of heap available for gnat, it is implemented
-- in System.Memory. The exact semantics are not clear yet. At the moment
-- System.Memory.Get_Free_Pages needs to be called as a first statement 
-- in elaboration.

with Memory_Copy; pragma Unreferenced (Memory_Copy);

with Secondary_Stack;  pragma Unreferenced (Secondary_Stack);
-- we need a secondary stack for some functions

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

with Niniel.Ioctl;   pragma Unreferenced (Niniel.Ioctl);
--  with Niniel;  pragma Unreferenced (Niniel);
with Niniel.Master;   pragma Unreferenced (Niniel.Master);

procedure Demo
is
begin
   null;
end Demo;
