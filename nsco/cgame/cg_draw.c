// Copyright (C) 1999-2000 Id Software, Inc.
//
// cg_draw.c -- draw all of the graphical elements during
// active (after loading) gameplay

// every line of code that differs from the quake3:arena SDK
// is property of manfred nerurkar
// no commercial explotation allowed
// you are only allowed to use this code in navy seals: covert operations 
// a quake3 arena modifiation
// defcon-x@ns-co.net

#include "cg_local.h"
#include "variables.h"

#ifdef MISSIONPACK
#include "../ui/ui_shared.h"

// used for scoreboard
extern displayContextDef_t cgDC;
menuDef_t *menuScoreboard = NULL;
#else
int drawTeamOverlayModificationCount = -1;
#endif

int sortedTeamPlayers[TEAM_MAXOVERLAY];
int	numSortedTeamPlayers;
int nextChBlinik = 0;
qboolean chBlink = qfalse;

char systemChat[256];
char teamChat1[256];
char teamChat2[256];


#ifdef MISSIONPACK

int CG_Text_Width(const char *text, float scale, int limit) {
  int count,len;
	float out;
	glyphInfo_t *glyph;
	float useScale;
	const char *s = text;
	fontInfo_t *font = &cgDC.Assets.textFont;
	if (scale <= cg_smallFont.value) {
		font = &cgDC.Assets.smallFont;
	} else if (scale > cg_bigFont.value) {
		font = &cgDC.Assets.bigFont;
	}
	useScale = scale * font->glyphScale;
  out = 0;
  if (text) {
    len = strlen(text);
		if (limit > 0 && len > limit) {
			len = limit;
		}
		count = 0;
		while (s && *s && count < len) {
			if ( Q_IsColorString(s) ) {
				s += 2;
				continue;
			} else {
				glyph = &font->glyphs[*s];
				out += glyph->xSkip;
				s++;
				count++;
			}
    }
  }
  return out * useScale;
}

int CG_Text_Height(const char *text, float scale, int limit) {
  int len, count;
	float max;
	glyphInfo_t *glyph;
	float useScale;
	const char *s = text;
	fontInfo_t *font = &cgDC.Assets.textFont;
	if (scale <= cg_smallFont.value) {
		font = &cgDC.Assets.smallFont;
	} else if (scale > cg_bigFont.value) {
		font = &cgDC.Assets.bigFont;
	}
	useScale = scale * font->glyphScale;
  max = 0;
  if (text) {
    len = strlen(text);
		if (limit > 0 && len > limit) {
			len = limit;
		}
		count = 0;
		while (s && *s && count < len) {
			if ( Q_IsColorString(s) ) {
				s += 2;
				continue;
			} else {
				glyph = &font->glyphs[*s];
	      if (max < glyph->height) {
		      max = glyph->height;
			  }
				s++;
				count++;
			}
    }
  }
  return max * useScale;
}

void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
  float w, h;
  w = width * scale;
  h = height * scale;
  CG_AdjustFrom640( &x, &y, &w, &h );
  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
}

void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) 
{
	int len, count;
	vec4_t newColor;
	glyphInfo_t *glyph;
	float useScale;
	fontInfo_t *font = &cgDC.Assets.textFont;

	if (scale <= cg_smallFont.value) {
		font = &cgDC.Assets.smallFont;
	} else if (scale > cg_bigFont.value) {
		font = &cgDC.Assets.bigFont;
	}
	useScale = scale * font->glyphScale;

	if (text) {
		const char *s = text;
		trap_R_SetColor( color );
		memcpy(&newColor[0], &color[0], sizeof(vec4_t));

		len = strlen(text);

		if (limit > 0 && len > limit) {
			len = limit;
		}
		count = 0;

		while (s && *s && count < len) 
		{
			glyph = &font->glyphs[*s];
      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
			if ( Q_IsColorString( s ) ) 
			{
				memcpy( newColor, g_color_table[ ColorIndex( *(s+1) ) ], sizeof( newColor ) );
				newColor[3] = color[3];
				trap_R_SetColor( newColor );
				s += 2;
				continue;
			} 
			else 
			{
				float yadj = useScale * glyph->top;

				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE || style == ITEM_TEXTSTYLE_OUTLINESHADOWED) 
				{
					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;

					colorBlack[3] = newColor[3];
					trap_R_SetColor( colorBlack );

					CG_Text_PaintChar(x + ofs, y - yadj + ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph);
					colorBlack[3] = 1.0;
					trap_R_SetColor( newColor );
				}
				
				if (style == ITEM_TEXTSTYLE_OUTLINED || style == ITEM_TEXTSTYLE_OUTLINESHADOWED ) 
				{ 
					
					int ofs = 1;
					colorBlack[3] = newColor[3];
					if ( colorBlack[3] <= 0.0f)
						colorBlack[3] = 0.0f;

					trap_R_SetColor( colorBlack );


				
					CG_Text_PaintChar(x + ofs, y - yadj + ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 

					
					CG_Text_PaintChar(x - ofs, y - yadj + ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 
					CG_Text_PaintChar(x + ofs, y - yadj - ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 
					CG_Text_PaintChar(x - ofs, y - yadj - ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 
					CG_Text_PaintChar(x - ofs, y - yadj, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 
					CG_Text_PaintChar(x + ofs, y - yadj, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 

					colorBlack[3] = 1.0;
					trap_R_SetColor( newColor );
				}
				
				CG_Text_PaintChar(x, y - yadj, 
													glyph->imageWidth,
													glyph->imageHeight,
													useScale, 
													glyph->s,
													glyph->t,
													glyph->s2,
													glyph->t2,
													glyph->glyph);
				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
				x += (glyph->xSkip * useScale) + adjust;
				s++;
				count++;
			}
    }
	  trap_R_SetColor( NULL );
  }
}

//
// special NS:CO version

void CG_Text_PaintChar2(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
	float w = width, h = height;
//	w = width * scale;
//	h = height * scale;
//  CG_AdjustFrom640( &x, &y, &w, &h );

	/*

	if ( cgs.glconfig.vidWidth < 1024 )
	{
		x = x * ( (float)cgs.glconfig.vidWidth/1024.0f );
		y = y * ( (float)cgs.glconfig.vidHeight/768.0f );
		width = width * ( (float)cgs.glconfig.vidWidth/1024.0f );
		height = height * ( (float)cgs.glconfig.vidHeight/768.0f ); 
	}*/
 //	if ( cgs.glconfig.vidWidth < 1024 )
	{
		x = x * ( (float)cgs.glconfig.vidWidth/1024.0f );
		y = y * ( (float)cgs.glconfig.vidHeight/768.0f );
		w = width * ( (float)cgs.glconfig.vidWidth/1024.0f );
		h = height * ( (float)cgs.glconfig.vidHeight/768.0f ); 
	}
	w *= scale;
	h *= scale;

	trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
}

void CG_Text_Paint2(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) 
{
	int len, count;
	vec4_t newColor;
	glyphInfo_t *glyph;
	float useScale;
	fontInfo_t *font = &cgDC.Assets.textFont;

	if (scale <= cg_smallFont.value) {
		font = &cgDC.Assets.smallFont;
	} else if (scale > cg_bigFont.value) {
		font = &cgDC.Assets.bigFont;
	}
	useScale = scale * font->glyphScale;

	if (text) {
		const char *s = text;
		trap_R_SetColor( color );
		memcpy(&newColor[0], &color[0], sizeof(vec4_t));

		len = strlen(text);

		if (limit > 0 && len > limit) {
			len = limit;
		}
		count = 0;

		while (s && *s && count < len) 
		{
			glyph = &font->glyphs[*s];
      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
			if ( Q_IsColorString( s ) ) 
			{
				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
				newColor[3] = color[3];
				trap_R_SetColor( newColor );
				s += 2;
				continue;
			} 
			else 
			{
				float yadj = useScale * glyph->top;

				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE || style == ITEM_TEXTSTYLE_OUTLINESHADOWED) 
				{
					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;

					colorBlack[3] = newColor[3];
					trap_R_SetColor( colorBlack );

					CG_Text_PaintChar2(x + ofs, y - yadj + ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph);
					colorBlack[3] = 1.0;
					trap_R_SetColor( newColor );
				}
				
				if (style == ITEM_TEXTSTYLE_OUTLINED || style == ITEM_TEXTSTYLE_OUTLINESHADOWED ) 
				{ 
					
					int ofs = 1;
					colorBlack[3] = newColor[3];
					if ( colorBlack[3] <= 0.0f)
						colorBlack[3] = 0.0f;

					trap_R_SetColor( colorBlack );


				
					CG_Text_PaintChar2(x + ofs, y - yadj + ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 

					
					CG_Text_PaintChar2(x - ofs, y - yadj + ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 
					CG_Text_PaintChar2(x + ofs, y - yadj - ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 
					CG_Text_PaintChar2(x - ofs, y - yadj - ofs, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 
					CG_Text_PaintChar2(x - ofs, y - yadj, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 
					CG_Text_PaintChar2(x + ofs, y - yadj, 
														glyph->imageWidth,
														glyph->imageHeight,
														useScale, 
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph); 

					colorBlack[3] = 1.0;
					trap_R_SetColor( newColor );
				}
				
				CG_Text_PaintChar2(x, y - yadj, 
													glyph->imageWidth,
													glyph->imageHeight,
													useScale, 
													glyph->s,
													glyph->t,
													glyph->s2,
													glyph->t2,
													glyph->glyph);
				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
				x += (glyph->xSkip * useScale) + adjust;
				s++;
				count++;
			}
    }
	  trap_R_SetColor( NULL );
  }
} 

#endif

#if 0
/*
==============
CG_DrawDigits

Draws Digits for Hud
==============
*/
static void CG_DrawDigits (int x, int y, int width, int value) {
	char	num[16], *ptr;
	int		l;
	int		frame;

	if ( width < 1 ) {
		return;
	}

	// draw number string
	if ( width > 5 ) {
		width = 5;
	}

	switch ( width ) {
	case 1:
		value = value > 9 ? 9 : value;
		value = value < 0 ? 0 : value;
		Com_sprintf (num, sizeof(num), "%i", value);
		break;
	case 2:
		value = value > 99 ? 99 : value;
		value = value < -9 ? -9 : value;
		
		if ( value < 10 )
			Com_sprintf (num, sizeof(num), "0%i", value);
		else
			Com_sprintf (num, sizeof(num), "%i", value);
		break;
	case 3:
		value = value > 999 ? 999 : value;
		value = value < -99 ? -99 : value;
		if ( value < 10 )
			Com_sprintf (num, sizeof(num), "00%i", value);
		else if ( value < 100 )
			Com_sprintf (num, sizeof(num), "0%i", value);
		else
			Com_sprintf (num, sizeof(num), "%i", value);
		break;
	case 4:
		value = value > 9999 ? 9999 : value;
		value = value < -999 ? -999 : value;
		if ( value < 10 )
			Com_sprintf (num, sizeof(num), "000%i", value);
		else if ( value < 100 )
			Com_sprintf (num, sizeof(num), "00%i", value);
		else if ( value < 1000 )
			Com_sprintf (num, sizeof(num), "0%i", value);
		else
			Com_sprintf (num, sizeof(num), "%i", value);
		break;
	}

	l = strlen(num);
	if (l > width)
		l = width;
	x += 2 + 24*(width - l);

	ptr = num;
	while (*ptr && l)
	{
		if (*ptr == '-')
			frame = STAT_MINUS;
		else
			frame = *ptr -'0';

		CG_DrawPic( x,y, 24, 32, cgs.media.digitalNumberShaders[frame] );
		x += 24;
		ptr++;
		l--;
	}
}

#endif

/*
==============
CG_DrawField

Draws large numbers for status bar and powerups
==============
*/
#ifndef MISSIONPACK
static void CG_DrawField (int x, int y, int width, int value) {
	char	num[16], *ptr;
	int		l;
	int		frame;

	if ( width < 1 ) {
		return;
	}

	// draw number string
	if ( width > 5 ) {
		width = 5;
	}

	switch ( width ) {
	case 1:
		value = value > 9 ? 9 : value;
		value = value < 0 ? 0 : value;
		break;
	case 2:
		value = value > 99 ? 99 : value;
		value = value < -9 ? -9 : value;
		break;
	case 3:
		value = value > 999 ? 999 : value;
		value = value < -99 ? -99 : value;
		break;
	case 4:
		value = value > 9999 ? 9999 : value;
		value = value < -999 ? -999 : value;
		break;
	}

	Com_sprintf (num, sizeof(num), "%i", value);
	l = strlen(num);
	if (l > width)
		l = width;
	x += 2 + CHAR_WIDTH*(width - l);

	ptr = num;
	while (*ptr && l)
	{
		if (*ptr == '-')
			frame = STAT_MINUS;
		else
			frame = *ptr -'0';

		CG_DrawPic( x,y, CHAR_WIDTH, CHAR_HEIGHT, cgs.media.numberShaders[frame] );
		x += CHAR_WIDTH;
		ptr++;
		l--;
	}
}
#endif

/*
================
CG_Draw3DModel

================
*/
void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
	refdef_t		refdef;
	refEntity_t		ent;

	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
		return;
	}

	CG_AdjustFrom640( &x, &y, &w, &h );

	memset( &refdef, 0, sizeof( refdef ) );

	memset( &ent, 0, sizeof( ent ) );
 
	AnglesToAxis( angles, ent.axis );
	VectorCopy( origin, ent.origin );
	ent.hModel = model;
	ent.customSkin = skin;
	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
	
	ent.nonNormalizedAxes = qtrue;

	refdef.rdflags = RDF_NOWORLDMODEL;

	AxisClear( refdef.viewaxis );

	refdef.fov_x = 30;
	refdef.fov_y = 30;

	refdef.x = x;
	refdef.y = y;
	refdef.width = w;
	refdef.height = h;

	refdef.time = cg.time;

	trap_R_ClearScene();
	trap_R_AddRefEntityToScene( &ent );
	trap_R_RenderScene( &refdef );
}

/*
================
CG_DrawHead

Used for both the status bar and the scoreboard
================
*/
void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) {
	clipHandle_t	cm;
	clientInfo_t	*ci;
	float			len;
	vec3_t			origin;
	vec3_t			mins, maxs;

	ci = &cgs.clientinfo[ clientNum ];

	if ( cg_draw3dIcons.integer ) {
		cm = ci->headModel;
		if ( !cm ) {
			return;
		}

		// offset the origin y and z to center the head
		trap_R_ModelBounds( cm, mins, maxs );

		origin[2] = -0.5 * ( mins[2] + maxs[2] );
		origin[1] = 0.5 * ( mins[1] + maxs[1] );

		// calculate distance so the head nearly fills the box
		// assume heads are taller than wide
		len = 0.7 * ( maxs[2] - mins[2] );		
		origin[0] = len / 0.268;	// len / tan( fov/2 )

		// allow per-model tweaking
		VectorAdd( origin, ci->headOffset, origin );

		CG_Draw3DModel( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles );
	}/* else if ( cg_drawIcons.integer ) {
		CG_DrawPic( x, y, w, h, ci->modelIcon );
	}*/

	// if they are deferred, draw a cross out
	if ( ci->deferred ) {
		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
	}
}
 
/*
================
CG_DrawTeamBackground

================
*/
void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
{
	vec4_t		hcolor;

	hcolor[3] = alpha;
	if ( team == TEAM_RED ) {
		hcolor[0] = 1;
		hcolor[1] = 0;
		hcolor[2] = 0;
	} else if ( team == TEAM_BLUE ) {
		hcolor[0] = 0;
		hcolor[1] = 0;
		hcolor[2] = 1;
	} else {
		hcolor[0] = 0.2f;
		hcolor[1] = 0.8f;
		hcolor[2] = 0.2f; 
	}
	trap_R_SetColor( hcolor );
	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
	trap_R_SetColor( NULL );
}

#if 0
/*
================
CG_DrawStatusBar

================
*/
static void CG_DrawStatusBar( void ) {
	centity_t		*cent;
	playerState_t	*ps;
	int				value;
	vec3_t			angles;
	int				x,y;
	int				weapon;

//	vec4_t		hudGrey = {0.5f, 0.5f, 0.5f, 1.00f};
	vec4_t		hudGreen = {0,0.5f,0,1.00f};
	vec4_t		hudRed = {0.5f,0,0,1.00f};
	vec4_t		hudBlue = {0,0,0.75f,1.00f};	
	vec4_t		hudBlack = {0.125f,0.125f,0.125f,1.00f};	
	vec4_t		hudWhite = {1.0f,1.0f,1.0f,1.00f};
	

	if ( cg_drawStatus.integer == 0 ) {
		return;
	} 

	cent = &cg_entities[cg.snap->ps.clientNum];
	ps = &cg.snap->ps;
	weapon = ps->weapon;

	VectorClear( angles );
   
	if (test_x.integer > 0 || test_y.integer > 0  || test_h.integer > 0  || test_w.integer > 0  )
	{
		CG_DrawPic( test_x.integer ,test_y.integer , test_h.integer, test_w.integer, cgs.media.whiteShader );
	} 

 	x = 480;
	y = 450;

	//
	// stamina power
	// 
	{
		vec4_t hcolor;
		float	stamina;
		float	stamina_cur = ps->stats[STAT_STAMINA];

		// background layer for healthlocator + stamina 
		CG_DrawTeamBackground( 0, 382 , 88, 100, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );

		stamina = (  (  stamina_cur / 300 ) * ( 16 * 6 )  ) - 5;
		CG_FillRect( 4 * 16 , 480-96, 16, 96, hudBlack );

		CG_GetColorForHealth ( ps->stats[STAT_STAMINA] / 3, 0, hcolor );
		CG_FillRect( 4 * 16 + 4 , 478-stamina, 8, stamina, hcolor);

		CG_FillRect( 64 , 478, 16, 2, hudBlack );  
	}
 
	//
	// clips
	//
	if ( weapon > WP_SEALKNIFE) {
		gitem_t *item;
		int		clipGfx = 0;

		// background layer for clips + ammo
		CG_DrawTeamBackground( 88, 447, 640, 40, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );

		if ( BG_IsShotgun( weapon ) )
			clipGfx = 1;
		else if ( weapon == WP_GRENADE )
			clipGfx = 2;
		else if ( weapon == WP_FLASHBANG )
			clipGfx = 3;
		else if ( weapon == WP_SMOKE )
			clipGfx = 3;
		else if (ps->stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) && ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ))
			clipGfx = 4;

		item = BG_FindItemForWeapon( weapon );

		if (ps->stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) && ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ))
			value = ps->ammo[ AM_40MMGRENADES ]; // dX
		else
			value = ps->ammo[ item->giAmmoTag ]; // dX


		// draw the bullet pic
		if ( (cg.time >> 8) & 1 && value <= 1)
			trap_R_SetColor(hudRed);
		else
			trap_R_SetColor(hudWhite);
		CG_DrawPic( 640 - 32, 480 - 32 , 32, 32, cgs.media.clipIcon[clipGfx] );
		trap_R_SetColor( NULL ); 

		if ( value > -1 ) {	 		

			if ( value <= 1 && ( (cg.time >> 8) & 1 && value <= 1)) 
				trap_R_SetColor(hudRed);  
			else
				trap_R_SetColor(hudWhite);

			CG_DrawDigits ( 640 - ( 5 * 16 ) , 480 - 32 , 2, value);
			trap_R_SetColor( NULL ); 
		}  
	}

	//
	// rounds
	//
	if ( cent->currentState.weapon > WP_FLASHBANG &&
		!( (cent->currentState.weapon == WP_M4 || cent->currentState.weapon == WP_AK47) && (ps->stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) ) && ( ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ) ) ) &&
		!( (cent->currentState.weapon == WP_M4 || cent->currentState.weapon == WP_AK47) && (ps->stats[STAT_WEAPONMODE] & ( 1 << WM_BAYONET ) ) && ( ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ) ) ) ) 
	{
		
		int i,x1 ;
		int times = 0;

		value = ps->stats[STAT_ROUNDS]; // dX 

		if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
			&& cg.predictedPlayerState.weaponTime > 50 )
			trap_R_SetColor( hudBlue );
		else if ( cg.predictedPlayerState.weaponstate == WEAPON_RELOADING
			&& cg.predictedPlayerState.weaponTime > 100 )
			trap_R_SetColor( hudGreen );
		else {
			if (value <= 5)
				trap_R_SetColor( hudRed );
			else
				trap_R_SetColor( hudWhite );
		} 

		while (value > 15) 
		{ 
			times++;
			value -= 15; 
		}

		x1 = 640 - 16 * 16;  

		for (i=0;i<15;i++)
		{ 
			if ( i < value ) {
				if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
					&& cg.predictedPlayerState.weaponTime > 50 )
					trap_R_SetColor( hudBlue ); 
			}
			else
				trap_R_SetColor( hudBlack );

			if ( BG_IsRifle( ps->weapon ) )
				CG_DrawPic( x1, 480 - 32 , 16, 32, cgs.media.ammoMag_bullet[1] );
			else if ( BG_IsShotgun( ps->weapon ) )
				CG_DrawPic( x1, 480 - 32 , 16, 32, cgs.media.ammoMag_bullet[2] );
			else
				CG_DrawPic( x1, 480 - 32 , 16, 32, cgs.media.ammoMag_bullet[0] );

			x1 -= 16;

			if ( i==14)
				break;
		}

		trap_R_SetColor(hudWhite);
		CG_DrawPic(  640 - 15 * 16, 480 - 32, 16, 32, cgs.media.slashIcon ); 
		CG_DrawDigits (640 - 14 * 16 , 480-32 , 2, times); 
 
		trap_R_SetColor( NULL ); 


	} 
	//
	// health locator
	//
	{
		vec4_t		hcolor;

	
		CG_GetColorForHealth( /* 1 0 0 - */ ps->stats[STAT_HEALTH] - ps->stats[STAT_CHEST_DAMAGE] , 0, hcolor ); 
		trap_R_SetColor( hcolor ); 
			CG_DrawPic (0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_chestIcon);			
		trap_R_SetColor( NULL );

		CG_GetColorForHealth( /* 1 0 0 - */ ps->stats[STAT_HEALTH]  - ps->stats[STAT_STOMACH_DAMAGE] ,0, hcolor );
		trap_R_SetColor( hcolor ); 
			CG_DrawPic (0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_stomachIcon);	 
		trap_R_SetColor( NULL );

		CG_GetColorForHealth( /* 1 0 0 - */ ps->stats[STAT_HEALTH]  - ps->stats[STAT_ARM_DAMAGE] ,0, hcolor ); 
		trap_R_SetColor( hcolor ); 
			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_leftArmIcon);
			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_rightArmIcon);
		trap_R_SetColor( NULL );

		CG_GetColorForHealth( /* 100 - */ ps->stats[STAT_HEALTH]  - ps->stats[STAT_LEG_DAMAGE] ,0, hcolor ); 
		trap_R_SetColor( hcolor ); 
			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_leftLegIcon);
			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_rightLegIcon);
		trap_R_SetColor( NULL );

		CG_GetColorForHealth( /* 100 - */ ps->stats[STAT_HEALTH]  - ps->stats[STAT_HEAD_DAMAGE] ,0, hcolor );
		trap_R_SetColor( hcolor ); 
			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_headIcon);
		trap_R_SetColor( NULL );

		trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLACK)] );
			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_bodyLines);		
		trap_R_SetColor( NULL );
	}

	//
	// Weaponmode Display
	//
	{
		char *mode = ""; 
		int	weaponmode = ps->stats[STAT_WEAPONMODE];

		if ( (weapon == WP_M4 || weapon == WP_AK47) && (weaponmode & ( 1 << WM_GRENADELAUNCHER ) ) && ( weaponmode & ( 1 << WM_WEAPONMODE2 ) ) )
		{
			mode = "GrenadeLauncher";
		}
		else if ( (weapon == WP_M4 || weapon == WP_AK47) && (weaponmode & ( 1 << WM_BAYONET ) ) && ( weaponmode & ( 1 << WM_WEAPONMODE2 ) ) )
		{
			mode = "Stab Mode";
		} 
		else if ( (weapon == WP_PSG1
#ifdef SL8SD
			|| weapon == WP_SL8SD 
#endif
			|| weapon == WP_MACMILLAN ) && (( weaponmode & ( 1 << WM_ZOOM4X) )||( weaponmode & ( 1 << WM_ZOOM2X) )) ) // got 4x zoom
		{
			// if i want to switch to 
			if ( weaponmode & ( 1 << WM_ZOOM4X) )
				mode = "4x Zoom";
			else if ( weaponmode & (1 << WM_ZOOM2X) )
				mode = "2x Zoom";				
		}
		else if ( weaponmode & (1 << WM_SCOPE ) && ( weaponmode & (1 << WM_ZOOM2X) ) ) // scope add-on only2x
		{
			mode = "2x Zoom";
		}
		else if ( weaponmode & (1 << WM_LASER ) && ( weaponmode & (1 << WM_LACTIVE) ) ) // can't have scope + lasersight
		{ 
			mode = "Laser On";
		}		
		else if ( BG_IsGrenade( weapon ) )
		{
			int sec = 3;

			if ( weaponmode & ( 1 << WM_SINGLE) )
				sec = 4;
			else if ( weaponmode & ( 1 << WM_WEAPONMODE2 ) )
				sec = 5;

			if ( weaponmode & ( 1 << WM_GRENADEROLL ) )			
				mode = va( "%is Roll", sec ); 
			else 
				mode = va( "%is Throw", sec ); 
		}
		else if ( weapon == WP_PDW && ( weaponmode & ( 1 << WM_WEAPONMODE2 ) ) )
		{ 
			mode = "Recoilcatcher";			
		} 
		else if ( weapon == WP_M4 || weapon == WP_MAC10 || weapon == WP_AK47 || weapon == WP_MP5 || weapon == WP_PDW   )
		{ 
			// if i want to switch to 
			if ( weaponmode & ( 1 << WM_SINGLE) )			
				mode = "Single Shot";
			else
				mode = "Full Auto";  
		}
		else if ( !BG_IsMelee(weapon) )
			mode = "Semi Auto";

		// background layer for weaponmode
		CG_DrawTeamBackground( 639 - strlen(mode) * 16, 447-17, 1 + strlen(mode) * 16 , 17, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );
		
		CG_DrawStringOutline( 640 - strlen(mode) * 16, 480 - 3 * 16, mode, hudWhite );
	} 

}
#endif

