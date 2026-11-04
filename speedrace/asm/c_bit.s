bit:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movl	$1, %ebx
	shlx	%edi, %ebx, %ebx
	andq	$-32, %rsp
	subq	$288, %rsp
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	testl	%edi, %edi
	jle	.L22
	leal	-1(%rdi), %eax
	cmpl	$6, %eax
	jbe	.L23
	vmovdqa	.LC1(%rip), %ymm1
	movl	%edi, %eax
	shrl	$3, %eax
	vmovdqa	%ymm1, (%rsp)
	cmpl	$1, %eax
	je	.L4
	vmovdqa	.LC8(%rip), %ymm0
	vmovdqa	%ymm0, 32(%rsp)
	cmpl	$2, %eax
	je	.L25
	vmovdqa	.LC9(%rip), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	cmpl	$3, %eax
	je	.L26
	vmovdqa	.LC10(%rip), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	cmpl	$4, %eax
	je	.L27
	vmovdqa	.LC11(%rip), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	cmpl	$5, %eax
	je	.L28
	vmovdqa	.LC12(%rip), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	cmpl	$6, %eax
	je	.L29
	vmovdqa	.LC13(%rip), %ymm0
	vmovdqa	%ymm0, 192(%rsp)
	cmpl	$7, %eax
	je	.L30
	vmovdqa	.LC14(%rip), %ymm0
	vmovdqa	.LC0(%rip), %ymm1
	vmovdqa	%ymm0, 224(%rsp)
.L4:
	vmovdqa	%xmm1, %xmm0
	vextracti128	$0x1, %ymm1, %xmm1
	movl	%edi, %esi
	vpaddd	%xmm1, %xmm0, %xmm1
	andl	$-8, %esi
	vpsrldq	$8, %xmm1, %xmm0
	movl	%esi, %edx
	vpaddd	%xmm0, %xmm1, %xmm0
	vpsrldq	$4, %xmm0, %xmm2
	vpaddd	%xmm2, %xmm0, %xmm0
	vmovd	%xmm0, %ecx
	cmpl	%esi, %edi
	je	.L5
.L3:
	movl	%edi, %r8d
	subl	%edx, %r8d
	leal	-1(%r8), %eax
	cmpl	$2, %eax
	jbe	.L6
	vpbroadcastd	%esi, %xmm0
	movl	$7919, %eax
	vpaddd	.LC15(%rip), %xmm0, %xmm0
	vpbroadcastd	%eax, %xmm2
	movl	$13, %eax
	vpmulld	%xmm2, %xmm0, %xmm0
	vpbroadcastd	%eax, %xmm2
	movl	$274877907, %eax
	vpaddd	%xmm2, %xmm0, %xmm0
	vpbroadcastd	%eax, %xmm2
	movl	$1, %eax
	vpsrlq	$32, %xmm0, %xmm3
	vpmuldq	%xmm2, %xmm0, %xmm4
	vpmuldq	%xmm2, %xmm3, %xmm2
	vmovdqa	.LC19(%rip), %xmm3
	vpermi2d	%xmm2, %xmm4, %xmm3
	vpsrad	$6, %xmm3, %xmm3
	vpslld	$5, %xmm3, %xmm2
	vpsubd	%xmm3, %xmm2, %xmm2
	vpslld	$2, %xmm2, %xmm2
	vpaddd	%xmm3, %xmm2, %xmm2
	vpslld	$3, %xmm2, %xmm2
	vpsubd	%xmm2, %xmm0, %xmm0
	vpbroadcastd	%eax, %xmm2
	movl	%r8d, %eax
	vpaddd	%xmm2, %xmm0, %xmm0
	andl	$-4, %eax
	vmovdqa	%xmm0, (%rsp,%rdx,4)
	vpaddd	%xmm0, %xmm1, %xmm0
	addl	%eax, %esi
	andl	$3, %r8d
	vpsrldq	$8, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %ecx
	je	.L5
.L6:
	imull	$7919, %esi, %r8d
	movl	$1000, %r9d
	leal	1(%rsi), %r10d
	leal	13(%r8), %eax
	cltd
	idivl	%r9d
	leal	1(%rdx), %eax
	movslq	%esi, %rdx
	movl	%eax, (%rsp,%rdx,4)
	addl	%eax, %ecx
	cmpl	%r10d, %edi
	jle	.L5
	leal	7932(%r8), %eax
	movslq	%r10d, %r10
	addl	$2, %esi
	cltd
	idivl	%r9d
	leal	1(%rdx), %eax
	movl	%eax, (%rsp,%r10,4)
	addl	%eax, %ecx
	cmpl	%esi, %edi
	jle	.L5
	leal	15851(%r8), %eax
	movslq	%esi, %rsi
	cltd
	idivl	%r9d
	leal	1(%rdx), %eax
	movl	%eax, (%rsp,%rsi,4)
	addl	%eax, %ecx
