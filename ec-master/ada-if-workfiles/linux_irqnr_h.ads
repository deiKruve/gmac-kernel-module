pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_irqdesc_h;

package linux_irqnr_h is

   --  arg-macro: procedure for_each_irq_desc for (irq := 0, desc := irq_to_desc(irq); irq < nr_irqs; irq++, desc := irq_to_desc(irq)) if (notdesc) ; else
   --    for (irq := 0, desc := irq_to_desc(irq); irq < nr_irqs; irq++, desc := irq_to_desc(irq)) if (notdesc) ; else
   --  arg-macro: procedure for_each_irq_desc_reverse for (irq := nr_irqs - 1, desc := irq_to_desc(irq); irq >= 0; irq--, desc := irq_to_desc(irq)) if (notdesc) ; else
   --    for (irq := nr_irqs - 1, desc := irq_to_desc(irq); irq >= 0; irq--, desc := irq_to_desc(irq)) if (notdesc) ; else
   --  arg-macro: function irq_node (irq_get_irq_data(irq).node
   --    return irq_get_irq_data(irq).node;
   --  arg-macro: procedure for_each_active_irq for (irq := irq_get_next_irq(0); irq < nr_irqs; irq := irq_get_next_irq(irq + 1))
   --    for (irq := irq_get_next_irq(0); irq < nr_irqs; irq := irq_get_next_irq(irq + 1))
   --  arg-macro: procedure for_each_irq_nr for (irq := 0; irq < nr_irqs; irq++)
   --    for (irq := 0; irq < nr_irqs; irq++)
   nr_irqs : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqnr.h:7
   pragma Import (C, nr_irqs, "nr_irqs");

   function irq_to_desc (irq : unsigned) return access linux_irqdesc_h.irq_desc;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqnr.h:8
   pragma Import (CPP, irq_to_desc, "_Z11irq_to_descj");

   function irq_get_next_irq (offset : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqnr.h:9
   pragma Import (CPP, irq_get_next_irq, "_Z16irq_get_next_irqj");

end linux_irqnr_h;
