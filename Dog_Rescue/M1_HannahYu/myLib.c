#include "myLib.h"

int buttons;
int lastButtons;

double timefactors[] = {0.059604, 3.811, 15.259, 59.382};


// Draw a rectangle in Mode 4 
// with upper left corner at (row, col)
void drawRect4(int row, int col, int height, int width, volatile u8 index)
{
	int r;
	u16 color = index<<8 | index;
	col = col/2*2;
	DMA[3].src = &color;
	for(r=0; r<height; r++)
	{
		DMA[3].dst = &videoBuffer[OFFSET(row+r, col, 240)/2];
		DMA[3].cnt = width/2 | DMA_SOURCE_FIXED | DMA_ON;
	}
}

void drawPicture4(int row, int col, int height, int width, unsigned short *index)
{
	int r;
	col = col>>1<<1;
	for(r=0; r<height; r++)
	{
		DMA[3].src = &index[(r * width/2)];
		DMA[3].dst = &videoBuffer[OFFSET(row+r, col, 240)/2];
		DMA[3].cnt = width/2 | DMA_DESTINATION_INCREMENT | DMA_ON;
	}
}

void drawPicture3(int row, int col, int height, int width, unsigned short* SRC)
{
	int r;
	
	for(r=0; r<height; r++)
	{
		DMA[3].src = &SRC[(r * width)];
		DMA[3].dst = &videoBuffer[OFFSET(row+r, col, 240)];
		DMA[3].cnt = width | DMA_DESTINATION_INCREMENT | DMA_ON;
	}
}

// Draw a rectangle in Mode 3 with upper left corner 
// at (row, col) using DMA
void drawRect(int row, int col, int height, int width, volatile u16 color)
{
	int r;
	DMA[3].src = &color;
	for(r=0; r<height; r++)
	{
		DMA[3].dst = &videoBuffer[OFFSET(row+r, col, 240)];
		DMA[3].cnt = width | DMA_SOURCE_FIXED | DMA_ON;
	}
}


void setPixel(int row, int col, u16 color)
{
	videoBuffer[OFFSET(row,col,240)] = color;
}

void setPixel4(int row, int col, unsigned char index)
{
	int shrt = OFFSET(row,col,240)/2;
	if(col & 1) // Is it an odd column
	{
		// Yes
		videoBuffer[shrt] = (videoBuffer[shrt] & 0xFF) | (index << 8);
	}
	else
	{
		videoBuffer[shrt] = (videoBuffer[shrt] & 0xFF00) | index;
	}
}

void delay(int clicks)
{
	int  i;
	for(i=0; i<clicks; i++)
	{
	}
}


void fillScreen(volatile u16 color)
{
	DMA[3].src = &color;
	DMA[3].dst = videoBuffer;
	DMA[3].cnt = (240*160) | DMA_SOURCE_FIXED | DMA_ON;
}

void fillScreen4(volatile unsigned char index)
{
	volatile unsigned short color = (index<<8) | index;
	DMA[3].src = &color;
	DMA[3].dst = videoBuffer;
	DMA[3].cnt = (240*160/2) | DMA_SOURCE_FIXED | DMA_ON;
}

void fillPicture4(volatile unsigned short  *index)
{
	
	DMA[3].src = &index;
	DMA[3].dst = videoBuffer;
	DMA[3].cnt = (240*160/2) | DMA_SOURCE_FIXED | DMA_ON;
}



void FlipPage()
{
	if(REG_DISPCNTL & BUFFERFLAG)
	{
		REG_DISPCNTL &= ~BUFFERFLAG;
		videoBuffer = BUFFER1;
	}
	else
	{
		REG_DISPCNTL |= BUFFERFLAG;
		videoBuffer = BUFFER0;
	}
}

void dmaTransfer(void *destination, const void *source, u32 chunks, u32 mode)
{
	DMA_MEMORY[3].source = source;
	DMA_MEMORY[3].destination = destination;
	DMA_MEMORY[3].control = chunks | mode;
}


