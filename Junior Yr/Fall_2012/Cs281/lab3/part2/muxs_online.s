	.file	"muxs_online.vhd"
	.section	.rodata
	.type	_UI00000000, @object
	.size	_UI00000000, 16
_UI00000000:
	.byte	109
	.byte	117
	.byte	120
	.byte	115
	.byte	95
	.byte	111
	.byte	110
	.byte	108
	.byte	105
	.byte	110
	.byte	101
	.byte	46
	.byte	118
	.byte	104
	.byte	100
	.byte	0
	.type	work__andgate__a__RTISTR, @object
	.size	work__andgate__a__RTISTR, 2
work__andgate__a__RTISTR:
	.byte	97
	.byte	0
.globl work__andgate__a__RTI
	.align 4
	.type	work__andgate__a__RTI, @object
	.size	work__andgate__a__RTI, 16
work__andgate__a__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__andgate__a__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__andgate__b__RTISTR, @object
	.size	work__andgate__b__RTISTR, 2
work__andgate__b__RTISTR:
	.byte	98
	.byte	0
.globl work__andgate__b__RTI
	.align 4
	.type	work__andgate__b__RTI, @object
	.size	work__andgate__b__RTI, 16
work__andgate__b__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__andgate__b__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__andgate__c__RTISTR, @object
	.size	work__andgate__c__RTISTR, 2
work__andgate__c__RTISTR:
	.byte	99
	.byte	0
.globl work__andgate__c__RTI
	.align 4
	.type	work__andgate__c__RTI, @object
	.size	work__andgate__c__RTI, 16
work__andgate__c__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__andgate__c__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__andgate__f__RTISTR, @object
	.size	work__andgate__f__RTISTR, 2
work__andgate__f__RTISTR:
	.byte	102
	.byte	0
.globl work__andgate__f__RTI
	.align 4
	.type	work__andgate__f__RTI, @object
	.size	work__andgate__f__RTI, 16
work__andgate__f__RTI:
	.byte	16
	.byte	1
	.byte	3
	.byte	0
	.long	work__andgate__f__RTISTR
	.long	20
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__andgate__RTISTR, @object
	.size	work__andgate__RTISTR, 8
work__andgate__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	103
	.byte	97
	.byte	116
	.byte	101
	.byte	0
	.align 4
	.type	work__andgate__RTIARRAY, @object
	.size	work__andgate__RTIARRAY, 20
work__andgate__RTIARRAY:
	.long	work__andgate__a__RTI
	.long	work__andgate__b__RTI
	.long	work__andgate__c__RTI
	.long	work__andgate__f__RTI
	.long	0
.globl work__andgate__RTI
	.align 4
	.type	work__andgate__RTI, @object
	.size	work__andgate__RTI, 28
work__andgate__RTI:
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.long	work__andgate__RTISTR
	.long	0
	.long	work__RTI
	.long	24
	.long	4
	.long	work__andgate__RTIARRAY
	.text
.globl work__andgate__ELAB
	.type	work__andgate__ELAB, @function
work__andgate__ELAB:
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
	movl	$work__andgate__a__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	$work__andgate__b__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	$work__andgate__c__RTI, 4(%esp)
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
	movl	$work__andgate__f__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	leave
	ret
	.size	work__andgate__ELAB, .-work__andgate__ELAB
.globl work__andgate__ARCH__func__INSTSIZE
	.section	.rodata
	.align 4
	.type	work__andgate__ARCH__func__INSTSIZE, @object
	.size	work__andgate__ARCH__func__INSTSIZE, 4
work__andgate__ARCH__func__INSTSIZE:
	.long	28
	.type	work__andgate__ARCH__func__P0__RTISTR, @object
	.size	work__andgate__ARCH__func__P0__RTISTR, 3
work__andgate__ARCH__func__P0__RTISTR:
	.byte	80
	.byte	48
	.byte	0
	.align 4
	.type	work__andgate__ARCH__func__P0__RTIARRAY, @object
	.size	work__andgate__ARCH__func__P0__RTIARRAY, 4
work__andgate__ARCH__func__P0__RTIARRAY:
	.zero	4
.globl work__andgate__ARCH__func__P0__RTI
	.align 4
	.type	work__andgate__ARCH__func__P0__RTI, @object
	.size	work__andgate__ARCH__func__P0__RTI, 28
work__andgate__ARCH__func__P0__RTI:
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.long	work__andgate__ARCH__func__P0__RTISTR
	.long	24
	.long	work__andgate__ARCH__func__RTI
	.long	1
	.long	0
	.long	work__andgate__ARCH__func__P0__RTIARRAY
	.type	work__andgate__ARCH__func__RTISTR, @object
	.size	work__andgate__ARCH__func__RTISTR, 5
work__andgate__ARCH__func__RTISTR:
	.byte	102
	.byte	117
	.byte	110
	.byte	99
	.byte	0
	.align 4
	.type	work__andgate__ARCH__func__RTIARRAY, @object
	.size	work__andgate__ARCH__func__RTIARRAY, 8
work__andgate__ARCH__func__RTIARRAY:
	.long	work__andgate__ARCH__func__P0__RTI
	.long	0
.globl work__andgate__ARCH__func__RTI
	.align 4
	.type	work__andgate__ARCH__func__RTI, @object
	.size	work__andgate__ARCH__func__RTI, 28
work__andgate__ARCH__func__RTI:
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.long	work__andgate__ARCH__func__RTISTR
	.long	0
	.long	work__andgate__RTI
	.long	28
	.long	1
	.long	work__andgate__ARCH__func__RTIARRAY
	.text
	.type	work__andgate__ARCH__func__P0__PROC, @function