#if 0
/*
================
CG_DrawStatusBar

================
*/
#ifndef MISSIONPACK
static void CG_DrawStatusBar( void ) {
	int			color;
	centity_t	*cent;
	playerState_t	*ps;
	int			value;
	vec4_t		hcolor;
	vec3_t		angles;
	vec3_t		origin;
#ifdef MISSIONPACK
	qhandle_t	handle;
#endif
	static float colors[4][4] = { 
//		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
		{ 1.0f, 0.69f, 0.0f, 1.0f } ,		// normal
		{ 1.0f, 0.2f, 0.2f, 1.0f },		// low health
		{0.5f, 0.5f, 0.5f, 1.0f},			// weapon firing
		{ 1.0f, 1.0f, 1.0f, 1.0f } };			// health > 100

	if ( cg_drawStatus.integer == 0 ) {
		return;
	}

	// draw the team background
	CG_DrawTeamBackground( 0, 420, 640, 60, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );

	cent = &cg_entities[cg.snap->ps.clientNum];
	ps = &cg.snap->ps;

	VectorClear( angles );

	// draw any 3D icons first, so the changes back to 2D are minimized
/*	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
		origin[0] = 70;
		origin[1] = 0;
		origin[2] = 0;
		angles[YAW] = 90 + 20 * sin( cg.time / 1000.0 );
		CG_Draw3DModel( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE,
					   cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
	}
*/
	CG_DrawStatusBarHead( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE );

	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_RED );
	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_BLUE );
	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_FREE );
	}

/*	if ( ps->stats[ STAT_ARMOR ] ) {
		origin[0] = 90;
		origin[1] = 0;
		origin[2] = -10;
		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE,
					   cgs.media.armorModel, 0, origin, angles );
	}*/
#ifdef MISSIONPACK
	if( cgs.gametype == GT_HARVESTER ) {
		origin[0] = 90;
		origin[1] = 0;
		origin[2] = -10;
		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
		if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
			handle = cgs.media.redCubeModel;
		} else {
			handle = cgs.media.blueCubeModel;
		}
		CG_Draw3DModel( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles );
	}
#endif
	//
	// ammo
	//
	if ( cent->currentState.weapon ) {
		gitem_t *item = BG_FindItemForWeapon( cent->currentState.weapon );
		
		value = ps->ammo[item->giAmmoTag];
		if ( value > -1 ) {
			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
				&& cg.predictedPlayerState.weaponTime > 100 ) {
				// draw as dark grey when reloading
				color = 2;	// dark grey
			} else {
				if ( value >= 0 ) {
					color = 0;	// green
				} else {
					color = 1;	// red
				}
			}
			trap_R_SetColor( colors[color] );
			
			CG_DrawField (0, 432, 3, value);
			trap_R_SetColor( NULL );

			// if we didn't draw a 3D icon, draw a 2D icon for ammo
			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
				qhandle_t	icon;

//				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
				if ( icon ) {
					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE, icon );
				}
			}
		}
	}

	if ( cent->currentState.weapon ) {
//		gitem_t *item = BG_FindItemForWeapon( cent->currentState.weapon );
		
		value = ps->stats[STAT_ROUNDS];
		if ( value > -1 ) {
			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
				&& cg.predictedPlayerState.weaponTime > 100 ) {
				// draw as dark grey when reloading
				color = 2;	// dark grey
			} else {
				if ( value >= 0 ) {
					color = 0;	// green
				} else {
					color = 1;	// red
				}
			}
			trap_R_SetColor( colors[color] );
			
			CG_DrawField (0, 380, 3, value);
			trap_R_SetColor( NULL );

			// if we didn't draw a 3D icon, draw a 2D icon for ammo
			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
				qhandle_t	icon;

//				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
				if ( icon ) {
					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE, icon );
				}
			}
		}
	}

	//
	// health
	//
	value = ps->stats[STAT_HEALTH];
	if ( value > 100 ) {
		trap_R_SetColor( colors[3] );		// white
	} else if (value > 25) {
		trap_R_SetColor( colors[0] );	// green
	} else if (value > 0) {
		color = (cg.time >> 8) & 1;	// flash
		trap_R_SetColor( colors[color] );
	} else {
		trap_R_SetColor( colors[1] );	// red
	}

	// stretch the health up when taking damage
	CG_DrawField ( 185, 432, 3, value);
	CG_ColorForHealth( hcolor );
	trap_R_SetColor( hcolor );


	//
	// armor
	//
