	.file	"programa.c"
	.text
	.globl	llamadas
	.bss
	.align 4
	.type	llamadas, @object
	.size	llamadas, 4
llamadas:
	.zero	4
	.text
	.globl	sumar
	.type	sumar, @function
sumar:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	llamadas(%rip), %eax
	addl	$1, %eax
	movl	%eax, llamadas(%rip)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	sumar, .-sumar
	.section	.rodata
.LC1:
	.string	"1.0"
	.align 8
.LC2:
	.string	"=== Laboratorio de Compilacion en C (v%s) ===\n\n"
.LC3:
	.string	"sumar(3, 4)       = %d\n"
.LC4:
	.string	"CUADRADO(%d)      = %d\n"
.LC5:
	.string	"MAX(7, 12)        = %d\n"
.LC6:
	.string	"area_circulo(%.1f) = %.4f\n"
.LC7:
	.string	"Factoriales:"
.LC8:
	.string	"  %d! = %d\n"
.LC9:
	.string	"Llamadas a sumar(): %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	leaq	.LC1(%rip), %rdx
	leaq	.LC2(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$4, %esi
	movl	$3, %edi
	call	sumar
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	leaq	.LC3(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC4(%rip), %rax
	movl	$25, %edx
	movl	$5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rax
	movl	$12, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	imprimir_separador
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	area_circulo@PLT
	movq	%xmm0, %rcx
	movq	-8(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rcx, %xmm1
	movq	%rax, %xmm0
	movq	%rdx, %rdi
	movl	$2, %eax
	call	printf@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -16(%rbp)
	jmp	.L4
.L5:
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	factorial@PLT
	movl	%eax, %edx
	movl	-16(%rbp), %eax
	leaq	.LC8(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -16(%rbp)
.L4:
	cmpl	$5, -16(%rbp)
	jle	.L5
	call	imprimir_separador
	movl	llamadas(%rip), %eax
	leaq	.LC9(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC10:
	.string	"----------------------------------------"
	.text
	.globl	imprimir_separador
	.type	imprimir_separador, @function
imprimir_separador:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	imprimir_separador, .-imprimir_separador
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1075052544
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