work__andgate__ARCH__func__P0__PROC:
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
	.size	work__andgate__ARCH__func__P0__PROC, .-work__andgate__ARCH__func__P0__PROC
.globl work__andgate__ARCH__func__ELAB
	.type	work__andgate__ARCH__func__ELAB, @function
work__andgate__ARCH__func__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$work__andgate__ARCH__func__RTI, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	work__andgate__ELAB
	movl	-4(%ebp), %eax
	addl	$24, %eax
	movl	$work__andgate__ARCH__func__P0__PROC, %edx
	movl	-4(%ebp), %ecx
	movl	%eax, 12(%esp)
	movl	$work__andgate__ARCH__func__P0__RTI, 8(%esp)
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
	.size	work__andgate__ARCH__func__ELAB, .-work__andgate__ARCH__func__ELAB
	.section	.rodata
	.type	work__orgate__a__RTISTR, @object
	.size	work__orgate__a__RTISTR, 2
work__orgate__a__RTISTR:
	.byte	97
	.byte	0
.globl work__orgate__a__RTI
	.align 4
	.type	work__orgate__a__RTI, @object
	.size	work__orgate__a__RTI, 16
work__orgate__a__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__orgate__a__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__orgate__b__RTISTR, @object
	.size	work__orgate__b__RTISTR, 2
work__orgate__b__RTISTR:
	.byte	98
	.byte	0
.globl work__orgate__b__RTI
	.align 4
	.type	work__orgate__b__RTI, @object
	.size	work__orgate__b__RTI, 16
work__orgate__b__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__orgate__b__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__orgate__f__RTISTR, @object
	.size	work__orgate__f__RTISTR, 2
work__orgate__f__RTISTR:
	.byte	102
	.byte	0
.globl work__orgate__f__RTI
	.align 4
	.type	work__orgate__f__RTI, @object
	.size	work__orgate__f__RTI, 16
work__orgate__f__RTI:
	.byte	16
	.byte	1
	.byte	3
	.byte	0
	.long	work__orgate__f__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__orgate__RTISTR, @object
	.size	work__orgate__RTISTR, 7
work__orgate__RTISTR:
	.byte	111
	.byte	114
	.byte	103
	.byte	97
	.byte	116
	.byte	101
	.byte	0
	.align 4
	.type	work__orgate__RTIARRAY, @object
	.size	work__orgate__RTIARRAY, 16
work__orgate__RTIARRAY:
	.long	work__orgate__a__RTI
	.long	work__orgate__b__RTI
	.long	work__orgate__f__RTI
	.long	0
.globl work__orgate__RTI
	.align 4
	.type	work__orgate__RTI, @object
	.size	work__orgate__RTI, 28
work__orgate__RTI:
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.long	work__orgate__RTISTR
	.long	0
	.long	work__RTI
	.long	20
	.long	3
	.long	work__orgate__RTIARRAY
	.text
.globl work__orgate__ELAB
	.type	work__orgate__ELAB, @function
work__orgate__ELAB:
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
	movl	$work__orgate__a__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	$work__orgate__b__RTI, 4(%esp)
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
	movl	$work__orgate__f__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	leave
	ret
	.size	work__orgate__ELAB, .-work__orgate__ELAB
.globl work__orgate__ARCH__func__INSTSIZE
	.section	.rodata
	.align 4
	.type	work__orgate__ARCH__func__INSTSIZE, @object
	.size	work__orgate__ARCH__func__INSTSIZE, 4
work__orgate__ARCH__func__INSTSIZE:
	.long	24
	.type	work__orgate__ARCH__func__P0__RTISTR, @object
	.size	work__orgate__ARCH__func__P0__RTISTR, 3
work__orgate__ARCH__func__P0__RTISTR:
	.byte	80
	.byte	48
	.byte	0
	.align 4
	.type	work__orgate__ARCH__func__P0__RTIARRAY, @object
	.size	work__orgate__ARCH__func__P0__RTIARRAY, 4
work__orgate__ARCH__func__P0__RTIARRAY:
	.zero	4
.globl work__orgate__ARCH__func__P0__RTI
	.align 4
	.type	work__orgate__ARCH__func__P0__RTI, @object
	.size	work__orgate__ARCH__func__P0__RTI, 28
work__orgate__ARCH__func__P0__RTI:
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.long	work__orgate__ARCH__func__P0__RTISTR
	.long	20
	.long	work__orgate__ARCH__func__RTI
	.long	1
	.long	0
	.long	work__orgate__ARCH__func__P0__RTIARRAY
	.type	work__orgate__ARCH__func__RTISTR, @object
	.size	work__orgate__ARCH__func__RTISTR, 5
work__orgate__ARCH__func__RTISTR:
	.byte	102
	.byte	117
	.byte	110
	.byte	99
	.byte	0
	.align 4
	.type	work__orgate__ARCH__func__RTIARRAY, @object
	.size	work__orgate__ARCH__func__RTIARRAY, 8
work__orgate__ARCH__func__RTIARRAY:
	.long	work__orgate__ARCH__func__P0__RTI
	.long	0
.globl work__orgate__ARCH__func__RTI
	.align 4
	.type	work__orgate__ARCH__func__RTI, @object
	.size	work__orgate__ARCH__func__RTI, 28
work__orgate__ARCH__func__RTI:
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.long	work__orgate__ARCH__func__RTISTR
	.long	0
	.long	work__orgate__RTI
	.long	24
	.long	1
	.long	work__orgate__ARCH__func__RTIARRAY
	.text
	.type	work__orgate__ARCH__func__P0__PROC, @function
work__orgate__ARCH__func__P0__PROC:
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
	.size	work__orgate__ARCH__func__P0__PROC, .-work__orgate__ARCH__func__P0__PROC