.L5:
	movl	%ecx, %r12d
	shrl	$31, %r12d
	addl	%ecx, %r12d
	sarl	%r12d
	testl	%ebx, %ebx
	jle	.L69
.L2:
	testl	%edi, %edi
	jle	.L9
	movl	%edi, %r8d
	movl	%edi, %r10d
	vmovdqa	(%rsp), %ymm4
	vmovdqa	32(%rsp), %ymm6
	vmovdqa	64(%rsp), %ymm8
	vmovdqa	96(%rsp), %ymm10
	leal	-1(%rdi), %r13d
	shrl	$3, %r8d
	vmovdqa	128(%rsp), %ymm12
	vmovdqa	160(%rsp), %ymm14
	andl	$-8, %r10d
	xorl	%ecx, %ecx
	vmovdqa32	192(%rsp), %ymm16
	vmovdqa32	224(%rsp), %ymm18
	xorl	%r11d, %r11d
	movl	$1, %r9d
	vmovdqa	.LC15(%rip), %xmm2
	vmovdqa	.LC21(%rip), %ymm3
	vmovdqa	.LC23(%rip), %ymm5
	vmovdqa	.LC24(%rip), %ymm7
	vmovdqa	.LC25(%rip), %ymm9
	vmovdqa	.LC26(%rip), %ymm11
	vmovdqa32	.LC27(%rip), %ymm22
	vmovdqa32	.LC28(%rip), %ymm20
	vmovdqa32	.LC29(%rip), %ymm17
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L70:
	vpbroadcastd	%ecx, %ymm0
	vpbroadcastd	%r9d, %ymm21
	vpxor	%xmm15, %xmm15, %xmm15
	vpsravd	%ymm3, %ymm0, %ymm1
	vpandd	%ymm21, %ymm1, %ymm1
	vpcmpeqd	%ymm15, %ymm1, %ymm1
	vpandn	%ymm4, %ymm1, %ymm1
	cmpl	$1, %r8d
	je	.L11
	vpsravd	%ymm5, %ymm0, %ymm19
	vpandd	%ymm21, %ymm19, %ymm19
	vmovdqa32	%ymm19, %ymm13
	vpcmpeqd	%ymm15, %ymm13, %ymm13
	vpandnd	%ymm6, %ymm13, %ymm19
	vpaddd	%ymm19, %ymm1, %ymm1
	cmpl	$2, %r8d
	je	.L11
	vpsravd	%ymm7, %ymm0, %ymm19
	vpandd	%ymm21, %ymm19, %ymm19
	vmovdqa32	%ymm19, %ymm13
	vpcmpeqd	%ymm15, %ymm13, %ymm13
	vpandnd	%ymm8, %ymm13, %ymm19
	vpaddd	%ymm19, %ymm1, %ymm1
	cmpl	$3, %r8d
	je	.L11
	vpsravd	%ymm9, %ymm0, %ymm19
	vpandd	%ymm21, %ymm19, %ymm19
	vmovdqa32	%ymm19, %ymm13
	vpcmpeqd	%ymm15, %ymm13, %ymm13
	vpandnd	%ymm10, %ymm13, %ymm19
	vpaddd	%ymm19, %ymm1, %ymm1
	cmpl	$4, %r8d
	je	.L11
	vpsravd	%ymm11, %ymm0, %ymm19
	vpandd	%ymm21, %ymm19, %ymm19
	vmovdqa32	%ymm19, %ymm13
	vpcmpeqd	%ymm15, %ymm13, %ymm13
	vpandnd	%ymm12, %ymm13, %ymm19
	vpaddd	%ymm19, %ymm1, %ymm1
	cmpl	$5, %r8d
	je	.L11
	vpsravd	%ymm22, %ymm0, %ymm19
	vpandd	%ymm21, %ymm19, %ymm19
	vmovdqa32	%ymm19, %ymm13
	vpcmpeqd	%ymm15, %ymm13, %ymm13
	vpandnd	%ymm14, %ymm13, %ymm19
	vpaddd	%ymm19, %ymm1, %ymm1
	cmpl	$6, %r8d
	je	.L11
	vpsravd	%ymm20, %ymm0, %ymm19
	vpandd	%ymm21, %ymm19, %ymm19
	vmovdqa32	%ymm19, %ymm13
	vpcmpeqd	%ymm15, %ymm13, %ymm13
	vpandnd	%ymm16, %ymm13, %ymm19
	vpaddd	%ymm19, %ymm1, %ymm1
	cmpl	$7, %r8d
	je	.L11
	vpsravd	%ymm17, %ymm0, %ymm0
	vpandd	%ymm21, %ymm0, %ymm0
	vpcmpeqd	%ymm15, %ymm0, %ymm0
	vpandnd	%ymm18, %ymm0, %ymm0
	vpaddd	%ymm0, %ymm1, %ymm1
