export Com_Clamp
code
proc Com_Clamp 0 0
file "../../game/q_shared.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "q_shared.h"
;5:
;6:float Com_Clamp( float min, float max, float value ) {
line 7
;7:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $23
line 8
;8:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $22
JUMPV
LABELV $23
line 10
;9:	}
;10:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $25
line 11
;11:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $22
JUMPV
LABELV $25
line 13
;12:	}
;13:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $22
endproc Com_Clamp 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 23
;14:}
;15:
;16:
;17:/*
;18:============
;19:COM_SkipPath
;20:============
;21:*/
;22:char *COM_SkipPath (char *pathname)
;23:{
line 26
;24:	char	*last;
;25:	
;26:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $29
JUMPV
LABELV $28
line 28
;27:	while (*pathname)
;28:	{
line 29
;29:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $31
line 30
;30:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $31
line 31
;31:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 32
;32:	}
LABELV $29
line 27
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $28
line 33
;33:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $27
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 0
line 41
;34:}
;35:
;36:/*
;37:============
;38:COM_StripExtension
;39:============
;40:*/
;41:void COM_StripExtension( const char *in, char *out ) {
ADDRGP4 $35
JUMPV
LABELV $34
line 42
;42:	while ( *in && *in != '.' ) {
line 43
;43:		*out++ = *in++;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI1
ASGNI1
line 44
;44:	}
LABELV $35
line 42
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $37
ADDRLP4 0
INDIRI4
CNSTI4 46
NEI4 $34
LABELV $37
line 45
;45:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 46
;46:}
LABELV $33
endproc COM_StripExtension 12 0
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 54
;47:
;48:
;49:/*
;50:==================
;51:COM_DefaultExtension
;52:==================
;53:*/
;54:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 62
;55:	char	oldPath[MAX_QPATH];
;56:	char    *src;
;57:
;58://
;59:// if path doesn't have a .EXT, append extension
;60:// (extension should include the .)
;61://
;62:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $40
JUMPV
LABELV $39
line 64
;63:
;64:	while (*src != '/' && src != path) {
line 65
;65:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $42
line 66
;66:			return;                 // it has an extension
ADDRGP4 $38
JUMPV
LABELV $42
line 68
;67:		}
;68:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 69
;69:	}
LABELV $40
line 64
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $44
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $39
LABELV $44
line 71
;70:
;71:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 72
;72:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $45
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 73
;73:}
LABELV $38
endproc COM_DefaultExtension 76 20
export BigShort
proc BigShort 4 4
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 94
;74:
;75:/*
;76:============================================================================
;77:
;78:					BYTE ORDER FUNCTIONS
;79:
;80:============================================================================
;81:*/
;82:
;83:// can't just use function pointers, or dll linkage can
;84:// mess up when qcommon is included in multiple places
;85:static short	(*_BigShort) (short l);
;86:static short	(*_LittleShort) (short l);
;87:static int		(*_BigLong) (int l);
;88:static int		(*_LittleLong) (int l);
;89:static qint64	(*_BigLong64) (qint64 l);
;90:static qint64	(*_LittleLong64) (qint64 l);
;91:static float	(*_BigFloat) (float l);
;92:static float	(*_LittleFloat) (float l);
;93:
;94:short	BigShort(short l){return _BigShort(l);}
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 0
ADDRGP4 _BigShort
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CVII2 4
CVII4 2
RETI4
LABELV $46
endproc BigShort 4 4
export LittleShort
proc LittleShort 4 4
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 95
;95:short	LittleShort(short l) {return _LittleShort(l);}
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 0
ADDRGP4 _LittleShort
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CVII2 4
CVII4 2
RETI4
LABELV $47
endproc LittleShort 4 4
export BigLong
proc BigLong 4 4
line 96
;96:int		BigLong (int l) {return _BigLong(l);}
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 _BigLong
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $48
endproc BigLong 4 4
export LittleLong
proc LittleLong 4 4
line 97
;97:int		LittleLong (int l) {return _LittleLong(l);}
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 _LittleLong
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $49
endproc LittleLong 4 4
export BigLong64
proc BigLong64 8 8
line 98
;98:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
ADDRLP4 0
ARGP4
ADDRGP4 _BigLong64
INDIRP4
CALLV
pop
LABELV $50
endproc BigLong64 8 8
export LittleLong64
proc LittleLong64 8 8
line 99
;99:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
ADDRLP4 0
ARGP4
ADDRGP4 _LittleLong64
INDIRP4
CALLV
pop
LABELV $52
endproc LittleLong64 8 8
export BigFloat
proc BigFloat 4 4
line 100
;100:float	BigFloat (float l) {return _BigFloat(l);}
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 _BigFloat
INDIRP4
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
RETF4
LABELV $54
endproc BigFloat 4 4
export LittleFloat
proc LittleFloat 4 4
line 101
;101:float	LittleFloat (float l) {return _LittleFloat(l);}
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 _LittleFloat
INDIRP4
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
RETF4
LABELV $55
endproc LittleFloat 4 4
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 104
;102:
;103:short   ShortSwap (short l)
;104:{
line 107
;105:	byte    b1,b2;
;106:
;107:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 108
;108:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 110
;109:
;110:	return (b1<<8) + b2;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
ADDI4
CVII2 4
CVII4 2
RETI4
LABELV $56
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 114
;111:}
;112:
;113:short	ShortNoSwap (short l)
;114:{
line 115
;115:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $57
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 119
;116:}
;117:
;118:int    LongSwap (int l)
;119:{
line 122
;120:	byte    b1,b2,b3,b4;
;121:
;122:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 123
;123:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 124
;124:	b3 = (l>>16)&255;
ADDRLP4 2
ADDRFP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 125
;125:	b4 = (l>>24)&255;
ADDRLP4 3
ADDRFP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 127
;126:
;127:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
ADDI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDI4
ADDRLP4 3
INDIRU1
CVUI4 1
ADDI4
RETI4
LABELV $58
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 131
;128:}
;129:
;130:int	LongNoSwap (int l)
;131:{
line 132
;132:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $59
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 136
;133:}
;134:
;135:qint64 Long64Swap (qint64 ll)
;136:{
line 139
;137:	qint64	result;
;138:
;139:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 140
;140:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 141
;141:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 142
;142:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 143
;143:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 144
;144:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 145
;145:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 146
;146:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 148
;147:
;148:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $60
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 152
;149:}
;150:
;151:qint64 Long64NoSwap (qint64 ll)
;152:{
line 153
;153:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $69
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 8 0
line 157
;154:}
;155:
;156:float FloatSwap (float f)
;157:{
line 165
;158:	union
;159:	{
;160:		float	f;
;161:		byte	b[4];
;162:	} dat1, dat2;
;163:	
;164:	
;165:	dat1.f = f;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 166
;166:	dat2.b[0] = dat1.b[3];
ADDRLP4 4
ADDRLP4 0+3
INDIRU1
ASGNU1
line 167
;167:	dat2.b[1] = dat1.b[2];
ADDRLP4 4+1
ADDRLP4 0+2
INDIRU1
ASGNU1
line 168
;168:	dat2.b[2] = dat1.b[1];
ADDRLP4 4+2
ADDRLP4 0+1
INDIRU1
ASGNU1
line 169
;169:	dat2.b[3] = dat1.b[0];
ADDRLP4 4+3
ADDRLP4 0
INDIRU1
ASGNU1
line 170
;170:	return dat2.f;
ADDRLP4 4
INDIRF4
RETF4
LABELV $71
endproc FloatSwap 8 0
export FloatNoSwap
proc FloatNoSwap 0 0
line 174
;171:}
;172:
;173:float FloatNoSwap (float f)
;174:{
line 175
;175:	return f;
ADDRFP4 0
INDIRF4
RETF4
LABELV $79
endproc FloatNoSwap 0 0
lit
align 1
LABELV $81
byte 1 1
byte 1 0
export Swap_Init
code
proc Swap_Init 2 0
line 184
;176:}
;177:
;178:/*
;179:================
;180:Swap_Init
;181:================
;182:*/
;183:void Swap_Init (void)
;184:{
line 185
;185:	byte	swaptest[2] = {1,0};
ADDRLP4 0
ADDRGP4 $81
INDIRB
ASGNB 2
line 188
;186:
;187:// set the byte swapping variables in a portable manner	
;188:	if ( *(short *)swaptest == 1)
ADDRLP4 0
INDIRI2
CVII4 2
CNSTI4 1
NEI4 $82
line 189
;189:	{
line 190
;190:		_BigShort = ShortSwap;
ADDRGP4 _BigShort
ADDRGP4 ShortSwap
ASGNP4
line 191
;191:		_LittleShort = ShortNoSwap;
ADDRGP4 _LittleShort
ADDRGP4 ShortNoSwap
ASGNP4
line 192
;192:		_BigLong = LongSwap;
ADDRGP4 _BigLong
ADDRGP4 LongSwap
ASGNP4
line 193
;193:		_LittleLong = LongNoSwap;
ADDRGP4 _LittleLong
ADDRGP4 LongNoSwap
ASGNP4
line 194
;194:		_BigLong64 = Long64Swap;
ADDRGP4 _BigLong64
ADDRGP4 Long64Swap
ASGNP4
line 195
;195:		_LittleLong64 = Long64NoSwap;
ADDRGP4 _LittleLong64
ADDRGP4 Long64NoSwap
ASGNP4
line 196
;196:		_BigFloat = FloatSwap;
ADDRGP4 _BigFloat
ADDRGP4 FloatSwap
ASGNP4
line 197
;197:		_LittleFloat = FloatNoSwap;
ADDRGP4 _LittleFloat
ADDRGP4 FloatNoSwap
ASGNP4
line 198
;198:	}
ADDRGP4 $83
JUMPV
LABELV $82
line 200
;199:	else
;200:	{
line 201
;201:		_BigShort = ShortNoSwap;
ADDRGP4 _BigShort
ADDRGP4 ShortNoSwap
ASGNP4
line 202
;202:		_LittleShort = ShortSwap;
ADDRGP4 _LittleShort
ADDRGP4 ShortSwap
ASGNP4
line 203
;203:		_BigLong = LongNoSwap;
ADDRGP4 _BigLong
ADDRGP4 LongNoSwap
ASGNP4
line 204
;204:		_LittleLong = LongSwap;
ADDRGP4 _LittleLong
ADDRGP4 LongSwap
ASGNP4
line 205
;205:		_BigLong64 = Long64NoSwap;
ADDRGP4 _BigLong64
ADDRGP4 Long64NoSwap
ASGNP4
line 206
;206:		_LittleLong64 = Long64Swap;
ADDRGP4 _LittleLong64
ADDRGP4 Long64Swap
ASGNP4
line 207
;207:		_BigFloat = FloatNoSwap;
ADDRGP4 _BigFloat
ADDRGP4 FloatNoSwap
ASGNP4
line 208
;208:		_LittleFloat = FloatSwap;
ADDRGP4 _LittleFloat
ADDRGP4 FloatSwap
ASGNP4
line 209
;209:	}
LABELV $83
line 211
;210:
;211:}
LABELV $80
endproc Swap_Init 2 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 227
;212:
;213:
;214:/*
;215:============================================================================
;216:
;217:PARSING
;218:
;219:============================================================================
;220:*/
;221:
;222:static	char	com_token[MAX_TOKEN_CHARS];
;223:static	char	com_parsename[MAX_TOKEN_CHARS];
;224:static	int		com_lines;
;225:
;226:void COM_BeginParseSession( const char *name )
;227:{
line 228
;228:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 229
;229:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $85
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 230
;230:}
LABELV $84
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 233
;231:
;232:int COM_GetCurrentParseLine( void )
;233:{
line 234
;234:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $86
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 238
;235:}
;236:
;237:char *COM_Parse( char **data_p )
;238:{
line 239
;239:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $87
endproc COM_Parse 4 8
bss
align 1
LABELV $89
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 243
;240:}
;241:
;242:void COM_ParseError( char *format, ... )
;243:{
line 247
;244:	va_list argptr;
;245:	static char string[4096];
;246:
;247:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 248
;248:	vsprintf (string, format, argptr);
ADDRGP4 $89
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 249
;249:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 251
;250:
;251:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $91
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $89
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 252
;252:}
LABELV $88
endproc COM_ParseError 4 16
bss
align 1
LABELV $93
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 255
;253:
;254:void COM_ParseWarning( char *format, ... )
;255:{
line 259
;256:	va_list argptr;
;257:	static char string[4096];
;258:
;259:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 260
;260:	vsprintf (string, format, argptr);
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 261
;261:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 263
;262:
;263:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $95
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $93
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 264
;264:}
LABELV $92
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 278
;265:
;266:/*
;267:==============
;268:COM_Parse
;269:
;270:Parse a token out of a string
;271:Will never return NULL, just empty strings
;272:
;273:If "allowLineBreaks" is qtrue then an empty
;274:string will be returned if the next token is
;275:a newline.
;276:==============
;277:*/
;278:static char *SkipWhitespace( char *data, qboolean *hasNewLines ) {
ADDRGP4 $98
JUMPV
LABELV $97
line 281
;279:	int c;
;280:
;281:	while( (c = *data) <= ' ') {
line 282
;282:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $100
line 283
;283:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $96
JUMPV
LABELV $100
line 285
;284:		}
;285:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $102
line 286
;286:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 287
;287:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 288
;288:		}
LABELV $102
line 289
;289:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 290
;290:	}
LABELV $98
line 281
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $97
line 292
;291:
;292:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $96
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 44 0
line 295
;293:}
;294:
;295:int COM_Compress( char *data_p ) {
line 298
;296:	char *datai, *datao;
;297:	int c, pc, size;
;298:	qboolean ws = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 300
;299:
;300:	size = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 301
;301:	pc = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 302
;302:	datai = datao = data_p;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 303
;303:	if (datai) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $105
ADDRGP4 $108
JUMPV
LABELV $107
line 304
;304:		while ((c = *datai) != 0) {
line 305
;305:			if (c == 13 || c == 10) {
ADDRLP4 4
INDIRI4
CNSTI4 13
EQI4 $112
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $110
LABELV $112
line 306
;306:				*datao = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 307
;307:				datao++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 308
;308:				ws = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 309
;309:				pc = c;
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
line 310
;310:				datai++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 311
;311:				size++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 313
;312:			// skip double slash comments
;313:			} else if ( c == '/' && datai[1] == '/' ) {
ADDRGP4 $111
JUMPV
LABELV $110
ADDRLP4 32
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $113
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 32
INDIRI4
NEI4 $113
ADDRGP4 $116
JUMPV
LABELV $115
line 314
;314:				while (*datai && *datai != '\n') {
line 315
;315:					datai++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 316
;316:				}
LABELV $116
line 314
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $118
ADDRLP4 36
INDIRI4
CNSTI4 10
NEI4 $115
LABELV $118
line 317
;317:				ws = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 319
;318:			// skip /* */ comments
;319:			} else if ( c=='/' && datai[1] == '*' ) {
ADDRGP4 $114
JUMPV
LABELV $113
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $119
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $119
ADDRGP4 $122
JUMPV
LABELV $121
line 321
;320:				while ( *datai && ( *datai != '*' || datai[1] != '/' ) ) 
;321:				{
line 322
;322:					datai++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 323
;323:				}
LABELV $122
line 320
ADDRLP4 40
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $124
ADDRLP4 40
INDIRI4
CNSTI4 42
NEI4 $121
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $121
LABELV $124
line 324
;324:				if ( *datai ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $125
line 325
;325:				{
line 326
;326:					datai += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 327
;327:				}
LABELV $125
line 328
;328:				ws = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 329
;329:			} else {
ADDRGP4 $120
JUMPV
LABELV $119
line 330
;330:				if (ws) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $127
line 331
;331:					*datao = ' ';
ADDRLP4 8
INDIRP4
CNSTI1 32
ASGNI1
line 332
;332:					datao++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 333
;333:				}
LABELV $127
line 334
;334:				*datao = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 335
;335:				datao++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 336
;336:				datai++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 337
;337:				ws = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 338
;338:				pc = c;
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
line 339
;339:				size++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 340
;340:			}
LABELV $120
LABELV $114
LABELV $111
line 341
;341:		}
LABELV $108
line 304
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $107
line 342
;342:	}
LABELV $105
line 343
;343:	*datao = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 344
;344:	return size;
ADDRLP4 16
INDIRI4
RETI4
LABELV $104
endproc COM_Compress 44 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 348
;345:}
;346:
;347:char *COM_ParseExt( char **data_p, qboolean allowLineBreaks )
;348:{
line 349
;349:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 350
;350:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 353
;351:	char *data;
;352:
;353:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 354
;354:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 355
;355:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 358
;356:
;357:	// make sure incoming data is valid
;358:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $133
line 359
;359:	{
line 360
;360:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 361
;361:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $129
JUMPV
LABELV $132
line 365
;362:	}
;363:
;364:	while ( 1 )
;365:	{
line 367
;366:		// skip whitespace
;367:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 368
;368:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $135
line 369
;369:		{
line 370
;370:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 371
;371:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $129
JUMPV
LABELV $135
line 373
;372:		}
;373:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $137
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $137
line 374
;374:		{
line 375
;375:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 376
;376:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $129
JUMPV
LABELV $137
line 379
;377:		}
;378:
;379:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 382
;380:
;381:		// skip double slash comments
;382:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $139
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $139
line 383
;383:		{
line 384
;384:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $142
JUMPV
LABELV $141
line 385
;385:			while (*data && *data != '\n') {
line 386
;386:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 387
;387:			}
LABELV $142
line 385
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $144
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $141
LABELV $144
line 388
;388:		}
ADDRGP4 $140
JUMPV
LABELV $139
line 390
;389:		// skip /* */ comments
;390:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $134
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $134
line 391
;391:		{
line 392
;392:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $148
JUMPV
LABELV $147
line 394
;393:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;394:			{
line 395
;395:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 396
;396:			}
LABELV $148
line 393
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $150
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $147
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $147
LABELV $150
line 397
;397:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $146
line 398
;398:			{
line 399
;399:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 400
;400:			}
line 401
;401:		}
line 403
;402:		else
;403:		{
line 404
;404:			break;
LABELV $146
LABELV $140
line 406
;405:		}
;406:	}
LABELV $133
line 364
ADDRGP4 $132
JUMPV
LABELV $134
line 409
;407:
;408:	// handle quoted strings
;409:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $153
line 410
;410:	{
line 411
;411:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $156
JUMPV
LABELV $155
line 413
;412:		while (1)
;413:		{
line 414
;414:			c = *data++;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 415
;415:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $160
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $158
LABELV $160
line 416
;416:			{
line 417
;417:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 418
;418:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 419
;419:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $129
JUMPV
LABELV $158
line 421
;420:			}
;421:			if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $161
line 422
;422:			{
line 423
;423:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 424
;424:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 425
;425:			}
LABELV $161
line 426
;426:		}
LABELV $156
line 412
ADDRGP4 $155
JUMPV
line 427
;427:	}
LABELV $153
LABELV $163
line 431
;428:
;429:	// parse a regular word
;430:	do
;431:	{
line 432
;432:		if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $166
line 433
;433:		{
line 434
;434:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 435
;435:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 436
;436:		}
LABELV $166
line 437
;437:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 438
;438:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 439
;439:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $168
line 440
;440:			com_lines++;
ADDRLP4 16
ADDRGP4 com_lines
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $168
line 441
;441:	} while (c>32);
LABELV $164
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $163
line 443
;442:
;443:	if (len == MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
NEI4 $170
line 444
;444:	{
line 446
;445://		Com_Printf ("Token exceeded %i chars, discarded.\n", MAX_TOKEN_CHARS);
;446:		len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 447
;447:	}
LABELV $170
line 448
;448:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 450
;449:
;450:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 451
;451:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $129
endproc COM_ParseExt 36 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 515
;452:}
;453:
;454:
;455:#if 0
;456:// no longer used
;457:/*
;458:===============
;459:COM_ParseInfos
;460:===============
;461:*/
;462:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;463:	char	*token;
;464:	int		count;
;465:	char	key[MAX_TOKEN_CHARS];
;466:
;467:	count = 0;
;468:
;469:	while ( 1 ) {
;470:		token = COM_Parse( &buf );
;471:		if ( !token[0] ) {
;472:			break;
;473:		}
;474:		if ( strcmp( token, "{" ) ) {
;475:			Com_Printf( "Missing { in info file\n" );
;476:			break;
;477:		}
;478:
;479:		if ( count == max ) {
;480:			Com_Printf( "Max infos exceeded\n" );
;481:			break;
;482:		}
;483:
;484:		infos[count][0] = 0;
;485:		while ( 1 ) {
;486:			token = COM_ParseExt( &buf, qtrue );
;487:			if ( !token[0] ) {
;488:				Com_Printf( "Unexpected end of info file\n" );
;489:				break;
;490:			}
;491:			if ( !strcmp( token, "}" ) ) {
;492:				break;
;493:			}
;494:			Q_strncpyz( key, token, sizeof( key ) );
;495:
;496:			token = COM_ParseExt( &buf, qfalse );
;497:			if ( !token[0] ) {
;498:				strcpy( token, "<NULL>" );
;499:			}
;500:			Info_SetValueForKey( infos[count], key, token );
;501:		}
;502:		count++;
;503:	}
;504:
;505:	return count;
;506:}
;507:#endif
;508:
;509:
;510:/*
;511:==================
;512:COM_MatchToken
;513:==================
;514:*/
;515:void COM_MatchToken( char **buf_p, char *match ) {
line 518
;516:	char	*token;
;517:
;518:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 519
;519:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $173
line 520
;520:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $175
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 521
;521:	}
LABELV $173
line 522
;522:}
LABELV $172
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 534
;523:
;524:
;525:/*
;526:=================
;527:SkipBracedSection
;528:
;529:The next token should be an open brace.
;530:Skips until a matching close brace is found.
;531:Internal brace depths are properly skipped.
;532:=================
;533:*/
;534:void SkipBracedSection (char **program) {
line 538
;535:	char			*token;
;536:	int				depth;
;537:
;538:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $177
line 539
;539:	do {
line 540
;540:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 541
;541:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $180
line 542
;542:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $182
line 543
;543:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 544
;544:			}
ADDRGP4 $183
JUMPV
LABELV $182
line 545
;545:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $184
line 546
;546:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 547
;547:			}
LABELV $184
LABELV $183
line 548
;548:		}
LABELV $180
line 549
;549:	} while( depth && *program );
LABELV $178
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $186
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $177
LABELV $186
line 550
;550:}
LABELV $176
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 16 0
line 557
;551:
;552:/*
;553:=================
;554:SkipRestOfLine
;555:=================
;556:*/
;557:void SkipRestOfLine ( char **data ) {
line 561
;558:	char	*p;
;559:	int		c;
;560:
;561:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $189
JUMPV
LABELV $188
line 562
;562:	while ( (c = *p++) != 0 ) {
line 563
;563:		if ( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $191
line 564
;564:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 565
;565:			break;
ADDRGP4 $190
JUMPV
LABELV $191
line 567
;566:		}
;567:	}
LABELV $189
line 562
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $188
LABELV $190
line 569
;568:
;569:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 570
;570:}
LABELV $187
endproc SkipRestOfLine 16 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 573
;571:
;572:
;573:void Parse1DMatrix (char **buf_p, int x, float *m) {
line 577
;574:	char	*token;
;575:	int		i;
;576:
;577:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $194
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 579
;578:
;579:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $195
line 580
;580:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 581
;581:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 582
;582:	}
LABELV $196
line 579
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $198
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $195
line 584
;583:
;584:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 585
;585:}
LABELV $193
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 587
;586:
;587:void Parse2DMatrix (char **buf_p, int y, int x, float *m) {
line 590
;588:	int		i;
;589:
;590:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $194
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 592
;591:
;592:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $204
JUMPV
LABELV $201
line 593
;593:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 594
;594:	}
LABELV $202
line 592
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $204
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $201
line 596
;595:
;596:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 597
;597:}
LABELV $200
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 599
;598:
;599:void Parse3DMatrix (char **buf_p, int z, int y, int x, float *m) {
line 602
;600:	int		i;
;601:
;602:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $194
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 604
;603:
;604:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $209
JUMPV
LABELV $206
line 605
;605:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 606
;606:	}
LABELV $207
line 604
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $209
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $206
line 608
;607:
;608:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 609
;609:}
LABELV $205
endproc Parse3DMatrix 12 16
export Q_isprint
proc Q_isprint 4 0
line 621
;610:
;611:
;612:/*
;613:============================================================================
;614:
;615:					LIBRARY REPLACEMENT FUNCTIONS
;616:
;617:============================================================================
;618:*/
;619:
;620:int Q_isprint( int c )
;621:{
line 622
;622:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $211
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $211
line 623
;623:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $210
JUMPV
LABELV $211
line 624
;624:	return ( 0 );
CNSTI4 0
RETI4
LABELV $210
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 628
;625:}
;626:
;627:int Q_islower( int c )
;628:{
line 629
;629:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $214
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $214
line 630
;630:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $213
JUMPV
LABELV $214
line 631
;631:	return ( 0 );
CNSTI4 0
RETI4
LABELV $213
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 635
;632:}
;633:
;634:int Q_isupper( int c )
;635:{
line 636
;636:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $217
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $217
line 637
;637:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $216
JUMPV
LABELV $217
line 638
;638:	return ( 0 );
CNSTI4 0
RETI4
LABELV $216
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 642
;639:}
;640:
;641:int Q_isalpha( int c )
;642:{
line 643
;643:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $223
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $222
LABELV $223
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $220
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $220
LABELV $222
line 644
;644:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $219
JUMPV
LABELV $220
line 645
;645:	return ( 0 );
CNSTI4 0
RETI4
LABELV $219
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 649
;646:}
;647:
;648:char* Q_strrchr( const char* string, int c )
;649:{
line 650
;650:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 652
;651:	char *s;
;652:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 654
;653:
;654:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $226
JUMPV
LABELV $225
line 657
;655:
;656:	while (*s)
;657:	{
line 658
;658:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $228
line 659
;659:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $228
line 660
;660:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 661
;661:	}
LABELV $226
line 656
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $225
line 662
;662:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $230
line 663
;663:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $230
line 665
;664:
;665:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $224
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 675
;666:}
;667:
;668:/*
;669:=============
;670:Q_strncpyz
;671: 
;672:Safe strncpy that ensures a trailing zero
;673:=============
;674:*/
;675:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 676
;676:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $233
line 677
;677:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $235
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 678
;678:	}
LABELV $233
line 679
;679:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $236
line 680
;680:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $238
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 681
;681:	}
LABELV $236
line 683
;682:
;683:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 684
;684:    dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 685
;685:}
LABELV $232
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 687
;686:                 
;687:int Q_stricmpn (const char *s1, const char *s2, int n) {
LABELV $240
line 690
;688:	int		c1, c2;
;689:	
;690:	do {
line 691
;691:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 692
;692:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 694
;693:
;694:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $243
line 695
;695:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $239
JUMPV
LABELV $243
line 698
;696:		}
;697:		
;698:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $245
line 699
;699:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $247
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $247
line 700
;700:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 701
;701:			}
LABELV $247
line 702
;702:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $249
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $249
line 703
;703:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 704
;704:			}
LABELV $249
line 705
;705:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $251
line 706
;706:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $254
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $254
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $255
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $239
JUMPV
LABELV $251
line 708
;707:			}
;708:		}
LABELV $245
line 709
;709:	} while (c1);
LABELV $241
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $240
line 711
;710:	
;711:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $239
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 714
;712:}
;713:
;714:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $257
line 717
;715:	int		c1, c2;
;716:	
;717:	do {
line 718
;718:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 719
;719:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 721
;720:
;721:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $260
line 722
;722:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $256
JUMPV
LABELV $260
line 725
;723:		}
;724:		
;725:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $262
line 726
;726:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $265
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $266
JUMPV
LABELV $265
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $266
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $256
JUMPV
LABELV $262
line 728
;727:		}
;728:	} while (c1);
LABELV $258
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $257
line 730
;729:	
;730:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $256
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 733
;731:}
;732:
;733:int Q_stricmp (const char *s1, const char *s2) {
line 734
;734:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $269
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $269
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
ADDRLP4 8
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $270
JUMPV
LABELV $269
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $270
ADDRLP4 0
INDIRI4
RETI4
LABELV $267
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 738
;735:}
;736:
;737:
;738:char *Q_strlwr( char *s1 ) {
line 741
;739:    char	*s;
;740:
;741:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $273
JUMPV
LABELV $272
line 742
;742:	while ( *s ) {
line 743
;743:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 744
;744:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 745
;745:	}
LABELV $273
line 742
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $272
line 746
;746:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $271
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 749
;747:}
;748:
;749:char *Q_strupr( char *s1 ) {
line 752
;750:    char	*s;
;751:
;752:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $277
JUMPV
LABELV $276
line 753
;753:	while ( *s ) {
line 754
;754:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 755
;755:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 756
;756:	}
LABELV $277
line 753
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $276
line 757
;757:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $275
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 762
;758:}
;759:
;760:
;761:// never goes past bounds or leaves without a terminating 0
;762:void Q_strcat( char *dest, int size, const char *src ) {
line 765
;763:	int		l1;
;764:
;765:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 766
;766:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $280
line 767
;767:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $282
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 768
;768:	}
LABELV $280
line 769
;769:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 770
;770:}
LABELV $279
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 20 0
line 773
;771:
;772:
;773:int Q_PrintStrlen( const char *string ) {
line 777
;774:	int			len;
;775:	const char	*p;
;776:
;777:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $284
line 778
;778:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $283
JUMPV
LABELV $284
line 781
;779:	}
;780:
;781:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 782
;782:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $287
JUMPV
LABELV $286
line 783
;783:	while( *p ) {
line 784
;784:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $289
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
EQI4 $289
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $289
line 785
;785:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 786
;786:			continue;
ADDRGP4 $287
JUMPV
LABELV $289
line 788
;787:		}
;788:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 789
;789:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 790
;790:	}
LABELV $287
line 783
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $286
line 792
;791:
;792:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $283
endproc Q_PrintStrlen 20 0
export Q_CleanStr
proc Q_CleanStr 32 0
line 796
;793:}
;794:
;795:
;796:char *Q_CleanStr( char *string ) {
line 801
;797:	char*	d;
;798:	char*	s;
;799:	int		c;
;800:
;801:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 802
;802:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $292
line 803
;803:	while ((c = *s) != 0 ) {
line 804
;804:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $295
ADDRLP4 16
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $295
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $295
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $295
line 805
;805:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 806
;806:		}		
ADDRGP4 $296
JUMPV
LABELV $295
line 807
;807:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $297
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $297
line 808
;808:			*d++ = c;
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 809
;809:		}
LABELV $297
LABELV $296
line 810
;810:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 811
;811:	}
LABELV $293
line 803
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $292
line 812
;812:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 814
;813:
;814:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $291
endproc Q_CleanStr 32 0
export Com_sprintf
proc Com_sprintf 32012 12
line 818
;815:}
;816:
;817:
;818:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 823
;819:	int		len;
;820:	va_list		argptr;
;821:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;822:
;823:	va_start (argptr,fmt);
ADDRLP4 4
ADDRFP4 8+4
ASGNP4
line 824
;824:	len = vsprintf (bigbuffer,fmt,argptr);
ADDRLP4 8
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32008
ADDRGP4 vsprintf
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32008
INDIRI4
ASGNI4
line 825
;825:	va_end (argptr);
ADDRLP4 4
CNSTP4 0
ASGNP4
line 826
;826:	if ( len >= sizeof( bigbuffer ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32000
LTU4 $301
line 827
;827:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $303
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 828
;828:	}
LABELV $301
line 829
;829:	if (len >= size) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $304
line 830
;830:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $306
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 831
;831:	} 
LABELV $304
line 832
;832:	Q_strncpyz (dest, bigbuffer, size );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 833
;833:}
LABELV $299
endproc Com_sprintf 32012 12
bss
align 1
LABELV $308
skip 64000
data
align 4
LABELV $309
byte 4 0
export va
code
proc va 12 12
line 845
;834:
;835:
;836:/*
;837:============
;838:va
;839:
;840:does a varargs printf into a temp buffer, so I don't need to have
;841:varargs versions of all text functions.
;842:FIXME: make this buffer size safe someday
;843:============
;844:*/
;845:char	* QDECL va( char *format, ... ) {
line 851
;846:	va_list		argptr;
;847:	static char		string[2][32000];	// in case va is called by nested functions
;848:	static int		index = 0;
;849:	char	*buf;
;850:
;851:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $309
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $308
ADDP4
ASGNP4
line 852
;852:	index++;
ADDRLP4 8
ADDRGP4 $309
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 854
;853:
;854:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 855
;855:	vsprintf (buf, format,argptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 856
;856:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 858
;857:
;858:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $307
endproc va 12 12
bss
align 1
LABELV $312
skip 16384
data
align 4
LABELV $313
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 879
;859:}
;860:
;861:
;862:/*
;863:=====================================================================
;864:
;865:  INFO STRINGS
;866:
;867:=====================================================================
;868:*/
;869:
;870:/*
;871:===============
;872:Info_ValueForKey
;873:
;874:Searches the string for the given
;875:key and returns the associated value, or an empty string.
;876:FIXME: overflow check?
;877:===============
;878:*/
;879:char *Info_ValueForKey( const char *s, const char *key ) {
line 886
;880:	char	pkey[BIG_INFO_KEY];
;881:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;882:											// work without stomping on each other
;883:	static	int	valueindex = 0;
;884:	char	*o;
;885:	
;886:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $316
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $314
LABELV $316
line 887
;887:		return "";
ADDRGP4 $317
RETP4
ADDRGP4 $311
JUMPV
LABELV $314
line 890
;888:	}
;889:
;890:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8200
INDIRI4
CNSTI4 8192
LTI4 $318
line 891
;891:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $320
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 892
;892:	}
LABELV $318
line 894
;893:
;894:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $313
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 895
;895:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $324
line 896
;896:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $324
JUMPV
LABELV $323
line 898
;897:	while (1)
;898:	{
line 899
;899:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $327
JUMPV
LABELV $326
line 901
;900:		while (*s != '\\')
;901:		{
line 902
;902:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $329
line 903
;903:				return "";
ADDRGP4 $317
RETP4
ADDRGP4 $311
JUMPV
LABELV $329
line 904
;904:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 905
;905:		}
LABELV $327
line 900
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $326
line 906
;906:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 907
;907:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 909
;908:
;909:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $313
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $312
ADDP4
ASGNP4
ADDRGP4 $332
JUMPV
LABELV $331
line 912
;910:
;911:		while (*s != '\\' && *s)
;912:		{
line 913
;913:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 914
;914:		}
LABELV $332
line 911
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $334
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $331
LABELV $334
line 915
;915:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 917
;916:
;917:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $335
line 918
;918:			return value[valueindex];
ADDRGP4 $313
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $312
ADDP4
RETP4
ADDRGP4 $311
JUMPV
LABELV $335
line 920
;919:
;920:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $337
line 921
;921:			break;
ADDRGP4 $325
JUMPV
LABELV $337
line 922
;922:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 923
;923:	}
LABELV $324
line 897
ADDRGP4 $323
JUMPV
LABELV $325
line 925
;924:
;925:	return "";
ADDRGP4 $317
RETP4
LABELV $311
endproc Info_ValueForKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 936
;926:}
;927:
;928:
;929:/*
;930:===================
;931:Info_NextPair
;932:
;933:Used to itterate through all the key/value pairs in an info string
;934:===================
;935:*/
;936:void Info_NextPair( const char **head, char *key, char *value ) {
line 940
;937:	char	*o;
;938:	const char	*s;
;939:
;940:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 942
;941:
;942:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $340
line 943
;943:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 944
;944:	}
LABELV $340
line 945
;945:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 946
;946:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 948
;947:
;948:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $343
JUMPV
LABELV $342
line 949
;949:	while ( *s != '\\' ) {
line 950
;950:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $345
line 951
;951:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 952
;952:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 953
;953:			return;
ADDRGP4 $339
JUMPV
LABELV $345
line 955
;954:		}
;955:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 956
;956:	}
LABELV $343
line 949
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $342
line 957
;957:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 958
;958:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 960
;959:
;960:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $348
JUMPV
LABELV $347
line 961
;961:	while ( *s != '\\' && *s ) {
line 962
;962:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 963
;963:	}
LABELV $348
line 961
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $350
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $347
LABELV $350
line 964
;964:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 966
;965:
;966:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 967
;967:}
LABELV $339
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 8
line 975
;968:
;969:
;970:/*
;971:===================
;972:Info_RemoveKey
;973:===================
;974:*/
;975:void Info_RemoveKey( char *s, const char *key ) {
line 981
;976:	char	*start;
;977:	char	pkey[MAX_INFO_KEY];
;978:	char	value[MAX_INFO_VALUE];
;979:	char	*o;
;980:
;981:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 1024
LTI4 $352
line 982
;982:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $354
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 983
;983:	}
LABELV $352
line 985
;984:
;985:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 2060
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $358
line 986
;986:		return;
ADDRGP4 $351
JUMPV
LABELV $357
line 990
;987:	}
;988:
;989:	while (1)
;990:	{
line 991
;991:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 992
;992:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $360
line 993
;993:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $360
line 994
;994:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $363
JUMPV
LABELV $362
line 996
;995:		while (*s != '\\')
;996:		{
line 997
;997:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $365
line 998
;998:				return;
ADDRGP4 $351
JUMPV
LABELV $365
line 999
;999:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1000
;1000:		}
LABELV $363
line 995
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $362
line 1001
;1001:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1002
;1002:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1004
;1003:
;1004:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $368
JUMPV
LABELV $367
line 1006
;1005:		while (*s != '\\' && *s)
;1006:		{
line 1007
;1007:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $370
line 1008
;1008:				return;
ADDRGP4 $351
JUMPV
LABELV $370
line 1009
;1009:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1010
;1010:		}
LABELV $368
line 1005
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $372
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $367
LABELV $372
line 1011
;1011:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1013
;1012:
;1013:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $373
line 1014
;1014:		{
line 1015
;1015:			strcpy (start, s);	// remove this part
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1016
;1016:			return;
ADDRGP4 $351
JUMPV
LABELV $373
line 1019
;1017:		}
;1018:
;1019:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $375
line 1020
;1020:			return;
ADDRGP4 $351
JUMPV
LABELV $375
line 1021
;1021:	}
LABELV $358
line 989
ADDRGP4 $357
JUMPV
line 1023
;1022:
;1023:}
LABELV $351
endproc Info_RemoveKey 2076 8
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 8
line 1030
;1024:
;1025:/*
;1026:===================
;1027:Info_RemoveKey_Big
;1028:===================
;1029:*/
;1030:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1036
;1031:	char	*start;
;1032:	char	pkey[BIG_INFO_KEY];
;1033:	char	value[BIG_INFO_VALUE];
;1034:	char	*o;
;1035:
;1036:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16392
INDIRI4
CNSTI4 8192
LTI4 $378
line 1037
;1037:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $380
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1038
;1038:	}
LABELV $378
line 1040
;1039:
;1040:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 16396
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $384
line 1041
;1041:		return;
ADDRGP4 $377
JUMPV
LABELV $383
line 1045
;1042:	}
;1043:
;1044:	while (1)
;1045:	{
line 1046
;1046:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1047
;1047:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $386
line 1048
;1048:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $386
line 1049
;1049:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $389
JUMPV
LABELV $388
line 1051
;1050:		while (*s != '\\')
;1051:		{
line 1052
;1052:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $391
line 1053
;1053:				return;
ADDRGP4 $377
JUMPV
LABELV $391
line 1054
;1054:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1055
;1055:		}
LABELV $389
line 1050
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $388
line 1056
;1056:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1057
;1057:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1059
;1058:
;1059:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $394
JUMPV
LABELV $393
line 1061
;1060:		while (*s != '\\' && *s)
;1061:		{
line 1062
;1062:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $396
line 1063
;1063:				return;
ADDRGP4 $377
JUMPV
LABELV $396
line 1064
;1064:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1065
;1065:		}
LABELV $394
line 1060
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $398
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $393
LABELV $398
line 1066
;1066:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1068
;1067:
;1068:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16404
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16404
INDIRI4
CNSTI4 0
NEI4 $399
line 1069
;1069:		{
line 1070
;1070:			strcpy (start, s);	// remove this part
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1071
;1071:			return;
ADDRGP4 $377
JUMPV
LABELV $399
line 1074
;1072:		}
;1073:
;1074:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $401
line 1075
;1075:			return;
ADDRGP4 $377
JUMPV
LABELV $401
line 1076
;1076:	}
LABELV $384
line 1044
ADDRGP4 $383
JUMPV
line 1078
;1077:
;1078:}
LABELV $377
endproc Info_RemoveKey_Big 16412 8
export Info_Validate
proc Info_Validate 8 8
line 1091
;1079:
;1080:
;1081:
;1082:
;1083:/*
;1084:==================
;1085:Info_Validate
;1086:
;1087:Some characters are illegal in info strings because they
;1088:can mess up the server's parsing
;1089:==================
;1090:*/
;1091:qboolean Info_Validate( const char *s ) {
line 1092
;1092:	if ( strchr( s, '\"' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $404
line 1093
;1093:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $403
JUMPV
LABELV $404
line 1095
;1094:	}
;1095:	if ( strchr( s, ';' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $406
line 1096
;1096:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $403
JUMPV
LABELV $406
line 1098
;1097:	}
;1098:	return qtrue;
CNSTI4 1
RETI4
LABELV $403
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1068 20
line 1108
;1099:}
;1100:
;1101:/*
;1102:==================
;1103:Info_SetValueForKey
;1104:
;1105:Changes or adds a key/value pair
;1106:==================
;1107:*/
;1108:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1111
;1109:	char	newi[MAX_INFO_STRING];
;1110:
;1111:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 1024
LTI4 $409
line 1112
;1112:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $411
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1113
;1113:	}
LABELV $409
line 1115
;1114:
;1115:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1028
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $414
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1032
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $412
LABELV $414
line 1116
;1116:	{
line 1117
;1117:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $415
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1118
;1118:		return;
ADDRGP4 $408
JUMPV
LABELV $412
line 1121
;1119:	}
;1120:
;1121:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $418
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $416
LABELV $418
line 1122
;1122:	{
line 1123
;1123:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $419
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1124
;1124:		return;
ADDRGP4 $408
JUMPV
LABELV $416
line 1127
;1125:	}
;1126:
;1127:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1044
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $422
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1048
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $420
LABELV $422
line 1128
;1128:	{
line 1129
;1129:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $423
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1130
;1130:		return;
ADDRGP4 $408
JUMPV
LABELV $420
line 1133
;1131:	}
;1132:
;1133:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1134
;1134:	if (!value || !strlen(value))
ADDRLP4 1052
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $426
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $424
LABELV $426
line 1135
;1135:		return;
ADDRGP4 $408
JUMPV
LABELV $424
line 1137
;1136:
;1137:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $427
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1139
;1138:
;1139:	if (strlen(newi) + strlen(s) > MAX_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
ADDRLP4 1064
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $428
line 1140
;1140:	{
line 1141
;1141:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $430
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1142
;1142:		return;
ADDRGP4 $408
JUMPV
LABELV $428
line 1145
;1143:	}
;1144:
;1145:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1146
;1146:}
LABELV $408
endproc Info_SetValueForKey 1068 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8236 20
line 1155
;1147:
;1148:/*
;1149:==================
;1150:Info_SetValueForKey_Big
;1151:
;1152:Changes or adds a key/value pair
;1153:==================
;1154:*/
;1155:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1158
;1156:	char	newi[BIG_INFO_STRING];
;1157:
;1158:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8192
INDIRI4
CNSTI4 8192
LTI4 $432
line 1159
;1159:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $411
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1160
;1160:	}
LABELV $432
line 1162
;1161:
;1162:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8196
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8196
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $436
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $434
LABELV $436
line 1163
;1163:	{
line 1164
;1164:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $415
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1165
;1165:		return;
ADDRGP4 $431
JUMPV
LABELV $434
line 1168
;1166:	}
;1167:
;1168:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8204
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $439
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8208
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $437
LABELV $439
line 1169
;1169:	{
line 1170
;1170:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $419
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1171
;1171:		return;
ADDRGP4 $431
JUMPV
LABELV $437
line 1174
;1172:	}
;1173:
;1174:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8212
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8212
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $442
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8216
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8216
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $440
LABELV $442
line 1175
;1175:	{
line 1176
;1176:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $423
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1177
;1177:		return;
ADDRGP4 $431
JUMPV
LABELV $440
line 1180
;1178:	}
;1179:
;1180:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1181
;1181:	if (!value || !strlen(value))
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
ADDRLP4 8220
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8224
INDIRI4
CNSTI4 0
NEI4 $443
LABELV $445
line 1182
;1182:		return;
ADDRGP4 $431
JUMPV
LABELV $443
line 1184
;1183:
;1184:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $427
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1186
;1185:
;1186:	if (strlen(newi) + strlen(s) > BIG_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 8228
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8228
INDIRI4
ADDRLP4 8232
INDIRI4
ADDI4
CNSTI4 8192
LEI4 $446
line 1187
;1187:	{
line 1188
;1188:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $448
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1189
;1189:		return;
ADDRGP4 $431
JUMPV
LABELV $446
line 1192
;1190:	}
;1191:
;1192:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1193
;1193:}
LABELV $431
endproc Info_SetValueForKey_Big 8236 20
bss
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
align 4
LABELV _LittleFloat
skip 4
align 4
LABELV _BigFloat
skip 4
align 4
LABELV _LittleLong64
skip 4
align 4
LABELV _BigLong64
skip 4
align 4
LABELV _LittleLong
skip 4
align 4
LABELV _BigLong
skip 4
align 4
LABELV _LittleShort
skip 4
align 4
LABELV _BigShort
skip 4
import colorLtBlue
import Com_Printf
import Com_Error
import Info_RemoveKey_big
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
LABELV $448
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $430
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $427
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $423
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $419
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $415
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 92
byte 1 10
byte 1 0
align 1
LABELV $411
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $380
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 95
byte 1 66
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $354
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $320
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $317
byte 1 0
align 1
LABELV $306
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $303
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 105
byte 1 103
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $282
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $238
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $235
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $199
byte 1 41
byte 1 0
align 1
LABELV $194
byte 1 40
byte 1 0
align 1
LABELV $175
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $95
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $91
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $85
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $45
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
