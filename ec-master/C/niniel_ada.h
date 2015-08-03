/*****************************************************************************
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                             N I N I E L _ A D A                          --
--                                                                          --
--                                   S p e c                                --
--                                                                          --
--                     Copyright (C) 2015, Jan de Kruyf                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.                                               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
--          NINIEL - NIENOR  is maintained by J de Kruijf Engineers         --
--                     (email: jan.de.kruyf@hotmail.com)                    --
--                                                                          --
*****************************************************************************/

// implementation of a fast Ethernet communication server

// Ada interface to the Niniel C part.

#ifndef __NINIEL_ADA_H__
#define __NINIEL_ADA_H__

#include "ioctl.h"

extern const unsigned int rate_intervals[EC_RATE_COUNT]; // see master.ads

extern void adainit (void);
extern void niniel_init(void);
extern void niniel_exit(void);

// static funtions
extern void ec_master_init_static(void);

// master creation/deletion
extern int ec_master_init(ec_master_t *, unsigned int, const uint8_t *,
        const uint8_t *, dev_t, struct class *, unsigned int);
extern void ec_master_clear(ec_master_t *);

// phase transitions
extern int ec_master_enter_idle_phase (ec_master_t *);
extern void ec_master_leave_idle_phase (ec_master_t *);
extern int ec_master_enter_operation_phase(ec_master_t *);
extern void ec_master_leave_operation_phase(ec_master_t *);

// datagram IO
extern void ec_master_receive_datagrams(ec_master_t *, ec_device_t *,
        const uint8_t *, size_t);

// io control
extern long ec_ioctl(ec_master_t *, ec_ioctl_context_t *, unsigned int,
        void __user *);

#endif
