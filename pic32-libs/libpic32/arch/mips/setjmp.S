.ident "libc/arch/mips/setjmp.S"
.file 1 "Microchip PIC32 Library"
.loc 1 0

/*
 * setjmp.S: setjmp/longjmp for MIPS
 */

	
#include <xc.h>
#include <sys/asm.h>
#include <sys/signal.h>

	.set	nomips16
	.comm	_nofpu,4

/* always save all 64-bits, in case libraries use ms bits */
#if __mips >= 3 && __mips != 32
/* we're a leaf function, so its safe to use 64-bit ops, as
   an optimisation even if -mgp32 was used. */
	.set gp64
# undef __mips64	
# define __mips64 1
#endif
	
#if __mips64
#define lreg	ld
#define sreg	sd
#else
#define lreg	lw
#define sreg	sw
#endif

#ifdef __SINGLE_FLOAT
#define lfreg	l.s
#define sfreg	s.s
#else
#define lfreg	l.d
#define sfreg	s.d
#endif
	
/* jmpbuf is always defines of type long long */
#define JB_RA	(0*8)
#define JB_S0	(1*8)
#define JB_S1	(2*8)
#define JB_S2	(3*8)
#define JB_S3	(4*8)
#define JB_S4	(5*8)
#define JB_S5	(6*8)
#define JB_S6	(7*8)
#define JB_S7	(8*8)
#define JB_S8	(9*8)
#define JB_SP	(10*8)
#define JB_F20	(11*8)
#define JB_F22	(12*8)
#define JB_F24	(13*8)
#define JB_F26	(14*8)
#define JB_F28	(15*8)
#define JB_F30	(16*8)
#define JB_MASK	(17*8)
#define JB_F21	(18*8)
#define JB_F23	(19*8)
#define JB_F25	(20*8)
#define JB_F27	(21*8)
#define JB_F29	(22*8)
#define JB_F31	(23*8)
#define JB_SAVE	(24*8)


LEAF(setjmp)
	sreg	ra,JB_RA(a0)
	sreg	s0,JB_S0(a0)
	sreg	s1,JB_S1(a0)

	/* get the signal mask */
	move	s0,a0
	move	s1,ra
	li	a0,SIG_SETMASK
	move	a1,zero
	la	a2,JB_MASK(s0)
	jal	sigprocmask

	move	a0,s0	
	move	ra,s1
	lreg	s0,JB_S0(a0)
	lreg	s1,JB_S1(a0)
	b	..setjmp
END(setjmp)


LEAF(_setjmp)
	sreg	ra,JB_RA(a0)
	sreg	s0,JB_S0(a0)
	sreg	s1,JB_S1(a0)
	sreg	zero,JB_MASK(a0)
..setjmp:
	sreg	s2,JB_S2(a0)
	sreg	s3,JB_S3(a0)
	sreg	s4,JB_S4(a0)
	sreg	s5,JB_S5(a0)
	sreg	s6,JB_S6(a0)
	sreg	s7,JB_S7(a0)
	sreg	s8,JB_S8(a0)
	sreg	sp,JB_SP(a0)

#if !defined(__SOFT_FLOAT) && !defined(__NO_FLOAT)
	lw	v0,_nofpu
	bnez	v0,1f
#if __mips64 && !(__mips_fpr == 64 || __mipsfp64)
	mfc0	t0,$sr
#endif
#if ! defined(_ABIN64)
	/* In N64 the registers $f20-$f23 are temporaries. */
	sfreg	$f20,JB_F20(a0)
	sfreg	$f22,JB_F22(a0)
#endif /* ! defined(_ABIN64) */
	sfreg	$f24,JB_F24(a0)
	sfreg	$f26,JB_F26(a0)
	sfreg	$f28,JB_F28(a0)
	sfreg	$f30,JB_F30(a0)
	
#if ! defined(_ABIN32)	
	/* In N32 the odd registers $f21-$f31 are temporaries. */
#if __mips64 && !(__mips_fpr == 64 || __mipsfp64)
	and	t0,SR_FR
	beqz	t0,1f