/*	value = ps->stats[STAT_ARMOR];
	if (value > 0 ) {
		trap_R_SetColor( colors[0] );
		CG_DrawField (370, 432, 3, value);
		trap_R_SetColor( NULL );
		// if we didn't draw a 3D icon, draw a 2D icon for armor
		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
			CG_DrawPic( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE, cgs.media.armorIcon );
		}

	}*/
#ifdef MISSIONPACK
	//
	// cubes
	//
	if( cgs.gametype == GT_HARVESTER ) {
		value = ps->generic1;
		if( value > 99 ) {
			value = 99;
		}
		trap_R_SetColor( colors[0] );
		CG_DrawField (640 - (CHAR_WIDTH*2 + TEXT_ICON_SPACE + ICON_SIZE), 432, 2, value);
		trap_R_SetColor( NULL );
		// if we didn't draw a 3D icon, draw a 2D icon for armor
		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
				handle = cgs.media.redCubeIcon;
			} else {
				handle = cgs.media.blueCubeIcon;
			}
			CG_DrawPic( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 432, ICON_SIZE, ICON_SIZE, handle );
		}
	}
#endif
}
#endif
#endif

/*
===========================================================================================

  UPPER RIGHT CORNER

===========================================================================================
*/ 
/*
================
CG_DrawLocation

  tell the player if he is in an assault/bomb field 

================
*/
static float CG_DrawLocation( float y ) {
	
//	const char *string;

	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
		return y;
	}

	if ( cg.predictedPlayerState.persistant[PERS_TEAM] != TEAM_RED && cg.predictedPlayerState.persistant[PERS_TEAM] != TEAM_BLUE ) {
		return y;
	}  

	/*
	if ( cg.predictedPlayerState.pm_flags & PMF_BOMBRANGE ) {
		string = "In Bomb Range";
		CG_DrawStringOutline( 640 - ( strlen(string) * 16), y, string, colorWhite );	
		y += 16;
	}
	if ( cg.predictedPlayerState.pm_flags & PMF_ASSAULTRANGE ) {
		string = "In an Assaultfield";
		CG_DrawStringOutline( 640 - ( strlen(string) * 16), y, string, colorWhite );	
		y += 16;
	}
	*/

	return y;
}


/*
==================
CG_DrawSnapshot
==================
*/
static int CG_DrawSnapshot( int y ) {
	char		*s;
	int			w;

	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
		cg.latestSnapshotNum, cgs.serverCommandSequence );
	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;

	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);

	return y + BIGCHAR_HEIGHT + 4;
}


#if 0
/*
=================
CG_DrawTimer
=================
*/
static float CG_DrawTimer( float y ) {
	int			mins, seconds;
	int			msec;

	if ( cgs.gametype == GT_LTS ) {
		if ( !cgs.levelRoundStartTime )
			return y;

		msec = ( cgs.levelRoundStartTime ) - cg.time;
	}
	else
		msec = cg.time - cgs.levelStartTime;

	seconds = msec / 1000;
	mins = seconds / 60;
	seconds -= mins * 60;


	CG_DrawDigits( 640 - 7 * 16 - 8 , y, 1, mins );
	CG_DrawPic( 640 - 6 * 16, y, 16,32, cgs.media.colonIcon );
	CG_DrawDigits( 640 - 5 * 16 , y, 2, seconds );
	CG_DrawPic( 640 - 2 * 16, y, 32,32, cgs.media.clockIcon );

	return y + 32;
}

/*
=================
CG_DrawMiscTimer
=================
*/
static float CG_DrawMiscTimer( float y ) {
	int			mins, seconds;
	int			msec;

	if ( cgs.gametype >= GT_TEAM ) {
		if ( !cgs.levelMiscStartTime )
			return y; 
		msec = ( cgs.levelMiscStartTime + 1000 ) - cg.time;
	}
	else
		return y;

	seconds = msec / 1000;
	mins = seconds / 60;
	seconds -= mins * 60; 

	CG_DrawDigits( 640 - 7 * 16 - 8 , y, 1, mins );
	CG_DrawPic( 640 - 6 * 16, y, 16,32, cgs.media.colonIcon );
	CG_DrawDigits( 640 - 5 * 16 , y, 2, seconds );
	CG_DrawPic( 640 - 2 * 16, y, 32,32, cgs.media.clockIcon );

	return y + 32;
}
/*
=================
CG_DrawAssaultTimer
=================
*/
static float CG_DrawAssaultTimer( float y ) {
	int			mins, seconds ;
	int			msec;

	if ( cgs.gametype >= GT_TEAM ) {
		if ( !cgs.levelAssaultStartTime )
			return y;

		msec = ( cgs.levelAssaultStartTime + 1000 ) - cg.time;
	}
	else
		return y;

	seconds = msec / 1000;
	mins = seconds / 60;
	seconds -= mins * 60; 

	CG_DrawDigits( 640 - 7 * 16 - 8 , y, 1, mins );
	CG_DrawPic( 640 - 6 * 16, y, 16,32, cgs.media.colonIcon );
	CG_DrawDigits( 640 - 5 * 16 , y, 2, seconds );
	CG_DrawPic( 640 - 2 * 16, y, 32,32, cgs.media.clockIcon );

	return y + 32;
}
#endif
#if 0
/*
=================
CG_DrawTeamOverlay
=================
*/

static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
	int x, w, h, xx;
	int i, j, len;
	const char *p;
	vec4_t		hcolor;
	int pwidth, lwidth;
	int plyrs;
	char st[16];
	clientInfo_t *ci;
	gitem_t	*item;
	int ret_y, count;

	if ( !cg_drawTeamOverlay.integer ) {
		return y;
	}

	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
		return y; // Not on any team
	}

	plyrs = 0;

	// max player name width
	pwidth = 0;
	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
	for (i = 0; i < count; i++) {
		ci = cgs.clientinfo + sortedTeamPlayers[i];
		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
			plyrs++;
			len = CG_DrawStrlen(ci->name);
			if (len > pwidth)
				pwidth = len;
		}
	}

	if (!plyrs)
		return y;

	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;

	// max location name width
	lwidth = 0;
	for (i = 1; i < MAX_LOCATIONS; i++) {
		p = CG_ConfigString(CS_LOCATIONS + i);
		if (p && *p) {
			len = CG_DrawStrlen(p);
			if (len > lwidth)
				lwidth = len;
		}
	}

	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;

	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;

	if ( right )
		x = 640 - w;
	else
		x = 0;

	h = plyrs * TINYCHAR_HEIGHT;

	if ( upper ) {
		ret_y = y + h;
	} else {
		y -= h;
		ret_y = y;
	}

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
		hcolor[0] = 1;
		hcolor[1] = 0;
		hcolor[2] = 0;
		hcolor[3] = 0.33f;
	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
		hcolor[0] = 0;
		hcolor[1] = 0;
		hcolor[2] = 1;
		hcolor[3] = 0.33f;
	}
	trap_R_SetColor( hcolor );
	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
	trap_R_SetColor( NULL );

	for (i = 0; i < count; i++) {
		ci = cgs.clientinfo + sortedTeamPlayers[i];
		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {

			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;

			xx = x + TINYCHAR_WIDTH;

			CG_DrawStringExt( xx, y,
				ci->name, hcolor, qfalse, qfalse,
				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH);

			if (lwidth) {
				p = CG_ConfigString(CS_LOCATIONS + ci->location);
				if (!p || !*p)
					p = "unknown";
				len = CG_DrawStrlen(p);
				if (len > lwidth)
					len = lwidth;

//				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
//					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
				CG_DrawStringExt( xx, y,
					p, hcolor, qfalse, qfalse, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
					TEAM_OVERLAY_MAXLOCATION_WIDTH);
			}

			CG_GetColorForHealth( ci->health, ci->armor, hcolor );

			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);

			xx = x + TINYCHAR_WIDTH * 3 + 
				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;

			CG_DrawStringExt( xx, y,
				st, hcolor, qfalse, qfalse,
				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );

			// draw weapon icon
			xx += TINYCHAR_WIDTH * 3;

			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
					cg_weapons[ci->curWeapon].weaponIcon );
			} else {
				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
					cgs.media.deferShader );
			}

			// Draw powerup icons
			if (right) {
				xx = x;
			} else {
				xx = x + w - TINYCHAR_WIDTH;
			}
			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
				if (ci->powerups & (1 << j)) {

					item = BG_FindItemForPowerup( j );

					if (item) {
						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
						trap_R_RegisterShader( item->icon ) );
						if (right) {
							xx -= TINYCHAR_WIDTH;
						} else {
							xx += TINYCHAR_WIDTH;
						}
					}
				}
			}

			y += TINYCHAR_HEIGHT;
		}
	}

	return ret_y;
//#endif
}
#endif
/*
==================
CG_DrawFPS
==================
*/
#define	FPS_FRAMES	4
static int CG_DrawFPS( int y ) {
	char		*s;
	int			w;
	static int	previousTimes[FPS_FRAMES];
	static int	index;
	int		i, total;
	int		fps;
	float	scale = 0.15f;
	static	int	previous;
	int		t, frameTime;

	if ( !cg_drawFPS.integer ) {
		return y;
	}

	y += CG_Text_Height( "100Fps", scale, 0 ) + 2;

	// don't use serverTime, because that will be drifting to
	// correct for internet lag changes, timescales, timedemos, etc
	t = trap_Milliseconds();
	frameTime = t - previous;
	previous = t;

	previousTimes[index % FPS_FRAMES] = frameTime;
	index++;
	if ( index > FPS_FRAMES ) {
		// average multiple frames together to smooth changes out a bit
		total = 0;
		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
			total += previousTimes[i];
		}
		if ( !total ) {
			total = 1;
		}
		fps = 1000 * FPS_FRAMES / total;

		s = va( "%iFPS", fps );
		w = CG_Text_Width( s ,scale,0 );

		CG_Text_Paint( 640 - w, y, scale, colorWhite,s, 0,0,ITEM_TEXTSTYLE_OUTLINED );
	} 
	return y + 24;
}
/*
=====================
CG_DrawUpperRight

=====================
*/
static void CG_DrawUpperRight( void ) {
	int	y = 0;

	if ( cg_drawFPS.integer ) {
		CG_DrawFPS( y );
	} 
	if ( cg_drawSnapshot.integer ) {
		CG_DrawSnapshot( y );
	}
}

/*
===========================================================================================

  LOWER RIGHT CORNER

===========================================================================================
*/
  
/*
=================
CG_DrawMapOverview
=================
*/
#define MAP_SIZE_WIDTH		512
#define MAP_SIZE_HEIGHT		512

static void CG_DrawPlayer( int x, int y, int size, qboolean team )
{
	vec4_t		hcolor;

	hcolor[3] = 1.0f;
	if ( team == TEAM_RED ) {
		hcolor[0] = 0.0f;
		hcolor[1] = 0.0f;
		hcolor[2] = 1.0f;
	} else if ( team == TEAM_BLUE ) {
		hcolor[0] = 1.0f;
		hcolor[1] = 0.0f;
		hcolor[2] = 0.0f;
	} else {
		hcolor[0] = 0.0f;
		hcolor[1] = 1.0f;
		hcolor[2] = 0.0f; 
	}
	trap_R_SetColor( hcolor );
	CG_DrawPic( x, y, size, size, cgs.media.teamStatusBar );
	trap_R_SetColor( NULL );

}
static void CG_DrawMapOverview(void) 
{    
	int	orgX = cg.mapOriginX;
	int	orgY = cg.mapOriginY;
	qhandle_t	map = trap_R_RegisterShader( "plans/plan_oldcity.tga" );
	int	i;
	int	x,y;

	if ( !cg.mapVisible )
		return;

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
		return;
	} 
  
	x = ( 640 / 2 ) - ( MAP_SIZE_WIDTH/2 );
	y = ( 480 / 2 ) - ( MAP_SIZE_HEIGHT/2 );
	 
	CG_DrawPic(x,y,MAP_SIZE_WIDTH,MAP_SIZE_HEIGHT, map );

	x += /*cg.mapOriginX*/test_x.integer;
	y += /*cg.mapOriginY*/test_y.integer;

	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) 
	{
		int pX;
		int	pY;
		int	team;
		qboolean	self	=	qfalse;

		if ( cg_entities[i].currentState.eType != ET_PLAYER )
			continue;
		if ( cg_entities[i].currentState.eFlags & EF_DEAD )
			continue;

		team = cgs.clientinfo[i].team;

		if ( cg_entities[i].currentState.clientNum == cg.snap->ps.clientNum )
			self	=	qtrue;

		pX = cg_entities[i].lerpOrigin[0];
		pY = cg_entities[i].lerpOrigin[1];
		
	//	pX *= -1;
		pY *= -1;

		pX = pX/(test_w.value+1);
		pY = pY/(test_w.value+1);

	//	CG_Printf("player @ %i %i \n",pX,pY);

		if (self)
		{
			CG_DrawPlayer( x + pX - 4 , y + pY - 4, 8, TEAM_FREE );
		}
		else
			CG_DrawPlayer( x + pX - 2 , y + pY - 2, 4, team );

		/*
		if ( cg_entities[i].currentState.clientNum == clientNum 
			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
			CG_ResetPlayerEntity( &cg_entities[i] );
		}
		*/
	}
}


/*
=================
CG_DrawSniperRifle
=================
*/
static void CG_DrawSniperRifle(void) {

	int weaponstate = cg.snap->ps.weaponstate;
	int team = 0;

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
		return;
	}

	// chasing a bullet.
	if ( cg.cameraActive )
		return;
	if ( cg.renderingThirdPerson )
		return;

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
		team = 1;

	// check to see if we're in zoom mode
	if ( 
		! (
			(cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM2X ) ) ||
			(cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM4X ) )  
		)
		)
		return;


	// if not in ready
	if ( weaponstate != WEAPON_FIRING && weaponstate !=	WEAPON_FIRING2 && weaponstate != WEAPON_FIRING3 && weaponstate != WEAPON_READY )
		return;

	trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLACK)] );

  // TEAM_RED == seals team (whyever)  
  /*if (team == TEAM_RED) {
    // draw seals scope
    switch ( cg.snap->ps.weapon ) {
      case WP_PSG1:
      case WP_SL8SD:
      	CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[1] );
        break;
      case WP_MACMILLAN:
        CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[2] );
        break;
      default:
        CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[0] );
        break;
    }
  } else {
    // draw tango scope
    switch ( cg.snap->ps.weapon ) {
      case WP_PSG1:
      case WP_SL8SD:
      	CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[4] );
        break;
      case WP_MACMILLAN:
        CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[5] );
        break;
      default:
        CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[3] );
        break;
    }
  }*/
	switch ( cg.snap->ps.weapon ) {
		case WP_M4:
			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[0] );
			break;
		case WP_AK47:
			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[1] );
			break;
		case WP_M14:
			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[2] );
			break;
		case WP_PSG1:
			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[3] );
			break;
		case WP_MACMILLAN:
			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[4] );
			break;
		case WP_SL8SD:
			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[5] );
			break;
		default:
			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[2] );
			break;
	}
	trap_R_SetColor( NULL ); 
}