.globl work__orgate__ARCH__func__ELAB
	.type	work__orgate__ARCH__func__ELAB, @function
work__orgate__ARCH__func__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$work__orgate__ARCH__func__RTI, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	work__orgate__ELAB
	movl	-4(%ebp), %eax
	addl	$20, %eax
	movl	$work__orgate__ARCH__func__P0__PROC, %edx
	movl	-4(%ebp), %ecx
	movl	%eax, 12(%esp)
	movl	$work__orgate__ARCH__func__P0__RTI, 8(%esp)
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
	.size	work__orgate__ARCH__func__ELAB, .-work__orgate__ARCH__func__ELAB
	.section	.rodata
	.type	work__notgate__inport__RTISTR, @object
	.size	work__notgate__inport__RTISTR, 7
work__notgate__inport__RTISTR:
	.byte	105
	.byte	110
	.byte	112
	.byte	111
	.byte	114
	.byte	116
	.byte	0
.globl work__notgate__inport__RTI
	.align 4
	.type	work__notgate__inport__RTI, @object
	.size	work__notgate__inport__RTI, 16
work__notgate__inport__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__notgate__inport__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__notgate__outport__RTISTR, @object
	.size	work__notgate__outport__RTISTR, 8
work__notgate__outport__RTISTR:
	.byte	111
	.byte	117
	.byte	116
	.byte	112
	.byte	111
	.byte	114
	.byte	116
	.byte	0
.globl work__notgate__outport__RTI
	.align 4
	.type	work__notgate__outport__RTI, @object
	.size	work__notgate__outport__RTI, 16
work__notgate__outport__RTI:
	.byte	16
	.byte	1
	.byte	3
	.byte	0
	.long	work__notgate__outport__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__notgate__RTISTR, @object
	.size	work__notgate__RTISTR, 8
work__notgate__RTISTR:
	.byte	110
	.byte	111
	.byte	116
	.byte	103
	.byte	97
	.byte	116
	.byte	101
	.byte	0
	.align 4
	.type	work__notgate__RTIARRAY, @object
	.size	work__notgate__RTIARRAY, 12
work__notgate__RTIARRAY:
	.long	work__notgate__inport__RTI
	.long	work__notgate__outport__RTI
	.long	0
.globl work__notgate__RTI
	.align 4
	.type	work__notgate__RTI, @object
	.size	work__notgate__RTI, 28
work__notgate__RTI:
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.long	work__notgate__RTISTR
	.long	0
	.long	work__RTI
	.long	16
	.long	2
	.long	work__notgate__RTIARRAY
	.text
.globl work__notgate__ELAB
	.type	work__notgate__ELAB, @function
work__notgate__ELAB:
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
	movl	$work__notgate__inport__RTI, 4(%esp)
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
	movl	$work__notgate__outport__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	leave
	ret
	.size	work__notgate__ELAB, .-work__notgate__ELAB
.globl work__notgate__ARCH__func__INSTSIZE
	.section	.rodata
	.align 4
	.type	work__notgate__ARCH__func__INSTSIZE, @object
	.size	work__notgate__ARCH__func__INSTSIZE, 4
work__notgate__ARCH__func__INSTSIZE:
	.long	20
	.type	work__notgate__ARCH__func__P0__RTISTR, @object
	.size	work__notgate__ARCH__func__P0__RTISTR, 3
work__notgate__ARCH__func__P0__RTISTR:
	.byte	80
	.byte	48
	.byte	0
	.align 4
	.type	work__notgate__ARCH__func__P0__RTIARRAY, @object
	.size	work__notgate__ARCH__func__P0__RTIARRAY, 4
work__notgate__ARCH__func__P0__RTIARRAY:
	.zero	4
.globl work__notgate__ARCH__func__P0__RTI
	.align 4
	.type	work__notgate__ARCH__func__P0__RTI, @object
	.size	work__notgate__ARCH__func__P0__RTI, 28
work__notgate__ARCH__func__P0__RTI:
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.long	work__notgate__ARCH__func__P0__RTISTR
	.long	16
	.long	work__notgate__ARCH__func__RTI
	.long	1
	.long	0
	.long	work__notgate__ARCH__func__P0__RTIARRAY
	.type	work__notgate__ARCH__func__RTISTR, @object
	.size	work__notgate__ARCH__func__RTISTR, 5
work__notgate__ARCH__func__RTISTR:
	.byte	102
	.byte	117
	.byte	110
	.byte	99
	.byte	0
	.align 4
	.type	work__notgate__ARCH__func__RTIARRAY, @object
	.size	work__notgate__ARCH__func__RTIARRAY, 8
work__notgate__ARCH__func__RTIARRAY:
	.long	work__notgate__ARCH__func__P0__RTI
	.long	0
.globl work__notgate__ARCH__func__RTI
	.align 4
	.type	work__notgate__ARCH__func__RTI, @object
	.size	work__notgate__ARCH__func__RTI, 28
work__notgate__ARCH__func__RTI:
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.long	work__notgate__ARCH__func__RTISTR
	.long	0
	.long	work__notgate__RTI
	.long	20
	.long	1
	.long	work__notgate__ARCH__func__RTIARRAY
	.text
	.type	work__notgate__ARCH__func__P0__PROC, @function
work__notgate__ARCH__func__P0__PROC:
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
	.size	work__notgate__ARCH__func__P0__PROC, .-work__notgate__ARCH__func__P0__PROC
.globl work__notgate__ARCH__func__ELAB
	.type	work__notgate__ARCH__func__ELAB, @function
