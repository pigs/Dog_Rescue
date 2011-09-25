/*TYPEDEFS*/
typedef unsigned char u8;
typedef signed char s8;
typedef unsigned short u16;
typedef signed short s16;
typedef unsigned int u32;
typedef signed int s32;


typedef struct
{								// ***********************************************************
	 const volatile void *src;	// We mark this as const which means we can assign it const
	 volatile void *dst;		// things without the compiler yelling but we can also pass it
	 volatile u32 cnt;			// things that are not const!
								// ***********************************************************
} DMAREC;

typedef struct
{
  const void *source;
  void *destination;
  u32 control;
} DMA_CONTROLLER;

typedef struct {
    unsigned int data[512];
} SBLOCK;

typedef struct {
    unsigned int data[4096];
} CBLOCK;

typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;


#define REG_DISPCNTL (*(u16*)0x4000000)
#define BG2_ENABLE (1<<10)
#define BG0_ENABLE (1<<8)
#define VIDBUFADR (u16 *)0x6000000

//MODES
#define MODE0 0
#define MODE3 3
#define MODE4 4

//BUFFER
#define BUFFER0 ((u16 *)0x6000000)
#define BUFFER1 ((u16 *)0x600A000)
#define BUFFERFLAG 0x10 //Buffer Select

#define PAL_MEM ((u16*)0x5000000)
#define RGB(r, g, b) ((r) | ((g)<<5) | ((b)<<10))

#define DMA ((volatile DMAREC *)0x040000B0)
#define DMA_CHANNEL_0 0
#define DMA_CHANNEL_1 1
#define DMA_CHANNEL_2 2
#define DMA_CHANNEL_3 3
#define DMA_DESTINATION_INCREMENT (0 << 21)
#define DMA_DESTINATION_DECREMENT (1 << 21)
#define DMA_DESTINATION_FIXED (2 << 21)
#define DMA_DESTINATION_RESET (3 << 21)
#define DMA_SOURCE_INCREMENT (0 << 23)
#define DMA_SOURCE_DECREMENT (1 << 23)
#define DMA_SOURCE_FIXED (2 << 23)
#define DMA_REPEAT (1 << 25)
#define DMA_16 (0 << 26)
#define DMA_32 (1 << 26)
#define DMA_NOW (0 << 28)
#define DMA_AT_VBLANK (1 << 28)
#define DMA_AT_HBLANK (2 << 28)
#define DMA_AT_REFRESH (3 << 28)
#define DMA_IRQ (1 << 30)
#define DMA_ON (1 << 31)
#define DMA_MEMORY ((volatile DMA_CONTROLLER *) 0x040000B0)

//button stuff
#define BUTTON_ADDR *(unsigned short *)0x4000130
#define BUTTONS (*((unsigned short *)0x4000130))

#define A_BUTTON (1<<0)
#define B_BUTTON (1<<1)
#define SELECT_BUTTON (1<<2)
#define START_BUTTON (1<<3)
#define RIGHT_BUTTON (1<<4)
#define LEFT_BUTTON (1<<5)
#define UP_BUTTON (1<<6)
#define DOWN_BUTTON (1<<7)
#define R_BUTTON (1<<8)
#define L_BUTTON (1<<9)
#define BUTTON_HELD(mask) (((mask) & buttons) == (mask))
#define BUTTON_PRESSED(mask) ((((mask) & lastButtons) != (mask)) && (BUTTON_HELD(mask)))

// Useful macros
#define COLLISION_OFFSET(r,c) ((r*256)+c)
#define OFFSET(r,c,rowlen) ((r)*(rowlen) + (c))
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)


#define SCREENBLOCK ((SBLOCK*)(0x6000000))
#define CHARBLOCK ((CBLOCK*)(0x6000000))

#define REG_BG0CNT  (*(u16 *) 0x4000008) //BG 0 control
#define REG_BG0HOFS (*(u16 *) 0x4000010) //BG 0 Horizontal Offset
#define REG_BG0VOFS (*(u16 *) 0x4000012) //BG 0 Vertical Offset
#define REG_BG1CNT  (*(u16 *) 0x400000A) //BG 1 control
#define REG_BG1HOFS (*(u16 *) 0x4000014) //BG 1 Horizontal Offset
#define REG_BG1VOFS (*(u16 *) 0x4000016) //BG 1 Vertical Offset
#define REG_BG2CNT  (*(u16 *) 0x400000C) //BG 2 control
#define REG_BG2HOFS (*(u16 *) 0x4000018) //BG 2 Horizontal Offset
#define REG_BG2VOFS (*(u16 *) 0x400001A) //BG 2 Vertical Offset
#define REG_BG3CNT  (*(u16 *) 0x400000E) //BG 3 control
#define REG_BG3HOFS (*(u16 *) 0x400001C) //BG 3 Horizontal Offset
#define REG_BG3VOFS (*(u16 *) 0x400001E) //BG 3 Vertical Offset

