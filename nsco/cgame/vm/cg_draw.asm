data
export menuScoreboard
align 4
LABELV menuScoreboard
byte 4 0
export nextChBlinik
align 4
LABELV nextChBlinik
byte 4 0
export chBlink
align 4
LABELV chBlink
byte 4 0
export CG_Text_Width
code
proc CG_Text_Width 48 4
file "../cg_draw.c"
line 38
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_draw.c -- draw all of the graphical elements during
;4:// active (after loading) gameplay
;5:
;6:// every line of code that differs from the quake3:arena SDK
;7:// is property of manfred nerurkar
;8:// no commercial explotation allowed
;9:// you are only allowed to use this code in navy seals: covert operations 
;10:// a quake3 arena modifiation
;11:// defcon-x@ns-co.net
;12:
;13:#include "cg_local.h"
;14:#include "variables.h"
;15:
;16:#ifdef MISSIONPACK
;17:#include "../ui/ui_shared.h"
;18:
;19:// used for scoreboard
;20:extern displayContextDef_t cgDC;
;21:menuDef_t *menuScoreboard = NULL;
;22:#else
;23:int drawTeamOverlayModificationCount = -1;
;24:#endif
;25:
;26:int sortedTeamPlayers[TEAM_MAXOVERLAY];
;27:int	numSortedTeamPlayers;
;28:int nextChBlinik = 0;
;29:qboolean chBlink = qfalse;
;30:
;31:char systemChat[256];
;32:char teamChat1[256];
;33:char teamChat2[256];
;34:
;35:
;36:#ifdef MISSIONPACK
;37:
;38:int CG_Text_Width(const char *text, float scale, int limit) {
line 43
;39:  int count,len;
;40:	float out;
;41:	glyphInfo_t *glyph;
;42:	float useScale;
;43:	const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 44
;44:	fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 12
ADDRGP4 cgDC+232+12
ASGNP4
line 45
;45:	if (scale <= cg_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $96
line 46
;46:		font = &cgDC.Assets.smallFont;
ADDRLP4 12
ADDRGP4 cgDC+232+20560
ASGNP4
line 47
;47:	} else if (scale > cg_bigFont.value) {
ADDRGP4 $97
JUMPV
LABELV $96
ADDRFP4 4
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $101
line 48
;48:		font = &cgDC.Assets.bigFont;
ADDRLP4 12
ADDRGP4 cgDC+232+41108
ASGNP4
line 49
;49:	}
LABELV $101
LABELV $97
line 50
;50:	useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 51
;51:  out = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 52
;52:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $106
line 53
;53:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 54
;54:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $108
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $108
line 55
;55:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 56
;56:		}
LABELV $108
line 57
;57:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $110
line 58
;58:		while (s && *s && count < len) {
line 59
;59:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
ADDRLP4 40
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
NEI4 $113
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $113
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $113
line 60
;60:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 61
;61:				continue;
ADDRGP4 $111
JUMPV
LABELV $113
line 62
;62:			} else {
line 63
;63:				glyph = &font->glyphs[*s];
ADDRLP4 16
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ASGNP4
line 64
;64:				out += glyph->xSkip;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 65
;65:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 66
;66:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 67
;67:			}
line 68
;68:    }
LABELV $111
line 58
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $116
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $116
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $110
LABELV $116
line 69
;69:  }
LABELV $106
line 70
;70:  return out * useScale;
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $93
endproc CG_Text_Width 48 4
export CG_Text_Height
proc CG_Text_Height 48 4
line 73
;71:}
;72:
;73:int CG_Text_Height(const char *text, float scale, int limit) {
line 78
;74:  int len, count;
;75:	float max;
;76:	glyphInfo_t *glyph;
;77:	float useScale;
;78:	const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 79
;79:	fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 20
ADDRGP4 cgDC+232+12
ASGNP4
line 80
;80:	if (scale <= cg_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $120
line 81
;81:		font = &cgDC.Assets.smallFont;
ADDRLP4 20
ADDRGP4 cgDC+232+20560
ASGNP4
line 82
;82:	} else if (scale > cg_bigFont.value) {
ADDRGP4 $121
JUMPV
LABELV $120
ADDRFP4 4
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $125
line 83
;83:		font = &cgDC.Assets.bigFont;
ADDRLP4 20
ADDRGP4 cgDC+232+41108
ASGNP4
line 84
;84:	}
LABELV $125
LABELV $121
line 85
;85:	useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 86
;86:  max = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 87
;87:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
line 88
;88:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 89
;89:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $132
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $132
line 90
;90:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 91
;91:		}
LABELV $132
line 92
;92:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $134
line 93
;93:		while (s && *s && count < len) {
line 94
;94:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
ADDRLP4 40
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
NEI4 $137
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $137
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $137
line 95
;95:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 96
;96:				continue;
ADDRGP4 $135
JUMPV
LABELV $137
line 97
;97:			} else {
line 98
;98:				glyph = &font->glyphs[*s];
ADDRLP4 12
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
line 99
;99:	      if (max < glyph->height) {
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
GEF4 $139
line 100
;100:		      max = glyph->height;
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 101
;101:			  }
LABELV $139
line 102
;102:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 103
;103:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 104
;104:			}
line 105
;105:    }
LABELV $135
line 93
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $142
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $142
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $134
LABELV $142
line 106
;106:  }
LABELV $130
line 107
;107:  return max * useScale;
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $117
endproc CG_Text_Height 48 4
export CG_Text_PaintChar
proc CG_Text_PaintChar 8 36
line 110
;108:}
;109:
;110:void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
line 112
;111:  float w, h;
;112:  w = width * scale;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 113
;113:  h = height * scale;
ADDRLP4 4
ADDRFP4 12
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 114
;114:  CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 115
;115:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRF4
ARGF4
ADDRFP4 32
INDIRF4
ARGF4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 116
;116:}
LABELV $143
endproc CG_Text_PaintChar 8 36
export CG_Text_Paint
proc CG_Text_Paint 116 40
line 119
;117:
;118:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) 
;119:{
line 124
;120:	int len, count;
;121:	vec4_t newColor;
;122:	glyphInfo_t *glyph;
;123:	float useScale;
;124:	fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 28
ADDRGP4 cgDC+232+12
ASGNP4
line 126
;125:
;126:	if (scale <= cg_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $147
line 127
;127:		font = &cgDC.Assets.smallFont;
ADDRLP4 28
ADDRGP4 cgDC+232+20560
ASGNP4
line 128
;128:	} else if (scale > cg_bigFont.value) {
ADDRGP4 $148
JUMPV
LABELV $147
ADDRFP4 8
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $152
line 129
;129:		font = &cgDC.Assets.bigFont;
ADDRLP4 28
ADDRGP4 cgDC+232+41108
ASGNP4
line 130
;130:	}
LABELV $152
LABELV $148
line 131
;131:	useScale = scale * font->glyphScale;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 133
;132:
;133:	if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $157
line 134
;134:		const char *s = text;
ADDRLP4 36
ADDRFP4 16
INDIRP4
ASGNP4
line 135
;135:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 136
;136:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 138
;137:
;138:		len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 140
;139:
;140:		if (limit > 0 && len > limit) {
ADDRLP4 44
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LEI4 $159
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $159
line 141
;141:			len = limit;
ADDRLP4 32
ADDRFP4 24
INDIRI4
ASGNI4
line 142
;142:		}
LABELV $159
line 143
;143:		count = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $162
JUMPV
LABELV $161
line 146
;144:
;145:		while (s && *s && count < len) 
;146:		{
line 147
;147:			glyph = &font->glyphs[*s];
ADDRLP4 0
CNSTI4 80
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ASGNP4
line 150
;148:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;149:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;150:			if ( Q_IsColorString( s ) ) 
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $164
ADDRLP4 52
CNSTI4 94
ASGNI4
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
NEI4 $164
ADDRLP4 56
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $164
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $164
line 151
;151:			{
line 152
;152:				memcpy( newColor, g_color_table[ ColorIndex( *(s+1) ) ], sizeof( newColor ) );
ADDRLP4 8
ARGP4
ADDRLP4 36
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
line 153
;153:				newColor[3] = color[3];
ADDRLP4 8+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 154
;154:				trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 155
;155:				s += 2;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 156
;156:				continue;
ADDRGP4 $162
JUMPV
LABELV $164
line 159
;157:			} 
;158:			else 
;159:			{
line 160
;160:				float yadj = useScale * glyph->top;
ADDRLP4 60
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 162
;161:
;162:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE || style == ITEM_TEXTSTYLE_OUTLINESHADOWED) 
ADDRLP4 64
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 3
EQI4 $170
ADDRLP4 64
INDIRI4
CNSTI4 6
EQI4 $170
ADDRLP4 64
INDIRI4
CNSTI4 5
NEI4 $167
LABELV $170
line 163
;163:				{
line 164
;164:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $172
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $173
JUMPV
LABELV $172
ADDRLP4 72
CNSTI4 2
ASGNI4
LABELV $173
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 166
;165:
;166:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 8+12
INDIRF4
ASGNF4
line 167
;167:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 169
;168:
;169:					CG_Text_PaintChar(x + ofs, y - yadj + ofs, 
ADDRLP4 76
ADDRLP4 68
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 178
;170:														glyph->imageWidth,
;171:														glyph->imageHeight,
;172:														useScale, 
;173:														glyph->s,
;174:														glyph->t,
;175:														glyph->s2,
;176:														glyph->t2,
;177:														glyph->glyph);
;178:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 179
;179:					trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 180
;180:				}
LABELV $167
line 182
;181:				
;182:				if (style == ITEM_TEXTSTYLE_OUTLINED || style == ITEM_TEXTSTYLE_OUTLINESHADOWED ) 
ADDRLP4 68
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 4
EQI4 $179
ADDRLP4 68
INDIRI4
CNSTI4 5
NEI4 $177
LABELV $179
line 183
;183:				{ 
line 185
;184:					
;185:					int ofs = 1;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 186
;186:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 8+12
INDIRF4
ASGNF4
line 187
;187:					if ( colorBlack[3] <= 0.0f)
ADDRGP4 colorBlack+12
INDIRF4
CNSTF4 0
GTF4 $182
line 188
;188:						colorBlack[3] = 0.0f;
ADDRGP4 colorBlack+12
CNSTF4 0
ASGNF4
LABELV $182
line 190
;189:
;190:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 194
;191:
;192:
;193:				
;194:					CG_Text_PaintChar(x + ofs, y - yadj + ofs, 
ADDRLP4 76
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 205
;195:														glyph->imageWidth,
;196:														glyph->imageHeight,
;197:														useScale, 
;198:														glyph->s,
;199:														glyph->t,
;200:														glyph->s2,
;201:														glyph->t2,
;202:														glyph->glyph); 
;203:
;204:					
;205:					CG_Text_PaintChar(x - ofs, y - yadj + ofs, 
ADDRLP4 84
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 214
;206:														glyph->imageWidth,
;207:														glyph->imageHeight,
;208:														useScale, 
;209:														glyph->s,
;210:														glyph->t,
;211:														glyph->s2,
;212:														glyph->t2,
;213:														glyph->glyph); 
;214:					CG_Text_PaintChar(x + ofs, y - yadj - ofs, 
ADDRLP4 92
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 92
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 223
;215:														glyph->imageWidth,
;216:														glyph->imageHeight,
;217:														useScale, 
;218:														glyph->s,
;219:														glyph->t,
;220:														glyph->s2,
;221:														glyph->t2,
;222:														glyph->glyph); 
;223:					CG_Text_PaintChar(x - ofs, y - yadj - ofs, 
ADDRLP4 100
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 100
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 100
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 232
;224:														glyph->imageWidth,
;225:														glyph->imageHeight,
;226:														useScale, 
;227:														glyph->s,
;228:														glyph->t,
;229:														glyph->s2,
;230:														glyph->t2,
;231:														glyph->glyph); 
;232:					CG_Text_PaintChar(x - ofs, y - yadj, 
ADDRFP4 0
INDIRF4
ADDRLP4 72
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 241
;233:														glyph->imageWidth,
;234:														glyph->imageHeight,
;235:														useScale, 
;236:														glyph->s,
;237:														glyph->t,
;238:														glyph->s2,
;239:														glyph->t2,
;240:														glyph->glyph); 
;241:					CG_Text_PaintChar(x + ofs, y - yadj, 
ADDRFP4 0
INDIRF4
ADDRLP4 72
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 251
;242:														glyph->imageWidth,
;243:														glyph->imageHeight,
;244:														useScale, 
;245:														glyph->s,
;246:														glyph->t,
;247:														glyph->s2,
;248:														glyph->t2,
;249:														glyph->glyph); 
;250:
;251:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 252
;252:					trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 253
;253:				}
LABELV $177
line 255
;254:				
;255:				CG_Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 265
;256:													glyph->imageWidth,
;257:													glyph->imageHeight,
;258:													useScale, 
;259:													glyph->s,
;260:													glyph->t,
;261:													glyph->s2,
;262:													glyph->t2,
;263:													glyph->glyph);
;264:				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
;265:				x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 20
INDIRF4
ADDF4
ADDF4
ASGNF4
line 266
;266:				s++;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 267
;267:				count++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 268
;268:			}
line 269
;269:    }
LABELV $162
line 145
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $188
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $188
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $161
LABELV $188
line 270
;270:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 271
;271:  }
LABELV $157
line 272
;272:}
LABELV $144
endproc CG_Text_Paint 116 40
export CG_Text_PaintChar2
proc CG_Text_PaintChar2 8 36
line 277
;273:
;274://
;275:// special NS:CO version
;276:
;277:void CG_Text_PaintChar2(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
line 278
;278:	float w = width, h = height;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 4
ADDRFP4 12
INDIRF4
ASGNF4
line 293
;279://	w = width * scale;
;280://	h = height * scale;
;281://  CG_AdjustFrom640( &x, &y, &w, &h );
;282:
;283:	/*
;284:
;285:	if ( cgs.glconfig.vidWidth < 1024 )
;286:	{
;287:		x = x * ( (float)cgs.glconfig.vidWidth/1024.0f );
;288:		y = y * ( (float)cgs.glconfig.vidHeight/768.0f );
;289:		width = width * ( (float)cgs.glconfig.vidWidth/1024.0f );
;290:		height = height * ( (float)cgs.glconfig.vidHeight/768.0f ); 
;291:	}*/
;292: //	if ( cgs.glconfig.vidWidth < 1024 )
;293:	{
line 294
;294:		x = x * ( (float)cgs.glconfig.vidWidth/1024.0f );
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1149239296
DIVF4
MULF4
ASGNF4
line 295
;295:		y = y * ( (float)cgs.glconfig.vidHeight/768.0f );
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1145044992
DIVF4
MULF4
ASGNF4
line 296
;296:		w = width * ( (float)cgs.glconfig.vidWidth/1024.0f );
ADDRLP4 0
ADDRFP4 8
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1149239296
DIVF4
MULF4
ASGNF4
line 297
;297:		h = height * ( (float)cgs.glconfig.vidHeight/768.0f ); 
ADDRLP4 4
ADDRFP4 12
INDIRF4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1145044992
DIVF4
MULF4
ASGNF4
line 298
;298:	}
line 299
;299:	w *= scale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 300
;300:	h *= scale;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 302
;301:
;302:	trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRF4
ARGF4
ADDRFP4 32
INDIRF4
ARGF4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 303
;303:}
LABELV $189
endproc CG_Text_PaintChar2 8 36
export CG_Text_Paint2
proc CG_Text_Paint2 116 40
line 306
;304:
;305:void CG_Text_Paint2(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) 
;306:{
line 311
;307:	int len, count;
;308:	vec4_t newColor;
;309:	glyphInfo_t *glyph;
;310:	float useScale;
;311:	fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 28
ADDRGP4 cgDC+232+12
ASGNP4
line 313
;312:
;313:	if (scale <= cg_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $201
line 314
;314:		font = &cgDC.Assets.smallFont;
ADDRLP4 28
ADDRGP4 cgDC+232+20560
ASGNP4
line 315
;315:	} else if (scale > cg_bigFont.value) {
ADDRGP4 $202
JUMPV
LABELV $201
ADDRFP4 8
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $206
line 316
;316:		font = &cgDC.Assets.bigFont;
ADDRLP4 28
ADDRGP4 cgDC+232+41108
ASGNP4
line 317
;317:	}
LABELV $206
LABELV $202
line 318
;318:	useScale = scale * font->glyphScale;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 320
;319:
;320:	if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
line 321
;321:		const char *s = text;
ADDRLP4 36
ADDRFP4 16
INDIRP4
ASGNP4
line 322
;322:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 323
;323:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 325
;324:
;325:		len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 327
;326:
;327:		if (limit > 0 && len > limit) {
ADDRLP4 44
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LEI4 $213
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $213
line 328
;328:			len = limit;
ADDRLP4 32
ADDRFP4 24
INDIRI4
ASGNI4
line 329
;329:		}
LABELV $213
line 330
;330:		count = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $215
line 333
;331:
;332:		while (s && *s && count < len) 
;333:		{
line 334
;334:			glyph = &font->glyphs[*s];
ADDRLP4 0
CNSTI4 80
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ASGNP4
line 337
;335:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;336:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;337:			if ( Q_IsColorString( s ) ) 
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
ADDRLP4 52
CNSTI4 94
ASGNI4
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
NEI4 $218
ADDRLP4 56
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $218
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $218
line 338
;338:			{
line 339
;339:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 8
ARGP4
ADDRLP4 36
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
line 340
;340:				newColor[3] = color[3];
ADDRLP4 8+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 341
;341:				trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 342
;342:				s += 2;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 343
;343:				continue;
ADDRGP4 $216
JUMPV
LABELV $218
line 346
;344:			} 
;345:			else 
;346:			{
line 347
;347:				float yadj = useScale * glyph->top;
ADDRLP4 60
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 349
;348:
;349:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE || style == ITEM_TEXTSTYLE_OUTLINESHADOWED) 
ADDRLP4 64
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 3
EQI4 $224
ADDRLP4 64
INDIRI4
CNSTI4 6
EQI4 $224
ADDRLP4 64
INDIRI4
CNSTI4 5
NEI4 $221
LABELV $224
line 350
;350:				{
line 351
;351:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $226
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $226
ADDRLP4 72
CNSTI4 2
ASGNI4
LABELV $227
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 353
;352:
;353:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 8+12
INDIRF4
ASGNF4
line 354
;354:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 356
;355:
;356:					CG_Text_PaintChar2(x + ofs, y - yadj + ofs, 
ADDRLP4 76
ADDRLP4 68
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar2
CALLV
pop
line 365
;357:														glyph->imageWidth,
;358:														glyph->imageHeight,
;359:														useScale, 
;360:														glyph->s,
;361:														glyph->t,
;362:														glyph->s2,
;363:														glyph->t2,
;364:														glyph->glyph);
;365:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 366
;366:					trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 367
;367:				}
LABELV $221
line 369
;368:				
;369:				if (style == ITEM_TEXTSTYLE_OUTLINED || style == ITEM_TEXTSTYLE_OUTLINESHADOWED ) 
ADDRLP4 68
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 4
EQI4 $233
ADDRLP4 68
INDIRI4
CNSTI4 5
NEI4 $231
LABELV $233
line 370
;370:				{ 
line 372
;371:					
;372:					int ofs = 1;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 373
;373:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 8+12
INDIRF4
ASGNF4
line 374
;374:					if ( colorBlack[3] <= 0.0f)
ADDRGP4 colorBlack+12
INDIRF4
CNSTF4 0
GTF4 $236
line 375
;375:						colorBlack[3] = 0.0f;
ADDRGP4 colorBlack+12
CNSTF4 0
ASGNF4
LABELV $236
line 377
;376:
;377:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 381
;378:
;379:
;380:				
;381:					CG_Text_PaintChar2(x + ofs, y - yadj + ofs, 
ADDRLP4 76
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar2
CALLV
pop
line 392
;382:														glyph->imageWidth,
;383:														glyph->imageHeight,
;384:														useScale, 
;385:														glyph->s,
;386:														glyph->t,
;387:														glyph->s2,
;388:														glyph->t2,
;389:														glyph->glyph); 
;390:
;391:					
;392:					CG_Text_PaintChar2(x - ofs, y - yadj + ofs, 
ADDRLP4 84
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar2
CALLV
pop
line 401
;393:														glyph->imageWidth,
;394:														glyph->imageHeight,
;395:														useScale, 
;396:														glyph->s,
;397:														glyph->t,
;398:														glyph->s2,
;399:														glyph->t2,
;400:														glyph->glyph); 
;401:					CG_Text_PaintChar2(x + ofs, y - yadj - ofs, 
ADDRLP4 92
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 92
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar2
CALLV
pop
line 410
;402:														glyph->imageWidth,
;403:														glyph->imageHeight,
;404:														useScale, 
;405:														glyph->s,
;406:														glyph->t,
;407:														glyph->s2,
;408:														glyph->t2,
;409:														glyph->glyph); 
;410:					CG_Text_PaintChar2(x - ofs, y - yadj - ofs, 
ADDRLP4 100
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 100
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 100
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar2
CALLV
pop
line 419
;411:														glyph->imageWidth,
;412:														glyph->imageHeight,
;413:														useScale, 
;414:														glyph->s,
;415:														glyph->t,
;416:														glyph->s2,
;417:														glyph->t2,
;418:														glyph->glyph); 
;419:					CG_Text_PaintChar2(x - ofs, y - yadj, 
ADDRFP4 0
INDIRF4
ADDRLP4 72
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar2
CALLV
pop
line 428
;420:														glyph->imageWidth,
;421:														glyph->imageHeight,
;422:														useScale, 
;423:														glyph->s,
;424:														glyph->t,
;425:														glyph->s2,
;426:														glyph->t2,
;427:														glyph->glyph); 
;428:					CG_Text_PaintChar2(x + ofs, y - yadj, 
ADDRFP4 0
INDIRF4
ADDRLP4 72
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar2
CALLV
pop
line 438
;429:														glyph->imageWidth,
;430:														glyph->imageHeight,
;431:														useScale, 
;432:														glyph->s,
;433:														glyph->t,
;434:														glyph->s2,
;435:														glyph->t2,
;436:														glyph->glyph); 
;437:
;438:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 439
;439:					trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 440
;440:				}
LABELV $231
line 442
;441:				
;442:				CG_Text_PaintChar2(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar2
CALLV
pop
line 452
;443:													glyph->imageWidth,
;444:													glyph->imageHeight,
;445:													useScale, 
;446:													glyph->s,
;447:													glyph->t,
;448:													glyph->s2,
;449:													glyph->t2,
;450:													glyph->glyph);
;451:				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
;452:				x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 20
INDIRF4
ADDF4
ADDF4
ASGNF4
line 453
;453:				s++;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 454
;454:				count++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 455
;455:			}
line 456
;456:    }
LABELV $216
line 332
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $242
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $242
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $215
LABELV $242
line 457
;457:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 458
;458:  }
LABELV $211
line 459
;459:} 
LABELV $198
endproc CG_Text_Paint2 116 40
export CG_Draw3DModel
proc CG_Draw3DModel 512 16
line 615
;460:
;461:#endif
;462:
;463:#if 0
;464:/*
;465:==============
;466:CG_DrawDigits
;467:
;468:Draws Digits for Hud
;469:==============
;470:*/
;471:static void CG_DrawDigits (int x, int y, int width, int value) {
;472:	char	num[16], *ptr;
;473:	int		l;
;474:	int		frame;
;475:
;476:	if ( width < 1 ) {
;477:		return;
;478:	}
;479:
;480:	// draw number string
;481:	if ( width > 5 ) {
;482:		width = 5;
;483:	}
;484:
;485:	switch ( width ) {
;486:	case 1:
;487:		value = value > 9 ? 9 : value;
;488:		value = value < 0 ? 0 : value;
;489:		Com_sprintf (num, sizeof(num), "%i", value);
;490:		break;
;491:	case 2:
;492:		value = value > 99 ? 99 : value;
;493:		value = value < -9 ? -9 : value;
;494:		
;495:		if ( value < 10 )
;496:			Com_sprintf (num, sizeof(num), "0%i", value);
;497:		else
;498:			Com_sprintf (num, sizeof(num), "%i", value);
;499:		break;
;500:	case 3:
;501:		value = value > 999 ? 999 : value;
;502:		value = value < -99 ? -99 : value;
;503:		if ( value < 10 )
;504:			Com_sprintf (num, sizeof(num), "00%i", value);
;505:		else if ( value < 100 )
;506:			Com_sprintf (num, sizeof(num), "0%i", value);
;507:		else
;508:			Com_sprintf (num, sizeof(num), "%i", value);
;509:		break;
;510:	case 4:
;511:		value = value > 9999 ? 9999 : value;
;512:		value = value < -999 ? -999 : value;
;513:		if ( value < 10 )
;514:			Com_sprintf (num, sizeof(num), "000%i", value);
;515:		else if ( value < 100 )
;516:			Com_sprintf (num, sizeof(num), "00%i", value);
;517:		else if ( value < 1000 )
;518:			Com_sprintf (num, sizeof(num), "0%i", value);
;519:		else
;520:			Com_sprintf (num, sizeof(num), "%i", value);
;521:		break;
;522:	}
;523:
;524:	l = strlen(num);
;525:	if (l > width)
;526:		l = width;
;527:	x += 2 + 24*(width - l);
;528:
;529:	ptr = num;
;530:	while (*ptr && l)
;531:	{
;532:		if (*ptr == '-')
;533:			frame = STAT_MINUS;
;534:		else
;535:			frame = *ptr -'0';
;536:
;537:		CG_DrawPic( x,y, 24, 32, cgs.media.digitalNumberShaders[frame] );
;538:		x += 24;
;539:		ptr++;
;540:		l--;
;541:	}
;542:}
;543:
;544:#endif
;545:
;546:/*
;547:==============
;548:CG_DrawField
;549:
;550:Draws large numbers for status bar and powerups
;551:==============
;552:*/
;553:#ifndef MISSIONPACK
;554:static void CG_DrawField (int x, int y, int width, int value) {
;555:	char	num[16], *ptr;
;556:	int		l;
;557:	int		frame;
;558:
;559:	if ( width < 1 ) {
;560:		return;
;561:	}
;562:
;563:	// draw number string
;564:	if ( width > 5 ) {
;565:		width = 5;
;566:	}
;567:
;568:	switch ( width ) {
;569:	case 1:
;570:		value = value > 9 ? 9 : value;
;571:		value = value < 0 ? 0 : value;
;572:		break;
;573:	case 2:
;574:		value = value > 99 ? 99 : value;
;575:		value = value < -9 ? -9 : value;
;576:		break;
;577:	case 3:
;578:		value = value > 999 ? 999 : value;
;579:		value = value < -99 ? -99 : value;
;580:		break;
;581:	case 4:
;582:		value = value > 9999 ? 9999 : value;
;583:		value = value < -999 ? -999 : value;
;584:		break;
;585:	}
;586:
;587:	Com_sprintf (num, sizeof(num), "%i", value);
;588:	l = strlen(num);
;589:	if (l > width)
;590:		l = width;
;591:	x += 2 + CHAR_WIDTH*(width - l);
;592:
;593:	ptr = num;
;594:	while (*ptr && l)
;595:	{
;596:		if (*ptr == '-')
;597:			frame = STAT_MINUS;
;598:		else
;599:			frame = *ptr -'0';
;600:
;601:		CG_DrawPic( x,y, CHAR_WIDTH, CHAR_HEIGHT, cgs.media.numberShaders[frame] );
;602:		x += CHAR_WIDTH;
;603:		ptr++;
;604:		l--;
;605:	}
;606:}
;607:#endif
;608:
;609:/*
;610:================
;611:CG_Draw3DModel
;612:
;613:================
;614:*/
;615:void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 619
;616:	refdef_t		refdef;
;617:	refEntity_t		ent;
;618:
;619:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRLP4 508
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 508
INDIRI4
EQI4 $248
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 508
INDIRI4
NEI4 $244
LABELV $248
line 620
;620:		return;
ADDRGP4 $243
JUMPV
LABELV $244
line 623
;621:	}
;622:
;623:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 625
;624:
;625:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 627
;626:
;627:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 629
;628: 
;629:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 630
;630:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 631
;631:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 632
;632:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 633
;633:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 635
;634:	
;635:	ent.nonNormalizedAxes = qtrue;
ADDRLP4 368+64
CNSTI4 1
ASGNI4
line 637
;636:
;637:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 639
;638:
;639:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 641
;640:
;641:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 642
;642:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 644
;643:
;644:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 645
;645:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 646
;646:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 647
;647:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 649
;648:
;649:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 651
;650:
;651:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 652
;652:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 653
;653:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 654
;654:}
LABELV $243
endproc CG_Draw3DModel 512 16
export CG_DrawHead
proc CG_DrawHead 56 32
line 663
;655:
;656:/*
;657:================
;658:CG_DrawHead
;659:
;660:Used for both the status bar and the scoreboard
;661:================
;662:*/
;663:void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) {
line 670
;664:	clipHandle_t	cm;
;665:	clientInfo_t	*ci;
;666:	float			len;
;667:	vec3_t			origin;
;668:	vec3_t			mins, maxs;
;669:
;670:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 2484
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cgs+38664
ADDP4
ASGNP4
line 672
;671:
;672:	if ( cg_draw3dIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $266
line 673
;673:		cm = ci->headModel;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ASGNI4
line 674
;674:		if ( !cm ) {
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $269
line 675
;675:			return;
ADDRGP4 $264
JUMPV
LABELV $269
line 679
;676:		}
;677:
;678:		// offset the origin y and z to center the head
;679:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 681
;680:
;681:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 4+8
CNSTF4 3204448256
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 682
;682:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 4+4
CNSTF4 1056964608
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 686
;683:
;684:		// calculate distance so the head nearly fills the box
;685:		// assume heads are taller than wide
;686:		len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 44
CNSTF4 1060320051
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 687
;687:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 44
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 690
;688:
;689:		// allow per-model tweaking
;690:		VectorAdd( origin, ci->headOffset, origin );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDF4
ASGNF4
line 692
;691:
;692:		CG_Draw3DModel( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles );
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
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 693
;693:	}/* else if ( cg_drawIcons.integer ) {
LABELV $266
line 698
;694:		CG_DrawPic( x, y, w, h, ci->modelIcon );
;695:	}*/
;696:
;697:	// if they are deferred, draw a cross out
;698:	if ( ci->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $283
line 699
;699:		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
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
ADDRGP4 cgs+205084+24
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 700
;700:	}
LABELV $283
line 701
;701:}
LABELV $264
endproc CG_DrawHead 56 32
export CG_DrawTeamBackground
proc CG_DrawTeamBackground 16 20
line 710
;702: 
;703:/*
;704:================
;705:CG_DrawTeamBackground
;706:
;707:================
;708:*/
;709:void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
;710:{
line 713
;711:	vec4_t		hcolor;
;712:
;713:	hcolor[3] = alpha;
ADDRLP4 0+12
ADDRFP4 16
INDIRF4
ASGNF4
line 714
;714:	if ( team == TEAM_RED ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
NEI4 $289
line 715
;715:		hcolor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 716
;716:		hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 717
;717:		hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 718
;718:	} else if ( team == TEAM_BLUE ) {
ADDRGP4 $290
JUMPV
LABELV $289
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $293
line 719
;719:		hcolor[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 720
;720:		hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 721
;721:		hcolor[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 722
;722:	} else {
ADDRGP4 $294
JUMPV
LABELV $293
line 723
;723:		hcolor[0] = 0.2f;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 724
;724:		hcolor[1] = 0.8f;
ADDRLP4 0+4
CNSTF4 1061997773
ASGNF4
line 725
;725:		hcolor[2] = 0.2f; 
ADDRLP4 0+8
CNSTF4 1045220557
ASGNF4
line 726
;726:	}
LABELV $294
LABELV $290
line 727
;727:	trap_R_SetColor( hcolor );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 728
;728:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
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
ADDRGP4 cgs+205084+20
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 729
;729:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 730
;730:}
LABELV $287
endproc CG_DrawTeamBackground 16 20
proc CG_DrawLocation 0 0
line 1245
;731:
;732:#if 0
;733:/*
;734:================
;735:CG_DrawStatusBar
;736:
;737:================
;738:*/
;739:static void CG_DrawStatusBar( void ) {
;740:	centity_t		*cent;
;741:	playerState_t	*ps;
;742:	int				value;
;743:	vec3_t			angles;
;744:	int				x,y;
;745:	int				weapon;
;746:
;747://	vec4_t		hudGrey = {0.5f, 0.5f, 0.5f, 1.00f};
;748:	vec4_t		hudGreen = {0,0.5f,0,1.00f};
;749:	vec4_t		hudRed = {0.5f,0,0,1.00f};
;750:	vec4_t		hudBlue = {0,0,0.75f,1.00f};	
;751:	vec4_t		hudBlack = {0.125f,0.125f,0.125f,1.00f};	
;752:	vec4_t		hudWhite = {1.0f,1.0f,1.0f,1.00f};
;753:	
;754:
;755:	if ( cg_drawStatus.integer == 0 ) {
;756:		return;
;757:	} 
;758:
;759:	cent = &cg_entities[cg.snap->ps.clientNum];
;760:	ps = &cg.snap->ps;
;761:	weapon = ps->weapon;
;762:
;763:	VectorClear( angles );
;764:   
;765:	if (test_x.integer > 0 || test_y.integer > 0  || test_h.integer > 0  || test_w.integer > 0  )
;766:	{
;767:		CG_DrawPic( test_x.integer ,test_y.integer , test_h.integer, test_w.integer, cgs.media.whiteShader );
;768:	} 
;769:
;770: 	x = 480;
;771:	y = 450;
;772:
;773:	//
;774:	// stamina power
;775:	// 
;776:	{
;777:		vec4_t hcolor;
;778:		float	stamina;
;779:		float	stamina_cur = ps->stats[STAT_STAMINA];
;780:
;781:		// background layer for healthlocator + stamina 
;782:		CG_DrawTeamBackground( 0, 382 , 88, 100, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );
;783:
;784:		stamina = (  (  stamina_cur / 300 ) * ( 16 * 6 )  ) - 5;
;785:		CG_FillRect( 4 * 16 , 480-96, 16, 96, hudBlack );
;786:
;787:		CG_GetColorForHealth ( ps->stats[STAT_STAMINA] / 3, 0, hcolor );
;788:		CG_FillRect( 4 * 16 + 4 , 478-stamina, 8, stamina, hcolor);
;789:
;790:		CG_FillRect( 64 , 478, 16, 2, hudBlack );  
;791:	}
;792: 
;793:	//
;794:	// clips
;795:	//
;796:	if ( weapon > WP_SEALKNIFE) {
;797:		gitem_t *item;
;798:		int		clipGfx = 0;
;799:
;800:		// background layer for clips + ammo
;801:		CG_DrawTeamBackground( 88, 447, 640, 40, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );
;802:
;803:		if ( BG_IsShotgun( weapon ) )
;804:			clipGfx = 1;
;805:		else if ( weapon == WP_GRENADE )
;806:			clipGfx = 2;
;807:		else if ( weapon == WP_FLASHBANG )
;808:			clipGfx = 3;
;809:		else if ( weapon == WP_SMOKE )
;810:			clipGfx = 3;
;811:		else if (ps->stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) && ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ))
;812:			clipGfx = 4;
;813:
;814:		item = BG_FindItemForWeapon( weapon );
;815:
;816:		if (ps->stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) && ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ))
;817:			value = ps->ammo[ AM_40MMGRENADES ]; // dX
;818:		else
;819:			value = ps->ammo[ item->giAmmoTag ]; // dX
;820:
;821:
;822:		// draw the bullet pic
;823:		if ( (cg.time >> 8) & 1 && value <= 1)
;824:			trap_R_SetColor(hudRed);
;825:		else
;826:			trap_R_SetColor(hudWhite);
;827:		CG_DrawPic( 640 - 32, 480 - 32 , 32, 32, cgs.media.clipIcon[clipGfx] );
;828:		trap_R_SetColor( NULL ); 
;829:
;830:		if ( value > -1 ) {	 		
;831:
;832:			if ( value <= 1 && ( (cg.time >> 8) & 1 && value <= 1)) 
;833:				trap_R_SetColor(hudRed);  
;834:			else
;835:				trap_R_SetColor(hudWhite);
;836:
;837:			CG_DrawDigits ( 640 - ( 5 * 16 ) , 480 - 32 , 2, value);
;838:			trap_R_SetColor( NULL ); 
;839:		}  
;840:	}
;841:
;842:	//
;843:	// rounds
;844:	//
;845:	if ( cent->currentState.weapon > WP_FLASHBANG &&
;846:		!( (cent->currentState.weapon == WP_M4 || cent->currentState.weapon == WP_AK47) && (ps->stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) ) && ( ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ) ) ) &&
;847:		!( (cent->currentState.weapon == WP_M4 || cent->currentState.weapon == WP_AK47) && (ps->stats[STAT_WEAPONMODE] & ( 1 << WM_BAYONET ) ) && ( ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ) ) ) ) 
;848:	{
;849:		
;850:		int i,x1 ;
;851:		int times = 0;
;852:
;853:		value = ps->stats[STAT_ROUNDS]; // dX 
;854:
;855:		if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
;856:			&& cg.predictedPlayerState.weaponTime > 50 )
;857:			trap_R_SetColor( hudBlue );
;858:		else if ( cg.predictedPlayerState.weaponstate == WEAPON_RELOADING
;859:			&& cg.predictedPlayerState.weaponTime > 100 )
;860:			trap_R_SetColor( hudGreen );
;861:		else {
;862:			if (value <= 5)
;863:				trap_R_SetColor( hudRed );
;864:			else
;865:				trap_R_SetColor( hudWhite );
;866:		} 
;867:
;868:		while (value > 15) 
;869:		{ 
;870:			times++;
;871:			value -= 15; 
;872:		}
;873:
;874:		x1 = 640 - 16 * 16;  
;875:
;876:		for (i=0;i<15;i++)
;877:		{ 
;878:			if ( i < value ) {
;879:				if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
;880:					&& cg.predictedPlayerState.weaponTime > 50 )
;881:					trap_R_SetColor( hudBlue ); 
;882:			}
;883:			else
;884:				trap_R_SetColor( hudBlack );
;885:
;886:			if ( BG_IsRifle( ps->weapon ) )
;887:				CG_DrawPic( x1, 480 - 32 , 16, 32, cgs.media.ammoMag_bullet[1] );
;888:			else if ( BG_IsShotgun( ps->weapon ) )
;889:				CG_DrawPic( x1, 480 - 32 , 16, 32, cgs.media.ammoMag_bullet[2] );
;890:			else
;891:				CG_DrawPic( x1, 480 - 32 , 16, 32, cgs.media.ammoMag_bullet[0] );
;892:
;893:			x1 -= 16;
;894:
;895:			if ( i==14)
;896:				break;
;897:		}
;898:
;899:		trap_R_SetColor(hudWhite);
;900:		CG_DrawPic(  640 - 15 * 16, 480 - 32, 16, 32, cgs.media.slashIcon ); 
;901:		CG_DrawDigits (640 - 14 * 16 , 480-32 , 2, times); 
;902: 
;903:		trap_R_SetColor( NULL ); 
;904:
;905:
;906:	} 
;907:	//
;908:	// health locator
;909:	//
;910:	{
;911:		vec4_t		hcolor;
;912:
;913:	
;914:		CG_GetColorForHealth( /* 1 0 0 - */ ps->stats[STAT_HEALTH] - ps->stats[STAT_CHEST_DAMAGE] , 0, hcolor ); 
;915:		trap_R_SetColor( hcolor ); 
;916:			CG_DrawPic (0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_chestIcon);			
;917:		trap_R_SetColor( NULL );
;918:
;919:		CG_GetColorForHealth( /* 1 0 0 - */ ps->stats[STAT_HEALTH]  - ps->stats[STAT_STOMACH_DAMAGE] ,0, hcolor );
;920:		trap_R_SetColor( hcolor ); 
;921:			CG_DrawPic (0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_stomachIcon);	 
;922:		trap_R_SetColor( NULL );
;923:
;924:		CG_GetColorForHealth( /* 1 0 0 - */ ps->stats[STAT_HEALTH]  - ps->stats[STAT_ARM_DAMAGE] ,0, hcolor ); 
;925:		trap_R_SetColor( hcolor ); 
;926:			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_leftArmIcon);
;927:			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_rightArmIcon);
;928:		trap_R_SetColor( NULL );
;929:
;930:		CG_GetColorForHealth( /* 100 - */ ps->stats[STAT_HEALTH]  - ps->stats[STAT_LEG_DAMAGE] ,0, hcolor ); 
;931:		trap_R_SetColor( hcolor ); 
;932:			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_leftLegIcon);
;933:			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_rightLegIcon);
;934:		trap_R_SetColor( NULL );
;935:
;936:		CG_GetColorForHealth( /* 100 - */ ps->stats[STAT_HEALTH]  - ps->stats[STAT_HEAD_DAMAGE] ,0, hcolor );
;937:		trap_R_SetColor( hcolor ); 
;938:			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_headIcon);
;939:		trap_R_SetColor( NULL );
;940:
;941:		trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLACK)] );
;942:			CG_DrawPic ( 0, 480 - 6 * 16, 16*3, 6 * 16,cgs.media.loc_bodyLines);		
;943:		trap_R_SetColor( NULL );
;944:	}
;945:
;946:	//
;947:	// Weaponmode Display
;948:	//
;949:	{
;950:		char *mode = ""; 
;951:		int	weaponmode = ps->stats[STAT_WEAPONMODE];
;952:
;953:		if ( (weapon == WP_M4 || weapon == WP_AK47) && (weaponmode & ( 1 << WM_GRENADELAUNCHER ) ) && ( weaponmode & ( 1 << WM_WEAPONMODE2 ) ) )
;954:		{
;955:			mode = "GrenadeLauncher";
;956:		}
;957:		else if ( (weapon == WP_M4 || weapon == WP_AK47) && (weaponmode & ( 1 << WM_BAYONET ) ) && ( weaponmode & ( 1 << WM_WEAPONMODE2 ) ) )
;958:		{
;959:			mode = "Stab Mode";
;960:		} 
;961:		else if ( (weapon == WP_PSG1
;962:#ifdef SL8SD
;963:			|| weapon == WP_SL8SD 
;964:#endif
;965:			|| weapon == WP_MACMILLAN ) && (( weaponmode & ( 1 << WM_ZOOM4X) )||( weaponmode & ( 1 << WM_ZOOM2X) )) ) // got 4x zoom
;966:		{
;967:			// if i want to switch to 
;968:			if ( weaponmode & ( 1 << WM_ZOOM4X) )
;969:				mode = "4x Zoom";
;970:			else if ( weaponmode & (1 << WM_ZOOM2X) )
;971:				mode = "2x Zoom";				
;972:		}
;973:		else if ( weaponmode & (1 << WM_SCOPE ) && ( weaponmode & (1 << WM_ZOOM2X) ) ) // scope add-on only2x
;974:		{
;975:			mode = "2x Zoom";
;976:		}
;977:		else if ( weaponmode & (1 << WM_LASER ) && ( weaponmode & (1 << WM_LACTIVE) ) ) // can't have scope + lasersight
;978:		{ 
;979:			mode = "Laser On";
;980:		}		
;981:		else if ( BG_IsGrenade( weapon ) )
;982:		{
;983:			int sec = 3;
;984:
;985:			if ( weaponmode & ( 1 << WM_SINGLE) )
;986:				sec = 4;
;987:			else if ( weaponmode & ( 1 << WM_WEAPONMODE2 ) )
;988:				sec = 5;
;989:
;990:			if ( weaponmode & ( 1 << WM_GRENADEROLL ) )			
;991:				mode = va( "%is Roll", sec ); 
;992:			else 
;993:				mode = va( "%is Throw", sec ); 
;994:		}
;995:		else if ( weapon == WP_PDW && ( weaponmode & ( 1 << WM_WEAPONMODE2 ) ) )
;996:		{ 
;997:			mode = "Recoilcatcher";			
;998:		} 
;999:		else if ( weapon == WP_M4 || weapon == WP_MAC10 || weapon == WP_AK47 || weapon == WP_MP5 || weapon == WP_PDW   )
;1000:		{ 
;1001:			// if i want to switch to 
;1002:			if ( weaponmode & ( 1 << WM_SINGLE) )			
;1003:				mode = "Single Shot";
;1004:			else
;1005:				mode = "Full Auto";  
;1006:		}
;1007:		else if ( !BG_IsMelee(weapon) )
;1008:			mode = "Semi Auto";
;1009:
;1010:		// background layer for weaponmode
;1011:		CG_DrawTeamBackground( 639 - strlen(mode) * 16, 447-17, 1 + strlen(mode) * 16 , 17, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );
;1012:		
;1013:		CG_DrawStringOutline( 640 - strlen(mode) * 16, 480 - 3 * 16, mode, hudWhite );
;1014:	} 
;1015:
;1016:}
;1017:#endif
;1018:
;1019:#if 0
;1020:/*
;1021:================
;1022:CG_DrawStatusBar
;1023:
;1024:================
;1025:*/
;1026:#ifndef MISSIONPACK
;1027:static void CG_DrawStatusBar( void ) {
;1028:	int			color;
;1029:	centity_t	*cent;
;1030:	playerState_t	*ps;
;1031:	int			value;
;1032:	vec4_t		hcolor;
;1033:	vec3_t		angles;
;1034:	vec3_t		origin;
;1035:#ifdef MISSIONPACK
;1036:	qhandle_t	handle;
;1037:#endif
;1038:	static float colors[4][4] = { 
;1039://		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
;1040:		{ 1.0f, 0.69f, 0.0f, 1.0f } ,		// normal
;1041:		{ 1.0f, 0.2f, 0.2f, 1.0f },		// low health
;1042:		{0.5f, 0.5f, 0.5f, 1.0f},			// weapon firing
;1043:		{ 1.0f, 1.0f, 1.0f, 1.0f } };			// health > 100
;1044:
;1045:	if ( cg_drawStatus.integer == 0 ) {
;1046:		return;
;1047:	}
;1048:
;1049:	// draw the team background
;1050:	CG_DrawTeamBackground( 0, 420, 640, 60, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );
;1051:
;1052:	cent = &cg_entities[cg.snap->ps.clientNum];
;1053:	ps = &cg.snap->ps;
;1054:
;1055:	VectorClear( angles );
;1056:
;1057:	// draw any 3D icons first, so the changes back to 2D are minimized
;1058:/*	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
;1059:		origin[0] = 70;
;1060:		origin[1] = 0;
;1061:		origin[2] = 0;
;1062:		angles[YAW] = 90 + 20 * sin( cg.time / 1000.0 );
;1063:		CG_Draw3DModel( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE,
;1064:					   cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
;1065:	}
;1066:*/
;1067:	CG_DrawStatusBarHead( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE );
;1068:
;1069:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
;1070:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_RED );
;1071:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
;1072:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_BLUE );
;1073:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
;1074:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_FREE );
;1075:	}
;1076:
;1077:/*	if ( ps->stats[ STAT_ARMOR ] ) {
;1078:		origin[0] = 90;
;1079:		origin[1] = 0;
;1080:		origin[2] = -10;
;1081:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;1082:		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE,
;1083:					   cgs.media.armorModel, 0, origin, angles );
;1084:	}*/
;1085:#ifdef MISSIONPACK
;1086:	if( cgs.gametype == GT_HARVESTER ) {
;1087:		origin[0] = 90;
;1088:		origin[1] = 0;
;1089:		origin[2] = -10;
;1090:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;1091:		if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;1092:			handle = cgs.media.redCubeModel;
;1093:		} else {
;1094:			handle = cgs.media.blueCubeModel;
;1095:		}
;1096:		CG_Draw3DModel( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles );
;1097:	}
;1098:#endif
;1099:	//
;1100:	// ammo
;1101:	//
;1102:	if ( cent->currentState.weapon ) {
;1103:		gitem_t *item = BG_FindItemForWeapon( cent->currentState.weapon );
;1104:		
;1105:		value = ps->ammo[item->giAmmoTag];
;1106:		if ( value > -1 ) {
;1107:			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
;1108:				&& cg.predictedPlayerState.weaponTime > 100 ) {
;1109:				// draw as dark grey when reloading
;1110:				color = 2;	// dark grey
;1111:			} else {
;1112:				if ( value >= 0 ) {
;1113:					color = 0;	// green
;1114:				} else {
;1115:					color = 1;	// red
;1116:				}
;1117:			}
;1118:			trap_R_SetColor( colors[color] );
;1119:			
;1120:			CG_DrawField (0, 432, 3, value);
;1121:			trap_R_SetColor( NULL );
;1122:
;1123:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;1124:			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;1125:				qhandle_t	icon;
;1126:
;1127://				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
;1128:				if ( icon ) {
;1129:					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE, icon );
;1130:				}
;1131:			}
;1132:		}
;1133:	}
;1134:
;1135:	if ( cent->currentState.weapon ) {
;1136://		gitem_t *item = BG_FindItemForWeapon( cent->currentState.weapon );
;1137:		
;1138:		value = ps->stats[STAT_ROUNDS];
;1139:		if ( value > -1 ) {
;1140:			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
;1141:				&& cg.predictedPlayerState.weaponTime > 100 ) {
;1142:				// draw as dark grey when reloading
;1143:				color = 2;	// dark grey
;1144:			} else {
;1145:				if ( value >= 0 ) {
;1146:					color = 0;	// green
;1147:				} else {
;1148:					color = 1;	// red
;1149:				}
;1150:			}
;1151:			trap_R_SetColor( colors[color] );
;1152:			
;1153:			CG_DrawField (0, 380, 3, value);
;1154:			trap_R_SetColor( NULL );
;1155:
;1156:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;1157:			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;1158:				qhandle_t	icon;
;1159:
;1160://				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
;1161:				if ( icon ) {
;1162:					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE, icon );
;1163:				}
;1164:			}
;1165:		}
;1166:	}
;1167:
;1168:	//
;1169:	// health
;1170:	//
;1171:	value = ps->stats[STAT_HEALTH];
;1172:	if ( value > 100 ) {
;1173:		trap_R_SetColor( colors[3] );		// white
;1174:	} else if (value > 25) {
;1175:		trap_R_SetColor( colors[0] );	// green
;1176:	} else if (value > 0) {
;1177:		color = (cg.time >> 8) & 1;	// flash
;1178:		trap_R_SetColor( colors[color] );
;1179:	} else {
;1180:		trap_R_SetColor( colors[1] );	// red
;1181:	}
;1182:
;1183:	// stretch the health up when taking damage
;1184:	CG_DrawField ( 185, 432, 3, value);
;1185:	CG_ColorForHealth( hcolor );
;1186:	trap_R_SetColor( hcolor );
;1187:
;1188:
;1189:	//
;1190:	// armor
;1191:	//
;1192:/*	value = ps->stats[STAT_ARMOR];
;1193:	if (value > 0 ) {
;1194:		trap_R_SetColor( colors[0] );
;1195:		CG_DrawField (370, 432, 3, value);
;1196:		trap_R_SetColor( NULL );
;1197:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;1198:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;1199:			CG_DrawPic( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, ICON_SIZE, ICON_SIZE, cgs.media.armorIcon );
;1200:		}
;1201:
;1202:	}*/
;1203:#ifdef MISSIONPACK
;1204:	//
;1205:	// cubes
;1206:	//
;1207:	if( cgs.gametype == GT_HARVESTER ) {
;1208:		value = ps->generic1;
;1209:		if( value > 99 ) {
;1210:			value = 99;
;1211:		}
;1212:		trap_R_SetColor( colors[0] );
;1213:		CG_DrawField (640 - (CHAR_WIDTH*2 + TEXT_ICON_SPACE + ICON_SIZE), 432, 2, value);
;1214:		trap_R_SetColor( NULL );
;1215:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;1216:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;1217:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;1218:				handle = cgs.media.redCubeIcon;
;1219:			} else {
;1220:				handle = cgs.media.blueCubeIcon;
;1221:			}
;1222:			CG_DrawPic( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 432, ICON_SIZE, ICON_SIZE, handle );
;1223:		}
;1224:	}
;1225:#endif
;1226:}
;1227:#endif
;1228:#endif
;1229:
;1230:/*
;1231:===========================================================================================
;1232:
;1233:  UPPER RIGHT CORNER
;1234:
;1235:===========================================================================================
;1236:*/ 
;1237:/*
;1238:================
;1239:CG_DrawLocation
;1240:
;1241:  tell the player if he is in an assault/bomb field 
;1242:
;1243:================
;1244:*/
;1245:static float CG_DrawLocation( float y ) {
line 1249
;1246:	
;1247://	const char *string;
;1248:
;1249:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $302
line 1250
;1250:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $301
JUMPV
LABELV $302
line 1253
;1251:	}
;1252:
;1253:	if ( cg.predictedPlayerState.persistant[PERS_TEAM] != TEAM_RED && cg.predictedPlayerState.persistant[PERS_TEAM] != TEAM_BLUE ) {
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 1
EQI4 $306
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 2
EQI4 $306
line 1254
;1254:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $301
JUMPV
LABELV $306
line 1270
;1255:	}  
;1256:
;1257:	/*
;1258:	if ( cg.predictedPlayerState.pm_flags & PMF_BOMBRANGE ) {
;1259:		string = "In Bomb Range";
;1260:		CG_DrawStringOutline( 640 - ( strlen(string) * 16), y, string, colorWhite );	
;1261:		y += 16;
;1262:	}
;1263:	if ( cg.predictedPlayerState.pm_flags & PMF_ASSAULTRANGE ) {
;1264:		string = "In an Assaultfield";
;1265:		CG_DrawStringOutline( 640 - ( strlen(string) * 16), y, string, colorWhite );	
;1266:		y += 16;
;1267:	}
;1268:	*/
;1269:
;1270:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $301
endproc CG_DrawLocation 0 0
proc CG_DrawSnapshot 16 16
line 1279
;1271:}
;1272:
;1273:
;1274:/*
;1275:==================
;1276:CG_DrawSnapshot
;1277:==================
;1278:*/
;1279:static int CG_DrawSnapshot( int y ) {
line 1283
;1280:	char		*s;
;1281:	int			w;
;1282:
;1283:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
ADDRGP4 $315
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31444
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1285
;1284:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;1285:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1287
;1286:
;1287:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
CNSTI4 635
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1289
;1288:
;1289:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRI4
CNSTI4 16
ADDI4
CNSTI4 4
ADDI4
RETI4
LABELV $314
endproc CG_DrawSnapshot 16 16
bss
align 4
LABELV $320
skip 16
align 4
LABELV $321
skip 4
align 4
LABELV $322
skip 4
code
proc CG_DrawFPS 52 32
line 1563
;1290:}
;1291:
;1292:
;1293:#if 0
;1294:/*
;1295:=================
;1296:CG_DrawTimer
;1297:=================
;1298:*/
;1299:static float CG_DrawTimer( float y ) {
;1300:	int			mins, seconds;
;1301:	int			msec;
;1302:
;1303:	if ( cgs.gametype == GT_LTS ) {
;1304:		if ( !cgs.levelRoundStartTime )
;1305:			return y;
;1306:
;1307:		msec = ( cgs.levelRoundStartTime ) - cg.time;
;1308:	}
;1309:	else
;1310:		msec = cg.time - cgs.levelStartTime;
;1311:
;1312:	seconds = msec / 1000;
;1313:	mins = seconds / 60;
;1314:	seconds -= mins * 60;
;1315:
;1316:
;1317:	CG_DrawDigits( 640 - 7 * 16 - 8 , y, 1, mins );
;1318:	CG_DrawPic( 640 - 6 * 16, y, 16,32, cgs.media.colonIcon );
;1319:	CG_DrawDigits( 640 - 5 * 16 , y, 2, seconds );
;1320:	CG_DrawPic( 640 - 2 * 16, y, 32,32, cgs.media.clockIcon );
;1321:
;1322:	return y + 32;
;1323:}
;1324:
;1325:/*
;1326:=================
;1327:CG_DrawMiscTimer
;1328:=================
;1329:*/
;1330:static float CG_DrawMiscTimer( float y ) {
;1331:	int			mins, seconds;
;1332:	int			msec;
;1333:
;1334:	if ( cgs.gametype >= GT_TEAM ) {
;1335:		if ( !cgs.levelMiscStartTime )
;1336:			return y; 
;1337:		msec = ( cgs.levelMiscStartTime + 1000 ) - cg.time;
;1338:	}
;1339:	else
;1340:		return y;
;1341:
;1342:	seconds = msec / 1000;
;1343:	mins = seconds / 60;
;1344:	seconds -= mins * 60; 
;1345:
;1346:	CG_DrawDigits( 640 - 7 * 16 - 8 , y, 1, mins );
;1347:	CG_DrawPic( 640 - 6 * 16, y, 16,32, cgs.media.colonIcon );
;1348:	CG_DrawDigits( 640 - 5 * 16 , y, 2, seconds );
;1349:	CG_DrawPic( 640 - 2 * 16, y, 32,32, cgs.media.clockIcon );
;1350:
;1351:	return y + 32;
;1352:}
;1353:/*
;1354:=================
;1355:CG_DrawAssaultTimer
;1356:=================
;1357:*/
;1358:static float CG_DrawAssaultTimer( float y ) {
;1359:	int			mins, seconds ;
;1360:	int			msec;
;1361:
;1362:	if ( cgs.gametype >= GT_TEAM ) {
;1363:		if ( !cgs.levelAssaultStartTime )
;1364:			return y;
;1365:
;1366:		msec = ( cgs.levelAssaultStartTime + 1000 ) - cg.time;
;1367:	}
;1368:	else
;1369:		return y;
;1370:
;1371:	seconds = msec / 1000;
;1372:	mins = seconds / 60;
;1373:	seconds -= mins * 60; 
;1374:
;1375:	CG_DrawDigits( 640 - 7 * 16 - 8 , y, 1, mins );
;1376:	CG_DrawPic( 640 - 6 * 16, y, 16,32, cgs.media.colonIcon );
;1377:	CG_DrawDigits( 640 - 5 * 16 , y, 2, seconds );
;1378:	CG_DrawPic( 640 - 2 * 16, y, 32,32, cgs.media.clockIcon );
;1379:
;1380:	return y + 32;
;1381:}
;1382:#endif
;1383:#if 0
;1384:/*
;1385:=================
;1386:CG_DrawTeamOverlay
;1387:=================
;1388:*/
;1389:
;1390:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
;1391:	int x, w, h, xx;
;1392:	int i, j, len;
;1393:	const char *p;
;1394:	vec4_t		hcolor;
;1395:	int pwidth, lwidth;
;1396:	int plyrs;
;1397:	char st[16];
;1398:	clientInfo_t *ci;
;1399:	gitem_t	*item;
;1400:	int ret_y, count;
;1401:
;1402:	if ( !cg_drawTeamOverlay.integer ) {
;1403:		return y;
;1404:	}
;1405:
;1406:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
;1407:		return y; // Not on any team
;1408:	}
;1409:
;1410:	plyrs = 0;
;1411:
;1412:	// max player name width
;1413:	pwidth = 0;
;1414:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
;1415:	for (i = 0; i < count; i++) {
;1416:		ci = cgs.clientinfo + sortedTeamPlayers[i];
;1417:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
;1418:			plyrs++;
;1419:			len = CG_DrawStrlen(ci->name);
;1420:			if (len > pwidth)
;1421:				pwidth = len;
;1422:		}
;1423:	}
;1424:
;1425:	if (!plyrs)
;1426:		return y;
;1427:
;1428:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
;1429:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
;1430:
;1431:	// max location name width
;1432:	lwidth = 0;
;1433:	for (i = 1; i < MAX_LOCATIONS; i++) {
;1434:		p = CG_ConfigString(CS_LOCATIONS + i);
;1435:		if (p && *p) {
;1436:			len = CG_DrawStrlen(p);
;1437:			if (len > lwidth)
;1438:				lwidth = len;
;1439:		}
;1440:	}
;1441:
;1442:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
;1443:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
;1444:
;1445:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
;1446:
;1447:	if ( right )
;1448:		x = 640 - w;
;1449:	else
;1450:		x = 0;
;1451:
;1452:	h = plyrs * TINYCHAR_HEIGHT;
;1453:
;1454:	if ( upper ) {
;1455:		ret_y = y + h;
;1456:	} else {
;1457:		y -= h;
;1458:		ret_y = y;
;1459:	}
;1460:
;1461:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
;1462:		hcolor[0] = 1;
;1463:		hcolor[1] = 0;
;1464:		hcolor[2] = 0;
;1465:		hcolor[3] = 0.33f;
;1466:	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
;1467:		hcolor[0] = 0;
;1468:		hcolor[1] = 0;
;1469:		hcolor[2] = 1;
;1470:		hcolor[3] = 0.33f;
;1471:	}
;1472:	trap_R_SetColor( hcolor );
;1473:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
;1474:	trap_R_SetColor( NULL );
;1475:
;1476:	for (i = 0; i < count; i++) {
;1477:		ci = cgs.clientinfo + sortedTeamPlayers[i];
;1478:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
;1479:
;1480:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
;1481:
;1482:			xx = x + TINYCHAR_WIDTH;
;1483:
;1484:			CG_DrawStringExt( xx, y,
;1485:				ci->name, hcolor, qfalse, qfalse,
;1486:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH);
;1487:
;1488:			if (lwidth) {
;1489:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
;1490:				if (!p || !*p)
;1491:					p = "unknown";
;1492:				len = CG_DrawStrlen(p);
;1493:				if (len > lwidth)
;1494:					len = lwidth;
;1495:
;1496://				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
;1497://					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;1498:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
;1499:				CG_DrawStringExt( xx, y,
;1500:					p, hcolor, qfalse, qfalse, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
;1501:					TEAM_OVERLAY_MAXLOCATION_WIDTH);
;1502:			}
;1503:
;1504:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
;1505:
;1506:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
;1507:
;1508:			xx = x + TINYCHAR_WIDTH * 3 + 
;1509:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;1510:
;1511:			CG_DrawStringExt( xx, y,
;1512:				st, hcolor, qfalse, qfalse,
;1513:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;1514:
;1515:			// draw weapon icon
;1516:			xx += TINYCHAR_WIDTH * 3;
;1517:
;1518:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
;1519:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
;1520:					cg_weapons[ci->curWeapon].weaponIcon );
;1521:			} else {
;1522:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
;1523:					cgs.media.deferShader );
;1524:			}
;1525:
;1526:			// Draw powerup icons
;1527:			if (right) {
;1528:				xx = x;
;1529:			} else {
;1530:				xx = x + w - TINYCHAR_WIDTH;
;1531:			}
;1532:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
;1533:				if (ci->powerups & (1 << j)) {
;1534:
;1535:					item = BG_FindItemForPowerup( j );
;1536:
;1537:					if (item) {
;1538:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
;1539:						trap_R_RegisterShader( item->icon ) );
;1540:						if (right) {
;1541:							xx -= TINYCHAR_WIDTH;
;1542:						} else {
;1543:							xx += TINYCHAR_WIDTH;
;1544:						}
;1545:					}
;1546:				}
;1547:			}
;1548:
;1549:			y += TINYCHAR_HEIGHT;
;1550:		}
;1551:	}
;1552:
;1553:	return ret_y;
;1554://#endif
;1555:}
;1556:#endif
;1557:/*
;1558:==================
;1559:CG_DrawFPS
;1560:==================
;1561:*/
;1562:#define	FPS_FRAMES	4
;1563:static int CG_DrawFPS( int y ) {
line 1570
;1564:	char		*s;
;1565:	int			w;
;1566:	static int	previousTimes[FPS_FRAMES];
;1567:	static int	index;
;1568:	int		i, total;
;1569:	int		fps;
;1570:	float	scale = 0.15f;
ADDRLP4 8
CNSTF4 1041865114
ASGNF4
line 1574
;1571:	static	int	previous;
;1572:	int		t, frameTime;
;1573:
;1574:	if ( !cg_drawFPS.integer ) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
NEI4 $323
line 1575
;1575:		return y;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $319
JUMPV
LABELV $323
line 1578
;1576:	}
;1577:
;1578:	y += CG_Text_Height( "100Fps", scale, 0 ) + 2;
ADDRGP4 $326
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1582
;1579:
;1580:	// don't use serverTime, because that will be drifting to
;1581:	// correct for internet lag changes, timescales, timedemos, etc
;1582:	t = trap_Milliseconds();
ADDRLP4 36
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1583
;1583:	frameTime = t - previous;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 $322
INDIRI4
SUBI4
ASGNI4
line 1584
;1584:	previous = t;
ADDRGP4 $322
ADDRLP4 12
INDIRI4
ASGNI4
line 1586
;1585:
;1586:	previousTimes[index % FPS_FRAMES] = frameTime;
ADDRGP4 $321
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $320
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1587
;1587:	index++;
ADDRLP4 40
ADDRGP4 $321
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1588
;1588:	if ( index > FPS_FRAMES ) {
ADDRGP4 $321
INDIRI4
CNSTI4 4
LEI4 $327
line 1590
;1589:		// average multiple frames together to smooth changes out a bit
;1590:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1591
;1591:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $329
line 1592
;1592:			total += previousTimes[i];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $320
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1593
;1593:		}
LABELV $330
line 1591
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $329
line 1594
;1594:		if ( !total ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $333
line 1595
;1595:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1596
;1596:		}
LABELV $333
line 1597
;1597:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 28
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 1599
;1598:
;1599:		s = va( "%iFPS", fps );
ADDRGP4 $335
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 44
INDIRP4
ASGNP4
line 1600
;1600:		w = CG_Text_Width( s ,scale,0 );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 48
INDIRI4
ASGNI4
line 1602
;1601:
;1602:		CG_Text_Paint( 640 - w, y, scale, colorWhite,s, 0,0,ITEM_TEXTSTYLE_OUTLINED );
CNSTI4 640
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1603
;1603:	} 
LABELV $327
line 1604
;1604:	return y + 24;
ADDRFP4 0
INDIRI4
CNSTI4 24
ADDI4
RETI4
LABELV $319
endproc CG_DrawFPS 52 32
proc CG_DrawUpperRight 4 4
line 1612
;1605:}
;1606:/*
;1607:=====================
;1608:CG_DrawUpperRight
;1609:
;1610:=====================
;1611:*/
;1612:static void CG_DrawUpperRight( void ) {
line 1613
;1613:	int	y = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1615
;1614:
;1615:	if ( cg_drawFPS.integer ) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
EQI4 $337
line 1616
;1616:		CG_DrawFPS( y );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawFPS
CALLI4
pop
line 1617
;1617:	} 
LABELV $337
line 1618
;1618:	if ( cg_drawSnapshot.integer ) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $340
line 1619
;1619:		CG_DrawSnapshot( y );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawSnapshot
CALLI4
pop
line 1620
;1620:	}
LABELV $340
line 1621
;1621:}
LABELV $336
endproc CG_DrawUpperRight 4 4
proc CG_DrawPlayer 20 20
line 1640
;1622:
;1623:/*
;1624:===========================================================================================
;1625:
;1626:  LOWER RIGHT CORNER
;1627:
;1628:===========================================================================================
;1629:*/
;1630:  
;1631:/*
;1632:=================
;1633:CG_DrawMapOverview
;1634:=================
;1635:*/
;1636:#define MAP_SIZE_WIDTH		512
;1637:#define MAP_SIZE_HEIGHT		512
;1638:
;1639:static void CG_DrawPlayer( int x, int y, int size, qboolean team )
;1640:{
line 1643
;1641:	vec4_t		hcolor;
;1642:
;1643:	hcolor[3] = 1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 1644
;1644:	if ( team == TEAM_RED ) {
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $345
line 1645
;1645:		hcolor[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1646
;1646:		hcolor[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1647
;1647:		hcolor[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1648
;1648:	} else if ( team == TEAM_BLUE ) {
ADDRGP4 $346
JUMPV
LABELV $345
ADDRFP4 12
INDIRI4
CNSTI4 2
NEI4 $349
line 1649
;1649:		hcolor[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1650
;1650:		hcolor[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1651
;1651:		hcolor[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1652
;1652:	} else {
ADDRGP4 $350
JUMPV
LABELV $349
line 1653
;1653:		hcolor[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1654
;1654:		hcolor[1] = 1.0f;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 1655
;1655:		hcolor[2] = 0.0f; 
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1656
;1656:	}
LABELV $350
LABELV $346
line 1657
;1657:	trap_R_SetColor( hcolor );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1658
;1658:	CG_DrawPic( x, y, size, size, cgs.media.teamStatusBar );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+205084+20
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1659
;1659:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1661
;1660:
;1661:}
LABELV $343
endproc CG_DrawPlayer 20 20
proc CG_DrawMapOverview 52 20
line 1663
;1662:static void CG_DrawMapOverview(void) 
;1663:{    
line 1664
;1664:	int	orgX = cg.mapOriginX;
ADDRLP4 16
ADDRGP4 cg+167380
INDIRI4
ASGNI4
line 1665
;1665:	int	orgY = cg.mapOriginY;
ADDRLP4 20
ADDRGP4 cg+167384
INDIRI4
ASGNI4
line 1666
;1666:	qhandle_t	map = trap_R_RegisterShader( "plans/plan_oldcity.tga" );
ADDRGP4 $360
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 1670
;1667:	int	i;
;1668:	int	x,y;
;1669:
;1670:	if ( !cg.mapVisible )
ADDRGP4 cg+167388
INDIRI4
CNSTI4 0
NEI4 $361
line 1671
;1671:		return;
ADDRGP4 $357
JUMPV
LABELV $361
line 1673
;1672:
;1673:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $364
line 1674
;1674:		return;
ADDRGP4 $357
JUMPV
LABELV $364
line 1677
;1675:	} 
;1676:  
;1677:	x = ( 640 / 2 ) - ( MAP_SIZE_WIDTH/2 );
ADDRLP4 4
CNSTI4 64
ASGNI4
line 1678
;1678:	y = ( 480 / 2 ) - ( MAP_SIZE_HEIGHT/2 );
ADDRLP4 8
CNSTI4 -16
ASGNI4
line 1680
;1679:	 
;1680:	CG_DrawPic(x,y,MAP_SIZE_WIDTH,MAP_SIZE_HEIGHT, map );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
CNSTF4 1140850688
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1682
;1681:
;1682:	x += /*cg.mapOriginX*/test_x.integer;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 test_x+12
INDIRI4
ADDI4
ASGNI4
line 1683
;1683:	y += /*cg.mapOriginY*/test_y.integer;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 test_y+12
INDIRI4
ADDI4
ASGNI4
line 1685
;1684:
;1685:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $369
line 1686
;1686:	{
line 1690
;1687:		int pX;
;1688:		int	pY;
;1689:		int	team;
;1690:		qboolean	self	=	qfalse;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 1692
;1691:
;1692:		if ( cg_entities[i].currentState.eType != ET_PLAYER )
CNSTI4 728
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $373
line 1693
;1693:			continue;
ADDRGP4 $370
JUMPV
LABELV $373
line 1694
;1694:		if ( cg_entities[i].currentState.eFlags & EF_DEAD )
CNSTI4 728
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $376
line 1695
;1695:			continue;
ADDRGP4 $370
JUMPV
LABELV $376
line 1697
;1696:
;1697:		team = cgs.clientinfo[i].team;
ADDRLP4 44
CNSTI4 2484
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+38664+68
ADDP4
INDIRI4
ASGNI4
line 1699
;1698:
;1699:		if ( cg_entities[i].currentState.clientNum == cg.snap->ps.clientNum )
CNSTI4 728
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+168
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $381
line 1700
;1700:			self	=	qtrue;
ADDRLP4 40
CNSTI4 1
ASGNI4
LABELV $381
line 1702
;1701:
;1702:		pX = cg_entities[i].lerpOrigin[0];
ADDRLP4 36
CNSTI4 728
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+700
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1703
;1703:		pY = cg_entities[i].lerpOrigin[1];
ADDRLP4 32
CNSTI4 728
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+700+4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1706
;1704:		
;1705:	//	pX *= -1;
;1706:		pY *= -1;
ADDRLP4 32
CNSTI4 -1
ADDRLP4 32
INDIRI4
MULI4
ASGNI4
line 1708
;1707:
;1708:		pX = pX/(test_w.value+1);
ADDRLP4 36
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRGP4 test_w+8
INDIRF4
CNSTF4 1065353216
ADDF4
DIVF4
CVFI4 4
ASGNI4
line 1709
;1709:		pY = pY/(test_w.value+1);
ADDRLP4 32
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRGP4 test_w+8
INDIRF4
CNSTF4 1065353216
ADDF4
DIVF4
CVFI4 4
ASGNI4
line 1713
;1710:
;1711:	//	CG_Printf("player @ %i %i \n",pX,pY);
;1712:
;1713:		if (self)
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $390
line 1714
;1714:		{
line 1715
;1715:			CG_DrawPlayer( x + pX - 4 , y + pY - 4, 8, TEAM_FREE );
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
ADDRLP4 48
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
ADDRLP4 48
INDIRI4
SUBI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawPlayer
CALLV
pop
line 1716
;1716:		}
ADDRGP4 $391
JUMPV
LABELV $390
line 1718
;1717:		else
;1718:			CG_DrawPlayer( x + pX - 2 , y + pY - 2, 4, team );
ADDRLP4 48
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
ADDRLP4 48
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
ADDRLP4 48
INDIRI4
SUBI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayer
CALLV
pop
LABELV $391
line 1726
;1719:
;1720:		/*
;1721:		if ( cg_entities[i].currentState.clientNum == clientNum 
;1722:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
;1723:			CG_ResetPlayerEntity( &cg_entities[i] );
;1724:		}
;1725:		*/
;1726:	}
LABELV $370
line 1685
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $369
line 1727
;1727:}
LABELV $357
endproc CG_DrawMapOverview 52 20
proc CG_DrawSniperRifle 56 20
line 1735
;1728:
;1729:
;1730:/*
;1731:=================
;1732:CG_DrawSniperRifle
;1733:=================
;1734:*/
;1735:static void CG_DrawSniperRifle(void) {
line 1737
;1736:
;1737:	int weaponstate = cg.snap->ps.weaponstate;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 1738
;1738:	int team = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1740
;1739:
;1740:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $394
line 1741
;1741:		return;
ADDRGP4 $392
JUMPV
LABELV $394
line 1745
;1742:	}
;1743:
;1744:	// chasing a bullet.
;1745:	if ( cg.cameraActive )
ADDRGP4 cg+116652
INDIRI4
CNSTI4 0
EQI4 $397
line 1746
;1746:		return;
ADDRGP4 $392
JUMPV
LABELV $397
line 1747
;1747:	if ( cg.renderingThirdPerson )
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $400
line 1748
;1748:		return;
ADDRGP4 $392
JUMPV
LABELV $400
line 1750
;1749:
;1750:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $403
line 1751
;1751:		team = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $403
line 1755
;1752:
;1753:	// check to see if we're in zoom mode
;1754:	if ( 
;1755:		! (
ADDRLP4 8
CNSTI4 264
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $406
ADDRGP4 cg+36
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $406
line 1760
;1756:			(cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM2X ) ) ||
;1757:			(cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM4X ) )  
;1758:		)
;1759:		)
;1760:		return;
ADDRGP4 $392
JUMPV
LABELV $406
line 1764
;1761:
;1762:
;1763:	// if not in ready
;1764:	if ( weaponstate != WEAPON_FIRING && weaponstate !=	WEAPON_FIRING2 && weaponstate != WEAPON_FIRING3 && weaponstate != WEAPON_READY )
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $410
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $410
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $410
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $410
line 1765
;1765:		return;
ADDRGP4 $392
JUMPV
LABELV $410
line 1767
;1766:
;1767:	trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLACK)] );
ADDRGP4 g_color_table
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1799
;1768:
;1769:  // TEAM_RED == seals team (whyever)  
;1770:  /*if (team == TEAM_RED) {
;1771:    // draw seals scope
;1772:    switch ( cg.snap->ps.weapon ) {
;1773:      case WP_PSG1:
;1774:      case WP_SL8SD:
;1775:      	CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[1] );
;1776:        break;
;1777:      case WP_MACMILLAN:
;1778:        CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[2] );
;1779:        break;
;1780:      default:
;1781:        CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[0] );
;1782:        break;
;1783:    }
;1784:  } else {
;1785:    // draw tango scope
;1786:    switch ( cg.snap->ps.weapon ) {
;1787:      case WP_PSG1:
;1788:      case WP_SL8SD:
;1789:      	CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[4] );
;1790:        break;
;1791:      case WP_MACMILLAN:
;1792:        CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[5] );
;1793:        break;
;1794:      default:
;1795:        CG_DrawPic(0,0,640,480, cgs.media.sniperScopeShader[3] );
;1796:        break;
;1797:    }
;1798:  }*/
;1799:	switch ( cg.snap->ps.weapon ) {
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 15
LTI4 $412
ADDRLP4 20
INDIRI4
CNSTI4 24
GTI4 $412
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $442-60
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $442
address $419
address $416
address $427
address $431
address $412
address $412
address $412
address $423
address $412
address $435
code
LABELV $416
line 1801
;1800:		case WP_M4:
;1801:			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[0] );
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+205084+648
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1802
;1802:			break;
ADDRGP4 $413
JUMPV
LABELV $419
line 1804
;1803:		case WP_AK47:
;1804:			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[1] );
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+205084+648+4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1805
;1805:			break;
ADDRGP4 $413
JUMPV
LABELV $423
line 1807
;1806:		case WP_M14:
;1807:			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[2] );
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+205084+648+8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1808
;1808:			break;
ADDRGP4 $413
JUMPV
LABELV $427
line 1810
;1809:		case WP_PSG1:
;1810:			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[3] );
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+205084+648+12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1811
;1811:			break;
ADDRGP4 $413
JUMPV
LABELV $431
line 1813
;1812:		case WP_MACMILLAN:
;1813:			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[4] );
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+205084+648+16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1814
;1814:			break;
ADDRGP4 $413
JUMPV
LABELV $435
line 1816
;1815:		case WP_SL8SD:
;1816:			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[5] );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+205084+648+20
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1817
;1817:			break;
ADDRGP4 $413
JUMPV
LABELV $412
line 1819
;1818:		default:
;1819:			CG_DrawPic( 0, 0, 640, 480, cgs.media.sniperScopeShader[2] );
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+205084+648+8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1820
;1820:			break;
LABELV $413
line 1822
;1821:	}
;1822:	trap_R_SetColor( NULL ); 
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1823
;1823:}
LABELV $392
endproc CG_DrawSniperRifle 56 20
proc CG_DrawThermalGoggles 24 20
line 1830
;1824:
;1825:/*
;1826:=================
;1827:CG_DrawThermalGoggles
;1828:=================
;1829:*/
;1830:static int CG_DrawThermalGoggles(void) {
line 1833
;1831:	float	hcolor[4];
;1832:
;1833:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $445
line 1834
;1834:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $444
JUMPV
LABELV $445
line 1838
;1835:	}
;1836:
;1837:	// if not enabled
;1838:	if ( ! ( cg.snap->ps.stats[STAT_ACTIVE_ITEMS] & ( 1 << UI_NVG ) ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $448
line 1839
;1839:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $444
JUMPV
LABELV $448
line 1841
;1840:
;1841:	hcolor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1842
;1842:	hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1843
;1843:	hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1845
;1844:
;1845:	hcolor[3] = 0.7f;
ADDRLP4 0+12
CNSTF4 1060320051
ASGNF4
line 1847
;1846:
;1847:	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1849
;1848:
;1849:	trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLACK)] );
ADDRGP4 g_color_table
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1850
;1850:	CG_DrawPic(0,0,640,480, cgs.media.thermalGogglesShader );
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+205084+708
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1851
;1851:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1853
;1852:  
;1853:	return 1;
CNSTI4 1
RETI4
LABELV $444
endproc CG_DrawThermalGoggles 24 20
proc CG_DrawDamageFeedback 36 20
line 1894
;1854:}
;1855: 
;1856:
;1857:/*
;1858:===================
;1859:CG_DrawPickupItem
;1860:===================
;1861:*/
;1862:#ifndef MISSIONPACK
;1863:static int CG_DrawPickupItem( int y ) {
;1864:	int		value;
;1865:	float	*fadeColor;
;1866:
;1867:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
;1868:		return y;
;1869:	}
;1870:
;1871:	y -= ICON_SIZE;
;1872:
;1873:	value = cg.itemPickup;
;1874:	if ( value ) {
;1875:		fadeColor = CG_FadeColor( cg.itemPickupTime, 3000 );
;1876:		if ( fadeColor ) {
;1877:			CG_RegisterItemVisuals( value );
;1878:			trap_R_SetColor( fadeColor );
;1879:			CG_DrawPic( 8, y, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
;1880:			CG_DrawBigString( ICON_SIZE + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_name, fadeColor[0] );
;1881:			trap_R_SetColor( NULL );
;1882:		}
;1883:	}
;1884:	
;1885:	return y;
;1886:}
;1887:#endif
;1888:
;1889:/*
;1890:=================
;1891:CG_DrawDamageFeedback
;1892:=================
;1893:*/
;1894:static void CG_DrawDamageFeedback ( void ) {
line 1902
;1895:	int			t;
;1896:	int			maxTime; 
;1897://	refEntity_t		ent;
;1898:	// ns
;1899:	float	hcolor[4];
;1900:	// ns end
;1901:
;1902:	if (  ( CG_PointContents( cg.refdef.vieworg, -1 ) & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) )){
ADDRGP4 cg+109044+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 24
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $457
line 1903
;1903:		hcolor[0] = 0.2f;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 1904
;1904:		hcolor[1] = 0.2f;
ADDRLP4 0+4
CNSTF4 1045220557
ASGNF4
line 1905
;1905:		hcolor[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1906
;1906:		hcolor[3] = 0.6f;
ADDRLP4 0+12
CNSTF4 1058642330
ASGNF4
line 1907
;1907:		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1909
;1908:
;1909:		cg.WaterTime = cg.snap->serverTime;
ADDRGP4 cg+115720
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1911
;1910:
;1911:	} 
ADDRGP4 $458
JUMPV
LABELV $457
line 1912
;1912:	else if (cg.WaterTime > 0)
ADDRGP4 cg+115720
INDIRI4
CNSTI4 0
LEI4 $466
line 1913
;1913:	{
line 1914
;1914:		maxTime = 500;
ADDRLP4 20
CNSTI4 500
ASGNI4
line 1915
;1915:		t = cg.time - cg.WaterTime;
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+115720
INDIRI4
SUBI4
ASGNI4
line 1917
;1916:
;1917:		hcolor[0] = 0.2f;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 1918
;1918:		hcolor[1] = 0.2f;
ADDRLP4 0+4
CNSTF4 1045220557
ASGNF4
line 1919
;1919:		hcolor[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1920
;1920:		hcolor[3] = 0.6 - ((float)t / 10000);
ADDRLP4 0+12
CNSTF4 1058642330
ADDRLP4 16
INDIRI4
CVIF4 4
CNSTF4 1176256512
DIVF4
SUBF4
ASGNF4
line 1922
;1921:
;1922: 		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1924
;1923:
;1924:		if ( hcolor[3] <= 0.0 )
ADDRLP4 0+12
INDIRF4
CNSTF4 0
GTF4 $474
line 1925
;1925:			cg.WaterTime = 0;
ADDRGP4 cg+115720
CNSTI4 0
ASGNI4
LABELV $474
line 1926
;1926:	}
LABELV $466
LABELV $458
line 1928
;1927:
;1928:	if ( !cg.damageValue )
ADDRGP4 cg+115324
INDIRF4
CNSTF4 0
NEF4 $478
line 1929
;1929:		return;
ADDRGP4 $456
JUMPV
LABELV $478
line 1932
;1930:
;1931:	// ragePro systems can't fade blends, so don't obscure the screen
;1932:	if ( cgs.glconfig.hardwareType == GLHW_RAGEPRO ) {
ADDRGP4 cgs+20100+11288
INDIRI4
CNSTI4 3
NEI4 $481
line 1933
;1933:		return;
ADDRGP4 $456
JUMPV
LABELV $481
line 1936
;1934:	}	
;1935:
;1936:	maxTime = 500;
ADDRLP4 20
CNSTI4 500
ASGNI4
line 1937
;1937:	t = cg.time - cg.damageTime;
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ADDRGP4 cg+115312
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 1940
;1938:
;1939:
;1940:	if ( t <= 0 || t >= maxTime ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $489
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $487
LABELV $489
line 1942
;1941:		
;1942:		return;
ADDRGP4 $456
JUMPV
LABELV $487
line 1945
;1943:	} 
;1944:
;1945:	 else {
line 1947
;1946: 
;1947:	hcolor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1948
;1948:	hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1949
;1949:	hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1951
;1950:
;1951:	hcolor[3] = 1.0 - ((float)t / maxTime);
ADDRLP4 0+12
CNSTF4 1065353216
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 1952
;1952:	}
line 1956
;1953:	
;1954://	CG_Printf("hcolor 3 (blood debug) : %f \n", hcolor[3] );
;1955:
;1956:	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1957
;1957:}
LABELV $456
endproc CG_DrawDamageFeedback 36 20
proc CG_DrawFlashed 32 20
line 1964
;1958:
;1959:/*
;1960:=================
;1961:CG_DrawFlashed
;1962:=================
;1963:*/
;1964:static void CG_DrawFlashed ( void ) {
line 1969
;1965:	int			t;   
;1966:	float	hcolor[4]; 
;1967:
;1968:	// render the blindspot
;1969:	if ( cg.flashedVisionTime > 0 ) {
ADDRGP4 cg+116296
INDIRI4
CNSTI4 0
LEI4 $494
line 1972
;1970:
;1971:		// only calculate a new blindspot position 
;1972:		if ( !cg.flashedVision_x || !cg.flashedVision_y ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 cg+116300
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $501
ADDRGP4 cg+116304
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $497
LABELV $501
line 1973
;1973:			cg.flashedVision_x = random()*400;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+116300
CNSTF4 1137180672
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 1974
;1974:			cg.flashedVision_y = random()*300;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+116304
CNSTF4 1133903872
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 1975
;1975:		}
LABELV $497
line 1978
;1976:		
;1977:		// t \in [SEALS_FLASHBANGTIME*SEALS_BLINDSPOTFACTOR ... -SEALS_FLASHBANGTIME*SEALS_BLINDSPOTFACTOR]
;1978:		t = cg.flashedVisionTime - cg.time;
ADDRLP4 16
ADDRGP4 cg+116296
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 1980
;1979:
;1980:		hcolor[0] = 1.0;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1981
;1981:		hcolor[1] = 1.0;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 1982
;1982:		hcolor[2] = 1.0;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1985
;1983:
;1984:		// clever part
;1985:		if ( t > 0 ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $508
line 1986
;1986:			hcolor[3] = 1.0;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 1987
;1987:		} else {
ADDRGP4 $509
JUMPV
LABELV $508
line 1988
;1988:			hcolor[3] = 1.0 + ((float)t / (float)(SEALS_FLASHBANGTIME*SEALS_BLINDSPOTFACTOR));
ADDRLP4 0+12
ADDRLP4 16
INDIRI4
CVIF4 4
CNSTF4 1179840512
DIVF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1989
;1989:			if (hcolor[3] <= 0.0) hcolor[3] = 0.0;
ADDRLP4 0+12
INDIRF4
CNSTF4 0
GTF4 $512
ADDRLP4 0+12
CNSTF4 0
ASGNF4
LABELV $512
line 1990
;1990:		}
LABELV $509
line 1992
;1991:
;1992:		trap_R_SetColor(hcolor);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1993
;1993:		CG_DrawPic( cg.flashedVision_x,cg.flashedVision_y, 320, 320,cgs.media.flashedSpot );
ADDRGP4 cg+116300
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cg+116304
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
CNSTF4 1134559232
ASGNF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 cgs+205084+720
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1994
;1994:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1996
;1995:
;1996:		if ( hcolor[3] <= 0.0  ) {
ADDRLP4 0+12
INDIRF4
CNSTF4 0
GTF4 $520
line 1997
;1997:			cg.flashedVision_x = cg.flashedVision_y = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 cg+116304
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 cg+116300
ADDRLP4 28
INDIRI4
ASGNI4
line 1998
;1998:			cg.flashedVisionTime = 0;
ADDRGP4 cg+116296
CNSTI4 0
ASGNI4
line 1999
;1999:		}
LABELV $520
line 2000
;2000:	}
LABELV $494
line 2002
;2001:
;2002:	if ( cg.FlashTime <= 0 )
ADDRGP4 cg+116284
INDIRI4
CNSTI4 0
GTI4 $526
line 2003
;2003:		return;
ADDRGP4 $493
JUMPV
LABELV $526
line 2006
;2004:
;2005:	// t \in [SEALS_FLASHBANGTIME .. -SEALS_FLASHBANGFADETIME]
;2006:	t = cg.FlashTime - cg.time;
ADDRLP4 16
ADDRGP4 cg+116284
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 2008
;2007:
;2008:	hcolor[0] = 1.0;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2009
;2009:	hcolor[1] = 1.0;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2010
;2010:	hcolor[2] = 1.0;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2013
;2011:
;2012:	// clever part
;2013:	if ( t > 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $533
line 2014
;2014:		hcolor[3] = 1.0;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 2015
;2015:	} else {
ADDRGP4 $534
JUMPV
LABELV $533
line 2016
;2016:		hcolor[3] = 1.0 + ((float)t / (float)SEALS_FLASHBANGFADETIME);
ADDRLP4 0+12
ADDRLP4 16
INDIRI4
CVIF4 4
CNSTF4 1161527296
DIVF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2017
;2017:		if (hcolor[3] <= 0.0) hcolor[3] = 0.0;
ADDRLP4 0+12
INDIRF4
CNSTF4 0
GTF4 $537
ADDRLP4 0+12
CNSTF4 0
ASGNF4
LABELV $537
line 2018
;2018:	}
LABELV $534
line 2021
;2019:
;2020:
;2021: 	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2023
;2022:
;2023:	if ( hcolor[3] <= 0.0 )
ADDRLP4 0+12
INDIRF4
CNSTF4 0
GTF4 $541
line 2024
;2024:		cg.FlashTime = 0; 
ADDRGP4 cg+116284
CNSTI4 0
ASGNI4
LABELV $541
line 2025
;2025:}
LABELV $493
endproc CG_DrawFlashed 32 20
proc CG_DrawDeathblend 24 20
line 2035
;2026: 
;2027:/*
;2028:==================
;2029:CG_DrawDeathblend
;2030:
;2031:used to draw a small fade in effect while respawning
;2032:==================
;2033:*/
;2034:static void CG_DrawDeathblend( void )
;2035:{
line 2039
;2036:	vec4_t hcolor;
;2037:	float  t;
;2038:
;2039:	if ( cg.DeathBlendTime <= 0 )
ADDRGP4 cg+171488
INDIRI4
CNSTI4 0
GTI4 $546
line 2040
;2040:		return;
ADDRGP4 $545
JUMPV
LABELV $546
line 2043
;2041:
;2042:	
;2043:	t = cg.DeathBlendTime - cg.time;
ADDRLP4 16
ADDRGP4 cg+171488
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 2045
;2044:
;2045:	hcolor[0] = 0.0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2046
;2046:	hcolor[1] = 0.0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 2047
;2047:	hcolor[2] = 0.0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2048
;2048:	hcolor[3] = ( (float)t / 1000 );
ADDRLP4 0+12
ADDRLP4 16
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
line 2050
;2049:
;2050:	if ( hcolor[3] > 1.0f) {
ADDRLP4 0+12
INDIRF4
CNSTF4 1065353216
LEF4 $554
line 2051
;2051:		hcolor[3] = 1.0;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 2052
;2052:	}
LABELV $554
line 2054
;2053:
;2054:	if ( hcolor[3] <= 0.0 || t <= 0 )
ADDRLP4 0+12
INDIRF4
CNSTF4 0
LEF4 $561
ADDRLP4 16
INDIRF4
CNSTF4 0
GTF4 $558
LABELV $561
line 2055
;2055:	{
line 2056
;2056:		cg.DeathBlendTime = 0; 
ADDRGP4 cg+171488
CNSTI4 0
ASGNI4
line 2057
;2057:		return;
ADDRGP4 $545
JUMPV
LABELV $558
line 2060
;2058:	}
;2059:
;2060: 	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2062
;2061:
;2062:}
LABELV $545
endproc CG_DrawDeathblend 24 20
proc CG_DrawSmokeblend 24 20
line 2071
;2063: /*
;2064:==================
;2065:CG_DrawSmokeblend
;2066:
;2067:draws a blend-out effect from the smoke grenades
;2068:==================
;2069:*/
;2070:static void CG_DrawSmokeblend( void )
;2071:{
line 2074
;2072:	vec4_t hcolor;
;2073:
;2074:	if ( cg.smokeBlendAlpha <= 0.0f )
ADDRGP4 cg+202000
INDIRF4
CNSTF4 0
GTF4 $564
line 2075
;2075:		return;
ADDRGP4 $563
JUMPV
LABELV $564
line 2077
;2076:
;2077:	switch (cgs.camoType) {
ADDRLP4 16
ADDRGP4 cgs+214196
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $567
ADDRLP4 16
INDIRI4
CNSTI4 4
GTI4 $567
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $582-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $582
address $576
address $579
address $573
address $570
code
LABELV $570
line 2079
;2078:		case CAMO_URBAN:
;2079:			hcolor[0] = SEALS_SMOKENADE_R_URBAN;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 2080
;2080:			hcolor[1] = SEALS_SMOKENADE_G_URBAN;
ADDRLP4 0+4
CNSTF4 1050589266
ASGNF4
line 2081
;2081:			hcolor[2] = SEALS_SMOKENADE_B_URBAN;
ADDRLP4 0+8
CNSTF4 1058306785
ASGNF4
line 2082
;2082:			break;
ADDRGP4 $568
JUMPV
LABELV $573
line 2084
;2083:		case CAMO_ARCTIC:
;2084:			hcolor[0] = SEALS_SMOKENADE_R_ARCTIC;
ADDRLP4 0
CNSTF4 1060320051
ASGNF4
line 2085
;2085:			hcolor[1] = SEALS_SMOKENADE_G_ARCTIC;
ADDRLP4 0+4
CNSTF4 1064346583
ASGNF4
line 2086
;2086:			hcolor[2] = SEALS_SMOKENADE_B_ARCTIC;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2087
;2087:			break;
ADDRGP4 $568
JUMPV
LABELV $576
line 2089
;2088:		case CAMO_DESERT:
;2089:			hcolor[0] = SEALS_SMOKENADE_R_DESERT;
ADDRLP4 0
CNSTF4 1062333317
ASGNF4
line 2090
;2090:			hcolor[1] = SEALS_SMOKENADE_G_DESERT;
ADDRLP4 0+4
CNSTF4 1060655596
ASGNF4
line 2091
;2091:			hcolor[2] = SEALS_SMOKENADE_B_DESERT;
ADDRLP4 0+8
CNSTF4 1055957975
ASGNF4
line 2092
;2092:			break;
ADDRGP4 $568
JUMPV
LABELV $579
LABELV $567
line 2095
;2093:		case CAMO_JUNGLE:
;2094:		default:
;2095:			hcolor[0] = SEALS_SMOKENADE_R_JUNGLE;
ADDRLP4 0
CNSTF4 1059648963
ASGNF4
line 2096
;2096:			hcolor[1] = SEALS_SMOKENADE_G_JUNGLE;
ADDRLP4 0+4
CNSTF4 1062668861
ASGNF4
line 2097
;2097:			hcolor[2] = SEALS_SMOKENADE_B_JUNGLE;
ADDRLP4 0+8
CNSTF4 1050589266
ASGNF4
line 2098
;2098:			break;
LABELV $568
line 2100
;2099:	}
;2100:	hcolor[3] = cg.smokeBlendAlpha;
ADDRLP4 0+12
ADDRGP4 cg+202000
INDIRF4
ASGNF4
line 2102
;2101:
;2102: 	CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2103
;2103:}
LABELV $563
endproc CG_DrawSmokeblend 24 20
proc CG_DrawBlend 28 20
line 2113
;2104: 
;2105: /*
;2106:=================
;2107:CG_DrawBlend
;2108:=================
;2109:*/
;2110:#define BLEND_START_FADE_TIME	100
;2111:#define BLEND_FADE_TIME			200
;2112:
;2113:static void CG_DrawBlend ( void ) { 
line 2116
;2114:	float	hcolor[4]; 
;2115:  
;2116:	if ( cg.savedblendAlpha > 0.0f && cg.blendAlpha == 0.0f )
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRGP4 cg+117892
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $587
ADDRGP4 cg+117888
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $587
line 2117
;2117:	{
line 2120
;2118:		float a;
;2119:
;2120:		if ( cg.blendFadeTime <= 0 )
ADDRGP4 cg+117896
INDIRI4
CNSTI4 0
GTI4 $591
line 2121
;2121:			cg.blendFadeTime = cg.time + BLEND_START_FADE_TIME;
ADDRGP4 cg+117896
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
LABELV $591
line 2123
;2122:
;2123:		if ( cg.time > cg.blendFadeTime )
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117896
INDIRI4
LEI4 $596
line 2124
;2124:		{
line 2125
;2125:			a = cg.time - cg.blendFadeTime;
ADDRLP4 20
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117896
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 2127
;2126:			
;2127:			hcolor[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2128
;2128:			hcolor[1] = 1.0f;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2129
;2129:			hcolor[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2130
;2130:			hcolor[3] = cg.savedblendAlpha - ( a / BLEND_FADE_TIME );
ADDRLP4 0+12
ADDRGP4 cg+117892
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 2132
;2131:
;2132:			if ( hcolor[3] > 1.0f)
ADDRLP4 0+12
INDIRF4
CNSTF4 1065353216
LEF4 $606
line 2133
;2133:				hcolor[3] = 1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
LABELV $606
line 2134
;2134:			if ( hcolor[3] < 0.0f)
ADDRLP4 0+12
INDIRF4
CNSTF4 0
GEF4 $610
line 2135
;2135:			{
line 2136
;2136:				hcolor[3] = 0.0f;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2137
;2137:				cg.savedblendAlpha = 0.0f;
ADDRGP4 cg+117892
CNSTF4 0
ASGNF4
line 2138
;2138:				cg.blendFadeTime = 0;
ADDRGP4 cg+117896
CNSTI4 0
ASGNI4
line 2139
;2139:			}
LABELV $610
line 2141
;2140:
;2141:	 		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2142
;2142:		}
ADDRGP4 $588
JUMPV
LABELV $596
line 2144
;2143:		else
;2144:		{
line 2146
;2145:
;2146:			hcolor[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2147
;2147:			hcolor[1] = 1.0f;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2148
;2148:			hcolor[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2149
;2149:			hcolor[3] = cg.savedblendAlpha;
ADDRLP4 0+12
ADDRGP4 cg+117892
INDIRF4
ASGNF4
line 2151
;2150:
;2151:			if ( hcolor[3] > 1.0f)
ADDRLP4 0+12
INDIRF4
CNSTF4 1065353216
LEF4 $620
line 2152
;2152:				hcolor[3] = 1.0;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
LABELV $620
line 2154
;2153:
;2154: 			CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2155
;2155:		}
line 2156
;2156:	}
ADDRGP4 $588
JUMPV
LABELV $587
line 2157
;2157:	else if ( cg.blendAlpha <= 0.0f )
ADDRGP4 cg+117888
INDIRF4
CNSTF4 0
GTF4 $624
line 2158
;2158:		return;
ADDRGP4 $586
JUMPV
LABELV $624
line 2160
;2159:	else
;2160:	{
line 2161
;2161:		hcolor[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2162
;2162:		hcolor[1] = 1.0f;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2163
;2163:		hcolor[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2164
;2164:		hcolor[3] = cg.blendAlpha;
ADDRLP4 0+12
ADDRGP4 cg+117888
INDIRF4
ASGNF4
line 2166
;2165:
;2166:		if ( hcolor[3] > 1.0f) {
ADDRLP4 0+12
INDIRF4
CNSTF4 1065353216
LEF4 $631
line 2167
;2167:			hcolor[3] = 1.0;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 2168
;2168:		}
LABELV $631
line 2170
;2169:
;2170: 		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2171
;2171:	}
LABELV $588
line 2173
;2172:
;2173:	if ( cg.blendAlpha > 0.0f )
ADDRGP4 cg+117888
INDIRF4
CNSTF4 0
LEF4 $635
line 2174
;2174:		cg.savedblendAlpha = cg.blendAlpha;
ADDRGP4 cg+117892
ADDRGP4 cg+117888
INDIRF4
ASGNF4
LABELV $635
line 2175
;2175:	cg.blendAlpha = 0.0f;  
ADDRGP4 cg+117888
CNSTF4 0
ASGNF4
line 2176
;2176:}
LABELV $586
endproc CG_DrawBlend 28 20
proc CG_DrawC4 40 20
line 2183
;2177:
;2178:/*
;2179:=================
;2180:CG_DrawC4
;2181:=================
;2182:*/
;2183:static void CG_DrawC4( void ) {
line 2189
;2184:	int y,x;
;2185:	int width,height;
;2186://	int i = 0;
;2187:	float color[4]; 
;2188:
;2189:	if ( cg.snap->ps.pm_flags & PMF_BOMBCASE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $642
line 2190
;2190:		return;
ADDRGP4 $641
JUMPV
LABELV $642
line 2191
;2191:	if ( cg.snap->ps.weapon != WP_C4 || cg.snap->ps.weaponstate != WEAPON_FIRING)
ADDRLP4 32
CNSTI4 3
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $649
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $645
LABELV $649
line 2192
;2192:		return;
ADDRGP4 $641
JUMPV
LABELV $645
line 2195
;2193:	
;2194:	// only draw if we don't have the anims visible
;2195:	if ( cg_drawGun.integer )
ADDRGP4 cg_drawGun+12
INDIRI4
CNSTI4 0
EQI4 $650
line 2196
;2196:		return;
ADDRGP4 $641
JUMPV
LABELV $650
line 2198
;2197:
;2198:	if ( cg.snap->ps.weaponTime < 1 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
GEI4 $653
line 2199
;2199:		return;
ADDRGP4 $641
JUMPV
LABELV $653
line 2202
;2200:
;2201:	// set color
;2202:	color[0] = 0.0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2203
;2203:	color[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2204
;2204:	color[2] = 0.0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2206
;2205:	// set alpha
;2206:	color[3] = 0.7f;
ADDRLP4 0+12
CNSTF4 1060320051
ASGNF4
line 2208
;2207:
;2208:	x = 155;
ADDRLP4 20
CNSTI4 155
ASGNI4
line 2209
;2209:	y = 201;
ADDRLP4 16
CNSTI4 201
ASGNI4
line 2210
;2210:	width = 342;
ADDRLP4 24
CNSTI4 342
ASGNI4
line 2211
;2211:	height = 44;
ADDRLP4 28
CNSTI4 44
ASGNI4
line 2213
;2212:
;2213:	CG_FillRect( x , y , width, height, color );
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2215
;2214:
;2215:	color[0] = color[1] = color[2] = 0;
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
line 2217
;2216:
;2217:	x = 160;
ADDRLP4 20
CNSTI4 160
ASGNI4
line 2218
;2218:	y = 206;
ADDRLP4 16
CNSTI4 206
ASGNI4
line 2219
;2219:	width = 330;
ADDRLP4 24
CNSTI4 330
ASGNI4
line 2220
;2220:	height = 34;
ADDRLP4 28
CNSTI4 34
ASGNI4
line 2222
;2221:
;2222:	CG_FillRect( x , y , width, height, color );
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2225
;2223:
;2224:	// set color
;2225:	color[0] = 0.0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2226
;2226:	color[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2227
;2227:	color[2] = 0.0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2233
;2228:	// set alpha
;2229://	color[3] = 1;
;2230:
;2231://	CG_Printf("weapontime: %i\n", cg.snap->ps.weaponTime );
;2232:
;2233:	x = 170;
ADDRLP4 20
CNSTI4 170
ASGNI4
line 2234
;2234:	y = 211;
ADDRLP4 16
CNSTI4 211
ASGNI4
line 2235
;2235:	width = 1 + (int)( 310 -  ( cg.snap->ps.weaponTime / 13.73 ) );
ADDRLP4 24
CNSTF4 1134231552
ADDRGP4 cg+36
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1096527380
DIVF4
SUBF4
CVFI4 4
CNSTI4 1
ADDI4
ASGNI4
line 2236
;2236:	height = 23;
ADDRLP4 28
CNSTI4 23
ASGNI4
line 2238
;2237:
;2238:	CG_FillRect( x , y , width, height, color );
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 2240
;2239: 
;2240:}
LABELV $641
endproc CG_DrawC4 40 20
lit
align 4
LABELV $665
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1061158912
code
proc CG_MissionInformation 72 32
line 2258
;2241:/*
;2242:==================
;2243:CG_DrawMissionInformation
;2244:
;2245:[ ] [ ] [ ]
;2246:
;2247: [       ]
;2248: [       ]
;2249: [       ]
;2250: 640 - 80 / 3
;2251:==================
;2252:*/
;2253:int CG_ButtonPushed( int button );
;2254:extern char SealBriefing[ 128 ][ 128 ]; // max chars per line
;2255:extern int	sealBriefingLines;
;2256:extern char TangoBriefing[ 128 ][ 128 ]; // max chars per line
;2257:extern int	tangoBriefingLines;
;2258:static void CG_MissionInformation( void ) {
line 2262
;2259:	int x;
;2260:	int y;
;2261:	int	value;
;2262:	vec4_t color = { 1.0f,1.0f,1.0f,0.75f };
ADDRLP4 16
ADDRGP4 $665
INDIRB
ASGNB 16
line 2263
;2263:	float	fontsize = .23f;
ADDRLP4 8
CNSTF4 1047233823
ASGNF4
line 2264
;2264:	qhandle_t	backPic = trap_R_RegisterShaderNoMip( "ui/assets/missioninfo_bg1" );
ADDRGP4 $666
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 2265
;2265:	if ( !cg.viewMissionInfo )
ADDRGP4 cg+171504
INDIRI4
CNSTI4 0
NEI4 $667
line 2266
;2266:		return;
ADDRGP4 $664
JUMPV
LABELV $667
line 2268
;2267: 
;2268:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED || 
ADDRLP4 40
CNSTI4 304
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $674
ADDRGP4 cg+36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $670
LABELV $674
line 2270
;2269:		cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
;2270:		backPic = trap_R_RegisterShaderNoMip( "ui/assets/missioninfo_bg2" );
ADDRGP4 $675
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $670
line 2272
;2271:
;2272:	if ( CG_ButtonPushed( BUTTON_USE ) )
CNSTI4 4
ARGI4
ADDRLP4 48
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $676
line 2273
;2273:	{
line 2274
;2274:		cg.viewMissionInfo = 0;
ADDRGP4 cg+171504
CNSTI4 0
ASGNI4
line 2275
;2275:		return;
ADDRGP4 $664
JUMPV
LABELV $676
line 2278
;2276:	}  
;2277:
;2278:	CG_DrawPic( 0,0,640,480, backPic );
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2280
;2279:
;2280:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $679
line 2281
;2281:	{
line 2282
;2282:		x = 320 - CG_Text_Width("Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0.4f, 99 )/2;
ADDRGP4 $682
ARGP4
CNSTF4 1053609165
ARGF4
CNSTI4 99
ARGI4
ADDRLP4 56
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 12
CNSTI4 320
ADDRLP4 56
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 2283
;2283:		CG_Text_Paint( x,480-10-CG_Text_Height("Press Spaced",0.4f,0 ),0.4f, colorWhite, "Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0,0,ITEM_TEXTSTYLE_OUTLINED );
ADDRGP4 $683
ARGP4
CNSTF4 1053609165
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 60
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
CNSTI4 470
ADDRLP4 60
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1053609165
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $682
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2285
;2284:	
;2285:		x = 64;
ADDRLP4 12
CNSTI4 64
ASGNI4
line 2286
;2286:		y = 120; 
ADDRLP4 4
CNSTI4 120
ASGNI4
line 2287
;2287:		if ( sealBriefingLines > 0 ) { 
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 0
LEI4 $684
line 2289
;2288:
;2289:			for ( value = 0; value <= sealBriefingLines*2; value ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $689
JUMPV
LABELV $686
line 2290
;2290:			{
line 2291
;2291:				CG_Text_Paint( x,y, fontsize, color, SealBriefing[value], 0,0,0);//ITEM_TEXTSTYLE_SHADOWED);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2292
;2292:				y += CG_Text_Height( SealBriefing[value], fontsize, 0 ) + 2;
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 2293
;2293:			}	
LABELV $687
line 2289
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $689
ADDRLP4 0
INDIRI4
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 1
LSHI4
LEI4 $686
line 2294
;2294:		}
LABELV $684
line 2296
;2295:
;2296:		if ( cgs.infoPicLeft )
ADDRGP4 cgs+610660
INDIRI4
CNSTI4 0
EQI4 $690
line 2297
;2297:			CG_DrawPic( 416,40, 160, 120,cgs.infoPicLeft );
CNSTF4 1137704960
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610660
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $690
line 2298
;2298:		if ( cgs.infoPicMiddle )
ADDRGP4 cgs+610664
INDIRI4
CNSTI4 0
EQI4 $694
line 2299
;2299:			CG_DrawPic( 416,172, 160, 120,cgs.infoPicMiddle );
CNSTF4 1137704960
ARGF4
CNSTF4 1126957056
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610664
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $694
line 2300
;2300:		if ( cgs.infoPicRight )
ADDRGP4 cgs+610668
INDIRI4
CNSTI4 0
EQI4 $680
line 2301
;2301:			CG_DrawPic( 416,304, 160, 120,cgs.infoPicRight );
CNSTF4 1137704960
ARGF4
CNSTF4 1134034944
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610668
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2302
;2302:	}
ADDRGP4 $680
JUMPV
LABELV $679
line 2303
;2303:	else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $702
line 2304
;2304:	{
line 2305
;2305:		x = 320 - CG_Text_Width("Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0.4f, 99 )/2;
ADDRGP4 $682
ARGP4
CNSTF4 1053609165
ARGF4
CNSTI4 99
ARGI4
ADDRLP4 56
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 12
CNSTI4 320
ADDRLP4 56
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 2306
;2306:		CG_Text_Paint( x,480-10-CG_Text_Height("Press Spaced",0.4f,0 ),0.4f, colorWhite, "Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0,0,ITEM_TEXTSTYLE_OUTLINED );
ADDRGP4 $683
ARGP4
CNSTF4 1053609165
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 60
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
CNSTI4 470
ADDRLP4 60
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1053609165
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $682
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2308
;2307:
;2308:		x = 64;
ADDRLP4 12
CNSTI4 64
ASGNI4
line 2309
;2309:		y = 120;   
ADDRLP4 4
CNSTI4 120
ASGNI4
line 2310
;2310:		if ( tangoBriefingLines > 0 ) { 
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 0
LEI4 $705
line 2312
;2311:
;2312:			for ( value = 0; value <= tangoBriefingLines*2; value ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $710
JUMPV
LABELV $707
line 2313
;2313:			{
line 2314
;2314:				CG_Text_Paint( x,y, fontsize, color, TangoBriefing[value], 0,0,0);//ITEM_TEXTSTYLE_SHADOWED);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2315
;2315:				y += CG_Text_Height( TangoBriefing[value], fontsize, 0 ) + 2 ;
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 2316
;2316:			}	
LABELV $708
line 2312
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $710
ADDRLP4 0
INDIRI4
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 1
LSHI4
LEI4 $707
line 2317
;2317:		}
LABELV $705
line 2319
;2318:
;2319:		if ( cgs.infoPicLeft )
ADDRGP4 cgs+610660
INDIRI4
CNSTI4 0
EQI4 $711
line 2320
;2320:			CG_DrawPic( 416,40, 160, 120,cgs.infoPicLeft );
CNSTF4 1137704960
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610660
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $711
line 2321
;2321:		if ( cgs.infoPicMiddle )
ADDRGP4 cgs+610664
INDIRI4
CNSTI4 0
EQI4 $715
line 2322
;2322:			CG_DrawPic( 416,172, 160, 120,cgs.infoPicMiddle );
CNSTF4 1137704960
ARGF4
CNSTF4 1126957056
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610664
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $715
line 2323
;2323:		if ( cgs.infoPicRight )
ADDRGP4 cgs+610668
INDIRI4
CNSTI4 0
EQI4 $703
line 2324
;2324:			CG_DrawPic( 416,304, 160, 120,cgs.infoPicRight );
CNSTF4 1137704960
ARGF4
CNSTF4 1134034944
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610668
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2325
;2325:	}
ADDRGP4 $703
JUMPV
LABELV $702
line 2327
;2326:	else
;2327:	{
line 2328
;2328:		x = 320 - CG_Text_Width("Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0.4f, 99 )/2;
ADDRGP4 $682
ARGP4
CNSTF4 1053609165
ARGF4
CNSTI4 99
ARGI4
ADDRLP4 56
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 12
CNSTI4 320
ADDRLP4 56
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 2330
;2329:
;2330:		CG_Text_Paint( x,480-10-CG_Text_Height("Press Spaced",0.4f,0 ),0.4f, colorWhite, "Press "S_COLOR_RED"Use"S_COLOR_WHITE" To Close", 0,0,ITEM_TEXTSTYLE_OUTLINED );
ADDRGP4 $683
ARGP4
CNSTF4 1053609165
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 60
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
CNSTI4 470
ADDRLP4 60
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1053609165
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $682
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2332
;2331:
;2332:		x = 48;
ADDRLP4 12
CNSTI4 48
ASGNI4
line 2333
;2333:		y = 204;   
ADDRLP4 4
CNSTI4 204
ASGNI4
line 2334
;2334:		if ( sealBriefingLines > 0 ) { 
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 0
LEI4 $723
line 2336
;2335:
;2336:			for ( value = 0; value <= sealBriefingLines*2; value ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $728
JUMPV
LABELV $725
line 2337
;2337:			{
line 2338
;2338:				CG_Text_Paint( x,y, fontsize, color, SealBriefing[value], 0,0,0);//ITEM_TEXTSTYLE_SHADOWED);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2339
;2339:				y += CG_Text_Height( SealBriefing[value], fontsize, 0 ) + 2;
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 2340
;2340:			}	
LABELV $726
line 2336
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $728
ADDRLP4 0
INDIRI4
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 1
LSHI4
LEI4 $725
line 2341
;2341:		}
LABELV $723
line 2343
;2342:
;2343:		x = 316;
ADDRLP4 12
CNSTI4 316
ASGNI4
line 2344
;2344:		y = 204;
ADDRLP4 4
CNSTI4 204
ASGNI4
line 2345
;2345:		if ( tangoBriefingLines > 0 ) { 
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 0
LEI4 $729
line 2347
;2346:
;2347:			for ( value = 0; value <= tangoBriefingLines*2; value ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $734
JUMPV
LABELV $731
line 2348
;2348:			{
line 2349
;2349:				CG_Text_Paint( x,y, fontsize, color, TangoBriefing[value], 0,0,0);//ITEM_TEXTSTYLE_SHADOWED);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2350
;2350:				y += CG_Text_Height( TangoBriefing[value], fontsize, 0 ) + 2 ;
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 2351
;2351:			}	
LABELV $732
line 2347
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $734
ADDRLP4 0
INDIRI4
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 1
LSHI4
LEI4 $731
line 2352
;2352:		}
LABELV $729
line 2355
;2353:
;2354:		
;2355:		if ( cgs.infoPicLeft )
ADDRGP4 cgs+610660
INDIRI4
CNSTI4 0
EQI4 $735
line 2356
;2356:			CG_DrawPic( 48,40, 160, 120,cgs.infoPicLeft );
CNSTF4 1111490560
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610660
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $735
line 2357
;2357:		if ( cgs.infoPicMiddle )
ADDRGP4 cgs+610664
INDIRI4
CNSTI4 0
EQI4 $739
line 2358
;2358:			CG_DrawPic( 240,40, 160, 120,cgs.infoPicMiddle );
CNSTF4 1131413504
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610664
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $739
line 2359
;2359:		if ( cgs.infoPicRight )
ADDRGP4 cgs+610668
INDIRI4
CNSTI4 0
EQI4 $743
line 2360
;2360:			CG_DrawPic( 432,40, 160, 120,cgs.infoPicRight );
CNSTF4 1138229248
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1123024896
ARGF4
ADDRGP4 cgs+610668
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $743
line 2361
;2361:	}
LABELV $703
LABELV $680
line 2363
;2362:
;2363:}
LABELV $664
endproc CG_MissionInformation 72 32
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 2545
;2364:#if 0
;2365:/*
;2366:=================
;2367:CG_DrawMenu
;2368:=================
;2369:*/
;2370:static void CG_DrawMenu( void ) {
;2371:	int y = 104 + BIGCHAR_HEIGHT + 4;
;2372:	int x = 22;
;2373:	int i = 0;
;2374:	float color[4]; 
;2375:
;2376:	if (cg.inMenu != qtrue)
;2377:		return; 
;2378: 
;2379:
;2380:	// set color
;2381:	color[0] = 0.0;
;2382:	color[1] = 0.0;
;2383:	color[2] = 0.0;
;2384:	// set alpha
;2385:	color[3] = 0.30f;
;2386:	// btw, it's a nice blue  =) 
;2387:	CG_FillRect( x, 100+((BIGCHAR_HEIGHT+4)*2) -30, BIGCHAR_WIDTH * 21 + 6, ( ( BIGCHAR_HEIGHT + 4) * 14)+4, color ); 
;2388:
;2389:	CG_DrawPic(0, 78, 380, 32, cgs.media.ingameMenuTopShader );
;2390:	CG_DrawPic(0, 393, 380, 32, cgs.media.ingameMenuBottomShader );
;2391:
;2392:	for (i = 1; i < 15; i++)
;2393:	{
;2394:		y += BIGCHAR_HEIGHT + 4;
;2395:
;2396:		if (i == 14)
;2397:		{
;2398:			CG_DrawStringExt2( 26,y -30, "-[ by Team-Mirage ]-----------------------", i_Menu[i].l_color, qfalse, qtrue, 8,16,0 );
;2399:			return;
;2400:		}
;2401:
;2402:		if (strlen( i_Menu[i].Line ) == 0)
;2403:			continue;
;2404:
;2405:		// set color
;2406:		trap_R_SetColor( i_Menu[i].l_color ); 
;2407:		
;2408:		//CG_DrawStringOutline( 26,y -30, i_Menu[i].Line, i_Menu[i].l_color );
;2409:		CG_DrawStringExt2( 26, y-30, i_Menu[i].Line, i_Menu[i].l_color, qfalse, qtrue, 8,16,0);
;2410:		
;2411:		//CG_DrawStringExt( 8, y, i_Menu[i].Line , i_Menu[i].l_color, qtrue, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
;2412:		
;2413:		// remove color
;2414:		trap_R_SetColor ( NULL );
;2415:	}
;2416:
;2417:}
;2418:#endif
;2419:#ifndef MISSIONPACK
;2420:
;2421:/*
;2422:=====================
;2423:CG_DrawLowerLeft
;2424:
;2425:=====================
;2426:*/
;2427:
;2428:static void CG_DrawLowerLeft( void ) {
;2429:	float	y;
;2430:
;2431:	y = 480 - ICON_SIZE;
;2432:
;2433:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 3 ) {
;2434:		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
;2435:	} 
;2436:
;2437:
;2438:	y = CG_DrawPickupItem( y );
;2439:}
;2440:#endif
;2441:
;2442://===========================================================================================
;2443:#if 0
;2444:/*
;2445:===================
;2446:CG_DrawReward
;2447:===================
;2448:*/
;2449:static void CG_DrawReward( void ) { 
;2450:	float	*color;
;2451:	int		i, count;
;2452:	float	x, y;
;2453:	char	buf[32];
;2454:
;2455:	if ( !cg_drawRewards.integer ) {
;2456:		return;
;2457:	}
;2458:
;2459:	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
;2460:	if ( !color ) {
;2461:		if (cg.rewardStack > 0) {
;2462:			for(i = 0; i < cg.rewardStack; i++) {
;2463:				cg.rewardSound[i] = cg.rewardSound[i+1];
;2464:				cg.rewardShader[i] = cg.rewardShader[i+1];
;2465:				cg.rewardCount[i] = cg.rewardCount[i+1];
;2466:			}
;2467:			cg.rewardTime = cg.time;
;2468:			cg.rewardStack--;
;2469:			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
;2470:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
;2471:		} else {
;2472:			return;
;2473:		}
;2474:	}
;2475:
;2476:	trap_R_SetColor( color );
;2477:
;2478:	/*
;2479:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;2480:
;2481:	if (count) {
;2482:		y = 4;
;2483:		x = 320 - count * ICON_SIZE;
;2484:		for ( i = 0 ; i < count ; i++ ) {
;2485:			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;2486:			x += (ICON_SIZE*2);
;2487:		}
;2488:	}
;2489:
;2490:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;2491:	*/
;2492:
;2493:	if ( cg.rewardCount[0] >= 10 ) {
;2494:		y = 56;
;2495:		x = 320 - ICON_SIZE/2;
;2496:		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
;2497:		Com_sprintf(buf, sizeof(buf), "%d", cg.rewardCount[0]);
;2498:		x = ( SCREEN_WIDTH - SMALLCHAR_WIDTH * CG_DrawStrlen( buf ) ) / 2;
;2499:		CG_DrawStringExt( x, y+ICON_SIZE, buf, color, qfalse, qtrue,
;2500:								SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
;2501:	}
;2502:	else {
;2503:
;2504:		count = cg.rewardCount[0];
;2505:
;2506:		y = 56;
;2507:		x = 320 - count * ICON_SIZE/2;
;2508:		for ( i = 0 ; i < count ; i++ ) {
;2509:			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
;2510:			x += ICON_SIZE;
;2511:		}
;2512:	}
;2513:	trap_R_SetColor( NULL );
;2514:}
;2515:#endif
;2516:
;2517:/*
;2518:===============================================================================
;2519:
;2520:LAGOMETER
;2521:
;2522:===============================================================================
;2523:*/
;2524:
;2525:#define	LAG_SAMPLES		128
;2526:
;2527:
;2528:typedef struct {
;2529:	int		frameSamples[LAG_SAMPLES];
;2530:	int		frameCount;
;2531:	int		snapshotFlags[LAG_SAMPLES];
;2532:	int		snapshotSamples[LAG_SAMPLES];
;2533:	int		snapshotCount;
;2534:} lagometer_t;
;2535:
;2536:lagometer_t		lagometer;
;2537:
;2538:/*
;2539:==============
;2540:CG_AddLagometerFrameInfo
;2541:
;2542:Adds the current interpolate / extrapolate bar for this frame
;2543:==============
;2544:*/
;2545:void CG_AddLagometerFrameInfo( void ) {
line 2548
;2546:	int			offset;
;2547:
;2548:	offset = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 2549
;2549:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2550
;2550:	lagometer.frameCount++;
ADDRLP4 4
ADDRGP4 lagometer+512
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2551
;2551:}
LABELV $748
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 2563
;2552:
;2553:/*
;2554:==============
;2555:CG_AddLagometerSnapshotInfo
;2556:
;2557:Each time a snapshot is received, log its ping time and
;2558:the number of snapshots that were dropped before it.
;2559:
;2560:Pass NULL for a dropped packet.
;2561:==============
;2562:*/
;2563:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
line 2565
;2564:	// dropped packet
;2565:	if ( !snap ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $754
line 2566
;2566:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
CNSTI4 -1
ASGNI4
line 2567
;2567:		lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2568
;2568:		return;
ADDRGP4 $753
JUMPV
LABELV $754
line 2572
;2569:	}
;2570:
;2571:	// add this snapshot's info
;2572:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2573
;2573:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2574
;2574:	lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2575
;2575:}
LABELV $753
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 64 20
line 2584
;2576:
;2577:/*
;2578:==============
;2579:CG_DrawDisconnect
;2580:
;2581:Should we draw something differnet for long lag vs no packets?
;2582:==============
;2583:*/
;2584:static void CG_DrawDisconnect( void ) {
line 2592
;2585:	float		x, y;
;2586:	int			cmdNum;
;2587:	usercmd_t	cmd;
;2588:	const char		*s;
;2589:	int			w;
;2590:
;2591:	// draw the phone jack if we are completely past our buffers
;2592:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
ADDRLP4 44
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 44
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2593
;2593:	trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 2594
;2594:	if ( cmd.serverTime <= cg.snap->ps.commandTime
ADDRLP4 48
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $769
ADDRLP4 48
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $765
LABELV $769
line 2595
;2595:		|| cmd.serverTime > cg.time ) {	// special check for map_restart
line 2596
;2596:		return;
ADDRGP4 $764
JUMPV
LABELV $765
line 2600
;2597:	}
;2598:
;2599:	// also add text in center of screen
;2600:	s = "Connection Interrupted";
ADDRLP4 24
ADDRGP4 $770
ASGNP4
line 2601
;2601:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 52
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2602
;2602:	CG_DrawBigString( 320 - w/2, 100, s, 1.0F);
CNSTI4 320
ADDRLP4 40
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2605
;2603:
;2604:	// blink the icon
;2605:	if ( ( cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $771
line 2606
;2606:		return;
ADDRGP4 $764
JUMPV
LABELV $771
line 2609
;2607:	}
;2608:
;2609:	x = 640 - 48;
ADDRLP4 28
CNSTF4 1142161408
ASGNF4
line 2610
;2610:	y = 480 - 48;
ADDRLP4 32
CNSTF4 1138229248
ASGNF4
line 2612
;2611:
;2612:	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader("gfx/2d/net.tga" ) );
ADDRGP4 $774
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 1111490560
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2613
;2613:}
LABELV $764
endproc CG_DrawDisconnect 64 20
proc CG_DrawLagometer 68 36
line 2624
;2614:
;2615:
;2616:#define	MAX_LAGOMETER_PING	900
;2617:#define	MAX_LAGOMETER_RANGE	300
;2618:
;2619:/*
;2620:==============
;2621:CG_DrawLagometer
;2622:==============
;2623:*/
;2624:static void CG_DrawLagometer( void ) {
line 2631
;2625:	int		a, x, y, i;
;2626:	float	v;
;2627:	float	ax, ay, aw, ah, mid, range;
;2628:	int		color;
;2629:	float	vscale;
;2630:
;2631:	if ( !cg_lagometer.integer || cgs.localServer ) {
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRGP4 cg_lagometer+12
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $780
ADDRGP4 cgs+31452
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $776
LABELV $780
line 2632
;2632:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 2633
;2633:		return;
ADDRGP4 $775
JUMPV
LABELV $776
line 2640
;2634:	}
;2635:
;2636:	//
;2637:	// draw the graph
;2638:	//
;2639:#ifdef MISSIONPACK
;2640:	x = 640 - 48;
ADDRLP4 44
CNSTI4 592
ASGNI4
line 2641
;2641:	y = 480 - 144;
ADDRLP4 48
CNSTI4 336
ASGNI4
line 2647
;2642:#else
;2643:	x = 640 - 48;
;2644:	y = 480 - 48;
;2645:#endif
;2646:
;2647:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2648
;2648:	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 48
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
CNSTF4 1111490560
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cgs+205084+96
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2650
;2649:
;2650:	ax = x;
ADDRLP4 24
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 2651
;2651:	ay = y;
ADDRLP4 36
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 2652
;2652:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 2653
;2653:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 2654
;2654:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2656
;2655:
;2656:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 2657
;2657:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 2658
;2658:	mid = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 2660
;2659:
;2660:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1133903872
DIVF4
ASGNF4
line 2663
;2661:
;2662:	// draw the frame interpoalte / extrapolate graph
;2663:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $786
JUMPV
LABELV $783
line 2664
;2664:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 2665
;2665:		v = lagometer.frameSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2666
;2666:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 2667
;2667:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $788
line 2668
;2668:			if ( color != 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $790
line 2669
;2669:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 2670
;2670:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2671
;2671:			}
LABELV $790
line 2672
;2672:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $793
line 2673
;2673:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2674
;2674:			}
LABELV $793
line 2675
;2675:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2676
;2676:		} else if ( v < 0 ) {
ADDRGP4 $789
JUMPV
LABELV $788
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $797
line 2677
;2677:			if ( color != 2 ) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $799
line 2678
;2678:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 2679
;2679:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2680
;2680:			}
LABELV $799
line 2681
;2681:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 2682
;2682:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $802
line 2683
;2683:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2684
;2684:			}
LABELV $802
line 2685
;2685:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2686
;2686:		}
LABELV $797
LABELV $789
line 2687
;2687:	}
LABELV $784
line 2663
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $786
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $783
line 2690
;2688:
;2689:	// draw the snapshot latency / drop graph
;2690:	range = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2691
;2691:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 2693
;2692:
;2693:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $809
JUMPV
LABELV $806
line 2694
;2694:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 2695
;2695:		v = lagometer.snapshotSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2696
;2696:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $812
line 2697
;2697:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $814
line 2698
;2698:				if ( color != 5 ) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $815
line 2699
;2699:					color = 5;	// YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 2700
;2700:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2701
;2701:				}
line 2702
;2702:			} else {
ADDRGP4 $815
JUMPV
LABELV $814
line 2703
;2703:				if ( color != 3 ) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $820
line 2704
;2704:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 2705
;2705:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2706
;2706:				}
LABELV $820
line 2707
;2707:			}
LABELV $815
line 2708
;2708:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 2709
;2709:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $823
line 2710
;2710:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2711
;2711:			}
LABELV $823
line 2712
;2712:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2713
;2713:		} else if ( v < 0 ) {
ADDRGP4 $813
JUMPV
LABELV $812
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $827
line 2714
;2714:			if ( color != 4 ) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $829
line 2715
;2715:				color = 4;		// RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 2716
;2716:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2717
;2717:			}
LABELV $829
line 2718
;2718:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2719
;2719:		}
LABELV $827
LABELV $813
line 2720
;2720:	}
LABELV $807
line 2693
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $809
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $806
line 2722
;2721:
;2722:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2724
;2723:
;2724:	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $838
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $834
LABELV $838
line 2725
;2725:		CG_DrawBigString( ax, ay, "snc", 1.0 );
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 $839
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2726
;2726:	}
LABELV $834
line 2728
;2727:
;2728:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 2729
;2729:}
LABELV $775
endproc CG_DrawLagometer 68 36
export CG_CenterPrint
proc CG_CenterPrint 8 12
line 2750
;2730:
;2731:
;2732:
;2733:/*
;2734:===============================================================================
;2735:
;2736:CENTER PRINTING
;2737:
;2738:===============================================================================
;2739:*/
;2740:
;2741:
;2742:/*
;2743:==============
;2744:CG_CenterPrint
;2745:
;2746:Called for important messages that should stay in the center of the screen
;2747:for a few moments
;2748:==============
;2749:*/
;2750:void CG_CenterPrint( const char *str, int y, int charWidth ) {
line 2753
;2751:	char	*s;
;2752:
;2753:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
ADDRGP4 cg+114004
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2755
;2754:
;2755:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+113992
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2756
;2756:	cg.centerPrintY = y;
ADDRGP4 cg+114000
ADDRFP4 4
INDIRI4
ASGNI4
line 2757
;2757:	cg.centerPrintCharWidth = 16;
ADDRGP4 cg+113996
CNSTI4 16
ASGNI4
line 2760
;2758:
;2759:	// count the number of lines for centering
;2760:	cg.centerPrintLines = 1;
ADDRGP4 cg+115028
CNSTI4 1
ASGNI4
line 2761
;2761:	s = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+114004
ASGNP4
ADDRGP4 $850
JUMPV
LABELV $849
line 2762
;2762:	while( *s ) {
line 2763
;2763:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $852
line 2764
;2764:			cg.centerPrintLines++;
ADDRLP4 4
ADDRGP4 cg+115028
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $852
line 2765
;2765:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2766
;2766:	}
LABELV $850
line 2762
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $849
line 2767
;2767:}
LABELV $840
endproc CG_CenterPrint 8 12
proc CG_DrawCenterString 1068 32
line 2775
;2768:
;2769:
;2770:/*
;2771:===================
;2772:CG_DrawCenterString
;2773:===================
;2774:*/
;2775:static void CG_DrawCenterString( void ) {
line 2781
;2776:	char	*start;
;2777:	int		l;
;2778:	int		x, y, w , h;
;2779:	float	*color;
;2780:
;2781:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+113992
INDIRI4
CNSTI4 0
NEI4 $856
line 2782
;2782:		return;
ADDRGP4 $855
JUMPV
LABELV $856
line 2785
;2783:	}
;2784:
;2785:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
ADDRGP4 cg+113992
INDIRI4
ARGI4
CNSTF4 1148846080
ADDRGP4 cg_centertime+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRLP4 28
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 2786
;2786:	if ( !color ) {
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $861
line 2787
;2787:		return;
ADDRGP4 $855
JUMPV
LABELV $861
line 2790
;2788:	}
;2789:
;2790:	trap_R_SetColor( color );
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2792
;2791:
;2792:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+114004
ASGNP4
line 2794
;2793:
;2794:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
ADDRLP4 12
ADDRGP4 cg+114000
INDIRI4
ADDRGP4 cg+115028
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $867
JUMPV
LABELV $866
line 2796
;2795:
;2796:	while ( 1 ) {
line 2799
;2797:		char linebuffer[1024];
;2798:
;2799:		for ( l = 0; l < 50; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $869
line 2800
;2800:			if ( !start[l] || start[l] == '\n' ) {
ADDRLP4 1056
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $875
ADDRLP4 1056
INDIRI4
CNSTI4 10
NEI4 $873
LABELV $875
line 2801
;2801:				break;
ADDRGP4 $871
JUMPV
LABELV $873
line 2803
;2802:			}
;2803:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 32
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 2804
;2804:		}
LABELV $870
line 2799
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $869
LABELV $871
line 2805
;2805:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 32
ADDP4
CNSTI1 0
ASGNI1
line 2808
;2806:
;2807:#ifdef MISSIONPACK
;2808:		w = CG_Text_Width(linebuffer, 0.5, 0);
ADDRLP4 32
ARGP4
CNSTF4 1056964608
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1056
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 1056
INDIRI4
ASGNI4
line 2809
;2809:		h = CG_Text_Height(linebuffer, 0.5, 0);
ADDRLP4 32
ARGP4
CNSTF4 1056964608
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1060
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1060
INDIRI4
ASGNI4
line 2810
;2810:		x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 16
CNSTI4 640
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 2811
;2811:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
CNSTF4 1056964608
ARGF4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2812
;2812:		y += h + 6;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 6
ADDI4
ADDI4
ASGNI4
ADDRGP4 $877
JUMPV
LABELV $876
line 2824
;2813:#else
;2814:		w = cg.centerPrintCharWidth * CG_DrawStrlen( linebuffer );
;2815:
;2816:		x = ( SCREEN_WIDTH - w ) / 2;
;2817:
;2818:		
;2819:		CG_DrawStringExt2( x, y, linebuffer, color, qfalse, qtrue,
;2820:			cg.centerPrintCharWidth, cg.centerPrintCharWidth, 0 );
;2821:
;2822:		y += cg.centerPrintCharWidth;
;2823:#endif
;2824:		while ( *start && ( *start != '\n' ) ) {
line 2825
;2825:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2826
;2826:		}
LABELV $877
line 2824
ADDRLP4 1064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $879
ADDRLP4 1064
INDIRI4
CNSTI4 10
NEI4 $876
LABELV $879
line 2827
;2827:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $880
line 2828
;2828:			break;
ADDRGP4 $868
JUMPV
LABELV $880
line 2830
;2829:		}
;2830:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2831
;2831:	}
LABELV $867
line 2796
ADDRGP4 $866
JUMPV
LABELV $868
line 2833
;2832:
;2833:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2834
;2834:}
LABELV $855
endproc CG_DrawCenterString 1068 32
export CG_NewbieMessage
proc CG_NewbieMessage 8 12
line 2857
;2835:
;2836:
;2837:
;2838:/*
;2839:===============================================================================
;2840:
;2841:NEWBEE HELP FUNCTIONS
;2842:
;2843:===============================================================================
;2844:*/
;2845:
;2846:extern	vmCvar_t	cg_newbeeHeight;
;2847:extern	vmCvar_t	cg_newbeeTime;
;2848:
;2849:/*
;2850:==============
;2851:CG_NewbieMessage
;2852:
;2853:Called for important messages that should stay in the center of the screen
;2854:for a few moments
;2855:==============
;2856:*/
;2857:void CG_NewbieMessage( const char *str, int y, float charHeight ) {
line 2860
;2858:	char	*s;
;2859:
;2860:	if ( cg_newbeeTime.integer <= 0 )
ADDRGP4 cg_newbeeTime+12
INDIRI4
CNSTI4 0
GTI4 $883
line 2861
;2861:		return;
ADDRGP4 $882
JUMPV
LABELV $883
line 2863
;2862:
;2863:	Q_strncpyz( cg.ns_newbiehelp.string, str, sizeof(cg.ns_newbiehelp.string) );
ADDRGP4 cg+116724+120
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2865
;2864:
;2865:	cg.ns_newbiehelp.stringTime = cg.time;
ADDRGP4 cg+116724+104
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2866
;2866:	cg.ns_newbiehelp.stringY = y;
ADDRGP4 cg+116724+116
ADDRFP4 4
INDIRI4
ASGNI4
line 2867
;2867:	cg.ns_newbiehelp.stringCharWidth = 16;
ADDRGP4 cg+116724+108
CNSTI4 16
ASGNI4
line 2869
;2868:
;2869:	if ( charHeight > 0 )
ADDRFP4 8
INDIRF4
CNSTF4 0
LEF4 $897
line 2870
;2870:		cg.ns_newbiehelp.stringCharHeight = charHeight;
ADDRGP4 cg+116724+112
ADDRFP4 8
INDIRF4
ASGNF4
ADDRGP4 $898
JUMPV
LABELV $897
line 2872
;2871:	else
;2872:		cg.ns_newbiehelp.stringCharHeight = 1.0f;
ADDRGP4 cg+116724+112
CNSTF4 1065353216
ASGNF4
LABELV $898
line 2874
;2873:
;2874:	trap_S_StartLocalSound( cgs.media.newbeeMsgSound, CHAN_AUTO );
ADDRGP4 cgs+205084+1312
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2877
;2875:
;2876:	// count the number of lines for centering
;2877:	cg.ns_newbiehelp.stringLines = 1;
ADDRGP4 cg+116724+1144
CNSTI4 1
ASGNI4
line 2878
;2878:	s = cg.ns_newbiehelp.string;
ADDRLP4 0
ADDRGP4 cg+116724+120
ASGNP4
ADDRGP4 $910
JUMPV
LABELV $909
line 2879
;2879:	while( *s ) {
line 2880
;2880:		if (  *s == '\n'  )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $912
line 2881
;2881:			cg.ns_newbiehelp.stringLines++;
ADDRLP4 4
ADDRGP4 cg+116724+1144
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $912
line 2882
;2882:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2883
;2883:	}
LABELV $910
line 2879
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $909
line 2884
;2884:}
LABELV $882
endproc CG_NewbieMessage 8 12
proc CG_DrawNewbieMessage 1072 32
line 2892
;2885:
;2886:
;2887:/*
;2888:===================
;2889:CG_DrawNewbieMessage
;2890:===================
;2891:*/
;2892:static void CG_DrawNewbieMessage( void ) {
line 2898
;2893:	char	*start;
;2894:	int		l;
;2895:	int		x, y, w , h;
;2896:	float	*color;
;2897:
;2898:	if ( !cg.ns_newbiehelp.stringTime ) {
ADDRGP4 cg+116724+104
INDIRI4
CNSTI4 0
NEI4 $917
line 2899
;2899:		return;
ADDRGP4 $916
JUMPV
LABELV $917
line 2902
;2900:	}
;2901:
;2902:	color = CG_FadeColor( cg.ns_newbiehelp.stringTime, 1000 * cg_newbeeTime.value );
ADDRGP4 cg+116724+104
INDIRI4
ARGI4
CNSTF4 1148846080
ADDRGP4 cg_newbeeTime+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRLP4 28
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 2903
;2903:	if ( !color ) {
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $924
line 2904
;2904:		return;
ADDRGP4 $916
JUMPV
LABELV $924
line 2907
;2905:	}
;2906:
;2907:	trap_R_SetColor( color );
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2909
;2908:
;2909:	start = cg.ns_newbiehelp.string;
ADDRLP4 0
ADDRGP4 cg+116724+120
ASGNP4
line 2911
;2910:
;2911:	y = cg.ns_newbiehelp.stringY - cg.ns_newbiehelp.stringLines * CG_Text_Height("A",cg.ns_newbiehelp.stringCharHeight,0) / 2;
ADDRGP4 $932
ARGP4
ADDRGP4 cg+116724+112
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 12
ADDRGP4 cg+116724+116
INDIRI4
ADDRGP4 cg+116724+1144
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $936
JUMPV
LABELV $935
line 2913
;2912:
;2913:	while ( 1 ) {
line 2916
;2914:		char linebuffer[1024];
;2915:
;2916:		for ( l = 0; l < 255; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $938
line 2917
;2917:			if ( !start[l] || start[l] == '\n'  ) {
ADDRLP4 1060
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $944
ADDRLP4 1060
INDIRI4
CNSTI4 10
NEI4 $942
LABELV $944
line 2918
;2918:				break;
ADDRGP4 $940
JUMPV
LABELV $942
line 2920
;2919:			} 
;2920:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 36
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 2921
;2921:		}
LABELV $939
line 2916
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 255
LTI4 $938
LABELV $940
line 2922
;2922:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 36
ADDP4
CNSTI1 0
ASGNI1
line 2924
;2923:
;2924: 		w = CG_Text_Width(linebuffer, cg.ns_newbiehelp.stringCharHeight, 0);
ADDRLP4 36
ARGP4
ADDRGP4 cg+116724+112
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1060
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 1060
INDIRI4
ASGNI4
line 2925
;2925:		h = CG_Text_Height(linebuffer, cg.ns_newbiehelp.stringCharHeight, 0);
ADDRLP4 36
ARGP4
ADDRGP4 cg+116724+112
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1064
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1064
INDIRI4
ASGNI4
line 2926
;2926:		x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 16
CNSTI4 640
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 2927
;2927:		CG_Text_Paint(x, y + h, cg.ns_newbiehelp.stringCharHeight, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cg+116724+112
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2928
;2928:		y += h + 6;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 6
ADDI4
ADDI4
ASGNI4
ADDRGP4 $952
JUMPV
LABELV $951
line 2931
;2929: 
;2930:		while	( *start && (*start != '\n') ) 
;2931:		{
line 2932
;2932:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2933
;2933:		}
LABELV $952
line 2930
ADDRLP4 1068
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $954
ADDRLP4 1068
INDIRI4
CNSTI4 10
NEI4 $951
LABELV $954
line 2934
;2934:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $955
line 2935
;2935:			break;
ADDRGP4 $937
JUMPV
LABELV $955
line 2937
;2936:		}
;2937:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2938
;2938:	}
LABELV $936
line 2913
ADDRGP4 $935
JUMPV
LABELV $937
line 2940
;2939:
;2940:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2941
;2941:}
LABELV $916
endproc CG_DrawNewbieMessage 1072 32
export CG_FillRect2
proc CG_FillRect2 4 36
line 2972
;2942:
;2943:/*
;2944:================================================================================
;2945:
;2946:CROSSHAIR
;2947:
;2948:================================================================================
;2949:*/
;2950:
;2951: 
;2952:#define CROSSHAIR_HOR_WIDTH	 3
;2953:#define CROSSHAIR_HOR_HEIGHT 1
;2954:
;2955:#define CROSSHAIR_VER_WIDTH (CROSSHAIR_HOR_HEIGHT)
;2956:#define CROSSHAIR_VER_HEIGHT (CROSSHAIR_HOR_WIDTH)
;2957: 
;2958:extern	vmCvar_t	cg_crosshair_r;
;2959:extern	vmCvar_t	cg_crosshair_g;
;2960:extern	vmCvar_t	cg_crosshair_b;
;2961:
;2962:// |---|
;2963:// |---| 
;2964:// const float *color 
;2965:/*
;2966:================
;2967:CG_FillRect
;2968:
;2969:Coordinates are 640*480 virtual values
;2970:=================
;2971:*/
;2972:void CG_FillRect2( float x, float y, float width, float height, const float *color ) {
line 2973
;2973:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2975
;2974: 
;2975:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );
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
line 2977
;2976:
;2977:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2978
;2978:}
LABELV $957
endproc CG_FillRect2 4 36
proc CG_DrawStaticCrosshair 84 20
line 2983
;2979:
;2980:extern vmCvar_t	cg_crosshairWidth;
;2981:
;2982:static void CG_DrawStaticCrosshair( int x, int y, int width, int height, const float *color)
;2983:{
line 2987
;2984:	int chw, chh, cvw, cvh;
;2985:
;2986:	// zooming? no crosshair...
;2987:	if ( BG_IsZooming( cg.snap->ps.stats[STAT_WEAPONMODE] ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $961
line 2988
;2988:		return;
ADDRGP4 $960
JUMPV
LABELV $961
line 2989
;2989:	if ( !cg_drawCrosshair.integer )
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $964
line 2990
;2990:		return; 
ADDRGP4 $960
JUMPV
LABELV $964
line 2991
;2991:	if ( cg.renderingThirdPerson )
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $967
line 2992
;2992:		return;
ADDRGP4 $960
JUMPV
LABELV $967
line 2993
;2993:	if ( cg.snap->ps.weapon == WP_PSG1 ||
ADDRLP4 20
CNSTI4 188
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 17
EQI4 $976
ADDRGP4 cg+36
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 24
EQI4 $976
ADDRGP4 cg+36
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 18
NEI4 $970
LABELV $976
line 2996
;2994:		cg.snap->ps.weapon == WP_SL8SD ||
;2995:		cg.snap->ps.weapon == WP_MACMILLAN )
;2996:		return;
ADDRGP4 $960
JUMPV
LABELV $970
line 2997
;2997:	if ( cg.snap->ps.weapon == WP_C4 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 3
NEI4 $977
line 2998
;2998:		return;
ADDRGP4 $960
JUMPV
LABELV $977
line 2999
;2999:	if ( cg.snap->ps.weapon == WP_NONE)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 0
NEI4 $980
line 3000
;3000:		return;
ADDRGP4 $960
JUMPV
LABELV $980
line 3001
;3001:	if ( cg.snap->ps.weapon == WP_KHURKURI ||
ADDRLP4 24
CNSTI4 188
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $987
ADDRGP4 cg+36
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $983
LABELV $987
line 3003
;3002:			 cg.snap->ps.weapon == WP_SEALKNIFE )
;3003:		return;
ADDRGP4 $960
JUMPV
LABELV $983
line 3004
;3004:	if ( ( cg.snap->ps.weapon == WP_GRENADE ||
ADDRLP4 28
CNSTI4 188
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
CNSTI4 4
EQI4 $994
ADDRGP4 cg+36
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $994
ADDRGP4 cg+36
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
CNSTI4 25
NEI4 $988
LABELV $994
line 3008
;3005:				 cg.snap->ps.weapon == WP_FLASHBANG ||
;3006:				 cg.snap->ps.weapon == WP_SMOKE ) &&
;3007:			 SEALS_NO_GRENADE_CROSSHAIR )
;3008:		return;
ADDRGP4 $960
JUMPV
LABELV $988
line 3009
;3009:	if (  ( ( cg.snap->ps.weapon == WP_AK47 ) ||
ADDRLP4 32
CNSTI4 188
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 15
EQI4 $1001
ADDRGP4 cg+36
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 16
NEI4 $995
LABELV $1001
ADDRLP4 36
CNSTI4 264
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $995
ADDRGP4 cg+36
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $995
line 3013
;3010:	        ( cg.snap->ps.weapon == WP_M4 ) ) &&
;3011:        ( cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) ) &&
;3012:				( cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ) ) )
;3013:		return;
ADDRGP4 $960
JUMPV
LABELV $995
line 3016
;3014:
;3015:
;3016:	chw = CROSSHAIR_HOR_WIDTH;
ADDRLP4 8
CNSTI4 3
ASGNI4
line 3017
;3017:	chh = cg_crosshairWidth.integer;
ADDRLP4 0
ADDRGP4 cg_crosshairWidth+12
INDIRI4
ASGNI4
line 3018
;3018:	cvw = cg_crosshairWidth.integer;
ADDRLP4 4
ADDRGP4 cg_crosshairWidth+12
INDIRI4
ASGNI4
line 3019
;3019:	cvh = CROSSHAIR_VER_HEIGHT;
ADDRLP4 12
CNSTI4 3
ASGNI4
line 3027
;3020:
;3021:	/*CG_FillRect2( x , ( y + height/2 ) - chh/2 , chw,chh*cg_crosshairWidth.integer,color);
;3022:	CG_FillRect2( x + width -  chw, ( y + height/2 ) - chh/2 , chw,chh*cg_crosshairWidth.integer,color);
;3023:
;3024:	CG_FillRect2( x + width/2 - cvw/2, y, cvw*cg_crosshairWidth.integer,cvh,color);
;3025:	CG_FillRect2( x + width/2 - cvw/2, y + height - cvh, cvw*cg_crosshairWidth.integer,cvh,color);*/
;3026:
;3027:	CG_FillRect2( x , ( y + height/2 ) - chh/2 , chw,chh,color);
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDRLP4 44
INDIRI4
DIVI4
ADDI4
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 CG_FillRect2
CALLV
pop
line 3028
;3028:	CG_FillRect2( x + width -  chw, ( y + height/2 ) - chh/2 , chw,chh,color);
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDRLP4 56
INDIRI4
DIVI4
ADDI4
ADDRLP4 0
INDIRI4
ADDRLP4 56
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 CG_FillRect2
CALLV
pop
line 3030
;3029:
;3030:	CG_FillRect2( x + width/2 - cvw/2, y, cvw,cvh,color);
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
ADDI4
ADDRLP4 4
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 CG_FillRect2
CALLV
pop
line 3031
;3031:	CG_FillRect2( x + width/2 - cvw/2, y + height - cvh, cvw,cvh,color);
ADDRLP4 72
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 72
INDIRI4
DIVI4
ADDI4
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 CG_FillRect2
CALLV
pop
line 3032
;3032:}
LABELV $960
endproc CG_DrawStaticCrosshair 84 20
proc CG_GetCrosshairFadeTime 8 0
line 3043
;3033:
;3034:/*
;3035:=================
;3036:CG_DrawCrosshair
;3037:=================
;3038:*/
;3039:
;3040:#define CROSSHAIR_FADE_TIME	2000
;3041:#define CROSSHAIR_FADE_MINTIME 500
;3042:
;3043:static int CG_GetCrosshairFadeTime(qboolean fadein) {
line 3045
;3044:	int i;
;3045:	int accuracy = char_accuracy.integer;
ADDRLP4 0
ADDRGP4 char_accuracy+12
INDIRI4
ASGNI4
line 3047
;3046:
;3047:	if ( accuracy <= 0 )
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1006
line 3048
;3048:		accuracy = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1006
line 3050
;3049:
;3050:	if (fadein) 
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1008
line 3051
;3051:		i = CROSSHAIR_FADE_TIME - ( accuracy * (CROSSHAIR_FADE_TIME / 10) );
ADDRLP4 4
CNSTI4 2000
CNSTI4 200
ADDRLP4 0
INDIRI4
MULI4
SUBI4
ASGNI4
ADDRGP4 $1009
JUMPV
LABELV $1008
line 3053
;3052:	else
;3053:		i = ( accuracy * (CROSSHAIR_FADE_TIME / 10) ); 
ADDRLP4 4
CNSTI4 200
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
LABELV $1009
line 3055
;3054:
;3055:	return i + CROSSHAIR_FADE_MINTIME;
ADDRLP4 4
INDIRI4
CNSTI4 500
ADDI4
RETI4
LABELV $1004
endproc CG_GetCrosshairFadeTime 8 0
proc CG_DrawCrosshair 108 20
line 3059
;3056:}
;3057: 
;3058:
;3059:static void CG_DrawCrosshair(void) {
line 3067
;3060:	float		w, h;
;3061:	qhandle_t	hShader;
;3062:	float		f;
;3063:	float		color[4],*col;
;3064:	float		x, y;
;3065:	int			crosshairMod;
;3066:	int			crosshairFadeTime ;
;3067:	qboolean	running = qtrue;
ADDRLP4 44
CNSTI4 1
ASGNI4
line 3070
;3068:	float   xyzspeed;
;3069:
;3070:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR)
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1011
line 3071
;3071:		return;
ADDRGP4 $1010
JUMPV
LABELV $1011
line 3073
;3072:
;3073:	if ( cg.snap->ps.pm_type == PM_SPECTATOR )
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1014
line 3074
;3074:		return;
ADDRGP4 $1010
JUMPV
LABELV $1014
line 3076
;3075:
;3076:	xyzspeed = sqrt( cg.snap->ps.velocity[0] * cg.snap->ps.velocity[0]
ADDRLP4 60
CNSTI4 76
ASGNI4
ADDRLP4 64
CNSTI4 80
ASGNI4
ADDRLP4 68
CNSTI4 84
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 72
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 72
INDIRF4
ASGNF4
line 3080
;3077:		+  cg.snap->ps.velocity[1] * cg.snap->ps.velocity[1]
;3078:		+  cg.snap->ps.velocity[2] * cg.snap->ps.velocity[2] );
;3079:
;3080:	if ( CG_ButtonPushed( BUTTON_WALKING ) 
CNSTI4 16
ARGI4
ADDRLP4 76
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $1029
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $1029
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $1029
ADDRLP4 40
INDIRF4
CNSTF4 1109393408
GEF4 $1023
LABELV $1029
line 3085
;3081:		|| cg.snap->ps.pm_flags & PMF_DUCKED 
;3082:		|| cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_LACTIVE )
;3083:		|| xyzspeed < 40.0f
;3084:		)
;3085:		running = qfalse;
ADDRLP4 44
CNSTI4 0
ASGNI4
LABELV $1023
line 3088
;3086: 
;3087:	// calculate the time needed to fade the crosshair
;3088:	if ( running ) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1030
line 3092
;3089:		// fade out the crosshair
;3090:
;3091:		// check if the crosshair was fading in
;3092:		if ( (cg.crosshairFadeIn == qtrue) ) {
ADDRGP4 cg+116376
INDIRI4
CNSTI4 1
NEI4 $1031
line 3093
;3093:			cg.crosshairFadeIn = qfalse;
ADDRGP4 cg+116376
CNSTI4 0
ASGNI4
line 3094
;3094:			cg.crosshairTime = cg.time + CG_GetCrosshairFadeTime(cg.crosshairFadeIn);
ADDRGP4 cg+116376
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 CG_GetCrosshairFadeTime
CALLI4
ASGNI4
ADDRGP4 cg+115716
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
ASGNI4
line 3095
;3095:			if ( (cg.crosshairTime < cg.time) ) cg.crosshairTime -= (cg.crosshairTime - cg.time);
ADDRGP4 cg+115716
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1031
ADDRLP4 88
ADDRGP4 cg+115716
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
ADDRGP4 cg+115716
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
SUBI4
ASGNI4
line 3097
;3096:			
;3097:		}
line 3099
;3098:
;3099:	} else {
ADDRGP4 $1031
JUMPV
LABELV $1030
line 3103
;3100:		// fade in the crosshair
;3101:
;3102:		// check if the crosshair was fading out
;3103:		if ( (cg.crosshairFadeIn == qfalse) ) {
ADDRGP4 cg+116376
INDIRI4
CNSTI4 0
NEI4 $1046
line 3104
;3104:			cg.crosshairFadeIn = qtrue;
ADDRGP4 cg+116376
CNSTI4 1
ASGNI4
line 3105
;3105:			cg.crosshairTime = cg.time + CG_GetCrosshairFadeTime(cg.crosshairFadeIn);
ADDRGP4 cg+116376
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 CG_GetCrosshairFadeTime
CALLI4
ASGNI4
ADDRGP4 cg+115716
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
ASGNI4
line 3106
;3106:			if ( (cg.crosshairTime < cg.time) ) cg.crosshairTime -= (cg.crosshairTime - cg.time);
ADDRGP4 cg+115716
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1053
ADDRLP4 88
ADDRGP4 cg+115716
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
ADDRGP4 cg+115716
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
SUBI4
ASGNI4
LABELV $1053
line 3108
;3107:			
;3108:		}
LABELV $1046
line 3110
;3109:
;3110:	}
LABELV $1031
line 3112
;3111:
;3112:	crosshairFadeTime = CG_GetCrosshairFadeTime (cg.crosshairFadeIn);
ADDRGP4 cg+116376
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 CG_GetCrosshairFadeTime
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 84
INDIRI4
ASGNI4
line 3114
;3113: 
;3114:	color[0]=cg_crosshair_r.value;
ADDRLP4 0
ADDRGP4 cg_crosshair_r+8
INDIRF4
ASGNF4
line 3115
;3115:	color[1]=cg_crosshair_g.value;
ADDRLP4 0+4
ADDRGP4 cg_crosshair_g+8
INDIRF4
ASGNF4
line 3116
;3116:	color[2]=cg_crosshair_b.value;
ADDRLP4 0+8
ADDRGP4 cg_crosshair_b+8
INDIRF4
ASGNF4
line 3119
;3117:
;3118:	// calculate color
;3119:	if (chBlink) {
ADDRGP4 chBlink
INDIRI4
CNSTI4 0
EQI4 $1066
line 3120
;3120:		color[0]=1.0-color[0]; 
ADDRLP4 0
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
line 3121
;3121:		color[1]=1.0-color[1];
ADDRLP4 0+4
CNSTF4 1065353216
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
line 3122
;3122:		color[2]=1.0-color[2];
ADDRLP4 0+8
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 3123
;3123:	}
LABELV $1066
line 3126
;3124:
;3125:	// crosshair gets black-effect when out of rounds
;3126:	if ( ( cg.snap->ps.stats[STAT_ROUNDS] <= cg_lowAmmoWarning.integer ) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRGP4 cg_lowAmmoWarning+12
INDIRI4
GTI4 $1072
line 3128
;3127:		if (
;3128:			 ( (cg.time - nextChBlinik) >= 0 ) &&
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 nextChBlinik
INDIRI4
SUBI4
ADDRLP4 88
INDIRI4
LTI4 $1073
ADDRLP4 92
CNSTI4 188
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1073
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1073
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1073
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 4
EQI4 $1073
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1073
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $1073
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 25
EQI4 $1073
line 3135
;3129:			 ! ( cg.snap->ps.weapon == WP_C4 ) &&
;3130:			 ! ( cg.snap->ps.weapon == WP_KHURKURI ) &&
;3131:			 ! ( cg.snap->ps.weapon == WP_SEALKNIFE ) &&
;3132:			 ! ( cg.snap->ps.weapon == WP_GRENADE ) &&
;3133:			 ! ( cg.snap->ps.weapon == WP_FLASHBANG ) &&
;3134:			 ! ( cg.snap->ps.weapon == WP_NONE ) &&
;3135:			 ! ( cg.snap->ps.weapon == WP_SMOKE ) ) {
line 3136
;3136:			nextChBlinik = cg.time + (
ADDRGP4 cg+36
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1090
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRGP4 $1091
JUMPV
LABELV $1090
ADDRLP4 96
ADDRGP4 cg+36
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
LABELV $1091
ADDRGP4 nextChBlinik
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDRLP4 96
INDIRI4
MULI4
CNSTI4 100
ADDI4
ADDI4
ASGNI4
line 3139
;3137:					(cg.snap->ps.stats[STAT_ROUNDS] < 0 ? 0 : cg.snap->ps.stats[STAT_ROUNDS])
;3138:					+1)*100;
;3139:			chBlink = !chBlink;
ADDRLP4 104
ADDRGP4 chBlink
ASGNP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1093
ADDRLP4 100
CNSTI4 1
ASGNI4
ADDRGP4 $1094
JUMPV
LABELV $1093
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $1094
ADDRLP4 104
INDIRP4
ADDRLP4 100
INDIRI4
ASGNI4
line 3140
;3140:		}
line 3141
;3141:	} else {
ADDRGP4 $1073
JUMPV
LABELV $1072
line 3142
;3142:		chBlink = qfalse;
ADDRGP4 chBlink
CNSTI4 0
ASGNI4
line 3143
;3143:	}
LABELV $1073
line 3147
;3144:
;3145:	
;3146:	// calculate alpha value
;3147:	if (!cg.crosshairFadeIn) {
ADDRGP4 cg+116376
INDIRI4
CNSTI4 0
NEI4 $1095
line 3149
;3148:					
;3149:		if (cg.crosshairTime > cg.time) {
ADDRGP4 cg+115716
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $1098
line 3150
;3150:			color[3] = (float)((float)cg.crosshairTime - (float)cg.time) / (float)crosshairFadeTime;
ADDRLP4 0+12
ADDRGP4 cg+115716
INDIRI4
CVIF4 4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
SUBF4
ADDRLP4 48
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 3151
;3151:			if (color[3] <= 0.05) color[3] = 0.0;
ADDRLP4 0+12
INDIRF4
CNSTF4 1028443341
GTF4 $1096
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 3152
;3152:		} else color[3] = 0.0;
ADDRGP4 $1096
JUMPV
LABELV $1098
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 3154
;3153:		
;3154:	} else {
ADDRGP4 $1096
JUMPV
LABELV $1095
line 3156
;3155:					
;3156:		if (cg.crosshairTime > cg.time) {
ADDRGP4 cg+115716
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $1110
line 3157
;3157:			color[3] = 1.0 - (float)((float)cg.crosshairTime - (float)cg.time) / (float)crosshairFadeTime ;
ADDRLP4 0+12
CNSTF4 1065353216
ADDRGP4 cg+115716
INDIRI4
CVIF4 4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
SUBF4
ADDRLP4 48
INDIRI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 3158
;3158:			if (color[3] >= 0.95) color[3] = 1.0;
ADDRLP4 0+12
INDIRF4
CNSTF4 1064514355
LTF4 $1111
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 3159
;3159:		} else color[3] = 1.0;
ADDRGP4 $1111
JUMPV
LABELV $1110
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
LABELV $1111
line 3161
;3160:		
;3161:	} // if (running... else...
LABELV $1096
line 3164
;3162:
;3163:	// fading crosshair
;3164:	if ( cg_crosshairFade.integer == 1 ) {
ADDRGP4 cg_crosshairFade+12
INDIRI4
CNSTI4 1
NEI4 $1122
line 3166
;3165:					
;3166:		if ( CG_ButtonPushed( BUTTON_SPRINT) ) {
CNSTI4 32
ARGI4
ADDRLP4 88
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1125
line 3167
;3167:			if (color[3] < 0.10) color[3] = 0.10;
ADDRLP4 0+12
INDIRF4
CNSTF4 1036831949
GEF4 $1123
ADDRLP4 0+12
CNSTF4 1036831949
ASGNF4
line 3168
;3168:		} else {
ADDRGP4 $1123
JUMPV
LABELV $1125
line 3169
;3169:			if (color[3] < 0.30) color[3] = 0.30;
ADDRLP4 0+12
INDIRF4
CNSTF4 1050253722
GEF4 $1123
ADDRLP4 0+12
CNSTF4 1050253722
ASGNF4
line 3170
;3170:		}
line 3172
;3171:		
;3172:	} else if ( cg_crosshairFade.integer == 2 ) {
ADDRGP4 $1123
JUMPV
LABELV $1122
ADDRGP4 cg_crosshairFade+12
INDIRI4
CNSTI4 2
NEI4 $1135
line 3174
;3173:					
;3174:		if (color[3] < 0.0) color[3] = 0.0;
ADDRLP4 0+12
INDIRF4
CNSTF4 0
GEF4 $1136
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 3176
;3175:		
;3176:	}	else {
ADDRGP4 $1136
JUMPV
LABELV $1135
line 3178
;3177:					
;3178:		if ( CG_ButtonPushed( BUTTON_SPRINT) ) {
CNSTI4 32
ARGI4
ADDRLP4 88
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1142
line 3179
;3179:			if (color[3] <= 0.25) color[3] = 0.25;
ADDRLP4 0+12
INDIRF4
CNSTF4 1048576000
GTF4 $1143
ADDRLP4 0+12
CNSTF4 1048576000
ASGNF4
line 3180
;3180:		} else {
ADDRGP4 $1143
JUMPV
LABELV $1142
line 3181
;3181:			if (color[3] < 0.75) color[3] = 0.75;
ADDRLP4 0+12
INDIRF4
CNSTF4 1061158912
GEF4 $1148
ADDRLP4 0+12
CNSTF4 1061158912
ASGNF4
LABELV $1148
line 3182
;3182:		}
LABELV $1143
line 3183
;3183:	}
LABELV $1136
LABELV $1123
line 3185
;3184:
;3185:	w = h = cg_crosshairSize.value;
ADDRLP4 88
ADDRGP4 cg_crosshairSize+8
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 88
INDIRF4
ASGNF4
line 3188
;3186:
;3187:	// pulse the size of the crosshair when picking up items
;3188:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 20
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+115296
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 3189
;3189:	if ( f > 0 && f < ITEM_BLOB_TIME ) {
ADDRLP4 20
INDIRF4
CNSTF4 0
LEF4 $1155
ADDRLP4 20
INDIRF4
CNSTF4 1128792064
GEF4 $1155
line 3190
;3190:		f /= ITEM_BLOB_TIME;
ADDRLP4 20
ADDRLP4 20
INDIRF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 3191
;3191:		w *= ( 1 + f );
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 3192
;3192:		h *= ( 1 + f );
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 3193
;3193:	}
LABELV $1155
line 3195
;3194:
;3195:	x = cg.refdef.x + 0.5 * ( cg.refdef.width  - w);
ADDRLP4 32
ADDRGP4 cg+109044
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRGP4 cg+109044+8
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3196
;3196:	y = cg.refdef.y + 0.5 * ( cg.refdef.height  - h); 
ADDRLP4 36
ADDRGP4 cg+109044+4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRGP4 cg+109044+12
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3199
;3197:	
;3198:	// if using a crosshair, don't make the crosshair too big
;3199:	if ( cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_LACTIVE ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1164
line 3200
;3200:		crosshairMod = cg.crosshairMod/2 + xyzspeed / (12 + cg.snap->ps.persistant[PERS_ACCURACY]) ;
ADDRLP4 16
ADDRGP4 cg+116364
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
ADDRLP4 40
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 328
ADDP4
INDIRI4
CNSTI4 12
ADDI4
CVIF4 4
DIVF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $1165
JUMPV
LABELV $1164
line 3202
;3201:	else
;3202:		crosshairMod = cg.crosshairMod/2 + xyzspeed / (6 + (cg.snap->ps.persistant[PERS_ACCURACY]/2));
ADDRLP4 96
CNSTI4 2
ASGNI4
ADDRLP4 16
ADDRGP4 cg+116364
INDIRI4
ADDRLP4 96
INDIRI4
DIVI4
CVIF4 4
ADDRLP4 40
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 328
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
DIVI4
CNSTI4 6
ADDI4
CVIF4 4
DIVF4
ADDF4
CVFI4 4
ASGNI4
LABELV $1165
line 3204
;3203:	
;3204:	x -= crosshairMod;
ADDRLP4 32
ADDRLP4 32
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 3205
;3205:	y -= crosshairMod; 
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 3207
;3206:
;3207:	CG_DrawStaticCrosshair (x, y, 
ADDRLP4 32
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 100
ADDRLP4 16
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRLP4 100
INDIRF4
ADDF4
CVFI4 4
ARGI4
ADDRLP4 28
INDIRF4
ADDRLP4 100
INDIRF4
ADDF4
CVFI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawStaticCrosshair
CALLV
pop
line 3211
;3208:		w + crosshairMod * 2, h + crosshairMod * 2,
;3209:		color);
;3210:	
;3211:}
LABELV $1010
endproc CG_DrawCrosshair 108 20
export CG_DrawMissionhelpers
proc CG_DrawMissionhelpers 36 32
line 3214
;3212:
;3213:void CG_DrawMissionhelpers( void ) 
;3214:{
line 3220
;3215:	vec3_t origin;
;3216://	vec3_t	target;
;3217:	vec3_t	angles;
;3218:
;3219:	// no origin set yet.
;3220:	if ( VectorCompare( cgs.mi_helpers[0], vec3_origin ) )
ADDRGP4 cgs+214132
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 24
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1172
line 3221
;3221:		return;
ADDRGP4 $1171
JUMPV
LABELV $1172
line 3223
;3222:
;3223: 	VectorClear( angles );
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 3226
;3224:
;3225:	// select pitch to look at focus point from vieword
;3226:	VectorSubtract( cg.refdef.vieworg,cgs.mi_helpers[0],  angles );
ADDRLP4 0
ADDRGP4 cg+109044+24
INDIRF4
ADDRGP4 cgs+214132
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 cg+109044+24+4
INDIRF4
ADDRGP4 cgs+214132+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 cg+109044+24+8
INDIRF4
ADDRGP4 cgs+214132+8
INDIRF4
SUBF4
ASGNF4
line 3236
;3227:  
;3228:
;3229:
;3230:/*	angles[0] += test_x.value;
;3231:	angles[1] += test_y.value;
;3232:	angles[ROLL] = 0;
;3233:	if ( test_w.integer )
;3234:		VectorNormalize(angles);
;3235:*/ 
;3236:	{
line 3237
;3237:		origin[0] = 80;
ADDRLP4 12
CNSTF4 1117782016
ASGNF4
line 3238
;3238:		origin[1] = 0;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 3239
;3239:		origin[2] = -10;
ADDRLP4 12+8
CNSTF4 3240099840
ASGNF4
line 3242
;3240:
;3241:	//	angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;3242:		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE - ICON_SIZE, 432 - ICON_SIZE, ICON_SIZE*2, ICON_SIZE*2,
CNSTF4 1137639424
ARGF4
CNSTF4 1137180672
ARGF4
ADDRLP4 32
CNSTF4 1115684864
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 cg_weapons+1776+16
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 3244
;3243:					   cg_weapons[WP_MK23].silencerModel , 0, origin, angles );
;3244:	}
line 3275
;3245:
;3246:  /*
;3247:
;3248:	{
;3249:		refEntity_t			ent;
;3250:		vec3_t		forward,right,up;
;3251:
;3252:		VectorCopy( cg.refdef.vieworg, target );
;3253:		AngleVectors( cg.refdefViewAngles, forward,right,up );
;3254:  
;3255:		VectorMA( target, test_x.value, forward, target );
;3256:		VectorMA( target, test_y.value, right, target );
;3257:		
;3258:		memset (&ent, 0, sizeof(ent));
;3259:  
;3260:		AnglesToAxis( angles, ent.axis );  
;3261: 
;3262:		ent.hModel = cg_weapons[WP_MK23].silencerModel;
;3263: 
;3264: 
;3265:		VectorCopy( target , ent.origin);
;3266:		VectorCopy( target, ent.oldorigin);
;3267:
;3268:		ent.nonNormalizedAxes = qfalse; 
;3269: 
;3270:		trap_R_AddRefEntityToScene(&ent); 
;3271:
;3272:			CG_Printf("added helper @: %s\n", vtos( target ) );
;3273:
;3274:	}*/
;3275:}
LABELV $1171
endproc CG_DrawMissionhelpers 36 32
export CG_DrawChat
proc CG_DrawChat 56 32
line 3278
;3276:
;3277:void CG_DrawChat( void ) 
;3278:{
line 3286
;3279:	int w, h;
;3280:	int i, len;
;3281: 	int		chatHeight;
;3282:
;3283:	float charwidth;
;3284:	float charheight;
;3285:
;3286:	int		x_base = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 3287
;3287:	int		y_base = 50;
ADDRLP4 20
CNSTI4 50
ASGNI4
line 3289
;3288:
;3289:	float	textscale = 0.225f;
ADDRLP4 16
CNSTF4 1046898278
ASGNF4
line 3291
;3290:
;3291:	if ( cg.viewMissionInfo )
ADDRGP4 cg+171504
INDIRI4
CNSTI4 0
EQI4 $1197
line 3292
;3292:		return;
ADDRGP4 $1196
JUMPV
LABELV $1197
line 3293
;3293:	if ( cg.activeInventory )
ADDRGP4 cg+115728
INDIRI4
CNSTI4 0
EQI4 $1200
line 3294
;3294:		y_base += 60;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
ADDRGP4 $1201
JUMPV
LABELV $1200
line 3295
;3295:	else if ( cgs.voteTime )
ADDRGP4 cgs+31672
INDIRI4
CNSTI4 0
EQI4 $1203
line 3296
;3296:		y_base += 40;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
ADDRGP4 $1204
JUMPV
LABELV $1203
line 3297
;3297:	else if ( cg.predictedPlayerState.pm_flags & PMF_FOLLOW )
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1206
line 3298
;3298:		y_base += 20;  
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $1206
LABELV $1204
LABELV $1201
line 3300
;3299:
;3300:	charwidth = CG_Text_Width("A", textscale, 0);
ADDRGP4 $932
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
line 3301
;3301:	charheight = CG_Text_Height("A", textscale + 0.15f, 0 );
ADDRGP4 $932
ARGP4
ADDRLP4 16
INDIRF4
CNSTF4 1041865114
ADDF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 3303
;3302: 
;3303:	if ( ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.pm_type == PM_SPECTATOR || cg.snap->ps.pm_type == PM_NOCLIP ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1216
ADDRLP4 48
CNSTI4 48
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1216
ADDRGP4 cg+36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1210
LABELV $1216
line 3304
;3304:		y_base = 74;
ADDRLP4 20
CNSTI4 74
ASGNI4
LABELV $1210
line 3306
;3305: 
;3306:	if (cg_chatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_chatHeight+12
INDIRI4
CNSTI4 15
GEI4 $1217
line 3307
;3307:		chatHeight = cg_chatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_chatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $1218
JUMPV
LABELV $1217
line 3309
;3308:	else
;3309:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 15
ASGNI4
LABELV $1218
line 3312
;3310:
;3311:
;3312:	if (cgs.LastChatPos != cgs.ChatPos) 
ADDRGP4 cgs+201320
INDIRI4
ADDRGP4 cgs+201316
INDIRI4
EQI4 $1221
line 3313
;3313:	{
line 3314
;3314:		if (cg.time - cgs.ChatMsgTimes[cgs.LastChatPos % chatHeight] > cg_chatTime.integer) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+201320
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+201256
ADDP4
INDIRI4
SUBI4
ADDRGP4 cg_chatTime+12
INDIRI4
LEI4 $1225
line 3315
;3315:			cgs.LastChatPos++; 
ADDRLP4 52
ADDRGP4 cgs+201320
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3316
;3316:		}
LABELV $1225
line 3318
;3317:
;3318:		h = (cgs.ChatPos - cgs.LastChatPos) * charheight; 
ADDRLP4 36
ADDRGP4 cgs+201316
INDIRI4
ADDRGP4 cgs+201320
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 3319
;3319:		w = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3321
;3320:
;3321:		for (i = cgs.LastChatPos; i < cgs.ChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+201320
INDIRI4
ASGNI4
ADDRGP4 $1237
JUMPV
LABELV $1234
line 3322
;3322:			len = CG_DrawStrlen(cgs.ChatMsgs[i % chatHeight]);
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+197640
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRI4
ASGNI4
line 3323
;3323:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $1241
line 3324
;3324:				w = len;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $1241
line 3325
;3325:		}
LABELV $1235
line 3321
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1237
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+201316
INDIRI4
LTI4 $1234
line 3326
;3326:		w *= charwidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 3327
;3327:		w += charwidth * 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 24
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3329
;3328:    
;3329:		for (i = cgs.ChatPos - 1; i >= cgs.LastChatPos; i--) {
ADDRLP4 0
ADDRGP4 cgs+201316
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1246
JUMPV
LABELV $1243
line 3331
;3330:
;3331: 			CG_Text_Paint(
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRF4
ADDF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+201320
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+197640
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3341
;3332:				x_base + charwidth, 
;3333:				y_base + (i - cgs.LastChatPos) * charheight , 
;3334:				textscale,
;3335:				colorWhite, 
;3336:				cgs.ChatMsgs[i % chatHeight], 
;3337:				0, 
;3338:				0, 
;3339:				ITEM_TEXTSTYLE_OUTLINED
;3340:				); 
;3341:		}
LABELV $1244
line 3329
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1246
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+201320
INDIRI4
GEI4 $1243
line 3342
;3342:	}
LABELV $1221
line 3343
;3343:}
LABELV $1196
endproc CG_DrawChat 56 32
lit
align 4
LABELV $1277
byte 4 0
byte 4 0
byte 4 3212836864
align 4
LABELV $1316
byte 4 0
byte 4 0
byte 4 3212836864
code
proc CG_CalcUpdateRadarPositions 68 16
line 3372
;3344:
;3345:
;3346:/*
;3347:===========================================================================
;3348:
;3349:	RADAR
;3350:
;3351:===========================================================================
;3352:*/
;3353:extern	vmCvar_t	cg_drawRadar;
;3354:extern	vmCvar_t	cg_radarX;
;3355:extern	vmCvar_t	cg_radarY;
;3356:
;3357:#define RADAR_BACK_WIDTH	80
;3358:#define RADAR_BACK_HEIGHT	80
;3359:
;3360:#define RADAR_BLIP_WIDTH	8
;3361:#define RADAR_BLIP_HEIGHT	8
;3362:
;3363:#define RADAR_OBJECT_WIDTH	16
;3364:#define RADAR_OBJECT_HEIGHT	16
;3365:
;3366:#define	SCANNER_UNIT                   32
;3367:#define	SCANNER_RANGE                  35 //35
;3368:
;3369:#define SCANNER_WIDTH					40
;3370:
;3371:static void CG_CalcUpdateRadarPositions( void )
;3372:{
line 3380
;3373:	float	len; 
;3374:	int		hd;
;3375:	vec3_t	v;
;3376:	int		i;
;3377:	vec3_t	blipOrg; 
;3378:
;3379:	// update players
;3380:	for ( i = 0; i < cg.radarNumEntities; i++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $1255
JUMPV
LABELV $1252
line 3381
;3381:	{
line 3382
;3382:		VectorCopy( cg.radarEntities[i].origin, blipOrg );
ADDRLP4 20
CNSTI4 28
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 cg+171512+16
ADDP4
INDIRB
ASGNB 12
line 3385
;3383:
;3384:		// calc player to enemy vector
;3385:		VectorSubtract (cg.predictedPlayerState.origin, blipOrg, v);
ADDRLP4 0
ADDRGP4 cg+107636+20
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 cg+107636+20+4
INDIRF4
ADDRLP4 20+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 cg+107636+20+8
INDIRF4
ADDRLP4 20+8
INDIRF4
SUBF4
ASGNF4
line 3388
;3386:
;3387:		// save height differential
;3388:		hd = v[2] / SCANNER_UNIT;
ADDRLP4 32
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
DIVF4
CVFI4 4
ASGNI4
line 3391
;3389:
;3390:		// remove height component
;3391:		v[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3394
;3392:
;3393:		// calc length of distance from top down view (no z)
;3394:		len = VectorLength (v) / SCANNER_UNIT;
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
CNSTF4 1107296256
DIVF4
ASGNF4
line 3396
;3395:
;3396:		if ( len > SCANNER_RANGE )
ADDRLP4 12
INDIRF4
CNSTF4 1108082688
LEF4 $1273
line 3397
;3397:			len = SCANNER_RANGE;
ADDRLP4 12
CNSTF4 1108082688
ASGNF4
LABELV $1273
line 3400
;3398:
;3399:		// in range ?
;3400:		if ( len <= SCANNER_RANGE )
ADDRLP4 12
INDIRF4
CNSTF4 1108082688
GTF4 $1275
line 3401
;3401:		{ 
line 3403
;3402:			vec3_t	dp; 
;3403:			vec3_t	normal = {0,0,-1};
ADDRLP4 52
ADDRGP4 $1277
INDIRB
ASGNB 12
line 3406
;3404:
;3405:			// normal vector to enemy
;3406:			VectorNormalize(v);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3409
;3407:	 
;3408:			// rotate round player view angle (yaw)
;3409:			RotatePointAroundVector( dp, normal, v, cg.refdefViewAngles[1]);
ADDRLP4 40
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+109412+4
INDIRF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 3412
;3410:
;3411:			// scale to fit scanner range (80 = pixel range of scanner)
;3412:			VectorScale(dp,len*SCANNER_WIDTH/SCANNER_RANGE,dp);
ADDRLP4 64
CNSTF4 1109393408
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1108082688
DIVF4
ASGNF4
ADDRLP4 40
ADDRLP4 40
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRLP4 40+8
ADDRLP4 40+8
INDIRF4
CNSTF4 1109393408
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1108082688
DIVF4
MULF4
ASGNF4
line 3415
;3413:
;3414:			// update x/y and height
;3415:			cg.radarEntities[i].x = dp[1];
CNSTI4 28
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 cg+171512+4
ADDP4
ADDRLP4 40+4
INDIRF4
CVFI4 4
ASGNI4
line 3416
;3416:			cg.radarEntities[i].y = dp[0];
CNSTI4 28
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 cg+171512+8
ADDP4
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 3417
;3417:			cg.radarEntities[i].height = hd;
CNSTI4 28
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 cg+171512+12
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 3418
;3418:		} 
LABELV $1275
line 3419
;3419:	}
LABELV $1253
line 3380
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1255
ADDRLP4 16
INDIRI4
ADDRGP4 cg+171508
INDIRI4
LTI4 $1252
line 3423
;3420:
;3421:	// update various clientside handled entities
;3422:	// update players
;3423:	for ( i = 0; i < cg.radarNumObjects; i++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $1294
JUMPV
LABELV $1291
line 3424
;3424:	{
line 3425
;3425:		VectorCopy( cg.radarObjects[i].origin, blipOrg );
ADDRLP4 20
CNSTI4 28
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 cg+173308+16
ADDP4
INDIRB
ASGNB 12
line 3428
;3426:
;3427:		// calc player to enemy vector
;3428:		VectorSubtract (cg.predictedPlayerState.origin, blipOrg, v);
ADDRLP4 0
ADDRGP4 cg+107636+20
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 cg+107636+20+4
INDIRF4
ADDRLP4 20+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 cg+107636+20+8
INDIRF4
ADDRLP4 20+8
INDIRF4
SUBF4
ASGNF4
line 3431
;3429:
;3430:		// save height differential
;3431:		hd = v[2] / SCANNER_UNIT;
ADDRLP4 32
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
DIVF4
CVFI4 4
ASGNI4
line 3434
;3432:
;3433:		// remove height component
;3434:		v[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3437
;3435:
;3436:		// calc length of distance from top down view (no z)
;3437:		len = VectorLength (v) / SCANNER_UNIT;
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
CNSTF4 1107296256
DIVF4
ASGNF4
line 3439
;3438:
;3439:		if ( len > SCANNER_RANGE )
ADDRLP4 12
INDIRF4
CNSTF4 1108082688
LEF4 $1312
line 3440
;3440:			len = SCANNER_RANGE;
ADDRLP4 12
CNSTF4 1108082688
ASGNF4
LABELV $1312
line 3443
;3441:
;3442:		// in range ?
;3443:		if ( len <= SCANNER_RANGE )
ADDRLP4 12
INDIRF4
CNSTF4 1108082688
GTF4 $1314
line 3444
;3444:		{ 
line 3446
;3445:			vec3_t	dp; 
;3446:			vec3_t	normal = {0,0,-1};
ADDRLP4 52
ADDRGP4 $1316
INDIRB
ASGNB 12
line 3449
;3447:
;3448:			// normal vector to enemy
;3449:			VectorNormalize(v);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3452
;3450:	 
;3451:			// rotate round player view angle (yaw)
;3452:			RotatePointAroundVector( dp, normal, v, cg.refdefViewAngles[1]);
ADDRLP4 40
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+109412+4
INDIRF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 3455
;3453:
;3454:			// scale to fit scanner range (80 = pixel range of scanner)
;3455:			VectorScale(dp,len*SCANNER_WIDTH/SCANNER_RANGE,dp);
ADDRLP4 64
CNSTF4 1109393408
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1108082688
DIVF4
ASGNF4
ADDRLP4 40
ADDRLP4 40
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRLP4 40+8
ADDRLP4 40+8
INDIRF4
CNSTF4 1109393408
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1108082688
DIVF4
MULF4
ASGNF4
line 3458
;3456:
;3457:			// update x/y and height
;3458:			cg.radarObjects[i].x = dp[1];
CNSTI4 28
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 cg+173308+4
ADDP4
ADDRLP4 40+4
INDIRF4
CVFI4 4
ASGNI4
line 3459
;3459:			cg.radarObjects[i].y = dp[0];
CNSTI4 28
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 cg+173308+8
ADDP4
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 3460
;3460:			cg.radarObjects[i].height = hd;
CNSTI4 28
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 cg+173308+12
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 3461
;3461:		} 
LABELV $1314
line 3462
;3462:	}
LABELV $1292
line 3423
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1294
ADDRLP4 16
INDIRI4
ADDRGP4 cg+173304
INDIRI4
LTI4 $1291
line 3463
;3463:}
LABELV $1251
endproc CG_CalcUpdateRadarPositions 68 16
proc CG_DrawRadar 128 20
line 3464
;3464:static void CG_DrawRadar( void ) {
line 3466
;3465:	int i;
;3466:	qhandle_t	radarBackShader = trap_R_RegisterShader("gfx/radar/radar_back"),
ADDRGP4 $1331
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 44
INDIRI4
ASGNI4
line 3467
;3467:				radarFriendShader = trap_R_RegisterShader("gfx/radar/radar_friendly"),
ADDRGP4 $1332
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 3468
;3468:				radarEnemyShader = trap_R_RegisterShader("gfx/radar/radar_enemy"),
ADDRGP4 $1333
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 52
INDIRI4
ASGNI4
line 3469
;3469:				radarBombShader = trap_R_RegisterShader("gfx/radar/radar_bomb"),
ADDRGP4 $1334
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 56
INDIRI4
ASGNI4
line 3470
;3470:				radarUpShader = trap_R_RegisterShader("gfx/radar/radar_up"),
ADDRGP4 $1335
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 60
INDIRI4
ASGNI4
line 3471
;3471:				radarDownShader = trap_R_RegisterShader("gfx/radar/radar_dn"),
ADDRGP4 $1336
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
line 3472
;3472:				radarFriendMissionShader = trap_R_RegisterShader("gfx/radar/radar_friendly_m"),
ADDRGP4 $1337
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 68
INDIRI4
ASGNI4
line 3473
;3473:				radarBandageShader = trap_R_RegisterShader("gfx/radar/radar_friendly_b"),
ADDRGP4 $1338
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 72
INDIRI4
ASGNI4
line 3474
;3474:				radarFriendRadio = trap_R_RegisterShader("gfx/radar/radar_friendly_r"),
ADDRGP4 $1339
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 76
INDIRI4
ASGNI4
line 3477
;3475:				hShader;
;3476:
;3477:	if ( !cg_drawRadar.integer )
ADDRGP4 cg_drawRadar+12
INDIRI4
CNSTI4 0
NEI4 $1340
line 3478
;3478:		return;
ADDRGP4 $1330
JUMPV
LABELV $1340
line 3479
;3479:	if ( cg.snap->ps.pm_flags & PMF_FOLLOW )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1343
line 3480
;3480:		return;
ADDRGP4 $1330
JUMPV
LABELV $1343
line 3482
;3481:
;3482:	CG_DrawPic( cg_radarX.integer - RADAR_BACK_WIDTH/2,
ADDRLP4 80
CNSTI4 40
ASGNI4
ADDRGP4 cg_radarX+12
INDIRI4
ADDRLP4 80
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 cg_radarY+12
INDIRI4
ADDRLP4 80
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 84
CNSTF4 1117782016
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3487
;3483:				cg_radarY.integer - RADAR_BACK_HEIGHT/2,
;3484:				RADAR_BACK_WIDTH,
;3485:				RADAR_BACK_HEIGHT, radarBackShader );
;3486:
;3487:	CG_CalcUpdateRadarPositions( );
ADDRGP4 CG_CalcUpdateRadarPositions
CALLV
pop
line 3489
;3488:
;3489:	if ( cgs.gametype == GT_LTS ) // radar entities nur rendern wenn missionsmodus aktiv ist
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
NEI4 $1348
line 3490
;3490:  	for ( i = 0; i < cg.radarNumObjects; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1354
JUMPV
LABELV $1351
line 3491
;3491:	{
line 3494
;3492:		qhandle_t shader;		
;3493:
;3494:		shader = trap_R_RegisterShader( va( "gfx/radar/radar_%c",cg.radarObjects[i].type ) );
ADDRGP4 $1356
ARGP4
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+173308
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 96
INDIRI4
ASGNI4
line 3496
;3495:		
;3496: 		CG_DrawPic( cg_radarX.integer + cg.radarObjects[i].x-RADAR_OBJECT_WIDTH/2,
ADDRLP4 100
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 104
CNSTI4 8
ASGNI4
ADDRGP4 cg_radarX+12
INDIRI4
ADDRLP4 100
INDIRI4
ADDRGP4 cg+173308+4
ADDP4
INDIRI4
ADDI4
ADDRLP4 104
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 cg_radarY+12
INDIRI4
ADDRLP4 100
INDIRI4
ADDRGP4 cg+173308+8
ADDP4
INDIRI4
ADDI4
ADDRLP4 104
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 108
CNSTF4 1098907648
ASGNF4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 88
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3500
;3497:					cg_radarY.integer + cg.radarObjects[i].y-RADAR_OBJECT_HEIGHT/2,
;3498:					RADAR_OBJECT_WIDTH,RADAR_OBJECT_HEIGHT, shader );
;3499:
;3500:		if ( cg.radarObjects[i].height < 0 )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+173308+12
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1364
line 3501
;3501:			CG_DrawPic( cg_radarX.integer + cg.radarObjects[i].x+RADAR_OBJECT_WIDTH/4,
ADDRLP4 112
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRGP4 cg_radarX+12
INDIRI4
ADDRLP4 112
INDIRI4
ADDRGP4 cg+173308+4
ADDP4
INDIRI4
ADDI4
CNSTI4 4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cg_radarY+12
INDIRI4
ADDRLP4 112
INDIRI4
ADDRGP4 cg+173308+8
ADDP4
INDIRI4
ADDI4
CNSTI4 8
SUBI4
CVIF4 4
ARGF4
ADDRLP4 116
CNSTF4 1098907648
ASGNF4
ADDRLP4 116
INDIRF4
ARGF4
ADDRLP4 116
INDIRF4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
ADDRGP4 $1365
JUMPV
LABELV $1364
line 3504
;3502:					cg_radarY.integer + cg.radarObjects[i].y-RADAR_OBJECT_HEIGHT/2,
;3503:					RADAR_OBJECT_WIDTH,RADAR_OBJECT_HEIGHT, radarUpShader );
;3504:		else if ( cg.radarObjects[i].height > 0 )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+173308+12
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1374
line 3505
;3505:			CG_DrawPic( cg_radarX.integer + cg.radarObjects[i].x+RADAR_OBJECT_WIDTH/4,
ADDRLP4 120
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRGP4 cg_radarX+12
INDIRI4
ADDRLP4 120
INDIRI4
ADDRGP4 cg+173308+4
ADDP4
INDIRI4
ADDI4
CNSTI4 4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cg_radarY+12
INDIRI4
ADDRLP4 120
INDIRI4
ADDRGP4 cg+173308+8
ADDP4
INDIRI4
ADDI4
CNSTI4 8
SUBI4
CVIF4 4
ARGF4
ADDRLP4 124
CNSTF4 1098907648
ASGNF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $1374
LABELV $1365
line 3508
;3506:					cg_radarY.integer + cg.radarObjects[i].y-RADAR_OBJECT_HEIGHT/2,
;3507:					RADAR_OBJECT_WIDTH,RADAR_OBJECT_HEIGHT, radarDownShader );
;3508:	}
LABELV $1352
line 3490
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1354
ADDRLP4 0
INDIRI4
ADDRGP4 cg+173304
INDIRI4
LTI4 $1351
LABELV $1348
line 3509
;3509: 	for ( i = 0; i < cg.radarNumEntities; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1387
JUMPV
LABELV $1384
line 3510
;3510:	{
line 3511
;3511:		char action = cg.radarEntities[i].type;
ADDRLP4 88
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+171512
ADDP4
INDIRI1
ASGNI1
line 3513
;3512:
;3513:		if ( action == 'F' )
ADDRLP4 88
INDIRI1
CVII4 1
CNSTI4 70
NEI4 $1390
line 3514
;3514:			hShader = radarFriendShader;
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $1391
JUMPV
LABELV $1390
line 3515
;3515:		else if ( action == 'A' && sin( cg.time / 25  ) >= 0.0f  )
ADDRLP4 88
INDIRI1
CVII4 1
CNSTI4 65
NEI4 $1392
ADDRGP4 cg+107604
INDIRI4
CNSTI4 25
DIVI4
CVIF4 4
ARGF4
ADDRLP4 92
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 92
INDIRF4
CNSTF4 0
LTF4 $1392
line 3516
;3516:			hShader = radarEnemyShader; // firing, too
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $1393
JUMPV
LABELV $1392
line 3517
;3517:		else if ( action == 'B' )
ADDRLP4 88
INDIRI1
CVII4 1
CNSTI4 66
NEI4 $1395
line 3518
;3518:			hShader = radarBandageShader;
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $1396
JUMPV
LABELV $1395
line 3519
;3519:		else if ( action == 'M' )
ADDRLP4 88
INDIRI1
CVII4 1
CNSTI4 77
NEI4 $1397
line 3520
;3520:			hShader = radarFriendMissionShader;
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRGP4 $1398
JUMPV
LABELV $1397
line 3521
;3521:		else if ( action == 'R' )
ADDRLP4 88
INDIRI1
CVII4 1
CNSTI4 82
NEI4 $1399
line 3522
;3522:			hShader = radarFriendRadio;
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $1400
JUMPV
LABELV $1399
line 3524
;3523:		else
;3524:			hShader = radarFriendShader;
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $1400
LABELV $1398
LABELV $1396
LABELV $1393
LABELV $1391
line 3526
;3525:
;3526: 		CG_DrawPic( cg_radarX.integer + cg.radarEntities[i].x-RADAR_BLIP_WIDTH/2,
ADDRLP4 96
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 100
CNSTI4 4
ASGNI4
ADDRGP4 cg_radarX+12
INDIRI4
ADDRLP4 96
INDIRI4
ADDRGP4 cg+171512+4
ADDP4
INDIRI4
ADDI4
ADDRLP4 100
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 cg_radarY+12
INDIRI4
ADDRLP4 96
INDIRI4
ADDRGP4 cg+171512+8
ADDP4
INDIRI4
ADDI4
ADDRLP4 100
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 104
CNSTF4 1090519040
ASGNF4
ADDRLP4 104
INDIRF4
ARGF4
ADDRLP4 104
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3530
;3527:					cg_radarY.integer + cg.radarEntities[i].y-RADAR_BLIP_HEIGHT/2,
;3528:					RADAR_BLIP_WIDTH,RADAR_BLIP_HEIGHT, hShader );
;3529:		
;3530:		if ( cg.radarEntities[i].height < 0 )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+171512+12
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1407
line 3531
;3531:			CG_DrawPic( cg_radarX.integer + cg.radarEntities[i].x+RADAR_BLIP_WIDTH/4,
ADDRLP4 108
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRGP4 cg_radarX+12
INDIRI4
ADDRLP4 108
INDIRI4
ADDRGP4 cg+171512+4
ADDP4
INDIRI4
ADDI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cg_radarY+12
INDIRI4
ADDRLP4 108
INDIRI4
ADDRGP4 cg+171512+8
ADDP4
INDIRI4
ADDI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 112
CNSTF4 1090519040
ASGNF4
ADDRLP4 112
INDIRF4
ARGF4
ADDRLP4 112
INDIRF4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
ADDRGP4 $1408
JUMPV
LABELV $1407
line 3534
;3532:					cg_radarY.integer + cg.radarEntities[i].y-RADAR_BLIP_HEIGHT/2,
;3533:					RADAR_BLIP_WIDTH,RADAR_BLIP_HEIGHT, radarUpShader );
;3534:		else if ( cg.radarEntities[i].height > 0 )
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+171512+12
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1417
line 3535
;3535:			CG_DrawPic( cg_radarX.integer + cg.radarEntities[i].x+RADAR_BLIP_WIDTH/4,
ADDRLP4 116
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRGP4 cg_radarX+12
INDIRI4
ADDRLP4 116
INDIRI4
ADDRGP4 cg+171512+4
ADDP4
INDIRI4
ADDI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cg_radarY+12
INDIRI4
ADDRLP4 116
INDIRI4
ADDRGP4 cg+171512+8
ADDP4
INDIRI4
ADDI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 120
CNSTF4 1090519040
ASGNF4
ADDRLP4 120
INDIRF4
ARGF4
ADDRLP4 120
INDIRF4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $1417
LABELV $1408
line 3539
;3536:					cg_radarY.integer + cg.radarEntities[i].y-RADAR_BLIP_HEIGHT/2,
;3537:					RADAR_BLIP_WIDTH,RADAR_BLIP_HEIGHT, radarDownShader );
;3538:
;3539:	}  
LABELV $1385
line 3509
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1387
ADDRLP4 0
INDIRI4
ADDRGP4 cg+171508
INDIRI4
LTI4 $1384
line 3540
;3540:}
LABELV $1330
endproc CG_DrawRadar 128 20
export CG_EditRadar_AddObject
proc CG_EditRadar_AddObject 8 12
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 3543
;3541:
;3542:void CG_EditRadar_AddObject( char type, vec3_t org )
;3543:{
line 3544
;3544:	CG_Printf("Added Radar Object: %c at %s\n", type, vtos(org) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $1428
ARGP4
ADDRFP4 0
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 3546
;3545:
;3546:	cg.radarObjects[cg.radarNumObjects].type = type;
CNSTI4 28
ADDRGP4 cg+173304
INDIRI4
MULI4
ADDRGP4 cg+173308
ADDP4
ADDRFP4 0
INDIRI1
ASGNI1
line 3547
;3547:	VectorCopy(org, cg.radarObjects[cg.radarNumObjects].origin );
CNSTI4 28
ADDRGP4 cg+173304
INDIRI4
MULI4
ADDRGP4 cg+173308+16
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 3549
;3548:
;3549:	cg.radarNumObjects++;
ADDRLP4 4
ADDRGP4 cg+173304
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3550
;3550:}
LABELV $1427
endproc CG_EditRadar_AddObject 8 12
export CG_EditRadar_HandleKey
proc CG_EditRadar_HandleKey 96 12
line 3554
;3551:void CG_WriteRadarInfoToBRF_f( void );
;3552:
;3553:void CG_EditRadar_HandleKey( int key )
;3554:{
line 3555
;3555:	int mousex=cgs.cursorX,mousey=cgs.cursorY;
ADDRLP4 8
ADDRGP4 cgs+205008
INDIRI4
ASGNI4
ADDRLP4 12
ADDRGP4 cgs+205012
INDIRI4
ASGNI4
line 3559
;3556:	int y,y2;
;3557:	int x,x2;
;3558:
;3559:	x = 4;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 3560
;3560:	x2 = 300;
ADDRLP4 20
CNSTI4 300
ASGNI4
line 3562
;3561:
;3562:	y = 258;
ADDRLP4 0
CNSTI4 258
ASGNI4
line 3563
;3563:	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2;
ADDRGP4 $932
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 3565
;3564:
;3565:	if ( mousex > x && mousex < x2 &&
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1438
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $1438
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1438
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $1438
line 3567
;3566:		mousey > y && mousey < y2 )
;3567:	{
line 3569
;3568:		//place V
;3569:		CG_EditRadar_AddObject('V', cg.refdef.vieworg );
CNSTI4 86
ARGI4
ADDRGP4 cg+109044+24
ARGP4
ADDRGP4 CG_EditRadar_AddObject
CALLV
pop
line 3570
;3570:	}
LABELV $1438
line 3572
;3571:
;3572:	y = y2;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 3573
;3573:	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2;
ADDRGP4 $932
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 3575
;3574:
;3575:	if ( mousex > x && mousex < x2 &&
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1442
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $1442
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1442
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $1442
line 3577
;3576:		mousey > y && mousey < y2 )
;3577:	{
line 3579
;3578:		//place E
;3579:		CG_EditRadar_AddObject('E', cg.refdef.vieworg );
CNSTI4 69
ARGI4
ADDRGP4 cg+109044+24
ARGP4
ADDRGP4 CG_EditRadar_AddObject
CALLV
pop
line 3580
;3580:	}
LABELV $1442
line 3582
;3581:
;3582:	y = y2;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 3583
;3583:	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2; 
ADDRGP4 $932
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 3585
;3584:
;3585:	if ( mousex > x && mousex < x2 &&
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1446
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $1446
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1446
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $1446
line 3587
;3586:		mousey > y && mousey < y2 )
;3587:	{
line 3589
;3588:		//place B
;3589:		CG_EditRadar_AddObject('B', cg.refdef.vieworg );
CNSTI4 66
ARGI4
ADDRGP4 cg+109044+24
ARGP4
ADDRGP4 CG_EditRadar_AddObject
CALLV
pop
line 3590
;3590:	}
LABELV $1446
line 3592
;3591:
;3592:	y = y2;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 3593
;3593:	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2; 
ADDRGP4 $932
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 60
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 3594
;3594:	if ( mousex > x && mousex < x2 &&
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1450
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $1450
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1450
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $1450
line 3596
;3595:		mousey > y && mousey < y2 )
;3596:	{
line 3598
;3597:		//place A
;3598:		CG_EditRadar_AddObject('A', cg.refdef.vieworg );
CNSTI4 65
ARGI4
ADDRGP4 cg+109044+24
ARGP4
ADDRGP4 CG_EditRadar_AddObject
CALLV
pop
line 3599
;3599:	}
LABELV $1450
line 3601
;3600:
;3601:	y = y2;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 3602
;3602:	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2; 
ADDRGP4 $932
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 72
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 3603
;3603:	if ( mousex > x && mousex < x2 &&
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1454
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $1454
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1454
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $1454
line 3605
;3604:		mousey > y && mousey < y2 )
;3605:	{
line 3607
;3606:		//place A
;3607:		CG_EditRadar_AddObject('X', cg.refdef.vieworg );
CNSTI4 88
ARGI4
ADDRGP4 cg+109044+24
ARGP4
ADDRGP4 CG_EditRadar_AddObject
CALLV
pop
line 3608
;3608:	}
LABELV $1454
line 3610
;3609:
;3610:	y = y2 + 20;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 3611
;3611:	y2 = y + CG_Text_Height( "A", 0.20f, 0 ) + 2; 
ADDRGP4 $932
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 3612
;3612:	if ( mousex > x && mousex < x2 &&
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1458
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $1458
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1458
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $1458
line 3614
;3613:		mousey > y && mousey < y2 )
;3614:	{
line 3616
;3615:		//place A
;3616:		CG_WriteRadarInfoToBRF_f();
ADDRGP4 CG_WriteRadarInfoToBRF_f
CALLV
pop
line 3617
;3617:	}
LABELV $1458
line 3618
;3618:}
LABELV $1435
endproc CG_EditRadar_HandleKey 96 12
export CG_Radar_MouseIn
proc CG_Radar_MouseIn 0 0
line 3619
;3619:qboolean CG_Radar_MouseIn( int x, int x2, int y, int y2 ) {
line 3621
;3620:
;3621:	if ( cgs.cursorX > x && cgs.cursorX < x2 &&
ADDRGP4 cgs+205008
INDIRI4
ADDRFP4 0
INDIRI4
LEI4 $1461
ADDRGP4 cgs+205008
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $1461
ADDRGP4 cgs+205012
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $1461
ADDRGP4 cgs+205012
INDIRI4
ADDRFP4 12
INDIRI4
GEI4 $1461
line 3623
;3622:		cgs.cursorY > y && cgs.cursorY < y2 )
;3623:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1460
JUMPV
LABELV $1461
line 3625
;3624:
;3625:	return qfalse; 
CNSTI4 0
RETI4
LABELV $1460
endproc CG_Radar_MouseIn 0 0
proc CG_DrawEditRadar 108 32
line 3627
;3626:}
;3627:static void CG_DrawEditRadar( void ) {
line 3628
;3628:	int y = 254;
ADDRLP4 0
CNSTI4 254
ASGNI4
line 3631
;3629:	char *s;
;3630:
;3631:	if ( cgs.eventHandling != CGAME_EVENT_EDITRADAR )
ADDRGP4 cgs+205016
INDIRI4
CNSTI4 5
EQI4 $1468
line 3632
;3632:		return;
ADDRGP4 $1467
JUMPV
LABELV $1468
line 3635
;3633:
;3634:	
;3635:	s = "Radar Entity Editor. Press Escape to exit.";
ADDRLP4 4
ADDRGP4 $1471
ASGNP4
line 3636
;3636:	CG_Text_Paint( 4, y, 0.20f, colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
CNSTF4 1082130432
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3637
;3637:	y += CG_Text_Height( s, 0.20f, 0 ) + 2;
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 3639
;3638:
;3639:	s = "Place VIP Rescue Entity";
ADDRLP4 4
ADDRGP4 $1472
ASGNP4
line 3640
;3640:	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
CNSTI4 4
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 CG_Radar_MouseIn
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1474
ADDRLP4 12
ADDRGP4 colorRed
ASGNP4
ADDRGP4 $1475
JUMPV
LABELV $1474
ADDRLP4 12
ADDRGP4 colorWhite
ASGNP4
LABELV $1475
CNSTF4 1082130432
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3641
;3641:	y += CG_Text_Height( s, 0.20f, 0 ) + 2;
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 3643
;3642:
;3643:	s = "Place Extraction Point";
ADDRLP4 4
ADDRGP4 $1476
ASGNP4
line 3644
;3644:	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
CNSTI4 4
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 36
ADDRGP4 CG_Radar_MouseIn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1478
ADDRLP4 28
ADDRGP4 colorRed
ASGNP4
ADDRGP4 $1479
JUMPV
LABELV $1478
ADDRLP4 28
ADDRGP4 colorWhite
ASGNP4
LABELV $1479
CNSTF4 1082130432
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3645
;3645:	y += CG_Text_Height( s, 0.20f, 0 ) + 2;
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 3647
;3646:
;3647:	s = "Place Briefcase";
ADDRLP4 4
ADDRGP4 $1480
ASGNP4
line 3648
;3648:	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
CNSTI4 4
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 52
ADDRGP4 CG_Radar_MouseIn
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $1482
ADDRLP4 44
ADDRGP4 colorRed
ASGNP4
ADDRGP4 $1483
JUMPV
LABELV $1482
ADDRLP4 44
ADDRGP4 colorWhite
ASGNP4
LABELV $1483
CNSTF4 1082130432
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3649
;3649:	y += CG_Text_Height( s, 0.20f, 0 ) + 2;
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 56
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 56
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 3651
;3650:
;3651:	s = "Place Assaultfield";
ADDRLP4 4
ADDRGP4 $1484
ASGNP4
line 3652
;3652:	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 64
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
CNSTI4 4
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_Radar_MouseIn
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1486
ADDRLP4 60
ADDRGP4 colorRed
ASGNP4
ADDRGP4 $1487
JUMPV
LABELV $1486
ADDRLP4 60
ADDRGP4 colorWhite
ASGNP4
LABELV $1487
CNSTF4 1082130432
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3653
;3653:	y += CG_Text_Height( s, 0.20f, 0 ) + 2;
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 72
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 3655
;3654: 
;3655:	s = "Place BombSpot";
ADDRLP4 4
ADDRGP4 $1488
ASGNP4
line 3656
;3656:	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
CNSTI4 4
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 84
ADDRGP4 CG_Radar_MouseIn
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $1490
ADDRLP4 76
ADDRGP4 colorRed
ASGNP4
ADDRGP4 $1491
JUMPV
LABELV $1490
ADDRLP4 76
ADDRGP4 colorWhite
ASGNP4
LABELV $1491
CNSTF4 1082130432
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3657
;3657:	y += CG_Text_Height( s, 0.20f, 0 ) + 2;
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 88
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 3659
;3658:
;3659:	y += 20;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 3661
;3660:
;3661:	s = "Write File";
ADDRLP4 4
ADDRGP4 $1492
ASGNP4
line 3662
;3662:	CG_Text_Paint( 4, y, 0.20f, CG_Radar_MouseIn( 4, 300, y, y+CG_Text_Height( s, 0.20f, 0 ) + 2 )?colorRed:colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 96
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
CNSTI4 4
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 100
ADDRGP4 CG_Radar_MouseIn
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1494
ADDRLP4 92
ADDRGP4 colorRed
ASGNP4
ADDRGP4 $1495
JUMPV
LABELV $1494
ADDRLP4 92
ADDRGP4 colorWhite
ASGNP4
LABELV $1495
CNSTF4 1082130432
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3663
;3663:	y += CG_Text_Height( s, 0.20f, 0 ) + 2;
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 104
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 104
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 3665
;3664:
;3665:}
LABELV $1467
endproc CG_DrawEditRadar 108 32
proc CG_DrawTeamChat 56 36
line 3667
;3666:
;3667:static void CG_DrawTeamChat( void ) {
line 3676
;3668:	int w, h;
;3669:	int i, len;
;3670:	vec4_t		hcolor;
;3671:	int		chatHeight;
;3672:
;3673:#define CHATLOC_Y 420 // bottom end
;3674:#define CHATLOC_X 0
;3675:
;3676:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_teamChatHeight+12
INDIRI4
CNSTI4 15
GEI4 $1497
line 3677
;3677:		chatHeight = cg_teamChatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_teamChatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $1498
JUMPV
LABELV $1497
line 3679
;3678:	else
;3679:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 15
ASGNI4
LABELV $1498
line 3682
;3680:
;3681://	CG_Printf("draing to teamchat.\n");
;3682:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
ADDRGP4 cgs+205004
INDIRI4
ADDRGP4 cgs+205000
INDIRI4
EQI4 $1501
line 3683
;3683:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+205004
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+204940
ADDP4
INDIRI4
SUBI4
ADDRGP4 cg_teamChatTime+12
INDIRI4
LEI4 $1505
line 3684
;3684:			cgs.teamLastChatPos++;
ADDRLP4 36
ADDRGP4 cgs+205004
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3685
;3685:		}
LABELV $1505
line 3687
;3686:
;3687:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 cgs+205000
INDIRI4
ADDRGP4 cgs+205004
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 3689
;3688:
;3689:		w = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 3691
;3690:
;3691:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+205004
INDIRI4
ASGNI4
ADDRGP4 $1517
JUMPV
LABELV $1514
line 3692
;3692:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+201324
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 3693
;3693:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $1521
line 3694
;3694:				w = len;
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $1521
line 3695
;3695:		}
LABELV $1515
line 3691
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1517
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+205000
INDIRI4
LTI4 $1514
line 3696
;3696:		w *= TINYCHAR_WIDTH;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 3697
;3697:		w += TINYCHAR_WIDTH * 2;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 3699
;3698:
;3699:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1523
line 3700
;3700:			hcolor[0] = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 3701
;3701:			hcolor[1] = 0;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 3702
;3702:			hcolor[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 3703
;3703:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 3704
;3704:		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 $1524
JUMPV
LABELV $1523
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1529
line 3705
;3705:			hcolor[0] = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 3706
;3706:			hcolor[1] = 0;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 3707
;3707:			hcolor[2] = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 3708
;3708:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 3709
;3709:		} else {
ADDRGP4 $1530
JUMPV
LABELV $1529
line 3710
;3710:			hcolor[0] = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 3711
;3711:			hcolor[1] = 1;
ADDRLP4 12+4
CNSTF4 1065353216
ASGNF4
line 3712
;3712:			hcolor[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 3713
;3713:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 3714
;3714:		}
LABELV $1530
LABELV $1524
line 3716
;3715:
;3716:		trap_R_SetColor( hcolor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 3717
;3717:		CG_DrawPic( CHATLOC_X, CHATLOC_Y - h, 640, h, cgs.media.teamStatusBar );
CNSTF4 0
ARGF4
ADDRLP4 36
ADDRLP4 32
INDIRI4
ASGNI4
CNSTI4 420
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1142947840
ARGF4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+205084+20
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3718
;3718:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 3720
;3719:
;3720:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0;
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
ADDRLP4 12+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
ASGNF4
line 3721
;3721:		hcolor[3] = 1.0;
ADDRLP4 12+12
CNSTF4 1065353216
ASGNF4
line 3723
;3722:
;3723:		for (i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i--) {
ADDRLP4 0
ADDRGP4 cgs+205000
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1546
JUMPV
LABELV $1543
line 3724
;3724:			CG_DrawStringExt( CHATLOC_X + TINYCHAR_WIDTH, 
ADDRLP4 44
CNSTI4 8
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 420
ADDRGP4 cgs+205000
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 3
LSHI4
SUBI4
ARGI4
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+201324
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 3728
;3725:				CHATLOC_Y - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT, 
;3726:				cgs.teamChatMsgs[i % chatHeight], hcolor, qfalse, qfalse,
;3727:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;3728:		}
LABELV $1544
line 3723
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1546
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+205004
INDIRI4
GEI4 $1543
line 3729
;3729:	}
LABELV $1501
line 3730
;3730:}
LABELV $1496
endproc CG_DrawTeamChat 56 36
proc CG_DrawSpectator 16 32
line 3740
;3731:
;3732:
;3733://==============================================================================
;3734:
;3735:/*
;3736:=================
;3737:CG_DrawSpectator
;3738:=================
;3739:*/
;3740:static void CG_DrawSpectator(void) {
line 3744
;3741:	char *string;
;3742:	int w;
;3743:
;3744:	if ( cg.viewMissionInfo )
ADDRGP4 cg+171504
INDIRI4
CNSTI4 0
EQI4 $1552
line 3745
;3745:		return;
ADDRGP4 $1551
JUMPV
LABELV $1552
line 3748
;3746:
;3747:
;3748:	string = "SPECTATOR";
ADDRLP4 0
ADDRGP4 $1555
ASGNP4
line 3749
;3749:	w = CG_Text_Width(string, 0.3f, 0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1050253722
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 3750
;3750:	CG_Text_Paint( 320 - w / 2, 480-48, 0.3f, colorWhite, string, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138229248
ARGF4
CNSTF4 1050253722
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3752
;3751:	
;3752:	string = "press <USE> key to toggle Cam-mode";
ADDRLP4 0
ADDRGP4 $1556
ASGNP4
line 3753
;3753:	w = CG_Text_Width(string, 0.3f, 0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1050253722
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3754
;3754:	CG_Text_Paint( 320 - w / 2, 480-16, 0.3f, colorWhite, string, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1139277824
ARGF4
CNSTF4 1050253722
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3755
;3755:}
LABELV $1551
endproc CG_DrawSpectator 16 32
proc CG_DrawVote 16 32
line 3762
;3756:
;3757:/*
;3758:=================
;3759:CG_DrawVote
;3760:=================
;3761:*/
;3762:static void CG_DrawVote(void) {
line 3766
;3763:	char	*s;
;3764:	int		sec;
;3765:
;3766:	if ( !cgs.voteTime ) {
ADDRGP4 cgs+31672
INDIRI4
CNSTI4 0
NEI4 $1558
line 3767
;3767:		return;
ADDRGP4 $1557
JUMPV
LABELV $1558
line 3771
;3768:	}
;3769:
;3770:	// play a talk beep whenever it is modified
;3771:	if ( cgs.voteModified ) {
ADDRGP4 cgs+31684
INDIRI4
CNSTI4 0
EQI4 $1561
line 3772
;3772:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31684
CNSTI4 0
ASGNI4
line 3774
;3773:
;3774:		if ( cg_chatBeep.integer )
ADDRGP4 cg_chatBeep+12
INDIRI4
CNSTI4 0
EQI4 $1565
line 3775
;3775:			trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+205084+1464
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $1565
line 3776
;3776:	}
LABELV $1561
line 3778
;3777:
;3778:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+31672
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 3780
;3779:
;3780: 	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1572
line 3781
;3781:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3782
;3782:	}
LABELV $1572
line 3785
;3783:
;3784:	if ( 
;3785:			cgs.voteString[0] == 'F' &&
ADDRGP4 cgs+31688
INDIRI1
CVII4 1
CNSTI4 70
NEI4 $1574
ADDRGP4 cgs+31688+1
INDIRI1
CVII4 1
CNSTI4 111
NEI4 $1574
ADDRGP4 cgs+31688+2
INDIRI1
CVII4 1
CNSTI4 114
NEI4 $1574
ADDRGP4 cgs+31688+3
INDIRI1
CVII4 1
CNSTI4 103
NEI4 $1574
ADDRGP4 cgs+31688+4
INDIRI1
CVII4 1
CNSTI4 105
NEI4 $1574
ADDRGP4 cgs+31688+5
INDIRI1
CVII4 1
CNSTI4 118
NEI4 $1574
ADDRGP4 cgs+31688+6
INDIRI1
CVII4 1
CNSTI4 101
NEI4 $1574
line 3793
;3786:			cgs.voteString[1] == 'o' &&
;3787:			cgs.voteString[2] == 'r' &&
;3788:			cgs.voteString[3] == 'g' &&
;3789:			cgs.voteString[4] == 'i' &&
;3790:			cgs.voteString[5] == 'v' &&
;3791:			cgs.voteString[6] == 'e'
;3792:		)
;3793:	{
line 3794
;3794:		s = va("%s (%is left) Press F1 to forgive or F2 to refuse", cgs.voteString, sec );
ADDRGP4 $1589
ARGP4
ADDRGP4 cgs+31688
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 3796
;3795: 
;3796:		if ( sec == 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1575
line 3797
;3797:		{
line 3798
;3798:			cgs.voteTime = 0;
ADDRGP4 cgs+31672
CNSTI4 0
ASGNI4
line 3799
;3799:			cgs.voteModified = qfalse;
ADDRGP4 cgs+31684
CNSTI4 0
ASGNI4
line 3800
;3800:		}
line 3801
;3801:	}	
ADDRGP4 $1575
JUMPV
LABELV $1574
line 3803
;3802:	else
;3803:		s = va("Vote (%is left):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
ADDRGP4 $1595
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+31688
ARGP4
ADDRGP4 cgs+31676
INDIRI4
ARGI4
ADDRGP4 cgs+31680
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $1575
line 3804
;3804:	CG_Text_Paint( 4, 58, 0.20f, colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
CNSTF4 1082130432
ARGF4
CNSTF4 1114112000
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3806
;3805:
;3806:	s = "or press ESC then click Vote";
ADDRLP4 0
ADDRGP4 $1599
ASGNP4
line 3807
;3807:	CG_Text_Paint( 4, 58 + CG_Text_Height( s, 0.20f, 0 ) + 2, 0.20f, colorWhite, s, 0,0, ITEM_TEXTSTYLE_OUTLINED );
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
CNSTF4 1082130432
ARGF4
ADDRLP4 12
INDIRI4
CNSTI4 58
ADDI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3809
;3808: 
;3809:}
LABELV $1557
endproc CG_DrawVote 16 32
proc CG_DrawTeamVote 24 20
line 3816
;3810:
;3811:/*
;3812:=================
;3813:CG_DrawTeamVote
;3814:=================
;3815:*/
;3816:static void CG_DrawTeamVote(void) {
line 3820
;3817:	char	*s;
;3818:	int		sec, cs_offset;
;3819:
;3820:	if ( cgs.clientinfo->team == TEAM_RED )
ADDRGP4 cgs+38664+68
INDIRI4
CNSTI4 1
NEI4 $1601
line 3821
;3821:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1602
JUMPV
LABELV $1601
line 3822
;3822:	else if ( cgs.clientinfo->team == TEAM_BLUE )
ADDRGP4 cgs+38664+68
INDIRI4
CNSTI4 2
NEI4 $1600
line 3823
;3823:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3825
;3824:	else
;3825:		return;
LABELV $1606
LABELV $1602
line 3827
;3826:
;3827:	if ( !cgs.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+31944
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1609
line 3828
;3828:		return;
ADDRGP4 $1600
JUMPV
LABELV $1609
line 3832
;3829:	}
;3830:
;3831:	// play a talk beep whenever it is modified
;3832:	if ( cgs.teamVoteModified[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+31968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1612
line 3833
;3833:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+31968
ADDP4
CNSTI4 0
ASGNI4
line 3834
;3834:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+205084+1464
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3835
;3835:	}
LABELV $1612
line 3837
;3836:
;3837:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+31944
ADDP4
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 3838
;3838:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1620
line 3839
;3839:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3840
;3840:	}
LABELV $1620
line 3841
;3841:	s = va("Teamvote (%is left):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $1622
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 cgs+31976
ADDP4
ARGP4
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+31952
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+31960
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 3843
;3842:							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;3843:	CG_DrawSmallString( 0, 90, s, 1.0F );
CNSTI4 0
ARGI4
CNSTI4 90
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3844
;3844:}
LABELV $1600
endproc CG_DrawTeamVote 24 20
data
align 4
LABELV $1627
byte 4 1
code
proc CG_DrawScoreboard 20 8
line 3847
;3845:
;3846:
;3847:static qboolean CG_DrawScoreboard() {
line 3851
;3848: 	static qboolean firstTime = qtrue;
;3849:	float fade, *fadeColor;
;3850:
;3851:	if (menuScoreboard) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1628
line 3852
;3852:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
ADDRLP4 8
ADDRGP4 menuScoreboard
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -1048577
BANDI4
ASGNI4
line 3853
;3853:	}
LABELV $1628
line 3854
;3854:	if (cg_paused.integer) {
ADDRGP4 cg_paused+12
INDIRI4
CNSTI4 0
EQI4 $1630
line 3855
;3855:		cg.deferredPlayerLoading = 0;
ADDRGP4 cg+16
CNSTI4 0
ASGNI4
line 3856
;3856:		firstTime = qtrue;
ADDRGP4 $1627
CNSTI4 1
ASGNI4
line 3857
;3857:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1626
JUMPV
LABELV $1630
line 3861
;3858:	} 
;3859:
;3860:	// don't draw scoreboard during death while warmup up
;3861:	if ( cg.warmup && !cg.showScores ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 cg+115280
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1634
ADDRGP4 cg+112896
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1634
line 3862
;3862:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1626
JUMPV
LABELV $1634
line 3865
;3863:	}
;3864:
;3865:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+112896
INDIRI4
CNSTI4 0
NEI4 $1643
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 5
NEI4 $1638
LABELV $1643
line 3866
;3866:		fade = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 3867
;3867:		fadeColor = colorWhite;
ADDRLP4 0
ADDRGP4 colorWhite
ASGNP4
line 3868
;3868:	} else {
ADDRGP4 $1639
JUMPV
LABELV $1638
line 3869
;3869:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
ADDRGP4 cg+112904
INDIRI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 12
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 3870
;3870:		if ( !fadeColor ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1645
line 3872
;3871:			// next time scoreboard comes up, don't print killer
;3872:			cg.deferredPlayerLoading = 0;
ADDRGP4 cg+16
CNSTI4 0
ASGNI4
line 3873
;3873:			cg.killerName[0] = 0;
ADDRGP4 cg+112908
CNSTI1 0
ASGNI1
line 3874
;3874:			firstTime = qtrue;
ADDRGP4 $1627
CNSTI4 1
ASGNI4
line 3875
;3875:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1626
JUMPV
LABELV $1645
line 3877
;3876:		}
;3877:		fade = *fadeColor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
line 3878
;3878:	}																					  
LABELV $1639
line 3881
;3879:
;3880:
;3881:	if (menuScoreboard == NULL) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1649
line 3882
;3882:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $1651
line 3883
;3883:			menuScoreboard = Menus_FindByName("teamscore_menu");
ADDRGP4 $1654
ARGP4
ADDRLP4 12
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRGP4 menuScoreboard
ADDRLP4 12
INDIRP4
ASGNP4
line 3884
;3884:		} else {
ADDRGP4 $1652
JUMPV
LABELV $1651
line 3885
;3885:			menuScoreboard = Menus_FindByName("score_menu");
ADDRGP4 $1655
ARGP4
ADDRLP4 12
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRGP4 menuScoreboard
ADDRLP4 12
INDIRP4
ASGNP4
line 3886
;3886:		}
LABELV $1652
line 3887
;3887:	}
LABELV $1649
line 3889
;3888:
;3889:	if (menuScoreboard) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1656
line 3890
;3890:		if (firstTime) {
ADDRGP4 $1627
INDIRI4
CNSTI4 0
EQI4 $1658
line 3891
;3891:			CG_SetScoreSelection(menuScoreboard);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
ADDRGP4 CG_SetScoreSelection
CALLV
pop
line 3892
;3892:			firstTime = qfalse;
ADDRGP4 $1627
CNSTI4 0
ASGNI4
line 3893
;3893:		}
LABELV $1658
line 3894
;3894:		Menu_Paint(menuScoreboard, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 3895
;3895:	}
LABELV $1656
line 3898
;3896:
;3897:	// load any models that have been deferred
;3898:	if ( ++cg.deferredPlayerLoading > 10 ) {
ADDRLP4 12
ADDRGP4 cg+16
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 10
LEI4 $1660
line 3899
;3899:		CG_LoadDeferredPlayers();
ADDRGP4 CG_LoadDeferredPlayers
CALLV
pop
line 3900
;3900:	}
LABELV $1660
line 3902
;3901:
;3902:	return qtrue; 
CNSTI4 1
RETI4
LABELV $1626
endproc CG_DrawScoreboard 20 8
proc CG_DrawIntermission 4 0
line 3910
;3903:}
;3904:
;3905:/*
;3906:=================
;3907:CG_DrawIntermission
;3908:=================
;3909:*/
;3910:static void CG_DrawIntermission( void ) {
line 3923
;3911://	int key;
;3912:#ifdef MISSIONPACK
;3913:	//if (cg_singlePlayer.integer) {
;3914:	//	CG_DrawCenterString();
;3915:	//	return;
;3916:	//}
;3917:#else
;3918:	if ( cgs.gametype == GT_SINGLE_PLAYER ) {
;3919:		CG_DrawCenterString();
;3920:		return;
;3921:	}
;3922:#endif
;3923:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+112904
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 3924
;3924:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+112900
ADDRLP4 0
INDIRI4
ASGNI4
line 3925
;3925:}
LABELV $1663
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 52 32
line 3934
;3926:
;3927:/*
;3928:=================
;3929:CG_DrawFollow
;3930:=================
;3931:*/
;3932:char *xp_to_rank( int xp, int team );
;3933:
;3934:static qboolean CG_DrawFollow( void ) {
line 3938
;3935: 	int			w;
;3936:	vec4_t		color;
;3937:	const char	 *s;
;3938:	int			chaseclient = cg.snap->ps.clientNum;
ADDRLP4 24
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 3940
;3939:
;3940:	if ( cg.showScores )
ADDRGP4 cg+112896
INDIRI4
CNSTI4 0
EQI4 $1669
line 3941
;3941:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1667
JUMPV
LABELV $1669
line 3943
;3942:
;3943:	if ( !( cg.snap->ps.pm_flags & PMF_FOLLOW ) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1672
line 3944
;3944:		if ( cg.snap->ps.pm_type == PM_SPECTATOR ||
ADDRLP4 28
CNSTI4 48
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1679
ADDRGP4 cg+36
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1675
LABELV $1679
line 3946
;3945:				cg.snap->ps.pm_type == PM_NOCLIP )
;3946:		{
line 3948
;3947:
;3948:			if ( cg.viewMissionInfo )
ADDRGP4 cg+171504
INDIRI4
CNSTI4 0
EQI4 $1680
line 3949
;3949:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1667
JUMPV
LABELV $1680
line 3951
;3950:
;3951:			w = CG_Text_Width("Spectator", 0.55f, 0);
ADDRGP4 $1683
ARGP4
CNSTF4 1057803469
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 3953
;3952:
;3953:			CG_Text_Paint( 320 - w / 2, 48, 0.55f, colorWhite, S_COLOR_BLUE"Spectator", 0, 0, ITEM_TEXTSTYLE_OUTLINED);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1057803469
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $1684
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3955
;3954:			
;3955:		}
LABELV $1675
line 3956
;3956:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1667
JUMPV
LABELV $1672
line 3958
;3957:	}
;3958:	color[0] = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 3959
;3959:	color[1] = 1;
ADDRLP4 8+4
CNSTF4 1065353216
ASGNF4
line 3960
;3960:	color[2] = 1;
ADDRLP4 8+8
CNSTF4 1065353216
ASGNF4
line 3961
;3961:	color[3] = 1;
ADDRLP4 8+12
CNSTF4 1065353216
ASGNF4
line 3963
;3962:
;3963:	s = "Chasing Soldier:";		 
ADDRLP4 0
ADDRGP4 $1688
ASGNP4
line 3964
;3964:	w = CG_Text_Width(s, 0.3f, 0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1050253722
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 3966
;3965:
;3966:	CG_Text_Paint( 320 - w / 2, 24, 0.4f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
CNSTF4 1053609165
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3969
;3967: 
;3968: 
;3969:	cg.cameraFollowNumber = cg.snap->ps.weapon;
ADDRGP4 cg+116660
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 3971
;3970:
;3971: 	if ( cgs.gametype >= GT_TEAM )
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $1691
line 3972
;3972:		s = va("%s. %s",
ADDRLP4 32
CNSTI4 2484
ADDRLP4 24
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+38664+88
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+38664+68
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 xp_to_rank
CALLP4
ASGNP4
ADDRGP4 $1694
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 2484
ADDRLP4 24
INDIRI4
MULI4
ADDRGP4 cgs+38664+4
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
ADDRGP4 $1692
JUMPV
LABELV $1691
line 3976
;3973:		xp_to_rank( cgs.clientinfo[  chaseclient ].score, cgs.clientinfo[ chaseclient ].team), 
;3974:		cgs.clientinfo[ chaseclient ].name); 
;3975:	else
;3976:		s = va("%s",cgs.clientinfo[ chaseclient ].name);
ADDRGP4 $1701
ARGP4
CNSTI4 2484
ADDRLP4 24
INDIRI4
MULI4
ADDRGP4 cgs+38664+4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
LABELV $1692
line 3978
;3977: 
;3978:	w = CG_Text_Width(s, 0.4f, 0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1053609165
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 48
INDIRI4
ASGNI4
line 3980
;3979:
;3980:	CG_Text_Paint( 320 - w / 2, 48, 0.4f, colorLtBlue, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1053609165
ARGF4
ADDRGP4 colorLtBlue
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3982
;3981:
;3982:	return qtrue;
CNSTI4 1
RETI4
LABELV $1667
endproc CG_DrawFollow 52 32
proc CG_DrawWarmup 156 32
line 4032
;3983:}
;3984: 
;3985:
;3986:#if 0
;3987:/*
;3988:=================
;3989:CG_DrawProxWarning
;3990:=================
;3991:*/
;3992:static void CG_DrawProxWarning( void ) {
;3993:	char s [32];
;3994:	int			w;
;3995:  static int proxTime;
;3996:  static int proxCounter;
;3997:  static int proxTick;
;3998:
;3999:	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
;4000:    proxTime = 0;
;4001:		return;
;4002:	}
;4003:
;4004:  if (proxTime == 0) {
;4005:    proxTime = cg.time + 5000;
;4006:    proxCounter = 5;
;4007:    proxTick = 0;
;4008:  }
;4009:
;4010:  if (cg.time > proxTime) {
;4011:    proxTick = proxCounter--;
;4012:    proxTime = cg.time + 1000;
;4013:  }
;4014:
;4015:  if (proxTick != 0) {
;4016:    Com_sprintf(s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick);
;4017:  } else {
;4018:    Com_sprintf(s, sizeof(s), "YOU HAVE BEEN MINED");
;4019:  }
;4020:
;4021:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
;4022:	CG_DrawBigStringColor( 320 - w / 2, 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)] );
;4023:}
;4024:#endif
;4025:
;4026:
;4027:/*
;4028:=================
;4029:CG_DrawWarmup
;4030:=================
;4031:*/
;4032:static void CG_DrawWarmup( void ) {
line 4039
;4033:	int			w;
;4034:	int			sec; 
;4035:	float scale; 
;4036:	int			cw;
;4037:	const char	*s;
;4038:
;4039:	sec = cg.warmup;
ADDRLP4 0
ADDRGP4 cg+115280
INDIRI4
ASGNI4
line 4040
;4040:	if ( !sec ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1706
line 4041
;4041:		return;
ADDRGP4 $1704
JUMPV
LABELV $1706
line 4044
;4042:	}
;4043:
;4044:	if ( sec < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1708
line 4046
;4045:
;4046:		if ( cg.viewMissionInfo )
ADDRGP4 cg+171504
INDIRI4
CNSTI4 0
EQI4 $1710
line 4047
;4047:			return;
ADDRGP4 $1704
JUMPV
LABELV $1710
line 4049
;4048:
;4049:		s = "Waiting for players";		 
ADDRLP4 4
ADDRGP4 $1713
ASGNP4
line 4050
;4050:		w = CG_Text_Width(s, 0.3f, 0);
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1050253722
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 4052
;4051:
;4052:		CG_Text_Paint( 320 - w / 2, 24, 0.3f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
CNSTI4 320
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
CNSTF4 1050253722
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 4054
;4053: 
;4054:		cg.warmupCount = 0;
ADDRGP4 cg+115284
CNSTI4 0
ASGNI4
line 4055
;4055:		return;
ADDRGP4 $1704
JUMPV
LABELV $1708
line 4104
;4056:	}
;4057:	/*
;4058:
;4059: 	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) // seals
;4060:	{
;4061:		int value;
;4062:		extern	char SealBriefing[ 128 ][ MAX_CHARS_PER_LINE ];
;4063:		extern	int	sealBriefingLines; 
;4064:
;4065:		if ( sealBriefingLines > 0 ) 
;4066:		{
;4067:			int y;
;4068:
;4069:			y = 480 - ( (sealBriefingLines) + 4) * 16;
;4070:
;4071:			for ( value = 0; value < sealBriefingLines; value ++ )
;4072:			{
;4073:						w = CG_Text_Width(SealBriefing[value], 0.3f, 0);
;4074:
;4075:				CG_Text_Paint( 320 - w / 2, y, 0.3f, colorWhite, SealBriefing[value], 0, 0, ITEM_TEXTSTYLE_OUTLINED);
;4076:
;4077: 				y += 16;
;4078:			}	
;4079:		} 
;4080:	}
;4081:	else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) // seals
;4082:	{
;4083:		int value; 
;4084:		extern	char TangoBriefing[ 128 ][ MAX_CHARS_PER_LINE ];
;4085:		extern	int	tangoBriefingLines; 
;4086:
;4087:		if ( tangoBriefingLines > 0 ) 
;4088:		{
;4089:			int y;
;4090:
;4091:			y = 480 - ( (tangoBriefingLines) + 4) * 16;
;4092:
;4093:			for ( value = 0; value < tangoBriefingLines; value ++ )
;4094:			{
;4095:				w = CG_Text_Width(TangoBriefing[value], 0.3f, 0);
;4096:
;4097:				CG_Text_Paint( 320 - w / 2, y, 0.3f, colorWhite, TangoBriefing[value], 0, 0, ITEM_TEXTSTYLE_OUTLINED);
;4098: 				y += 16;
;4099:			}	
;4100:		} 
;4101:	}
;4102: */
;4103:
;4104:	sec = ( sec - cg.time ) / 1000;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 4105
;4105:	if ( sec < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1716
line 4106
;4106:		cg.warmup = 0;
ADDRGP4 cg+115280
CNSTI4 0
ASGNI4
line 4107
;4107:		sec = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4108
;4108:	}
LABELV $1716
line 4109
;4109:	s = va( "Starts in: "S_COLOR_RED"%i"S_COLOR_WHITE, sec + 1 );
ADDRGP4 $1719
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 4110
;4110:	if ( sec != cg.warmupCount ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+115284
INDIRI4
EQI4 $1720
line 4111
;4111:		cg.warmupCount = sec;
ADDRGP4 cg+115284
ADDRLP4 0
INDIRI4
ASGNI4
line 4112
;4112:		if ( sec < 10 )
ADDRLP4 0
INDIRI4
CNSTI4 10
GEI4 $1724
line 4113
;4113:		{
line 4118
;4114:
;4115:			// fixme: precache sounds
;4116:			char soundname[128];
;4117:			
;4118:			Com_sprintf( soundname, sizeof(soundname), "sound/commentary/%i.wav", sec+1 );
ADDRLP4 24
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1726
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4120
;4119:
;4120:			trap_S_StartLocalSound( trap_S_RegisterSound( soundname, qfalse ) , CHAN_ANNOUNCER );
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 152
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4121
;4121:		}
LABELV $1724
line 4122
;4122:	}
LABELV $1720
line 4123
;4123:	scale = 0.45f;
ADDRLP4 8
CNSTF4 1055286886
ASGNF4
line 4124
;4124:	switch ( cg.warmupCount ) {
ADDRLP4 24
ADDRGP4 cg+115284
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1730
ADDRLP4 24
INDIRI4
CNSTI4 1
EQI4 $1731
ADDRLP4 24
INDIRI4
CNSTI4 2
EQI4 $1732
ADDRGP4 $1727
JUMPV
LABELV $1730
line 4126
;4125:	case 0:
;4126:		cw = 28;
ADDRLP4 16
CNSTI4 28
ASGNI4
line 4127
;4127:		scale = 0.54f;
ADDRLP4 8
CNSTF4 1057635697
ASGNF4
line 4128
;4128:		break;
ADDRGP4 $1728
JUMPV
LABELV $1731
line 4130
;4129:	case 1:
;4130:		cw = 24;
ADDRLP4 16
CNSTI4 24
ASGNI4
line 4131
;4131:		scale = 0.51f;
ADDRLP4 8
CNSTF4 1057132380
ASGNF4
line 4132
;4132:		break;
ADDRGP4 $1728
JUMPV
LABELV $1732
line 4134
;4133:	case 2:
;4134:		cw = 20;
ADDRLP4 16
CNSTI4 20
ASGNI4
line 4135
;4135:		scale = 0.48f;
ADDRLP4 8
CNSTF4 1056293519
ASGNF4
line 4136
;4136:		break;
ADDRGP4 $1728
JUMPV
LABELV $1727
line 4138
;4137:	default:
;4138:		cw = 16;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 4139
;4139:		scale = 0.45f;
ADDRLP4 8
CNSTF4 1055286886
ASGNF4
line 4140
;4140:		break;
LABELV $1728
line 4144
;4141:	}
;4142:  
;4143:
;4144:	w = CG_Text_Width(s, scale, 0);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 4146
;4145:
;4146:	CG_Text_Paint( 320 - w / 2, 70, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
CNSTI4 320
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1116471296
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 4148
;4147:
;4148:}
LABELV $1704
endproc CG_DrawWarmup 156 32
export CG_DrawTimedMenus
proc CG_DrawTimedMenus 4 8
line 4157
;4149:
;4150://==================================================================================
;4151:#ifdef MISSIONPACK
;4152:/* 
;4153:=================
;4154:CG_DrawTimedMenus
;4155:=================
;4156:*/
;4157:void CG_DrawTimedMenus() {
line 4158
;4158:	if (cg.voiceTime) {
ADDRGP4 cg+115056
INDIRI4
CNSTI4 0
EQI4 $1734
line 4159
;4159:		int t = cg.time - cg.voiceTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+115056
INDIRI4
SUBI4
ASGNI4
line 4160
;4160:		if ( t > 2500 ) { 
ADDRLP4 0
INDIRI4
CNSTI4 2500
LEI4 $1739
line 4161
;4161:			trap_Cvar_Set("cl_conXOffset", "0");
ADDRGP4 $1741
ARGP4
ADDRGP4 $1742
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4162
;4162:			cg.voiceTime = 0;
ADDRGP4 cg+115056
CNSTI4 0
ASGNI4
line 4163
;4163:		}
LABELV $1739
line 4164
;4164:	}
LABELV $1734
line 4165
;4165:}
LABELV $1733
endproc CG_DrawTimedMenus 4 8
lit
align 4
LABELV $1750
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1051931443
align 4
LABELV $1761
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1051931443
export CG_DrawMouse
code
proc CG_DrawMouse 40 20
line 4172
;4166:#endif
;4167:  
;4168:extern vmCvar_t	cg_hudStyle;
;4169:void CG_DrawPic2( float x, float y, float width, float height, qhandle_t hShader );
;4170:
;4171:void CG_DrawMouse(int x,int y, int height, int width )
;4172:{ 
line 4175
;4173:	qhandle_t	hShader;  
;4174:
;4175:	hShader = cgDC.Assets.cursor; 
ADDRLP4 0
ADDRGP4 cgDC+232+61656
INDIRI4
ASGNI4
line 4179
;4176://CG_Printf("drawmouse: %i %i", x , y );
;4177:
;4178:// after we've setted the color draw the pic
;4179:	CG_DrawPic( x-16, y-16, width, height, hShader );
ADDRLP4 4
CNSTI4 16
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 4181
;4180:
;4181:	if ( cgs.eventHandling == CGAME_EVENT_EDITHUD ) 
ADDRGP4 cgs+205016
INDIRI4
CNSTI4 3
NEI4 $1747
line 4182
;4182:	{
line 4183
;4183:		vec4_t whiteTrans = { 1.0f,1.0f,1.0f,0.35f };
ADDRLP4 16
ADDRGP4 $1750
INDIRB
ASGNB 16
line 4184
;4184:		int	width = 130;
ADDRLP4 8
CNSTI4 130
ASGNI4
line 4185
;4185:		int height = 220;
ADDRLP4 12
CNSTI4 220
ASGNI4
line 4186
;4186:		int x2 = cgs.cursorX * ( 1024.0f/640 );
ADDRLP4 32
CNSTF4 1070386381
ADDRGP4 cgs+205008
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4187
;4187:		int y2 = cgs.cursorY * ( 768.0f/480 );
ADDRLP4 36
CNSTF4 1070386381
ADDRGP4 cgs+205012
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 4189
;4188:
;4189:		if ( cg_hudStyle.integer == 2 )
ADDRGP4 cg_hudStyle+12
INDIRI4
CNSTI4 2
NEI4 $1753
line 4190
;4190:		{
line 4191
;4191:			width = 200;
ADDRLP4 8
CNSTI4 200
ASGNI4
line 4192
;4192:			height = 96;
ADDRLP4 12
CNSTI4 96
ASGNI4
line 4193
;4193:		}
LABELV $1753
line 4194
;4194:		trap_R_SetColor( whiteTrans );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 4195
;4195:		CG_DrawPic2( x2, y2, width, height, cgs.media.whiteShader );
ADDRLP4 32
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+205084+16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic2
CALLV
pop
line 4196
;4196:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 4197
;4197:	}
ADDRGP4 $1748
JUMPV
LABELV $1747
line 4198
;4198:	else if ( cgs.eventHandling == CGAME_EVENT_EDITRADARPOS )
ADDRGP4 cgs+205016
INDIRI4
CNSTI4 6
NEI4 $1758
line 4199
;4199:	{
line 4200
;4200:		vec4_t whiteTrans = { 1.0f,1.0f,1.0f,0.35f };
ADDRLP4 8
ADDRGP4 $1761
INDIRB
ASGNB 16
line 4202
;4201:		
;4202:		CG_FillRect( cgs.cursorX-40, cgs.cursorY-40, 80, 80, whiteTrans );
ADDRLP4 24
CNSTI4 40
ASGNI4
ADDRGP4 cgs+205008
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 cgs+205012
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 28
CNSTF4 1117782016
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 8
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 4203
;4203:	}
LABELV $1758
LABELV $1748
line 4205
;4204: 
;4205:}
LABELV $1744
endproc CG_DrawMouse 40 20
proc CG_Draw2D 28 32
line 4218
;4206:
;4207:void CG_QCmd_HandleMenu( void );
;4208:void CG_DrawScrutchHud( void );
;4209:void CG_DrawSpectatorHud( void );
;4210:extern	vmCvar_t	cg_drawScriptedUI;
;4211:
;4212:/*
;4213:=================
;4214:CG_Draw2D
;4215:=================
;4216:*/
;4217:static void CG_Draw2D( void ) 
;4218:{
line 4221
;4219: 
;4220:	// if we are taking a levelshot for the menu, don't draw anything
;4221:	if ( cg.levelShot ) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $1765
line 4222
;4222:		return;
ADDRGP4 $1764
JUMPV
LABELV $1765
line 4225
;4223:	}
;4224:
;4225:	CG_DrawDeathblend( );
ADDRGP4 CG_DrawDeathblend
CALLV
pop
line 4226
;4226:	CG_DrawSmokeblend( );
ADDRGP4 CG_DrawSmokeblend
CALLV
pop
line 4229
;4227:
;4228:	// headdamage always on
;4229:	if( cg.snap->ps.pm_type == PM_NORMAL && (cg.snap->ps.stats[STAT_HEAD_DAMAGE] > 10 || cg.snap->ps.stats[STAT_HEALTH] < 50) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1768
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 10
GTI4 $1773
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 50
GEI4 $1768
LABELV $1773
line 4230
;4230:	{
line 4234
;4231:		vec4_t		hcolor;
;4232:
;4233:		// set color based on health
;4234:		hcolor[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4235
;4235:		hcolor[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 4236
;4236:		hcolor[2] = 0.0f;		
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4237
;4237:		hcolor[3] = (25 + 100 - ( cg.snap->ps.stats[STAT_HEAD_DAMAGE] + 100 - cg.snap->ps.stats[STAT_HEALTH] )) * 0.001 * sin(cg.time / 100.0) + 0.6 - (cg.snap->ps.stats[STAT_HEALTH] * 0.5 / 100) ;
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1120403456
DIVF4
ARGF4
ADDRLP4 16
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
CNSTF4 981668463
CNSTI4 125
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 100
ADDI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
SUBI4
SUBI4
CVIF4 4
MULF4
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1058642330
ADDF4
CNSTF4 1056964608
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
SUBF4
ASGNF4
line 4239
;4238:
;4239:		if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1781
line 4240
;4240:			hcolor[3] = 0.9f;
ADDRLP4 0+12
CNSTF4 1063675494
ASGNF4
LABELV $1781
line 4241
;4241:		if(hcolor[3] > 1 )
ADDRLP4 0+12
INDIRF4
CNSTF4 1065353216
LEF4 $1785
line 4242
;4242:			hcolor[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
ADDRGP4 $1786
JUMPV
LABELV $1785
line 4243
;4243:		else if(hcolor[3] < 0)
ADDRLP4 0+12
INDIRF4
CNSTF4 0
GEF4 $1789
line 4244
;4244:			hcolor[3] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
LABELV $1789
LABELV $1786
line 4246
;4245:
;4246:		trap_R_SetColor( hcolor );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 4247
;4247:		CG_FillRect( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT, hcolor);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 4248
;4248:		trap_R_SetColor( NULL ); 
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 4249
;4249:	}
LABELV $1768
line 4251
;4250:
;4251:	if ( cg_draw2D.integer == 0 ) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1793
line 4252
;4252:		return;
ADDRGP4 $1764
JUMPV
LABELV $1793
line 4255
;4253:	}
;4254:
;4255:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {		
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1796
line 4256
;4256:		CG_DrawChat();
ADDRGP4 CG_DrawChat
CALLV
pop
line 4257
;4257:		CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 4258
;4258:		return;
ADDRGP4 $1764
JUMPV
LABELV $1796
line 4261
;4259:	}
;4260:
;4261:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1799
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $1799
line 4263
;4262:		cgs.gametype == GT_TEAM )
;4263:	{
line 4266
;4264:		char *string;
;4265:		int w;
;4266:		float deathTime = ( ( (float)cg.deathTime + (float)((cgs.teamRespawn > 0)?(cgs.teamRespawn):(2500))*1000 ) - (float)cg.time ) / 1000.0f;
ADDRGP4 cgs+214108
INDIRI4
CNSTI4 0
LEI4 $1808
ADDRLP4 12
ADDRGP4 cgs+214108
INDIRI4
ASGNI4
ADDRGP4 $1809
JUMPV
LABELV $1808
ADDRLP4 12
CNSTI4 2500
ASGNI4
LABELV $1809
ADDRLP4 0
ADDRGP4 cg+201984
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
ADDF4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1148846080
DIVF4
ASGNF4
line 4268
;4267:  		
;4268:		if ( cgs.squadAssault )
ADDRGP4 cgs+214112
INDIRI4
CNSTI4 0
EQI4 $1810
line 4269
;4269:			deathTime = ( (float)cgs.levelRoundStartTime  - (float)cg.time ) / 1000.0f;
ADDRLP4 0
ADDRGP4 cgs+214076
INDIRI4
CVIF4 4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1148846080
DIVF4
ASGNF4
LABELV $1810
line 4271
;4270:
;4271:		if ( deathTime > 0.0f )
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1815
line 4272
;4272:			string = va( "Respawn in: "S_COLOR_RED"%.1fs", deathTime );
ADDRGP4 $1817
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
ADDRGP4 $1816
JUMPV
LABELV $1815
line 4274
;4273:		else
;4274:			string = va( "Press "S_COLOR_RED"USE"S_COLOR_WHITE" or "S_COLOR_RED"FIRE"S_COLOR_WHITE" to Respawn" );
ADDRGP4 $1818
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
LABELV $1816
line 4276
;4275:
;4276:		w =	CG_Text_Width( string, 0.5f, 0 );
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1056964608
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 4277
;4277:		CG_Text_Paint( 320 - w / 2, 480-48, 0.5f, colorWhite, string, 0, 0, ITEM_TEXTSTYLE_OUTLINED);
CNSTI4 320
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138229248
ARGF4
CNSTF4 1056964608
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 4278
;4278:	}
LABELV $1799
line 4281
;4279:
;4280:	if (
;4281:		( cgs.eventHandling == CGAME_EVENT_EDITRADARPOS ||
ADDRGP4 cgs+205016
INDIRI4
CNSTI4 6
EQI4 $1825
ADDRGP4 cgs+205016
INDIRI4
CNSTI4 3
NEI4 $1819
LABELV $1825
ADDRLP4 0
CNSTI4 48
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1826
ADDRGP4 cg+36
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1819
LABELV $1826
line 4285
;4282:			cgs.eventHandling == CGAME_EVENT_EDITHUD ) &&
;4283:			( cg.snap->ps.pm_type == PM_SPECTATOR || cg.snap->ps.pm_type == PM_NOCLIP )
;4284:			)
;4285:	{
line 4286
;4286:		CG_DrawRadar();
ADDRGP4 CG_DrawRadar
CALLV
pop
line 4288
;4287:		
;4288:		CG_DrawScrutchHud();
ADDRGP4 CG_DrawScrutchHud
CALLV
pop
line 4289
;4289:	}
ADDRGP4 $1820
JUMPV
LABELV $1819
line 4290
;4290:	else if ( ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.pm_type == PM_SPECTATOR || cg.snap->ps.pm_type == PM_NOCLIP ) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1833
ADDRLP4 4
CNSTI4 48
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1833
ADDRGP4 cg+36
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1827
LABELV $1833
line 4291
;4291:		if ( !cg.showScores && cg.viewMissionInfo == qfalse  )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 cg+112896
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1828
ADDRGP4 cg+171504
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1828
line 4292
;4292:		{
line 4293
;4293:			Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 4294
;4294:			CG_DrawTimedMenus(); 
ADDRGP4 CG_DrawTimedMenus
CALLV
pop
line 4295
;4295:			CG_DrawSpectatorHud();
ADDRGP4 CG_DrawSpectatorHud
CALLV
pop
line 4296
;4296:		}
line 4297
;4297:	} else {
ADDRGP4 $1828
JUMPV
LABELV $1827
line 4298
;4298:		if ( cg.snap->ps.stats[STAT_HEALTH] > 0 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1838
line 4299
;4299:		{ 
line 4300
;4300:			if ( ! CG_DrawThermalGoggles() ) // ns       // only draw sniperrifle crosshair
ADDRLP4 8
ADDRGP4 CG_DrawThermalGoggles
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1841
line 4301
;4301:				CG_DrawSniperRifle(); // ns        // if not in thermalgoggle mode
ADDRGP4 CG_DrawSniperRifle
CALLV
pop
LABELV $1841
line 4304
;4302:
;4303://			CG_DrawMapOverview(); 
;4304:			CG_DrawFlashed();  
ADDRGP4 CG_DrawFlashed
CALLV
pop
line 4305
;4305:			CG_DrawBlend(); 
ADDRGP4 CG_DrawBlend
CALLV
pop
line 4306
;4306:			CG_DrawDamageFeedback(); // screenblend
ADDRGP4 CG_DrawDamageFeedback
CALLV
pop
line 4307
;4307:		}     
LABELV $1838
line 4309
;4308:		// don't draw any status if dead or the scoreboard is being explicitly shown
;4309:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0  && cg.viewMissionInfo == qfalse )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 cg+112896
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1843
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $1843
ADDRGP4 cg+171504
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1843
line 4310
;4310:		{ 
line 4311
;4311:            CG_DrawCrosshair(); 
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 4312
;4312: 			CG_DrawWeaponSelect(); 
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 4313
;4313:			CG_DrawC4(); 
ADDRGP4 CG_DrawC4
CALLV
pop
line 4314
;4314: 			CG_DrawRadar();
ADDRGP4 CG_DrawRadar
CALLV
pop
line 4317
;4315:
;4316:			// draw scripted hud/ui 
;4317:			if ( cg_drawScriptedUI.integer )
ADDRGP4 cg_drawScriptedUI+12
INDIRI4
CNSTI4 0
EQI4 $1848
line 4318
;4318:			{ 
line 4319
;4319:				Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 4320
;4320:				CG_DrawTimedMenus();
ADDRGP4 CG_DrawTimedMenus
CALLV
pop
line 4321
;4321:			}
LABELV $1848
line 4324
;4322: 
;4323:			// draw hud
;4324:			CG_DrawScrutchHud();
ADDRGP4 CG_DrawScrutchHud
CALLV
pop
line 4325
;4325:		}
LABELV $1843
line 4327
;4326:
;4327:	}
LABELV $1828
LABELV $1820
line 4330
;4328:	
;4329://	CG_DrawMissionhelpers(); 
;4330:	CG_DrawChat();
ADDRGP4 CG_DrawChat
CALLV
pop
line 4333
;4331://	CG_DrawTeamChat(); 
;4332:
;4333:	CG_DrawEditRadar();
ADDRGP4 CG_DrawEditRadar
CALLV
pop
line 4335
;4334:
;4335:	CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 4336
;4336:	CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 4338
;4337: 
;4338:	if ( cg.viewCmd )
ADDRGP4 cg+171500
INDIRI4
CNSTI4 0
EQI4 $1851
line 4339
;4339:		CG_QCmd_HandleMenu( );
ADDRGP4 CG_QCmd_HandleMenu
CALLV
pop
LABELV $1851
line 4341
;4340:
;4341:	CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 4343
;4342: 
;4343: 	if (!cg_paused.integer) {
ADDRGP4 cg_paused+12
INDIRI4
CNSTI4 0
NEI4 $1854
line 4344
;4344:		CG_DrawUpperRight();
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 4345
;4345:	} 
LABELV $1854
line 4351
;4346:#ifndef MISSIONPACK
;4347:	CG_DrawUpperRight();
;4348:	CG_DrawLowerLeft(); 
;4349:#endif
;4350:
;4351:	if ( !CG_DrawFollow() ) {
ADDRLP4 8
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1857
line 4352
;4352:		CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 4353
;4353:	}
LABELV $1857
line 4356
;4354:
;4355:	// don't draw center string if scoreboard is up
;4356:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 12
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+112900
ADDRLP4 12
INDIRI4
ASGNI4
line 4357
;4357:	if ( !cg.scoreBoardShowing) {
ADDRGP4 cg+112900
INDIRI4
CNSTI4 0
NEI4 $1860
line 4358
;4358:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 4359
;4359:	}
LABELV $1860
line 4360
;4360:	CG_DrawNewbieMessage();
ADDRGP4 CG_DrawNewbieMessage
CALLV
pop
line 4361
;4361:	CG_MissionInformation();
ADDRGP4 CG_MissionInformation
CALLV
pop
line 4364
;4362://	CG_DrawMenu();
;4363:
;4364:	if (trap_Key_GetCatcher() & KEYCATCH_CGAME  ) 
ADDRLP4 16
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1863
line 4365
;4365:		CG_DrawMouse( cgs.cursorX, cgs.cursorY, 32,32 ); 
ADDRGP4 cgs+205008
INDIRI4
ARGI4
ADDRGP4 cgs+205012
INDIRI4
ARGI4
ADDRLP4 20
CNSTI4 32
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawMouse
CALLV
pop
LABELV $1863
line 4366
;4366:}
LABELV $1764
endproc CG_Draw2D 28 32
proc CG_DrawTourneyScoreboard 0 0
line 4369
;4367:
;4368:
;4369:static void CG_DrawTourneyScoreboard() {
line 4374
;4370:#ifdef MISSIONPACK
;4371:#else
;4372:	CG_DrawOldTourneyScoreboard();
;4373:#endif
;4374:}
LABELV $1867
endproc CG_DrawTourneyScoreboard 0 0
export CG_DrawActive
proc CG_DrawActive 32 4
line 4383
;4375:
;4376:/*
;4377:=====================
;4378:CG_DrawActive
;4379:
;4380:Perform all drawing needed to completely fill the screen
;4381:=====================
;4382:*/
;4383:void CG_DrawActive( stereoFrame_t stereoView ) {
line 4388
;4384:	float		separation;
;4385:	vec3_t		baseOrg;
;4386:
;4387:	// optionally draw the info screen instead
;4388:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1869
line 4389
;4389:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 4390
;4390:		return;
ADDRGP4 $1868
JUMPV
LABELV $1869
line 4394
;4391:	}
;4392:
;4393:	// optionally draw the tournement scoreboard instead
;4394:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1872
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1872
line 4395
;4395:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 4396
;4396:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 4397
;4397:		return;
ADDRGP4 $1868
JUMPV
LABELV $1872
line 4400
;4398:	}
;4399:
;4400:	switch ( stereoView ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1879
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $1880
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $1882
ADDRGP4 $1876
JUMPV
LABELV $1879
line 4402
;4401:		case STEREO_CENTER:
;4402:			separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4403
;4403:			break;
ADDRGP4 $1877
JUMPV
LABELV $1880
line 4405
;4404:		case STEREO_LEFT:
;4405:			separation = -cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4406
;4406:			break;
ADDRGP4 $1877
JUMPV
LABELV $1882
line 4408
;4407:		case STEREO_RIGHT:
;4408:			separation = cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4409
;4409:			break;
ADDRGP4 $1877
JUMPV
LABELV $1876
line 4411
;4410:		default:
;4411:			separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4412
;4412:			CG_Error( "CG_DrawActive: Undefined stereoView" );
ADDRGP4 $1884
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 4413
;4413:	}
LABELV $1877
line 4417
;4414:
;4415:
;4416:	// clear around the rendered view if sized down
;4417:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 4420
;4418:
;4419:	// offset vieworg appropriately if we're doing stereo separation
;4420:	VectorCopy( cg.refdef.vieworg, baseOrg );
ADDRLP4 4
ADDRGP4 cg+109044+24
INDIRB
ASGNB 12
line 4421
;4421:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1887
line 4422
;4422:		VectorMA( cg.refdef.vieworg, -separation, cg.refdef.viewaxis[1], cg.refdef.vieworg );
ADDRGP4 cg+109044+24
ADDRGP4 cg+109044+24
INDIRF4
ADDRGP4 cg+109044+36+12
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+109044+24+4
ADDRGP4 cg+109044+24+4
INDIRF4
ADDRGP4 cg+109044+36+12+4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+109044+24+8
ADDRGP4 cg+109044+24+8
INDIRF4
ADDRGP4 cg+109044+36+12+8
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 4423
;4423:	}
LABELV $1887
line 4426
;4424: 
;4425:#ifdef SAME_WEAPONPIPE
;4426:	{
line 4427
;4427:			if ( BG_IsMelee( cg.snap->ps.weapon ) || cg_nopredict.integer )
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1920
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1916
LABELV $1920
line 4428
;4428:		CG_WeaponAnimation( &cg.snap->ps );
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRGP4 CG_WeaponAnimation
CALLV
pop
ADDRGP4 $1917
JUMPV
LABELV $1916
line 4430
;4429:	else
;4430:		CG_WeaponAnimation( &cg.predictedPlayerState );  
ADDRGP4 cg+107636
ARGP4
ADDRGP4 CG_WeaponAnimation
CALLV
pop
LABELV $1917
line 4431
;4431:	}
line 4434
;4432:#endif
;4433:	// draw 3D view
;4434:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+109044
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 4437
;4435:
;4436:	// restore original viewpoint if running stereo
;4437:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1924
line 4438
;4438:		VectorCopy( baseOrg, cg.refdef.vieworg );
ADDRGP4 cg+109044+24
ADDRLP4 4
INDIRB
ASGNB 12
line 4439
;4439:	}
LABELV $1924
line 4452
;4440:#ifndef SAME_WEAPONPIPE
;4441:	if ( BG_IsMelee( cg.snap->ps.weapon ) || cg_nopredict.integer )
;4442:		CG_WeaponAnimation( &cg.snap->ps );
;4443:	else
;4444:		CG_WeaponAnimation( &cg.predictedPlayerState );
;4445:
;4446:  	CG_AddLocalEntities( qtrue );
;4447:
;4448:	if (!test_x.integer )
;4449: 		trap_R_RenderScene( &cg.weaponrefdef ); 
;4450:#endif
;4451:	// draw status bar and other floating elements
;4452: 	CG_Draw2D();
ADDRGP4 CG_Draw2D
CALLV
pop
line 4455
;4453:
;4454://	void ClientScript_Update( void )
;4455:	ClientScript_Update();
ADDRGP4 ClientScript_Update
CALLV
pop
line 4456
;4456:}
LABELV $1868
endproc CG_DrawActive 32 4
import cg_drawScriptedUI
import CG_DrawSpectatorHud
import CG_DrawScrutchHud
import CG_QCmd_HandleMenu
import CG_DrawPic2
import cg_hudStyle
import xp_to_rank
import CG_WriteRadarInfoToBRF_f
import cg_radarY
import cg_radarX
import cg_drawRadar
import cg_crosshairWidth
import cg_crosshair_b
import cg_crosshair_g
import cg_crosshair_r
bss
export lagometer
align 4
LABELV lagometer
skip 1544
import tangoBriefingLines
import TangoBriefing
import sealBriefingLines
import SealBriefing
import CG_ButtonPushed
import cgDC
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
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
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_OwnerDraw
import CG_DrawFlagModel
export teamChat2
align 1
LABELV teamChat2
skip 256
export teamChat1
align 1
LABELV teamChat1
skip 256
export systemChat
align 1
LABELV systemChat
skip 256
import drawTeamOverlayModificationCount
export numSortedTeamPlayers
align 4
LABELV numSortedTeamPlayers
skip 4
export sortedTeamPlayers
align 4
LABELV sortedTeamPlayers
skip 128
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawTinyStringColor
import CG_DrawStringOutline
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt2
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
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
lit
align 1
LABELV $1884
byte 1 67
byte 1 71
byte 1 95
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 85
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 111
byte 1 86
byte 1 105
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $1818
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 94
byte 1 49
byte 1 85
byte 1 83
byte 1 69
byte 1 94
byte 1 55
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 94
byte 1 49
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1817
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 46
byte 1 49
byte 1 102
byte 1 115
byte 1 0
align 1
LABELV $1742
byte 1 48
byte 1 0
align 1
LABELV $1741
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 88
byte 1 79
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1726
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 121
byte 1 47
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1719
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 105
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $1713
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $1701
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1694
byte 1 37
byte 1 115
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1688
byte 1 67
byte 1 104
byte 1 97
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 111
byte 1 108
byte 1 100
byte 1 105
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1684
byte 1 94
byte 1 52
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1683
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1655
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1654
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1622
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1599
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1595
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1589
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 41
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 70
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 70
byte 1 50
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1556
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 60
byte 1 85
byte 1 83
byte 1 69
byte 1 62
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 67
byte 1 97
byte 1 109
byte 1 45
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1555
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $1492
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1488
byte 1 80
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 66
byte 1 111
byte 1 109
byte 1 98
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $1484
byte 1 80
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 65
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $1480
byte 1 80
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 66
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1476
byte 1 80
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 69
byte 1 120
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1472
byte 1 80
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 86
byte 1 73
byte 1 80
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 99
byte 1 117
byte 1 101
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1471
byte 1 82
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 69
byte 1 100
byte 1 105
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $1428
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 82
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 32
byte 1 79
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 99
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1356
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $1339
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $1338
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 95
byte 1 98
byte 1 0
align 1
LABELV $1337
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 95
byte 1 109
byte 1 0
align 1
LABELV $1336
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 100
byte 1 110
byte 1 0
align 1
LABELV $1335
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1334
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 0
align 1
LABELV $1333
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1332
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $1331
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 95
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $932
byte 1 65
byte 1 0
align 1
LABELV $839
byte 1 115
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $774
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 101
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $770
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $683
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $682
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 94
byte 1 49
byte 1 85
byte 1 115
byte 1 101
byte 1 94
byte 1 55
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $675
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 98
byte 1 103
byte 1 50
byte 1 0
align 1
LABELV $666
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 98
byte 1 103
byte 1 49
byte 1 0
align 1
LABELV $360
byte 1 112
byte 1 108
byte 1 97
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 110
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $335
byte 1 37
byte 1 105
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $326
byte 1 49
byte 1 48
byte 1 48
byte 1 70
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $315
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 0