.L11:
	vmovdqa	%xmm1, %xmm0
	vextracti128	$0x1, %ymm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm1
	vpsrldq	$8, %xmm1, %xmm0
	vpaddd	%xmm0, %xmm1, %xmm0
	vpsrldq	$4, %xmm0, %xmm19
	vpaddd	%xmm19, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	cmpl	%r10d, %edi
	je	.L12
	movl	%r10d, %esi
	movl	%r10d, %edx
.L10:
	movl	%edi, %r14d
	subl	%esi, %r14d
	leal	-1(%r14), %r15d
	cmpl	$2, %r15d
	jbe	.L13
	vpbroadcastd	%edx, %xmm19
	vpbroadcastd	%ecx, %xmm0
	vpaddd	%xmm2, %xmm19, %xmm19
	vpsravd	%xmm19, %xmm0, %xmm0
	vpbroadcastd	%r9d, %xmm19
	vpandd	%xmm19, %xmm0, %xmm0
	vpxord	%xmm19, %xmm19, %xmm19
	vmovdqa32	%xmm19, %xmm15
	vpcmpeqd	%xmm15, %xmm0, %xmm0
	vpandn	(%rsp,%rsi,4), %xmm0, %xmm0
	movl	%r14d, %esi
	andl	$-4, %esi
	vpaddd	%xmm0, %xmm1, %xmm0
	addl	%esi, %edx
	andl	$3, %r14d
	vpsrldq	$8, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	je	.L12
.L13:
	btl	%edx, %ecx
	jnc	.L15
	movslq	%edx, %rsi
	addl	(%rsp,%rsi,4), %eax
.L15:
	leal	1(%rdx), %esi
	cmpl	%esi, %edi
	jle	.L12
	btl	%esi, %ecx
	jnc	.L16
	movslq	%esi, %rsi
	addl	(%rsp,%rsi,4), %eax
.L16:
	addl	$2, %edx
	cmpl	%edx, %edi
	jle	.L12
	btl	%edx, %ecx
	jnc	.L12
	movslq	%edx, %rdx
	addl	(%rsp,%rdx,4), %eax
.L12:
	cmpl	%eax, %r12d
	sete	%al
	incl	%ecx
	movzbl	%al, %eax
	addq	%rax, %r11
	cmpl	%ebx, %ecx
	jge	.L1
.L20:
	cmpl	$6, %r13d
	ja	.L70
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%esi, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.L10
.L9:
	xorl	%r11d, %r11d
	testl	%r12d, %r12d
	sete	%r11b
.L1:
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L71
	vzeroupper
	leaq	-40(%rbp), %rsp
	movq	%r11, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.L26:
	vmovdqa	.LC3(%rip), %ymm1
	jmp	.L4
.L69:
	xorl	%r11d, %r11d
	jmp	.L1
.L22:
	xorl	%r12d, %r12d
	jmp	.L2
.L25:
	vmovdqa	.LC2(%rip), %ymm1
	jmp	.L4
.L23:
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	jmp	.L3
.L27:
	vmovdqa	.LC4(%rip), %ymm1
	jmp	.L4
.L28:
	vmovdqa	.LC5(%rip), %ymm1
	jmp	.L4
.L29:
	vmovdqa	.LC6(%rip), %ymm1
	jmp	.L4
.L30:
	vmovdqa	.LC7(%rip), %ymm1
	jmp	.L4
.L71:
	vzeroupper
	call	__stack_chk_fail@PLT
	.size	bit, .-bit