work__notgate__ARCH__func__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$work__notgate__ARCH__func__RTI, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	work__notgate__ELAB
	movl	-4(%ebp), %eax
	addl	$16, %eax
	movl	$work__notgate__ARCH__func__P0__PROC, %edx
	movl	-4(%ebp), %ecx
	movl	%eax, 12(%esp)
	movl	$work__notgate__ARCH__func__P0__RTI, 8(%esp)
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
	.size	work__notgate__ARCH__func__ELAB, .-work__notgate__ARCH__func__ELAB
	.section	.rodata
	.type	work__mux_4_to_1__d0__RTISTR, @object
	.size	work__mux_4_to_1__d0__RTISTR, 3
work__mux_4_to_1__d0__RTISTR:
	.byte	100
	.byte	48
	.byte	0
.globl work__mux_4_to_1__d0__RTI
	.align 4
	.type	work__mux_4_to_1__d0__RTI, @object
	.size	work__mux_4_to_1__d0__RTI, 16
work__mux_4_to_1__d0__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__d0__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__d1__RTISTR, @object
	.size	work__mux_4_to_1__d1__RTISTR, 3
work__mux_4_to_1__d1__RTISTR:
	.byte	100
	.byte	49
	.byte	0
.globl work__mux_4_to_1__d1__RTI
	.align 4
	.type	work__mux_4_to_1__d1__RTI, @object
	.size	work__mux_4_to_1__d1__RTI, 16
work__mux_4_to_1__d1__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__d1__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__d2__RTISTR, @object
	.size	work__mux_4_to_1__d2__RTISTR, 3
work__mux_4_to_1__d2__RTISTR:
	.byte	100
	.byte	50
	.byte	0
.globl work__mux_4_to_1__d2__RTI
	.align 4
	.type	work__mux_4_to_1__d2__RTI, @object
	.size	work__mux_4_to_1__d2__RTI, 16
work__mux_4_to_1__d2__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__d2__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__d3__RTISTR, @object
	.size	work__mux_4_to_1__d3__RTISTR, 3
work__mux_4_to_1__d3__RTISTR:
	.byte	100
	.byte	51
	.byte	0
.globl work__mux_4_to_1__d3__RTI
	.align 4
	.type	work__mux_4_to_1__d3__RTI, @object
	.size	work__mux_4_to_1__d3__RTI, 16
work__mux_4_to_1__d3__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__d3__RTISTR
	.long	20
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__s0__RTISTR, @object
	.size	work__mux_4_to_1__s0__RTISTR, 3
work__mux_4_to_1__s0__RTISTR:
	.byte	115
	.byte	48
	.byte	0
.globl work__mux_4_to_1__s0__RTI
	.align 4
	.type	work__mux_4_to_1__s0__RTI, @object
	.size	work__mux_4_to_1__s0__RTI, 16
work__mux_4_to_1__s0__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__s0__RTISTR
	.long	24
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__s1__RTISTR, @object
	.size	work__mux_4_to_1__s1__RTISTR, 3
work__mux_4_to_1__s1__RTISTR:
	.byte	115
	.byte	49
	.byte	0
.globl work__mux_4_to_1__s1__RTI
	.align 4
	.type	work__mux_4_to_1__s1__RTI, @object
	.size	work__mux_4_to_1__s1__RTI, 16
work__mux_4_to_1__s1__RTI:
	.byte	16
	.byte	1
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__s1__RTISTR
	.long	28
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__f__RTISTR, @object
	.size	work__mux_4_to_1__f__RTISTR, 2
work__mux_4_to_1__f__RTISTR:
	.byte	102
	.byte	0
.globl work__mux_4_to_1__f__RTI
	.align 4
	.type	work__mux_4_to_1__f__RTI, @object
	.size	work__mux_4_to_1__f__RTI, 16
work__mux_4_to_1__f__RTI:
	.byte	16
	.byte	1
	.byte	3
	.byte	0
	.long	work__mux_4_to_1__f__RTISTR
	.long	32
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__RTISTR, @object
	.size	work__mux_4_to_1__RTISTR, 11
work__mux_4_to_1__RTISTR:
	.byte	109
	.byte	117
	.byte	120
	.byte	95
	.byte	52
	.byte	95
	.byte	116
	.byte	111
	.byte	95
	.byte	49
	.byte	0
	.align 32
	.type	work__mux_4_to_1__RTIARRAY, @object
	.size	work__mux_4_to_1__RTIARRAY, 32
work__mux_4_to_1__RTIARRAY:
	.long	work__mux_4_to_1__d0__RTI
	.long	work__mux_4_to_1__d1__RTI
	.long	work__mux_4_to_1__d2__RTI
	.long	work__mux_4_to_1__d3__RTI
	.long	work__mux_4_to_1__s0__RTI
	.long	work__mux_4_to_1__s1__RTI
	.long	work__mux_4_to_1__f__RTI
	.long	0
.globl work__mux_4_to_1__RTI
	.align 4
	.type	work__mux_4_to_1__RTI, @object
	.size	work__mux_4_to_1__RTI, 28
work__mux_4_to_1__RTI:
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__RTISTR
	.long	0
	.long	work__RTI
	.long	36
	.long	7
	.long	work__mux_4_to_1__RTIARRAY
	.text
.globl work__mux_4_to_1__ELAB
	.type	work__mux_4_to_1__ELAB, @function
work__mux_4_to_1__ELAB:
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
	movl	$work__mux_4_to_1__d0__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	$work__mux_4_to_1__d1__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	$work__mux_4_to_1__d2__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	$work__mux_4_to_1__d3__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	$work__mux_4_to_1__s0__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	$work__mux_4_to_1__s1__RTI, 4(%esp)
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
	movl	$work__mux_4_to_1__f__RTI, 4(%esp)
	movl	%eax, (%esp)
	call	__ghdl_signal_merge_rti
	leave
	ret
	.size	work__mux_4_to_1__ELAB, .-work__mux_4_to_1__ELAB
