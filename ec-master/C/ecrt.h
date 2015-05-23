#ifndef __ECRT_H__
#define __ECRT_H__

#ifdef __KERNEL__
#include <asm/byteorder.h>
#include <linux/types.h>
#include <linux/time.h>
#else
#include <stdlib.h> // for size_t
#include <stdint.h>
#include <sys/time.h> // for struct timeval
#endif

/******************************************************************************
 * Global definitions
 *****************************************************************************/

/** EtherCAT realtime interface major version number.
 */
#define ECRT_VER_MAJOR 1

/** EtherCAT realtime interface minor version number.
 */
#define ECRT_VER_MINOR 5

/** EtherCAT realtime interface version word generator.
 */
#define ECRT_VERSION(a, b) (((a) << 8) + (b))

/** EtherCAT realtime interface version word.
 */
#define ECRT_VERSION_MAGIC ECRT_VERSION(ECRT_VER_MAJOR, ECRT_VER_MINOR)


/******************************************************************************
 * Data types
 *****************************************************************************/

struct ec_master;
typedef struct ec_master ec_master_t; /**< \see ec_master */

struct ec_slave_config;
typedef struct ec_slave_config ec_slave_config_t; /**< \see ec_slave_config */

struct ec_domain;
typedef struct ec_domain ec_domain_t; /**< \see ec_domain */

struct ec_sdo_request;
typedef struct ec_sdo_request ec_sdo_request_t; /**< \see ec_sdo_request. */

struct ec_voe_handler;
typedef struct ec_voe_handler ec_voe_handler_t; /**< \see ec_voe_handler. */

struct ec_reg_request;
typedef struct ec_reg_request ec_reg_request_t; /**< \see ec_sdo_request. */

/*****************************************************************************/

/** Request state.
 *
 * This is used as return type for ecrt_sdo_request_state() and
 * ecrt_voe_handler_state().
 */
typedef enum {
    EC_REQUEST_UNUSED, /**< Not requested. */
    EC_REQUEST_BUSY, /**< Request is being processed. */
    EC_REQUEST_SUCCESS, /**< Request was processed successfully. */
    EC_REQUEST_ERROR, /**< Request processing failed. */
} ec_request_state_t;

/*****************************************************************************/



/******************************************************************************
 * Bitwise read/write macros
 *****************************************************************************/

/** Read a certain bit of an EtherCAT data byte.
 *
 * \param DATA EtherCAT data pointer
 * \param POS bit position
 */
#define EC_READ_BIT(DATA, POS) ((*((uint8_t *) (DATA)) >> (POS)) & 0x01)

/** Write a certain bit of an EtherCAT data byte.
 *
 * \param DATA EtherCAT data pointer
 * \param POS bit position
 * \param VAL new bit value
 */
#define EC_WRITE_BIT(DATA, POS, VAL) \
    do { \
        if (VAL) *((uint8_t *) (DATA)) |=  (1 << (POS)); \
        else     *((uint8_t *) (DATA)) &= ~(1 << (POS)); \
    } while (0)

/******************************************************************************
 * Byte-swapping functions for user space
 *****************************************************************************/

#ifndef __KERNEL__

#if __BYTE_ORDER == __LITTLE_ENDIAN

#define le16_to_cpu(x) x
#define le32_to_cpu(x) x
#define le64_to_cpu(x) x

#define cpu_to_le16(x) x
#define cpu_to_le32(x) x
#define cpu_to_le64(x) x

#elif __BYTE_ORDER == __BIG_ENDIAN

#define swap16(x) \
        ((uint16_t)( \
        (((uint16_t)(x) & 0x00ffU) << 8) | \
        (((uint16_t)(x) & 0xff00U) >> 8) ))
#define swap32(x) \
        ((uint32_t)( \
        (((uint32_t)(x) & 0x000000ffUL) << 24) | \
        (((uint32_t)(x) & 0x0000ff00UL) <<  8) | \
        (((uint32_t)(x) & 0x00ff0000UL) >>  8) | \
        (((uint32_t)(x) & 0xff000000UL) >> 24) ))
#define swap64(x) \
        ((uint64_t)( \
        (((uint64_t)(x) & 0x00000000000000ffULL) << 56) | \
        (((uint64_t)(x) & 0x000000000000ff00ULL) << 40) | \
        (((uint64_t)(x) & 0x0000000000ff0000ULL) << 24) | \
        (((uint64_t)(x) & 0x00000000ff000000ULL) <<  8) | \
        (((uint64_t)(x) & 0x000000ff00000000ULL) >>  8) | \
        (((uint64_t)(x) & 0x0000ff0000000000ULL) >> 24) | \
        (((uint64_t)(x) & 0x00ff000000000000ULL) >> 40) | \
        (((uint64_t)(x) & 0xff00000000000000ULL) >> 56) ))

