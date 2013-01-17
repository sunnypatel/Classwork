	.file	"muxs.vhd"
	.section	.rodata
	.type	_UI00000000, @object
	.size	_UI00000000, 9
_UI00000000:
	.byte	109
	.byte	117
	.byte	120
	.byte	115
	.byte	46
	.byte	118
	.byte	104
	.byte	100
	.byte	0
	.type	work__and_3__a__RTISTR, @object
	.size	work__and_3__a__RTISTR, 2
work__and_3__a__RTISTR:
	.byte	97
	.byte	0
.globl work__and_3__a__RTI
	.align 4
	.type	work__and_3__a__RTI, @object
	.size	work__and_3__a__RTI, 16
work__and_3__a__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__and_3__a__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__and_3__b__RTISTR, @object
	.size	work__and_3__b__RTISTR, 2
work__and_3__b__RTISTR:
	.byte	98
	.byte	0
.globl work__and_3__b__RTI
	.align 4
	.type	work__and_3__b__RTI, @object
	.size	work__and_3__b__RTI, 16
work__and_3__b__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__and_3__b__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__and_3__c__RTISTR, @object
	.size	work__and_3__c__RTISTR, 2
work__and_3__c__RTISTR:
	.byte	99
	.byte	0
.globl work__and_3__c__RTI
	.align 4
	.type	work__and_3__c__RTI, @object
	.size	work__and_3__c__RTI, 16
work__and_3__c__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__and_3__c__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__and_3__d__RTISTR, @object
	.size	work__and_3__d__RTISTR, 2
work__and_3__d__RTISTR:
	.byte	100
	.byte	0
.globl work__and_3__d__RTI
	.align 4
	.type	work__and_3__d__RTI, @object
	.size	work__and_3__d__RTI, 16
work__and_3__d__RTI:
	.byte	16
	.byte	1
	.byte	3
	.byte	0
	.long	work__and_3__d__RTISTR
	.long	20
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__and_3__RTISTR, @object
	.size	work__and_3__RTISTR, 6
work__and_3__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	95
	.byte	51
	.byte	0
	.align 4
	.type	work__and_3__RTIARRAY, @object
	.size	work__and_3__RTIARRAY, 20
work__and_3__RTIARRAY:
	.long	work__and_3__a__RTI
	.long	work__and_3__b__RTI
	.long	work__and_3__c__RTI
	.long	work__and_3__d__RTI
	.long	0
.globl work__and_3__RTI
	.align 4
	.type	work__and_3__RTI, @object
	.size	work__and_3__RTI, 28
work__and_3__RTI:
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.long	work__and_3__RTISTR
	.long	0
	.long	work__RTI
	.long	24
	.long	4
	.long	work__and_3__RTIARRAY
	.text
.globl work__and_3__ELAB
	.type	work__and_3__ELAB, @function
work__and_3__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movzbl	ieee__std_logic_1164__ELABORATED, %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L2
	call	ieee__std_logic_1164__ELAB_BODY
