	.cpu cortex-m4
	.arch armv7e-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 38, 1
	.eabi_attribute 18, 4
	.file	"ad5940.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\anshm\\OneDrive\\Desktop\\Applications\\Nocturnal_HustleTask\\Code\\ad5940.c"
	.section	.bss.bIsS2silicon,"aw",%nobits
	.type	bIsS2silicon, %object
	.size	bIsS2silicon, 1
bIsS2silicon:
	.space	1
	.global	SeqGenDB
	.section	.bss.SeqGenDB,"aw",%nobits
	.align	2
	.type	SeqGenDB, %object
	.size	SeqGenDB, 28
SeqGenDB:
	.space	28
	.section	.text.AD5940_SEQGenInsert,"ax",%progbits
	.align	1
	.global	AD5940_SEQGenInsert
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQGenInsert, %function
AD5940_SEQGenInsert:
.LFB0:
	.loc 1 113 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 115 19
	ldr	r3, .L5
	ldr	r2, [r3, #20]
	.loc 1 115 39
	ldr	r3, .L5
	ldr	r3, [r3, #12]
	.loc 1 115 9
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 117 21
	ldr	r3, .L5
	ldr	r3, [r3, #4]
	.loc 1 117 5
	ldr	r2, [sp, #12]
	cmp	r2, r3
	bcs	.L2
	.loc 1 119 13
	ldr	r3, .L5
	ldr	r2, [r3, #8]
	.loc 1 119 31
	ldr	r3, .L5
	ldr	r3, [r3, #12]
	.loc 1 119 22
	lsls	r3, r3, #2
	add	r3, r3, r2
	.loc 1 119 40
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 120 13
	ldr	r3, .L5
	ldr	r3, [r3, #12]
	.loc 1 120 21
	adds	r3, r3, #1
	ldr	r2, .L5
	str	r3, [r2, #12]
	.loc 1 124 1
	b	.L4
.L2:
	.loc 1 123 24
	ldr	r3, .L5
	mvn	r2, #3
	str	r2, [r3, #24]
.L4:
	.loc 1 124 1
	nop
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L6:
	.align	2
.L5:
	.word	SeqGenDB
	.cfi_endproc
.LFE0:
	.size	AD5940_SEQGenInsert, .-AD5940_SEQGenInsert
	.section	.text.AD5940_SEQGenSearchReg,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQGenSearchReg, %function
AD5940_SEQGenSearchReg:
.LFB1:
	.loc 1 133 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 136 21
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #2
	.loc 1 136 11
	uxtb	r3, r3
	str	r3, [sp, #4]
	.loc 1 137 8
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 137 3
	b	.L8
.L11:
	.loc 1 139 27
	ldr	r3, .L12
	ldr	r2, [r3, #16]
	.loc 1 139 36
	ldr	r3, [sp, #12]
	lsls	r3, r3, #2
	add	r3, r3, r2
	.loc 1 139 39
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 139 7
	ldr	r3, [sp, #4]
	cmp	r3, r2
	bne	.L9
	.loc 1 141 15
	ldr	r3, [sp]
	ldr	r2, [sp, #12]
	str	r2, [r3]
	.loc 1 142 14
	movs	r3, #0
	b	.L10
.L9:
	.loc 1 137 30 discriminator 2
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
.L8:
	.loc 1 137 21 discriminator 1
	ldr	r3, .L12
	ldr	r3, [r3, #12]
	.loc 1 137 12 discriminator 1
	ldr	r2, [sp, #12]
	cmp	r2, r3
	bcc	.L11
	.loc 1 145 10
	mvn	r3, #6
.L10:
	.loc 1 146 1
	mov	r0, r3
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L13:
	.align	2
.L12:
	.word	SeqGenDB
	.cfi_endproc
.LFE1:
	.size	AD5940_SEQGenSearchReg, .-AD5940_SEQGenSearchReg
	.section	.text.AD5940_SEQGenGetRegDefault,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQGenGetRegDefault, %function
AD5940_SEQGenGetRegDefault:
.LFB2:
	.loc 1 155 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 159 15
	ldr	r3, [sp, #4]
	uxth	r3, r3
	mov	r0, r3
	bl	AD5940_SPIReadReg
	mov	r2, r0
	.loc 1 159 13 discriminator 1
	ldr	r3, [sp]
	str	r2, [r3]
	.loc 1 161 10
	movs	r3, #0
	.loc 1 162 1
	mov	r0, r3
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE2:
	.size	AD5940_SEQGenGetRegDefault, .-AD5940_SEQGenGetRegDefault
	.section	.text.AD5940_SEQRegInfoInsert,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQRegInfoInsert, %function
AD5940_SEQRegInfoInsert:
.LFB3:
	.loc 1 171 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	r3, r0
	str	r1, [sp]
	strh	r3, [sp, #6]	@ movhi
	.loc 1 173 18
	ldr	r3, .L20
	ldr	r2, [r3, #20]
	.loc 1 173 38
	ldr	r3, .L20
	ldr	r3, [r3, #12]
	.loc 1 173 8
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 175 21
	ldr	r3, .L20
	ldr	r3, [r3, #4]
	.loc 1 175 5
	ldr	r2, [sp, #12]
	cmp	r2, r3
	bcs	.L17
	.loc 1 177 13
	ldr	r3, .L20
	ldr	r3, [r3, #16]
	.loc 1 177 23
	subs	r3, r3, #4
	ldr	r2, .L20
	str	r3, [r2, #16]
	.loc 1 178 34
	ldrh	r3, [sp, #6]
	lsrs	r3, r3, #2
	uxth	r2, r3
	.loc 1 178 13
	ldr	r3, .L20
	ldr	r3, [r3, #16]
	.loc 1 178 34
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 179 13
	ldr	r3, .L20
	ldr	r2, [r3, #16]
	.loc 1 179 44
	ldr	r3, [sp]
	bic	r1, r3, #-16777216
	.loc 1 179 35
	ldr	r3, [r2]
	bfi	r3, r1, #8, #24
	str	r3, [r2]
	.loc 1 180 13
	ldr	r3, .L20
	ldr	r3, [r3, #20]
	.loc 1 180 23
	adds	r3, r3, #1
	ldr	r2, .L20
	str	r3, [r2, #20]
	.loc 1 186 1
	b	.L19
.L17:
	.loc 1 184 24
	ldr	r3, .L20
	mvn	r2, #3
	str	r2, [r3, #24]
.L19:
	.loc 1 186 1
	nop
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L21:
	.align	2
.L20:
	.word	SeqGenDB
	.cfi_endproc
.LFE3:
	.size	AD5940_SEQRegInfoInsert, .-AD5940_SEQRegInfoInsert
	.section	.text.AD5940_SEQReadReg,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQReadReg, %function
AD5940_SEQReadReg:
.LFB4:
	.loc 1 194 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 197 6
	ldrh	r3, [sp, #6]
	add	r2, sp, #12
	mov	r1, r2
	mov	r0, r3
	bl	AD5940_SEQGenSearchReg
	mov	r3, r0
	.loc 1 197 5 discriminator 1
	cmp	r3, #0
	beq	.L23
	.loc 1 200 5
	ldrh	r3, [sp, #6]
	add	r2, sp, #8
	mov	r1, r2
	mov	r0, r3
	bl	AD5940_SEQGenGetRegDefault
	.loc 1 201 5
	ldr	r2, [sp, #8]
	ldrh	r3, [sp, #6]
	mov	r1, r2
	mov	r0, r3
	bl	AD5940_SEQRegInfoInsert
	b	.L24
.L23:
	.loc 1 206 23
	ldr	r3, .L26
	ldr	r2, [r3, #16]
	.loc 1 206 32
	ldr	r3, [sp, #12]
	lsls	r3, r3, #2
	add	r3, r3, r2
	.loc 1 206 42
	ldr	r3, [r3]
	ubfx	r3, r3, #8, #24
	.loc 1 206 13
	str	r3, [sp, #8]
.L24:
	.loc 1 209 10
	ldr	r3, [sp, #8]
	.loc 1 210 1
	mov	r0, r3
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L27:
	.align	2
.L26:
	.word	SeqGenDB
	.cfi_endproc
.LFE4:
	.size	AD5940_SEQReadReg, .-AD5940_SEQReadReg
	.section	.text.AD5940_SEQWriteReg,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQWriteReg, %function
AD5940_SEQWriteReg:
.LFB5:
	.loc 1 220 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	mov	r3, r0
	str	r1, [sp]
	strh	r3, [sp, #6]	@ movhi
	.loc 1 223 5
	ldrh	r3, [sp, #6]
	cmp	r3, #8704
	bcc	.L29
	.loc 1 225 24
	ldr	r3, .L33
	mvn	r2, #4
	str	r2, [r3, #24]
	b	.L28
.L29:
	.loc 1 229 6
	ldrh	r3, [sp, #6]
	add	r2, sp, #12
	mov	r1, r2
	mov	r0, r3
	bl	AD5940_SEQGenSearchReg
	mov	r3, r0
	.loc 1 229 5 discriminator 1
	cmp	r3, #0
	bne	.L31
	.loc 1 232 13
	ldr	r3, .L33
	ldr	r2, [r3, #16]
	.loc 1 232 22
	ldr	r3, [sp, #12]
	lsls	r3, r3, #2
	add	r2, r2, r3
	.loc 1 232 42
	ldr	r3, [sp]
	bic	r1, r3, #-16777216
	ldr	r3, [r2]
	bfi	r3, r1, #8, #24
	str	r3, [r2]
	.loc 1 234 25
	ldrh	r3, [sp, #6]
	lsrs	r3, r3, #2
	uxth	r3, r3
	lsls	r3, r3, #24
	and	r2, r3, #2130706432
	ldr	r3, [sp]
	bic	r3, r3, #-16777216
	orrs	r3, r3, r2
	.loc 1 234 5
	orr	r3, r3, #-2147483648
	mov	r0, r3
	bl	AD5940_SEQGenInsert
	b	.L28
.L31:
	.loc 1 238 5
	ldrh	r3, [sp, #6]
	ldr	r1, [sp]
	mov	r0, r3
	bl	AD5940_SEQRegInfoInsert
	.loc 1 240 25
	ldrh	r3, [sp, #6]
	lsrs	r3, r3, #2
	uxth	r3, r3
	lsls	r3, r3, #24
	and	r2, r3, #2130706432
	ldr	r3, [sp]
	bic	r3, r3, #-16777216
	orrs	r3, r3, r2
	.loc 1 240 5
	orr	r3, r3, #-2147483648
	mov	r0, r3
	bl	AD5940_SEQGenInsert
.L28:
	.loc 1 242 1
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L34:
	.align	2
.L33:
	.word	SeqGenDB
	.cfi_endproc
.LFE5:
	.size	AD5940_SEQWriteReg, .-AD5940_SEQWriteReg
	.section	.text.AD5940_SEQGenInit,"ax",%progbits
	.align	1
	.global	AD5940_SEQGenInit
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQGenInit, %function
AD5940_SEQGenInit:
.LFB6:
	.loc 1 258 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 259 5
	ldr	r3, [sp]
	cmp	r3, #1
	bls	.L38
	.loc 1 260 23
	ldr	r2, .L39
	ldr	r3, [sp]
	str	r3, [r2, #4]
	.loc 1 261 21
	ldr	r2, .L39
	ldr	r3, [sp, #4]
	str	r3, [r2, #8]
	.loc 1 262 65
	ldr	r3, [sp]
	add	r3, r3, #1073741824
	subs	r3, r3, #1
	lsls	r3, r3, #2
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	.loc 1 262 21
	ldr	r2, .L39
	str	r3, [r2, #16]
	.loc 1 263 19
	ldr	r3, .L39
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 265 21
	ldr	r3, .L39
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 266 22
	ldr	r3, .L39
	movs	r2, #0
	str	r2, [r3, #24]
	.loc 1 267 24
	ldr	r3, .L39
	movs	r2, #0
	strb	r2, [r3]
	b	.L35
.L38:
	.loc 1 259 22
	nop
.L35:
	.loc 1 268 1
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L40:
	.align	2
.L39:
	.word	SeqGenDB
	.cfi_endproc
.LFE6:
	.size	AD5940_SEQGenInit, .-AD5940_SEQGenInit
	.section	.text.AD5940_SEQGenFetchSeq,"ax",%progbits
	.align	1
	.global	AD5940_SEQGenFetchSeq
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQGenFetchSeq, %function
AD5940_SEQGenFetchSeq:
.LFB7:
	.loc 1 277 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 280 5
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L42
	.loc 1 281 25
	ldr	r3, .L45
	ldr	r2, [r3, #8]
	.loc 1 281 15
	ldr	r3, [sp, #4]
	str	r2, [r3]
.L42:
	.loc 1 282 5
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L43
	.loc 1 283 24
	ldr	r3, .L45
	ldr	r2, [r3, #12]
	.loc 1 283 14
	ldr	r3, [sp]
	str	r2, [r3]
.L43:
	.loc 1 286 13
	ldr	r3, .L45
	ldr	r3, [r3, #24]
	str	r3, [sp, #12]
	.loc 1 288 10
	ldr	r3, [sp, #12]
	.loc 1 289 1
	mov	r0, r3
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L46:
	.align	2
.L45:
	.word	SeqGenDB
	.cfi_endproc
.LFE7:
	.size	AD5940_SEQGenFetchSeq, .-AD5940_SEQGenFetchSeq
	.section	.text.AD5940_SEQGenCtrl,"ax",%progbits
	.align	1
	.global	AD5940_SEQGenCtrl
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQGenCtrl, %function
AD5940_SEQGenCtrl:
.LFB8:
	.loc 1 298 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 299 5
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L48
	.loc 1 301 26
	ldr	r3, .L51
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 309 1
	b	.L50
.L48:
	.loc 1 305 21
	ldr	r3, .L51
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 306 24
	ldr	r3, .L51
	movs	r2, #0
	str	r2, [r3, #24]
	.loc 1 307 26
	ldr	r3, .L51
	movs	r2, #1
	strb	r2, [r3]
.L50:
	.loc 1 309 1
	nop
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L52:
	.align	2
.L51:
	.word	SeqGenDB
	.cfi_endproc
.LFE8:
	.size	AD5940_SEQGenCtrl, .-AD5940_SEQGenCtrl
	.section	.text.AD5940_SEQCycleTime,"ax",%progbits
	.align	1
	.global	AD5940_SEQCycleTime
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SEQCycleTime, %function
AD5940_SEQCycleTime:
.LFB9:
	.loc 1 316 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	.loc 1 318 10
	movs	r3, #0
	str	r3, [sp, #8]
	.loc 1 319 8
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 319 3
	b	.L54
.L58:
	.loc 1 321 20
	ldr	r3, .L60
	ldr	r2, [r3, #8]
	.loc 1 321 29
	ldr	r3, [sp, #12]
	lsls	r3, r3, #2
	add	r3, r3, r2
	ldr	r3, [r3]
	.loc 1 321 9
	lsrs	r3, r3, #30
	str	r3, [sp, #4]
	.loc 1 322 13
	ldr	r3, [sp, #4]
	and	r3, r3, #2
	.loc 1 322 8
	cmp	r3, #0
	beq	.L55
	.loc 1 325 14
	ldr	r3, [sp, #8]
	adds	r3, r3, #1
	str	r3, [sp, #8]
	b	.L56
.L55:
	.loc 1 329 15
	ldr	r3, [sp, #4]
	and	r3, r3, #1
	.loc 1 329 10
	cmp	r3, #0
	beq	.L57
	.loc 1 332 16
	ldr	r3, [sp, #8]
	adds	r3, r3, #1
	str	r3, [sp, #8]
	b	.L56
.L57:
	.loc 1 337 29
	ldr	r3, .L60
	ldr	r2, [r3, #8]
	.loc 1 337 38
	ldr	r3, [sp, #12]
	lsls	r3, r3, #2
	add	r3, r3, r2
	ldr	r3, [r3]
	.loc 1 337 42
	bic	r3, r3, #-1073741824
	.loc 1 337 18
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	str	r3, [sp, #8]
.L56:
	.loc 1 319 32 discriminator 2
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
.L54:
	.loc 1 319 21 discriminator 1
	ldr	r3, .L60
	ldr	r3, [r3, #20]
	.loc 1 319 12 discriminator 1
	ldr	r2, [sp, #12]
	cmp	r2, r3
	bcc	.L58
	.loc 1 341 10
	ldr	r3, [sp, #8]
	.loc 1 342 1
	mov	r0, r3
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L61:
	.align	2
.L60:
	.word	SeqGenDB
	.cfi_endproc
.LFE9:
	.size	AD5940_SEQCycleTime, .-AD5940_SEQCycleTime
	.section	.text._is_value_in_table,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	_is_value_in_table, %function
_is_value_in_table:
.LFB10:
	.loc 1 352 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
	.cfi_def_cfa_offset 24
	str	r1, [sp, #8]
	str	r3, [sp, #4]
	mov	r3, r0
	strb	r3, [sp, #15]
	mov	r3, r2
	strb	r3, [sp, #14]
.LBB2:
	.loc 1 353 11
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 353 3
	b	.L63
.L66:
	.loc 1 355 22
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 355 7
	ldrb	r2, [sp, #15]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L64
	.loc 1 357 14
	ldr	r3, [sp, #20]
	uxtb	r2, r3
	ldr	r3, [sp, #4]
	strb	r2, [r3]
	.loc 1 358 14
	movs	r3, #1
	b	.L65
.L64:
	.loc 1 353 24 discriminator 2
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
.L63:
	.loc 1 353 17 discriminator 1
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	ldr	r2, [sp, #20]
	cmp	r2, r3
	blt	.L66
.LBE2:
	.loc 1 361 10
	movs	r3, #0
.L65:
	.loc 1 362 1
	mov	r0, r3
	add	sp, sp, #24
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE10:
	.size	_is_value_in_table, .-_is_value_in_table
	.section .rodata
	.align	2
.LC11:
	.ascii	"\005\007\010\011\013"
	.align	2
.LC12:
	.ascii	"\017\014\012\011\006"
	.align	2
.LC13:
	.ascii	"\011\012\013"
	.align	2
.LC14:
	.ascii	"\022\017\014"
	.align	2
.LC15:
	.ascii	"\003\004\005\006\010\012"
	.align	2
.LC16:
	.ascii	"\022\014\006\005\004\003"
	.section	.text.AD5940_Notch50HzAvailable,"ax",%progbits
	.align	1
	.global	AD5940_Notch50HzAvailable
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_Notch50HzAvailable, %function
AD5940_Notch50HzAvailable:
.LFB11:
	.loc 1 371 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #60
	.cfi_def_cfa_offset 64
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 372 18
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 372 5
	cmp	r3, #1
	bne	.L68
	.loc 1 372 60 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 372 46 discriminator 1
	cmp	r3, #2
	beq	.L69
.L68:
	.loc 1 373 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 372 91 discriminator 3
	cmp	r3, #0
	bne	.L70
	.loc 1 373 61
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 373 47
	cmp	r3, #2
	beq	.L70
.L69:
.LBB3:
	.loc 1 378 19
	ldr	r2, .L79
	add	r3, sp, #48
	ldm	r2, {r0, r1}
	str	r0, [r3]
	adds	r3, r3, #4
	strb	r1, [r3]
	.loc 1 379 19
	ldr	r2, .L79+4
	add	r3, sp, #40
	ldm	r2, {r0, r1}
	str	r0, [r3]
	adds	r3, r3, #4
	strb	r1, [r3]
	.loc 1 381 38
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 381 8
	uxtb	r0, r3
	add	r3, sp, #39
	add	r1, sp, #48
	movs	r2, #5
	bl	_is_value_in_table
	mov	r3, r0
	.loc 1 381 7 discriminator 1
	cmp	r3, #0
	beq	.L77
	.loc 1 383 20
	ldrb	r3, [sp, #39]	@ zero_extendqisi2
	adds	r3, r3, #56
	add	r3, sp, r3
	ldrb	r2, [r3, #-16]	@ zero_extendqisi2
	.loc 1 383 11
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 384 14
	movs	r3, #1
	b	.L72
.L70:
.LBE3:
	.loc 1 387 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 387 10
	cmp	r3, #0
	bne	.L74
	.loc 1 387 64 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 387 50 discriminator 1
	cmp	r3, #2
	bne	.L74
.LBB4:
	.loc 1 391 19
	ldr	r2, .L79+8
	add	r3, sp, #36
	ldr	r2, [r2]
	mov	r1, r2	@ movhi
	strh	r1, [r3]	@ movhi
	adds	r3, r3, #2
	lsrs	r2, r2, #16
	strb	r2, [r3]
	.loc 1 392 19
	ldr	r2, .L79+12
	add	r3, sp, #32
	ldr	r2, [r2]
	mov	r1, r2	@ movhi
	strh	r1, [r3]	@ movhi
	adds	r3, r3, #2
	lsrs	r2, r2, #16
	strb	r2, [r3]
	.loc 1 394 38
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 394 8
	uxtb	r0, r3
	add	r3, sp, #31
	add	r1, sp, #36
	movs	r2, #3
	bl	_is_value_in_table
	mov	r3, r0
	.loc 1 394 7 discriminator 1
	cmp	r3, #0
	beq	.L78
	.loc 1 396 20
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	adds	r3, r3, #56
	add	r3, sp, r3
	ldrb	r2, [r3, #-24]	@ zero_extendqisi2
	.loc 1 396 11
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 397 14
	movs	r3, #1
	b	.L72
.L74:
.LBE4:
	.loc 1 400 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 400 10
	cmp	r3, #1
	bne	.L73
	.loc 1 400 64 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 400 50 discriminator 1
	cmp	r3, #2
	beq	.L73
.LBB5:
	.loc 1 404 19
	ldr	r2, .L79+16
	add	r3, sp, #24
	ldm	r2, {r0, r1}
	str	r0, [r3]
	adds	r3, r3, #4
	strh	r1, [r3]	@ movhi
	.loc 1 406 19
	ldr	r2, .L79+20
	add	r3, sp, #16
	ldm	r2, {r0, r1}
	str	r0, [r3]
	adds	r3, r3, #4
	strh	r1, [r3]	@ movhi
	.loc 1 408 38
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 408 8
	uxtb	r0, r3
	add	r3, sp, #15
	add	r1, sp, #24
	movs	r2, #6
	bl	_is_value_in_table
	mov	r3, r0
	.loc 1 408 7 discriminator 1
	cmp	r3, #0
	beq	.L73
	.loc 1 410 20
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	adds	r3, r3, #56
	add	r3, sp, r3
	ldrb	r2, [r3, #-40]	@ zero_extendqisi2
	.loc 1 410 11
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 411 14
	movs	r3, #1
	b	.L72
.L77:
.LBE5:
	.loc 1 374 3
	nop
	b	.L73
.L78:
	.loc 1 388 3
	nop
.L73:
	.loc 1 414 7
	ldr	r3, [sp]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 415 10
	movs	r3, #0
.L72:
	.loc 1 416 1
	mov	r0, r3
	add	sp, sp, #60
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L80:
	.align	2
.L79:
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.cfi_endproc
.LFE11:
	.size	AD5940_Notch50HzAvailable, .-AD5940_Notch50HzAvailable
	.section .rodata
	.align	2
.LC17:
	.ascii	"\003\004\005\007\011\013"
	.align	2
.LC18:
	.ascii	"\017\012\005\004\003\002"
	.section	.text.AD5940_Notch60HzAvailable,"ax",%progbits
	.align	1
	.global	AD5940_Notch60HzAvailable
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_Notch60HzAvailable, %function
AD5940_Notch60HzAvailable:
.LFB12:
	.loc 1 425 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #52
	.cfi_def_cfa_offset 56
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 426 18
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 426 5
	cmp	r3, #1
	bne	.L82
	.loc 1 426 60 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 426 46 discriminator 1
	cmp	r3, #2
	beq	.L83
.L82:
	.loc 1 427 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 426 91 discriminator 3
	cmp	r3, #0
	bne	.L84
	.loc 1 427 61
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 427 47
	cmp	r3, #2
	beq	.L84
.L83:
.LBB6:
	.loc 1 432 19
	movw	r3, #2823
	strh	r3, [sp, #44]	@ movhi
	.loc 1 433 19
	movw	r3, #1290
	strh	r3, [sp, #40]	@ movhi
	.loc 1 435 38
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 435 8
	uxtb	r0, r3
	add	r3, sp, #39
	add	r1, sp, #44
	movs	r2, #2
	bl	_is_value_in_table
	mov	r3, r0
	.loc 1 435 7 discriminator 1
	cmp	r3, #0
	beq	.L91
	.loc 1 437 20
	ldrb	r3, [sp, #39]	@ zero_extendqisi2
	adds	r3, r3, #48
	add	r3, sp, r3
	ldrb	r2, [r3, #-8]	@ zero_extendqisi2
	.loc 1 437 11
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 438 14
	movs	r3, #1
	b	.L86
.L84:
.LBE6:
	.loc 1 441 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 441 10
	cmp	r3, #0
	bne	.L88
	.loc 1 441 64 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 441 50 discriminator 1
	cmp	r3, #2
	bne	.L88
.LBB7:
	.loc 1 445 19
	movw	r3, #2825
	strh	r3, [sp, #36]	@ movhi
	.loc 1 446 19
	movw	r3, #2575
	strh	r3, [sp, #32]	@ movhi
	.loc 1 448 38
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 448 8
	uxtb	r0, r3
	add	r3, sp, #31
	add	r1, sp, #36
	movs	r2, #2
	bl	_is_value_in_table
	mov	r3, r0
	.loc 1 448 7 discriminator 1
	cmp	r3, #0
	beq	.L92
	.loc 1 450 20
	ldrb	r3, [sp, #31]	@ zero_extendqisi2
	adds	r3, r3, #48
	add	r3, sp, r3
	ldrb	r2, [r3, #-16]	@ zero_extendqisi2
	.loc 1 450 11
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 451 14
	movs	r3, #1
	b	.L86
.L88:
.LBE7:
	.loc 1 454 22
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 454 10
	cmp	r3, #1
	bne	.L87
	.loc 1 454 64 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 454 50 discriminator 1
	cmp	r3, #2
	beq	.L87
.LBB8:
	.loc 1 458 19
	ldr	r2, .L93
	add	r3, sp, #24
	ldm	r2, {r0, r1}
	str	r0, [r3]
	adds	r3, r3, #4
	strh	r1, [r3]	@ movhi
	.loc 1 460 19
	ldr	r2, .L93+4
	add	r3, sp, #16
	ldm	r2, {r0, r1}
	str	r0, [r3]
	adds	r3, r3, #4
	strh	r1, [r3]	@ movhi
	.loc 1 462 38
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 462 8
	uxtb	r0, r3
	add	r3, sp, #15
	add	r1, sp, #24
	movs	r2, #6
	bl	_is_value_in_table
	mov	r3, r0
	.loc 1 462 7 discriminator 1
	cmp	r3, #0
	beq	.L87
	.loc 1 464 20
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	adds	r3, r3, #48
	add	r3, sp, r3
	ldrb	r2, [r3, #-32]	@ zero_extendqisi2
	.loc 1 464 11
	ldr	r3, [sp]
	strb	r2, [r3]
	.loc 1 465 14
	movs	r3, #1
	b	.L86
.L91:
.LBE8:
	.loc 1 428 3
	nop
	b	.L87
.L92:
	.loc 1 442 3
	nop
.L87:
	.loc 1 468 7
	ldr	r3, [sp]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 469 10
	movs	r3, #0
.L86:
	.loc 1 470 1
	mov	r0, r3
	add	sp, sp, #52
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L94:
	.align	2
.L93:
	.word	.LC17
	.word	.LC18
	.cfi_endproc
.LFE12:
	.size	AD5940_Notch60HzAvailable, .-AD5940_Notch60HzAvailable
	.global	__aeabi_ui2f
	.global	__aeabi_fmul
	.global	__aeabi_f2uiz
	.global	__aeabi_fadd
	.section .rodata
	.align	2
.LC0:
	.word	22
	.word	44
	.word	89
	.word	178
	.word	267
	.word	533
	.word	640
	.word	667
	.word	800
	.word	889
	.word	1067
	.word	1333
	.word	0
	.align	2
.LC1:
	.word	5
	.word	4
	.word	2
	.word	0
	.section	.text.AD5940_ClksCalculate,"ax",%progbits
	.align	1
	.global	AD5940_ClksCalculate
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ClksCalculate, %function
AD5940_ClksCalculate:
.LFB13:
	.loc 1 481 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #116
	.cfi_def_cfa_offset 128
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 482 12
	movs	r3, #0
	str	r3, [sp, #104]
	.loc 1 483 18
	ldr	r3, .L129
	add	r4, sp, #52
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [r5]
	str	r3, [r4]
	.loc 1 484 18
	ldr	r3, .L129+4
	add	r4, sp, #36
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	.loc 1 486 12
	ldr	r3, [sp]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 487 5
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L122
	.loc 1 488 5
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L123
	.loc 1 489 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 489 5
	cmp	r3, #11
	bhi	.L124
	.loc 1 490 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 490 5
	cmp	r3, #2
	bhi	.L125
	.loc 1 491 17
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 491 5
	cmp	r3, #3
	bhi	.L126
	.loc 1 492 21
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 492 3
	cmp	r3, #4
	bhi	.L127
	adr	r2, .L104
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L104:
	.word	.L108+1
	.word	.L107+1
	.word	.L106+1
	.word	.L105+1
	.word	.L103+1
	.p2align 1
.L108:
	.loc 1 495 39
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]
	.loc 1 495 27
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #2
	.loc 1 495 50
	mov	r0, r3
	bl	__aeabi_ui2f
	mov	r2, r0
	.loc 1 495 62
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #28]	@ float
	.loc 1 495 50
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 495 14
	mov	r0, r3
	bl	__aeabi_f2uiz
	mov	r3, r0
	.loc 1 495 12
	str	r3, [sp, #104]
	.loc 1 496 7
	b	.L109
.L107:
	.loc 1 498 38
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]
	.loc 1 498 96
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r2, r3, #40
	.loc 1 498 79
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 498 67
	lsls	r3, r3, #2
	adds	r3, r3, #112
	add	r3, sp, r3
	ldr	r3, [r3, #-76]
	.loc 1 498 96
	mul	r3, r2, r3
	adds	r3, r3, #20
	.loc 1 498 99
	mov	r0, r3
	bl	__aeabi_ui2f
	mov	r2, r0
	.loc 1 498 111
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #28]	@ float
	.loc 1 498 99
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 498 129
	mov	r1, #1056964608
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	.loc 1 498 14
	mov	r0, r3
	bl	__aeabi_f2uiz
	mov	r3, r0
	.loc 1 498 12
	str	r3, [sp, #104]
	.loc 1 499 7
	b	.L109
.L106:
	.loc 1 501 26
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 501 37
	adds	r2, r3, #1
	.loc 1 501 67
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 501 55
	lsls	r3, r3, #2
	adds	r3, r3, #112
	add	r3, sp, r3
	ldr	r3, [r3, #-60]
	.loc 1 501 40
	mul	r3, r2, r3
	.loc 1 501 82
	adds	r3, r3, #1
	.loc 1 501 12
	str	r3, [sp, #104]
	.loc 1 502 29
	ldr	r3, [sp, #4]
	movs	r2, #1
	str	r2, [r3]
	.loc 1 503 30
	ldr	r2, [sp, #104]
	ldr	r3, [sp, #4]
	str	r2, [r3, #4]
	.loc 1 504 7
	add	r3, sp, #104
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	AD5940_ClksCalculate
	.loc 1 505 29
	ldr	r3, [sp, #4]
	movs	r2, #2
	str	r2, [r3]
	.loc 1 506 12
	ldr	r3, [sp, #104]
	adds	r3, r3, #15
	str	r3, [sp, #104]
	.loc 1 507 7
	b	.L109
.L103:
.LBB9:
	.loc 1 511 35
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	.loc 1 511 22
	str	r3, [sp, #24]
	.loc 1 512 39
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 512 26
	str	r3, [sp, #12]
	.loc 1 513 39
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 513 26
	str	r3, [sp, #16]
	.loc 1 514 15
	movs	r3, #0
	strb	r3, [sp, #111]
	.loc 1 515 10
	add	r2, sp, #11
	add	r3, sp, #12
	mov	r1, r2
	mov	r0, r3
	bl	AD5940_Notch50HzAvailable
	mov	r3, r0
	.loc 1 515 9 discriminator 1
	cmp	r3, #0
	beq	.L110
	.loc 1 516 12
	ldrb	r2, [sp, #11]	@ zero_extendqisi2
	ldrb	r3, [sp, #111]
	add	r3, r3, r2
	uxtb	r3, r3
	subs	r3, r3, #1
	strb	r3, [sp, #111]
.L110:
	.loc 1 518 10
	add	r2, sp, #10
	add	r3, sp, #12
	mov	r1, r2
	mov	r0, r3
	bl	AD5940_Notch60HzAvailable
	mov	r3, r0
	.loc 1 518 9 discriminator 1
	cmp	r3, #0
	beq	.L111
	.loc 1 519 12
	ldrb	r2, [sp, #10]	@ zero_extendqisi2
	ldrb	r3, [sp, #111]
	add	r3, r3, r2
	uxtb	r3, r3
	subs	r3, r3, #1
	strb	r3, [sp, #111]
.L111:
	.loc 1 521 29
	ldr	r3, [sp, #4]
	movs	r2, #2
	str	r2, [r3]
	.loc 1 522 18
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]
	.loc 1 522 30
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	add	r2, r2, r3
	ldr	r3, [sp, #4]
	str	r2, [r3, #4]
	.loc 1 523 7
	add	r3, sp, #104
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	AD5940_ClksCalculate
	.loc 1 525 29
	ldr	r3, [sp, #4]
	movs	r2, #4
	str	r2, [r3]
	.loc 1 526 18
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]
	.loc 1 526 30
	ldrb	r3, [sp, #111]	@ zero_extendqisi2
	subs	r2, r2, r3
	ldr	r3, [sp, #4]
	str	r2, [r3, #4]
	.loc 1 527 7
	b	.L109
.L105:
.LBE9:
	.loc 1 530 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 530 7
	cmp	r3, #3
	bhi	.L128
	adr	r2, .L114
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L114:
	.word	.L117+1
	.word	.L116+1
	.word	.L115+1
	.word	.L113+1
	.p2align 1
.L115:
	.loc 1 533 33
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 534 11
	add	r3, sp, #104
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	AD5940_ClksCalculate
	.loc 1 535 11
	b	.L118
.L116:
	.loc 1 537 33
	ldr	r3, [sp, #4]
	movs	r2, #1
	str	r2, [r3]
	.loc 1 538 11
	add	r3, sp, #104
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	AD5940_ClksCalculate
	.loc 1 539 11
	b	.L118
.L117:
	.loc 1 541 25
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	.loc 1 541 13
	cmp	r3, #0
	beq	.L119
	.loc 1 542 35
	ldr	r3, [sp, #4]
	movs	r2, #2
	str	r2, [r3]
	b	.L120
.L119:
	.loc 1 544 35
	ldr	r3, [sp, #4]
	movs	r2, #4
	str	r2, [r3]
.L120:
	.loc 1 545 11
	add	r3, sp, #104
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	AD5940_ClksCalculate
	.loc 1 546 11
	b	.L118
.L113:
	.loc 1 548 33
	ldr	r3, [sp, #4]
	movs	r2, #1
	str	r2, [r3]
	.loc 1 549 22
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]
	.loc 1 549 53
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 549 64
	adds	r3, r3, #1
	.loc 1 549 34
	lsls	r2, r2, r3
	ldr	r3, [sp, #4]
	str	r2, [r3, #4]
	.loc 1 550 11
	add	r3, sp, #104
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	AD5940_ClksCalculate
	.loc 1 551 11
	b	.L118
.L128:
	.loc 1 553 11
	nop
.L118:
	.loc 1 555 29
	ldr	r3, [sp, #4]
	movs	r2, #3
	str	r2, [r3]
	.loc 1 556 12
	ldr	r3, [sp, #104]
	adds	r3, r3, #25
	str	r3, [sp, #104]
	.loc 1 557 7
	b	.L109
.L127:
	.loc 1 559 5
	nop
.L109:
	.loc 1 561 12
	ldr	r2, [sp, #104]
	ldr	r3, [sp]
	str	r2, [r3]
	b	.L95
.L122:
	.loc 1 487 27
	nop
	b	.L95
.L123:
	.loc 1 488 23
	nop
	b	.L95
.L124:
	.loc 1 489 51
	nop
	b	.L95
.L125:
	.loc 1 490 37
	nop
	b	.L95
.L126:
	.loc 1 491 45
	nop
.L95:
	.loc 1 562 1
	add	sp, sp, #116
	.cfi_def_cfa_offset 12
	@ sp needed
	pop	{r4, r5, pc}
.L130:
	.align	2
.L129:
	.word	.LC0
	.word	.LC1
	.cfi_endproc
.LFE13:
	.size	AD5940_ClksCalculate, .-AD5940_ClksCalculate
	.global	__aeabi_fcmplt
	.global	__aeabi_f2d
	.global	__aeabi_ui2d
	.global	__aeabi_fdiv
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2f
	.global	__aeabi_fsub
	.global	__aeabi_dadd
	.section	.text.AD5940_SweepNext,"ax",%progbits
	.align	1
	.global	AD5940_SweepNext
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_SweepNext, %function
AD5940_SweepNext:
.LFB14:
	.loc 1 570 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.cfi_def_cfa_offset 28
	.cfi_offset 4, -28
	.cfi_offset 5, -24
	.cfi_offset 6, -20
	.cfi_offset 7, -16
	.cfi_offset 8, -12
	.cfi_offset 9, -8
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 48
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 573 16
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	.loc 1 573 6
	cmp	r3, #0
	beq	.L132
	.loc 1 575 19
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]	@ float
	.loc 1 575 41
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]	@ float
	.loc 1 575 9
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L144
	.loc 1 577 24
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 577 13
	adds	r2, r3, #1
	.loc 1 577 12
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
	.loc 1 577 24
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #20]
	.loc 1 577 49
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 577 12
	cmp	r2, r3
	bne	.L135
	.loc 1 578 35
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #20]
.L135:
	.loc 1 579 31
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r4, r0
	mov	r5, r1
	.loc 1 579 60
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 579 72
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r6, r0
	mov	r7, r1
	.loc 1 579 88
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]	@ float
	.loc 1 579 109
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 579 99
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	.loc 1 579 73
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	log10
	mov	r2, r0
	mov	r3, r1
	.loc 1 579 72 discriminator 1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	.loc 1 579 133 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 579 146 discriminator 1
	subs	r3, r3, #1
	.loc 1 579 44 discriminator 1
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L146
	bl	pow
	mov	r2, r0
	mov	r3, r1
	.loc 1 579 43 discriminator 2
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	.loc 1 579 20 discriminator 2
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [sp, #12]	@ float
	b	.L136
.L144:
	.loc 1 583 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 583 32
	subs	r2, r3, #1
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
	.loc 1 584 22
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #20]
	.loc 1 584 47
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 584 12
	cmp	r2, r3
	bcc	.L137
	.loc 1 585 46
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 585 59
	subs	r2, r3, #1
	.loc 1 585 35
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
.L137:
	.loc 1 586 31
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r4, r0
	mov	r5, r1
	.loc 1 586 59
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 586 43
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r6, r0
	mov	r7, r1
	.loc 1 587 54
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]	@ float
	.loc 1 587 76
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]	@ float
	.loc 1 587 66
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	.loc 1 587 39
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	log10
	mov	r8, r0
	mov	r9, r1
	.loc 1 587 99 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 587 112 discriminator 1
	subs	r3, r3, #1
	.loc 1 587 88 discriminator 1
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	.loc 1 586 43
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L146
	bl	pow
	mov	r2, r0
	mov	r3, r1
	.loc 1 586 42 discriminator 1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	.loc 1 586 20 discriminator 1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [sp, #12]	@ float
	b	.L136
.L132:
	.loc 1 592 19
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]	@ float
	.loc 1 592 41
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]	@ float
	.loc 1 592 9
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L145
	.loc 1 594 24
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 594 13
	adds	r2, r3, #1
	.loc 1 594 12
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
	.loc 1 594 24
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #20]
	.loc 1 594 49
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 594 12
	cmp	r2, r3
	bne	.L140
	.loc 1 595 35
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #20]
.L140:
	.loc 1 596 31
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r4, r0
	mov	r5, r1
	.loc 1 596 55
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 596 67
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r6, r0
	mov	r7, r1
	.loc 1 596 86
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]	@ float
	.loc 1 596 107
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 596 97
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fsub
	mov	r3, r0
	.loc 1 596 68
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	.loc 1 596 67
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	.loc 1 596 131
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 596 144
	subs	r3, r3, #1
	.loc 1 596 120
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	.loc 1 596 44
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	.loc 1 596 20
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [sp, #12]	@ float
	b	.L136
.L145:
	.loc 1 600 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 600 32
	subs	r2, r3, #1
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
	.loc 1 601 22
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #20]
	.loc 1 601 47
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 601 12
	cmp	r2, r3
	bcc	.L141
	.loc 1 602 46
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 602 59
	subs	r2, r3, #1
	.loc 1 602 35
	ldr	r3, [sp, #4]
	str	r2, [r3, #20]
.L141:
	.loc 1 603 31
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r4, r0
	mov	r5, r1
	.loc 1 603 54
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 603 66
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r6, r0
	mov	r7, r1
	.loc 1 603 85
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]	@ float
	.loc 1 603 109
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]	@ float
	.loc 1 603 98
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fsub
	mov	r3, r0
	.loc 1 603 67
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	.loc 1 603 66
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	.loc 1 603 132
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	.loc 1 603 145
	subs	r3, r3, #1
	.loc 1 603 121
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	.loc 1 603 43
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	.loc 1 603 20
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [sp, #12]	@ float
.L136:
	.loc 1 607 15
	ldr	r3, [sp]
	ldr	r2, [sp, #12]	@ float
	str	r2, [r3]	@ float
	.loc 1 608 1
	nop
	add	sp, sp, #20
	.cfi_def_cfa_offset 28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L147:
	.align	2
.L146:
	.word	1076101120
	.cfi_endproc
.LFE14:
	.size	AD5940_SweepNext, .-AD5940_SweepNext
	.section	.text.AD5940_StructInit,"ax",%progbits
	.align	1
	.global	AD5940_StructInit
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_StructInit, %function
AD5940_StructInit:
.LFB15:
	.loc 1 617 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 618 3
	ldr	r2, [sp]
	movs	r1, #0
	ldr	r0, [sp, #4]
	bl	memset
	.loc 1 619 1
	nop
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE15:
	.size	AD5940_StructInit, .-AD5940_StructInit
	.global	__aeabi_i2f
	.section	.text.AD5940_ADCCode2Volt,"ax",%progbits
	.align	1
	.global	AD5940_ADCCode2Volt
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ADCCode2Volt, %function
AD5940_ADCCode2Volt:
.LFB16:
	.loc 1 629 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #36
	.cfi_def_cfa_offset 40
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]	@ float
	.loc 1 630 9
	ldr	r3, .L160
	str	r3, [sp, #24]	@ float
	.loc 1 631 9
	mov	r3, #0
	str	r3, [sp, #20]	@ float
	.loc 1 632 9
	mov	r3, #0
	str	r3, [sp, #28]	@ float
	.loc 1 633 9
	ldr	r3, [sp, #12]
	.loc 1 633 23
	sub	r3, r3, #32768
	.loc 1 633 7
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	str	r3, [sp, #28]	@ float
	.loc 1 634 3
	ldr	r3, [sp, #8]
	cmp	r3, #4
	bhi	.L159
	adr	r2, .L152
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L152:
	.word	.L159+1
	.word	.L155+1
	.word	.L154+1
	.word	.L153+1
	.word	.L151+1
	.p2align 1
.L155:
	.loc 1 639 9
	mov	r1, #1069547520
	ldr	r0, [sp, #28]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [sp, #28]	@ float
	.loc 1 640 5
	b	.L157
.L154:
	.loc 1 642 9
	mov	r1, #1073741824
	ldr	r0, [sp, #28]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [sp, #28]	@ float
	.loc 1 643 5
	b	.L157
.L153:
	.loc 1 645 9
	mov	r1, #1082130432
	ldr	r0, [sp, #28]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [sp, #28]	@ float
	.loc 1 646 5
	b	.L157
.L151:
	.loc 1 648 9
	ldr	r1, .L160+4
	ldr	r0, [sp, #28]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [sp, #28]	@ float
	.loc 1 649 5
	b	.L157
.L159:
	.loc 1 650 11
	nop
.L157:
	.loc 1 652 14
	ldr	r1, [sp, #4]	@ float
	ldr	r0, [sp, #28]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 652 23
	mov	r1, #1191182336
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	.loc 1 652 9
	mov	r1, r3
	ldr	r0, [sp, #24]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [sp, #20]	@ float
	.loc 1 653 10
	ldr	r3, [sp, #20]	@ float
	.loc 1 654 1
	mov	r0, r3
	add	sp, sp, #36
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L161:
	.align	2
.L160:
	.word	1065422353
	.word	1091567616
	.cfi_endproc
.LFE16:
	.size	AD5940_ADCCode2Volt, .-AD5940_ADCCode2Volt
	.section	.text.AD5940_ComplexDivFloat,"ax",%progbits
	.align	1
	.global	AD5940_ComplexDivFloat
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ComplexDivFloat, %function
AD5940_ComplexDivFloat:
.LFB17:
	.loc 1 663 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #32
	.cfi_def_cfa_offset 40
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 666 11
	ldr	r3, [sp, #4]
	ldr	r2, [r3]	@ float
	.loc 1 666 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3]	@ float
	.loc 1 666 17
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	.loc 1 666 29
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]	@ float
	.loc 1 666 38
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 666 36
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 666 8
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [sp, #28]	@ float
	.loc 1 667 15
	ldr	r3, [sp, #8]
	ldr	r2, [r3]	@ float
	.loc 1 667 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3]	@ float
	.loc 1 667 21
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	.loc 1 667 33
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #4]	@ float
	.loc 1 667 42
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 667 40
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 667 30
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	.loc 1 667 12
	str	r3, [sp, #20]	@ float
	.loc 1 668 6
	ldr	r3, [sp, #20]	@ float
	.loc 1 668 12
	ldr	r1, [sp, #28]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [sp, #20]	@ float
	.loc 1 669 16
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #4]	@ float
	.loc 1 669 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3]	@ float
	.loc 1 669 23
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	.loc 1 669 35
	ldr	r3, [sp, #8]
	ldr	r2, [r3]	@ float
	.loc 1 669 43
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 669 41
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 669 32
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	.loc 1 669 13
	str	r3, [sp, #24]	@ float
	.loc 1 670 6
	ldr	r3, [sp, #24]	@ float
	.loc 1 670 13
	ldr	r1, [sp, #28]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [sp, #24]	@ float
	.loc 1 671 10
	ldr	r3, [sp, #12]
	mov	r2, r3
	add	r3, sp, #20
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	.loc 1 672 1
	ldr	r0, [sp, #12]
	add	sp, sp, #32
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
	.cfi_endproc
.LFE17:
	.size	AD5940_ComplexDivFloat, .-AD5940_ComplexDivFloat
	.section	.text.AD5940_ComplexMulFloat,"ax",%progbits
	.align	1
	.global	AD5940_ComplexMulFloat
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ComplexMulFloat, %function
AD5940_ComplexMulFloat:
.LFB18:
	.loc 1 681 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 684 15
	ldr	r3, [sp, #8]
	ldr	r2, [r3]	@ float
	.loc 1 684 23
	ldr	r3, [sp, #4]
	ldr	r3, [r3]	@ float
	.loc 1 684 21
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	.loc 1 684 33
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #4]	@ float
	.loc 1 684 42
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 684 40
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 684 30
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	.loc 1 684 12
	str	r3, [sp, #16]	@ float
	.loc 1 685 16
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #4]	@ float
	.loc 1 685 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3]	@ float
	.loc 1 685 23
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	.loc 1 685 35
	ldr	r3, [sp, #8]
	ldr	r2, [r3]	@ float
	.loc 1 685 43
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 685 41
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 685 32
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	.loc 1 685 13
	str	r3, [sp, #20]	@ float
	.loc 1 687 10
	ldr	r3, [sp, #12]
	mov	r2, r3
	add	r3, sp, #16
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	.loc 1 688 1
	ldr	r0, [sp, #12]
	add	sp, sp, #24
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
	.cfi_endproc
.LFE18:
	.size	AD5940_ComplexMulFloat, .-AD5940_ComplexMulFloat
	.section	.text.AD5940_ComplexAddFloat,"ax",%progbits
	.align	1
	.global	AD5940_ComplexAddFloat
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ComplexAddFloat, %function
AD5940_ComplexAddFloat:
.LFB19:
	.loc 1 696 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 32
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 699 15
	ldr	r3, [sp, #8]
	ldr	r2, [r3]	@ float
	.loc 1 699 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3]	@ float
	.loc 1 699 22
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	.loc 1 699 12
	str	r3, [sp, #16]	@ float
	.loc 1 700 16
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #4]	@ float
	.loc 1 700 27
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 700 24
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	.loc 1 700 13
	str	r3, [sp, #20]	@ float
	.loc 1 702 10
	ldr	r3, [sp, #12]
	mov	r2, r3
	add	r3, sp, #16
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	.loc 1 703 1
	ldr	r0, [sp, #12]
	add	sp, sp, #28
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE19:
	.size	AD5940_ComplexAddFloat, .-AD5940_ComplexAddFloat
	.section	.text.AD5940_ComplexSubFloat,"ax",%progbits
	.align	1
	.global	AD5940_ComplexSubFloat
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ComplexSubFloat, %function
AD5940_ComplexSubFloat:
.LFB20:
	.loc 1 712 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 32
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 715 15
	ldr	r3, [sp, #8]
	ldr	r2, [r3]	@ float
	.loc 1 715 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3]	@ float
	.loc 1 715 22
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fsub
	mov	r3, r0
	.loc 1 715 12
	str	r3, [sp, #16]	@ float
	.loc 1 716 16
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #4]	@ float
	.loc 1 716 27
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 716 24
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fsub
	mov	r3, r0
	.loc 1 716 13
	str	r3, [sp, #20]	@ float
	.loc 1 718 10
	ldr	r3, [sp, #12]
	mov	r2, r3
	add	r3, sp, #16
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	.loc 1 719 1
	ldr	r0, [sp, #12]
	add	sp, sp, #28
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE20:
	.size	AD5940_ComplexSubFloat, .-AD5940_ComplexSubFloat
	.section	.text.AD5940_ComplexDivInt,"ax",%progbits
	.align	1
	.global	AD5940_ComplexDivInt
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ComplexDivInt, %function
AD5940_ComplexDivInt:
.LFB21:
	.loc 1 728 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #36
	.cfi_def_cfa_offset 48
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 731 18
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 731 10
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 731 26
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 731 24
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	.loc 1 731 43
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 731 35
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 731 52
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 731 50
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 731 8
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [sp, #28]	@ float
	.loc 1 732 22
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	.loc 1 732 14
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 732 30
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 732 28
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	.loc 1 732 47
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	.loc 1 732 39
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 732 56
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 732 54
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 732 37
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r3, r0
	.loc 1 732 12
	str	r3, [sp, #20]	@ float
	.loc 1 733 6
	ldr	r3, [sp, #20]	@ float
	.loc 1 733 12
	ldr	r1, [sp, #28]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [sp, #20]	@ float
	.loc 1 734 23
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	.loc 1 734 15
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 734 32
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 734 30
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	.loc 1 734 49
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	.loc 1 734 41
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 734 57
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 734 55
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 734 39
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fsub
	mov	r3, r0
	.loc 1 734 13
	str	r3, [sp, #24]	@ float
	.loc 1 735 6
	ldr	r3, [sp, #24]	@ float
	.loc 1 735 13
	ldr	r1, [sp, #28]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [sp, #24]	@ float
	.loc 1 736 10
	ldr	r3, [sp, #12]
	mov	r2, r3
	add	r3, sp, #20
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	.loc 1 737 1
	ldr	r0, [sp, #12]
	add	sp, sp, #36
	.cfi_def_cfa_offset 12
	@ sp needed
	pop	{r4, r5, pc}
	.cfi_endproc
.LFE21:
	.size	AD5940_ComplexDivInt, .-AD5940_ComplexDivInt
	.section	.text.AD5940_ComplexMulInt,"ax",%progbits
	.align	1
	.global	AD5940_ComplexMulInt
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ComplexMulInt, %function
AD5940_ComplexMulInt:
.LFB22:
	.loc 1 746 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 40
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 749 22
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	.loc 1 749 14
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 749 30
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 749 28
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	.loc 1 749 47
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	.loc 1 749 39
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 749 56
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 749 54
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 749 37
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fsub
	mov	r3, r0
	.loc 1 749 12
	str	r3, [sp, #16]	@ float
	.loc 1 750 23
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	.loc 1 750 15
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 750 32
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 750 30
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	.loc 1 750 49
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	.loc 1 750 41
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r4, r0
	.loc 1 750 57
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 750 55
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 750 39
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r3, r0
	.loc 1 750 13
	str	r3, [sp, #20]	@ float
	.loc 1 752 10
	ldr	r3, [sp, #12]
	mov	r2, r3
	add	r3, sp, #16
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	.loc 1 753 1
	ldr	r0, [sp, #12]
	add	sp, sp, #28
	.cfi_def_cfa_offset 12
	@ sp needed
	pop	{r4, r5, pc}
	.cfi_endproc
.LFE22:
	.size	AD5940_ComplexMulInt, .-AD5940_ComplexMulInt
	.section	.text.AD5940_ComplexMag,"ax",%progbits
	.align	1
	.global	AD5940_ComplexMag
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ComplexMag, %function
AD5940_ComplexMag:
.LFB23:
	.loc 1 761 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 762 16
	ldr	r3, [sp, #4]
	ldr	r2, [r3]	@ float
	.loc 1 762 24
	ldr	r3, [sp, #4]
	ldr	r3, [r3]	@ float
	.loc 1 762 22
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	.loc 1 762 34
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #4]	@ float
	.loc 1 762 43
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]	@ float
	.loc 1 762 41
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	.loc 1 762 31
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	.loc 1 762 10
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sqrt
	mov	r2, r0
	mov	r3, r1
	.loc 1 762 10 is_stmt 0 discriminator 1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	.loc 1 763 1 is_stmt 1
	mov	r0, r3
	add	sp, sp, #8
	.cfi_def_cfa_offset 8
	@ sp needed
	pop	{r4, pc}
	.cfi_endproc
.LFE23:
	.size	AD5940_ComplexMag, .-AD5940_ComplexMag
	.section	.text.AD5940_ComplexPhase,"ax",%progbits
	.align	1
	.global	AD5940_ComplexPhase
	.syntax unified
	.thumb
	.thumb_func
	.type	AD5940_ComplexPhase, %function
AD5940_ComplexPhase:
.LFB24:
	.loc 1 771 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 