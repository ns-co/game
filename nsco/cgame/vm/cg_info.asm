export CG_LoadBarInit
code
proc CG_LoadBarInit 0 0
file "../cg_info.c"
line 23
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_info.c -- display information while data is being loading
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
;14:#include "../ui/ui_shared.h"
;15: 
;16:/*
;17:======================
;18:CG_LoadingBarInit
;19:
;20:======================
;21:*/
;22:void CG_LoadBarInit( void )
;23:{
line 24
;24:	cg.loadingbarState = 0;
ADDRGP4 cg+116356
CNSTI4 0
ASGNI4
line 25
;25:	cg.loadingbarMax = 0;
ADDRGP4 cg+116360
CNSTI4 0
ASGNI4
line 26
;26:}
LABELV $93
endproc CG_LoadBarInit 0 0
export CG_LoadingBarUpdate
proc CG_LoadingBarUpdate 4 0
line 35
;27:/*
;28:======================
;29:CG_LoadingBarUpdate
;30:
;31:======================
;32:*/ 
;33:
;34:void CG_LoadingBarUpdate( int amount )
;35:{
line 36
;36:	cg.loadingbarState += amount;
ADDRLP4 0
ADDRGP4 cg+116356
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 38
;37://	CG_Printf("loadingbarState : %i\n",cg.loadingbarState );
;38:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 39
;39:}
LABELV $96
endproc CG_LoadingBarUpdate 4 0
export CG_LoadingBarSetMax
proc CG_LoadingBarSetMax 0 0
line 47
;40:/*
;41:======================
;42:CG_LoadingBarSetMax
;43:
;44:======================
;45:*/
;46:void CG_LoadingBarSetMax( int maximum )
;47:{ 
line 48
;48:	cg.loadingbarMax = maximum;
ADDRGP4 cg+116360
ADDRFP4 0
INDIRI4
ASGNI4
line 49
;49:}
LABELV $98
endproc CG_LoadingBarSetMax 0 0
export CG_DrawLoadingBar
proc CG_DrawLoadingBar 36 32
line 57
;50:/*
;51:======================
;52:CG_DrawLoadingBar
;53:
;54:======================
;55:*/
;56:void CG_DrawLoadingBar( int x, int y, int w, int h )
;57:{ 
line 58
;58:	float real_width = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 62
;59:	char *text;
;60:	vec4_t color;
;61:
;62:	real_width = (float)( (float)cg.loadingbarState / (float)cg.loadingbarMax );
ADDRLP4 0
ADDRGP4 cg+116356
INDIRI4
CVIF4 4
ADDRGP4 cg+116360
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 64
;63:	
;64:	color[0] = color[1] = color[2] = real_width;
ADDRLP4 4+8
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 0
INDIRF4
ASGNF4
line 65
;65:	color[3] = 0.8f;
ADDRLP4 4+12
CNSTF4 1061997773
ASGNF4
line 67
;66:
;67:	if ( real_width > 1.0f )
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
LEF4 $106
line 68
;68:		real_width = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
LABELV $106
line 70
;69:
;70:	real_width = real_width * (float)w;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 73
;71:	 
;72:	
;73:	CG_FillRect( x, y, real_width, h, color );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 76
;74:
;75:	// defcon: only show the awaiting for snapshot thingy.
;76:	if ( cg.infoScreenText[0] )
ADDRGP4 cg+109804
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $108
line 77
;77:		text = va("Precaching : %s ", cg.infoScreenText );
ADDRGP4 $111
ARGP4
ADDRGP4 cg+109804
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
ADDRGP4 $109
JUMPV
LABELV $108
line 79
;78:	else
;79:	{
line 80
;80:		text = "Waiting for Snapshot...";
ADDRLP4 20
ADDRGP4 $113
ASGNP4
line 81
;81:		x = x + ( ( w/2 ) - ( CG_Text_Width( text,0.25f,0)/2 ) );
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1048576000
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
DIVI4
ADDRLP4 32
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ADDI4
ASGNI4
line 82
;82:		CG_Text_Paint( x,y+13, 0.25f, colorWhite, text, 0,0,ITEM_TEXTSTYLE_OUTLINED);
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 13
ADDI4
CVIF4 4
ARGF4
CNSTF4 1048576000
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
line 83
;83:	}
LABELV $109
line 84
;84:}
LABELV $100
endproc CG_DrawLoadingBar 36 32
export CG_LoadingString
proc CG_LoadingString 0 12
line 92
;85:
;86:/*
;87:======================
;88:CG_LoadingString
;89:
;90:======================
;91:*/
;92:void CG_LoadingString( const char *s ) {
line 93
;93:	Q_strncpyz( cg.infoScreenText, s, sizeof( cg.infoScreenText ) );
ADDRGP4 cg+109804
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 95
;94:
;95:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 96
;96:}
LABELV $114
endproc CG_LoadingString 0 12
export CG_LoadingItem
proc CG_LoadingItem 4 4
line 103
;97:
;98:/*
;99:===================
;100:CG_LoadingItem
;101:===================
;102:*/
;103:void CG_LoadingItem( int itemNum ) {
line 106
;104:	gitem_t		*item;
;105:
;106:	item = &bg_itemlist[itemNum];
ADDRLP4 0
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 108
;107:	  
;108:	CG_LoadingString( item->pickup_name );
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 109
;109:}
LABELV $117
endproc CG_LoadingItem 4 4
export CG_LoadingClient
proc CG_LoadingClient 76 12
line 116
;110:
;111:/*
;112:===================
;113:CG_LoadingClient
;114:===================
;115:*/
;116:void CG_LoadingClient( int clientNum ) {
line 120
;117:	const char		*info;
;118: 	char			personality[MAX_QPATH];
;119: 
;120:	info = CG_ConfigString( CS_PLAYERS + clientNum );
ADDRFP4 0
INDIRI4
CNSTI4 548
ADDI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 122
;121: 
;122:	Q_strncpyz( personality, Info_ValueForKey( info, "n" ), sizeof(personality) );
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 123
;123:	Q_CleanStr( personality );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 130
;124:
;125:	/*
;126:	if( cgs.gametype == GT_TRAINING ) {
;127:		trap_S_RegisterSound( va( "sound/player/announce/%s.wav", personality ), qtrue );
;128:	}
;129:	*/
;130:	CG_LoadingString( personality );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 131
;131:}
LABELV $118
endproc CG_LoadingClient 76 12
export CG_ParseHelpFile
proc CG_ParseHelpFile 20744 20
line 133
;132:
;133:qboolean	CG_ParseHelpFile( void ) {
line 144
;134:	char		*text_p;
;135:	int			len;
;136://	int			lines = 0;
;137:	char		*token;
;138://	float		fps;
;139:	int			skip;
;140:	char		text[20000];
;141:	char		filename[128];
;142:	fileHandle_t	f;	
;143: 
;144:	Com_sprintf(filename, sizeof( filename ), "scripts/script_help.cfg" );
ADDRLP4 8
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $121
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 149
;145: 
;146:	//
;147:	// set defaults
;148:	//
;149:	cgs.helpNumGameMessages = 0;
ADDRGP4 cgs+607576
CNSTI4 0
ASGNI4
line 150
;150:	cgs.helpNumMissionMessages = 0;
ADDRGP4 cgs+607580
CNSTI4 0
ASGNI4
line 152
;151:
;152:	memset( &cgs.helpGameMessages , 0, sizeof( cgs.helpGameMessages ) );
ADDRGP4 cgs+214360
ARGP4
CNSTI4 0
ARGI4
CNSTI4 131072
ARGI4
ADDRGP4 memset
CALLP4
pop
line 153
;153:	memset( &cgs.helpMissionMessages , 0, sizeof( cgs.helpMissionMessages ) );
ADDRGP4 cgs+345432
ARGP4
CNSTI4 0
ARGI4
CNSTI4 262144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 156
;154:
;155:	// load the file
;156:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRLP4 8
ARGP4
ADDRLP4 20140
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20148
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 20148
INDIRI4
ASGNI4
line 157
;157:	if ( len <= 0 ) {
ADDRLP4 136
INDIRI4
CNSTI4 0
GTI4 $128
line 158
;158:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $120
JUMPV
LABELV $128
line 160
;159:	}
;160:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 136
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $130
line 161
;161:		CG_Printf( "File %s (%i>%i)too long\n", text, len, sizeof( text) );
ADDRGP4 $132
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
CNSTU4 20000
ARGU4
ADDRGP4 CG_Printf
CALLV
pop
line 162
;162:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $120
JUMPV
LABELV $130
line 164
;163:	}
;164:	trap_FS_Read( text, len, f );
ADDRLP4 140
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 20140
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 165
;165:	text[len] = 0;
ADDRLP4 136
INDIRI4
ADDRLP4 140
ADDP4
CNSTI1 0
ASGNI1
line 166
;166:	trap_FS_FCloseFile( f );
ADDRLP4 20140
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 169
;167:
;168:	// parse the text
;169:	text_p = text;
ADDRLP4 4
ADDRLP4 140
ASGNP4
line 170
;170:	skip = 0;	// quite the compiler warning
ADDRLP4 20144
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $133
line 174
;171:   
;172:
;173:	// parse  
;174:	while ( 1 ) { 
line 176
;175: 
;176:		token = COM_Parse( &text_p ); 
ADDRLP4 4
ARGP4
ADDRLP4 20152
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20152
INDIRP4
ASGNP4
line 179
;177:
;178:		// no token? stop parsing...
;179:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $136
line 180
;180:			break;
ADDRGP4 $135
JUMPV
LABELV $136
line 184
;181:		}  
;182:
;183:		// reached end of file
;184:		if ( !Q_stricmp( token, "$EOF" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 20156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20156
INDIRI4
CNSTI4 0
NEI4 $138
line 185
;185:			break;
ADDRGP4 $135
JUMPV
LABELV $138
line 188
;186:  
;187:		// start parsing seals part
;188:		if ( !Q_stricmp( token, "[gameplay]" ) && cgs.helpNumGameMessages <= 0)
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 20160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20164
CNSTI4 0
ASGNI4
ADDRLP4 20160
INDIRI4
ADDRLP4 20164
INDIRI4
NEI4 $141
ADDRGP4 cgs+607576
INDIRI4
ADDRLP4 20164
INDIRI4
GTI4 $141
line 189
;189:		{			
ADDRGP4 $146
JUMPV
LABELV $145
line 191
;190:			while ( 1 )
;191:			{ 
line 193
;192:				// get new token
;193:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20168
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20168
INDIRP4
ASGNP4
line 195
;194:
;195:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $148
line 196
;196:				{
line 197
;197:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 198
;198:					break;
ADDRGP4 $147
JUMPV
LABELV $148
line 201
;199:				}
;200:
;201:				if ( !Q_stricmp( token , "[end]" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20172
INDIRI4
CNSTI4 0
NEI4 $151
line 202
;202:					break;
ADDRGP4 $147
JUMPV
LABELV $151
line 204
;203:				
;204:				if ( !Q_stricmp( token , "{" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 20176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20176
INDIRI4
CNSTI4 0
NEI4 $154
line 205
;205:				{
ADDRGP4 $158
JUMPV
LABELV $157
line 207
;206:					while ( 1 )
;207:					{
line 209
;208:						// get new token
;209:						token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20180
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20180
INDIRP4
ASGNP4
line 211
;210:
;211:						if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $160
line 212
;212:						{
line 213
;213:							CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 214
;214:							break;
ADDRGP4 $159
JUMPV
LABELV $160
line 217
;215:						} 
;216:
;217:						if ( token[0] == '@' || ( token[0] =='\\' && token[1] == 'n' ) )
ADDRLP4 20188
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20188
INDIRI4
CNSTI4 64
EQI4 $164
ADDRLP4 20188
INDIRI4
CNSTI4 92
NEI4 $162
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $162
LABELV $164
line 218
;218:						{
line 219
;219:							strcat(  cgs.helpGameMessages[ cgs.helpNumGameMessages ], "\n");
ADDRGP4 cgs+607576
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 cgs+214360
ADDP4
ARGP4
ADDRGP4 $167
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 220
;220:							continue;
ADDRGP4 $158
JUMPV
LABELV $162
line 222
;221:						}
;222:						if ( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $168
line 225
;223://							CG_Printf("Parsed (help line %i) : %s\n", cgs.helpNumGameMessages, cgs.helpGameMessages[cgs.helpNumGameMessages] );
;224:
;225:							cgs.helpNumGameMessages++;
ADDRLP4 20192
ADDRGP4 cgs+607576
ASGNP4
ADDRLP4 20192
INDIRP4
ADDRLP4 20192
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 226
;226:							if ( cgs.helpNumGameMessages >= MAX_HELP_LINES )
ADDRGP4 cgs+607576
INDIRI4
CNSTI4 256
LTI4 $159
line 227
;227:								return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $120
JUMPV
line 228
;228:							break;
LABELV $168
line 230
;229:						}
;230:						else {
line 233
;231:							char temp[MAX_CHARS_PER_LINE];   				
;232:
;233:							Com_sprintf( temp, sizeof( temp ), "%s %s", cgs.helpGameMessages[ cgs.helpNumGameMessages ],  token );
ADDRLP4 20192
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $174
ARGP4
ADDRGP4 cgs+607576
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 cgs+214360
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 235
;234:
;235:							strcpy( cgs.helpGameMessages[ cgs.helpNumGameMessages ], temp );
ADDRGP4 cgs+607576
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 cgs+214360
ADDP4
ARGP4
ADDRLP4 20192
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 236
;236:						}
line 237
;237:					}
LABELV $158
line 206
ADDRGP4 $157
JUMPV
LABELV $159
line 238
;238:				}
LABELV $154
line 239
;239:			}
LABELV $146
line 190
ADDRGP4 $145
JUMPV
LABELV $147
line 240
;240:		}
LABELV $141
line 243
;241:
;242:		if ( 
;243:			( !Q_stricmp( token, "[vip-r]" ) && cgs.mi_vipRescue ) ||
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 20168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20172
CNSTI4 0
ASGNI4
ADDRLP4 20168
INDIRI4
ADDRLP4 20172
INDIRI4
NEI4 $192
ADDRGP4 cgs+214176
INDIRI4
ADDRLP4 20172
INDIRI4
NEI4 $197
LABELV $192
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 20176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20180
CNSTI4 0
ASGNI4
ADDRLP4 20176
INDIRI4
ADDRLP4 20180
INDIRI4
NEI4 $194
ADDRGP4 cgs+214180
INDIRI4
ADDRLP4 20180
INDIRI4
NEI4 $197
LABELV $194
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $185
ARGP4
ADDRLP4 20184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20188
CNSTI4 0
ASGNI4
ADDRLP4 20184
INDIRI4
ADDRLP4 20188
INDIRI4
NEI4 $196
ADDRGP4 cgs+214184
INDIRI4
ADDRLP4 20188
INDIRI4
NEI4 $197
LABELV $196
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $187
ARGP4
ADDRLP4 20192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20196
CNSTI4 0
ASGNI4
ADDRLP4 20192
INDIRI4
ADDRLP4 20196
INDIRI4
NEI4 $198
ADDRGP4 cgs+214172
INDIRI4
ADDRLP4 20196
INDIRI4
NEI4 $197
LABELV $198
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $189
ARGP4
ADDRLP4 20200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20204
CNSTI4 0
ASGNI4
ADDRLP4 20200
INDIRI4
ADDRLP4 20204
INDIRI4
NEI4 $179
ADDRGP4 cgs+214168
INDIRI4
ADDRLP4 20204
INDIRI4
EQI4 $179
LABELV $197
line 249
;244:			( !Q_stricmp( token, "[vip-t]" ) && cgs.mi_vipTime ) ||
;245:			( !Q_stricmp( token, "[bc]" ) && cgs.mi_sealBriefcase ) ||
;246:			( !Q_stricmp( token, "[bomb]" ) && cgs.mi_bombSpot ) ||
;247:			( !Q_stricmp( token, "[assault]" ) && cgs.mi_assaultFields )
;248:		   )
;249: 		{			
ADDRGP4 $200
JUMPV
LABELV $199
line 251
;250:			while ( 1 )
;251:			{ 
line 253
;252:				// get new token
;253:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20208
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20208
INDIRP4
ASGNP4
line 255
;254:
;255:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $202
line 256
;256:				{
line 257
;257:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 258
;258:					break;
ADDRGP4 $201
JUMPV
LABELV $202
line 261
;259:				}
;260:
;261:				if ( !Q_stricmp( token , "[end]" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20212
INDIRI4
CNSTI4 0
NEI4 $204
line 262
;262:					break;
ADDRGP4 $201
JUMPV
LABELV $204
line 264
;263:				
;264:				if ( !Q_stricmp( token , "{" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 20216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20216
INDIRI4
CNSTI4 0
NEI4 $206
line 265
;265:				{
ADDRGP4 $209
JUMPV
LABELV $208
line 267
;266:					while ( 1 )
;267:					{
line 269
;268:						// get new token
;269:						token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20220
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20220
INDIRP4
ASGNP4
line 271
;270:
;271:						if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $211
line 272
;272:						{
line 273
;273:							CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 274
;274:							break;
ADDRGP4 $210
JUMPV
LABELV $211
line 277
;275:						}
;276: 
;277:						if ( token[0] == '@' || ( token[0] =='\\' && token[1] == 'n' ) )
ADDRLP4 20228
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20228
INDIRI4
CNSTI4 64
EQI4 $215
ADDRLP4 20228
INDIRI4
CNSTI4 92
NEI4 $213
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $213
LABELV $215
line 278
;278:						{
line 279
;279:							strcat(  cgs.helpMissionMessages[ cgs.helpNumMissionMessages ], "\n");
ADDRGP4 cgs+607580
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 cgs+345432
ADDP4
ARGP4
ADDRGP4 $167
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 280
;280:							continue;
ADDRGP4 $209
JUMPV
LABELV $213
line 282
;281:						}
;282:						if ( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $218
line 285
;283://							CG_Printf("Parsed (gamehelp line %i) : %s\n", cgs.helpNumMissionMessages, cgs.helpMissionMessages[cgs.helpNumMissionMessages] );
;284: 
;285:							cgs.helpNumMissionMessages++;
ADDRLP4 20232
ADDRGP4 cgs+607580
ASGNP4
ADDRLP4 20232
INDIRP4
ADDRLP4 20232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 286
;286:							if ( cgs.helpNumMissionMessages >= MAX_HELP_LINES )
ADDRGP4 cgs+607580
INDIRI4
CNSTI4 256
LTI4 $210
line 287
;287:								return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $120
JUMPV
line 288
;288:							break;
LABELV $218
line 290
;289:						}
;290:						else {
line 293
;291:							char temp[MAX_CHARS_PER_LINE];   				
;292:
;293:							Com_sprintf( temp, sizeof( temp ), "%s %s", cgs.helpMissionMessages[ cgs.helpNumMissionMessages ],  token );
ADDRLP4 20232
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $174
ARGP4
ADDRGP4 cgs+607580
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 cgs+345432
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 295
;294:
;295:							strcpy( cgs.helpMissionMessages[ cgs.helpNumMissionMessages ], temp );
ADDRGP4 cgs+607580
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 cgs+345432
ADDP4
ARGP4
ADDRLP4 20232
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 296
;296:						}
line 297
;297:					}
LABELV $209
line 266
ADDRGP4 $208
JUMPV
LABELV $210
line 298
;298:				}
LABELV $206
line 299
;299:			}
LABELV $200
line 250
ADDRGP4 $199
JUMPV
LABELV $201
line 300
;300:		}
LABELV $179
line 301
;301:	}  
LABELV $134
line 174
ADDRGP4 $133
JUMPV
LABELV $135
line 303
;302:
;303:	return qtrue;
CNSTI4 1
RETI4
LABELV $120
endproc CG_ParseHelpFile 20744 20
export CG_HandleHelp
proc CG_HandleHelp 28 12
line 307
;304:}
;305:
;306:void CG_HandleHelp( void )
;307:{
line 308
;308:	float	rnd = random();
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 310
;309:	int		numHelp; // which message to be displayed
;310:	int		count = MAX_HELP_LINES;	// so we don't get stuck in a loop
ADDRLP4 4
CNSTI4 256
ASGNI4
line 311
;311:	qboolean mission = qfalse; // display a mission related help message?
ADDRLP4 8
CNSTI4 0
ASGNI4
line 313
;312:
;313:	if ( cgs.helpLastMessageTime > cg.time ||
ADDRGP4 cgs+610656
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $239
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 cgs+607576
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $239
ADDRGP4 cg_newbeeTime+8
INDIRF4
CNSTF4 0
LEF4 $239
ADDRGP4 cg+107636+4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $229
LABELV $239
line 317
;314:		cgs.helpNumGameMessages <= 0 ||
;315:		cg_newbeeTime.value <= 0 ||
;316:		cg.predictedPlayerState.pm_type != PM_NORMAL )
;317:		return;
ADDRGP4 $228
JUMPV
LABELV $229
line 319
;318:
;319:	if ( cg.predictedPlayerState.persistant[PERS_TEAM] != TEAM_RED &&
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 1
EQI4 $240
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 2
EQI4 $240
line 321
;320:		cg.predictedPlayerState.persistant[PERS_TEAM] != TEAM_BLUE )
;321:		return;
ADDRGP4 $228
JUMPV
LABELV $240
line 323
;322: 
;323:	if ( rnd < 0.5 && cgs.helpNumMissionMessages > 0 )
ADDRLP4 12
INDIRF4
CNSTF4 1056964608
GEF4 $248
ADDRGP4 cgs+607580
INDIRI4
CNSTI4 0
LEI4 $248
line 324
;324:		mission = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $248
line 326
;325:	
;326:	if ( mission )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $251
line 327
;327:	{
line 328
;328:		numHelp = random() * ( cgs.helpNumMissionMessages-1 );
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRGP4 cgs+607580
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 329
;329:	}
ADDRGP4 $252
JUMPV
LABELV $251
line 331
;330:	else
;331:	{
line 332
;332:		numHelp = random() * ( cgs.helpNumGameMessages-1 );
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRGP4 cgs+607576
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 333
;333:	}
LABELV $252
line 335
;334:
;335:	if ( mission )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $255
line 336
;336:	{
line 337
;337:		count = cgs.helpNumMissionMessages*2;
ADDRLP4 4
ADDRGP4 cgs+607580
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
line 340
;338:
;339:		while ( cgs.helpNumDisplayedMissionMessage[ numHelp ] && count )
;340:		{
line 341
;341:			numHelp++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 342
;342:			count--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 344
;343:
;344:			if( numHelp >= cgs.helpNumMissionMessages  )
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+607580
INDIRI4
LTI4 $262
line 345
;345:				numHelp = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $262
line 346
;346:		}
LABELV $259
line 339
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+608608
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $265
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $258
LABELV $265
line 347
;347:		if ( count == 0 ) // already disaplyed everything
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $256
line 348
;348:			cgs.helpNumMissionMessages = 0; 
ADDRGP4 cgs+607580
CNSTI4 0
ASGNI4
line 349
;349:	}
ADDRGP4 $256
JUMPV
LABELV $255
line 351
;350:	else
;351:	{
line 352
;352:		count = cgs.helpNumGameMessages*2;
ADDRLP4 4
ADDRGP4 cgs+607576
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $270
line 355
;353:
;354:		while ( cgs.helpNumDisplayedGameMessage[ numHelp ] && count )
;355:		{
line 356
;356:			numHelp++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 357
;357:			count--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 359
;358:
;359:			if( numHelp >= cgs.helpNumGameMessages )
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+607576
INDIRI4
LTI4 $274
line 360
;360:				numHelp = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $274
line 361
;361:		}
LABELV $271
line 354
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+607584
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $277
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $270
LABELV $277
line 362
;362:		if ( count == 0 ) // we have to reset it, since all messages seem to be displayed.
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $278
line 363
;363:			cgs.helpNumGameMessages = 0;
ADDRGP4 cgs+607576
CNSTI4 0
ASGNI4
LABELV $278
line 364
;364:	}
LABELV $256
line 368
;365:
;366:/*	CG_Printf("Message: %s curnum: %i maxnum: %i mission: %i\n",cgs.helpMissionMessages[ numHelp ]
;367:	,numHelp, cgs.helpNumGameMessages, mission );*/
;368:	if ( mission )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $281
line 369
;369:	{
line 370
;370:		cgs.helpNumDisplayedMissionMessage[ numHelp ] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+608608
ADDP4
CNSTI4 1
ASGNI4
line 371
;371:		CG_NewbieMessage( va("%s%s",S_COLOR_GREEN, cgs.helpMissionMessages[ numHelp ] ) , SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $284
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 cgs+345432
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 372
;372:	}
ADDRGP4 $282
JUMPV
LABELV $281
line 374
;373:	else
;374:	{
line 375
;375:		cgs.helpNumDisplayedGameMessage[ numHelp ] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+607584
ADDP4
CNSTI4 1
ASGNI4
line 376
;376:	 	CG_NewbieMessage( va("%s%s",S_COLOR_GREEN, cgs.helpGameMessages[ numHelp ] ) , SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $284
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 cgs+214360
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 377
;377:	}
LABELV $282
line 379
;378:        
;379:	cgs.helpLastMessageTime = cg.time + (10000 + random()*5000 );
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cgs+610656
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1167867904
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1176256512
ADDF4
ADDF4
CVFI4 4
ASGNI4
line 380
;380:}
LABELV $228
endproc CG_HandleHelp 28 12
data
export sealBriefingLines
align 4
LABELV sealBriefingLines
byte 4 0
export tangoBriefingLines
align 4
LABELV tangoBriefingLines
byte 4 0
export CG_GetCamoTypeForString
code
proc CG_GetCamoTypeForString 16 8
line 397
;381:/*
;382:======================
;383:CG_ParseBriefingFile
;384:
;385:Reads a briefing file containing information about the map that is beeing loaded
;386:briefing/map_%s.brf,
;387:======================
;388:*/
;389:#define MAX_BRIEFING_LINES 128
;390:
;391:char SealBriefing[ MAX_BRIEFING_LINES ][ MAX_CHARS_PER_LINE ]; // max chars per line
;392:int	sealBriefingLines = 0;
;393:
;394:char TangoBriefing[ MAX_BRIEFING_LINES ][ MAX_CHARS_PER_LINE ]; // max chars per line
;395:int	tangoBriefingLines = 0;
;396:
;397:int CG_GetCamoTypeForString( char *camostring ) {
line 399
;398:	// return default
;399:	if (!camostring)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $294
line 400
;400:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $294
line 402
;401:
;402:	if ( !Q_stricmp( camostring , "urban" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $296
line 403
;403:		return CAMO_URBAN;
CNSTI4 4
RETI4
ADDRGP4 $293
JUMPV
LABELV $296
line 404
;404:	else if ( !Q_stricmp( camostring , "arctic" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $299
line 405
;405:		return CAMO_ARCTIC;
CNSTI4 3
RETI4
ADDRGP4 $293
JUMPV
LABELV $299
line 406
;406:	else if ( !Q_stricmp( camostring , "jungle" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $304
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $302
line 407
;407:		return CAMO_JUNGLE;
CNSTI4 2
RETI4
ADDRGP4 $293
JUMPV
LABELV $302
line 408
;408:	else if ( !Q_stricmp( camostring , "desert" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $307
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $305
line 409
;409:		return CAMO_DESERT;
CNSTI4 1
RETI4
ADDRGP4 $293
JUMPV
LABELV $305
line 411
;410:	else
;411:		return -1; 
CNSTI4 -1
RETI4
LABELV $293
endproc CG_GetCamoTypeForString 16 8
export CG_GetCamoStringForType
proc CG_GetCamoStringForType 0 0
line 414
;412:}
;413:
;414:char *CG_GetCamoStringForType( int camoType ) {
line 416
;415:	// return default
;416:	if (!camoType)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $309
line 417
;417:		return "";
ADDRGP4 $311
RETP4
ADDRGP4 $308
JUMPV
LABELV $309
line 419
;418:
;419:	if ( camoType == CAMO_URBAN )
ADDRFP4 0
INDIRI4
CNSTI4 4
NEI4 $312
line 420
;420:		return "_urban";
ADDRGP4 $314
RETP4
ADDRGP4 $308
JUMPV
LABELV $312
line 421
;421:	else if ( camoType == CAMO_ARCTIC )
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $315
line 422
;422:		return "_arctic";
ADDRGP4 $317
RETP4
ADDRGP4 $308
JUMPV
LABELV $315
line 423
;423:	else if ( camoType == CAMO_JUNGLE )
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $318
line 424
;424:		return "_jungle";
ADDRGP4 $320
RETP4
ADDRGP4 $308
JUMPV
LABELV $318
line 425
;425:	else if ( camoType == CAMO_DESERT )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $321
line 426
;426:		return "_desert";
ADDRGP4 $323
RETP4
ADDRGP4 $308
JUMPV
LABELV $321
line 428
;427:	
;428:	return "";
ADDRGP4 $311
RETP4
LABELV $308
endproc CG_GetCamoStringForType 0 0
export CG_ParseBriefingFile
proc CG_ParseBriefingFile 20224 16
line 431
;429:}
;430:
;431:qboolean	CG_ParseBriefingFile(  char *mapstring  ) {
line 442
;432:	char		*text_p;
;433:	int			len;
;434://	int			lines = 0;
;435:	char		*token;
;436://	float		fps;
;437:	int			skip;
;438:	char		text[20000];
;439:	char		filename[128];
;440:	fileHandle_t	f;	
;441: 
;442:	sealBriefingLines = tangoBriefingLines = 0;
ADDRLP4 20148
CNSTI4 0
ASGNI4
ADDRGP4 tangoBriefingLines
ADDRLP4 20148
INDIRI4
ASGNI4
ADDRGP4 sealBriefingLines
ADDRLP4 20148
INDIRI4
ASGNI4
line 443
;443:	Com_sprintf(filename, sizeof( filename), "briefing/map_%s.brf", mapstring );
ADDRLP4 8
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $325
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 448
;444: 	
;445:	//
;446:	// set defaults
;447:	//
;448:	cgs.camoType = CAMO_URBAN;
ADDRGP4 cgs+214196
CNSTI4 4
ASGNI4
line 449
;449:	strcpy( cgs.vipType, "arab" );
ADDRGP4 cgs+214200
ARGP4
ADDRGP4 $328
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 451
;450:
;451:	cgs.mi_assaultFields = 0;
ADDRGP4 cgs+214168
CNSTI4 0
ASGNI4
line 452
;452:	cgs.mi_bombSpot = qfalse;
ADDRGP4 cgs+214172
CNSTI4 0
ASGNI4
line 453
;453:	cgs.mi_vipRescue = qfalse;
ADDRGP4 cgs+214176
CNSTI4 0
ASGNI4
line 454
;454:	cgs.mi_vipTime = qfalse;
ADDRGP4 cgs+214180
CNSTI4 0
ASGNI4
line 455
;455:	cgs.mi_sealBriefcase = qfalse;
ADDRGP4 cgs+214184
CNSTI4 0
ASGNI4
line 457
;456:
;457:	cg.mapOriginX = cg.mapOriginY = 256;
ADDRLP4 20152
CNSTI4 256
ASGNI4
ADDRGP4 cg+167384
ADDRLP4 20152
INDIRI4
ASGNI4
ADDRGP4 cg+167380
ADDRLP4 20152
INDIRI4
ASGNI4
line 459
;458:
;459:	cg.radarNumObjects = 0;
ADDRGP4 cg+173304
CNSTI4 0
ASGNI4
line 460
;460:	memset( &cg.radarObjects, sizeof(cg.radarObjects), 0 );
ADDRGP4 cg+173308
ARGP4
CNSTI4 28672
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 memset
CALLP4
pop
line 462
;461:
;462:	memset( &cgs.mi_helpers , 0, sizeof( cgs.mi_helpers ) );
ADDRGP4 cgs+214132
ARGP4
CNSTI4 0
ARGI4
CNSTI4 36
ARGI4
ADDRGP4 memset
CALLP4
pop
line 465
;463:
;464:	// load the file
;465:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRLP4 8
ARGP4
ADDRLP4 20140
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20156
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 20156
INDIRI4
ASGNI4
line 466
;466:	if ( len <= 0 ) {
ADDRLP4 136
INDIRI4
CNSTI4 0
GTI4 $341
line 467
;467:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $324
JUMPV
LABELV $341
line 469
;468:	}
;469:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 136
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $343
line 470
;470:		CG_Printf( "File %s (%i>%i)too long\n", text, len, sizeof( text) );
ADDRGP4 $132
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
CNSTU4 20000
ARGU4
ADDRGP4 CG_Printf
CALLV
pop
line 471
;471:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $324
JUMPV
LABELV $343
line 473
;472:	}
;473:	trap_FS_Read( text, len, f );
ADDRLP4 140
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 20140
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 474
;474:	text[len] = 0;
ADDRLP4 136
INDIRI4
ADDRLP4 140
ADDP4
CNSTI1 0
ASGNI1
line 475
;475:	trap_FS_FCloseFile( f );
ADDRLP4 20140
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 478
;476:
;477:	// parse the text
;478:	text_p = text;
ADDRLP4 4
ADDRLP4 140
ASGNP4
line 479
;479:	skip = 0;	// quite the compiler warning
ADDRLP4 20144
CNSTI4 0
ASGNI4
ADDRGP4 $346
JUMPV
LABELV $345
line 482
;480:  
;481:	// parse  
;482:	while ( 1 ) { 
line 484
;483: 
;484:		token = COM_Parse( &text_p ); 
ADDRLP4 4
ARGP4
ADDRLP4 20160
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20160
INDIRP4
ASGNP4
line 487
;485:
;486:		// no token? stop parsing...
;487:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $348
line 488
;488:			break;
ADDRGP4 $347
JUMPV
LABELV $348
line 492
;489:		}  
;490:
;491:		// reached end of file
;492:		if ( !Q_stricmp( token, "$EOF" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 20164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20164
INDIRI4
CNSTI4 0
NEI4 $350
line 493
;493:			break;
ADDRGP4 $347
JUMPV
LABELV $350
line 495
;494:
;495: 		if ( !Q_stricmp( token, "[radar]" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 20168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20168
INDIRI4
CNSTI4 0
NEI4 $352
line 496
;496:		{
line 497
;497:			cg.radarNumObjects = 0;
ADDRGP4 cg+173304
CNSTI4 0
ASGNI4
line 498
;498:			memset( &cg.radarObjects, sizeof(cg.radarObjects), 0 );
ADDRGP4 cg+173308
ARGP4
CNSTI4 28672
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $359
JUMPV
LABELV $358
line 501
;499:
;500:			while ( 1 )
;501:			{
line 504
;502:	
;503:				// get new token
;504:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20172
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20172
INDIRP4
ASGNP4
line 506
;505: 
;506:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $361
line 507
;507:				{
line 508
;508:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 509
;509:					break;
ADDRGP4 $346
JUMPV
LABELV $361
line 512
;510:				}
;511:
;512:				if ( !Q_stricmp( token , "[end]" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20176
INDIRI4
CNSTI4 0
NEI4 $363
line 513
;513:					break;
ADDRGP4 $346
JUMPV
LABELV $363
line 515
;514:
;515:				cg.radarObjects[cg.radarNumObjects].type = token[0];
CNSTI4 28
ADDRGP4 cg+173304
INDIRI4
MULI4
ADDRGP4 cg+173308
ADDP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 518
;516:
;517:				// get new token
;518:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20180
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20180
INDIRP4
ASGNP4
line 520
;519: 
;520:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $367
line 521
;521:				{
line 522
;522:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 523
;523:					break;
ADDRGP4 $346
JUMPV
LABELV $367
line 526
;524:				}
;525:
;526:				cg.radarObjects[cg.radarNumObjects].origin[0] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20184
ADDRGP4 atof
CALLF4
ASGNF4
CNSTI4 28
ADDRGP4 cg+173304
INDIRI4
MULI4
ADDRGP4 cg+173308+16
ADDP4
ADDRLP4 20184
INDIRF4
ASGNF4
line 528
;527:				// get new token
;528:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20188
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20188
INDIRP4
ASGNP4
line 530
;529: 
;530:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $372
line 531
;531:				{
line 532
;532:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 533
;533:					break;
ADDRGP4 $346
JUMPV
LABELV $372
line 536
;534:				}
;535:
;536:				cg.radarObjects[cg.radarNumObjects].origin[1] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20192
ADDRGP4 atof
CALLF4
ASGNF4
CNSTI4 28
ADDRGP4 cg+173304
INDIRI4
MULI4
ADDRGP4 cg+173308+16+4
ADDP4
ADDRLP4 20192
INDIRF4
ASGNF4
line 538
;537:				// get new token
;538:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20196
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20196
INDIRP4
ASGNP4
line 540
;539: 
;540:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $378
line 541
;541:				{
line 542
;542:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 543
;543:					break;
ADDRGP4 $346
JUMPV
LABELV $378
line 546
;544:				}
;545:
;546:				cg.radarObjects[cg.radarNumObjects].origin[2] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20200
ADDRGP4 atof
CALLF4
ASGNF4
CNSTI4 28
ADDRGP4 cg+173304
INDIRI4
MULI4
ADDRGP4 cg+173308+16+8
ADDP4
ADDRLP4 20200
INDIRF4
ASGNF4
line 547
;547:				cg.radarNumObjects++;
ADDRLP4 20204
ADDRGP4 cg+173304
ASGNP4
ADDRLP4 20204
INDIRP4
ADDRLP4 20204
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 548
;548:			}
LABELV $359
line 500
ADDRGP4 $358
JUMPV
line 549
;549:			continue;
ADDRGP4 $346
JUMPV
LABELV $352
line 552
;550:		}
;551:
;552:		if ( !Q_stricmp( token, "[mapspecs]" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 20172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20172
INDIRI4
CNSTI4 0
NEI4 $385
line 553
;553:		{
ADDRGP4 $389
JUMPV
LABELV $388
line 555
;554:			while ( 1 )
;555:			{
line 558
;556:	
;557:				// get new token
;558:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20176
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20176
INDIRP4
ASGNP4
line 561
;559:
;560:
;561:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $391
line 562
;562:				{
line 563
;563:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 564
;564:					break;
ADDRGP4 $390
JUMPV
LABELV $391
line 567
;565:				}
;566:
;567:				if ( !Q_stricmp( token , "[end]" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20180
INDIRI4
CNSTI4 0
NEI4 $393
line 568
;568:					break;
ADDRGP4 $390
JUMPV
LABELV $393
line 570
;569:				
;570:				if ( !Q_stricmp( token , "missioninfo" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $397
ARGP4
ADDRLP4 20184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20184
INDIRI4
CNSTI4 0
NEI4 $395
line 571
;571:				{
line 574
;572:					
;573:					// get new token
;574:					token = COM_Parse( &text_p ); // parse out {
ADDRLP4 4
ARGP4
ADDRLP4 20188
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20188
INDIRP4
ASGNP4
line 576
;575:
;576:					if ( !Q_stricmp( token, "{" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 20192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20192
INDIRI4
CNSTI4 0
NEI4 $398
line 577
;577:					{
ADDRGP4 $401
JUMPV
LABELV $400
line 579
;578:						while ( 1 )
;579:						{
line 582
;580:
;581:							// get new token
;582:							token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20196
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20196
INDIRP4
ASGNP4
line 584
;583:
;584:							if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $403
line 585
;585:							{
line 586
;586:								CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 587
;587:								break;
ADDRGP4 $402
JUMPV
LABELV $403
line 591
;588:							}
;589:
;590:							// end parsing
;591:							if ( !Q_stricmp( token , "}" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $407
ARGP4
ADDRLP4 20200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20200
INDIRI4
CNSTI4 0
NEI4 $405
line 592
;592:								break;
ADDRGP4 $402
JUMPV
LABELV $405
line 594
;593:							
;594:							if ( !Q_stricmp( token, "assaultfield" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $410
ARGP4
ADDRLP4 20204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20204
INDIRI4
CNSTI4 0
NEI4 $408
line 595
;595:							{
line 596
;596:								cgs.mi_assaultFields++;
ADDRLP4 20208
ADDRGP4 cgs+214168
ASGNP4
ADDRLP4 20208
INDIRP4
ADDRLP4 20208
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 598
;597:
;598:								if( cgs.mi_assaultFields > 4 )
ADDRGP4 cgs+214168
INDIRI4
CNSTI4 4
LEI4 $401
line 599
;599:									CG_Error("num assaultfields > MAX_ASSAULTFIELDS\n");
ADDRGP4 $415
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 600
;600:								continue;
ADDRGP4 $401
JUMPV
LABELV $408
line 602
;601:							}
;602:							else if ( !Q_stricmp( token, "viprescue" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $418
ARGP4
ADDRLP4 20208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20208
INDIRI4
CNSTI4 0
NEI4 $416
line 603
;603:							{
line 604
;604:								cgs.mi_vipRescue = qtrue;
ADDRGP4 cgs+214176
CNSTI4 1
ASGNI4
line 606
;605:
;606:								if( cgs.mi_vipTime )
ADDRGP4 cgs+214180
INDIRI4
CNSTI4 0
EQI4 $401
line 607
;607:									CG_Error("VIP type not allowed ( viptime viprescue )\n");
ADDRGP4 $423
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 608
;608:								continue;
ADDRGP4 $401
JUMPV
LABELV $416
line 610
;609:							}
;610:							else if ( !Q_stricmp( token, "viptime" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
ADDRLP4 20212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20212
INDIRI4
CNSTI4 0
NEI4 $424
line 611
;611:							{
line 612
;612:								cgs.mi_vipTime = qtrue;
ADDRGP4 cgs+214180
CNSTI4 1
ASGNI4
line 614
;613:
;614:								if( cgs.mi_vipRescue )
ADDRGP4 cgs+214176
INDIRI4
CNSTI4 0
EQI4 $401
line 615
;615:									CG_Error("VIP type not allowed ( viprescue viptime )\n");
ADDRGP4 $431
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 616
;616:								continue;
ADDRGP4 $401
JUMPV
LABELV $424
line 618
;617:							}
;618:							else if ( !Q_stricmp( token, "blowup" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $434
ARGP4
ADDRLP4 20216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20216
INDIRI4
CNSTI4 0
NEI4 $432
line 619
;619:							{
line 620
;620:								if( cgs.mi_bombSpot )
ADDRGP4 cgs+214172
INDIRI4
CNSTI4 0
EQI4 $435
line 621
;621:									CG_Error("Bombmode already set ( blowup blowup )\n");
ADDRGP4 $438
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $435
line 623
;622:
;623:								cgs.mi_bombSpot = qtrue;								
ADDRGP4 cgs+214172
CNSTI4 1
ASGNI4
line 624
;624:								continue;
ADDRGP4 $401
JUMPV
LABELV $432
line 626
;625:							}
;626:							else if ( !Q_stricmp( token, "bc" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 20220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20220
INDIRI4
CNSTI4 0
NEI4 $440
line 627
;627:							{
line 628
;628:								if( cgs.mi_sealBriefcase )
ADDRGP4 cgs+214184
INDIRI4
CNSTI4 0
EQI4 $443
line 629
;629:									CG_Error("SealBriefcase already set ( bc bc )\n");
ADDRGP4 $446
ARGP4
ADDRGP4 CG_Error
CALLV
pop
LABELV $443
line 631
;630:
;631:								cgs.mi_sealBriefcase = qtrue;								
ADDRGP4 cgs+214184
CNSTI4 1
ASGNI4
line 632
;632:								continue;
LABELV $440
line 634
;633:							}
;634:						}
LABELV $401
line 578
ADDRGP4 $400
JUMPV
LABELV $402
line 635
;635:					}
LABELV $398
line 636
;636:				}
LABELV $395
line 637
;637:				if ( !Q_stricmp( token , "camouflage" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 20188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20188
INDIRI4
CNSTI4 0
NEI4 $448
line 638
;638:				{
line 639
;639:					token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20192
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20192
INDIRP4
ASGNP4
line 641
;640:
;641:					if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $451
line 642
;642:					{
line 643
;643:						CG_Error("No Camouflage type given(file:%s)\n", filename );
ADDRGP4 $453
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 644
;644:						break;
ADDRGP4 $390
JUMPV
LABELV $451
line 648
;645:					}
;646:
;647:					// parse camotype
;648:					cgs.camoType = CG_GetCamoTypeForString( token );					
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20196
ADDRGP4 CG_GetCamoTypeForString
CALLI4
ASGNI4
ADDRGP4 cgs+214196
ADDRLP4 20196
INDIRI4
ASGNI4
line 650
;649:					
;650:					if ( cgs.camoType < 0 ) {
ADDRGP4 cgs+214196
INDIRI4
CNSTI4 0
GEI4 $455
line 651
;651:						CG_Error("Illegal Camo type : %s", token );
ADDRGP4 $458
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 652
;652:						break;
ADDRGP4 $390
JUMPV
LABELV $455
line 655
;653:					}
;654://					CG_Printf("Parsed camo type: %s\n", token );
;655:				}
LABELV $448
line 656
;656:				if ( !Q_stricmp( token , "viptype" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $461
ARGP4
ADDRLP4 20192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20192
INDIRI4
CNSTI4 0
NEI4 $459
line 657
;657:				{
line 658
;658:					token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20196
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20196
INDIRP4
ASGNP4
line 660
;659:
;660:					if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $462
line 661
;661:					{
line 662
;662:						CG_Error("No Camouflage type given(file:%s)\n", filename );
ADDRGP4 $453
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 663
;663:						break;
ADDRGP4 $390
JUMPV
LABELV $462
line 667
;664:					}
;665:
;666:					// parse camotype
;667:					strcpy( cgs.vipType, token );
ADDRGP4 cgs+214200
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 669
;668:					
;669:					if ( strlen( cgs.vipType) <= 0 ) {
ADDRGP4 cgs+214200
ARGP4
ADDRLP4 20200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20200
INDIRI4
CNSTI4 0
GTI4 $465
line 670
;670:						CG_Error("Illegal Camo type : %s", token );
ADDRGP4 $458
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 671
;671:						break;
ADDRGP4 $390
JUMPV
LABELV $465
line 674
;672:					}
;673://					CG_Printf("Parsed VIP type: %s\n", token );
;674:				}
LABELV $459
line 675
;675:				if ( !Q_stricmp( token , "maporigin" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $470
ARGP4
ADDRLP4 20196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20196
INDIRI4
CNSTI4 0
NEI4 $468
line 676
;676:				{
line 677
;677:					token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20200
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20200
INDIRP4
ASGNP4
line 679
;678:
;679:					if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $471
line 680
;680:					{
line 681
;681:						CG_Error("not enough parameters for maporigin token(file:%s)\n", filename );
ADDRGP4 $473
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 682
;682:						break;
ADDRGP4 $390
JUMPV
LABELV $471
line 686
;683:					}
;684:
;685:					// parse camotype
;686:					cg.mapOriginX = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cg+167380
ADDRLP4 20204
INDIRI4
ASGNI4
line 688
;687:					
;688:					token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20208
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20208
INDIRP4
ASGNP4
line 690
;689:
;690:					if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $475
line 691
;691:					{
line 692
;692:						CG_Error("not enough parameters for maporigin token(file:%s)\n", filename );
ADDRGP4 $473
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 693
;693:						break;
ADDRGP4 $390
JUMPV
LABELV $475
line 697
;694:					}
;695:
;696:					// parse camotype
;697:					cg.mapOriginY = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20212
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cg+167384
ADDRLP4 20212
INDIRI4
ASGNI4
line 700
;698: 
;699://					CG_Printf("Parsed Map Origin: %i %i\n", cg.mapOriginX , cg.mapOriginY );
;700:				}
LABELV $468
line 702
;701:
;702:				if ( !Q_stricmp( token , "$enviroment" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $480
ARGP4
ADDRLP4 20200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20200
INDIRI4
CNSTI4 0
NEI4 $478
line 703
;703:				{
line 704
;704:					token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20204
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20204
INDIRP4
ASGNP4
line 706
;705:
;706:					if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $481
line 707
;707:					{
line 708
;708:						CG_Error("Found '$enviroment' string but no following string");
ADDRGP4 $483
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 709
;709:						break;
ADDRGP4 $390
JUMPV
LABELV $481
line 712
;710:					}
;711:
;712:					if ( !Q_stricmp( token, "{" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 20208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20208
INDIRI4
CNSTI4 0
NEI4 $484
line 713
;713:					{
line 714
;714:						CG_EnviromentParse( text_p );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_EnviromentParse
CALLV
pop
line 715
;715:					}
LABELV $484
line 716
;716:				}
LABELV $478
line 717
;717:			}
LABELV $389
line 554
ADDRGP4 $388
JUMPV
LABELV $390
line 718
;718:		}  
LABELV $385
line 720
;719:		// start parsing seals part
;720:		if ( !Q_stricmp( token, "[seals]" ) && sealBriefingLines <= 0)
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $488
ARGP4
ADDRLP4 20176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20180
CNSTI4 0
ASGNI4
ADDRLP4 20176
INDIRI4
ADDRLP4 20180
INDIRI4
NEI4 $486
ADDRGP4 sealBriefingLines
INDIRI4
ADDRLP4 20180
INDIRI4
GTI4 $486
line 721
;721:		{			
ADDRGP4 $490
JUMPV
LABELV $489
line 723
;722:			while ( 1 )
;723:			{ 
line 725
;724:				// get new token
;725:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20184
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20184
INDIRP4
ASGNP4
line 727
;726:
;727:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $492
line 728
;728:				{
line 729
;729:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 730
;730:					break;
ADDRGP4 $491
JUMPV
LABELV $492
line 733
;731:				}
;732:
;733:				if ( !Q_stricmp( token , "[end]" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20188
INDIRI4
CNSTI4 0
NEI4 $494
line 734
;734:					break;
ADDRGP4 $491
JUMPV
LABELV $494
line 736
;735:
;736:				if ( !Q_stricmp( token , "$EOL" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $498
ARGP4
ADDRLP4 20192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20192
INDIRI4
CNSTI4 0
NEI4 $496
line 738
;737://					CG_Printf("Parsed (S line %i) : %s\n", sealBriefingLines, SealBriefing[ sealBriefingLines ] );
;738:					sealBriefingLines++;
ADDRLP4 20196
ADDRGP4 sealBriefingLines
ASGNP4
ADDRLP4 20196
INDIRP4
ADDRLP4 20196
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 739
;739:				}
ADDRGP4 $497
JUMPV
LABELV $496
line 740
;740:				else {
line 742
;741:					// create automated linebreak
;742:					if ( strlen ( SealBriefing[ sealBriefingLines ] ) + strlen ( token ) > 44 )
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
ADDRLP4 20196
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20196
INDIRI4
ADDRLP4 20200
INDIRI4
ADDI4
CNSTI4 44
LEI4 $499
line 743
;743:						sealBriefingLines++;
ADDRLP4 20204
ADDRGP4 sealBriefingLines
ASGNP4
ADDRLP4 20204
INDIRP4
ADDRLP4 20204
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $499
line 745
;744:
;745:					if ( strlen( SealBriefing[ sealBriefingLines ] ) <= 0 )
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
ADDRLP4 20208
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20208
INDIRI4
CNSTI4 0
GTI4 $501
line 746
;746:						strcat( SealBriefing[ sealBriefingLines ], token );
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
ADDRGP4 $502
JUMPV
LABELV $501
line 748
;747:					else
;748:						strcat( SealBriefing[ sealBriefingLines ], va(" %s",token ) );
ADDRGP4 $503
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20212
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
ADDRLP4 20212
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $502
line 749
;749:				}
LABELV $497
line 751
;750: 
;751:			}
LABELV $490
line 722
ADDRGP4 $489
JUMPV
LABELV $491
line 752
;752:		}
LABELV $486
line 753
;753:		if ( !Q_stricmp( token, "[tangos]" ) && tangoBriefingLines <= 0)
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 20184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20188
CNSTI4 0
ASGNI4
ADDRLP4 20184
INDIRI4
ADDRLP4 20188
INDIRI4
NEI4 $504
ADDRGP4 tangoBriefingLines
INDIRI4
ADDRLP4 20188
INDIRI4
GTI4 $504
line 754
;754:		{			
ADDRGP4 $508
JUMPV
LABELV $507
line 756
;755:			while ( 1 )
;756:			{
line 759
;757:	
;758:				// get new token
;759:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20192
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20192
INDIRP4
ASGNP4
line 761
;760:
;761:				if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $510
line 762
;762:				{
line 763
;763:					CG_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $150
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 764
;764:					break;
ADDRGP4 $509
JUMPV
LABELV $510
line 767
;765:				}
;766:
;767:				if ( !Q_stricmp( token , "[end]" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20196
INDIRI4
CNSTI4 0
NEI4 $512
line 768
;768:					break;
ADDRGP4 $509
JUMPV
LABELV $512
line 770
;769:
;770:				if ( !Q_stricmp( token , "$EOL" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $498
ARGP4
ADDRLP4 20200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20200
INDIRI4
CNSTI4 0
NEI4 $514
line 772
;771://					CG_Printf("Parsed (T line %i) : %s\n", tangoBriefingLines, TangoBriefing[ tangoBriefingLines ] );
;772:					tangoBriefingLines++;
ADDRLP4 20204
ADDRGP4 tangoBriefingLines
ASGNP4
ADDRLP4 20204
INDIRP4
ADDRLP4 20204
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 773
;773:				}
ADDRGP4 $515
JUMPV
LABELV $514
line 774
;774:				else {
line 776
;775:					// create automated linebreak
;776:					if ( strlen ( TangoBriefing[ tangoBriefingLines ] ) + strlen ( token ) > 44 )
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
ADDRLP4 20204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20208
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20204
INDIRI4
ADDRLP4 20208
INDIRI4
ADDI4
CNSTI4 44
LEI4 $516
line 777
;777:						tangoBriefingLines++;
ADDRLP4 20212
ADDRGP4 tangoBriefingLines
ASGNP4
ADDRLP4 20212
INDIRP4
ADDRLP4 20212
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $516
line 779
;778:
;779:					if ( strlen( TangoBriefing[ tangoBriefingLines ] ) <= 0 )
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
ADDRLP4 20216
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20216
INDIRI4
CNSTI4 0
GTI4 $518
line 780
;780:						strcat( TangoBriefing[ tangoBriefingLines ], token );
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
ADDRGP4 $519
JUMPV
LABELV $518
line 782
;781:					else
;782:						strcat( TangoBriefing[ tangoBriefingLines ], va(" %s",token ) );
ADDRGP4 $503
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20220
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
ADDRLP4 20220
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $519
line 783
;783:				}
LABELV $515
line 785
;784: 
;785:			}
LABELV $508
line 755
ADDRGP4 $507
JUMPV
LABELV $509
line 786
;786:		}
LABELV $504
line 787
;787:	}  
LABELV $346
line 482
ADDRGP4 $345
JUMPV
LABELV $347
line 789
;788: 
;789:	return qtrue;
CNSTI4 1
RETI4
LABELV $324
endproc CG_ParseBriefingFile 20224 16
export CG_DrawInformation
proc CG_DrawInformation 1144 32
line 802
;790:}
;791:
;792:/*
;793:====================
;794:CG_DrawInformation
;795:
;796:Draw all the status / pacifier stuff during level loading
;797:====================
;798:*/
;799:
;800:#define INFO_STRING_START	15
;801:#define INFO_STRING_DIST	12
;802:void CG_DrawInformation( void ) {
line 813
;803:	const char	*s;
;804:	const char	*info;
;805:	const char	*sysInfo;
;806:	int			y;
;807:	int			value;
;808:	qhandle_t	levelshot;
;809:	qhandle_t	loadingscreen;
;810:	qhandle_t	detail;
;811:	char		buf[1024];
;812:	
;813:	info = CG_ConfigString( CS_SERVERINFO );
CNSTI4 0
ARGI4
ADDRLP4 1056
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 1056
INDIRP4
ASGNP4
line 814
;814:	sysInfo = CG_ConfigString( CS_SYSTEMINFO );
CNSTI4 1
ARGI4
ADDRLP4 1060
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1060
INDIRP4
ASGNP4
line 816
;815:
;816:	s = Info_ValueForKey( info, "mapname" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1064
INDIRP4
ASGNP4
line 817
;817:	levelshot = trap_R_RegisterShaderNoMip( va( "levelshots/%s.tga", s ) );
ADDRGP4 $522
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1072
INDIRI4
ASGNI4
line 818
;818:	if ( !levelshot ) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $523
line 819
;819:		levelshot = trap_R_RegisterShaderNoMip( "gfx/2d/unknownmap" );
ADDRGP4 $525
ARGP4
ADDRLP4 1076
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1076
INDIRI4
ASGNI4
line 820
;820:	}
LABELV $523
line 821
;821:	loadingscreen = trap_R_RegisterShaderNoMip( "gfx/2d/ns_briefing.tga" );
ADDRGP4 $526
ARGP4
ADDRLP4 1076
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1076
INDIRI4
ASGNI4
line 822
;822:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 825
;823: 
;824:	// draw loadingscreen
;825: 	CG_DrawPic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, loadingscreen );
ADDRLP4 1080
CNSTF4 0
ASGNF4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRLP4 1080
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 827
;826:	// draw levelshot
;827:	CG_DrawPic( 48, 23, 175, 131, levelshot );
CNSTF4 1111490560
ARGF4
CNSTF4 1102577664
ARGF4
CNSTF4 1127153664
ARGF4
CNSTF4 1124270080
ARGF4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 830
;828:
;829:	// blend a detail texture over it
;830:	detail = trap_R_RegisterShader( "levelShotDetail" );
ADDRGP4 $527
ARGP4
ADDRLP4 1084
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1084
INDIRI4
ASGNI4
line 831
;831:	CG_DrawPic( 48, 23, 175, 131, detail );
CNSTF4 1111490560
ARGF4
CNSTF4 1102577664
ARGF4
CNSTF4 1127153664
ARGF4
CNSTF4 1124270080
ARGF4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 833
;832:
;833:	CG_DrawLoadingBar( 16, 448,608,16 );
ADDRLP4 1088
CNSTI4 16
ASGNI4
ADDRLP4 1088
INDIRI4
ARGI4
CNSTI4 448
ARGI4
CNSTI4 608
ARGI4
ADDRLP4 1088
INDIRI4
ARGI4
ADDRGP4 CG_DrawLoadingBar
CALLV
pop
line 841
;834:
;835:	// the first 150 rows are reserved for the client connection
;836:	// screen to write into
;837:
;838:
;839:	// draw info string information
;840:
;841:	y = INFO_STRING_START + INFO_STRING_DIST*3;
ADDRLP4 4
CNSTI4 51
ASGNI4
line 844
;842:
;843:	// don't print server lines if playing a local game
;844:	trap_Cvar_VariableStringBuffer( "sv_running", buf, sizeof( buf ) );
ADDRGP4 $528
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 845
;845:	if ( !atoi( buf ) || 1) {
ADDRLP4 16
ARGP4
ADDRLP4 1092
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
EQI4 $531
LABELV $531
line 847
;846:		// server hostname
;847:		Q_strncpyz(buf, Info_ValueForKey( info, "sv_hostname" ), 1024);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $532
ARGP4
ADDRLP4 1096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ARGP4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 848
;848:		Q_CleanStr(buf);
ADDRLP4 16
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 849
;849:		CG_Text_Paint( 300,y, 0.2f, colorWhite, buf, 0,0,0);
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 851
;850:
;851:		y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 854
;852:
;853:		// pure server
;854:		s = Info_ValueForKey( sysInfo, "sv_pure" );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $533
ARGP4
ADDRLP4 1104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1104
INDIRP4
ASGNP4
line 855
;855:		if ( s[0] == '1' ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $534
line 856
;856:			CG_Text_Paint( 300,y, 0.2f, colorWhite, "Pure Server", 0,0,0);
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $536
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1108
CNSTI4 0
ASGNI4
ADDRLP4 1108
INDIRI4
ARGI4
ADDRLP4 1108
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 858
;857: 
;858:			y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 859
;859:		}
LABELV $534
line 862
;860:
;861:		// server-specific message of the day
;862:		s = CG_ConfigString( CS_MOTD );
CNSTI4 4
ARGI4
ADDRLP4 1108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1108
INDIRP4
ASGNP4
line 863
;863:		if ( s[0] ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $537
line 864
;864:			CG_Text_Paint( 300,y, 0.2f, colorWhite,s, 0,0,0);
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1112
CNSTI4 0
ASGNI4
ADDRLP4 1112
INDIRI4
ARGI4
ADDRLP4 1112
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 866
;865: 
;866:			y += INFO_STRING_DIST; 
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 867
;867:		}
LABELV $537
line 870
;868:
;869:		// some extra space after hostname and motd
;870:		y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 871
;871:	}
LABELV $529
line 874
;872:
;873:	// map-specific message (long map name)
;874:	s = CG_ConfigString( CS_MESSAGE );
CNSTI4 3
ARGI4
ADDRLP4 1096
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1096
INDIRP4
ASGNP4
line 875
;875:	if ( s[0] || 1 ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $541
LABELV $541
line 876
;876:		CG_Text_Paint( 300,y, 0.2f, colorWhite, s, 0,0,0);
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 878
;877: 
;878:		y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 879
;879:	}
LABELV $539
line 882
;880:
;881:	// cheats warning
;882:	s = Info_ValueForKey( sysInfo, "sv_cheats" );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $542
ARGP4
ADDRLP4 1100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1100
INDIRP4
ASGNP4
line 884
;883:
;884:	cg.cheatsEnabled = qfalse;
ADDRGP4 cg+201980
CNSTI4 0
ASGNI4
line 885
;885:	if ( s[0] == '1' ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $544
line 886
;886:		CG_Text_Paint( 300,y, 0.2f, colorWhite, va("Cheats are enabled" ), 0,0,0);
ADDRGP4 $546
ARGP4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1108
CNSTI4 0
ASGNI4
ADDRLP4 1108
INDIRI4
ARGI4
ADDRLP4 1108
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 887
;887:		y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 888
;888:		cg.cheatsEnabled = qtrue;
ADDRGP4 cg+201980
CNSTI4 1
ASGNI4
line 889
;889:	}
LABELV $544
line 892
;890:
;891:	// game type
;892:	switch ( cgs.gametype ) {
ADDRLP4 1104
ADDRGP4 cgs+31456
INDIRI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $552
ADDRLP4 1104
INDIRI4
CNSTI4 1
EQI4 $554
ADDRLP4 1104
INDIRI4
CNSTI4 3
EQI4 $556
ADDRGP4 $548
JUMPV
LABELV $552
line 894
;893:	case GT_FFA:
;894:		s = "Training";
ADDRLP4 8
ADDRGP4 $553
ASGNP4
line 895
;895:		break; 
ADDRGP4 $549
JUMPV
LABELV $554
line 897
;896:	case GT_TEAM:
;897:		s = "Free Teamplay";
ADDRLP4 8
ADDRGP4 $555
ASGNP4
line 898
;898:		break;
ADDRGP4 $549
JUMPV
LABELV $556
line 900
;899:    case GT_LTS:
;900:		s = "Mission Based";
ADDRLP4 8
ADDRGP4 $557
ASGNP4
line 901
;901:		break;
ADDRGP4 $549
JUMPV
LABELV $548
line 905
;902:
;903: 
;904:	default:
;905:		s = "Unknown Gametype";
ADDRLP4 8
ADDRGP4 $558
ASGNP4
line 906
;906:		break;
LABELV $549
line 908
;907:	}
;908:	CG_Text_Paint( 300,y, 0.2f, colorWhite,  va("Gametype is %s", s ), 0,0,0);
ADDRGP4 $559
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1116
CNSTI4 0
ASGNI4
ADDRLP4 1116
INDIRI4
ARGI4
ADDRLP4 1116
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 910
;909:
;910:	y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 912
;911:		
;912:	value = atoi( Info_ValueForKey( info, "timelimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $560
ARGP4
ADDRLP4 1120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1124
INDIRI4
ASGNI4
line 913
;913:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $561
line 914
;914:		CG_Text_Paint( 300,y, 0.2f, colorWhite,  va("Timelimit is set to: %i", value ), 0,0,0);
ADDRGP4 $563
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1128
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1132
CNSTI4 0
ASGNI4
ADDRLP4 1132
INDIRI4
ARGI4
ADDRLP4 1132
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 915
;915:		y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 916
;916:	}
LABELV $561
line 918
;917:
;918:	if (cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
GEI4 $564
line 919
;919:		value = atoi( Info_ValueForKey( info, "fraglimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $567
ARGP4
ADDRLP4 1128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1132
INDIRI4
ASGNI4
line 920
;920:		if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $568
line 921
;921:			CG_Text_Paint( 300,y, 0.2f, colorWhite,  va("Fraglimit is set to: %i", value ), 0,0,0);
ADDRGP4 $570
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1136
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 923
;922:
;923:			y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 924
;924:		}
LABELV $568
line 925
;925:	}
LABELV $564
line 927
;926:
;927:	if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $571
line 928
;928:		value = atoi( Info_ValueForKey( info, "teampointlimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $574
ARGP4
ADDRLP4 1128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1132
INDIRI4
ASGNI4
line 929
;929:		if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $575
line 930
;930:			CG_Text_Paint( 300,y, 0.2f, colorWhite,  va("Pointlimit is set to: %i", value ), 0,0,0);
ADDRGP4 $577
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1136
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1133903872
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 932
;931:
;932:			y += INFO_STRING_DIST;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 933
;933:		}
LABELV $575
line 934
;934:	}
LABELV $571
line 936
;935:
;936:	if ( sealBriefingLines > 0 ) {
ADDRGP4 sealBriefingLines
INDIRI4
CNSTI4 0
LEI4 $578
line 937
;937:		float textscale = .25f;
ADDRLP4 1128
CNSTF4 1048576000
ASGNF4
line 939
;938:
;939:		y = 176;
ADDRLP4 4
CNSTI4 176
ASGNI4
line 940
;940:		y += CG_Text_Height( "A" , textscale, 0 )  + 3;
ADDRGP4 $580
ARGP4
ADDRLP4 1128
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1132
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 1132
INDIRI4
CNSTI4 3
ADDI4
ADDI4
ASGNI4
line 942
;941:
;942:		for ( value = 0; value <= sealBriefingLines; value ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $584
JUMPV
LABELV $581
line 943
;943:		{
line 944
;944:			CG_Text_Paint( 16,y, 0.25f, colorWhite, SealBriefing[value], 0,0,ITEM_TEXTSTYLE_SHADOWED);
CNSTF4 1098907648
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1048576000
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 945
;945:			y += CG_Text_Height( SealBriefing[value], textscale, 0 )  + 3;
ADDRLP4 0
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 SealBriefing
ADDP4
ARGP4
ADDRLP4 1128
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1136
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 1136
INDIRI4
CNSTI4 3
ADDI4
ADDI4
ASGNI4
line 946
;946:		}	
LABELV $582
line 942
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $584
ADDRLP4 0
INDIRI4
ADDRGP4 sealBriefingLines
INDIRI4
LEI4 $581
line 947
;947:	}
LABELV $578
line 949
;948:
;949:	if ( tangoBriefingLines > 0 ) {
ADDRGP4 tangoBriefingLines
INDIRI4
CNSTI4 0
LEI4 $585
line 950
;950:		float textscale = .25f; 
ADDRLP4 1128
CNSTF4 1048576000
ASGNF4
line 952
;951:
;952:		y = 176;
ADDRLP4 4
CNSTI4 176
ASGNI4
line 954
;953:
;954:		y += CG_Text_Height( "A" , textscale, 0 ) + 3;
ADDRGP4 $580
ARGP4
ADDRLP4 1128
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1132
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 1132
INDIRI4
CNSTI4 3
ADDI4
ADDI4
ASGNI4
line 956
;955:
;956:		for ( value = 0; value <= tangoBriefingLines; value ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $590
JUMPV
LABELV $587
line 957
;957:		{
line 958
;958:			CG_Text_Paint( 336,y, textscale, colorWhite, TangoBriefing[value], 0,0,ITEM_TEXTSTYLE_SHADOWED);
CNSTF4 1135083520
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1128
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 959
;959:			y += CG_Text_Height( TangoBriefing[value], textscale, 0 ) + 3;
ADDRLP4 0
INDIRI4
CNSTI4 9
LSHI4
ADDRGP4 TangoBriefing
ADDP4
ARGP4
ADDRLP4 1128
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1136
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 1136
INDIRI4
CNSTI4 3
ADDI4
ADDI4
ASGNI4
line 960
;960:		}	
LABELV $588
line 956
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $590
ADDRLP4 0
INDIRI4
ADDRGP4 tangoBriefingLines
INDIRI4
LEI4 $587
line 961
;961: 	}
LABELV $585
line 963
;962:
;963:	s = "Navy Seals : Covert Operations - Beta 1.93";
ADDRLP4 8
ADDRGP4 $591
ASGNP4
line 964
;964:	y = CG_Text_Height( s, 0.2f, 0 );
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1128
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1128
INDIRI4
ASGNI4
line 966
;965:
;966:	CG_Text_Paint( 4, y+2, 0.2f,colorWhite, s,0,0,4 );
CNSTF4 1082130432
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 8
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
line 968
;967:
;968:}
LABELV $520
endproc CG_DrawInformation 1144 32
bss
export TangoBriefing
align 1
LABELV TangoBriefing
skip 65536
export SealBriefing
align 1
LABELV SealBriefing
skip 65536
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
import CG_EnviromentParse
import CG_BloodPool
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
lit
align 1
LABELV $591
byte 1 78
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 83
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 67
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 45
byte 1 32
byte 1 66
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 49
byte 1 46
byte 1 57
byte 1 51
byte 1 0
align 1
LABELV $580
byte 1 65
byte 1 0
align 1
LABELV $577
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $574
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $570
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $567
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $563
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $560
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $559
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $558
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $557
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $555
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $553
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $546
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $542
byte 1 115
byte 1 118
byte 1 95
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $536
byte 1 80
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $533
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $532
byte 1 115
byte 1 118
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $528
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $527
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $526
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 115
byte 1 95
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $525
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $522
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $521
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $506
byte 1 91
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $503
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $498
byte 1 36
byte 1 69
byte 1 79
byte 1 76
byte 1 0
align 1
LABELV $488
byte 1 91
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $483
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 39
byte 1 36
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 39
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $480
byte 1 36
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $473
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 40
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $470
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $461
byte 1 118
byte 1 105
byte 1 112
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $458
byte 1 73
byte 1 108
byte 1 108
byte 1 101
byte 1 103
byte 1 97
byte 1 108
byte 1 32
byte 1 67
byte 1 97
byte 1 109
byte 1 111
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $453
byte 1 78
byte 1 111
byte 1 32
byte 1 67
byte 1 97
byte 1 109
byte 1 111
byte 1 117
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 40
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $450
byte 1 99
byte 1 97
byte 1 109
byte 1 111
byte 1 117
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $446
byte 1 83
byte 1 101
byte 1 97
byte 1 108
byte 1 66
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 40
byte 1 32
byte 1 98
byte 1 99
byte 1 32
byte 1 98
byte 1 99
byte 1 32
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $442
byte 1 98
byte 1 99
byte 1 0
align 1
LABELV $438
byte 1 66
byte 1 111
byte 1 109
byte 1 98
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 40
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 117
byte 1 112
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 117
byte 1 112
byte 1 32
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $434
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $431
byte 1 86
byte 1 73
byte 1 80
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 32
byte 1 118
byte 1 105
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 99
byte 1 117
byte 1 101
byte 1 32
byte 1 118
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $426
byte 1 118
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $423
byte 1 86
byte 1 73
byte 1 80
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 32
byte 1 118
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 118
byte 1 105
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 99
byte 1 117
byte 1 101
byte 1 32
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $418
byte 1 118
byte 1 105
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 99
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $415
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 97
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
byte 1 115
byte 1 32
byte 1 62
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 65
byte 1 83
byte 1 83
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 70
byte 1 73
byte 1 69
byte 1 76
byte 1 68
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $410
byte 1 97
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
LABELV $407
byte 1 125
byte 1 0
align 1
LABELV $397
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
byte 1 0
align 1
LABELV $387
byte 1 91
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $354
byte 1 91
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 93
byte 1 0
align 1
LABELV $328
byte 1 97
byte 1 114
byte 1 97
byte 1 98
byte 1 0
align 1
LABELV $325
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 114
byte 1 102
byte 1 0
align 1
LABELV $323
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $320
byte 1 95
byte 1 106
byte 1 117
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $317
byte 1 95
byte 1 97
byte 1 114
byte 1 99
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $314
byte 1 95
byte 1 117
byte 1 114
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $311
byte 1 0
align 1
LABELV $307
byte 1 100
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $304
byte 1 106
byte 1 117
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $301
byte 1 97
byte 1 114
byte 1 99
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $298
byte 1 117
byte 1 114
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $285
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $284
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $189
byte 1 91
byte 1 97
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 93
byte 1 0
align 1
LABELV $187
byte 1 91
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 93
byte 1 0
align 1
LABELV $185
byte 1 91
byte 1 98
byte 1 99
byte 1 93
byte 1 0
align 1
LABELV $183
byte 1 91
byte 1 118
byte 1 105
byte 1 112
byte 1 45
byte 1 116
byte 1 93
byte 1 0
align 1
LABELV $181
byte 1 91
byte 1 118
byte 1 105
byte 1 112
byte 1 45
byte 1 114
byte 1 93
byte 1 0
align 1
LABELV $174
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $167
byte 1 10
byte 1 0
align 1
LABELV $156
byte 1 123
byte 1 0
align 1
LABELV $153
byte 1 91
byte 1 101
byte 1 110
byte 1 100
byte 1 93
byte 1 0
align 1
LABELV $150
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 40
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $143
byte 1 91
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 93
byte 1 0
align 1
LABELV $140
byte 1 36
byte 1 69
byte 1 79
byte 1 70
byte 1 0
align 1
LABELV $132
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 62
byte 1 37
byte 1 105
byte 1 41
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $121
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $119
byte 1 110
byte 1 0
align 1
LABELV $113
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
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $111
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 0
