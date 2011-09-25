
//{{BLOCK(background)

//======================================================================
//
//	background, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 375 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 24000 + 8192 = 32704
//
//	Time-stamp: 2010-04-28, 10:46:38
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __BACKGROUND__
#define __BACKGROUND__

#define backgroundTilesLen 24000
extern const unsigned short backgroundTiles[12000];

#define backgroundMapLen 8192
extern const unsigned short backgroundMap[4096];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // __BACKGROUND__

//}}BLOCK(background)