#define REG_BG0CNT (*(u16 *) 0x4000008)
#define REG_BG0HOFS (*(u16 *) 0x4000010)
#define REG_BG0VOFS (*(u16 *) 0x4000012)

#define BG_4BPP (0 << 7)
#define BG_8BPP (1 << 7)
#define BG_REG_32x32 (0 << 14)
#define BG_REG_64x32 (1 << 14)
#define BG_REG_32x64 (2 << 14)
#define BG_REG_64x64 (3 << 14)

#define CBB(i) ((i) << 2) //place this in the BG CNT register to define what Character block the data is in
#define SBB(i) ((i) << 8) //place this in the BG CNT register to define what Screen block the Map is in

#define SPRITE_MODE_1D (1 << 6) //put this into REG_DISPCNTL to enable 1D mapping mode
#define SPRITE_ENABLE (1 << 12) //put this into REG_DISPCNTL to enable sprites

#define ATTR0_REGULAR (0 << 8) //Normal Sprites
#define ATTR0_AFFINE (1 << 8) //Affine Sprites
#define ATTR0_HIDE (2 << 8) // Hide Sprites
#define ATTR0_DOUBLE_AFFINE (3 << 8) //Double Affine Sprites (Never used it before so don't ask me -Peter)
#define ATTR0_NORMAL (0 << 10) //Normal Rendering
#define ATTR0_BLEND (1 << 10) //Enables Alpha Blending.  Don't worry about it.  Unless you want too =D
#define ATTR0_WIN (2 << 10) //Object Window mode.  Again, no idea.
#define ATTR0_MOSAIC (1 << 12) //Enables the mosaic effect for this sprite.  It's a cool visual effect.  We can talk about it on thursday perhaps
#define ATTR0_4BPP (0 << 13) //16 color Sprites
#define ATTR0_8BPP (1 << 13) //256 color Sprites
#define ATTR0_SQUARE (0 << 14) //Square Shape
#define ATTR0_WIDE (1 << 14) // Wide Shape
#define ATTR0_TALL (2 << 14) //Tall Shape

#define ATTR1_HFLIP (1 << 12)
#define ATTR1_VFLIP (1 << 13)
#define ATTR1_SIZE8 (0 << 14)
#define ATTR1_SIZE16 (1 << 14)
#define ATTR1_SIZE32 (2 << 14)
#define ATTR1_SIZE64 (3 << 14)

#define OAM ((OBJ_ATTR*)(0x7000000))
#define SPRITE_PALETTE ((unsigned short*)(0x5000200))

#define SPRITEOFFSET16(r,c) (r)*32+(c)

// Prototypes
void dmaTransfer(void *destination, const void *source, u32 chunks, u32 mode);


void setPixel(int row, int col, u16 color);
void drawRect(int row, int col, int height, int width, volatile u16 color);
void drawRect4(int row, int col, int height, int width, u8 color);
void delay(int clicks);
void fillScreen(u16 color);

void FlipPage();
void setPixel4(int row, int col, unsigned char index);
void fillScreen4(volatile unsigned char index);
void drawPicture4(int row, int col, int height, int width, unsigned short *index);
void fillPicture4(volatile unsigned short  *index);
void storeTiles( unsigned short *source,unsigned int dest, unsigned int cnt);
void storeMap( unsigned short *source, unsigned int dest, unsigned int cnt);
void storePal(unsigned short *source, unsigned int dest, unsigned int cnt);
void dmaTransfer(void *destination, const void *source, u32 chunks, u32 mode);
void enableSounds(void);
void interruptHandler(void);
void setupInterrupts(void);


u16* videoBuffer = VIDBUFADR;
volatile u16* scanlineCounter = (volatile u16*)0x4000006;
volatile unsigned int* rawButtons = (volatile unsigned int*)0x4000130;


//**TIMERS***====================================================
// Timers
#define REG_TM0CNT *(volatile u16*)0x4000102
#define REG_TM1CNT *(volatile u16*)0x4000106
#define REG_TM2CNT *(volatile u16*)0x400010A
#define REG_TM3CNT *(volatile u16*)0x400010E

