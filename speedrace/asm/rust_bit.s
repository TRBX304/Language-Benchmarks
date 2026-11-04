_RNvCs19LOwT73FmA_6rs_bit3bit:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movabsq	$4611686018427387872, %r15
	leaq	31(%r15), %rax
	cmpq	%rax, %rdi
	seta	%al
	leaq	(,%rdi,4), %rbx
	movabsq	$9223372036854775804, %rcx
	cmpq	%rcx, %rbx
	seta	%cl
	orb	%al, %cl
	je	.LBB9_3
	xorl	%r14d, %r14d
.LBB9_2:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	*_RNvNtCs40k4W9msRzi_5alloc7raw_vec12handle_error@GOTPCREL(%rip)
.LBB9_3:
	testq	%rbx, %rbx
	je	.LBB9_4
	movq	%rdi, %r12
	callq	*_RNvCs9hJ03s5DiqP_7___rustc35___rust_no_alloc_shim_is_unstable_v2@GOTPCREL(%rip)
	movl	$4, %r14d
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	*_RNvCs9hJ03s5DiqP_7___rustc12___rust_alloc@GOTPCREL(%rip)
	movq	%r12, %rdi
	movq	%r12, %rsi
	testq	%rax, %rax
	je	.LBB9_2
	testq	%rdi, %rdi
	je	.LBB9_7
.LBB9_8:
	movl	%edi, %ebx
	andl	$3, %ebx
	movabsq	$2361183241434822607, %r14
	cmpq	$4, %rdi
	jae	.LBB9_10
	xorl	%r9d, %r9d
	jmp	.LBB9_13
.LBB9_4:
	movl	$4, %eax
	xorl	%esi, %esi
	testq	%rdi, %rdi
	jne	.LBB9_8
.LBB9_7:
	movl	$1, %ebx
.LBB9_44:
	testq	%rsi, %rsi
	je	.LBB9_46
	shlq	$2, %rsi
	movl	$4, %edx
	movq	%rax, %rdi
	vzeroupper
	callq	*_RNvCs9hJ03s5DiqP_7___rustc14___rust_dealloc@GOTPCREL(%rip)
.LBB9_46:
	movq	%rbx, %rax
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	vzeroupper
	retq