.L2:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$work__and_3__a__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	$work__and_3__b__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	$work__and_3__c__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	$0, %eax
	movl	-4(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_signal_init_e8
	movl	-4(%ebp), %eax
	movl	$work__and_3__d__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	leave
	ret
	.size	work__and_3__ELAB, .-work__and_3__ELAB
.globl work__and_3__ARCH__func__INSTSIZE
	.section	.rodata
	.align 4
	.type	work__and_3__ARCH__func__INSTSIZE, @object
	.size	work__and_3__ARCH__func__INSTSIZE, 4
work__and_3__ARCH__func__INSTSIZE:
	.long	28
	.type	work__and_3__ARCH__func__P0__RTISTR, @object
	.size	work__and_3__ARCH__func__P0__RTISTR, 3
work__and_3__ARCH__func__P0__RTISTR:
	.byte	80
	.byte	48
	.byte	0
	.align 4
	.type	work__and_3__ARCH__func__P0__RTIARRAY, @object
	.size	work__and_3__ARCH__func__P0__RTIARRAY, 4
work__and_3__ARCH__func__P0__RTIARRAY:
	.zero	4
.globl work__and_3__ARCH__func__P0__RTI
	.align 4
	.type	work__and_3__ARCH__func__P0__RTI, @object
	.size	work__and_3__ARCH__func__P0__RTI, 28
work__and_3__ARCH__func__P0__RTI:
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.long	work__and_3__ARCH__func__P0__RTISTR
	.long	24
	.long	work__and_3__ARCH__func__RTI
	.long	1
	.long	0
	.long	work__and_3__ARCH__func__P0__RTIARRAY
	.type	work__and_3__ARCH__func__RTISTR, @object
	.size	work__and_3__ARCH__func__RTISTR, 5
work__and_3__ARCH__func__RTISTR:
	.byte	102
	.byte	117
	.byte	110
	.byte	99
	.byte	0
	.align 4
	.type	work__and_3__ARCH__func__RTIARRAY, @object
	.size	work__and_3__ARCH__func__RTIARRAY, 8
work__and_3__ARCH__func__RTIARRAY:
	.long	work__and_3__ARCH__func__P0__RTI
	.long	0
.globl work__and_3__ARCH__func__RTI
	.align 4
	.type	work__and_3__ARCH__func__RTI, @object
	.size	work__and_3__ARCH__func__RTI, 28
work__and_3__ARCH__func__RTI:
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.long	work__and_3__ARCH__func__RTISTR
	.long	0
	.long	work__and_3__RTI
	.long	28
	.long	1
	.long	work__and_3__ARCH__func__RTIARRAY
	.text
	.type	work__and_3__ARCH__func__P0__PROC, @function
work__and_3__ARCH__func__P0__PROC:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$36, %esp
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	addl	$24, %eax
	movl	%eax, -8(%ebp)
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movzbl	(%eax), %ebx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movzbl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movzbl	(%eax), %eax
	movb	%dl, 4(%esp)
	movb	%al, (%esp)
	call	ieee__std_logic_1164__andO1
	movb	%bl, 4(%esp)
	movb	%al, (%esp)
	call	ieee__std_logic_1164__andO1
	movl	%eax, %edx
	movl	-8(%ebp), %eax
	movb	%dl, (%eax)
	movl	-16(%ebp), %eax
	movzbl	46(%eax), %eax
	testb	%al, %al
	je	.L5
	movb	$1, -9(%ebp)
	jmp	.L6
.L5:
	movl	-16(%ebp), %eax
	movzbl	(%eax), %edx
	movl	-8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	setne	%al
	movb	%al, -9(%ebp)
.L6:
	movl	-16(%ebp), %eax
	movl	40(%eax), %eax
	testl	%eax, %eax
	sete	%al
	andb	-9(%ebp), %al
	testb	%al, %al
	je	.L8
	movl	-16(%ebp), %eax
	movl	__ghdl_signal_active_chain, %edx
	movl	%edx, 40(%eax)
	movl	-16(%ebp), %eax
	movl	%eax, __ghdl_signal_active_chain
.L8:
	addl	$36, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	work__and_3__ARCH__func__P0__PROC, .-work__and_3__ARCH__func__P0__PROC
.globl work__and_3__ARCH__func__ELAB
	.type	work__and_3__ARCH__func__ELAB, @function
work__and_3__ARCH__func__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$work__and_3__ARCH__func__RTI, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	work__and_3__ELAB
	movl	-4(%ebp), %eax
	addl	$24, %eax
	movl	$work__and_3__ARCH__func__P0__PROC, %edx
	movl	-4(%ebp), %ecx
	movl	%eax, 12(%esp)
	movl	$work__and_3__ARCH__func__P0__RTI, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	__ghdl_sensitized_process_register
	movl	-4(%ebp), %eax
	leal	24(%eax), %edx
	movl	-4(%ebp), %eax
	movl	20(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_direct_driver
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	__ghdl_process_add_sensitivity
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	__ghdl_process_add_sensitivity
	movl	-4(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	__ghdl_process_add_sensitivity
	leave
	ret
	.size	work__and_3__ARCH__func__ELAB, .-work__and_3__ARCH__func__ELAB
	.section	.rodata
	.type	work__or_3__a__RTISTR, @object
	.size	work__or_3__a__RTISTR, 2
work__or_3__a__RTISTR:
	.byte	97
	.byte	0
.globl work__or_3__a__RTI
	.align 4
	.type	work__or_3__a__RTI, @object
	.size	work__or_3__a__RTI, 16
work__or_3__a__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__or_3__a__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__or_3__b__RTISTR, @object
	.size	work__or_3__b__RTISTR, 2
work__or_3__b__RTISTR:
	.byte	98
	.byte	0
.globl work__or_3__b__RTI
	.align 4
	.type	work__or_3__b__RTI, @object
	.size	work__or_3__b__RTI, 16
work__or_3__b__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__or_3__b__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__or_3__c__RTISTR, @object
	.size	work__or_3__c__RTISTR, 2
work__or_3__c__RTISTR:
	.byte	99
	.byte	0
.globl work__or_3__c__RTI
	.align 4
	.type	work__or_3__c__RTI, @object
	.size	work__or_3__c__RTI, 16
work__or_3__c__RTI:
	.byte	16
	.byte	1
	.byte	3
	.byte	0
	.long	work__or_3__c__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__or_3__RTISTR, @object
	.size	work__or_3__RTISTR, 5
work__or_3__RTISTR:
	.byte	111
	.byte	114
	.byte	95
	.byte	51
	.byte	0
	.align 4
	.type	work__or_3__RTIARRAY, @object
	.size	work__or_3__RTIARRAY, 16
work__or_3__RTIARRAY:
	.long	work__or_3__a__RTI
	.long	work__or_3__b__RTI
	.long	work__or_3__c__RTI
	.long	0
.globl work__or_3__RTI
	.align 4
	.type	work__or_3__RTI, @object
	.size	work__or_3__RTI, 28
work__or_3__RTI:
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.long	work__or_3__RTISTR
	.long	0
	.long	work__RTI
	.long	20
	.long	3
	.long	work__or_3__RTIARRAY
	.text
.globl work__or_3__ELAB
	.type	work__or_3__ELAB, @function
work__or_3__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movzbl	ieee__std_logic_1164__ELABORATED, %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L12
	call	ieee__std_logic_1164__ELAB_BODY
.L12:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$work__or_3__a__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	$work__or_3__b__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	$0, %eax
	movl	-4(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_signal_init_e8
	movl	-4(%ebp), %eax
	movl	$work__or_3__c__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	leave
	ret
	.size	work__or_3__ELAB, .-work__or_3__ELAB
.globl work__or_3__ARCH__func__INSTSIZE
	.section	.rodata
	.align 4
	.type	work__or_3__ARCH__func__INSTSIZE, @object
	.size	work__or_3__ARCH__func__INSTSIZE, 4
work__or_3__ARCH__func__INSTSIZE:
	.long	24
	.type	work__or_3__ARCH__func__P0__RTISTR, @object
	.size	work__or_3__ARCH__func__P0__RTISTR, 3
work__or_3__ARCH__func__P0__RTISTR:
	.byte	80
	.byte	48
	.byte	0
	.align 4
	.type	work__or_3__ARCH__func__P0__RTIARRAY, @object
	.size	work__or_3__ARCH__func__P0__RTIARRAY, 4
work__or_3__ARCH__func__P0__RTIARRAY:
	.zero	4
.globl work__or_3__ARCH__func__P0__RTI
	.align 4
	.type	work__or_3__ARCH__func__P0__RTI, @object
	.size	work__or_3__ARCH__func__P0__RTI, 28
work__or_3__ARCH__func__P0__RTI:
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.long	work__or_3__ARCH__func__P0__RTISTR
	.long	20
	.long	work__or_3__ARCH__func__RTI
	.long	1
	.long	0
	.long	work__or_3__ARCH__func__P0__RTIARRAY
	.type	work__or_3__ARCH__func__RTISTR, @object
	.size	work__or_3__ARCH__func__RTISTR, 5
work__or_3__ARCH__func__RTISTR:
	.byte	102
	.byte	117
	.byte	110
	.byte	99
	.byte	0
	.align 4
	.type	work__or_3__ARCH__func__RTIARRAY, @object
	.size	work__or_3__ARCH__func__RTIARRAY, 8
work__or_3__ARCH__func__RTIARRAY:
	.long	work__or_3__ARCH__func__P0__RTI
	.long	0
.globl work__or_3__ARCH__func__RTI
	.align 4
	.type	work__or_3__ARCH__func__RTI, @object
	.size	work__or_3__ARCH__func__RTI, 28
work__or_3__ARCH__func__RTI:
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.long	work__or_3__ARCH__func__RTISTR
	.long	0
	.long	work__or_3__RTI
	.long	24
	.long	1
	.long	work__or_3__ARCH__func__RTIARRAY
	.text
	.type	work__or_3__ARCH__func__P0__PROC, @function
work__or_3__ARCH__func__P0__PROC:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	addl	$20, %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movzbl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movzbl	(%eax), %eax
	movb	%dl, 4(%esp)
	movb	%al, (%esp)
	call	ieee__std_logic_1164__orO1
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movb	%dl, (%eax)
	movl	-12(%ebp), %eax
	movzbl	46(%eax), %eax
	testb	%al, %al
	je	.L15
	movb	$1, -5(%ebp)
	jmp	.L16
.L15:
	movl	-12(%ebp), %eax
	movzbl	(%eax), %edx
	movl	-4(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	setne	%al
	movb	%al, -5(%ebp)
.L16:
	movl	-12(%ebp), %eax
	movl	40(%eax), %eax
	testl	%eax, %eax
	sete	%al
	andb	-5(%ebp), %al
	testb	%al, %al
	je	.L18
	movl	-12(%ebp), %eax
	movl	__ghdl_signal_active_chain, %edx
	movl	%edx, 40(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, __ghdl_signal_active_chain
.L18:
	leave
	ret
	.size	work__or_3__ARCH__func__P0__PROC, .-work__or_3__ARCH__func__P0__PROC
.globl work__or_3__ARCH__func__ELAB
	.type	work__or_3__ARCH__func__ELAB, @function
work__or_3__ARCH__func__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$work__or_3__ARCH__func__RTI, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	work__or_3__ELAB
	movl	-4(%ebp), %eax
	addl	$20, %eax
	movl	$work__or_3__ARCH__func__P0__PROC, %edx
	movl	-4(%ebp), %ecx
	movl	%eax, 12(%esp)
	movl	$work__or_3__ARCH__func__P0__RTI, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	__ghdl_sensitized_process_register
	movl	-4(%ebp), %eax
	leal	20(%eax), %edx
	movl	-4(%ebp), %eax
	movl	16(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_direct_driver
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	__ghdl_process_add_sensitivity
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	__ghdl_process_add_sensitivity
	leave
	ret
	.size	work__or_3__ARCH__func__ELAB, .-work__or_3__ARCH__func__ELAB
	.section	.rodata
	.type	work__not_3__i__RTISTR, @object
	.size	work__not_3__i__RTISTR, 2
work__not_3__i__RTISTR:
	.byte	105
	.byte	0
.globl work__not_3__i__RTI
	.align 4
	.type	work__not_3__i__RTI, @object
	.size	work__not_3__i__RTI, 16
work__not_3__i__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__not_3__i__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__not_3__o__RTISTR, @object
	.size	work__not_3__o__RTISTR, 2
work__not_3__o__RTISTR:
	.byte	111
	.byte	0
.globl work__not_3__o__RTI
	.align 4
	.type	work__not_3__o__RTI, @object
	.size	work__not_3__o__RTI, 16
work__not_3__o__RTI:
	.byte	16
	.byte	1
	.byte	3
	.byte	0
	.long	work__not_3__o__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__not_3__RTISTR, @object
	.size	work__not_3__RTISTR, 6
work__not_3__RTISTR:
	.byte	110
	.byte	111
	.byte	116
	.byte	95
	.byte	51
	.byte	0
	.align 4
	.type	work__not_3__RTIARRAY, @object
	.size	work__not_3__RTIARRAY, 12
work__not_3__RTIARRAY:
	.long	work__not_3__i__RTI
	.long	work__not_3__o__RTI
	.long	0
.globl work__not_3__RTI
	.align 4
	.type	work__not_3__RTI, @object
	.size	work__not_3__RTI, 28
work__not_3__RTI:
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.long	work__not_3__RTISTR
	.long	0
	.long	work__RTI
	.long	16
	.long	2
	.long	work__not_3__RTIARRAY
	.text
.globl work__not_3__ELAB
	.type	work__not_3__ELAB, @function
work__not_3__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movzbl	ieee__std_logic_1164__ELABORATED, %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L22
	call	ieee__std_logic_1164__ELAB_BODY
.L22:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$work__not_3__i__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	$0, %eax
	movl	-4(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_signal_init_e8
	movl	-4(%ebp), %eax
	movl	$work__not_3__o__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	leave
	ret
	.size	work__not_3__ELAB, .-work__not_3__ELAB
.globl work__not_3__ARCH__func__INSTSIZE
	.section	.rodata
	.align 4
	.type	work__not_3__ARCH__func__INSTSIZE, @object
	.size	work__not_3__ARCH__func__INSTSIZE, 4
work__not_3__ARCH__func__INSTSIZE:
	.long	20
	.type	work__not_3__ARCH__func__P0__RTISTR, @object
	.size	work__not_3__ARCH__func__P0__RTISTR, 3
work__not_3__ARCH__func__P0__RTISTR:
	.byte	80
	.byte	48
	.byte	0
	.align 4
	.type	work__not_3__ARCH__func__P0__RTIARRAY, @object
	.size	work__not_3__ARCH__func__P0__RTIARRAY, 4
work__not_3__ARCH__func__P0__RTIARRAY:
	.zero	4
.globl work__not_3__ARCH__func__P0__RTI
	.align 4
	.type	work__not_3__ARCH__func__P0__RTI, @object
	.size	work__not_3__ARCH__func__P0__RTI, 28
work__not_3__ARCH__func__P0__RTI:
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.long	work__not_3__ARCH__func__P0__RTISTR
	.long	16
	.long	work__not_3__ARCH__func__RTI
	.long	1
	.long	0
	.long	work__not_3__ARCH__func__P0__RTIARRAY
	.type	work__not_3__ARCH__func__RTISTR, @object
	.size	work__not_3__ARCH__func__RTISTR, 5
work__not_3__ARCH__func__RTISTR:
	.byte	102
	.byte	117
	.byte	110
	.byte	99
	.byte	0
	.align 4
	.type	work__not_3__ARCH__func__RTIARRAY, @object
	.size	work__not_3__ARCH__func__RTIARRAY, 8
work__not_3__ARCH__func__RTIARRAY:
	.long	work__not_3__ARCH__func__P0__RTI
	.long	0
.globl work__not_3__ARCH__func__RTI
	.align 4
	.type	work__not_3__ARCH__func__RTI, @object
	.size	work__not_3__ARCH__func__RTI, 28
work__not_3__ARCH__func__RTI:
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.long	work__not_3__ARCH__func__RTISTR
	.long	0
	.long	work__not_3__RTI
	.long	20
	.long	1
	.long	work__not_3__ARCH__func__RTIARRAY
	.text
	.type	work__not_3__ARCH__func__P0__PROC, @function
work__not_3__ARCH__func__P0__PROC:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	addl	$16, %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movzbl	(%eax), %eax
	movb	%al, (%esp)
	call	ieee__std_logic_1164__notO1
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movb	%dl, (%eax)
	movl	-12(%ebp), %eax
	movzbl	46(%eax), %eax
	testb	%al, %al
	je	.L25
	movb	$1, -5(%ebp)
	jmp	.L26
.L25:
	movl	-12(%ebp), %eax
	movzbl	(%eax), %edx
	movl	-4(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	setne	%al
	movb	%al, -5(%ebp)
.L26:
	movl	-12(%ebp), %eax
	movl	40(%eax), %eax
	testl	%eax, %eax
	sete	%al
	andb	-5(%ebp), %al
	testb	%al, %al
	je	.L28
	movl	-12(%ebp), %eax
	movl	__ghdl_signal_active_chain, %edx
	movl	%edx, 40(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, __ghdl_signal_active_chain
.L28:
	leave
	ret
	.size	work__not_3__ARCH__func__P0__PROC, .-work__not_3__ARCH__func__P0__PROC
.globl work__not_3__ARCH__func__ELAB
	.type	work__not_3__ARCH__func__ELAB, @function
work__not_3__ARCH__func__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$work__not_3__ARCH__func__RTI, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	work__not_3__ELAB
	movl	-4(%ebp), %eax
	addl	$16, %eax
	movl	$work__not_3__ARCH__func__P0__PROC, %edx
	movl	-4(%ebp), %ecx
	movl	%eax, 12(%esp)
	movl	$work__not_3__ARCH__func__P0__RTI, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	__ghdl_sensitized_process_register
	movl	-4(%ebp), %eax
	leal	16(%eax), %edx
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_direct_driver
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	__ghdl_process_add_sensitivity
	leave
	ret
	.size	work__not_3__ARCH__func__ELAB, .-work__not_3__ARCH__func__ELAB
	.section	.rodata
	.type	work__mux4__i0__RTISTR, @object
	.size	work__mux4__i0__RTISTR, 3
work__mux4__i0__RTISTR:
	.byte	105
	.byte	48
	.byte	0
.globl work__mux4__i0__RTI
	.align 4
	.type	work__mux4__i0__RTI, @object
	.size	work__mux4__i0__RTI, 16
work__mux4__i0__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux4__i0__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__i1__RTISTR, @object
	.size	work__mux4__i1__RTISTR, 3
work__mux4__i1__RTISTR:
	.byte	105
	.byte	49
	.byte	0
.globl work__mux4__i1__RTI
	.align 4
	.type	work__mux4__i1__RTI, @object
	.size	work__mux4__i1__RTI, 16
work__mux4__i1__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux4__i1__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__i2__RTISTR, @object
	.size	work__mux4__i2__RTISTR, 3
work__mux4__i2__RTISTR:
	.byte	105
	.byte	50
	.byte	0
.globl work__mux4__i2__RTI
	.align 4
	.type	work__mux4__i2__RTI, @object
	.size	work__mux4__i2__RTI, 16
work__mux4__i2__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux4__i2__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__i3__RTISTR, @object
	.size	work__mux4__i3__RTISTR, 3
work__mux4__i3__RTISTR:
	.byte	105
	.byte	51
	.byte	0
.globl work__mux4__i3__RTI
	.align 4
	.type	work__mux4__i3__RTI, @object
	.size	work__mux4__i3__RTI, 16
work__mux4__i3__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux4__i3__RTISTR
	.long	20
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__s0__RTISTR, @object
	.size	work__mux4__s0__RTISTR, 3
work__mux4__s0__RTISTR:
	.byte	115
	.byte	48
	.byte	0
.globl work__mux4__s0__RTI
	.align 4
	.type	work__mux4__s0__RTI, @object
	.size	work__mux4__s0__RTI, 16
work__mux4__s0__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux4__s0__RTISTR
	.long	24
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__s1__RTISTR, @object
	.size	work__mux4__s1__RTISTR, 3
work__mux4__s1__RTISTR:
	.byte	115
	.byte	49
	.byte	0
.globl work__mux4__s1__RTI
	.align 4
	.type	work__mux4__s1__RTI, @object
	.size	work__mux4__s1__RTI, 16
work__mux4__s1__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux4__s1__RTISTR
	.long	28
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__f__RTISTR, @object
	.size	work__mux4__f__RTISTR, 2
work__mux4__f__RTISTR:
	.byte	102
	.byte	0
.globl work__mux4__f__RTI
	.align 4
	.type	work__mux4__f__RTI, @object
	.size	work__mux4__f__RTI, 16
work__mux4__f__RTI:
	.byte	16
	.byte	1
	.byte	3
	.byte	0
	.long	work__mux4__f__RTISTR
	.long	32
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__RTISTR, @object
	.size	work__mux4__RTISTR, 5
work__mux4__RTISTR:
	.byte	109
	.byte	117
	.byte	120
	.byte	52
	.byte	0
	.align 32
	.type	work__mux4__RTIARRAY, @object
	.size	work__mux4__RTIARRAY, 32
work__mux4__RTIARRAY:
	.long	work__mux4__i0__RTI
	.long	work__mux4__i1__RTI
	.long	work__mux4__i2__RTI
	.long	work__mux4__i3__RTI
	.long	work__mux4__s0__RTI
	.long	work__mux4__s1__RTI
	.long	work__mux4__f__RTI
	.long	0
.globl work__mux4__RTI
	.align 4
	.type	work__mux4__RTI, @object
	.size	work__mux4__RTI, 28
work__mux4__RTI:
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__RTISTR
	.long	0
	.long	work__RTI
	.long	36
	.long	7
	.long	work__mux4__RTIARRAY
	.text
.globl work__mux4__ELAB
	.type	work__mux4__ELAB, @function
work__mux4__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movzbl	ieee__std_logic_1164__ELABORATED, %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L32
	call	ieee__std_logic_1164__ELAB_BODY
.L32:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$work__mux4__i0__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	$work__mux4__i1__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	$work__mux4__i2__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	$work__mux4__i3__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	$work__mux4__s0__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	$work__mux4__s1__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	$0, %eax
	movl	-4(%ebp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_signal_init_e8
	movl	-4(%ebp), %eax
	movl	$work__mux4__f__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	leave
	ret
	.size	work__mux4__ELAB, .-work__mux4__ELAB
.globl work__mux4__ARCH__structural__INSTSIZE
	.section	.rodata
	.align 4
	.type	work__mux4__ARCH__structural__INSTSIZE, @object
	.size	work__mux4__ARCH__structural__INSTSIZE, 4
work__mux4__ARCH__structural__INSTSIZE:
	.long	260
	.type	work__mux4__ARCH__structural__and_3__a__RTISTR, @object
	.size	work__mux4__ARCH__structural__and_3__a__RTISTR, 2
work__mux4__ARCH__structural__and_3__a__RTISTR:
	.byte	97
	.byte	0
.globl work__mux4__ARCH__structural__and_3__a__RTI
	.align 4
	.type	work__mux4__ARCH__structural__and_3__a__RTI, @object
	.size	work__mux4__ARCH__structural__and_3__a__RTI, 16
work__mux4__ARCH__structural__and_3__a__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux4__ARCH__structural__and_3__a__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__and_3__b__RTISTR, @object
	.size	work__mux4__ARCH__structural__and_3__b__RTISTR, 2
work__mux4__ARCH__structural__and_3__b__RTISTR:
	.byte	98
	.byte	0
.globl work__mux4__ARCH__structural__and_3__b__RTI
	.align 4
	.type	work__mux4__ARCH__structural__and_3__b__RTI, @object
	.size	work__mux4__ARCH__structural__and_3__b__RTI, 16
work__mux4__ARCH__structural__and_3__b__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux4__ARCH__structural__and_3__b__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__and_3__c__RTISTR, @object
	.size	work__mux4__ARCH__structural__and_3__c__RTISTR, 2
work__mux4__ARCH__structural__and_3__c__RTISTR:
	.byte	99
	.byte	0
.globl work__mux4__ARCH__structural__and_3__c__RTI
	.align 4
	.type	work__mux4__ARCH__structural__and_3__c__RTI, @object
	.size	work__mux4__ARCH__structural__and_3__c__RTI, 16
work__mux4__ARCH__structural__and_3__c__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux4__ARCH__structural__and_3__c__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__and_3__f__RTISTR, @object
	.size	work__mux4__ARCH__structural__and_3__f__RTISTR, 2
work__mux4__ARCH__structural__and_3__f__RTISTR:
	.byte	102
	.byte	0
.globl work__mux4__ARCH__structural__and_3__f__RTI
	.align 4
	.type	work__mux4__ARCH__structural__and_3__f__RTI, @object
	.size	work__mux4__ARCH__structural__and_3__f__RTI, 16
work__mux4__ARCH__structural__and_3__f__RTI:
	.byte	16
	.byte	2
	.byte	3
	.byte	0
	.long	work__mux4__ARCH__structural__and_3__f__RTISTR
	.long	20
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__and_3__RTISTR, @object
	.size	work__mux4__ARCH__structural__and_3__RTISTR, 6
work__mux4__ARCH__structural__and_3__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	95
	.byte	51
	.byte	0
	.align 4
	.type	work__mux4__ARCH__structural__and_3__RTIARRAY, @object
	.size	work__mux4__ARCH__structural__and_3__RTIARRAY, 20
work__mux4__ARCH__structural__and_3__RTIARRAY:
	.long	work__mux4__ARCH__structural__and_3__a__RTI
	.long	work__mux4__ARCH__structural__and_3__b__RTI
	.long	work__mux4__ARCH__structural__and_3__c__RTI
	.long	work__mux4__ARCH__structural__and_3__f__RTI
	.long	0
.globl work__mux4__ARCH__structural__and_3__RTI
	.align 4
	.type	work__mux4__ARCH__structural__and_3__RTI, @object
	.size	work__mux4__ARCH__structural__and_3__RTI, 16
work__mux4__ARCH__structural__and_3__RTI:
	.byte	20
	.byte	2
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__and_3__RTISTR
	.long	4
	.long	work__mux4__ARCH__structural__and_3__RTIARRAY
	.type	work__mux4__ARCH__structural__or_3__a__RTISTR, @object
	.size	work__mux4__ARCH__structural__or_3__a__RTISTR, 2
work__mux4__ARCH__structural__or_3__a__RTISTR:
	.byte	97
	.byte	0
.globl work__mux4__ARCH__structural__or_3__a__RTI
	.align 4
	.type	work__mux4__ARCH__structural__or_3__a__RTI, @object
	.size	work__mux4__ARCH__structural__or_3__a__RTI, 16
work__mux4__ARCH__structural__or_3__a__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux4__ARCH__structural__or_3__a__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__or_3__b__RTISTR, @object
	.size	work__mux4__ARCH__structural__or_3__b__RTISTR, 2
work__mux4__ARCH__structural__or_3__b__RTISTR:
	.byte	98
	.byte	0
.globl work__mux4__ARCH__structural__or_3__b__RTI
	.align 4
	.type	work__mux4__ARCH__structural__or_3__b__RTI, @object
	.size	work__mux4__ARCH__structural__or_3__b__RTI, 16
work__mux4__ARCH__structural__or_3__b__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux4__ARCH__structural__or_3__b__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__or_3__f__RTISTR, @object
	.size	work__mux4__ARCH__structural__or_3__f__RTISTR, 2
work__mux4__ARCH__structural__or_3__f__RTISTR:
	.byte	102
	.byte	0
.globl work__mux4__ARCH__structural__or_3__f__RTI
	.align 4
	.type	work__mux4__ARCH__structural__or_3__f__RTI, @object
	.size	work__mux4__ARCH__structural__or_3__f__RTI, 16
work__mux4__ARCH__structural__or_3__f__RTI:
	.byte	16
	.byte	2
	.byte	3
	.byte	0
	.long	work__mux4__ARCH__structural__or_3__f__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__or_3__RTISTR, @object
	.size	work__mux4__ARCH__structural__or_3__RTISTR, 5
work__mux4__ARCH__structural__or_3__RTISTR:
	.byte	111
	.byte	114
	.byte	95
	.byte	51
	.byte	0
	.align 4
	.type	work__mux4__ARCH__structural__or_3__RTIARRAY, @object
	.size	work__mux4__ARCH__structural__or_3__RTIARRAY, 16
work__mux4__ARCH__structural__or_3__RTIARRAY:
	.long	work__mux4__ARCH__structural__or_3__a__RTI
	.long	work__mux4__ARCH__structural__or_3__b__RTI
	.long	work__mux4__ARCH__structural__or_3__f__RTI
	.long	0
.globl work__mux4__ARCH__structural__or_3__RTI
	.align 4
	.type	work__mux4__ARCH__structural__or_3__RTI, @object
	.size	work__mux4__ARCH__structural__or_3__RTI, 16
work__mux4__ARCH__structural__or_3__RTI:
	.byte	20
	.byte	2
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__or_3__RTISTR
	.long	3
	.long	work__mux4__ARCH__structural__or_3__RTIARRAY
	.type	work__mux4__ARCH__structural__not_3__inbit__RTISTR, @object
	.size	work__mux4__ARCH__structural__not_3__inbit__RTISTR, 6
work__mux4__ARCH__structural__not_3__inbit__RTISTR:
	.byte	105
	.byte	110
	.byte	98
	.byte	105
	.byte	116
	.byte	0
.globl work__mux4__ARCH__structural__not_3__inbit__RTI
	.align 4
	.type	work__mux4__ARCH__structural__not_3__inbit__RTI, @object
	.size	work__mux4__ARCH__structural__not_3__inbit__RTI, 16
work__mux4__ARCH__structural__not_3__inbit__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux4__ARCH__structural__not_3__inbit__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__not_3__outbit__RTISTR, @object
	.size	work__mux4__ARCH__structural__not_3__outbit__RTISTR, 7
work__mux4__ARCH__structural__not_3__outbit__RTISTR:
	.byte	111
	.byte	117
	.byte	116
	.byte	98
	.byte	105
	.byte	116
	.byte	0
.globl work__mux4__ARCH__structural__not_3__outbit__RTI
	.align 4
	.type	work__mux4__ARCH__structural__not_3__outbit__RTI, @object
	.size	work__mux4__ARCH__structural__not_3__outbit__RTI, 16
work__mux4__ARCH__structural__not_3__outbit__RTI:
	.byte	16
	.byte	2
	.byte	3
	.byte	0
	.long	work__mux4__ARCH__structural__not_3__outbit__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__not_3__RTISTR, @object
	.size	work__mux4__ARCH__structural__not_3__RTISTR, 6
work__mux4__ARCH__structural__not_3__RTISTR:
	.byte	110
	.byte	111
	.byte	116
	.byte	95
	.byte	51
	.byte	0
	.align 4
	.type	work__mux4__ARCH__structural__not_3__RTIARRAY, @object
	.size	work__mux4__ARCH__structural__not_3__RTIARRAY, 12
work__mux4__ARCH__structural__not_3__RTIARRAY:
	.long	work__mux4__ARCH__structural__not_3__inbit__RTI
	.long	work__mux4__ARCH__structural__not_3__outbit__RTI
	.long	0
.globl work__mux4__ARCH__structural__not_3__RTI
	.align 4
	.type	work__mux4__ARCH__structural__not_3__RTI, @object
	.size	work__mux4__ARCH__structural__not_3__RTI, 16
work__mux4__ARCH__structural__not_3__RTI:
	.byte	20
	.byte	2
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__not_3__RTISTR
	.long	2
	.long	work__mux4__ARCH__structural__not_3__RTIARRAY
	.type	work__mux4__ARCH__structural__notout0__RTISTR, @object
	.size	work__mux4__ARCH__structural__notout0__RTISTR, 8
work__mux4__ARCH__structural__notout0__RTISTR:
	.byte	110
	.byte	111
	.byte	116
	.byte	111
	.byte	117
	.byte	116
	.byte	48
	.byte	0
.globl work__mux4__ARCH__structural__notout0__RTI
	.align 4
	.type	work__mux4__ARCH__structural__notout0__RTI, @object
	.size	work__mux4__ARCH__structural__notout0__RTI, 16
work__mux4__ARCH__structural__notout0__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__notout0__RTISTR
	.long	36
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__notout1__RTISTR, @object
	.size	work__mux4__ARCH__structural__notout1__RTISTR, 8
work__mux4__ARCH__structural__notout1__RTISTR:
	.byte	110
	.byte	111
	.byte	116
	.byte	111
	.byte	117
	.byte	116
	.byte	49
	.byte	0
.globl work__mux4__ARCH__structural__notout1__RTI
	.align 4
	.type	work__mux4__ARCH__structural__notout1__RTI, @object
	.size	work__mux4__ARCH__structural__notout1__RTI, 16
work__mux4__ARCH__structural__notout1__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__notout1__RTISTR
	.long	40
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__andout1__RTISTR, @object
	.size	work__mux4__ARCH__structural__andout1__RTISTR, 8
work__mux4__ARCH__structural__andout1__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	111
	.byte	117
	.byte	116
	.byte	49
	.byte	0
.globl work__mux4__ARCH__structural__andout1__RTI
	.align 4
	.type	work__mux4__ARCH__structural__andout1__RTI, @object
	.size	work__mux4__ARCH__structural__andout1__RTI, 16
work__mux4__ARCH__structural__andout1__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__andout1__RTISTR
	.long	44
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__andout2__RTISTR, @object
	.size	work__mux4__ARCH__structural__andout2__RTISTR, 8
work__mux4__ARCH__structural__andout2__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	111
	.byte	117
	.byte	116
	.byte	50
	.byte	0
.globl work__mux4__ARCH__structural__andout2__RTI
	.align 4
	.type	work__mux4__ARCH__structural__andout2__RTI, @object
	.size	work__mux4__ARCH__structural__andout2__RTI, 16
work__mux4__ARCH__structural__andout2__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__andout2__RTISTR
	.long	48
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__andout3__RTISTR, @object
	.size	work__mux4__ARCH__structural__andout3__RTISTR, 8
work__mux4__ARCH__structural__andout3__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	111
	.byte	117
	.byte	116
	.byte	51
	.byte	0
.globl work__mux4__ARCH__structural__andout3__RTI
	.align 4
	.type	work__mux4__ARCH__structural__andout3__RTI, @object
	.size	work__mux4__ARCH__structural__andout3__RTI, 16
work__mux4__ARCH__structural__andout3__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__andout3__RTISTR
	.long	52
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__andout4__RTISTR, @object
	.size	work__mux4__ARCH__structural__andout4__RTISTR, 8
work__mux4__ARCH__structural__andout4__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	111
	.byte	117
	.byte	116
	.byte	52
	.byte	0
.globl work__mux4__ARCH__structural__andout4__RTI
	.align 4
	.type	work__mux4__ARCH__structural__andout4__RTI, @object
	.size	work__mux4__ARCH__structural__andout4__RTI, 16
work__mux4__ARCH__structural__andout4__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__andout4__RTISTR
	.long	56
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__or1__RTISTR, @object
	.size	work__mux4__ARCH__structural__or1__RTISTR, 4
work__mux4__ARCH__structural__or1__RTISTR:
	.byte	111
	.byte	114
	.byte	49
	.byte	0
.globl work__mux4__ARCH__structural__or1__RTI
	.align 4
	.type	work__mux4__ARCH__structural__or1__RTI, @object
	.size	work__mux4__ARCH__structural__or1__RTI, 16
work__mux4__ARCH__structural__or1__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__or1__RTISTR
	.long	60
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__or2__RTISTR, @object
	.size	work__mux4__ARCH__structural__or2__RTISTR, 4
work__mux4__ARCH__structural__or2__RTISTR:
	.byte	111
	.byte	114
	.byte	50
	.byte	0
.globl work__mux4__ARCH__structural__or2__RTI
	.align 4
	.type	work__mux4__ARCH__structural__or2__RTI, @object
	.size	work__mux4__ARCH__structural__or2__RTI, 16
work__mux4__ARCH__structural__or2__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__or2__RTISTR
	.long	64
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__or3__RTISTR, @object
	.size	work__mux4__ARCH__structural__or3__RTISTR, 4
work__mux4__ARCH__structural__or3__RTISTR:
	.byte	111
	.byte	114
	.byte	51
	.byte	0
.globl work__mux4__ARCH__structural__or3__RTI
	.align 4
	.type	work__mux4__ARCH__structural__or3__RTI, @object
	.size	work__mux4__ARCH__structural__or3__RTI, 16
work__mux4__ARCH__structural__or3__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__or3__RTISTR
	.long	68
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux4__ARCH__structural__f1__RTISTR, @object
	.size	work__mux4__ARCH__structural__f1__RTISTR, 3
work__mux4__ARCH__structural__f1__RTISTR:
	.byte	102
	.byte	49
	.byte	0
.globl work__mux4__ARCH__structural__f1__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f1__RTI, @object
	.size	work__mux4__ARCH__structural__f1__RTI, 20
work__mux4__ARCH__structural__f1__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f1__RTISTR
	.long	72
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__not_3__RTI
	.type	work__mux4__ARCH__structural__f2__RTISTR, @object
	.size	work__mux4__ARCH__structural__f2__RTISTR, 3
work__mux4__ARCH__structural__f2__RTISTR:
	.byte	102
	.byte	50
	.byte	0
.globl work__mux4__ARCH__structural__f2__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f2__RTI, @object
	.size	work__mux4__ARCH__structural__f2__RTI, 20
work__mux4__ARCH__structural__f2__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f2__RTISTR
	.long	88
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__not_3__RTI
	.type	work__mux4__ARCH__structural__f3__RTISTR, @object
	.size	work__mux4__ARCH__structural__f3__RTISTR, 3
work__mux4__ARCH__structural__f3__RTISTR:
	.byte	102
	.byte	51
	.byte	0
.globl work__mux4__ARCH__structural__f3__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f3__RTI, @object
	.size	work__mux4__ARCH__structural__f3__RTI, 20
work__mux4__ARCH__structural__f3__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f3__RTISTR
	.long	104
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__and_3__RTI
	.type	work__mux4__ARCH__structural__f4__RTISTR, @object
	.size	work__mux4__ARCH__structural__f4__RTISTR, 3
work__mux4__ARCH__structural__f4__RTISTR:
	.byte	102
	.byte	52
	.byte	0
.globl work__mux4__ARCH__structural__f4__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f4__RTI, @object
	.size	work__mux4__ARCH__structural__f4__RTI, 20
work__mux4__ARCH__structural__f4__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f4__RTISTR
	.long	128
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__and_3__RTI
	.type	work__mux4__ARCH__structural__f5__RTISTR, @object
	.size	work__mux4__ARCH__structural__f5__RTISTR, 3
work__mux4__ARCH__structural__f5__RTISTR:
	.byte	102
	.byte	53
	.byte	0
.globl work__mux4__ARCH__structural__f5__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f5__RTI, @object
	.size	work__mux4__ARCH__structural__f5__RTI, 20
work__mux4__ARCH__structural__f5__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f5__RTISTR
	.long	152
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__and_3__RTI
	.type	work__mux4__ARCH__structural__f6__RTISTR, @object
	.size	work__mux4__ARCH__structural__f6__RTISTR, 3
work__mux4__ARCH__structural__f6__RTISTR:
	.byte	102
	.byte	54
	.byte	0
.globl work__mux4__ARCH__structural__f6__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f6__RTI, @object
	.size	work__mux4__ARCH__structural__f6__RTI, 20
work__mux4__ARCH__structural__f6__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f6__RTISTR
	.long	176
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__and_3__RTI
	.type	work__mux4__ARCH__structural__f7__RTISTR, @object
	.size	work__mux4__ARCH__structural__f7__RTISTR, 3
work__mux4__ARCH__structural__f7__RTISTR:
	.byte	102
	.byte	55
	.byte	0
.globl work__mux4__ARCH__structural__f7__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f7__RTI, @object
	.size	work__mux4__ARCH__structural__f7__RTI, 20
work__mux4__ARCH__structural__f7__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f7__RTISTR
	.long	200
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__or_3__RTI
	.type	work__mux4__ARCH__structural__f8__RTISTR, @object
	.size	work__mux4__ARCH__structural__f8__RTISTR, 3
work__mux4__ARCH__structural__f8__RTISTR:
	.byte	102
	.byte	56
	.byte	0
.globl work__mux4__ARCH__structural__f8__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f8__RTI, @object
	.size	work__mux4__ARCH__structural__f8__RTI, 20
work__mux4__ARCH__structural__f8__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f8__RTISTR
	.long	220
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__or_3__RTI
	.type	work__mux4__ARCH__structural__f9__RTISTR, @object
	.size	work__mux4__ARCH__structural__f9__RTISTR, 3
work__mux4__ARCH__structural__f9__RTISTR:
	.byte	102
	.byte	57
	.byte	0
.globl work__mux4__ARCH__structural__f9__RTI
	.align 4
	.type	work__mux4__ARCH__structural__f9__RTI, @object
	.size	work__mux4__ARCH__structural__f9__RTI, 20
work__mux4__ARCH__structural__f9__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__f9__RTISTR
	.long	240
	.long	work__mux4__ARCH__structural__RTI
	.long	work__mux4__ARCH__structural__or_3__RTI
	.type	work__mux4__ARCH__structural__RTISTR, @object
	.size	work__mux4__ARCH__structural__RTISTR, 11
work__mux4__ARCH__structural__RTISTR:
	.byte	115
	.byte	116
	.byte	114
	.byte	117
	.byte	99
	.byte	116
	.byte	117
	.byte	114
	.byte	97
	.byte	108
	.byte	0
	.align 32
	.type	work__mux4__ARCH__structural__RTIARRAY, @object
	.size	work__mux4__ARCH__structural__RTIARRAY, 88
work__mux4__ARCH__structural__RTIARRAY:
	.long	work__mux4__ARCH__structural__and_3__RTI
	.long	work__mux4__ARCH__structural__or_3__RTI
	.long	work__mux4__ARCH__structural__not_3__RTI
	.long	work__mux4__ARCH__structural__notout0__RTI
	.long	work__mux4__ARCH__structural__notout1__RTI
	.long	work__mux4__ARCH__structural__andout1__RTI
	.long	work__mux4__ARCH__structural__andout2__RTI
	.long	work__mux4__ARCH__structural__andout3__RTI
	.long	work__mux4__ARCH__structural__andout4__RTI
	.long	work__mux4__ARCH__structural__or1__RTI
	.long	work__mux4__ARCH__structural__or2__RTI
	.long	work__mux4__ARCH__structural__or3__RTI
	.long	work__mux4__ARCH__structural__f1__RTI
	.long	work__mux4__ARCH__structural__f2__RTI
	.long	work__mux4__ARCH__structural__f3__RTI
	.long	work__mux4__ARCH__structural__f4__RTI
	.long	work__mux4__ARCH__structural__f5__RTI
	.long	work__mux4__ARCH__structural__f6__RTI
	.long	work__mux4__ARCH__structural__f7__RTI
	.long	work__mux4__ARCH__structural__f8__RTI
	.long	work__mux4__ARCH__structural__f9__RTI
	.long	0
.globl work__mux4__ARCH__structural__RTI
	.align 4
	.type	work__mux4__ARCH__structural__RTI, @object
	.size	work__mux4__ARCH__structural__RTI, 28
work__mux4__ARCH__structural__RTI:
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux4__ARCH__structural__RTISTR
	.long	0
	.long	work__mux4__RTI
	.long	260
	.long	21
	.long	work__mux4__ARCH__structural__RTIARRAY
	.text
	.type	work__mux4__ARCH__structural__f1__ELAB, @function
work__mux4__ARCH__structural__f1__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f1__RTI, 76(%eax)
	movl	8(%ebp), %eax
	movl	24(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
	movl	8(%ebp), %eax
	movl	36(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 84(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f1__ELAB, .-work__mux4__ARCH__structural__f1__ELAB
	.type	work__mux4__ARCH__structural__f2__ELAB, @function
work__mux4__ARCH__structural__f2__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f2__RTI, 92(%eax)
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 96(%eax)
	movl	8(%ebp), %eax
	movl	40(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 100(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f2__ELAB, .-work__mux4__ARCH__structural__f2__ELAB
	.type	work__mux4__ARCH__structural__f3__ELAB, @function
work__mux4__ARCH__structural__f3__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f3__RTI, 108(%eax)
	movl	8(%ebp), %eax
	movl	40(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 112(%eax)
	movl	8(%ebp), %eax
	movl	36(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 116(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 120(%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 124(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f3__ELAB, .-work__mux4__ARCH__structural__f3__ELAB
	.type	work__mux4__ARCH__structural__f4__ELAB, @function
work__mux4__ARCH__structural__f4__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f4__RTI, 132(%eax)
	movl	8(%ebp), %eax
	movl	40(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 136(%eax)
	movl	8(%ebp), %eax
	movl	24(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 140(%eax)
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 144(%eax)
	movl	8(%ebp), %eax
	movl	48(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 148(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f4__ELAB, .-work__mux4__ARCH__structural__f4__ELAB
	.type	work__mux4__ARCH__structural__f5__ELAB, @function
work__mux4__ARCH__structural__f5__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f5__RTI, 156(%eax)
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 160(%eax)
	movl	8(%ebp), %eax
	movl	36(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 164(%eax)
	movl	8(%ebp), %eax
	movl	16(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 168(%eax)
	movl	8(%ebp), %eax
	movl	52(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 172(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f5__ELAB, .-work__mux4__ARCH__structural__f5__ELAB
	.type	work__mux4__ARCH__structural__f6__ELAB, @function
work__mux4__ARCH__structural__f6__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f6__RTI, 180(%eax)
	movl	8(%ebp), %eax
	movl	28(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 184(%eax)
	movl	8(%ebp), %eax
	movl	24(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 188(%eax)
	movl	8(%ebp), %eax
	movl	20(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 192(%eax)
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 196(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f6__ELAB, .-work__mux4__ARCH__structural__f6__ELAB
	.type	work__mux4__ARCH__structural__f7__ELAB, @function
work__mux4__ARCH__structural__f7__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f7__RTI, 204(%eax)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 208(%eax)
	movl	8(%ebp), %eax
	movl	48(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 212(%eax)
	movl	8(%ebp), %eax
	movl	60(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 216(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f7__ELAB, .-work__mux4__ARCH__structural__f7__ELAB
	.type	work__mux4__ARCH__structural__f8__ELAB, @function
work__mux4__ARCH__structural__f8__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f8__RTI, 224(%eax)
	movl	8(%ebp), %eax
	movl	52(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 228(%eax)
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 232(%eax)
	movl	8(%ebp), %eax
	movl	64(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 236(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f8__ELAB, .-work__mux4__ARCH__structural__f8__ELAB
	.type	work__mux4__ARCH__structural__f9__ELAB, @function
work__mux4__ARCH__structural__f9__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__f9__RTI, 244(%eax)
	movl	8(%ebp), %eax
	movl	60(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 248(%eax)
	movl	8(%ebp), %eax
	movl	64(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 252(%eax)
	movl	8(%ebp), %eax
	movl	32(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 256(%eax)
	popl	%ebp
	ret
	.size	work__mux4__ARCH__structural__f9__ELAB, .-work__mux4__ARCH__structural__f9__ELAB
.globl work__mux4__ARCH__structural__ELAB
	.type	work__mux4__ARCH__structural__ELAB, @function
work__mux4__ARCH__structural__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$work__mux4__ARCH__structural__RTI, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__notout0__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 36(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__notout1__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 40(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__andout1__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 44(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__andout2__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 48(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__andout3__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 52(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__andout4__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 56(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__or1__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 60(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__or2__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 64(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux4__ARCH__structural__RTI, 4(%esp)
	movl	$work__mux4__ARCH__structural__or3__RTI, (%esp)
	call	__ghdl_signal_name_rti
	movl	$ieee__std_logic_1164__resolved_RESOLV, %eax
	movl	$0, %edx
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ghdl_create_signal_e8
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 68(%eax)
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f1__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f2__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f3__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f4__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f5__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f6__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f7__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f8__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux4__ARCH__structural__f9__ELAB
	leave
	ret
	.size	work__mux4__ARCH__structural__ELAB, .-work__mux4__ARCH__structural__ELAB
	.ident	"GCC: (GNU) 4.3.4"
	.section	.note.GNU-stack,"",@progbits
