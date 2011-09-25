	.file	"main.c"
@ GNU C version 3.3.2 (arm-thumb-elf)
@	compiled by GNU C version 3.3.1 (cygming special).
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -fpreprocessed -mthumb-interwork -mlong-calls
@ -auxbase-strip -O2 -Wall -fverbose-asm
@ options enabled:  -fdefer-pop -fomit-frame-pointer
@ -foptimize-sibling-calls -fcse-follow-jumps -fcse-skip-blocks
@ -fexpensive-optimizations -fthread-jumps -fstrength-reduce -fpeephole
@ -fforce-mem -ffunction-cse -fkeep-static-consts -fcaller-saves
@ -freg-struct-return -fgcse -fgcse-lm -fgcse-sm -floop-optimize
@ -fcrossjumping -fif-conversion -fif-conversion2 -frerun-cse-after-loop
@ -frerun-loop-opt -fdelete-null-pointer-checks -fschedule-insns
@ -fschedule-insns2 -fsched-interblock -fsched-spec -fbranch-count-reg
@ -freorder-blocks -freorder-functions -fcprop-registers -fcommon
@ -fverbose-asm -fgnu-linker -fregmove -foptimize-register-move
@ -fargument-alias -fstrict-aliasing -fmerge-constants
@ -fzero-initialized-in-bss -fident -fpeephole2 -fguess-branch-probability
@ -fmath-errno -ftrapping-math -mapcs -mapcs-frame -mapcs-32 -msoft-float
@ -mthumb-interwork -mlong-calls

	.global	videoBuffer
	.data
	.align	2
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.global	scanlineCounter
	.align	2
	.type	scanlineCounter, %object
	.size	scanlineCounter, 4
scanlineCounter:
	.word	67108870
	.global	rawButtons
	.align	2
	.type	rawButtons, %object
	.size	rawButtons, 4
rawButtons:
	.word	67109168
	.global	hOff
	.bss
	.global	hOff
	.align	2
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.global	vOff
	.global	vOff
	.align	2
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.global	playerRow
	.data
	.align	2
	.type	playerRow, %object
	.size	playerRow, 4
playerRow:
	.word	40
	.global	playerCol
	.align	2
	.type	playerCol, %object
	.size	playerCol, 4
playerCol:
	.word	30
	.global	playerWidth
	.align	2
	.type	playerWidth, %object
	.size	playerWidth, 4
playerWidth:
	.word	14
	.global	playerHeight
	.align	2
	.type	playerHeight, %object
	.size	playerHeight, 4
playerHeight:
	.word	16
	.global	playerRVel
	.align	2
	.type	playerRVel, %object
	.size	playerRVel, 4
playerRVel:
	.word	1
	.global	playerCVel
	.align	2
	.type	playerCVel, %object
	.size	playerCVel, 4
playerCVel:
	.word	1
	.global	badguyRow
	.align	2
	.type	badguyRow, %object
	.size	badguyRow, 4
badguyRow:
	.word	440
	.global	badguyCol
	.align	2
	.type	badguyCol, %object
	.size	badguyCol, 4
badguyCol:
	.word	256
	.global	badguyWidth
	.align	2
	.type	badguyWidth, %object
	.size	badguyWidth, 4
badguyWidth:
	.word	12
	.global	badguyHeight
	.align	2
	.type	badguyHeight, %object
	.size	badguyHeight, 4
badguyHeight:
	.word	32
	.global	badguyRVel
	.align	2
	.type	badguyRVel, %object
	.size	badguyRVel, 4
badguyRVel:
	.word	1
	.global	badguyCVel
	.align	2
	.type	badguyCVel, %object
	.size	badguyCVel, 4
badguyCVel:
	.word	1
	.global	collMapSize
	.align	2
	.type	collMapSize, %object
	.size	collMapSize, 4
collMapSize:
	.word	512
	.global	vblankcountA
	.bss
	.global	vblankcountA
	.align	2
	.type	vblankcountA, %object
	.size	vblankcountA, 4
vblankcountA:
	.space	4
	.global	vblankcountB
	.global	vblankcountB
	.align	2
	.type	vblankcountB, %object
	.size	vblankcountB, 4
vblankcountB:
	.space	4
	.global	timerintervalA
	.data
	.align	2
	.type	timerintervalA, %object
	.size	timerintervalA, 4
