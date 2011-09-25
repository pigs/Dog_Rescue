//=============================================================
//	Hannah Yu
//	CS2261 Spring 2010
//
//	"Animal Rescue"
//
//	use the arrow keys to navigate the dog through the maze.  
//	avoid security guards or else you have to start all over!
//	all graphics were handmade!  :-)
//	hold A and B to follow the yellow brick road~
//
//=============================================================



#include "myLib.h"
#include "player.h"
#include "background.h"
#include "collisionmap.h"
#include "bgsound.h"
#include "bark.h"
#include "splash.h"
#include "instructions.h"
#include "pause.h"
#include "pause2.h"
#include "cheatbackground.h"
#include "win.h"

#define WHITE RGB(31,31,31)
#define SCREEN_WIDTH 240
#define SCREEN_HEIGHT 160

#define SPLASH 0
#define INSTRUCTIONS 1
#define GAME 2
#define WIN 3
#define PAUSE 4

#define STILL 0
#define MOVING 1


#define MASKCOL (0x1FF)
#define MASKROW (0XFF)

int hOff=0;
int vOff=0;

int buttons;
int lastButtons;

OBJ_ATTR shadowOAM[128];

int playerRow = 40;
int playerCol = 30;
int playerWidth = 14;
int playerHeight = 16;
int playerRVel = 1;
int playerCVel = 1;

int badguyRow = 440;
int badguyCol = 256;
int badguyWidth = 12;
int badguyHeight = 32;
int badguyRVel = 1;
int badguyCVel = 1;

int bigRow, bigCol;
int collMapSize = 512;

int vblankcountA = 0;
int vblankcountB = 0;
int timerintervalA = -((1<<24) / BGSOUNDFREQ);
int timerintervalB = -((1<<24) / BARKFREQ);
int startA;
int startB;
int numvblanksA =  VBLANKFREQ*BGSOUNDLEN/BGSOUNDFREQ;
int numvblanksB =  VBLANKFREQ*BARKLEN/BARKFREQ;
int play = 1;
int walkCounter = 1;
int previousSpriteState;
int spriteState = STILL;

int state = SPLASH;

void fillPicture(const u16 *picture);
void pollKeys();
void waitForVBlank();
void enableVBlankInterrupt();

void waitForKey();
void waitForNoKey();



