pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package asm_cpufeature_h is

   --  unsupported macro: NCAPINTS 10
   --  unsupported macro: NBUGINTS 1
   --  unsupported macro: X86_FEATURE_FPU (0*32+ 0)
   --  unsupported macro: X86_FEATURE_VME (0*32+ 1)
   --  unsupported macro: X86_FEATURE_DE (0*32+ 2)
   --  unsupported macro: X86_FEATURE_PSE (0*32+ 3)
   --  unsupported macro: X86_FEATURE_TSC (0*32+ 4)
   --  unsupported macro: X86_FEATURE_MSR (0*32+ 5)
   --  unsupported macro: X86_FEATURE_PAE (0*32+ 6)
   --  unsupported macro: X86_FEATURE_MCE (0*32+ 7)
   --  unsupported macro: X86_FEATURE_CX8 (0*32+ 8)
   --  unsupported macro: X86_FEATURE_APIC (0*32+ 9)
   --  unsupported macro: X86_FEATURE_SEP (0*32+11)
   --  unsupported macro: X86_FEATURE_MTRR (0*32+12)
   --  unsupported macro: X86_FEATURE_PGE (0*32+13)
   --  unsupported macro: X86_FEATURE_MCA (0*32+14)
   --  unsupported macro: X86_FEATURE_CMOV (0*32+15)
   --  unsupported macro: X86_FEATURE_PAT (0*32+16)
   --  unsupported macro: X86_FEATURE_PSE36 (0*32+17)
   --  unsupported macro: X86_FEATURE_PN (0*32+18)
   --  unsupported macro: X86_FEATURE_CLFLUSH (0*32+19)
   --  unsupported macro: X86_FEATURE_DS (0*32+21)
   --  unsupported macro: X86_FEATURE_ACPI (0*32+22)
   --  unsupported macro: X86_FEATURE_MMX (0*32+23)
   --  unsupported macro: X86_FEATURE_FXSR (0*32+24)
   --  unsupported macro: X86_FEATURE_XMM (0*32+25)
   --  unsupported macro: X86_FEATURE_XMM2 (0*32+26)
   --  unsupported macro: X86_FEATURE_SELFSNOOP (0*32+27)
   --  unsupported macro: X86_FEATURE_HT (0*32+28)
   --  unsupported macro: X86_FEATURE_ACC (0*32+29)
   --  unsupported macro: X86_FEATURE_IA64 (0*32+30)
   --  unsupported macro: X86_FEATURE_PBE (0*32+31)
   --  unsupported macro: X86_FEATURE_SYSCALL (1*32+11)
   --  unsupported macro: X86_FEATURE_MP (1*32+19)
   --  unsupported macro: X86_FEATURE_NX (1*32+20)
   --  unsupported macro: X86_FEATURE_MMXEXT (1*32+22)
   --  unsupported macro: X86_FEATURE_FXSR_OPT (1*32+25)
   --  unsupported macro: X86_FEATURE_GBPAGES (1*32+26)
   --  unsupported macro: X86_FEATURE_RDTSCP (1*32+27)
   --  unsupported macro: X86_FEATURE_LM (1*32+29)
   --  unsupported macro: X86_FEATURE_3DNOWEXT (1*32+30)
   --  unsupported macro: X86_FEATURE_3DNOW (1*32+31)
   --  unsupported macro: X86_FEATURE_RECOVERY (2*32+ 0)
   --  unsupported macro: X86_FEATURE_LONGRUN (2*32+ 1)
   --  unsupported macro: X86_FEATURE_LRTI (2*32+ 3)
   --  unsupported macro: X86_FEATURE_CXMMX (3*32+ 0)
   --  unsupported macro: X86_FEATURE_K6_MTRR (3*32+ 1)
   --  unsupported macro: X86_FEATURE_CYRIX_ARR (3*32+ 2)
   --  unsupported macro: X86_FEATURE_CENTAUR_MCR (3*32+ 3)
   --  unsupported macro: X86_FEATURE_K8 (3*32+ 4)
   --  unsupported macro: X86_FEATURE_K7 (3*32+ 5)
   --  unsupported macro: X86_FEATURE_P3 (3*32+ 6)
   --  unsupported macro: X86_FEATURE_P4 (3*32+ 7)
   --  unsupported macro: X86_FEATURE_CONSTANT_TSC (3*32+ 8)
   --  unsupported macro: X86_FEATURE_UP (3*32+ 9)
   --  unsupported macro: X86_FEATURE_FXSAVE_LEAK (3*32+10)
   --  unsupported macro: X86_FEATURE_ARCH_PERFMON (3*32+11)
   --  unsupported macro: X86_FEATURE_PEBS (3*32+12)
   --  unsupported macro: X86_FEATURE_BTS (3*32+13)
   --  unsupported macro: X86_FEATURE_SYSCALL32 (3*32+14)
   --  unsupported macro: X86_FEATURE_SYSENTER32 (3*32+15)
   --  unsupported macro: X86_FEATURE_REP_GOOD (3*32+16)
   --  unsupported macro: X86_FEATURE_MFENCE_RDTSC (3*32+17)
   --  unsupported macro: X86_FEATURE_LFENCE_RDTSC (3*32+18)
   --  unsupported macro: X86_FEATURE_11AP (3*32+19)
   --  unsupported macro: X86_FEATURE_NOPL (3*32+20)
   --  unsupported macro: X86_FEATURE_ALWAYS (3*32+21)
   --  unsupported macro: X86_FEATURE_XTOPOLOGY (3*32+22)
   --  unsupported macro: X86_FEATURE_TSC_RELIABLE (3*32+23)
   --  unsupported macro: X86_FEATURE_NONSTOP_TSC (3*32+24)
   --  unsupported macro: X86_FEATURE_CLFLUSH_MONITOR (3*32+25)
   --  unsupported macro: X86_FEATURE_EXTD_APICID (3*32+26)
   --  unsupported macro: X86_FEATURE_AMD_DCM (3*32+27)
   --  unsupported macro: X86_FEATURE_APERFMPERF (3*32+28)
   --  unsupported macro: X86_FEATURE_EAGER_FPU (3*32+29)
   --  unsupported macro: X86_FEATURE_NONSTOP_TSC_S3 (3*32+30)
   --  unsupported macro: X86_FEATURE_XMM3 (4*32+ 0)
   --  unsupported macro: X86_FEATURE_PCLMULQDQ (4*32+ 1)
   --  unsupported macro: X86_FEATURE_DTES64 (4*32+ 2)
   --  unsupported macro: X86_FEATURE_MWAIT (4*32+ 3)
   --  unsupported macro: X86_FEATURE_DSCPL (4*32+ 4)
   --  unsupported macro: X86_FEATURE_VMX (4*32+ 5)
   --  unsupported macro: X86_FEATURE_SMX (4*32+ 6)
   --  unsupported macro: X86_FEATURE_EST (4*32+ 7)
   --  unsupported macro: X86_FEATURE_TM2 (4*32+ 8)
   --  unsupported macro: X86_FEATURE_SSSE3 (4*32+ 9)
   --  unsupported macro: X86_FEATURE_CID (4*32+10)
   --  unsupported macro: X86_FEATURE_FMA (4*32+12)
   --  unsupported macro: X86_FEATURE_CX16 (4*32+13)
   --  unsupported macro: X86_FEATURE_XTPR (4*32+14)
   --  unsupported macro: X86_FEATURE_PDCM (4*32+15)
   --  unsupported macro: X86_FEATURE_PCID (4*32+17)
   --  unsupported macro: X86_FEATURE_DCA (4*32+18)
   --  unsupported macro: X86_FEATURE_XMM4_1 (4*32+19)
   --  unsupported macro: X86_FEATURE_XMM4_2 (4*32+20)
   --  unsupported macro: X86_FEATURE_X2APIC (4*32+21)
   --  unsupported macro: X86_FEATURE_MOVBE (4*32+22)
   --  unsupported macro: X86_FEATURE_POPCNT (4*32+23)
   --  unsupported macro: X86_FEATURE_TSC_DEADLINE_TIMER (4*32+24)
   --  unsupported macro: X86_FEATURE_AES (4*32+25)
   --  unsupported macro: X86_FEATURE_XSAVE (4*32+26)
   --  unsupported macro: X86_FEATURE_OSXSAVE (4*32+27)
   --  unsupported macro: X86_FEATURE_AVX (4*32+28)
   --  unsupported macro: X86_FEATURE_F16C (4*32+29)
   --  unsupported macro: X86_FEATURE_RDRAND (4*32+30)
   --  unsupported macro: X86_FEATURE_HYPERVISOR (4*32+31)
   --  unsupported macro: X86_FEATURE_XSTORE (5*32+ 2)
   --  unsupported macro: X86_FEATURE_XSTORE_EN (5*32+ 3)
   --  unsupported macro: X86_FEATURE_XCRYPT (5*32+ 6)
   --  unsupported macro: X86_FEATURE_XCRYPT_EN (5*32+ 7)
   --  unsupported macro: X86_FEATURE_ACE2 (5*32+ 8)
   --  unsupported macro: X86_FEATURE_ACE2_EN (5*32+ 9)
   --  unsupported macro: X86_FEATURE_PHE (5*32+10)
   --  unsupported macro: X86_FEATURE_PHE_EN (5*32+11)
   --  unsupported macro: X86_FEATURE_PMM (5*32+12)
   --  unsupported macro: X86_FEATURE_PMM_EN (5*32+13)
   --  unsupported macro: X86_FEATURE_LAHF_LM (6*32+ 0)
   --  unsupported macro: X86_FEATURE_CMP_LEGACY (6*32+ 1)
   --  unsupported macro: X86_FEATURE_SVM (6*32+ 2)
   --  unsupported macro: X86_FEATURE_EXTAPIC (6*32+ 3)
   --  unsupported macro: X86_FEATURE_CR8_LEGACY (6*32+ 4)
   --  unsupported macro: X86_FEATURE_ABM (6*32+ 5)
   --  unsupported macro: X86_FEATURE_SSE4A (6*32+ 6)
   --  unsupported macro: X86_FEATURE_MISALIGNSSE (6*32+ 7)
   --  unsupported macro: X86_FEATURE_3DNOWPREFETCH (6*32+ 8)
   --  unsupported macro: X86_FEATURE_OSVW (6*32+ 9)
   --  unsupported macro: X86_FEATURE_IBS (6*32+10)
   --  unsupported macro: X86_FEATURE_XOP (6*32+11)
   --  unsupported macro: X86_FEATURE_SKINIT (6*32+12)
   --  unsupported macro: X86_FEATURE_WDT (6*32+13)
   --  unsupported macro: X86_FEATURE_LWP (6*32+15)
   --  unsupported macro: X86_FEATURE_FMA4 (6*32+16)
   --  unsupported macro: X86_FEATURE_TCE (6*32+17)
   --  unsupported macro: X86_FEATURE_NODEID_MSR (6*32+19)
   --  unsupported macro: X86_FEATURE_TBM (6*32+21)
   --  unsupported macro: X86_FEATURE_TOPOEXT (6*32+22)
   --  unsupported macro: X86_FEATURE_PERFCTR_CORE (6*32+23)
   --  unsupported macro: X86_FEATURE_PERFCTR_NB (6*32+24)
   --  unsupported macro: X86_FEATURE_PERFCTR_L2 (6*32+28)
   --  unsupported macro: X86_FEATURE_IDA (7*32+ 0)
   --  unsupported macro: X86_FEATURE_ARAT (7*32+ 1)
   --  unsupported macro: X86_FEATURE_CPB (7*32+ 2)
   --  unsupported macro: X86_FEATURE_EPB (7*32+ 3)
   --  unsupported macro: X86_FEATURE_XSAVEOPT (7*32+ 4)
   --  unsupported macro: X86_FEATURE_PLN (7*32+ 5)
   --  unsupported macro: X86_FEATURE_PTS (7*32+ 6)
   --  unsupported macro: X86_FEATURE_DTHERM (7*32+ 7)
   --  unsupported macro: X86_FEATURE_HW_PSTATE (7*32+ 8)
   --  unsupported macro: X86_FEATURE_PROC_FEEDBACK (7*32+ 9)
   --  unsupported macro: X86_FEATURE_TPR_SHADOW (8*32+ 0)
   --  unsupported macro: X86_FEATURE_VNMI (8*32+ 1)
   --  unsupported macro: X86_FEATURE_FLEXPRIORITY (8*32+ 2)
   --  unsupported macro: X86_FEATURE_EPT (8*32+ 3)
   --  unsupported macro: X86_FEATURE_VPID (8*32+ 4)
   --  unsupported macro: X86_FEATURE_NPT (8*32+ 5)
   --  unsupported macro: X86_FEATURE_LBRV (8*32+ 6)
   --  unsupported macro: X86_FEATURE_SVML (8*32+ 7)
   --  unsupported macro: X86_FEATURE_NRIPS (8*32+ 8)
   --  unsupported macro: X86_FEATURE_TSCRATEMSR (8*32+ 9)
   --  unsupported macro: X86_FEATURE_VMCBCLEAN (8*32+10)
   --  unsupported macro: X86_FEATURE_FLUSHBYASID (8*32+11)
   --  unsupported macro: X86_FEATURE_DECODEASSISTS (8*32+12)
   --  unsupported macro: X86_FEATURE_PAUSEFILTER (8*32+13)
   --  unsupported macro: X86_FEATURE_PFTHRESHOLD (8*32+14)
   --  unsupported macro: X86_FEATURE_VMMCALL ( 8*32+15)
   --  unsupported macro: X86_FEATURE_FSGSBASE (9*32+ 0)
   --  unsupported macro: X86_FEATURE_TSC_ADJUST (9*32+ 1)
   --  unsupported macro: X86_FEATURE_BMI1 (9*32+ 3)
   --  unsupported macro: X86_FEATURE_HLE (9*32+ 4)
   --  unsupported macro: X86_FEATURE_AVX2 (9*32+ 5)
   --  unsupported macro: X86_FEATURE_SMEP (9*32+ 7)
   --  unsupported macro: X86_FEATURE_BMI2 (9*32+ 8)
   --  unsupported macro: X86_FEATURE_ERMS (9*32+ 9)
   --  unsupported macro: X86_FEATURE_INVPCID (9*32+10)
   --  unsupported macro: X86_FEATURE_RTM (9*32+11)
   --  unsupported macro: X86_FEATURE_MPX (9*32+14)
   --  unsupported macro: X86_FEATURE_AVX512F (9*32+16)
   --  unsupported macro: X86_FEATURE_RDSEED (9*32+18)
   --  unsupported macro: X86_FEATURE_ADX (9*32+19)
   --  unsupported macro: X86_FEATURE_SMAP (9*32+20)
   --  unsupported macro: X86_FEATURE_CLFLUSHOPT (9*32+23)
   --  unsupported macro: X86_FEATURE_AVX512PF (9*32+26)
   --  unsupported macro: X86_FEATURE_AVX512ER (9*32+27)
   --  unsupported macro: X86_FEATURE_AVX512CD (9*32+28)
   --  arg-macro: function X86_BUG (NCAPINTS*32 + (x)
   --    return NCAPINTS*32 + (x);
   --  unsupported macro: X86_BUG_F00F X86_BUG(0)
   --  unsupported macro: X86_BUG_FDIV X86_BUG(1)
   --  unsupported macro: X86_BUG_COMA X86_BUG(2)
   --  unsupported macro: X86_BUG_AMD_TLB_MMATCH X86_BUG(3)
   --  unsupported macro: X86_BUG_AMD_APIC_C1E X86_BUG(4)
   --  arg-macro: procedure test_cpu_cap test_bit(bit, (unsigned long *)((c).x86_capability))
   --    test_bit(bit, (unsigned long *)((c).x86_capability))
   --  arg-macro: function REQUIRED_MASK_BIT_SET ( (((bit)>>5)=0  and then  (1UL<<((bit)and31) and REQUIRED_MASK0))  or else  (((bit)>>5)=1  and then  (1UL<<((bit)and31) and REQUIRED_MASK1))  or else  (((bit)>>5)=2  and then  (1UL<<((bit)and31) and REQUIRED_MASK2))  or else  (((bit)>>5)=3  and then  (1UL<<((bit)and31) and REQUIRED_MASK3))  or else  (((bit)>>5)=4  and then  (1UL<<((bit)and31) and REQUIRED_MASK4))  or else  (((bit)>>5)=5  and then  (1UL<<((bit)and31) and REQUIRED_MASK5))  or else  (((bit)>>5)=6  and then  (1UL<<((bit)and31) and REQUIRED_MASK6))  or else  (((bit)>>5)=7  and then  (1UL<<((bit)and31) and REQUIRED_MASK7))  or else  (((bit)>>5)=8  and then  (1UL<<((bit)and31) and REQUIRED_MASK8))  or else  (((bit)>>5)=9  and then  (1UL<<((bit)and31) and REQUIRED_MASK9)) 
   --    return  (((bit)>>5)=0  and then  (1UL<<((bit)and31) and REQUIRED_MASK0))  or else  (((bit)>>5)=1  and then  (1UL<<((bit)and31) and REQUIRED_MASK1))  or else  (((bit)>>5)=2  and then  (1UL<<((bit)and31) and REQUIRED_MASK2))  or else  (((bit)>>5)=3  and then  (1UL<<((bit)and31) and REQUIRED_MASK3))  or else  (((bit)>>5)=4  and then  (1UL<<((bit)and31) and REQUIRED_MASK4))  or else  (((bit)>>5)=5  and then  (1UL<<((bit)and31) and REQUIRED_MASK5))  or else  (((bit)>>5)=6  and then  (1UL<<((bit)and31) and REQUIRED_MASK6))  or else  (((bit)>>5)=7  and then  (1UL<<((bit)and31) and REQUIRED_MASK7))  or else  (((bit)>>5)=8  and then  (1UL<<((bit)and31) and REQUIRED_MASK8))  or else  (((bit)>>5)=9  and then  (1UL<<((bit)and31) and REQUIRED_MASK9)) ;
   --  arg-macro: function cpu_has (__builtin_constant_p(bit)  and then  REQUIRED_MASK_BIT_SET(bit) ? 1 : test_cpu_cap(c, bit)
   --    return __builtin_constant_p(bit)  and then  REQUIRED_MASK_BIT_SET(bit) ? 1 : test_cpu_cap(c, bit);
   --  arg-macro: function this_cpu_has (__builtin_constant_p(bit)  and then  REQUIRED_MASK_BIT_SET(bit) ? 1 : x86_this_cpu_test_bit(bit, (unsigned long *)andcpu_info.x86_capability)
   --    return __builtin_constant_p(bit)  and then  REQUIRED_MASK_BIT_SET(bit) ? 1 : x86_this_cpu_test_bit(bit, (unsigned long *)andcpu_info.x86_capability);
   --  arg-macro: procedure boot_cpu_has cpu_has(andboot_cpu_data, bit)
   --    cpu_has(andboot_cpu_data, bit)
   --  arg-macro: procedure set_cpu_cap set_bit(bit, (unsigned long *)((c).x86_capability))
   --    set_bit(bit, (unsigned long *)((c).x86_capability))
   --  arg-macro: procedure clear_cpu_cap clear_bit(bit, (unsigned long *)((c).x86_capability))
   --    clear_bit(bit, (unsigned long *)((c).x86_capability))
   --  arg-macro: procedure setup_clear_cpu_cap do { clear_cpu_cap(andboot_cpu_data, bit); set_bit(bit, (unsigned long *)cpu_caps_cleared); } while (0)
   --    do { clear_cpu_cap(andboot_cpu_data, bit); set_bit(bit, (unsigned long *)cpu_caps_cleared); } while (0)
   --  arg-macro: procedure setup_force_cpu_cap do { set_cpu_cap(andboot_cpu_data, bit); set_bit(bit, (unsigned long *)cpu_caps_set); } while (0)
   --    do { set_cpu_cap(andboot_cpu_data, bit); set_bit(bit, (unsigned long *)cpu_caps_set); } while (0)
   --  unsupported macro: cpu_has_fpu boot_cpu_has(X86_FEATURE_FPU)
   --  unsupported macro: cpu_has_de boot_cpu_has(X86_FEATURE_DE)
   --  unsupported macro: cpu_has_pse boot_cpu_has(X86_FEATURE_PSE)
   --  unsupported macro: cpu_has_tsc boot_cpu_has(X86_FEATURE_TSC)
   --  unsupported macro: cpu_has_pge boot_cpu_has(X86_FEATURE_PGE)
   --  unsupported macro: cpu_has_apic boot_cpu_has(X86_FEATURE_APIC)
   --  unsupported macro: cpu_has_sep boot_cpu_has(X86_FEATURE_SEP)
   --  unsupported macro: cpu_has_mtrr boot_cpu_has(X86_FEATURE_MTRR)
   --  unsupported macro: cpu_has_mmx boot_cpu_has(X86_FEATURE_MMX)
   --  unsupported macro: cpu_has_fxsr boot_cpu_has(X86_FEATURE_FXSR)
   --  unsupported macro: cpu_has_xmm boot_cpu_has(X86_FEATURE_XMM)
   --  unsupported macro: cpu_has_xmm2 boot_cpu_has(X86_FEATURE_XMM2)
   --  unsupported macro: cpu_has_xmm3 boot_cpu_has(X86_FEATURE_XMM3)
   --  unsupported macro: cpu_has_ssse3 boot_cpu_has(X86_FEATURE_SSSE3)
   --  unsupported macro: cpu_has_aes boot_cpu_has(X86_FEATURE_AES)
   --  unsupported macro: cpu_has_avx boot_cpu_has(X86_FEATURE_AVX)
   --  unsupported macro: cpu_has_avx2 boot_cpu_has(X86_FEATURE_AVX2)
   --  unsupported macro: cpu_has_ht boot_cpu_has(X86_FEATURE_HT)
   --  unsupported macro: cpu_has_nx boot_cpu_has(X86_FEATURE_NX)
   --  unsupported macro: cpu_has_xstore boot_cpu_has(X86_FEATURE_XSTORE)
   --  unsupported macro: cpu_has_xstore_enabled boot_cpu_has(X86_FEATURE_XSTORE_EN)
   --  unsupported macro: cpu_has_xcrypt boot_cpu_has(X86_FEATURE_XCRYPT)
   --  unsupported macro: cpu_has_xcrypt_enabled boot_cpu_has(X86_FEATURE_XCRYPT_EN)
   --  unsupported macro: cpu_has_ace2 boot_cpu_has(X86_FEATURE_ACE2)
   --  unsupported macro: cpu_has_ace2_enabled boot_cpu_has(X86_FEATURE_ACE2_EN)
   --  unsupported macro: cpu_has_phe boot_cpu_has(X86_FEATURE_PHE)
   --  unsupported macro: cpu_has_phe_enabled boot_cpu_has(X86_FEATURE_PHE_EN)
   --  unsupported macro: cpu_has_pmm boot_cpu_has(X86_FEATURE_PMM)
   --  unsupported macro: cpu_has_pmm_enabled boot_cpu_has(X86_FEATURE_PMM_EN)
   --  unsupported macro: cpu_has_ds boot_cpu_has(X86_FEATURE_DS)
   --  unsupported macro: cpu_has_pebs boot_cpu_has(X86_FEATURE_PEBS)
   --  unsupported macro: cpu_has_clflush boot_cpu_has(X86_FEATURE_CLFLUSH)
   --  unsupported macro: cpu_has_bts boot_cpu_has(X86_FEATURE_BTS)
   --  unsupported macro: cpu_has_gbpages boot_cpu_has(X86_FEATURE_GBPAGES)
   --  unsupported macro: cpu_has_arch_perfmon boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
   --  unsupported macro: cpu_has_pat boot_cpu_has(X86_FEATURE_PAT)
   --  unsupported macro: cpu_has_xmm4_1 boot_cpu_has(X86_FEATURE_XMM4_1)
   --  unsupported macro: cpu_has_xmm4_2 boot_cpu_has(X86_FEATURE_XMM4_2)
   --  unsupported macro: cpu_has_x2apic boot_cpu_has(X86_FEATURE_X2APIC)
   --  unsupported macro: cpu_has_xsave boot_cpu_has(X86_FEATURE_XSAVE)
   --  unsupported macro: cpu_has_xsaveopt boot_cpu_has(X86_FEATURE_XSAVEOPT)
   --  unsupported macro: cpu_has_osxsave boot_cpu_has(X86_FEATURE_OSXSAVE)
   --  unsupported macro: cpu_has_hypervisor boot_cpu_has(X86_FEATURE_HYPERVISOR)
   --  unsupported macro: cpu_has_pclmulqdq boot_cpu_has(X86_FEATURE_PCLMULQDQ)
   --  unsupported macro: cpu_has_perfctr_core boot_cpu_has(X86_FEATURE_PERFCTR_CORE)
   --  unsupported macro: cpu_has_perfctr_nb boot_cpu_has(X86_FEATURE_PERFCTR_NB)
   --  unsupported macro: cpu_has_perfctr_l2 boot_cpu_has(X86_FEATURE_PERFCTR_L2)
   --  unsupported macro: cpu_has_cx8 boot_cpu_has(X86_FEATURE_CX8)
   --  unsupported macro: cpu_has_cx16 boot_cpu_has(X86_FEATURE_CX16)
   --  unsupported macro: cpu_has_eager_fpu boot_cpu_has(X86_FEATURE_EAGER_FPU)
   --  unsupported macro: cpu_has_topoext boot_cpu_has(X86_FEATURE_TOPOEXT)
   --  unsupported macro: cpu_has_vme 0
   --  unsupported macro: cpu_has_pae ___BUG___
   --  unsupported macro: cpu_has_mp 1
   --  unsupported macro: cpu_has_k6_mtrr 0
   --  unsupported macro: cpu_has_cyrix_arr 0
   --  unsupported macro: cpu_has_centaur_mcr 0
   --  arg-macro: function static_cpu_has ( __builtin_constant_p(boot_cpu_has(bit)) ? boot_cpu_has(bit) : __builtin_constant_p(bit) ? __static_cpu_has(bit) : boot_cpu_has(bit) 
   --    return  __builtin_constant_p(boot_cpu_has(bit)) ? boot_cpu_has(bit) : __builtin_constant_p(bit) ? __static_cpu_has(bit) : boot_cpu_has(bit) ;
   --  arg-macro: function static_cpu_has_safe ( __builtin_constant_p(boot_cpu_has(bit)) ? boot_cpu_has(bit) : _static_cpu_has_safe(bit) 
   --    return  __builtin_constant_p(boot_cpu_has(bit)) ? boot_cpu_has(bit) : _static_cpu_has_safe(bit) ;
   --  arg-macro: procedure cpu_has_bug cpu_has(c, (bit))
   --    cpu_has(c, (bit))
   --  arg-macro: procedure set_cpu_bug set_cpu_cap(c, (bit))
   --    set_cpu_cap(c, (bit))
   --  arg-macro: procedure clear_cpu_bug clear_cpu_cap(c, (bit));
   --    clear_cpu_cap(c, (bit));
   --  arg-macro: procedure static_cpu_has_bug static_cpu_has((bit))
   --    static_cpu_has((bit))
   --  arg-macro: procedure boot_cpu_has_bug cpu_has_bug(andboot_cpu_data, (bit))
   --    cpu_has_bug(andboot_cpu_data, (bit))
   --  unsupported macro: MAX_CPU_FEATURES (NCAPINTS * 32)
   --  unsupported macro: cpu_have_feature boot_cpu_has
   --  unsupported macro: CPU_FEATURE_TYPEFMT "x86,ven%04Xfam%04Xmod%04X"
   --  unsupported macro: CPU_FEATURE_TYPEVAL boot_cpu_data.x86_vendor, boot_cpu_data.x86, boot_cpu_data.x86_model
  -- * Defines x86 CPU feature bits
  --  

  -- * Note: If the comment begins with a quoted string, that string is used
  -- * in /proc/cpuinfo instead of the macro name.  If the string is "",
  -- * this feature bit is not displayed in /proc/cpuinfo at all.
  --  

  -- Intel-defined CPU features, CPUID level 0x00000001 (edx), word 0  
  -- (plus FCMOVcc, FCOMI with FPU)  
  -- AMD-defined CPU features, CPUID level 0x80000001, word 1  
  -- Don't duplicate feature flags which are redundant with Intel!  
  -- Transmeta-defined CPU features, CPUID level 0x80860001, word 2  
  -- Other features, Linux-defined mapping, word 3  
  -- This range is used for feature bits which conflict or are synthesized  
  -- cpu types for specific tunings:  
  -- Intel-defined CPU features, CPUID level 0x00000001 (ecx), word 4  
  -- VIA/Cyrix/Centaur-defined CPU features, CPUID level 0xC0000001, word 5  
  -- More extended AMD flags: CPUID level 0x80000001, ecx, word 6  
  -- * Auxiliary flags: Linux defined - For features scattered in various
  -- * CPUID levels like 0x6, 0xA etc, word 7
  --  

  -- Virtualization flags: Linux defined, word 8  
  -- Intel-defined CPU features, CPUID level 0x00000007:0 (ebx), word 9  
  -- * BUG word(s)
  --  

   x86_cap_flags : aliased array (0 .. 319) of Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cpufeature.h:246
   pragma Import (C, x86_cap_flags, "x86_cap_flags");

   x86_power_flags : aliased array (0 .. 31) of Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cpufeature.h:247
   pragma Import (C, x86_power_flags, "x86_power_flags");

   procedure warn_pre_alternatives;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cpufeature.h:366
   pragma Import (CPP, warn_pre_alternatives, "_Z21warn_pre_alternativesv");

   --  skipped func __static_cpu_has_safe

  -- * Static testing of CPU features.  Used the same as boot_cpu_has().
  -- * These are only valid after alternatives have run, but will statically
  -- * patch the target code for additional performance.
  --  

   --  skipped func __static_cpu_has

  --		 * Catch too early usage of this before alternatives
  --		 * have run.
  --		  

  -- no replacement  
  -- 1: do replace  
  -- source len  
  -- replacement len  
  -- skipping size check since replacement size = 0  
  -- no replacement  
  -- feature bit  
  -- source len  
  -- replacement len  
  -- skipping size check since replacement size = 0  
  -- Open-coded due to __stringify() in ALTERNATIVE()  
  -- feature bit  
  -- source len  
  -- replacement len  
  -- size check  
   --  skipped func _static_cpu_has_safe

  -- * We need to spell the jumps to the compiler because, depending on the offset,
  -- * the replacement jump can be bigger than the original jump, and this we cannot
  -- * have. Thus, we force the jump to the widest, 4-byte, signed relative
  -- * offset even though the last would often fit in less bytes.
  --  

  -- src offset  
  -- repl offset  
  -- always replace  
  -- src len  
  -- repl len  
  -- src offset  
  -- no replacement  
  -- feature bit  
  -- src len  
  -- repl len  
  -- Open-coded due to __stringify() in ALTERNATIVE()  
  -- src offset  
  -- repl offset  
  -- always replace  
  -- source len  
  -- replacement len  
  -- size check  
  -- src offset  
  -- repl offset  
  -- feature bit  
  -- src len  
  -- repl len  
  -- size check  
  -- * gcc 3.x is too stupid to do the static test; fall back to dynamic.
  --  

end asm_cpufeature_h;