#define le16_to_cpu(x) swap16(x)
#define le32_to_cpu(x) swap32(x)
#define le64_to_cpu(x) swap64(x)

#define cpu_to_le16(x) swap16(x)
#define cpu_to_le32(x) swap32(x)
#define cpu_to_le64(x) swap64(x)

#endif

#define le16_to_cpup(x) le16_to_cpu(*((uint16_t *)(x)))
#define le32_to_cpup(x) le32_to_cpu(*((uint32_t *)(x)))
#define le64_to_cpup(x) le64_to_cpu(*((uint64_t *)(x)))

#endif /* ifndef __KERNEL__ */

/******************************************************************************
 * Read macros
 *****************************************************************************/

/** Read an 8-bit unsigned value from EtherCAT data.
 *
 * \return EtherCAT data value
 */
#define EC_READ_U8(DATA) \
    ((uint8_t) *((uint8_t *) (DATA)))

/** Read an 8-bit signed value from EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \return EtherCAT data value
 */
#define EC_READ_S8(DATA) \
     ((int8_t) *((uint8_t *) (DATA)))

/** Read a 16-bit unsigned value from EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \return EtherCAT data value
 */
#define EC_READ_U16(DATA) \
     ((uint16_t) le16_to_cpup((void *) (DATA)))

/** Read a 16-bit signed value from EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \return EtherCAT data value
 */
#define EC_READ_S16(DATA) \
     ((int16_t) le16_to_cpup((void *) (DATA)))

/** Read a 32-bit unsigned value from EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \return EtherCAT data value
 */
#define EC_READ_U32(DATA) \
     ((uint32_t) le32_to_cpup((void *) (DATA)))

/** Read a 32-bit signed value from EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \return EtherCAT data value
 */
#define EC_READ_S32(DATA) \
     ((int32_t) le32_to_cpup((void *) (DATA)))

/** Read a 64-bit unsigned value from EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \return EtherCAT data value
 */
#define EC_READ_U64(DATA) \
     ((uint64_t) le64_to_cpup((void *) (DATA)))

/** Read a 64-bit signed value from EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \return EtherCAT data value
 */
#define EC_READ_S64(DATA) \
     ((int64_t) le64_to_cpup((void *) (DATA)))

/******************************************************************************
 * Write macros
 *****************************************************************************/

/** Write an 8-bit unsigned value to EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \param VAL new value
 */
#define EC_WRITE_U8(DATA, VAL) \
    do { \
        *((uint8_t *)(DATA)) = ((uint8_t) (VAL)); \
    } while (0)

/** Write an 8-bit signed value to EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \param VAL new value
 */
#define EC_WRITE_S8(DATA, VAL) EC_WRITE_U8(DATA, VAL)

/** Write a 16-bit unsigned value to EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \param VAL new value
 */
#define EC_WRITE_U16(DATA, VAL) \
    do { \
        *((uint16_t *) (DATA)) = cpu_to_le16((uint16_t) (VAL)); \
    } while (0)

/** Write a 16-bit signed value to EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \param VAL new value
 */
#define EC_WRITE_S16(DATA, VAL) EC_WRITE_U16(DATA, VAL)

/** Write a 32-bit unsigned value to EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \param VAL new value
 */
#define EC_WRITE_U32(DATA, VAL) \
    do { \
        *((uint32_t *) (DATA)) = cpu_to_le32((uint32_t) (VAL)); \
    } while (0)

/** Write a 32-bit signed value to EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \param VAL new value
 */
#define EC_WRITE_S32(DATA, VAL) EC_WRITE_U32(DATA, VAL)

/** Write a 64-bit unsigned value to EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \param VAL new value
 */
#define EC_WRITE_U64(DATA, VAL) \
    do { \
        *((uint64_t *) (DATA)) = cpu_to_le64((uint64_t) (VAL)); \
    } while (0)

/** Write a 64-bit signed value to EtherCAT data.
 *
 * \param DATA EtherCAT data pointer
 * \param VAL new value
 */
#define EC_WRITE_S64(DATA, VAL) EC_WRITE_U64(DATA, VAL)

/*****************************************************************************/

/** @} */

#endif