/*
=================
CG_DrawThermalGoggles
=================
*/
static int CG_DrawThermalGoggles(void) {
	float	hcolor[4];

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
		return 0;
	}

	// if not enabled
	if ( ! ( cg.snap->ps.stats[STAT_ACTIVE_ITEMS] & ( 1 << UI_NVG ) ) )
		return 0;

	hcolor[0] = 1;
	hcolor[1] = 0;
	hcolor[2] = 0;

	hcolor[3] = 0.7f;

	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);

	trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLACK)] );
	CG_DrawPic(0,0,640,480, cgs.media.thermalGogglesShader );
	trap_R_SetColor( NULL );
  
	return 1;
}
 

/*
===================
CG_DrawPickupItem
===================
*/
#ifndef MISSIONPACK
static int CG_DrawPickupItem( int y ) {
	int		value;
	float	*fadeColor;

	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
		return y;
	}

	y -= ICON_SIZE;

	value = cg.itemPickup;
	if ( value ) {
		fadeColor = CG_FadeColor( cg.itemPickupTime, 3000 );
		if ( fadeColor ) {
			CG_RegisterItemVisuals( value );
			trap_R_SetColor( fadeColor );
			CG_DrawPic( 8, y, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			CG_DrawBigString( ICON_SIZE + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_name, fadeColor[0] );
			trap_R_SetColor( NULL );
		}
	}
	
	return y;
}
#endif

/*
=================
CG_DrawDamageFeedback
=================
*/
static void CG_DrawDamageFeedback ( void ) {
	int			t;
	int			maxTime; 
//	refEntity_t		ent;
	// ns
	float	hcolor[4];
	// ns end

	if (  ( CG_PointContents( cg.refdef.vieworg, -1 ) & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) )){
		hcolor[0] = 0.2f;
		hcolor[1] = 0.2f;
		hcolor[2] = 0.5f;
		hcolor[3] = 0.6f;
		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);

		cg.WaterTime = cg.snap->serverTime;

	} 
	else if (cg.WaterTime > 0)
	{
		maxTime = 500;
		t = cg.time - cg.WaterTime;

		hcolor[0] = 0.2f;
		hcolor[1] = 0.2f;
		hcolor[2] = 0.5f;
		hcolor[3] = 0.6 - ((float)t / 10000);

 		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);

		if ( hcolor[3] <= 0.0 )
			cg.WaterTime = 0;
	}

	if ( !cg.damageValue )
		return;

	// ragePro systems can't fade blends, so don't obscure the screen
	if ( cgs.glconfig.hardwareType == GLHW_RAGEPRO ) {
		return;
	}	

	maxTime = 500;
	t = cg.time - cg.damageTime;


	if ( t <= 0 || t >= maxTime ) {
		
		return;
	} 

	 else {
 
	hcolor[0] = 1;
	hcolor[1] = 0;
	hcolor[2] = 0;

	hcolor[3] = 1.0 - ((float)t / maxTime);
	}
	
//	CG_Printf("hcolor 3 (blood debug) : %f \n", hcolor[3] );

	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
}

/*
=================
CG_DrawFlashed
=================
*/
static void CG_DrawFlashed ( void ) {
	int			t;   
	float	hcolor[4]; 

	// render the blindspot
	if ( cg.flashedVisionTime > 0 ) {

		// only calculate a new blindspot position 
		if ( !cg.flashedVision_x || !cg.flashedVision_y ) {
			cg.flashedVision_x = random()*400;
			cg.flashedVision_y = random()*300;
		}
		
		// t \in [SEALS_FLASHBANGTIME*SEALS_BLINDSPOTFACTOR ... -SEALS_FLASHBANGTIME*SEALS_BLINDSPOTFACTOR]
		t = cg.flashedVisionTime - cg.time;

		hcolor[0] = 1.0;
		hcolor[1] = 1.0;
		hcolor[2] = 1.0;

		// clever part
		if ( t > 0 ) {
			hcolor[3] = 1.0;
		} else {
			hcolor[3] = 1.0 + ((float)t / (float)(SEALS_FLASHBANGTIME*SEALS_BLINDSPOTFACTOR));
			if (hcolor[3] <= 0.0) hcolor[3] = 0.0;
		}

		trap_R_SetColor(hcolor);
		CG_DrawPic( cg.flashedVision_x,cg.flashedVision_y, 320, 320,cgs.media.flashedSpot );
		trap_R_SetColor(NULL);

		if ( hcolor[3] <= 0.0  ) {
			cg.flashedVision_x = cg.flashedVision_y = 0;
			cg.flashedVisionTime = 0;
		}
	}

	if ( cg.FlashTime <= 0 )
		return;

	// t \in [SEALS_FLASHBANGTIME .. -SEALS_FLASHBANGFADETIME]
	t = cg.FlashTime - cg.time;

	hcolor[0] = 1.0;
	hcolor[1] = 1.0;
	hcolor[2] = 1.0;

	// clever part
	if ( t > 0) {
		hcolor[3] = 1.0;
	} else {
		hcolor[3] = 1.0 + ((float)t / (float)SEALS_FLASHBANGFADETIME);
		if (hcolor[3] <= 0.0) hcolor[3] = 0.0;
	}


 	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);

	if ( hcolor[3] <= 0.0 )
		cg.FlashTime = 0; 
}
 
/*
==================
CG_DrawDeathblend

used to draw a small fade in effect while respawning
==================
*/
static void CG_DrawDeathblend( void )
{
	vec4_t hcolor;
	float  t;

	if ( cg.DeathBlendTime <= 0 )
		return;

	
	t = cg.DeathBlendTime - cg.time;

	hcolor[0] = 0.0;
	hcolor[1] = 0.0;
	hcolor[2] = 0.0;
	hcolor[3] = ( (float)t / 1000 );

	if ( hcolor[3] > 1.0f) {
		hcolor[3] = 1.0;
	}

	if ( hcolor[3] <= 0.0 || t <= 0 )
	{
		cg.DeathBlendTime = 0; 
		return;
	}

 	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);

}
 /*
==================
CG_DrawSmokeblend

draws a blend-out effect from the smoke grenades
==================
*/
static void CG_DrawSmokeblend( void )
{
	vec4_t hcolor;

	if ( cg.smokeBlendAlpha <= 0.0f )
		return;

	switch (cgs.camoType) {
		case CAMO_URBAN:
			hcolor[0] = SEALS_SMOKENADE_R_URBAN;
			hcolor[1] = SEALS_SMOKENADE_G_URBAN;
			hcolor[2] = SEALS_SMOKENADE_B_URBAN;
			break;
		case CAMO_ARCTIC:
			hcolor[0] = SEALS_SMOKENADE_R_ARCTIC;
			hcolor[1] = SEALS_SMOKENADE_G_ARCTIC;
			hcolor[2] = SEALS_SMOKENADE_B_ARCTIC;
			break;
		case CAMO_DESERT:
			hcolor[0] = SEALS_SMOKENADE_R_DESERT;
			hcolor[1] = SEALS_SMOKENADE_G_DESERT;
			hcolor[2] = SEALS_SMOKENADE_B_DESERT;
			break;
		case CAMO_JUNGLE:
		default:
			hcolor[0] = SEALS_SMOKENADE_R_JUNGLE;
			hcolor[1] = SEALS_SMOKENADE_G_JUNGLE;
			hcolor[2] = SEALS_SMOKENADE_B_JUNGLE;
			break;
	}
	hcolor[3] = cg.smokeBlendAlpha;

 	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
}
 
 /*
=================
CG_DrawBlend
=================
*/
#define BLEND_START_FADE_TIME	100
#define BLEND_FADE_TIME			200

static void CG_DrawBlend ( void ) { 
	float	hcolor[4]; 
  
	if ( cg.savedblendAlpha > 0.0f && cg.blendAlpha == 0.0f )
	{
		float a;

		if ( cg.blendFadeTime <= 0 )
			cg.blendFadeTime = cg.time + BLEND_START_FADE_TIME;

		if ( cg.time > cg.blendFadeTime )
		{
			a = cg.time - cg.blendFadeTime;
			
			hcolor[0] = 1.0f;
			hcolor[1] = 1.0f;
			hcolor[2] = 1.0f;
			hcolor[3] = cg.savedblendAlpha - ( a / BLEND_FADE_TIME );

			if ( hcolor[3] > 1.0f)
				hcolor[3] = 1.0f;
			if ( hcolor[3] < 0.0f)
			{
				hcolor[3] = 0.0f;
				cg.savedblendAlpha = 0.0f;
				cg.blendFadeTime = 0;
			}

	 		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
		}
		else
		{

			hcolor[0] = 1.0f;
			hcolor[1] = 1.0f;
			hcolor[2] = 1.0f;
			hcolor[3] = cg.savedblendAlpha;

			if ( hcolor[3] > 1.0f)
				hcolor[3] = 1.0;

 			CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
		}
	}
	else if ( cg.blendAlpha <= 0.0f )
		return;
	else
	{
		hcolor[0] = 1.0f;
		hcolor[1] = 1.0f;
		hcolor[2] = 1.0f;
		hcolor[3] = cg.blendAlpha;

		if ( hcolor[3] > 1.0f) {
			hcolor[3] = 1.0;
		}

 		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
	}

	if ( cg.blendAlpha > 0.0f )
		cg.savedblendAlpha = cg.blendAlpha;
	cg.blendAlpha = 0.0f;  
}