timerintervalA:
	.word	-380
	.global	timerintervalB
	.align	2
	.type	timerintervalB, %object
	.size	timerintervalB, 4
timerintervalB:
	.word	-1521
	.global	numvblanksA
	.align	2
	.type	numvblanksA, %object
	.size	numvblanksA, 4
numvblanksA:
	.word	1493
	.global	numvblanksB
	.align	2
	.type	numvblanksB, %object
	.size	numvblanksB, 4
numvblanksB:
	.word	227
	.global	play
	.align	2
	.type	play, %object
	.size	play, 4
play:
	.word	1
	.global	walkCounter
	.align	2
	.type	walkCounter, %object
	.size	walkCounter, 4
walkCounter:
	.word	1
	.global	spriteState
	.bss
	.global	spriteState
	.align	2
	.type	spriteState, %object
	.size	spriteState, 4
spriteState:
	.space	4
	.global	state
	.global	state
	.align	2
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	ldr	r5, .L72
	ldr	r4, .L72+4
	ldr	r6, .L72+8
	ldr	sl, .L72+12
	ldr	r8, .L72+16
	sub	fp, ip, #4
	mov	r7, #67108864
.L64:
	ldr	r0, .L72+20
	ldr	r3, [r0, #0]	@  spriteState
	ldr	r1, .L72+24
	str	r3, [r5, #0]	@  previousSpriteState
	mov	lr, pc
	bx	r1
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	ldr	r2, .L72+28
	ldr	r3, [r2, #0]	@  state
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L64
	.p2align 2
.L59:
	.word	.L6
	.word	.L9
	.word	.L11
	.word	.L53
	.word	.L57
.L6:
	mov	r3, #1024
	add	r3, r3, #3
	strh	r3, [r7, #0]	@ movhi 
	ldr	r0, .L72+32
	mov	lr, pc
	bx	sl
	ldr	ip, .L72+36
	ldr	r3, [ip, #0]	@  lastButtons
	tst	r3, #8
	bne	.L7
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #8
	ldrne	lr, .L72+28
	movne	r3, #2
	strne	r3, [lr, #0]	@  state
.L7:
	ldr	r0, .L72+36
	ldr	r3, [r0, #0]	@  lastButtons
	tst	r3, #4
	bne	.L64
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #4
	movne	r3, #1
	beq	.L64
.L65:
	ldr	r1, .L72+28
	str	r3, [r1, #0]	@  state
	b	.L64
.L9:
	ldr	r0, .L72+40
	mov	lr, pc
	bx	sl
	ldr	r2, .L72+36
	ldr	r3, [r2, #0]	@  lastButtons
	ands	r2, r3, #4
	bne	.L64
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #4
	ldrne	r3, .L72+28
	strne	r2, [r3, #0]	@  state
	b	.L64
.L11:
	ldr	r3, .L72+44
	mov	r1, #11968
	str	r3, [r7, #212]	@  <variable>.source
	mov	r3, #67108864
	add	r3, r3, #212
	add	r1, r1, #-2147483616
	mov	r2, #100663296
	str	r2, [r3, #4]	@  <variable>.destination
	str	r1, [r3, #8]	@  <variable>.control
	ldr	r3, .L72+48
	mov	ip, #-2147483648
	str	r3, [r7, #212]	@  <variable>.source
	mov	r0, #100663296
	ldr	r3, .L72+52
	mov	r1, #67108864
	add	r1, r1, #212
	add	lr, ip, #256
	mov	r4, r0
	mov	r5, ip
	add	r0, r0, #55296
	add	ip, ip, #4096
	str	r0, [r1, #4]	@  <variable>.destination
	str	ip, [r1, #8]	@  <variable>.control
	str	r3, [r7, #212]	@  <variable>.source
	ldr	r3, .L72+56
	mov	r2, #83886080
	str	r2, [r1, #4]	@  <variable>.destination
	mov	r6, #83886080
	str	lr, [r1, #8]	@  <variable>.control
	str	r3, [r7, #212]	@  <variable>.source
	ldr	r3, .L72+60
	add	r4, r4, #65536
	add	r5, r5, #16384
	add	r6, r6, #512
	str	r4, [r1, #4]	@  <variable>.destination
	mov	r2, #117440512
	str	r5, [r1, #8]	@  <variable>.control
	str	r3, [r7, #212]	@  <variable>.source
	str	r6, [r1, #4]	@  <variable>.destination
	str	lr, [r1, #8]	@  <variable>.control
	mov	r1, #127	@  i
.L16:
	ldrh	r3, [r2, #0]	@  <variable>.attr0
	subs	r1, r1, #1	@  i,  i
	orr	r3, r3, #512
	strh	r3, [r2, #0]	@ movhi 	@  <variable>.attr0
	add	r2, r2, #8
	bpl	.L16
	mov	r3, #-1224736768
	mov	r3, r3, asr #17
	mov	lr, #256
	mov	ip, #67108864
	strh	r3, [r7, #8]	@ movhi 
	add	ip, ip, #188
	mov	r2, #0
	add	lr, lr, #67108866
	mov	r3, #4352	@ movhi
	strh	r3, [r7, #0]	@ movhi 
	strh	r2, [lr, #0]	@ movhi 
	ldr	r3, .L72+64
	str	r2, [ip, #8]	@  <variable>.cnt
	mov	r2, #67108864
	ldrh	r4, [r3, #0]	@  timerintervalA
	mov	r1, r2
	ldr	r3, .L72+68
	add	r2, r2, #256
	mov	r0, #-1241513984
	strh	r4, [r2, #0]	@ movhi 
	add	r1, r1, #160
	add	r0, r0, #4194304
	mov	r4, #128	@ movhi
	strh	r4, [lr, #0]	@ movhi 
	str	r3, [r7, #188]	@  <variable>.src
	ldr	r3, .L72+72
	str	r1, [ip, #4]	@  <variable>.dst
	str	r0, [ip, #8]	@  <variable>.cnt
	ldr	r2, [r3, #0]	@  vblankcountA
	ldr	r3, .L72+76
	ldr	r6, .L72+80
	str	r2, [r3, #0]	@  startA
	ldr	r9, .L72+84
	ldr	r7, .L72+88
	mov	sl, #67108864
.L52:
	ldr	ip, .L72+92
	ldr	lr, .L72+96
	ldr	r0, .L72+100
	ldr	r4, .L72+104
	ldrh	r3, [ip, #0]	@  playerCol
	ldrb	r2, [lr, #0]	@ zero_extendqisi2	@  playerRow
	ldrh	r1, [r0, #0]	@  badguyRow
	ldrh	r0, [r4, #0]	@  badguyCol
	bic	r3, r3, #65024
	orr	r2, r2, #40960
	orr	r3, r3, #32768
	orr	r1, r1, #40960
	mov	ip, #0	@ movhi
	mov	lr, #8	@ movhi
	orr	r0, r0, #32768
	strh	r2, [r6, #0]	@ movhi 	@  <variable>.attr0
	strh	r3, [r6, #2]	@ movhi 	@  <variable>.attr1
	strh	r1, [r6, #8]	@ movhi 	@  <variable>.attr0
	strh	r0, [r6, #10]	@ movhi 	@  <variable>.attr1
	strh	ip, [r6, #4]	@ movhi 	@  <variable>.attr2
	strh	lr, [r6, #12]	@ movhi 	@  <variable>.attr2
	ldr	r0, .L72+24
	mov	lr, pc
	bx	r0
	ldr	r1, .L72+96
	ldr	ip, .L72+108
	ldr	lr, .L72+20
	ldr	r3, .L72+112
	ldr	r4, .L72+92
	ldr	r2, [r1, #0]	@  playerRow
	ldr	r1, [ip, #0]	@  hOff
	ldr	ip, [lr, #0]	@  spriteState
	ldr	r0, [r3, #0]	@  vOff
	ldr	r3, [r4, #0]	@  playerCol
	cmp	ip, #0
	add	r2, r2, r0
	add	r3, r3, r1
	ldr	r0, .L72+116
	ldreq	r1, .L72+80
	str	r2, [r0, #0]	@  bigRow
	str	r3, [r9, #0]	@  bigCol
	streqh	ip, [r1, #4]	@ movhi 	@  <variable>.attr2
	beq	.L20
	cmp	ip, #1
	beq	.L66
.L20:
	ldr	r3, [r8, #0]
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L67
.L28:
	ldr	r3, .L72+16
	ldr	r2, [r3, #0]	@  buttons
	tst	r2, #16
	beq	.L29
	ldr	r1, .L72+120
	ldr	r3, .L72+116
	ldr	r4, .L72+124
	ldr	lr, .L72+128
	ldr	r0, [r1, #0]	@  playerCVel
	ldr	r2, [r9, #0]	@  bigCol
	ldr	r1, [r3, #0]	@  bigRow
	ldr	r3, [r4, #0]	@  playerHeight
	ldr	r4, .L72+132
	ldr	ip, [lr, #0]	@  playerWidth
	add	r2, r2, r0
	ldr	lr, [r4, #0]	@  collMapSize
	add	r1, r1, r3
	add	r2, r2, ip
	mla	r3, lr, r1, r2
	ldr	r2, .L72+136
	mov	r3, r3, asl #1
	ldrh	r1, [r3, r2]	@  collisionmapBitmap
	ldr	r2, [r7, #0]	@  walkCounter
	mov	r3, #32512
	add	r3, r3, #255
	ldr	r4, .L72+20
	cmp	r1, r3
	add	r2, r2, #1
	mov	r3, #1
	str	r3, [r4, #0]	@  spriteState
	str	r2, [r7, #0]	@  walkCounter
	beq	.L68
.L29:
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #32
	beq	.L34
	ldr	lr, .L72+124
	ldr	ip, .L72+116
	ldr	r4, .L72+120
	ldr	r3, [lr, #0]	@  playerHeight
	ldr	lr, .L72+132
	ldr	r1, [ip, #0]	@  bigRow
	ldr	r0, [r4, #0]	@  playerCVel
	ldr	r2, [r9, #0]	@  bigCol
	ldr	ip, [lr, #0]	@  collMapSize
	add	r1, r1, r3
	add	r2, r2, r0
	mla	r3, ip, r1, r2
	ldr	r2, .L72+136
	mov	r3, r3, asl #1
	ldrh	r1, [r3, r2]	@  collisionmapBitmap
	ldr	r2, [r7, #0]	@  walkCounter
	mov	r3, #32512
	add	r3, r3, #255
	ldr	r4, .L72+20
	cmp	r1, r3
	add	r2, r2, #1
	mov	r3, #1
	str	r3, [r4, #0]	@  spriteState
	str	r2, [r7, #0]	@  walkCounter
	beq	.L69
.L34:
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #64
	beq	.L39
	ldr	r2, .L72+116
	ldr	r4, .L72+140
	ldr	ip, .L72+132
	ldr	r3, [r2, #0]	@  bigRow
	ldr	lr, [r4, #0]	@  playerRVel
	ldr	r2, [ip, #0]	@  collMapSize
	rsb	r3, lr, r3
	mul	ip, r2, r3
	ldr	r1, .L72+128
	ldr	r0, [r9, #0]	@  bigCol
	ldr	r3, [r1, #0]	@  playerWidth
	add	r3, r0, r3
	ldr	r2, .L72+136
	add	r3, ip, r3
	mov	r3, r3, asl #1
	ldrh	r1, [r3, r2]	@  collisionmapBitmap
	ldr	r2, [r7, #0]	@  walkCounter
	mov	r3, #32512
	add	r3, r3, #255
	ldr	r4, .L72+20
	cmp	r1, r3
	add	r2, r2, #1
	mov	r3, #1
	str	r3, [r4, #0]	@  spriteState
	str	r2, [r7, #0]	@  walkCounter
	beq	.L70
.L39:
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #128
	beq	.L44
	ldr	r2, .L72+116
	ldr	ip, .L72+124
	ldr	r0, .L72+140
	ldr	r3, [r2, #0]	@  bigRow
	ldr	r4, [ip, #0]	@  playerHeight
	ldr	r1, .L72+132
	ldr	lr, [r0, #0]	@  playerRVel
	ldr	r5, [r1, #0]	@  collMapSize
	add	r3, r3, r4
	add	r3, r3, lr
	mul	ip, r5, r3
	ldr	r2, .L72+128
	ldr	r0, [r9, #0]	@  bigCol
	ldr	r3, [r2, #0]	@  playerWidth
	add	r3, r0, r3
	ldr	r2, .L72+136
	add	r3, ip, r3
	mov	r3, r3, asl #1
	ldrh	r1, [r3, r2]	@  collisionmapBitmap
	ldr	r2, [r7, #0]	@  walkCounter
	mov	r3, #32512
	add	r3, r3, #255
	add	r2, r2, #1
	cmp	r1, r3
	ldr	r3, .L72+20
	str	r2, [r7, #0]	@  walkCounter
	mov	r2, #1
	str	r2, [r3, #0]	@  spriteState
	beq	.L71
.L44:
	ldr	lr, .L72+36
	ldr	r3, [lr, #0]	@  lastButtons
	ands	r2, r3, #8
	bne	.L50
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #8
	beq	.L50
	mov	ip, #260
	mov	r0, #67108864
	add	r0, r0, #200
	add	ip, ip, #67108866
	strh	r2, [ip, #0]	@ movhi 
	ldr	r1, .L72+144
	str	r2, [r0, #8]	@  <variable>.cnt
	mov	r3, #67108864
	ldrh	lr, [r1, #0]	@  timerintervalB
	mov	r2, r3
	mov	r1, #-1241513984
	add	r3, r3, #260
	ldr	r4, .L72+148
	strh	lr, [r3, #0]	@ movhi 
	add	r2, r2, #164
	mov	r3, #128	@ movhi
	add	r1, r1, #4194304
	strh	r3, [ip, #0]	@ movhi 
	str	r4, [sl, #200]	@  <variable>.src
	ldr	ip, .L72+152
	str	r2, [r0, #4]	@  <variable>.dst
	str	r1, [r0, #8]	@  <variable>.cnt
	ldr	lr, .L72+156
	ldr	r3, [ip, #0]	@  vblankcountB
	str	r3, [lr, #0]	@  startB
.L50:
	ldr	r0, .L72+36
	ldr	r3, [r0, #0]	@  lastButtons
	tst	r3, #4
	bne	.L51
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #4
	ldrne	r1, .L72+28
	movne	r3, #4
	strne	r3, [r1, #0]	@  state
.L51:
	ldr	r2, .L72+160
	mov	lr, pc
	bx	r2
	ldmia	r6, {r0-r1}	@  shadowOAM
	mov	r2, #117440512
	stmia	r2, {r0-r1}
	ldr	r4, .L72+164
	ldr	ip, .L72+108
	ldr	lr, .L72+112
	ldmia	r4, {r3-r4}	@  shadowOAM
	ldrh	ip, [ip, #0]	@ movhi	@  hOff
	ldrh	lr, [lr, #0]	@ movhi	@  vOff
	add	r2, r2, #8
	stmia	r2, {r3-r4}
	strh	ip, [sl, #16]	@ movhi 
	strh	lr, [sl, #18]	@ movhi 
	b	.L52
.L71:
	add	r3, ip, r0
	ldr	ip, .L72+136
	mov	r3, r3, asl r2
	ldrh	r2, [r3, ip]	@  collisionmapBitmap
	cmp	r2, r1
	bne	.L44
	ldr	r0, .L72+96
	ldr	r2, [r0, #0]	@  playerRow
	rsb	r3, r4, #160
	cmp	r2, r3
	addlt	r3, r2, lr
	strlt	r3, [r0, #0]	@  playerRow
	blt	.L47
	ldr	r1, .L72+112
	ldr	r2, [r1, #0]	@  vOff
	sub	r3, r5, #160
	cmp	r2, r3
	addlt	r3, r2, lr
	strlt	r3, [r1, #0]	@  vOff
.L47:
	ldr	r2, .L72+96
	ldr	r3, [r2, #0]	@  playerRow
	cmp	r3, #440
	ble	.L44
	ldr	r4, .L72+92
	ldr	r3, [r4, #0]	@  playerCol
	cmp	r3, #464
	ldrgt	ip, .L72+28
	movgt	r3, #3
	strgt	r3, [ip, #0]	@  state
	b	.L44
.L70:
	add	r3, ip, r0
	ldr	ip, .L72+136
	mov	r3, r3, asl #1
	ldrh	r2, [r3, ip]	@  collisionmapBitmap
	cmp	r2, r1
	bne	.L39
	ldr	r0, .L72+96
	ldr	r3, [r0, #0]	@  playerRow
	cmp	r3, #30
	rsbgt	r3, lr, r3
	strgt	r3, [r0, #0]	@  playerRow
	bgt	.L39
	ldr	r1, .L72+112
	ldr	r3, [r1, #0]	@  vOff
	cmp	r3, #0
	rsbgt	r3, lr, r3
	strgt	r3, [r1, #0]	@  vOff
	b	.L39
.L69:
	ldr	lr, .L72+92
	ldr	r3, [lr, #0]	@  playerCol
	cmp	r3, #0
	rsbgt	r3, r0, r3
	strgt	r3, [lr, #0]	@  playerCol
	bgt	.L34
	ldr	r1, .L72+108
	ldr	r2, [r1, #0]	@  hOff
	rsb	r3, ip, #240
	cmp	r2, r3
	rsbgt	r3, r0, r2
	strgt	r3, [r1, #0]	@  hOff
	b	.L34
.L68:
	ldr	r1, .L72+92
	ldr	r2, [r1, #0]	@  playerCol
	rsb	r3, ip, #235
	cmp	r2, r3
	addlt	r3, r2, r0
	strlt	r3, [r1, #0]	@  playerCol
	blt	.L29
	ldr	r3, .L72+108
	ldr	r2, [r3, #0]	@  hOff
	sub	r3, lr, #240
	cmp	r2, r3
	ldrlt	r4, .L72+108
	addlt	r3, r2, r0
	strlt	r3, [r4, #0]	@  hOff
	b	.L29
.L67:
	ldr	lr, .L72+168
	mov	r2, #-2147483648
	str	lr, [sl, #212]	@  <variable>.source
	mov	r0, r2
	mov	r1, #100663296
	mov	r4, #67108864
	ldr	lr, .L72+172
	add	r4, r4, #212
	mov	ip, r2
	add	r0, r0, #4096
	mov	r3, #100663296
	add	r2, r2, #11456
	add	r1, r1, #55296
	str	r3, [r4, #4]	@  <variable>.destination
	str	r2, [r4, #8]	@  <variable>.control
	str	lr, [sl, #212]	@  <variable>.source
	str	r1, [r4, #4]	@  <variable>.destination
	str	r0, [r4, #8]	@  <variable>.control
	ldr	r0, .L72+176
	add	ip, ip, #256
	mov	r3, #83886080
	str	r0, [sl, #212]	@  <variable>.source
	str	r3, [r4, #4]	@  <variable>.destination
	str	ip, [r4, #8]	@  <variable>.control
	b	.L28
.L66:
	ldr	r2, [r7, #0]	@  walkCounter
	add	r3, r2, r2, lsr #31
	bic	r3, r3, #1
	rsb	r3, r3, r2
	cmp	r3, #1
	ldreq	r2, .L72+80
	moveq	r3, #4	@ movhi
	streqh	r3, [r2, #4]	@ movhi 	@  <variable>.attr2
	beq	.L20
	ands	r3, r2, #1
	ldreq	r4, .L72+80
	streqh	r3, [r4, #4]	@ movhi 	@  <variable>.attr2
	b	.L20
.L53:
.L54:
	b	.L54
.L57:
	ldr	r0, .L72+36
	ldr	r3, [r0, #0]	@  lastButtons
	tst	r3, #4
	bne	.L64
	ldr	r3, [r8, #0]	@  buttons
	tst	r3, #4
	beq	.L64
	mov	r3, #2
	b	.L65
.L73:
	.align	2
.L72:
	.word	previousSpriteState
	.word	enableSounds
	.word	setupInterrupts
	.word	fillPicture
	.word	buttons
	.word	spriteState
	.word	pollKeys
	.word	state
	.word	splashBitmap
	.word	lastButtons
	.word	instructionsBitmap
	.word	backgroundTiles
	.word	backgroundMap
	.word	backgroundPal
	.word	playerTiles
	.word	playerPal
	.word	timerintervalA
	.word	bgsound
	.word	vblankcountA
	.word	startA
	.word	shadowOAM
	.word	bigCol
	.word	walkCounter
	.word	playerCol
	.word	playerRow
	.word	badguyRow
	.word	badguyCol
	.word	hOff
	.word	vOff
	.word	bigRow
	.word	playerCVel
	.word	playerHeight
	.word	playerWidth
	.word	collMapSize
	.word	collisionmapBitmap
	.word	playerRVel
	.word	timerintervalB
	.word	bark
	.word	vblankcountB
	.word	startB
	.word	waitForVBlank
	.word	shadowOAM+8
	.word	cheatbackgroundTiles
	.word	cheatbackgroundMap
	.word	cheatbackgroundPal
	.size	main, .-main
	.align	2
	.global	enableSounds
	.type	enableSounds, %function
enableSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r3, #128
	mvn	r1, #17408
	sub	r1, r1, #241
	str	r3, [r2, #132]
	mov	r3, #0	@ movhi
	@ lr needed for prologue
	strh	r1, [r2, #130]	@ movhi 
	strh	r3, [r2, #128]	@ movhi 
	bx	lr
	.size	enableSounds, .-enableSounds
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	ldr	r3, .L76
	mov	r2, #50331648
	stmfd	sp!, {r4, fp, ip, lr, pc}
	add	r2, r2, #32512
	mov	r4, #67108864
	add	r4, r4, #520
	str	r3, [r2, #252]
	mov	r3, #0	@ movhi
	strh	r3, [r4, #0]	@ movhi 
	sub	fp, ip, #4
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	mov	r3, #1	@ movhi
	strh	r3, [r4, #0]	@ movhi 
	ldmea	fp, {r4, fp, sp, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	interruptHandler
	.word	enableVBlankInterrupt
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	enableVBlankInterrupt
	.type	enableVBlankInterrupt, %function
enableVBlankInterrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	add	r0, r1, #512
	ldrh	r2, [r1, #4]
	ldrh	r3, [r0, #0]
	orr	r2, r2, #8
	orr	r3, r3, #1
	strh	r3, [r0, #0]	@ movhi 
	@ lr needed for prologue
	strh	r2, [r1, #4]	@ movhi 
	bx	lr
	.size	enableVBlankInterrupt, .-enableVBlankInterrupt
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r3, #67108864
	add	r3, r3, #520
	mov	r6, #0
	mov	r2, #512
	strh	r6, [r3, #0]	@ movhi 
	mov	r4, r2
	add	r2, r2, #67108866
	ldrh	r3, [r2, #0]
	mov	r5, #67108864
	cmp	r3, #1
	sub	sp, sp, #32
	ldr	sl, .L84
	add	r4, r4, #67108866
	add	r5, r5, #520
	beq	.L83
.L80:
	ldrh	r3, [r4, #0]
	mov	r2, #1	@ movhi
	strh	r3, [r4, #0]	@ movhi 
	strh	r2, [r5, #0]	@ movhi 
	add	sp, sp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L83:
	ldr	r2, .L84+4
	mov	r3, #67108864
	ldr	ip, [r2, #0]	@  vblankcountA
	mov	r2, #256
	add	r3, r3, #200
	add	r2, r2, #67108866
	str	r3, [sp, #16]
	str	r2, [sp, #28]
	mov	r3, #260
	ldr	r2, .L84+8
	add	r3, r3, #67108866
	ldr	r0, [r2, #0]	@  numvblanksB
	str	r3, [sp, #20]
	ldr	r2, .L84+12
	ldr	r3, .L84+16
	ldr	r1, [r3, #0]	@  numvblanksA
	ldr	r3, [r2, #0]	@  startA
	add	ip, ip, #1
	rsb	r3, r3, ip
	ldr	r2, .L84+20
	str	r3, [sp, #0]
	ldr	r3, [sp, #0]
	ldr	r2, [r2, #0]	@  startB
	sub	r1, r1, #1
	cmp	r3, r1
	mov	r3, #67108864
	str	r2, [sp, #4]
	add	r3, r3, #164
	ldr	r2, [sl, #0]	@  vblankcountB
	str	r3, [sp, #12]
	mov	r3, #-1275068416
	add	r2, r2, #1
	sub	r0, r0, #1
	add	r3, r3, #4194304
	str	r2, [sl, #0]	@  vblankcountB
	str	r0, [sp, #24]
	mov	sl, r2
	mov	r0, #67108864
	str	r3, [sp, #8]
	ldr	r2, [sp, #4]
	ldr	r3, .L84+4
	mov	r7, r0
	mov	r9, r0
	mov	lr, #67108864
	mov	r8, #-1241513984
	add	lr, lr, #188
	add	r0, r0, #256
	add	r7, r7, #160
	add	r8, r8, #4194304
	add	r9, r9, #260
	rsb	r1, r2, sl
	str	ip, [r3, #0]	@  vblankcountA
	blt	.L81
	ldr	r2, [sp, #28]
	ldr	r3, .L84+24
	strh	r6, [r2, #0]	@ movhi 
	str	r6, [lr, #8]	@  <variable>.cnt
	ldrh	r2, [r3, #0]	@  timerintervalA
	ldr	r3, [sp, #28]
	strh	r2, [r0, #0]	@ movhi 
	mov	r2, #128	@ movhi
	strh	r2, [r3, #0]	@ movhi 
	ldr	r3, .L84+28
	mov	r2, #67108864
	str	r3, [r2, #188]	@  <variable>.src
	ldr	r3, .L84+12
	str	r7, [lr, #4]	@  <variable>.dst
	str	r8, [lr, #8]	@  <variable>.cnt
	str	ip, [r3, #0]	@  startA
.L81:
	ldr	r2, [sp, #24]
	cmp	r1, r2
	blt	.L80
	add	r2, sp, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	strh	r6, [r3, #0]	@ movhi 
	str	r6, [r2, #8]	@  <variable>.cnt
	ldr	r3, .L84+32
	ldrh	r2, [r3, #0]	@  timerintervalB
	ldr	r3, [sp, #20]
	strh	r2, [r9, #0]	@ movhi 
	mov	r2, #128	@ movhi
	strh	r2, [r3, #0]	@ movhi 
	ldr	r3, .L84+36
	mov	r2, #67108864
	str	r3, [r2, #200]	@  <variable>.src
	add	r2, sp, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	str	r2, [r3, #4]	@  <variable>.dst
	ldr	r2, [sp, #8]
	str	r2, [r3, #8]	@  <variable>.cnt
	ldr	r3, .L84+20
	str	sl, [r3, #0]	@  startB
	b	.L80
.L85:
	.align	2
.L84:
	.word	vblankcountB
	.word	vblankcountA
	.word	numvblanksB
	.word	startA
	.word	numvblanksA
	.word	startB
	.word	timerintervalA
	.word	bgsound
	.word	timerintervalB
	.word	bark
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	fillPicture
	.type	fillPicture, %function
fillPicture:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L87
	mov	r1, #67108864
	ldr	ip, [r3, #0]	@  videoBuffer
	mov	r3, #-2147483648
	add	r2, r1, #212
	add	r3, r3, #38400
	str	r0, [r1, #212]	@  picture,  <variable>.src
	@ lr needed for prologue
	str	ip, [r2, #4]	@  <variable>.dst
	str	r3, [r2, #8]	@  <variable>.cnt
	bx	lr
.L88:
	.align	2
.L87:
	.word	videoBuffer
	.size	fillPicture, .-fillPicture
	.align	2
	.global	pollKeys
	.type	pollKeys, %function
pollKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L90
	ldr	r3, .L90+4
	ldr	r1, [r0, #0]	@  buttons
	ldr	r2, .L90+8
	str	r1, [r3, #0]	@  lastButtons
	ldr	r1, [r2, #0]	@  rawButtons
	ldr	r3, [r1, #0]
	mvn	r3, r3
	@ lr needed for prologue
	str	r3, [r0, #0]	@  buttons
	bx	lr
.L91:
	.align	2
.L90:
	.word	buttons
	.word	lastButtons
	.word	rawButtons
	.size	pollKeys, .-pollKeys
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L99
	@ lr needed for prologue
.L93:
	ldr	r2, [r1, #0]	@  scanlineCounter
	ldrh	r3, [r2, #0]
	cmp	r3, #160
	bhi	.L93
.L96:
	ldrh	r3, [r2, #0]
	cmp	r3, #159
	bls	.L96
	bx	lr
.L100:
	.align	2
.L99:
	.word	scanlineCounter
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	waitForKey
	.type	waitForKey, %function
waitForKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #304
	ldrh	r1, [r3, #0]
	mov	r2, #1020
	add	r2, r2, #3
	bic	r2, r2, r1
	@ lr needed for prologue
	cmp	r2, #0
.L102:
	beq	.L102
	bx	lr
	.size	waitForKey, .-waitForKey
	.align	2
	.global	waitForNoKey
	.type	waitForNoKey, %function
waitForNoKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #304
	ldrh	r1, [r3, #0]
	mov	r2, #1020
	add	r2, r2, #3
	bic	r2, r2, r1
	@ lr needed for prologue
	cmp	r2, #0
.L106:
	bne	.L106
	bx	lr
	.size	waitForNoKey, .-waitForNoKey
	.comm	buttons, 4, 32
	.comm	lastButtons, 4, 32
	.comm	shadowOAM, 1024, 32
	.comm	bigRow, 4, 32
	.comm	bigCol, 4, 32
	.comm	startA, 4, 32
	.comm	startB, 4, 32
	.comm	previousSpriteState, 4, 32
	.ident	"GCC: (GNU) 3.3.2"
