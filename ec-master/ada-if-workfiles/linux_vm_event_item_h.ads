pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_vm_event_item_h is

   --  unsupported macro: DMA_ZONE(xx) xx ##_DMA,
   --  unsupported macro: DMA32_ZONE(xx) xx ##_DMA32,
   --  unsupported macro: FOR_ALL_ZONES(xx) DMA_ZONE(xx) DMA32_ZONE(xx) xx ##_NORMAL HIGHMEM_ZONE(xx) , xx ##_MOVABLE
   type vm_event_item is 
     (PGPGIN,
      PGPGOUT,
      PSWPIN,
      PSWPOUT,
      PGALLOC_DMA,
      PGALLOC_DMA32,
      PGALLOC_NORMAL,
      PGALLOC_MOVABLE,
      PGFREE,
      PGACTIVATE,
      PGDEACTIVATE,
      PGFAULT,
      PGMAJFAULT,
      PGREFILL_DMA,
      PGREFILL_DMA32,
      PGREFILL_NORMAL,
      PGREFILL_MOVABLE,
      PGSTEAL_KSWAPD_DMA,
      PGSTEAL_KSWAPD_DMA32,
      PGSTEAL_KSWAPD_NORMAL,
      PGSTEAL_KSWAPD_MOVABLE,
      PGSTEAL_DIRECT_DMA,
      PGSTEAL_DIRECT_DMA32,
      PGSTEAL_DIRECT_NORMAL,
      PGSTEAL_DIRECT_MOVABLE,
      PGSCAN_KSWAPD_DMA,
      PGSCAN_KSWAPD_DMA32,
      PGSCAN_KSWAPD_NORMAL,
      PGSCAN_KSWAPD_MOVABLE,
      PGSCAN_DIRECT_DMA,
      PGSCAN_DIRECT_DMA32,
      PGSCAN_DIRECT_NORMAL,
      PGSCAN_DIRECT_MOVABLE,
      PGSCAN_DIRECT_THROTTLE,
      PGSCAN_ZONE_RECLAIM_FAILED,
      PGINODESTEAL,
      SLABS_SCANNED,
      KSWAPD_INODESTEAL,
      KSWAPD_LOW_WMARK_HIT_QUICKLY,
      KSWAPD_HIGH_WMARK_HIT_QUICKLY,
      PAGEOUTRUN,
      ALLOCSTALL,
      PGROTATED,
      DROP_PAGECACHE,
      DROP_SLAB,
      NUMA_PTE_UPDATES,
      NUMA_HUGE_PTE_UPDATES,
      NUMA_HINT_FAULTS,
      NUMA_HINT_FAULTS_LOCAL,
      NUMA_PAGE_MIGRATE,
      PGMIGRATE_SUCCESS,
      PGMIGRATE_FAIL,
      COMPACTMIGRATE_SCANNED,
      COMPACTFREE_SCANNED,
      COMPACTISOLATED,
      COMPACTSTALL,
      COMPACTFAIL,
      COMPACTSUCCESS,
      HTLB_BUDDY_PGALLOC,
      HTLB_BUDDY_PGALLOC_FAIL,
      UNEVICTABLE_PGCULLED,
      UNEVICTABLE_PGSCANNED,
      UNEVICTABLE_PGRESCUED,
      UNEVICTABLE_PGMLOCKED,
      UNEVICTABLE_PGMUNLOCKED,
      UNEVICTABLE_PGCLEARED,
      UNEVICTABLE_PGSTRANDED,
      THP_FAULT_ALLOC,
      THP_FAULT_FALLBACK,
      THP_COLLAPSE_ALLOC,
      THP_COLLAPSE_ALLOC_FAILED,
      THP_SPLIT,
      THP_ZERO_PAGE_ALLOC,
      THP_ZERO_PAGE_ALLOC_FAILED,
      NR_VM_EVENT_ITEMS);
   pragma Convention (C, vm_event_item);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vm_event_item.h:24

  -- culled to noreclaim list  
  -- scanned for reclaimability  
  -- rescued from noreclaim list  
  -- on COW, page truncate  
  -- unable to isolate on unlock  
  -- cpu tried to flush others' tlbs  
  -- cpu received ipi for flush  
end linux_vm_event_item_h;
