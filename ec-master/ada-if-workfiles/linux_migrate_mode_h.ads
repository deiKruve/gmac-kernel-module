pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_migrate_mode_h is

  -- * MIGRATE_ASYNC means never block
  -- * MIGRATE_SYNC_LIGHT in the current implementation means to allow blocking
  -- *	on most operations but not ->writepage as the potential stall time
  -- *	is too significant
  -- * MIGRATE_SYNC will block when migrating pages
  --  

   type migrate_mode is 
     (MIGRATE_ASYNC,
      MIGRATE_SYNC_LIGHT,
      MIGRATE_SYNC);
   pragma Convention (C, migrate_mode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/migrate_mode.h:10

end linux_migrate_mode_h;
