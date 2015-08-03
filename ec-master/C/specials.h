/*****************************************************************************
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                               S P E C I A L S                            --
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
// I do not know if this is still used.

#ifndef __SPECIALS_H__
#define __SPECIALS_H__

#ifdef __KERNEL__

// from module.c
extern void ecrt_release_master(ec_master_t *master);


#endif
#endif
