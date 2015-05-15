pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_ftrace_irq_h is

   procedure ftrace_nmi_enter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ftrace_irq.h:9
   pragma Import (CPP, ftrace_nmi_enter, "_ZL16ftrace_nmi_enterv");

   procedure ftrace_nmi_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ftrace_irq.h:10
   pragma Import (CPP, ftrace_nmi_exit, "_ZL15ftrace_nmi_exitv");

end linux_ftrace_irq_h;
