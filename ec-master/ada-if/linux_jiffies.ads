
pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_jiffies is
   
   jiffies : aliased unsigned_long;
   pragma Import (C, jiffies, "jiffies");
   
end Linux_Jiffies;
