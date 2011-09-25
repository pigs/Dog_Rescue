
//{{BLOCK(pause)

//======================================================================
//
//	pause, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 124 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 7936 + 4096 = 12544
//
//	Time-stamp: 2010-04-28, 03:09:20
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __PAUSE__
#define __PAUSE__

#define pauseTilesLen 7936
extern const unsigned short pauseTiles[3968];

#define pauseMapLen 4096
extern const unsigned short pauseMap[2048];

#define pausePalLen 512
extern const unsigned short pausePal[256];

#endif // __PAUSE__

//}}BLOCK(pause)
