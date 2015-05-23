pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package ecrt_h is

   --  unsupported macro: ECRT_VER_MAJOR 1
   --  unsupported macro: ECRT_VER_MINOR 5
   --  arg-macro: function ECRT_VERSION (((a) << 8) + (b)
   --    return ((a) << 8) + (b);
   --  unsupported macro: ECRT_VERSION_MAGIC ECRT_VERSION(ECRT_VER_MAJOR, ECRT_VER_MINOR)
   --  arg-macro: function EC_READ_BIT ((*((uint8_t *) (DATA)) >> (POS)) and 0x01
   --    return (*((uint8_t *) (DATA)) >> (POS)) and 0x01;
   --  arg-macro: procedure EC_WRITE_BIT do { if (VAL) *((uint8_t *) (DATA)) |= (1 << (POS)); else *((uint8_t *) (DATA)) &= ~(1 << (POS)); } while (0)
   --    do { if (VAL) *((uint8_t *) (DATA)) |= (1 << (POS)); else *((uint8_t *) (DATA)) &= ~(1 << (POS)); } while (0)
   --  arg-macro: function EC_READ_U8 ((uint8_t) *((uint8_t *) (DATA))
   --    return (uint8_t) *((uint8_t *) (DATA));
   --  arg-macro: function EC_READ_S8 ((int8_t) *((uint8_t *) (DATA))
   --    return (int8_t) *((uint8_t *) (DATA));
   --  arg-macro: function EC_READ_U16 ((uint16_t) le16_to_cpup((void *) (DATA))
   --    return (uint16_t) le16_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_S16 ((int16_t) le16_to_cpup((void *) (DATA))
   --    return (int16_t) le16_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_U32 ((uint32_t) le32_to_cpup((void *) (DATA))
   --    return (uint32_t) le32_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_S32 ((int32_t) le32_to_cpup((void *) (DATA))
   --    return (int32_t) le32_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_U64 ((uint64_t) le64_to_cpup((void *) (DATA))
   --    return (uint64_t) le64_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_S64 ((int64_t) le64_to_cpup((void *) (DATA))
   --    return (int64_t) le64_to_cpup((void *) (DATA));
   --  arg-macro: procedure EC_WRITE_U8 do { *((uint8_t *)(DATA)) := ((uint8_t) (VAL)); } while (0)
   --    do { *((uint8_t *)(DATA)) := ((uint8_t) (VAL)); } while (0)
   --  arg-macro: procedure EC_WRITE_S8 EC_WRITE_U8(DATA, VAL)
   --    EC_WRITE_U8(DATA, VAL)
   --  arg-macro: procedure EC_WRITE_U16 do { *((uint16_t *) (DATA)) := cpu_to_le16((uint16_t) (VAL)); } while (0)
   --    do { *((uint16_t *) (DATA)) := cpu_to_le16((uint16_t) (VAL)); } while (0)
   --  arg-macro: procedure EC_WRITE_S16 EC_WRITE_U16(DATA, VAL)
   --    EC_WRITE_U16(DATA, VAL)
   --  arg-macro: procedure EC_WRITE_U32 do { *((uint32_t *) (DATA)) := cpu_to_le32((uint32_t) (VAL)); } while (0)
   --    do { *((uint32_t *) (DATA)) := cpu_to_le32((uint32_t) (VAL)); } while (0)
   --  arg-macro: procedure EC_WRITE_S32 EC_WRITE_U32(DATA, VAL)
   --    EC_WRITE_U32(DATA, VAL)
   --  arg-macro: procedure EC_WRITE_U64 do { *((uint64_t *) (DATA)) := cpu_to_le64((uint64_t) (VAL)); } while (0)
   --    do { *((uint64_t *) (DATA)) := cpu_to_le64((uint64_t) (VAL)); } while (0)
   --  arg-macro: procedure EC_WRITE_S64 EC_WRITE_U64(DATA, VAL)
   --    EC_WRITE_U64(DATA, VAL)
  --*****************************************************************************
  -- * Global definitions
  -- **************************************************************************** 

  --* EtherCAT realtime interface major version number.
  --  

  --* EtherCAT realtime interface minor version number.
  --  

  --* EtherCAT realtime interface version word generator.
  --  

  --* EtherCAT realtime interface version word.
  --  

  --*****************************************************************************
  -- * Data types
  -- **************************************************************************** 

   --  skipped empty struct ec_master

  --*< \see ec_master  
   --  skipped empty struct ec_master_t

   --  skipped empty struct ec_slave_config

  --*< \see ec_slave_config  
   --  skipped empty struct ec_slave_config_t

   --  skipped empty struct ec_domain

  --*< \see ec_domain  
   --  skipped empty struct ec_domain_t

   --  skipped empty struct ec_sdo_request

  --*< \see ec_sdo_request.  
   --  skipped empty struct ec_sdo_request_t

   --  skipped empty struct ec_voe_handler

  --*< \see ec_voe_handler.  
   --  skipped empty struct ec_voe_handler_t

   --  skipped empty struct ec_reg_request

  --*< \see ec_sdo_request.  
   --  skipped empty struct ec_reg_request_t

  --*************************************************************************** 
  --* Request state.
  -- *
  -- * This is used as return type for ecrt_sdo_request_state() and
  -- * ecrt_voe_handler_state().
  --  

  --*< Not requested.  
  --*< Request is being processed.  
  --*< Request was processed successfully.  
  --*< Request processing failed.  
   type ec_request_state_t is 
     (EC_REQUEST_UNUSED,
      EC_REQUEST_BUSY,
      EC_REQUEST_SUCCESS,
      EC_REQUEST_ERROR);
   pragma Convention (C, ec_request_state_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/ecrt.h:69

  --*************************************************************************** 
  --*****************************************************************************
  -- * Bitwise read/write macros
  -- **************************************************************************** 

  --* Read a certain bit of an EtherCAT data byte.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param POS bit position
  --  

  --* Write a certain bit of an EtherCAT data byte.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param POS bit position
  -- * \param VAL new bit value
  --  

  --*****************************************************************************
  -- * Byte-swapping functions for user space
  -- **************************************************************************** 

  --*****************************************************************************
  -- * Read macros
  -- **************************************************************************** 

  --* Read an 8-bit unsigned value from EtherCAT data.
  -- *
  -- * \return EtherCAT data value
  --  

  --* Read an 8-bit signed value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 16-bit unsigned value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 16-bit signed value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 32-bit unsigned value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 32-bit signed value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 64-bit unsigned value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 64-bit signed value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --*****************************************************************************
  -- * Write macros
  -- **************************************************************************** 

  --* Write an 8-bit unsigned value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write an 8-bit signed value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 16-bit unsigned value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 16-bit signed value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 32-bit unsigned value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 32-bit signed value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 64-bit unsigned value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 64-bit signed value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --*************************************************************************** 
  --* @}  
end ecrt_h;
