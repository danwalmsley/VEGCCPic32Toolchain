/*
 * Copyright (c) 1996-2004 MIPS Technologies, Inc.
 * All rights reserved.
 * 
 * Unpublished rights (if any) reserved under the copyright laws of the
 * United States of America and other countries.
 * 
 * This code is proprietary to MIPS Technologies, Inc. ("MIPS
 * Technologies").  Any copying, reproducing, modifying or use of
 * this code (in whole or in part) that is not expressly permitted
 * in writing by MIPS Technologies or an authorized third party is
 * strictly prohibited.  At a minimum, this code is protected under
 * unfair competition and copyright laws.  Violations thereof may result
 * in criminal penalties and fines.
 * 
 * MIPS Technologies reserves the right to change this code to improve
 * function, design or otherwise.  MIPS Technologies does not assume any
 * liability arising out of the application or use of this code, or of
 * any error or omission in such code.  Any warranties, whether express,
 * statutory, implied or otherwise, including but not limited to the
 * implied warranties of merchantability or fitness for a particular
 * purpose, are excluded.  Except as expressly provided in any written
 * license agreement from MIPS Technologies or an authorized third party,
 * the furnishing of this code does not give recipient any license to
 * any intellectual property rights, including any patent rights, that
 * cover this code.
 * 
 * This code shall not be exported, reexported, transferred, or released,
 * directly or indirectly, in violation of the law of any country or
 * international law, regulation, treaty, Executive Order, statute,
 * amendments or supplements thereto.  Should a conflict arise regarding
 * the export, reexport, transfer, or release of this code, the laws of
 * the United States of America shall be the governing law.
 * 
 * This code constitutes one or more of the following: commercial
 * computer software, commercial computer software documentation or
 * other commercial items.  If the user of this code, or any related
 * documentation of any kind, including related technical data or
 * manuals, is an agency, department, or other entity of the United
 * States government ("Government"), the use, duplication, reproduction,
 * release, modification, disclosure, or transfer of this code, or
 * any related documentation of any kind, is restricted in accordance
 * with Federal Acquisition Regulation 12.212 for civilian agencies
 * and Defense Federal Acquisition Regulation Supplement 227.7202 for
 * military agencies.  The use of this code by the Government is further
 * restricted in accordance with the terms of the license agreement(s)
 * and/or applicable contract terms and conditions covering this code
 * from MIPS Technologies or an authorized third party.
 * 
 * 
 */

/*
 * stddef.h : ANSI stddef definitions
 */


#ifndef __STDDEF_H
#define __STDDEF_H

/* --- Constants --- */
#ifndef NULL
#ifdef __GNUG__
#define NULL	__null
#else
#ifndef __cplusplus
#define NULL ((void *)0)
#else   /* C++ */
#define NULL 0
#endif  /* C++ */
#endif
#endif

/* --- Types --- */
#include <machine/ansi.h>

#ifdef _SIZE_T_
typedef _SIZE_T_ size_t;
#undef _SIZE_T_
#endif

#ifdef _PTRDIFF_T_
typedef _PTRDIFF_T_ ptrdiff_t;
#undef _PTRDIFF_T_
#endif

#ifndef __cplusplus

/* Newer C++ complains if wchar_t is defined, even if it is the same type. */
#ifdef _WCHAR_T_
typedef _WCHAR_T_ wchar_t;
#undef _WCHAR_T_
#endif /* _WCHAR_T_ */

#ifdef _WINT_T_
typedef _WINT_T_ wint_t;
#undef _WINT_T_
#endif /* _WINT_T_ */

#endif /* ! __cplusplus */

/* --- Macros --- */
#if !defined(offsetof) && (((__GNUC__ == 4) && (5 >= __GNUC_MINOR__)) || (__GNUC__ > 4))
/* Offset of member MEMBER in a struct of type TYPE. */
#define offsetof(TYPE, MEMBER) __builtin_offsetof (TYPE, MEMBER)
#else
#define	offsetof(ty, mem)	((int)&(((ty *)0)->mem))
#endif

#endif /* !defined __STDDEF_H */