.globl work__mux_4_to_1__ARCH__func__INSTSIZE
	.section	.rodata
	.align 4
	.type	work__mux_4_to_1__ARCH__func__INSTSIZE, @object
	.size	work__mux_4_to_1__ARCH__func__INSTSIZE, 4
work__mux_4_to_1__ARCH__func__INSTSIZE:
	.long	260
	.type	work__mux_4_to_1__ARCH__func__andgate__a__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__a__RTISTR, 2
work__mux_4_to_1__ARCH__func__andgate__a__RTISTR:
	.byte	97
	.byte	0
.globl work__mux_4_to_1__ARCH__func__andgate__a__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andgate__a__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__a__RTI, 16
work__mux_4_to_1__ARCH__func__andgate__a__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andgate__a__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__andgate__b__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__b__RTISTR, 2
work__mux_4_to_1__ARCH__func__andgate__b__RTISTR:
	.byte	98
	.byte	0
.globl work__mux_4_to_1__ARCH__func__andgate__b__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andgate__b__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__b__RTI, 16
work__mux_4_to_1__ARCH__func__andgate__b__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andgate__b__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__andgate__c__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__c__RTISTR, 2
work__mux_4_to_1__ARCH__func__andgate__c__RTISTR:
	.byte	99
	.byte	0
.globl work__mux_4_to_1__ARCH__func__andgate__c__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andgate__c__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__c__RTI, 16
work__mux_4_to_1__ARCH__func__andgate__c__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andgate__c__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__andgate__f__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__f__RTISTR, 2
work__mux_4_to_1__ARCH__func__andgate__f__RTISTR:
	.byte	102
	.byte	0
.globl work__mux_4_to_1__ARCH__func__andgate__f__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andgate__f__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__f__RTI, 16
work__mux_4_to_1__ARCH__func__andgate__f__RTI:
	.byte	16
	.byte	2
	.byte	3
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andgate__f__RTISTR
	.long	20
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__andgate__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__RTISTR, 8
work__mux_4_to_1__ARCH__func__andgate__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	103
	.byte	97
	.byte	116
	.byte	101
	.byte	0
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andgate__RTIARRAY, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__RTIARRAY, 20
work__mux_4_to_1__ARCH__func__andgate__RTIARRAY:
	.long	work__mux_4_to_1__ARCH__func__andgate__a__RTI
	.long	work__mux_4_to_1__ARCH__func__andgate__b__RTI
	.long	work__mux_4_to_1__ARCH__func__andgate__c__RTI
	.long	work__mux_4_to_1__ARCH__func__andgate__f__RTI
	.long	0
.globl work__mux_4_to_1__ARCH__func__andgate__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andgate__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andgate__RTI, 16
work__mux_4_to_1__ARCH__func__andgate__RTI:
	.byte	20
	.byte	2
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andgate__RTISTR
	.long	4
	.long	work__mux_4_to_1__ARCH__func__andgate__RTIARRAY
	.type	work__mux_4_to_1__ARCH__func__orgate__a__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__a__RTISTR, 2
work__mux_4_to_1__ARCH__func__orgate__a__RTISTR:
	.byte	97
	.byte	0
.globl work__mux_4_to_1__ARCH__func__orgate__a__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__orgate__a__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__a__RTI, 16
work__mux_4_to_1__ARCH__func__orgate__a__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__orgate__a__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__orgate__b__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__b__RTISTR, 2
work__mux_4_to_1__ARCH__func__orgate__b__RTISTR:
	.byte	98
	.byte	0
.globl work__mux_4_to_1__ARCH__func__orgate__b__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__orgate__b__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__b__RTI, 16
work__mux_4_to_1__ARCH__func__orgate__b__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__orgate__b__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__orgate__f__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__f__RTISTR, 2
work__mux_4_to_1__ARCH__func__orgate__f__RTISTR:
	.byte	102
	.byte	0
.globl work__mux_4_to_1__ARCH__func__orgate__f__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__orgate__f__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__f__RTI, 16
work__mux_4_to_1__ARCH__func__orgate__f__RTI:
	.byte	16
	.byte	2
	.byte	3
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__orgate__f__RTISTR
	.long	16
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__orgate__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__RTISTR, 7
work__mux_4_to_1__ARCH__func__orgate__RTISTR:
	.byte	111
	.byte	114
	.byte	103
	.byte	97
	.byte	116
	.byte	101
	.byte	0
	.align 4
	.type	work__mux_4_to_1__ARCH__func__orgate__RTIARRAY, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__RTIARRAY, 16
work__mux_4_to_1__ARCH__func__orgate__RTIARRAY:
	.long	work__mux_4_to_1__ARCH__func__orgate__a__RTI
	.long	work__mux_4_to_1__ARCH__func__orgate__b__RTI
	.long	work__mux_4_to_1__ARCH__func__orgate__f__RTI
	.long	0
.globl work__mux_4_to_1__ARCH__func__orgate__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__orgate__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__orgate__RTI, 16
work__mux_4_to_1__ARCH__func__orgate__RTI:
	.byte	20
	.byte	2
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__orgate__RTISTR
	.long	3
	.long	work__mux_4_to_1__ARCH__func__orgate__RTIARRAY
	.type	work__mux_4_to_1__ARCH__func__notgate__inport__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__notgate__inport__RTISTR, 7
work__mux_4_to_1__ARCH__func__notgate__inport__RTISTR:
	.byte	105
	.byte	110
	.byte	112
	.byte	111
	.byte	114
	.byte	116
	.byte	0