int main(void)
{
    while(1)
    {
		previousSpriteState = spriteState;
        pollKeys();
		enableSounds();
		setupInterrupts();


		switch(state)
		{
			case SPLASH:
			{
				REG_DISPCNTL = BG2_ENABLE | MODE3;
				fillPicture((u16 *)splashBitmap);

				if (BUTTON_PRESSED(START_BUTTON))
				{
					state = GAME;
				}
				if (BUTTON_PRESSED(SELECT_BUTTON))
				{
					state = INSTRUCTIONS;
				}
			break;
			}

			case INSTRUCTIONS:
			{
				fillPicture((u16 *)instructionsBitmap);
				if (BUTTON_PRESSED(SELECT_BUTTON))
				{
					state = SPLASH;
				}
				break;
			}
			
			case GAME:
			{

				//load tiles
				DMA_MEMORY[3].source = backgroundTiles;
				DMA_MEMORY[3].destination = &CHARBLOCK[0];
				DMA_MEMORY[3].control = 12000 | DMA_ON;

				//load map
				DMA_MEMORY[3].source = backgroundMap;
				DMA_MEMORY[3].destination = &SCREENBLOCK[27];
				DMA_MEMORY[3].control = 4096 | DMA_ON;

				//load pallette
				DMA_MEMORY[3].source = backgroundPal;
				DMA_MEMORY[3].destination = PAL_MEM;
				DMA_MEMORY[3].control = 256 | DMA_ON;


				//load the sprites into memory
				DMA_MEMORY[3].source = playerTiles;
				DMA_MEMORY[3].destination = &CHARBLOCK[4];
				DMA_MEMORY[3].control = 16384 | DMA_ON;

				DMA_MEMORY[3].source = playerPal;
				DMA_MEMORY[3].destination = SPRITE_PALETTE;
				DMA_MEMORY[3].control = 256 | DMA_ON;
			    
			    
				//Hide all sprites
				int i;
				for(i=0; i<128; i++)
				{
					OAM[i].attr0 |= ATTR0_HIDE;
				}

				//Set Mode 0 BG 0 and Enable sprites. then set up the sprites
				REG_DISPCNTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
				REG_BG0CNT = BG_8BPP | BG_REG_64x64 | CBB(0) | SBB(27);

				REG_TM0CNT = 0;
				DMA[1].cnt = 0;

				REG_TM0D   = timerintervalA;       
				REG_TM0CNT = TIMER_ON;

				DMA[1].src = bgsound;
				DMA[1].dst = REG_FIFO_A;
				DMA[1].cnt = DMA_ON | START_ON_FIFO_EMPTY |
							 DMA_32 | DMA_REPEAT |
							 DMA_DESTINATION_FIXED;

				startA = vblankcountA;

				while(1){

					shadowOAM[0].attr0 = (playerRow & MASKROW) | ATTR0_TALL | ATTR0_REGULAR | ATTR0_8BPP;
					shadowOAM[0].attr1 = (playerCol & MASKCOL)| ATTR1_SIZE32;
					shadowOAM[0].attr2 = (SPRITEOFFSET16(0,0));

					shadowOAM[1].attr0 = badguyRow | ATTR0_TALL | ATTR0_REGULAR | ATTR0_8BPP;
					shadowOAM[1].attr1 = badguyCol | ATTR1_SIZE32;
					shadowOAM[1].attr2 = (SPRITEOFFSET16(0,8));

					pollKeys();
					bigRow = playerRow + vOff;
					bigCol = playerCol + hOff;

				switch(spriteState)
				{
					case STILL:
					{
						shadowOAM[0].attr2 = (SPRITEOFFSET16(0,0));
						break;
					}

					case MOVING:
					{
						if((walkCounter%2)==1)
							shadowOAM[0].attr2 = (SPRITEOFFSET16(0,4));
						else if((walkCounter%2==0))
						{
						shadowOAM[0].attr2 = (SPRITEOFFSET16(0,0)); 
						}
						break;
					}

				}	
				

					if(BUTTON_HELD(A_BUTTON) && BUTTON_HELD(B_BUTTON))
					{
						//load tiles
						DMA_MEMORY[3].source = cheatbackgroundTiles;
						DMA_MEMORY[3].destination = &CHARBLOCK[0];
						DMA_MEMORY[3].control = 11456 | DMA_ON;

						//load map
						DMA_MEMORY[3].source = cheatbackgroundMap;
						DMA_MEMORY[3].destination = &SCREENBLOCK[27];
						DMA_MEMORY[3].control = 4096 | DMA_ON;

						//load pallette
						DMA_MEMORY[3].source = cheatbackgroundPal;
						DMA_MEMORY[3].destination = PAL_MEM;
						DMA_MEMORY[3].control = 256 | DMA_ON;
					}
					if (BUTTON_HELD(RIGHT_BUTTON))
					{
						spriteState=MOVING;
						walkCounter++;
						if(collisionmapBitmap[((bigRow+playerHeight)*collMapSize)+(bigCol+playerCVel+playerWidth)]==WHITE)
						{
							if(playerCol<(SCREEN_WIDTH-(playerWidth+5))){
								playerCol+=playerCVel;
							}
							else if(hOff<(collMapSize-SCREEN_WIDTH))
							{
								hOff+=playerCVel;
							}
						}
					}
					if (BUTTON_HELD(LEFT_BUTTON))
					{
						spriteState=MOVING;
						walkCounter++;
						if(collisionmapBitmap[((bigRow+playerHeight)*collMapSize)+(bigCol+playerCVel)]==WHITE)
						{
							if(playerCol>(0))
							{
								playerCol-=playerCVel;
							}
							else if(hOff>(SCREEN_WIDTH-collMapSize))
							{
								hOff-=playerCVel;
							}
						}
					}
					if (BUTTON_HELD(UP_BUTTON))
					{
						spriteState=MOVING;
						walkCounter++;
						//Check collision and move
						if((collisionmapBitmap[(((bigRow-playerRVel)*collMapSize)+(bigCol+playerWidth))]==WHITE)&&
							(collisionmapBitmap[(((bigRow-playerRVel)*collMapSize)+(bigCol))]==WHITE))
						{
							if(playerRow>30)
							{
								playerRow-=playerRVel;
							}
							else if(vOff>0)
							{
								vOff-=playerRVel;
							}
						}
						
					}
					if (BUTTON_HELD(DOWN_BUTTON))
					{
						spriteState=MOVING;
						walkCounter++;
						//Check collision and move
						if((collisionmapBitmap[(((bigRow+playerHeight+playerRVel)*collMapSize)+(bigCol+playerWidth))]==WHITE)&&
							(collisionmapBitmap[(((bigRow+playerHeight+playerRVel)*collMapSize)+(bigCol))]==WHITE))
						{

							if(playerRow<(SCREEN_HEIGHT-(playerHeight)))
							{
								playerRow+=playerRVel;
							}
							else if(vOff<(collMapSize-SCREEN_HEIGHT))
							{
								vOff+=playerRVel;
							}
						if((playerRow > 440) && (playerCol > 464))
						{
							state = WIN;
						}
						}


					}
					if (BUTTON_PRESSED(START_BUTTON))
					{
							REG_TM1CNT = 0;
							DMA[2].cnt = 0;
						
							REG_TM1D   = timerintervalB;       
							REG_TM1CNT = TIMER_ON;

							DMA[2].src = bark;
							DMA[2].dst = REG_FIFO_B;
							DMA[2].cnt = DMA_ON | START_ON_FIFO_EMPTY |
										 DMA_32 | DMA_REPEAT |
										 DMA_DESTINATION_FIXED;

							startB = vblankcountB;
					}
					if (BUTTON_PRESSED(SELECT_BUTTON))
					{
						//waitForNoKey();
						state = PAUSE;
					}
					
					waitForVBlank();
					OAM[0] = shadowOAM[0];
					OAM[1] = shadowOAM[1];

					REG_BG0HOFS = hOff;
					REG_BG0VOFS = vOff;

				}

			}

				case WIN:
				{
					while(1);
				}

				case PAUSE:
				{
					if(BUTTON_PRESSED(SELECT_BUTTON))
					{
						state=GAME;
					}
				}

		}

	}

    return 0;
}