#define REG_TM0D       *(volatile u16*)0x4000100
#define REG_TM1D       *(volatile u16*)0x4000104
#define REG_TM2D       *(volatile u16*)0x4000108
#define REG_TM3D       *(volatile u16*)0x400010C

// Timer flags
#define TIMER_ON      (1<<7)  
#define TM_IRQ        (1<<6)
#define TM_CASCADE    (1<<2)
#define TM_FREQ_1     0
#define TM_FREQ_64    1
#define TM_FREQ_256   2
#define TM_FREQ_1024  3

// Time factors to multiply clock ticks to convert to microsec (usec)
// The next line (uncommented) should be in myLib.c
// double timefactors[] = {0.059604, 3.811, 15.259, 59.382};
extern double timefactors[];

/* Interrupts -------------------------------------------------------------------- */
#define REG_IME *(u16*)0x4000208
#define REG_IE *(u16*)0x4000200
#define REG_IF *(volatile u16*)0x4000202
#define REG_INTERRUPT *(u32*)0x3007FFC

/* Display Status Control Register ------------------------------------------------ */
#define REG_DISPSTAT *(u16*)0x4000004

//interrupt constants for turning them on
#define INT_VBLANK_ENABLE (1<<3)
#define INT_HBLANK_ENABLE (1<<4)
#define INT_VCOUNT_ENABLE (1<<5)

// Interrupt constants for "enablng receipt of" and 
// "checking which type of" interrupt happened

#define INT_VB     (1<< 0)	// VB – vertical blank interrupt
#define INT_HB     (1<< 1)    // HB – horizontal blank interrupt
#define INT_VC     (1<< 2)	// VC – vertical scanline count interrupt
#define INT_T0     (1<< 3)	// T0 – timer 0 interrupt
#define INT_T1     (1<< 4)	// T1 – timer 1 interrupt
#define INT_T2     (1<< 5)	// T2 – timer 2 interrupt
#define INT_T3     (1<< 6)	// T3 – timer 3 interrupt
#define INT_COM    (1<< 7)	// COM – serial communication interrupt
#define INT_DMA0   (1<< 8)	// DMA0 – DMA0 finished interrupt
#define INT_DMA1   (1<< 9)	// DMA1 – DMA1 finished interrupt
#define INT_DMA2   (1<<10) 	// DMA2 – DMA2 finished interrupt
#define INT_DMA3   (1<<11)	// DMA3 – DMA3 finished interrupt
#define INT_BUTTON (1<<12) 	// BUTTON – button interrupt
#define INT_CART   (1<<13)	// CART – game cartridge interrupt

// *** Sound =========================================================

#define REG_SOUNDCNT_X (*(u32*)0x04000084)
#define SND_ENABLED    0x00000080

// register definitions
#define REG_SOUNDCNT_L        (*(u16*)0x04000080)
#define REG_SOUNDCNT_H        (*(u16*)0x04000082)

// flags
#define SND_ENABLED           0x00000080
#define SND_OUTPUT_RATIO_25   0x0000
#define SND_OUTPUT_RATIO_50   0x0001
#define SND_OUTPUT_RATIO_100  0x0002
#define DSA_OUTPUT_RATIO_50   0x0000
#define DSA_OUTPUT_RATIO_100  0x0004
#define DSA_OUTPUT_TO_RIGHT   0x0100
#define DSA_OUTPUT_TO_LEFT    0x0200
#define DSA_OUTPUT_TO_BOTH    0x0300
#define DSA_TIMER0            0x0000
#define DSA_TIMER1            0x0400
#define DSA_FIFO_RESET        0x0800
#define DSB_OUTPUT_RATIO_50   0x0000
#define DSB_OUTPUT_RATIO_100  0x0008
#define DSB_OUTPUT_TO_RIGHT   0x1000
#define DSB_OUTPUT_TO_LEFT    0x2000
#define DSB_OUTPUT_TO_BOTH    0x3000
#define DSB_TIMER0            0x0000
#define DSB_TIMER1            0x4000
#define DSB_FIFO_RESET        0x8000

// FIFO address defines
#define START_ON_FIFO_EMPTY 0x30000000
#define REG_FIFO_A          ((void *)0x040000A0)
#define REG_FIFO_B          ((void *)0x040000A4)

// Vblank frequency
#define VBLANKFREQ 59.727