/*
=================
CG_DrawC4
=================
*/
static void CG_DrawC4( void ) {
	int y,x;
	int width,height;
//	int i = 0;
	float color[4]; 

	if ( cg.snap->ps.pm_flags & PMF_BOMBCASE )
		return;
	if ( cg.snap->ps.weapon != WP_C4 || cg.snap->ps.weaponstate != WEAPON_FIRING)
		return;
	
	// only draw if we don't have the anims visible
	if ( cg_drawGun.integer )
		return;

	if ( cg.snap->ps.weaponTime < 1 )
		return;

	// set color
	color[0] = 0.0;
	color[1] = 1;
	color[2] = 0.0;
	// set alpha
	color[3] = 0.7f;

	x = 155;
	y = 201;
	width = 342;
	height = 44;

	CG_FillRect( x , y , width, height, color );

	color[0] = color[1] = color[2] = 0;

	x = 160;
	y = 206;
	width = 330;
	height = 34;

	CG_FillRect( x , y , width, height, color );

	// set color
	color[0] = 0.0;
	color[1] = 1;
	color[2] = 0.0;
	// set alpha
//	color[3] = 1;

//	CG_Printf("weapontime: %i\n", cg.snap->ps.weaponTime );

	x = 170;
	y = 211;
	width = 1 + (int)( 310 -  ( cg.snap->ps.weaponTime / 13.73 ) );
	height = 23;

	CG_FillRect( x , y , width, height, color );
 
}
/*
==================
CG_DrawMissionInformation

[ ] [ ] [ ]

 [       ]
 [       ]
 [       ]
 640 - 80 / 3
==================
*/
int CG_ButtonPushed( int button );
extern char SealBriefing[ 128 ][ 128 ]; // max chars per line
extern int	sealBriefingLines;
extern char TangoBriefing[ 128 ][ 128 ]; // max chars per line
extern int	tangoBriefingLines;
static void CG_MissionInformation( void ) {
	int x;
	int y;
	int	value;
	vec4_t color = { 1.0f,1.0f,1.0f,0.75f };
	float	fontsize = .23f;
	qhandle_t	backPic = trap_R_RegisterShaderNoMip( "ui/assets/missioninfo_bg1" );
	if ( !cg.viewMissionInfo )
		return;
 
	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED || 
		cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
		backPic = trap_R_RegisterShaderNoMip( "ui/assets/missioninfo_bg2" );

	if ( CG_ButtonPushed( BUTTON_USE ) )
	{
		cg.viewMissionInfo = 0;
		return;
	}  

	CG_DrawPic( 0,0,640,480, backPic );

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
	{
		x = 320 - CG_Text_Width("Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0.4f, 99 )/2;
		CG_Text_Paint( x,480-10-CG_Text_Height("Press Spaced",0.4f,0 ),0.4f, colorWhite, "Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0,0,ITEM_TEXTSTYLE_OUTLINED );
	
		x = 64;
		y = 120; 
		if ( sealBriefingLines > 0 ) { 

			for ( value = 0; value <= sealBriefingLines*2; value ++ )
			{
				CG_Text_Paint( x,y, fontsize, color, SealBriefing[value], 0,0,0);//ITEM_TEXTSTYLE_SHADOWED);
				y += CG_Text_Height( SealBriefing[value], fontsize, 0 ) + 2;
			}	
		}

		if ( cgs.infoPicLeft )
			CG_DrawPic( 416,40, 160, 120,cgs.infoPicLeft );
		if ( cgs.infoPicMiddle )
			CG_DrawPic( 416,172, 160, 120,cgs.infoPicMiddle );
		if ( cgs.infoPicRight )
			CG_DrawPic( 416,304, 160, 120,cgs.infoPicRight );
	}
	else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
	{
		x = 320 - CG_Text_Width("Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0.4f, 99 )/2;
		CG_Text_Paint( x,480-10-CG_Text_Height("Press Spaced",0.4f,0 ),0.4f, colorWhite, "Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0,0,ITEM_TEXTSTYLE_OUTLINED );

		x = 64;
		y = 120;   
		if ( tangoBriefingLines > 0 ) { 

			for ( value = 0; value <= tangoBriefingLines*2; value ++ )
			{
				CG_Text_Paint( x,y, fontsize, color, TangoBriefing[value], 0,0,0);//ITEM_TEXTSTYLE_SHADOWED);
				y += CG_Text_Height( TangoBriefing[value], fontsize, 0 ) + 2 ;
			}	
		}

		if ( cgs.infoPicLeft )
			CG_DrawPic( 416,40, 160, 120,cgs.infoPicLeft );
		if ( cgs.infoPicMiddle )
			CG_DrawPic( 416,172, 160, 120,cgs.infoPicMiddle );
		if ( cgs.infoPicRight )
			CG_DrawPic( 416,304, 160, 120,cgs.infoPicRight );
	}
	else
	{
		x = 320 - CG_Text_Width("Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0.4f, 99 )/2;

		CG_Text_Paint( x,480-10-CG_Text_Height("Press Spaced",0.4f,0 ),0.4f, colorWhite, "Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0,0,ITEM_TEXTSTYLE_OUTLINED );

		x = 48;
		y = 204;   
		if ( sealBriefingLines > 0 ) { 

			for ( value = 0; value <= sealBriefingLines*2; value ++ )
			{
				CG_Text_Paint( x,y, fontsize, color, SealBriefing[value], 0,0,0);//ITEM_TEXTSTYLE_SHADOWED);
				y += CG_Text_Height( SealBriefing[value], fontsize, 0 ) + 2;
			}	
		}

		x = 316;
		y = 204;
		if ( tangoBriefingLines > 0 ) { 

			for ( value = 0; value <= tangoBriefingLines*2; value ++ )
			{
				CG_Text_Paint( x,y, fontsize, color, TangoBriefing[value], 0,0,0);//ITEM_TEXTSTYLE_SHADOWED);
				y += CG_Text_Height( TangoBriefing[value], fontsize, 0 ) + 2 ;
			}	
		}

		
		if ( cgs.infoPicLeft )
			CG_DrawPic( 48,40, 160, 120,cgs.infoPicLeft );
		if ( cgs.infoPicMiddle )
			CG_DrawPic( 240,40, 160, 120,cgs.infoPicMiddle );
		if ( cgs.infoPicRight )
			CG_DrawPic( 432,40, 160, 120,cgs.infoPicRight );
	}

}
#if 0
/*
=================
CG_DrawMenu
=================
*/
static void CG_DrawMenu( void ) {
	int y = 104 + BIGCHAR_HEIGHT + 4;
	int x = 22;
	int i = 0;
	float color[4]; 

	if (cg.inMenu != qtrue)
		return; 
 

	// set color
	color[0] = 0.0;
	color[1] = 0.0;
	color[2] = 0.0;
	// set alpha
	color[3] = 0.30f;
	// btw, it's a nice blue  =) 
	CG_FillRect( x, 100+((BIGCHAR_HEIGHT+4)*2) -30, BIGCHAR_WIDTH * 21 + 6, ( ( BIGCHAR_HEIGHT + 4) * 14)+4, color ); 

	CG_DrawPic(0, 78, 380, 32, cgs.media.ingameMenuTopShader );
	CG_DrawPic(0, 393, 380, 32, cgs.media.ingameMenuBottomShader );

	for (i = 1; i < 15; i++)
	{
		y += BIGCHAR_HEIGHT + 4;

		if (i == 14)
		{
			CG_DrawStringExt2( 26,y -30, "-[ by Team-Mirage ]-----------------------", i_Menu[i].l_color, qfalse, qtrue, 8,16,0 );
			return;
		}

		if (strlen( i_Menu[i].Line ) == 0)
			continue;

		// set color
		trap_R_SetColor( i_Menu[i].l_color ); 
		
		//CG_DrawStringOutline( 26,y -30, i_Menu[i].Line, i_Menu[i].l_color );
		CG_DrawStringExt2( 26, y-30, i_Menu[i].Line, i_Menu[i].l_color, qfalse, qtrue, 8,16,0);
		
		//CG_DrawStringExt( 8, y, i_Menu[i].Line , i_Menu[i].l_color, qtrue, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
		
		// remove color
		trap_R_SetColor ( NULL );
	}

}
#endif
#ifndef MISSIONPACK

/*
=====================
CG_DrawLowerLeft

=====================
*/

static void CG_DrawLowerLeft( void ) {
	float	y;

	y = 480 - ICON_SIZE;

	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 3 ) {
		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
	} 


	y = CG_DrawPickupItem( y );
}
#endif

//===========================================================================================
#if 0
/*
===================
CG_DrawReward
===================
*/
static void CG_DrawReward( void ) { 
	float	*color;
	int		i, count;
	float	x, y;
	char	buf[32];

	if ( !cg_drawRewards.integer ) {
		return;
	}

	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
	if ( !color ) {
		if (cg.rewardStack > 0) {
			for(i = 0; i < cg.rewardStack; i++) {
				cg.rewardSound[i] = cg.rewardSound[i+1];
				cg.rewardShader[i] = cg.rewardShader[i+1];
				cg.rewardCount[i] = cg.rewardCount[i+1];
			}
			cg.rewardTime = cg.time;
			cg.rewardStack--;
			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
		} else {
			return;
		}
	}

	trap_R_SetColor( color );

	/*
	count = cg.rewardCount[0]/10;				// number of big rewards to draw

	if (count) {
		y = 4;
		x = 320 - count * ICON_SIZE;
		for ( i = 0 ; i < count ; i++ ) {
			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
			x += (ICON_SIZE*2);
		}
	}

	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
	*/

	if ( cg.rewardCount[0] >= 10 ) {
		y = 56;
		x = 320 - ICON_SIZE/2;
		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
		Com_sprintf(buf, sizeof(buf), "%d", cg.rewardCount[0]);
		x = ( SCREEN_WIDTH - SMALLCHAR_WIDTH * CG_DrawStrlen( buf ) ) / 2;
		CG_DrawStringExt( x, y+ICON_SIZE, buf, color, qfalse, qtrue,
								SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
	}
	else {

		count = cg.rewardCount[0];

		y = 56;
		x = 320 - count * ICON_SIZE/2;
		for ( i = 0 ; i < count ; i++ ) {
			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
			x += ICON_SIZE;
		}
	}
	trap_R_SetColor( NULL );
}
#endif

/*
===============================================================================

LAGOMETER

===============================================================================
*/

#define	LAG_SAMPLES		128


typedef struct {
	int		frameSamples[LAG_SAMPLES];
	int		frameCount;
	int		snapshotFlags[LAG_SAMPLES];
	int		snapshotSamples[LAG_SAMPLES];
	int		snapshotCount;
} lagometer_t;

lagometer_t		lagometer;

/*
==============
CG_AddLagometerFrameInfo

Adds the current interpolate / extrapolate bar for this frame
==============
*/
void CG_AddLagometerFrameInfo( void ) {
	int			offset;

	offset = cg.time - cg.latestSnapshotTime;
	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
	lagometer.frameCount++;
}

/*
==============
CG_AddLagometerSnapshotInfo

Each time a snapshot is received, log its ping time and
the number of snapshots that were dropped before it.

Pass NULL for a dropped packet.
==============
*/
void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
	// dropped packet
	if ( !snap ) {
		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
		lagometer.snapshotCount++;
		return;
	}

	// add this snapshot's info
	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
	lagometer.snapshotCount++;
}

/*
==============
CG_DrawDisconnect

Should we draw something differnet for long lag vs no packets?
==============
*/
static void CG_DrawDisconnect( void ) {
	float		x, y;
	int			cmdNum;
	usercmd_t	cmd;
	const char		*s;
	int			w;

	// draw the phone jack if we are completely past our buffers
	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
	trap_GetUserCmd( cmdNum, &cmd );
	if ( cmd.serverTime <= cg.snap->ps.commandTime
		|| cmd.serverTime > cg.time ) {	// special check for map_restart
		return;
	}

	// also add text in center of screen
	s = "Connection Interrupted";
	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
	CG_DrawBigString( 320 - w/2, 100, s, 1.0F);

	// blink the icon
	if ( ( cg.time >> 9 ) & 1 ) {
		return;
	}

	x = 640 - 48;
	y = 480 - 48;

	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader("gfx/2d/net.tga" ) );
}


#define	MAX_LAGOMETER_PING	900
#define	MAX_LAGOMETER_RANGE	300

/*
==============
CG_DrawLagometer
==============
*/
static void CG_DrawLagometer( void ) {
	int		a, x, y, i;
	float	v;
	float	ax, ay, aw, ah, mid, range;
	int		color;
	float	vscale;

	if ( !cg_lagometer.integer || cgs.localServer ) {
		CG_DrawDisconnect();
		return;
	}

	//
	// draw the graph
	//
#ifdef MISSIONPACK
	x = 640 - 48;
	y = 480 - 144;
#else
	x = 640 - 48;
	y = 480 - 48;
#endif

	trap_R_SetColor( NULL );
	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );

	ax = x;
	ay = y;
	aw = 48;
	ah = 48;
	CG_AdjustFrom640( &ax, &ay, &aw, &ah );

	color = -1;
	range = ah / 3;
	mid = ay + range;

	vscale = range / MAX_LAGOMETER_RANGE;

	// draw the frame interpoalte / extrapolate graph
	for ( a = 0 ; a < aw ; a++ ) {
		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
		v = lagometer.frameSamples[i];
		v *= vscale;
		if ( v > 0 ) {
			if ( color != 1 ) {
				color = 1;
				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
			}
			if ( v > range ) {
				v = range;
			}
			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
		} else if ( v < 0 ) {
			if ( color != 2 ) {
				color = 2;
				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
			}
			v = -v;
			if ( v > range ) {
				v = range;
			}
			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
		}
	}

	// draw the snapshot latency / drop graph
	range = ah / 2;
	vscale = range / MAX_LAGOMETER_PING;

	for ( a = 0 ; a < aw ; a++ ) {
		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
		v = lagometer.snapshotSamples[i];
		if ( v > 0 ) {
			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
				if ( color != 5 ) {
					color = 5;	// YELLOW for rate delay
					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
				}
			} else {
				if ( color != 3 ) {
					color = 3;
					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
				}
			}
			v = v * vscale;
			if ( v > range ) {
				v = range;
			}
			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
		} else if ( v < 0 ) {
			if ( color != 4 ) {
				color = 4;		// RED for dropped snapshots
				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
			}
			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
		}
	}

	trap_R_SetColor( NULL );

	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
		CG_DrawBigString( ax, ay, "snc", 1.0 );
	}

	CG_DrawDisconnect();
}



/*
===============================================================================

CENTER PRINTING

===============================================================================
*/


/*
==============
CG_CenterPrint

Called for important messages that should stay in the center of the screen
for a few moments
==============
*/
void CG_CenterPrint( const char *str, int y, int charWidth ) {
	char	*s;

	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );

	cg.centerPrintTime = cg.time;
	cg.centerPrintY = y;
	cg.centerPrintCharWidth = 16;

	// count the number of lines for centering
	cg.centerPrintLines = 1;
	s = cg.centerPrint;
	while( *s ) {
		if (*s == '\n')
			cg.centerPrintLines++;
		s++;
	}
}


/*
===================
CG_DrawCenterString
===================
*/
static void CG_DrawCenterString( void ) {
	char	*start;
	int		l;
	int		x, y, w , h;
	float	*color;

	if ( !cg.centerPrintTime ) {
		return;
	}

	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
	if ( !color ) {
		return;
	}

	trap_R_SetColor( color );

	start = cg.centerPrint;

	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;

	while ( 1 ) {
		char linebuffer[1024];

		for ( l = 0; l < 50; l++ ) {
			if ( !start[l] || start[l] == '\n' ) {
				break;
			}
			linebuffer[l] = start[l];
		}
		linebuffer[l] = 0;

#ifdef MISSIONPACK
		w = CG_Text_Width(linebuffer, 0.5, 0);
		h = CG_Text_Height(linebuffer, 0.5, 0);
		x = (SCREEN_WIDTH - w) / 2;
		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
		y += h + 6;
#else
		w = cg.centerPrintCharWidth * CG_DrawStrlen( linebuffer );

		x = ( SCREEN_WIDTH - w ) / 2;

		
		CG_DrawStringExt2( x, y, linebuffer, color, qfalse, qtrue,
			cg.centerPrintCharWidth, cg.centerPrintCharWidth, 0 );

		y += cg.centerPrintCharWidth;
#endif
		while ( *start && ( *start != '\n' ) ) {
			start++;
		}
		if ( !*start ) {
			break;
		}
		start++;
	}

	trap_R_SetColor( NULL );
}



/*
===============================================================================

NEWBEE HELP FUNCTIONS

===============================================================================
*/

extern	vmCvar_t	cg_newbeeHeight;
extern	vmCvar_t	cg_newbeeTime;

/*
==============
CG_NewbieMessage

Called for important messages that should stay in the center of the screen
for a few moments
==============
*/
void CG_NewbieMessage( const char *str, int y, float charHeight ) {
	char	*s;

	if ( cg_newbeeTime.integer <= 0 )
		return;

	Q_strncpyz( cg.ns_newbiehelp.string, str, sizeof(cg.ns_newbiehelp.string) );

	cg.ns_newbiehelp.stringTime = cg.time;
	cg.ns_newbiehelp.stringY = y;
	cg.ns_newbiehelp.stringCharWidth = 16;

	if ( charHeight > 0 )
		cg.ns_newbiehelp.stringCharHeight = charHeight;
	else
		cg.ns_newbiehelp.stringCharHeight = 1.0f;

	trap_S_StartLocalSound( cgs.media.newbeeMsgSound, CHAN_AUTO );

	// count the number of lines for centering
	cg.ns_newbiehelp.stringLines = 1;
	s = cg.ns_newbiehelp.string;
	while( *s ) {
		if (  *s == '\n'  )
			cg.ns_newbiehelp.stringLines++;
		s++;
	}
}


/*
===================
CG_DrawNewbieMessage
===================
*/
static void CG_DrawNewbieMessage( void ) {
	char	*start;
	int		l;
	int		x, y, w , h;
	float	*color;

	if ( !cg.ns_newbiehelp.stringTime ) {
		return;
	}

	color = CG_FadeColor( cg.ns_newbiehelp.stringTime, 1000 * cg_newbeeTime.value );
	if ( !color ) {
		return;
	}

	trap_R_SetColor( color );

	start = cg.ns_newbiehelp.string;

	y = cg.ns_newbiehelp.stringY - cg.ns_newbiehelp.stringLines * CG_Text_Height("A",cg.ns_newbiehelp.stringCharHeight,0) / 2;

	while ( 1 ) {
		char linebuffer[1024];

		for ( l = 0; l < 255; l++ ) {
			if ( !start[l] || start[l] == '\n'  ) {
				break;
			} 
			linebuffer[l] = start[l];
		}
		linebuffer[l] = 0;

 		w = CG_Text_Width(linebuffer, cg.ns_newbiehelp.stringCharHeight, 0);
		h = CG_Text_Height(linebuffer, cg.ns_newbiehelp.stringCharHeight, 0);
		x = (SCREEN_WIDTH - w) / 2;
		CG_Text_Paint(x, y + h, cg.ns_newbiehelp.stringCharHeight, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
		y += h + 6;
 
		while	( *start && (*start != '\n') ) 
		{
			start++;
		}
		if ( !*start ) {
			break;
		}
		start++;
	}

	trap_R_SetColor( NULL );
}

/*
================================================================================

CROSSHAIR

================================================================================
*/

 
#define CROSSHAIR_HOR_WIDTH	 3
#define CROSSHAIR_HOR_HEIGHT 1

#define CROSSHAIR_VER_WIDTH (CROSSHAIR_HOR_HEIGHT)
#define CROSSHAIR_VER_HEIGHT (CROSSHAIR_HOR_WIDTH)
 
extern	vmCvar_t	cg_crosshair_r;
extern	vmCvar_t	cg_crosshair_g;
extern	vmCvar_t	cg_crosshair_b;

// |---|
// |---| 
// const float *color 
/*
================
CG_FillRect

Coordinates are 640*480 virtual values
=================
*/
void CG_FillRect2( float x, float y, float width, float height, const float *color ) {
	trap_R_SetColor( color );
 
	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );

	trap_R_SetColor( NULL );
}

extern vmCvar_t	cg_crosshairWidth;