.globl work__mux_4_to_1__ARCH__func__notgate__inport__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__notgate__inport__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__notgate__inport__RTI, 16
work__mux_4_to_1__ARCH__func__notgate__inport__RTI:
	.byte	16
	.byte	2
	.byte	5
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__notgate__inport__RTISTR
	.long	8
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__notgate__outport__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__notgate__outport__RTISTR, 8
work__mux_4_to_1__ARCH__func__notgate__outport__RTISTR:
	.byte	111
	.byte	117
	.byte	116
	.byte	112
	.byte	111
	.byte	114
	.byte	116
	.byte	0
.globl work__mux_4_to_1__ARCH__func__notgate__outport__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__notgate__outport__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__notgate__outport__RTI, 16
work__mux_4_to_1__ARCH__func__notgate__outport__RTI:
	.byte	16
	.byte	2
	.byte	3
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__notgate__outport__RTISTR
	.long	12
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__notgate__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__notgate__RTISTR, 8
work__mux_4_to_1__ARCH__func__notgate__RTISTR:
	.byte	110
	.byte	111
	.byte	116
	.byte	103
	.byte	97
	.byte	116
	.byte	101
	.byte	0
	.align 4
	.type	work__mux_4_to_1__ARCH__func__notgate__RTIARRAY, @object
	.size	work__mux_4_to_1__ARCH__func__notgate__RTIARRAY, 12
work__mux_4_to_1__ARCH__func__notgate__RTIARRAY:
	.long	work__mux_4_to_1__ARCH__func__notgate__inport__RTI
	.long	work__mux_4_to_1__ARCH__func__notgate__outport__RTI
	.long	0
.globl work__mux_4_to_1__ARCH__func__notgate__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__notgate__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__notgate__RTI, 16
work__mux_4_to_1__ARCH__func__notgate__RTI:
	.byte	20
	.byte	2
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__notgate__RTISTR
	.long	2
	.long	work__mux_4_to_1__ARCH__func__notgate__RTIARRAY
	.type	work__mux_4_to_1__ARCH__func__invout0__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__invout0__RTISTR, 8
work__mux_4_to_1__ARCH__func__invout0__RTISTR:
	.byte	105
	.byte	110
	.byte	118
	.byte	111
	.byte	117
	.byte	116
	.byte	48
	.byte	0
.globl work__mux_4_to_1__ARCH__func__invout0__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__invout0__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__invout0__RTI, 16
work__mux_4_to_1__ARCH__func__invout0__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__invout0__RTISTR
	.long	36
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__invout1__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__invout1__RTISTR, 8
work__mux_4_to_1__ARCH__func__invout1__RTISTR:
	.byte	105
	.byte	110
	.byte	118
	.byte	111
	.byte	117
	.byte	116
	.byte	49
	.byte	0
.globl work__mux_4_to_1__ARCH__func__invout1__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__invout1__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__invout1__RTI, 16
work__mux_4_to_1__ARCH__func__invout1__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__invout1__RTISTR
	.long	40
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__andout1__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andout1__RTISTR, 8
work__mux_4_to_1__ARCH__func__andout1__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	111
	.byte	117
	.byte	116
	.byte	49
	.byte	0
.globl work__mux_4_to_1__ARCH__func__andout1__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andout1__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andout1__RTI, 16
work__mux_4_to_1__ARCH__func__andout1__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andout1__RTISTR
	.long	44
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__andout2__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andout2__RTISTR, 8
work__mux_4_to_1__ARCH__func__andout2__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	111
	.byte	117
	.byte	116
	.byte	50
	.byte	0
.globl work__mux_4_to_1__ARCH__func__andout2__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andout2__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andout2__RTI, 16
work__mux_4_to_1__ARCH__func__andout2__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andout2__RTISTR
	.long	48
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__andout3__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andout3__RTISTR, 8
work__mux_4_to_1__ARCH__func__andout3__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	111
	.byte	117
	.byte	116
	.byte	51
	.byte	0
.globl work__mux_4_to_1__ARCH__func__andout3__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andout3__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andout3__RTI, 16
work__mux_4_to_1__ARCH__func__andout3__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andout3__RTISTR
	.long	52
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__andout4__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__andout4__RTISTR, 8
work__mux_4_to_1__ARCH__func__andout4__RTISTR:
	.byte	97
	.byte	110
	.byte	100
	.byte	111
	.byte	117
	.byte	116
	.byte	52
	.byte	0
.globl work__mux_4_to_1__ARCH__func__andout4__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__andout4__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__andout4__RTI, 16
work__mux_4_to_1__ARCH__func__andout4__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__andout4__RTISTR
	.long	56
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__ortop__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__ortop__RTISTR, 6
work__mux_4_to_1__ARCH__func__ortop__RTISTR:
	.byte	111
	.byte	114
	.byte	116
	.byte	111
	.byte	112
	.byte	0
.globl work__mux_4_to_1__ARCH__func__ortop__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__ortop__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__ortop__RTI, 16
work__mux_4_to_1__ARCH__func__ortop__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__ortop__RTISTR
	.long	60
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__orbot__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__orbot__RTISTR, 6
work__mux_4_to_1__ARCH__func__orbot__RTISTR:
	.byte	111
	.byte	114
	.byte	98
	.byte	111
	.byte	116
	.byte	0
.globl work__mux_4_to_1__ARCH__func__orbot__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__orbot__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__orbot__RTI, 16
work__mux_4_to_1__ARCH__func__orbot__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__orbot__RTISTR
	.long	64
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__orout__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__orout__RTISTR, 6
work__mux_4_to_1__ARCH__func__orout__RTISTR:
	.byte	111
	.byte	114
	.byte	111
	.byte	117
	.byte	116
	.byte	0