void enableSounds(void)
{
REG_SOUNDCNT_X = SND_ENABLED;
	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
					 DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER0 |
                     DSB_FIFO_RESET;
	REG_SOUNDCNT_L = 0;
}


void setupInterrupts(void) 
{
  REG_IME = 0x0;							
  REG_INTERRUPT = (u32)interruptHandler;	
  enableVBlankInterrupt();					
  REG_IME = 0x1;							
}

void enableVBlankInterrupt() 
{
	REG_DISPSTAT |= INT_VBLANK_ENABLE;												
	REG_IE = REG_IE | INT_VB;											
}


void interruptHandler(void) 
{
	REG_IME = 0;			
	if (REG_IF == INT_VB) 
	{		 
		vblankcountA++;
		vblankcountB++;	

		if((vblankcountA - startA) >= (numvblanksA - 1))  
		{
			
		REG_TM0CNT = 0;
		DMA[1].cnt = 0;
		
		REG_TM0D   = timerintervalA;       
		REG_TM0CNT = TIMER_ON;

		DMA[1].src = bgsound;
		DMA[1].dst = REG_FIFO_A;
		DMA[1].cnt = DMA_ON | START_ON_FIFO_EMPTY |
					 DMA_32 | DMA_REPEAT |
					 DMA_DESTINATION_FIXED;

		startA = vblankcountA;
		}
	
		if((vblankcountB - startB) >= (numvblanksB - 1))  
		{
			REG_TM1CNT = 0;
			DMA[2].cnt = 0;
			REG_TM1D   = timerintervalB;       
			REG_TM1CNT = TIMER_ON;

			DMA[2].src = bark;
			DMA[2].dst = REG_FIFO_B;
			DMA[2].cnt = DMA_ON | START_ON_FIFO_EMPTY |
						 DMA_32 | DMA_DESTINATION_FIXED;
			startB = vblankcountB;

		}
	}
	REG_IF = REG_IF;		
	REG_IME = 1;		
}

void fillPicture(const u16 *picture)
{
	DMA[3].src = picture;
	DMA[3].dst = videoBuffer;
	DMA[3].cnt = (240*160)  | DMA_ON;
}

void pollKeys(void)
{
	lastButtons = buttons;
	buttons = ~(*rawButtons);
}

void waitForVBlank()
{
	// If already in vblank wait until we are at top of screen
	while(*scanlineCounter > 160);
	// Now wait until start of vblank
	while(*scanlineCounter < 160);
}

void waitForKey()
{
	while(!((~BUTTONS) & 0x03FF)) {}
}
void waitForNoKey()
{
	while((~BUTTONS) & 0x03FF) {}
}