static void CG_DrawStaticCrosshair( int x, int y, int width, int height, const float *color)
{
	int chw, chh, cvw, cvh;

	// zooming? no crosshair...
	if ( BG_IsZooming( cg.snap->ps.stats[STAT_WEAPONMODE] ) )
		return;
	if ( !cg_drawCrosshair.integer )
		return; 
	if ( cg.renderingThirdPerson )
		return;
	if ( cg.snap->ps.weapon == WP_PSG1 ||
		cg.snap->ps.weapon == WP_SL8SD ||
		cg.snap->ps.weapon == WP_MACMILLAN )
		return;
	if ( cg.snap->ps.weapon == WP_C4 )
		return;
	if ( cg.snap->ps.weapon == WP_NONE)
		return;
	if ( cg.snap->ps.weapon == WP_KHURKURI ||
			 cg.snap->ps.weapon == WP_SEALKNIFE )
		return;
	if ( ( cg.snap->ps.weapon == WP_GRENADE ||
				 cg.snap->ps.weapon == WP_FLASHBANG ||
				 cg.snap->ps.weapon == WP_SMOKE ) &&
			 SEALS_NO_GRENADE_CROSSHAIR )
		return;
	if (  ( ( cg.snap->ps.weapon == WP_AK47 ) ||
	        ( cg.snap->ps.weapon == WP_M4 ) ) &&
        ( cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) ) &&
				( cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ) ) )
		return;


	chw = CROSSHAIR_HOR_WIDTH;
	chh = cg_crosshairWidth.integer;
	cvw = cg_crosshairWidth.integer;
	cvh = CROSSHAIR_VER_HEIGHT;

	/*CG_FillRect2( x , ( y + height/2 ) - chh/2 , chw,chh*cg_crosshairWidth.integer,color);
	CG_FillRect2( x + width -  chw, ( y + height/2 ) - chh/2 , chw,chh*cg_crosshairWidth.integer,color);

	CG_FillRect2( x + width/2 - cvw/2, y, cvw*cg_crosshairWidth.integer,cvh,color);
	CG_FillRect2( x + width/2 - cvw/2, y + height - cvh, cvw*cg_crosshairWidth.integer,cvh,color);*/

	CG_FillRect2( x , ( y + height/2 ) - chh/2 , chw,chh,color);
	CG_FillRect2( x + width -  chw, ( y + height/2 ) - chh/2 , chw,chh,color);

	CG_FillRect2( x + width/2 - cvw/2, y, cvw,cvh,color);
	CG_FillRect2( x + width/2 - cvw/2, y + height - cvh, cvw,cvh,color);
}

/*
=================
CG_DrawCrosshair
=================
*/

#define CROSSHAIR_FADE_TIME	2000
#define CROSSHAIR_FADE_MINTIME 500

static int CG_GetCrosshairFadeTime(qboolean fadein) {
	int i;
	int accuracy = char_accuracy.integer;

	if ( accuracy <= 0 )
		accuracy = 1;

	if (fadein) 
		i = CROSSHAIR_FADE_TIME - ( accuracy * (CROSSHAIR_FADE_TIME / 10) );
	else
		i = ( accuracy * (CROSSHAIR_FADE_TIME / 10) ); 

	return i + CROSSHAIR_FADE_MINTIME;
}
 

static void CG_DrawCrosshair(void) {
	float		w, h;
	qhandle_t	hShader;
	float		f;
	float		color[4],*col;
	float		x, y;
	int			crosshairMod;
	int			crosshairFadeTime ;
	qboolean	running = qtrue;
	float   xyzspeed;

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR)
		return;

	if ( cg.snap->ps.pm_type == PM_SPECTATOR )
		return;

	xyzspeed = sqrt( cg.snap->ps.velocity[0] * cg.snap->ps.velocity[0]
		+  cg.snap->ps.velocity[1] * cg.snap->ps.velocity[1]
		+  cg.snap->ps.velocity[2] * cg.snap->ps.velocity[2] );

	if ( CG_ButtonPushed( BUTTON_WALKING ) 
		|| cg.snap->ps.pm_flags & PMF_DUCKED 
		|| cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_LACTIVE )
		|| xyzspeed < 40.0f
		)
		running = qfalse;
 
	// calculate the time needed to fade the crosshair
	if ( running ) {
		// fade out the crosshair

		// check if the crosshair was fading in
		if ( (cg.crosshairFadeIn == qtrue) ) {
			cg.crosshairFadeIn = qfalse;
			cg.crosshairTime = cg.time + CG_GetCrosshairFadeTime(cg.crosshairFadeIn);
			if ( (cg.crosshairTime < cg.time) ) cg.crosshairTime -= (cg.crosshairTime - cg.time);
			
		}

	} else {
		// fade in the crosshair

		// check if the crosshair was fading out
		if ( (cg.crosshairFadeIn == qfalse) ) {
			cg.crosshairFadeIn = qtrue;
			cg.crosshairTime = cg.time + CG_GetCrosshairFadeTime(cg.crosshairFadeIn);
			if ( (cg.crosshairTime < cg.time) ) cg.crosshairTime -= (cg.crosshairTime - cg.time);
			
		}

	}

	crosshairFadeTime = CG_GetCrosshairFadeTime (cg.crosshairFadeIn);
 
	color[0]=cg_crosshair_r.value;
	color[1]=cg_crosshair_g.value;
	color[2]=cg_crosshair_b.value;

	// calculate color
	if (chBlink) {
		color[0]=1.0-color[0]; 
		color[1]=1.0-color[1];
		color[2]=1.0-color[2];
	}

	// crosshair gets black-effect when out of rounds
	if ( ( cg.snap->ps.stats[STAT_ROUNDS] <= cg_lowAmmoWarning.integer ) ) {
		if (
			 ( (cg.time - nextChBlinik) >= 0 ) &&
			 ! ( cg.snap->ps.weapon == WP_C4 ) &&
			 ! ( cg.snap->ps.weapon == WP_KHURKURI ) &&
			 ! ( cg.snap->ps.weapon == WP_SEALKNIFE ) &&
			 ! ( cg.snap->ps.weapon == WP_GRENADE ) &&
			 ! ( cg.snap->ps.weapon == WP_FLASHBANG ) &&
			 ! ( cg.snap->ps.weapon == WP_NONE ) &&
			 ! ( cg.snap->ps.weapon == WP_SMOKE ) ) {
			nextChBlinik = cg.time + (
					(cg.snap->ps.stats[STAT_ROUNDS] < 0 ? 0 : cg.snap->ps.stats[STAT_ROUNDS])
					+1)*100;
			chBlink = !chBlink;
		}
	} else {
		chBlink = qfalse;
	}

	
	// calculate alpha value
	if (!cg.crosshairFadeIn) {
					
		if (cg.crosshairTime > cg.time) {
			color[3] = (float)((float)cg.crosshairTime - (float)cg.time) / (float)crosshairFadeTime;
			if (color[3] <= 0.05) color[3] = 0.0;
		} else color[3] = 0.0;
		
	} else {
					
		if (cg.crosshairTime > cg.time) {
			color[3] = 1.0 - (float)((float)cg.crosshairTime - (float)cg.time) / (float)crosshairFadeTime ;
			if (color[3] >= 0.95) color[3] = 1.0;
		} else color[3] = 1.0;
		
	} // if (running... else...

	// fading crosshair
	if ( cg_crosshairFade.integer == 1 ) {
					
		if ( CG_ButtonPushed( BUTTON_SPRINT) ) {
			if (color[3] < 0.10) color[3] = 0.10;
		} else {
			if (color[3] < 0.30) color[3] = 0.30;
		}
		
	} else if ( cg_crosshairFade.integer == 2 ) {
					
		if (color[3] < 0.0) color[3] = 0.0;
		
	}	else {
					
		if ( CG_ButtonPushed( BUTTON_SPRINT) ) {
			if (color[3] <= 0.25) color[3] = 0.25;
		} else {
			if (color[3] < 0.75) color[3] = 0.75;
		}
	}

	w = h = cg_crosshairSize.value;

	// pulse the size of the crosshair when picking up items
	f = cg.time - cg.itemPickupBlendTime;
	if ( f > 0 && f < ITEM_BLOB_TIME ) {
		f /= ITEM_BLOB_TIME;
		w *= ( 1 + f );
		h *= ( 1 + f );
	}

	x = cg.refdef.x + 0.5 * ( cg.refdef.width  - w);
	y = cg.refdef.y + 0.5 * ( cg.refdef.height  - h); 
	
	// if using a crosshair, don't make the crosshair too big
	if ( cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_LACTIVE ) )
		crosshairMod = cg.crosshairMod/2 + xyzspeed / (12 + cg.snap->ps.persistant[PERS_ACCURACY]) ;
	else
		crosshairMod = cg.crosshairMod/2 + xyzspeed / (6 + (cg.snap->ps.persistant[PERS_ACCURACY]/2));
	
	x -= crosshairMod;
	y -= crosshairMod; 

	CG_DrawStaticCrosshair (x, y, 
		w + crosshairMod * 2, h + crosshairMod * 2,
		color);
	
}

void CG_DrawMissionhelpers( void ) 
{
	vec3_t origin;
//	vec3_t	target;
	vec3_t	angles;

	// no origin set yet.
	if ( VectorCompare( cgs.mi_helpers[0], vec3_origin ) )
		return;

 	VectorClear( angles );

	// select pitch to look at focus point from vieword
	VectorSubtract( cg.refdef.vieworg,cgs.mi_helpers[0],  angles );
  


/*	angles[0] += test_x.value;
	angles[1] += test_y.value;
	angles[ROLL] = 0;
	if ( test_w.integer )
		VectorNormalize(angles);
*/ 
	{
		origin[0] = 80;
		origin[1] = 0;
		origin[2] = -10;

	//	angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE - ICON_SIZE, 432 - ICON_SIZE, ICON_SIZE*2, ICON_SIZE*2,
					   cg_weapons[WP_MK23].silencerModel , 0, origin, angles );
	}

  /*

	{
		refEntity_t			ent;
		vec3_t		forward,right,up;

		VectorCopy( cg.refdef.vieworg, target );
		AngleVectors( cg.refdefViewAngles, forward,right,up );
  
		VectorMA( target, test_x.value, forward, target );
		VectorMA( target, test_y.value, right, target );
		
		memset (&ent, 0, sizeof(ent));
  
		AnglesToAxis( angles, ent.axis );  
 
		ent.hModel = cg_weapons[WP_MK23].silencerModel;
 
 
		VectorCopy( target , ent.origin);
		VectorCopy( target, ent.oldorigin);

		ent.nonNormalizedAxes = qfalse; 
 
		trap_R_AddRefEntityToScene(&ent); 

			CG_Printf("added helper @: %s\n", vtos( target ) );

	}*/
}

void CG_DrawChat( void ) 
{
	int w, h;
	int i, len;
 	int		chatHeight;

	float charwidth;
	float charheight;

	int		x_base = 0;
	int		y_base = 50;

	float	textscale = 0.225f;

	if ( cg.viewMissionInfo )
		return;
	if ( cg.activeInventory )
		y_base += 60;
	else if ( cgs.voteTime )
		y_base += 40;
	else if ( cg.predictedPlayerState.pm_flags & PMF_FOLLOW )
		y_base += 20;  

	charwidth = CG_Text_Width("A", textscale, 0);
	charheight = CG_Text_Height("A", textscale + 0.15f, 0 );
 
	if ( ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.pm_type == PM_SPECTATOR || cg.snap->ps.pm_type == PM_NOCLIP ) )
		y_base = 74;
 
	if (cg_chatHeight.integer < TEAMCHAT_HEIGHT)
		chatHeight = cg_chatHeight.integer;
	else
		chatHeight = TEAMCHAT_HEIGHT;


	if (cgs.LastChatPos != cgs.ChatPos) 
	{
		if (cg.time - cgs.ChatMsgTimes[cgs.LastChatPos % chatHeight] > cg_chatTime.integer) {
			cgs.LastChatPos++; 
		}

		h = (cgs.ChatPos - cgs.LastChatPos) * charheight; 
		w = 0;

		for (i = cgs.LastChatPos; i < cgs.ChatPos; i++) {
			len = CG_DrawStrlen(cgs.ChatMsgs[i % chatHeight]);
			if (len > w)
				w = len;
		}
		w *= charwidth;
		w += charwidth * 2;
    
		for (i = cgs.ChatPos - 1; i >= cgs.LastChatPos; i--) {

 			CG_Text_Paint(
				x_base + charwidth, 
				y_base + (i - cgs.LastChatPos) * charheight , 
				textscale,
				colorWhite, 
				cgs.ChatMsgs[i % chatHeight], 
				0, 
				0, 
				ITEM_TEXTSTYLE_OUTLINED
				); 
		}
	}
}


/*
===========================================================================

	RADAR

===========================================================================
*/
extern	vmCvar_t	cg_drawRadar;
extern	vmCvar_t	cg_radarX;
extern	vmCvar_t	cg_radarY;

#define RADAR_BACK_WIDTH	80
#define RADAR_BACK_HEIGHT	80

#define RADAR_BLIP_WIDTH	8
#define RADAR_BLIP_HEIGHT	8

#define RADAR_OBJECT_WIDTH	16
#define RADAR_OBJECT_HEIGHT	16

#define	SCANNER_UNIT                   32
#define	SCANNER_RANGE                  35 //35

#define SCANNER_WIDTH					40