.LBB9_10:
	.cfi_def_cfa_offset 96
	movq	%rbx, 16(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	28(%r15), %rcx
	andq	%rdi, %rcx
	movq	%rcx, 32(%rsp)
	movl	$23771, %edx
	movl	$23770, %ebx
	movl	$15852, %r8d
	movl	$15851, %r14d
	movl	$7933, %r15d
	movl	$7932, %r13d
	movl	$14, %ecx
	movl	$13, %esi
	xorl	%r9d, %r9d
	.p2align	4
.LBB9_11:
	movl	%edx, 12(%rsp)
	movq	%rbx, %rdx
	shrq	$3, %rdx
	movabsq	$2361183241434822607, %r10
	mulxq	%r10, %rdx, %rdx
	shrq	$4, %rdx
	imull	$1000, %edx, %edx
	movl	12(%rsp), %r11d
	subl	%edx, %r11d
	movq	%r14, %rdx
	shrq	$3, %rdx
	mulxq	%r10, %rdx, %rdx
	shrq	$4, %rdx
	imull	$1000, %edx, %edx
	movl	%r8d, %ebp
	subl	%edx, %ebp
	movq	%r13, %rdx
	shrq	$3, %rdx
	mulxq	%r10, %rdx, %rdx
	shrq	$4, %rdx
	imull	$1000, %edx, %edx
	movl	%r15d, %r12d
	subl	%edx, %r12d
	movq	%rsi, %rdx
	shrq	$3, %rdx
	mulxq	%r10, %rdx, %rdx
	shrq	$4, %rdx
	imull	$1000, %edx, %edx
	movl	%ecx, %r10d
	subl	%edx, %r10d
	movl	%r10d, (%rax,%r9,4)
	movl	%r12d, 4(%rax,%r9,4)
	movl	%ebp, 8(%rax,%r9,4)
	movl	%r11d, 12(%rax,%r9,4)
	movl	12(%rsp), %edx
	addq	$4, %r9
	addl	$31676, %edx
	addq	$31676, %rbx
	addl	$31676, %r8d
	addq	$31676, %r14
	addl	$31676, %r15d
	addq	$31676, %r13
	addl	$31676, %ecx
	addq	$31676, %rsi
	cmpq	%r9, 32(%rsp)
	jne	.LBB9_11
	movq	16(%rsp), %rbx
	testq	%rbx, %rbx
	movabsq	$4611686018427387872, %r15
	movq	24(%rsp), %rsi
	movabsq	$2361183241434822607, %r14
	je	.LBB9_15
.LBB9_13:
	leaq	(%rax,%r9,4), %r11
	imull	$7919, %r9d, %r10d
	addl	$14, %r10d
	imulq	$7919, %r9, %rcx
	addq	$13, %rcx
	xorl	%r9d, %r9d
	.p2align	4
.LBB9_14:
	movq	%rcx, %rdx
	shrq	$3, %rdx
	mulxq	%r14, %rdx, %rdx
	shrq	$4, %rdx
	imull	$1000, %edx, %edx
	movl	%r10d, %r8d
	subl	%edx, %r8d
	movl	%r8d, (%r11,%r9,4)
	incq	%r9
	addl	$7919, %r10d
	addq	$7919, %rcx
	cmpq	%r9, %rbx
	jne	.LBB9_14
.LBB9_15:
	cmpq	$4, %rdi
	jae	.LBB9_18
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.LBB9_17
.LBB9_18:
	cmpq	$32, %rdi
	jae	.LBB9_20
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.LBB9_24
.LBB9_20:
	movq	%rdi, %rcx
	andq	%r15, %rcx
	vpxor	%xmm0, %xmm0, %xmm0
	xorl	%edx, %edx
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4
.LBB9_21:
	vpaddd	(%rax,%rdx,4), %ymm0, %ymm0
	vpaddd	32(%rax,%rdx,4), %ymm1, %ymm1
	vpaddd	64(%rax,%rdx,4), %ymm2, %ymm2
	vpaddd	96(%rax,%rdx,4), %ymm3, %ymm3
	addq	$32, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB9_21
	vpaddd	%ymm0, %ymm1, %ymm0
	vpaddd	%ymm2, %ymm3, %ymm1
	vpaddd	%ymm0, %ymm1, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %edx
	cmpq	%rcx, %rdi
	je	.LBB9_28
	testb	$28, %dil
	je	.LBB9_17
.LBB9_24:
	movq	%rcx, %r8
	leaq	28(%r15), %rcx
	andq	%rdi, %rcx
	vmovd	%edx, %xmm0
	.p2align	4
.LBB9_25:
	vpaddd	(%rax,%r8,4), %xmm0, %xmm0
	addq	$4, %r8
	cmpq	%r8, %rcx
	jne	.LBB9_25
	vpshufd	$238, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$85, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %edx
	jmp	.LBB9_27
.LBB9_17:
	addl	(%rax,%rcx,4), %edx
	incq	%rcx
.LBB9_27:
	cmpq	%rcx, %rdi
	jne	.LBB9_17
.LBB9_28:
	movl	%edx, %ecx
	shrl	$31, %ecx
	addl	%edx, %ecx
	sarl	%ecx
	movl	%edi, %edx
	andl	$31, %edx
	movq	%rdi, %r8
	andq	%r15, %r8
	addq	$24, %r15
	andq	%rdi, %r15
	leaq	96(%rax), %r9
	xorl	%ebx, %ebx
	vmovdqa	.LCPI9_0(%rip), %ymm0
	vpbroadcastd	.LCPI9_3(%rip), %ymm1
	vpbroadcastd	.LCPI9_5(%rip), %ymm2
	vpbroadcastd	.LCPI9_1(%rip), %ymm3
	vmovdqa	.LCPI9_0(%rip), %ymm4
	vpbroadcastd	.LCPI9_2(%rip), %ymm5
	vpbroadcastd	.LCPI9_4(%rip), %ymm6
	vpbroadcastd	.LCPI9_6(%rip), %ymm7
	xorl	%r10d, %r10d
	jmp	.LBB9_29
	.p2align	4
.LBB9_43:
	incl	%r10d
	xorl	%r11d, %r11d
	cmpl	%ecx, %ebp
	sete	%r11b
	addq	%r11, %rbx
	shrxl	%edx, %r10d, %r11d
	testl	%r11d, %r11d
	jne	.LBB9_44
.LBB9_29:
	cmpq	$8, %rdi
	jae	.LBB9_31
	xorl	%r11d, %r11d
	xorl	%ebp, %ebp
	jmp	.LBB9_40
	.p2align	4
.LBB9_31:
	vpbroadcastd	%r10d, %ymm8
	cmpq	$32, %rdi
	jae	.LBB9_33
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB9_37
	.p2align	4
.LBB9_33:
	vpxor	%xmm9, %xmm9, %xmm9
	xorl	%r11d, %r11d
	vpxor	%xmm10, %xmm10, %xmm10
	vpxor	%xmm11, %xmm11, %xmm11
	vpxor	%xmm12, %xmm12, %xmm12
	vmovdqa	%ymm4, %ymm13
	.p2align	4
.LBB9_34:
	vpaddd	%ymm3, %ymm13, %ymm14
	vpaddd	%ymm5, %ymm13, %ymm15
	vpandd	%ymm1, %ymm13, %ymm16
	vpand	%ymm1, %ymm14, %ymm14
	vpxord	%ymm6, %ymm16, %ymm17
	vpand	%ymm1, %ymm15, %ymm15
	vpsrlvd	%ymm16, %ymm8, %ymm16
	vptestmd	%ymm2, %ymm16, %k1
	vpsrlvd	%ymm14, %ymm8, %ymm14
	vptestmd	%ymm2, %ymm14, %k2
	vpsrlvd	%ymm17, %ymm8, %ymm14
	vptestmd	%ymm2, %ymm14, %k3
	vpsrlvd	%ymm15, %ymm8, %ymm14
	vptestmd	%ymm2, %ymm14, %k4
	vmovdqu32	-96(%r9,%r11,4), %ymm14 {%k1} {z}
	vpaddd	%ymm14, %ymm9, %ymm9
	vmovdqu32	-64(%r9,%r11,4), %ymm14 {%k2} {z}
	vpaddd	%ymm14, %ymm10, %ymm10
	vmovdqu32	-32(%r9,%r11,4), %ymm14 {%k3} {z}
	vpaddd	%ymm14, %ymm11, %ymm11
	vmovdqu32	(%r9,%r11,4), %ymm14 {%k4} {z}
	vpaddd	%ymm14, %ymm12, %ymm12
	addq	$32, %r11
	vpaddd	%ymm7, %ymm13, %ymm13
	cmpq	%r11, %r8
	jne	.LBB9_34
	vpaddd	%ymm9, %ymm10, %ymm9
	vpaddd	%ymm9, %ymm11, %ymm9
	vpaddd	%ymm9, %ymm12, %ymm9
	vextracti128	$1, %ymm9, %xmm10
	vpaddd	%xmm10, %xmm9, %xmm9
	vpshufd	$238, %xmm9, %xmm10
	vpaddd	%xmm10, %xmm9, %xmm9
	vpshufd	$85, %xmm9, %xmm10
	vpaddd	%xmm10, %xmm9, %xmm9
	vmovd	%xmm9, %ebp
	cmpq	%r8, %rdi
	je	.LBB9_43
	movq	%r8, %r14
	movq	%r8, %r11
	testb	$24, %dil
	je	.LBB9_40
.LBB9_37:
	vmovd	%ebp, %xmm9
	vpbroadcastd	%r14d, %ymm10
	vpor	%ymm0, %ymm10, %ymm10
	.p2align	4
.LBB9_38:
	vpand	%ymm1, %ymm10, %ymm11
	vpsrlvd	%ymm11, %ymm8, %ymm11
	vptestmd	%ymm2, %ymm11, %k1
	vmovdqu32	(%rax,%r14,4), %ymm11 {%k1} {z}
	vpaddd	%ymm11, %ymm9, %ymm9
	addq	$8, %r14
	vpaddd	%ymm3, %ymm10, %ymm10
	cmpq	%r14, %r15
	jne	.LBB9_38
	vextracti128	$1, %ymm9, %xmm8
	vpaddd	%xmm8, %xmm9, %xmm8
	vpshufd	$238, %xmm8, %xmm9
	vpaddd	%xmm9, %xmm8, %xmm8
	vpshufd	$85, %xmm8, %xmm9
	vpaddd	%xmm9, %xmm8, %xmm8
	vmovd	%xmm8, %ebp
	movq	%r15, %r11
	cmpq	%r15, %rdi
	jne	.LBB9_40
	jmp	.LBB9_43
	.p2align	4
.LBB9_42:
	incq	%r11
	cmpq	%r11, %rdi
	je	.LBB9_43
.LBB9_40:
	btl	%r11d, %r10d
	jae	.LBB9_42
	addl	(%rax,%r11,4), %ebp
	jmp	.LBB9_42
.Lfunc_end9:
	.size	_RNvCs19LOwT73FmA_6rs_bit3bit, .Lfunc_end9-_RNvCs19LOwT73FmA_6rs_bit3bit
