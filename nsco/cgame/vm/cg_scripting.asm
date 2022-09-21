data
align 4
LABELV math_ops
byte 1 43
skip 3
byte 4 1
byte 1 45
skip 3
byte 4 2
byte 1 42
skip 3
byte 4 3
byte 1 47
skip 3
byte 4 4
export ctLength
align 4
LABELV ctLength
byte 4 0
byte 4 7
byte 4 5
byte 4 8
byte 4 0
export NSSL_Printf
code
proc NSSL_Printf 1028 16
file "../cg_scripting.c"
line 82
;1:#include "cg_local.h"
;2:#include "../ui/ui_shared.h"
;3:#include "regexp.h"
;4://
;5:// all code in this file is property of manfred nerurkar
;6:// no commercial explotation allowed
;7:// you are only allowed to use this code in navy seals: covert operations 
;8:// a quake3 arena modifiation
;9:// defcon-x@ns-co.net
;10:
;11:#define MAX_SCRIPT_PARAMETER	512
;12:
;13:typedef enum {
;14: OP_SAME,			// ==
;15: OP_NOTSAME,		// !=
;16: OP_SMALLERTHAN,	// <
;17: OP_BIGGERTHAN,		// >
;18: OP_SMALLERSAME,	// <=
;19: OP_BIGGERSAME,		// >=
;20:
;21: OP_REGEXP,			// /~
;22:
;23: OP_BITAND 			// &  
;24:} nsslOperator_t;
;25:
;26:typedef enum {
;27:	CT_NONE,
;28:
;29:	CT_FLOAT,
;30:	CT_INT,		
;31:	CT_STRING,	
;32:
;33:	CT_TYPES,
;34:} nsslCastType_t;  
;35:
;36:typedef enum {
;37:	MATH_NONE,
;38:
;39:	MATH_ADD,
;40:	MATH_SUBTRACT,
;41:	MATH_MULTIPLY,
;42:	MATH_DIVIDE
;43:} nssl_mathop_t;
;44:  
;45:typedef struct {
;46:	char	math_char;
;47:	int		math_op;
;48:} nssl_math_ops_t;
;49:
;50:static nssl_math_ops_t	math_ops[] = {
;51:	{ '+', MATH_ADD },
;52:	{ '-', MATH_SUBTRACT },
;53:	{ '*', MATH_MULTIPLY },
;54:	{ '/', MATH_DIVIDE } 
;55:};
;56:// casttype charlength
;57:// 0, (float),(int),(string)
;58:int ctLength[] = { 0, 7,5,8, 0 };
;59:
;60:typedef struct {
;61:	int				castType;
;62:	char			value[256];
;63:} nsslCurrentToken_t;
;64:
;65:#define Q3_LINEBREAK	";"
;66:#define NSSL_VERSION	"1.3"
;67:
;68:int cur_token;
;69:
;70:vmCvar_t	nssl_debug;
;71:vmCvar_t	nssl_init;
;72:
;73:void ClientScript_ProcessWhileLoop( int num );
;74:void ClientScript_Help_f ( void );
;75:void ClientScript_GetCommand( char cmd[512] );
;76:void ClientScript_GetValue( char	value[256], const char *token, qboolean cvarScan ); 
;77:float ClientScript_GetValueFloat( const char *token, qboolean cvarScan );
;78: 
;79://
;80://===============================================================================
;81:
;82:void QDECL NSSL_Printf( const char *msg, ... ) {
line 86
;83:	va_list		argptr;
;84:	char		text[1024];
;85:
;86:	va_start (argptr, msg);
ADDRLP4 1024
ADDRFP4 0+4
ASGNP4
line 87
;87:	vsprintf (text, msg, argptr);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 88
;88:	va_end (argptr);
ADDRLP4 1024
CNSTP4 0
ASGNP4
line 90
;89:
;90:	Com_sprintf( text, 1024, S_COLOR_YELLOW "NSSL: %s", text );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $100
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 92
;91:
;92:	CG_Printf(text);
ADDRLP4 0
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 93
;93:}
LABELV $98
endproc NSSL_Printf 1028 16
export ClientScript_Init
proc ClientScript_Init 0 16
line 96
;94:
;95:void ClientScript_Init( void )
;96:{
line 97
;97:	trap_Cvar_Register( &nssl_debug, "nssl_debug", "0", 0 );
ADDRGP4 nssl_debug
ARGP4
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 98
;98:	trap_Cvar_Register( &nssl_init, "nssl_init", "1", CVAR_LATCH ); 
ADDRGP4 nssl_init
ARGP4
ADDRGP4 $104
ARGP4
ADDRGP4 $105
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 99
;99:}
LABELV $101
endproc ClientScript_Init 0 16
export ClientScript_NextToken
proc ClientScript_NextToken 16 12
line 102
;100:
;101:const char *ClientScript_NextToken( void )
;102:{
line 105
;103:	const char *token;
;104:
;105:	cur_token++;
ADDRLP4 4
ADDRGP4 cur_token
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 106
;106:	token = CG_Argv( cur_token );
ADDRGP4 cur_token
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 108
;107:
;108:	if ( strlen( token ) <= 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $107
line 109
;109:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $106
JUMPV
LABELV $107
line 111
;110:
;111:	if ( nssl_debug.value == 2 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1073741824
NEF4 $109
line 112
;112:		NSSL_Printf( "token %i: %s\n", cur_token, token );
ADDRGP4 $112
ARGP4
ADDRGP4 cur_token
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $109
line 114
;113:
;114:	return token;
ADDRLP4 0
INDIRP4
RETP4
LABELV $106
endproc ClientScript_NextToken 16 12
export ClientScript_CurrentToken
proc ClientScript_CurrentToken 12 12
line 118
;115:}
;116:
;117:const char *ClientScript_CurrentToken ( void )
;118:{
line 121
;119:	const char *token;
;120:
;121:	token = CG_Argv( cur_token );
ADDRGP4 cur_token
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 123
;122:
;123:	if ( strlen( token ) <= 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $114
line 124
;124:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $113
JUMPV
LABELV $114
line 126
;125:
;126:	if ( nssl_debug.value == 2 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1073741824
NEF4 $116
line 127
;127:		NSSL_Printf( "token %i: %s\n", cur_token, token );
ADDRGP4 $112
ARGP4
ADDRGP4 cur_token
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $116
line 128
;128:	return token;
ADDRLP4 0
INDIRP4
RETP4
LABELV $113
endproc ClientScript_CurrentToken 12 12
export ClientScript_PrevToken
proc ClientScript_PrevToken 16 12
line 132
;129:}
;130:
;131:const char *ClientScript_PrevToken ( void )
;132:{
line 135
;133:	const char *token;
;134:
;135:	cur_token--;
ADDRLP4 4
ADDRGP4 cur_token
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 136
;136:	token = CG_Argv( cur_token );
ADDRGP4 cur_token
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 138
;137:
;138:	if ( strlen( token ) <= 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $120
line 139
;139:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $119
JUMPV
LABELV $120
line 141
;140:
;141:	if ( nssl_debug.value == 2 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1073741824
NEF4 $122
line 142
;142:		NSSL_Printf( "token %i: %s\n", cur_token, token );
ADDRGP4 $112
ARGP4
ADDRGP4 cur_token
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $122
line 143
;143:	return token;
ADDRLP4 0
INDIRP4
RETP4
LABELV $119
endproc ClientScript_PrevToken 16 12
export ClientScript_ExecText
proc ClientScript_ExecText 0 8
line 147
;144:}
;145:
;146:void ClientScript_ExecText( char *text ) 
;147:{
line 148
;148:	strcat( text, ";" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 150
;149:
;150:	if ( nssl_debug.value == 1 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1065353216
NEF4 $127
line 151
;151:		NSSL_Printf( "Execing Text: %s\n", text );
ADDRGP4 $130
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $127
line 153
;152:
;153:	trap_SendConsoleCommand( text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 154
;154:}
LABELV $125
endproc ClientScript_ExecText 0 8
export ClientScript_IsNumber
proc ClientScript_IsNumber 8 0
line 158
;155:
;156:
;157:qboolean ClientScript_IsNumber( const char *token )
;158:{
line 161
;159:	char c;
;160:
;161:	if ( !token )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $132
line 162
;162:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $132
line 164
;163:
;164:	c = token[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
ASGNI1
line 166
;165:
;166:	if ( c < '0' || c > '9' ) { 
ADDRLP4 4
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 48
LTI4 $136
ADDRLP4 4
INDIRI4
CNSTI4 57
LEI4 $134
LABELV $136
line 167
;167:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $134
line 169
;168:	} 
;169:	return qtrue;
CNSTI4 1
RETI4
LABELV $131
endproc ClientScript_IsNumber 8 0
export ClientScript_Operate
proc ClientScript_Operate 44 8
line 173
;170:}
;171:
;172:qboolean ClientScript_Operate( char value1[256], int function, char value2[256] )
;173:{ 
line 174
;174:	if ( function <= OP_NOTSAME )
ADDRFP4 4
INDIRI4
CNSTI4 1
GTI4 $138
line 175
;175:	{		
line 177
;176:		// compare it
;177:		if ( !Q_stricmp( Q_CleanStr( value1 ), Q_CleanStr( value2 ) ) ) // it IS the same
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Q_CleanStr
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_CleanStr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $140
line 178
;178:		{
line 179
;179:			if ( function == OP_NOTSAME ) // but it shouldn't be the same
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $142
line 180
;180:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $137
JUMPV
LABELV $142
line 182
;181:
;182:			return 1; // it's the same
CNSTI4 1
RETI4
ADDRGP4 $137
JUMPV
LABELV $140
line 184
;183:		}
;184:		else if ( ClientScript_IsNumber( value1 ) && atof ( value1 ) == atof ( value2 ) ) // the same
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 ClientScript_IsNumber
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $144
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
NEF4 $144
line 185
;185:		{
line 186
;186:			if ( function == OP_NOTSAME )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $146
line 187
;187:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $137
JUMPV
LABELV $146
line 190
;188:
;189:			// value is NOT the same so execute the text
;190:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $137
JUMPV
LABELV $144
line 193
;191:		}
;192:		else
;193:		{
line 195
;194:			// we actually didn't want the same
;195:			if ( function == OP_NOTSAME ) 
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $139
line 196
;196:				return 1; 
CNSTI4 1
RETI4
ADDRGP4 $137
JUMPV
line 197
;197:		} 
line 198
;198:	}
LABELV $138
line 200
;199:	else
;200:	{ 
line 201
;201:		float	i_value1 = atof( value1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 202
;202:		float	i_value2 = atof( value2 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
ASGNF4
line 204
;203:  
;204:		switch ( function )
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $151
ADDRLP4 16
INDIRI4
CNSTI4 7
GTI4 $151
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRGP4 $168-8
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $168
address $152
address $155
address $158
address $161
address $167
address $164
code
line 205
;205:		{
LABELV $152
line 207
;206:			case OP_SMALLERTHAN:
;207:				if ( i_value1 < i_value2 )
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $151
line 208
;208:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $137
JUMPV
line 209
;209:				break;
LABELV $155
line 211
;210:			case OP_BIGGERTHAN:
;211:				if ( i_value1 > i_value2 )
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
LEF4 $151
line 212
;212:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $137
JUMPV
line 213
;213:				break;
LABELV $158
line 215
;214:			case OP_SMALLERSAME:
;215:				if ( i_value1 <= i_value2 )
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
GTF4 $151
line 216
;216:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $137
JUMPV
line 217
;217:				break;
LABELV $161
line 219
;218:			case OP_BIGGERSAME:
;219:				if ( i_value1 >= i_value2 )
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
LTF4 $151
line 220
;220:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $137
JUMPV
line 221
;221:				break;
LABELV $164
line 223
;222:			case OP_BITAND:
;223:				if ( (int)i_value1 & (int)i_value2 )
ADDRLP4 0
INDIRF4
CVFI4 4
ADDRLP4 4
INDIRF4
CVFI4 4
BANDI4
CNSTI4 0
EQI4 $151
line 224
;224:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $137
JUMPV
line 225
;225:				break;
LABELV $167
line 227
;226:			case OP_REGEXP:
;227:				{
line 232
;228:					regexp *test;  
;229:					// value2 is a expression: \.*\
;230:					// value1 is a string: bla
;231:					// term is: if bla =~ "\.*\"
;232:					test = regcomp( Q_CleanStr( value2 ) ); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_CleanStr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 regcomp
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 32
INDIRP4
ASGNP4
line 233
;233:					return regexec( test, Q_CleanStr( value1 ) ); 	  
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_CleanStr
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 regexec
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $137
JUMPV
line 235
;234:				}
;235:				break;
line 237
;236:			default:
;237:				break;
LABELV $151
line 239
;238:		} 
;239:	} 
LABELV $139
line 240
;240:	return 0;
CNSTI4 0
RETI4
LABELV $137
endproc ClientScript_Operate 44 8
export ClientScript_GetScriptCommand
proc ClientScript_GetScriptCommand 100 16
line 244
;241:}
;242:  
;243:void ClientScript_GetScriptCommand( char	value[256], const char *token )
;244:{
line 245
;245:	int size = 256;
ADDRLP4 0
CNSTI4 256
ASGNI4
line 248
;246:	
;247:	// remove *
;248:	token++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 250
;249:
;250:	if ( token[0] == 'c' &&	token[1] == 'h' && token[2] == 'a' && token[3] == 't' )
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 99
NEI4 $171
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 104
NEI4 $171
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $171
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 116
NEI4 $171
line 251
;251:	{
line 252
;252:		int height = cg_chatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_chatHeight+12
INDIRI4
ASGNI4
line 255
;253:		int num;
;254:
;255:		token +=4;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 257
;256:
;257:		num = atoi(token);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 258
;258:		if ( num>height )
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $174
line 259
;259:			num = height;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $174
line 261
;260:
;261:		if ( strlen(cgs.ChatMsgs[(cgs.ChatPos - 1 - num) % height]) > 0 )
CNSTI4 241
ADDRGP4 cgs+201316
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 12
INDIRI4
SUBI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+197640
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LEI4 $176
line 262
;262:			strcpy( value, cgs.ChatMsgs[(cgs.ChatPos - 1 - num) % height] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 241
ADDRGP4 cgs+201316
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 12
INDIRI4
SUBI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+197640
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $172
JUMPV
LABELV $176
line 264
;263:		else
;264:			strcpy( value, "<empty>" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $182
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 265
;265:	}
ADDRGP4 $172
JUMPV
LABELV $171
line 266
;266:	else if ( token[0] == 'r' && token[1] == 'a' && token[2] == 'n' && token[3] == 'd' )
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 114
NEI4 $183
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $183
ADDRLP4 8
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $183
ADDRLP4 8
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 100
NEI4 $183
line 267
;267:	{   
line 270
;268:		float mod;
;269:
;270:		token +=4;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 272
;271:
;272:		mod = ClientScript_GetValueFloat(token, qfalse);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 ClientScript_GetValueFloat
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 16
INDIRF4
ASGNF4
line 274
;273:
;274:		if ( mod == 0.0f )	mod = 1; 
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $185
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
LABELV $185
line 276
;275:
;276:		strcpy( value, va("%f", random() * mod ) );  
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 $187
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 12
INDIRF4
MULF4
ARGF4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 277
;277:	}
ADDRGP4 $184
JUMPV
LABELV $183
line 278
;278:	else if ( !Q_stricmp( token, "getkey") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $188
line 279
;279:	{
line 282
;280:		int key;
;281:		char cha;
;282:		ClientScript_GetValue( value, ClientScript_NextToken(), qtrue );
ADDRLP4 24
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 283
;283:		key = trap_Key_GetKey( value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_Key_GetKey
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRI4
ASGNI4
line 284
;284:		cha = key;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CVII1 4
ASGNI1
line 285
;285:		if ( key == -1 ) {
ADDRLP4 16
INDIRI4
CNSTI4 -1
NEI4 $191
line 286
;286:			strcpy( value, "<???>" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 287
;287:			return;
ADDRGP4 $170
JUMPV
LABELV $191
line 289
;288:			}
;289:		Com_sprintf(value,size,"%c",key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $194
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 290
;290:	}
ADDRGP4 $189
JUMPV
LABELV $188
line 291
;291:	else if ( !Q_stricmp( token, "chasing") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $197
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $195
line 292
;292:	{
line 293
;293:		if ( cg.predictedPlayerState.pm_flags & PMF_FOLLOW )
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $198
line 294
;294:			strcpy( value, "1" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $196
JUMPV
LABELV $198
line 296
;295:		else
;296:			strcpy( value, "0" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 297
;297:	}
ADDRGP4 $196
JUMPV
LABELV $195
line 298
;298:	else if ( !Q_stricmp( token, "spectator") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $204
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $202
line 299
;299:	{
line 300
;300:		if ( cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.predictedPlayerState.pm_type == PM_SPECTATOR || cg.predictedPlayerState.pm_type == PM_NOCLIP )
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 3
EQI4 $215
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
EQI4 $215
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 1
NEI4 $205
LABELV $215
line 301
;301:			strcpy( value, "1" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $203
JUMPV
LABELV $205
line 303
;302:		else
;303:			strcpy( value, "0" ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 304
;304:	}
ADDRGP4 $203
JUMPV
LABELV $202
line 305
;305:	else if (!Q_stricmp( token, "clips") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $218
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $216
line 306
;306:	{
line 307
;307:		gitem_t *item = BG_FindItemForWeapon( cg.predictedPlayerState.weapon );
ADDRGP4 cg+107636+144
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
ASGNP4
line 309
;308:
;309:		if ( !item ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $221
line 310
;310:			strcat( value, "0" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 311
;311:			return;
ADDRGP4 $170
JUMPV
LABELV $221
line 313
;312:		} 
;313:		strcpy( value, va( "%i", cg.predictedPlayerState.ammo[ BG_FindItemForWeapon( cg.predictedPlayerState.weapon )->giAmmoTag ] ) );
ADDRGP4 cg+107636+144
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRGP4 $223
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 314
;314:	}
ADDRGP4 $217
JUMPV
LABELV $216
line 315
;315:	else if (!Q_stricmp( token, "weapon") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $230
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $228
line 316
;316:	{
line 317
;317:		gitem_t *item = BG_FindItemForWeapon( cg.predictedPlayerState.weapon );
ADDRGP4 cg+107636+144
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 36
INDIRP4
ASGNP4
line 319
;318:
;319:		if ( !item ) {
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $233
line 320
;320:			strcat( value, "nothing" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $235
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 321
;321:			return;
ADDRGP4 $170
JUMPV
LABELV $233
line 323
;322:		} 
;323:		strcpy( value, BG_FindItemForWeapon( cg.predictedPlayerState.weapon )->pickup_name );
ADDRGP4 cg+107636+144
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 324
;324:	}
ADDRGP4 $229
JUMPV
LABELV $228
line 325
;325:	else if (!Q_stricmp( token, "health") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $238
line 326
;326:		strcpy( value, va( "%i", cg.predictedPlayerState.stats[STAT_HEALTH] ) );  
ADDRGP4 $223
ARGP4
ADDRGP4 cg+107636+184
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $239
JUMPV
LABELV $238
line 327
;327: 	else if (!Q_stricmp( token, "rounds") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $245
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $243
line 328
;328:		strcpy( value, va( "%i", cg.predictedPlayerState.stats[STAT_ROUNDS] ) ); 
ADDRGP4 $223
ARGP4
ADDRGP4 cg+107636+184+52
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $244
JUMPV
LABELV $243
line 329
;329:	else if (!Q_stricmp( token, "stamina") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $251
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $249
line 330
;330:		strcpy( value, va( "%i", cg.predictedPlayerState.stats[STAT_STAMINA] ) );
ADDRGP4 $223
ARGP4
ADDRGP4 cg+107636+184+40
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $250
JUMPV
LABELV $249
line 331
;331:	else if (!Q_stricmp( token, "ping") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $255
line 332
;332:		strcpy( value, va( "%i", cg.predictedPlayerState.ping ) );
ADDRGP4 $223
ARGP4
ADDRGP4 cg+107636+452
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $256
JUMPV
LABELV $255
line 333
;333:	else if ( token[0] == 's' && token[1] == 't' && token[2] == 'a' && token[3] == 't' )
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $260
ADDRLP4 68
CNSTI4 116
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
NEI4 $260
ADDRLP4 64
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $260
ADDRLP4 64
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
NEI4 $260
line 334
;334:	{
line 335
;335:		token+=4;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 337
;336:		
;337:		if ( atoi( token ) >= MAX_STATS )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 16
LTI4 $262
line 338
;338:		{
line 339
;339:			NSSL_Printf( "*stat%s > MAX_STATS\n", token );
ADDRGP4 $264
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 340
;340:			strcpy( value, "<???>" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 341
;341:			return;
ADDRGP4 $170
JUMPV
LABELV $262
line 343
;342:		}	
;343:		strcpy( value, va( "%i", cg.predictedPlayerState.stats[atoi(token)] ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $223
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+184
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 344
;344:	}
ADDRGP4 $261
JUMPV
LABELV $260
line 345
;345:	else if ( token[0] == 'p' && token[1] == 'e' && token[2] == 'r' && token[3] == 's' )
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRI1
CVII4 1
CNSTI4 112
NEI4 $267
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 101
NEI4 $267
ADDRLP4 72
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 114
NEI4 $267
ADDRLP4 72
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $267
line 346
;346:	{
line 347
;347:		token+=4;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 349
;348:
;349:		if ( atoi( token ) >= MAX_PERSISTANT )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 16
LTI4 $269
line 350
;350:		{
line 351
;351:			NSSL_Printf( "*pers%s > MAX_PERSISTANT\n", token );
ADDRGP4 $271
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 352
;352:			strcpy( value, "<???>" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 353
;353:			return;
ADDRGP4 $170
JUMPV
LABELV $269
line 355
;354:		}			
;355:		strcpy( value, va( "%i", cg.predictedPlayerState.persistant[atoi(token)] ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $223
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+248
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 356
;356:	}
ADDRGP4 $268
JUMPV
LABELV $267
line 357
;357:	else if (!Q_stricmp( token, "pm_type") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $274
line 358
;358:		strcpy( value, va("%i", cg.predictedPlayerState.pm_type ) );  
ADDRGP4 $223
ARGP4
ADDRGP4 cg+107636+4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $275
JUMPV
LABELV $274
line 359
;359:	else if (!Q_stricmp( token, "time") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $279
line 360
;360:		strcpy( value, va("%i", cg.time ) );  
ADDRGP4 $223
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $280
JUMPV
LABELV $279
line 361
;361:	else if (!Q_stricmp( token, "qcmd_active") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $283
line 362
;362:		strcpy( value, va("%i", cg.viewCmd ) );  
ADDRGP4 $223
ARGP4
ADDRGP4 cg+171500
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $284
JUMPV
LABELV $283
line 364
;363:	else
;364:		strcpy( value, "<???>" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $284
LABELV $280
LABELV $275
LABELV $268
LABELV $261
LABELV $256
LABELV $250
LABELV $244
LABELV $239
LABELV $229
LABELV $217
LABELV $203
LABELV $196
LABELV $189
LABELV $184
LABELV $172
line 365
;365:}
LABELV $170
endproc ClientScript_GetScriptCommand 100 16
export ClientScript_CastType
proc ClientScript_CastType 12 0
line 368
;366:
;367:int ClientScript_CastType( const char *token )
;368:{ 
line 370
;369:
;370:	if ( !token )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $288
line 371
;371:		return CT_NONE;
CNSTI4 0
RETI4
ADDRGP4 $287
JUMPV
LABELV $288
line 373
;372: 
;373:	if (token[0] == '(' &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 40
NEI4 $290
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 105
NEI4 $290
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $290
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 116
NEI4 $290
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 41
NEI4 $290
line 378
;374:		token[1] == 'i' &&
;375:		token[2] == 'n' &&
;376:		token[3] == 't' &&
;377:		token[4] == ')' )
;378:	{ 
line 379
;379:		return CT_INT;
CNSTI4 2
RETI4
ADDRGP4 $287
JUMPV
LABELV $290
line 381
;380:	}
;381:	else if (token[0] == '(' &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 40
NEI4 $292
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $292
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 108
NEI4 $292
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 111
NEI4 $292
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $292
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 116
NEI4 $292
ADDRLP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRI1
CVII4 1
CNSTI4 41
NEI4 $292
line 388
;382:		token[1] == 'f' &&
;383:		token[2] == 'l' &&
;384:		token[3] == 'o' &&
;385:		token[4] == 'a' &&
;386:		token[5] == 't' &&
;387:		token[6] == ')' )
;388:	{ 
line 389
;389:		return CT_FLOAT;
CNSTI4 1
RETI4
ADDRGP4 $287
JUMPV
LABELV $292
line 391
;390:	}
;391:	else if (token[0] == '(' &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 40
NEI4 $294
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $294
ADDRLP4 8
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 116
NEI4 $294
ADDRLP4 8
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 114
NEI4 $294
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 105
NEI4 $294
ADDRLP4 8
INDIRP4
CNSTI4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $294
ADDRLP4 8
INDIRP4
CNSTI4 6
ADDP4
INDIRI1
CVII4 1
CNSTI4 103
NEI4 $294
ADDRLP4 8
INDIRP4
CNSTI4 7
ADDP4
INDIRI1
CVII4 1
CNSTI4 41
NEI4 $294
line 399
;392:		token[1] == 's' &&
;393:		token[2] == 't' &&
;394:		token[3] == 'r' &&
;395:		token[4] == 'i' &&
;396:		token[5] == 'n' &&
;397:		token[6] == 'g' &&
;398:		token[7] == ')' )
;399:	{ 
line 400
;400:		return CT_STRING;
CNSTI4 3
RETI4
ADDRGP4 $287
JUMPV
LABELV $294
line 403
;401:	}
;402:  
;403:	return CT_NONE;
CNSTI4 0
RETI4
LABELV $287
endproc ClientScript_CastType 12 0
export ClientScript_GetMathOpForChar
proc ClientScript_GetMathOpForChar 4 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 419
;404:}
;405: 
;406:/*
;407:===================
;408:Client Script
;409:	Do Calc
;410:
;411:Do NSSL calculations with variables,gamepointers and values
;412:usage:
;413:
;414:	calc:$variable+\*gamepointer-value
;415:	calc:$test+\*health-5
;416:===================
;417:*/
;418:int ClientScript_GetMathOpForChar( char math_char )
;419:{
line 422
;420:	int		i;
;421:
;422:	for ( i = 0 ; i < sizeof( math_ops ) / sizeof( math_ops[0] ) ; i++ ) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $300
JUMPV
LABELV $297
line 423
;423:		if ( math_ops[i].math_char == math_char )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 math_ops
ADDP4
INDIRI1
CVII4 1
ADDRFP4 0
INDIRI1
CVII4 1
NEI4 $301
line 424
;424:			return math_ops[i].math_op;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 math_ops+4
ADDP4
INDIRI4
RETI4
ADDRGP4 $296
JUMPV
LABELV $301
line 425
;425:	}
LABELV $298
line 422
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $300
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 4
LTU4 $297
line 426
;426:	return MATH_NONE;
CNSTI4 0
RETI4
LABELV $296
endproc ClientScript_GetMathOpForChar 4 0
export ClientScript_IsMathOpForChar
proc ClientScript_IsMathOpForChar 4 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 429
;427:}
;428:qboolean ClientScript_IsMathOpForChar( char math_char )
;429:{
line 432
;430:	int		i;
;431:
;432:	for ( i = 0 ; i < sizeof( math_ops ) / sizeof( math_ops[0] ) ; i++ ) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $305
line 433
;433:		if ( math_ops[i].math_char == math_char )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 math_ops
ADDP4
INDIRI1
CVII4 1
ADDRFP4 0
INDIRI1
CVII4 1
NEI4 $309
line 434
;434:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $304
JUMPV
LABELV $309
line 435
;435:	}
LABELV $306
line 432
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $308
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 4
LTU4 $305
line 436
;436:	return qfalse;
CNSTI4 0
RETI4
LABELV $304
endproc ClientScript_IsMathOpForChar 4 0
export ClientScript_Calc
proc ClientScript_Calc 8 8
line 439
;437:} 
;438:float ClientScript_Calc( float value1, float value2, int math_operator )
;439:{ 
line 440
;440:	switch ( math_operator )
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $312
ADDRLP4 0
INDIRI4
CNSTI4 4
GTI4 $312
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $325-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $325
address $314
address $315
address $316
address $317
code
line 441
;441:	{
LABELV $314
line 443
;442:	case MATH_ADD:
;443:		return value1+value2;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
RETF4
ADDRGP4 $311
JUMPV
line 444
;444:		break;
LABELV $315
line 446
;445:	case MATH_SUBTRACT:
;446:		return value1-value2;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
RETF4
ADDRGP4 $311
JUMPV
line 447
;447:		break;
LABELV $316
line 449
;448:	case MATH_MULTIPLY:
;449:		return value1*value2;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
RETF4
ADDRGP4 $311
JUMPV
line 450
;450:		break;
LABELV $317
line 452
;451:	case MATH_DIVIDE:
;452:		if ( value2 == 0.0f )
ADDRFP4 4
INDIRF4
CNSTF4 0
NEF4 $318
line 453
;453:		{
line 454
;454:			NSSL_Printf("^1Error: Moron divide by ZERO.\n");
ADDRGP4 $320
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 455
;455:			return value1;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $311
JUMPV
LABELV $318
line 457
;456:		}
;457:		return value1/value2;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
DIVF4
RETF4
ADDRGP4 $311
JUMPV
line 458
;458:		break;
LABELV $312
line 460
;459:	default:
;460:		NSSL_Printf("Unkown math operator %i\n", math_operator);
ADDRGP4 $321
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NSSL_Printf
CALLV
pop
line 461
;461:		return (value1)?value1:value2;
ADDRFP4 0
INDIRF4
CNSTF4 0
EQF4 $323
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRGP4 $324
JUMPV
LABELV $323
ADDRLP4 4
ADDRFP4 4
INDIRF4
ASGNF4
LABELV $324
ADDRLP4 4
INDIRF4
RETF4
LABELV $311
endproc ClientScript_Calc 8 8
export ClientScript_DoCalc
proc ClientScript_DoCalc 296 20
line 465
;462:	}
;463:} 
;464:void ClientScript_DoCalc( char	value[256], const char *token )
;465:{
line 466
;466:	int lastoperator = 0;
ADDRLP4 256
CNSTI4 0
ASGNI4
line 471
;467:	float previousvalue;
;468:	float currentvalue; 
;469:	char currentstring[256];
;470: 
;471:	token++; 
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 472
;472:	token++; 
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 473
;473:	token++; 
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 474
;474:	token++; 
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 475
;475:	token++; 
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 477
;476:
;477:	strcpy( currentstring, "" );
ADDRLP4 0
ARGP4
ADDRGP4 $328
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $330
JUMPV
LABELV $329
line 480
;478:
;479:	while ( token && token != NULL && token[0] != ' ' && strlen(token) > 0 )
;480:	{ 
line 482
;481:		// escape character? then the next operation will never be a math op
;482:		if ( token[0] == '\\' )
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $332
line 483
;483:			token++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $333
JUMPV
LABELV $332
line 484
;484:		else if ( ClientScript_IsMathOpForChar( token[0] ) )
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 268
ADDRGP4 ClientScript_IsMathOpForChar
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $334
line 485
;485:		{
line 486
;486:			if ( nssl_debug.integer )
ADDRGP4 nssl_debug+12
INDIRI4
CNSTI4 0
EQI4 $336
line 487
;487:				NSSL_Printf("Found Math Operator: %c\n", token[0] );
ADDRGP4 $339
ARGP4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $336
line 489
;488:			// prepare for first operation
;489:			if ( lastoperator == MATH_NONE )
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $340
line 490
;490:			{						
line 492
;491:				// set value
;492:				previousvalue = ClientScript_GetValueFloat(currentstring, qfalse);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 272
ADDRGP4 ClientScript_GetValueFloat
CALLF4
ASGNF4
ADDRLP4 264
ADDRLP4 272
INDIRF4
ASGNF4
line 494
;493:				// clear current value
;494:				strcpy(currentstring,"");
ADDRLP4 0
ARGP4
ADDRGP4 $328
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 496
;495:
;496:				lastoperator = ClientScript_GetMathOpForChar( token[0] ); 
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 276
ADDRGP4 ClientScript_GetMathOpForChar
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 276
INDIRI4
ASGNI4
line 497
;497:			}
ADDRGP4 $341
JUMPV
LABELV $340
line 499
;498:			else
;499:			{
line 501
;500:				// set 2nd value
;501:				currentvalue = ClientScript_GetValueFloat(currentstring, qfalse);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 272
ADDRGP4 ClientScript_GetValueFloat
CALLF4
ASGNF4
ADDRLP4 260
ADDRLP4 272
INDIRF4
ASGNF4
line 503
;502:				// clear current value
;503:				strcpy(currentstring, "" );
ADDRLP4 0
ARGP4
ADDRGP4 $328
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 506
;504:
;505:				// calc
;506:				previousvalue = ClientScript_Calc( previousvalue, currentvalue, lastoperator );						
ADDRLP4 264
INDIRF4
ARGF4
ADDRLP4 260
INDIRF4
ARGF4
ADDRLP4 256
INDIRI4
ARGI4
ADDRLP4 276
ADDRGP4 ClientScript_Calc
CALLF4
ASGNF4
ADDRLP4 264
ADDRLP4 276
INDIRF4
ASGNF4
line 509
;507:
;508:				// set new operator for next calc
;509:				lastoperator = ClientScript_GetMathOpForChar( token[0] );
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 280
ADDRGP4 ClientScript_GetMathOpForChar
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 280
INDIRI4
ASGNI4
line 510
;510:			}
LABELV $341
line 511
;511:			token++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 512
;512:			continue; 
ADDRGP4 $330
JUMPV
LABELV $334
LABELV $333
line 514
;513:		}
;514:		Com_sprintf( currentstring, sizeof(currentstring), "%s%c", currentstring, token[0] );
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $342
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 515
;515:		token++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 516
;516:	}
LABELV $330
line 479
ADDRLP4 268
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 268
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 276
CNSTU4 0
ASGNU4
ADDRLP4 272
INDIRU4
ADDRLP4 276
INDIRU4
EQU4 $345
ADDRLP4 272
INDIRU4
ADDRLP4 276
INDIRU4
EQU4 $345
ADDRLP4 268
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $345
ADDRLP4 268
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
GTI4 $329
LABELV $345
line 518
;517:	// there is something left in our buffer so we have to calc that
;518:	if ( strlen(currentstring) > 0 )
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LEI4 $346
line 519
;519:	{
line 521
;520:		// set value
;521:		currentvalue = ClientScript_GetValueFloat(currentstring, qfalse);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 288
ADDRGP4 ClientScript_GetValueFloat
CALLF4
ASGNF4
ADDRLP4 260
ADDRLP4 288
INDIRF4
ASGNF4
line 523
;522:
;523:		currentvalue = ClientScript_Calc( previousvalue, currentvalue, lastoperator );
ADDRLP4 264
INDIRF4
ARGF4
ADDRLP4 260
INDIRF4
ARGF4
ADDRLP4 256
INDIRI4
ARGI4
ADDRLP4 292
ADDRGP4 ClientScript_Calc
CALLF4
ASGNF4
ADDRLP4 260
ADDRLP4 292
INDIRF4
ASGNF4
line 524
;524:	}
LABELV $346
line 526
;525:	
;526:	Com_sprintf( value, 256, "%f", currentvalue ); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $187
ARGP4
ADDRLP4 260
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 527
;527:}
LABELV $327
endproc ClientScript_DoCalc 296 20
export ClientScript_RegExp
proc ClientScript_RegExp 824 16
line 539
;528:
;529:/*
;530:===================
;531:Client Script
;532:	RegExp
;533:
;534:RegExp for NSSL
;535:usage: %string,string match
;536:===================
;537:*/
;538:void ClientScript_RegExp( char value[256], const char *token )
;539:{
line 547
;540:	char *_token;
;541:	char string[2][256];		
;542:	char temp[256];
;543:	regexp *reg_exp; 
;544:	int result;		
;545:	int len;
;546:
;547:	token++; 
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 548
;548:	_token = strchr( token, ',' );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 44
ARGI4
ADDRLP4 784
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 784
INDIRP4
ASGNP4
line 550
;549:	
;550:	if (!_token)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $349
line 551
;551:	{
line 552
;552:		NSSL_Printf("Syntax Warning: Missing TYPE after '%s'\n", ClientScript_PrevToken() );
ADDRLP4 788
ADDRGP4 ClientScript_PrevToken
CALLP4
ASGNP4
ADDRGP4 $351
ARGP4
ADDRLP4 788
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 553
;553:		strcpy( value, "<error>");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $352
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 554
;554:		return;
ADDRGP4 $348
JUMPV
LABELV $349
line 556
;555:	}
;556:	len = strlen(token)-strlen(_token);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 788
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 792
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 788
INDIRI4
ADDRLP4 792
INDIRI4
SUBI4
ASGNI4
line 557
;557:	_token++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 559
;558:
;559:	Q_strncpyz( temp, token, len+1 );
ADDRLP4 524
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 561
;560:		
;561:	ClientScript_GetValue( string[0], temp, qfalse );
ADDRLP4 8
ARGP4
ADDRLP4 524
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 562
;562:	ClientScript_GetValue( string[1], _token, qfalse );
ADDRLP4 8+256
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 566
;563:
;564:	// string[1] is a expression: \.*\
;565:	// string[0] is a string: bla
;566:	reg_exp = regcomp( string[1] );
ADDRLP4 8+256
ARGP4
ADDRLP4 796
ADDRGP4 regcomp
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 796
INDIRP4
ASGNP4
line 567
;567:	result = regexec( reg_exp, string[0] ); 			   
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 800
ADDRGP4 regexec
CALLI4
ASGNI4
ADDRLP4 780
ADDRLP4 800
INDIRI4
ASGNI4
line 570
;568:
;569:	// variable parsed?
;570:	if ( result && reg_exp->startp[1] != NULL && reg_exp->endp[1] != NULL )
ADDRLP4 780
INDIRI4
CNSTI4 0
EQI4 $355
ADDRLP4 808
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 808
INDIRU4
EQU4 $355
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 808
INDIRU4
EQU4 $355
line 571
;571:	{
line 572
;572:		len = strlen(reg_exp->startp[1]) - strlen(reg_exp->endp[1]);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 812
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
ARGP4
ADDRLP4 816
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 812
INDIRI4
ADDRLP4 816
INDIRI4
SUBI4
ASGNI4
line 574
;573:
;574:		Q_strncpyz( value, reg_exp->startp[1], len+1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 575
;575:		if ( nssl_debug.integer )
ADDRGP4 nssl_debug+12
INDIRI4
CNSTI4 0
EQI4 $356
line 576
;576:			NSSL_Printf("Variable Parsed: [%s] '%s','%s'\n", value, reg_exp->startp[1], reg_exp->endp[1] );
ADDRGP4 $360
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 577
;577:	} 
ADDRGP4 $356
JUMPV
LABELV $355
line 578
;578:	else {
line 579
;579:		NSSL_Printf("Syntax Warning: %s doesn't match %s\n", string[0],string[1] );
ADDRGP4 $361
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+256
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 580
;580:		strcpy( value, "<error>");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $352
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 581
;581:		return;
LABELV $356
line 583
;582:	}
;583:}
LABELV $348
endproc ClientScript_RegExp 824 16
export ClientScript_GetValueFloat
proc ClientScript_GetValueFloat 260 12
line 594
;584:
;585:/*
;586:===================
;587:Client Script
;588:	Get Value
;589:
;590:Get a special value or just copy a token
;591:===================
;592:*/ 
;593:float ClientScript_GetValueFloat( const char *token, qboolean cvarScan )
;594:{
line 596
;595:	char value[256];
;596:	ClientScript_GetValue( value, token, cvarScan );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 597
;597:	return atof( value );
ADDRLP4 0
ARGP4
ADDRLP4 256
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 256
INDIRF4
RETF4
LABELV $363
endproc ClientScript_GetValueFloat 260 12
export ClientScript_GetValue
proc ClientScript_GetValue 304 12
line 601
;598:} 
;599:
;600:void ClientScript_GetValue( char	value[256], const char *token, qboolean cvarScan )
;601:{ 
line 603
;602:	char temp[256];
;603:	int op = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 604
;604:	int casttype = ClientScript_CastType( token );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 ClientScript_CastType
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 268
INDIRI4
ASGNI4
line 605
;605:	qboolean cleanstring = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 607
;606:		
;607:	if ( casttype != CT_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $365
line 608
;608:	{
line 609
;609:		token += ctLength[casttype];
ADDRFP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctLength
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
line 611
;610:
;611:		if ( nssl_debug.integer )
ADDRGP4 nssl_debug+12
INDIRI4
CNSTI4 0
EQI4 $367
line 612
;612:			NSSL_Printf("Casttype: %i token: %s\n", casttype, token );
ADDRGP4 $370
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $367
line 613
;613:	}
LABELV $365
line 615
;614:
;615:	if ( token[0] == '+' ||	token[0] == '-' ) 
ADDRLP4 272
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 43
EQI4 $373
ADDRLP4 272
INDIRI4
CNSTI4 45
NEI4 $371
LABELV $373
line 616
;616:	{
line 617
;617:		if ( token[0] == '-' )
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $374
line 618
;618:			op = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRGP4 $375
JUMPV
LABELV $374
line 620
;619:		else
;620:			op = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $375
line 622
;621:		
;622:		token++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 623
;623:	}
LABELV $371
line 625
;624:
;625:	if ( token[0] == '~' )
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 126
NEI4 $376
line 626
;626:	{
line 627
;627:		token++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 628
;628:		cleanstring = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 629
;629:	}
LABELV $376
line 631
;630:
;631:	if ( token[0] == '*' )  
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $378
line 632
;632:		ClientScript_GetScriptCommand( value, token ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ClientScript_GetScriptCommand
CALLV
pop
ADDRGP4 $379
JUMPV
LABELV $378
line 633
;633:	else if ( token[0] == 'c' && token[1] == 'a' &&	token[2] == 'l' && token[3] == 'c' &&
ADDRLP4 276
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 280
CNSTI4 99
ASGNI4
ADDRLP4 276
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 280
INDIRI4
NEI4 $380
ADDRLP4 276
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $380
ADDRLP4 276
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 108
NEI4 $380
ADDRLP4 276
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ADDRLP4 280
INDIRI4
NEI4 $380
ADDRLP4 276
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 58
NEI4 $380
line 635
;634:		token[4] == ':') 
;635:		ClientScript_DoCalc( value, token );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ClientScript_DoCalc
CALLV
pop
ADDRGP4 $381
JUMPV
LABELV $380
line 636
;636:	else if ( token[0] == '%' ) // parse a string, ~$string,$parse
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 37
NEI4 $382
line 637
;637:		ClientScript_RegExp( value, token );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ClientScript_RegExp
CALLV
pop
ADDRGP4 $383
JUMPV
LABELV $382
line 639
;638:	// it's a cvar
;639:	else if ( token[0] == '$' ) 
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 36
NEI4 $384
line 640
;640:	{
line 641
;641:		token++; 
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 642
;642:		if ( token[0] == '$' ) // double evaluation
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 36
NEI4 $386
line 643
;643:		{
line 644
;644:			token++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 645
;645:			trap_Cvar_VariableStringBuffer( token, value, 256 ); 
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 646
;646:			token = value; 
ADDRFP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 647
;647:		}
LABELV $386
line 648
;648:		trap_Cvar_VariableStringBuffer( token, value, 256 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 649
;649:	}
ADDRGP4 $385
JUMPV
LABELV $384
line 651
;650:	else
;651:	{
line 654
;652:		// not a number see if it's a cvar sometimes we need to scan cvars without
;653:		// the evaluation symbol
;654:		if ( !ClientScript_IsNumber( token ) && cvarScan ) 
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 ClientScript_IsNumber
CALLI4
ASGNI4
ADDRLP4 288
CNSTI4 0
ASGNI4
ADDRLP4 284
INDIRI4
ADDRLP4 288
INDIRI4
NEI4 $388
ADDRFP4 8
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $388
line 655
;655:		{
line 656
;656:			trap_Cvar_VariableStringBuffer( token, temp, 256 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 658
;657:			
;658:			if ( strlen ( temp ) > 0 )
ADDRLP4 12
ARGP4
ADDRLP4 292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
LEI4 $390
line 659
;659:				strcpy( value, temp );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $389
JUMPV
LABELV $390
line 661
;660:			else
;661:				strcpy( value, token );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 662
;662:		}
ADDRGP4 $389
JUMPV
LABELV $388
line 664
;663:		else
;664:			strcpy( value, token );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $389
line 665
;665:	}
LABELV $385
LABELV $383
LABELV $381
LABELV $379
line 667
;666:
;667:	if ( op )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $392
line 668
;668:	{
line 669
;669:		if ( op == 2 )
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $394
line 670
;670:			strcpy( temp, "-" );
ADDRLP4 12
ARGP4
ADDRGP4 $396
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $395
JUMPV
LABELV $394
line 672
;671:		else
;672:			strcpy( temp, "+" );
ADDRLP4 12
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $395
line 673
;673:		strcat( temp, value );		
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 674
;674:		strcpy( value, temp );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 675
;675:	}
LABELV $392
line 677
;676:
;677:	switch ( casttype ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $401
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $400
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $399
ADDRGP4 $399
JUMPV
LABELV $400
line 679
;678:		case CT_INT:
;679:			strcpy( value, va( "%i", atoi( value ) ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $223
ARGP4
ADDRLP4 288
INDIRI4
ARGI4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 680
;680:			break;
ADDRGP4 $399
JUMPV
LABELV $401
line 682
;681:		case CT_FLOAT:
;682:			strcpy( value, va( "%f", atof( value ) ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 $187
ARGP4
ADDRLP4 296
INDIRF4
ARGF4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 683
;683:			break;
line 686
;684:		case CT_STRING:
;685:		default:
;686:			break;
LABELV $399
line 689
;687:	}
;688:
;689:	if ( cleanstring )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $403
line 690
;690:		strcpy( value, Q_CleanStr( value ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 Q_CleanStr
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $403
line 692
;691:
;692:	if ( nssl_debug.value == 2 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1073741824
NEF4 $405
line 693
;693:		NSSL_Printf( "NSSL: Evaulted %s to %s\n", token, value );
ADDRGP4 $408
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $405
line 694
;694:}
LABELV $364
endproc ClientScript_GetValue 304 12
export ClientScript_Linebreak
proc ClientScript_Linebreak 4 4
line 705
;695:
;696:/*
;697:===================
;698:Client Script
;699:	Request Linebreak
;700:
;701:Is there a linebrake char at the beginning or at the end?
;702:===================
;703:*/
;704:qboolean ClientScript_Linebreak( const char *token )
;705:{
line 706
;706:	if ( token[0] == '#' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 35
NEI4 $410
line 707
;707:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $409
JUMPV
LABELV $410
line 708
;708:	else if ( token[strlen(token)-1] == '#' )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 35
NEI4 $412
line 709
;709:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $409
JUMPV
LABELV $412
line 711
;710:
;711:	return qfalse;
CNSTI4 0
RETI4
LABELV $409
endproc ClientScript_Linebreak 4 4
export ClientScript_GetCommand
proc ClientScript_GetCommand 320 12
line 723
;712:}
;713:
;714:/*
;715:===================
;716:Client Script
;717:	Get Command
;718:
;719:This reads the contents of a { } directive
;720:===================
;721:*/
;722:void ClientScript_GetCommand( char	cmd[512] )
;723:{
line 727
;724:	int openSubs;
;725:	const char *token;
;726: 
;727:	openSubs = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 729
;728: 
;729:	token = ClientScript_NextToken();
ADDRLP4 8
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 731
;730:
;731:	strcpy( cmd, "" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $328
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 733
;732:
;733:	if ( !token || strlen(token) <= 0 )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $417
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $415
LABELV $417
line 734
;734:	{
line 735
;735:		NSSL_Printf( "Wrong syntax: '%s' expected '{'\n", token );
ADDRGP4 $418
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 736
;736:		return;
ADDRGP4 $414
JUMPV
LABELV $415
line 738
;737:	} // if it's more than just a single { then we should remove it
;738:	else if ( strlen( token ) > 1 && token[0] == '{' ) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $419
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $419
line 739
;739:	{
line 741
;740:		// remove the first char {
;741:		token++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 743
;742:
;743:		if ( token[0] == '}' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $424
line 744
;744:		{
line 745
;745:			NSSL_Printf( "Warning empty command\n" );
ADDRGP4 $423
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 746
;746:			return;
ADDRGP4 $414
JUMPV
line 748
;747:		}
;748:		goto copy;
LABELV $419
line 750
;749:	}
;750:	else if ( Q_stricmp( token, "{" ) != 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $429
line 751
;751:	{
line 752
;752:		NSSL_Printf( "Wrong syntax: '%s' expected '{'\n", token );
ADDRGP4 $418
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 753
;753:		return;
ADDRGP4 $414
JUMPV
LABELV $428
line 757
;754:	}
;755:
;756:	while ( token && strlen(token) > 0  )
;757:	{ 
line 760
;758:		char _token[256];
;759:
;760:		token = ClientScript_NextToken();
ADDRLP4 284
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 284
INDIRP4
ASGNP4
line 762
;761:
;762:		if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $431
line 763
;763:			break;
ADDRGP4 $430
JUMPV
LABELV $431
line 765
;764:
;765:		if ( !Q_stricmp( token , "{" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $433
line 766
;766:			openSubs++;		
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $433
line 767
;767:		if ( !Q_stricmp( token , "}" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $437
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $435
line 768
;768:		{
line 769
;769:			if ( openSubs > 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $430
line 770
;770:				openSubs--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 772
;771:			else
;772:				break;
LABELV $439
line 773
;773:		} 		
LABELV $435
LABELV $424
line 776
;774:copy: 
;775:		// a rare case, if quit==1 then {quit}, remove the } we removed the { previously
;776:		if ( strlen(token) > 1 && token[strlen(token)-1] == '}' && openSubs == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 1
LEI4 $440
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $440
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $440
line 777
;777:		{
line 778
;778:			strcpy( _token, token );
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 779
;779:			_token[strlen(token)-1] = '\0';
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 304
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
ADDRLP4 28-1
ADDP4
CNSTI1 0
ASGNI1
line 780
;780:			token = _token;
ADDRLP4 0
ADDRLP4 28
ASGNP4
line 781
;781:		}
LABELV $440
line 783
;782:		    
;783:		ClientScript_GetValue( _token, token, qfalse );
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 784
;784:		token = _token;
ADDRLP4 0
ADDRLP4 28
ASGNP4
line 786
;785:		
;786:		if ( openSubs == 0 && ClientScript_Linebreak(token) )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $443
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 304
ADDRGP4 ClientScript_Linebreak
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $443
line 787
;787:		{
line 788
;788:			if ( strlen( token ) > 1 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 1
LEI4 $445
line 789
;789:			{ 
line 790
;790:				strcpy(_token,token);
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 791
;791:				if ( _token[0] == '#' )
ADDRLP4 28
INDIRI1
CVII4 1
CNSTI4 35
NEI4 $447
line 792
;792:					_token[0] = ' ';
ADDRLP4 28
CNSTI1 32
ASGNI1
LABELV $447
line 793
;793:				if ( _token[strlen(_token)-1] == '#' )
ADDRLP4 28
ARGP4
ADDRLP4 312
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
ADDRLP4 28-1
ADDP4
INDIRI1
CVII4 1
CNSTI4 35
NEI4 $449
line 794
;794:					_token[strlen(_token)-1] = '\0';
ADDRLP4 28
ARGP4
ADDRLP4 316
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
ADDRLP4 28-1
ADDP4
CNSTI1 0
ASGNI1
LABELV $449
line 797
;795:
;796:				// insert the modified token
;797:				strcat( cmd, Q3_LINEBREAK );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 798
;798:				strcat( cmd, _token );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 799
;799:				strcat( cmd, " " ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 800
;800:			}
ADDRGP4 $444
JUMPV
LABELV $445
line 802
;801:			else
;802:			{
line 805
;803:				// just append a Q3_LINEBREAK but not the token, it's only
;804:				// a # char
;805:				strcat( cmd, "; ");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $454
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 806
;806:			}
line 807
;807:		}
ADDRGP4 $444
JUMPV
LABELV $443
line 809
;808:		else
;809:		{
line 810
;810:			strcat( cmd, token ); // append token
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 811
;811:			strcat( cmd, " " ); // and a space
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 812
;812:		} 
LABELV $444
line 813
;813:	}
LABELV $429
line 756
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $455
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
GTI4 $428
LABELV $455
LABELV $430
line 815
;814:
;815:	if ( nssl_debug.value == 1 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1065353216
NEF4 $456
line 816
;816:		NSSL_Printf( "NSSL: Parsed {}: %s\n", cmd );
ADDRGP4 $459
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $456
line 817
;817:}
LABELV $414
endproc ClientScript_GetCommand 320 12
export ClientScript_Modify
proc ClientScript_Modify 808 16
line 831
;818:
;819:/*
;820:===================
;821:Client Script
;822:	Modify
;823:
;824:Parses the modify parameter from a string
;825:format:
;826:	modify <cvar> +/-<value>
;827:
;828:===================
;829:*/
;830:void ClientScript_Modify ( void )
;831:{
line 837
;832:	const	char	*token; // a pointer
;833:	char	cvar[256]; // the cvar i parse from the big string
;834:	char	modifier[256];  // the value i parse from the big string
;835:	char	inValue[256];
;836: 	float	cvarResult; // the cvar buffer i use to modify
;837:	qboolean	useElse = qtrue;
ADDRLP4 776
CNSTI4 1
ASGNI4
line 840
;838: 
;839:	// get the cvar
;840:	token = ClientScript_NextToken();
ADDRLP4 780
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 780
INDIRP4
ASGNP4
line 842
;841:
;842:	if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $461
line 843
;843:	{
line 844
;844:		NSSL_Printf( "usage: modify <cvar> <modifier>\n");
ADDRGP4 $463
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 845
;845:		return;
ADDRGP4 $460
JUMPV
LABELV $461
line 848
;846:	}
;847:
;848:	strcpy( cvar, token );
ADDRLP4 516
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 849
;849:	ClientScript_GetValue( inValue, cvar, qtrue );  // convert raw cvar into result wihtout $
ADDRLP4 260
ARGP4
ADDRLP4 516
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 852
;850:
;851:	// get the modifier
;852:	token = ClientScript_NextToken();
ADDRLP4 784
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 784
INDIRP4
ASGNP4
line 854
;853:  
;854:	if (!token)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $464
line 855
;855:	{
line 856
;856:		NSSL_Printf( "usage: modify <cvar> <modifier>\n");
ADDRGP4 $463
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 857
;857:		return;
ADDRGP4 $460
JUMPV
LABELV $464
line 861
;858:	}
;859:
;860:	// get the string we want to modify it by 
;861:	ClientScript_GetValue( modifier, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 863
;862: 
;863:	if ( nssl_debug.value == 1 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1065353216
NEF4 $466
line 864
;864:		NSSL_Printf( "NSSL: Modified %s from %s by %s\n",cvar, inValue, modifier );
ADDRGP4 $469
ARGP4
ADDRLP4 516
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $466
line 866
;865:
;866:	if ( ClientScript_IsNumber( inValue ) ||
ADDRLP4 260
ARGP4
ADDRLP4 788
ADDRGP4 ClientScript_IsNumber
CALLI4
ASGNI4
ADDRLP4 788
INDIRI4
CNSTI4 0
NEI4 $473
ADDRLP4 792
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 792
INDIRI4
CNSTI4 43
EQI4 $473
ADDRLP4 792
INDIRI4
CNSTI4 45
NEI4 $470
LABELV $473
line 869
;867:		modifier[0] == '+' || 
;868:		modifier[0] == '-' )
;869:	{   
line 870
;870:		cvarResult = atof( inValue ); 
ADDRLP4 260
ARGP4
ADDRLP4 796
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 772
ADDRLP4 796
INDIRF4
ASGNF4
line 871
;871:		cvarResult += atof( modifier );
ADDRLP4 4
ARGP4
ADDRLP4 800
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 772
ADDRLP4 772
INDIRF4
ADDRLP4 800
INDIRF4
ADDF4
ASGNF4
line 873
;872:  
;873:		trap_Cvar_Set( cvar, va("%f",cvarResult ) );
ADDRGP4 $187
ARGP4
ADDRLP4 772
INDIRF4
ARGF4
ADDRLP4 804
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 516
ARGP4
ADDRLP4 804
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 874
;874:	} 
ADDRGP4 $471
JUMPV
LABELV $470
line 876
;875:	else 
;876:	{
line 877
;877:		strcat( inValue, modifier );
ADDRLP4 260
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 879
;878:		
;879:		trap_Cvar_Set( cvar, va("%s", inValue ) );
ADDRGP4 $474
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 796
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 516
ARGP4
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 880
;880:	} 
LABELV $471
line 882
;881:	
;882:} 
LABELV $460
endproc ClientScript_Modify 808 16
export ClientScript_GetOperator
proc ClientScript_GetOperator 40 8
line 885
;883:
;884:int ClientScript_GetOperator( const char *token )
;885:{ 
line 886
;886:	if ( !Q_stricmp( token, "==" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $478
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $476
line 887
;887:		return OP_SAME;
CNSTI4 0
RETI4
ADDRGP4 $475
JUMPV
LABELV $476
line 888
;888:	else if ( !Q_stricmp( token, "!=" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $481
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $479
line 889
;889:		return OP_NOTSAME;
CNSTI4 1
RETI4
ADDRGP4 $475
JUMPV
LABELV $479
line 890
;890:	else if ( !Q_stricmp( token, "<" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $484
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $482
line 891
;891:		return OP_SMALLERTHAN;
CNSTI4 2
RETI4
ADDRGP4 $475
JUMPV
LABELV $482
line 892
;892:	else if ( !Q_stricmp( token, ">" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $487
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $485
line 893
;893:		return OP_BIGGERTHAN;
CNSTI4 3
RETI4
ADDRGP4 $475
JUMPV
LABELV $485
line 894
;894:	else if ( !Q_stricmp( token, "<=" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $490
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $488
line 895
;895:		return OP_SMALLERSAME;
CNSTI4 4
RETI4
ADDRGP4 $475
JUMPV
LABELV $488
line 896
;896:	else if ( !Q_stricmp( token, ">=" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $493
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $491
line 897
;897:		return OP_BIGGERSAME;
CNSTI4 5
RETI4
ADDRGP4 $475
JUMPV
LABELV $491
line 898
;898:	else if ( !Q_stricmp( token, "&" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $496
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $494
line 899
;899:		return OP_BITAND;
CNSTI4 7
RETI4
ADDRGP4 $475
JUMPV
LABELV $494
line 900
;900:	else if ( !Q_stricmp( token, "=|" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $499
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $497
line 901
;901:		return OP_REGEXP;
CNSTI4 6
RETI4
ADDRGP4 $475
JUMPV
LABELV $497
line 903
;902:	else
;903:	{
line 904
;904:		if ( !token || Q_stricmp( token, "==" ) != 0 )
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $502
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 $478
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $500
LABELV $502
line 905
;905:		{
line 906
;906:			NSSL_Printf( "Wrong syntax: '%s' expected '==,!=,<,>,<=,>=,=|'\n", token );
ADDRGP4 $503
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 907
;907:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $475
JUMPV
LABELV $500
line 909
;908:		} 
;909:	}
line 910
;910:	return 0;
CNSTI4 0
RETI4
LABELV $475
endproc ClientScript_GetOperator 40 8
data
export numScriptGFX
align 4
LABELV numScriptGFX
byte 4 0
export GetFreeGFXSlot
code
proc GetFreeGFXSlot 8 12
line 949
;911:}
;912: 
;913:
;914:/*
;915:===================
;916:Client Script
;917:	GFX Handle
;918:
;919:Parses the while parameter from a string
;920:format:
;921:	while <cvar> == <value/string> { ... } <sleep in ms> <timetolive>
;922:
;923:	== can also be !=,<=,>=,<,>
;924:===================
;925:*/ 
;926:#define	MAX_SCRIPT_GFX		 128
;927:
;928:typedef struct {
;929:	int			x;
;930:	int			y;
;931:	int			w;
;932:	int			h;
;933:	int			flags;
;934:
;935:	float		color[4];
;936:	float		scale;
;937:
;938:	char		groupname[128];
;939:	char		text[256];
;940:
;941:	qhandle_t	shader;
;942:	qboolean	inuse;
;943:} nsslGFXTable_t;
;944:
;945:int numScriptGFX = 0;
;946:nsslGFXTable_t		scriptGFXTable[MAX_SCRIPT_GFX];  
;947:
;948:int GetFreeGFXSlot( void )
;949:{
line 950
;950:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 952
;951:
;952:	for (i=0;i<MAX_SCRIPT_GFX;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $506
line 953
;953:	{
line 954
;954:		if ( !scriptGFXTable[i].inuse )
CNSTI4 432
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptGFXTable+428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $510
line 955
;955:		{
line 956
;956:			memset( &scriptGFXTable[i],0,sizeof(scriptGFXTable[i]) );
ADDRLP4 4
CNSTI4 432
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptGFXTable
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 957
;957:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $505
JUMPV
LABELV $510
line 959
;958:		}
;959:	}
LABELV $507
line 952
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $506
line 960
;960:	return 0;
CNSTI4 0
RETI4
LABELV $505
endproc GetFreeGFXSlot 8 12
export AddGFXLoop
proc AddGFXLoop 12 44
line 964
;961:}
;962:
;963:void AddGFXLoop( char groupname[128], int x,int y, int w, int h, float r,float g, float b, float a, qhandle_t shader )
;964:{
line 965
;965:	int num = GetFreeGFXSlot( );
ADDRLP4 8
ADDRGP4 GetFreeGFXSlot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 966
;966:	nsslGFXTable_t	*GFX = &scriptGFXTable[num];
ADDRLP4 0
CNSTI4 432
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 scriptGFXTable
ADDP4
ASGNP4
line 968
;967:
;968:	if ( nssl_debug.value == 1 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1065353216
NEF4 $514
line 969
;969:		NSSL_Printf( "Added(%i): %s x %i y %i w %i h %i r %f g %f b %f a %f\n",num,groupname, x,y,w,h,r,g,b,a );
ADDRGP4 $517
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
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
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $514
line 971
;970:	
;971:	strcpy( GFX->groupname, groupname );
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 972
;972:	GFX->x = x;
ADDRLP4 0
INDIRP4
ADDRFP4 4
INDIRI4
ASGNI4
line 973
;973:	GFX->y = y;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 974
;974:	GFX->w = w;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 975
;975:	GFX->h = h;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 977
;976:
;977:	GFX->color[0] = r;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 20
INDIRF4
ASGNF4
line 978
;978:	GFX->color[1] = g;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 24
INDIRF4
ASGNF4
line 979
;979:	GFX->color[2] = b;
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 28
INDIRF4
ASGNF4
line 980
;980:	GFX->color[3] = a;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 32
INDIRF4
ASGNF4
line 982
;981:
;982:	GFX->shader = shader;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 36
INDIRI4
ASGNI4
line 984
;983:
;984:	GFX->inuse = qtrue; 
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 985
;985:}
LABELV $513
endproc AddGFXLoop 12 44
export ClientScript_ProcessGFX
proc ClientScript_ProcessGFX 16 32
line 988
;986:
;987:void ClientScript_ProcessGFX( int num )
;988:{
line 989
;989:	nsslGFXTable_t	*GFX = &scriptGFXTable[num];
ADDRLP4 0
CNSTI4 432
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptGFXTable
ADDP4
ASGNP4
line 991
;990: 
;991:	if ( !GFX->inuse )
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $519
line 992
;992:		return;
ADDRGP4 $518
JUMPV
LABELV $519
line 994
;993:
;994:	if ( strlen(GFX->text) > 0 )
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $521
line 995
;995:		CG_Text_Paint( GFX->x,GFX->y,GFX->scale,GFX->color,GFX->text,0,0, GFX->flags );
ADDRLP4 0
INDIRP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
ADDRGP4 $522
JUMPV
LABELV $521
line 996
;996:	else if ( GFX->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $523
line 997
;997:		trap_R_SetColor( GFX->color );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 998
;998:		CG_DrawPic( GFX->x,GFX->y,GFX->w,GFX->h, GFX->shader );
ADDRLP4 0
INDIRP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 999
;999:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1000
;1000:	} else { 
ADDRGP4 $524
JUMPV
LABELV $523
line 1001
;1001:		CG_FillRect( GFX->x,GFX->y,GFX->w,GFX->h, GFX->color );
ADDRLP4 0
INDIRP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1002
;1002:	}
LABELV $524
LABELV $522
line 1003
;1003:}
LABELV $518
endproc ClientScript_ProcessGFX 16 32
export ClientScript_DeleteGfxGroup
proc ClientScript_DeleteGfxGroup 16 8
line 1007
;1004:
;1005:// addgfx <x> <y> <w> <h> <r> <g> <b> <a> <shader loc>
;1006:void ClientScript_DeleteGfxGroup( void )
;1007:{
line 1008
;1008:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1009
;1009:	const char *token = ClientScript_NextToken();
ADDRLP4 8
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1011
;1010:	
;1011:	if (!token)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $526
line 1012
;1012:	{
line 1013
;1013:		NSSL_Printf("Syntax Warning: Missing Groupname for delgroup.\n");
ADDRGP4 $528
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1014
;1014:		return;
ADDRGP4 $525
JUMPV
LABELV $526
line 1017
;1015:	}
;1016:
;1017:	if ( nssl_debug.integer )
ADDRGP4 nssl_debug+12
INDIRI4
CNSTI4 0
EQI4 $529
line 1018
;1018:		NSSL_Printf("Removing Group %s\n", token );
ADDRGP4 $532
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $529
line 1020
;1019:
;1020:	for (i = 0; i < MAX_SCRIPT_GFX; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $533
line 1021
;1021:	{ 
line 1022
;1022:		if ( !scriptGFXTable[i].inuse )
CNSTI4 432
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptGFXTable+428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $537
line 1023
;1023:			continue;
ADDRGP4 $534
JUMPV
LABELV $537
line 1025
;1024:   
;1025:		if ( !Q_stricmp( token, scriptGFXTable[i].groupname ) ) 
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 432
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptGFXTable+40
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $540
line 1026
;1026:			scriptGFXTable[i].inuse = qfalse;  
CNSTI4 432
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptGFXTable+428
ADDP4
CNSTI4 0
ASGNI4
LABELV $540
line 1027
;1027:	}
LABELV $534
line 1020
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $533
line 1028
;1028:}
LABELV $525
endproc ClientScript_DeleteGfxGroup 16 8
export AddGFXText
proc AddGFXText 12 36
line 1032
;1029:
;1030:
;1031:void AddGFXText( char groupname[128], char text[256], int x,int y, float scale, float r,float g, float b, float a, int flags )
;1032:{
line 1033
;1033:	int num = GetFreeGFXSlot( );
ADDRLP4 8
ADDRGP4 GetFreeGFXSlot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1034
;1034:	nsslGFXTable_t	*GFX = &scriptGFXTable[num];
ADDRLP4 0
CNSTI4 432
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 scriptGFXTable
ADDP4
ASGNP4
line 1036
;1035:
;1036:	if ( nssl_debug.value == 1 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1065353216
NEF4 $545
line 1037
;1037:		NSSL_Printf( "Added TEXT(%i): %s x %i y %i r %f g %f b %f a %f\n",num,groupname, x,y,r,g,b,a );
ADDRGP4 $548
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
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
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $545
line 1039
;1038:	
;1039:	strcpy( GFX->groupname, groupname );
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1040
;1040:	strcpy( GFX->text, text );
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1042
;1041:
;1042:	GFX->x = x;
ADDRLP4 0
INDIRP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1043
;1043:	GFX->y = y;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 1044
;1044:	GFX->flags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 36
INDIRI4
ASGNI4
line 1046
;1045:
;1046:	GFX->scale = scale;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 1048
;1047:
;1048:	GFX->color[0] = r;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 20
INDIRF4
ASGNF4
line 1049
;1049:	GFX->color[1] = g;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 24
INDIRF4
ASGNF4
line 1050
;1050:	GFX->color[2] = b;
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 28
INDIRF4
ASGNF4
line 1051
;1051:	GFX->color[3] = a;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 32
INDIRF4
ASGNF4
line 1053
;1052:  
;1053:	GFX->inuse = qtrue; 
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 1054
;1054:}
LABELV $544
endproc AddGFXText 12 36
export ClientScript_AddString
proc ClientScript_AddString 724 40
line 1056
;1055:void ClientScript_AddString( void )
;1056:{
line 1064
;1057:	const char *token;
;1058:	char groupname[128];
;1059:	char text[256];
;1060:	char _token[256];
;1061:	int		x,y,flags; 
;1062:	float scale,r,g,b,a;  
;1063:
;1064:	x = y = 64;
ADDRLP4 676
CNSTI4 64
ASGNI4
ADDRLP4 264
ADDRLP4 676
INDIRI4
ASGNI4
ADDRLP4 260
ADDRLP4 676
INDIRI4
ASGNI4
line 1065
;1065:	r = g = b = a = 1.0f;
ADDRLP4 680
CNSTF4 1065353216
ASGNF4
ADDRLP4 280
ADDRLP4 680
INDIRF4
ASGNF4
ADDRLP4 276
ADDRLP4 680
INDIRF4
ASGNF4
ADDRLP4 272
ADDRLP4 680
INDIRF4
ASGNF4
ADDRLP4 268
ADDRLP4 680
INDIRF4
ASGNF4
line 1067
;1066:
;1067:	token = ClientScript_NextToken();
ADDRLP4 684
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 684
INDIRP4
ASGNP4
line 1068
;1068:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $550
line 1069
;1069:		ClientScript_GetValue( groupname, token, qtrue ); 
ADDRLP4 540
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
ADDRGP4 $551
JUMPV
LABELV $550
line 1070
;1070:	else {
line 1071
;1071:		NSSL_Printf("Syntax Warning: No groupname! GFX not added.\n");
ADDRGP4 $552
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1072
;1072:		return;
ADDRGP4 $549
JUMPV
LABELV $551
line 1075
;1073:	}
;1074:
;1075:	ClientScript_GetCommand( text );
ADDRLP4 284
ARGP4
ADDRGP4 ClientScript_GetCommand
CALLV
pop
line 1077
;1076:
;1077:	token = ClientScript_NextToken();
ADDRLP4 688
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 688
INDIRP4
ASGNP4
line 1078
;1078:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $553
line 1079
;1079:	{
line 1080
;1080:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1081
;1081:		x = atoi( _token );
ADDRLP4 4
ARGP4
ADDRLP4 692
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 260
ADDRLP4 692
INDIRI4
ASGNI4
line 1082
;1082:	}
LABELV $553
line 1084
;1083:
;1084:	token = ClientScript_NextToken();
ADDRLP4 692
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 692
INDIRP4
ASGNP4
line 1085
;1085:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $555
line 1086
;1086:	{
line 1087
;1087:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1088
;1088:		y = atoi( _token );
ADDRLP4 4
ARGP4
ADDRLP4 696
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 264
ADDRLP4 696
INDIRI4
ASGNI4
line 1089
;1089:	}
LABELV $555
line 1091
;1090:
;1091:	token = ClientScript_NextToken();
ADDRLP4 696
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 696
INDIRP4
ASGNP4
line 1092
;1092:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $557
line 1093
;1093:	{
line 1094
;1094:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1095
;1095:		scale = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 700
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 672
ADDRLP4 700
INDIRF4
ASGNF4
line 1096
;1096:	}
LABELV $557
line 1098
;1097:
;1098:  	token = ClientScript_NextToken();
ADDRLP4 700
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 700
INDIRP4
ASGNP4
line 1099
;1099:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $559
line 1100
;1100:	{
line 1101
;1101:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1102
;1102:		flags = atoi( _token );
ADDRLP4 4
ARGP4
ADDRLP4 704
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 668
ADDRLP4 704
INDIRI4
ASGNI4
line 1103
;1103:	}
LABELV $559
line 1105
;1104:
;1105:	token = ClientScript_NextToken();
ADDRLP4 704
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 704
INDIRP4
ASGNP4
line 1106
;1106:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $561
line 1107
;1107:	{
line 1108
;1108:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1109
;1109:		r = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 708
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 268
ADDRLP4 708
INDIRF4
ASGNF4
line 1110
;1110:	}
LABELV $561
line 1112
;1111: 
;1112:	token = ClientScript_NextToken();
ADDRLP4 708
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 708
INDIRP4
ASGNP4
line 1113
;1113:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $563
line 1114
;1114:	{
line 1115
;1115:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1116
;1116:		g = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 712
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 272
ADDRLP4 712
INDIRF4
ASGNF4
line 1117
;1117:	}
LABELV $563
line 1119
;1118: 
;1119:	token = ClientScript_NextToken();
ADDRLP4 712
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 712
INDIRP4
ASGNP4
line 1120
;1120:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
line 1121
;1121:	{
line 1122
;1122:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1123
;1123:		b = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 716
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 276
ADDRLP4 716
INDIRF4
ASGNF4
line 1124
;1124:	}
LABELV $565
line 1126
;1125: 
;1126:	token = ClientScript_NextToken();
ADDRLP4 716
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 716
INDIRP4
ASGNP4
line 1127
;1127:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $567
line 1128
;1128:	{
line 1129
;1129:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1130
;1130:		a = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 720
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 280
ADDRLP4 720
INDIRF4
ASGNF4
line 1131
;1131:	}
LABELV $567
line 1133
;1132: 
;1133:	AddGFXText( groupname, text, x, y, scale, r, g, b, a, flags ); 
ADDRLP4 540
ARGP4
ADDRLP4 284
ARGP4
ADDRLP4 260
INDIRI4
ARGI4
ADDRLP4 264
INDIRI4
ARGI4
ADDRLP4 672
INDIRF4
ARGF4
ADDRLP4 268
INDIRF4
ARGF4
ADDRLP4 272
INDIRF4
ARGF4
ADDRLP4 276
INDIRF4
ARGF4
ADDRLP4 280
INDIRF4
ARGF4
ADDRLP4 668
INDIRI4
ARGI4
ADDRGP4 AddGFXText
CALLV
pop
line 1134
;1134:}
LABELV $549
endproc ClientScript_AddString 724 40
export ClientScript_AddGfx
proc ClientScript_AddGfx 476 40
line 1137
;1135:
;1136:void ClientScript_AddGfx( void )
;1137:{
line 1143
;1138:	const char *token;
;1139:	char groupname[128];
;1140:	char _token[256];
;1141:	int x,y,w,h;
;1142:	float r,g,b,a;
;1143:	qhandle_t shader = 0;
ADDRLP4 292
CNSTI4 0
ASGNI4
line 1145
;1144:
;1145:	x = y = w = h = 64;
ADDRLP4 424
CNSTI4 64
ASGNI4
ADDRLP4 272
ADDRLP4 424
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 424
INDIRI4
ASGNI4
ADDRLP4 264
ADDRLP4 424
INDIRI4
ASGNI4
ADDRLP4 260
ADDRLP4 424
INDIRI4
ASGNI4
line 1146
;1146:	r = g = b = a = 1.0f;
ADDRLP4 428
CNSTF4 1065353216
ASGNF4
ADDRLP4 288
ADDRLP4 428
INDIRF4
ASGNF4
ADDRLP4 284
ADDRLP4 428
INDIRF4
ASGNF4
ADDRLP4 280
ADDRLP4 428
INDIRF4
ASGNF4
ADDRLP4 276
ADDRLP4 428
INDIRF4
ASGNF4
line 1148
;1147:
;1148:	token = ClientScript_NextToken();
ADDRLP4 432
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 432
INDIRP4
ASGNP4
line 1149
;1149:	if ( token ) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $570
line 1150
;1150:		ClientScript_GetValue( groupname, token, qtrue ); 
ADDRLP4 296
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
ADDRGP4 $571
JUMPV
LABELV $570
line 1151
;1151:	else {
line 1152
;1152:		NSSL_Printf("Syntax Warning: No groupname! GFX not added.\n");
ADDRGP4 $552
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1153
;1153:		return;
ADDRGP4 $569
JUMPV
LABELV $571
line 1156
;1154:	}
;1155:
;1156:	token = ClientScript_NextToken();
ADDRLP4 436
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 436
INDIRP4
ASGNP4
line 1157
;1157:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $572
line 1158
;1158:	{
line 1159
;1159:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1160
;1160:		x = atoi( _token );
ADDRLP4 4
ARGP4
ADDRLP4 440
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 260
ADDRLP4 440
INDIRI4
ASGNI4
line 1161
;1161:	}
LABELV $572
line 1163
;1162:
;1163:	token = ClientScript_NextToken();
ADDRLP4 440
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 440
INDIRP4
ASGNP4
line 1164
;1164:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $574
line 1165
;1165:	{
line 1166
;1166:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1167
;1167:		y = atoi( _token );
ADDRLP4 4
ARGP4
ADDRLP4 444
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 264
ADDRLP4 444
INDIRI4
ASGNI4
line 1168
;1168:	}
LABELV $574
line 1170
;1169:
;1170:	token = ClientScript_NextToken();
ADDRLP4 444
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 444
INDIRP4
ASGNP4
line 1171
;1171:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $576
line 1172
;1172:	{
line 1173
;1173:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1174
;1174:		w = atoi( _token );
ADDRLP4 4
ARGP4
ADDRLP4 448
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 268
ADDRLP4 448
INDIRI4
ASGNI4
line 1175
;1175:	}
LABELV $576
line 1177
;1176:
;1177:	token = ClientScript_NextToken();
ADDRLP4 448
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 448
INDIRP4
ASGNP4
line 1178
;1178:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $578
line 1179
;1179:	{
line 1180
;1180:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1181
;1181:		h = atoi( _token );
ADDRLP4 4
ARGP4
ADDRLP4 452
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 452
INDIRI4
ASGNI4
line 1182
;1182:	}
LABELV $578
line 1185
;1183:
;1184:
;1185:	token = ClientScript_NextToken();
ADDRLP4 452
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 452
INDIRP4
ASGNP4
line 1186
;1186:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $580
line 1187
;1187:	{
line 1188
;1188:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1189
;1189:		r = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 456
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 276
ADDRLP4 456
INDIRF4
ASGNF4
line 1190
;1190:	}
LABELV $580
line 1193
;1191:
;1192:
;1193:	token = ClientScript_NextToken();
ADDRLP4 456
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 456
INDIRP4
ASGNP4
line 1194
;1194:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $582
line 1195
;1195:	{
line 1196
;1196:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1197
;1197:		g = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 460
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 280
ADDRLP4 460
INDIRF4
ASGNF4
line 1198
;1198:	}
LABELV $582
line 1201
;1199:
;1200:
;1201:	token = ClientScript_NextToken();
ADDRLP4 460
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 460
INDIRP4
ASGNP4
line 1202
;1202:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $584
line 1203
;1203:	{
line 1204
;1204:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1205
;1205:		b = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 464
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 284
ADDRLP4 464
INDIRF4
ASGNF4
line 1206
;1206:	}
LABELV $584
line 1209
;1207:
;1208:
;1209:	token = ClientScript_NextToken();
ADDRLP4 464
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 464
INDIRP4
ASGNP4
line 1210
;1210:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $586
line 1211
;1211:	{
line 1212
;1212:		ClientScript_GetValue( _token, token, qtrue );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1213
;1213:		a = atof( _token );
ADDRLP4 4
ARGP4
ADDRLP4 468
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 288
ADDRLP4 468
INDIRF4
ASGNF4
line 1214
;1214:	}
LABELV $586
line 1217
;1215:
;1216: 
;1217:	token = ClientScript_NextToken();
ADDRLP4 468
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 468
INDIRP4
ASGNP4
line 1218
;1218:	if ( token ) { 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $588
line 1219
;1219:		ClientScript_GetValue( _token, token, qtrue ); 
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1221
;1220:
;1221:		shader = trap_R_RegisterShader( _token );  
ADDRLP4 4
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 292
ADDRLP4 472
INDIRI4
ASGNI4
line 1222
;1222:	}
LABELV $588
line 1224
;1223:
;1224:	AddGFXLoop( groupname, x,y,w,h,r,g,b,a,shader );
ADDRLP4 296
ARGP4
ADDRLP4 260
INDIRI4
ARGI4
ADDRLP4 264
INDIRI4
ARGI4
ADDRLP4 268
INDIRI4
ARGI4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 276
INDIRF4
ARGF4
ADDRLP4 280
INDIRF4
ARGF4
ADDRLP4 284
INDIRF4
ARGF4
ADDRLP4 288
INDIRF4
ARGF4
ADDRLP4 292
INDIRI4
ARGI4
ADDRGP4 AddGFXLoop
CALLV
pop
line 1225
;1225:}
LABELV $569
endproc ClientScript_AddGfx 476 40
data
export numScriptProcess
align 4
LABELV numScriptProcess
byte 4 0
export GetFreeLoopSlot
code
proc GetFreeLoopSlot 4 0
line 1274
;1226:
;1227:
;1228:/*
;1229:===================
;1230:Client Script
;1231:	While Loop
;1232:
;1233:Parses the while parameter from a string
;1234:format:
;1235:	while <cvar> == <value> { ... }
;1236:
;1237:	== can also be !=,<=,>=,<,>
;1238:===================
;1239:*/
;1240:#define MAX_SCRIPT_LOOPS	1024
;1241:#define	MAX_SCRIPT_PROCESS	 128
;1242:
;1243:
;1244:// Navy Seals --
;1245:typedef struct {
;1246:	char		cvar[256];
;1247:	char		cmd[512]; // the command that has to be executed
;1248:	int			function; 
;1249:	float		value;
;1250:	int			age;
;1251:	 
;1252:	int			sleep;
;1253:	int			lasttime;
;1254:
;1255:	qboolean	inuse;
;1256:} nsslLoopTable_t;
;1257:
;1258:int numScriptProcess = 0; 
;1259:nsslLoopTable_t		scriptLoopTable[MAX_SCRIPT_PROCESS];
;1260:
;1261:/*
;1262:===================
;1263:Client Script
;1264:	While Loop
;1265:
;1266:Parses the while parameter from a string
;1267:format:
;1268:	while <cvar> == <value/string> { ... } <sleep in ms> <timetolive>
;1269:
;1270:	== can also be !=,<=,>=,<,>
;1271:===================
;1272:*/
;1273:int GetFreeLoopSlot( void )
;1274:{
line 1275
;1275:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1277
;1276:
;1277:	for (i=0;i<MAX_SCRIPT_PROCESS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $592
line 1278
;1278:	{
line 1279
;1279:		if ( !scriptLoopTable[i].inuse )
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
INDIRI4
CNSTI4 0
NEI4 $596
line 1280
;1280:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $591
JUMPV
LABELV $596
line 1281
;1281:	}
LABELV $593
line 1277
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $592
line 1282
;1282:	return 0;
CNSTI4 0
RETI4
LABELV $591
endproc GetFreeLoopSlot 4 0
export AddScriptLoop
proc AddScriptLoop 8 32
line 1285
;1283:}
;1284:void AddScriptLoop( char cvar[256], char cmd[512], int function, float value, int sleep, int age )
;1285:{
line 1286
;1286:	int num = GetFreeLoopSlot( );
ADDRLP4 4
ADDRGP4 GetFreeLoopSlot
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1288
;1287:
;1288:	if ( nssl_debug.value == 1 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1065353216
NEF4 $600
line 1289
;1289:		NSSL_Printf( "Added(%i): cvar %s cmd '%s' func %i value %f sleep %i age %i\n",num,cvar, cmd,function,value,sleep,age);
ADDRGP4 $603
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $600
line 1291
;1290:	
;1291:	strcpy( scriptLoopTable[num].cvar , cvar );
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1292
;1292:	strcpy( scriptLoopTable[num].cmd , cmd );
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+256
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1293
;1293:	scriptLoopTable[num].value = value;
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+772
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 1294
;1294:	scriptLoopTable[num].inuse = qtrue;
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
CNSTI4 1
ASGNI4
line 1295
;1295:	scriptLoopTable[num].function = function;
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+768
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1296
;1296:	scriptLoopTable[num].age = age;
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+776
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1297
;1297:	scriptLoopTable[num].sleep = sleep;
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+780
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 1300
;1298:
;1299:	// process it
;1300:	ClientScript_ProcessWhileLoop( num );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientScript_ProcessWhileLoop
CALLV
pop
line 1301
;1301:}
LABELV $599
endproc AddScriptLoop 8 32
export ClientScript_ProcessWhileLoop
proc ClientScript_ProcessWhileLoop 816 12
line 1303
;1302:void ClientScript_ProcessWhileLoop( int num )
;1303:{
line 1304
;1304:	int function = scriptLoopTable[num].function;
ADDRLP4 0
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+768
ADDP4
INDIRI4
ASGNI4
line 1306
;1305:	char cvarResult[256];
;1306:	float i_value = scriptLoopTable[num].value;
ADDRLP4 772
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+772
ADDP4
INDIRF4
ASGNF4
line 1308
;1307:	char cmd[512];
;1308:	int result = 0;
ADDRLP4 776
CNSTI4 0
ASGNI4
line 1310
;1309:
;1310:	ClientScript_GetValue( cvarResult, scriptLoopTable[num].cvar, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1312
;1311:
;1312:	strcpy( cmd, scriptLoopTable[num].cmd );
ADDRLP4 260
ARGP4
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+256
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1314
;1313:
;1314:	if ( cg.time < scriptLoopTable[num].lasttime )
ADDRGP4 cg+107604
INDIRI4
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+784
ADDP4
INDIRI4
GEI4 $614
line 1315
;1315:		return;
ADDRGP4 $610
JUMPV
LABELV $614
line 1317
;1316:
;1317:	if ( scriptLoopTable[num].age <= 0 && scriptLoopTable[num].age != -1 )
ADDRLP4 780
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 780
INDIRI4
ADDRGP4 scriptLoopTable+776
ADDP4
INDIRI4
CNSTI4 0
GTI4 $618
ADDRLP4 780
INDIRI4
ADDRGP4 scriptLoopTable+776
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $618
line 1318
;1318:	{
line 1319
;1319:		if ( nssl_debug.value )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 0
EQF4 $622
line 1320
;1320:			NSSL_Printf( "Script Warning: Killed thread (endless-loop) age %i\n", scriptLoopTable[num].age);
ADDRGP4 $625
ARGP4
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+776
ADDP4
INDIRI4
ARGI4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $622
line 1321
;1321:		scriptLoopTable[num].inuse = qfalse;
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
CNSTI4 0
ASGNI4
line 1322
;1322:		return;
ADDRGP4 $610
JUMPV
LABELV $618
line 1325
;1323:	}
;1324:
;1325:	scriptLoopTable[num].lasttime = cg.time + scriptLoopTable[num].sleep;
ADDRLP4 784
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 784
INDIRI4
ADDRGP4 scriptLoopTable+784
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 784
INDIRI4
ADDRGP4 scriptLoopTable+780
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1327
;1326:
;1327:	if ( scriptLoopTable[num].age > 0 )
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+776
ADDP4
INDIRI4
CNSTI4 0
LEI4 $631
line 1328
;1328:		scriptLoopTable[num].age--;
ADDRLP4 788
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+776
ADDP4
ASGNP4
ADDRLP4 788
INDIRP4
ADDRLP4 788
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $631
line 1332
;1329:
;1330:
;1331:	// string comparision works only with same/notsame
;1332:	if ( function == OP_NOTSAME )
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $635
line 1333
;1333:	{		
line 1334
;1334:		if ( atof(cvarResult) != scriptLoopTable[num].value )
ADDRLP4 4
ARGP4
ADDRLP4 792
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 792
INDIRF4
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+772
ADDP4
INDIRF4
EQF4 $637
line 1335
;1335:			ClientScript_ExecText( cmd ); // execute it 
ADDRLP4 260
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
ADDRGP4 $636
JUMPV
LABELV $637
line 1337
;1336:		else
;1337:			scriptLoopTable[num].inuse = qfalse;
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
CNSTI4 0
ASGNI4
line 1338
;1338:	}
ADDRGP4 $636
JUMPV
LABELV $635
line 1339
;1339:	else if ( function == OP_SAME )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $641
line 1340
;1340:	{		
line 1341
;1341:		if ( atof ( cvarResult ) == scriptLoopTable[num].value ) 
ADDRLP4 4
ARGP4
ADDRLP4 792
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 792
INDIRF4
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+772
ADDP4
INDIRF4
NEF4 $643
line 1342
;1342:			ClientScript_ExecText( cmd ); // execute it 
ADDRLP4 260
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
ADDRGP4 $642
JUMPV
LABELV $643
line 1344
;1343:		else
;1344:			scriptLoopTable[num].inuse = qfalse;
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
CNSTI4 0
ASGNI4
line 1345
;1345:	} 
ADDRGP4 $642
JUMPV
LABELV $641
line 1347
;1346:	else
;1347:	{ 
line 1349
;1348:
;1349:		switch ( function )
ADDRLP4 792
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 796
CNSTI4 2
ASGNI4
ADDRLP4 792
INDIRI4
ADDRLP4 796
INDIRI4
LTI4 $648
ADDRLP4 792
INDIRI4
CNSTI4 5
GTI4 $648
ADDRLP4 792
INDIRI4
ADDRLP4 796
INDIRI4
LSHI4
ADDRGP4 $665-8
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $665
address $649
address $653
address $657
address $661
code
line 1350
;1350:		{
LABELV $649
line 1352
;1351:		case OP_SMALLERTHAN: 
;1352:			if ( atof(cvarResult) < i_value )
ADDRLP4 4
ARGP4
ADDRLP4 800
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 800
INDIRF4
ADDRLP4 772
INDIRF4
GEF4 $650
line 1353
;1353:				ClientScript_ExecText( cmd ); 
ADDRLP4 260
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
ADDRGP4 $648
JUMPV
LABELV $650
line 1355
;1354:			else
;1355:				scriptLoopTable[num].inuse = qfalse;
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
CNSTI4 0
ASGNI4
line 1356
;1356:			break;
ADDRGP4 $648
JUMPV
LABELV $653
line 1358
;1357:		case OP_BIGGERTHAN:
;1358:			if ( atof(cvarResult) > i_value ) 
ADDRLP4 4
ARGP4
ADDRLP4 804
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 804
INDIRF4
ADDRLP4 772
INDIRF4
LEF4 $654
line 1359
;1359:				ClientScript_ExecText( cmd ); 
ADDRLP4 260
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
ADDRGP4 $648
JUMPV
LABELV $654
line 1361
;1360:			else
;1361:				scriptLoopTable[num].inuse = qfalse;
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
CNSTI4 0
ASGNI4
line 1362
;1362:			break;
ADDRGP4 $648
JUMPV
LABELV $657
line 1364
;1363:		case OP_SMALLERSAME:
;1364:			if ( atof(cvarResult) <= i_value  )
ADDRLP4 4
ARGP4
ADDRLP4 808
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 808
INDIRF4
ADDRLP4 772
INDIRF4
GTF4 $658
line 1365
;1365:				ClientScript_ExecText( cmd );
ADDRLP4 260
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
ADDRGP4 $648
JUMPV
LABELV $658
line 1367
;1366:			else
;1367:				scriptLoopTable[num].inuse = qfalse;
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
CNSTI4 0
ASGNI4
line 1368
;1368:			break;
ADDRGP4 $648
JUMPV
LABELV $661
line 1370
;1369:		case OP_BIGGERSAME:
;1370:			if ( atof(cvarResult) >= i_value )
ADDRLP4 4
ARGP4
ADDRLP4 812
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 812
INDIRF4
ADDRLP4 772
INDIRF4
LTF4 $662
line 1371
;1371:				ClientScript_ExecText( cmd );  
ADDRLP4 260
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
ADDRGP4 $648
JUMPV
LABELV $662
line 1373
;1372:			else
;1373:				scriptLoopTable[num].inuse = qfalse;
CNSTI4 792
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
CNSTI4 0
ASGNI4
line 1374
;1374:			break;
line 1376
;1375:		default:
;1376:			break;
LABELV $648
line 1378
;1377:		} 
;1378:	}
LABELV $642
LABELV $636
line 1380
;1379:
;1380:}
LABELV $610
endproc ClientScript_ProcessWhileLoop 816 12
export ClientScript_WhileLoop
proc ClientScript_WhileLoop 1336 24
line 1382
;1381:void ClientScript_WhileLoop( void )
;1382:{
line 1387
;1383:	const	char	*token; // a pointer
;1384:	char	cvar[256]; // the cvar i parse from the big string
;1385:	char	value[256];  // the value i parse from the big string
;1386:	char	cmd[512]; // the command that has to be executed
;1387: 	int		function = 0;
ADDRLP4 516
CNSTI4 0
ASGNI4
line 1388
;1388:	int		openSubs = 0; // amount of open { } there are
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 1389
;1389:	int		age = MAX_SCRIPT_LOOPS; 
ADDRLP4 520
CNSTI4 1024
ASGNI4
line 1390
;1390:	int		sleep = 500;
ADDRLP4 524
CNSTI4 500
ASGNI4
line 1392
;1391:
;1392:	qboolean	useElse = qtrue;
ADDRLP4 1044
CNSTI4 1
ASGNI4
line 1396
;1393:  
;1394:
;1395:	/* Get next token: */
;1396:	token = ClientScript_NextToken();
ADDRLP4 1048
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1048
INDIRP4
ASGNP4
line 1398
;1397:
;1398:	if (!token) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $668
line 1399
;1399:		return; 
ADDRGP4 $667
JUMPV
LABELV $668
line 1401
;1400:
;1401:	strcpy( cvar, token );
ADDRLP4 528
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1404
;1402:
;1403:	/* Get next token: */
;1404:	token = ClientScript_NextToken();
ADDRLP4 1052
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1052
INDIRP4
ASGNP4
line 1407
;1405:
;1406:	// get operator
;1407:	function = ClientScript_GetOperator( token ); 
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 ClientScript_GetOperator
CALLI4
ASGNI4
ADDRLP4 516
ADDRLP4 1056
INDIRI4
ASGNI4
line 1409
;1408:
;1409:	token = ClientScript_NextToken();
ADDRLP4 1060
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1060
INDIRP4
ASGNP4
line 1411
;1410:
;1411:	if (!token) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $670
line 1412
;1412:		return; 
ADDRGP4 $667
JUMPV
LABELV $670
line 1415
;1413:	
;1414: 	// get the string we want to compare 
;1415:	ClientScript_GetValue( value, token, qtrue );  // convert cvars without $, too
ADDRLP4 784
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1416
;1416: 	ClientScript_GetCommand( cmd );  
ADDRLP4 4
ARGP4
ADDRGP4 ClientScript_GetCommand
CALLV
pop
line 1417
;1417:	strcat( cmd, ";");
ADDRLP4 4
ARGP4
ADDRGP4 $126
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1419
;1418:
;1419:	token = ClientScript_NextToken();
ADDRLP4 1064
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1064
INDIRP4
ASGNP4
line 1421
;1420:
;1421:	if ( token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $672
line 1422
;1422:	{
line 1425
;1423:		char	temp[256];
;1424:
;1425:		ClientScript_GetValue( temp, token, qtrue ); // convert cvars without $ too
ADDRLP4 1068
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1426
;1426:		sleep = atoi( temp );
ADDRLP4 1068
ARGP4
ADDRLP4 1324
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 524
ADDRLP4 1324
INDIRI4
ASGNI4
line 1428
;1427:
;1428:		token = ClientScript_NextToken();
ADDRLP4 1328
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1328
INDIRP4
ASGNP4
line 1429
;1429:		ClientScript_GetValue( temp, token, qtrue );
ADDRLP4 1068
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1430
;1430:		age = atoi( temp ); 
ADDRLP4 1068
ARGP4
ADDRLP4 1332
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 1332
INDIRI4
ASGNI4
line 1431
;1431:	}	
LABELV $672
line 1434
;1432:
;1433:	// get the current CVARs variable into a buffer  
;1434:	AddScriptLoop( cvar, cmd, function, atof( value ), sleep, age );  
ADDRLP4 784
ARGP4
ADDRLP4 1068
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 528
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 516
INDIRI4
ARGI4
ADDRLP4 1068
INDIRF4
ARGF4
ADDRLP4 524
INDIRI4
ARGI4
ADDRLP4 520
INDIRI4
ARGI4
ADDRGP4 AddScriptLoop
CALLV
pop
line 1435
;1435:}
LABELV $667
endproc ClientScript_WhileLoop 1336 24
export ClientScript_CopyVariable
proc ClientScript_CopyVariable 780 12
line 1449
;1436:
;1437:/*
;1438:===================
;1439:Client Script
;1440:	Copy
;1441:
;1442:Parses the copy function from a string.
;1443:
;1444:format:
;1445:	copy <cvar_in> <cvar_out>
;1446:===================
;1447:*/
;1448:void ClientScript_CopyVariable( void )
;1449:{
line 1457
;1450:	const	char	*token; // a pointer
;1451:	char	cvarIn[256]; // the cvar i parse from the big string
;1452:	char	value[256];  // the value i parse from the big string
;1453:	char	cvarOut[256]; // the cvar buffer i use to compare to
;1454:
;1455: 
;1456:	/* Get next token: */
;1457:	token = ClientScript_NextToken();
ADDRLP4 772
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 772
INDIRP4
ASGNP4
line 1458
;1458:	if (!token) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $675
line 1459
;1459:	{
line 1460
;1460:		NSSL_Printf( "Wrong syntax: missing variable\n", token );
ADDRGP4 $677
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1461
;1461:		return;
ADDRGP4 $674
JUMPV
LABELV $675
line 1464
;1462:	}
;1463:	// get the valueparameter
;1464:	strcpy( cvarIn, token );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1467
;1465:
;1466:	/* Get next token: */
;1467:	token = ClientScript_NextToken();
ADDRLP4 776
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 776
INDIRP4
ASGNP4
line 1468
;1468:	if (!token) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $678
line 1469
;1469:	{
line 1470
;1470:		NSSL_Printf( "Wrong syntax: missing variable\n", token );
ADDRGP4 $677
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1471
;1471:		return;
ADDRGP4 $674
JUMPV
LABELV $678
line 1474
;1472:	}
;1473:	// get the cvar
;1474:	strcpy( cvarOut, token );
ADDRLP4 260
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1477
;1475:
;1476:	// get the value from parameter
;1477:	ClientScript_GetValue( value, cvarIn, qtrue ); 
ADDRLP4 516
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1480
;1478:
;1479:	// and set it on our output cvar
;1480:	trap_Cvar_Set( cvarOut, value );
ADDRLP4 260
ARGP4
ADDRLP4 516
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1482
;1481:
;1482:	if ( nssl_debug.value == 1 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1065353216
NEF4 $680
line 1483
;1483:		NSSL_Printf( "Copy Cvar %s to %s\n", cvarIn, cvarOut );
ADDRGP4 $683
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 260
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $680
line 1484
;1484:}
LABELV $674
endproc ClientScript_CopyVariable 780 12
export ClientScript_Set
proc ClientScript_Set 520 12
line 1497
;1485:
;1486:/*
;1487:===================
;1488:Client Script
;1489:	Set
;1490: 
;1491:
;1492:format:
;1493:	vset <cvar_in> { <string> }
;1494:===================
;1495:*/
;1496:void ClientScript_Set( void )
;1497:{
line 1504
;1498:	const	char	*token; // a pointer
;1499:	char	cvar[256]; // the cvar i parse from the big string
;1500:	char	value[256];  // the value i parse from the big string
;1501: 
;1502: 
;1503:	/* Get next token: */
;1504:	token = ClientScript_NextToken();
ADDRLP4 516
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 516
INDIRP4
ASGNP4
line 1505
;1505:	if (!token) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $685
line 1506
;1506:	{
line 1507
;1507:		NSSL_Printf( "Wrong syntax: missing variable\n", token );
ADDRGP4 $677
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1508
;1508:		return;
ADDRGP4 $684
JUMPV
LABELV $685
line 1511
;1509:	}
;1510:	// get the valueparameter
;1511:	ClientScript_GetValue( cvar, token, qfalse ); // do not automatically pickup cvars
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1514
;1512: 
;1513:	// get the cvar
;1514:	ClientScript_GetCommand( value );
ADDRLP4 260
ARGP4
ADDRGP4 ClientScript_GetCommand
CALLV
pop
line 1517
;1515: 
;1516:	// and set it on our output cvar
;1517:	trap_Cvar_Set( cvar, value );
ADDRLP4 4
ARGP4
ADDRLP4 260
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1519
;1518:
;1519:	if ( nssl_debug.value == 1 )
ADDRGP4 nssl_debug+8
INDIRF4
CNSTF4 1065353216
NEF4 $687
line 1520
;1520:		NSSL_Printf( "Set Cvar %s to %s\n", cvar, value );
ADDRGP4 $690
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 260
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $687
line 1521
;1521:}
LABELV $684
endproc ClientScript_Set 520 12
export ClientScript_SwitchStatement
proc ClientScript_SwitchStatement 17188 12
line 1540
;1522:
;1523:/*
;1524:===================
;1525:Client Script
;1526:	Switch
;1527:
;1528:Parses the switch parameter from a string.
;1529:can be multiple <value/string>{} combinations
;1530:
;1531:format:
;1532:	switch <cvar> <value/string> { ... } else { ... }
;1533:
;1534:	== can also be !=,<=,>=,<,>
;1535:===================
;1536:*/
;1537:#define MAX_SWITCH_VALUES	32
;1538:
;1539:void ClientScript_SwitchStatement( void )
;1540:{
line 1544
;1541:	const	char	*token; // a pointer
;1542:	char	cvar[256]; // the cvar i parse from the big string
;1543:	char	value[MAX_SWITCH_VALUES][256];  // the value i parse from the big string
;1544:	int		numValue = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1547
;1545:	char	cmd[MAX_SWITCH_VALUES][256]; // the command that has to be executed
;1546:	char	cvarResult[256]; // the cvar buffer i use to compare to
;1547:	int		openSubs = 0; // amount of open { } there are
ADDRLP4 16912
CNSTI4 0
ASGNI4
line 1549
;1548:	char	elseCmd[256];
;1549:	qboolean	useElse = qfalse;
ADDRLP4 16652
CNSTI4 0
ASGNI4
line 1553
;1550:	int		i;
;1551:  
;1552:	/* Get next token: */
;1553:	token = ClientScript_NextToken();
ADDRLP4 17172
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 17172
INDIRP4
ASGNP4
line 1554
;1554:	if (!token) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $692
line 1555
;1555:	{
line 1556
;1556:		NSSL_Printf( "Wrong syntax: missing variable\n", token );
ADDRGP4 $677
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1557
;1557:		return;
ADDRGP4 $691
JUMPV
LABELV $692
line 1561
;1558:	}
;1559:
;1560:	// get the cvar
;1561:	strcpy( cvar, token );
ADDRLP4 16656
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $695
JUMPV
LABELV $694
line 1565
;1562: 
;1563:	// parses <value> { <command }
;1564:	while ( token )
;1565:		{
line 1567
;1566:			// first value
;1567:			token = ClientScript_NextToken();
ADDRLP4 17176
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 17176
INDIRP4
ASGNP4
line 1569
;1568:
;1569:			if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $697
line 1570
;1570:				break; 
ADDRGP4 $696
JUMPV
LABELV $697
line 1572
;1571:
;1572:			if ( !Q_stricmp( token, "else") )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $701
ARGP4
ADDRLP4 17180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 17180
INDIRI4
CNSTI4 0
NEI4 $699
line 1573
;1573:			{
line 1574
;1574:				useElse = qtrue;
ADDRLP4 16652
CNSTI4 1
ASGNI4
line 1575
;1575:				break;
ADDRGP4 $696
JUMPV
LABELV $699
line 1578
;1576:			}
;1577:			
;1578:			ClientScript_GetValue( value[numValue], token, qtrue );
ADDRLP4 8
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1579
;1579:			ClientScript_GetCommand( cmd[numValue] ); 
ADDRLP4 8
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 8460
ADDP4
ARGP4
ADDRGP4 ClientScript_GetCommand
CALLV
pop
line 1581
;1580:
;1581:			numValue++; 
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1582
;1582:		}
LABELV $695
line 1564
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $694
LABELV $696
line 1584
;1583:
;1584:	if ( useElse )
ADDRLP4 16652
INDIRI4
CNSTI4 0
EQI4 $702
line 1585
;1585:		ClientScript_GetCommand( elseCmd );  
ADDRLP4 16916
ARGP4
ADDRGP4 ClientScript_GetCommand
CALLV
pop
LABELV $702
line 1588
;1586:
;1587:	// get the current CVARs variable into a buffer
;1588:	ClientScript_GetValue( cvarResult, cvar, qtrue );
ADDRLP4 8204
ARGP4
ADDRLP4 16656
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1590
;1589: 
;1590:	for ( i = 0; i < numValue; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $707
JUMPV
LABELV $704
line 1591
;1591:	{
line 1593
;1592:		// compare it
;1593:		if (Q_stricmp( cvarResult, value[i] ) != 0 && 
ADDRLP4 8204
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 12
ADDP4
ARGP4
ADDRLP4 17176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 17176
INDIRI4
CNSTI4 0
EQI4 $708
ADDRLP4 8204
ARGP4
ADDRLP4 17180
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 12
ADDP4
ARGP4
ADDRLP4 17184
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 17180
INDIRF4
ADDRLP4 17184
INDIRF4
EQF4 $708
line 1595
;1594:			atof( cvarResult ) != atof( value[i] ) )			
;1595: 			continue; // it is not the same	 
ADDRGP4 $705
JUMPV
LABELV $708
line 1598
;1596:
;1597:		// cvar is the same so execute the text
;1598:		ClientScript_ExecText( cmd[i] );
ADDRLP4 4
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 8460
ADDP4
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
line 1599
;1599:		return;
ADDRGP4 $691
JUMPV
LABELV $705
line 1590
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $707
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $704
line 1601
;1600:	}
;1601:	if ( useElse )
ADDRLP4 16652
INDIRI4
CNSTI4 0
EQI4 $710
line 1602
;1602:		ClientScript_ExecText( elseCmd ); 
ADDRLP4 16916
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
LABELV $710
line 1603
;1603:}
LABELV $691
endproc ClientScript_SwitchStatement 17188 12
export ClientScript_LogicOperation
proc ClientScript_LogicOperation 584 16
line 1606
;1604:
;1605:qboolean ClientScript_LogicOperation( void )
;1606:{
line 1610
;1607:	const char *token; 
;1608:	char	value1[256];
;1609:	char	value2[256];
;1610:	int	result = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1611
;1611:	int numOperators = 1;
ADDRLP4 520
CNSTI4 1
ASGNI4
line 1613
;1612:	int function;
;1613:	int openSub = 0;
ADDRLP4 528
CNSTI4 0
ASGNI4
LABELV $713
line 1617
;1614: 
;1615:logic_operation:
;1616:	// get first value
;1617:	token = ClientScript_NextToken();
ADDRLP4 532
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 532
INDIRP4
ASGNP4
line 1618
;1618:	if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $714
line 1619
;1619:		NSSL_Printf( "Wrong Syntax: Missing value/cvar/string\n" );
ADDRGP4 $716
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1620
;1620:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $712
JUMPV
LABELV $714
line 1623
;1621:	}
;1622:
;1623:	if ( !Q_stricmp( token, "(" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $719
ARGP4
ADDRLP4 536
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $717
line 1624
;1624:		token = ClientScript_NextToken();
ADDRLP4 540
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 540
INDIRP4
ASGNP4
line 1625
;1625:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $720
line 1626
;1626:			NSSL_Printf( "Wrong Syntax: Missing value/cvar/string\n" );
ADDRGP4 $716
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1627
;1627:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $712
JUMPV
LABELV $720
line 1631
;1628:		}
;1629:		
;1630:		// sounds nested...
;1631:		if ( !Q_stricmp( token, "(" ) ) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $719
ARGP4
ADDRLP4 544
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 544
INDIRI4
CNSTI4 0
NEI4 $722
line 1632
;1632:		{
line 1633
;1633:			ClientScript_PrevToken(); // do the nested fucntion
ADDRGP4 ClientScript_PrevToken
CALLP4
pop
line 1634
;1634:			result += ClientScript_LogicOperation(); 
ADDRLP4 548
ADDRGP4 ClientScript_LogicOperation
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 548
INDIRI4
ADDI4
ASGNI4
line 1636
;1635:
;1636:goto finish_operation; // drop to finish the operation, because the next symbol should be a && or a ||
ADDRGP4 $724
JUMPV
LABELV $722
line 1642
;1637:						
;1638:			//                          || 0 == 0 
;1639:			//  (           && 1 == 1 )
;1640:			//   ( a == 1 )
;1641:		}
;1642:	}
LABELV $717
line 1644
;1643:
;1644:	ClientScript_GetValue( value1, token, qtrue );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1647
;1645:
;1646:	// get operator
;1647:	token = ClientScript_NextToken();
ADDRLP4 540
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 540
INDIRP4
ASGNP4
line 1648
;1648:	if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $725
line 1649
;1649:		NSSL_Printf( "Wrong Syntax: Missing operator\n" );
ADDRGP4 $727
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1650
;1650:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $712
JUMPV
LABELV $725
line 1652
;1651:	}
;1652:	function = ClientScript_GetOperator( token ); 
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 544
ADDRGP4 ClientScript_GetOperator
CALLI4
ASGNI4
ADDRLP4 524
ADDRLP4 544
INDIRI4
ASGNI4
line 1655
;1653:
;1654:	// get second value
;1655:	token = ClientScript_NextToken();
ADDRLP4 548
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 548
INDIRP4
ASGNP4
line 1656
;1656:	if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $728
line 1657
;1657:		NSSL_Printf( "Wrong Syntax: Missing value after: %s\n", ClientScript_PrevToken() );
ADDRLP4 552
ADDRGP4 ClientScript_PrevToken
CALLP4
ASGNP4
ADDRGP4 $730
ARGP4
ADDRLP4 552
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1658
;1658:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $712
JUMPV
LABELV $728
line 1662
;1659:	}
;1660:
;1661:	// remove the ) if there is one at the end of the value  
;1662:	ClientScript_GetValue( value2, token, qtrue );
ADDRLP4 264
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientScript_GetValue
CALLV
pop
line 1664
;1663: 
;1664:	if ( nssl_debug.integer )
ADDRGP4 nssl_debug+12
INDIRI4
CNSTI4 0
EQI4 $731
line 1665
;1665:		NSSL_Printf("Logic Operation: %s with %i on %s\n", value1,function,value2);
ADDRGP4 $734
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 524
INDIRI4
ARGI4
ADDRLP4 264
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $731
line 1668
;1666:
;1667:	// operate on it
;1668:	result += ClientScript_Operate( value1, function, value2 );
ADDRLP4 8
ARGP4
ADDRLP4 524
INDIRI4
ARGI4
ADDRLP4 264
ARGP4
ADDRLP4 552
ADDRGP4 ClientScript_Operate
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 552
INDIRI4
ADDI4
ASGNI4
LABELV $724
line 1670
;1669:finish_operation:
;1670: 	token = ClientScript_NextToken();  
ADDRLP4 556
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 556
INDIRP4
ASGNP4
line 1671
;1671:	if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $735
line 1672
;1672:		NSSL_Printf( "Wrong Syntax: Missing 'then' after %s\n", ClientScript_PrevToken() );
ADDRLP4 560
ADDRGP4 ClientScript_PrevToken
CALLP4
ASGNP4
ADDRGP4 $737
ARGP4
ADDRLP4 560
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1673
;1673:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $712
JUMPV
LABELV $735
line 1676
;1674:	}
;1675:   
;1676:	if ( !Q_stricmp( token, "&&" ) || 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $740
ARGP4
ADDRLP4 560
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 560
INDIRI4
CNSTI4 0
EQI4 $742
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $741
ARGP4
ADDRLP4 564
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 564
INDIRI4
CNSTI4 0
NEI4 $738
LABELV $742
line 1678
;1677:		!Q_stricmp( token, "||" ) ) 
;1678:	{   
line 1679
;1679:		if ( !Q_stricmp( token, "&&" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $740
ARGP4
ADDRLP4 568
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 568
INDIRI4
CNSTI4 0
NEI4 $743
line 1680
;1680:			numOperators++;		  
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $743
line 1684
;1681:		//
;1682:		// check for a nested function
;1683:		//
;1684:		token = ClientScript_NextToken();
ADDRLP4 572
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 572
INDIRP4
ASGNP4
line 1686
;1685:
;1686:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $745
line 1687
;1687:			NSSL_Printf( "Wrong Syntax: Missing TYPE after %s\n", ClientScript_PrevToken() );
ADDRLP4 576
ADDRGP4 ClientScript_PrevToken
CALLP4
ASGNP4
ADDRGP4 $747
ARGP4
ADDRLP4 576
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1688
;1688:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $712
JUMPV
LABELV $745
line 1691
;1689:		}
;1690:
;1691:		if ( nssl_debug.integer )
ADDRGP4 nssl_debug+12
INDIRI4
CNSTI4 0
EQI4 $748
line 1692
;1692:			NSSL_Printf("Logic Operation: && or || token %s\n",  token );
ADDRGP4 $751
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
LABELV $748
line 1694
;1693:
;1694:		if ( !Q_stricmp( token, "(" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $719
ARGP4
ADDRLP4 576
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 576
INDIRI4
CNSTI4 0
NEI4 $752
line 1695
;1695:		{
line 1696
;1696:			ClientScript_PrevToken();
ADDRGP4 ClientScript_PrevToken
CALLP4
pop
line 1697
;1697:			result += ClientScript_LogicOperation();
ADDRLP4 580
ADDRGP4 ClientScript_LogicOperation
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 580
INDIRI4
ADDI4
ASGNI4
line 1699
;1698:    
;1699:			goto finish_operation;
ADDRGP4 $724
JUMPV
LABELV $752
line 1701
;1700:		} else // go back one token so we can properly continue parsing
;1701:			ClientScript_PrevToken();
ADDRGP4 ClientScript_PrevToken
CALLP4
pop
line 1703
;1702:
;1703:		goto logic_operation; 
ADDRGP4 $713
JUMPV
LABELV $738
line 1705
;1704:	}
;1705:	else if ( !Q_stricmp(token, ")" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $756
ARGP4
ADDRLP4 568
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 568
INDIRI4
CNSTI4 0
NEI4 $754
line 1706
;1706:		return (result >= numOperators);
ADDRLP4 4
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $758
ADDRLP4 572
CNSTI4 1
ASGNI4
ADDRGP4 $759
JUMPV
LABELV $758
ADDRLP4 572
CNSTI4 0
ASGNI4
LABELV $759
ADDRLP4 572
INDIRI4
RETI4
ADDRGP4 $712
JUMPV
LABELV $754
line 1708
;1707:	}
;1708:	else {  
line 1710
;1709:		// go back one token so we can properly continue parsing
;1710:		ClientScript_PrevToken();
ADDRGP4 ClientScript_PrevToken
CALLP4
pop
line 1711
;1711:	}
line 1713
;1712:
;1713:	return (result >= numOperators);
ADDRLP4 4
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $761
ADDRLP4 572
CNSTI4 1
ASGNI4
ADDRGP4 $762
JUMPV
LABELV $761
ADDRLP4 572
CNSTI4 0
ASGNI4
LABELV $762
ADDRLP4 572
INDIRI4
RETI4
LABELV $712
endproc ClientScript_LogicOperation 584 16
export ClientScript_ParseIfClause
proc ClientScript_ParseIfClause 1056 8
line 1728
;1714:}
;1715:/*
;1716:===================
;1717:Client Script
;1718:	Parse If Clause
;1719:
;1720:Parses the ifclause parameter from a string
;1721:format:
;1722:	if <cvar> == <value/string> then { ... } else { ... }
;1723:
;1724:	== can also be !=,<=,>=,<,>
;1725:===================
;1726:*/ 
;1727:void ClientScript_ParseIfClause( void )
;1728:{
LABELV $764
line 1736
;1729:	const	char	*token; // a pointer
;1730: 	char	cmd[512]; // the command that has to be executed
;1731:	char	elseCmd[512]; // the command that has to be executed when !=
;1732:	int result;
;1733:	// parse the logic operation
;1734:	//   ( $g_gametype == 1 )
;1735:if_clause:
;1736:	result = ClientScript_LogicOperation( );
ADDRLP4 1032
ADDRGP4 ClientScript_LogicOperation
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1032
INDIRI4
ASGNI4
line 1739
;1737:
;1738:	// look for the 'then' and go back if it was not there
;1739:	token = ClientScript_NextToken();
ADDRLP4 1036
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 1740
;1740:	if ( Q_stricmp( token, "then" ) != 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $767
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $765
line 1741
;1741:		ClientScript_PrevToken();
ADDRGP4 ClientScript_PrevToken
CALLP4
pop
LABELV $765
line 1743
;1742:
;1743:	ClientScript_GetCommand( cmd );
ADDRLP4 8
ARGP4
ADDRGP4 ClientScript_GetCommand
CALLV
pop
line 1747
;1744:	
;1745:	// if it's okay we don't even need to go further
;1746:	// just exec the text and leave
;1747:	if ( result )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $768
line 1748
;1748:	{
line 1749
;1749:		ClientScript_ExecText( cmd );
ADDRLP4 8
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
line 1750
;1750:		return;
ADDRGP4 $763
JUMPV
LABELV $768
line 1754
;1751:	}
;1752:
;1753:	// see if somebody wants an else if
;1754:	if ( result == 0 ) 
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $770
line 1755
;1755:	{
line 1756
;1756:		token = ClientScript_NextToken();
ADDRLP4 1044
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1044
INDIRP4
ASGNP4
line 1757
;1757:		if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $772
line 1758
;1758:			return;
ADDRGP4 $763
JUMPV
LABELV $772
line 1760
;1759:
;1760:		if ( !Q_stricmp( token, "elseif" )  )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $776
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $774
line 1761
;1761:			goto if_clause; // handle if
ADDRGP4 $764
JUMPV
LABELV $774
line 1763
;1762:		else
;1763:			ClientScript_PrevToken(); // go back cos somethng is there but no if
ADDRGP4 ClientScript_PrevToken
CALLP4
pop
line 1764
;1764:	}
LABELV $770
line 1767
;1765:		  
;1766:	// see if there is an else statement given
;1767:	token = ClientScript_NextToken();   
ADDRLP4 1044
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1044
INDIRP4
ASGNP4
line 1768
;1768:	if ( token && !Q_stricmp( token, "else" ) ) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $777
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $701
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $777
line 1769
;1769:	{
line 1770
;1770:		ClientScript_GetCommand( elseCmd );  
ADDRLP4 520
ARGP4
ADDRGP4 ClientScript_GetCommand
CALLV
pop
line 1771
;1771:		ClientScript_ExecText( elseCmd );  
ADDRLP4 520
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
line 1772
;1772:	}
LABELV $777
line 1773
;1773:}
LABELV $763
endproc ClientScript_ParseIfClause 1056 8
export ClientScript_Exec
proc ClientScript_Exec 516 4
line 1776
;1774:
;1775:void ClientScript_Exec( void )
;1776:{
line 1779
;1777:	char cmd[512];
;1778: 
;1779:	ClientScript_GetCommand( cmd ); 
ADDRLP4 0
ARGP4
ADDRGP4 ClientScript_GetCommand
CALLV
pop
line 1781
;1780:
;1781:	if ( strlen ( cmd ) > 0 )
ADDRLP4 0
ARGP4
ADDRLP4 512
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 512
INDIRI4
CNSTI4 0
LEI4 $780
line 1782
;1782:		ClientScript_ExecText( cmd );
ADDRLP4 0
ARGP4
ADDRGP4 ClientScript_ExecText
CALLV
pop
LABELV $780
line 1783
;1783:}
LABELV $779
endproc ClientScript_Exec 516 4
data
align 4
LABELV csParams
address $783
address ClientScript_Modify
address $784
address $785
address ClientScript_ParseIfClause
address $786
address $787
address ClientScript_SwitchStatement
address $788
address $789
address ClientScript_WhileLoop
address $790
address $791
address ClientScript_CopyVariable
address $792
address $793
address ClientScript_Exec
address $794
address $795
address ClientScript_AddGfx
address $796
address $797
address ClientScript_DeleteGfxGroup
address $798
address $799
address ClientScript_DeleteGfxGroup
address $800
address $801
address ClientScript_AddString
address $802
address $803
address ClientScript_DeleteGfxGroup
address $804
address $805
address ClientScript_Set
address $806
address $807
byte 4 0
address $808
address $809
byte 4 0
address $810
address $811
byte 4 0
address $812
address $813
byte 4 0
address $814
address $815
address ClientScript_Help_f
address $816
export ClientScript_Help_f
code
proc ClientScript_Help_f 16 12
line 1822
;1784:  
;1785:/*
;1786:===================
;1787:Client Script
;1788:
;1789:Execute a clientside scripting command
;1790:===================
;1791:*/
;1792:typedef struct {
;1793:	char	*param;
;1794:	void	(*function)(void);
;1795:	char	*usage;
;1796:} clientScriptParam_t;
;1797:
;1798:static clientScriptParam_t	csParams[] = {
;1799:	{ "modify", ClientScript_Modify,			"modify <IN> <$CVAR/VALUE>" },
;1800:	{ "if",		ClientScript_ParseIfClause,		"if <CVAR> ==,!=,<=,>=,=|,& <$CVAR/VALUE/STRING> then { <CMD> } else { <CMD> }" },
;1801:	{ "switch", ClientScript_SwitchStatement,	"switch <CVAR> <$CVAR/STRING/VALUE> { <CMD> } <STRING/VALUE> { <CMD> } else { <CMD> }" },
;1802:	{ "while",	ClientScript_WhileLoop,			"while <CVAR> ==,!=,<>= <$CVAR/VALUE> then { <CMD> } <SLEEP> <AGE> *** AGE -1 = unlimited" },
;1803:	{ "copy",	ClientScript_CopyVariable,		"copy <IN> <OUT>" },
;1804:	{ "exec",	ClientScript_Exec,				"exec { <CMD> }" },
;1805:	{ "addgfx", ClientScript_AddGfx,			"addgfx <GROUP> <X> <Y> <W> <H> <R> <G> <B> <A> (optional: <IMAGE>)// adds an item to a gfx group" },
;1806:	{ "delgroup", ClientScript_DeleteGfxGroup,	"delgroup <GROUP> // deletes a gfx group" },
;1807:	{ "delgfx", ClientScript_DeleteGfxGroup,	"delgfx <GROUP> // deletes a gfx group" },
;1808:	{ "addstring", ClientScript_AddString,		"addstring <GROUP> { <text> } <X> <Y> <SCALE> <TYPE> <R> <G> <B> <A> // adds a sting item to a gfx group" },
;1809:	{ "delstring", ClientScript_DeleteGfxGroup,	"delstring <GROUP> // deletes a gfx group" },
;1810:	{ "vset",	ClientScript_Set ,				"vset <CVAR> { <STRING> } // sets a cvar" },
;1811:
;1812:	// q3a hardcoded
;1813:	{ "vstr",	0 ,	"vstr <FUNCTIONNAME/CVAR> *** Execute a function" },
;1814:	{ "set",	0 ,	"set <CVAR> <STRING/VALUE> *** there is also a NSSL command called vset" },
;1815:	{ "seta",	0 ,	"seta <CVAR> <STRING/VALUE> *** Cvar will be saved" },
;1816:	{ "+alias",	0 ,	"+alias <CVAR>  *** useful when binding a key to a command" },
;1817:	// misc help
;1818:	{ "help",	ClientScript_Help_f, "Type 'nssl help' to get a help, you can also type 'nssl help <cmd>' to get information about <cmd>." },
;1819:};
;1820:
;1821:void ClientScript_Help_f (  )
;1822:{ 
line 1823
;1823:	const char *token = ClientScript_NextToken( );
ADDRLP4 8
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1826
;1824:	int i;
;1825:   
;1826:	if ( token )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $818
line 1827
;1827:	{  
line 1828
;1828:		for ( i = 0 ; i < sizeof( csParams ) / sizeof( csParams[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $823
JUMPV
LABELV $820
line 1829
;1829:			if ( !Q_stricmp( token, csParams[i].param ) ) {
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 csParams
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $824
line 1830
;1830:				NSSL_Printf( "Help for %s: %s\n", token, csParams[i].usage );
ADDRGP4 $826
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 csParams+8
ADDP4
INDIRP4
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1831
;1831:				return;
ADDRGP4 $817
JUMPV
LABELV $824
line 1833
;1832:			}
;1833:		} 
LABELV $821
line 1828
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $823
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 17
LTU4 $820
line 1834
;1834:	}  
LABELV $818
line 1836
;1835:
;1836:	CG_Printf( "^2NSSL: Enviroment Help^7 ( "S_COLOR_RED""NSSL_VERSION""S_COLOR_WHITE" )\n" );
ADDRGP4 $828
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1837
;1837:	CG_Printf( "-[^3cmd^7]-------[^3usage^7]----------------------------\n" );
ADDRGP4 $829
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1838
;1838:	for ( i = 0 ; i < sizeof( csParams ) / sizeof( csParams[0] ) ; i++ ) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $833
JUMPV
LABELV $830
line 1839
;1839:		CG_Printf("[^3%s^7]\n  %s\n", csParams[i].param, csParams[i].usage );		
ADDRGP4 $834
ARGP4
ADDRLP4 12
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 csParams
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRGP4 csParams+8
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1840
;1840:	}
LABELV $831
line 1838
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $833
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 17
LTU4 $830
line 1841
;1841:	CG_Printf("Insert a '$' infront of a cvar within the NSSL enviroment to evaluate a cvar into a value.\n" );
ADDRGP4 $836
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1842
;1842:	CG_Printf("Type '*<type>' to insert clientinformation as a value.\n" );
ADDRGP4 $837
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1843
;1843:	CG_Printf("Type '%<variable>,<match>' to parse a variable out of a string (.*)\n" );
ADDRGP4 $838
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1845
;1844:
;1845:	CG_Printf( "-[^3cmd^7]-------[^3usage^7]----------------------------\n" );
ADDRGP4 $829
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1846
;1846:}
LABELV $817
endproc ClientScript_Help_f 16 12
export CG_ClientScript_f
proc CG_ClientScript_f 16 8
line 1850
;1847:
;1848:// we could also parse any other buffer if we use trap_Args to tokenize it
;1849:void CG_ClientScript_f ( void )
;1850:{
line 1854
;1851: 	const	char	*token;
;1852:	int		i;
;1853:
;1854:	if ( nssl_init.integer < 1 ) {
ADDRGP4 nssl_init+12
INDIRI4
CNSTI4 1
GEI4 $840
line 1855
;1855:		NSSL_Printf( "NSSL is disabled.\n");
ADDRGP4 $843
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1856
;1856:		return;
ADDRGP4 $839
JUMPV
LABELV $840
line 1859
;1857:	}
;1858:
;1859:	cur_token = 0; 
ADDRGP4 cur_token
CNSTI4 0
ASGNI4
line 1860
;1860:	token = ClientScript_NextToken( );
ADDRLP4 8
ADDRGP4 ClientScript_NextToken
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1862
;1861:
;1862:	for ( i = 0 ; i < sizeof( csParams ) / sizeof( csParams[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $847
JUMPV
LABELV $844
line 1863
;1863:		if ( !Q_stricmp( token, csParams[i].param ) &&
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 csParams
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $848
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 csParams+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $848
line 1864
;1864:			csParams[i].function != NULL ) {
line 1865
;1865:			csParams[i].function();  
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 csParams+4
ADDP4
INDIRP4
CALLV
pop
line 1866
;1866:			return;
ADDRGP4 $839
JUMPV
LABELV $848
line 1868
;1867:		}
;1868:	} 
LABELV $845
line 1862
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $847
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 17
LTU4 $844
line 1870
;1869:
;1870:	NSSL_Printf("Type '/NSSL help' for help\n");
ADDRGP4 $852
ARGP4
ADDRGP4 NSSL_Printf
CALLV
pop
line 1871
;1871:}
LABELV $839
endproc CG_ClientScript_f 16 8
export ClientScript_Update
proc ClientScript_Update 4 4
line 1876
;1872:
;1873:
;1874:// needed to be called once a frame
;1875:void ClientScript_Update( void )
;1876:{
line 1877
;1877:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1881
;1878:
;1879:	
;1880:	// update cvars
;1881:	trap_Cvar_Update( &nssl_debug );
ADDRGP4 nssl_debug
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1882
;1882:	trap_Cvar_Update( &nssl_init );
ADDRGP4 nssl_init
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1884
;1883:
;1884:	for (i=0;i<MAX_SCRIPT_PROCESS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $854
line 1885
;1885:	{
line 1886
;1886:		if ( !scriptLoopTable[i].inuse )
CNSTI4 792
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptLoopTable+788
ADDP4
INDIRI4
CNSTI4 0
NEI4 $858
line 1887
;1887:			continue; 
ADDRGP4 $855
JUMPV
LABELV $858
line 1889
;1888:
;1889: 		ClientScript_ProcessWhileLoop( i ); 
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientScript_ProcessWhileLoop
CALLV
pop
line 1890
;1890:	}
LABELV $855
line 1884
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $854
line 1892
;1891:
;1892:	for (i=0;i<MAX_SCRIPT_GFX;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $861
line 1893
;1893:	{
line 1894
;1894:		if ( !scriptGFXTable[i].inuse )
CNSTI4 432
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 scriptGFXTable+428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $865
line 1895
;1895:			continue; 
ADDRGP4 $862
JUMPV
LABELV $865
line 1897
;1896:
;1897: 		ClientScript_ProcessGFX( i ); 
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientScript_ProcessGFX
CALLV
pop
line 1898
;1898:	} 
LABELV $862
line 1892
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $861
line 1899
;1899:}
LABELV $853
endproc ClientScript_Update 4 4
bss
export scriptLoopTable
align 4
LABELV scriptLoopTable
skip 101376
export scriptGFXTable
align 4
LABELV scriptGFXTable
skip 55296
export nssl_init
align 4
LABELV nssl_init
skip 272
export nssl_debug
align 4
LABELV nssl_debug
skip 272
export cur_token
align 4
LABELV cur_token
skip 4
import regsub
import regexec
import regcomp
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
LABELV $852
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 39
byte 1 47
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 39
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $843
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $838
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 60
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 62
byte 1 44
byte 1 60
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 62
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 40
byte 1 46
byte 1 42
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $837
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 39
byte 1 42
byte 1 60
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 62
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $836
byte 1 73
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 39
byte 1 36
byte 1 39
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 114
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 32
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
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $834
byte 1 91
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 93
byte 1 10
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $829
byte 1 45
byte 1 91
byte 1 94
byte 1 51
byte 1 99
byte 1 109
byte 1 100
byte 1 94
byte 1 55
byte 1 93
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 91
byte 1 94
byte 1 51
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 94
byte 1 55
byte 1 93
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $828
byte 1 94
byte 1 50
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 72
byte 1 101
byte 1 108
byte 1 112
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 32
byte 1 94
byte 1 49
byte 1 49
byte 1 46
byte 1 51
byte 1 94
byte 1 55
byte 1 32
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $826
byte 1 72
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $816
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 39
byte 1 110
byte 1 115
byte 1 115
byte 1 108
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 44
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 39
byte 1 110
byte 1 115
byte 1 115
byte 1 108
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 60
byte 1 99
byte 1 109
byte 1 100
byte 1 62
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 98
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 60
byte 1 99
byte 1 109
byte 1 100
byte 1 62
byte 1 46
byte 1 0
align 1
LABELV $815
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 0
align 1
LABELV $814
byte 1 43
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 32
byte 1 60
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 62
byte 1 32
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 102
byte 1 117
byte 1 108
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 105
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $813
byte 1 43
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $812
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 60
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 62
byte 1 32
byte 1 60
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 47
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 62
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 32
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $811
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $810
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 60
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 62
byte 1 32
byte 1 60
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 47
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 62
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $809
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $808
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 60
byte 1 70
byte 1 85
byte 1 78
byte 1 67
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 47
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 62
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 32
byte 1 69
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $807
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 0
align 1
LABELV $806
byte 1 118
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 60
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 62
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 62
byte 1 32
byte 1 125
byte 1 32
byte 1 47
byte 1 47
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $805
byte 1 118
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $804
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 60
byte 1 71
byte 1 82
byte 1 79
byte 1 85
byte 1 80
byte 1 62
byte 1 32
byte 1 47
byte 1 47
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 103
byte 1 102
byte 1 120
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $803
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $802
byte 1 97
byte 1 100
byte 1 100
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 60
byte 1 71
byte 1 82
byte 1 79
byte 1 85
byte 1 80
byte 1 62
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 62
byte 1 32
byte 1 125
byte 1 32
byte 1 60
byte 1 88
byte 1 62
byte 1 32
byte 1 60
byte 1 89
byte 1 62
byte 1 32
byte 1 60
byte 1 83
byte 1 67
byte 1 65
byte 1 76
byte 1 69
byte 1 62
byte 1 32
byte 1 60
byte 1 84
byte 1 89
byte 1 80
byte 1 69
byte 1 62
byte 1 32
byte 1 60
byte 1 82
byte 1 62
byte 1 32
byte 1 60
byte 1 71
byte 1 62
byte 1 32
byte 1 60
byte 1 66
byte 1 62
byte 1 32
byte 1 60
byte 1 65
byte 1 62
byte 1 32
byte 1 47
byte 1 47
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 103
byte 1 102
byte 1 120
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $801
byte 1 97
byte 1 100
byte 1 100
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $800
byte 1 100
byte 1 101
byte 1 108
byte 1 103
byte 1 102
byte 1 120
byte 1 32
byte 1 60
byte 1 71
byte 1 82
byte 1 79
byte 1 85
byte 1 80
byte 1 62
byte 1 32
byte 1 47
byte 1 47
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 103
byte 1 102
byte 1 120
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $799
byte 1 100
byte 1 101
byte 1 108
byte 1 103
byte 1 102
byte 1 120
byte 1 0
align 1
LABELV $798
byte 1 100
byte 1 101
byte 1 108
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 32
byte 1 60
byte 1 71
byte 1 82
byte 1 79
byte 1 85
byte 1 80
byte 1 62
byte 1 32
byte 1 47
byte 1 47
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 103
byte 1 102
byte 1 120
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $797
byte 1 100
byte 1 101
byte 1 108
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $796
byte 1 97
byte 1 100
byte 1 100
byte 1 103
byte 1 102
byte 1 120
byte 1 32
byte 1 60
byte 1 71
byte 1 82
byte 1 79
byte 1 85
byte 1 80
byte 1 62
byte 1 32
byte 1 60
byte 1 88
byte 1 62
byte 1 32
byte 1 60
byte 1 89
byte 1 62
byte 1 32
byte 1 60
byte 1 87
byte 1 62
byte 1 32
byte 1 60
byte 1 72
byte 1 62
byte 1 32
byte 1 60
byte 1 82
byte 1 62
byte 1 32
byte 1 60
byte 1 71
byte 1 62
byte 1 32
byte 1 60
byte 1 66
byte 1 62
byte 1 32
byte 1 60
byte 1 65
byte 1 62
byte 1 32
byte 1 40
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 60
byte 1 73
byte 1 77
byte 1 65
byte 1 71
byte 1 69
byte 1 62
byte 1 41
byte 1 47
byte 1 47
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 103
byte 1 102
byte 1 120
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $795
byte 1 97
byte 1 100
byte 1 100
byte 1 103
byte 1 102
byte 1 120
byte 1 0
align 1
LABELV $794
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 67
byte 1 77
byte 1 68
byte 1 62
byte 1 32
byte 1 125
byte 1 0
align 1
LABELV $793
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $792
byte 1 99
byte 1 111
byte 1 112
byte 1 121
byte 1 32
byte 1 60
byte 1 73
byte 1 78
byte 1 62
byte 1 32
byte 1 60
byte 1 79
byte 1 85
byte 1 84
byte 1 62
byte 1 0
align 1
LABELV $791
byte 1 99
byte 1 111
byte 1 112
byte 1 121
byte 1 0
align 1
LABELV $790
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 60
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 62
byte 1 32
byte 1 61
byte 1 61
byte 1 44
byte 1 33
byte 1 61
byte 1 44
byte 1 60
byte 1 62
byte 1 61
byte 1 32
byte 1 60
byte 1 36
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 47
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 62
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 67
byte 1 77
byte 1 68
byte 1 62
byte 1 32
byte 1 125
byte 1 32
byte 1 60
byte 1 83
byte 1 76
byte 1 69
byte 1 69
byte 1 80
byte 1 62
byte 1 32
byte 1 60
byte 1 65
byte 1 71
byte 1 69
byte 1 62
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 32
byte 1 65
byte 1 71
byte 1 69
byte 1 32
byte 1 45
byte 1 49
byte 1 32
byte 1 61
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $789
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $788
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 60
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 62
byte 1 32
byte 1 60
byte 1 36
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 47
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 47
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 62
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 67
byte 1 77
byte 1 68
byte 1 62
byte 1 32
byte 1 125
byte 1 32
byte 1 60
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 47
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 62
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 67
byte 1 77
byte 1 68
byte 1 62
byte 1 32
byte 1 125
byte 1 32
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 67
byte 1 77
byte 1 68
byte 1 62
byte 1 32
byte 1 125
byte 1 0
align 1
LABELV $787
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $786
byte 1 105
byte 1 102
byte 1 32
byte 1 60
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 62
byte 1 32
byte 1 61
byte 1 61
byte 1 44
byte 1 33
byte 1 61
byte 1 44
byte 1 60
byte 1 61
byte 1 44
byte 1 62
byte 1 61
byte 1 44
byte 1 61
byte 1 124
byte 1 44
byte 1 38
byte 1 32
byte 1 60
byte 1 36
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 47
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 47
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 62
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 67
byte 1 77
byte 1 68
byte 1 62
byte 1 32
byte 1 125
byte 1 32
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 32
byte 1 123
byte 1 32
byte 1 60
byte 1 67
byte 1 77
byte 1 68
byte 1 62
byte 1 32
byte 1 125
byte 1 0
align 1
LABELV $785
byte 1 105
byte 1 102
byte 1 0
align 1
LABELV $784
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 60
byte 1 73
byte 1 78
byte 1 62
byte 1 32
byte 1 60
byte 1 36
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 47
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 62
byte 1 0
align 1
LABELV $783
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 0
align 1
LABELV $776
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 105
byte 1 102
byte 1 0
align 1
LABELV $767
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $756
byte 1 41
byte 1 0
align 1
LABELV $751
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 99
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
byte 1 58
byte 1 32
byte 1 38
byte 1 38
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 124
byte 1 124
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $747
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 89
byte 1 80
byte 1 69
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $741
byte 1 124
byte 1 124
byte 1 0
align 1
LABELV $740
byte 1 38
byte 1 38
byte 1 0
align 1
LABELV $737
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 39
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 39
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $734
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 99
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $730
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $727
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $719
byte 1 40
byte 1 0
align 1
LABELV $716
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 47
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 47
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $701
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $690
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $683
byte 1 67
byte 1 111
byte 1 112
byte 1 121
byte 1 32
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $677
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $625
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 40
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 45
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 41
byte 1 32
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $603
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 115
byte 1 108
byte 1 101
byte 1 101
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $552
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 33
byte 1 32
byte 1 71
byte 1 70
byte 1 88
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $548
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 69
byte 1 88
byte 1 84
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 114
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 103
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 98
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $532
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $528
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $517
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 119
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 114
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 103
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 98
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $503
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 39
byte 1 61
byte 1 61
byte 1 44
byte 1 33
byte 1 61
byte 1 44
byte 1 60
byte 1 44
byte 1 62
byte 1 44
byte 1 60
byte 1 61
byte 1 44
byte 1 62
byte 1 61
byte 1 44
byte 1 61
byte 1 124
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $499
byte 1 61
byte 1 124
byte 1 0
align 1
LABELV $496
byte 1 38
byte 1 0
align 1
LABELV $493
byte 1 62
byte 1 61
byte 1 0
align 1
LABELV $490
byte 1 60
byte 1 61
byte 1 0
align 1
LABELV $487
byte 1 62
byte 1 0
align 1
LABELV $484
byte 1 60
byte 1 0
align 1
LABELV $481
byte 1 33
byte 1 61
byte 1 0
align 1
LABELV $478
byte 1 61
byte 1 61
byte 1 0
align 1
LABELV $474
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $469
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 58
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $463
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 60
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 62
byte 1 32
byte 1 60
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $459
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 58
byte 1 32
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 123
byte 1 125
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $454
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $453
byte 1 32
byte 1 0
align 1
LABELV $437
byte 1 125
byte 1 0
align 1
LABELV $427
byte 1 123
byte 1 0
align 1
LABELV $423
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $418
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 39
byte 1 123
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $408
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 58
byte 1 32
byte 1 69
byte 1 118
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $397
byte 1 43
byte 1 0
align 1
LABELV $396
byte 1 45
byte 1 0
align 1
LABELV $370
byte 1 67
byte 1 97
byte 1 115
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $361
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $360
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 44
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $352
byte 1 60
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 62
byte 1 0
align 1
LABELV $351
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 89
byte 1 80
byte 1 69
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $339
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 77
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 99
byte 1 10
byte 1 0
align 1
LABELV $328
byte 1 0
align 1
LABELV $321
byte 1 85
byte 1 110
byte 1 107
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $320
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 77
byte 1 111
byte 1 114
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 90
byte 1 69
byte 1 82
byte 1 79
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $285
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $281
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $276
byte 1 112
byte 1 109
byte 1 95
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $271
byte 1 42
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 62
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 80
byte 1 69
byte 1 82
byte 1 83
byte 1 73
byte 1 83
byte 1 84
byte 1 65
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $264
byte 1 42
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 37
byte 1 115
byte 1 32
byte 1 62
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $257
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $251
byte 1 115
byte 1 116
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $245
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $240
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $235
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $230
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $223
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $218
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $204
byte 1 115
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
LABELV $197
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $194
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $193
byte 1 60
byte 1 63
byte 1 125
byte 1 0
align 1
LABELV $190
byte 1 103
byte 1 101
byte 1 116
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $187
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $182
byte 1 60
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 62
byte 1 0
align 1
LABELV $130
byte 1 69
byte 1 120
byte 1 101
byte 1 99
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $126
byte 1 59
byte 1 0
align 1
LABELV $112
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $105
byte 1 49
byte 1 0
align 1
LABELV $104
byte 1 110
byte 1 115
byte 1 115
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $103
byte 1 48
byte 1 0
align 1
LABELV $102
byte 1 110
byte 1 115
byte 1 115
byte 1 108
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $100
byte 1 94
byte 1 51
byte 1 78
byte 1 83
byte 1 83
byte 1 76
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