static void CG_CalcUpdateRadarPositions( void )
{
	float	len; 
	int		hd;
	vec3_t	v;
	int		i;
	vec3_t	blipOrg; 

	// update players
	for ( i = 0; i < cg.radarNumEntities; i++ )
	{
		VectorCopy( cg.radarEntities[i].origin, blipOrg );

		// calc player to enemy vector
		VectorSubtract (cg.predictedPlayerState.origin, blipOrg, v);

		// save height differential
		hd = v[2] / SCANNER_UNIT;

		// remove height component
		v[2] = 0;

		// calc length of distance from top down view (no z)
		len = VectorLength (v) / SCANNER_UNIT;

		if ( len > SCANNER_RANGE )
			len = SCANNER_RANGE;

		// in range ?
		if ( len <= SCANNER_RANGE )
		{ 
			vec3_t	dp; 
			vec3_t	normal = {0,0,-1};

			// normal vector to enemy
			VectorNormalize(v);
	 
			// rotate round player view angle (yaw)
			RotatePointAroundVector( dp, normal, v, cg.refdefViewAngles[1]);

			// scale to fit scanner range (80 = pixel range of scanner)
			VectorScale(dp,len*SCANNER_WIDTH/SCANNER_RANGE,dp);

			// update x/y and height
			cg.radarEntities[i].x = dp[1];
			cg.radarEntities[i].y = dp[0];
			cg.radarEntities[i].height = hd;
		} 
	}

	// update various clientside handled entities
	// update players
	for ( i = 0; i < cg.radarNumObjects; i++ )
	{
		VectorCopy( cg.radarObjects[i].origin, blipOrg );

		// calc player to enemy vector
		VectorSubtract (cg.predictedPlayerState.origin, blipOrg, v);

		// save height differential
		hd = v[2] / SCANNER_UNIT;

		// remove height component
		v[2] = 0;

		// calc length of distance from top down view (no z)
		len = VectorLength (v) / SCANNER_UNIT;

		if ( len > SCANNER_RANGE )
			len = SCANNER_RANGE;

		// in range ?
		if ( len <= SCANNER_RANGE )
		{ 
			vec3_t	dp; 
			vec3_t	normal = {0,0,-1};

			// normal vector to enemy
			VectorNormalize(v);
	 
			// rotate round player view angle (yaw)
			RotatePointAroundVector( dp, normal, v, cg.refdefViewAngles[1]);

			// scale to fit scanner range (80 = pixel range of scanner)
			VectorScale(dp,len*SCANNER_WIDTH/SCANNER_RANGE,dp);

			// update x/y and height
			cg.radarObjects[i].x = dp[1];
			cg.radarObjects[i].y = dp[0];
			cg.radarObjects[i].height = hd;
		} 
	}
}
static void CG_DrawRadar( void ) {
	int i;
	qhandle_t	radarBackShader = trap_R_RegisterShader("gfx/radar/radar_back"),
				radarFriendShader = trap_R_RegisterShader("gfx/radar/radar_friendly"),
				radarEnemyShader = trap_R_RegisterShader("gfx/radar/radar_enemy"),
				radarBombShader = trap_R_RegisterShader("gfx/radar/radar_bomb"),
				radarUpShader = trap_R_RegisterShader("gfx/radar/radar_up"),
				radarDownShader = trap_R_RegisterShader("gfx/radar/radar_dn"),
				radarFriendMissionShader = trap_R_RegisterShader("gfx/radar/radar_friendly_m"),
				radarBandageShader = trap_R_RegisterShader("gfx/radar/radar_friendly_b"),
				radarFriendRadio = trap_R_RegisterShader("gfx/radar/radar_friendly_r"),
				hShader;

	if ( !cg_drawRadar.integer )
		return;
	if ( cg.snap->ps.pm_flags & PMF_FOLLOW )
		return;

	CG_DrawPic( cg_radarX.integer - RADAR_BACK_WIDTH/2,
				cg_radarY.integer - RADAR_BACK_HEIGHT/2,
				RADAR_BACK_WIDTH,
				RADAR_BACK_HEIGHT, radarBackShader );

	CG_CalcUpdateRadarPositions( );

	if ( cgs.gametype == GT_LTS ) // radar entities nur rendern wenn missionsmodus aktiv ist
  	for ( i = 0; i < cg.radarNumObjects; i++ )
	{
		qhandle_t shader;		

		shader = trap_R_RegisterShader( va( "gfx/radar/radar_%c",cg.radarObjects[i].type ) );
		
 		CG_DrawPic( cg_radarX.integer + cg.radarObjects[i].x-RADAR_OBJECT_WIDTH/2,
					cg_radarY.integer + cg.radarObjects[i].y-RADAR_OBJECT_HEIGHT/2,
					RADAR_OBJECT_WIDTH,RADAR_OBJECT_HEIGHT, shader );

		if ( cg.radarObjects[i].height < 0 )
			CG_DrawPic( cg_radarX.integer + cg.radarObjects[i].x+RADAR_OBJECT_WIDTH/4,
					cg_radarY.integer + cg.radarObjects[i].y-RADAR_OBJECT_HEIGHT/2,
					RADAR_OBJECT_WIDTH,RADAR_OBJECT_HEIGHT, radarUpShader );
		else if ( cg.radarObjects[i].height > 0 )
			CG_DrawPic( cg_radarX.integer + cg.radarObjects[i].x+RADAR_OBJECT_WIDTH/4,
					cg_radarY.integer + cg.radarObjects[i].y-RADAR_OBJECT_HEIGHT/2,
					RADAR_OBJECT_WIDTH,RADAR_OBJECT_HEIGHT, radarDownShader );
	}
 	for ( i = 0; i < cg.radarNumEntities; i++ )
	{
		char action = cg.radarEntities[i].type;

		if ( action == 'F' )
			hShader = radarFriendShader;
		else if ( action == 'A' && sin( cg.time / 25  ) >= 0.0f  )
			hShader = radarEnemyShader; // firing, too
		else if ( action == 'B' )
			hShader = radarBandageShader;
		else if ( action == 'M' )
			hShader = radarFriendMissionShader;
		else if ( action == 'R' )
			hShader = radarFriendRadio;
		else
			hShader = radarFriendShader;

 		CG_DrawPic( cg_radarX.integer + cg.radarEntities[i].x-RADAR_BLIP_WIDTH/2,
					cg_radarY.integer + cg.radarEntities[i].y-RADAR_BLIP_HEIGHT/2,
					RADAR_BLIP_WIDTH,RADAR_BLIP_HEIGHT, hShader );
		
		if ( cg.radarEntities[i].height < 0 )
			CG_DrawPic( cg_radarX.integer + cg.radarEntities[i].x+RADAR_BLIP_WIDTH/4,
					cg_radarY.integer + cg.radarEntities[i].y-RADAR_BLIP_HEIGHT/2,
					RADAR_BLIP_WIDTH,RADAR_BLIP_HEIGHT, radarUpShader );
		else if ( cg.radarEntities[i].height > 0 )
			CG_DrawPic( cg_radarX.integer + cg.radarEntities[i].x+RADAR_BLIP_WIDTH/4,
					cg_radarY.integer + cg.radarEntities[i].y-RADAR_BLIP_HEIGHT/2,
					RADAR_BLIP_WIDTH,RADAR_BLIP_HEIGHT, radarDownShader );

	}  
}

void CG_EditRadar_AddObject( char type, vec3_t org )
{
	CG_Printf("Added Radar Object: %c at %s\n", type, vtos(org) );

	cg.radarObjects[cg.radarNumObjects].type = type;
	VectorCopy(org, cg.radarObjects[cg.radarNumObjects].origin );

	cg.radarNumObjects++;
}
void CG_WriteRadarInfoToBRF_f( void );

void CG_EditRadar_HandleKey( int key )
{
	int mousex=cgs.cursorX,mousey=cgs.cursorY;
	int y,y2;
	int x,x2;

	x = 4;
	x2 = 300;

	y = 258;
	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2;

	if ( mousex > x && mousex < x2 &&
		mousey > y && mousey < y2 )
	{
		//place V
		CG_EditRadar_AddObject('V', cg.refdef.vieworg );
	}

	y = y2;
	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2;

	if ( mousex > x && mousex < x2 &&
		mousey > y && mousey < y2 )
	{
		//place E
		CG_EditRadar_AddObject('E', cg.refdef.vieworg );
	}

	y = y2;
	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2; 

	if ( mousex > x && mousex < x2 &&
		mousey > y && mousey < y2 )
	{
		//place B
		CG_EditRadar_AddObject('B', cg.refdef.vieworg );
	}

	y = y2;
	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2; 
	if ( mousex > x && mousex < x2 &&
		mousey > y && mousey < y2 )
	{
		//place A
		CG_EditRadar_AddObject('A', cg.refdef.vieworg );
	}

	y = y2;
	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2; 
	if ( mousex > x && mousex < x2 &&
		mousey > y && mousey < y2 )
	{
		//place A
		CG_EditRadar_AddObject('X', cg.refdef.vieworg );
	}

	y = y2 + 20;
	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2; 
	if ( mousex > x && mousex < x2 &&
		mousey > y && mousey < y2 )
	{
		//place A
		CG_WriteRadarInfoToBRF_f();
	}
}
qboolean CG_Radar_MouseIn( int x, int x2, int y, int y2 ) {

	if ( cgs.cursorX > x && cgs.cursorX < x2 &&
		cgs.cursorY > y && cgs.cursorY < y2 )
		return qtrue;

	return qfalse; 
}
static void CG_DrawEditRadar( void ) {
	int y = 254;
	char *s;

	if ( cgs.eventHandling != CGAME_EVENT_EDITRADAR )
		return;

	
	s = "Radar Entity Editor. Press Escape to exit.";
	CG_Text_Paint( 4, y, 0.20f, colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
	y += CG_Text_Height( s, 0.20f, 0 ) + 2;

	s = "Place VIP Rescue Entity";
	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
	y += CG_Text_Height( s, 0.20f, 0 ) + 2;

	s = "Place Extraction Point";
	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
	y += CG_Text_Height( s, 0.20f, 0 ) + 2;

	s = "Place Briefcase";
	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
	y += CG_Text_Height( s, 0.20f, 0 ) + 2;

	s = "Place Assaultfield";
	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
	y += CG_Text_Height( s, 0.20f, 0 ) + 2;
 
	s = "Place BombSpot";
	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
	y += CG_Text_Height( s, 0.20f, 0 ) + 2;

	y += 20;

	s = "Write File";
	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
	y += CG_Text_Height( s, 0.20f, 0 ) + 2;

}

static void CG_DrawTeamChat( void ) {
	int w, h;
	int i, len;
	vec4_t		hcolor;
	int		chatHeight;

#define CHATLOC_Y 420 // bottom end
#define CHATLOC_X 0

	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
		chatHeight = cg_teamChatHeight.integer;
	else
		chatHeight = TEAMCHAT_HEIGHT;

//	CG_Printf("draing to teamchat.\n");
	if (cgs.teamLastChatPos != cgs.teamChatPos) {
		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
			cgs.teamLastChatPos++;
		}

		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;

		w = 0;

		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
			if (len > w)
				w = len;
		}
		w *= TINYCHAR_WIDTH;
		w += TINYCHAR_WIDTH * 2;

		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
			hcolor[0] = 1;
			hcolor[1] = 0;
			hcolor[2] = 0;
			hcolor[3] = 0.33f;
		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
			hcolor[0] = 0;
			hcolor[1] = 0;
			hcolor[2] = 1;
			hcolor[3] = 0.33f;
		} else {
			hcolor[0] = 0;
			hcolor[1] = 1;
			hcolor[2] = 0;
			hcolor[3] = 0.33f;
		}

		trap_R_SetColor( hcolor );
		CG_DrawPic( CHATLOC_X, CHATLOC_Y - h, 640, h, cgs.media.teamStatusBar );
		trap_R_SetColor( NULL );

		hcolor[0] = hcolor[1] = hcolor[2] = 1.0;
		hcolor[3] = 1.0;

		for (i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i--) {
			CG_DrawStringExt( CHATLOC_X + TINYCHAR_WIDTH, 
				CHATLOC_Y - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT, 
				cgs.teamChatMsgs[i % chatHeight], hcolor, qfalse, qfalse,
				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
		}
	}
}


//==============================================================================

