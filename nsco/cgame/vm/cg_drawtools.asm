export CG_AdjustFrom640
code
proc CG_AdjustFrom640 16 0
file "../cg_drawtools.c"
line 21
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_drawtools.c -- helper functions called by cg_draw, cg_scoreboard, cg_info, etc
;4:
;5:// every line of code that differs from the quake3:arena SDK
;6:// is property of manfred nerurkar
;7:// no commercial explotation allowed
;8:// you are only allowed to use this code in navy seals: covert operations 
;9:// a quake3 arena modifiation
;10:// defcon-x@ns-co.net
;11:
;12:#include "cg_local.h"
;13:
;14:/*
;15:================
;16:CG_AdjustFrom640
;17:
;18:Adjusted for resolution and screen aspect ratio
;19:================
;20:*/
;21:void CG_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 30
;22:#if 0
;23:	// adjust for wide screens
;24:	if ( cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640 ) {
;25:		*x += 0.5 * ( cgs.glconfig.vidWidth - ( cgs.glconfig.vidHeight * 640 / 480 ) );
;26:	}
;27:#endif
;28:	// scale for screen sizes
;29:
;30: 	*x *= cgs.screenXScale;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 31
;31: 	*y *= cgs.screenYScale; 
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 32
;32: 	*w *= cgs.screenXScale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 33
;33: 	*h *= cgs.screenYScale; 
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 34
;34:}
LABELV $84
endproc CG_AdjustFrom640 16 0
export CG_FillRect
proc CG_FillRect 4 36
line 43
;35:
;36:/*
;37:================
;38:CG_FillRect
;39:
;40:Coordinates are 640*480 virtual values
;41:=================
;42:*/
;43:void CG_FillRect( float x, float y, float width, float height, const float *color ) {
line 44
;44:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 46
;45:
;46:	CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 47
;47:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 49
;48:
;49:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 50
;50:}
LABELV $89
endproc CG_FillRect 4 36
export CG_DrawSides
proc CG_DrawSides 12 36
line 59
;51:
;52:/*
;53:================
;54:CG_DrawSides
;55:
;56:Coords are virtual 640x480
;57:================
;58:*/
;59:void CG_DrawSides(float x, float y, float w, float h, float size) {
line 60
;60:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 61
;61:	size *= cgs.screenXScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 62
;62:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 63
;63:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 64
;64:}
LABELV $92
endproc CG_DrawSides 12 36
export CG_DrawTopBottom
proc CG_DrawTopBottom 12 36
line 66
;65:
;66:void CG_DrawTopBottom(float x, float y, float w, float h, float size) {
line 67
;67:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 68
;68:	size *= cgs.screenYScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 69
;69:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 70
;70:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 71
;71:}
LABELV $98
endproc CG_DrawTopBottom 12 36
export CG_DrawRect
proc CG_DrawRect 0 20
line 79
;72:/*
;73:================
;74:UI_DrawRect
;75:
;76:Coordinates are 640*480 virtual values
;77:=================
;78:*/
;79:void CG_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 80
;80:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 82
;81:
;82:  CG_DrawTopBottom(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawTopBottom
CALLV
pop
line 83
;83:  CG_DrawSides(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawSides
CALLV
pop
line 85
;84:
;85:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 86
;86:}
LABELV $104
endproc CG_DrawRect 0 20
export CG_DrawPic
proc CG_DrawPic 8 36
line 97
;87:
;88:
;89:
;90:/*
;91:================
;92:CG_DrawPic
;93:
;94:Coordinates are 640*480 virtual values
;95:=================
;96:*/
;97:void CG_DrawPic( float x, float y, float width, float height, qhandle_t hShader ) {
line 98
;98:	CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 99
;99:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 100
;100:} 
LABELV $105
endproc CG_DrawPic 8 36
export CG_DrawChar
proc CG_DrawChar 48 36
line 110
;101: 
;102:
;103:/*
;104:===============
;105:CG_DrawChar
;106:
;107:Coordinates and size in 640*480 virtual screen size
;108:===============
;109:*/
;110:void CG_DrawChar( int x, int y, int width, int height, int ch ) {
line 116
;111:	int row, col;
;112:	float frow, fcol;
;113:	float size;
;114:	float	ax, ay, aw, ah;
;115:
;116:	ch &= 255;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 118
;117:
;118:	if ( ch == ' ' ) {
ADDRFP4 16
INDIRI4
CNSTI4 32
NEI4 $107
line 119
;119:		return;
ADDRGP4 $106
JUMPV
LABELV $107
line 122
;120:	}
;121:
;122:	ax = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 123
;123:	ay = y;
ADDRLP4 16
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
line 124
;124:	aw = width;
ADDRLP4 20
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 125
;125:	ah = height;
ADDRLP4 24
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 126
;126:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 128
;127:
;128:	row = ch>>4;
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 4
RSHI4
ASGNI4
line 129
;129:	col = ch&15;
ADDRLP4 32
ADDRFP4 16
INDIRI4
CNSTI4 15
BANDI4
ASGNI4
line 131
;130:
;131:	frow = row*0.0625;
ADDRLP4 0
CNSTF4 1031798784
ADDRLP4 28
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 132
;132:	fcol = col*0.0625;
ADDRLP4 4
CNSTF4 1031798784
ADDRLP4 32
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 133
;133:	size = 0.0625;
ADDRLP4 8
CNSTF4 1031798784
ASGNF4
line 135
;134:
;135:	trap_R_DrawStretchPic( ax, ay, aw, ah,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+205084
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 139
;136:					   fcol, frow, 
;137:					   fcol + size, frow + size, 
;138:					   cgs.media.charsetShader );
;139:}
LABELV $106
endproc CG_DrawChar 48 36
export CG_DrawStringExt
proc CG_DrawStringExt 48 20
line 153
;140:
;141:
;142:/*
;143:==================
;144:CG_DrawStringExt
;145:
;146:Draws a multi-colored string with a drop shadow, optionally forcing
;147:to a fixed color.
;148:
;149:Coordinates are at 640 by 480 virtual resolution
;150:==================
;151:*/
;152:void CG_DrawStringExt( int x, int y, const char *string, const float *setColor, 
;153:		qboolean forceColor, qboolean shadow, int charWidth, int charHeight, int maxChars ) {
line 159
;154:	vec4_t		color;
;155:	const char	*s;
;156:	int			xx;
;157:	int			cnt;
;158:
;159:	if (maxChars <= 0)
ADDRFP4 32
INDIRI4
CNSTI4 0
GTI4 $111
line 160
;160:		maxChars = 32767; // do them all!
ADDRFP4 32
CNSTI4 32767
ASGNI4
LABELV $111
line 163
;161:
;162:	// draw the drop shadow
;163:	if (shadow) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $113
line 164
;164:		color[0] = color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 165
;165:		color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 166
;166:		trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 167
;167:		s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 168
;168:		xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 169
;169:		cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $118
line 170
;170:		while ( *s && cnt < maxChars) {
line 171
;171:			if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $121
ADDRLP4 36
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $121
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $121
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $121
line 172
;172:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 173
;173:				continue;
ADDRGP4 $119
JUMPV
LABELV $121
line 175
;174:			}
;175:			CG_DrawChar( xx + 2, y + 2, charWidth, charHeight, *s );
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 176
;176:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 177
;177:			xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 178
;178:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 179
;179:		}
LABELV $119
line 170
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $123
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $118
LABELV $123
line 180
;180:	}
LABELV $113
line 183
;181:
;182:	// draw the colored text
;183:	s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 184
;184:	xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 185
;185:	cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 186
;186:	trap_R_SetColor( setColor );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $125
JUMPV
LABELV $124
line 187
;187:	while ( *s && cnt < maxChars) {
line 188
;188:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $127
ADDRLP4 32
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 32
INDIRI4
NEI4 $127
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $127
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $127
line 189
;189:			if ( !forceColor ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $129
line 190
;190:				memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 63
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 191
;191:				color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 192
;192:				trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 193
;193:			}
LABELV $129
line 194
;194:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 195
;195:			continue;
ADDRGP4 $125
JUMPV
LABELV $127
line 197
;196:		}
;197:		CG_DrawChar( xx, y, charWidth, charHeight, *s );
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 198
;198:		xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 199
;199:		cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 200
;200:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 201
;201:	}
LABELV $125
line 187
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $132
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $124
LABELV $132
line 202
;202:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 203
;203:}
LABELV $110
endproc CG_DrawStringExt 48 20
export CG_DrawStringExt2
proc CG_DrawStringExt2 60 20
line 215
;204:/*
;205:==================
;206:CG_DrawStringExt
;207:
;208:Draws a multi-colored string with a drop shadow, optionally forcing
;209:to a fixed color.
;210:
;211:Coordinates are at 640 by 480 virtual resolution
;212:==================
;213:*/
;214:void CG_DrawStringExt2( int x, int y, const char *string, const float *setColor, 
;215:		qboolean forceColor, qboolean outline, int charWidth, int charHeight, int maxChars ) {
line 221
;216:	vec4_t		color;
;217:	const char	*s;
;218:	int			xx;
;219:	int			cnt;
;220:
;221:	if (maxChars <= 0)
ADDRFP4 32
INDIRI4
CNSTI4 0
GTI4 $134
line 222
;222:		maxChars = 32767; // do them all!
ADDRFP4 32
CNSTI4 32767
ASGNI4
LABELV $134
line 225
;223:
;224:	// draw the drop shadow
;225:	if (outline) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $136
line 226
;226:		color[0] = color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 227
;227:		color[3] = setColor[3]-0.25;
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 228
;228:		if (color[3] <= 0)
ADDRLP4 12+12
INDIRF4
CNSTF4 0
GTF4 $141
line 229
;229:			color[3] = 0;
ADDRLP4 12+12
CNSTF4 0
ASGNF4
LABELV $141
line 230
;230:		trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 231
;231:		s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 232
;232:		xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 233
;233:		cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $146
JUMPV
LABELV $145
line 234
;234:		while ( *s && cnt < maxChars) {
line 235
;235:			if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $148
ADDRLP4 36
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $148
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $148
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $148
line 236
;236:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 237
;237:				continue;
ADDRGP4 $146
JUMPV
LABELV $148
line 239
;238:			}
;239:			CG_DrawChar( xx - 1, y + 1, charWidth, charHeight, *s );
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
SUBI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 240
;240:			CG_DrawChar( xx + 1, y + 1, charWidth, charHeight, *s );
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 241
;241:			CG_DrawChar( xx + 1, y - 1, charWidth, charHeight, *s );
ADDRLP4 52
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 52
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 52
INDIRI4
SUBI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 242
;242:			CG_DrawChar( xx - 1, y - 1, charWidth, charHeight, *s );
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 56
INDIRI4
SUBI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 56
INDIRI4
SUBI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 243
;243:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 244
;244:			xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 245
;245:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 246
;246:		}
LABELV $146
line 234
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $150
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $145
LABELV $150
line 247
;247:	}
LABELV $136
line 250
;248:
;249:	// draw the colored text
;250:	s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 251
;251:	xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 252
;252:	cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 253
;253:	trap_R_SetColor( setColor );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $152
JUMPV
LABELV $151
line 254
;254:	while ( *s && cnt < maxChars) {
line 255
;255:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $154
ADDRLP4 32
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 32
INDIRI4
NEI4 $154
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $154
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $154
line 256
;256:			if ( !forceColor ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $156
line 257
;257:				memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 63
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 258
;258:				color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 259
;259:				trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 260
;260:			}
LABELV $156
line 261
;261:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 262
;262:			continue;
ADDRGP4 $152
JUMPV
LABELV $154
line 264
;263:		}
;264:		CG_DrawChar( xx, y, charWidth, charHeight, *s );
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 265
;265:		xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 266
;266:		cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 267
;267:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 268
;268:	}
LABELV $152
line 254
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $159
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $151
LABELV $159
line 269
;269:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 270
;270:}
LABELV $133
endproc CG_DrawStringExt2 60 20
export CG_DrawBigString
proc CG_DrawBigString 28 36
line 274
;271:
;272:
;273:
;274:void CG_DrawBigString( int x, int y, const char *s, float alpha ) {
line 277
;275:	float	color[4];
;276:
;277:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 278
;278:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 280
;279:
;280:	CG_DrawStringExt( x, y, s, color, qfalse, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 281
;281:}
LABELV $160
endproc CG_DrawBigString 28 36
export CG_DrawBigStringColor
proc CG_DrawBigStringColor 8 36
line 283
;282:
;283:void CG_DrawBigStringColor( int x, int y, const char *s, vec4_t color ) {
line 284
;284:	CG_DrawStringExt( x, y, s, color, qtrue, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
CNSTI4 16
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 285
;285:}
LABELV $164
endproc CG_DrawBigStringColor 8 36
export CG_DrawStringOutline
proc CG_DrawStringOutline 12 36
line 286
;286:void CG_DrawStringOutline( int x, int y, const char *s, vec4_t color ) {
line 288
;287:		
;288:	int		size = 16; 
ADDRLP4 0
CNSTI4 16
ASGNI4
line 290
;289:
;290:	CG_DrawStringExt2( x, y, s, color, qtrue, qtrue, size, size, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt2
CALLV
pop
line 291
;291:}
LABELV $165
endproc CG_DrawStringOutline 12 36
export CG_DrawSmallString
proc CG_DrawSmallString 24 36
line 293
;292:
;293:void CG_DrawSmallString( int x, int y, const char *s, float alpha ) {
line 296
;294:	float	color[4];
;295:
;296:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 297
;297:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 298
;298:	CG_DrawStringExt( x, y, s, color, qfalse, qfalse, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 299
;299:}
LABELV $166
endproc CG_DrawSmallString 24 36
export CG_DrawSmallStringColor
proc CG_DrawSmallStringColor 4 36
line 301
;300:
;301:void CG_DrawSmallStringColor( int x, int y, const char *s, vec4_t color ) {
line 302
;302:	CG_DrawStringExt( x, y, s, color, qtrue, qfalse, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 303
;303:}
LABELV $170
endproc CG_DrawSmallStringColor 4 36
export CG_DrawTinyStringColor
proc CG_DrawTinyStringColor 4 36
line 304
;304:void CG_DrawTinyStringColor( int x, int y, const char *s, vec4_t color ) {
line 305
;305:	CG_DrawStringExt( x, y, s, color, qtrue, qfalse, 6, SMALLCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 306
;306:}
LABELV $171
endproc CG_DrawTinyStringColor 4 36
export CG_DrawStrlen
proc CG_DrawStrlen 20 0
line 316
;307:
;308:
;309:/*
;310:=================
;311:CG_DrawStrlen
;312:
;313:Returns character count, skiping color escape codes
;314:=================
;315:*/
;316:int CG_DrawStrlen( const char *str ) {
line 317
;317:	const char *s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 318
;318:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $173
line 320
;319:
;320:	while ( *s ) {
line 321
;321:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $176
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $176
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $176
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $176
line 322
;322:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 323
;323:		} else {
ADDRGP4 $177
JUMPV
LABELV $176
line 324
;324:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 325
;325:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 326
;326:		}
LABELV $177
line 327
;327:	}
LABELV $174
line 320
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $173
line 329
;328:
;329:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $172
endproc CG_DrawStrlen 20 0
proc CG_TileClearBox 16 36
line 340
;330:}
;331:
;332:/*
;333:=============
;334:CG_TileClearBox
;335:
;336:This repeats a 64*64 tile graphic to fill the screen around a sized down
;337:refresh window.
;338:=============
;339:*/
;340:static void CG_TileClearBox( int x, int y, int w, int h, qhandle_t hShader ) {
line 343
;341:	float	s1, t1, s2, t2;
;342:
;343:	s1 = x/64.0;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 344
;344:	t1 = y/64.0;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 345
;345:	s2 = (x+w)/64.0;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 346
;346:	t2 = (y+h)/64.0;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 347
;347:	trap_R_DrawStretchPic( x, y, w, h, s1, t1, s2, t2, hShader );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 348
;348:}
LABELV $178
endproc CG_TileClearBox 16 36
export CG_TileClear
proc CG_TileClear 48 20
line 359
;349:
;350:
;351:
;352:/*
;353:==============
;354:CG_TileClear
;355:
;356:Clear around a sized down screen
;357:==============
;358:*/
;359:void CG_TileClear( void ) {
line 363
;360:	int		top, bottom, left, right;
;361:	int		w, h;
;362:
;363:	w = cgs.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 cgs+20100+11304
INDIRI4
ASGNI4
line 364
;364:	h = cgs.glconfig.vidHeight;
ADDRLP4 20
ADDRGP4 cgs+20100+11308
INDIRI4
ASGNI4
line 366
;365:
;366:	if ( cg.refdef.x == 0 && cg.refdef.y == 0 && 
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 cg+109044
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $184
ADDRGP4 cg+109044+4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $184
ADDRGP4 cg+109044+8
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $184
ADDRGP4 cg+109044+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $184
line 367
;367:		cg.refdef.width == w && cg.refdef.height == h ) {
line 368
;368:		return;		// full screen rendering
ADDRGP4 $179
JUMPV
LABELV $184
line 371
;369:	}
;370:
;371:	top = cg.refdef.y;
ADDRLP4 0
ADDRGP4 cg+109044+4
INDIRI4
ASGNI4
line 372
;372:	bottom = top + cg.refdef.height-1;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109044+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 373
;373:	left = cg.refdef.x;
ADDRLP4 12
ADDRGP4 cg+109044
INDIRI4
ASGNI4
line 374
;374:	right = left + cg.refdef.width-1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+109044+8
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 377
;375:
;376:	// clear above view screen
;377:	CG_TileClearBox( 0, 0, w, top, cgs.media.backTileShader );
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+205084+100
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 380
;378:
;379:	// clear below view screen
;380:	CG_TileClearBox( 0, bottom, w, h - bottom, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRGP4 cgs+205084+100
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 383
;381:
;382:	// clear left of view screen
;383:	CG_TileClearBox( 0, top, left, bottom - top + 1, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+205084+100
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 386
;384:
;385:	// clear right of view screen
;386:	CG_TileClearBox( right, top, w - right, bottom - top + 1, cgs.media.backTileShader );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+205084+100
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 387
;387:}
LABELV $179
endproc CG_TileClear 48 20
bss
align 4
LABELV $209
skip 16
export CG_FadeColor
code
proc CG_FadeColor 8 0
line 396
;388:
;389:
;390:
;391:/*
;392:================
;393:CG_FadeColor
;394:================
;395:*/
;396:float *CG_FadeColor( int startMsec, int totalMsec ) {
line 400
;397:	static vec4_t		color;
;398:	int			t;
;399:
;400:	if ( startMsec == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $210
line 401
;401:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $208
JUMPV
LABELV $210
line 404
;402:	}
;403:
;404:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 406
;405:
;406:	if ( t >= totalMsec ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $213
line 407
;407:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $208
JUMPV
LABELV $213
line 411
;408:	}
;409:
;410:	// fade out
;411:	if ( totalMsec - t < FADE_TIME ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 200
GEI4 $215
line 412
;412:		color[3] = ( totalMsec - t ) * 1.0/FADE_TIME;
ADDRGP4 $209+12
CNSTF4 1065353216
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 413
;413:	} else {
ADDRGP4 $216
JUMPV
LABELV $215
line 414
;414:		color[3] = 1.0;
ADDRGP4 $209+12
CNSTF4 1065353216
ASGNF4
line 415
;415:	}
LABELV $216
line 416
;416:	color[0] = color[1] = color[2] = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $209+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $209+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $209
ADDRLP4 4
INDIRF4
ASGNF4
line 418
;417:
;418:	return color;
ADDRGP4 $209
RETP4
LABELV $208
endproc CG_FadeColor 8 0
data
align 4
LABELV $222
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
align 4
LABELV $223
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $224
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $225
byte 4 1060320051
byte 4 1060320051
byte 4 1060320051
byte 4 1065353216
export CG_TeamColor
code
proc CG_TeamColor 4 0
line 427
;419:}
;420:
;421:
;422:/*
;423:================
;424:CG_TeamColor
;425:================
;426:*/
;427:float *CG_TeamColor( int team ) {
line 433
;428:	static vec4_t	red = {1, 0.2f, 0.2f, 1};
;429:	static vec4_t	blue = {0.2f, 0.2f, 1, 1};
;430:	static vec4_t	other = {1, 1, 1, 1};
;431:	static vec4_t	spectator = {0.7f, 0.7f, 0.7f, 1};
;432:
;433:	switch ( team ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $228
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $229
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $230
ADDRGP4 $226
JUMPV
LABELV $228
line 435
;434:	case TEAM_RED:
;435:		return red;
ADDRGP4 $222
RETP4
ADDRGP4 $221
JUMPV
LABELV $229
line 437
;436:	case TEAM_BLUE:
;437:		return blue;
ADDRGP4 $223
RETP4
ADDRGP4 $221
JUMPV
LABELV $230
line 439
;438:	case TEAM_SPECTATOR:
;439:		return spectator;
ADDRGP4 $225
RETP4
ADDRGP4 $221
JUMPV
LABELV $226
line 441
;440:	default:
;441:		return other;
ADDRGP4 $224
RETP4
LABELV $221
endproc CG_TeamColor 4 0
export CG_GetColorForHealth
proc CG_GetColorForHealth 16 0
line 452
;442:	}
;443:}
;444:
;445:
;446:
;447:/*
;448:=================
;449:CG_GetColorForHealth
;450:=================
;451:*/
;452:void CG_GetColorForHealth( int health, int armor, vec4_t hcolor ) {
line 458
;453:	int		count;
;454:	int		max;
;455:
;456:	// calculate the total points of damage that can
;457:	// be sustained at the current health / armor level
;458:	if ( health <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $232
line 459
;459:		VectorClear( hcolor );	// black
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 460
;460:		hcolor[3] = 1;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 461
;461:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 463
;462:	}
;463:	count = armor;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 464
;464:	max = health;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 465
;465:	if ( max < count ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $234
line 466
;466:		count = max;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 467
;467:	}
LABELV $234
line 468
;468:	health += count;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 471
;469:
;470:	// set the color based on health
;471:	hcolor[0] = 1.0;
ADDRFP4 8
INDIRP4
CNSTF4 1065353216
ASGNF4
line 472
;472:	hcolor[3] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 473
;473:	if ( health >= 100 ) {
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $236
line 474
;474:		hcolor[2] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 475
;475:	} else if ( health < 66 ) {
ADDRGP4 $237
JUMPV
LABELV $236
ADDRFP4 0
INDIRI4
CNSTI4 66
GEI4 $238
line 476
;476:		hcolor[2] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 477
;477:	} else {
ADDRGP4 $239
JUMPV
LABELV $238
line 478
;478:		hcolor[2] = ( health - 66 ) / 33.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 66
SUBI4
CVIF4 4
CNSTF4 1107558400
DIVF4
ASGNF4
line 479
;479:	}
LABELV $239
LABELV $237
line 481
;480:
;481:	if ( health > 60 ) {
ADDRFP4 0
INDIRI4
CNSTI4 60
LEI4 $240
line 482
;482:		hcolor[1] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 483
;483:	} else if ( health < 30 ) {
ADDRGP4 $241
JUMPV
LABELV $240
ADDRFP4 0
INDIRI4
CNSTI4 30
GEI4 $242
line 484
;484:		hcolor[1] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 485
;485:	} else {
ADDRGP4 $243
JUMPV
LABELV $242
line 486
;486:		hcolor[1] = ( health - 30 ) / 30.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
CNSTF4 1106247680
DIVF4
ASGNF4
line 487
;487:	}
LABELV $243
LABELV $241
line 488
;488:}
LABELV $231
endproc CG_GetColorForHealth 16 0
export CG_ColorForHealth
proc CG_ColorForHealth 0 12
line 495
;489:
;490:/*
;491:=================
;492:CG_ColorForHealth
;493:=================
;494:*/
;495:void CG_ColorForHealth( vec4_t hcolor ) {
line 497
;496:
;497:	CG_GetColorForHealth( cg.snap->ps.stats[STAT_HEALTH], 
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 499
;498:		0, hcolor );
;499:}
LABELV $244
endproc CG_ColorForHealth 0 12
data
align 4
LABELV propMap
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 8
byte 4 21
byte 4 137
byte 4 6
byte 4 64
byte 4 205
byte 4 11
byte 4 53
byte 4 137
byte 4 16
byte 4 70
byte 4 137
byte 4 16
byte 4 87
byte 4 137
byte 4 26
byte 4 125
byte 4 137
byte 4 20
byte 4 21
byte 4 103
byte 4 5
byte 4 159
byte 4 137
byte 4 7
byte 4 167
byte 4 137
byte 4 7
byte 4 146
byte 4 137
byte 4 12
byte 4 41
byte 4 171
byte 4 15
byte 4 42
byte 4 205
byte 4 8
byte 4 27
byte 4 103
byte 4 10
byte 4 51
byte 4 205
byte 4 6
byte 4 88
byte 4 171
byte 4 13
byte 4 41
byte 4 69
byte 4 16
byte 4 58
byte 4 69
byte 4 9
byte 4 68
byte 4 69
byte 4 16
byte 4 85
byte 4 69
byte 4 16
byte 4 102
byte 4 69
byte 4 16
byte 4 119
byte 4 69
byte 4 16
byte 4 136
byte 4 69
byte 4 16
byte 4 153
byte 4 69
byte 4 16
byte 4 170
byte 4 69
byte 4 16
byte 4 187
byte 4 69
byte 4 16
byte 4 35
byte 4 205
byte 4 6
byte 4 27
byte 4 205
byte 4 7
byte 4 123
byte 4 171
byte 4 17
byte 4 38
byte 4 103
byte 4 17
byte 4 141
byte 4 171
byte 4 17
byte 4 76
byte 4 205
byte 4 12
byte 4 28
byte 4 137
byte 4 24
byte 4 1
byte 4 1
byte 4 22
byte 4 24
byte 4 1
byte 4 16
byte 4 41
byte 4 1
byte 4 20
byte 4 62
byte 4 1
byte 4 20
byte 4 83
byte 4 1
byte 4 14
byte 4 98
byte 4 1
byte 4 14
byte 4 113
byte 4 1
byte 4 24
byte 4 138
byte 4 1
byte 4 18
byte 4 158
byte 4 1
byte 4 5
byte 4 164
byte 4 1
byte 4 12
byte 4 177
byte 4 1
byte 4 18
byte 4 196
byte 4 1
byte 4 13
byte 4 210
byte 4 1
byte 4 27
byte 4 1
byte 4 35
byte 4 21
byte 4 23
byte 4 35
byte 4 25
byte 4 49
byte 4 35
byte 4 15
byte 4 65
byte 4 35
byte 4 26
byte 4 92
byte 4 35
byte 4 17
byte 4 110
byte 4 35
byte 4 16
byte 4 127
byte 4 35
byte 4 17
byte 4 145
byte 4 35
byte 4 20
byte 4 166
byte 4 35
byte 4 21
byte 4 188
byte 4 35
byte 4 30
byte 4 219
byte 4 35
byte 4 19
byte 4 1
byte 4 69
byte 4 20
byte 4 22
byte 4 69
byte 4 18
byte 4 57
byte 4 171
byte 4 7
byte 4 74
byte 4 171
byte 4 13
byte 4 65
byte 4 171
byte 4 7
byte 4 114
byte 4 137
byte 4 10
byte 4 21
byte 4 171
byte 4 19
byte 4 58
byte 4 205
byte 4 5
byte 4 1
byte 4 1
byte 4 22
byte 4 24
byte 4 1
byte 4 16
byte 4 41
byte 4 1
byte 4 20
byte 4 62
byte 4 1
byte 4 20
byte 4 83
byte 4 1
byte 4 14
byte 4 98
byte 4 1
byte 4 14
byte 4 113
byte 4 1
byte 4 24
byte 4 138
byte 4 1
byte 4 18
byte 4 158
byte 4 1
byte 4 5
byte 4 164
byte 4 1
byte 4 12
byte 4 177
byte 4 1
byte 4 18
byte 4 196
byte 4 1
byte 4 13
byte 4 210
byte 4 1
byte 4 27
byte 4 1
byte 4 35
byte 4 21
byte 4 23
byte 4 35
byte 4 25
byte 4 49
byte 4 35
byte 4 15
byte 4 65
byte 4 35
byte 4 26
byte 4 92
byte 4 35
byte 4 17
byte 4 110
byte 4 35
byte 4 16
byte 4 127
byte 4 35
byte 4 17
byte 4 145
byte 4 35
byte 4 20
byte 4 166
byte 4 35
byte 4 21
byte 4 188
byte 4 35
byte 4 30
byte 4 219
byte 4 35
byte 4 19
byte 4 1
byte 4 69
byte 4 20
byte 4 22
byte 4 69
byte 4 18
byte 4 102
byte 4 171
byte 4 10
byte 4 21
byte 4 205
byte 4 5
byte 4 113
byte 4 171
byte 4 9
byte 4 56
byte 4 103
byte 4 17
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 11
byte 4 12
byte 4 33
byte 4 49
byte 4 12
byte 4 31
byte 4 85
byte 4 12
byte 4 31
byte 4 120
byte 4 12
byte 4 30
byte 4 156
byte 4 12
byte 4 21
byte 4 183
byte 4 12
byte 4 21
byte 4 207
byte 4 12
byte 4 32
byte 4 13
byte 4 55
byte 4 30
byte 4 49
byte 4 55
byte 4 13
byte 4 66
byte 4 55
byte 4 29
byte 4 101
byte 4 55
byte 4 31
byte 4 135
byte 4 55
byte 4 21
byte 4 158
byte 4 55
byte 4 40
byte 4 204
byte 4 55
byte 4 32
byte 4 12
byte 4 97
byte 4 31
byte 4 48
byte 4 97
byte 4 31
byte 4 82
byte 4 97
byte 4 30
byte 4 118
byte 4 97
byte 4 30
byte 4 153
byte 4 97
byte 4 30
byte 4 185
byte 4 97
byte 4 25
byte 4 213
byte 4 97
byte 4 30
byte 4 11
byte 4 139
byte 4 32
byte 4 42
byte 4 139
byte 4 51
byte 4 93
byte 4 139
byte 4 32
byte 4 126
byte 4 139
byte 4 31
byte 4 158
byte 4 139
byte 4 25
code
proc UI_DrawBannerString2 52 36
line 663
;500:
;501:
;502:
;503:/*
;504:=================
;505:UI_DrawProportionalString2
;506:=================
;507:*/
;508:static int	propMap[128][3] = {
;509:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;510:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;511:
;512:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;513:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;514:
;515:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;516:{ 21, 137,   6}, // !
;517:{ 64, 205,  11}, // "
;518:{ 53, 137,  16}, // #
;519:{ 70, 137,  16}, // $
;520:{ 87, 137,  26}, // %
;521:{125, 137,  20}, // &
;522:{ 21, 103,   5}, // `
;523:{159, 137,   7}, // (
;524:{167, 137,   7}, // )
;525:{146, 137,  12}, // *
;526:{ 41, 171,  15}, // +
;527:{ 42, 205,   8}, // ,
;528:{ 27, 103,  10}, // -
;529:{ 51, 205,   6}, // .
;530:{ 88, 171,  13}, // /
;531:
;532:{ 41,  69,  16}, // 0
;533:{ 58,  69,   9}, // 1
;534:{ 68,  69,  16}, // 2
;535:{ 85,  69,  16}, // 3
;536:{102,  69,  16}, // 4
;537:{119,  69,  16}, // 5
;538:{136,  69,  16}, // 6
;539:{153,  69,  16}, // 7
;540:{170,  69,  16}, // 8
;541:{187,  69,  16}, // 9
;542:{ 35, 205,   6}, // :
;543:{ 27, 205,   7}, // ;
;544:{123, 171,  17}, // <
;545:{ 38, 103,  17}, // =
;546:{141, 171,  17}, // >
;547:{ 76, 205,  12}, // ?
;548:
;549:{ 28, 137,  24}, // @
;550:{  1,   1,  22}, // A
;551:{ 24,   1,  16}, // B
;552:{ 41,   1,  20}, // C
;553:{ 62,   1,  20}, // D
;554:{ 83,   1,  14}, // E
;555:{ 98,   1,  14}, // F
;556:{113,   1,  24}, // G
;557:{138,   1,  18}, // H
;558:{158,   1,   5}, // I
;559:{164,   1,  12}, // J
;560:{177,   1,  18}, // K
;561:{196,   1,  13}, // L
;562:{210,   1,  27}, // M
;563:
;564:{  1,  35,  21}, // N
;565:{ 23,  35,  25}, // O
;566:{ 49,  35,  15}, // P
;567:{ 65,  35,  26}, // Q
;568:{ 92,  35,  17}, // R
;569:{110,  35,  16}, // S
;570:{127,  35,  17}, // T
;571:{145,  35,  20}, // U
;572:{166,  35,  21}, // V
;573:{188,  35,  30}, // W
;574:{219,  35,  19}, // X
;575:{  1,  69,  20}, // Y
;576:{ 22,  69,  18}, // Z
;577:
;578:{ 57, 171,   7}, // [
;579:{ 74, 171,  13},
;580:{ 65, 171,   7}, // ]
;581:{114, 137,  10}, // ^
;582://{  1,   1,  22}, // SPACER TO MAKE LOWER CASE LETTERS WORK! which char is missing?
;583:{ 21, 171,  19}, // _
;584:
;585:{ 58, 205,   5}, // '
;586:{  1,   1,  22}, // A
;587:{ 24,   1,  16}, // B
;588:{ 41,   1,  20}, // C
;589:{ 62,   1,  20}, // D
;590:{ 83,   1,  14}, // E
;591:{ 98,   1,  14}, // F
;592:{113,   1,  24}, // G
;593:{138,   1,  18}, // H
;594:{158,   1,   5}, // I
;595:{164,   1,  12}, // J
;596:{177,   1,  18}, // K
;597:{196,   1,  13}, // L
;598:{210,   1,  27}, // M
;599:{  1,  35,  21}, // N
;600:{ 23,  35,  25}, // O
;601:
;602:{ 49,  35,  15}, // P
;603:{ 65,  35,  26}, // Q
;604:{ 92,  35,  17}, // R
;605:{110,  35,  16}, // S
;606:{127,  35,  17}, // T
;607:{145,  35,  20}, // U
;608:{166,  35,  21}, // V
;609:{188,  35,  30}, // W
;610:{219,  35,  19}, // X
;611:{  1,  69,  20}, // Y
;612:{ 22,  69,  18}, // Z
;613:{102, 171,  10}, // {
;614:{ 21, 205,   5}, // |
;615:{113, 171,   9}, // }
;616:{ 56, 103,  17}, // ~
;617:{  0,   0,  -1}  // DEL
;618:};
;619:
;620:
;621:static int propMapB[26][3] = {
;622:{11, 12, 33},
;623:{49, 12, 31},
;624:{85, 12, 31},
;625:{120, 12, 30},
;626:{156, 12, 21},
;627:{183, 12, 21},
;628:{207, 12, 32},
;629:
;630:{13, 55, 30},
;631:{49, 55, 13},
;632:{66, 55, 29},
;633:{101, 55, 31},
;634:{135, 55, 21},
;635:{158, 55, 40},
;636:{204, 55, 32},
;637:
;638:{12, 97, 31},
;639:{48, 97, 31},
;640:{82, 97, 30},
;641:{118, 97, 30},
;642:{153, 97, 30},
;643:{185, 97, 25},
;644:{213, 97, 30},
;645:
;646:{11, 139, 32},
;647:{42, 139, 51},
;648:{93, 139, 32},
;649:{126, 139, 31},
;650:{158, 139, 25},
;651:};
;652:
;653:#define PROPB_GAP_WIDTH		4
;654:#define PROPB_SPACE_WIDTH	12
;655:#define PROPB_HEIGHT		36
;656:
;657:/*
;658:=================
;659:UI_DrawBannerString
;660:=================
;661:*/
;662:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;663:{
line 676
;664:	const char* s;
;665:	char	ch;
;666:	float	ax;
;667:	float	ay;
;668:	float	aw;
;669:	float	ah;
;670:	float	frow;
;671:	float	fcol;
;672:	float	fwidth;
;673:	float	fheight;
;674:
;675:	// draw the colored text
;676:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 678
;677:	
;678:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31440
INDIRF4
ADDF4
ASGNF4
line 679
;679:	ay = y * cgs.screenXScale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 681
;680:
;681:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $251
JUMPV
LABELV $250
line 683
;682:	while ( *s )
;683:	{
line 684
;684:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
line 685
;685:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $253
line 686
;686:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* cgs.screenXScale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1098907648
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDF4
ASGNF4
line 687
;687:		}
ADDRGP4 $254
JUMPV
LABELV $253
line 688
;688:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 40
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $256
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $256
line 689
;689:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 65
SUBI4
CVII1 4
ASGNI1
line 690
;690:			fcol = (float)propMapB[ch][0] / 256.0f;
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMapB
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 691
;691:			frow = (float)propMapB[ch][1] / 256.0f;
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMapB+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 692
;692:			fwidth = (float)propMapB[ch][2] / 256.0f;
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 693
;693:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 694
;694:			aw = (float)propMapB[ch][2] * cgs.screenXScale;
ADDRLP4 12
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 695
;695:			ah = (float)PROPB_HEIGHT * cgs.screenXScale;
ADDRLP4 24
CNSTF4 1108344832
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 696
;696:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, cgs.media.charsetPropB );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+205084+12
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 697
;697:			ax += (aw + (float)PROPB_GAP_WIDTH * cgs.screenXScale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1082130432
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 698
;698:		}
LABELV $256
LABELV $254
line 699
;699:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 700
;700:	}
LABELV $251
line 682
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $250
line 702
;701:
;702:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 703
;703:}
LABELV $246
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 44 16
line 705
;704:
;705:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 712
;706:	const char *	s;
;707:	int				ch;
;708:	int				width;
;709:	vec4_t			drawcolor;
;710:
;711:	// find the width of the drawn text
;712:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 713
;713:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $267
line 714
;714:	while ( *s ) {
line 715
;715:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 716
;716:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $270
line 717
;717:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 718
;718:		}
ADDRGP4 $271
JUMPV
LABELV $270
line 719
;719:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $272
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $272
line 720
;720:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 propMapB-780+8
ADDP4
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 721
;721:		}
LABELV $272
LABELV $271
line 722
;722:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 723
;723:	}
LABELV $268
line 714
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $267
line 724
;724:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 726
;725:
;726:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $277
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $279
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $280
ADDRGP4 $277
JUMPV
LABELV $279
line 728
;727:		case UI_CENTER:
;728:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 729
;729:			break;
ADDRGP4 $277
JUMPV
LABELV $280
line 732
;730:
;731:		case UI_RIGHT:
;732:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 733
;733:			break;
line 737
;734:
;735:		case UI_LEFT:
;736:		default:
;737:			break;
LABELV $277
line 740
;738:	}
;739:
;740:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $282
line 741
;741:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 742
;742:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 743
;743:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 744
;744:	}
LABELV $282
line 746
;745:
;746:	UI_DrawBannerString2( x, y, str, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 747
;747:}
LABELV $266
endproc UI_DrawBannerString 44 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 750
;748:
;749:
;750:int UI_ProportionalStringWidth( const char* str ) {
line 756
;751:	const char *	s;
;752:	int				ch;
;753:	int				charWidth;
;754:	int				width;
;755:
;756:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 757
;757:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $288
line 758
;758:	while ( *s ) {
line 759
;759:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 760
;760:		charWidth = propMap[ch][2];
ADDRLP4 4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 761
;761:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $292
line 762
;762:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 763
;763:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 764
;764:		}
LABELV $292
line 765
;765:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 766
;766:	}
LABELV $289
line 758
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $288
line 768
;767:
;768:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 769
;769:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $287
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 773
;770:}
;771:
;772:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;773:{
line 786
;774:	const char* s;
;775:	char	ch;
;776:	float	ax;
;777:	float	ay;
;778:	float	aw;
;779:	float	ah;
;780:	float	frow;
;781:	float	fcol;
;782:	float	fwidth;
;783:	float	fheight;
;784:
;785:	// draw the colored text
;786:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 788
;787:	
;788:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31440
INDIRF4
ADDF4
ASGNF4
line 789
;789:	ay = y * cgs.screenXScale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 791
;790:
;791:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $299
JUMPV
LABELV $298
line 793
;792:	while ( *s )
;793:	{
line 794
;794:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
line 795
;795:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $301
line 796
;796:			aw = (float)PROP_SPACE_WIDTH * cgs.screenXScale * sizeScale;
ADDRLP4 8
CNSTF4 1090519040
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 797
;797:		} else if ( propMap[ch][2] != -1 ) {
ADDRGP4 $302
JUMPV
LABELV $301
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $304
line 798
;798:			fcol = (float)propMap[ch][0] / 256.0f;
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMap
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 799
;799:			frow = (float)propMap[ch][1] / 256.0f;
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMap+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 800
;800:			fwidth = (float)propMap[ch][2] / 256.0f;
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 801
;801:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 802
;802:			aw = (float)propMap[ch][2] * cgs.screenXScale * sizeScale;
ADDRLP4 8
CNSTI4 12
ADDRLP4 0
INDIRI1
CVII4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 803
;803:			ah = (float)PROP_HEIGHT * cgs.screenXScale * sizeScale;
ADDRLP4 24
CNSTF4 1104674816
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 804
;804:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 805
;805:		} else {
ADDRGP4 $305
JUMPV
LABELV $304
line 806
;806:			aw = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 807
;807:		}
LABELV $305
LABELV $302
line 809
;808:
;809:		ax += (aw + (float)PROP_GAP_WIDTH * cgs.screenXScale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 810
;810:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 811
;811:	}
LABELV $299
line 792
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $298
line 813
;812:
;813:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 814
;814:}
LABELV $294
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 821
;815:
;816:/*
;817:=================
;818:UI_ProportionalSizeScale
;819:=================
;820:*/
;821:float UI_ProportionalSizeScale( int style ) {
line 822
;822:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $314
line 823
;823:		return 0.75;
CNSTF4 1061158912
RETF4
ADDRGP4 $313
JUMPV
LABELV $314
line 826
;824:	}
;825:
;826:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $313
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 835
;827:}
;828:
;829:
;830:/*
;831:=================
;832:UI_DrawProportionalString
;833:=================
;834:*/
;835:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 840
;836:	vec4_t	drawcolor;
;837:	int		width;
;838:	float	sizeScale;
;839:
;840:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 842
;841:
;842:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $318
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $320
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $321
ADDRGP4 $318
JUMPV
LABELV $320
line 844
;843:		case UI_CENTER:
;844:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 845
;845:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 846
;846:			break;
ADDRGP4 $318
JUMPV
LABELV $321
line 849
;847:
;848:		case UI_RIGHT:
;849:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 850
;850:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 851
;851:			break;
line 855
;852:
;853:		case UI_LEFT:
;854:		default:
;855:			break;
LABELV $318
line 858
;856:	}
;857:
;858:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $323
line 859
;859:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 860
;860:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 861
;861:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, cgs.media.charsetProp );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+205084+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 862
;862:	}
LABELV $323
line 864
;863:
;864:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $330
line 865
;865:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 866
;866:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 867
;867:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 868
;868:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 869
;869:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+205084+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 870
;870:		return;
ADDRGP4 $316
JUMPV
LABELV $330
line 873
;871:	}
;872:
;873:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $337
line 874
;874:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 875
;875:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 876
;876:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 877
;877:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 878
;878:		UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+205084+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 880
;879:
;880:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 881
;881:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 882
;882:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 883
;883:		drawcolor[3] = 0.5 + 0.5 * sin( cg.time / PULSE_DIVISOR );
ADDRGP4 cg+107604
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
CNSTF4 1056964608
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 884
;884:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetPropGlow );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+205084+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 885
;885:		return;
ADDRGP4 $316
JUMPV
LABELV $337
line 888
;886:	}
;887:
;888:	UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+205084+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 889
;889:}
LABELV $316
endproc UI_DrawProportionalString 44 24
import ClientScript_Update
import ClientScript_Init
import CG_LightParticles
import CG_Tracer
import CG_CalculateWeaponPosition
import vtos
import CG_GetOriginFromTag
import CG_AddAtmosphericEffects
import CG_InvenSelect
import CG_GetCamoStringForType
import CG_EnviromentParse
import CG_BloodPool
import CG_ParseBriefingFile
import CG_ExplosionSparks
import CG_ResetMonsterEntity
import CG_SparkTrail
import CG_Explosion
import NS_CG_LaunchFuncExplosive
import CG_WeaponAnimation
import CG_AddPlayerWeapon2
import CG_ParseWeaponAnimationFile
import CG_BleederTrail
import CG_LaunchParticle
import CG_ReloadClipWarning
import CG_BloodOnWallMark
import CG_CreateBleeder
import CG_RemoveAllFragments
import CG_CacheAllModels
import CG_LoadingBarSetMax
import CG_LoadingBarUpdate
import CG_LoadBarInit
import i_Menu
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_GrappleTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_InitMemory
import CG_Alloc
import CG_GameMem_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawString
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_ForceCvar
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_PrecacheWeapons
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_lowAmmoWarning
import cg_crosshairFade
import cg_bulletpredict
import cg_qcmd_a
import cg_qcmd_b
import cg_qcmd_g
import cg_qcmd_r
import cg_qcmd_size
import cg_qcmd_dscr0
import cg_qcmd_dscr9
import cg_qcmd_dscr8
import cg_qcmd_dscr7
import cg_qcmd_dscr6
import cg_qcmd_dscr5
import cg_qcmd_dscr4
import cg_qcmd_dscr3
import cg_qcmd_dscr2
import cg_qcmd_dscr1
import cg_qcmd_cmd0
import cg_qcmd_cmd9
import cg_qcmd_cmd8
import cg_qcmd_cmd7
import cg_qcmd_cmd6
import cg_qcmd_cmd5
import cg_qcmd_cmd4
import cg_qcmd_cmd3
import cg_qcmd_cmd2
import cg_qcmd_cmd1
import cg_qcmd_posy
import cg_qcmd_posx
import cg_newbeeTime
import cg_autoReload
import cg_antiLag
import cg_goreLevel
import cg_chatBeep
import cg_showConsole
import cg_chatHeight
import cg_chatTime
import ui_friendlyfire
import ui_roundtime
import ui_timelimit
import ui_teampointlimit
import raise_tec
import raise_sta
import raise_stl
import raise_str
import raise_spd
import raise_acc
import cg_disableTangoHandSkin
import cg_disableHeadstuff
import cg_newbeeHeight
import cg_correctgunFov
import cg_grenadeSparks
import ui_gotbriefcase
import ui_isvip
import ui_gotbomb
import mi_assaultfield
import mi_blowup
import mi_viptime
import mi_viprescue
import cg_wakemarkDistantTime
import cg_wakemarkTime
import cg_bulletTracerWidth
import cg_bulletTracerLength
import ui_team
import char_xp
import char_strength
import char_technical
import char_accuracy
import char_speed
import char_stealth
import char_stamina
import cg_particleTime
import cg_gunSmokeTime
import cg_lowEffects
import cg_atmosphericEffects
import cg_enableTimeSelect
import cg_enableDust
import cg_enableBreath
import pmodel_o
import cg_gunSmoke
import test_w
import test_h
import test_y
import test_x
import cg_debugAlloc
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_blood
import cg_paused
import cg_buildScript
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import CG_ParseHelpFile
import CG_HandleHelp
import CG_NewbieMessage
import BG_GotWeapon
import BG_RemoveWeapon
import BG_ClearWeapons
import BG_PackWeapon
import BG_WeaponMods
import BG_GetSpeedMod
import BG_CalcSpeed
import BG_IsInGLMode
import BG_IsShotgun
import BG_HasLaser
import BG_IsZooming
import BG_IsGrenade
import BG_IsSMG
import BG_IsSecondary
import BG_IsPrimary
import BG_GotPrimary
import BG_IsPistol
import BG_IsMelee
import BG_IsSmg
import BG_IsRifle
import BG_IsSemiAutomatic
import BG_LeadGetBreakValueForSurface
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_SurfaceToString
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import colorLtBlue
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Swap_Init
import LittleFloat
import BigFloat
import LittleLong64
import BigLong64
import LittleLong
import BigLong
import LittleShort
import BigShort
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorInverse
import VectorNormalize2
import VectorNormalizeFast
import VectorNormalize
import CrossProduct
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
