	.equ	READ_CORE_TIMER, 11
	.equ	RESET_CORE_TIMER, 12

	.data
	.text

timedone:
	li	$t0, 0
timedone_if:
	blez	$a1, timedone_else
	li	$v0, RESET_CORE_TIMER
	syscall
	j	timedone_return
timedone_else:
	li	$v0, READ_CORE_TIMER
	syscall
	move	$t1, $v0
	mul	$t2, $a0, 20000
	ble	$t1, $t2, timedone_return
	div	$t0, $t1, 20000
timedown_return:
	move	$v0, $t0
	jr	$ra
