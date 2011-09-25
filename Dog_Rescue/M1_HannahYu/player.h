
//{{BLOCK(player)

//======================================================================
//
//	player, 128x256@8, 
//	+ palette 256 entries, not compressed
//	+ 512 tiles not compressed
//	Total size: 512 + 32768 = 33280
//
//	Time-stamp: 2010-04-28, 10:21:14
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __PLAYER__
#define __PLAYER__

#define playerTilesLen 32768
extern const unsigned short playerTiles[16384];

#define playerPalLen 512
extern const unsigned short playerPal[256];

#endif // __PLAYER__

//}}BLOCK(player)