.globl work__mux_4_to_1__ARCH__func__orout__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__orout__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__orout__RTI, 16
work__mux_4_to_1__ARCH__func__orout__RTI:
	.byte	14
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__orout__RTISTR
	.long	68
	.long	ieee__std_logic_1164__std_logic__RTI
	.type	work__mux_4_to_1__ARCH__func__gi1__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__gi1__RTISTR, 4
work__mux_4_to_1__ARCH__func__gi1__RTISTR:
	.byte	103
	.byte	105
	.byte	49
	.byte	0
.globl work__mux_4_to_1__ARCH__func__gi1__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__gi1__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__gi1__RTI, 20
work__mux_4_to_1__ARCH__func__gi1__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__gi1__RTISTR
	.long	72
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__notgate__RTI
	.type	work__mux_4_to_1__ARCH__func__gi2__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__gi2__RTISTR, 4
work__mux_4_to_1__ARCH__func__gi2__RTISTR:
	.byte	103
	.byte	105
	.byte	50
	.byte	0
.globl work__mux_4_to_1__ARCH__func__gi2__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__gi2__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__gi2__RTI, 20
work__mux_4_to_1__ARCH__func__gi2__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__gi2__RTISTR
	.long	88
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__notgate__RTI
	.type	work__mux_4_to_1__ARCH__func__ga1__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__ga1__RTISTR, 4
work__mux_4_to_1__ARCH__func__ga1__RTISTR:
	.byte	103
	.byte	97
	.byte	49
	.byte	0
.globl work__mux_4_to_1__ARCH__func__ga1__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__ga1__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__ga1__RTI, 20
work__mux_4_to_1__ARCH__func__ga1__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__ga1__RTISTR
	.long	104
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__andgate__RTI
	.type	work__mux_4_to_1__ARCH__func__ga2__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__ga2__RTISTR, 4
work__mux_4_to_1__ARCH__func__ga2__RTISTR:
	.byte	103
	.byte	97
	.byte	50
	.byte	0
.globl work__mux_4_to_1__ARCH__func__ga2__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__ga2__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__ga2__RTI, 20
work__mux_4_to_1__ARCH__func__ga2__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__ga2__RTISTR
	.long	128
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__andgate__RTI
	.type	work__mux_4_to_1__ARCH__func__ga3__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__ga3__RTISTR, 4
work__mux_4_to_1__ARCH__func__ga3__RTISTR:
	.byte	103
	.byte	97
	.byte	51
	.byte	0
.globl work__mux_4_to_1__ARCH__func__ga3__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__ga3__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__ga3__RTI, 20
work__mux_4_to_1__ARCH__func__ga3__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__ga3__RTISTR
	.long	152
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__andgate__RTI
	.type	work__mux_4_to_1__ARCH__func__ga4__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__ga4__RTISTR, 4
work__mux_4_to_1__ARCH__func__ga4__RTISTR:
	.byte	103
	.byte	97
	.byte	52
	.byte	0
.globl work__mux_4_to_1__ARCH__func__ga4__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__ga4__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__ga4__RTI, 20
work__mux_4_to_1__ARCH__func__ga4__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__ga4__RTISTR
	.long	176
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__andgate__RTI
	.type	work__mux_4_to_1__ARCH__func__go1__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__go1__RTISTR, 4
work__mux_4_to_1__ARCH__func__go1__RTISTR:
	.byte	103
	.byte	111
	.byte	49
	.byte	0
.globl work__mux_4_to_1__ARCH__func__go1__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__go1__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__go1__RTI, 20
work__mux_4_to_1__ARCH__func__go1__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__go1__RTISTR
	.long	200
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__orgate__RTI
	.type	work__mux_4_to_1__ARCH__func__go2__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__go2__RTISTR, 4
work__mux_4_to_1__ARCH__func__go2__RTISTR:
	.byte	103
	.byte	111
	.byte	50
	.byte	0
.globl work__mux_4_to_1__ARCH__func__go2__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__go2__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__go2__RTI, 20
work__mux_4_to_1__ARCH__func__go2__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__go2__RTISTR
	.long	220
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__orgate__RTI
	.type	work__mux_4_to_1__ARCH__func__go3__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__go3__RTISTR, 4
work__mux_4_to_1__ARCH__func__go3__RTISTR:
	.byte	103
	.byte	111
	.byte	51
	.byte	0
.globl work__mux_4_to_1__ARCH__func__go3__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__go3__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__go3__RTI, 20
work__mux_4_to_1__ARCH__func__go3__RTI:
	.byte	10
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__go3__RTISTR
	.long	240
	.long	work__mux_4_to_1__ARCH__func__RTI
	.long	work__mux_4_to_1__ARCH__func__orgate__RTI
	.type	work__mux_4_to_1__ARCH__func__RTISTR, @object
	.size	work__mux_4_to_1__ARCH__func__RTISTR, 5
work__mux_4_to_1__ARCH__func__RTISTR:
	.byte	102
	.byte	117
	.byte	110
	.byte	99
	.byte	0
	.align 32
	.type	work__mux_4_to_1__ARCH__func__RTIARRAY, @object
	.size	work__mux_4_to_1__ARCH__func__RTIARRAY, 88
