.text

#
# extern float  mulsum_2(const float *pf0, const float *pf1, INT64 count)#
#
#	for(INT64 i = 0# i < counut# i++)#
#	{
#       sum += pf0[i] * pf1[i]#
#   }
#   return sum#
#
.globl mulsum2_base
mulsum2_base:	
	xorps	%xmm0,	%xmm0
	mov	%rdx,	%r9
	shr	$0x2,	%r9
	and	$0xFFFFFFFFFFFFFFFC, %r9 # $0x10 bytes alignment
	test	%r9,	%r9
	jz		loop_1_end
loop_1:
	movups	(%rdi), %xmm1
	movups	(%rsi), %xmm2
	mulps	%xmm2,	%xmm1
	addps	%xmm1,	%xmm0
	add	$0x10,	%rdi
	add	$0x10,	%rsi
	dec	%r9
 	je		loop_1_end
	movups	(%rdi), %xmm1
	movups	(%rsi), %xmm2
	mulps	%xmm2,	%xmm1
	addps	%xmm1,	%xmm0
	add	$0x10,	%rdi
	add	$0x10,	%rsi
	dec	%r9
 	je		loop_1_end
	movups	(%rdi), %xmm1
	movups	(%rsi), %xmm2
	mulps	%xmm2,	%xmm1
	addps	%xmm1,	%xmm0
	add	$0x10,	%rdi
	add	$0x10,	%rsi
	dec	%r9
 	je		loop_1_end
	movups	(%rdi), %xmm1
	movups	(%rsi), %xmm2
	mulps	%xmm2,	%xmm1
	addps	%xmm1,	%xmm0
	add	$0x10,	%rdi
	add	$0x10,	%rsi
	dec	%r9
 	je		loop_1_end
loop_1_end:
	haddps	%xmm0,	%xmm0
	haddps	%xmm0,	%xmm0
	retq 