/*
=================
CG_DrawSpectator
=================
*/
static void CG_DrawSpectator(void) {
	char *string;
	int w;

	if ( cg.viewMissionInfo )
		return;


	string = "SPECTATOR";
	w = CG_Text_Width(string, 0.3f, 0);
	CG_Text_Paint( 320 - w / 2, 480-48, 0.3f, colorWhite, string, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
	
	string = "press <USE> key to toggle Cam-mode";
	w = CG_Text_Width(string, 0.3f, 0);
	CG_Text_Paint( 320 - w / 2, 480-16, 0.3f, colorWhite, string, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
}

/*
=================
CG_DrawVote
=================
*/
static void CG_DrawVote(void) {
	char	*s;
	int		sec;

	if ( !cgs.voteTime ) {
		return;
	}

	// play a talk beep whenever it is modified
	if ( cgs.voteModified ) {
		cgs.voteModified = qfalse;

		if ( cg_chatBeep.integer )
			trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
	}

	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;

 	if ( sec < 0 ) {
		sec = 0;
	}

	if ( 
			cgs.voteString[0] == 'F' &&
			cgs.voteString[1] == 'o' &&
			cgs.voteString[2] == 'r' &&
			cgs.voteString[3] == 'g' &&
			cgs.voteString[4] == 'i' &&
			cgs.voteString[5] == 'v' &&
			cgs.voteString[6] == 'e'
		)
	{
		s = va("%s (%is left) Press F1 to forgive or F2 to refuse", cgs.voteString, sec );
 
		if ( sec == 0 )
		{
			cgs.voteTime = 0;
			cgs.voteModified = qfalse;
		}
	}	
	else
		s = va("Vote (%is left):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
	CG_Text_Paint( 4, 58, 0.20f, colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );

	s = "or press ESC then click Vote";
	CG_Text_Paint( 4, 58 + CG_Text_Height( s, 0.20f, 0 ) + 2, 0.20f, colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
 
}

/*
=================
CG_DrawTeamVote
=================
*/
static void CG_DrawTeamVote(void) {
	char	*s;
	int		sec, cs_offset;

	if ( cgs.clientinfo->team == TEAM_RED )
		cs_offset = 0;
	else if ( cgs.clientinfo->team == TEAM_BLUE )
		cs_offset = 1;
	else
		return;

	if ( !cgs.teamVoteTime[cs_offset] ) {
		return;
	}

	// play a talk beep whenever it is modified
	if ( cgs.teamVoteModified[cs_offset] ) {
		cgs.teamVoteModified[cs_offset] = qfalse;
		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
	}

	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
	if ( sec < 0 ) {
		sec = 0;
	}
	s = va("Teamvote (%is left):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
	CG_DrawSmallString( 0, 90, s, 1.0F );
}


static qboolean CG_DrawScoreboard() {
 	static qboolean firstTime = qtrue;
	float fade, *fadeColor;

	if (menuScoreboard) {
		menuScoreboard->window.flags &= ~WINDOW_FORCED;
	}
	if (cg_paused.integer) {
		cg.deferredPlayerLoading = 0;
		firstTime = qtrue;
		return qfalse;
	} 

	// don't draw scoreboard during death while warmup up
	if ( cg.warmup && !cg.showScores ) {
		return qfalse;
	}

	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
		fade = 1.0;
		fadeColor = colorWhite;
	} else {
		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
		if ( !fadeColor ) {
			// next time scoreboard comes up, don't print killer
			cg.deferredPlayerLoading = 0;
			cg.killerName[0] = 0;
			firstTime = qtrue;
			return qfalse;
		}
		fade = *fadeColor;
	}																					  


	if (menuScoreboard == NULL) {
		if ( cgs.gametype >= GT_TEAM ) {
			menuScoreboard = Menus_FindByName("teamscore_menu");
		} else {
			menuScoreboard = Menus_FindByName("score_menu");
		}
	}

	if (menuScoreboard) {
		if (firstTime) {
			CG_SetScoreSelection(menuScoreboard);
			firstTime = qfalse;
		}
		Menu_Paint(menuScoreboard, qtrue);
	}

	// load any models that have been deferred
	if ( ++cg.deferredPlayerLoading > 10 ) {
		CG_LoadDeferredPlayers();
	}

	return qtrue; 
}

/*
=================
CG_DrawIntermission
=================
*/
static void CG_DrawIntermission( void ) {
//	int key;
#ifdef MISSIONPACK
	//if (cg_singlePlayer.integer) {
	//	CG_DrawCenterString();
	//	return;
	//}
#else
	if ( cgs.gametype == GT_SINGLE_PLAYER ) {
		CG_DrawCenterString();
		return;
	}
#endif
	cg.scoreFadeTime = cg.time;
	cg.scoreBoardShowing = CG_DrawScoreboard();
}

/*
=================
CG_DrawFollow
=================
*/
char *xp_to_rank( int xp, int team );

static qboolean CG_DrawFollow( void ) {
 	int			w;
	vec4_t		color;
	const char	 *s;
	int			chaseclient = cg.snap->ps.clientNum;

	if ( cg.showScores )
		return qfalse;

	if ( !( cg.snap->ps.pm_flags & PMF_FOLLOW ) ) {
		if ( cg.snap->ps.pm_type == PM_SPECTATOR ||
				cg.snap->ps.pm_type == PM_NOCLIP )
		{

			if ( cg.viewMissionInfo )
				return qfalse;

			w = CG_Text_Width("Spectator", 0.55f, 0);

			CG_Text_Paint( 320 - w / 2, 48, 0.55f, colorWhite, S_COLOR_BLUE"Spectator", 0, 0, ITEM_TEXTSTYLE_OUTLINED);
			
		}
		return qfalse;
	}
	color[0] = 1;
	color[1] = 1;
	color[2] = 1;
	color[3] = 1;

	s = "Chasing Soldier:";		 
	w = CG_Text_Width(s, 0.3f, 0);

	CG_Text_Paint( 320 - w / 2, 24, 0.4f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
 
 
	cg.cameraFollowNumber = cg.snap->ps.weapon;

 	if ( cgs.gametype >= GT_TEAM )
		s = va("%s. %s",
		xp_to_rank( cgs.clientinfo[  chaseclient ].score, cgs.clientinfo[ chaseclient ].team), 
		cgs.clientinfo[ chaseclient ].name); 
	else
		s = va("%s",cgs.clientinfo[ chaseclient ].name);
 
	w = CG_Text_Width(s, 0.4f, 0);

	CG_Text_Paint( 320 - w / 2, 48, 0.4f, colorLtBlue, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED);

	return qtrue;
}
 

#if 0
/*
=================
CG_DrawProxWarning
=================
*/
static void CG_DrawProxWarning( void ) {
	char s [32];
	int			w;
  static int proxTime;
  static int proxCounter;
  static int proxTick;

	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
    proxTime = 0;
		return;
	}

  if (proxTime == 0) {
    proxTime = cg.time + 5000;
    proxCounter = 5;
    proxTick = 0;
  }

  if (cg.time > proxTime) {
    proxTick = proxCounter--;
    proxTime = cg.time + 1000;
  }

  if (proxTick != 0) {
    Com_sprintf(s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick);
  } else {
    Com_sprintf(s, sizeof(s), "YOU HAVE BEEN MINED");
  }

	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
	CG_DrawBigStringColor( 320 - w / 2, 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)] );
}
#endif


/*
=================
CG_DrawWarmup
=================
*/
static void CG_DrawWarmup( void ) {
	int			w;
	int			sec; 
	float scale; 
	int			cw;
	const char	*s;

	sec = cg.warmup;
	if ( !sec ) {
		return;
	}

	if ( sec < 0 ) {

		if ( cg.viewMissionInfo )
			return;

		s = "Waiting for players";		 
		w = CG_Text_Width(s, 0.3f, 0);

		CG_Text_Paint( 320 - w / 2, 24, 0.3f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
 
		cg.warmupCount = 0;
		return;
	}
	/*

 	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) // seals
	{
		int value;
		extern	char SealBriefing[ 128 ][ MAX_CHARS_PER_LINE ];
		extern	int	sealBriefingLines; 

		if ( sealBriefingLines > 0 ) 
		{
			int y;

			y = 480 - ( (sealBriefingLines) + 4) * 16;

			for ( value = 0; value < sealBriefingLines; value ++ )
			{
						w = CG_Text_Width(SealBriefing[value], 0.3f, 0);

				CG_Text_Paint( 320 - w / 2, y, 0.3f, colorWhite, SealBriefing[value], 0, 0, ITEM_TEXTSTYLE_OUTLINED);

 				y += 16;
			}	
		} 
	}
	else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) // seals
	{
		int value; 
		extern	char TangoBriefing[ 128 ][ MAX_CHARS_PER_LINE ];
		extern	int	tangoBriefingLines; 

		if ( tangoBriefingLines > 0 ) 
		{
			int y;

			y = 480 - ( (tangoBriefingLines) + 4) * 16;

			for ( value = 0; value < tangoBriefingLines; value ++ )
			{
				w = CG_Text_Width(TangoBriefing[value], 0.3f, 0);

				CG_Text_Paint( 320 - w / 2, y, 0.3f, colorWhite, TangoBriefing[value], 0, 0, ITEM_TEXTSTYLE_OUTLINED);
 				y += 16;
			}	
		} 
	}
 */

	sec = ( sec - cg.time ) / 1000;
	if ( sec < 0 ) {
		cg.warmup = 0;
		sec = 0;
	}
	s = va( "Starts in: "S_COLOR_RED"%i"S_COLOR_WHITE, sec + 1 );
	if ( sec != cg.warmupCount ) {
		cg.warmupCount = sec;
		if ( sec < 10 )
		{

			// fixme: precache sounds
			char soundname[128];
			
			Com_sprintf( soundname, sizeof(soundname), "sound/commentary/%i.wav", sec+1 );

			trap_S_StartLocalSound( trap_S_RegisterSound( soundname, qfalse ) , CHAN_ANNOUNCER );
		}
	}
	scale = 0.45f;
	switch ( cg.warmupCount ) {
	case 0:
		cw = 28;
		scale = 0.54f;
		break;
	case 1:
		cw = 24;
		scale = 0.51f;
		break;
	case 2:
		cw = 20;
		scale = 0.48f;
		break;
	default:
		cw = 16;
		scale = 0.45f;
		break;
	}
  

	w = CG_Text_Width(s, scale, 0);

	CG_Text_Paint( 320 - w / 2, 70, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED);

}

//==================================================================================
#ifdef MISSIONPACK
/* 
=================
CG_DrawTimedMenus
=================
*/
void CG_DrawTimedMenus() {
	if (cg.voiceTime) {
		int t = cg.time - cg.voiceTime;
		if ( t > 2500 ) { 
			trap_Cvar_Set("cl_conXOffset", "0");
			cg.voiceTime = 0;
		}
	}
}
#endif
  
extern vmCvar_t	cg_hudStyle;
void CG_DrawPic2( float x, float y, float width, float height, qhandle_t hShader );

void CG_DrawMouse(int x,int y, int height, int width )
{ 
	qhandle_t	hShader;  

	hShader = cgDC.Assets.cursor; 
//CG_Printf("drawmouse: %i %i", x , y );

// after we've setted the color draw the pic
	CG_DrawPic( x-16, y-16, width, height, hShader );

	if ( cgs.eventHandling == CGAME_EVENT_EDITHUD ) 
	{
		vec4_t whiteTrans = { 1.0f,1.0f,1.0f,0.35f };
		int	width = 130;
		int height = 220;
		int x2 = cgs.cursorX * ( 1024.0f/640 );
		int y2 = cgs.cursorY * ( 768.0f/480 );

		if ( cg_hudStyle.integer == 2 )
		{
			width = 200;
			height = 96;
		}
		trap_R_SetColor( whiteTrans );
		CG_DrawPic2( x2, y2, width, height, cgs.media.whiteShader );
		trap_R_SetColor( NULL );
	}
	else if ( cgs.eventHandling == CGAME_EVENT_EDITRADARPOS )
	{
		vec4_t whiteTrans = { 1.0f,1.0f,1.0f,0.35f };
		
		CG_FillRect( cgs.cursorX-40, cgs.cursorY-40, 80, 80, whiteTrans );
	}
 
}

void CG_QCmd_HandleMenu( void );
void CG_DrawScrutchHud( void );
void CG_DrawSpectatorHud( void );
extern	vmCvar_t	cg_drawScriptedUI;

/*
=================
CG_Draw2D
=================
*/
static void CG_Draw2D( void ) 
{
 
	// if we are taking a levelshot for the menu, don't draw anything
	if ( cg.levelShot ) {
		return;
	}

	CG_DrawDeathblend( );
	CG_DrawSmokeblend( );

	// headdamage always on
	if( cg.snap->ps.pm_type == PM_NORMAL && (cg.snap->ps.stats[STAT_HEAD_DAMAGE] > 10 || cg.snap->ps.stats[STAT_HEALTH] < 50) )
	{
		vec4_t		hcolor;

		// set color based on health
		hcolor[0] = 0.0f;
		hcolor[1] = 0.0f;
		hcolor[2] = 0.0f;		
		hcolor[3] = (25 + 100 - ( cg.snap->ps.stats[STAT_HEAD_DAMAGE] + 100 - cg.snap->ps.stats[STAT_HEALTH] )) * 0.001 * sin(cg.time / 100.0) + 0.6 - (cg.snap->ps.stats[STAT_HEALTH] * 0.5 / 100) ;

		if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 )
			hcolor[3] = 0.9f;
		if(hcolor[3] > 1 )
			hcolor[3] = 1;
		else if(hcolor[3] < 0)
			hcolor[3] = 0;

		trap_R_SetColor( hcolor );
		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
		trap_R_SetColor( NULL ); 
	}

	if ( cg_draw2D.integer == 0 ) {
		return;
	}

	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {		
		CG_DrawChat();
		CG_DrawIntermission();
		return;
	}

	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 &&
		cgs.gametype == GT_TEAM )
	{
		char *string;
		int w;
		float deathTime = ( ( (float)cg.deathTime + (float)((cgs.teamRespawn > 0)?(cgs.teamRespawn):(2500))*1000 ) - (float)cg.time ) / 1000.0f;
  		
		if ( cgs.squadAssault )
			deathTime = ( (float)cgs.levelRoundStartTime  - (float)cg.time ) / 1000.0f;

		if ( deathTime > 0.0f )
			string = va( "Respawn in: "S_COLOR_RED"%.1fs", deathTime );
		else
			string = va( "Press "S_COLOR_RED"USE"S_COLOR_WHITE" or "S_COLOR_RED"FIRE"S_COLOR_WHITE" to Respawn" );

		w =	CG_Text_Width( string, 0.5f, 0 );
		CG_Text_Paint( 320 - w / 2, 480-48, 0.5f, colorWhite, string, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
	}

	if (
		( cgs.eventHandling == CGAME_EVENT_EDITRADARPOS ||
			cgs.eventHandling == CGAME_EVENT_EDITHUD ) &&
			( cg.snap->ps.pm_type == PM_SPECTATOR || cg.snap->ps.pm_type == PM_NOCLIP )
			)
	{
		CG_DrawRadar();
		
		CG_DrawScrutchHud();
	}
	else if ( ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.pm_type == PM_SPECTATOR || cg.snap->ps.pm_type == PM_NOCLIP ) ) {
		if ( !cg.showScores && cg.viewMissionInfo == qfalse  )
		{
			Menu_PaintAll();
			CG_DrawTimedMenus(); 
			CG_DrawSpectatorHud();
		}
	} else {
		if ( cg.snap->ps.stats[STAT_HEALTH] > 0 )
		{ 
			if ( ! CG_DrawThermalGoggles() ) // ns       // only draw sniperrifle crosshair
				CG_DrawSniperRifle(); // ns        // if not in thermalgoggle mode

//			CG_DrawMapOverview(); 
			CG_DrawFlashed();  
			CG_DrawBlend(); 
			CG_DrawDamageFeedback(); // screenblend
		}     
		// don't draw any status if dead or the scoreboard is being explicitly shown
		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0  && cg.viewMissionInfo == qfalse )
		{ 
            CG_DrawCrosshair(); 
 			CG_DrawWeaponSelect(); 
			CG_DrawC4(); 
 			CG_DrawRadar();

			// draw scripted hud/ui 
			if ( cg_drawScriptedUI.integer )
			{ 
				Menu_PaintAll();
				CG_DrawTimedMenus();
			}
 
			// draw hud
			CG_DrawScrutchHud();
		}

	}
	
//	CG_DrawMissionhelpers(); 
	CG_DrawChat();
//	CG_DrawTeamChat(); 

	CG_DrawEditRadar();

	CG_DrawVote();
	CG_DrawTeamVote();
 
	if ( cg.viewCmd )
		CG_QCmd_HandleMenu( );

	CG_DrawLagometer();
 
 	if (!cg_paused.integer) {
		CG_DrawUpperRight();
	} 
#ifndef MISSIONPACK
	CG_DrawUpperRight();
	CG_DrawLowerLeft(); 
#endif

	if ( !CG_DrawFollow() ) {
		CG_DrawWarmup();
	}

	// don't draw center string if scoreboard is up
	cg.scoreBoardShowing = CG_DrawScoreboard();
	if ( !cg.scoreBoardShowing) {
		CG_DrawCenterString();
	}
	CG_DrawNewbieMessage();
	CG_MissionInformation();
//	CG_DrawMenu();

	if (trap_Key_GetCatcher() & KEYCATCH_CGAME  ) 
		CG_DrawMouse( cgs.cursorX, cgs.cursorY, 32,32 ); 
}


static void CG_DrawTourneyScoreboard() {
#ifdef MISSIONPACK
#else
	CG_DrawOldTourneyScoreboard();
#endif
}

/*
=====================
CG_DrawActive

Perform all drawing needed to completely fill the screen
=====================
*/
void CG_DrawActive( stereoFrame_t stereoView ) {
	float		separation;
	vec3_t		baseOrg;

	// optionally draw the info screen instead
	if ( !cg.snap ) {
		CG_DrawInformation();
		return;
	}

	// optionally draw the tournement scoreboard instead
	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
		CG_DrawTourneyScoreboard();
		return;
	}

	switch ( stereoView ) {
		case STEREO_CENTER:
			separation = 0;
			break;
		case STEREO_LEFT:
			separation = -cg_stereoSeparation.value / 2;
			break;
		case STEREO_RIGHT:
			separation = cg_stereoSeparation.value / 2;
			break;
		default:
			separation = 0;
			CG_Error( "CG_DrawActive: Undefined stereoView" );
	}


	// clear around the rendered view if sized down
	CG_TileClear();

	// offset vieworg appropriately if we're doing stereo separation
	VectorCopy( cg.refdef.vieworg, baseOrg );
	if ( separation != 0 ) {
		VectorMA( cg.refdef.vieworg, -separation, cg.refdef.viewaxis[1], cg.refdef.vieworg );
	}
 
#ifdef SAME_WEAPONPIPE
	{
			if ( BG_IsMelee( cg.snap->ps.weapon ) || cg_nopredict.integer )
		CG_WeaponAnimation( &cg.snap->ps );
	else
		CG_WeaponAnimation( &cg.predictedPlayerState );  
	}
#endif
	// draw 3D view
	trap_R_RenderScene( &cg.refdef );

	// restore original viewpoint if running stereo
	if ( separation != 0 ) {
		VectorCopy( baseOrg, cg.refdef.vieworg );
	}
#ifndef SAME_WEAPONPIPE
	if ( BG_IsMelee( cg.snap->ps.weapon ) || cg_nopredict.integer )
		CG_WeaponAnimation( &cg.snap->ps );
	else
		CG_WeaponAnimation( &cg.predictedPlayerState );

  	CG_AddLocalEntities( qtrue );

	if (!test_x.integer )
 		trap_R_RenderScene( &cg.weaponrefdef ); 
#endif
	// draw status bar and other floating elements
 	CG_Draw2D();

//	void ClientScript_Update( void )
	ClientScript_Update();
}
 