#endif	
#if __mips64 || __mips_fpr == 64 || __mipsfp64
	sfreg	$f21,JB_F21(a0)
	sfreg	$f23,JB_F23(a0)
	sfreg	$f25,JB_F25(a0)
	sfreg	$f27,JB_F27(a0)
	sfreg	$f29,JB_F29(a0)
	sfreg	$f31,JB_F31(a0)
#endif
#endif /* ! defined(_ABIN32) */
#endif /* !__SOFT_FLOAT && !__NO_FLOAT */
	
	/* normal return */
1:	li	v0,0
	j	ra
END(_setjmp)


LEAF(longjmp)
	/* C99 7.13.2.1: longjmp function cannot cause the setjmp macro
	   to return the value 0; if val is 0, the setjmp macro returns
	   the value 1. */
	bnez	a1,1f
	li	a1,1
1:

	/* reset the signal mask */
	move	s0,a0
	move	s1,a1

	li	a0,SIG_SETMASK
	la	a1,JB_MASK(s0)
	move	a2,zero
	jal	sigprocmask

	move	a0,s0
	move	a1,s1
	/* drop through */
END(longjmp)


	# _longjmp (jmp_buf buf, int val)
LEAF(_longjmp)
	lreg	ra,JB_RA(a0)
	lreg	s0,JB_S0(a0)
	lreg	s1,JB_S1(a0)
	lreg	s2,JB_S2(a0)
	lreg	s3,JB_S3(a0)
	lreg	s4,JB_S4(a0)
	lreg	s5,JB_S5(a0)
	lreg	s6,JB_S6(a0)
	lreg	s7,JB_S7(a0)
	lreg	s8,JB_S8(a0)
	lreg	sp,JB_SP(a0)
	
#if !defined(__SOFT_FLOAT) && !defined(__NO_FLOAT)
	lw	v0,_nofpu
	bnez	v0,1f
#if __mips64 && !(__mips_fpr == 64 || __mipsfp64)
	mfc0	t0,$sr
#endif
#if ! defined(_ABIN64)	
	/* In N64 the registers $f20-$f23 are temporaries. */
	lfreg	$f20,JB_F20(a0)
	lfreg	$f22,JB_F22(a0)
#endif /* ! defined(_ABIN64) */	
	lfreg	$f24,JB_F24(a0)
	lfreg	$f26,JB_F26(a0)
	lfreg	$f28,JB_F28(a0)
	lfreg	$f30,JB_F30(a0)
	
#if ! defined(_ABIN32)	
	/* In N32 the odd registers $f21-$f31 are temporaries. */
#if __mips64 && !(__mips_fpr == 64 || __mipsfp64)
	and	t0,SR_FR
	beqz	t0,1f
#endif	
#if __mips64 || __mips_fpr == 64 || __mipsfp64
#if ! defined(_ABIN64)	
	/* In N64 the registers $f20-$f23 are temporaries. */
	lfreg	$f21,JB_F21(a0)
	lfreg	$f23,JB_F23(a0)
#endif	
	lfreg	$f25,JB_F25(a0)
	lfreg	$f27,JB_F27(a0)
	lfreg	$f29,JB_F29(a0)
	lfreg	$f31,JB_F31(a0)
#endif
#endif /* ! defined(_ABIN32) */	
#endif /* !__SOFT_FLOAT && !__NO_FLOAT */

1:	move	v0,a1
	j	ra
END(_longjmp)


LEAF(sigsetjmp)
	sw	a1,JB_SAVE(a0)
	beqz	a1,_setjmp
	b	setjmp
END(sigsetjmp)
		

LEAF(siglongjmp)
	lw	t0,JB_SAVE(a0)
	beqz	t0,_longjmp
	b	longjmp
END(siglongjmp)


# dummy sigprocmask in case signals are not in use
WLEAF(sigprocmask)
	beqz	a2,1f
	sw	zero,0(a2)
1:	j	ra
WEND(sigprocmask)