work__mux_4_to_1__ARCH__func__RTIARRAY:
	.long	work__mux_4_to_1__ARCH__func__andgate__RTI
	.long	work__mux_4_to_1__ARCH__func__orgate__RTI
	.long	work__mux_4_to_1__ARCH__func__notgate__RTI
	.long	work__mux_4_to_1__ARCH__func__invout0__RTI
	.long	work__mux_4_to_1__ARCH__func__invout1__RTI
	.long	work__mux_4_to_1__ARCH__func__andout1__RTI
	.long	work__mux_4_to_1__ARCH__func__andout2__RTI
	.long	work__mux_4_to_1__ARCH__func__andout3__RTI
	.long	work__mux_4_to_1__ARCH__func__andout4__RTI
	.long	work__mux_4_to_1__ARCH__func__ortop__RTI
	.long	work__mux_4_to_1__ARCH__func__orbot__RTI
	.long	work__mux_4_to_1__ARCH__func__orout__RTI
	.long	work__mux_4_to_1__ARCH__func__gi1__RTI
	.long	work__mux_4_to_1__ARCH__func__gi2__RTI
	.long	work__mux_4_to_1__ARCH__func__ga1__RTI
	.long	work__mux_4_to_1__ARCH__func__ga2__RTI
	.long	work__mux_4_to_1__ARCH__func__ga3__RTI
	.long	work__mux_4_to_1__ARCH__func__ga4__RTI
	.long	work__mux_4_to_1__ARCH__func__go1__RTI
	.long	work__mux_4_to_1__ARCH__func__go2__RTI
	.long	work__mux_4_to_1__ARCH__func__go3__RTI
	.long	0
.globl work__mux_4_to_1__ARCH__func__RTI
	.align 4
	.type	work__mux_4_to_1__ARCH__func__RTI, @object
	.size	work__mux_4_to_1__ARCH__func__RTI, 28
work__mux_4_to_1__ARCH__func__RTI:
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.long	work__mux_4_to_1__ARCH__func__RTISTR
	.long	0
	.long	work__mux_4_to_1__RTI
	.long	260
	.long	21
	.long	work__mux_4_to_1__ARCH__func__RTIARRAY
	.text
	.type	work__mux_4_to_1__ARCH__func__gi1__ELAB, @function
work__mux_4_to_1__ARCH__func__gi1__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__gi1__RTI, 76(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__gi1__ELAB, .-work__mux_4_to_1__ARCH__func__gi1__ELAB
	.type	work__mux_4_to_1__ARCH__func__gi2__ELAB, @function
work__mux_4_to_1__ARCH__func__gi2__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__gi2__RTI, 92(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__gi2__ELAB, .-work__mux_4_to_1__ARCH__func__gi2__ELAB
	.type	work__mux_4_to_1__ARCH__func__ga1__ELAB, @function
work__mux_4_to_1__ARCH__func__ga1__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__ga1__RTI, 108(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__ga1__ELAB, .-work__mux_4_to_1__ARCH__func__ga1__ELAB
	.type	work__mux_4_to_1__ARCH__func__ga2__ELAB, @function
work__mux_4_to_1__ARCH__func__ga2__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__ga2__RTI, 132(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__ga2__ELAB, .-work__mux_4_to_1__ARCH__func__ga2__ELAB
	.type	work__mux_4_to_1__ARCH__func__ga3__ELAB, @function
work__mux_4_to_1__ARCH__func__ga3__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__ga3__RTI, 156(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__ga3__ELAB, .-work__mux_4_to_1__ARCH__func__ga3__ELAB
	.type	work__mux_4_to_1__ARCH__func__ga4__ELAB, @function
work__mux_4_to_1__ARCH__func__ga4__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__ga4__RTI, 180(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__ga4__ELAB, .-work__mux_4_to_1__ARCH__func__ga4__ELAB
	.type	work__mux_4_to_1__ARCH__func__go1__ELAB, @function
work__mux_4_to_1__ARCH__func__go1__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__go1__RTI, 204(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__go1__ELAB, .-work__mux_4_to_1__ARCH__func__go1__ELAB
	.type	work__mux_4_to_1__ARCH__func__go2__ELAB, @function
work__mux_4_to_1__ARCH__func__go2__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__go2__RTI, 224(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__go2__ELAB, .-work__mux_4_to_1__ARCH__func__go2__ELAB
	.type	work__mux_4_to_1__ARCH__func__go3__ELAB, @function
work__mux_4_to_1__ARCH__func__go3__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__go3__RTI, 244(%eax)
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
	.size	work__mux_4_to_1__ARCH__func__go3__ELAB, .-work__mux_4_to_1__ARCH__func__go3__ELAB
.globl work__mux_4_to_1__ARCH__func__ELAB
	.type	work__mux_4_to_1__ARCH__func__ELAB, @function
work__mux_4_to_1__ARCH__func__ELAB:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$work__mux_4_to_1__ARCH__func__RTI, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__invout0__RTI, (%esp)
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
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__invout1__RTI, (%esp)
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
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__andout1__RTI, (%esp)
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
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__andout2__RTI, (%esp)
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
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__andout3__RTI, (%esp)
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
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__andout4__RTI, (%esp)
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
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__ortop__RTI, (%esp)
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
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__orbot__RTI, (%esp)
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
	movl	$work__mux_4_to_1__ARCH__func__RTI, 4(%esp)
	movl	$work__mux_4_to_1__ARCH__func__orout__RTI, (%esp)
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
	call	work__mux_4_to_1__ARCH__func__gi1__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ARCH__func__gi2__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ARCH__func__ga1__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ARCH__func__ga2__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ARCH__func__ga3__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ARCH__func__ga4__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ARCH__func__go1__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ARCH__func__go2__ELAB
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	work__mux_4_to_1__ARCH__func__go3__ELAB
	leave
	ret
	.size	work__mux_4_to_1__ARCH__func__ELAB, .-work__mux_4_to_1__ARCH__func__ELAB
	.ident	"GCC: (GNU) 4.3.4"
	.section	.note.GNU-stack,"",@progbits
