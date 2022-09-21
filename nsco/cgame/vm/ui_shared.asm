data
align 4
LABELV captureFunc
byte 4 0
align 4
LABELV captureData
byte 4 0
align 4
LABELV itemCapture
byte 4 0
export DC
align 4
LABELV DC
byte 4 0
align 4
LABELV g_waitingForKey
byte 4 0
align 4
LABELV g_editingField
byte 4 0
align 4
LABELV g_bindItem
byte 4 0
align 4
LABELV g_editItem
byte 4 0
export menuCount
align 4
LABELV menuCount
byte 4 0
export openMenuCount
align 4
LABELV openMenuCount
byte 4 0
align 4
LABELV debugMode
byte 4 0
align 4
LABELV lastListBoxClickTime
byte 4 0
export UI_Alloc
code
proc UI_Alloc 8 4
file "../../ui/ui_shared.c"
line 75
;1:// 
;2:// string allocation/managment
;3:
;4:#ifdef CGAME
;5:	#include "../cgame/cg_local.h"
;6:#endif
;7:#include "ui_shared.h"
;8:
;9:#define SCROLL_TIME_START					500
;10:#define SCROLL_TIME_ADJUST				150
;11:#define SCROLL_TIME_ADJUSTOFFSET	40
;12:#define SCROLL_TIME_FLOOR					20
;13:
;14:typedef struct scrollInfo_s {
;15:	int nextScrollTime;
;16:	int nextAdjustTime;
;17:	int adjustValue;
;18:	int scrollKey;
;19:	float xStart;
;20:	float yStart;
;21:	itemDef_t *item;
;22:	qboolean scrollDir;
;23:} scrollInfo_t;
;24:
;25:static scrollInfo_t scrollInfo;
;26:
;27:static void (*captureFunc) (void *p) = NULL;
;28:static void *captureData = NULL;
;29:static itemDef_t *itemCapture = NULL;   // item that has the mouse captured ( if any )
;30:
;31:displayContextDef_t *DC = NULL;
;32:
;33:static qboolean g_waitingForKey = qfalse;
;34:static qboolean g_editingField = qfalse;
;35:
;36:static itemDef_t *g_bindItem = NULL;
;37:static itemDef_t *g_editItem = NULL;
;38:
;39:menuDef_t Menus[MAX_MENUS];      // defined menus
;40:int menuCount = 0;               // how many
;41:
;42:menuDef_t *menuStack[MAX_OPEN_MENUS];
;43:int openMenuCount = 0;
;44:
;45:static qboolean debugMode = qfalse;
;46:
;47:#define DOUBLE_CLICK_DELAY 300
;48:static int lastListBoxClickTime = 0;
;49:
;50:void Item_RunScript(itemDef_t *item, const char *s);
;51:void Item_SetupKeywordHash(void);
;52:void Menu_SetupKeywordHash(void);
;53:int BindingIDFromName(const char *name);
;54:qboolean Item_Bind_HandleKey(itemDef_t *item, int key, qboolean down);
;55:itemDef_t *Menu_SetPrevCursorItem(menuDef_t *menu);
;56:itemDef_t *Menu_SetNextCursorItem(menuDef_t *menu);
;57:static qboolean Menu_OverActiveItem(menuDef_t *menu, float x, float y);
;58:qboolean ItemParse_ownerParam( itemDef_t *item, int handle );
;59:
;60://#ifdef CGAME
;61://#define MEM_POOL_SIZE  128 * 1024
;62://#else
;63:#define MEM_POOL_SIZE  1024 * 1024
;64://#endif
;65:
;66:static char		memoryPool[MEM_POOL_SIZE];
;67:static int		allocPoint, outOfMemory;
;68:
;69:
;70:/*
;71:===============
;72:UI_Alloc
;73:===============
;74:*/				  
;75:void *UI_Alloc( int size ) {
line 78
;76:	char	*p; 
;77:
;78:	if ( allocPoint + size > MEM_POOL_SIZE ) {
ADDRGP4 allocPoint
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 1048576
LEI4 $94
line 79
;79:		outOfMemory = qtrue;
ADDRGP4 outOfMemory
CNSTI4 1
ASGNI4
line 80
;80:		if (DC->Print) {
ADDRGP4 DC
INDIRP4
CNSTI4 160
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $96
line 81
;81:			DC->Print("UI_Alloc: Failure. Out of memory!\n");
ADDRGP4 $98
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 160
ADDP4
INDIRP4
CALLV
pop
line 82
;82:		}
LABELV $96
line 84
;83:    //DC->trap_Print(S_COLOR_YELLOW"WARNING: UI Out of Memory!\n");
;84:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $93
JUMPV
LABELV $94
line 87
;85:	}
;86:
;87:	p = &memoryPool[allocPoint];
ADDRLP4 0
ADDRGP4 allocPoint
INDIRI4
ADDRGP4 memoryPool
ADDP4
ASGNP4
line 89
;88:
;89:	allocPoint += ( size + 15 ) & ~15;
ADDRLP4 4
ADDRGP4 allocPoint
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 15
ADDI4
CNSTI4 -16
BANDI4
ADDI4
ASGNI4
line 91
;90:
;91:	return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $93
endproc UI_Alloc 8 4
export UI_InitMemory
proc UI_InitMemory 0 0
line 99
;92:}
;93:
;94:/*
;95:===============
;96:UI_InitMemory
;97:===============
;98:*/
;99:void UI_InitMemory( void ) {
line 100
;100:	allocPoint = 0;
ADDRGP4 allocPoint
CNSTI4 0
ASGNI4
line 101
;101:	outOfMemory = qfalse;
ADDRGP4 outOfMemory
CNSTI4 0
ASGNI4
line 102
;102:}
LABELV $99
endproc UI_InitMemory 0 0
export UI_OutOfMemory
proc UI_OutOfMemory 0 0
line 104
;103:
;104:qboolean UI_OutOfMemory() {
line 105
;105:	return outOfMemory;
ADDRGP4 outOfMemory
INDIRI4
RETI4
LABELV $100
endproc UI_OutOfMemory 0 0
proc hashForString 16 4
line 118
;106:}
;107:
;108:
;109:
;110:
;111:
;112:#define HASH_TABLE_SIZE 2048
;113:/*
;114:================
;115:return a hash value for the string
;116:================
;117:*/
;118:static long hashForString(const char *str) {
line 123
;119:	int		i;
;120:	long	hash;
;121:	char	letter;
;122:
;123:	hash = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 124
;124:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $102
line 125
;125:	while (str[i] != '\0') {
line 126
;126:		letter = tolower(str[i]);
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 127
;127:		hash+=(long)(letter)*(i+119);
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI1
CVII4 1
ADDRLP4 0
INDIRI4
CNSTI4 119
ADDI4
MULI4
ADDI4
ASGNI4
line 128
;128:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 129
;129:	}
LABELV $103
line 125
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $102
line 130
;130:	hash &= (HASH_TABLE_SIZE-1);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2047
BANDI4
ASGNI4
line 131
;131:	return hash;
ADDRLP4 8
INDIRI4
RETI4
LABELV $101
endproc hashForString 16 4
data
export strPoolIndex
align 4
LABELV strPoolIndex
byte 4 0
export strHandleCount
align 4
LABELV strHandleCount
byte 4 0
align 4
LABELV $106
address $107
export String_Alloc
code
proc String_Alloc 44 8
line 145
;132:}
;133:
;134:typedef struct stringDef_s {
;135:	struct stringDef_s *next;
;136:	const char *str;
;137:} stringDef_t;
;138:
;139:/**static*/ int strPoolIndex = 0;
;140:/*static*/ char strPool[STRING_POOL_SIZE];
;141:
;142:/*static*/ int strHandleCount = 0;
;143:/*static*/ stringDef_t *strHandle[HASH_TABLE_SIZE];
;144:
;145:const char *String_Alloc(const char *p) {
line 151
;146:	int len;
;147:	long hash;
;148:	stringDef_t *str, *last;
;149:	static const char *staticNULL = "";
;150:
;151:	if (p == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $108
line 152
;152:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $105
JUMPV
LABELV $108
line 155
;153:	}
;154:
;155:	if (*p == 0) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $110
line 156
;156:		return staticNULL;
ADDRGP4 $106
INDIRP4
RETP4
ADDRGP4 $105
JUMPV
LABELV $110
line 159
;157:	}
;158:
;159:	hash = hashForString(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 hashForString
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 161
;160:
;161:	str = strHandle[hash];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $113
JUMPV
LABELV $112
line 162
;162:	while (str) {
line 163
;163:		if (strcmp(p, str->str) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $115
line 164
;164:			return str->str;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
RETP4
ADDRGP4 $105
JUMPV
LABELV $115
line 166
;165:		}
;166:		str = str->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
line 167
;167:	}
LABELV $113
line 162
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $112
line 169
;168:
;169:	len = strlen(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 170
;170:	if (len + strPoolIndex + 1 < STRING_POOL_SIZE) {
ADDRLP4 12
INDIRI4
ADDRGP4 strPoolIndex
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 131072
GEI4 $117
line 171
;171:		int ph = strPoolIndex;
ADDRLP4 24
ADDRGP4 strPoolIndex
INDIRI4
ASGNI4
line 172
;172:		strcpy(&strPool[strPoolIndex], p);
ADDRGP4 strPoolIndex
INDIRI4
ADDRGP4 strPool
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 173
;173:		strPoolIndex += len + 1;
ADDRLP4 28
ADDRGP4 strPoolIndex
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 175
;174:
;175:		str = strHandle[hash];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
INDIRP4
ASGNP4
line 176
;176:		last = str;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $120
JUMPV
LABELV $119
line 177
;177:		while (str && str->next) {
line 178
;178:			last = str;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 179
;179:			str = str->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
line 180
;180:		}
LABELV $120
line 177
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $122
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
NEU4 $119
LABELV $122
line 182
;181:
;182:		str  = UI_Alloc(sizeof(stringDef_t));
CNSTI4 8
ARGI4
ADDRLP4 40
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 183
;183:		str->next = NULL;
ADDRLP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 184
;184:		str->str = &strPool[ph];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 24
INDIRI4
ADDRGP4 strPool
ADDP4
ASGNP4
line 185
;185:		if (last) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $123
line 186
;186:			last->next = str;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 187
;187:		} else {
ADDRGP4 $124
JUMPV
LABELV $123
line 188
;188:			strHandle[hash] = str;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 189
;189:		}
LABELV $124
line 190
;190:		return &strPool[ph];
ADDRLP4 24
INDIRI4
ADDRGP4 strPool
ADDP4
RETP4
ADDRGP4 $105
JUMPV
LABELV $117
line 192
;191:	}
;192:	return NULL;
CNSTP4 0
RETP4
LABELV $105
endproc String_Alloc 44 8
export String_Report
proc String_Report 4 16
line 195
;193:}
;194:
;195:void String_Report() {
line 197
;196:	float f;
;197:	Com_Printf("Memory/String Pool Info\n");
ADDRGP4 $126
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 198
;198:	Com_Printf("----------------\n");
ADDRGP4 $127
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 199
;199:	f = strPoolIndex;
ADDRLP4 0
ADDRGP4 strPoolIndex
INDIRI4
CVIF4 4
ASGNF4
line 200
;200:	f /= STRING_POOL_SIZE;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1207959552
DIVF4
ASGNF4
line 201
;201:	f *= 100;
ADDRLP4 0
CNSTF4 1120403456
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 202
;202:	Com_Printf("String Pool is %.1f%% full, %i bytes out of %i used.\n", f, strPoolIndex, STRING_POOL_SIZE);
ADDRGP4 $128
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 strPoolIndex
INDIRI4
ARGI4
CNSTI4 131072
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 203
;203:	f = allocPoint;
ADDRLP4 0
ADDRGP4 allocPoint
INDIRI4
CVIF4 4
ASGNF4
line 204
;204:	f /= MEM_POOL_SIZE;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1233125376
DIVF4
ASGNF4
line 205
;205:	f *= 100;
ADDRLP4 0
CNSTF4 1120403456
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 206
;206:	Com_Printf("Memory Pool is %.1f%% full, %i bytes out of %i used.\n", f, allocPoint, MEM_POOL_SIZE);
ADDRGP4 $129
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 allocPoint
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 207
;207:}
LABELV $125
endproc String_Report 4 16
export String_Init
proc String_Init 12 0
line 214
;208:
;209:/*
;210:=================
;211:String_Init
;212:=================
;213:*/
;214:void String_Init() {
line 216
;215:	int i;
;216:	for (i = 0; i < HASH_TABLE_SIZE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $131
line 217
;217:		strHandle[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
CNSTP4 0
ASGNP4
line 218
;218:	}
LABELV $132
line 216
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2048
LTI4 $131
line 219
;219:	strHandleCount = 0;
ADDRGP4 strHandleCount
CNSTI4 0
ASGNI4
line 220
;220:	strPoolIndex = 0;
ADDRGP4 strPoolIndex
CNSTI4 0
ASGNI4
line 221
;221:	menuCount = 0;
ADDRGP4 menuCount
CNSTI4 0
ASGNI4
line 222
;222:	openMenuCount = 0;
ADDRGP4 openMenuCount
CNSTI4 0
ASGNI4
line 223
;223:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 226
;224://	Item_SetupKeywordHash();
;225://	Menu_SetupKeywordHash();
;226:	if (DC && DC->getBindingBuf) {
ADDRLP4 4
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $135
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $135
line 227
;227:		Controls_GetConfig();
ADDRGP4 Controls_GetConfig
CALLV
pop
line 228
;228:	}
LABELV $135
line 229
;229:} 
LABELV $130
endproc String_Init 12 0
bss
align 1
LABELV $138
skip 4096
export PC_SourceWarning
code
proc PC_SourceWarning 136 16
line 236
;230:
;231:/*
;232:=================
;233:PC_SourceWarning
;234:=================
;235:*/
;236:void PC_SourceWarning(int handle, char *format, ...) {
line 242
;237:	int line;
;238:	char filename[128];
;239:	va_list argptr;
;240:	static char string[4096];
;241:
;242:	va_start (argptr, format);
ADDRLP4 132
ADDRFP4 4+4
ASGNP4
line 243
;243:	vsprintf (string, format, argptr);
ADDRGP4 $138
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 244
;244:	va_end (argptr);
ADDRLP4 132
CNSTP4 0
ASGNP4
line 246
;245:
;246:	filename[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 247
;247:	line = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 248
;248:	trap_PC_SourceFileAndLine(handle, filename, &line);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_PC_SourceFileAndLine
CALLI4
pop
line 250
;249:
;250:	Com_Printf(S_COLOR_YELLOW "WARNING: %s, line %d: %s\n", filename, line, string);
ADDRGP4 $140
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $138
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 251
;251:}
LABELV $137
endproc PC_SourceWarning 136 16
bss
align 1
LABELV $142
skip 4096
export PC_SourceError
code
proc PC_SourceError 136 16
line 258
;252:
;253:/*
;254:=================
;255:PC_SourceError
;256:=================
;257:*/
;258:void PC_SourceError(int handle, char *format, ...) {
line 264
;259:	int line;
;260:	char filename[128];
;261:	va_list argptr;
;262:	static char string[4096];
;263:
;264:	va_start (argptr, format);
ADDRLP4 132
ADDRFP4 4+4
ASGNP4
line 265
;265:	vsprintf (string, format, argptr);
ADDRGP4 $142
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 266
;266:	va_end (argptr);
ADDRLP4 132
CNSTP4 0
ASGNP4
line 268
;267:
;268:	filename[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 269
;269:	line = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 270
;270:	trap_PC_SourceFileAndLine(handle, filename, &line);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_PC_SourceFileAndLine
CALLI4
pop
line 272
;271:
;272:	Com_Printf(S_COLOR_RED "ERROR: %s, line %d: %s\n", filename, line, string);
ADDRGP4 $144
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $142
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 273
;273:}
LABELV $141
endproc PC_SourceError 136 16
export LerpColor
proc LerpColor 12 0
line 281
;274:
;275:/*
;276:=================
;277:LerpColor
;278:=================
;279:*/
;280:void LerpColor(vec4_t a, vec4_t b, vec4_t c, float t)
;281:{
line 285
;282:	int i;
;283:
;284:	// lerp and clamp each component
;285:	for (i=0; i<4; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $146
line 286
;286:	{
line 287
;287:		c[i] = a[i] + t*(b[i]-a[i]);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 288
;288:		if (c[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $150
line 289
;289:			c[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $151
JUMPV
LABELV $150
line 290
;290:		else if (c[i] > 1.0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 1065353216
LEF4 $152
line 291
;291:			c[i] = 1.0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $152
LABELV $151
line 292
;292:	}
LABELV $147
line 285
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $146
line 293
;293:}
LABELV $145
endproc LerpColor 12 0
export Float_Parse
proc Float_Parse 16 8
line 300
;294:
;295:/*
;296:=================
;297:Float_Parse
;298:=================
;299:*/
;300:qboolean Float_Parse(char **p, float *f) {
line 302
;301:	char	*token;
;302:	token = COM_ParseExt(p, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 303
;303:	if (token && token[0] != 0) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $155
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $155
line 304
;304:		*f = atof(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 305
;305:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $154
JUMPV
LABELV $155
line 306
;306:	} else {
line 307
;307:		return qfalse;
CNSTI4 0
RETI4
LABELV $154
endproc Float_Parse 16 8
export PC_Float_Parse
proc PC_Float_Parse 1052 12
line 316
;308:	}
;309:}
;310:
;311:/*
;312:=================
;313:PC_Float_Parse
;314:=================
;315:*/
;316:qboolean PC_Float_Parse(int handle, float *f) {
line 318
;317:	pc_token_t token;
;318:	int negative = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 320
;319:
;320:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $158
line 321
;321:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $158
line 322
;322:	if (token.string[0] == '-') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $160
line 323
;323:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $163
line 324
;324:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $163
line 325
;325:		negative = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 326
;326:	}
LABELV $160
line 327
;327:	if (token.type != TT_NUMBER) {
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $165
line 328
;328:		PC_SourceError(handle, "expected float but found %s\n", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $167
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 329
;329:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $165
line 331
;330:	}
;331:	if (negative)
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $169
line 332
;332:		*f = -token.floatvalue;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $170
JUMPV
LABELV $169
line 334
;333:	else
;334:		*f = token.floatvalue;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRF4
ASGNF4
LABELV $170
line 335
;335:	return qtrue;
CNSTI4 1
RETI4
LABELV $157
endproc PC_Float_Parse 1052 12
export Color_Parse
proc Color_Parse 12 8
line 343
;336:}
;337:
;338:/*
;339:=================
;340:Color_Parse
;341:=================
;342:*/
;343:qboolean Color_Parse(char **p, vec4_t *c) {
line 347
;344:	int i;
;345:	float f;
;346:
;347:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $174
line 348
;348:		if (!Float_Parse(p, &f)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $178
line 349
;349:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $178
line 351
;350:		}
;351:		(*c)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 352
;352:	}
LABELV $175
line 347
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $174
line 353
;353:	return qtrue;
CNSTI4 1
RETI4
LABELV $173
endproc Color_Parse 12 8
export PC_Color_Parse
proc PC_Color_Parse 12 8
line 361
;354:}
;355:
;356:/*
;357:=================
;358:PC_Color_Parse
;359:=================
;360:*/
;361:qboolean PC_Color_Parse(int handle, vec4_t *c) {
line 365
;362:	int i;
;363:	float f;
;364:
;365:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $181
line 366
;366:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $185
line 367
;367:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $180
JUMPV
LABELV $185
line 369
;368:		}
;369:		(*c)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 370
;370:	}
LABELV $182
line 365
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $181
line 371
;371:	return qtrue;
CNSTI4 1
RETI4
LABELV $180
endproc PC_Color_Parse 12 8
export Int_Parse
proc Int_Parse 16 8
line 379
;372:}
;373:
;374:/*
;375:=================
;376:Int_Parse
;377:=================
;378:*/
;379:qboolean Int_Parse(char **p, int *i) {
line 381
;380:	char	*token;
;381:	token = COM_ParseExt(p, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 383
;382:
;383:	if (token && token[0] != 0) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $188
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $188
line 384
;384:		*i = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 385
;385:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $187
JUMPV
LABELV $188
line 386
;386:	} else {
line 387
;387:		return qfalse;
CNSTI4 0
RETI4
LABELV $187
endproc Int_Parse 16 8
export PC_Int_Parse
proc PC_Int_Parse 1052 12
line 396
;388:	}
;389:}
;390:
;391:/*
;392:=================
;393:PC_Int_Parse
;394:=================
;395:*/
;396:qboolean PC_Int_Parse(int handle, int *i) {
line 398
;397:	pc_token_t token;
;398:	int negative = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 400
;399:
;400:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $191
line 401
;401:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $190
JUMPV
LABELV $191
line 402
;402:	if (token.string[0] == '-') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $193
line 403
;403:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $196
line 404
;404:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $190
JUMPV
LABELV $196
line 405
;405:		negative = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 406
;406:	}
LABELV $193
line 407
;407:	if (token.type != TT_NUMBER) {
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $198
line 408
;408:		PC_SourceError(handle, "expected integer but found %s\n", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $200
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 409
;409:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $190
JUMPV
LABELV $198
line 411
;410:	}
;411:	*i = token.intvalue;
ADDRFP4 4
INDIRP4
ADDRLP4 0+8
INDIRI4
ASGNI4
line 412
;412:	if (negative)
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $203
line 413
;413:		*i = - *i;
ADDRLP4 1048
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
NEGI4
ASGNI4
LABELV $203
line 414
;414:	return qtrue;
CNSTI4 1
RETI4
LABELV $190
endproc PC_Int_Parse 1052 12
export Rect_Parse
proc Rect_Parse 20 8
line 422
;415:}
;416:
;417:/*
;418:=================
;419:Rect_Parse
;420:=================
;421:*/
;422:qboolean Rect_Parse(char **p, rectDef_t *r) {
line 423
;423:	if (Float_Parse(p, &r->x)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $206
line 424
;424:		if (Float_Parse(p, &r->y)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $208
line 425
;425:			if (Float_Parse(p, &r->w)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $210
line 426
;426:				if (Float_Parse(p, &r->h)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $212
line 428
;427:
;428:					if ( r->x > 640 ||
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1142947840
GTF4 $216
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1139802112
LEF4 $214
LABELV $216
line 430
;429:						r->y > 480 )
;430:						r->novscreen = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $214
line 432
;431:					else
;432:						r->novscreen = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
LABELV $215
line 434
;433:
;434:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $205
JUMPV
LABELV $212
line 436
;435:				}
;436:			}
LABELV $210
line 437
;437:		}
LABELV $208
line 438
;438:	}
LABELV $206
line 439
;439:	return qfalse;
CNSTI4 0
RETI4
LABELV $205
endproc Rect_Parse 20 8
export PC_Rect_Parse
proc PC_Rect_Parse 16 8
line 447
;440:}
;441:
;442:/*
;443:=================
;444:PC_Rect_Parse
;445:=================
;446:*/
;447:qboolean PC_Rect_Parse(int handle, rectDef_t *r) {
line 448
;448:	if (PC_Float_Parse(handle, &r->x)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $218
line 449
;449:		if (PC_Float_Parse(handle, &r->y)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $220
line 450
;450:			if (PC_Float_Parse(handle, &r->w)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $222
line 451
;451:				if (PC_Float_Parse(handle, &r->h)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $224
line 452
;452:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $217
JUMPV
LABELV $224
line 454
;453:				}
;454:			}
LABELV $222
line 455
;455:		}
LABELV $220
line 456
;456:	}
LABELV $218
line 457
;457:	return qfalse;
CNSTI4 0
RETI4
LABELV $217
endproc PC_Rect_Parse 16 8
export String_Parse
proc String_Parse 16 8
line 465
;458:}
;459:
;460:/*
;461:=================
;462:String_Parse
;463:=================
;464:*/
;465:qboolean String_Parse(char **p, const char **out) {
line 468
;466:	char *token;
;467:
;468:	token = COM_ParseExt(p, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 469
;469:	if (token && token[0] != 0) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $227
line 470
;470:		*(out) = String_Alloc(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRP4
ASGNP4
line 471
;471:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $226
JUMPV
LABELV $227
line 473
;472:	}
;473:	return qfalse;
CNSTI4 0
RETI4
LABELV $226
endproc String_Parse 16 8
export PC_String_Parse
proc PC_String_Parse 1048 8
line 481
;474:}
;475:
;476:/*
;477:=================
;478:PC_String_Parse
;479:=================
;480:*/
;481:qboolean PC_String_Parse(int handle, const char **out) {
line 484
;482:	pc_token_t token;
;483:
;484:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $230
line 485
;485:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $229
JUMPV
LABELV $230
line 487
;486:	
;487:	*(out) = String_Alloc(token.string);
ADDRLP4 0+16
ARGP4
ADDRLP4 1044
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 1044
INDIRP4
ASGNP4
line 488
;488:    return qtrue;
CNSTI4 1
RETI4
LABELV $229
endproc PC_String_Parse 1048 8
export PC_Script_Parse
proc PC_Script_Parse 2084 12
line 496
;489:}
;490:
;491:/*
;492:=================
;493:PC_Script_Parse
;494:=================
;495:*/
;496:qboolean PC_Script_Parse(int handle, const char **out) {
line 500
;497:	char script[1024];
;498:	pc_token_t token;
;499:
;500:	memset(script, 0, sizeof(script));
ADDRLP4 1040
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 504
;501:	// scripts start with { and have ; separated command lists.. commands are command, arg.. 
;502:	// basically we want everything between the { } as it will be interpreted at run time
;503:  
;504:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $234
line 505
;505:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $233
JUMPV
LABELV $234
line 506
;506:	if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $239
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
EQI4 $241
line 507
;507:	    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $233
JUMPV
LABELV $240
line 510
;508:	}
;509:
;510:	while ( 1 ) {
line 511
;511:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 2072
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $243
line 512
;512:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $233
JUMPV
LABELV $243
line 514
;513:
;514:		if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $245
line 515
;515:			*out = String_Alloc(script);
ADDRLP4 1040
ARGP4
ADDRLP4 2080
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 516
;516:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $233
JUMPV
LABELV $245
line 519
;517:		}
;518:
;519:		if (token.string[1] != '\0') {
ADDRLP4 0+16+1
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $249
line 520
;520:			Q_strcat(script, 1024, va("\"%s\"", token.string));
ADDRGP4 $253
ARGP4
ADDRLP4 0+16
ARGP4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 521
;521:		} else {
ADDRGP4 $250
JUMPV
LABELV $249
line 522
;522:			Q_strcat(script, 1024, token.string);
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 0+16
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 523
;523:		}
LABELV $250
line 524
;524:		Q_strcat(script, 1024, " ");
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $256
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 525
;525:	}
LABELV $241
line 510
ADDRGP4 $240
JUMPV
line 526
;526:	return qtrue;
CNSTI4 1
RETI4
LABELV $233
endproc PC_Script_Parse 2084 12
export Init_Display
proc Init_Display 0 0
line 539
;527:}
;528:
;529:// display, window, menu, item code
;530:// 
;531:
;532:/*
;533:==================
;534:Init_Display
;535:
;536:Initializes the display with a structure to all the drawing routines
;537: ==================
;538:*/
;539:void Init_Display(displayContextDef_t *dc) {
line 540
;540:	DC = dc;
ADDRGP4 DC
ADDRFP4 0
INDIRP4
ASGNP4
line 541
;541:}
LABELV $257
endproc Init_Display 0 0
export GradientBar_Paint
proc GradientBar_Paint 32 36
line 547
;542:
;543:
;544:
;545:// type and style painting 
;546:
;547:void GradientBar_Paint(rectDef_t *rect, vec4_t color) {
line 549
;548:	// gradient bar takes two paints
;549:	DC->setColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 550
;550:	if ( rect->novscreen )
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $259
line 551
;551:		DC->drawStretchPic(rect->x, rect->y, rect->w, rect->h, 0, 0, 1, 1, DC->Assets.gradientBar );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
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
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 61892
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $260
JUMPV
LABELV $259
line 553
;552:	else
;553:		DC->drawHandlePic(rect->x, rect->y, rect->w, rect->h, DC->Assets.gradientBar);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 61892
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
CALLV
pop
LABELV $260
line 554
;554:	DC->setColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 555
;555:}
LABELV $258
endproc GradientBar_Paint 32 36
export Window_Init
proc Window_Init 8 12
line 566
;556:
;557:
;558:/*
;559:==================
;560:Window_Init
;561:
;562:Initializes a window structure ( windowDef_t ) with defaults
;563: 
;564:==================
;565:*/
;566:void Window_Init(Window *w) {
line 567
;567:	memset(w, 0, sizeof(windowDef_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 196
ARGI4
ADDRGP4 memset
CALLP4
pop
line 568
;568:	w->borderSize = 1;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 1065353216
ASGNF4
line 569
;569:	w->foreColor[0] = w->foreColor[1] = w->foreColor[2] = w->foreColor[3] = 1.0;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 570
;570:	w->cinematic = -1;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 -1
ASGNI4
line 571
;571:}
LABELV $261
endproc Window_Init 8 12
export Fade
proc Fade 8 0
line 573
;572:
;573:void Fade(int *flags, float *f, float clamp, int *nextTime, int offsetTime, qboolean bFlags, float fadeAmount) {
line 574
;574:  if (*flags & (WINDOW_FADINGOUT | WINDOW_FADINGIN)) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 96
BANDI4
CNSTI4 0
EQI4 $263
line 575
;575:    if (DC->realTime > *nextTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRFP4 12
INDIRP4
INDIRI4
LEI4 $265
line 576
;576:      *nextTime = DC->realTime + offsetTime;
ADDRFP4 12
INDIRP4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRFP4 16
INDIRI4
ADDI4
ASGNI4
line 577
;577:      if (*flags & WINDOW_FADINGOUT) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $267
line 578
;578:        *f -= fadeAmount;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 24
INDIRF4
SUBF4
ASGNF4
line 579
;579:        if (bFlags && *f <= 0.0) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $268
ADDRFP4 4
INDIRP4
INDIRF4
CNSTF4 0
GTF4 $268
line 580
;580:          *flags &= ~(WINDOW_FADINGOUT | WINDOW_VISIBLE);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -37
BANDI4
ASGNI4
line 581
;581:        }
line 582
;582:      } else {
ADDRGP4 $268
JUMPV
LABELV $267
line 583
;583:        *f += fadeAmount;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 24
INDIRF4
ADDF4
ASGNF4
line 584
;584:        if (*f >= clamp) {
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRF4
LTF4 $271
line 585
;585:          *f = clamp;
ADDRFP4 4
INDIRP4
ADDRFP4 8
INDIRF4
ASGNF4
line 586
;586:          if (bFlags) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $273
line 587
;587:            *flags &= ~WINDOW_FADINGIN;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 588
;588:          }
LABELV $273
line 589
;589:        }
LABELV $271
line 590
;590:      }
LABELV $268
line 591
;591:    }
LABELV $265
line 592
;592:  }
LABELV $263
line 593
;593:}
LABELV $262
endproc Fade 8 0
export Window_Paint
proc Window_Paint 72 36
line 597
;594:
;595:
;596:
;597:void Window_Paint(Window *w, float fadeAmount, float fadeClamp, float fadeCycle) {
line 600
;598:  //float bordersize = 0;
;599:  vec4_t color;
;600:  rectDef_t fillRect = w->rect;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 20
line 604
;601:
;602:
;603:
;604:  if (debugMode) {
ADDRGP4 debugMode
INDIRI4
CNSTI4 0
EQI4 $276
line 605
;605:    color[0] = color[1] = color[2] = color[3] = 1;
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 20+12
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 36
INDIRF4
ASGNF4
line 606
;606:    DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, 1, color);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 20
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 607
;607:  }
LABELV $276
line 609
;608:
;609:  if (w == NULL || (w->style == 0 && w->border == 0)) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $283
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $281
ADDRLP4 36
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $281
LABELV $283
line 610
;610:    return;
ADDRGP4 $275
JUMPV
LABELV $281
line 613
;611:  }
;612:
;613:  if (w->border != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
EQI4 $284
line 614
;614:    fillRect.x += w->borderSize;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 615
;615:    fillRect.y += w->borderSize;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 616
;616:    fillRect.w -= w->borderSize + 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
SUBF4
ASGNF4
line 617
;617:    fillRect.h -= w->borderSize + 1;
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
SUBF4
ASGNF4
line 618
;618:  }
LABELV $284
line 620
;619:
;620:  if (w->style == WINDOW_STYLE_FILLED) {
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 1
NEI4 $289
line 623
;621:		  vec4_t bcolor;
;622:
;623:	  	if ( w->flags & WINDOW_TEAMCOLOR )
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $291
line 624
;624:		{
line 626
;625:	#ifdef CGAME
;626:			if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $293
line 627
;627:			{
line 628
;628:				bcolor[0] = DC->Assets.team1color[0];
ADDRLP4 44
ADDRGP4 DC
INDIRP4
CNSTI4 62000
ADDP4
INDIRF4
ASGNF4
line 629
;629:				bcolor[1] = DC->Assets.team1color[1];
ADDRLP4 44+4
ADDRGP4 DC
INDIRP4
CNSTI4 62004
ADDP4
INDIRF4
ASGNF4
line 630
;630:				bcolor[2] = DC->Assets.team1color[2];
ADDRLP4 44+8
ADDRGP4 DC
INDIRP4
CNSTI4 62008
ADDP4
INDIRF4
ASGNF4
line 631
;631:				bcolor[3] = DC->Assets.team1color[3];
ADDRLP4 44+12
ADDRGP4 DC
INDIRP4
CNSTI4 62012
ADDP4
INDIRF4
ASGNF4
line 632
;632:			}
ADDRGP4 $292
JUMPV
LABELV $293
line 633
;633:			else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $299
line 634
;634:			{
line 635
;635:				bcolor[0] = DC->Assets.team2color[0];
ADDRLP4 44
ADDRGP4 DC
INDIRP4
CNSTI4 62016
ADDP4
INDIRF4
ASGNF4
line 636
;636:				bcolor[1] = DC->Assets.team2color[1];
ADDRLP4 44+4
ADDRGP4 DC
INDIRP4
CNSTI4 62020
ADDP4
INDIRF4
ASGNF4
line 637
;637:				bcolor[2] = DC->Assets.team2color[2];
ADDRLP4 44+8
ADDRGP4 DC
INDIRP4
CNSTI4 62024
ADDP4
INDIRF4
ASGNF4
line 638
;638:				bcolor[3] = DC->Assets.team2color[3];
ADDRLP4 44+12
ADDRGP4 DC
INDIRP4
CNSTI4 62028
ADDP4
INDIRF4
ASGNF4
line 639
;639:			}
ADDRGP4 $292
JUMPV
LABELV $299
line 641
;640:			else
;641:			{
line 642
;642:				bcolor[0] = DC->Assets.dmcolor[0];
ADDRLP4 44
ADDRGP4 DC
INDIRP4
CNSTI4 62032
ADDP4
INDIRF4
ASGNF4
line 643
;643:				bcolor[1] = DC->Assets.dmcolor[1];
ADDRLP4 44+4
ADDRGP4 DC
INDIRP4
CNSTI4 62036
ADDP4
INDIRF4
ASGNF4
line 644
;644:				bcolor[2] = DC->Assets.dmcolor[2];
ADDRLP4 44+8
ADDRGP4 DC
INDIRP4
CNSTI4 62040
ADDP4
INDIRF4
ASGNF4
line 645
;645:				bcolor[3] = DC->Assets.dmcolor[3];
ADDRLP4 44+12
ADDRGP4 DC
INDIRP4
CNSTI4 62044
ADDP4
INDIRF4
ASGNF4
line 646
;646:			}
line 648
;647:	#endif
;648:		}
ADDRGP4 $292
JUMPV
LABELV $291
line 650
;649:		else
;650:		{
line 651
;651:			bcolor[0] = w->backColor[0];
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ASGNF4
line 652
;652:			bcolor[1] = w->backColor[1];
ADDRLP4 44+4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRF4
ASGNF4
line 653
;653:			bcolor[2] = w->backColor[2];
ADDRLP4 44+8
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ASGNF4
line 654
;654:			bcolor[3] = w->backColor[3];
ADDRLP4 44+12
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
line 655
;655:		}
LABELV $292
line 658
;656:
;657:    // box, but possible a shader that needs filled
;658:		if (w->background) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $311
line 659
;659:			Fade(&w->flags, &bcolor[3], fadeClamp, &w->nextTime, fadeCycle, qtrue, fadeAmount);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRLP4 44+12
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 Fade
CALLV
pop
line 660
;660:			DC->setColor(bcolor);
ADDRLP4 44
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 661
;661:			if ( fillRect.novscreen )
ADDRLP4 0+16
INDIRI4
CNSTI4 0
EQI4 $314
line 662
;662:				DC->drawStretchPic(fillRect.x, fillRect.y, fillRect.w, fillRect.h, 0, 0, 1, 1, w->background );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
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
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $314
line 664
;663:			else
;664:				DC->drawHandlePic(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->background);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
LABELV $315
line 665
;665:			DC->setColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 666
;666:		} 
ADDRGP4 $290
JUMPV
LABELV $311
line 667
;667:		else {
line 668
;668:			DC->fillRect(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->backColor);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
CALLV
pop
line 669
;669:		}
line 670
;670:  } else if (w->style == WINDOW_STYLE_GRADIENT) {
ADDRGP4 $290
JUMPV
LABELV $289
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 2
NEI4 $326
line 671
;671:	if ( w->flags & WINDOW_TEAMCOLOR )
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $328
line 672
;672:	{
line 674
;673:#ifdef CGAME
;674:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $330
line 675
;675:			GradientBar_Paint(&fillRect, DC->Assets.team1color );
ADDRLP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 62000
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
ADDRGP4 $327
JUMPV
LABELV $330
line 676
;676:		else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $333
line 677
;677:			GradientBar_Paint(&fillRect, DC->Assets.team2color );
ADDRLP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 62016
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
ADDRGP4 $327
JUMPV
LABELV $333
line 679
;678:		else
;679:			GradientBar_Paint(&fillRect, DC->Assets.dmcolor );
ADDRLP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 62032
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
line 681
;680:#endif
;681:	}
ADDRGP4 $327
JUMPV
LABELV $328
line 683
;682:    else 
;683:		GradientBar_Paint(&fillRect, w->backColor);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
line 685
;684:    // gradient bar
;685:  } else if (w->style == WINDOW_STYLE_SHADER) { 
ADDRGP4 $327
JUMPV
LABELV $326
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 3
NEI4 $336
line 687
;686:
;687:	if ( w->flags & WINDOW_TEAMCOLOR )
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $338
line 688
;688:	{
line 690
;689:#ifdef CGAME
;690:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $340
line 691
;691:			DC->setColor(DC->Assets.team1color );
ADDRLP4 44
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 62000
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $339
JUMPV
LABELV $340
line 692
;692:		else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $343
line 693
;693:			DC->setColor(DC->Assets.team2color );
ADDRLP4 48
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 62016
ADDP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $339
JUMPV
LABELV $343
line 695
;694:		else
;695:			DC->setColor(DC->Assets.dmcolor );
ADDRLP4 52
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 62032
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 697
;696:#endif
;697:	}
ADDRGP4 $339
JUMPV
LABELV $338
line 698
;698:    else if (w->flags & WINDOW_FORECOLORSET) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $346
line 699
;699:      DC->setColor(w->foreColor);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 700
;700:    }
LABELV $346
LABELV $339
line 701
;701:	if ( fillRect.novscreen )
ADDRLP4 0+16
INDIRI4
CNSTI4 0
EQI4 $348
line 702
;702:		DC->drawStretchPic(fillRect.x,fillRect.y, fillRect.w, fillRect.h, 0, 0, 1, 1, w->background );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $349
JUMPV
LABELV $348
line 704
;703:	else
;704:		DC->drawHandlePic(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->background);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
LABELV $349
line 705
;705:    DC->setColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 706
;706:  } else if (w->style == WINDOW_STYLE_TEAMCOLOR) {
ADDRGP4 $337
JUMPV
LABELV $336
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4
NEI4 $357
line 707
;707:    if (DC->getTeamColor) {
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $358
line 708
;708:      DC->getTeamColor(&color);
ADDRLP4 20
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 709
;709:      DC->fillRect(fillRect.x, fillRect.y, fillRect.w, fillRect.h, color);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRLP4 20
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
CALLV
pop
line 710
;710:    }
line 711
;711:  } else if (w->style == WINDOW_STYLE_CINEMATIC) {
ADDRGP4 $358
JUMPV
LABELV $357
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 5
NEI4 $364
line 712
;712:		if (w->cinematic == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $366
line 713
;713:			w->cinematic = DC->playCinematic(w->cinematicName, fillRect.x, fillRect.y, fillRect.w, fillRect.h);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 DC
INDIRP4
CNSTI4 184
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 714
;714:			if (w->cinematic == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $371
line 715
;715:				w->cinematic = -2;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 -2
ASGNI4
line 716
;716:			}
LABELV $371
line 717
;717:		} 
LABELV $366
line 718
;718:		if (w->cinematic >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $373
line 719
;719:	    DC->runCinematicFrame(w->cinematic);
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 196
ADDP4
INDIRP4
CALLV
pop
line 720
;720:			DC->drawCinematic(w->cinematic, fillRect.x, fillRect.y, fillRect.w, fillRect.h);
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 0+12
INDIRF4
ARGF4
ADDRGP4 DC
INDIRP4
CNSTI4 192
ADDP4
INDIRP4
CALLV
pop
line 721
;721:		}
LABELV $373
line 722
;722:  }
LABELV $364
LABELV $358
LABELV $337
LABELV $327
LABELV $290
line 724
;723:
;724:  if (w->border == WINDOW_BORDER_FULL) {
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 1
NEI4 $378
line 726
;725:    
;726:	if ( w->flags & WINDOW_TEAMCOLOR )
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $380
line 727
;727:	{
line 731
;728:#ifdef CGAME
;729:		vec4_t color;
;730:
;731:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $382
line 732
;732:		{
line 733
;733:			color[0] = DC->Assets.team1color[0];
ADDRLP4 44
ADDRGP4 DC
INDIRP4
CNSTI4 62000
ADDP4
INDIRF4
ASGNF4
line 734
;734:			color[1] = DC->Assets.team1color[1];
ADDRLP4 44+4
ADDRGP4 DC
INDIRP4
CNSTI4 62004
ADDP4
INDIRF4
ASGNF4
line 735
;735:			color[2] = DC->Assets.team1color[2];
ADDRLP4 44+8
ADDRGP4 DC
INDIRP4
CNSTI4 62008
ADDP4
INDIRF4
ASGNF4
line 736
;736:			color[3] = DC->Assets.team1color[3];
ADDRLP4 44+12
ADDRGP4 DC
INDIRP4
CNSTI4 62012
ADDP4
INDIRF4
ASGNF4
line 737
;737:		}
ADDRGP4 $383
JUMPV
LABELV $382
line 738
;738:		else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $388
line 739
;739:		{
line 740
;740:			color[0] = DC->Assets.team2color[0];
ADDRLP4 44
ADDRGP4 DC
INDIRP4
CNSTI4 62016
ADDP4
INDIRF4
ASGNF4
line 741
;741:			color[1] = DC->Assets.team2color[1];
ADDRLP4 44+4
ADDRGP4 DC
INDIRP4
CNSTI4 62020
ADDP4
INDIRF4
ASGNF4
line 742
;742:			color[2] = DC->Assets.team2color[2];
ADDRLP4 44+8
ADDRGP4 DC
INDIRP4
CNSTI4 62024
ADDP4
INDIRF4
ASGNF4
line 743
;743:			color[3] = DC->Assets.team2color[3]; 
ADDRLP4 44+12
ADDRGP4 DC
INDIRP4
CNSTI4 62028
ADDP4
INDIRF4
ASGNF4
line 744
;744:		}
ADDRGP4 $389
JUMPV
LABELV $388
line 746
;745:		else
;746:		{
line 747
;747:			color[0] = DC->Assets.dmcolor[0];
ADDRLP4 44
ADDRGP4 DC
INDIRP4
CNSTI4 62032
ADDP4
INDIRF4
ASGNF4
line 748
;748:			color[1] = DC->Assets.dmcolor[1];
ADDRLP4 44+4
ADDRGP4 DC
INDIRP4
CNSTI4 62036
ADDP4
INDIRF4
ASGNF4
line 749
;749:			color[2] = DC->Assets.dmcolor[2];
ADDRLP4 44+8
ADDRGP4 DC
INDIRP4
CNSTI4 62040
ADDP4
INDIRF4
ASGNF4
line 750
;750:			color[3] = DC->Assets.dmcolor[3]; 
ADDRLP4 44+12
ADDRGP4 DC
INDIRP4
CNSTI4 62044
ADDP4
INDIRF4
ASGNF4
line 751
;751:		} 
LABELV $389
LABELV $383
line 753
;752:
;753:	  DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize, color);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 756
;754:
;755:#endif
;756:	}
ADDRGP4 $379
JUMPV
LABELV $380
line 757
;757:	else {
line 758
;758:      DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize, w->borderColor);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 759
;759:    }
line 760
;760:  } else if (w->border == WINDOW_BORDER_HORZ) {
ADDRGP4 $379
JUMPV
LABELV $378
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 2
NEI4 $397
line 762
;761:    // top/bottom
;762:    DC->setColor(w->borderColor);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 763
;763:    DC->drawTopBottom(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRGP4 DC
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 764
;764:  	DC->setColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 765
;765:  } else if (w->border == WINDOW_BORDER_VERT) {
ADDRGP4 $398
JUMPV
LABELV $397
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 3
NEI4 $399
line 767
;766:    // left right
;767:    DC->setColor(w->borderColor);
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 768
;768:    DC->drawSides(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRGP4 DC
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CALLV
pop
line 769
;769:  	DC->setColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 770
;770:  } else if (w->border == WINDOW_BORDER_KCGRADIENT) {
ADDRGP4 $400
JUMPV
LABELV $399
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 4
NEI4 $401
line 772
;771:    // this is just two gradient bars along each horz edge
;772:    rectDef_t r = w->rect;
ADDRLP4 44
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 20
line 773
;773:    r.h = w->borderSize;
ADDRLP4 44+12
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ASGNF4
line 774
;774:    GradientBar_Paint(&r, w->borderColor);
ADDRLP4 44
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
line 775
;775:    r.y = w->rect.y + w->rect.h - 1;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44+4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 776
;776:    GradientBar_Paint(&r, w->borderColor);
ADDRLP4 44
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 GradientBar_Paint
CALLV
pop
line 777
;777:  }
LABELV $401
LABELV $400
LABELV $398
LABELV $379
line 779
;778:
;779:}
LABELV $275
endproc Window_Paint 72 36
export Item_SetScreenCoords
proc Item_SetScreenCoords 16 0
line 782
;780:
;781:
;782:void Item_SetScreenCoords(itemDef_t *item, float x, float y) {
line 784
;783:  
;784:  if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $406
line 785
;785:    return;
ADDRGP4 $405
JUMPV
LABELV $406
line 788
;786:  }
;787:
;788:  if (item->window.border != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
EQI4 $408
line 789
;789:    x += item->window.borderSize;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 790
;790:    y += item->window.borderSize;
ADDRFP4 8
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 791
;791:  }
LABELV $408
line 793
;792:
;793:  item->window.rect.x = x + item->window.rectClient.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ASGNF4
line 794
;794:  item->window.rect.y = y + item->window.rectClient.y;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
line 795
;795:  item->window.rect.w = item->window.rectClient.w;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 796
;796:  item->window.rect.h = item->window.rectClient.h;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 799
;797:
;798:  // force the text rects to recompute
;799:  item->textRect.w = 0;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTF4 0
ASGNF4
line 800
;800:  item->textRect.h = 0;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTF4 0
ASGNF4
line 801
;801:}
LABELV $405
endproc Item_SetScreenCoords 16 0
export Item_UpdatePosition
proc Item_UpdatePosition 20 12
line 804
;802:
;803:// FIXME: consolidate this with nearby stuff
;804:void Item_UpdatePosition(itemDef_t *item) {
line 808
;805:  float x, y;
;806:  menuDef_t *menu;
;807:  
;808:  if (item == NULL || item->parent == NULL) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $413
ADDRLP4 12
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $411
LABELV $413
line 809
;809:    return;
ADDRGP4 $410
JUMPV
LABELV $411
line 812
;810:  }
;811:
;812:  menu = item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 814
;813:
;814:  x = menu->window.rect.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
line 815
;815:  y = menu->window.rect.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 817
;816:  
;817:  if (menu->window.border != 0) {
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
EQI4 $414
line 818
;818:    x += menu->window.borderSize;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 819
;819:    y += menu->window.borderSize;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 820
;820:  }
LABELV $414
line 822
;821:
;822:  Item_SetScreenCoords(item, x, y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 Item_SetScreenCoords
CALLV
pop
line 824
;823:
;824:}
LABELV $410
endproc Item_UpdatePosition 20 12
export Menu_UpdatePosition
proc Menu_UpdatePosition 12 12
line 827
;825:
;826:// menus
;827:void Menu_UpdatePosition(menuDef_t *menu) {
line 831
;828:  int i;
;829:  float x, y;
;830:
;831:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $417
line 832
;832:    return;
ADDRGP4 $416
JUMPV
LABELV $417
line 835
;833:  }
;834:  
;835:  x = menu->window.rect.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 836
;836:  y = menu->window.rect.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 837
;837:  if (menu->window.border != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
line 838
;838:    x += menu->window.borderSize;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 839
;839:    y += menu->window.borderSize;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 840
;840:  }
LABELV $419
line 842
;841:
;842:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $424
JUMPV
LABELV $421
line 843
;843:    Item_SetScreenCoords(menu->items[i], x, y);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 Item_SetScreenCoords
CALLV
pop
line 844
;844:  }
LABELV $422
line 842
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $424
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $421
line 845
;845:}
LABELV $416
endproc Menu_UpdatePosition 12 12
export Menu_PostParse
proc Menu_PostParse 0 4
line 847
;846:
;847:void Menu_PostParse(menuDef_t *menu) {
line 848
;848:	if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $426
line 849
;849:		return;
ADDRGP4 $425
JUMPV
LABELV $426
line 851
;850:	}
;851:	if (menu->fullScreen) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
line 852
;852:		menu->window.rect.x = 0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 853
;853:		menu->window.rect.y = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 854
;854:		menu->window.rect.w = 640;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1142947840
ASGNF4
line 855
;855:		menu->window.rect.h = 480;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1139802112
ASGNF4
line 856
;856:	}
LABELV $428
line 857
;857:	Menu_UpdatePosition(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_UpdatePosition
CALLV
pop
line 858
;858:}
LABELV $425
endproc Menu_PostParse 0 4
export Menu_ClearFocus
proc Menu_ClearFocus 20 8
line 860
;859:
;860:itemDef_t *Menu_ClearFocus(menuDef_t *menu) {
line 862
;861:  int i;
;862:  itemDef_t *ret = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 864
;863:
;864:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $431
line 865
;865:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $430
JUMPV
LABELV $431
line 868
;866:  }
;867:
;868:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $433
line 869
;869:    if (menu->items[i]->window.flags & WINDOW_HASFOCUS) {
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $437
line 870
;870:      ret = menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
line 871
;871:    } 
LABELV $437
line 872
;872:    menu->items[i]->window.flags &= ~WINDOW_HASFOCUS;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 873
;873:    if (menu->items[i]->leaveFocus) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 280
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $439
line 874
;874:      Item_RunScript(menu->items[i], menu->items[i]->leaveFocus);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 280
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 875
;875:    }
LABELV $439
line 876
;876:  }
LABELV $434
line 868
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $436
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $433
line 878
;877: 
;878:  return ret;
ADDRLP4 4
INDIRP4
RETP4
LABELV $430
endproc Menu_ClearFocus 20 8
export IsVisible
proc IsVisible 12 0
line 881
;879:}
;880:
;881:qboolean IsVisible(int flags) {
line 882
;882:  return (flags & WINDOW_VISIBLE && !(flags & WINDOW_FADINGOUT));
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $443
ADDRLP4 4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 8
INDIRI4
NEI4 $443
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $444
JUMPV
LABELV $443
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $444
ADDRLP4 0
INDIRI4
RETI4
LABELV $441
endproc IsVisible 12 0
export Rect_ContainsPoint
proc Rect_ContainsPoint 20 0
line 885
;883:}
;884:
;885:qboolean Rect_ContainsPoint(rectDef_t *rect, float x, float y) {
line 886
;886:  if (rect) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $446
line 887
;887:    if (x > rect->x && x < rect->x + rect->w && y > rect->y && y < rect->y + rect->h) {
ADDRLP4 0
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $448
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
GEF4 $448
ADDRLP4 12
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $448
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
GEF4 $448
line 888
;888:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $445
JUMPV
LABELV $448
line 890
;889:    }
;890:  }
LABELV $446
line 891
;891:  return qfalse;
CNSTI4 0
RETI4
LABELV $445
endproc Rect_ContainsPoint 20 0
export Menu_ItemsMatchingGroup
proc Menu_ItemsMatchingGroup 20 8
line 894
;892:}
;893:
;894:int Menu_ItemsMatchingGroup(menuDef_t *menu, const char *name) {
line 896
;895:  int i;
;896:  int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 897
;897:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $454
JUMPV
LABELV $451
line 898
;898:    if (Q_stricmp(menu->items[i]->window.name, name) == 0 || (menu->items[i]->window.group && Q_stricmp(menu->items[i]->window.group, name) == 0)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $457
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $455
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $455
LABELV $457
line 899
;899:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 900
;900:    } 
LABELV $455
line 901
;901:  }
LABELV $452
line 897
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $454
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $451
line 902
;902:  return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $450
endproc Menu_ItemsMatchingGroup 20 8
export Menu_GetMatchingItemByNumber
proc Menu_GetMatchingItemByNumber 20 8
line 905
;903:}
;904:
;905:itemDef_t *Menu_GetMatchingItemByNumber(menuDef_t *menu, int index, const char *name) {
line 907
;906:  int i;
;907:  int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 908
;908:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $462
JUMPV
LABELV $459
line 909
;909:    if (Q_stricmp(menu->items[i]->window.name, name) == 0 || (menu->items[i]->window.group && Q_stricmp(menu->items[i]->window.group, name) == 0)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $465
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $463
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $463
LABELV $465
line 910
;910:      if (count == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $466
line 911
;911:        return menu->items[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $458
JUMPV
LABELV $466
line 913
;912:      }
;913:      count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 914
;914:    } 
LABELV $463
line 915
;915:  }
LABELV $460
line 908
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $462
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $459
line 916
;916:  return NULL;
CNSTP4 0
RETP4
LABELV $458
endproc Menu_GetMatchingItemByNumber 20 8
export Script_SetColor
proc Script_SetColor 36 8
line 921
;917:}
;918:
;919:
;920:
;921:void Script_SetColor(itemDef_t *item, char **args) {
line 927
;922:  const char *name;
;923:  int i;
;924:  float f;
;925:  vec4_t *out;
;926:  // expecting type of color to set and 4 args for the color
;927:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $469
line 928
;928:      out = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 929
;929:      if (Q_stricmp(name, "backcolor") == 0) {
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $473
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $471
line 930
;930:        out = &item->window.backColor;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ASGNP4
line 931
;931:        item->window.flags |= WINDOW_BACKCOLORSET;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 4194304
BORI4
ASGNI4
line 932
;932:      } else if (Q_stricmp(name, "forecolor") == 0) {
ADDRGP4 $472
JUMPV
LABELV $471
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $476
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $474
line 933
;933:        out = &item->window.foreColor;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
line 934
;934:        item->window.flags |= WINDOW_FORECOLORSET;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 935
;935:      } else if (Q_stricmp(name, "bordercolor") == 0) {
ADDRGP4 $475
JUMPV
LABELV $474
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $477
line 936
;936:        out = &item->window.borderColor;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
line 937
;937:      }
LABELV $477
LABELV $475
LABELV $472
line 939
;938:
;939:      if (out) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $480
line 940
;940:        for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $482
line 941
;941:          if (!Float_Parse(args, &f)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $486
line 942
;942:            return;
ADDRGP4 $468
JUMPV
LABELV $486
line 944
;943:          }
;944:          (*out)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 945
;945:        }
LABELV $483
line 940
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $482
line 946
;946:      }
LABELV $480
line 947
;947:  }
LABELV $469
line 948
;948:}
LABELV $468
endproc Script_SetColor 36 8
export Script_SetAsset
proc Script_SetAsset 8 8
line 950
;949:
;950:void Script_SetAsset(itemDef_t *item, char **args) {
line 953
;951:  const char *name;
;952:  // expecting name to set asset to
;953:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $489
line 955
;954:    // check for a model 
;955:    if (item->type == ITEM_TYPE_MODEL) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 7
NEI4 $491
line 956
;956:    }
LABELV $491
line 957
;957:  }
LABELV $489
line 958
;958:}
LABELV $488
endproc Script_SetAsset 8 8
export Script_SetBackground
proc Script_SetBackground 12 8
line 960
;959:
;960:void Script_SetBackground(itemDef_t *item, char **args) {
line 963
;961:  const char *name;
;962:  // expecting name to set asset to
;963:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $494
line 964
;964:    item->window.background = DC->registerShaderNoMip(name);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 965
;965:  }
LABELV $494
line 966
;966:}
LABELV $493
endproc Script_SetBackground 12 8
export Menu_FindItemByName
proc Menu_FindItemByName 12 8
line 971
;967:
;968:
;969:
;970:
;971:itemDef_t *Menu_FindItemByName(menuDef_t *menu, const char *p) {
line 973
;972:  int i;
;973:  if (menu == NULL || p == NULL) {
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $499
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $497
LABELV $499
line 974
;974:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $496
JUMPV
LABELV $497
line 977
;975:  }
;976:
;977:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $503
JUMPV
LABELV $500
line 978
;978:    if (Q_stricmp(p, menu->items[i]->window.name) == 0) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $504
line 979
;979:      return menu->items[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $496
JUMPV
LABELV $504
line 981
;980:    }
;981:  }
LABELV $501
line 977
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $503
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $500
line 983
;982:
;983:  return NULL;
CNSTP4 0
RETP4
LABELV $496
endproc Menu_FindItemByName 12 8
export Script_SetTeamColor
proc Script_SetTeamColor 24 4
line 986
;984:}
;985:
;986:void Script_SetTeamColor(itemDef_t *item, char **args) {
line 987
;987:  if (DC->getTeamColor) {
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $507
line 990
;988:    int i;
;989:    vec4_t color;
;990:    DC->getTeamColor(&color);
ADDRLP4 4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 991
;991:    for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $509
line 992
;992:      item->window.backColor[i] = color[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ASGNF4
line 993
;993:    }
LABELV $510
line 991
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $509
line 994
;994:  }
LABELV $507
line 995
;995:}
LABELV $506
endproc Script_SetTeamColor 24 4
export Script_SetItemColor
proc Script_SetItemColor 80 12
line 997
;996:
;997:void Script_SetItemColor(itemDef_t *item, char **args) {
line 1004
;998:  const char *itemname;
;999:  const char *name;
;1000:  vec4_t color;
;1001:  int i;
;1002:  vec4_t *out;
;1003:  // expecting type of color to set and 4 args for the color
;1004:  if (String_Parse(args, &itemname) && String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $514
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 36
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $514
line 1007
;1005:    itemDef_t *item2;
;1006:    int j;
;1007:    int count = Menu_ItemsMatchingGroup(item->parent, itemname);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 52
INDIRI4
ASGNI4
line 1009
;1008:
;1009:    if (!Color_Parse(args, &color)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 Color_Parse
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $516
line 1010
;1010:      return;
ADDRGP4 $513
JUMPV
LABELV $516
line 1013
;1011:    }
;1012:
;1013:    for (j = 0; j < count; j++) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $521
JUMPV
LABELV $518
line 1014
;1014:      item2 = Menu_GetMatchingItemByNumber(item->parent, j, itemname);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 60
INDIRP4
ASGNP4
line 1015
;1015:      if (item2 != NULL) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $522
line 1016
;1016:        out = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1017
;1017:        if (Q_stricmp(name, "backcolor") == 0) {
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $473
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $524
line 1018
;1018:          out = &item2->window.backColor;
ADDRLP4 4
ADDRLP4 44
INDIRP4
CNSTI4 144
ADDP4
ASGNP4
line 1019
;1019:        } else if (Q_stricmp(name, "forecolor") == 0) {
ADDRGP4 $525
JUMPV
LABELV $524
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $476
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $526
line 1020
;1020:          out = &item2->window.foreColor;
ADDRLP4 4
ADDRLP4 44
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
line 1021
;1021:          item2->window.flags |= WINDOW_FORECOLORSET;
ADDRLP4 72
ADDRLP4 44
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1022
;1022:        } else if (Q_stricmp(name, "bordercolor") == 0) {
ADDRGP4 $527
JUMPV
LABELV $526
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $528
line 1023
;1023:          out = &item2->window.borderColor;
ADDRLP4 4
ADDRLP4 44
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
line 1024
;1024:        }
LABELV $528
LABELV $527
LABELV $525
line 1026
;1025:
;1026:        if (out) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $530
line 1027
;1027:          for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $532
line 1028
;1028:            (*out)[i] = color[i];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ASGNF4
line 1029
;1029:          }
LABELV $533
line 1027
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $532
line 1030
;1030:        }
LABELV $530
line 1031
;1031:      }
LABELV $522
line 1032
;1032:    }
LABELV $519
line 1013
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $521
ADDRLP4 40
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $518
line 1033
;1033:  }
LABELV $514
line 1034
;1034:}
LABELV $513
endproc Script_SetItemColor 80 12
export Menu_ShowItemByName
proc Menu_ShowItemByName 24 12
line 1037
;1035:
;1036:
;1037:void Menu_ShowItemByName(menuDef_t *menu, const char *p, qboolean bShow) {
line 1040
;1038:	itemDef_t *item;
;1039:	int i;
;1040:	int count = Menu_ItemsMatchingGroup(menu, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1041
;1041:	for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $540
JUMPV
LABELV $537
line 1042
;1042:		item = Menu_GetMatchingItemByNumber(menu, i, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1043
;1043:		if (item != NULL) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $541
line 1044
;1044:			if (bShow) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $543
line 1045
;1045:				item->window.flags |= WINDOW_VISIBLE;
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1046
;1046:			} else {
ADDRGP4 $544
JUMPV
LABELV $543
line 1047
;1047:				item->window.flags &= ~WINDOW_VISIBLE;
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1049
;1048:				// stop cinematics playing in the window
;1049:				if (item->window.cinematic >= 0) {
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $545
line 1050
;1050:					DC->stopCinematic(item->window.cinematic);
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 188
ADDP4
INDIRP4
CALLV
pop
line 1051
;1051:					item->window.cinematic = -1;
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 -1
ASGNI4
line 1052
;1052:				}
LABELV $545
line 1053
;1053:			}
LABELV $544
line 1054
;1054:		}
LABELV $541
line 1055
;1055:	}
LABELV $538
line 1041
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $540
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $537
line 1056
;1056:}
LABELV $536
endproc Menu_ShowItemByName 24 12
export Menu_FadeItemByName
proc Menu_FadeItemByName 28 12
line 1058
;1057:
;1058:void Menu_FadeItemByName(menuDef_t *menu, const char *p, qboolean fadeOut) {
line 1061
;1059:  itemDef_t *item;
;1060:  int i;
;1061:  int count = Menu_ItemsMatchingGroup(menu, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1062
;1062:  for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $551
JUMPV
LABELV $548
line 1063
;1063:    item = Menu_GetMatchingItemByNumber(menu, i, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1064
;1064:    if (item != NULL) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $552
line 1065
;1065:      if (fadeOut) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $554
line 1066
;1066:        item->window.flags |= (WINDOW_FADINGOUT | WINDOW_VISIBLE);
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 36
BORI4
ASGNI4
line 1067
;1067:        item->window.flags &= ~WINDOW_FADINGIN;
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 1068
;1068:      } else {
ADDRGP4 $555
JUMPV
LABELV $554
line 1069
;1069:        item->window.flags |= (WINDOW_VISIBLE | WINDOW_FADINGIN);
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 68
BORI4
ASGNI4
line 1070
;1070:        item->window.flags &= ~WINDOW_FADINGOUT;
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 1071
;1071:      }
LABELV $555
line 1072
;1072:    }
LABELV $552
line 1073
;1073:  }
LABELV $549
line 1062
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $551
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $548
line 1074
;1074:}
LABELV $547
endproc Menu_FadeItemByName 28 12
export Menus_FindByName
proc Menus_FindByName 8 8
line 1076
;1075:
;1076:menuDef_t *Menus_FindByName(const char *p) {
line 1078
;1077:  int i;
;1078:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $560
JUMPV
LABELV $557
line 1079
;1079:    if (Q_stricmp(Menus[i].window.name, p) == 0) {
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+40
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $561
line 1080
;1080:      return &Menus[i];
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
RETP4
ADDRGP4 $556
JUMPV
LABELV $561
line 1082
;1081:    } 
;1082:  }
LABELV $558
line 1078
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $560
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $557
line 1083
;1083:  return NULL;
CNSTP4 0
RETP4
LABELV $556
endproc Menus_FindByName 8 8
export Menus_ShowByName
proc Menus_ShowByName 8 4
line 1086
;1084:}
;1085:
;1086:void Menus_ShowByName(const char *p) {
line 1087
;1087:	menuDef_t *menu = Menus_FindByName(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1088
;1088:	if (menu) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
line 1089
;1089:		Menus_Activate(menu);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menus_Activate
CALLV
pop
line 1090
;1090:	}
LABELV $565
line 1091
;1091:}
LABELV $564
endproc Menus_ShowByName 8 4
export Menus_OpenByName
proc Menus_OpenByName 0 4
line 1093
;1092:
;1093:void Menus_OpenByName(const char *p) {
line 1094
;1094:  Menus_ActivateByName(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 1095
;1095:}
LABELV $567
endproc Menus_OpenByName 0 4
proc Menu_RunCloseScript 576 8
line 1097
;1096:
;1097:static void Menu_RunCloseScript(menuDef_t *menu) {
line 1098
;1098:	if (menu && menu->window.flags & WINDOW_VISIBLE && menu->onClose) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $569
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $569
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $569
line 1100
;1099:		itemDef_t item;
;1100:    item.parent = menu;
ADDRLP4 8+248
ADDRFP4 0
INDIRP4
ASGNP4
line 1101
;1101:    Item_RunScript(&item, menu->onClose);
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1102
;1102:	}
LABELV $569
line 1103
;1103:}
LABELV $568
endproc Menu_RunCloseScript 576 8
export Menus_CloseByName
proc Menus_CloseByName 12 4
line 1105
;1104:
;1105:void Menus_CloseByName(const char *p) {
line 1106
;1106:  menuDef_t *menu = Menus_FindByName(p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1107
;1107:  if (menu != NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $573
line 1108
;1108:		Menu_RunCloseScript(menu);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_RunCloseScript
CALLV
pop
line 1109
;1109:		menu->window.flags &= ~(WINDOW_VISIBLE | WINDOW_HASFOCUS);
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -7
BANDI4
ASGNI4
line 1110
;1110:  }
LABELV $573
line 1111
;1111:}
LABELV $572
endproc Menus_CloseByName 12 4
export Menus_CloseAll
proc Menus_CloseAll 8 4
line 1113
;1112:
;1113:void Menus_CloseAll() {
line 1115
;1114:  int i;
;1115:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $579
JUMPV
LABELV $576
line 1116
;1116:		Menu_RunCloseScript(&Menus[i]);
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRGP4 Menu_RunCloseScript
CALLV
pop
line 1117
;1117:		Menus[i].window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
ADDRLP4 4
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+76
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -7
BANDI4
ASGNI4
line 1118
;1118:  }
LABELV $577
line 1115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $579
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $576
line 1119
;1119:}
LABELV $575
endproc Menus_CloseAll 8 4
export Script_Show
proc Script_Show 8 12
line 1122
;1120:
;1121:
;1122:void Script_Show(itemDef_t *item, char **args) {
line 1124
;1123:  const char *name;
;1124:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $582
line 1125
;1125:    Menu_ShowItemByName(item->parent, name, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1126
;1126:  }
LABELV $582
line 1127
;1127:}
LABELV $581
endproc Script_Show 8 12
export Script_Hide
proc Script_Hide 8 12
line 1129
;1128:
;1129:void Script_Hide(itemDef_t *item, char **args) {
line 1131
;1130:  const char *name;
;1131:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $585
line 1132
;1132:    Menu_ShowItemByName(item->parent, name, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1133
;1133:  }
LABELV $585
line 1134
;1134:}
LABELV $584
endproc Script_Hide 8 12
export Script_FadeIn
proc Script_FadeIn 8 12
line 1136
;1135:
;1136:void Script_FadeIn(itemDef_t *item, char **args) {
line 1138
;1137:  const char *name;
;1138:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $588
line 1139
;1139:    Menu_FadeItemByName(item->parent, name, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_FadeItemByName
CALLV
pop
line 1140
;1140:  }
LABELV $588
line 1141
;1141:}
LABELV $587
endproc Script_FadeIn 8 12
export Script_FadeOut
proc Script_FadeOut 8 12
line 1143
;1142:
;1143:void Script_FadeOut(itemDef_t *item, char **args) {
line 1145
;1144:  const char *name;
;1145:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $591
line 1146
;1146:    Menu_FadeItemByName(item->parent, name, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_FadeItemByName
CALLV
pop
line 1147
;1147:  }
LABELV $591
line 1148
;1148:}
LABELV $590
endproc Script_FadeOut 8 12
export Script_Open
proc Script_Open 8 8
line 1152
;1149:
;1150:
;1151:
;1152:void Script_Open(itemDef_t *item, char **args) {
line 1154
;1153:  const char *name;
;1154:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $594
line 1155
;1155:    Menus_OpenByName(name);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 1156
;1156:  }
LABELV $594
line 1157
;1157:}
LABELV $593
endproc Script_Open 8 8
export Script_Close
proc Script_Close 8 8
line 1159
;1158:
;1159:void Script_Close(itemDef_t *item, char **args) {
line 1161
;1160:  const char *name;
;1161:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $597
line 1162
;1162:    Menus_CloseByName(name);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 1163
;1163:  }
LABELV $597
line 1164
;1164:}
LABELV $596
endproc Script_Close 8 8
export Menu_TransitionItemByName
proc Menu_TransitionItemByName 56 12
line 1166
;1165:
;1166:void Menu_TransitionItemByName(menuDef_t *menu, const char *p, rectDef_t rectFrom, rectDef_t rectTo, int time, float amt) {
line 1169
;1167:  itemDef_t *item;
;1168:  int i;
;1169:  int count = Menu_ItemsMatchingGroup(menu, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1170
;1170:  for (i = 0; i < count; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $603
JUMPV
LABELV $600
line 1171
;1171:    item = Menu_GetMatchingItemByNumber(menu, i, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1172
;1172:    if (item != NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $604
line 1173
;1173:      item->window.flags |= (WINDOW_INTRANSITION | WINDOW_VISIBLE);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 260
BORI4
ASGNI4
line 1174
;1174:      item->window.offsetTime = time;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 1175
;1175:			memcpy(&item->window.rectClient, &rectFrom, sizeof(rectDef_t));
ADDRLP4 24
CNSTI4 20
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1176
;1176:			memcpy(&item->window.rectEffects, &rectTo, sizeof(rectDef_t));
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1177
;1177:			item->window.rectEffects2.x = abs(rectTo.x - rectFrom.x) / amt;
ADDRFP4 12
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 28
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
DIVF4
ASGNF4
line 1178
;1178:			item->window.rectEffects2.y = abs(rectTo.y - rectFrom.y) / amt;
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 36
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
DIVF4
ASGNF4
line 1179
;1179:			item->window.rectEffects2.w = abs(rectTo.w - rectFrom.w) / amt;
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 44
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 44
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
DIVF4
ASGNF4
line 1180
;1180:			item->window.rectEffects2.h = abs(rectTo.h - rectFrom.h) / amt;
ADDRLP4 48
CNSTI4 12
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 52
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 52
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
DIVF4
ASGNF4
line 1181
;1181:      Item_UpdatePosition(item);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Item_UpdatePosition
CALLV
pop
line 1182
;1182:    }
LABELV $604
line 1183
;1183:  }
LABELV $601
line 1170
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $603
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $600
line 1184
;1184:}
LABELV $599
endproc Menu_TransitionItemByName 56 12
export Script_Transition
proc Script_Transition 112 24
line 1187
;1185:
;1186:
;1187:void Script_Transition(itemDef_t *item, char **args) {
line 1193
;1188:  const char *name;
;1189:	rectDef_t rectFrom, rectTo;
;1190:  int time;
;1191:	float amt;
;1192:
;1193:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 52
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $607
line 1194
;1194:    if ( Rect_Parse(args, &rectFrom) && Rect_Parse(args, &rectTo) && Int_Parse(args, &time) && Float_Parse(args, &amt)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 56
ADDRGP4 Rect_Parse
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $609
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 60
ADDRGP4 Rect_Parse
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $609
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 64
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $609
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 68
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $609
line 1195
;1195:      Menu_TransitionItemByName(item->parent, name, rectFrom, rectTo, time, amt);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRLP4 4
INDIRB
ASGNB 20
ADDRLP4 72
ARGP4
ADDRLP4 92
ADDRLP4 24
INDIRB
ASGNB 20
ADDRLP4 92
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 48
INDIRF4
ARGF4
ADDRGP4 Menu_TransitionItemByName
CALLV
pop
line 1196
;1196:    }
LABELV $609
line 1197
;1197:  }
LABELV $607
line 1198
;1198:}
LABELV $606
endproc Script_Transition 112 24
export Menu_OrbitItemByName
proc Menu_OrbitItemByName 24 12
line 1201
;1199:
;1200:
;1201:void Menu_OrbitItemByName(menuDef_t *menu, const char *p, float x, float y, float cx, float cy, int time) {
line 1204
;1202:  itemDef_t *item;
;1203:  int i;
;1204:  int count = Menu_ItemsMatchingGroup(menu, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemsMatchingGroup
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1205
;1205:  for (i = 0; i < count; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $615
JUMPV
LABELV $612
line 1206
;1206:    item = Menu_GetMatchingItemByNumber(menu, i, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Menu_GetMatchingItemByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1207
;1207:    if (item != NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $616
line 1208
;1208:      item->window.flags |= (WINDOW_ORBITING | WINDOW_VISIBLE);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 65540
BORI4
ASGNI4
line 1209
;1209:      item->window.offsetTime = time;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 1210
;1210:      item->window.rectEffects.x = cx;
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 1211
;1211:      item->window.rectEffects.y = cy;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 20
INDIRF4
ASGNF4
line 1212
;1212:      item->window.rectClient.x = x;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 1213
;1213:      item->window.rectClient.y = y;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 1214
;1214:      Item_UpdatePosition(item);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Item_UpdatePosition
CALLV
pop
line 1215
;1215:    }
LABELV $616
line 1216
;1216:  }
LABELV $613
line 1205
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $615
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $612
line 1217
;1217:}
LABELV $611
endproc Menu_OrbitItemByName 24 12
export Script_Orbit
proc Script_Orbit 48 28
line 1220
;1218:
;1219:
;1220:void Script_Orbit(itemDef_t *item, char **args) {
line 1225
;1221:  const char *name;
;1222:  float cx, cy, x, y;
;1223:  int time;
;1224:
;1225:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $619
line 1226
;1226:    if ( Float_Parse(args, &x) && Float_Parse(args, &y) && Float_Parse(args, &cx) && Float_Parse(args, &cy) && Int_Parse(args, &time) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $621
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $621
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $621
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
ADDRGP4 Float_Parse
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $621
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 44
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $621
line 1227
;1227:      Menu_OrbitItemByName(item->parent, name, x, y, cx, cy, time);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 Menu_OrbitItemByName
CALLV
pop
line 1228
;1228:    }
LABELV $621
line 1229
;1229:  }
LABELV $619
line 1230
;1230:}
LABELV $618
endproc Script_Orbit 48 28
export Script_SetFocus
proc Script_SetFocus 36 8
line 1234
;1231:
;1232:
;1233:
;1234:void Script_SetFocus(itemDef_t *item, char **args) {
line 1238
;1235:  const char *name;
;1236:  itemDef_t *focusItem;
;1237:
;1238:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $624
line 1239
;1239:    focusItem = Menu_FindItemByName(item->parent, name);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Menu_FindItemByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1240
;1240:    if (focusItem && !(focusItem->window.flags & WINDOW_DECORATION) && !(focusItem->window.flags & WINDOW_HASFOCUS)) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $626
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $626
ADDRLP4 20
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $626
line 1241
;1241:      Menu_ClearFocus(item->parent);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRGP4 Menu_ClearFocus
CALLP4
pop
line 1242
;1242:      focusItem->window.flags |= WINDOW_HASFOCUS;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1243
;1243:      if (focusItem->onFocus) {
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $628
line 1244
;1244:        Item_RunScript(focusItem, focusItem->onFocus);
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 276
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1245
;1245:      }
LABELV $628
line 1246
;1246:      if (DC->Assets.itemFocusSound) {
ADDRGP4 DC
INDIRP4
CNSTI4 61952
ADDP4
INDIRI4
CNSTI4 0
EQI4 $630
line 1247
;1247:        DC->startLocalSound( DC->Assets.itemFocusSound, CHAN_LOCAL_SOUND );
ADDRLP4 32
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 61952
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 116
ADDP4
INDIRP4
CALLV
pop
line 1248
;1248:      }
LABELV $630
line 1249
;1249:    }
LABELV $626
line 1250
;1250:  }
LABELV $624
line 1251
;1251:}
LABELV $623
endproc Script_SetFocus 36 8
export Script_SetPlayerModel
proc Script_SetPlayerModel 8 8
line 1253
;1252:
;1253:void Script_SetPlayerModel(itemDef_t *item, char **args) {
line 1255
;1254:  const char *name;
;1255:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $633
line 1256
;1256:    DC->setCVar("team_model", name);
ADDRGP4 $635
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 1257
;1257:  }
LABELV $633
line 1258
;1258:}
LABELV $632
endproc Script_SetPlayerModel 8 8
export Script_SetPlayerHead
proc Script_SetPlayerHead 8 8
line 1260
;1259:
;1260:void Script_SetPlayerHead(itemDef_t *item, char **args) {
line 1262
;1261:  const char *name;
;1262:  if (String_Parse(args, &name)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $637
line 1263
;1263:    DC->setCVar("team_headmodel", name);
ADDRGP4 $639
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 1264
;1264:  }
LABELV $637
line 1265
;1265:}
LABELV $636
endproc Script_SetPlayerHead 8 8
export Script_SetCvar
proc Script_SetCvar 16 8
line 1267
;1266:
;1267:void Script_SetCvar(itemDef_t *item, char **args) {
line 1269
;1268:	const char *cvar, *val;
;1269:	if (String_Parse(args, &cvar) && String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $641
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $641
line 1270
;1270:		DC->setCVar(cvar, val);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 1271
;1271:	}
LABELV $641
line 1273
;1272:	
;1273:}
LABELV $640
endproc Script_SetCvar 16 8
export Script_Exec
proc Script_Exec 12 8
line 1275
;1274:
;1275:void Script_Exec(itemDef_t *item, char **args) {
line 1277
;1276:	const char *val;
;1277:	if (String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $644
line 1278
;1278:		DC->executeText(EXEC_APPEND, va("%s ; ", val));
ADDRGP4 $646
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 152
ADDP4
INDIRP4
CALLV
pop
line 1279
;1279:	}
LABELV $644
line 1280
;1280:}
LABELV $643
endproc Script_Exec 12 8
export Script_Play
proc Script_Play 12 8
line 1282
;1281:
;1282:void Script_Play(itemDef_t *item, char **args) {
line 1284
;1283:	const char *val;
;1284:	if (String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $648
line 1285
;1285:		DC->startLocalSound(DC->registerSound(val, qfalse), CHAN_LOCAL_SOUND);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 172
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 116
ADDP4
INDIRP4
CALLV
pop
line 1286
;1286:	}
LABELV $648
line 1287
;1287:}
LABELV $647
endproc Script_Play 12 8
export Script_playLooped
proc Script_playLooped 12 8
line 1289
;1288:
;1289:void Script_playLooped(itemDef_t *item, char **args) {
line 1291
;1290:	const char *val;
;1291:	if (String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $651
line 1292
;1292:		DC->stopBackgroundTrack();
ADDRGP4 DC
INDIRP4
CNSTI4 180
ADDP4
INDIRP4
CALLV
pop
line 1293
;1293:		DC->startBackgroundTrack(val, val);
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 176
ADDP4
INDIRP4
CALLV
pop
line 1294
;1294:	}
LABELV $651
line 1295
;1295:}
LABELV $650
endproc Script_playLooped 12 8
export UI_WriteWeaponConfig
proc UI_WriteWeaponConfig 2264 16
line 1324
;1296:
;1297:#ifndef CGAME
;1298:void	trap_Printf( const char *fmt );
;1299:void	trap_Error( const char *fmt );
;1300:int		trap_Milliseconds( void );
;1301:int		trap_Argc( void );
;1302:void	trap_Argv( int n, char *buffer, int bufferLength );
;1303:void	trap_Args( char *buffer, int bufferLength );
;1304:int		trap_FS_FOpenFile( const char *qpath, fileHandle_t *f, fsMode_t mode );
;1305:void	trap_FS_Read( void *buffer, int len, fileHandle_t f );
;1306:void	trap_FS_Write( const void *buffer, int len, fileHandle_t f );
;1307:void	trap_FS_FCloseFile( fileHandle_t f );
;1308:int		trap_FS_GetFileList( const char *path, const char *extension, char *listbuf, int bufsize );
;1309:void	trap_SendConsoleCommand( int exec_when, const char *text );
;1310:void	trap_Cvar_Register( vmCvar_t *cvar, const char *var_name, const char *value, int flags );
;1311:void	trap_Cvar_Update( vmCvar_t *cvar );
;1312:void	trap_Cvar_Set( const char *var_name, const char *value );
;1313:int		trap_Cvar_VariableIntegerValue( const char *var_name );
;1314:float	trap_Cvar_VariableValue( const char *var_name );
;1315:void	trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize );
;1316:#endif
;1317:/*
;1318:=================
;1319:UI_WriteConfig
;1320:
;1321:Write a configfile for the player
;1322:=================
;1323:*/
;1324:void UI_WriteWeaponConfig( const char *filename ) {
line 1329
;1325:	fileHandle_t	configFile; 
;1326:	char			string[1024]; 
;1327:	char			var[MAX_TOKEN_CHARS];
;1328:
;1329:	if ( !Q_stricmp(filename,"autoteam") )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $656
ARGP4
ADDRLP4 2052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $654
line 1330
;1330:	{
line 1333
;1331:		int team;
;1332:
;1333:		trap_Cvar_VariableStringBuffer("ui_team", var , sizeof(var ) );
ADDRGP4 $657
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1335
;1334:
;1335:		team = atoi(var);
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2056
ADDRLP4 2060
INDIRI4
ASGNI4
line 1337
;1336:
;1337:		if ( team == 1 ) // red
ADDRLP4 2056
INDIRI4
CNSTI4 1
NEI4 $658
line 1338
;1338:			Com_sprintf( string, sizeof(string), "configs/seals.cfg" );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $660
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $655
JUMPV
LABELV $658
line 1339
;1339:		else if ( team == 2 )
ADDRLP4 2056
INDIRI4
CNSTI4 2
NEI4 $661
line 1340
;1340:			Com_sprintf( string, sizeof(string), "configs/tangos.cfg" );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $663
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $655
JUMPV
LABELV $661
line 1342
;1341:		else
;1342:			Com_sprintf( string, sizeof(string), "configs/ffa.cfg" );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $664
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1343
;1343:	}
ADDRGP4 $655
JUMPV
LABELV $654
line 1345
;1344:	else
;1345:		Com_sprintf( string, sizeof(string), "configs/%s", filename );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $665
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $655
line 1347
;1346:	
;1347:	trap_FS_FOpenFile( string, &configFile, FS_WRITE );
ADDRLP4 0
ARGP4
ADDRLP4 2048
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 1349
;1348:
;1349:	if ( !configFile ) {
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $666
line 1350
;1350:		return;
ADDRGP4 $653
JUMPV
LABELV $666
line 1353
;1351:	} 
;1352:
;1353:	Com_sprintf( string, sizeof(string), "// This file has been generated by Navy Seals\n// Navy Seals:Covert Operations (c) 2000-2001 team-mirage\n// http://www.team-mirage.net\n" );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $668
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1354
;1354:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2056
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1359
;1355:
;1356:	//
;1357:	// secondaries
;1358:	//
;1359:	trap_Cvar_VariableStringBuffer("inven_lasersight_secondary", var , sizeof(var ) );
ADDRGP4 $669
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1360
;1360:	Com_sprintf( string, sizeof(string), "seta inven_lasersight_secondary %i\n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $670
ARGP4
ADDRLP4 2060
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1361
;1361:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2064
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1363
;1362:
;1363:	trap_Cvar_VariableStringBuffer("inven_bayonet_secondary", var , sizeof(var ) );
ADDRGP4 $671
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1364
;1364:	Com_sprintf( string, sizeof(string), "seta inven_bayonet_secondary %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $672
ARGP4
ADDRLP4 2068
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1365
;1365:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2072
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1367
;1366:
;1367:	trap_Cvar_VariableStringBuffer("inven_grenadelauncher_secondary", var , sizeof(var ) );
ADDRGP4 $673
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1368
;1368:	Com_sprintf( string, sizeof(string), "seta inven_grenadelauncher_secondary %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $674
ARGP4
ADDRLP4 2076
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1369
;1369:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2080
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1371
;1370:
;1371:	trap_Cvar_VariableStringBuffer("inven_scope_secondary", var , sizeof(var ) );
ADDRGP4 $675
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1372
;1372:	Com_sprintf( string, sizeof(string), "seta inven_scope_secondary %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $676
ARGP4
ADDRLP4 2084
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1373
;1373:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2088
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2088
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1375
;1374:
;1375:	trap_Cvar_VariableStringBuffer("inven_silencer_secondary", var , sizeof(var ) );
ADDRGP4 $677
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1376
;1376:	Com_sprintf( string, sizeof(string), "seta inven_silencer_secondary %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2092
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $678
ARGP4
ADDRLP4 2092
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1377
;1377:	trap_FS_Write( string, strlen( string ), configFile ); 
ADDRLP4 0
ARGP4
ADDRLP4 2096
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2096
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1384
;1378:
;1379:
;1380:	//
;1381:	// primaries
;1382:	//
;1383:
;1384:	trap_Cvar_VariableStringBuffer("inven_lasersight", var , sizeof(var ) );
ADDRGP4 $679
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1385
;1385:	Com_sprintf( string, sizeof(string), "seta inven_lasersight %i\n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $680
ARGP4
ADDRLP4 2100
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1386
;1386:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2104
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2104
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1388
;1387:
;1388:	trap_Cvar_VariableStringBuffer("inven_bayonet", var , sizeof(var ) );
ADDRGP4 $681
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1389
;1389:	Com_sprintf( string, sizeof(string), "seta inven_bayonet %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $682
ARGP4
ADDRLP4 2108
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1390
;1390:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2112
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2112
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1392
;1391:
;1392:	trap_Cvar_VariableStringBuffer("inven_grenadelauncher", var , sizeof(var ) );
ADDRGP4 $683
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1393
;1393:	Com_sprintf( string, sizeof(string), "seta inven_grenadelauncher %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $684
ARGP4
ADDRLP4 2116
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1394
;1394:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2120
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2120
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1396
;1395:
;1396:	trap_Cvar_VariableStringBuffer("inven_scope", var , sizeof(var ) );
ADDRGP4 $685
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1397
;1397:	Com_sprintf( string, sizeof(string), "seta inven_scope %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $686
ARGP4
ADDRLP4 2124
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1398
;1398:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2128
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2128
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1400
;1399:
;1400:	trap_Cvar_VariableStringBuffer("inven_duckbill", var , sizeof(var ) );
ADDRGP4 $687
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1401
;1401:	Com_sprintf( string, sizeof(string), "seta inven_duckbill %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $688
ARGP4
ADDRLP4 2132
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1402
;1402:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2136
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1404
;1403:
;1404:	trap_Cvar_VariableStringBuffer("inven_flashlight", var , sizeof(var ) );
ADDRGP4 $689
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1405
;1405:	Com_sprintf( string, sizeof(string), "seta inven_flashlight %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $690
ARGP4
ADDRLP4 2140
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1406
;1406:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2144
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2144
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1408
;1407:
;1408:	trap_Cvar_VariableStringBuffer("inven_silencer", var , sizeof(var ) );
ADDRGP4 $691
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1409
;1409:	Com_sprintf( string, sizeof(string), "seta inven_silencer %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $692
ARGP4
ADDRLP4 2148
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1410
;1410:	trap_FS_Write( string, strlen( string ), configFile ); 
ADDRLP4 0
ARGP4
ADDRLP4 2152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2152
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1414
;1411:
;1412:	// items
;1413:
;1414:	trap_Cvar_VariableStringBuffer("inven_helmet", var , sizeof(var ) );
ADDRGP4 $693
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1415
;1415:	Com_sprintf( string, sizeof(string), "seta inven_helmet %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $694
ARGP4
ADDRLP4 2156
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1416
;1416:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2160
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2160
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1418
;1417:
;1418:	trap_Cvar_VariableStringBuffer("inven_kevlar", var , sizeof(var ) );
ADDRGP4 $695
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1419
;1419:	Com_sprintf( string, sizeof(string), "seta inven_kevlar %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $696
ARGP4
ADDRLP4 2164
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1420
;1420:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2168
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2168
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1424
;1421:
;1422:	// ammo
;1423:
;1424:	trap_Cvar_VariableStringBuffer("inven_ammo_flash", var , sizeof(var ) );
ADDRGP4 $697
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1425
;1425:	Com_sprintf( string, sizeof(string), "seta inven_ammo_flash %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $698
ARGP4
ADDRLP4 2172
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1426
;1426:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2176
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2176
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1428
;1427:	
;1428:	trap_Cvar_VariableStringBuffer("inven_ammo_smoke", var , sizeof(var ) );
ADDRGP4 $699
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1429
;1429:	Com_sprintf( string, sizeof(string), "seta inven_ammo_smoke %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2180
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $700
ARGP4
ADDRLP4 2180
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1430
;1430:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2184
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2184
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1432
;1431:
;1432:	trap_Cvar_VariableStringBuffer("inven_ammo_mk26", var , sizeof(var ) );
ADDRGP4 $701
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1433
;1433:	Com_sprintf( string, sizeof(string), "seta inven_ammo_mk26 %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2188
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $702
ARGP4
ADDRLP4 2188
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1434
;1434:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2192
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1436
;1435:
;1436:	trap_Cvar_VariableStringBuffer("inven_ammo_40mmgren", var , sizeof(var ) );
ADDRGP4 $703
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1437
;1437:	Com_sprintf( string, sizeof(string), "seta inven_ammo_40mmgren %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $704
ARGP4
ADDRLP4 2196
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1438
;1438:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2200
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1440
;1439:
;1440:	trap_Cvar_VariableStringBuffer("inven_ammo_primary", var , sizeof(var ) );
ADDRGP4 $705
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1441
;1441:	Com_sprintf( string, sizeof(string), "seta inven_ammo_primary %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $706
ARGP4
ADDRLP4 2204
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1442
;1442:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2208
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2208
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1444
;1443:
;1444:	trap_Cvar_VariableStringBuffer("inven_ammo_secondary", var , sizeof(var ) );
ADDRGP4 $707
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1445
;1445:	Com_sprintf( string, sizeof(string), "seta inven_ammo_secondary %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2212
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $708
ARGP4
ADDRLP4 2212
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1446
;1446:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2216
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2216
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1450
;1447:
;1448:	// weaponlist
;1449:
;1450:	trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $709
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1451
;1451:	Com_sprintf( string, sizeof(string), "seta inven_primary %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2220
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $710
ARGP4
ADDRLP4 2220
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1452
;1452:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2224
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2224
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1454
;1453:
;1454:	trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof(var ) );
ADDRGP4 $711
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1455
;1455:	Com_sprintf( string, sizeof(string), "seta inven_secondary %i \n", atoi(var) );
ADDRLP4 1024
ARGP4
ADDRLP4 2228
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $712
ARGP4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1456
;1456:	trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2232
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1459
;1457:
;1458:  
;1459:	if ( !Q_stricmp( filename, "tangos.cfg" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $715
ARGP4
ADDRLP4 2236
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2236
INDIRI4
CNSTI4 0
NEI4 $713
line 1460
;1460:	{
line 1461
;1461:		trap_Cvar_VariableStringBuffer("ui_t_e_eyes", var , sizeof(var ) );
ADDRGP4 $716
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1462
;1462:		Com_sprintf( string, sizeof(string), "seta ui_t_e_eyes \"%s\" \n",  var);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $717
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1463
;1463:		trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2240
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1465
;1464:
;1465:		trap_Cvar_VariableStringBuffer("ui_t_e_head", var , sizeof(var ) );
ADDRGP4 $718
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1466
;1466:		Com_sprintf( string, sizeof(string), "seta ui_t_e_head \"%s\" \n",   var);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $719
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1467
;1467:		trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2244
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2244
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1469
;1468:
;1469:		trap_Cvar_VariableStringBuffer("ui_t_e_mouth", var , sizeof(var ) );
ADDRGP4 $720
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1470
;1470:		Com_sprintf( string, sizeof(string), "seta ui_t_e_mouth \"%s\" \n",   var);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $721
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1471
;1471:		trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2248
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2248
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1473
;1472:
;1473:		trap_Cvar_VariableStringBuffer("ui_t_model", var , sizeof(var ) );
ADDRGP4 $722
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1474
;1474:		Com_sprintf( string, sizeof(string), "seta ui_t_model \"%s\" \n", var );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $723
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1475
;1475:		trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2252
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1477
;1476:
;1477:		trap_Cvar_VariableStringBuffer("ui_t_skin", var , sizeof(var ) );
ADDRGP4 $724
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1478
;1478:		Com_sprintf( string, sizeof(string), "seta ui_t_skin \"%s\" \n", var );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $725
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1479
;1479:		trap_FS_Write( string, strlen( string ), configFile );  
ADDRLP4 0
ARGP4
ADDRLP4 2256
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2256
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1480
;1480:	}
ADDRGP4 $714
JUMPV
LABELV $713
line 1481
;1481:	else if ( !Q_stricmp( filename, "seals.cfg" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $728
ARGP4
ADDRLP4 2240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2240
INDIRI4
CNSTI4 0
NEI4 $726
line 1482
;1482:	{
line 1483
;1483:		trap_Cvar_VariableStringBuffer("ui_s_e_eyes", var , sizeof(var ) );
ADDRGP4 $729
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1484
;1484:		Com_sprintf( string, sizeof(string), "seta ui_s_e_eyes \"%s\" \n", var );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $730
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1485
;1485:		trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2244
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2244
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1487
;1486:
;1487:		trap_Cvar_VariableStringBuffer("ui_s_e_head", var , sizeof(var ) );
ADDRGP4 $731
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1488
;1488:		Com_sprintf( string, sizeof(string), "seta ui_s_e_head \"%s\" \n", var );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $732
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1489
;1489:		trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2248
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2248
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1491
;1490:
;1491:		trap_Cvar_VariableStringBuffer("ui_s_e_mouth", var , sizeof(var ) );
ADDRGP4 $733
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1492
;1492:		Com_sprintf( string, sizeof(string), "seta ui_s_e_mouth \"%s\" \n", var );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $734
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1493
;1493:		trap_FS_Write( string, strlen( string ), configFile ); 
ADDRLP4 0
ARGP4
ADDRLP4 2252
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1495
;1494:
;1495:		trap_Cvar_VariableStringBuffer("ui_s_model", var , sizeof(var ) );
ADDRGP4 $735
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1496
;1496:		Com_sprintf( string, sizeof(string), "seta ui_s_model \"%s\" \n", var );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $736
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1497
;1497:		trap_FS_Write( string, strlen( string ), configFile );
ADDRLP4 0
ARGP4
ADDRLP4 2256
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2256
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1499
;1498:
;1499:		trap_Cvar_VariableStringBuffer("ui_s_skin", var , sizeof(var ) );
ADDRGP4 $737
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1500
;1500:		Com_sprintf( string, sizeof(string), "seta ui_s_skin \"%s\" \n", var );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $738
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1501
;1501:		trap_FS_Write( string, strlen( string ), configFile ); 
ADDRLP4 0
ARGP4
ADDRLP4 2260
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 2260
INDIRI4
ARGI4
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1502
;1502:	}
LABELV $726
LABELV $714
line 1504
;1503:	
;1504:	trap_FS_FCloseFile( configFile );
ADDRLP4 2048
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1505
;1505:}
LABELV $653
endproc UI_WriteWeaponConfig 2264 16
export Script_WriteConfig
proc Script_WriteConfig 8 8
line 1508
;1506: 
;1507:
;1508:void Script_WriteConfig(itemDef_t *item, char **args) {
line 1510
;1509:	const char *val;
;1510:	if (String_Parse(args, &val)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $740
line 1511
;1511:		UI_WriteWeaponConfig(val);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UI_WriteWeaponConfig
CALLV
pop
line 1512
;1512:	}
LABELV $740
line 1513
;1513:}
LABELV $739
endproc Script_WriteConfig 8 8
data
export commandList
align 4
LABELV commandList
address $742
address Script_FadeIn
address $743
address Script_FadeOut
address $744
address Script_Show
address $745
address Script_Hide
address $746
address Script_SetColor
address $747
address Script_Open
address $748
address Script_Close
address $749
address Script_SetAsset
address $750
address Script_SetBackground
address $751
address Script_SetItemColor
address $752
address Script_SetTeamColor
address $753
address Script_SetFocus
address $754
address Script_SetPlayerModel
address $755
address Script_SetPlayerHead
address $756
address Script_Transition
address $757
address Script_SetCvar
address $758
address Script_Exec
address $759
address Script_Play
address $760
address Script_playLooped
address $761
address Script_Orbit
address $762
address Script_WriteConfig
export scriptCommandCount
align 4
LABELV scriptCommandCount
byte 4 21
export Item_RunScript
code
proc Item_RunScript 1060 12
line 1544
;1514:
;1515:
;1516:commandDef_t commandList[] =
;1517:{
;1518:  {"fadein", &Script_FadeIn},                   // group/name
;1519:  {"fadeout", &Script_FadeOut},                 // group/name
;1520:  {"show", &Script_Show},                       // group/name
;1521:  {"hide", &Script_Hide},                       // group/name
;1522:  {"setcolor", &Script_SetColor},               // works on this
;1523:  {"open", &Script_Open},                       // nenu
;1524:  {"close", &Script_Close},                     // menu
;1525:  {"setasset", &Script_SetAsset},               // works on this
;1526:  {"setbackground", &Script_SetBackground},     // works on this
;1527:  {"setitemcolor", &Script_SetItemColor},       // group/name
;1528:  {"setteamcolor", &Script_SetTeamColor},       // sets this background color to team color
;1529:  {"setfocus", &Script_SetFocus},               // sets this background color to team color
;1530:  {"setplayermodel", &Script_SetPlayerModel},   // sets this background color to team color
;1531:  {"setplayerhead", &Script_SetPlayerHead},     // sets this background color to team color
;1532:  {"transition", &Script_Transition},           // group/name
;1533:  {"setcvar", &Script_SetCvar},           // group/name
;1534:  {"exec", &Script_Exec},           // group/name
;1535:  {"play", &Script_Play},           // group/name
;1536:  {"playlooped", &Script_playLooped},           // group/name
;1537:  {"orbit", &Script_Orbit},                     // group/name
;1538:  {"writeteamconfig", &Script_WriteConfig }
;1539:};
;1540:
;1541:int scriptCommandCount = sizeof(commandList) / sizeof(commandDef_t);
;1542:
;1543:
;1544:void Item_RunScript(itemDef_t *item, const char *s) {
line 1548
;1545:  char script[1024], *p;
;1546:  int i;
;1547:  qboolean bRan;
;1548:  memset(script, 0, sizeof(script));
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1549
;1549:  if (item && s && s[0]) {
ADDRLP4 1036
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 1036
INDIRU4
EQU4 $764
ADDRLP4 1040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
ADDRLP4 1036
INDIRU4
EQU4 $764
ADDRLP4 1040
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $764
line 1550
;1550:    Q_strcat(script, 1024, s);
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1551
;1551:    p = script;
ADDRLP4 8
ADDRLP4 12
ASGNP4
ADDRGP4 $767
JUMPV
LABELV $766
line 1552
;1552:    while (1) {
line 1555
;1553:      const char *command;
;1554:      // expect command then arguments, ; ends command, NULL ends script
;1555:      if (!String_Parse(&p, &command)) {
ADDRLP4 8
ARGP4
ADDRLP4 1044
ARGP4
ADDRLP4 1048
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $769
line 1556
;1556:        return;
ADDRGP4 $763
JUMPV
LABELV $769
line 1559
;1557:      }
;1558:
;1559:      if (command[0] == ';' && command[1] == '\0') {
ADDRLP4 1052
ADDRLP4 1044
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $771
ADDRLP4 1052
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $771
line 1560
;1560:        continue;
ADDRGP4 $767
JUMPV
LABELV $771
line 1563
;1561:      }
;1562:
;1563:      bRan = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1564
;1564:      for (i = 0; i < scriptCommandCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $776
JUMPV
LABELV $773
line 1565
;1565:        if (Q_stricmp(command, commandList[i].name) == 0) {
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commandList
ADDP4
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $777
line 1566
;1566:          (commandList[i].handler(item, &p));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commandList+4
ADDP4
INDIRP4
CALLV
pop
line 1567
;1567:          bRan = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1568
;1568:          break;
ADDRGP4 $775
JUMPV
LABELV $777
line 1570
;1569:        }
;1570:      }
LABELV $774
line 1564
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $776
ADDRLP4 0
INDIRI4
ADDRGP4 scriptCommandCount
INDIRI4
LTI4 $773
LABELV $775
line 1573
;1571:
;1572:      // not in our auto list, pass to handler
;1573:       if (!bRan) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $780
line 1574
;1574:        DC->runScript(&p);
ADDRLP4 8
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 80
ADDP4
INDIRP4
CALLV
pop
line 1575
;1575:      }
LABELV $780
line 1576
;1576:    }
LABELV $767
line 1552
ADDRGP4 $766
JUMPV
line 1577
;1577:  }
LABELV $764
line 1578
;1578:}
LABELV $763
endproc Item_RunScript 1060 12
export Item_RunExtScript
proc Item_RunExtScript 1060 12
line 1579
;1579:void Item_RunExtScript(itemDef_t *item, const char *s) {
line 1583
;1580:  char script[1024], *p;
;1581:  int i;
;1582:  qboolean bRan;
;1583:  memset(script, 0, sizeof(script));
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1584
;1584:  if (item && s && s[0]) {
ADDRLP4 1036
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 1036
INDIRU4
EQU4 $783
ADDRLP4 1040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
ADDRLP4 1036
INDIRU4
EQU4 $783
ADDRLP4 1040
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $783
line 1585
;1585:    Q_strcat(script, 1024, s);
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1586
;1586:    p = script;
ADDRLP4 8
ADDRLP4 12
ASGNP4
ADDRGP4 $786
JUMPV
LABELV $785
line 1587
;1587:    while (1) {
line 1590
;1588:      const char *command;
;1589:      // expect command then arguments, ; ends command, NULL ends script
;1590:      if (!String_Parse(&p, &command)) {
ADDRLP4 8
ARGP4
ADDRLP4 1044
ARGP4
ADDRLP4 1048
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $788
line 1591
;1591:        return;
ADDRGP4 $782
JUMPV
LABELV $788
line 1594
;1592:      }
;1593:
;1594:      if (command[0] == ';' && command[1] == '\0') {
ADDRLP4 1052
ADDRLP4 1044
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $790
ADDRLP4 1052
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $790
line 1595
;1595:        continue;
ADDRGP4 $786
JUMPV
LABELV $790
line 1598
;1596:      }
;1597:
;1598:      bRan = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1599
;1599:      for (i = 0; i < scriptCommandCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $795
JUMPV
LABELV $792
line 1600
;1600:        if (Q_stricmp(command, commandList[i].name) == 0) {
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commandList
ADDP4
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $796
line 1601
;1601:          (commandList[i].handler(item, &p));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commandList+4
ADDP4
INDIRP4
CALLV
pop
line 1602
;1602:          bRan = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1603
;1603:          break;
ADDRGP4 $794
JUMPV
LABELV $796
line 1605
;1604:        }
;1605:      }
LABELV $793
line 1599
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $795
ADDRLP4 0
INDIRI4
ADDRGP4 scriptCommandCount
INDIRI4
LTI4 $792
LABELV $794
line 1608
;1606:
;1607:      // not in our auto list, pass to handler
;1608:       if (!bRan) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $799
line 1609
;1609:        DC->setWeapon (&p, item->ownerParam );
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CALLV
pop
line 1610
;1610:      }
LABELV $799
line 1611
;1611:    }
LABELV $786
line 1587
ADDRGP4 $785
JUMPV
line 1612
;1612:  }
LABELV $783
line 1613
;1613:}
LABELV $782
endproc Item_RunExtScript 1060 12
export Item_EnableShowViaCvar
proc Item_EnableShowViaCvar 2088 12
line 1616
;1614:void UI_RunExtendedMenuScript(char **args, int parameter );
;1615: 
;1616:qboolean Item_EnableShowViaCvar(itemDef_t *item, int flag) {
line 1618
;1617:  char script[1024], *p;
;1618:  memset(script, 0, sizeof(script));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1619
;1619:  if (item && item->enableCvar && *item->enableCvar && item->cvarTest && *item->cvarTest) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
CNSTU4 0
ASGNU4
ADDRLP4 1028
INDIRP4
CVPU4 4
ADDRLP4 1032
INDIRU4
EQU4 $802
ADDRLP4 1036
ADDRLP4 1028
INDIRP4
CNSTI4 292
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
ADDRLP4 1032
INDIRU4
EQU4 $802
ADDRLP4 1040
CNSTI4 0
ASGNI4
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1040
INDIRI4
EQI4 $802
ADDRLP4 1044
ADDRLP4 1028
INDIRP4
CNSTI4 288
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
ADDRLP4 1032
INDIRU4
EQU4 $802
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1040
INDIRI4
EQI4 $802
line 1621
;1620:		char buff[1024];
;1621:	  DC->getCVarString(item->cvarTest, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 1623
;1622:
;1623:    Q_strcat(script, 1024, item->enableCvar);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1624
;1624:    p = script;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $805
JUMPV
LABELV $804
line 1625
;1625:    while (1) {
line 1628
;1626:      const char *val;
;1627:      // expect value then ; or NULL, NULL ends list
;1628:      if (!String_Parse(&p, &val)) {
ADDRLP4 0
ARGP4
ADDRLP4 2072
ARGP4
ADDRLP4 2076
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $807
line 1629
;1629:				return (item->cvarFlags & flag) ? qfalse : qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $810
ADDRLP4 2080
CNSTI4 0
ASGNI4
ADDRGP4 $811
JUMPV
LABELV $810
ADDRLP4 2080
CNSTI4 1
ASGNI4
LABELV $811
ADDRLP4 2080
INDIRI4
RETI4
ADDRGP4 $801
JUMPV
LABELV $807
line 1632
;1630:      }
;1631:
;1632:      if (val[0] == ';' && val[1] == '\0') {
ADDRLP4 2080
ADDRLP4 2072
INDIRP4
ASGNP4
ADDRLP4 2080
INDIRP4
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $812
ADDRLP4 2080
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $812
line 1633
;1633:        continue;
ADDRGP4 $805
JUMPV
LABELV $812
line 1637
;1634:      }
;1635:
;1636:			// enable it if any of the values are true
;1637:			if (item->cvarFlags & flag) {
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $814
line 1638
;1638:        if (Q_stricmp(buff, val) == 0) {
ADDRLP4 1048
ARGP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $815
line 1639
;1639:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $801
JUMPV
line 1641
;1640:				}
;1641:			} else {
LABELV $814
line 1643
;1642:				// disable it if any of the values are true
;1643:        if (Q_stricmp(buff, val) == 0) {
ADDRLP4 1048
ARGP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $818
line 1644
;1644:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $801
JUMPV
LABELV $818
line 1646
;1645:				}
;1646:			}
LABELV $815
line 1648
;1647:
;1648:    }
LABELV $805
line 1625
ADDRGP4 $804
JUMPV
line 1649
;1649:		return (item->cvarFlags & flag) ? qfalse : qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $821
ADDRLP4 2072
CNSTI4 0
ASGNI4
ADDRGP4 $822
JUMPV
LABELV $821
ADDRLP4 2072
CNSTI4 1
ASGNI4
LABELV $822
ADDRLP4 2072
INDIRI4
RETI4
ADDRGP4 $801
JUMPV
LABELV $802
line 1651
;1650:  }
;1651:	return qtrue;
CNSTI4 1
RETI4
LABELV $801
endproc Item_EnableShowViaCvar 2088 12
export Item_SetFocus
proc Item_SetFocus 84 12
line 1656
;1652:}
;1653:
;1654:
;1655:// will optionaly set focus to this item 
;1656:qboolean Item_SetFocus(itemDef_t *item, float x, float y) {
line 1659
;1657:	int i;
;1658:	itemDef_t *oldFocus;
;1659:	sfxHandle_t *sfx = &DC->Assets.itemFocusSound;
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 61952
ADDP4
ASGNP4
line 1660
;1660:	qboolean playSound = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1661
;1661:	menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 1663
;1662:	// sanity check, non-null, not a decoration and does not already have the focus
;1663:	if (item == NULL || item->window.flags & WINDOW_DECORATION || item->window.flags & WINDOW_HASFOCUS || !(item->window.flags & WINDOW_VISIBLE)) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $828
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $828
ADDRLP4 24
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $828
ADDRLP4 24
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $824
LABELV $828
line 1664
;1664:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $823
JUMPV
LABELV $824
line 1668
;1665:	}
;1666:
;1667:	// items can be enabled and disabled based on cvars
;1668:	if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $829
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $829
line 1669
;1669:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $823
JUMPV
LABELV $829
line 1672
;1670:	}
;1671:
;1672:	if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(item, CVAR_SHOW)) {
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 12
BANDI4
CNSTI4 0
EQI4 $831
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 44
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $831
line 1673
;1673:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $823
JUMPV
LABELV $831
line 1676
;1674:	}
;1675:
;1676:	oldFocus = Menu_ClearFocus(item->parent);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Menu_ClearFocus
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 48
INDIRP4
ASGNP4
line 1678
;1677:
;1678:	if (item->type == ITEM_TYPE_TEXT) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $833
line 1680
;1679:		rectDef_t r;
;1680:		r = item->textRect;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRB
ASGNB 20
line 1681
;1681:		r.y -= r.h;
ADDRLP4 52+4
ADDRLP4 52+4
INDIRF4
ADDRLP4 52+12
INDIRF4
SUBF4
ASGNF4
line 1682
;1682:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 52
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $837
line 1683
;1683:			item->window.flags |= WINDOW_HASFOCUS;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1684
;1684:			if (item->focusSound) {
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 0
EQI4 $839
line 1685
;1685:				sfx = &item->focusSound;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
line 1686
;1686:			}
LABELV $839
line 1687
;1687:			playSound = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1688
;1688:		} else {
ADDRGP4 $834
JUMPV
LABELV $837
line 1689
;1689:			if (oldFocus) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $834
line 1690
;1690:				oldFocus->window.flags |= WINDOW_HASFOCUS;
ADDRLP4 76
ADDRLP4 16
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1691
;1691:				if (oldFocus->onFocus) {
ADDRLP4 16
INDIRP4
CNSTI4 276
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $834
line 1692
;1692:					Item_RunScript(oldFocus, oldFocus->onFocus);
ADDRLP4 80
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 276
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1693
;1693:				}
line 1694
;1694:			}
line 1695
;1695:		}
line 1696
;1696:	} else {
ADDRGP4 $834
JUMPV
LABELV $833
line 1697
;1697:	    item->window.flags |= WINDOW_HASFOCUS;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1698
;1698:		if (item->onFocus) {
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $845
line 1699
;1699:			Item_RunScript(item, item->onFocus);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 276
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1700
;1700:		}
LABELV $845
line 1701
;1701:		if (item->focusSound) {
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 0
EQI4 $847
line 1702
;1702:			sfx = &item->focusSound;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
line 1703
;1703:		}
LABELV $847
line 1704
;1704:		playSound = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1705
;1705:	}
LABELV $834
line 1707
;1706:
;1707:	if (playSound && sfx) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $849
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $849
line 1708
;1708:		DC->startLocalSound( *sfx, CHAN_LOCAL_SOUND );
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 116
ADDP4
INDIRP4
CALLV
pop
line 1709
;1709:	}
LABELV $849
line 1711
;1710:
;1711:	for (i = 0; i < parent->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $854
JUMPV
LABELV $851
line 1712
;1712:		if (parent->items[i] == item) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $855
line 1713
;1713:			parent->cursorItem = i;
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1714
;1714:			break;
ADDRGP4 $853
JUMPV
LABELV $855
line 1716
;1715:		}
;1716:	}
LABELV $852
line 1711
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $854
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $851
LABELV $853
line 1718
;1717:
;1718:	return qtrue;
CNSTI4 1
RETI4
LABELV $823
endproc Item_SetFocus 84 12
export Item_ListBox_MaxScroll
proc Item_ListBox_MaxScroll 16 4
line 1721
;1719:}
;1720:
;1721:int Item_ListBox_MaxScroll(itemDef_t *item) {
line 1722
;1722:	listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1723
;1723:	int count = DC->feederCount(item->special);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 124
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1726
;1724:	int max;
;1725:
;1726:	if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $858
line 1727
;1727:		max = count - (item->window.rect.w / listPtr->elementWidth) + 1;
ADDRLP4 0
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
DIVF4
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1728
;1728:	}
ADDRGP4 $859
JUMPV
LABELV $858
line 1729
;1729:	else {
line 1730
;1730:		max = count - (item->window.rect.h / listPtr->elementHeight) + 1;
ADDRLP4 0
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
DIVF4
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1731
;1731:	}
LABELV $859
line 1732
;1732:	if (max < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $860
line 1733
;1733:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $857
JUMPV
LABELV $860
line 1735
;1734:	}
;1735:	return max;
ADDRLP4 0
INDIRI4
RETI4
LABELV $857
endproc Item_ListBox_MaxScroll 16 4
export Item_ListBox_ThumbPosition
proc Item_ListBox_ThumbPosition 20 4
line 1738
;1736:}
;1737:
;1738:int Item_ListBox_ThumbPosition(itemDef_t *item) {
line 1740
;1739:	float max, pos, size;
;1740:	listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1742
;1741:
;1742:	max = Item_ListBox_MaxScroll(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Item_ListBox_MaxScroll
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CVIF4 4
ASGNF4
line 1743
;1743:	if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $863
line 1744
;1744:		size = item->window.rect.w - (SCROLLBAR_SIZE * 2) - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1745
;1745:		if (max > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $865
line 1746
;1746:			pos = (size-SCROLLBAR_SIZE) / (float) max;
ADDRLP4 0
ADDRLP4 12
INDIRF4
CNSTF4 1098907648
SUBF4
ADDRLP4 4
INDIRF4
DIVF4
ASGNF4
line 1747
;1747:		} else {
ADDRGP4 $866
JUMPV
LABELV $865
line 1748
;1748:			pos = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1749
;1749:		}
LABELV $866
line 1750
;1750:		pos *= listPtr->startPos;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1751
;1751:		return item->window.rect.x + 1 + SCROLLBAR_SIZE + pos;
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1098907648
ADDF4
ADDRLP4 0
INDIRF4
ADDF4
CVFI4 4
RETI4
ADDRGP4 $862
JUMPV
LABELV $863
line 1753
;1752:	}
;1753:	else {
line 1754
;1754:		size = item->window.rect.h - (SCROLLBAR_SIZE * 2) - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1755
;1755:		if (max > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $867
line 1756
;1756:			pos = (size-SCROLLBAR_SIZE) / (float) max;
ADDRLP4 0
ADDRLP4 12
INDIRF4
CNSTF4 1098907648
SUBF4
ADDRLP4 4
INDIRF4
DIVF4
ASGNF4
line 1757
;1757:		} else {
ADDRGP4 $868
JUMPV
LABELV $867
line 1758
;1758:			pos = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1759
;1759:		}
LABELV $868
line 1760
;1760:		pos *= listPtr->startPos;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1761
;1761:		return item->window.rect.y + 1 + SCROLLBAR_SIZE + pos;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1098907648
ADDF4
ADDRLP4 0
INDIRF4
ADDF4
CVFI4 4
RETI4
LABELV $862
endproc Item_ListBox_ThumbPosition 20 4
export Item_ListBox_ThumbDrawPosition
proc Item_ListBox_ThumbDrawPosition 24 4
line 1765
;1762:	}
;1763:}
;1764:
;1765:int Item_ListBox_ThumbDrawPosition(itemDef_t *item) {
line 1768
;1766:	int min, max;
;1767:
;1768:	if (itemCapture == item) {
ADDRGP4 itemCapture
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $870
line 1769
;1769:		if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $872
line 1770
;1770:			min = item->window.rect.x + SCROLLBAR_SIZE + 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1771
;1771:			max = item->window.rect.x + item->window.rect.w - 2*SCROLLBAR_SIZE - 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1107296256
SUBF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 1772
;1772:			if (DC->cursorx >= min + SCROLLBAR_SIZE/2 && DC->cursorx <= max + SCROLLBAR_SIZE/2) {
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 16
CNSTF4 1090519040
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
LTF4 $874
ADDRLP4 12
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
GTF4 $874
line 1773
;1773:				return DC->cursorx - SCROLLBAR_SIZE/2;
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
SUBF4
CVFI4 4
RETI4
ADDRGP4 $869
JUMPV
LABELV $874
line 1775
;1774:			}
;1775:			else {
line 1776
;1776:				return Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $869
JUMPV
LABELV $872
line 1779
;1777:			}
;1778:		}
;1779:		else {
line 1780
;1780:			min = item->window.rect.y + SCROLLBAR_SIZE + 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1781
;1781:			max = item->window.rect.y + item->window.rect.h - 2*SCROLLBAR_SIZE - 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1107296256
SUBF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 1782
;1782:			if (DC->cursory >= min + SCROLLBAR_SIZE/2 && DC->cursory <= max + SCROLLBAR_SIZE/2) {
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 16
CNSTF4 1090519040
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
LTF4 $876
ADDRLP4 12
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
GTF4 $876
line 1783
;1783:				return DC->cursory - SCROLLBAR_SIZE/2;
ADDRGP4 DC
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1090519040
SUBF4
CVFI4 4
RETI4
ADDRGP4 $869
JUMPV
LABELV $876
line 1785
;1784:			}
;1785:			else {
line 1786
;1786:				return Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $869
JUMPV
LABELV $870
line 1790
;1787:			}
;1788:		}
;1789:	}
;1790:	else {
line 1791
;1791:		return Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $869
endproc Item_ListBox_ThumbDrawPosition 24 4
export Item_Slider_ThumbPosition
proc Item_Slider_ThumbPosition 28 4
line 1795
;1792:	}
;1793:}
;1794:
;1795:float Item_Slider_ThumbPosition(itemDef_t *item) {
line 1797
;1796:	float value, range, x;
;1797:	editFieldDef_t *editDef = item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1799
;1798:
;1799:	if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $879
line 1800
;1800:		x = item->textRect.x + item->textRect.w + 8;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1801
;1801:	} else {
ADDRGP4 $880
JUMPV
LABELV $879
line 1802
;1802:		x = item->window.rect.x;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1803
;1803:	}
LABELV $880
line 1805
;1804:
;1805:	if (editDef == NULL && item->cvar) {
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $881
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $881
line 1806
;1806:		return x;
ADDRLP4 8
INDIRF4
RETF4
ADDRGP4 $878
JUMPV
LABELV $881
line 1809
;1807:	}
;1808:
;1809:	value = DC->getCVarValue(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1811
;1810:
;1811:	if (value < editDef->minVal) {
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
GEF4 $883
line 1812
;1812:		value = editDef->minVal;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ASGNF4
line 1813
;1813:	} else if (value > editDef->maxVal) {
ADDRGP4 $884
JUMPV
LABELV $883
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
LEF4 $885
line 1814
;1814:		value = editDef->maxVal;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1815
;1815:	}
LABELV $885
LABELV $884
line 1817
;1816:
;1817:	range = editDef->maxVal - editDef->minVal;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
SUBF4
ASGNF4
line 1818
;1818:	value -= editDef->minVal;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
SUBF4
ASGNF4
line 1819
;1819:	value /= range;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
DIVF4
ASGNF4
line 1821
;1820:	//value /= (editDef->maxVal - editDef->minVal);
;1821:	value *= SLIDER_WIDTH;
ADDRLP4 0
CNSTF4 1119879168
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1822
;1822:	x += value;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 1825
;1823:	// vm fuckage
;1824:	//x = x + (((float)value / editDef->maxVal) * SLIDER_WIDTH);
;1825:	return x;
ADDRLP4 8
INDIRF4
RETF4
LABELV $878
endproc Item_Slider_ThumbPosition 28 4
export Item_Slider_OverSlider
proc Item_Slider_OverSlider 28 12
line 1828
;1826:}
;1827:
;1828:int Item_Slider_OverSlider(itemDef_t *item, float x, float y) {
line 1831
;1829:	rectDef_t r;
;1830:
;1831:	r.x = Item_Slider_ThumbPosition(item) - (SLIDER_THUMB_WIDTH / 2);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Item_Slider_ThumbPosition
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
CNSTF4 1086324736
SUBF4
ASGNF4
line 1832
;1832:	r.y = item->window.rect.y - 2;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1833
;1833:	r.w = SLIDER_THUMB_WIDTH;
ADDRLP4 0+8
CNSTF4 1094713344
ASGNF4
line 1834
;1834:	r.h = SLIDER_THUMB_HEIGHT;
ADDRLP4 0+12
CNSTF4 1101004800
ASGNF4
line 1836
;1835:
;1836:	if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $891
line 1837
;1837:		return WINDOW_LB_THUMB;
CNSTI4 8192
RETI4
ADDRGP4 $887
JUMPV
LABELV $891
line 1839
;1838:	}
;1839:	return 0;
CNSTI4 0
RETI4
LABELV $887
endproc Item_Slider_OverSlider 28 12
export Item_ListBox_OverLB
proc Item_ListBox_OverLB 76 12
line 1842
;1840:}
;1841:
;1842:int Item_ListBox_OverLB(itemDef_t *item, float x, float y) {
line 1848
;1843:	rectDef_t r;
;1844:	listBoxDef_t *listPtr;
;1845:	int thumbstart;
;1846:	int count;
;1847:
;1848:	count = DC->feederCount(item->special);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 DC
INDIRP4
CNSTI4 124
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 32
INDIRI4
ASGNI4
line 1849
;1849:	listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1850
;1850:	if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $894
line 1852
;1851:		// check if on left arrow
;1852:		r.x = item->window.rect.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1853
;1853:		r.y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1854
;1854:		r.h = r.w = SCROLLBAR_SIZE;
ADDRLP4 40
CNSTF4 1098907648
ASGNF4
ADDRLP4 0+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 0+12
ADDRLP4 40
INDIRF4
ASGNF4
line 1855
;1855:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $899
line 1856
;1856:			return WINDOW_LB_LEFTARROW;
CNSTI4 2048
RETI4
ADDRGP4 $893
JUMPV
LABELV $899
line 1859
;1857:		}
;1858:		// check if on right arrow
;1859:		r.x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1860
;1860:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $901
line 1861
;1861:			return WINDOW_LB_RIGHTARROW;
CNSTI4 4096
RETI4
ADDRGP4 $893
JUMPV
LABELV $901
line 1864
;1862:		}
;1863:		// check if on thumb
;1864:		thumbstart = Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 56
INDIRI4
ASGNI4
line 1865
;1865:		r.x = thumbstart;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CVIF4 4
ASGNF4
line 1866
;1866:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $903
line 1867
;1867:			return WINDOW_LB_THUMB;
CNSTI4 8192
RETI4
ADDRGP4 $893
JUMPV
LABELV $903
line 1869
;1868:		}
;1869:		r.x = item->window.rect.x + SCROLLBAR_SIZE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1870
;1870:		r.w = thumbstart - r.x;
ADDRLP4 0+8
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
line 1871
;1871:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $906
line 1872
;1872:			return WINDOW_LB_PGUP;
CNSTI4 16384
RETI4
ADDRGP4 $893
JUMPV
LABELV $906
line 1874
;1873:		}
;1874:		r.x = thumbstart + SCROLLBAR_SIZE;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CVIF4 4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1875
;1875:		r.w = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1876
;1876:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $895
line 1877
;1877:			return WINDOW_LB_PGDN;
CNSTI4 32768
RETI4
ADDRGP4 $893
JUMPV
line 1879
;1878:		}
;1879:	} else {
LABELV $894
line 1880
;1880:		r.x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1881
;1881:		r.y = item->window.rect.y;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1882
;1882:		r.h = r.w = SCROLLBAR_SIZE;
ADDRLP4 40
CNSTF4 1098907648
ASGNF4
ADDRLP4 0+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 0+12
ADDRLP4 40
INDIRF4
ASGNF4
line 1883
;1883:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $914
line 1884
;1884:			return WINDOW_LB_LEFTARROW;
CNSTI4 2048
RETI4
ADDRGP4 $893
JUMPV
LABELV $914
line 1886
;1885:		}
;1886:		r.y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1887
;1887:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $917
line 1888
;1888:			return WINDOW_LB_RIGHTARROW;
CNSTI4 4096
RETI4
ADDRGP4 $893
JUMPV
LABELV $917
line 1890
;1889:		}
;1890:		thumbstart = Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 Item_ListBox_ThumbPosition
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 56
INDIRI4
ASGNI4
line 1891
;1891:		r.y = thumbstart;
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
CVIF4 4
ASGNF4
line 1892
;1892:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $920
line 1893
;1893:			return WINDOW_LB_THUMB;
CNSTI4 8192
RETI4
ADDRGP4 $893
JUMPV
LABELV $920
line 1895
;1894:		}
;1895:		r.y = item->window.rect.y + SCROLLBAR_SIZE;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1896
;1896:		r.h = thumbstart - r.y;
ADDRLP4 0+12
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
line 1897
;1897:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $925
line 1898
;1898:			return WINDOW_LB_PGUP;
CNSTI4 16384
RETI4
ADDRGP4 $893
JUMPV
LABELV $925
line 1900
;1899:		}
;1900:		r.y = thumbstart + SCROLLBAR_SIZE;
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
CVIF4 4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1901
;1901:		r.h = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+12
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1902
;1902:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $929
line 1903
;1903:			return WINDOW_LB_PGDN;
CNSTI4 32768
RETI4
ADDRGP4 $893
JUMPV
LABELV $929
line 1905
;1904:		}
;1905:	}
LABELV $895
line 1906
;1906:	return 0;
CNSTI4 0
RETI4
LABELV $893
endproc Item_ListBox_OverLB 76 12
export Item_ListBox_MouseEnter
proc Item_ListBox_MouseEnter 60 12
line 1911
;1907:}
;1908:
;1909:
;1910:void Item_ListBox_MouseEnter(itemDef_t *item, float x, float y) 
;1911:{
line 1913
;1912:	rectDef_t r;
;1913:	listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1915
;1914:        
;1915:	item->window.flags &= ~(WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -63489
BANDI4
ASGNI4
line 1916
;1916:	item->window.flags |= Item_ListBox_OverLB(item, x, y);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Item_ListBox_OverLB
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 1918
;1917:
;1918:	if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $932
line 1919
;1919:		if (!(item->window.flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN))) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 63488
BANDI4
CNSTI4 0
NEI4 $933
line 1921
;1920:			// check for selection hit as we have exausted buttons and thumb
;1921:			if (listPtr->elementStyle == LISTBOX_IMAGE) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 1
NEI4 $933
line 1922
;1922:				r.x = item->window.rect.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1923
;1923:				r.y = item->window.rect.y;
ADDRLP4 4+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1924
;1924:				r.h = item->window.rect.h - SCROLLBAR_SIZE;
ADDRLP4 4+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1925
;1925:				r.w = item->window.rect.w - listPtr->drawPadding;
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1926
;1926:				if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $933
line 1927
;1927:					listPtr->cursorPos =  (int)((x - r.x) / listPtr->elementWidth)  + listPtr->startPos;
ADDRLP4 48
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ADDRLP4 48
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
DIVF4
CVFI4 4
ADDRLP4 48
INDIRP4
INDIRI4
ADDI4
ASGNI4
line 1928
;1928:					if (listPtr->cursorPos >= listPtr->endPos) {
ADDRLP4 52
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $933
line 1929
;1929:						listPtr->cursorPos = listPtr->endPos;
ADDRLP4 56
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1930
;1930:					}
line 1931
;1931:				}
line 1932
;1932:			} else {
line 1934
;1933:				// text hit.. 
;1934:			}
line 1935
;1935:		}
line 1936
;1936:	} else if (!(item->window.flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN))) {
ADDRGP4 $933
JUMPV
LABELV $932
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 63488
BANDI4
CNSTI4 0
NEI4 $945
line 1937
;1937:		r.x = item->window.rect.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1938
;1938:		r.y = item->window.rect.y;
ADDRLP4 4+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1939
;1939:		r.w = item->window.rect.w - SCROLLBAR_SIZE;
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1940
;1940:		r.h = item->window.rect.h - listPtr->drawPadding;
ADDRLP4 4+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1941
;1941:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $950
line 1942
;1942:			listPtr->cursorPos =  (int)((y - 2 - r.y) / listPtr->elementHeight)  + listPtr->startPos;
ADDRLP4 44
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
SUBF4
ADDRLP4 4+4
INDIRF4
SUBF4
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
DIVF4
CVFI4 4
ADDRLP4 44
INDIRP4
INDIRI4
ADDI4
ASGNI4
line 1943
;1943:			if (listPtr->cursorPos > listPtr->endPos) {
ADDRLP4 48
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $953
line 1944
;1944:				listPtr->cursorPos = listPtr->endPos;
ADDRLP4 52
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1945
;1945:			}
LABELV $953
line 1946
;1946:		}
LABELV $950
line 1947
;1947:	}
LABELV $945
LABELV $933
line 1948
;1948:}
LABELV $931
endproc Item_ListBox_MouseEnter 60 12
export Item_MouseEnter
proc Item_MouseEnter 48 12
line 1950
;1949:
;1950:void Item_MouseEnter(itemDef_t *item, float x, float y) {
line 1952
;1951:	rectDef_t r;
;1952:	if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $956
line 1953
;1953:		r = item->textRect;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRB
ASGNB 20
line 1954
;1954:		r.y -= r.h;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
line 1958
;1955:		// in the text rect?
;1956:
;1957:		// items can be enabled and disabled based on cvars
;1958:		if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $960
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $960
line 1959
;1959:			return;
ADDRGP4 $955
JUMPV
LABELV $960
line 1962
;1960:		}
;1961:
;1962:		if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(item, CVAR_SHOW)) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 12
BANDI4
CNSTI4 0
EQI4 $962
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 32
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $962
line 1963
;1963:			return;
ADDRGP4 $955
JUMPV
LABELV $962
line 1966
;1964:		}
;1965:
;1966:		if (Rect_ContainsPoint(&r, x, y)) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $964
line 1967
;1967:			if (!(item->window.flags & WINDOW_MOUSEOVERTEXT)) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $966
line 1968
;1968:				Item_RunScript(item, item->mouseEnterText);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 256
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1969
;1969:				item->window.flags |= WINDOW_MOUSEOVERTEXT;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1970
;1970:			}
LABELV $966
line 1971
;1971:			if (!(item->window.flags & WINDOW_MOUSEOVER)) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $965
line 1972
;1972:				Item_RunScript(item, item->mouseEnter);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1973
;1973:				item->window.flags |= WINDOW_MOUSEOVER;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1974
;1974:			}
line 1976
;1975:
;1976:		} else {
ADDRGP4 $965
JUMPV
LABELV $964
line 1978
;1977:			// not in the text rect
;1978:			if (item->window.flags & WINDOW_MOUSEOVERTEXT) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $970
line 1980
;1979:				// if we were
;1980:				Item_RunScript(item, item->mouseExitText);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 260
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1981
;1981:				item->window.flags &= ~WINDOW_MOUSEOVERTEXT;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1982
;1982:			}
LABELV $970
line 1983
;1983:			if (!(item->window.flags & WINDOW_MOUSEOVER)) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $972
line 1984
;1984:				Item_RunScript(item, item->mouseEnter);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 264
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1985
;1985:				item->window.flags |= WINDOW_MOUSEOVER;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1986
;1986:			}
LABELV $972
line 1988
;1987:
;1988:			if (item->type == ITEM_TYPE_LISTBOX) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 6
NEI4 $974
line 1989
;1989:				Item_ListBox_MouseEnter(item, x, y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 Item_ListBox_MouseEnter
CALLV
pop
line 1990
;1990:			}
LABELV $974
line 1991
;1991:		}
LABELV $965
line 1992
;1992:	}
LABELV $956
line 1993
;1993:}
LABELV $955
endproc Item_MouseEnter 48 12
export Item_MouseLeave
proc Item_MouseLeave 8 8
line 1995
;1994:
;1995:void Item_MouseLeave(itemDef_t *item) {
line 1996
;1996:  if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $977
line 1997
;1997:    if (item->window.flags & WINDOW_MOUSEOVERTEXT) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $979
line 1998
;1998:      Item_RunScript(item, item->mouseExitText);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 1999
;1999:      item->window.flags &= ~WINDOW_MOUSEOVERTEXT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 2000
;2000:    }
LABELV $979
line 2001
;2001:    Item_RunScript(item, item->mouseExit);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 2002
;2002:    item->window.flags &= ~(WINDOW_LB_RIGHTARROW | WINDOW_LB_LEFTARROW);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -6145
BANDI4
ASGNI4
line 2003
;2003:  }
LABELV $977
line 2004
;2004:}
LABELV $976
endproc Item_MouseLeave 8 8
export Menu_HitTest
proc Menu_HitTest 8 12
line 2006
;2005:
;2006:itemDef_t *Menu_HitTest(menuDef_t *menu, float x, float y) {
line 2008
;2007:  int i;
;2008:  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $985
JUMPV
LABELV $982
line 2009
;2009:    if (Rect_ContainsPoint(&menu->items[i]->window.rect, x, y)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $986
line 2010
;2010:      return menu->items[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $981
JUMPV
LABELV $986
line 2012
;2011:    }
;2012:  }
LABELV $983
line 2008
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $985
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $982
line 2013
;2013:  return NULL;
CNSTP4 0
RETP4
LABELV $981
endproc Menu_HitTest 8 12
export Item_SetMouseOver
proc Item_SetMouseOver 4 0
line 2016
;2014:}
;2015:
;2016:void Item_SetMouseOver(itemDef_t *item, qboolean focus) {
line 2017
;2017:  if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $989
line 2018
;2018:    if (focus) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $991
line 2019
;2019:      item->window.flags |= WINDOW_MOUSEOVER;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2020
;2020:    } else {
ADDRGP4 $992
JUMPV
LABELV $991
line 2021
;2021:      item->window.flags &= ~WINDOW_MOUSEOVER;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2022
;2022:    }
LABELV $992
line 2023
;2023:  }
LABELV $989
line 2024
;2024:}
LABELV $988
endproc Item_SetMouseOver 4 0
export Item_OwnerDraw_HandleKey
proc Item_OwnerDraw_HandleKey 12 16
line 2027
;2025:
;2026:
;2027:qboolean Item_OwnerDraw_HandleKey(itemDef_t *item, int key) {
line 2028
;2028:  if (item && DC->ownerDrawHandleKey) {
ADDRLP4 0
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
EQU4 $994
ADDRGP4 DC
INDIRP4
CNSTI4 120
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
EQU4 $994
line 2029
;2029:    return DC->ownerDrawHandleKey(item->window.ownerDraw, item->window.ownerDrawFlags, &item->special, key);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 120
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $993
JUMPV
LABELV $994
line 2031
;2030:  }
;2031:  return qfalse;
CNSTI4 0
RETI4
LABELV $993
endproc Item_OwnerDraw_HandleKey 12 16
export Item_ListBox_HandleKey
proc Item_ListBox_HandleKey 72 12
line 2034
;2032:}
;2033:
;2034:qboolean Item_ListBox_HandleKey(itemDef_t *item, int key, qboolean down, qboolean force) {
line 2035
;2035:	listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2036
;2036:	int count = DC->feederCount(item->special);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 DC
INDIRP4
CNSTI4 124
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 2039
;2037:	int max, viewmax;
;2038:
;2039:	if (force || (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS)) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $999
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $997
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $997
LABELV $999
line 2040
;2040:		max = Item_ListBox_MaxScroll(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Item_ListBox_MaxScroll
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 2041
;2041:		if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1000
line 2042
;2042:			viewmax = (item->window.rect.w / listPtr->elementWidth);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 2043
;2043:			if ( key == K_LEFTARROW || key == K_KP_LEFTARROW ) 
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 134
EQI4 $1004
ADDRLP4 36
INDIRI4
CNSTI4 163
NEI4 $1002
LABELV $1004
line 2044
;2044:			{
line 2045
;2045:				if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1005
line 2046
;2046:					listPtr->cursorPos--;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2047
;2047:					if (listPtr->cursorPos < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1007
line 2048
;2048:						listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 2049
;2049:					}
LABELV $1007
line 2050
;2050:					if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $1009
line 2051
;2051:						listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2052
;2052:					}
LABELV $1009
line 2053
;2053:					if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $1011
line 2054
;2054:						listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2055
;2055:					}
LABELV $1011
line 2056
;2056:					item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2057
;2057:					DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 2058
;2058:				}
ADDRGP4 $1006
JUMPV
LABELV $1005
line 2059
;2059:				else {
line 2060
;2060:					listPtr->startPos--;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2061
;2061:					if (listPtr->startPos < 0)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $1013
line 2062
;2062:						listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1013
line 2063
;2063:				}
LABELV $1006
line 2064
;2064:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
LABELV $1002
line 2066
;2065:			}
;2066:			if ( key == K_RIGHTARROW || key == K_KP_RIGHTARROW ) 
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 135
EQI4 $1017
ADDRLP4 40
INDIRI4
CNSTI4 165
NEI4 $1001
LABELV $1017
line 2067
;2067:			{
line 2068
;2068:				if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1018
line 2069
;2069:					listPtr->cursorPos++;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2070
;2070:					if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $1020
line 2071
;2071:						listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2072
;2072:					}
LABELV $1020
line 2073
;2073:					if (listPtr->cursorPos >= count) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1022
line 2074
;2074:						listPtr->cursorPos = count-1;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2075
;2075:					}
LABELV $1022
line 2076
;2076:					if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $1024
line 2077
;2077:						listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2078
;2078:					}
LABELV $1024
line 2079
;2079:					item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2080
;2080:					DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 2081
;2081:				}
ADDRGP4 $1019
JUMPV
LABELV $1018
line 2082
;2082:				else {
line 2083
;2083:					listPtr->startPos++;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2084
;2084:					if (listPtr->startPos >= count)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1026
line 2085
;2085:						listPtr->startPos = count-1;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1026
line 2086
;2086:				}
LABELV $1019
line 2087
;2087:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
line 2089
;2088:			}
;2089:		}
LABELV $1000
line 2090
;2090:		else {
line 2091
;2091:			viewmax = (item->window.rect.h / listPtr->elementHeight);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 2092
;2092:			if ( key == K_UPARROW || key == K_KP_UPARROW ) 
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 132
EQI4 $1030
ADDRLP4 36
INDIRI4
CNSTI4 161
NEI4 $1028
LABELV $1030
line 2093
;2093:			{
line 2094
;2094:				if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1031
line 2095
;2095:					listPtr->cursorPos--;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2096
;2096:					if (listPtr->cursorPos < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1033
line 2097
;2097:						listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 2098
;2098:					}
LABELV $1033
line 2099
;2099:					if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $1035
line 2100
;2100:						listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2101
;2101:					}
LABELV $1035
line 2102
;2102:					if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $1037
line 2103
;2103:						listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2104
;2104:					}
LABELV $1037
line 2105
;2105:					item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2106
;2106:					DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 2107
;2107:				}
ADDRGP4 $1032
JUMPV
LABELV $1031
line 2108
;2108:				else {
line 2109
;2109:					listPtr->startPos--;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2110
;2110:					if (listPtr->startPos < 0)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $1039
line 2111
;2111:						listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1039
line 2112
;2112:				}
LABELV $1032
line 2113
;2113:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
LABELV $1028
line 2115
;2114:			}
;2115:			if ( key == K_DOWNARROW || key == K_KP_DOWNARROW ) 
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 133
EQI4 $1043
ADDRLP4 40
INDIRI4
CNSTI4 167
NEI4 $1041
LABELV $1043
line 2116
;2116:			{
line 2117
;2117:				if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1044
line 2118
;2118:					listPtr->cursorPos++;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2119
;2119:					if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $1046
line 2120
;2120:						listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2121
;2121:					}
LABELV $1046
line 2122
;2122:					if (listPtr->cursorPos >= count) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1048
line 2123
;2123:						listPtr->cursorPos = count-1;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2124
;2124:					}
LABELV $1048
line 2125
;2125:					if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $1050
line 2126
;2126:						listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2127
;2127:					}
LABELV $1050
line 2128
;2128:					item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2129
;2129:					DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 2130
;2130:				}
ADDRGP4 $1045
JUMPV
LABELV $1044
line 2131
;2131:				else {
line 2132
;2132:					listPtr->startPos++;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2133
;2133:					if (listPtr->startPos > max)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $1052
line 2134
;2134:						listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $1052
line 2135
;2135:				}
LABELV $1045
line 2136
;2136:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
LABELV $1041
line 2138
;2137:			}
;2138:		}
LABELV $1001
line 2140
;2139:		// mouse hit
;2140:		if (key == K_MOUSE1 || key == K_MOUSE2) {
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 178
EQI4 $1056
ADDRLP4 36
INDIRI4
CNSTI4 179
NEI4 $1054
LABELV $1056
line 2141
;2141:			if (item->window.flags & WINDOW_LB_LEFTARROW) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1057
line 2142
;2142:				listPtr->startPos--;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2143
;2143:				if (listPtr->startPos < 0) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $1058
line 2144
;2144:					listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 2145
;2145:				}
line 2146
;2146:			} else if (item->window.flags & WINDOW_LB_RIGHTARROW) {
ADDRGP4 $1058
JUMPV
LABELV $1057
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1061
line 2148
;2147:				// one down
;2148:				listPtr->startPos++;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2149
;2149:				if (listPtr->startPos > max) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $1062
line 2150
;2150:					listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2151
;2151:				}
line 2152
;2152:			} else if (item->window.flags & WINDOW_LB_PGUP) {
ADDRGP4 $1062
JUMPV
LABELV $1061
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1065
line 2154
;2153:				// page up
;2154:				listPtr->startPos -= viewmax;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 2155
;2155:				if (listPtr->startPos < 0) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $1066
line 2156
;2156:					listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 2157
;2157:				}
line 2158
;2158:			} else if (item->window.flags & WINDOW_LB_PGDN) {
ADDRGP4 $1066
JUMPV
LABELV $1065
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1069
line 2160
;2159:				// page down
;2160:				listPtr->startPos += viewmax;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2161
;2161:				if (listPtr->startPos > max) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $1070
line 2162
;2162:					listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2163
;2163:				}
line 2164
;2164:			} else if (item->window.flags & WINDOW_LB_THUMB) {
ADDRGP4 $1070
JUMPV
LABELV $1069
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1073
line 2166
;2165:				// Display_SetCaptureItem(item);
;2166:			} else {
ADDRGP4 $1074
JUMPV
LABELV $1073
line 2168
;2167:				// select an item
;2168:				if (DC->realTime < lastListBoxClickTime && listPtr->doubleClick) {
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRGP4 lastListBoxClickTime
INDIRI4
GEI4 $1075
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1075
line 2169
;2169:					Item_RunScript(item, listPtr->doubleClick);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 2170
;2170:				}
LABELV $1075
line 2171
;2171:				lastListBoxClickTime = DC->realTime + DOUBLE_CLICK_DELAY;
ADDRGP4 lastListBoxClickTime
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 2172
;2172:				if (item->cursorPos != listPtr->cursorPos) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
EQI4 $1077
line 2173
;2173:					item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2174
;2174:					DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 2175
;2175:				}
LABELV $1077
line 2176
;2176:			}
LABELV $1074
LABELV $1070
LABELV $1066
LABELV $1062
LABELV $1058
line 2177
;2177:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
LABELV $1054
line 2179
;2178:		}
;2179:		if ( key == K_HOME || key == K_KP_HOME) {
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 143
EQI4 $1081
ADDRLP4 40
INDIRI4
CNSTI4 160
NEI4 $1079
LABELV $1081
line 2181
;2180:			// home
;2181:			listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 2182
;2182:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
LABELV $1079
line 2184
;2183:		}
;2184:		if ( key == K_END || key == K_KP_END) {
ADDRLP4 44
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 144
EQI4 $1084
ADDRLP4 44
INDIRI4
CNSTI4 166
NEI4 $1082
LABELV $1084
line 2186
;2185:			// end
;2186:			listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2187
;2187:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
LABELV $1082
line 2189
;2188:		}
;2189:		if (key == K_PGUP || key == K_KP_PGUP ) {
ADDRLP4 48
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 142
EQI4 $1087
ADDRLP4 48
INDIRI4
CNSTI4 162
NEI4 $1085
LABELV $1087
line 2191
;2190:			// page up
;2191:			if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1088
line 2192
;2192:				listPtr->cursorPos -= viewmax;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 2193
;2193:				if (listPtr->cursorPos < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1090
line 2194
;2194:					listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 2195
;2195:				}
LABELV $1090
line 2196
;2196:				if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $1092
line 2197
;2197:					listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2198
;2198:				}
LABELV $1092
line 2199
;2199:				if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $1094
line 2200
;2200:					listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2201
;2201:				}
LABELV $1094
line 2202
;2202:				item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2203
;2203:				DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 2204
;2204:			}
ADDRGP4 $1089
JUMPV
LABELV $1088
line 2205
;2205:			else {
line 2206
;2206:				listPtr->startPos -= viewmax;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 2207
;2207:				if (listPtr->startPos < 0) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $1096
line 2208
;2208:					listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 2209
;2209:				}
LABELV $1096
line 2210
;2210:			}
LABELV $1089
line 2211
;2211:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
LABELV $1085
line 2213
;2212:		}
;2213:		if ( key == K_PGDN || key == K_KP_PGDN ) {
ADDRLP4 52
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 141
EQI4 $1100
ADDRLP4 52
INDIRI4
CNSTI4 168
NEI4 $1098
LABELV $1100
line 2215
;2214:			// page down
;2215:			if (!listPtr->notselectable) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1101
line 2216
;2216:				listPtr->cursorPos += viewmax;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2217
;2217:				if (listPtr->cursorPos < listPtr->startPos) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
GEI4 $1103
line 2218
;2218:					listPtr->startPos = listPtr->cursorPos;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2219
;2219:				}
LABELV $1103
line 2220
;2220:				if (listPtr->cursorPos >= count) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1105
line 2221
;2221:					listPtr->cursorPos = count-1;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2222
;2222:				}
LABELV $1105
line 2223
;2223:				if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
LTI4 $1107
line 2224
;2224:					listPtr->startPos = listPtr->cursorPos - viewmax + 1;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2225
;2225:				}
LABELV $1107
line 2226
;2226:				item->cursorPos = listPtr->cursorPos;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2227
;2227:				DC->feederSelection(item->special, item->cursorPos);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 2228
;2228:			}
ADDRGP4 $1102
JUMPV
LABELV $1101
line 2229
;2229:			else {
line 2230
;2230:				listPtr->startPos += viewmax;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2231
;2231:				if (listPtr->startPos > max) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $1109
line 2232
;2232:					listPtr->startPos = max;
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2233
;2233:				}
LABELV $1109
line 2234
;2234:			}
LABELV $1102
line 2235
;2235:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $996
JUMPV
LABELV $1098
line 2237
;2236:		}
;2237:	}
LABELV $997
line 2238
;2238:	return qfalse;
CNSTI4 0
RETI4
LABELV $996
endproc Item_ListBox_HandleKey 72 12
export Item_YesNo_HandleKey
proc Item_YesNo_HandleKey 32 12
line 2241
;2239:}
;2240:
;2241:qboolean Item_YesNo_HandleKey(itemDef_t *item, int key) {
line 2243
;2242:
;2243:  if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS && item->cvar) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1112
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $1112
ADDRLP4 12
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1112
line 2244
;2244:		if (key == K_MOUSE1 || key == K_ENTER || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 178
EQI4 $1118
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $1118
ADDRLP4 16
INDIRI4
CNSTI4 179
EQI4 $1118
ADDRLP4 16
INDIRI4
CNSTI4 180
NEI4 $1114
LABELV $1118
line 2245
;2245:	    DC->setCVar(item->cvar, va("%i", !DC->getCVarValue(item->cvar)));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
NEF4 $1121
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $1122
JUMPV
LABELV $1121
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $1122
ADDRGP4 $1119
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2246
;2246:		  return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1111
JUMPV
LABELV $1114
line 2248
;2247:		}
;2248:  }
LABELV $1112
line 2250
;2249:
;2250:  return qfalse;
CNSTI4 0
RETI4
LABELV $1111
endproc Item_YesNo_HandleKey 32 12
export Item_Multi_CountSettings
proc Item_Multi_CountSettings 4 0
line 2254
;2251:
;2252:}
;2253:
;2254:int Item_Multi_CountSettings(itemDef_t *item) {
line 2255
;2255:	multiDef_t *multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2256
;2256:	if (multiPtr == NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1124
line 2257
;2257:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1123
JUMPV
LABELV $1124
line 2259
;2258:	}
;2259:	return multiPtr->count;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
RETI4
LABELV $1123
endproc Item_Multi_CountSettings 4 0
export Item_Multi_FindCvarByValue
proc Item_Multi_FindCvarByValue 1040 12
line 2262
;2260:}
;2261:
;2262:int Item_Multi_FindCvarByValue(itemDef_t *item) {
line 2264
;2263:	char buff[1024];
;2264:	float value = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 2266
;2265:	int i;
;2266:	multiDef_t *multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2267
;2267:	if (multiPtr) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1127
line 2268
;2268:		if (multiPtr->strDef) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1129
line 2269
;2269:	    DC->getCVarString(item->cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 2270
;2270:		} else {
ADDRGP4 $1130
JUMPV
LABELV $1129
line 2271
;2271:			value = DC->getCVarValue(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 1036
INDIRF4
ASGNF4
line 2272
;2272:		}
LABELV $1130
line 2273
;2273:		for (i = 0; i < multiPtr->count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1134
JUMPV
LABELV $1131
line 2274
;2274:			if (multiPtr->strDef) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1135
line 2275
;2275:				if (Q_stricmp(buff, multiPtr->cvarStr[i]) == 0) {
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1136
line 2276
;2276:					return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1126
JUMPV
line 2278
;2277:				}
;2278:			} else {
LABELV $1135
line 2279
;2279: 				if (multiPtr->cvarValue[i] == value) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $1139
line 2280
;2280: 					return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1126
JUMPV
LABELV $1139
line 2282
;2281: 				}
;2282: 			}
LABELV $1136
line 2283
;2283: 		}
LABELV $1132
line 2273
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1134
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
LTI4 $1131
line 2284
;2284:	}
LABELV $1127
line 2285
;2285:	return 0;
CNSTI4 0
RETI4
LABELV $1126
endproc Item_Multi_FindCvarByValue 1040 12
export Item_Multi_Setting
proc Item_Multi_Setting 1040 12
line 2288
;2286:}
;2287:
;2288:const char *Item_Multi_Setting(itemDef_t *item) {
line 2290
;2289:	char buff[1024];
;2290:	float value = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 2292
;2291:	int i;
;2292:	multiDef_t *multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2293
;2293:	if (multiPtr) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1142
line 2294
;2294:		if (multiPtr->strDef) {
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1144
line 2295
;2295:	    DC->getCVarString(item->cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 2296
;2296:		} else {
ADDRGP4 $1145
JUMPV
LABELV $1144
line 2297
;2297:			value = DC->getCVarValue(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 1036
INDIRF4
ASGNF4
line 2298
;2298:		}
LABELV $1145
line 2299
;2299:		for (i = 0; i < multiPtr->count; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1149
JUMPV
LABELV $1146
line 2300
;2300:			if (multiPtr->strDef) {
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1150
line 2301
;2301:				if (Q_stricmp(buff, multiPtr->cvarStr[i]) == 0) {
ADDRLP4 12
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1151
line 2302
;2302:					return multiPtr->cvarList[i];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1141
JUMPV
line 2304
;2303:				}
;2304:			} else {
LABELV $1150
line 2305
;2305: 				if (multiPtr->cvarValue[i] == value) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $1154
line 2306
;2306:					return multiPtr->cvarList[i];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1141
JUMPV
LABELV $1154
line 2308
;2307: 				}
;2308: 			}
LABELV $1151
line 2309
;2309: 		}
LABELV $1147
line 2299
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1149
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
LTI4 $1146
line 2310
;2310:	}
LABELV $1142
line 2311
;2311:	return "";
ADDRGP4 $107
RETP4
LABELV $1141
endproc Item_Multi_Setting 1040 12
export Item_Multi_HandleKey
proc Item_Multi_HandleKey 56 12
line 2319
;2312:}
;2313:
;2314://
;2315:// contais right click fix by defcon-x/ t e a m - m i r a g e
;2316://		(c) 2001 www.team-mirage.net defcon-x@team-mirage.net
;2317://
;2318:qboolean Item_Multi_HandleKey(itemDef_t *item, int key) 
;2319:{
line 2320
;2320:	multiDef_t *multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2321
;2321:	if (multiPtr) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1157
line 2322
;2322:	  if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS && item->cvar) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1159
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $1159
ADDRLP4 16
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1159
line 2323
;2323:	  {
line 2324
;2324:			if (key == K_MOUSE1 || key == K_ENTER || key == K_MOUSE2 || key == K_MOUSE3) 
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 178
EQI4 $1165
ADDRLP4 20
INDIRI4
CNSTI4 13
EQI4 $1165
ADDRLP4 20
INDIRI4
CNSTI4 179
EQI4 $1165
ADDRLP4 20
INDIRI4
CNSTI4 180
NEI4 $1161
LABELV $1165
line 2325
;2325:			{
line 2326
;2326:				int current = Item_Multi_FindCvarByValue(item) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Item_Multi_FindCvarByValue
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2328
;2327:
;2328:				int max = Item_Multi_CountSettings(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Item_Multi_CountSettings
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 2330
;2329:
;2330:				if ( key == K_MOUSE2 )
ADDRFP4 4
INDIRI4
CNSTI4 179
NEI4 $1166
line 2331
;2331:				{
line 2332
;2332:					current -= 2; // -1 would be the actual current
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2333
;2333:				}
LABELV $1166
line 2335
;2334:
;2335:				if ( current < 0 && key == K_MOUSE2 )
ADDRLP4 24
INDIRI4
CNSTI4 0
GEI4 $1168
ADDRFP4 4
INDIRI4
CNSTI4 179
NEI4 $1168
line 2336
;2336:				{
line 2337
;2337:					current = max-1;
ADDRLP4 24
ADDRLP4 28
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2338
;2338:				}
ADDRGP4 $1169
JUMPV
LABELV $1168
line 2339
;2339:				else if ( current < 0 || current >= max ) {					
ADDRLP4 40
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $1172
ADDRLP4 40
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $1170
LABELV $1172
line 2340
;2340:					current = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2342
;2341:					
;2342:				}
LABELV $1170
LABELV $1169
line 2344
;2343:
;2344:				if (multiPtr->strDef) {
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1173
line 2345
;2345:					DC->setCVar(item->cvar, multiPtr->cvarStr[current]);					
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2346
;2346:				} else {
ADDRGP4 $1174
JUMPV
LABELV $1173
line 2347
;2347:					float value = multiPtr->cvarValue[current];
ADDRLP4 44
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDP4
INDIRF4
ASGNF4
line 2350
;2348:					
;2349:
;2350:					if (((float)((int) value)) == value) {
ADDRLP4 48
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 48
INDIRF4
CVFI4 4
CVIF4 4
ADDRLP4 48
INDIRF4
NEF4 $1175
line 2351
;2351:						DC->setCVar(item->cvar, va("%i", (int) value ));
ADDRGP4 $1119
ARGP4
ADDRLP4 44
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2352
;2352:					}
ADDRGP4 $1176
JUMPV
LABELV $1175
line 2353
;2353:					else {
line 2354
;2354:						DC->setCVar(item->cvar, va("%f", value ));
ADDRGP4 $1177
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2355
;2355:					}
LABELV $1176
line 2356
;2356:				}
LABELV $1174
line 2357
;2357:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1156
JUMPV
LABELV $1161
line 2359
;2358:			}
;2359:		}
LABELV $1159
line 2360
;2360:	}
LABELV $1157
line 2361
;2361:  return qfalse;
CNSTI4 0
RETI4
LABELV $1156
endproc Item_Multi_HandleKey 56 12
export Item_TextField_HandleKey
proc Item_TextField_HandleKey 1076 12
line 2364
;2362:}
;2363:
;2364:qboolean Item_TextField_HandleKey(itemDef_t *item, int key) {
line 2367
;2365:	char buff[1024];
;2366:	int len;
;2367:	itemDef_t *newItem = NULL;
ADDRLP4 1028
CNSTP4 0
ASGNP4
line 2368
;2368:	editFieldDef_t *editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2370
;2369:
;2370:	if (item->cvar) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1179
line 2372
;2371:
;2372:		memset(buff, 0, sizeof(buff));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2373
;2373:		DC->getCVarString(item->cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 2374
;2374:		len = strlen(buff);
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1036
INDIRI4
ASGNI4
line 2375
;2375:		if (editPtr->maxChars && len > editPtr->maxChars) {
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $1181
ADDRLP4 1032
INDIRI4
ADDRLP4 1040
INDIRI4
LEI4 $1181
line 2376
;2376:			len = editPtr->maxChars;
ADDRLP4 1032
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 2377
;2377:		}
LABELV $1181
line 2378
;2378:		if ( key & K_CHAR_FLAG ) {
ADDRFP4 4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1183
line 2379
;2379:			key &= ~K_CHAR_FLAG;
ADDRFP4 4
ADDRFP4 4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 2382
;2380:
;2381:
;2382:			if (key == 'h' - 'a' + 1 )	{	// ctrl-h is backspace
ADDRFP4 4
INDIRI4
CNSTI4 8
NEI4 $1185
line 2383
;2383:				if ( item->cursorPos > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1187
line 2384
;2384:					memmove( &buff[item->cursorPos - 1], &buff[item->cursorPos], len + 1 - item->cursorPos);
ADDRLP4 1044
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRLP4 4-1
ADDP4
ARGP4
ADDRLP4 1044
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 1044
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 2385
;2385:					item->cursorPos--;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2386
;2386:					if (item->cursorPos < editPtr->paintOffset) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
GEI4 $1190
line 2387
;2387:						editPtr->paintOffset--;
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2388
;2388:					}
LABELV $1190
line 2389
;2389:				}
LABELV $1187
line 2390
;2390:				DC->setCVar(item->cvar, buff);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2391
;2391:	    		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1185
line 2398
;2392:			}
;2393:
;2394:
;2395:			//
;2396:			// ignore any non printable chars
;2397:			//
;2398:			if ( key < 32 || !item->cvar) {
ADDRFP4 4
INDIRI4
CNSTI4 32
LTI4 $1194
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1192
LABELV $1194
line 2399
;2399:			    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1192
line 2402
;2400:		    }
;2401:
;2402:			if (item->type == ITEM_TYPE_NUMERICFIELD) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 9
NEI4 $1195
line 2403
;2403:				if (key < '0' || key > '9') {
ADDRLP4 1044
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 48
LTI4 $1199
ADDRLP4 1044
INDIRI4
CNSTI4 57
LEI4 $1197
LABELV $1199
line 2404
;2404:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1197
line 2406
;2405:				}
;2406:			}
LABELV $1195
line 2408
;2407:
;2408:			if (!DC->getOverstrikeMode()) {
ADDRLP4 1044
ADDRGP4 DC
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1200
line 2409
;2409:				if (( len == MAX_EDITFIELD - 1 ) || (editPtr->maxChars && len >= editPtr->maxChars)) {
ADDRLP4 1048
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 255
EQI4 $1204
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $1202
ADDRLP4 1048
INDIRI4
ADDRLP4 1052
INDIRI4
LTI4 $1202
LABELV $1204
line 2410
;2410:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1202
line 2412
;2411:				}
;2412:				memmove( &buff[item->cursorPos + 1], &buff[item->cursorPos], len + 1 - item->cursorPos );
ADDRLP4 1056
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRLP4 4+1
ADDP4
ARGP4
ADDRLP4 1056
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 1056
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 2413
;2413:			} else {
ADDRGP4 $1201
JUMPV
LABELV $1200
line 2414
;2414:				if (editPtr->maxChars && item->cursorPos >= editPtr->maxChars) {
ADDRLP4 1048
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $1206
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $1206
line 2415
;2415:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1206
line 2417
;2416:				}
;2417:			}
LABELV $1201
line 2419
;2418:
;2419:			buff[item->cursorPos] = key;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 4
ADDP4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 2421
;2420:
;2421:			DC->setCVar(item->cvar, buff);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2423
;2422:
;2423:			if (item->cursorPos < len + 1) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
GEI4 $1184
line 2424
;2424:				item->cursorPos++;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2425
;2425:				if (editPtr->maxPaintChars && item->cursorPos > editPtr->maxPaintChars) {
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $1184
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 1052
INDIRI4
LEI4 $1184
line 2426
;2426:					editPtr->paintOffset++;
ADDRLP4 1056
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2427
;2427:				}
line 2428
;2428:			}
line 2430
;2429:
;2430:		} else {
ADDRGP4 $1184
JUMPV
LABELV $1183
line 2432
;2431:
;2432:			if ( key == K_DEL || key == K_KP_DEL ) {
ADDRLP4 1044
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 140
EQI4 $1214
ADDRLP4 1044
INDIRI4
CNSTI4 171
NEI4 $1212
LABELV $1214
line 2433
;2433:				if ( item->cursorPos < len ) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
GEI4 $1215
line 2434
;2434:					memmove( buff + item->cursorPos, buff + item->cursorPos + 1, len - item->cursorPos);
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1048
INDIRI4
ADDRLP4 4+1
ADDP4
ARGP4
ADDRLP4 1032
INDIRI4
ADDRLP4 1048
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 2435
;2435:					DC->setCVar(item->cvar, buff);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2436
;2436:				}
LABELV $1215
line 2437
;2437:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1212
line 2440
;2438:			}
;2439:
;2440:			if ( key == K_RIGHTARROW || key == K_KP_RIGHTARROW ) 
ADDRLP4 1048
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 135
EQI4 $1220
ADDRLP4 1048
INDIRI4
CNSTI4 165
NEI4 $1218
LABELV $1220
line 2441
;2441:			{
line 2442
;2442:				if (editPtr->maxPaintChars && item->cursorPos >= editPtr->maxPaintChars && item->cursorPos < len) {
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $1221
ADDRLP4 1056
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRLP4 1052
INDIRI4
LTI4 $1221
ADDRLP4 1056
INDIRI4
ADDRLP4 1032
INDIRI4
GEI4 $1221
line 2443
;2443:					item->cursorPos++;
ADDRLP4 1060
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2444
;2444:					editPtr->paintOffset++;
ADDRLP4 1064
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1064
INDIRP4
ADDRLP4 1064
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2445
;2445:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1221
line 2447
;2446:				}
;2447:				if (item->cursorPos < len) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
GEI4 $1223
line 2448
;2448:					item->cursorPos++;
ADDRLP4 1060
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2449
;2449:				} 
LABELV $1223
line 2450
;2450:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1218
line 2453
;2451:			}
;2452:
;2453:			if ( key == K_LEFTARROW || key == K_KP_LEFTARROW ) 
ADDRLP4 1052
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 134
EQI4 $1227
ADDRLP4 1052
INDIRI4
CNSTI4 163
NEI4 $1225
LABELV $1227
line 2454
;2454:			{
line 2455
;2455:				if ( item->cursorPos > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1228
line 2456
;2456:					item->cursorPos--;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2457
;2457:				}
LABELV $1228
line 2458
;2458:				if (item->cursorPos < editPtr->paintOffset) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
GEI4 $1230
line 2459
;2459:					editPtr->paintOffset--;
ADDRLP4 1056
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2460
;2460:				}
LABELV $1230
line 2461
;2461:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1225
line 2464
;2462:			}
;2463:
;2464:			if ( key == K_HOME || key == K_KP_HOME) {// || ( tolower(key) == 'a' && trap_Key_IsDown( K_CTRL ) ) ) {
ADDRLP4 1056
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 143
EQI4 $1234
ADDRLP4 1056
INDIRI4
CNSTI4 160
NEI4 $1232
LABELV $1234
line 2465
;2465:				item->cursorPos = 0;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 2466
;2466:				editPtr->paintOffset = 0;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 2467
;2467:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1232
line 2470
;2468:			}
;2469:
;2470:			if ( key == K_END || key == K_KP_END)  {// ( tolower(key) == 'e' && trap_Key_IsDown( K_CTRL ) ) ) {
ADDRLP4 1060
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 144
EQI4 $1237
ADDRLP4 1060
INDIRI4
CNSTI4 166
NEI4 $1235
LABELV $1237
line 2471
;2471:				item->cursorPos = len;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 1032
INDIRI4
ASGNI4
line 2472
;2472:				if(item->cursorPos > editPtr->maxPaintChars) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
LEI4 $1238
line 2473
;2473:					editPtr->paintOffset = len - editPtr->maxPaintChars;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1032
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2474
;2474:				}
LABELV $1238
line 2475
;2475:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1235
line 2478
;2476:			}
;2477:
;2478:			if ( key == K_INS || key == K_KP_INS ) {
ADDRLP4 1064
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 139
EQI4 $1242
ADDRLP4 1064
INDIRI4
CNSTI4 170
NEI4 $1240
LABELV $1242
line 2479
;2479:				DC->setOverstrikeMode(!DC->getOverstrikeMode());
ADDRLP4 1072
ADDRGP4 DC
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1244
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $1245
JUMPV
LABELV $1244
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $1245
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 108
ADDP4
INDIRP4
CALLV
pop
line 2480
;2480:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1240
line 2482
;2481:			}
;2482:		}
LABELV $1184
line 2484
;2483:
;2484:		if (key == K_TAB || key == K_DOWNARROW || key == K_KP_DOWNARROW) {
ADDRLP4 1044
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 9
EQI4 $1249
ADDRLP4 1044
INDIRI4
CNSTI4 133
EQI4 $1249
ADDRLP4 1044
INDIRI4
CNSTI4 167
NEI4 $1246
LABELV $1249
line 2485
;2485:			newItem = Menu_SetNextCursorItem(item->parent);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 Menu_SetNextCursorItem
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1048
INDIRP4
ASGNP4
line 2486
;2486:			if (newItem && (newItem->type == ITEM_TYPE_EDITFIELD || newItem->type == ITEM_TYPE_NUMERICFIELD)) {
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1250
ADDRLP4 1056
ADDRLP4 1028
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 4
EQI4 $1252
ADDRLP4 1056
INDIRI4
CNSTI4 9
NEI4 $1250
LABELV $1252
line 2487
;2487:				g_editItem = newItem;
ADDRGP4 g_editItem
ADDRLP4 1028
INDIRP4
ASGNP4
line 2488
;2488:			}
LABELV $1250
line 2489
;2489:		}
LABELV $1246
line 2491
;2490:
;2491:		if (key == K_UPARROW || key == K_KP_UPARROW) {
ADDRLP4 1048
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 132
EQI4 $1255
ADDRLP4 1048
INDIRI4
CNSTI4 161
NEI4 $1253
LABELV $1255
line 2492
;2492:			newItem = Menu_SetPrevCursorItem(item->parent);
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 Menu_SetPrevCursorItem
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1052
INDIRP4
ASGNP4
line 2493
;2493:			if (newItem && (newItem->type == ITEM_TYPE_EDITFIELD || newItem->type == ITEM_TYPE_NUMERICFIELD)) {
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1256
ADDRLP4 1060
ADDRLP4 1028
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 4
EQI4 $1258
ADDRLP4 1060
INDIRI4
CNSTI4 9
NEI4 $1256
LABELV $1258
line 2494
;2494:				g_editItem = newItem;
ADDRGP4 g_editItem
ADDRLP4 1028
INDIRP4
ASGNP4
line 2495
;2495:			}
LABELV $1256
line 2496
;2496:		}
LABELV $1253
line 2498
;2497:
;2498:		if ( key == K_ENTER || key == K_KP_ENTER || key == K_ESCAPE)  {
ADDRLP4 1052
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 13
EQI4 $1262
ADDRLP4 1052
INDIRI4
CNSTI4 169
EQI4 $1262
ADDRLP4 1052
INDIRI4
CNSTI4 27
NEI4 $1259
LABELV $1262
line 2499
;2499:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1259
line 2502
;2500:		}
;2501:
;2502:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1178
JUMPV
LABELV $1179
line 2504
;2503:	}
;2504:	return qfalse;
CNSTI4 0
RETI4
LABELV $1178
endproc Item_TextField_HandleKey 1076 12
proc Scroll_ListBox_AutoFunc 12 16
line 2508
;2505:
;2506:}
;2507:
;2508:static void Scroll_ListBox_AutoFunc(void *p) {
line 2509
;2509:	scrollInfo_t *si = (scrollInfo_t*)p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 2510
;2510:	if (DC->realTime > si->nextScrollTime) { 
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
LEI4 $1264
line 2514
;2511:		// need to scroll which is done by simulating a click to the item
;2512:		// this is done a bit sideways as the autoscroll "knows" that the item is a listbox
;2513:		// so it calls it directly
;2514:		Item_ListBox_HandleKey(si->item, si->scrollKey, qtrue, qfalse);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Item_ListBox_HandleKey
CALLI4
pop
line 2515
;2515:		si->nextScrollTime = DC->realTime + si->adjustValue; 
ADDRLP4 0
INDIRP4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 2516
;2516:	}
LABELV $1264
line 2518
;2517:
;2518:	if (DC->realTime > si->nextAdjustTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $1266
line 2519
;2519:		si->nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 150
ADDI4
ASGNI4
line 2520
;2520:		if (si->adjustValue > SCROLL_TIME_FLOOR) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
LEI4 $1268
line 2521
;2521:			si->adjustValue -= SCROLL_TIME_ADJUSTOFFSET;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 40
SUBI4
ASGNI4
line 2522
;2522:		}
LABELV $1268
line 2523
;2523:	}
LABELV $1266
line 2524
;2524:}
LABELV $1263
endproc Scroll_ListBox_AutoFunc 12 16
proc Scroll_ListBox_ThumbFunc 44 16
line 2526
;2525:
;2526:static void Scroll_ListBox_ThumbFunc(void *p) {
line 2527
;2527:	scrollInfo_t *si = (scrollInfo_t*)p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 2531
;2528:	rectDef_t r;
;2529:	int pos, max;
;2530:
;2531:	listBoxDef_t *listPtr = (listBoxDef_t*)si->item->typeData;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2532
;2532:	if (si->item->window.flags & WINDOW_HORIZONTAL) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1271
line 2533
;2533:		if (DC->cursorx == si->xStart) {
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
NEF4 $1273
line 2534
;2534:			return;
ADDRGP4 $1270
JUMPV
LABELV $1273
line 2536
;2535:		}
;2536:		r.x = si->item->window.rect.x + SCROLLBAR_SIZE + 1;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2537
;2537:		r.y = si->item->window.rect.y + si->item->window.rect.h - SCROLLBAR_SIZE - 1;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 2538
;2538:		r.h = SCROLLBAR_SIZE;
ADDRLP4 4+12
CNSTF4 1098907648
ASGNF4
line 2539
;2539:		r.w = si->item->window.rect.w - (SCROLLBAR_SIZE*2) - 2;
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2540
;2540:		max = Item_ListBox_MaxScroll(si->item);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Item_ListBox_MaxScroll
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 40
INDIRI4
ASGNI4
line 2542
;2541:		//
;2542:		pos = (DC->cursorx - r.x - SCROLLBAR_SIZE/2) * max / (r.w - SCROLLBAR_SIZE);
ADDRLP4 24
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
SUBF4
CNSTF4 1090519040
SUBF4
ADDRLP4 28
INDIRI4
CVIF4 4
MULF4
ADDRLP4 4+8
INDIRF4
CNSTF4 1098907648
SUBF4
DIVF4
CVFI4 4
ASGNI4
line 2543
;2543:		if (pos < 0) {
ADDRLP4 24
INDIRI4
CNSTI4 0
GEI4 $1279
line 2544
;2544:			pos = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2545
;2545:		}
ADDRGP4 $1280
JUMPV
LABELV $1279
line 2546
;2546:		else if (pos > max) {
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $1281
line 2547
;2547:			pos = max;
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 2548
;2548:		}
LABELV $1281
LABELV $1280
line 2549
;2549:		listPtr->startPos = pos;
ADDRLP4 32
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
line 2550
;2550:		si->xStart = DC->cursorx;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2551
;2551:	}
ADDRGP4 $1272
JUMPV
LABELV $1271
line 2552
;2552:	else if (DC->cursory != si->yStart) {
ADDRGP4 DC
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
EQF4 $1283
line 2554
;2553:
;2554:		r.x = si->item->window.rect.x + si->item->window.rect.w - SCROLLBAR_SIZE - 1;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 2555
;2555:		r.y = si->item->window.rect.y + SCROLLBAR_SIZE + 1;
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2556
;2556:		r.h = si->item->window.rect.h - (SCROLLBAR_SIZE*2) - 2;
ADDRLP4 4+12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2557
;2557:		r.w = SCROLLBAR_SIZE;
ADDRLP4 4+8
CNSTF4 1098907648
ASGNF4
line 2558
;2558:		max = Item_ListBox_MaxScroll(si->item);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Item_ListBox_MaxScroll
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 40
INDIRI4
ASGNI4
line 2560
;2559:		//
;2560:		pos = (DC->cursory - r.y - SCROLLBAR_SIZE/2) * max / (r.h - SCROLLBAR_SIZE);
ADDRLP4 24
ADDRGP4 DC
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4+4
INDIRF4
SUBF4
CNSTF4 1090519040
SUBF4
ADDRLP4 28
INDIRI4
CVIF4 4
MULF4
ADDRLP4 4+12
INDIRF4
CNSTF4 1098907648
SUBF4
DIVF4
CVFI4 4
ASGNI4
line 2561
;2561:		if (pos < 0) {
ADDRLP4 24
INDIRI4
CNSTI4 0
GEI4 $1290
line 2562
;2562:			pos = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2563
;2563:		}
ADDRGP4 $1291
JUMPV
LABELV $1290
line 2564
;2564:		else if (pos > max) {
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $1292
line 2565
;2565:			pos = max;
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 2566
;2566:		}
LABELV $1292
LABELV $1291
line 2567
;2567:		listPtr->startPos = pos;
ADDRLP4 32
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
line 2568
;2568:		si->yStart = DC->cursory;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2569
;2569:	}
LABELV $1283
LABELV $1272
line 2571
;2570:
;2571:	if (DC->realTime > si->nextScrollTime) { 
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
LEI4 $1294
line 2575
;2572:		// need to scroll which is done by simulating a click to the item
;2573:		// this is done a bit sideways as the autoscroll "knows" that the item is a listbox
;2574:		// so it calls it directly
;2575:		Item_ListBox_HandleKey(si->item, si->scrollKey, qtrue, qfalse);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Item_ListBox_HandleKey
CALLI4
pop
line 2576
;2576:		si->nextScrollTime = DC->realTime + si->adjustValue; 
ADDRLP4 0
INDIRP4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 2577
;2577:	}
LABELV $1294
line 2579
;2578:
;2579:	if (DC->realTime > si->nextAdjustTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $1296
line 2580
;2580:		si->nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 150
ADDI4
ASGNI4
line 2581
;2581:		if (si->adjustValue > SCROLL_TIME_FLOOR) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
LEI4 $1298
line 2582
;2582:			si->adjustValue -= SCROLL_TIME_ADJUSTOFFSET;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 40
SUBI4
ASGNI4
line 2583
;2583:		}
LABELV $1298
line 2584
;2584:	}
LABELV $1296
line 2585
;2585:}
LABELV $1270
endproc Scroll_ListBox_ThumbFunc 44 16
proc Scroll_Slider_ThumbFunc 28 8
line 2587
;2586:
;2587:static void Scroll_Slider_ThumbFunc(void *p) {
line 2589
;2588:	float x, value, cursorx;
;2589:	scrollInfo_t *si = (scrollInfo_t*)p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 2590
;2590:	editFieldDef_t *editDef = si->item->typeData;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2592
;2591:
;2592:	if (si->item->text) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1301
line 2593
;2593:		x = si->item->textRect.x + si->item->textRect.w + 8;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2594
;2594:	} else {
ADDRGP4 $1302
JUMPV
LABELV $1301
line 2595
;2595:		x = si->item->window.rect.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
INDIRF4
ASGNF4
line 2596
;2596:	}
LABELV $1302
line 2598
;2597:
;2598:	cursorx = DC->cursorx;
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2600
;2599:
;2600:	if (cursorx < x) {
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $1303
line 2601
;2601:		cursorx = x;
ADDRLP4 12
ADDRLP4 8
INDIRF4
ASGNF4
line 2602
;2602:	} else if (cursorx > x + SLIDER_WIDTH) {
ADDRGP4 $1304
JUMPV
LABELV $1303
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1119879168
ADDF4
LEF4 $1305
line 2603
;2603:		cursorx = x + SLIDER_WIDTH;
ADDRLP4 12
ADDRLP4 8
INDIRF4
CNSTF4 1119879168
ADDF4
ASGNF4
line 2604
;2604:	}
LABELV $1305
LABELV $1304
line 2605
;2605:	value = cursorx - x;
ADDRLP4 4
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 2606
;2606:	value /= SLIDER_WIDTH;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1119879168
DIVF4
ASGNF4
line 2607
;2607:	value *= (editDef->maxVal - editDef->minVal);
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
SUBF4
MULF4
ASGNF4
line 2608
;2608:	value += editDef->minVal;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 2609
;2609:	DC->setCVar(si->item->cvar, va("%f", value));
ADDRGP4 $1177
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2610
;2610:}
LABELV $1300
endproc Scroll_Slider_ThumbFunc 28 8
export Item_StartCapture
proc Item_StartCapture 24 12
line 2612
;2611:
;2612:void Item_StartCapture(itemDef_t *item, int key) {
line 2614
;2613:	int flags;
;2614:	switch (item->type) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $1308
ADDRLP4 4
INDIRI4
CNSTI4 10
GTI4 $1308
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1335-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1335
address $1311
address $1308
address $1311
address $1308
address $1308
address $1311
address $1328
code
LABELV $1311
line 2619
;2615:    case ITEM_TYPE_EDITFIELD:
;2616:    case ITEM_TYPE_NUMERICFIELD:
;2617:
;2618:		case ITEM_TYPE_LISTBOX:
;2619:		{
line 2620
;2620:			flags = Item_ListBox_OverLB(item, DC->cursorx, DC->cursory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Item_ListBox_OverLB
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 2621
;2621:			if (flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW)) {
ADDRLP4 0
INDIRI4
CNSTI4 6144
BANDI4
CNSTI4 0
EQI4 $1312
line 2622
;2622:				scrollInfo.nextScrollTime = DC->realTime + SCROLL_TIME_START;
ADDRGP4 scrollInfo
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2623
;2623:				scrollInfo.nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
ADDRGP4 scrollInfo+4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 150
ADDI4
ASGNI4
line 2624
;2624:				scrollInfo.adjustValue = SCROLL_TIME_START;
ADDRGP4 scrollInfo+8
CNSTI4 500
ASGNI4
line 2625
;2625:				scrollInfo.scrollKey = key;
ADDRGP4 scrollInfo+12
ADDRFP4 4
INDIRI4
ASGNI4
line 2626
;2626:				scrollInfo.scrollDir = (flags & WINDOW_LB_LEFTARROW) ? qtrue : qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1319
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $1320
JUMPV
LABELV $1319
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $1320
ADDRGP4 scrollInfo+28
ADDRLP4 20
INDIRI4
ASGNI4
line 2627
;2627:				scrollInfo.item = item;
ADDRGP4 scrollInfo+24
ADDRFP4 0
INDIRP4
ASGNP4
line 2628
;2628:				captureData = &scrollInfo;
ADDRGP4 captureData
ADDRGP4 scrollInfo
ASGNP4
line 2629
;2629:				captureFunc = &Scroll_ListBox_AutoFunc;
ADDRGP4 captureFunc
ADDRGP4 Scroll_ListBox_AutoFunc
ASGNP4
line 2630
;2630:				itemCapture = item;
ADDRGP4 itemCapture
ADDRFP4 0
INDIRP4
ASGNP4
line 2631
;2631:			} else if (flags & WINDOW_LB_THUMB) {
ADDRGP4 $1309
JUMPV
LABELV $1312
ADDRLP4 0
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1309
line 2632
;2632:				scrollInfo.scrollKey = key;
ADDRGP4 scrollInfo+12
ADDRFP4 4
INDIRI4
ASGNI4
line 2633
;2633:				scrollInfo.item = item;
ADDRGP4 scrollInfo+24
ADDRFP4 0
INDIRP4
ASGNP4
line 2634
;2634:				scrollInfo.xStart = DC->cursorx;
ADDRGP4 scrollInfo+16
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2635
;2635:				scrollInfo.yStart = DC->cursory;
ADDRGP4 scrollInfo+20
ADDRGP4 DC
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2636
;2636:				captureData = &scrollInfo;
ADDRGP4 captureData
ADDRGP4 scrollInfo
ASGNP4
line 2637
;2637:				captureFunc = &Scroll_ListBox_ThumbFunc;
ADDRGP4 captureFunc
ADDRGP4 Scroll_ListBox_ThumbFunc
ASGNP4
line 2638
;2638:				itemCapture = item;
ADDRGP4 itemCapture
ADDRFP4 0
INDIRP4
ASGNP4
line 2639
;2639:			}
line 2640
;2640:			break;
ADDRGP4 $1309
JUMPV
LABELV $1328
line 2643
;2641:		}
;2642:		case ITEM_TYPE_SLIDER:
;2643:		{
line 2644
;2644:			flags = Item_Slider_OverSlider(item, DC->cursorx, DC->cursory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Item_Slider_OverSlider
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 2645
;2645:			if (flags & WINDOW_LB_THUMB) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1309
line 2646
;2646:				scrollInfo.scrollKey = key;
ADDRGP4 scrollInfo+12
ADDRFP4 4
INDIRI4
ASGNI4
line 2647
;2647:				scrollInfo.item = item;
ADDRGP4 scrollInfo+24
ADDRFP4 0
INDIRP4
ASGNP4
line 2648
;2648:				scrollInfo.xStart = DC->cursorx;
ADDRGP4 scrollInfo+16
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2649
;2649:				scrollInfo.yStart = DC->cursory;
ADDRGP4 scrollInfo+20
ADDRGP4 DC
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2650
;2650:				captureData = &scrollInfo;
ADDRGP4 captureData
ADDRGP4 scrollInfo
ASGNP4
line 2651
;2651:				captureFunc = &Scroll_Slider_ThumbFunc;
ADDRGP4 captureFunc
ADDRGP4 Scroll_Slider_ThumbFunc
ASGNP4
line 2652
;2652:				itemCapture = item;
ADDRGP4 itemCapture
ADDRFP4 0
INDIRP4
ASGNP4
line 2653
;2653:			}
line 2654
;2654:			break;
LABELV $1308
LABELV $1309
line 2657
;2655:		}
;2656:	}
;2657:}
LABELV $1307
endproc Item_StartCapture 24 12
export Item_StopCapture
proc Item_StopCapture 0 0
line 2659
;2658:
;2659:void Item_StopCapture(itemDef_t *item) {
line 2661
;2660:
;2661:}
LABELV $1337
endproc Item_StopCapture 0 0
export Item_Slider_HandleKey
proc Item_Slider_HandleKey 72 12
line 2663
;2662:
;2663:qboolean Item_Slider_HandleKey(itemDef_t *item, int key, qboolean down) {
line 2667
;2664:	float x, value, width, work;
;2665:
;2666:	//DC->Print("slider handle key\n");
;2667:	if (item->window.flags & WINDOW_HASFOCUS && item->cvar && Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1339
ADDRLP4 16
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1339
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1339
line 2668
;2668:		if (key == K_MOUSE1 || key == K_ENTER || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 178
EQI4 $1345
ADDRLP4 28
INDIRI4
CNSTI4 13
EQI4 $1345
ADDRLP4 28
INDIRI4
CNSTI4 179
EQI4 $1345
ADDRLP4 28
INDIRI4
CNSTI4 180
NEI4 $1341
LABELV $1345
line 2669
;2669:			editFieldDef_t *editDef = item->typeData;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 2670
;2670:			if (editDef) {
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1346
line 2672
;2671:				rectDef_t testRect;
;2672:				width = SLIDER_WIDTH;
ADDRLP4 8
CNSTF4 1119879168
ASGNF4
line 2673
;2673:				if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1348
line 2674
;2674:					x = item->textRect.x + item->textRect.w + 8;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2675
;2675:				} else {
ADDRGP4 $1349
JUMPV
LABELV $1348
line 2676
;2676:					x = item->window.rect.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 2677
;2677:				}
LABELV $1349
line 2679
;2678:
;2679:				testRect = item->window.rect;
ADDRLP4 36
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 20
line 2680
;2680:				testRect.x = x;
ADDRLP4 36
ADDRLP4 4
INDIRF4
ASGNF4
line 2681
;2681:				value = (float)SLIDER_THUMB_WIDTH / 2;
ADDRLP4 0
CNSTF4 1086324736
ASGNF4
line 2682
;2682:				testRect.x -= value;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
line 2684
;2683:				//DC->Print("slider x: %f\n", testRect.x);
;2684:				testRect.w = (SLIDER_WIDTH + (float)SLIDER_THUMB_WIDTH / 2);
ADDRLP4 36+8
CNSTF4 1120665600
ASGNF4
line 2686
;2685:				//DC->Print("slider w: %f\n", testRect.w);
;2686:				if (Rect_ContainsPoint(&testRect, DC->cursorx, DC->cursory)) {
ADDRLP4 36
ARGP4
ADDRLP4 56
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $1351
line 2687
;2687:					work = DC->cursorx - x;
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 2688
;2688:					value = work / width;
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 2689
;2689:					value *= (editDef->maxVal - editDef->minVal);
ADDRLP4 64
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
INDIRF4
SUBF4
MULF4
ASGNF4
line 2692
;2690:					// vm fuckage
;2691:					// value = (((float)(DC->cursorx - x)/ SLIDER_WIDTH) * (editDef->maxVal - editDef->minVal));
;2692:					value += editDef->minVal;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 2693
;2693:					DC->setCVar(item->cvar, va("%f", value));
ADDRGP4 $1177
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CALLV
pop
line 2694
;2694:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1338
JUMPV
LABELV $1351
line 2696
;2695:				}
;2696:			}
LABELV $1346
line 2697
;2697:		}
LABELV $1341
line 2698
;2698:	}
LABELV $1339
line 2699
;2699:	DC->Print("slider handle key exit\n");
ADDRGP4 $1353
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 160
ADDP4
INDIRP4
CALLV
pop
line 2700
;2700:	return qfalse;
CNSTI4 0
RETI4
LABELV $1338
endproc Item_Slider_HandleKey 72 12
export Item_HandleKey
proc Item_HandleKey 32 16
line 2704
;2701:}
;2702:
;2703:
;2704:qboolean Item_HandleKey(itemDef_t *item, int key, qboolean down) {
line 2706
;2705:
;2706:	if (itemCapture) {
ADDRGP4 itemCapture
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1355
line 2707
;2707:		Item_StopCapture(itemCapture);
ADDRGP4 itemCapture
INDIRP4
ARGP4
ADDRGP4 Item_StopCapture
CALLV
pop
line 2708
;2708:		itemCapture = NULL;
ADDRGP4 itemCapture
CNSTP4 0
ASGNP4
line 2709
;2709:		captureFunc = NULL;
ADDRGP4 captureFunc
CNSTP4 0
ASGNP4
line 2710
;2710:		captureData = NULL;
ADDRGP4 captureData
CNSTP4 0
ASGNP4
line 2711
;2711:	} else {
ADDRGP4 $1356
JUMPV
LABELV $1355
line 2712
;2712:		if (down && key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1360
ADDRFP4 4
INDIRI4
CNSTI4 178
EQI4 $1361
LABELV $1360
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1361
ADDRLP4 0
INDIRI4
CNSTI4 180
NEI4 $1357
LABELV $1361
line 2713
;2713:			Item_StartCapture(item, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Item_StartCapture
CALLV
pop
line 2714
;2714:		}
LABELV $1357
line 2715
;2715:	}
LABELV $1356
line 2717
;2716:
;2717:	if (!down) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $1362
line 2718
;2718:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1354
JUMPV
LABELV $1362
line 2721
;2719:	}
;2720:
;2721:  switch (item->type) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $1364
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $1364
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1378-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1378
address $1367
address $1368
address $1369
address $1370
address $1371
address $1372
address $1364
address $1375
address $1370
address $1377
address $1373
address $1374
address $1376
code
LABELV $1367
line 2723
;2722:    case ITEM_TYPE_BUTTON:
;2723:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1354
JUMPV
line 2724
;2724:      break;
LABELV $1368
line 2726
;2725:    case ITEM_TYPE_RADIOBUTTON:
;2726:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1354
JUMPV
line 2727
;2727:      break;
LABELV $1369
line 2729
;2728:    case ITEM_TYPE_CHECKBOX:
;2729:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1354
JUMPV
line 2730
;2730:      break;
LABELV $1370
line 2734
;2731:    case ITEM_TYPE_EDITFIELD:
;2732:    case ITEM_TYPE_NUMERICFIELD:
;2733:      //return Item_TextField_HandleKey(item, key);
;2734:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1354
JUMPV
line 2735
;2735:      break;
LABELV $1371
line 2737
;2736:    case ITEM_TYPE_COMBO:
;2737:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1354
JUMPV
line 2738
;2738:      break;
LABELV $1372
line 2740
;2739:    case ITEM_TYPE_LISTBOX:
;2740:      return Item_ListBox_HandleKey(item, key, down, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 Item_ListBox_HandleKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $1354
JUMPV
line 2741
;2741:      break;
LABELV $1373
line 2743
;2742:    case ITEM_TYPE_YESNO:
;2743:      return Item_YesNo_HandleKey(item, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Item_YesNo_HandleKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $1354
JUMPV
line 2744
;2744:      break;
LABELV $1374
line 2746
;2745:    case ITEM_TYPE_MULTI:
;2746:      return Item_Multi_HandleKey(item, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Item_Multi_HandleKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $1354
JUMPV
line 2747
;2747:      break;
LABELV $1375
line 2749
;2748:    case ITEM_TYPE_OWNERDRAW:
;2749:      return Item_OwnerDraw_HandleKey(item, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Item_OwnerDraw_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $1354
JUMPV
line 2750
;2750:      break;
LABELV $1376
line 2752
;2751:    case ITEM_TYPE_BIND:
;2752:			return Item_Bind_HandleKey(item, key, down);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Item_Bind_HandleKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $1354
JUMPV
line 2753
;2753:      break;
LABELV $1377
line 2755
;2754:    case ITEM_TYPE_SLIDER:
;2755:      return Item_Slider_HandleKey(item, key, down);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Item_Slider_HandleKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $1354
JUMPV
line 2756
;2756:      break;
LABELV $1364
line 2761
;2757:    //case ITEM_TYPE_IMAGE:
;2758:    //  Item_Image_Paint(item);
;2759:    //  break;
;2760:    default:
;2761:      return qfalse;
CNSTI4 0
RETI4
line 2762
;2762:      break;
LABELV $1354
endproc Item_HandleKey 32 16
export Item_Action
proc Item_Action 8 8
line 2768
;2763:  }
;2764:
;2765:  //return qfalse;
;2766:}
;2767:
;2768:void Item_Action(itemDef_t *item) {
line 2770
;2769:
;2770:	if (item && item->ownerParam )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1381
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1381
line 2771
;2771:	{
line 2772
;2772:		Item_RunExtScript(item, item->action );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunExtScript
CALLV
pop
line 2773
;2773:	}
ADDRGP4 $1382
JUMPV
LABELV $1381
line 2774
;2774:	else if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1383
line 2775
;2775:		Item_RunScript(item, item->action);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 2776
;2776:	}
LABELV $1383
LABELV $1382
line 2777
;2777:}
LABELV $1380
endproc Item_Action 8 8
export Menu_SetPrevCursorItem
proc Menu_SetPrevCursorItem 44 12
line 2779
;2778:
;2779:itemDef_t *Menu_SetPrevCursorItem(menuDef_t *menu) {
line 2780
;2780:  qboolean wrapped = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2781
;2781:	int oldCursor = menu->cursorItem;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 2783
;2782:  
;2783:  if (menu->cursorItem < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1389
line 2784
;2784:    menu->cursorItem = menu->itemCount-1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2785
;2785:    wrapped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2786
;2786:  } 
ADDRGP4 $1389
JUMPV
LABELV $1388
line 2788
;2787:
;2788:  while (menu->cursorItem > -1) {
line 2790
;2789:    
;2790:    menu->cursorItem--;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2791
;2791:    if (menu->cursorItem < 0 && !wrapped) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1391
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1391
line 2792
;2792:      wrapped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2793
;2793:      menu->cursorItem = menu->itemCount -1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2794
;2794:    }
LABELV $1391
line 2796
;2795:
;2796:		if (Item_SetFocus(menu->items[menu->cursorItem], DC->cursorx, DC->cursory)) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Item_SetFocus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1393
line 2797
;2797:			Menu_HandleMouseMove(menu, menu->items[menu->cursorItem]->window.rect.x + 1, menu->items[menu->cursorItem]->window.rect.y + 1);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 2798
;2798:      return menu->items[menu->cursorItem];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1385
JUMPV
LABELV $1393
line 2800
;2799:    }
;2800:  }
LABELV $1389
line 2788
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -1
GTI4 $1388
line 2801
;2801:	menu->cursorItem = oldCursor;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2802
;2802:	return NULL;
CNSTP4 0
RETP4
LABELV $1385
endproc Menu_SetPrevCursorItem 44 12
export Menu_SetNextCursorItem
proc Menu_SetNextCursorItem 44 12
line 2806
;2803:
;2804:}
;2805:
;2806:itemDef_t *Menu_SetNextCursorItem(menuDef_t *menu) {
line 2808
;2807:
;2808:  qboolean wrapped = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2809
;2809:	int oldCursor = menu->cursorItem;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 2812
;2810:
;2811:
;2812:  if (menu->cursorItem == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1399
line 2813
;2813:    menu->cursorItem = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 2814
;2814:    wrapped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2815
;2815:  }
ADDRGP4 $1399
JUMPV
LABELV $1398
line 2817
;2816:
;2817:  while (menu->cursorItem < menu->itemCount) {
line 2819
;2818:
;2819:    menu->cursorItem++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2820
;2820:    if (menu->cursorItem >= menu->itemCount && !wrapped) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $1401
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1401
line 2821
;2821:      wrapped = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2822
;2822:      menu->cursorItem = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 2823
;2823:    }
LABELV $1401
line 2824
;2824:		if (Item_SetFocus(menu->items[menu->cursorItem], DC->cursorx, DC->cursory)) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Item_SetFocus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1403
line 2825
;2825:			Menu_HandleMouseMove(menu, menu->items[menu->cursorItem]->window.rect.x + 1, menu->items[menu->cursorItem]->window.rect.y + 1);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 2826
;2826:      return menu->items[menu->cursorItem];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1395
JUMPV
LABELV $1403
line 2829
;2827:    }
;2828:    
;2829:  }
LABELV $1399
line 2817
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $1398
line 2831
;2830:
;2831:	menu->cursorItem = oldCursor;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2832
;2832:	return NULL;
CNSTP4 0
RETP4
LABELV $1395
endproc Menu_SetNextCursorItem 44 12
proc Window_CloseCinematic 4 4
line 2835
;2833:}
;2834:
;2835:static void Window_CloseCinematic(windowDef_t *window) {
line 2836
;2836:	if (window->style == WINDOW_STYLE_CINEMATIC && window->cinematic >= 0) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1406
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1406
line 2837
;2837:		DC->stopCinematic(window->cinematic);
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 188
ADDP4
INDIRP4
CALLV
pop
line 2838
;2838:		window->cinematic = -1;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 -1
ASGNI4
line 2839
;2839:	}
LABELV $1406
line 2840
;2840:}
LABELV $1405
endproc Window_CloseCinematic 4 4
proc Menu_CloseCinematics 4 4
line 2842
;2841:
;2842:static void Menu_CloseCinematics(menuDef_t *menu) {
line 2843
;2843:	if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1409
line 2845
;2844:		int i;
;2845:		Window_CloseCinematic(&menu->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_CloseCinematic
CALLV
pop
line 2846
;2846:	  for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1414
JUMPV
LABELV $1411
line 2847
;2847:		  Window_CloseCinematic(&menu->items[i]->window);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Window_CloseCinematic
CALLV
pop
line 2848
;2848:			if (menu->items[i]->type == ITEM_TYPE_OWNERDRAW) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1415
line 2849
;2849:				DC->stopCinematic(0-menu->items[i]->window.ownerDraw);
CNSTI4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 188
ADDP4
INDIRP4
CALLV
pop
line 2850
;2850:			}
LABELV $1415
line 2851
;2851:	  }
LABELV $1412
line 2846
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1414
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $1411
line 2852
;2852:	}
LABELV $1409
line 2853
;2853:}
LABELV $1408
endproc Menu_CloseCinematics 4 4
proc Display_CloseCinematics 4 4
line 2855
;2854:
;2855:static void Display_CloseCinematics() {
line 2857
;2856:	int i;
;2857:	for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1421
JUMPV
LABELV $1418
line 2858
;2858:		Menu_CloseCinematics(&Menus[i]);
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRGP4 Menu_CloseCinematics
CALLV
pop
line 2859
;2859:	}
LABELV $1419
line 2857
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1421
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $1418
line 2860
;2860:}
LABELV $1417
endproc Display_CloseCinematics 4 4
export Menus_Activate
proc Menus_Activate 572 8
line 2862
;2861:
;2862:void  Menus_Activate(menuDef_t *menu) {
line 2863
;2863:	menu->window.flags |= (WINDOW_HASFOCUS | WINDOW_VISIBLE);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 6
BORI4
ASGNI4
line 2864
;2864:	if (menu->onOpen) {
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1423
line 2866
;2865:		itemDef_t item;
;2866:		item.parent = menu;
ADDRLP4 4+248
ADDRFP4 0
INDIRP4
ASGNP4
line 2867
;2867:		Item_RunScript(&item, menu->onOpen);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 2868
;2868:	}
LABELV $1423
line 2870
;2869:
;2870:	if (menu->soundName && *menu->soundName) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1426
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1426
line 2872
;2871://		DC->stopBackgroundTrack();					// you don't want to do this since it will reset s_rawend
;2872:		DC->startBackgroundTrack(menu->soundName, menu->soundName);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 176
ADDP4
INDIRP4
CALLV
pop
line 2873
;2873:	}
LABELV $1426
line 2875
;2874:
;2875:	Display_CloseCinematics();
ADDRGP4 Display_CloseCinematics
CALLV
pop
line 2877
;2876:
;2877:}
LABELV $1422
endproc Menus_Activate 572 8
export Display_VisibleMenuCount
proc Display_VisibleMenuCount 8 0
line 2879
;2878:
;2879:int Display_VisibleMenuCount() {
line 2881
;2880:	int i, count;
;2881:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2882
;2882:	for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1432
JUMPV
LABELV $1429
line 2883
;2883:		if (Menus[i].window.flags & (WINDOW_FORCED | WINDOW_VISIBLE)) {
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+76
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
EQI4 $1433
line 2884
;2884:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2885
;2885:		}
LABELV $1433
line 2886
;2886:	}
LABELV $1430
line 2882
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1432
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $1429
line 2887
;2887:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1428
endproc Display_VisibleMenuCount 8 0
export Menus_HandleOOBClick
proc Menus_HandleOOBClick 24 12
line 2890
;2888:}
;2889:
;2890:void Menus_HandleOOBClick(menuDef_t *menu, int key, qboolean down) {
line 2891
;2891:	if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1437
line 2896
;2892:		int i;
;2893:		// basically the behaviour we are looking for is if there are windows in the stack.. see if 
;2894:		// the cursor is within any of them.. if not close them otherwise activate them and pass the 
;2895:		// key on.. force a mouse move to activate focus and script stuff 
;2896:		if (down && menu->window.flags & WINDOW_OOB_CLICK) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1439
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $1439
line 2897
;2897:			Menu_RunCloseScript(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_RunCloseScript
CALLV
pop
line 2898
;2898:			menu->window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -7
BANDI4
ASGNI4
line 2899
;2899:		}
LABELV $1439
line 2901
;2900:
;2901:		for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1444
JUMPV
LABELV $1441
line 2902
;2902:			if (Menu_OverActiveItem(&Menus[i], DC->cursorx, DC->cursory)) {
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ADDRGP4 Menu_OverActiveItem
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1445
line 2903
;2903:				Menu_RunCloseScript(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_RunCloseScript
CALLV
pop
line 2904
;2904:				menu->window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -7
BANDI4
ASGNI4
line 2905
;2905:				Menus_Activate(&Menus[i]);
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRGP4 Menus_Activate
CALLV
pop
line 2906
;2906:				Menu_HandleMouseMove(&Menus[i], DC->cursorx, DC->cursory);
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 2907
;2907:				Menu_HandleKey(&Menus[i], key, down);
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Menu_HandleKey
CALLV
pop
line 2908
;2908:			}
LABELV $1445
line 2909
;2909:		}
LABELV $1442
line 2901
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1444
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $1441
line 2911
;2910:
;2911:		if (Display_VisibleMenuCount() == 0) {
ADDRLP4 8
ADDRGP4 Display_VisibleMenuCount
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1447
line 2912
;2912:			if (DC->Pause) {
ADDRGP4 DC
INDIRP4
CNSTI4 164
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1449
line 2913
;2913:				DC->Pause(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 164
ADDP4
INDIRP4
CALLV
pop
line 2914
;2914:			}
LABELV $1449
line 2915
;2915:		}
LABELV $1447
line 2916
;2916:		Display_CloseCinematics();
ADDRGP4 Display_CloseCinematics
CALLV
pop
line 2917
;2917:	}
LABELV $1437
line 2918
;2918:}
LABELV $1436
endproc Menus_HandleOOBClick 24 12
bss
align 4
LABELV $1452
skip 20
code
proc Item_CorrectedTextRect 4 12
line 2920
;2919:
;2920:static rectDef_t *Item_CorrectedTextRect(itemDef_t *item) {
line 2922
;2921:	static rectDef_t rect;
;2922:	memset(&rect, 0, sizeof(rectDef_t));
ADDRGP4 $1452
ARGP4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2923
;2923:	if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1453
line 2924
;2924:		rect = item->textRect;
ADDRGP4 $1452
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRB
ASGNB 20
line 2925
;2925:		if (rect.w) {
ADDRGP4 $1452+8
INDIRF4
CNSTF4 0
EQF4 $1455
line 2926
;2926:			rect.y -= rect.h;
ADDRLP4 0
ADDRGP4 $1452+4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 $1452+12
INDIRF4
SUBF4
ASGNF4
line 2927
;2927:		}
LABELV $1455
line 2928
;2928:	}
LABELV $1453
line 2929
;2929:	return &rect;
ADDRGP4 $1452
RETP4
LABELV $1451
endproc Item_CorrectedTextRect 4 12
data
align 4
LABELV $1481
byte 4 0
export Menu_HandleKey
code
proc Menu_HandleKey 656 12
line 2932
;2930:}
;2931:
;2932:void Menu_HandleKey(menuDef_t *menu, int key, qboolean down) {
line 2934
;2933:	int i;
;2934:	itemDef_t *item = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2935
;2935:	qboolean inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2937
;2936:
;2937:	if (inHandler) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1461
line 2938
;2938:		return;
ADDRGP4 $1460
JUMPV
LABELV $1461
line 2941
;2939:	}
;2940:
;2941:	inHandler = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2942
;2942:	if (g_waitingForKey && down) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 g_waitingForKey
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1463
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1463
line 2943
;2943:		Item_Bind_HandleKey(g_bindItem, key, down);
ADDRGP4 g_bindItem
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Item_Bind_HandleKey
CALLI4
pop
line 2944
;2944:		inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2945
;2945:		return;
ADDRGP4 $1460
JUMPV
LABELV $1463
line 2948
;2946:	}
;2947:
;2948:	if (g_editingField && down) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 g_editingField
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1465
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1465
line 2949
;2949:		if (!Item_TextField_HandleKey(g_editItem, key)) {
ADDRGP4 g_editItem
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Item_TextField_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1467
line 2950
;2950:			g_editingField = qfalse;
ADDRGP4 g_editingField
CNSTI4 0
ASGNI4
line 2951
;2951:			g_editItem = NULL;
ADDRGP4 g_editItem
CNSTP4 0
ASGNP4
line 2952
;2952:			inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2953
;2953:			return;
ADDRGP4 $1460
JUMPV
LABELV $1467
line 2954
;2954:		} else if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 178
EQI4 $1472
ADDRLP4 24
INDIRI4
CNSTI4 179
EQI4 $1472
ADDRLP4 24
INDIRI4
CNSTI4 180
NEI4 $1469
LABELV $1472
line 2955
;2955:			g_editingField = qfalse;
ADDRGP4 g_editingField
CNSTI4 0
ASGNI4
line 2956
;2956:			g_editItem = NULL;
ADDRGP4 g_editItem
CNSTP4 0
ASGNP4
line 2957
;2957:			Display_MouseMove(NULL, DC->cursorx, DC->cursory);
CNSTP4 0
ARGP4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 2958
;2958:		} else if (key == K_TAB || key == K_UPARROW || key == K_DOWNARROW) {
ADDRGP4 $1470
JUMPV
LABELV $1469
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 9
EQI4 $1476
ADDRLP4 28
INDIRI4
CNSTI4 132
EQI4 $1476
ADDRLP4 28
INDIRI4
CNSTI4 133
NEI4 $1473
LABELV $1476
line 2959
;2959:			return;
ADDRGP4 $1460
JUMPV
LABELV $1473
LABELV $1470
line 2961
;2960:		}
;2961:	}
LABELV $1465
line 2963
;2962:
;2963:	if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1477
line 2964
;2964:		inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2965
;2965:		return;
ADDRGP4 $1460
JUMPV
LABELV $1477
line 2969
;2966:	}
;2967:
;2968:		// see if the mouse is within the window bounds and if so is this a mouse click
;2969:	if (down && !(menu->window.flags & WINDOW_POPUP) && !Rect_ContainsPoint(&menu->window.rect, DC->cursorx, DC->cursory)) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $1479
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $1479
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1479
line 2971
;2970:		static qboolean inHandleKey = qfalse;
;2971:		if (!inHandleKey && key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3) {
ADDRGP4 $1481
INDIRI4
CNSTI4 0
NEI4 $1485
ADDRFP4 4
INDIRI4
CNSTI4 178
EQI4 $1486
LABELV $1485
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 179
EQI4 $1486
ADDRLP4 36
INDIRI4
CNSTI4 180
NEI4 $1482
LABELV $1486
line 2972
;2972:			inHandleKey = qtrue;
ADDRGP4 $1481
CNSTI4 1
ASGNI4
line 2973
;2973:			Menus_HandleOOBClick(menu, key, down);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Menus_HandleOOBClick
CALLV
pop
line 2974
;2974:			inHandleKey = qfalse;
ADDRGP4 $1481
CNSTI4 0
ASGNI4
line 2975
;2975:			inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2976
;2976:			return;
ADDRGP4 $1460
JUMPV
LABELV $1482
line 2978
;2977:		}
;2978:	}
LABELV $1479
line 2981
;2979:
;2980:	// get the item with focus
;2981:	for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1490
JUMPV
LABELV $1487
line 2982
;2982:		if (menu->items[i]->window.flags & WINDOW_HASFOCUS) {
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1491
line 2983
;2983:			item = menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
line 2984
;2984:		}
LABELV $1491
line 2985
;2985:	}
LABELV $1488
line 2981
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1490
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $1487
line 2987
;2986:
;2987:	if (item != NULL) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1493
line 2988
;2988:		if (Item_HandleKey(item, key, down)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 Item_HandleKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1495
line 2989
;2989:			Item_Action(item);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Item_Action
CALLV
pop
line 2990
;2990:			inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2991
;2991:			return;
ADDRGP4 $1460
JUMPV
LABELV $1495
line 2993
;2992:		}
;2993:	}
LABELV $1493
line 2995
;2994:
;2995:	if (!down) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $1497
line 2996
;2996:		inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2997
;2997:		return;
ADDRGP4 $1460
JUMPV
LABELV $1497
line 3001
;2998:	}
;2999:
;3000:	// default handling
;3001:	switch ( key ) {
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 155
EQI4 $1501
ADDRLP4 40
CNSTI4 156
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $1505
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
GTI4 $1537
LABELV $1536
ADDRLP4 44
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 48
CNSTI4 13
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $1530
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
GTI4 $1539
LABELV $1538
ADDRFP4 4
INDIRI4
CNSTI4 9
EQI4 $1514
ADDRGP4 $1499
JUMPV
LABELV $1539
ADDRLP4 52
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 56
CNSTI4 27
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $1510
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $1499
LABELV $1540
ADDRLP4 60
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 132
EQI4 $1509
ADDRLP4 60
INDIRI4
CNSTI4 133
EQI4 $1514
ADDRGP4 $1499
JUMPV
LABELV $1537
ADDRLP4 64
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 167
EQI4 $1514
ADDRLP4 68
CNSTI4 169
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $1530
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
GTI4 $1542
LABELV $1541
ADDRFP4 4
INDIRI4
CNSTI4 161
EQI4 $1509
ADDRGP4 $1499
JUMPV
LABELV $1542
ADDRLP4 72
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 178
LTI4 $1499
ADDRLP4 72
INDIRI4
CNSTI4 188
GTI4 $1543
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1544-712
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1544
address $1515
address $1515
address $1499
address $1499
address $1499
address $1499
address $1499
address $1500
address $1500
address $1500
address $1500
code
LABELV $1543
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 217
LTI4 $1499
ADDRLP4 76
INDIRI4
CNSTI4 232
GTI4 $1499
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1546-868
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1546
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
address $1500
code
LABELV $1501
line 3004
;3002:
;3003:		case K_F11:
;3004:			if (DC->getCVarValue("developer")) {
ADDRGP4 $1504
ARGP4
ADDRLP4 80
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 80
INDIRF4
CNSTF4 0
EQF4 $1500
line 3005
;3005:				debugMode ^= 1;
ADDRLP4 84
ADDRGP4 debugMode
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 3006
;3006:			}
line 3007
;3007:			break;
ADDRGP4 $1500
JUMPV
LABELV $1505
line 3010
;3008:
;3009:		case K_F12:
;3010:			if (DC->getCVarValue("developer")) {
ADDRGP4 $1504
ARGP4
ADDRLP4 84
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 84
INDIRF4
CNSTF4 0
EQF4 $1500
line 3011
;3011:				DC->executeText(EXEC_APPEND, "screenshot\n");
CNSTI4 2
ARGI4
ADDRGP4 $1508
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 152
ADDP4
INDIRP4
CALLV
pop
line 3012
;3012:			}
line 3013
;3013:			break;
ADDRGP4 $1500
JUMPV
LABELV $1509
line 3016
;3014:		case K_KP_UPARROW:
;3015:		case K_UPARROW:
;3016:			Menu_SetPrevCursorItem(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_SetPrevCursorItem
CALLP4
pop
line 3017
;3017:			break;
ADDRGP4 $1500
JUMPV
LABELV $1510
line 3020
;3018:
;3019:		case K_ESCAPE:
;3020:			if (!g_waitingForKey && menu->onESC) {
ADDRGP4 g_waitingForKey
INDIRI4
CNSTI4 0
NEI4 $1500
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1500
line 3022
;3021:				itemDef_t it;
;3022:		    it.parent = menu;
ADDRLP4 88+248
ADDRFP4 0
INDIRP4
ASGNP4
line 3023
;3023:		    Item_RunScript(&it, menu->onESC);
ADDRLP4 88
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_RunScript
CALLV
pop
line 3024
;3024:			}
line 3025
;3025:			break;
ADDRGP4 $1500
JUMPV
LABELV $1514
line 3029
;3026:		case K_TAB:
;3027:		case K_KP_DOWNARROW:
;3028:		case K_DOWNARROW:
;3029:			Menu_SetNextCursorItem(menu);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_SetNextCursorItem
CALLP4
pop
line 3030
;3030:			break;
ADDRGP4 $1500
JUMPV
LABELV $1515
line 3034
;3031:
;3032:		case K_MOUSE1:
;3033:		case K_MOUSE2:
;3034:			if (item) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1500
line 3035
;3035:				if (item->type == ITEM_TYPE_TEXT) {
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1518
line 3036
;3036:					if (Rect_ContainsPoint(Item_CorrectedTextRect(item), DC->cursorx, DC->cursory)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 Item_CorrectedTextRect
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1500
line 3037
;3037:						Item_Action(item);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Item_Action
CALLV
pop
line 3038
;3038:					}
line 3039
;3039:				} else if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD) {
ADDRGP4 $1500
JUMPV
LABELV $1518
ADDRLP4 88
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 4
EQI4 $1524
ADDRLP4 88
INDIRI4
CNSTI4 9
NEI4 $1522
LABELV $1524
line 3040
;3040:					if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1500
line 3041
;3041:						item->cursorPos = 0;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 3042
;3042:						g_editingField = qtrue;
ADDRGP4 g_editingField
CNSTI4 1
ASGNI4
line 3043
;3043:						g_editItem = item;
ADDRGP4 g_editItem
ADDRLP4 4
INDIRP4
ASGNP4
line 3044
;3044:						DC->setOverstrikeMode(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 108
ADDP4
INDIRP4
CALLV
pop
line 3045
;3045:					}
line 3046
;3046:				} else {
ADDRGP4 $1500
JUMPV
LABELV $1522
line 3047
;3047:					if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1500
line 3048
;3048:						Item_Action(item);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Item_Action
CALLV
pop
line 3049
;3049:					}
line 3050
;3050:				}
line 3051
;3051:			}
line 3052
;3052:			break;
ADDRGP4 $1500
JUMPV
line 3074
;3053:
;3054:		case K_JOY1:
;3055:		case K_JOY2:
;3056:		case K_JOY3:
;3057:		case K_JOY4:
;3058:		case K_AUX1:
;3059:		case K_AUX2:
;3060:		case K_AUX3:
;3061:		case K_AUX4:
;3062:		case K_AUX5:
;3063:		case K_AUX6:
;3064:		case K_AUX7:
;3065:		case K_AUX8:
;3066:		case K_AUX9:
;3067:		case K_AUX10:
;3068:		case K_AUX11:
;3069:		case K_AUX12:
;3070:		case K_AUX13:
;3071:		case K_AUX14:
;3072:		case K_AUX15:
;3073:		case K_AUX16:
;3074:			break;
LABELV $1530
line 3077
;3075:		case K_KP_ENTER:
;3076:		case K_ENTER:
;3077:			if (item) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1500
line 3078
;3078:				if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD) {
ADDRLP4 88
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 4
EQI4 $1535
ADDRLP4 88
INDIRI4
CNSTI4 9
NEI4 $1533
LABELV $1535
line 3079
;3079:					item->cursorPos = 0;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 3080
;3080:					g_editingField = qtrue;
ADDRGP4 g_editingField
CNSTI4 1
ASGNI4
line 3081
;3081:					g_editItem = item;
ADDRGP4 g_editItem
ADDRLP4 4
INDIRP4
ASGNP4
line 3082
;3082:					DC->setOverstrikeMode(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 108
ADDP4
INDIRP4
CALLV
pop
line 3083
;3083:				} else {
ADDRGP4 $1500
JUMPV
LABELV $1533
line 3084
;3084:						Item_Action(item);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Item_Action
CALLV
pop
line 3085
;3085:				}
line 3086
;3086:			}
line 3087
;3087:			break;
LABELV $1499
LABELV $1500
line 3089
;3088:	}
;3089:	inHandler = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3090
;3090:}
LABELV $1460
endproc Menu_HandleKey 656 12
export ToWindowCoords
proc ToWindowCoords 8 0
line 3092
;3091:
;3092:void ToWindowCoords(float *x, float *y, windowDef_t *window) {
line 3093
;3093:	if (window->border != 0) {
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1549
line 3094
;3094:		*x += window->borderSize;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3095
;3095:		*y += window->borderSize;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3096
;3096:	} 
LABELV $1549
line 3097
;3097:	*x += window->rect.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 3098
;3098:	*y += window->rect.y;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3099
;3099:}
LABELV $1548
endproc ToWindowCoords 8 0
export Rect_ToWindowCoords
proc Rect_ToWindowCoords 4 12
line 3101
;3100:
;3101:void Rect_ToWindowCoords(rectDef_t *rect, windowDef_t *window) {
line 3102
;3102:	ToWindowCoords(&rect->x, &rect->y, window);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ToWindowCoords
CALLV
pop
line 3103
;3103:}
LABELV $1551
endproc Rect_ToWindowCoords 4 12
export Item_SetTextExtents
proc Item_SetTextExtents 296 12
line 3105
;3104:
;3105:void Item_SetTextExtents(itemDef_t *item, int *width, int *height, const char *text) {
line 3106
;3106:	const char *textPtr = (text) ? text : item->text;
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1554
ADDRLP4 4
ADDRFP4 12
INDIRP4
ASGNP4
ADDRGP4 $1555
JUMPV
LABELV $1554
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
ASGNP4
LABELV $1555
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 3108
;3107:
;3108:	if (textPtr == NULL ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1556
line 3109
;3109:		return;
ADDRGP4 $1552
JUMPV
LABELV $1556
line 3112
;3110:	}
;3111:
;3112:	*width = item->textRect.w;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 3113
;3113:	*height = item->textRect.h;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 3116
;3114:
;3115:	// keeps us from computing the widths and heights more than once
;3116:	if (*width == 0 || (item->type == ITEM_TYPE_OWNERDRAW && item->textalignment == ITEM_ALIGN_CENTER)) {
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1560
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1558
ADDRLP4 8
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1558
LABELV $1560
line 3117
;3117:		int originalWidth = DC->textWidth(item->text, item->textscale, 0);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 3119
;3118:
;3119:		if (item->type == ITEM_TYPE_OWNERDRAW && (item->textalignment == ITEM_ALIGN_CENTER || item->textalignment == ITEM_ALIGN_RIGHT)) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1561
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $1563
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $1561
LABELV $1563
line 3120
;3120:			originalWidth += DC->ownerDrawWidth(item->window.ownerDraw, item->textscale);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 DC
INDIRP4
CNSTI4 168
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
ASGNI4
line 3121
;3121:		} else if (item->type == ITEM_TYPE_EDITFIELD && item->textalignment == ITEM_ALIGN_CENTER && item->cvar) {
ADDRGP4 $1562
JUMPV
LABELV $1561
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1564
ADDRLP4 32
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1564
ADDRLP4 32
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1564
line 3123
;3122:			char buff[256];
;3123:			DC->getCVarString(item->cvar, buff, 256);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 3124
;3124:			originalWidth += DC->textWidth(buff, item->textscale, 0);
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 292
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 292
INDIRI4
ADDI4
ASGNI4
line 3125
;3125:		}
LABELV $1564
LABELV $1562
line 3127
;3126:
;3127:		*width = DC->textWidth(textPtr, item->textscale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ASGNI4
line 3128
;3128:		*height = DC->textHeight(textPtr, item->textscale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 DC
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 40
INDIRI4
ASGNI4
line 3129
;3129:		item->textRect.w = *width;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 3130
;3130:		item->textRect.h = *height;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 3131
;3131:		item->textRect.x = item->textalignx;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ASGNF4
line 3132
;3132:		item->textRect.y = item->textaligny;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
line 3133
;3133:		if (item->textalignment == ITEM_ALIGN_RIGHT) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1566
line 3134
;3134:			item->textRect.x = item->textalignx - originalWidth;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 3135
;3135:		} else if (item->textalignment == ITEM_ALIGN_CENTER) {
ADDRGP4 $1567
JUMPV
LABELV $1566
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1568
line 3136
;3136:			item->textRect.x = item->textalignx - originalWidth / 2;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ASGNF4
line 3137
;3137:		}
LABELV $1568
LABELV $1567
line 3139
;3138:
;3139:		ToWindowCoords(&item->textRect.x, &item->textRect.y, &item->window);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 196
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 ToWindowCoords
CALLV
pop
line 3140
;3140:	}
LABELV $1558
line 3141
;3141:}
LABELV $1552
endproc Item_SetTextExtents 296 12
export Item_TextColor
proc Item_TextColor 60 28
line 3143
;3142:
;3143:void Item_TextColor(itemDef_t *item, vec4_t *newColor) {
line 3145
;3144:	vec4_t lowLight;
;3145:	menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 3147
;3146:
;3147:	Fade(&item->window.flags, &item->window.foreColor[3], parent->fadeClamp, &item->window.nextTime, parent->fadeCycle, qtrue, parent->fadeAmount);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 140
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ARGF4
ADDRGP4 Fade
CALLV
pop
line 3149
;3148:
;3149:	if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1571
line 3150
;3150:		lowLight[0] = 0.8 * parent->focusColor[0]; 
ADDRLP4 4
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRF4
MULF4
ASGNF4
line 3151
;3151:		lowLight[1] = 0.8 * parent->focusColor[1]; 
ADDRLP4 4+4
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
MULF4
ASGNF4
line 3152
;3152:		lowLight[2] = 0.8 * parent->focusColor[2]; 
ADDRLP4 4+8
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRF4
MULF4
ASGNF4
line 3153
;3153:		lowLight[3] = 0.8 * parent->focusColor[3]; 
ADDRLP4 4+12
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRF4
MULF4
ASGNF4
line 3154
;3154:		LerpColor(parent->focusColor,lowLight,*newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTF4 1056964608
ADDRLP4 28
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 3155
;3155:	} else if (item->textStyle == ITEM_TEXTSTYLE_BLINK && !((DC->realTime/BLINK_DIVISOR) & 1)) {
ADDRGP4 $1572
JUMPV
LABELV $1571
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1576
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 200
DIVI4
ADDRLP4 28
INDIRI4
BANDI4
CNSTI4 0
NEI4 $1576
line 3156
;3156:		lowLight[0] = 0.8 * item->window.foreColor[0]; 
ADDRLP4 4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
MULF4
ASGNF4
line 3157
;3157:		lowLight[1] = 0.8 * item->window.foreColor[1]; 
ADDRLP4 4+4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
MULF4
ASGNF4
line 3158
;3158:		lowLight[2] = 0.8 * item->window.foreColor[2]; 
ADDRLP4 4+8
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
MULF4
ASGNF4
line 3159
;3159:		lowLight[3] = 0.8 * item->window.foreColor[3]; 
ADDRLP4 4+12
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
MULF4
ASGNF4
line 3160
;3160:		LerpColor(item->window.foreColor,lowLight,*newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTF4 1056964608
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 3161
;3161:	} else {
ADDRGP4 $1577
JUMPV
LABELV $1576
line 3162
;3162:		memcpy(newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3164
;3163:		// items can be enabled and disabled based on cvars
;3164:	}
LABELV $1577
LABELV $1572
line 3166
;3165:
;3166:	if (item->enableCvar && *item->enableCvar && item->cvarTest && *item->cvarTest) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 292
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1581
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
EQI4 $1581
ADDRLP4 48
ADDRLP4 32
INDIRP4
CNSTI4 288
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1581
ADDRLP4 48
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
EQI4 $1581
line 3167
;3167:		if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1583
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1583
line 3168
;3168:			memcpy(newColor, &parent->disableColor, sizeof(vec4_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3169
;3169:		}
LABELV $1583
line 3170
;3170:	}
LABELV $1581
line 3171
;3171:}
LABELV $1570
endproc Item_TextColor 60 28
export Item_Text_AutoWrapped_Paint
proc Item_Text_AutoWrapped_Paint 2128 32
line 3173
;3172:
;3173:void Item_Text_AutoWrapped_Paint(itemDef_t *item) {
line 3181
;3174:	char text[1024];
;3175:	const char *p, *textPtr, *newLinePtr;
;3176:	char buff[1024];
;3177:	int width, height, len, textWidth, newLine, newLineWidth;
;3178:	float y;
;3179:	vec4_t color;
;3180:
;3181:	textWidth = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 3182
;3182:	newLinePtr = NULL;
ADDRLP4 1044
CNSTP4 0
ASGNP4
line 3184
;3183:
;3184:	if (item->text == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1586
line 3185
;3185:		if (item->cvar == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1588
line 3186
;3186:			return;
ADDRGP4 $1585
JUMPV
LABELV $1588
line 3188
;3187:		}
;3188:		else {
line 3189
;3189:			DC->getCVarString(item->cvar, text, sizeof(text));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 3190
;3190:			textPtr = text;
ADDRLP4 1056
ADDRLP4 1080
ASGNP4
line 3191
;3191:		}
line 3192
;3192:	}
ADDRGP4 $1587
JUMPV
LABELV $1586
line 3193
;3193:	else {
line 3194
;3194:		textPtr = item->text;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
ASGNP4
line 3195
;3195:	}
LABELV $1587
line 3196
;3196:	if (*textPtr == '\0') {
ADDRLP4 1056
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1590
line 3197
;3197:		return;
ADDRGP4 $1585
JUMPV
LABELV $1590
line 3199
;3198:	}
;3199:	Item_TextColor(item, &color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1060
ARGP4
ADDRGP4 Item_TextColor
CALLV
pop
line 3200
;3200:	Item_SetTextExtents(item, &width, &height, textPtr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 Item_SetTextExtents
CALLV
pop
line 3202
;3201:
;3202:	y = item->textaligny;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
line 3203
;3203:	len = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 3204
;3204:	buff[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 3205
;3205:	newLine = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 3206
;3206:	newLineWidth = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 3207
;3207:	p = textPtr;
ADDRLP4 0
ADDRLP4 1056
INDIRP4
ASGNP4
ADDRGP4 $1593
JUMPV
LABELV $1592
line 3208
;3208:	while (p) {
line 3209
;3209:		if (*p == ' ' || *p == '\t' || *p == '\n' || *p == '\0') {
ADDRLP4 2104
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 32
EQI4 $1599
ADDRLP4 2104
INDIRI4
CNSTI4 9
EQI4 $1599
ADDRLP4 2104
INDIRI4
CNSTI4 10
EQI4 $1599
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $1595
LABELV $1599
line 3210
;3210:			newLine = len;
ADDRLP4 1036
ADDRLP4 1028
INDIRI4
ASGNI4
line 3211
;3211:			newLinePtr = p+1;
ADDRLP4 1044
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3212
;3212:			newLineWidth = textWidth;
ADDRLP4 1040
ADDRLP4 1032
INDIRI4
ASGNI4
line 3213
;3213:		}
LABELV $1595
line 3214
;3214:		textWidth = DC->textWidth(buff, item->textscale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2108
ADDRGP4 DC
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 2108
INDIRI4
ASGNI4
line 3215
;3215:		if ( (newLine && textWidth > item->window.rect.w) || *p == '\n' || *p == '\0') {
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $1603
ADDRLP4 1032
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GTF4 $1604
LABELV $1603
ADDRLP4 2112
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 10
EQI4 $1604
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $1600
LABELV $1604
line 3216
;3216:			if (len) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $1605
line 3217
;3217:				if (item->textalignment == ITEM_ALIGN_LEFT) {
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1607
line 3218
;3218:					item->textRect.x = item->textalignx;
ADDRLP4 2116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2116
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 2116
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ASGNF4
line 3219
;3219:				} else if (item->textalignment == ITEM_ALIGN_RIGHT) {
ADDRGP4 $1608
JUMPV
LABELV $1607
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1609
line 3220
;3220:					item->textRect.x = item->textalignx - newLineWidth;
ADDRLP4 2116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2116
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 2116
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ADDRLP4 1040
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 3221
;3221:				} else if (item->textalignment == ITEM_ALIGN_CENTER) {
ADDRGP4 $1610
JUMPV
LABELV $1609
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1611
line 3222
;3222:					item->textRect.x = item->textalignx - newLineWidth / 2;
ADDRLP4 2116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2116
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 2116
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ADDRLP4 1040
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ASGNF4
line 3223
;3223:				}
LABELV $1611
LABELV $1610
LABELV $1608
line 3224
;3224:				item->textRect.y = y;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 1048
INDIRF4
ASGNF4
line 3225
;3225:				ToWindowCoords(&item->textRect.x, &item->textRect.y, &item->window);
ADDRLP4 2116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2116
INDIRP4
CNSTI4 196
ADDP4
ARGP4
ADDRLP4 2116
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 2116
INDIRP4
ARGP4
ADDRGP4 ToWindowCoords
CALLV
pop
line 3227
;3226:				//
;3227:				buff[newLine] = '\0';
ADDRLP4 1036
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 3228
;3228:				DC->drawText(item->textRect.x, item->textRect.y, item->textscale, color, buff, 0, 0, item->textStyle);
ADDRLP4 2120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2120
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ARGF4
ADDRLP4 2120
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 2120
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 1060
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2120
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3229
;3229:			}
LABELV $1605
line 3230
;3230:			if (*p == '\0') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1613
line 3231
;3231:				break;
ADDRGP4 $1594
JUMPV
LABELV $1613
line 3234
;3232:			}
;3233:			//
;3234:			y += height + 5;
ADDRLP4 1048
ADDRLP4 1048
INDIRF4
ADDRLP4 1052
INDIRI4
CNSTI4 5
ADDI4
CVIF4 4
ADDF4
ASGNF4
line 3235
;3235:			p = newLinePtr;
ADDRLP4 0
ADDRLP4 1044
INDIRP4
ASGNP4
line 3236
;3236:			len = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 3237
;3237:			newLine = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 3238
;3238:			newLineWidth = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 3239
;3239:			continue;
ADDRGP4 $1593
JUMPV
LABELV $1600
line 3241
;3240:		}
;3241:		buff[len++] = *p++;
ADDRLP4 2116
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 2124
CNSTI4 1
ASGNI4
ADDRLP4 1028
ADDRLP4 2116
INDIRI4
ADDRLP4 2124
INDIRI4
ADDI4
ASGNI4
ADDRLP4 2120
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 2120
INDIRP4
ADDRLP4 2124
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2116
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 2120
INDIRP4
INDIRI1
ASGNI1
line 3242
;3242:		buff[len] = '\0';
ADDRLP4 1028
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 3243
;3243:	}
LABELV $1593
line 3208
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1592
LABELV $1594
line 3244
;3244:}
LABELV $1585
endproc Item_Text_AutoWrapped_Paint 2128 32
export Item_Text_Wrapped_Paint
proc Item_Text_Wrapped_Paint 2112 32
line 3246
;3245:
;3246:void Item_Text_Wrapped_Paint(itemDef_t *item) {
line 3257
;3247:	char text[1024];
;3248:	const char *p, *start, *textPtr;
;3249:	char buff[1024];
;3250:	int width, height;
;3251:	float x, y;
;3252:	vec4_t color;
;3253:
;3254:	// now paint the text and/or any optional images
;3255:	// default to left
;3256:
;3257:	if (item->text == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1616
line 3258
;3258:		if (item->cvar == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1618
line 3259
;3259:			return;
ADDRGP4 $1615
JUMPV
LABELV $1618
line 3261
;3260:		}
;3261:		else {
line 3262
;3262:			DC->getCVarString(item->cvar, text, sizeof(text));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 1068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 3263
;3263:			textPtr = text;
ADDRLP4 1060
ADDRLP4 1068
ASGNP4
line 3264
;3264:		}
line 3265
;3265:	}
ADDRGP4 $1617
JUMPV
LABELV $1616
line 3266
;3266:	else {
line 3267
;3267:		textPtr = item->text;
ADDRLP4 1060
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
ASGNP4
line 3268
;3268:	}
LABELV $1617
line 3269
;3269:	if (*textPtr == '\0') {
ADDRLP4 1060
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1620
line 3270
;3270:		return;
ADDRGP4 $1615
JUMPV
LABELV $1620
line 3273
;3271:	}
;3272:
;3273:	Item_TextColor(item, &color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 Item_TextColor
CALLV
pop
line 3274
;3274:	Item_SetTextExtents(item, &width, &height, textPtr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ARGP4
ADDRLP4 1056
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 Item_SetTextExtents
CALLV
pop
line 3276
;3275:
;3276:	x = item->textRect.x;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ASGNF4
line 3277
;3277:	y = item->textRect.y;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ASGNF4
line 3278
;3278:	start = textPtr;
ADDRLP4 4
ADDRLP4 1060
INDIRP4
ASGNP4
line 3279
;3279:	p = strchr(textPtr, '\r');
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 2092
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2092
INDIRP4
ASGNP4
ADDRGP4 $1623
JUMPV
LABELV $1622
line 3280
;3280:	while (p && *p) {
line 3281
;3281:		strncpy(buff, start, p-start+1);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 3282
;3282:		buff[p-start] = '\0';
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 3283
;3283:		DC->drawText(x, y, item->textscale, color, buff, 0, 0, item->textStyle);
ADDRLP4 1036
INDIRF4
ARGF4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRLP4 2100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2100
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 1040
ARGP4
ADDRLP4 8
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2100
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3284
;3284:		y += height + 5;
ADDRLP4 1032
ADDRLP4 1032
INDIRF4
ADDRLP4 1056
INDIRI4
CNSTI4 5
ADDI4
CVIF4 4
ADDF4
ASGNF4
line 3285
;3285:		start += p - start + 1;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 3286
;3286:		p = strchr(p+1, '\r');
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 2108
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2108
INDIRP4
ASGNP4
line 3287
;3287:	}
LABELV $1623
line 3280
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1625
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1622
LABELV $1625
line 3288
;3288:	DC->drawText(x, y, item->textscale, color, start, 0, 0, item->textStyle);
ADDRLP4 1036
INDIRF4
ARGF4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRLP4 2100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2100
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 1040
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 2100
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3289
;3289:}
LABELV $1615
endproc Item_Text_Wrapped_Paint 2112 32
export Item_Text_Paint
proc Item_Text_Paint 1056 32
line 3291
;3290:
;3291:void Item_Text_Paint(itemDef_t *item) {
line 3297
;3292:	char text[1024];
;3293:	const char *textPtr;
;3294:	int height, width;
;3295:	vec4_t color;
;3296:
;3297:	if (item->window.flags & WINDOW_WRAPPED) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $1627
line 3298
;3298:		Item_Text_Wrapped_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Wrapped_Paint
CALLV
pop
line 3299
;3299:		return;
ADDRGP4 $1626
JUMPV
LABELV $1627
line 3301
;3300:	}
;3301:	if (item->window.flags & WINDOW_AUTOWRAPPED) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $1629
line 3302
;3302:		Item_Text_AutoWrapped_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_AutoWrapped_Paint
CALLV
pop
line 3303
;3303:		return;
ADDRGP4 $1626
JUMPV
LABELV $1629
line 3306
;3304:	}
;3305:
;3306:	if (item->text == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1631
line 3307
;3307:		if (item->cvar == NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1633
line 3308
;3308:			return;
ADDRGP4 $1626
JUMPV
LABELV $1633
line 3310
;3309:		}
;3310:		else {
line 3311
;3311:			DC->getCVarString(item->cvar, text, sizeof(text));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 3312
;3312:			textPtr = text;
ADDRLP4 0
ADDRLP4 28
ASGNP4
line 3313
;3313:		}
line 3314
;3314:	}
ADDRGP4 $1632
JUMPV
LABELV $1631
line 3315
;3315:	else {
line 3316
;3316:		textPtr = item->text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
ASGNP4
line 3317
;3317:	}
LABELV $1632
line 3320
;3318:
;3319:	// this needs to go here as it sets extents for cvar types as well
;3320:	Item_SetTextExtents(item, &width, &height, textPtr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Item_SetTextExtents
CALLV
pop
line 3322
;3321:
;3322:	if (*textPtr == '\0') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1635
line 3323
;3323:		return;
ADDRGP4 $1626
JUMPV
LABELV $1635
line 3327
;3324:	}
;3325:
;3326:
;3327:	Item_TextColor(item, &color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Item_TextColor
CALLV
pop
line 3358
;3328:
;3329:	//FIXME: this is a fucking mess
;3330:/*
;3331:	adjust = 0;
;3332:	if (item->textStyle == ITEM_TEXTSTYLE_OUTLINED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
;3333:		adjust = 0.5;
;3334:	}
;3335:
;3336:	if (item->textStyle == ITEM_TEXTSTYLE_SHADOWED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
;3337:		Fade(&item->window.flags, &DC->Assets.shadowColor[3], DC->Assets.fadeClamp, &item->window.nextTime, DC->Assets.fadeCycle, qfalse);
;3338:		DC->drawText(item->textRect.x + DC->Assets.shadowX, item->textRect.y + DC->Assets.shadowY, item->textscale, DC->Assets.shadowColor, textPtr, adjust);
;3339:	}
;3340:*/
;3341:
;3342:
;3343://	if (item->textStyle == ITEM_TEXTSTYLE_OUTLINED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
;3344://		Fade(&item->window.flags, &item->window.outlineColor[3], DC->Assets.fadeClamp, &item->window.nextTime, DC->Assets.fadeCycle, qfalse);
;3345://		/*
;3346://		Text_Paint(item->textRect.x-1, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
;3347://		Text_Paint(item->textRect.x, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
;3348://		Text_Paint(item->textRect.x+1, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
;3349://		Text_Paint(item->textRect.x-1, item->textRect.y, item->textscale, item->window.foreColor, textPtr, adjust);
;3350://		Text_Paint(item->textRect.x+1, item->textRect.y, item->textscale, item->window.foreColor, textPtr, adjust);
;3351://		Text_Paint(item->textRect.x-1, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
;3352://		Text_Paint(item->textRect.x, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
;3353://		Text_Paint(item->textRect.x+1, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
;3354://		*/
;3355://		DC->drawText(item->textRect.x - 1, item->textRect.y + 1, item->textscale * 1.02, item->window.outlineColor, textPtr, adjust);
;3356://	}
;3357:
;3358:	DC->drawText(item->textRect.x, item->textRect.y, item->textscale, color, textPtr, 0, 0, item->textStyle);
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ARGF4
ADDRLP4 1052
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 1052
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1052
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3359
;3359:}
LABELV $1626
endproc Item_Text_Paint 1056 32
export Item_TextField_Paint
proc Item_TextField_Paint 1104 36
line 3366
;3360:
;3361:
;3362:
;3363://float			trap_Cvar_VariableValue( const char *var_name );
;3364://void			trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize );
;3365:
;3366:void Item_TextField_Paint(itemDef_t *item) {
line 3370
;3367:	char buff[1024];
;3368:	vec4_t newColor, lowLight;
;3369:	int offset;
;3370:	menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 3371
;3371:	editFieldDef_t *editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 3373
;3372:
;3373:	Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3375
;3374:
;3375:	buff[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 3377
;3376:
;3377:	if (item->cvar) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1638
line 3378
;3378:		DC->getCVarString(item->cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CALLV
pop
line 3379
;3379:	} 
LABELV $1638
line 3381
;3380:
;3381:	parent = (menuDef_t*)item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 3383
;3382:
;3383:	if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1640
line 3384
;3384:		lowLight[0] = 0.8 * parent->focusColor[0]; 
ADDRLP4 1032
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRF4
MULF4
ASGNF4
line 3385
;3385:		lowLight[1] = 0.8 * parent->focusColor[1]; 
ADDRLP4 1032+4
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
MULF4
ASGNF4
line 3386
;3386:		lowLight[2] = 0.8 * parent->focusColor[2]; 
ADDRLP4 1032+8
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRF4
MULF4
ASGNF4
line 3387
;3387:		lowLight[3] = 0.8 * parent->focusColor[3]; 
ADDRLP4 1032+12
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRF4
MULF4
ASGNF4
line 3388
;3388:		LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 1068
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1048
ARGP4
CNSTF4 1056964608
ADDRLP4 1068
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 3389
;3389:	} else {
ADDRGP4 $1641
JUMPV
LABELV $1640
line 3390
;3390:		memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 1048
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3391
;3391:	}
LABELV $1641
line 3393
;3392:
;3393:	offset = (item->text && *item->text) ? 8 : 0;
ADDRLP4 1072
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1646
ADDRLP4 1072
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1646
ADDRLP4 1068
CNSTI4 8
ASGNI4
ADDRGP4 $1647
JUMPV
LABELV $1646
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $1647
ADDRLP4 1064
ADDRLP4 1068
INDIRI4
ASGNI4
line 3394
;3394:	if (item->window.flags & WINDOW_HASFOCUS && g_editingField) {
ADDRLP4 1076
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 1076
INDIRI4
EQI4 $1648
ADDRGP4 g_editingField
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $1648
line 3395
;3395:		char cursor = DC->getOverstrikeMode() ? '_' : '|';
ADDRLP4 1088
ADDRGP4 DC
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $1651
ADDRLP4 1084
CNSTI4 95
ASGNI4
ADDRGP4 $1652
JUMPV
LABELV $1651
ADDRLP4 1084
CNSTI4 124
ASGNI4
LABELV $1652
ADDRLP4 1080
ADDRLP4 1084
INDIRI4
CVII1 4
ASGNI1
line 3396
;3396:		DC->drawTextWithCursor(item->textRect.x + item->textRect.w + offset, item->textRect.y, item->textscale, newColor, buff + editPtr->paintOffset, item->cursorPos - editPtr->paintOffset , cursor, editPtr->maxPaintChars, item->textStyle);
ADDRLP4 1092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 1092
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
ADDRLP4 1064
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 1092
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 1092
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
ARGP4
ADDRLP4 1100
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
ADDRLP4 8
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ADDRLP4 1100
INDIRI4
SUBI4
ARGI4
ADDRLP4 1080
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CALLV
pop
line 3397
;3397:	} else {
ADDRGP4 $1649
JUMPV
LABELV $1648
line 3398
;3398:		DC->drawText(item->textRect.x + item->textRect.w + offset, item->textRect.y, item->textscale, newColor, buff + editPtr->paintOffset, 0, editPtr->maxPaintChars, item->textStyle);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 1080
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
ADDRLP4 1064
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 1080
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 1080
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 8
ADDP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3399
;3399:	}
LABELV $1649
line 3401
;3400:
;3401:}
LABELV $1637
endproc Item_TextField_Paint 1104 36
export Item_YesNo_Paint
proc Item_YesNo_Paint 56 32
line 3403
;3402:
;3403:void Item_YesNo_Paint(itemDef_t *item) {
line 3406
;3404:	vec4_t newColor, lowLight;
;3405:	float value;
;3406:	menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 3408
;3407:
;3408:	value = (item->cvar) ? DC->getCVarValue(item->cvar) : 0;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1655
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ASGNF4
ADDRGP4 $1656
JUMPV
LABELV $1655
ADDRLP4 40
CNSTF4 0
ASGNF4
LABELV $1656
ADDRLP4 36
ADDRLP4 40
INDIRF4
ASGNF4
line 3410
;3409:
;3410:	if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1657
line 3411
;3411:		lowLight[0] = 0.8 * parent->focusColor[0]; 
ADDRLP4 4
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRF4
MULF4
ASGNF4
line 3412
;3412:		lowLight[1] = 0.8 * parent->focusColor[1]; 
ADDRLP4 4+4
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
MULF4
ASGNF4
line 3413
;3413:		lowLight[2] = 0.8 * parent->focusColor[2]; 
ADDRLP4 4+8
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRF4
MULF4
ASGNF4
line 3414
;3414:		lowLight[3] = 0.8 * parent->focusColor[3]; 
ADDRLP4 4+12
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRF4
MULF4
ASGNF4
line 3415
;3415:		LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 48
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 20
ARGP4
CNSTF4 1056964608
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 3416
;3416:	} else {
ADDRGP4 $1658
JUMPV
LABELV $1657
line 3417
;3417:		memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3418
;3418:	}
LABELV $1658
line 3420
;3419:
;3420:	if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1662
line 3421
;3421:		Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3422
;3422:		DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, (value != 0) ? "Yes" : "No", 0, 0, item->textStyle);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 36
INDIRF4
CNSTF4 0
EQF4 $1667
ADDRLP4 48
ADDRGP4 $1664
ASGNP4
ADDRGP4 $1668
JUMPV
LABELV $1667
ADDRLP4 48
ADDRGP4 $1665
ASGNP4
LABELV $1668
ADDRLP4 48
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3423
;3423:	} else {
ADDRGP4 $1663
JUMPV
LABELV $1662
line 3424
;3424:		DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, (value != 0) ? "Yes" : "No", 0, 0, item->textStyle);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 36
INDIRF4
CNSTF4 0
EQF4 $1670
ADDRLP4 48
ADDRGP4 $1664
ASGNP4
ADDRGP4 $1671
JUMPV
LABELV $1670
ADDRLP4 48
ADDRGP4 $1665
ASGNP4
LABELV $1671
ADDRLP4 48
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3425
;3425:	}
LABELV $1663
line 3426
;3426:}
LABELV $1653
endproc Item_YesNo_Paint 56 32
export Item_Multi_Paint
proc Item_Multi_Paint 48 32
line 3428
;3427:
;3428:void Item_Multi_Paint(itemDef_t *item) {
line 3430
;3429:	vec4_t newColor, lowLight;
;3430:	const char *text = "";
ADDRLP4 4
ADDRGP4 $107
ASGNP4
line 3431
;3431:	menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 3433
;3432:
;3433:	if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1673
line 3434
;3434:		lowLight[0] = 0.8 * parent->focusColor[0]; 
ADDRLP4 8
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRF4
MULF4
ASGNF4
line 3435
;3435:		lowLight[1] = 0.8 * parent->focusColor[1]; 
ADDRLP4 8+4
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
MULF4
ASGNF4
line 3436
;3436:		lowLight[2] = 0.8 * parent->focusColor[2]; 
ADDRLP4 8+8
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRF4
MULF4
ASGNF4
line 3437
;3437:		lowLight[3] = 0.8 * parent->focusColor[3]; 
ADDRLP4 8+12
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRF4
MULF4
ASGNF4
line 3438
;3438:		LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 40
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 3439
;3439:	} else {
ADDRGP4 $1674
JUMPV
LABELV $1673
line 3440
;3440:		memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3441
;3441:	}
LABELV $1674
line 3443
;3442:
;3443:	text = Item_Multi_Setting(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Item_Multi_Setting
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 40
INDIRP4
ASGNP4
line 3445
;3444:
;3445:	if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1678
line 3446
;3446:		Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3447
;3447:		DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, text, 0, 0, item->textStyle);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3448
;3448:	} else {
ADDRGP4 $1679
JUMPV
LABELV $1678
line 3449
;3449:		DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, text, 0, 0, item->textStyle);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3450
;3450:	}
LABELV $1679
line 3451
;3451:}
LABELV $1672
endproc Item_Multi_Paint 48 32
data
align 4
LABELV g_bindings
address $1682
byte 4 9
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1683
byte 4 13
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1684
byte 4 89
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1685
byte 4 132
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1686
byte 4 133
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1687
byte 4 97
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1688
byte 4 100
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1689
byte 4 179
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1690
byte 4 180
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1691
byte 4 134
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1692
byte 4 135
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1693
byte 4 110
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1694
byte 4 141
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1695
byte 4 140
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1696
byte 4 47
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1697
byte 4 114
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1698
byte 4 98
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1699
byte 4 118
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1700
byte 4 99
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1701
byte 4 138
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1702
byte 4 137
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1703
byte 4 136
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1704
byte 4 109
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1705
byte 4 110
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1706
byte 4 117
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1707
byte 4 106
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1708
byte 4 107
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1709
byte 4 49
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1710
byte 4 50
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1711
byte 4 51
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1712
byte 4 52
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1713
byte 4 53
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1714
byte 4 54
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1715
byte 4 55
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1716
byte 4 56
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1717
byte 4 57
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1718
byte 4 48
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1719
byte 4 178
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1720
byte 4 91
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1721
byte 4 93
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1722
byte 4 162
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1723
byte 4 168
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1724
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1725
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1726
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1727
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1728
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1729
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1730
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1731
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1732
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1733
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1734
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1735
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1736
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1737
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1738
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1739
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1740
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1741
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1742
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1743
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1744
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1745
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1746
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1747
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1748
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1749
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
address $1750
byte 4 -1
byte 4 -1
byte 4 -1
byte 4 -1
skip 4
lit
align 4
LABELV g_bindCount
byte 4 69
data
align 4
LABELV g_configcvars
address $1751
byte 4 0
byte 4 0
address $1752
byte 4 0
byte 4 0
address $1753
byte 4 0
byte 4 0
address $1754
byte 4 0
byte 4 0
address $1755
byte 4 0
byte 4 0
address $1756
byte 4 0
byte 4 0
address $1757
byte 4 0
byte 4 0
address $1758
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
code
proc Controls_GetKeyAssignment 276 12
line 3578
;3452:
;3453:
;3454:typedef struct {
;3455:	char	*command;
;3456:	int		id;
;3457:	int		defaultbind1;
;3458:	int		defaultbind2;
;3459:	int		bind1;
;3460:	int		bind2;
;3461:} bind_t;
;3462:
;3463:typedef struct
;3464:{
;3465:	char*	name;
;3466:	float	defaultvalue;
;3467:	float	value;	
;3468:} configcvar_t;
;3469:
;3470:
;3471:static bind_t g_bindings[] = 
;3472:{
;3473:	{"+scores",			 K_TAB,				-1,		-1, -1},
;3474:	{"+button2",		 K_ENTER,			-1,		-1, -1},
;3475:	{"+speed", 			 'Y',			-1,		-1,	-1},
;3476:	{"+forward", 		 K_UPARROW,		-1,		-1, -1},
;3477:	{"+back", 			 K_DOWNARROW,	-1,		-1, -1},
;3478:	{"+moveleft", 	 'a',					-1,		-1, -1},
;3479:	{"+moveright", 	 'd',					-1,		-1, -1},
;3480:	{"+moveup",			 K_MOUSE2,			-1,		-1, -1},
;3481:	{"+movedown",		 K_MOUSE3,					-1,		-1, -1},
;3482:	{"+left", 			 K_LEFTARROW,	-1,		-1, -1},
;3483:	{"+right", 			 K_RIGHTARROW,	-1,		-1, -1},
;3484:	{"+strafe", 		 'n',				-1,		-1, -1},
;3485:	{"+lookup", 		 K_PGDN,				-1,		-1, -1},
;3486:	{"+lookdown", 	 K_DEL,				-1,		-1, -1},
;3487:	{"+mlook", 			 '/',					-1,		-1, -1},
;3488:	{"+button6", 			 'r',						-1,		-1, -1},
;3489:	{"bandage", 		'b',						-1,		-1, -1},
;3490:	{"+button5", 		'v',						-1,		-1, -1},
;3491:	{"dropweapon", 		'c',						-1,		-1, -1},
;3492:	{"+button7", 		K_SHIFT,						-1,		-1, -1},
;3493:	{"+button8", 		K_CTRL,						-1,		-1, -1},
;3494:	{"+button9", 		K_ALT,						-1,		-1, -1},
;3495:	{"radiomenu",		'm'						,-1,	-1,	-1},
;3496:	{"gamemenu",		'n'						,-1,	-1,	-1},
;3497:	{"use",				'u'						,-1,	-1,	-1},
;3498:	
;3499:	{"missioninfo",				'j'						,-1,	-1,	-1},
;3500:	{"vqcmd",				'k'						,-1,	-1,	-1},
;3501:	
;3502:
;3503:	{"weapon 1",		 '1',					-1,		-1, -1},
;3504:	{"weapon 2",		 '2',					-1,		-1, -1},
;3505:	{"weapon 3",		 '3',					-1,		-1, -1},
;3506:	{"weapon 4",		 '4',					-1,		-1, -1},
;3507:	{"weapon 5",		 '5',					-1,		-1, -1},
;3508:	{"weapon 6",		 '6',					-1,		-1, -1}, 
;3509:	{"weapon 7",		 '7',					-1,		-1, -1}, 
;3510:	{"weapon 8",		 '8',					-1,		-1, -1}, 
;3511:	{"weapon 9",		 '9',					-1,		-1, -1}, 
;3512:	{"weapon 0",		 '0',					-1,		-1, -1}, 
;3513:	{"+attack", 		 K_MOUSE1,				-1,		-1, -1},
;3514:	{"weapprev",		 '[',					-1,		-1, -1},
;3515:	{"weapnext", 		 ']',					-1,		-1, -1},
;3516://	{"+button3", 		 K_MOUSE3,			-1,		-1, -1},
;3517:	{"scoresUp", K_KP_PGUP,			-1,		-1, -1},
;3518:	{"scoresDown", K_KP_PGDN,			-1,		-1, -1},
;3519:	{"messagemode",  -1,					-1,		-1, -1},
;3520:	{"messagemode2", -1,						-1,		-1, -1},
;3521:	{"messagemode3", -1,						-1,		-1, -1},
;3522:	{"messagemode4", -1,						-1,		-1, -1},
;3523:	
;3524:	// radio commands; personal
;3525:	
;3526:	{"radio affirmative", -1,						-1,		-1, -1},
;3527:	{"radio negative", -1,						-1,		-1, -1},
;3528:	{"radio followme", -1,						-1,		-1, -1},
;3529:	{"radio coverme", -1,						-1,		-1, -1},
;3530:	{"radio takefire", -1,						-1,		-1, -1},
;3531:	{"radio espotted", -1,						-1,		-1, -1},
;3532:	{"radio reportingin", -1,						-1,		-1, -1},
;3533:
;3534:// team commands
;3535:	{"radio gogo", -1,						-1,		-1, -1},
;3536:	{"radio regroup", -1,						-1,		-1, -1},
;3537:	{"radio check", -1,						-1,		-1, -1},
;3538:	{"radio takecover", -1,						-1,		-1, -1},
;3539:	{"radio retreat", -1,						-1,		-1, -1},
;3540:	{"radio reportin", -1,						-1,		-1, -1},
;3541:	{"radio guard", -1,						-1,		-1, -1},
;3542:	{"radio locknload", -1,						-1,		-1, -1},
;3543:
;3544:// objective commands
;3545:	{"radio objstatus", -1,						-1,		-1, -1},
;3546:	{"radio objsafe", -1,						-1,		-1, -1},
;3547:	{"radio objlost", -1,						-1,		-1, -1},
;3548:	{"radio objdanger", -1,						-1,		-1, -1},
;3549:	{"radio objhome", -1,						-1,		-1, -1},
;3550:	{"radio bgot", -1,						-1,		-1, -1},
;3551:	{"radio bplaced", -1,						-1,		-1, -1},
;3552:	{"radio bdisarm", -1,						-1,		-1, -1}
;3553:
;3554:};
;3555:
;3556:
;3557:static const int g_bindCount = sizeof(g_bindings) / sizeof(bind_t);
;3558:
;3559:static configcvar_t g_configcvars[] =
;3560:{
;3561:	{"cl_run",			0,					0},
;3562:	{"m_pitch",			0,					0},
;3563:	{"cg_autoswitch",	0,					0},
;3564:	{"sensitivity",		0,					0},
;3565:	{"in_joystick",		0,					0},
;3566:	{"joy_threshold",	0,					0},
;3567:	{"m_filter",		0,					0},
;3568:	{"cl_freelook",		0,					0},
;3569:	{NULL,				0,					0}
;3570:};
;3571:
;3572:/*
;3573:=================
;3574:Controls_GetKeyAssignment
;3575:=================
;3576:*/
;3577:static void Controls_GetKeyAssignment (char *command, int *twokeys)
;3578:{
line 3583
;3579:	int		count;
;3580:	int		j;
;3581:	char	b[256];
;3582:
;3583:	twokeys[0] = twokeys[1] = -1;
ADDRLP4 264
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 268
CNSTI4 -1
ASGNI4
ADDRLP4 264
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
ADDRLP4 264
INDIRP4
ADDRLP4 268
INDIRI4
ASGNI4
line 3584
;3584:	count = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 3586
;3585:
;3586:	for ( j = 0; j < 256; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1760
line 3587
;3587:	{
line 3588
;3588:		DC->getBindingBuf( j, b, 256 );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 144
ADDP4
INDIRP4
CALLV
pop
line 3589
;3589:		if ( *b == 0 ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1764
line 3590
;3590:			continue;
ADDRGP4 $1761
JUMPV
LABELV $1764
line 3592
;3591:		}
;3592:		if ( !Q_stricmp( b, command ) ) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $1766
line 3593
;3593:			twokeys[count] = j;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 3594
;3594:			count++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3595
;3595:			if (count == 2) {
ADDRLP4 260
INDIRI4
CNSTI4 2
NEI4 $1768
line 3596
;3596:				break;
ADDRGP4 $1762
JUMPV
LABELV $1768
line 3598
;3597:			}
;3598:		}
LABELV $1766
line 3599
;3599:	}
LABELV $1761
line 3586
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1760
LABELV $1762
line 3600
;3600:}
LABELV $1759
endproc Controls_GetKeyAssignment 276 12
export Controls_GetConfig
proc Controls_GetConfig 12 8
line 3608
;3601:
;3602:/*
;3603:=================
;3604:Controls_GetConfig
;3605:=================
;3606:*/
;3607:void Controls_GetConfig( void )
;3608:{
line 3613
;3609:	int		i;
;3610:	int		twokeys[2];
;3611:
;3612:	// iterate each command, get its numeric binding
;3613:	for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1774
JUMPV
LABELV $1771
line 3614
;3614:	{
line 3616
;3615:
;3616:		Controls_GetKeyAssignment(g_bindings[i].command, twokeys);
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Controls_GetKeyAssignment
CALLV
pop
line 3618
;3617:
;3618:		g_bindings[i].bind1 = twokeys[0];
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 3619
;3619:		g_bindings[i].bind2 = twokeys[1];
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
ADDRLP4 4+4
INDIRI4
ASGNI4
line 3620
;3620:	}
LABELV $1772
line 3613
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1774
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1771
line 3630
;3621:
;3622:	//s_controls.invertmouse.curvalue  = DC->getCVarValue( "m_pitch" ) < 0;
;3623:	//s_controls.smoothmouse.curvalue  = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "m_filter" ) );
;3624:	//s_controls.alwaysrun.curvalue    = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "cl_run" ) );
;3625:	//s_controls.autoswitch.curvalue   = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "cg_autoswitch" ) );
;3626:	//s_controls.sensitivity.curvalue  = UI_ClampCvar( 2, 30, Controls_GetCvarValue( "sensitivity" ) );
;3627:	//s_controls.joyenable.curvalue    = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "in_joystick" ) );
;3628:	//s_controls.joythreshold.curvalue = UI_ClampCvar( 0.05, 0.75, Controls_GetCvarValue( "joy_threshold" ) );
;3629:	//s_controls.freelook.curvalue     = UI_ClampCvar( 0, 1, Controls_GetCvarValue( "cl_freelook" ) );
;3630:}
LABELV $1770
endproc Controls_GetConfig 12 8
export Controls_SetConfig
proc Controls_SetConfig 12 8
line 3638
;3631:
;3632:/*
;3633:=================
;3634:Controls_SetConfig
;3635:=================
;3636:*/
;3637:void Controls_SetConfig(qboolean restart)
;3638:{
line 3642
;3639:	int		i;
;3640:
;3641:	// iterate each command, get its numeric binding
;3642:	for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1782
JUMPV
LABELV $1779
line 3643
;3643:	{
line 3645
;3644:
;3645:		if (g_bindings[i].bind1 != -1)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1783
line 3646
;3646:		{	
line 3647
;3647:			DC->setBinding( g_bindings[i].bind1, g_bindings[i].command );
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_bindings
ADDP4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
line 3649
;3648:
;3649:			if (g_bindings[i].bind2 != -1)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1787
line 3650
;3650:				DC->setBinding( g_bindings[i].bind2, g_bindings[i].command );
ADDRLP4 8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_bindings
ADDP4
INDIRP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
LABELV $1787
line 3651
;3651:		}
LABELV $1783
line 3652
;3652:	}
LABELV $1780
line 3642
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1782
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1779
line 3666
;3653:
;3654:	//if ( s_controls.invertmouse.curvalue )
;3655:	//	DC->setCVar("m_pitch", va("%f),-fabs( DC->getCVarValue( "m_pitch" ) ) );
;3656:	//else
;3657:	//	trap_Cvar_SetValue( "m_pitch", fabs( trap_Cvar_VariableValue( "m_pitch" ) ) );
;3658:
;3659:	//trap_Cvar_SetValue( "m_filter", s_controls.smoothmouse.curvalue );
;3660:	//trap_Cvar_SetValue( "cl_run", s_controls.alwaysrun.curvalue );
;3661:	//trap_Cvar_SetValue( "cg_autoswitch", s_controls.autoswitch.curvalue );
;3662:	//trap_Cvar_SetValue( "sensitivity", s_controls.sensitivity.curvalue );
;3663:	//trap_Cvar_SetValue( "in_joystick", s_controls.joyenable.curvalue );
;3664:	//trap_Cvar_SetValue( "joy_threshold", s_controls.joythreshold.curvalue );
;3665:	//trap_Cvar_SetValue( "cl_freelook", s_controls.freelook.curvalue );
;3666:	DC->executeText(EXEC_APPEND, "in_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $1791
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 152
ADDP4
INDIRP4
CALLV
pop
line 3668
;3667:	//trap_Cmd_ExecuteText( EXEC_APPEND, "in_restart\n" );
;3668:}
LABELV $1778
endproc Controls_SetConfig 12 8
export Controls_SetDefaults
proc Controls_SetDefaults 12 0
line 3676
;3669:
;3670:/*
;3671:=================
;3672:Controls_SetDefaults
;3673:=================
;3674:*/
;3675:void Controls_SetDefaults( void )
;3676:{
line 3680
;3677:	int	i;
;3678:
;3679:	// iterate each command, set its default binding
;3680:  for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1796
JUMPV
LABELV $1793
line 3681
;3681:	{
line 3682
;3682:		g_bindings[i].bind1 = g_bindings[i].defaultbind1;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_bindings+16
ADDP4
ADDRLP4 4
INDIRI4
ADDRGP4 g_bindings+8
ADDP4
INDIRI4
ASGNI4
line 3683
;3683:		g_bindings[i].bind2 = g_bindings[i].defaultbind2;
ADDRLP4 8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_bindings+20
ADDP4
ADDRLP4 8
INDIRI4
ADDRGP4 g_bindings+12
ADDP4
INDIRI4
ASGNI4
line 3684
;3684:	}
LABELV $1794
line 3680
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1796
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1793
line 3694
;3685:
;3686:	//s_controls.invertmouse.curvalue  = Controls_GetCvarDefault( "m_pitch" ) < 0;
;3687:	//s_controls.smoothmouse.curvalue  = Controls_GetCvarDefault( "m_filter" );
;3688:	//s_controls.alwaysrun.curvalue    = Controls_GetCvarDefault( "cl_run" );
;3689:	//s_controls.autoswitch.curvalue   = Controls_GetCvarDefault( "cg_autoswitch" );
;3690:	//s_controls.sensitivity.curvalue  = Controls_GetCvarDefault( "sensitivity" );
;3691:	//s_controls.joyenable.curvalue    = Controls_GetCvarDefault( "in_joystick" );
;3692:	//s_controls.joythreshold.curvalue = Controls_GetCvarDefault( "joy_threshold" );
;3693:	//s_controls.freelook.curvalue     = Controls_GetCvarDefault( "cl_freelook" );
;3694:}
LABELV $1792
endproc Controls_SetDefaults 12 0
export BindingIDFromName
proc BindingIDFromName 8 8
line 3696
;3695:
;3696:int BindingIDFromName(const char *name) {
line 3698
;3697:	int i;
;3698:  for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1805
JUMPV
LABELV $1802
line 3699
;3699:	{
line 3700
;3700:		if (Q_stricmp(name, g_bindings[i].command) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1806
line 3701
;3701:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1801
JUMPV
LABELV $1806
line 3703
;3702:		}
;3703:	}
LABELV $1803
line 3698
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1805
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1802
line 3704
;3704:	return -1;
CNSTI4 -1
RETI4
LABELV $1801
endproc BindingIDFromName 8 8
export BindingFromName
proc BindingFromName 16 12
line 3710
;3705:}
;3706:
;3707:char g_nameBind1[32];
;3708:char g_nameBind2[32];
;3709:
;3710:void BindingFromName(const char *cvar) {
line 3714
;3711:	int	i, b1, b2;
;3712:
;3713:	// iterate each command, set its default binding
;3714:	for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1812
JUMPV
LABELV $1809
line 3715
;3715:	{
line 3716
;3716:		if (Q_stricmp(cvar, g_bindings[i].command) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings
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
NEI4 $1813
line 3717
;3717:			b1 = g_bindings[i].bind1;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ASGNI4
line 3718
;3718:			if (b1 == -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $1816
line 3719
;3719:				break;
ADDRGP4 $1811
JUMPV
LABELV $1816
line 3721
;3720:			}
;3721:				DC->keynumToStringBuf( b1, g_nameBind1, 32 );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 g_nameBind1
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 140
ADDP4
INDIRP4
CALLV
pop
line 3722
;3722:				Q_strupr(g_nameBind1);
ADDRGP4 g_nameBind1
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 3724
;3723:
;3724:				b2 = g_bindings[i].bind2;
ADDRLP4 8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ASGNI4
line 3725
;3725:				if (b2 != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1808
line 3726
;3726:				{
line 3727
;3727:					DC->keynumToStringBuf( b2, g_nameBind2, 32 );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 g_nameBind2
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 140
ADDP4
INDIRP4
CALLV
pop
line 3728
;3728:					Q_strupr(g_nameBind2);
ADDRGP4 g_nameBind2
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 3729
;3729:					strcat( g_nameBind1, " or " );
ADDRGP4 g_nameBind1
ARGP4
ADDRGP4 $1821
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 3730
;3730:					strcat( g_nameBind1, g_nameBind2 );
ADDRGP4 g_nameBind1
ARGP4
ADDRGP4 g_nameBind2
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 3731
;3731:				}
line 3732
;3732:			return;
ADDRGP4 $1808
JUMPV
LABELV $1813
line 3734
;3733:		}
;3734:	}
LABELV $1810
line 3714
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1812
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1809
LABELV $1811
line 3735
;3735:	strcpy(g_nameBind1, "???");
ADDRGP4 g_nameBind1
ARGP4
ADDRGP4 $1822
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3736
;3736:}
LABELV $1808
endproc BindingFromName 16 12
export Item_Slider_Paint
proc Item_Slider_Paint 96 36
line 3738
;3737:
;3738:void Item_Slider_Paint(itemDef_t *item) {
line 3741
;3739:	vec4_t newColor, lowLight;
;3740:	float x, y, value;
;3741:	menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 3742
;3742:	qboolean novscreen = qfalse;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 3744
;3743:
;3744:	value = (item->cvar) ? DC->getCVarValue(item->cvar) : 0;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1825
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 56
INDIRF4
ASGNF4
ADDRGP4 $1826
JUMPV
LABELV $1825
ADDRLP4 52
CNSTF4 0
ASGNF4
LABELV $1826
ADDRLP4 48
ADDRLP4 52
INDIRF4
ASGNF4
line 3746
;3745:
;3746:	if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1827
line 3747
;3747:		lowLight[0] = 0.8 * parent->focusColor[0]; 
ADDRLP4 12
CNSTF4 1061997773
ADDRLP4 4
INDIRP4
CNSTI4 244
ADDP4
INDIRF4
MULF4
ASGNF4
line 3748
;3748:		lowLight[1] = 0.8 * parent->focusColor[1]; 
ADDRLP4 12+4
CNSTF4 1061997773
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
MULF4
ASGNF4
line 3749
;3749:		lowLight[2] = 0.8 * parent->focusColor[2]; 
ADDRLP4 12+8
CNSTF4 1061997773
ADDRLP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRF4
MULF4
ASGNF4
line 3750
;3750:		lowLight[3] = 0.8 * parent->focusColor[3]; 
ADDRLP4 12+12
CNSTF4 1061997773
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRF4
MULF4
ASGNF4
line 3751
;3751:		LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 60
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
ARGP4
CNSTF4 1056964608
ADDRLP4 60
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 3752
;3752:	} else {
ADDRGP4 $1828
JUMPV
LABELV $1827
line 3753
;3753:		memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 32
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3754
;3754:	}
LABELV $1828
line 3756
;3755:
;3756:	y = item->window.rect.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 3757
;3757:	if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1832
line 3758
;3758:		Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3759
;3759:		x = item->textRect.x + item->textRect.w + 8;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3761
;3760:
;3761:		if ( item->textRect.novscreen )
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1833
line 3762
;3762:			novscreen = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 3763
;3763:	} else {
ADDRGP4 $1833
JUMPV
LABELV $1832
line 3764
;3764:		x = item->window.rect.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 3766
;3765:
;3766:		if ( item->window.rect.novscreen )
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1836
line 3767
;3767:			novscreen = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $1836
line 3768
;3768:	}
LABELV $1833
line 3769
;3769:	DC->setColor(newColor);
ADDRLP4 32
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 3771
;3770:
;3771:	if ( novscreen )
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1838
line 3772
;3772:		DC->drawStretchPic( x, y, SLIDER_WIDTH, SLIDER_HEIGHT, 0, 0, 1, 1, DC->Assets.sliderBar );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
CNSTF4 1119879168
ARGF4
CNSTF4 1098907648
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
ADDRLP4 64
CNSTF4 1065353216
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 61932
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $1839
JUMPV
LABELV $1838
line 3774
;3773:	else
;3774:		DC->drawHandlePic( x, y, SLIDER_WIDTH, SLIDER_HEIGHT, DC->Assets.sliderBar );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
CNSTF4 1119879168
ARGF4
CNSTF4 1098907648
ARGF4
ADDRLP4 72
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 61932
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
LABELV $1839
line 3776
;3775:
;3776:	x = Item_Slider_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 Item_Slider_ThumbPosition
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 76
INDIRF4
ASGNF4
line 3778
;3777:
;3778:	if ( x > 640 )
ADDRLP4 0
INDIRF4
CNSTF4 1142947840
LEF4 $1840
line 3779
;3779:		DC->drawStretchPic(  x - (SLIDER_THUMB_WIDTH / 2), y - 2, SLIDER_THUMB_WIDTH, SLIDER_THUMB_HEIGHT, 0, 0, 1, 1, DC->Assets.sliderThumb );
ADDRLP4 0
INDIRF4
CNSTF4 1086324736
SUBF4
ARGF4
ADDRLP4 8
INDIRF4
CNSTF4 1073741824
SUBF4
ARGF4
CNSTF4 1094713344
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 80
CNSTF4 0
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 84
CNSTF4 1065353216
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 61936
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $1841
JUMPV
LABELV $1840
line 3781
;3780:	else
;3781: 		DC->drawHandlePic( x - (SLIDER_THUMB_WIDTH / 2), y - 2, SLIDER_THUMB_WIDTH, SLIDER_THUMB_HEIGHT, DC->Assets.sliderThumb );
ADDRLP4 0
INDIRF4
CNSTF4 1086324736
SUBF4
ARGF4
ADDRLP4 8
INDIRF4
CNSTF4 1073741824
SUBF4
ARGF4
CNSTF4 1094713344
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 92
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 61936
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
LABELV $1841
line 3783
;3782:
;3783:}
LABELV $1823
endproc Item_Slider_Paint 96 36
export Item_Bind_Paint
proc Item_Bind_Paint 64 32
line 3785
;3784:
;3785:void Item_Bind_Paint(itemDef_t *item) {
line 3788
;3786:	vec4_t newColor, lowLight;
;3787:	float value;
;3788:	int maxChars = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 3789
;3789:	menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 3790
;3790:	editFieldDef_t *editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 3791
;3791:	if (editPtr) {
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1843
line 3792
;3792:		maxChars = editPtr->maxPaintChars;
ADDRLP4 16
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 3793
;3793:	}
LABELV $1843
line 3795
;3794:
;3795:	value = (item->cvar) ? DC->getCVarValue(item->cvar) : 0;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1846
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 DC
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 52
INDIRF4
ASGNF4
ADDRGP4 $1847
JUMPV
LABELV $1846
ADDRLP4 48
CNSTF4 0
ASGNF4
LABELV $1847
ADDRLP4 44
ADDRLP4 48
INDIRF4
ASGNF4
line 3797
;3796:
;3797:	if (item->window.flags & WINDOW_HASFOCUS) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1848
line 3798
;3798:		if (g_bindItem == item) {
ADDRGP4 g_bindItem
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $1850
line 3799
;3799:			lowLight[0] = 0.8f * 1.0f;
ADDRLP4 0
CNSTF4 1061997773
ASGNF4
line 3800
;3800:			lowLight[1] = 0.8f * 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 3801
;3801:			lowLight[2] = 0.8f * 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3802
;3802:			lowLight[3] = 0.8f * 1.0f;
ADDRLP4 0+12
CNSTF4 1061997773
ASGNF4
line 3803
;3803:		} else {
ADDRGP4 $1851
JUMPV
LABELV $1850
line 3804
;3804:			lowLight[0] = 0.8f * parent->focusColor[0]; 
ADDRLP4 0
CNSTF4 1061997773
ADDRLP4 20
INDIRP4
CNSTI4 244
ADDP4
INDIRF4
MULF4
ASGNF4
line 3805
;3805:			lowLight[1] = 0.8f * parent->focusColor[1]; 
ADDRLP4 0+4
CNSTF4 1061997773
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
MULF4
ASGNF4
line 3806
;3806:			lowLight[2] = 0.8f * parent->focusColor[2]; 
ADDRLP4 0+8
CNSTF4 1061997773
ADDRLP4 20
INDIRP4
CNSTI4 252
ADDP4
INDIRF4
MULF4
ASGNF4
line 3807
;3807:			lowLight[3] = 0.8f * parent->focusColor[3]; 
ADDRLP4 0+12
CNSTF4 1061997773
ADDRLP4 20
INDIRP4
CNSTI4 256
ADDP4
INDIRF4
MULF4
ASGNF4
line 3808
;3808:		}
LABELV $1851
line 3809
;3809:		LerpColor(parent->focusColor,lowLight,newColor,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 56
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
CNSTF4 1056964608
ADDRLP4 56
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 3810
;3810:	} else {
ADDRGP4 $1849
JUMPV
LABELV $1848
line 3811
;3811:		memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3812
;3812:	}
LABELV $1849
line 3814
;3813:
;3814:	if (item->text) {
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1858
line 3815
;3815:		Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 3816
;3816:		BindingFromName(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRGP4 BindingFromName
CALLV
pop
line 3817
;3817:		DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, g_nameBind1, 0, maxChars, item->textStyle);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ARGP4
ADDRGP4 g_nameBind1
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3818
;3818:	} else {
ADDRGP4 $1859
JUMPV
LABELV $1858
line 3819
;3819:		DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, (value != 0) ? "FIXME" : "FIXME", 0, maxChars, item->textStyle);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ARGP4
ADDRLP4 44
INDIRF4
CNSTF4 0
EQF4 $1862
ADDRLP4 56
ADDRGP4 $1860
ASGNP4
ADDRGP4 $1863
JUMPV
LABELV $1862
ADDRLP4 56
ADDRGP4 $1860
ASGNP4
LABELV $1863
ADDRLP4 56
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 3820
;3820:	}
LABELV $1859
line 3821
;3821:}
LABELV $1842
endproc Item_Bind_Paint 64 32
export Display_KeyBindPending
proc Display_KeyBindPending 0 0
line 3823
;3822:
;3823:qboolean Display_KeyBindPending() {
line 3824
;3824:	return g_waitingForKey;
ADDRGP4 g_waitingForKey
INDIRI4
RETI4
LABELV $1864
endproc Display_KeyBindPending 0 0
export Item_Bind_HandleKey
proc Item_Bind_HandleKey 32 12
line 3827
;3825:}
;3826:
;3827:qboolean Item_Bind_HandleKey(itemDef_t *item, int key, qboolean down) {
line 3831
;3828:	int			id;
;3829:	int			i;
;3830:
;3831:	if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && !g_waitingForKey)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1866
ADDRGP4 g_waitingForKey
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1866
line 3832
;3832:	{
line 3833
;3833:		if (down && (key == K_MOUSE1 || key == K_ENTER)) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1868
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 178
EQI4 $1870
ADDRLP4 20
INDIRI4
CNSTI4 13
NEI4 $1868
LABELV $1870
line 3834
;3834:			g_waitingForKey = qtrue;
ADDRGP4 g_waitingForKey
CNSTI4 1
ASGNI4
line 3835
;3835:			g_bindItem = item;
ADDRGP4 g_bindItem
ADDRFP4 0
INDIRP4
ASGNP4
line 3836
;3836:		}
LABELV $1868
line 3837
;3837:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1865
JUMPV
LABELV $1866
line 3840
;3838:	}
;3839:	else
;3840:	{
line 3841
;3841:		if (!g_waitingForKey || g_bindItem == NULL) {
ADDRGP4 g_waitingForKey
INDIRI4
CNSTI4 0
EQI4 $1873
ADDRGP4 g_bindItem
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1871
LABELV $1873
line 3842
;3842:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1865
JUMPV
LABELV $1871
line 3845
;3843:		}
;3844:
;3845:		if (key & K_CHAR_FLAG) {
ADDRFP4 4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1874
line 3846
;3846:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1865
JUMPV
LABELV $1874
line 3849
;3847:		}
;3848:
;3849:		switch (key)
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 96
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1884
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $1886
LABELV $1885
ADDRFP4 4
INDIRI4
CNSTI4 27
EQI4 $1878
ADDRGP4 $1876
JUMPV
LABELV $1886
ADDRFP4 4
INDIRI4
CNSTI4 127
EQI4 $1879
ADDRGP4 $1876
JUMPV
line 3850
;3850:		{
LABELV $1878
line 3852
;3851:			case K_ESCAPE:
;3852:				g_waitingForKey = qfalse;
ADDRGP4 g_waitingForKey
CNSTI4 0
ASGNI4
line 3853
;3853:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1865
JUMPV
LABELV $1879
line 3856
;3854:	
;3855:			case K_BACKSPACE:
;3856:				id = BindingIDFromName(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 BindingIDFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 3857
;3857:				if (id != -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1880
line 3858
;3858:					g_bindings[id].bind1 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
CNSTI4 -1
ASGNI4
line 3859
;3859:					g_bindings[id].bind2 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3860
;3860:				}
LABELV $1880
line 3861
;3861:				Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 3862
;3862:				g_waitingForKey = qfalse;
ADDRGP4 g_waitingForKey
CNSTI4 0
ASGNI4
line 3863
;3863:				g_bindItem = NULL;
ADDRGP4 g_bindItem
CNSTP4 0
ASGNP4
line 3864
;3864:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1865
JUMPV
LABELV $1884
line 3867
;3865:
;3866:			case '`':
;3867:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1865
JUMPV
LABELV $1876
line 3869
;3868:		}
;3869:	}
line 3871
;3870:
;3871:	if (key != -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
EQI4 $1887
line 3872
;3872:	{
line 3874
;3873:
;3874:		for (i=0; i < g_bindCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1892
JUMPV
LABELV $1889
line 3875
;3875:		{
line 3877
;3876:
;3877:			if (g_bindings[i].bind2 == key) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1893
line 3878
;3878:				g_bindings[i].bind2 = -1;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3879
;3879:			}
LABELV $1893
line 3881
;3880:
;3881:			if (g_bindings[i].bind1 == key)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1897
line 3882
;3882:			{
line 3883
;3883:				g_bindings[i].bind1 = g_bindings[i].bind2;
ADDRLP4 20
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_bindings+16
ADDP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ASGNI4
line 3884
;3884:				g_bindings[i].bind2 = -1;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3885
;3885:			}
LABELV $1897
line 3886
;3886:		}
LABELV $1890
line 3874
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1892
ADDRLP4 0
INDIRI4
ADDRGP4 g_bindCount
INDIRI4
LTI4 $1889
line 3887
;3887:	}
LABELV $1887
line 3890
;3888:
;3889:
;3890:	id = BindingIDFromName(item->cvar);
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BindingIDFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 3892
;3891:
;3892:	if (id != -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1903
line 3893
;3893:		if (key == -1) {
ADDRFP4 4
INDIRI4
CNSTI4 -1
NEI4 $1905
line 3894
;3894:			if( g_bindings[id].bind1 != -1 ) {
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1907
line 3895
;3895:				DC->setBinding( g_bindings[id].bind1, "" );
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $107
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
line 3896
;3896:				g_bindings[id].bind1 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
CNSTI4 -1
ASGNI4
line 3897
;3897:			}
LABELV $1907
line 3898
;3898:			if( g_bindings[id].bind2 != -1 ) {
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1906
line 3899
;3899:				DC->setBinding( g_bindings[id].bind2, "" );
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 $107
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
line 3900
;3900:				g_bindings[id].bind2 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3901
;3901:			}
line 3902
;3902:		}
ADDRGP4 $1906
JUMPV
LABELV $1905
line 3903
;3903:		else if (g_bindings[id].bind1 == -1) {
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1917
line 3904
;3904:			g_bindings[id].bind1 = key;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3905
;3905:		}
ADDRGP4 $1918
JUMPV
LABELV $1917
line 3906
;3906:		else if (g_bindings[id].bind1 != key && g_bindings[id].bind2 == -1) {
ADDRLP4 24
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $1921
ADDRLP4 24
INDIRI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1921
line 3907
;3907:			g_bindings[id].bind2 = key;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3908
;3908:		}
ADDRGP4 $1922
JUMPV
LABELV $1921
line 3909
;3909:		else {
line 3910
;3910:			DC->setBinding( g_bindings[id].bind1, "" );
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $107
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
line 3911
;3911:			DC->setBinding( g_bindings[id].bind2, "" );
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 $107
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 148
ADDP4
INDIRP4
CALLV
pop
line 3912
;3912:			g_bindings[id].bind1 = key;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 3913
;3913:			g_bindings[id].bind2 = -1;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_bindings+20
ADDP4
CNSTI4 -1
ASGNI4
line 3914
;3914:		}						
LABELV $1922
LABELV $1918
LABELV $1906
line 3915
;3915:	}
LABELV $1903
line 3917
;3916:
;3917:	Controls_SetConfig(qtrue);	
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 3918
;3918:	g_waitingForKey = qfalse;
ADDRGP4 g_waitingForKey
CNSTI4 0
ASGNI4
line 3920
;3919:
;3920:	return qtrue;
CNSTI4 1
RETI4
LABELV $1865
endproc Item_Bind_HandleKey 32 12
export AdjustFrom640
proc AdjustFrom640 16 0
line 3925
;3921:}
;3922:
;3923:
;3924:
;3925:void AdjustFrom640(float *x, float *y, float *w, float *h) {
line 3927
;3926:	//*x = *x * DC->scale + DC->bias;
;3927:	*x *= DC->xscale;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 DC
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
MULF4
ASGNF4
line 3928
;3928:	*y *= DC->yscale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 DC
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
MULF4
ASGNF4
line 3929
;3929:	*w *= DC->xscale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 DC
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
MULF4
ASGNF4
line 3930
;3930:	*h *= DC->yscale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 DC
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
MULF4
ASGNF4
line 3931
;3931:}
LABELV $1930
endproc AdjustFrom640 16 0
export Item_Model_Paint
proc Item_Model_Paint 588 16
line 3933
;3932:
;3933:void Item_Model_Paint(itemDef_t *item) {
line 3939
;3934:	float x, y, w, h;
;3935:	refdef_t refdef;
;3936:	refEntity_t		ent;
;3937:	vec3_t			mins, maxs, origin;
;3938:	vec3_t			angles;
;3939:	modelDef_t *modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 508
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 3941
;3940:
;3941:	if (modelPtr == NULL) {
ADDRLP4 508
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1932
line 3942
;3942:		return;
ADDRGP4 $1931
JUMPV
LABELV $1932
line 3946
;3943:	}
;3944:
;3945:	// setup the refdef
;3946:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3947
;3947:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 3948
;3948:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 3949
;3949:	x = item->window.rect.x+1;
ADDRLP4 568
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3950
;3950:	y = item->window.rect.y+1;
ADDRLP4 572
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3951
;3951:	w = item->window.rect.w-2;
ADDRLP4 524
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 3952
;3952:	h = item->window.rect.h-2;
ADDRLP4 528
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 3954
;3953:
;3954:	AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 568
ARGP4
ADDRLP4 572
ARGP4
ADDRLP4 524
ARGP4
ADDRLP4 528
ARGP4
ADDRGP4 AdjustFrom640
CALLV
pop
line 3956
;3955:
;3956:	refdef.x = x;
ADDRLP4 0
ADDRLP4 568
INDIRF4
CVFI4 4
ASGNI4
line 3957
;3957:	refdef.y = y;
ADDRLP4 0+4
ADDRLP4 572
INDIRF4
CVFI4 4
ASGNI4
line 3958
;3958:	refdef.width = w;
ADDRLP4 0+8
ADDRLP4 524
INDIRF4
CVFI4 4
ASGNI4
line 3959
;3959:	refdef.height = h;
ADDRLP4 0+12
ADDRLP4 528
INDIRF4
CVFI4 4
ASGNI4
line 3961
;3960:
;3961:	DC->modelBounds( item->asset, mins, maxs );
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 544
ARGP4
ADDRLP4 556
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CALLV
pop
line 3963
;3962:
;3963:	origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 512+8
CNSTF4 3204448256
ADDRLP4 544+8
INDIRF4
ADDRLP4 556+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 3964
;3964:	origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 512+4
CNSTF4 1056964608
ADDRLP4 544+4
INDIRF4
ADDRLP4 556+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 3967
;3965:
;3966:	// calculate distance so the model nearly fills the box
;3967:	if (qtrue) {
line 3968
;3968:		float len = 0.5 * ( maxs[2] - mins[2] );		
ADDRLP4 576
CNSTF4 1056964608
ADDRLP4 556+8
INDIRF4
ADDRLP4 544+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 3969
;3969:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 512
ADDRLP4 576
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 3971
;3970:		//origin[0] = len / tan(w/2);
;3971:	} else {
ADDRGP4 $1946
JUMPV
LABELV $1945
line 3972
;3972:		origin[0] = item->textscale;
ADDRLP4 512
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ASGNF4
line 3973
;3973:	}
LABELV $1946
line 3974
;3974:	refdef.fov_x = (modelPtr->fov_x) ? modelPtr->fov_x : w;
ADDRLP4 508
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1951
ADDRLP4 576
ADDRLP4 508
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $1952
JUMPV
LABELV $1951
ADDRLP4 576
ADDRLP4 524
INDIRF4
ASGNF4
LABELV $1952
ADDRLP4 0+16
ADDRLP4 576
INDIRF4
ASGNF4
line 3975
;3975:	refdef.fov_x = (modelPtr->fov_y) ? modelPtr->fov_y : h;
ADDRLP4 508
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1955
ADDRLP4 580
ADDRLP4 508
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $1956
JUMPV
LABELV $1955
ADDRLP4 580
ADDRLP4 528
INDIRF4
ASGNF4
LABELV $1956
ADDRLP4 0+16
ADDRLP4 580
INDIRF4
ASGNF4
line 3982
;3976:
;3977:	//refdef.fov_x = (int)((float)refdef.width / 640.0f * 90.0f);
;3978:	//xx = refdef.width / tan( refdef.fov_x / 360 * M_PI );
;3979:	//refdef.fov_y = atan2( refdef.height, xx );
;3980:	//refdef.fov_y *= ( 360 / M_PI );
;3981:
;3982:	DC->clearScene();
ADDRGP4 DC
INDIRP4
CNSTI4 52
ADDP4
INDIRP4
CALLV
pop
line 3984
;3983:
;3984:	refdef.time = DC->realTime;
ADDRLP4 0+72
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 3988
;3985:
;3986:	// add the model
;3987:
;3988:	memset( &ent, 0, sizeof(ent) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3995
;3989:
;3990:	//adjust = 5.0 * sin( (float)uis.realtime / 500 );
;3991:	//adjust = 360 % (int)((float)uis.realtime / 1000);
;3992:	//VectorSet( angles, 0, 0, 1 );
;3993:
;3994:	// use item storage to track
;3995:	if (modelPtr->rotationSpeed) {
ADDRLP4 508
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1958
line 3996
;3996:		if (DC->realTime > item->window.nextTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
LEI4 $1960
line 3997
;3997:			item->window.nextTime = DC->realTime + modelPtr->rotationSpeed;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 508
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3998
;3998:			modelPtr->angle = (int)(modelPtr->angle + 1) % 360;
ADDRLP4 508
INDIRP4
ADDRLP4 508
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 360
MODI4
ASGNI4
line 3999
;3999:		}
LABELV $1960
line 4000
;4000:	}
LABELV $1958
line 4001
;4001:	VectorSet( angles, 0, modelPtr->angle, 0 );
ADDRLP4 532
CNSTF4 0
ASGNF4
ADDRLP4 532+4
ADDRLP4 508
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 532+8
CNSTF4 0
ASGNF4
line 4002
;4002:	AnglesToAxis( angles, ent.axis );
ADDRLP4 532
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 4004
;4003:
;4004:	ent.hModel = item->asset;
ADDRLP4 368+8
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ASGNI4
line 4005
;4005:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRLP4 512
INDIRB
ASGNB 12
line 4006
;4006:	VectorCopy( origin, ent.lightingOrigin );
ADDRLP4 368+12
ADDRLP4 512
INDIRB
ASGNB 12
line 4007
;4007:	ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 368+4
CNSTI4 192
ASGNI4
line 4008
;4008:	VectorCopy( ent.origin, ent.oldorigin );
ADDRLP4 368+84
ADDRLP4 368+68
INDIRB
ASGNB 12
line 4010
;4009:
;4010:	DC->addRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 56
ADDP4
INDIRP4
CALLV
pop
line 4011
;4011:	DC->renderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CALLV
pop
line 4013
;4012:
;4013:}
LABELV $1931
endproc Item_Model_Paint 588 16
export Item_Image_Paint
proc Item_Image_Paint 36 36
line 4016
;4014:
;4015:
;4016:void Item_Image_Paint(itemDef_t *item) {
line 4017
;4017:	if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1972
line 4018
;4018:		return;
ADDRGP4 $1971
JUMPV
LABELV $1972
line 4020
;4019:	}
;4020:	if ( item->window.rect.novscreen )
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1974
line 4021
;4021:		DC->drawStretchPic( item->window.rect.x+1, item->window.rect.y+1, item->window.rect.w-2, item->window.rect.h-2, 0, 0, 1, 1, item->asset );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ARGF4
ADDRLP4 12
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ARGF4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $1975
JUMPV
LABELV $1974
line 4023
;4022:	else
;4023:		DC->drawHandlePic(item->window.rect.x+1, item->window.rect.y+1, item->window.rect.w-2, item->window.rect.h-2, item->asset);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ARGF4
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
CNSTF4 1073741824
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
CALLV
pop
LABELV $1975
line 4024
;4024:}
LABELV $1971
endproc Item_Image_Paint 36 36
export Item_ListBox_Paint
proc Item_ListBox_Paint 104 32
line 4026
;4025:
;4026:void Item_ListBox_Paint(itemDef_t *item) {
line 4030
;4027:	float x, y, size, count, i, thumb;
;4028:	qhandle_t image;
;4029:	qhandle_t optionalImage;
;4030:	listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4036
;4031:
;4032:	// the listbox is horizontal or vertical and has a fixed size scroll bar going either direction
;4033:	// elements are enumerated from the DC and either text or image handles are acquired from the DC as well
;4034:	// textscale is used to size the text, textalignx and textaligny are used to size image elements
;4035:	// there is no clipping available so only the last completely visible item is painted
;4036:	count = DC->feederCount(item->special);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 DC
INDIRP4
CNSTI4 124
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
line 4038
;4037:	// default is vertical if horizontal flag is not here
;4038:	if (item->window.flags & WINDOW_HORIZONTAL) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1977
line 4041
;4039:		// draw scrollbar in bottom of the window
;4040:		// bar
;4041:		x = item->window.rect.x + 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4042
;4042:		y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE - 1;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 4043
;4043:		DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowLeft);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 44
CNSTF4 1098907648
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 61904
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4044
;4044:		x += SCROLLBAR_SIZE - 1;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 4045
;4045:		size = item->window.rect.w - (SCROLLBAR_SIZE * 2);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 4046
;4046:		DC->drawHandlePic(x, y, size+1, SCROLLBAR_SIZE, DC->Assets.scrollBar);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
ADDF4
ARGF4
CNSTF4 1098907648
ARGF4
ADDRLP4 52
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 61912
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4047
;4047:		x += size - 1;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ASGNF4
line 4048
;4048:		DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowRight);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 56
CNSTF4 1098907648
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 61908
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4050
;4049:		// thumb
;4050:		thumb = Item_ListBox_ThumbDrawPosition(item);//Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 Item_ListBox_ThumbDrawPosition
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 64
INDIRI4
CVIF4 4
ASGNF4
line 4051
;4051:		if (thumb > x - SCROLLBAR_SIZE - 1) {
ADDRLP4 32
INDIRF4
ADDRLP4 16
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
LEF4 $1979
line 4052
;4052:			thumb = x - SCROLLBAR_SIZE - 1;
ADDRLP4 32
ADDRLP4 16
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 4053
;4053:		}
LABELV $1979
line 4054
;4054:		DC->drawHandlePic(thumb, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarThumb);
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 68
CNSTF4 1098907648
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 61916
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4056
;4055:		//
;4056:		listPtr->endPos = listPtr->startPos;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 4057
;4057:		size = item->window.rect.w - 2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 4060
;4058:		// items
;4059:		// size contains max available space
;4060:		if (listPtr->elementStyle == LISTBOX_IMAGE) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1978
line 4062
;4061:			// fit = 0;
;4062:			x = item->window.rect.x + 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4063
;4063:			y = item->window.rect.y + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4064
;4064:			for (i = listPtr->startPos; i < count; i++) {
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
ADDRGP4 $1986
JUMPV
LABELV $1983
line 4067
;4065:				// always draw at least one
;4066:				// which may overdraw the box if it is too small for the element
;4067:				image = DC->feederItemImage(item->special, i);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 80
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 80
INDIRI4
ASGNI4
line 4068
;4068:				if (image) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1987
line 4069
;4069:					DC->drawHandlePic(x+1, y+1, listPtr->elementWidth - 2, listPtr->elementHeight - 2, image);
ADDRLP4 84
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 92
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4070
;4070:				}
LABELV $1987
line 4072
;4071:
;4072:				if (i == item->cursorPos) {
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CVIF4 4
NEF4 $1989
line 4073
;4073:					DC->drawRect(x, y, listPtr->elementWidth-1, listPtr->elementHeight-1, item->window.borderSize, item->window.borderColor);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 4074
;4074:				}
LABELV $1989
line 4076
;4075:
;4076:				size -= listPtr->elementWidth;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4077
;4077:				if (size < listPtr->elementWidth) {
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
GEF4 $1991
line 4078
;4078:					listPtr->drawPadding = size; //listPtr->elementWidth - size;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 4079
;4079:					break;
ADDRGP4 $1978
JUMPV
LABELV $1991
line 4081
;4080:				}
;4081:				x += listPtr->elementWidth;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4082
;4082:				listPtr->endPos++;
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4084
;4083:				// fit++;
;4084:			}
LABELV $1984
line 4064
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
LABELV $1986
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRF4
LTF4 $1983
line 4085
;4085:		} else {
line 4087
;4086:			//
;4087:		}
line 4088
;4088:	} else {
ADDRGP4 $1978
JUMPV
LABELV $1977
line 4090
;4089:		// draw scrollbar to right side of the window
;4090:		x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE - 1;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 4091
;4091:		y = item->window.rect.y + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4092
;4092:		DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowUp);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 44
CNSTF4 1098907648
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 61896
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4093
;4093:		y += SCROLLBAR_SIZE - 1;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 4095
;4094:
;4095:		listPtr->endPos = listPtr->startPos;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 4096
;4096:		size = item->window.rect.h - (SCROLLBAR_SIZE * 2);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 4097
;4097:		DC->drawHandlePic(x, y, SCROLLBAR_SIZE, size+1, DC->Assets.scrollBar);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1098907648
ARGF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRLP4 56
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 61912
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4098
;4098:		y += size - 1;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ASGNF4
line 4099
;4099:		DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowDown);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 1098907648
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 61900
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4101
;4100:		// thumb
;4101:		thumb = Item_ListBox_ThumbDrawPosition(item);//Item_ListBox_ThumbPosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 Item_ListBox_ThumbDrawPosition
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 68
INDIRI4
CVIF4 4
ASGNF4
line 4102
;4102:		if (thumb > y - SCROLLBAR_SIZE - 1) {
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
LEF4 $1993
line 4103
;4103:			thumb = y - SCROLLBAR_SIZE - 1;
ADDRLP4 32
ADDRLP4 12
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 4104
;4104:		}
LABELV $1993
line 4105
;4105:		DC->drawHandlePic(x, thumb, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarThumb);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 72
CNSTF4 1098907648
ASGNF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 61916
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4108
;4106:
;4107:		// adjust size for item painting
;4108:		size = item->window.rect.h - 2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 4109
;4109:		if (listPtr->elementStyle == LISTBOX_IMAGE) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1995
line 4111
;4110:			// fit = 0;
;4111:			x = item->window.rect.x + 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4112
;4112:			y = item->window.rect.y + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4113
;4113:			for (i = listPtr->startPos; i < count; i++) {
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
ADDRGP4 $2000
JUMPV
LABELV $1997
line 4116
;4114:				// always draw at least one
;4115:				// which may overdraw the box if it is too small for the element
;4116:				image = DC->feederItemImage(item->special, i);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 80
ADDRGP4 DC
INDIRP4
CNSTI4 132
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 80
INDIRI4
ASGNI4
line 4117
;4117:				if (image) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2001
line 4118
;4118:					DC->drawHandlePic(x+1, y+1, listPtr->elementWidth - 2, listPtr->elementHeight - 2, image);
ADDRLP4 84
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 92
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4119
;4119:				}
LABELV $2001
line 4121
;4120:
;4121:				if (i == item->cursorPos) {
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CVIF4 4
NEF4 $2003
line 4122
;4122:					DC->drawRect(x, y, listPtr->elementWidth - 1, listPtr->elementHeight - 1, item->window.borderSize, item->window.borderColor);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 4123
;4123:				}
LABELV $2003
line 4125
;4124:
;4125:				listPtr->endPos++;
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4126
;4126:				size -= listPtr->elementWidth;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4127
;4127:				if (size < listPtr->elementHeight) {
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
GEF4 $2005
line 4128
;4128:					listPtr->drawPadding = listPtr->elementHeight - size;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 4129
;4129:					break;
ADDRGP4 $1996
JUMPV
LABELV $2005
line 4131
;4130:				}
;4131:				y += listPtr->elementHeight;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4133
;4132:				// fit++;
;4133:			}
LABELV $1998
line 4113
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
LABELV $2000
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRF4
LTF4 $1997
line 4134
;4134:		} else {
ADDRGP4 $1996
JUMPV
LABELV $1995
line 4135
;4135:			x = item->window.rect.x + 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4136
;4136:			y = item->window.rect.y + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4137
;4137:			for (i = listPtr->startPos; i < count; i++) {
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
ADDRGP4 $2010
JUMPV
LABELV $2007
line 4142
;4138:				const char *text;
;4139:				// always draw at least one
;4140:				// which may overdraw the box if it is too small for the element
;4141:
;4142:				if (listPtr->numColumns > 0) {
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2011
line 4144
;4143:					int j;
;4144:					for (j = 0; j < listPtr->numColumns; j++) {
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 $2016
JUMPV
LABELV $2013
line 4145
;4145:						text = DC->feederItemText(item->special, i, j, &optionalImage);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 88
ADDRGP4 DC
INDIRP4
CNSTI4 128
ADDP4
INDIRP4
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 88
INDIRP4
ASGNP4
line 4146
;4146:						if (optionalImage >= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $2017
line 4147
;4147:							DC->drawHandlePic(x + 4 + listPtr->columnInfo[j].pos, y - 1 + listPtr->elementHeight / 2, listPtr->columnInfo[j].width, listPtr->columnInfo[j].width, optionalImage);
ADDRLP4 96
CNSTI4 12
ADDRLP4 84
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
ADDF4
ADDRLP4 96
INDIRP4
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
SUBF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 100
INDIRF4
ARGF4
ADDRLP4 100
INDIRF4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4148
;4148:						} else if (text) {
ADDRGP4 $2018
JUMPV
LABELV $2017
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2019
line 4149
;4149:							DC->drawText(x + 4 + listPtr->columnInfo[j].pos, y + listPtr->elementHeight, item->textscale, item->window.foreColor, text, 0, listPtr->columnInfo[j].maxChars, item->textStyle);
ADDRLP4 96
CNSTI4 12
ADDRLP4 84
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
ADDF4
ADDRLP4 96
INDIRP4
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 100
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 96
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 4150
;4150:						}
LABELV $2019
LABELV $2018
line 4151
;4151:					}
LABELV $2014
line 4144
ADDRLP4 84
ADDRLP4 84
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2016
ADDRLP4 84
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
LTI4 $2013
line 4152
;4152:				} else {
ADDRGP4 $2012
JUMPV
LABELV $2011
line 4153
;4153:					text = DC->feederItemText(item->special, i, 0, &optionalImage);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 84
ADDRGP4 DC
INDIRP4
CNSTI4 128
ADDP4
INDIRP4
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 84
INDIRP4
ASGNP4
line 4154
;4154:					if (optionalImage >= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $2021
line 4156
;4155:						//DC->drawHandlePic(x + 4 + listPtr->elementHeight, y, listPtr->columnInfo[j].width, listPtr->columnInfo[j].width, optionalImage);
;4156:					} else if (text) {
ADDRGP4 $2022
JUMPV
LABELV $2021
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2023
line 4157
;4157:						DC->drawText(x + 4, y + listPtr->elementHeight, item->textscale, item->window.foreColor, text, 0, 0, item->textStyle);
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 88
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 4158
;4158:					}
LABELV $2023
LABELV $2022
line 4159
;4159:				}
LABELV $2012
line 4161
;4160:
;4161:				if (i == item->cursorPos) {
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CVIF4 4
NEF4 $2025
line 4162
;4162:					DC->fillRect(x + 2, y + 2, item->window.rect.w - SCROLLBAR_SIZE - 4, listPtr->elementHeight, item->window.outlineColor);
ADDRLP4 84
CNSTF4 1073741824
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ARGF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ARGF4
ADDRLP4 88
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
CALLV
pop
line 4163
;4163:				}
LABELV $2025
line 4165
;4164:
;4165:				size -= listPtr->elementHeight;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4166
;4166:				if (size < listPtr->elementHeight) {
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
GEF4 $2027
line 4167
;4167:					listPtr->drawPadding = listPtr->elementHeight - size;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 4168
;4168:					break;
ADDRGP4 $2009
JUMPV
LABELV $2027
line 4170
;4169:				}
;4170:				listPtr->endPos++;
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4171
;4171:				y += listPtr->elementHeight;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4173
;4172:				// fit++;
;4173:			}
LABELV $2008
line 4137
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
LABELV $2010
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRF4
LTF4 $2007
LABELV $2009
line 4174
;4174:		}
LABELV $1996
line 4175
;4175:	}
LABELV $1978
line 4176
;4176:}
LABELV $1976
endproc Item_ListBox_Paint 104 32
export Item_OwnerDraw_Paint
proc Item_OwnerDraw_Paint 68 56
line 4179
;4177:
;4178:
;4179:void Item_OwnerDraw_Paint(itemDef_t *item) {
line 4182
;4180:  menuDef_t *parent;
;4181:
;4182:	if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2030
line 4183
;4183:		return;
ADDRGP4 $2029
JUMPV
LABELV $2030
line 4185
;4184:	}
;4185:  parent = (menuDef_t*)item->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 4187
;4186:
;4187:	if (DC->ownerDrawItem) 
ADDRGP4 DC
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2032
line 4188
;4188:	{
line 4191
;4189:		vec4_t color, lowLight;
;4190:
;4191:		menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 4193
;4192:
;4193:		Fade(&item->window.flags, &item->window.foreColor[3], parent->fadeClamp, &item->window.nextTime, parent->fadeCycle, qtrue, parent->fadeAmount);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 140
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ARGF4
ADDRGP4 Fade
CALLV
pop
line 4195
;4194:
;4195:		memcpy(&color, &item->window.foreColor, sizeof(color));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4197
;4196:
;4197:		if (item->numColors > 0 && DC->getValue) 
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2034
ADDRGP4 DC
INDIRP4
CNSTI4 72
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2034
line 4198
;4198:		{
line 4201
;4199:			// if the value is within one of the ranges then set color to that, otherwise leave at default
;4200:			int i;
;4201:			float f = DC->getValue(item->window.ownerDraw);
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 DC
INDIRP4
CNSTI4 72
ADDP4
INDIRP4
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 56
INDIRF4
ASGNF4
line 4203
;4202:
;4203:			for (i = 0; i < item->numColors; i++) 
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRGP4 $2039
JUMPV
LABELV $2036
line 4204
;4204:			{
line 4205
;4205:				if (f >= item->colorRanges[i].low && f <= item->colorRanges[i].high) 
ADDRLP4 64
CNSTI4 24
ADDRLP4 48
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 308
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
LTF4 $2040
ADDRLP4 52
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
GTF4 $2040
line 4206
;4206:				{
line 4207
;4207:					memcpy(&color, &item->colorRanges[i].color, sizeof(color));
ADDRLP4 4
ARGP4
CNSTI4 24
ADDRLP4 48
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 308
ADDP4
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4208
;4208:					break;
ADDRGP4 $2038
JUMPV
LABELV $2040
line 4210
;4209:				}
;4210:			}
LABELV $2037
line 4203
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2039
ADDRLP4 48
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
LTI4 $2036
LABELV $2038
line 4211
;4211:		}
LABELV $2034
line 4213
;4212:
;4213:		if (item->window.flags & WINDOW_HASFOCUS) 
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2042
line 4214
;4214:		{
line 4215
;4215:			lowLight[0] = 0.8 * parent->focusColor[0]; 
ADDRLP4 24
CNSTF4 1061997773
ADDRLP4 20
INDIRP4
CNSTI4 244
ADDP4
INDIRF4
MULF4
ASGNF4
line 4216
;4216:			lowLight[1] = 0.8 * parent->focusColor[1]; 
ADDRLP4 24+4
CNSTF4 1061997773
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
MULF4
ASGNF4
line 4217
;4217:			lowLight[2] = 0.8 * parent->focusColor[2]; 
ADDRLP4 24+8
CNSTF4 1061997773
ADDRLP4 20
INDIRP4
CNSTI4 252
ADDP4
INDIRF4
MULF4
ASGNF4
line 4218
;4218:			lowLight[3] = 0.8 * parent->focusColor[3]; 
ADDRLP4 24+12
CNSTF4 1061997773
ADDRLP4 20
INDIRP4
CNSTI4 256
ADDP4
INDIRF4
MULF4
ASGNF4
line 4219
;4219:			LerpColor(parent->focusColor,lowLight,color,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 48
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 1056964608
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 4220
;4220:		}
ADDRGP4 $2043
JUMPV
LABELV $2042
line 4221
;4221:		else if (item->textStyle == ITEM_TEXTSTYLE_BLINK && !((DC->realTime/BLINK_DIVISOR) & 1)) 
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $2047
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 200
DIVI4
ADDRLP4 48
INDIRI4
BANDI4
CNSTI4 0
NEI4 $2047
line 4222
;4222:		{
line 4223
;4223:			lowLight[0] = 0.8 * item->window.foreColor[0]; 
ADDRLP4 24
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
MULF4
ASGNF4
line 4224
;4224:			lowLight[1] = 0.8 * item->window.foreColor[1]; 
ADDRLP4 24+4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
MULF4
ASGNF4
line 4225
;4225:			lowLight[2] = 0.8 * item->window.foreColor[2]; 
ADDRLP4 24+8
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
MULF4
ASGNF4
line 4226
;4226:			lowLight[3] = 0.8 * item->window.foreColor[3]; 
ADDRLP4 24+12
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
MULF4
ASGNF4
line 4227
;4227:			LerpColor(item->window.foreColor,lowLight,color,0.5+0.5*sin(DC->realTime / PULSE_DIVISOR));
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 52
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 1056964608
ADDRLP4 52
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 4228
;4228:		}
LABELV $2047
LABELV $2043
line 4230
;4229:
;4230:		if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $2052
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $2052
line 4231
;4231:			memcpy(color, parent->disableColor, sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 260
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4232
;4232:		}
LABELV $2052
line 4234
;4233:	
;4234:		if ( item->ownerParam )
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2054
line 4235
;4235:		{
line 4236
;4236:			DC->ownerDrawItem(item->window.rect.x, item->window.rect.y, item->window.rect.w, item->window.rect.h, item->textalignx, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->ownerParam, item->textscale, color, item->window.background, item->textStyle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
CNSTI4 68
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
CALLV
pop
line 4237
;4237:		}
ADDRGP4 $2055
JUMPV
LABELV $2054
line 4238
;4238:		else if (item->text) 
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2056
line 4239
;4239:		{
line 4240
;4240:			Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 4241
;4241:			if (item->text[0]) 
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2058
line 4242
;4242:			{
line 4244
;4243:				// +8 is an offset kludge to properly align owner draw items that have text combined with them
;4244:				DC->ownerDrawItem(item->textRect.x + item->textRect.w + 8, item->window.rect.y, item->window.rect.w, item->window.rect.h, 0, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 0
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
CNSTI4 68
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
CALLV
pop
line 4245
;4245:			} 
ADDRGP4 $2057
JUMPV
LABELV $2058
line 4247
;4246:			else 
;4247:			{
line 4248
;4248:				DC->ownerDrawItem(item->textRect.x + item->textRect.w, item->window.rect.y, item->window.rect.w, item->window.rect.h, 0, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 196
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 0
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
CNSTI4 68
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
CALLV
pop
line 4249
;4249:			}
line 4250
;4250:		} 
ADDRGP4 $2057
JUMPV
LABELV $2056
line 4252
;4251:		else 
;4252:		{
line 4253
;4253:			DC->ownerDrawItem(item->window.rect.x, item->window.rect.y, item->window.rect.w, item->window.rect.h, item->textalignx, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
CNSTI4 68
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
CALLV
pop
line 4254
;4254:		}
LABELV $2057
LABELV $2055
line 4255
;4255:	}
LABELV $2032
line 4256
;4256:}
LABELV $2029
endproc Item_OwnerDraw_Paint 68 56
export Item_Paint
proc Item_Paint 84 24
line 4259
;4257:
;4258:
;4259:void Item_Paint(itemDef_t *item) {
line 4261
;4260:  vec4_t red;
;4261:  menuDef_t *parent = (menuDef_t*)item->parent;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRP4
ASGNP4
line 4262
;4262:  red[0] = red[3] = 1;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+12
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 4263
;4263:  red[1] = red[2] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24
INDIRF4
ASGNF4
line 4265
;4264:
;4265:  if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2064
line 4266
;4266:    return;
ADDRGP4 $2060
JUMPV
LABELV $2064
line 4269
;4267:  }
;4268:
;4269:  if (item->window.flags & WINDOW_ORBITING) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $2066
line 4270
;4270:    if (DC->realTime > item->window.nextTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
LEI4 $2068
line 4273
;4271:      float rx, ry, a, c, s, w, h;
;4272:      
;4273:      item->window.nextTime = DC->realTime + item->window.offsetTime;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 124
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4275
;4274:      // translate
;4275:      w = item->window.rectClient.w / 2;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4276
;4276:      h = item->window.rectClient.h / 2;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4277
;4277:      rx = item->window.rectClient.x + w - item->window.rectEffects.x;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
ADDRLP4 60
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4278
;4278:      ry = item->window.rectClient.y + h - item->window.rectEffects.y;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 52
INDIRF4
ADDF4
ADDRLP4 64
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4279
;4279:      a = 3 * M_PI / 180;
ADDRLP4 36
CNSTF4 1029076816
ASGNF4
line 4280
;4280:  	  c = cos(a);
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 68
INDIRF4
ASGNF4
line 4281
;4281:      s = sin(a);
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 72
INDIRF4
ASGNF4
line 4282
;4282:      item->window.rectClient.x = (rx * c - ry * s) + item->window.rectEffects.x - w;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
SUBF4
ADDRLP4 76
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ADDF4
ADDRLP4 48
INDIRF4
SUBF4
ASGNF4
line 4283
;4283:      item->window.rectClient.y = (rx * s + ry * c) + item->window.rectEffects.y - h;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ADDRLP4 80
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ADDF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 4284
;4284:      Item_UpdatePosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_UpdatePosition
CALLV
pop
line 4286
;4285:
;4286:    }
LABELV $2068
line 4287
;4287:  }
LABELV $2066
line 4290
;4288:
;4289:
;4290:  if (item->window.flags & WINDOW_INTRANSITION) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2070
line 4291
;4291:    if (DC->realTime > item->window.nextTime) {
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
LEI4 $2072
line 4292
;4292:      int done = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 4293
;4293:      item->window.nextTime = DC->realTime + item->window.offsetTime;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 124
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4295
;4294:			// transition the x,y
;4295:			if (item->window.rectClient.x == item->window.rectEffects.x) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
NEF4 $2074
line 4296
;4296:				done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4297
;4297:			} else {
ADDRGP4 $2075
JUMPV
LABELV $2074
line 4298
;4298:				if (item->window.rectClient.x < item->window.rectEffects.x) {
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
GEF4 $2076
line 4299
;4299:					item->window.rectClient.x += item->window.rectEffects2.x;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4300
;4300:					if (item->window.rectClient.x > item->window.rectEffects.x) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
LEF4 $2077
line 4301
;4301:						item->window.rectClient.x = item->window.rectEffects.x;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ASGNF4
line 4302
;4302:						done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4303
;4303:					}
line 4304
;4304:				} else {
ADDRGP4 $2077
JUMPV
LABELV $2076
line 4305
;4305:					item->window.rectClient.x -= item->window.rectEffects2.x;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4306
;4306:					if (item->window.rectClient.x < item->window.rectEffects.x) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
GEF4 $2080
line 4307
;4307:						item->window.rectClient.x = item->window.rectEffects.x;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ASGNF4
line 4308
;4308:						done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4309
;4309:					}
LABELV $2080
line 4310
;4310:				}
LABELV $2077
line 4311
;4311:			}
LABELV $2075
line 4312
;4312:			if (item->window.rectClient.y == item->window.rectEffects.y) {
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
NEF4 $2082
line 4313
;4313:				done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4314
;4314:			} else {
ADDRGP4 $2083
JUMPV
LABELV $2082
line 4315
;4315:				if (item->window.rectClient.y < item->window.rectEffects.y) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
GEF4 $2084
line 4316
;4316:					item->window.rectClient.y += item->window.rectEffects2.y;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4317
;4317:					if (item->window.rectClient.y > item->window.rectEffects.y) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
LEF4 $2085
line 4318
;4318:						item->window.rectClient.y = item->window.rectEffects.y;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ASGNF4
line 4319
;4319:						done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4320
;4320:					}
line 4321
;4321:				} else {
ADDRGP4 $2085
JUMPV
LABELV $2084
line 4322
;4322:					item->window.rectClient.y -= item->window.rectEffects2.y;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4323
;4323:					if (item->window.rectClient.y < item->window.rectEffects.y) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
GEF4 $2088
line 4324
;4324:						item->window.rectClient.y = item->window.rectEffects.y;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ASGNF4
line 4325
;4325:						done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4326
;4326:					}
LABELV $2088
line 4327
;4327:				}
LABELV $2085
line 4328
;4328:			}
LABELV $2083
line 4329
;4329:			if (item->window.rectClient.w == item->window.rectEffects.w) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
NEF4 $2090
line 4330
;4330:				done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4331
;4331:			} else {
ADDRGP4 $2091
JUMPV
LABELV $2090
line 4332
;4332:				if (item->window.rectClient.w < item->window.rectEffects.w) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
GEF4 $2092
line 4333
;4333:					item->window.rectClient.w += item->window.rectEffects2.w;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4334
;4334:					if (item->window.rectClient.w > item->window.rectEffects.w) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
LEF4 $2093
line 4335
;4335:						item->window.rectClient.w = item->window.rectEffects.w;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ASGNF4
line 4336
;4336:						done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4337
;4337:					}
line 4338
;4338:				} else {
ADDRGP4 $2093
JUMPV
LABELV $2092
line 4339
;4339:					item->window.rectClient.w -= item->window.rectEffects2.w;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4340
;4340:					if (item->window.rectClient.w < item->window.rectEffects.w) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
GEF4 $2096
line 4341
;4341:						item->window.rectClient.w = item->window.rectEffects.w;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ASGNF4
line 4342
;4342:						done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4343
;4343:					}
LABELV $2096
line 4344
;4344:				}
LABELV $2093
line 4345
;4345:			}
LABELV $2091
line 4346
;4346:			if (item->window.rectClient.h == item->window.rectEffects.h) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
NEF4 $2098
line 4347
;4347:				done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4348
;4348:			} else {
ADDRGP4 $2099
JUMPV
LABELV $2098
line 4349
;4349:				if (item->window.rectClient.h < item->window.rectEffects.h) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
GEF4 $2100
line 4350
;4350:					item->window.rectClient.h += item->window.rectEffects2.h;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4351
;4351:					if (item->window.rectClient.h > item->window.rectEffects.h) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
LEF4 $2101
line 4352
;4352:						item->window.rectClient.h = item->window.rectEffects.h;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
line 4353
;4353:						done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4354
;4354:					}
line 4355
;4355:				} else {
ADDRGP4 $2101
JUMPV
LABELV $2100
line 4356
;4356:					item->window.rectClient.h -= item->window.rectEffects2.h;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4357
;4357:					if (item->window.rectClient.h < item->window.rectEffects.h) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
GEF4 $2104
line 4358
;4358:						item->window.rectClient.h = item->window.rectEffects.h;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
line 4359
;4359:						done++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4360
;4360:					}
LABELV $2104
line 4361
;4361:				}
LABELV $2101
line 4362
;4362:			}
LABELV $2099
line 4364
;4363:
;4364:      Item_UpdatePosition(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_UpdatePosition
CALLV
pop
line 4366
;4365:
;4366:      if (done == 4) {
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $2106
line 4367
;4367:        item->window.flags &= ~WINDOW_INTRANSITION;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 4368
;4368:      }
LABELV $2106
line 4370
;4369:
;4370:    }
LABELV $2072
line 4371
;4371:  }
LABELV $2070
line 4373
;4372:
;4373:	if (item->window.ownerDrawFlags && DC->ownerDrawVisible) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2108
ADDRGP4 DC
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2108
line 4374
;4374:		if (!DC->ownerDrawVisible(item->window.ownerDrawFlags)) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 DC
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2110
line 4375
;4375:			item->window.flags &= ~WINDOW_VISIBLE;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 4376
;4376:		} else {
ADDRGP4 $2111
JUMPV
LABELV $2110
line 4377
;4377:			item->window.flags |= WINDOW_VISIBLE;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 4378
;4378:		}
LABELV $2111
line 4379
;4379:	}
LABELV $2108
line 4381
;4380:
;4381:	if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE)) {
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 12
BANDI4
CNSTI4 0
EQI4 $2112
line 4382
;4382:		if (!Item_EnableShowViaCvar(item, CVAR_SHOW)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 28
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2114
line 4383
;4383:			return;
ADDRGP4 $2060
JUMPV
LABELV $2114
line 4385
;4384:		}
;4385:	}
LABELV $2112
line 4387
;4386:
;4387:  if (item->window.flags & WINDOW_TIMEDVISIBLE) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $2116
line 4389
;4388:
;4389:	}
LABELV $2116
line 4391
;4390:
;4391:  if (!(item->window.flags & WINDOW_VISIBLE)) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $2118
line 4392
;4392:    return;
ADDRGP4 $2060
JUMPV
LABELV $2118
line 4396
;4393:  }
;4394:
;4395:  // paint the rect first.. 
;4396:  Window_Paint(&item->window, parent->fadeAmount , parent->fadeClamp, parent->fadeCycle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Window_Paint
CALLV
pop
line 4398
;4397:
;4398:  if (debugMode) {
ADDRGP4 debugMode
INDIRI4
CNSTI4 0
EQI4 $2120
line 4400
;4399:		vec4_t color;
;4400:		rectDef_t *r = Item_CorrectedTextRect(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Item_CorrectedTextRect
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 52
INDIRP4
ASGNP4
line 4401
;4401:    color[1] = color[3] = 1;
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
ADDRLP4 36+12
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 56
INDIRF4
ASGNF4
line 4402
;4402:    color[0] = color[2] = 0;
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 36+8
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 36
ADDRLP4 60
INDIRF4
ASGNF4
line 4403
;4403:    DC->drawRect(r->x, r->y, r->w, r->h, 1, color);
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 4404
;4404:  }
LABELV $2120
line 4408
;4405:
;4406:  //DC->drawRect(item->window.rect.x, item->window.rect.y, item->window.rect.w, item->window.rect.h, 1, red);
;4407:
;4408:  switch (item->type) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $2126
ADDRLP4 32
INDIRI4
CNSTI4 13
GTI4 $2126
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2140
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2140
address $2129
address $2129
address $2126
address $2126
address $2132
address $2126
address $2134
address $2135
address $2128
address $2132
address $2139
address $2136
address $2137
address $2138
code
LABELV $2128
line 4410
;4409:    case ITEM_TYPE_OWNERDRAW:
;4410:      Item_OwnerDraw_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_OwnerDraw_Paint
CALLV
pop
line 4411
;4411:      break;
ADDRGP4 $2126
JUMPV
LABELV $2129
line 4414
;4412:    case ITEM_TYPE_TEXT:
;4413:    case ITEM_TYPE_BUTTON:
;4414:      Item_Text_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Text_Paint
CALLV
pop
line 4415
;4415:      break;
ADDRGP4 $2126
JUMPV
line 4417
;4416:    case ITEM_TYPE_RADIOBUTTON:
;4417:      break;
line 4419
;4418:    case ITEM_TYPE_CHECKBOX:
;4419:      break;
LABELV $2132
line 4422
;4420:    case ITEM_TYPE_EDITFIELD:
;4421:    case ITEM_TYPE_NUMERICFIELD:
;4422:      Item_TextField_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_TextField_Paint
CALLV
pop
line 4423
;4423:      break;
ADDRGP4 $2126
JUMPV
line 4425
;4424:    case ITEM_TYPE_COMBO:
;4425:      break;
LABELV $2134
line 4427
;4426:    case ITEM_TYPE_LISTBOX:
;4427:      Item_ListBox_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ListBox_Paint
CALLV
pop
line 4428
;4428:      break;
ADDRGP4 $2126
JUMPV
LABELV $2135
line 4433
;4429:    //case ITEM_TYPE_IMAGE:
;4430:    //  Item_Image_Paint(item);
;4431:    //  break;
;4432:    case ITEM_TYPE_MODEL:
;4433:      Item_Model_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Model_Paint
CALLV
pop
line 4434
;4434:      break;
ADDRGP4 $2126
JUMPV
LABELV $2136
line 4436
;4435:    case ITEM_TYPE_YESNO:
;4436:      Item_YesNo_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_YesNo_Paint
CALLV
pop
line 4437
;4437:      break;
ADDRGP4 $2126
JUMPV
LABELV $2137
line 4439
;4438:    case ITEM_TYPE_MULTI:
;4439:      Item_Multi_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Multi_Paint
CALLV
pop
line 4440
;4440:      break;
ADDRGP4 $2126
JUMPV
LABELV $2138
line 4442
;4441:    case ITEM_TYPE_BIND:
;4442:      Item_Bind_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Bind_Paint
CALLV
pop
line 4443
;4443:      break;
ADDRGP4 $2126
JUMPV
LABELV $2139
line 4445
;4444:    case ITEM_TYPE_SLIDER:
;4445:      Item_Slider_Paint(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_Slider_Paint
CALLV
pop
line 4446
;4446:      break;
line 4448
;4447:    default:
;4448:      break;
LABELV $2126
line 4451
;4449:  }
;4450:
;4451:}
LABELV $2060
endproc Item_Paint 84 24
export Menu_Init
proc Menu_Init 0 12
line 4453
;4452:
;4453:void Menu_Init(menuDef_t *menu) {
line 4454
;4454:	memset(menu, 0, sizeof(menuDef_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1300
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4455
;4455:	menu->cursorItem = -1;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 -1
ASGNI4
line 4456
;4456:	menu->fadeAmount = DC->Assets.fadeAmount;
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 61964
ADDP4
INDIRF4
ASGNF4
line 4457
;4457:	menu->fadeClamp = DC->Assets.fadeClamp;
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 61956
ADDP4
INDIRF4
ASGNF4
line 4458
;4458:	menu->fadeCycle = DC->Assets.fadeCycle;
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRGP4 DC
INDIRP4
CNSTI4 61960
ADDP4
INDIRI4
ASGNI4
line 4459
;4459:	Window_Init(&menu->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_Init
CALLV
pop
line 4460
;4460:}
LABELV $2141
endproc Menu_Init 0 12
export Menu_GetFocusedItem
proc Menu_GetFocusedItem 8 0
line 4462
;4461:
;4462:itemDef_t *Menu_GetFocusedItem(menuDef_t *menu) {
line 4464
;4463:  int i;
;4464:  if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2143
line 4465
;4465:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2148
JUMPV
LABELV $2145
line 4466
;4466:      if (menu->items[i]->window.flags & WINDOW_HASFOCUS) {
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2149
line 4467
;4467:        return menu->items[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $2142
JUMPV
LABELV $2149
line 4469
;4468:      }
;4469:    }
LABELV $2146
line 4465
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2148
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $2145
line 4470
;4470:  }
LABELV $2143
line 4471
;4471:  return NULL;
CNSTP4 0
RETP4
LABELV $2142
endproc Menu_GetFocusedItem 8 0
export Menu_GetFocused
proc Menu_GetFocused 12 0
line 4474
;4472:}
;4473:
;4474:menuDef_t *Menu_GetFocused() {
line 4476
;4475:  int i;
;4476:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2155
JUMPV
LABELV $2152
line 4477
;4477:    if (Menus[i].window.flags & WINDOW_HASFOCUS && Menus[i].window.flags & WINDOW_VISIBLE) {
ADDRLP4 4
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 Menus+76
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $2156
ADDRLP4 4
INDIRI4
ADDRGP4 Menus+76
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $2156
line 4478
;4478:      return &Menus[i];
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
RETP4
ADDRGP4 $2151
JUMPV
LABELV $2156
line 4480
;4479:    }
;4480:  }
LABELV $2153
line 4476
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2155
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2152
line 4481
;4481:  return NULL;
CNSTP4 0
RETP4
LABELV $2151
endproc Menu_GetFocused 12 0
export Menu_ScrollFeeder
proc Menu_ScrollFeeder 12 16
line 4484
;4482:}
;4483:
;4484:void Menu_ScrollFeeder(menuDef_t *menu, int feeder, qboolean down) {
line 4485
;4485:	if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2161
line 4487
;4486:		int i;
;4487:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2166
JUMPV
LABELV $2163
line 4488
;4488:			if (menu->items[i]->special == feeder) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
NEF4 $2167
line 4489
;4489:				Item_ListBox_HandleKey(menu->items[i], (down) ? K_DOWNARROW : K_UPARROW, qtrue, qtrue);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $2170
ADDRLP4 4
CNSTI4 133
ASGNI4
ADDRGP4 $2171
JUMPV
LABELV $2170
ADDRLP4 4
CNSTI4 132
ASGNI4
LABELV $2171
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Item_ListBox_HandleKey
CALLI4
pop
line 4490
;4490:				return;
ADDRGP4 $2160
JUMPV
LABELV $2167
line 4492
;4491:			}
;4492:		}
LABELV $2164
line 4487
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2166
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $2163
line 4493
;4493:	}
LABELV $2161
line 4494
;4494:}
LABELV $2160
endproc Menu_ScrollFeeder 12 16
export Menu_SetFeederSelection
proc Menu_SetFeederSelection 8 8
line 4498
;4495:
;4496:
;4497:
;4498:void Menu_SetFeederSelection(menuDef_t *menu, int feeder, int index, const char *name) {
line 4499
;4499:	if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2173
line 4500
;4500:		if (name == NULL) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2175
line 4501
;4501:			menu = Menu_GetFocused();
ADDRLP4 0
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
line 4502
;4502:		} else {
ADDRGP4 $2176
JUMPV
LABELV $2175
line 4503
;4503:			menu = Menus_FindByName(name);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
line 4504
;4504:		}
LABELV $2176
line 4505
;4505:	}
LABELV $2173
line 4507
;4506:
;4507:	if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2177
line 4509
;4508:		int i;
;4509:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2182
JUMPV
LABELV $2179
line 4510
;4510:			if (menu->items[i]->special == feeder) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
NEF4 $2183
line 4511
;4511:				if (index == 0) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $2185
line 4512
;4512:					listBoxDef_t *listPtr = (listBoxDef_t*)menu->items[i]->typeData;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4513
;4513:					listPtr->cursorPos = 0;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 4514
;4514:					listPtr->startPos = 0;
ADDRLP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4515
;4515:				}
LABELV $2185
line 4516
;4516:				menu->items[i]->cursorPos = index;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 552
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 4517
;4517:				DC->feederSelection(menu->items[i]->special, menu->items[i]->cursorPos);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
CALLV
pop
line 4518
;4518:				return;
ADDRGP4 $2172
JUMPV
LABELV $2183
line 4520
;4519:			}
;4520:		}
LABELV $2180
line 4509
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2182
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $2179
line 4521
;4521:	}
LABELV $2177
line 4522
;4522:}
LABELV $2172
endproc Menu_SetFeederSelection 8 8
export Menus_AnyFullScreenVisible
proc Menus_AnyFullScreenVisible 12 0
line 4524
;4523:
;4524:qboolean Menus_AnyFullScreenVisible() {
line 4526
;4525:  int i;
;4526:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2191
JUMPV
LABELV $2188
line 4527
;4527:    if (Menus[i].window.flags & WINDOW_VISIBLE && Menus[i].fullScreen) {
ADDRLP4 4
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 Menus+76
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $2192
ADDRLP4 4
INDIRI4
ADDRGP4 Menus+200
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2192
line 4528
;4528:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2187
JUMPV
LABELV $2192
line 4530
;4529:    }
;4530:  }
LABELV $2189
line 4526
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2191
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2188
line 4531
;4531:  return qfalse;
CNSTI4 0
RETI4
LABELV $2187
endproc Menus_AnyFullScreenVisible 12 0
export Menus_ActivateByName
proc Menus_ActivateByName 28 8
line 4534
;4532:}
;4533:
;4534:menuDef_t *Menus_ActivateByName(const char *p) {
line 4536
;4535:  int i;
;4536:  menuDef_t *m = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 4537
;4537:	menuDef_t *focus = Menu_GetFocused();
ADDRLP4 12
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 4538
;4538:  for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2200
JUMPV
LABELV $2197
line 4539
;4539:    if (Q_stricmp(Menus[i].window.name, p) == 0) {
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+40
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2201
line 4540
;4540:	    m = &Menus[i];
ADDRLP4 4
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ASGNP4
line 4541
;4541:			Menus_Activate(m);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Menus_Activate
CALLV
pop
line 4542
;4542:			if (openMenuCount < MAX_OPEN_MENUS && focus != NULL) {
ADDRGP4 openMenuCount
INDIRI4
CNSTI4 16
GEI4 $2202
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2202
line 4543
;4543:				menuStack[openMenuCount++] = focus;
ADDRLP4 24
ADDRGP4 openMenuCount
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 menuStack
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 4544
;4544:			}
line 4545
;4545:    } else {
ADDRGP4 $2202
JUMPV
LABELV $2201
line 4546
;4546:      Menus[i].window.flags &= ~WINDOW_HASFOCUS;
ADDRLP4 20
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+76
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 4547
;4547:    }
LABELV $2202
line 4548
;4548:  }
LABELV $2198
line 4538
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2200
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2197
line 4549
;4549:	Display_CloseCinematics();
ADDRGP4 Display_CloseCinematics
CALLV
pop
line 4550
;4550:  return m;
ADDRLP4 4
INDIRP4
RETP4
LABELV $2196
endproc Menus_ActivateByName 28 8
export Item_Init
proc Item_Init 0 12
line 4554
;4551:}
;4552:
;4553:
;4554:void Item_Init(itemDef_t *item) {
line 4555
;4555:	memset(item, 0, sizeof(itemDef_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 568
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4556
;4556:	item->textscale = 0.55f;
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
CNSTF4 1057803469
ASGNF4
line 4557
;4557:	Window_Init(&item->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_Init
CALLV
pop
line 4558
;4558:}
LABELV $2207
endproc Item_Init 0 12
export Menu_HandleMouseMove
proc Menu_HandleMouseMove 52 12
line 4560
;4559:
;4560:void Menu_HandleMouseMove(menuDef_t *menu, float x, float y) {
line 4562
;4561:  int i, pass;
;4562:  qboolean focusSet = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 4565
;4563:
;4564:  itemDef_t *overItem;
;4565:  if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2209
line 4566
;4566:    return;
ADDRGP4 $2208
JUMPV
LABELV $2209
line 4569
;4567:  }
;4568:
;4569:  if (!(menu->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
NEI4 $2211
line 4570
;4570:    return;
ADDRGP4 $2208
JUMPV
LABELV $2211
line 4573
;4571:  }
;4572:
;4573:	if (itemCapture) {
ADDRGP4 itemCapture
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2213
line 4575
;4574:		//Item_MouseMove(itemCapture, x, y);
;4575:		return;
ADDRGP4 $2208
JUMPV
LABELV $2213
line 4578
;4576:	}
;4577:
;4578:	if (g_waitingForKey || g_editingField) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 g_waitingForKey
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $2217
ADDRGP4 g_editingField
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2215
LABELV $2217
line 4579
;4579:		return;
ADDRGP4 $2208
JUMPV
LABELV $2215
line 4584
;4580:	}
;4581:
;4582:  // FIXME: this is the whole issue of focus vs. mouse over.. 
;4583:  // need a better overall solution as i don't like going through everything twice
;4584:  for (pass = 0; pass < 2; pass++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2218
line 4585
;4585:    for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2225
JUMPV
LABELV $2222
line 4589
;4586:      // turn off focus each item
;4587:      // menu->items[i].window.flags &= ~WINDOW_HASFOCUS;
;4588:
;4589:      if (!(menu->items[i]->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
NEI4 $2226
line 4590
;4590:        continue;
ADDRGP4 $2223
JUMPV
LABELV $2226
line 4594
;4591:      }
;4592:
;4593:			// items can be enabled and disabled based on cvars
;4594:			if (menu->items[i]->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(menu->items[i], CVAR_ENABLE)) {
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $2228
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2228
line 4595
;4595:				continue;
ADDRGP4 $2223
JUMPV
LABELV $2228
line 4598
;4596:			}
;4597:
;4598:			if (menu->items[i]->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(menu->items[i], CVAR_SHOW)) {
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 12
BANDI4
CNSTI4 0
EQI4 $2230
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 32
ADDRGP4 Item_EnableShowViaCvar
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2230
line 4599
;4599:				continue;
ADDRGP4 $2223
JUMPV
LABELV $2230
line 4604
;4600:			}
;4601:
;4602:
;4603:
;4604:      if (Rect_ContainsPoint(&menu->items[i]->window.rect, x, y)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2232
line 4605
;4605:				if (pass == 1) {
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $2233
line 4606
;4606:					overItem = menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
line 4607
;4607:					if (overItem->type == ITEM_TYPE_TEXT && overItem->text) {
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2236
ADDRLP4 4
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2236
line 4608
;4608:						if (!Rect_ContainsPoint(Item_CorrectedTextRect(overItem), x, y)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Item_CorrectedTextRect
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $2238
line 4609
;4609:							continue;
ADDRGP4 $2223
JUMPV
LABELV $2238
line 4611
;4610:						}
;4611:					}
LABELV $2236
line 4613
;4612:					// if we are over an item
;4613:					if (IsVisible(overItem->window.flags)) {
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 IsVisible
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2233
line 4615
;4614:						// different one
;4615:						Item_MouseEnter(overItem, x, y);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 Item_MouseEnter
CALLV
pop
line 4619
;4616:						// Item_SetMouseOver(overItem, qtrue);
;4617:
;4618:						// if item is not a decoration see if it can take focus
;4619:						if (!focusSet) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2233
line 4620
;4620:							focusSet = Item_SetFocus(overItem, x, y);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Item_SetFocus
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 4621
;4621:						}
line 4622
;4622:					}
line 4623
;4623:				}
line 4624
;4624:      } else if (menu->items[i]->window.flags & WINDOW_MOUSEOVER) {
ADDRGP4 $2233
JUMPV
LABELV $2232
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2244
line 4625
;4625:          Item_MouseLeave(menu->items[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_MouseLeave
CALLV
pop
line 4626
;4626:          Item_SetMouseOver(menu->items[i], qfalse);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Item_SetMouseOver
CALLV
pop
line 4627
;4627:      }
LABELV $2244
LABELV $2233
line 4628
;4628:    }
LABELV $2223
line 4585
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2225
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $2222
line 4629
;4629:  }
LABELV $2219
line 4584
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $2218
line 4631
;4630:
;4631:}
LABELV $2208
endproc Menu_HandleMouseMove 52 12
export Menu_Paint
proc Menu_Paint 48 24
line 4633
;4632:
;4633:void Menu_Paint(menuDef_t *menu, qboolean forcePaint) {
line 4636
;4634:	int i;
;4635:
;4636:	if (menu == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2247
line 4637
;4637:		return;
ADDRGP4 $2246
JUMPV
LABELV $2247
line 4640
;4638:	}
;4639:
;4640:	if (!(menu->window.flags & WINDOW_VISIBLE) &&  !forcePaint) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $2249
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2249
line 4641
;4641:		return;
ADDRGP4 $2246
JUMPV
LABELV $2249
line 4644
;4642:	}
;4643:
;4644:	if (menu->window.ownerDrawFlags && DC->ownerDrawVisible && !DC->ownerDrawVisible(menu->window.ownerDrawFlags)) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2251
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2251
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2251
line 4645
;4645:		return;
ADDRGP4 $2246
JUMPV
LABELV $2251
line 4648
;4646:	}
;4647:	
;4648:	if (forcePaint) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $2253
line 4649
;4649:		menu->window.flags |= WINDOW_FORCED;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1048576
BORI4
ASGNI4
line 4650
;4650:	}
LABELV $2253
line 4653
;4651:
;4652:	// draw the background if necessary
;4653:	if (menu->fullScreen) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2255
line 4656
;4654:		// implies a background shader
;4655:		// FIXME: make sure we have a default shader if fullscreen is set with no background
;4656:		DC->drawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, menu->window.background );
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
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 4657
;4657:	} else if (menu->window.background) {
ADDRGP4 $2256
JUMPV
LABELV $2255
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2257
line 4660
;4658:		// this allows a background shader without being full screen
;4659:		//UI_DrawHandlePic(menu->window.rect.x, menu->window.rect.y, menu->window.rect.w, menu->window.rect.h, menu->backgroundShader);
;4660:	}
LABELV $2257
LABELV $2256
line 4663
;4661:
;4662:	// paint the background and or border
;4663:	Window_Paint(&menu->window, menu->fadeAmount, menu->fadeClamp, menu->fadeCycle );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Window_Paint
CALLV
pop
line 4665
;4664:
;4665:	for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2262
JUMPV
LABELV $2259
line 4666
;4666:		Item_Paint(menu->items[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_Paint
CALLV
pop
line 4667
;4667:	}
LABELV $2260
line 4665
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2262
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $2259
line 4669
;4668:
;4669:	if (debugMode) {
ADDRGP4 debugMode
INDIRI4
CNSTI4 0
EQI4 $2263
line 4671
;4670:		vec4_t color;
;4671:		color[0] = color[2] = color[3] = 1;
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
ADDRLP4 24+12
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 40
INDIRF4
ASGNF4
line 4672
;4672:		color[1] = 0;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 4673
;4673:		DC->drawRect(menu->window.rect.x, menu->window.rect.y, menu->window.rect.w, menu->window.rect.h, 1, color);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 24
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CALLV
pop
line 4674
;4674:	}
LABELV $2263
line 4675
;4675:}
LABELV $2246
endproc Menu_Paint 48 24
export Item_ValidateTypeData
proc Item_ValidateTypeData 8 12
line 4682
;4676:
;4677:/*
;4678:===============
;4679:Item_ValidateTypeData
;4680:===============
;4681:*/
;4682:void Item_ValidateTypeData(itemDef_t *item) {
line 4683
;4683:	if (item->typeData) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2269
line 4684
;4684:		return;
ADDRGP4 $2268
JUMPV
LABELV $2269
line 4687
;4685:	}
;4686:
;4687:	if (item->type == ITEM_TYPE_LISTBOX) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2271
line 4688
;4688:		item->typeData = UI_Alloc(sizeof(listBoxDef_t));
CNSTI4 232
ARGI4
ADDRLP4 0
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 4689
;4689:		memset(item->typeData, 0, sizeof(listBoxDef_t));
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4690
;4690:	} else if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD || item->type == ITEM_TYPE_YESNO || item->type == ITEM_TYPE_BIND || item->type == ITEM_TYPE_SLIDER || item->type == ITEM_TYPE_TEXT) {
ADDRGP4 $2272
JUMPV
LABELV $2271
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $2279
ADDRLP4 0
INDIRI4
CNSTI4 9
EQI4 $2279
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $2279
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2279
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2279
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2273
LABELV $2279
line 4691
;4691:		item->typeData = UI_Alloc(sizeof(editFieldDef_t));
CNSTI4 28
ARGI4
ADDRLP4 4
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 4692
;4692:		memset(item->typeData, 0, sizeof(editFieldDef_t));
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 28
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4693
;4693:		if (item->type == ITEM_TYPE_EDITFIELD) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2274
line 4694
;4694:			if (!((editFieldDef_t *) item->typeData)->maxPaintChars) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2274
line 4695
;4695:				((editFieldDef_t *) item->typeData)->maxPaintChars = MAX_EDITFIELD;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 256
ASGNI4
line 4696
;4696:			}
line 4697
;4697:		}
line 4698
;4698:	} else if (item->type == ITEM_TYPE_MULTI) {
ADDRGP4 $2274
JUMPV
LABELV $2273
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 12
NEI4 $2284
line 4699
;4699:		item->typeData = UI_Alloc(sizeof(multiDef_t));
CNSTI4 392
ARGI4
ADDRLP4 4
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 4700
;4700:	} else if (item->type == ITEM_TYPE_MODEL) {
ADDRGP4 $2285
JUMPV
LABELV $2284
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 7
NEI4 $2286
line 4701
;4701:		item->typeData = UI_Alloc(sizeof(modelDef_t));
CNSTI4 28
ARGI4
ADDRLP4 4
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 4702
;4702:	}
LABELV $2286
LABELV $2285
LABELV $2274
LABELV $2272
line 4703
;4703:}
LABELV $2268
endproc Item_ValidateTypeData 8 12
export KeywordHash_Key
proc KeywordHash_Key 20 0
line 4720
;4704:
;4705:/*
;4706:===============
;4707:Keyword Hash
;4708:===============
;4709:*/
;4710:
;4711:#define KEYWORDHASH_SIZE	512
;4712:
;4713:typedef struct keywordHash_s
;4714:{
;4715:	char *keyword;
;4716:	qboolean (*func)(itemDef_t *item, int handle);
;4717:	struct keywordHash_s *next;
;4718:} keywordHash_t;
;4719:
;4720:int KeywordHash_Key(char *keyword) {
line 4723
;4721:	int register hash, i;
;4722:
;4723:	hash = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4725
;4724:
;4725:	if (!keyword)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2289
line 4726
;4726:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2288
JUMPV
LABELV $2289
line 4728
;4727:
;4728:	for (i = 0; keyword[i] != '\0'; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2294
JUMPV
LABELV $2291
line 4729
;4729:		if (keyword[i] >= 'A' && keyword[i] <= 'Z')
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 65
LTI4 $2295
ADDRLP4 8
INDIRI4
CNSTI4 90
GTI4 $2295
line 4730
;4730:			hash += (keyword[i] + ('a' - 'A')) * (119 + i);
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
ADDI4
ADDRLP4 4
INDIRI4
CNSTI4 119
ADDI4
MULI4
ADDI4
ASGNI4
ADDRGP4 $2296
JUMPV
LABELV $2295
line 4732
;4731:		else
;4732:			hash += keyword[i] * (119 + i);
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
CNSTI4 119
ADDI4
MULI4
ADDI4
ASGNI4
LABELV $2296
line 4733
;4733:	}
LABELV $2292
line 4728
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2294
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2291
line 4734
;4734:	hash = (hash ^ (hash >> 10) ^ (hash >> 20)) & (KEYWORDHASH_SIZE-1);
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 10
RSHI4
BXORI4
ADDRLP4 0
INDIRI4
CNSTI4 20
RSHI4
BXORI4
CNSTI4 511
BANDI4
ASGNI4
line 4735
;4735:	return hash;
ADDRLP4 0
INDIRI4
RETI4
LABELV $2288
endproc KeywordHash_Key 20 0
export KeywordHash_Add
proc KeywordHash_Add 8 4
line 4738
;4736:}
;4737:
;4738:void KeywordHash_Add(keywordHash_t *table[], keywordHash_t *key) {
line 4741
;4739:	int hash;
;4740:
;4741:	hash = KeywordHash_Key(key->keyword);
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 KeywordHash_Key
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 4747
;4742:/*
;4743:	if (table[hash]) {
;4744:		int collision = qtrue;
;4745:	}
;4746:*/
;4747:	key->next = table[hash];
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 4748
;4748:	table[hash] = key;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 4749
;4749:}
LABELV $2297
endproc KeywordHash_Add 8 4
export menuParse_Find
proc menuParse_Find 8 8
line 4754
;4750:extern keywordHash_t itemParseKeywords[];
;4751:extern keywordHash_t menuParseKeywords[];
;4752:
;4753:keywordHash_t *menuParse_Find(  char *keyword)
;4754:{ 
line 4757
;4755:	int i;
;4756:	
;4757:	for (i = 0; menuParseKeywords[i].keyword; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2302
JUMPV
LABELV $2299
line 4758
;4758:		if (!Q_stricmp( menuParseKeywords[i].keyword , keyword ) )
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 menuParseKeywords
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2303
line 4759
;4759:			return &menuParseKeywords[i];
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 menuParseKeywords
ADDP4
RETP4
ADDRGP4 $2298
JUMPV
LABELV $2303
line 4760
;4760:	}
LABELV $2300
line 4757
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2302
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 menuParseKeywords
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2299
line 4761
;4761:	return NULL;/*
CNSTP4 0
RETP4
LABELV $2298
endproc menuParse_Find 8 8
export itemParse_Find
proc itemParse_Find 8 8
line 4772
;4762:
;4763: itemParseKeywords
;4764:	hash = KeywordHash_Key(keyword);
;4765:	for (key = table[hash]; key; key = key->next) {
;4766:		if (!Q_stricmp(key->keyword, keyword))
;4767:			return key;
;4768:	} 
;4769:	return NULL;*/
;4770:}
;4771:keywordHash_t *itemParse_Find(  char *keyword)
;4772:{ 
line 4775
;4773:	int i;
;4774:	
;4775:	for (i = 0; itemParseKeywords[i].keyword; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2309
JUMPV
LABELV $2306
line 4776
;4776:		if (!Q_stricmp( itemParseKeywords[i].keyword , keyword ) )
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 itemParseKeywords
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2310
line 4777
;4777:			return &itemParseKeywords[i];
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 itemParseKeywords
ADDP4
RETP4
ADDRGP4 $2305
JUMPV
LABELV $2310
line 4778
;4778:	}
LABELV $2307
line 4775
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2309
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 itemParseKeywords
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2306
line 4779
;4779:	return NULL;/*
CNSTP4 0
RETP4
LABELV $2305
endproc itemParse_Find 8 8
export KeywordHash_Find
proc KeywordHash_Find 16 8
line 4791
;4780:
;4781: itemParseKeywords
;4782:	hash = KeywordHash_Key(keyword);
;4783:	for (key = table[hash]; key; key = key->next) {
;4784:		if (!Q_stricmp(key->keyword, keyword))
;4785:			return key;
;4786:	} 
;4787:	return NULL;*/
;4788:}
;4789:
;4790:keywordHash_t *KeywordHash_Find(keywordHash_t *table[], char *keyword)
;4791:{
line 4796
;4792:	
;4793:	keywordHash_t *key;
;4794:	int hash;
;4795: 
;4796:	hash = KeywordHash_Key(keyword);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 KeywordHash_Key
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 4797
;4797:	for (key = table[hash]; key; key = key->next) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $2316
JUMPV
LABELV $2313
line 4798
;4798:		if (!Q_stricmp(key->keyword, keyword))
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2317
line 4799
;4799:			return key;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $2312
JUMPV
LABELV $2317
line 4800
;4800:	} 
LABELV $2314
line 4797
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
LABELV $2316
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2313
line 4801
;4801:	return NULL;
CNSTP4 0
RETP4
LABELV $2312
endproc KeywordHash_Find 16 8
export ItemParse_name
proc ItemParse_name 4 8
line 4811
;4802:}
;4803:
;4804:/*
;4805:===============
;4806:Item Keyword Parse functions
;4807:===============
;4808:*/
;4809:
;4810:// name <string>
;4811:qboolean ItemParse_name( itemDef_t *item, int handle ) {
line 4812
;4812:	if (!PC_String_Parse(handle, &item->window.name)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2320
line 4813
;4813:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2319
JUMPV
LABELV $2320
line 4815
;4814:	}
;4815:	return qtrue;
CNSTI4 1
RETI4
LABELV $2319
endproc ItemParse_name 4 8
export ItemParse_focusSound
proc ItemParse_focusSound 12 8
line 4819
;4816:}
;4817:
;4818:// name <string>
;4819:qboolean ItemParse_focusSound( itemDef_t *item, int handle ) {
line 4821
;4820:	const char *temp;
;4821:	if (!PC_String_Parse(handle, &temp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2323
line 4822
;4822:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2322
JUMPV
LABELV $2323
line 4824
;4823:	}
;4824:	item->focusSound = DC->registerSound(temp, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 172
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4825
;4825:	return qtrue;
CNSTI4 1
RETI4
LABELV $2322
endproc ItemParse_focusSound 12 8
export ItemParse_text
proc ItemParse_text 4 8
line 4830
;4826:}
;4827:
;4828:
;4829:// text <string>
;4830:qboolean ItemParse_text( itemDef_t *item, int handle ) {
line 4831
;4831:	if (!PC_String_Parse(handle, &item->text)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2326
line 4832
;4832:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2325
JUMPV
LABELV $2326
line 4834
;4833:	}
;4834:	return qtrue;
CNSTI4 1
RETI4
LABELV $2325
endproc ItemParse_text 4 8
export ItemParse_group
proc ItemParse_group 4 8
line 4838
;4835:}
;4836:
;4837:// group <string>
;4838:qboolean ItemParse_group( itemDef_t *item, int handle ) {
line 4839
;4839:	if (!PC_String_Parse(handle, &item->window.group)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2329
line 4840
;4840:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2328
JUMPV
LABELV $2329
line 4842
;4841:	}
;4842:	return qtrue;
CNSTI4 1
RETI4
LABELV $2328
endproc ItemParse_group 4 8
export ItemParse_asset_model
proc ItemParse_asset_model 20 8
line 4846
;4843:}
;4844:
;4845:// asset_model <string>
;4846:qboolean ItemParse_asset_model( itemDef_t *item, int handle ) {
line 4849
;4847:	const char *temp;
;4848:	modelDef_t *modelPtr;
;4849:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4850
;4850:	modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4852
;4851:
;4852:	if (!PC_String_Parse(handle, &temp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2332
line 4853
;4853:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2331
JUMPV
LABELV $2332
line 4855
;4854:	}
;4855:	item->asset = DC->registerModel(temp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 4856
;4856:	modelPtr->angle = rand() % 360;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
CNSTI4 360
MODI4
ASGNI4
line 4857
;4857:	return qtrue;
CNSTI4 1
RETI4
LABELV $2331
endproc ItemParse_asset_model 20 8
export ItemParse_asset_shader
proc ItemParse_asset_shader 12 8
line 4861
;4858:}
;4859:
;4860:// asset_shader <string>
;4861:qboolean ItemParse_asset_shader( itemDef_t *item, int handle ) {
line 4864
;4862:	const char *temp;
;4863:
;4864:	if (!PC_String_Parse(handle, &temp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2335
line 4865
;4865:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2334
JUMPV
LABELV $2335
line 4867
;4866:	}
;4867:	item->asset = DC->registerShaderNoMip(temp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4868
;4868:	return qtrue;
CNSTI4 1
RETI4
LABELV $2334
endproc ItemParse_asset_shader 12 8
export ItemParse_model_origin
proc ItemParse_model_origin 16 8
line 4872
;4869:}
;4870:
;4871:// model_origin <number> <number> <number>
;4872:qboolean ItemParse_model_origin( itemDef_t *item, int handle ) {
line 4874
;4873:	modelDef_t *modelPtr;
;4874:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4875
;4875:	modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4877
;4876:
;4877:	if (PC_Float_Parse(handle, &modelPtr->origin[0])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2338
line 4878
;4878:		if (PC_Float_Parse(handle, &modelPtr->origin[1])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2340
line 4879
;4879:			if (PC_Float_Parse(handle, &modelPtr->origin[2])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2342
line 4880
;4880:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2337
JUMPV
LABELV $2342
line 4882
;4881:			}
;4882:		}
LABELV $2340
line 4883
;4883:	}
LABELV $2338
line 4884
;4884:	return qfalse;
CNSTI4 0
RETI4
LABELV $2337
endproc ItemParse_model_origin 16 8
export ItemParse_model_fovx
proc ItemParse_model_fovx 8 8
line 4888
;4885:}
;4886:
;4887:// model_fovx <number>
;4888:qboolean ItemParse_model_fovx( itemDef_t *item, int handle ) {
line 4890
;4889:	modelDef_t *modelPtr;
;4890:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4891
;4891:	modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4893
;4892:
;4893:	if (!PC_Float_Parse(handle, &modelPtr->fov_x)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2345
line 4894
;4894:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2344
JUMPV
LABELV $2345
line 4896
;4895:	}
;4896:	return qtrue;
CNSTI4 1
RETI4
LABELV $2344
endproc ItemParse_model_fovx 8 8
export ItemParse_model_fovy
proc ItemParse_model_fovy 8 8
line 4900
;4897:}
;4898:
;4899:// model_fovy <number>
;4900:qboolean ItemParse_model_fovy( itemDef_t *item, int handle ) {
line 4902
;4901:	modelDef_t *modelPtr;
;4902:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4903
;4903:	modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4905
;4904:
;4905:	if (!PC_Float_Parse(handle, &modelPtr->fov_y)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2348
line 4906
;4906:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2347
JUMPV
LABELV $2348
line 4908
;4907:	}
;4908:	return qtrue;
CNSTI4 1
RETI4
LABELV $2347
endproc ItemParse_model_fovy 8 8
export ItemParse_model_rotation
proc ItemParse_model_rotation 8 8
line 4912
;4909:}
;4910:
;4911:// model_rotation <integer>
;4912:qboolean ItemParse_model_rotation( itemDef_t *item, int handle ) {
line 4914
;4913:	modelDef_t *modelPtr;
;4914:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4915
;4915:	modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4917
;4916:
;4917:	if (!PC_Int_Parse(handle, &modelPtr->rotationSpeed)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2351
line 4918
;4918:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2350
JUMPV
LABELV $2351
line 4920
;4919:	}
;4920:	return qtrue;
CNSTI4 1
RETI4
LABELV $2350
endproc ItemParse_model_rotation 8 8
export ItemParse_model_angle
proc ItemParse_model_angle 8 8
line 4924
;4921:}
;4922:
;4923:// model_angle <integer>
;4924:qboolean ItemParse_model_angle( itemDef_t *item, int handle ) {
line 4926
;4925:	modelDef_t *modelPtr;
;4926:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4927
;4927:	modelPtr = (modelDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4929
;4928:
;4929:	if (!PC_Int_Parse(handle, &modelPtr->angle)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2354
line 4930
;4930:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2353
JUMPV
LABELV $2354
line 4932
;4931:	}
;4932:	return qtrue;
CNSTI4 1
RETI4
LABELV $2353
endproc ItemParse_model_angle 8 8
export ItemParse_rect
proc ItemParse_rect 4 8
line 4936
;4933:}
;4934:
;4935:// rect <rectangle>
;4936:qboolean ItemParse_rect( itemDef_t *item, int handle ) {
line 4937
;4937:	if (!PC_Rect_Parse(handle, &item->window.rectClient)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Rect_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2357
line 4938
;4938:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2356
JUMPV
LABELV $2357
line 4940
;4939:	}
;4940:	return qtrue;
CNSTI4 1
RETI4
LABELV $2356
endproc ItemParse_rect 4 8
export ItemParse_style
proc ItemParse_style 4 8
line 4944
;4941:}
;4942:
;4943:// style <integer>
;4944:qboolean ItemParse_style( itemDef_t *item, int handle ) {
line 4945
;4945:	if (!PC_Int_Parse(handle, &item->window.style)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2360
line 4946
;4946:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2359
JUMPV
LABELV $2360
line 4948
;4947:	}
;4948:	return qtrue;
CNSTI4 1
RETI4
LABELV $2359
endproc ItemParse_style 4 8
export ItemParse_teamcolor
proc ItemParse_teamcolor 4 0
line 4952
;4949:}
;4950:
;4951:// decoration
;4952:qboolean ItemParse_teamcolor( itemDef_t *item, int handle ) {
line 4953
;4953:	item->window.flags |= WINDOW_TEAMCOLOR;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 16777216
BORI4
ASGNI4
line 4954
;4954:	return qtrue;
CNSTI4 1
RETI4
LABELV $2362
endproc ItemParse_teamcolor 4 0
export ItemParse_strechpic
proc ItemParse_strechpic 0 0
line 4957
;4955:}
;4956:
;4957:qboolean ItemParse_strechpic( itemDef_t *item, int handle ) {
line 4958
;4958:	item->useStrechPic = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 4959
;4959:	return qtrue;
CNSTI4 1
RETI4
LABELV $2363
endproc ItemParse_strechpic 0 0
export ItemParse_decoration
proc ItemParse_decoration 4 0
line 4963
;4960:}
;4961:
;4962:// decoration
;4963:qboolean ItemParse_decoration( itemDef_t *item, int handle ) {
line 4964
;4964:	item->window.flags |= WINDOW_DECORATION;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 4965
;4965:	return qtrue;
CNSTI4 1
RETI4
LABELV $2364
endproc ItemParse_decoration 4 0
export ItemParse_notselectable
proc ItemParse_notselectable 4 4
line 4969
;4966:}
;4967:
;4968:// notselectable
;4969:qboolean ItemParse_notselectable( itemDef_t *item, int handle ) {
line 4971
;4970:	listBoxDef_t *listPtr;
;4971:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 4972
;4972:	listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 4973
;4973:	if (item->type == ITEM_TYPE_LISTBOX && listPtr) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2366
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2366
line 4974
;4974:		listPtr->notselectable = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
CNSTI4 1
ASGNI4
line 4975
;4975:	}
LABELV $2366
line 4976
;4976:	return qtrue;
CNSTI4 1
RETI4
LABELV $2365
endproc ItemParse_notselectable 4 4
export ItemParse_wrapped
proc ItemParse_wrapped 4 0
line 4980
;4977:}
;4978:
;4979:// manually wrapped
;4980:qboolean ItemParse_wrapped( itemDef_t *item, int handle ) {
line 4981
;4981:	item->window.flags |= WINDOW_WRAPPED;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 262144
BORI4
ASGNI4
line 4982
;4982:	return qtrue;
CNSTI4 1
RETI4
LABELV $2368
endproc ItemParse_wrapped 4 0
export ItemParse_autowrapped
proc ItemParse_autowrapped 4 0
line 4986
;4983:}
;4984:
;4985:// auto wrapped
;4986:qboolean ItemParse_autowrapped( itemDef_t *item, int handle ) {
line 4987
;4987:	item->window.flags |= WINDOW_AUTOWRAPPED;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 4988
;4988:	return qtrue;
CNSTI4 1
RETI4
LABELV $2369
endproc ItemParse_autowrapped 4 0
export ItemParse_horizontalscroll
proc ItemParse_horizontalscroll 4 0
line 4993
;4989:}
;4990:
;4991:
;4992:// horizontalscroll
;4993:qboolean ItemParse_horizontalscroll( itemDef_t *item, int handle ) {
line 4994
;4994:	item->window.flags |= WINDOW_HORIZONTAL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 4995
;4995:	return qtrue;
CNSTI4 1
RETI4
LABELV $2370
endproc ItemParse_horizontalscroll 4 0
export ItemParse_type
proc ItemParse_type 4 8
line 4999
;4996:}
;4997:
;4998:// type <integer>
;4999:qboolean ItemParse_type( itemDef_t *item, int handle ) {
line 5000
;5000:	if (!PC_Int_Parse(handle, &item->type)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2372
line 5001
;5001:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2371
JUMPV
LABELV $2372
line 5003
;5002:	}
;5003:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5004
;5004:	return qtrue;
CNSTI4 1
RETI4
LABELV $2371
endproc ItemParse_type 4 8
export ItemParse_elementwidth
proc ItemParse_elementwidth 8 8
line 5009
;5005:}
;5006:
;5007:// elementwidth, used for listbox image elements
;5008:// uses textalignx for storage
;5009:qboolean ItemParse_elementwidth( itemDef_t *item, int handle ) {
line 5012
;5010:	listBoxDef_t *listPtr;
;5011:
;5012:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5013
;5013:	listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5014
;5014:	if (!PC_Float_Parse(handle, &listPtr->elementWidth)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2375
line 5015
;5015:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2374
JUMPV
LABELV $2375
line 5017
;5016:	}
;5017:	return qtrue;
CNSTI4 1
RETI4
LABELV $2374
endproc ItemParse_elementwidth 8 8
export ItemParse_elementheight
proc ItemParse_elementheight 8 8
line 5022
;5018:}
;5019:
;5020:// elementheight, used for listbox image elements
;5021:// uses textaligny for storage
;5022:qboolean ItemParse_elementheight( itemDef_t *item, int handle ) {
line 5025
;5023:	listBoxDef_t *listPtr;
;5024:
;5025:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5026
;5026:	listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5027
;5027:	if (!PC_Float_Parse(handle, &listPtr->elementHeight)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2378
line 5028
;5028:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2377
JUMPV
LABELV $2378
line 5030
;5029:	}
;5030:	return qtrue;
CNSTI4 1
RETI4
LABELV $2377
endproc ItemParse_elementheight 8 8
export ItemParse_feeder
proc ItemParse_feeder 4 8
line 5034
;5031:}
;5032:
;5033:// feeder <float>
;5034:qboolean ItemParse_feeder( itemDef_t *item, int handle ) {
line 5035
;5035:	if (!PC_Float_Parse(handle, &item->special)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2381
line 5036
;5036:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2380
JUMPV
LABELV $2381
line 5038
;5037:	}
;5038:	return qtrue;
CNSTI4 1
RETI4
LABELV $2380
endproc ItemParse_feeder 4 8
export ItemParse_elementtype
proc ItemParse_elementtype 8 8
line 5043
;5039:}
;5040:
;5041:// elementtype, used to specify what type of elements a listbox contains
;5042:// uses textstyle for storage
;5043:qboolean ItemParse_elementtype( itemDef_t *item, int handle ) {
line 5046
;5044:	listBoxDef_t *listPtr;
;5045:
;5046:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5047
;5047:	if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2384
line 5048
;5048:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2383
JUMPV
LABELV $2384
line 5049
;5049:	listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5050
;5050:	if (!PC_Int_Parse(handle, &listPtr->elementStyle)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2386
line 5051
;5051:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2383
JUMPV
LABELV $2386
line 5053
;5052:	}
;5053:	return qtrue;
CNSTI4 1
RETI4
LABELV $2383
endproc ItemParse_elementtype 8 8
export ItemParse_columns
proc ItemParse_columns 40 8
line 5057
;5054:}
;5055:
;5056:// columns sets a number of columns and an x pos and width per.. 
;5057:qboolean ItemParse_columns( itemDef_t *item, int handle ) {
line 5061
;5058:	int num, i;
;5059:	listBoxDef_t *listPtr;
;5060:
;5061:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5062
;5062:	if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2389
line 5063
;5063:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2388
JUMPV
LABELV $2389
line 5064
;5064:	listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5065
;5065:	if (PC_Int_Parse(handle, &num)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2391
line 5066
;5066:		if (num > MAX_LB_COLUMNS) {
ADDRLP4 8
INDIRI4
CNSTI4 16
LEI4 $2393
line 5067
;5067:			num = MAX_LB_COLUMNS;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 5068
;5068:		}
LABELV $2393
line 5069
;5069:		listPtr->numColumns = num;
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5070
;5070:		for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2398
JUMPV
LABELV $2395
line 5073
;5071:			int pos, width, maxChars;
;5072:
;5073:			if (PC_Int_Parse(handle, &pos) && PC_Int_Parse(handle, &width) && PC_Int_Parse(handle, &maxChars)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2399
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 32
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2399
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2399
line 5074
;5074:				listPtr->columnInfo[i].pos = pos;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5075
;5075:				listPtr->columnInfo[i].width = width;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 5076
;5076:				listPtr->columnInfo[i].maxChars = maxChars;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 5077
;5077:			} else {
ADDRGP4 $2400
JUMPV
LABELV $2399
line 5078
;5078:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2388
JUMPV
LABELV $2400
line 5080
;5079:			}
;5080:		}
LABELV $2396
line 5070
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2398
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2395
line 5081
;5081:	} else {
ADDRGP4 $2392
JUMPV
LABELV $2391
line 5082
;5082:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2388
JUMPV
LABELV $2392
line 5084
;5083:	}
;5084:	return qtrue;
CNSTI4 1
RETI4
LABELV $2388
endproc ItemParse_columns 40 8
export ItemParse_border
proc ItemParse_border 4 8
line 5087
;5085:}
;5086:
;5087:qboolean ItemParse_border( itemDef_t *item, int handle ) {
line 5088
;5088:	if (!PC_Int_Parse(handle, &item->window.border)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2402
line 5089
;5089:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2401
JUMPV
LABELV $2402
line 5091
;5090:	}
;5091:	return qtrue;
CNSTI4 1
RETI4
LABELV $2401
endproc ItemParse_border 4 8
export ItemParse_bordersize
proc ItemParse_bordersize 4 8
line 5094
;5092:}
;5093:
;5094:qboolean ItemParse_bordersize( itemDef_t *item, int handle ) {
line 5095
;5095:	if (!PC_Float_Parse(handle, &item->window.borderSize)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2405
line 5096
;5096:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2404
JUMPV
LABELV $2405
line 5098
;5097:	}
;5098:	return qtrue;
CNSTI4 1
RETI4
LABELV $2404
endproc ItemParse_bordersize 4 8
export ItemParse_visible
proc ItemParse_visible 12 8
line 5101
;5099:}
;5100:
;5101:qboolean ItemParse_visible( itemDef_t *item, int handle ) {
line 5104
;5102:	int i;
;5103:
;5104:	if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2408
line 5105
;5105:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2407
JUMPV
LABELV $2408
line 5107
;5106:	}
;5107:	if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2410
line 5108
;5108:		item->window.flags |= WINDOW_VISIBLE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 5109
;5109:	}
LABELV $2410
line 5110
;5110:	return qtrue;
CNSTI4 1
RETI4
LABELV $2407
endproc ItemParse_visible 12 8
export ItemParse_ownerdraw
proc ItemParse_ownerdraw 4 8
line 5113
;5111:}
;5112:
;5113:qboolean ItemParse_ownerdraw( itemDef_t *item, int handle ) {
line 5114
;5114:	if (!PC_Int_Parse(handle, &item->window.ownerDraw)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2413
line 5115
;5115:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2412
JUMPV
LABELV $2413
line 5117
;5116:	}
;5117:	item->type = ITEM_TYPE_OWNERDRAW;
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 8
ASGNI4
line 5118
;5118:	return qtrue;
CNSTI4 1
RETI4
LABELV $2412
endproc ItemParse_ownerdraw 4 8
export ItemParse_align
proc ItemParse_align 4 8
line 5121
;5119:}
;5120:
;5121:qboolean ItemParse_align( itemDef_t *item, int handle ) {
line 5122
;5122:	if (!PC_Int_Parse(handle, &item->alignment)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2416
line 5123
;5123:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2415
JUMPV
LABELV $2416
line 5125
;5124:	}
;5125:	return qtrue;
CNSTI4 1
RETI4
LABELV $2415
endproc ItemParse_align 4 8
export ItemParse_textalign
proc ItemParse_textalign 4 8
line 5128
;5126:}
;5127:
;5128:qboolean ItemParse_textalign( itemDef_t *item, int handle ) {
line 5129
;5129:	if (!PC_Int_Parse(handle, &item->textalignment)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2419
line 5130
;5130:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2418
JUMPV
LABELV $2419
line 5132
;5131:	}
;5132:	return qtrue;
CNSTI4 1
RETI4
LABELV $2418
endproc ItemParse_textalign 4 8
export ItemParse_textalignx
proc ItemParse_textalignx 4 8
line 5135
;5133:}
;5134:
;5135:qboolean ItemParse_textalignx( itemDef_t *item, int handle ) {
line 5136
;5136:	if (!PC_Float_Parse(handle, &item->textalignx)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2422
line 5137
;5137:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2421
JUMPV
LABELV $2422
line 5139
;5138:	}
;5139:	return qtrue;
CNSTI4 1
RETI4
LABELV $2421
endproc ItemParse_textalignx 4 8
export ItemParse_textaligny
proc ItemParse_textaligny 4 8
line 5142
;5140:}
;5141:
;5142:qboolean ItemParse_textaligny( itemDef_t *item, int handle ) {
line 5143
;5143:	if (!PC_Float_Parse(handle, &item->textaligny)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2425
line 5144
;5144:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2424
JUMPV
LABELV $2425
line 5146
;5145:	}
;5146:	return qtrue;
CNSTI4 1
RETI4
LABELV $2424
endproc ItemParse_textaligny 4 8
export ItemParse_textscale
proc ItemParse_textscale 4 8
line 5149
;5147:}
;5148:
;5149:qboolean ItemParse_textscale( itemDef_t *item, int handle ) {
line 5150
;5150:	if (!PC_Float_Parse(handle, &item->textscale)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2428
line 5151
;5151:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2427
JUMPV
LABELV $2428
line 5153
;5152:	}
;5153:	return qtrue;
CNSTI4 1
RETI4
LABELV $2427
endproc ItemParse_textscale 4 8
export ItemParse_textstyle
proc ItemParse_textstyle 4 8
line 5156
;5154:}
;5155:
;5156:qboolean ItemParse_textstyle( itemDef_t *item, int handle ) {
line 5157
;5157:	if (!PC_Int_Parse(handle, &item->textStyle)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2431
line 5158
;5158:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2430
JUMPV
LABELV $2431
line 5160
;5159:	}
;5160:	return qtrue;
CNSTI4 1
RETI4
LABELV $2430
endproc ItemParse_textstyle 4 8
export ItemParse_backcolor
proc ItemParse_backcolor 12 8
line 5163
;5161:}
;5162:
;5163:qboolean ItemParse_backcolor( itemDef_t *item, int handle ) {
line 5167
;5164:	int i;
;5165:	float f;
;5166:
;5167:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2434
line 5168
;5168:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2438
line 5169
;5169:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2433
JUMPV
LABELV $2438
line 5171
;5170:		}
;5171:		item->window.backColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5172
;5172:	}
LABELV $2435
line 5167
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2434
line 5173
;5173:	return qtrue;
CNSTI4 1
RETI4
LABELV $2433
endproc ItemParse_backcolor 12 8
export ItemParse_forecolor
proc ItemParse_forecolor 16 8
line 5176
;5174:}
;5175:
;5176:qboolean ItemParse_forecolor( itemDef_t *item, int handle ) {
line 5180
;5177:	int i;
;5178:	float f;
;5179:
;5180:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2441
line 5181
;5181:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2445
line 5182
;5182:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2440
JUMPV
LABELV $2445
line 5184
;5183:		}
;5184:		item->window.foreColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5185
;5185:		item->window.flags |= WINDOW_FORECOLORSET;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 5186
;5186:	}
LABELV $2442
line 5180
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2441
line 5187
;5187:	return qtrue;
CNSTI4 1
RETI4
LABELV $2440
endproc ItemParse_forecolor 16 8
export ItemParse_bordercolor
proc ItemParse_bordercolor 12 8
line 5190
;5188:}
;5189:
;5190:qboolean ItemParse_bordercolor( itemDef_t *item, int handle ) {
line 5194
;5191:	int i;
;5192:	float f;
;5193:
;5194:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2448
line 5195
;5195:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2452
line 5196
;5196:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2447
JUMPV
LABELV $2452
line 5198
;5197:		}
;5198:		item->window.borderColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5199
;5199:	}
LABELV $2449
line 5194
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2448
line 5200
;5200:	return qtrue;
CNSTI4 1
RETI4
LABELV $2447
endproc ItemParse_bordercolor 12 8
export ItemParse_outlinecolor
proc ItemParse_outlinecolor 4 8
line 5203
;5201:}
;5202:
;5203:qboolean ItemParse_outlinecolor( itemDef_t *item, int handle ) {
line 5204
;5204:	if (!PC_Color_Parse(handle, &item->window.outlineColor)){
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2455
line 5205
;5205:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2454
JUMPV
LABELV $2455
line 5207
;5206:	}
;5207:	return qtrue;
CNSTI4 1
RETI4
LABELV $2454
endproc ItemParse_outlinecolor 4 8
export ItemParse_background
proc ItemParse_background 12 8
line 5210
;5208:}
;5209:
;5210:qboolean ItemParse_background( itemDef_t *item, int handle ) {
line 5213
;5211:	const char *temp;
;5212:
;5213:	if (!PC_String_Parse(handle, &temp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2458
line 5214
;5214:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2457
JUMPV
LABELV $2458
line 5216
;5215:	}
;5216:	item->window.background = DC->registerShaderNoMip(temp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
INDIRP4
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5217
;5217:	return qtrue;
CNSTI4 1
RETI4
LABELV $2457
endproc ItemParse_background 12 8
export ItemParse_cinematic
proc ItemParse_cinematic 4 8
line 5220
;5218:}
;5219:
;5220:qboolean ItemParse_cinematic( itemDef_t *item, int handle ) {
line 5221
;5221:	if (!PC_String_Parse(handle, &item->window.cinematicName)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2461
line 5222
;5222:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2460
JUMPV
LABELV $2461
line 5224
;5223:	}
;5224:	return qtrue;
CNSTI4 1
RETI4
LABELV $2460
endproc ItemParse_cinematic 4 8
export ItemParse_doubleClick
proc ItemParse_doubleClick 8 8
line 5227
;5225:}
;5226:
;5227:qboolean ItemParse_doubleClick( itemDef_t *item, int handle ) {
line 5230
;5228:	listBoxDef_t *listPtr;
;5229:
;5230:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5231
;5231:	if (!item->typeData) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2464
line 5232
;5232:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2463
JUMPV
LABELV $2464
line 5235
;5233:	}
;5234:
;5235:	listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5237
;5236:
;5237:	if (!PC_Script_Parse(handle, &listPtr->doubleClick)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2466
line 5238
;5238:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2463
JUMPV
LABELV $2466
line 5240
;5239:	}
;5240:	return qtrue;
CNSTI4 1
RETI4
LABELV $2463
endproc ItemParse_doubleClick 8 8
export ItemParse_onFocus
proc ItemParse_onFocus 4 8
line 5243
;5241:}
;5242:
;5243:qboolean ItemParse_onFocus( itemDef_t *item, int handle ) {
line 5244
;5244:	if (!PC_Script_Parse(handle, &item->onFocus)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2469
line 5245
;5245:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2468
JUMPV
LABELV $2469
line 5247
;5246:	}
;5247:	return qtrue;
CNSTI4 1
RETI4
LABELV $2468
endproc ItemParse_onFocus 4 8
export ItemParse_leaveFocus
proc ItemParse_leaveFocus 4 8
line 5250
;5248:}
;5249:
;5250:qboolean ItemParse_leaveFocus( itemDef_t *item, int handle ) {
line 5251
;5251:	if (!PC_Script_Parse(handle, &item->leaveFocus)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2472
line 5252
;5252:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2471
JUMPV
LABELV $2472
line 5254
;5253:	}
;5254:	return qtrue;
CNSTI4 1
RETI4
LABELV $2471
endproc ItemParse_leaveFocus 4 8
export ItemParse_mouseEnter
proc ItemParse_mouseEnter 4 8
line 5257
;5255:}
;5256:
;5257:qboolean ItemParse_mouseEnter( itemDef_t *item, int handle ) {
line 5258
;5258:	if (!PC_Script_Parse(handle, &item->mouseEnter)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2475
line 5259
;5259:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2474
JUMPV
LABELV $2475
line 5261
;5260:	}
;5261:	return qtrue;
CNSTI4 1
RETI4
LABELV $2474
endproc ItemParse_mouseEnter 4 8
export ItemParse_mouseExit
proc ItemParse_mouseExit 4 8
line 5264
;5262:}
;5263:
;5264:qboolean ItemParse_mouseExit( itemDef_t *item, int handle ) {
line 5265
;5265:	if (!PC_Script_Parse(handle, &item->mouseExit)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2478
line 5266
;5266:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2477
JUMPV
LABELV $2478
line 5268
;5267:	}
;5268:	return qtrue;
CNSTI4 1
RETI4
LABELV $2477
endproc ItemParse_mouseExit 4 8
export ItemParse_mouseEnterText
proc ItemParse_mouseEnterText 4 8
line 5271
;5269:}
;5270:
;5271:qboolean ItemParse_mouseEnterText( itemDef_t *item, int handle ) {
line 5272
;5272:	if (!PC_Script_Parse(handle, &item->mouseEnterText)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2481
line 5273
;5273:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2480
JUMPV
LABELV $2481
line 5275
;5274:	}
;5275:	return qtrue;
CNSTI4 1
RETI4
LABELV $2480
endproc ItemParse_mouseEnterText 4 8
export ItemParse_mouseExitText
proc ItemParse_mouseExitText 4 8
line 5278
;5276:}
;5277:
;5278:qboolean ItemParse_mouseExitText( itemDef_t *item, int handle ) {
line 5279
;5279:	if (!PC_Script_Parse(handle, &item->mouseExitText)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2484
line 5280
;5280:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2483
JUMPV
LABELV $2484
line 5282
;5281:	}
;5282:	return qtrue;
CNSTI4 1
RETI4
LABELV $2483
endproc ItemParse_mouseExitText 4 8
export ItemParse_action
proc ItemParse_action 4 8
line 5285
;5283:}
;5284:
;5285:qboolean ItemParse_action( itemDef_t *item, int handle ) {
line 5286
;5286:	if (!PC_Script_Parse(handle, &item->action)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2487
line 5287
;5287:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2486
JUMPV
LABELV $2487
line 5289
;5288:	}
;5289:	return qtrue;
CNSTI4 1
RETI4
LABELV $2486
endproc ItemParse_action 4 8
export ItemParse_special
proc ItemParse_special 4 8
line 5292
;5290:}
;5291:
;5292:qboolean ItemParse_special( itemDef_t *item, int handle ) {
line 5293
;5293:	if (!PC_Float_Parse(handle, &item->special)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2490
line 5294
;5294:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2489
JUMPV
LABELV $2490
line 5296
;5295:	}
;5296:	return qtrue;
CNSTI4 1
RETI4
LABELV $2489
endproc ItemParse_special 4 8
export ItemParse_cvarTest
proc ItemParse_cvarTest 4 8
line 5299
;5297:}
;5298:
;5299:qboolean ItemParse_cvarTest( itemDef_t *item, int handle ) {
line 5300
;5300:	if (!PC_String_Parse(handle, &item->cvarTest)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2493
line 5301
;5301:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2492
JUMPV
LABELV $2493
line 5303
;5302:	}
;5303:	return qtrue;
CNSTI4 1
RETI4
LABELV $2492
endproc ItemParse_cvarTest 4 8
export ItemParse_cvar
proc ItemParse_cvar 8 8
line 5306
;5304:}
;5305:
;5306:qboolean ItemParse_cvar( itemDef_t *item, int handle ) {
line 5309
;5307:	editFieldDef_t *editPtr;
;5308:
;5309:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5310
;5310:	if (!PC_String_Parse(handle, &item->cvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2496
line 5311
;5311:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2495
JUMPV
LABELV $2496
line 5313
;5312:	}
;5313:	if (item->typeData) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2498
line 5314
;5314:		editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5315
;5315:		editPtr->minVal = -1;
ADDRLP4 0
INDIRP4
CNSTF4 3212836864
ASGNF4
line 5316
;5316:		editPtr->maxVal = -1;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 3212836864
ASGNF4
line 5317
;5317:		editPtr->defVal = -1;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 3212836864
ASGNF4
line 5318
;5318:	}
LABELV $2498
line 5319
;5319:	return qtrue;
CNSTI4 1
RETI4
LABELV $2495
endproc ItemParse_cvar 8 8
export ItemParse_maxChars
proc ItemParse_maxChars 12 8
line 5322
;5320:}
;5321:
;5322:qboolean ItemParse_maxChars( itemDef_t *item, int handle ) {
line 5326
;5323:	editFieldDef_t *editPtr;
;5324:	int maxChars;
;5325:
;5326:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5327
;5327:	if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2501
line 5328
;5328:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2500
JUMPV
LABELV $2501
line 5330
;5329:
;5330:	if (!PC_Int_Parse(handle, &maxChars)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2503
line 5331
;5331:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2500
JUMPV
LABELV $2503
line 5333
;5332:	}
;5333:	editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5334
;5334:	editPtr->maxChars = maxChars;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5335
;5335:	return qtrue;
CNSTI4 1
RETI4
LABELV $2500
endproc ItemParse_maxChars 12 8
export ItemParse_maxPaintChars
proc ItemParse_maxPaintChars 12 8
line 5338
;5336:}
;5337:
;5338:qboolean ItemParse_maxPaintChars( itemDef_t *item, int handle ) {
line 5342
;5339:	editFieldDef_t *editPtr;
;5340:	int maxChars;
;5341:
;5342:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5343
;5343:	if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2506
line 5344
;5344:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2505
JUMPV
LABELV $2506
line 5346
;5345:
;5346:	if (!PC_Int_Parse(handle, &maxChars)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2508
line 5347
;5347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2505
JUMPV
LABELV $2508
line 5349
;5348:	}
;5349:	editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5350
;5350:	editPtr->maxPaintChars = maxChars;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5351
;5351:	return qtrue;
CNSTI4 1
RETI4
LABELV $2505
endproc ItemParse_maxPaintChars 12 8
export ItemParse_cvarFloat
proc ItemParse_cvarFloat 20 8
line 5356
;5352:}
;5353:
;5354:
;5355:
;5356:qboolean ItemParse_cvarFloat( itemDef_t *item, int handle ) {
line 5359
;5357:	editFieldDef_t *editPtr;
;5358:
;5359:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5360
;5360:	if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2511
line 5361
;5361:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2510
JUMPV
LABELV $2511
line 5362
;5362:	editPtr = (editFieldDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5363
;5363:	if (PC_String_Parse(handle, &item->cvar) &&
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2513
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2513
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2513
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2513
line 5366
;5364:		PC_Float_Parse(handle, &editPtr->defVal) &&
;5365:		PC_Float_Parse(handle, &editPtr->minVal) &&
;5366:		PC_Float_Parse(handle, &editPtr->maxVal)) {
line 5367
;5367:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2510
JUMPV
LABELV $2513
line 5369
;5368:	}
;5369:	return qfalse;
CNSTI4 0
RETI4
LABELV $2510
endproc ItemParse_cvarFloat 20 8
export ItemParse_cvarStrList
proc ItemParse_cvarStrList 1068 8
line 5372
;5370:}
;5371:
;5372:qboolean ItemParse_cvarStrList( itemDef_t *item, int handle ) {
line 5377
;5373:	pc_token_t token;
;5374:	multiDef_t *multiPtr;
;5375:	int pass;
;5376:	
;5377:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5378
;5378:	if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2516
line 5379
;5379:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2516
line 5380
;5380:	multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5381
;5381:	multiPtr->count = 0;
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 5382
;5382:	multiPtr->strDef = qtrue;
ADDRLP4 1040
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 1
ASGNI4
line 5384
;5383:
;5384:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2518
line 5385
;5385:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2518
line 5386
;5386:	if (*token.string != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2520
line 5387
;5387:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2520
line 5390
;5388:	}
;5389:
;5390:	pass = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRGP4 $2524
JUMPV
LABELV $2523
line 5391
;5391:	while ( 1 ) {
line 5392
;5392:		if (!trap_PC_ReadToken(handle, &token)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2526
line 5393
;5393:			PC_SourceError(handle, "end of file inside menu item\n");
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2528
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5394
;5394:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2526
line 5397
;5395:		}
;5396:
;5397:		if (*token.string == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2529
line 5398
;5398:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2529
line 5401
;5399:		}
;5400:
;5401:		if (*token.string == ',' || *token.string == ';') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 44
EQI4 $2536
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $2532
LABELV $2536
line 5402
;5402:			continue;
ADDRGP4 $2524
JUMPV
LABELV $2532
line 5405
;5403:		}
;5404:
;5405:		if (pass == 0) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2537
line 5406
;5406:			multiPtr->cvarList[multiPtr->count] = String_Alloc(token.string);
ADDRLP4 0+16
ARGP4
ADDRLP4 1056
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1040
INDIRP4
ADDP4
ADDRLP4 1056
INDIRP4
ASGNP4
line 5407
;5407:			pass = 1;
ADDRLP4 1044
CNSTI4 1
ASGNI4
line 5408
;5408:		} else {
ADDRGP4 $2538
JUMPV
LABELV $2537
line 5409
;5409:			multiPtr->cvarStr[multiPtr->count] = String_Alloc(token.string);
ADDRLP4 0+16
ARGP4
ADDRLP4 1056
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1040
INDIRP4
CNSTI4 128
ADDP4
ADDP4
ADDRLP4 1056
INDIRP4
ASGNP4
line 5410
;5410:			pass = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 5411
;5411:			multiPtr->count++;
ADDRLP4 1064
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 1064
INDIRP4
ADDRLP4 1064
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5412
;5412:			if (multiPtr->count >= MAX_MULTI_CVARS) {
ADDRLP4 1040
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2541
line 5413
;5413:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2541
line 5415
;5414:			}
;5415:		}
LABELV $2538
line 5417
;5416:
;5417:	}
LABELV $2524
line 5391
ADDRGP4 $2523
JUMPV
line 5419
;5418:
;5419:	return qtrue;
CNSTI4 1
RETI4
LABELV $2515
endproc ItemParse_cvarStrList 1068 8
export ItemParse_cvarFloatList
proc ItemParse_cvarFloatList 1072 8
line 5422
;5420:}
;5421:
;5422:qboolean ItemParse_cvarFloatList( itemDef_t *item, int handle ) {
line 5426
;5423:	pc_token_t token;
;5424:	multiDef_t *multiPtr;
;5425:	
;5426:	Item_ValidateTypeData(item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Item_ValidateTypeData
CALLV
pop
line 5427
;5427:	if (!item->typeData)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2544
line 5428
;5428:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2543
JUMPV
LABELV $2544
line 5429
;5429:	multiPtr = (multiDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5430
;5430:	multiPtr->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 5431
;5431:	multiPtr->strDef = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 0
ASGNI4
line 5433
;5432:
;5433:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2546
line 5434
;5434:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2543
JUMPV
LABELV $2546
line 5435
;5435:	if (*token.string != '{') {
ADDRLP4 4+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2552
line 5436
;5436:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2543
JUMPV
LABELV $2551
line 5439
;5437:	}
;5438:
;5439:	while ( 1 ) {
line 5440
;5440:		if (!trap_PC_ReadToken(handle, &token)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2554
line 5441
;5441:			PC_SourceError(handle, "end of file inside menu item\n");
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2528
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5442
;5442:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2543
JUMPV
LABELV $2554
line 5445
;5443:		}
;5444:
;5445:		if (*token.string == '}') {
ADDRLP4 4+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2556
line 5446
;5446:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2543
JUMPV
LABELV $2556
line 5449
;5447:		}
;5448:
;5449:		if (*token.string == ',' || *token.string == ';') {
ADDRLP4 4+16
INDIRI1
CVII4 1
CNSTI4 44
EQI4 $2563
ADDRLP4 4+16
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $2559
LABELV $2563
line 5450
;5450:			continue;
ADDRGP4 $2552
JUMPV
LABELV $2559
line 5453
;5451:		}
;5452:
;5453:		multiPtr->cvarList[multiPtr->count] = String_Alloc(token.string);
ADDRLP4 4+16
ARGP4
ADDRLP4 1052
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 1052
INDIRP4
ASGNP4
line 5454
;5454:		if (!PC_Float_Parse(handle, &multiPtr->cvarValue[multiPtr->count])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDP4
ARGP4
ADDRLP4 1064
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2565
line 5455
;5455:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2543
JUMPV
LABELV $2565
line 5458
;5456:		}
;5457:
;5458:		multiPtr->count++;
ADDRLP4 1068
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5459
;5459:		if (multiPtr->count >= MAX_MULTI_CVARS) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2567
line 5460
;5460:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2543
JUMPV
LABELV $2567
line 5463
;5461:		}
;5462:
;5463:	}
LABELV $2552
line 5439
ADDRGP4 $2551
JUMPV
line 5465
;5464:
;5465:	return qtrue;
CNSTI4 1
RETI4
LABELV $2543
endproc ItemParse_cvarFloatList 1072 8
export ItemParse_addColorRange
proc ItemParse_addColorRange 48 12
line 5470
;5466:}
;5467:
;5468:
;5469:
;5470:qboolean ItemParse_addColorRange( itemDef_t *item, int handle ) {
line 5473
;5471:	colorRangeDef_t color;
;5472:
;5473:	if (PC_Float_Parse(handle, &color.low) &&
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0+16
ARGP4
ADDRLP4 24
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2570
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0+20
ARGP4
ADDRLP4 28
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2570
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2570
line 5475
;5474:		PC_Float_Parse(handle, &color.high) &&
;5475:		PC_Color_Parse(handle, &color.color) ) {
line 5476
;5476:		if (item->numColors < MAX_COLOR_RANGES) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 10
GEI4 $2574
line 5477
;5477:			memcpy(&item->colorRanges[item->numColors], &color, sizeof(color));
ADDRLP4 36
CNSTI4 24
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
MULI4
ADDRLP4 40
INDIRP4
CNSTI4 308
ADDP4
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 5478
;5478:			item->numColors++;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5479
;5479:		}
LABELV $2574
line 5480
;5480:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2569
JUMPV
LABELV $2570
line 5482
;5481:	}
;5482:	return qfalse;
CNSTI4 0
RETI4
LABELV $2569
endproc ItemParse_addColorRange 48 12
export ItemParse_ownerdrawFlag
proc ItemParse_ownerdrawFlag 12 8
line 5485
;5483:}
;5484:
;5485:qboolean ItemParse_ownerdrawFlag( itemDef_t *item, int handle ) {
line 5487
;5486:	int i;
;5487:	if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2577
line 5488
;5488:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2576
JUMPV
LABELV $2577
line 5490
;5489:	}
;5490:	item->window.ownerDrawFlags |= i;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 5491
;5491:	return qtrue;
CNSTI4 1
RETI4
LABELV $2576
endproc ItemParse_ownerdrawFlag 12 8
export ItemParse_enableCvar
proc ItemParse_enableCvar 4 8
line 5494
;5492:}
;5493:
;5494:qboolean ItemParse_enableCvar( itemDef_t *item, int handle ) {
line 5495
;5495:	if (PC_Script_Parse(handle, &item->enableCvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2580
line 5496
;5496:		item->cvarFlags = CVAR_ENABLE;
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
CNSTI4 1
ASGNI4
line 5497
;5497:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2579
JUMPV
LABELV $2580
line 5499
;5498:	}
;5499:	return qfalse;
CNSTI4 0
RETI4
LABELV $2579
endproc ItemParse_enableCvar 4 8
export ItemParse_disableCvar
proc ItemParse_disableCvar 4 8
line 5502
;5500:}
;5501:
;5502:qboolean ItemParse_disableCvar( itemDef_t *item, int handle ) {
line 5503
;5503:	if (PC_Script_Parse(handle, &item->enableCvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2583
line 5504
;5504:		item->cvarFlags = CVAR_DISABLE;
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
CNSTI4 2
ASGNI4
line 5505
;5505:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2582
JUMPV
LABELV $2583
line 5507
;5506:	}
;5507:	return qfalse;
CNSTI4 0
RETI4
LABELV $2582
endproc ItemParse_disableCvar 4 8
export ItemParse_showCvar
proc ItemParse_showCvar 4 8
line 5510
;5508:}
;5509:
;5510:qboolean ItemParse_showCvar( itemDef_t *item, int handle ) {
line 5511
;5511:	if (PC_Script_Parse(handle, &item->enableCvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2586
line 5512
;5512:		item->cvarFlags = CVAR_SHOW;
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
CNSTI4 4
ASGNI4
line 5513
;5513:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2585
JUMPV
LABELV $2586
line 5515
;5514:	}
;5515:	return qfalse;
CNSTI4 0
RETI4
LABELV $2585
endproc ItemParse_showCvar 4 8
export ItemParse_hideCvar
proc ItemParse_hideCvar 4 8
line 5518
;5516:}
;5517:
;5518:qboolean ItemParse_hideCvar( itemDef_t *item, int handle ) {
line 5519
;5519:	if (PC_Script_Parse(handle, &item->enableCvar)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2589
line 5520
;5520:		item->cvarFlags = CVAR_HIDE;
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
CNSTI4 8
ASGNI4
line 5521
;5521:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2588
JUMPV
LABELV $2589
line 5523
;5522:	}
;5523:	return qfalse;
CNSTI4 0
RETI4
LABELV $2588
endproc ItemParse_hideCvar 4 8
data
export itemParseKeywords
align 4
LABELV itemParseKeywords
address $2591
address ItemParse_name
byte 4 0
address $2592
address ItemParse_text
byte 4 0
address $2593
address ItemParse_group
byte 4 0
address $2594
address ItemParse_asset_model
byte 4 0
address $2595
address ItemParse_asset_shader
byte 4 0
address $2596
address ItemParse_model_origin
byte 4 0
address $2597
address ItemParse_model_fovx
byte 4 0
address $2598
address ItemParse_model_fovy
byte 4 0
address $2599
address ItemParse_model_rotation
byte 4 0
address $2600
address ItemParse_model_angle
byte 4 0
address $2601
address ItemParse_rect
byte 4 0
address $2602
address ItemParse_style
byte 4 0
address $2603
address ItemParse_decoration
byte 4 0
address $2604
address ItemParse_notselectable
byte 4 0
address $2605
address ItemParse_wrapped
byte 4 0
address $2606
address ItemParse_autowrapped
byte 4 0
address $2607
address ItemParse_horizontalscroll
byte 4 0
address $2608
address ItemParse_type
byte 4 0
address $2609
address ItemParse_elementwidth
byte 4 0
address $2610
address ItemParse_elementheight
byte 4 0
address $2611
address ItemParse_feeder
byte 4 0
address $2612
address ItemParse_elementtype
byte 4 0
address $2613
address ItemParse_columns
byte 4 0
address $2614
address ItemParse_border
byte 4 0
address $2615
address ItemParse_bordersize
byte 4 0
address $2616
address ItemParse_visible
byte 4 0
address $2617
address ItemParse_ownerdraw
byte 4 0
address $2618
address ItemParse_align
byte 4 0
address $2619
address ItemParse_textalign
byte 4 0
address $2620
address ItemParse_textalignx
byte 4 0
address $2621
address ItemParse_textaligny
byte 4 0
address $2622
address ItemParse_textscale
byte 4 0
address $2623
address ItemParse_textstyle
byte 4 0
address $473
address ItemParse_backcolor
byte 4 0
address $476
address ItemParse_forecolor
byte 4 0
address $479
address ItemParse_bordercolor
byte 4 0
address $2624
address ItemParse_outlinecolor
byte 4 0
address $2625
address ItemParse_background
byte 4 0
address $2626
address ItemParse_onFocus
byte 4 0
address $2627
address ItemParse_leaveFocus
byte 4 0
address $2628
address ItemParse_mouseEnter
byte 4 0
address $2629
address ItemParse_mouseExit
byte 4 0
address $2630
address ItemParse_mouseEnterText
byte 4 0
address $2631
address ItemParse_mouseExitText
byte 4 0
address $2632
address ItemParse_action
byte 4 0
address $2633
address ItemParse_special
byte 4 0
address $2634
address ItemParse_cvar
byte 4 0
address $2635
address ItemParse_maxChars
byte 4 0
address $2636
address ItemParse_maxPaintChars
byte 4 0
address $2637
address ItemParse_focusSound
byte 4 0
address $2638
address ItemParse_cvarFloat
byte 4 0
address $2639
address ItemParse_cvarStrList
byte 4 0
address $2640
address ItemParse_cvarFloatList
byte 4 0
address $2641
address ItemParse_addColorRange
byte 4 0
address $2642
address ItemParse_ownerdrawFlag
byte 4 0
address $2643
address ItemParse_enableCvar
byte 4 0
address $2644
address ItemParse_cvarTest
byte 4 0
address $2645
address ItemParse_disableCvar
byte 4 0
address $2646
address ItemParse_showCvar
byte 4 0
address $2647
address ItemParse_hideCvar
byte 4 0
address $2648
address ItemParse_cinematic
byte 4 0
address $2649
address ItemParse_doubleClick
byte 4 0
address $2650
address ItemParse_ownerParam
byte 4 0
address $2651
address ItemParse_teamcolor
byte 4 0
address $2652
address ItemParse_strechpic
byte 4 0
address $107
byte 4 0
byte 4 0
export Item_Parse
code
proc Item_Parse 1060 12
line 5617
;5524:}
;5525:
;5526:
;5527:keywordHash_t itemParseKeywords[] = {
;5528:	{"name", ItemParse_name, NULL},
;5529:	{"text", ItemParse_text, NULL},
;5530:	{"group", ItemParse_group, NULL},
;5531:	{"asset_model", ItemParse_asset_model, NULL},
;5532:	{"asset_shader", ItemParse_asset_shader, NULL},
;5533:	{"model_origin", ItemParse_model_origin, NULL},
;5534:	{"model_fovx", ItemParse_model_fovx, NULL},
;5535:	{"model_fovy", ItemParse_model_fovy, NULL},
;5536:	{"model_rotation", ItemParse_model_rotation, NULL},
;5537:	{"model_angle", ItemParse_model_angle, NULL},
;5538:	{"rect", ItemParse_rect, NULL},
;5539:	{"style", ItemParse_style, NULL},
;5540:	{"decoration", ItemParse_decoration, NULL},
;5541:	{"notselectable", ItemParse_notselectable, NULL},
;5542:	{"wrapped", ItemParse_wrapped, NULL},
;5543:	{"autowrapped", ItemParse_autowrapped, NULL},
;5544:	{"horizontalscroll", ItemParse_horizontalscroll, NULL},
;5545:	{"type", ItemParse_type, NULL},
;5546:	{"elementwidth", ItemParse_elementwidth, NULL},
;5547:	{"elementheight", ItemParse_elementheight, NULL},
;5548:	{"feeder", ItemParse_feeder, NULL},
;5549:	{"elementtype", ItemParse_elementtype, NULL},
;5550:	{"columns", ItemParse_columns, NULL},
;5551:	{"border", ItemParse_border, NULL},
;5552:	{"bordersize", ItemParse_bordersize, NULL},
;5553:	{"visible", ItemParse_visible, NULL},
;5554:	{"ownerdraw", ItemParse_ownerdraw, NULL},
;5555:	{"align", ItemParse_align, NULL},
;5556:	{"textalign", ItemParse_textalign, NULL},
;5557:	{"textalignx", ItemParse_textalignx, NULL},
;5558:	{"textaligny", ItemParse_textaligny, NULL},
;5559:	{"textscale", ItemParse_textscale, NULL},
;5560:	{"textstyle", ItemParse_textstyle, NULL},
;5561:	{"backcolor", ItemParse_backcolor, NULL},
;5562:	{"forecolor", ItemParse_forecolor, NULL},
;5563:	{"bordercolor", ItemParse_bordercolor, NULL},
;5564:	{"outlinecolor", ItemParse_outlinecolor, NULL},
;5565:	{"background", ItemParse_background, NULL},
;5566:	{"onFocus", ItemParse_onFocus, NULL},
;5567:	{"leaveFocus", ItemParse_leaveFocus, NULL},
;5568:	{"mouseEnter", ItemParse_mouseEnter, NULL},
;5569:	{"mouseExit", ItemParse_mouseExit, NULL},
;5570:	{"mouseEnterText", ItemParse_mouseEnterText, NULL},
;5571:	{"mouseExitText", ItemParse_mouseExitText, NULL},
;5572:	{"action", ItemParse_action, NULL},
;5573:	{"special", ItemParse_special, NULL},
;5574:	{"cvar", ItemParse_cvar, NULL},
;5575:	{"maxChars", ItemParse_maxChars, NULL},
;5576:	{"maxPaintChars", ItemParse_maxPaintChars, NULL},
;5577:	{"focusSound", ItemParse_focusSound, NULL},
;5578:	{"cvarFloat", ItemParse_cvarFloat, NULL},
;5579:	{"cvarStrList", ItemParse_cvarStrList, NULL},
;5580:	{"cvarFloatList", ItemParse_cvarFloatList, NULL},
;5581:	{"addColorRange", ItemParse_addColorRange, NULL},
;5582:	{"ownerdrawFlag", ItemParse_ownerdrawFlag, NULL},
;5583:	{"enableCvar", ItemParse_enableCvar, NULL},
;5584:	{"cvarTest", ItemParse_cvarTest, NULL},
;5585:	{"disableCvar", ItemParse_disableCvar, NULL},
;5586:	{"showCvar", ItemParse_showCvar, NULL},
;5587:	{"hideCvar", ItemParse_hideCvar, NULL},
;5588:	{"cinematic", ItemParse_cinematic, NULL},
;5589:	{"doubleclick", ItemParse_doubleClick, NULL},
;5590:	{"ownerParam", ItemParse_ownerParam, NULL },
;5591:	{"teamcolor", ItemParse_teamcolor, NULL },
;5592:	{"useStrechPic", ItemParse_strechpic, NULL },
;5593:	{"", NULL, NULL}
;5594:};
;5595:
;5596://keywordHash_t *itemParseKeywordHash[KEYWORDHASH_SIZE];
;5597:
;5598:/*
;5599:===============
;5600:Item_SetupKeywordHash
;5601:===============
;5602:
;5603:void Item_SetupKeywordHash(void) {
;5604:	int i;
;5605:
;5606:	memset(itemParseKeywordHash, 0, sizeof(itemParseKeywordHash));
;5607:	for (i = 0; itemParseKeywords[i].keyword; i++) {
;5608:		KeywordHash_Add(itemParseKeywordHash, &itemParseKeywords[i]);
;5609:	}
;5610:}
;5611:*/
;5612:/*
;5613:===============
;5614:Item_Parse
;5615:===============
;5616:*/
;5617:qboolean Item_Parse(int handle, itemDef_t *item) {
line 5622
;5618:	pc_token_t token;
;5619:	keywordHash_t *key;
;5620:
;5621:
;5622:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2654
line 5623
;5623:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2653
JUMPV
LABELV $2654
line 5624
;5624:	if (*token.string != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2660
line 5625
;5625:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2653
JUMPV
LABELV $2659
line 5627
;5626:	}
;5627:	while ( 1 ) {
line 5628
;5628:		if (!trap_PC_ReadToken(handle, &token)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2662
line 5629
;5629:			PC_SourceError(handle, "end of file inside menu item\n");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2528
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5630
;5630:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2653
JUMPV
LABELV $2662
line 5633
;5631:		}
;5632:
;5633:		if (*token.string == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2664
line 5634
;5634:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2653
JUMPV
LABELV $2664
line 5638
;5635:		}
;5636:
;5637:		//key = KeywordHash_Find(itemParseKeywordHash, token.string);
;5638:		key = itemParse_Find( token.string );
ADDRLP4 0+16
ARGP4
ADDRLP4 1052
ADDRGP4 itemParse_Find
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1052
INDIRP4
ASGNP4
line 5639
;5639:		if (!key) {
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2668
line 5640
;5640:			PC_SourceError(handle, "unknown menu item keyword %s", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2670
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5641
;5641:			continue;
ADDRGP4 $2660
JUMPV
LABELV $2668
line 5643
;5642:		}
;5643:		if ( !key->func(item, handle) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRLP4 1040
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2672
line 5644
;5644:			PC_SourceError(handle, "couldn't parse menu item keyword %s", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2674
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 5645
;5645:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2653
JUMPV
LABELV $2672
line 5647
;5646:		}
;5647:	}
LABELV $2660
line 5627
ADDRGP4 $2659
JUMPV
line 5648
;5648:	return qtrue;
CNSTI4 1
RETI4
LABELV $2653
endproc Item_Parse 1060 12
export Item_InitControls
proc Item_InitControls 4 0
line 5654
;5649:}
;5650:
;5651:
;5652:// Item_InitControls
;5653:// init's special control types
;5654:void Item_InitControls(itemDef_t *item) {
line 5655
;5655:	if (item == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2677
line 5656
;5656:		return;
ADDRGP4 $2676
JUMPV
LABELV $2677
line 5658
;5657:	}
;5658:	if (item->type == ITEM_TYPE_LISTBOX) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2679
line 5659
;5659:		listBoxDef_t *listPtr = (listBoxDef_t*)item->typeData;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 5660
;5660:		item->cursorPos = 0;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 5661
;5661:		if (listPtr) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2681
line 5662
;5662:			listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 5663
;5663:			listPtr->startPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 5664
;5664:			listPtr->endPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 5665
;5665:			listPtr->cursorPos = 0;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 5666
;5666:		}
LABELV $2681
line 5667
;5667:	}
LABELV $2679
line 5668
;5668:}
LABELV $2676
endproc Item_InitControls 4 0
export MenuParse_font
proc MenuParse_font 12 12
line 5676
;5669:
;5670:/*
;5671:===============
;5672:Menu Keyword Parse functions
;5673:===============
;5674:*/
;5675:
;5676:qboolean MenuParse_font( itemDef_t *item, int handle ) {
line 5677
;5677:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5678
;5678:	if (!PC_String_Parse(handle, &menu->font)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2684
line 5679
;5679:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2683
JUMPV
LABELV $2684
line 5681
;5680:	}
;5681:	if (!DC->Assets.fontRegistered) {
ADDRGP4 DC
INDIRP4
CNSTI4 61996
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2686
line 5682
;5682:		DC->registerFont(menu->font, 48, &DC->Assets.textFont);
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRP4
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 244
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CALLV
pop
line 5683
;5683:		DC->Assets.fontRegistered = qtrue;
ADDRGP4 DC
INDIRP4
CNSTI4 61996
ADDP4
CNSTI4 1
ASGNI4
line 5684
;5684:	}
LABELV $2686
line 5685
;5685:	return qtrue;
CNSTI4 1
RETI4
LABELV $2683
endproc MenuParse_font 12 12
export MenuParse_name
proc MenuParse_name 12 8
line 5688
;5686:}
;5687:
;5688:qboolean MenuParse_name( itemDef_t *item, int handle ) {
line 5689
;5689:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5690
;5690:	if (!PC_String_Parse(handle, &menu->window.name)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2689
line 5691
;5691:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2688
JUMPV
LABELV $2689
line 5693
;5692:	}
;5693:	if (Q_stricmp(menu->window.name, "main") == 0) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ARGP4
ADDRGP4 $2693
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2691
line 5696
;5694:		// default main as having focus
;5695:		//menu->window.flags |= WINDOW_HASFOCUS;
;5696:	}
LABELV $2691
line 5697
;5697:	return qtrue;
CNSTI4 1
RETI4
LABELV $2688
endproc MenuParse_name 12 8
export MenuParse_fullscreen
proc MenuParse_fullscreen 8 8
line 5700
;5698:}
;5699:
;5700:qboolean MenuParse_fullscreen( itemDef_t *item, int handle ) {
line 5701
;5701:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5702
;5702:	if (!PC_Int_Parse( handle, &menu->fullScreen)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2695
line 5703
;5703:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2694
JUMPV
LABELV $2695
line 5705
;5704:	}
;5705:	return qtrue;
CNSTI4 1
RETI4
LABELV $2694
endproc MenuParse_fullscreen 8 8
export MenuParse_rect
proc MenuParse_rect 8 8
line 5708
;5706:}
;5707:
;5708:qboolean MenuParse_rect( itemDef_t *item, int handle ) {
line 5709
;5709:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5710
;5710:	if (!PC_Rect_Parse(handle, &menu->window.rect)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Rect_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2698
line 5711
;5711:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2697
JUMPV
LABELV $2698
line 5713
;5712:	}
;5713:	return qtrue;
CNSTI4 1
RETI4
LABELV $2697
endproc MenuParse_rect 8 8
export MenuParse_style
proc MenuParse_style 8 8
line 5716
;5714:}
;5715:
;5716:qboolean MenuParse_style( itemDef_t *item, int handle ) {
line 5717
;5717:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5718
;5718:	if (!PC_Int_Parse(handle, &menu->window.style)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2701
line 5719
;5719:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2700
JUMPV
LABELV $2701
line 5721
;5720:	}
;5721:	return qtrue;
CNSTI4 1
RETI4
LABELV $2700
endproc MenuParse_style 8 8
export MenuParse_visible
proc MenuParse_visible 16 8
line 5724
;5722:}
;5723:
;5724:qboolean MenuParse_visible( itemDef_t *item, int handle ) {
line 5726
;5725:	int i;
;5726:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5728
;5727:
;5728:	if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2704
line 5729
;5729:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2703
JUMPV
LABELV $2704
line 5731
;5730:	}
;5731:	if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2706
line 5732
;5732:		menu->window.flags |= WINDOW_VISIBLE;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 5733
;5733:	}
LABELV $2706
line 5734
;5734:	return qtrue;
CNSTI4 1
RETI4
LABELV $2703
endproc MenuParse_visible 16 8
export MenuParse_onOpen
proc MenuParse_onOpen 8 8
line 5737
;5735:}
;5736:
;5737:qboolean MenuParse_onOpen( itemDef_t *item, int handle ) {
line 5738
;5738:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5739
;5739:	if (!PC_Script_Parse(handle, &menu->onOpen)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2709
line 5740
;5740:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2708
JUMPV
LABELV $2709
line 5742
;5741:	}
;5742:	return qtrue;
CNSTI4 1
RETI4
LABELV $2708
endproc MenuParse_onOpen 8 8
export MenuParse_onClose
proc MenuParse_onClose 8 8
line 5745
;5743:}
;5744:
;5745:qboolean MenuParse_onClose( itemDef_t *item, int handle ) {
line 5746
;5746:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5747
;5747:	if (!PC_Script_Parse(handle, &menu->onClose)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2712
line 5748
;5748:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2711
JUMPV
LABELV $2712
line 5750
;5749:	}
;5750:	return qtrue;
CNSTI4 1
RETI4
LABELV $2711
endproc MenuParse_onClose 8 8
export MenuParse_onESC
proc MenuParse_onESC 8 8
line 5753
;5751:}
;5752:
;5753:qboolean MenuParse_onESC( itemDef_t *item, int handle ) {
line 5754
;5754:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5755
;5755:	if (!PC_Script_Parse(handle, &menu->onESC)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Script_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2715
line 5756
;5756:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2714
JUMPV
LABELV $2715
line 5758
;5757:	}
;5758:	return qtrue;
CNSTI4 1
RETI4
LABELV $2714
endproc MenuParse_onESC 8 8
export MenuParse_border
proc MenuParse_border 8 8
line 5763
;5759:}
;5760:
;5761:
;5762:
;5763:qboolean MenuParse_border( itemDef_t *item, int handle ) {
line 5764
;5764:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5765
;5765:	if (!PC_Int_Parse(handle, &menu->window.border)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2718
line 5766
;5766:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2717
JUMPV
LABELV $2718
line 5768
;5767:	}
;5768:	return qtrue;
CNSTI4 1
RETI4
LABELV $2717
endproc MenuParse_border 8 8
export MenuParse_borderSize
proc MenuParse_borderSize 8 8
line 5771
;5769:}
;5770:
;5771:qboolean MenuParse_borderSize( itemDef_t *item, int handle ) {
line 5772
;5772:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5773
;5773:	if (!PC_Float_Parse(handle, &menu->window.borderSize)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2721
line 5774
;5774:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2720
JUMPV
LABELV $2721
line 5776
;5775:	}
;5776:	return qtrue;
CNSTI4 1
RETI4
LABELV $2720
endproc MenuParse_borderSize 8 8
export MenuParse_backcolor
proc MenuParse_backcolor 16 8
line 5779
;5777:}
;5778:
;5779:qboolean MenuParse_backcolor( itemDef_t *item, int handle ) {
line 5782
;5780:	int i;
;5781:	float f;
;5782:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 5784
;5783:
;5784:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2724
line 5785
;5785:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2728
line 5786
;5786:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2723
JUMPV
LABELV $2728
line 5788
;5787:		}
;5788:		menu->window.backColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5789
;5789:	}
LABELV $2725
line 5784
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2724
line 5790
;5790:	return qtrue;
CNSTI4 1
RETI4
LABELV $2723
endproc MenuParse_backcolor 16 8
export MenuParse_forecolor
proc MenuParse_forecolor 20 8
line 5793
;5791:}
;5792:
;5793:qboolean MenuParse_forecolor( itemDef_t *item, int handle ) {
line 5796
;5794:	int i;
;5795:	float f;
;5796:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5798
;5797:
;5798:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2731
line 5799
;5799:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2735
line 5800
;5800:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2730
JUMPV
LABELV $2735
line 5802
;5801:		}
;5802:		menu->window.foreColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 5803
;5803:		menu->window.flags |= WINDOW_FORECOLORSET;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 5804
;5804:	}
LABELV $2732
line 5798
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2731
line 5805
;5805:	return qtrue;
CNSTI4 1
RETI4
LABELV $2730
endproc MenuParse_forecolor 20 8
export MenuParse_bordercolor
proc MenuParse_bordercolor 16 8
line 5808
;5806:}
;5807:
;5808:qboolean MenuParse_bordercolor( itemDef_t *item, int handle ) {
line 5811
;5809:	int i;
;5810:	float f;
;5811:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 5813
;5812:
;5813:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2738
line 5814
;5814:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2742
line 5815
;5815:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2737
JUMPV
LABELV $2742
line 5817
;5816:		}
;5817:		menu->window.borderColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 160
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5818
;5818:	}
LABELV $2739
line 5813
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2738
line 5819
;5819:	return qtrue;
CNSTI4 1
RETI4
LABELV $2737
endproc MenuParse_bordercolor 16 8
export MenuParse_focuscolor
proc MenuParse_focuscolor 16 8
line 5822
;5820:}
;5821:
;5822:qboolean MenuParse_focuscolor( itemDef_t *item, int handle ) {
line 5825
;5823:	int i;
;5824:	float f;
;5825:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 5827
;5826:
;5827:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2745
line 5828
;5828:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2749
line 5829
;5829:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2744
JUMPV
LABELV $2749
line 5831
;5830:		}
;5831:		menu->focusColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 244
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5832
;5832:	}
LABELV $2746
line 5827
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2745
line 5833
;5833:	return qtrue;
CNSTI4 1
RETI4
LABELV $2744
endproc MenuParse_focuscolor 16 8
export MenuParse_disablecolor
proc MenuParse_disablecolor 16 8
line 5836
;5834:}
;5835:
;5836:qboolean MenuParse_disablecolor( itemDef_t *item, int handle ) {
line 5839
;5837:	int i;
;5838:	float f;
;5839:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 5840
;5840:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2752
line 5841
;5841:		if (!PC_Float_Parse(handle, &f)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2756
line 5842
;5842:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2751
JUMPV
LABELV $2756
line 5844
;5843:		}
;5844:		menu->disableColor[i]  = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 260
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 5845
;5845:	}
LABELV $2753
line 5840
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2752
line 5846
;5846:	return qtrue;
CNSTI4 1
RETI4
LABELV $2751
endproc MenuParse_disablecolor 16 8
export MenuParse_outlinecolor
proc MenuParse_outlinecolor 8 8
line 5850
;5847:}
;5848:
;5849:
;5850:qboolean MenuParse_outlinecolor( itemDef_t *item, int handle ) {
line 5851
;5851:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5852
;5852:	if (!PC_Color_Parse(handle, &menu->window.outlineColor)){
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2759
line 5853
;5853:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2758
JUMPV
LABELV $2759
line 5855
;5854:	}
;5855:	return qtrue;
CNSTI4 1
RETI4
LABELV $2758
endproc MenuParse_outlinecolor 8 8
export MenuParse_background
proc MenuParse_background 16 8
line 5858
;5856:}
;5857:
;5858:qboolean MenuParse_background( itemDef_t *item, int handle ) {
line 5860
;5859:	const char *buff;
;5860:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5862
;5861:
;5862:	if (!PC_String_Parse(handle, &buff)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2762
line 5863
;5863:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2761
JUMPV
LABELV $2762
line 5865
;5864:	}
;5865:	menu->window.background = DC->registerShaderNoMip(buff);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DC
INDIRP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 5866
;5866:	return qtrue;
CNSTI4 1
RETI4
LABELV $2761
endproc MenuParse_background 16 8
export MenuParse_cinematic
proc MenuParse_cinematic 8 8
line 5869
;5867:}
;5868:
;5869:qboolean MenuParse_cinematic( itemDef_t *item, int handle ) {
line 5870
;5870:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5872
;5871:
;5872:	if (!PC_String_Parse(handle, &menu->window.cinematicName)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2765
line 5873
;5873:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2764
JUMPV
LABELV $2765
line 5875
;5874:	}
;5875:	return qtrue;
CNSTI4 1
RETI4
LABELV $2764
endproc MenuParse_cinematic 8 8
export ItemParse_ownerParam
proc ItemParse_ownerParam 8 8
line 5878
;5876:}
;5877:
;5878:qboolean ItemParse_ownerParam( itemDef_t *item, int handle ) {
line 5880
;5879:	int i;
;5880:	if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2768
line 5881
;5881:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2767
JUMPV
LABELV $2768
line 5883
;5882:	}
;5883:	item->ownerParam = i; 
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5884
;5884:	return qtrue;
CNSTI4 1
RETI4
LABELV $2767
endproc ItemParse_ownerParam 8 8
export MenuParse_ownerdrawFlag
proc MenuParse_ownerdrawFlag 16 8
line 5887
;5885:}
;5886:
;5887:qboolean MenuParse_ownerdrawFlag( itemDef_t *item, int handle ) {
line 5889
;5888:	int i;
;5889:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 5891
;5890:
;5891:	if (!PC_Int_Parse(handle, &i)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2771
line 5892
;5892:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2770
JUMPV
LABELV $2771
line 5894
;5893:	}
;5894:	menu->window.ownerDrawFlags |= i;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 5895
;5895:	return qtrue;
CNSTI4 1
RETI4
LABELV $2770
endproc MenuParse_ownerdrawFlag 16 8
export MenuParse_ownerdraw
proc MenuParse_ownerdraw 8 8
line 5898
;5896:}
;5897:
;5898:qboolean MenuParse_ownerdraw( itemDef_t *item, int handle ) {
line 5899
;5899:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5901
;5900:
;5901:	if (!PC_Int_Parse(handle, &menu->window.ownerDraw)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2774
line 5902
;5902:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2773
JUMPV
LABELV $2774
line 5904
;5903:	}
;5904:	return qtrue;
CNSTI4 1
RETI4
LABELV $2773
endproc MenuParse_ownerdraw 8 8
export MenuParse_popup
proc MenuParse_popup 8 0
line 5909
;5905:}
;5906:
;5907:
;5908:// decoration
;5909:qboolean MenuParse_popup( itemDef_t *item, int handle ) {
line 5910
;5910:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5911
;5911:	menu->window.flags |= WINDOW_POPUP;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2097152
BORI4
ASGNI4
line 5912
;5912:	return qtrue;
CNSTI4 1
RETI4
LABELV $2776
endproc MenuParse_popup 8 0
export MenuParse_outOfBounds
proc MenuParse_outOfBounds 8 0
line 5916
;5913:}
;5914:
;5915:
;5916:qboolean MenuParse_outOfBounds( itemDef_t *item, int handle ) {
line 5917
;5917:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5919
;5918:
;5919:	menu->window.flags |= WINDOW_OOB_CLICK;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 5920
;5920:	return qtrue;
CNSTI4 1
RETI4
LABELV $2777
endproc MenuParse_outOfBounds 8 0
export MenuParse_soundLoop
proc MenuParse_soundLoop 8 8
line 5923
;5921:}
;5922:
;5923:qboolean MenuParse_soundLoop( itemDef_t *item, int handle ) {
line 5924
;5924:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5926
;5925:
;5926:	if (!PC_String_Parse(handle, &menu->soundName)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2779
line 5927
;5927:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2778
JUMPV
LABELV $2779
line 5929
;5928:	}
;5929:	return qtrue;
CNSTI4 1
RETI4
LABELV $2778
endproc MenuParse_soundLoop 8 8
export MenuParse_fadeClamp
proc MenuParse_fadeClamp 8 8
line 5932
;5930:}
;5931:
;5932:qboolean MenuParse_fadeClamp( itemDef_t *item, int handle ) {
line 5933
;5933:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5935
;5934:
;5935:	if (!PC_Float_Parse(handle, &menu->fadeClamp)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2782
line 5936
;5936:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2781
JUMPV
LABELV $2782
line 5938
;5937:	}
;5938:	return qtrue;
CNSTI4 1
RETI4
LABELV $2781
endproc MenuParse_fadeClamp 8 8
export MenuParse_fadeAmount
proc MenuParse_fadeAmount 8 8
line 5941
;5939:}
;5940:
;5941:qboolean MenuParse_fadeAmount( itemDef_t *item, int handle ) {
line 5942
;5942:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5944
;5943:
;5944:	if (!PC_Float_Parse(handle, &menu->fadeAmount)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2785
line 5945
;5945:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2784
JUMPV
LABELV $2785
line 5947
;5946:	}
;5947:	return qtrue;
CNSTI4 1
RETI4
LABELV $2784
endproc MenuParse_fadeAmount 8 8
export MenuParse_fadeCycle
proc MenuParse_fadeCycle 8 8
line 5951
;5948:}
;5949:
;5950:
;5951:qboolean MenuParse_fadeCycle( itemDef_t *item, int handle ) {
line 5952
;5952:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5954
;5953:
;5954:	if (!PC_Int_Parse(handle, &menu->fadeCycle)) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2788
line 5955
;5955:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2787
JUMPV
LABELV $2788
line 5957
;5956:	}
;5957:	return qtrue;
CNSTI4 1
RETI4
LABELV $2787
endproc MenuParse_fadeCycle 8 8
export MenuParse_itemDef
proc MenuParse_itemDef 40 8
line 5961
;5958:}
;5959:
;5960:
;5961:qboolean MenuParse_itemDef( itemDef_t *item, int handle ) {
line 5962
;5962:	menuDef_t *menu = (menuDef_t*)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 5963
;5963:	if (menu->itemCount < MAX_MENUITEMS) {
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 256
GEI4 $2791
line 5964
;5964:		menu->items[menu->itemCount] = UI_Alloc(sizeof(itemDef_t));
CNSTI4 568
ARGI4
ADDRLP4 4
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 5965
;5965:		Item_Init(menu->items[menu->itemCount]);
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_Init
CALLV
pop
line 5966
;5966:		if (!Item_Parse(handle, menu->items[menu->itemCount])) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Item_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2793
line 5967
;5967:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2790
JUMPV
LABELV $2793
line 5969
;5968:		}
;5969:		Item_InitControls(menu->items[menu->itemCount]);
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_InitControls
CALLV
pop
line 5970
;5970:		menu->items[menu->itemCount++]->parent = menu;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRP4
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 5971
;5971:	}
LABELV $2791
line 5972
;5972:	return qtrue;
CNSTI4 1
RETI4
LABELV $2790
endproc MenuParse_itemDef 40 8
data
export menuParseKeywords
align 4
LABELV menuParseKeywords
address $2795
address MenuParse_font
byte 4 0
address $2591
address MenuParse_name
byte 4 0
address $2796
address MenuParse_fullscreen
byte 4 0
address $2601
address MenuParse_rect
byte 4 0
address $2602
address MenuParse_style
byte 4 0
address $2616
address MenuParse_visible
byte 4 0
address $2797
address MenuParse_onOpen
byte 4 0
address $2798
address MenuParse_onClose
byte 4 0
address $2799
address MenuParse_onESC
byte 4 0
address $2614
address MenuParse_border
byte 4 0
address $2800
address MenuParse_borderSize
byte 4 0
address $473
address MenuParse_backcolor
byte 4 0
address $476
address MenuParse_forecolor
byte 4 0
address $479
address MenuParse_bordercolor
byte 4 0
address $2801
address MenuParse_focuscolor
byte 4 0
address $2802
address MenuParse_disablecolor
byte 4 0
address $2624
address MenuParse_outlinecolor
byte 4 0
address $2625
address MenuParse_background
byte 4 0
address $2617
address MenuParse_ownerdraw
byte 4 0
address $2642
address MenuParse_ownerdrawFlag
byte 4 0
address $2803
address MenuParse_outOfBounds
byte 4 0
address $2804
address MenuParse_soundLoop
byte 4 0
address $2805
address MenuParse_itemDef
byte 4 0
address $2648
address MenuParse_cinematic
byte 4 0
address $2806
address MenuParse_popup
byte 4 0
address $2807
address MenuParse_fadeClamp
byte 4 0
address $2808
address MenuParse_fadeCycle
byte 4 0
address $2809
address MenuParse_fadeAmount
byte 4 0
address $107
address MenuParse_fadeAmount
byte 4 0
export Menu_Parse
code
proc Menu_Parse 1060 12
line 6028
;5973:}
;5974:
;5975:keywordHash_t menuParseKeywords[] = {
;5976:	{"font", MenuParse_font, NULL},
;5977:	{"name", MenuParse_name, NULL},
;5978:	{"fullscreen", MenuParse_fullscreen, NULL},
;5979:	{"rect", MenuParse_rect, NULL},
;5980:	{"style", MenuParse_style, NULL},
;5981:	{"visible", MenuParse_visible, NULL},
;5982:	{"onOpen", MenuParse_onOpen, NULL},
;5983:	{"onClose", MenuParse_onClose, NULL},
;5984:	{"onESC", MenuParse_onESC, NULL},
;5985:	{"border", MenuParse_border, NULL},
;5986:	{"borderSize", MenuParse_borderSize, NULL},
;5987:	{"backcolor", MenuParse_backcolor, NULL},
;5988:	{"forecolor", MenuParse_forecolor, NULL},
;5989:	{"bordercolor", MenuParse_bordercolor, NULL},
;5990:	{"focuscolor", MenuParse_focuscolor, NULL},
;5991:	{"disablecolor", MenuParse_disablecolor, NULL},
;5992:	{"outlinecolor", MenuParse_outlinecolor, NULL},
;5993:	{"background", MenuParse_background, NULL},
;5994:	{"ownerdraw", MenuParse_ownerdraw, NULL},
;5995:	{"ownerdrawFlag", MenuParse_ownerdrawFlag, NULL},
;5996:	{"outOfBoundsClick", MenuParse_outOfBounds, NULL},
;5997:	{"soundLoop", MenuParse_soundLoop, NULL},
;5998:	{"itemDef", MenuParse_itemDef, NULL},
;5999:	{"cinematic", MenuParse_cinematic, NULL},
;6000:	{"popup", MenuParse_popup, NULL},
;6001:	{"fadeClamp", MenuParse_fadeClamp, NULL},
;6002:	{"fadeCycle", MenuParse_fadeCycle, NULL},
;6003:	{"fadeAmount", MenuParse_fadeAmount, NULL},
;6004:	{"", MenuParse_fadeAmount, NULL}
;6005:};
;6006:/*
;6007:keywordHash_t *menuParseKeywordHash[KEYWORDHASH_SIZE];
;6008:
;6009:/*
;6010:===============
;6011:Menu_SetupKeywordHash
;6012:===============
;6013:
;6014:void Menu_SetupKeywordHash(void) {
;6015:	int i;
;6016:
;6017:	memset(menuParseKeywordHash, 0, sizeof(menuParseKeywordHash));
;6018:	for (i = 0; menuParseKeywords[i].keyword; i++) {
;6019:		KeywordHash_Add(menuParseKeywordHash, &menuParseKeywords[i]);
;6020:	}
;6021:}*/
;6022:
;6023:/*
;6024:===============
;6025:Menu_Parse
;6026:===============
;6027:*/
;6028:qboolean Menu_Parse(int handle, menuDef_t *menu) {
line 6032
;6029:	pc_token_t token;
;6030:	keywordHash_t *key;
;6031:
;6032:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2811
line 6033
;6033:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2810
JUMPV
LABELV $2811
line 6034
;6034:	if (*token.string != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2817
line 6035
;6035:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2810
JUMPV
LABELV $2816
line 6038
;6036:	}
;6037:    
;6038:	while ( 1 ) {
line 6040
;6039:
;6040:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6041
;6041:		if (!trap_PC_ReadToken(handle, &token)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2819
line 6042
;6042:			PC_SourceError(handle, "end of file inside menu\n");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2821
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 6043
;6043:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2810
JUMPV
LABELV $2819
line 6046
;6044:		}
;6045:
;6046:		if (*token.string == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2822
line 6047
;6047:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2810
JUMPV
LABELV $2822
line 6051
;6048:		}
;6049:
;6050://	key = KeywordHash_Find(menuParseKeywordHash, token.string);
;6051:		key = menuParse_Find( token.string );
ADDRLP4 0+16
ARGP4
ADDRLP4 1052
ADDRGP4 menuParse_Find
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1052
INDIRP4
ASGNP4
line 6052
;6052:		if (!key) {
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2826
line 6053
;6053:			PC_SourceError(handle, "unknown menu keyword %s", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2828
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 6054
;6054:			continue;
ADDRGP4 $2817
JUMPV
LABELV $2826
line 6056
;6055:		}
;6056:		if ( !key->func((itemDef_t*)menu, handle) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRLP4 1040
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2830
line 6057
;6057:			PC_SourceError(handle, "couldn't parse menu keyword %s", token.string);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $2832
ARGP4
ADDRLP4 0+16
ARGP4
ADDRGP4 PC_SourceError
CALLV
pop
line 6058
;6058:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2810
JUMPV
LABELV $2830
line 6060
;6059:		}
;6060:	}
LABELV $2817
line 6038
ADDRGP4 $2816
JUMPV
line 6061
;6061:	return qtrue;
CNSTI4 1
RETI4
LABELV $2810
endproc Menu_Parse 1060 12
export Menu_New
proc Menu_New 12 8
line 6069
;6062:}
;6063:
;6064:/*
;6065:===============
;6066:Menu_New
;6067:===============
;6068:*/
;6069:void Menu_New(int handle) {
line 6070
;6070:	menuDef_t *menu = &Menus[menuCount];
ADDRLP4 0
CNSTI4 1300
ADDRGP4 menuCount
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ASGNP4
line 6072
;6071:
;6072:	if (menuCount < MAX_MENUS) {
ADDRGP4 menuCount
INDIRI4
CNSTI4 64
GEI4 $2835
line 6073
;6073:		Menu_Init(menu);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_Init
CALLV
pop
line 6074
;6074:		if (Menu_Parse(handle, menu)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Menu_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2837
line 6075
;6075:			Menu_PostParse(menu);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_PostParse
CALLV
pop
line 6076
;6076:			menuCount++;
ADDRLP4 8
ADDRGP4 menuCount
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6077
;6077:		}
LABELV $2837
line 6078
;6078:	}
LABELV $2835
line 6079
;6079:}
LABELV $2834
endproc Menu_New 12 8
export Menu_Count
proc Menu_Count 0 0
line 6081
;6080:
;6081:int Menu_Count() {
line 6082
;6082:	return menuCount;
ADDRGP4 menuCount
INDIRI4
RETI4
LABELV $2839
endproc Menu_Count 0 0
lit
align 4
LABELV $2849
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export Menu_PaintAll
code
proc Menu_PaintAll 32 32
line 6085
;6083:}
;6084:
;6085:void Menu_PaintAll() {
line 6087
;6086:	int i;
;6087:	if (captureFunc) {
ADDRGP4 captureFunc
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2841
line 6088
;6088:		captureFunc(captureData);
ADDRGP4 captureData
INDIRP4
ARGP4
ADDRGP4 captureFunc
INDIRP4
CALLV
pop
line 6089
;6089:	}
LABELV $2841
line 6091
;6090:
;6091:	for (i = 0; i < Menu_Count(); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2846
JUMPV
LABELV $2843
line 6092
;6092:		Menu_Paint(&Menus[i], qfalse);
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 6093
;6093:	}
LABELV $2844
line 6091
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2846
ADDRLP4 4
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2843
line 6095
;6094:
;6095:	if (debugMode) {
ADDRGP4 debugMode
INDIRI4
CNSTI4 0
EQI4 $2847
line 6096
;6096:		vec4_t v = {1, 1, 1, 1};
ADDRLP4 8
ADDRGP4 $2849
INDIRB
ASGNB 16
line 6097
;6097:		DC->drawText(5, 25, .5, v, va("fps: %f", DC->FPS), 0, 0, 0);
ADDRGP4 $2850
ARGP4
ADDRGP4 DC
INDIRP4
CNSTI4 73464
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1084227584
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1056964608
ARGF4
ADDRLP4 8
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CALLV
pop
line 6098
;6098:	}
LABELV $2847
line 6099
;6099:}
LABELV $2840
endproc Menu_PaintAll 32 32
export Menu_Reset
proc Menu_Reset 0 0
line 6101
;6100:
;6101:void Menu_Reset() {
line 6102
;6102:	menuCount = 0;
ADDRGP4 menuCount
CNSTI4 0
ASGNI4
line 6103
;6103:}
LABELV $2851
endproc Menu_Reset 0 0
export Display_GetContext
proc Display_GetContext 0 0
line 6105
;6104:
;6105:displayContextDef_t *Display_GetContext() {
line 6106
;6106:	return DC;
ADDRGP4 DC
INDIRP4
RETP4
LABELV $2852
endproc Display_GetContext 0 0
export Display_CaptureItem
proc Display_CaptureItem 8 12
line 6112
;6107:}
;6108: 
;6109:static float captureX;
;6110:static float captureY;
;6111:
;6112:void *Display_CaptureItem(int x, int y) {
line 6115
;6113:	int i;
;6114:
;6115:	for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2857
JUMPV
LABELV $2854
line 6118
;6116:		// turn off focus each item
;6117:		// menu->items[i].window.flags &= ~WINDOW_HASFOCUS;
;6118:		if (Rect_ContainsPoint(&Menus[i].window.rect, x, y)) {
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2858
line 6119
;6119:			return &Menus[i];
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
RETP4
ADDRGP4 $2853
JUMPV
LABELV $2858
line 6121
;6120:		}
;6121:	}
LABELV $2855
line 6115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2857
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2854
line 6122
;6122:	return NULL;
CNSTP4 0
RETP4
LABELV $2853
endproc Display_CaptureItem 8 12
export Display_MouseMove
proc Display_MouseMove 16 12
line 6127
;6123:}
;6124:
;6125:
;6126:// FIXME: 
;6127:qboolean Display_MouseMove(void *p, int x, int y) {
line 6129
;6128:	int i;
;6129:	menuDef_t *menu = p;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 6131
;6130:
;6131:	if (menu == NULL) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2861
line 6132
;6132:    menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 6133
;6133:		if (menu) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2863
line 6134
;6134:			if (menu->window.flags & WINDOW_POPUP) {
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $2865
line 6135
;6135:				Menu_HandleMouseMove(menu, x, y);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 6136
;6136:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2860
JUMPV
LABELV $2865
line 6138
;6137:			}
;6138:		}
LABELV $2863
line 6139
;6139:		for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2870
JUMPV
LABELV $2867
line 6140
;6140:			Menu_HandleMouseMove(&Menus[i], x, y);
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 Menu_HandleMouseMove
CALLV
pop
line 6141
;6141:		}
LABELV $2868
line 6139
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2870
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2867
line 6142
;6142:	} else {
ADDRGP4 $2862
JUMPV
LABELV $2861
line 6143
;6143:		menu->window.rect.x += x;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6144
;6144:		menu->window.rect.y += y;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRFP4 8
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6145
;6145:		Menu_UpdatePosition(menu);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Menu_UpdatePosition
CALLV
pop
line 6146
;6146:	}
LABELV $2862
line 6147
;6147: 	return qtrue;
CNSTI4 1
RETI4
LABELV $2860
endproc Display_MouseMove 16 12
export Display_CursorType
proc Display_CursorType 32 12
line 6151
;6148:
;6149:}
;6150:
;6151:int Display_CursorType(int x, int y) {
line 6153
;6152:	int i;
;6153:	for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2875
JUMPV
LABELV $2872
line 6155
;6154:		rectDef_t r2;
;6155:		r2.x = Menus[i].window.rect.x - 3;
ADDRLP4 4
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
INDIRF4
CNSTF4 1077936128
SUBF4
ASGNF4
line 6156
;6156:		r2.y = Menus[i].window.rect.y - 3;
ADDRLP4 4+4
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus+4
ADDP4
INDIRF4
CNSTF4 1077936128
SUBF4
ASGNF4
line 6157
;6157:		r2.w = r2.h = 7;
ADDRLP4 24
CNSTF4 1088421888
ASGNF4
ADDRLP4 4+12
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 24
INDIRF4
ASGNF4
line 6158
;6158:		if (Rect_ContainsPoint(&r2, x, y)) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2880
line 6159
;6159:			return CURSOR_SIZER;
CNSTI4 4
RETI4
ADDRGP4 $2871
JUMPV
LABELV $2880
line 6161
;6160:		}
;6161:	}
LABELV $2873
line 6153
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2875
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2872
line 6162
;6162:	return CURSOR_ARROW;
CNSTI4 2
RETI4
LABELV $2871
endproc Display_CursorType 32 12
export Display_HandleKey
proc Display_HandleKey 12 12
line 6166
;6163:}
;6164:
;6165:
;6166:void Display_HandleKey(int key, qboolean down, int x, int y) {
line 6167
;6167:	menuDef_t *menu = Display_CaptureItem(x, y);
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Display_CaptureItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6168
;6168:	if (menu == NULL) {  
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2883
line 6169
;6169:		menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 6170
;6170:	}
LABELV $2883
line 6171
;6171:	if (menu) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2885
line 6172
;6172:		Menu_HandleKey(menu, key, down );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_HandleKey
CALLV
pop
line 6173
;6173:	}
LABELV $2885
line 6174
;6174:}
LABELV $2882
endproc Display_HandleKey 12 12
proc Window_CacheContents 12 20
line 6176
;6175:
;6176:static void Window_CacheContents(windowDef_t *window) {
line 6177
;6177:	if (window) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2888
line 6178
;6178:		if (window->cinematicName) {
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2890
line 6179
;6179:			int cin = DC->playCinematic(window->cinematicName, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 DC
INDIRP4
CNSTI4 184
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 6180
;6180:			DC->stopCinematic(cin);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 188
ADDP4
INDIRP4
CALLV
pop
line 6181
;6181:		}
LABELV $2890
line 6182
;6182:	}
LABELV $2888
line 6183
;6183:}
LABELV $2887
endproc Window_CacheContents 12 20
proc Item_CacheContents 0 4
line 6186
;6184:
;6185:
;6186:static void Item_CacheContents(itemDef_t *item) {
line 6187
;6187:	if (item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2893
line 6188
;6188:		Window_CacheContents(&item->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_CacheContents
CALLV
pop
line 6189
;6189:	}
LABELV $2893
line 6191
;6190:
;6191:}
LABELV $2892
endproc Item_CacheContents 0 4
proc Menu_CacheContents 8 8
line 6193
;6192:
;6193:static void Menu_CacheContents(menuDef_t *menu) {
line 6194
;6194:	if (menu) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2896
line 6196
;6195:		int i;
;6196:		Window_CacheContents(&menu->window);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Window_CacheContents
CALLV
pop
line 6197
;6197:		for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2901
JUMPV
LABELV $2898
line 6198
;6198:			Item_CacheContents(menu->items[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Item_CacheContents
CALLV
pop
line 6199
;6199:		}
LABELV $2899
line 6197
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2901
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $2898
line 6201
;6200:
;6201:		if (menu->soundName && *menu->soundName) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2902
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2902
line 6202
;6202:			DC->registerSound(menu->soundName, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 DC
INDIRP4
CNSTI4 172
ADDP4
INDIRP4
CALLI4
pop
line 6203
;6203:		}
LABELV $2902
line 6204
;6204:	}
LABELV $2896
line 6206
;6205:
;6206:}
LABELV $2895
endproc Menu_CacheContents 8 8
export Display_CacheAll
proc Display_CacheAll 4 4
line 6208
;6207:
;6208:void Display_CacheAll() {
line 6210
;6209:	int i;
;6210:	for (i = 0; i < menuCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2908
JUMPV
LABELV $2905
line 6211
;6211:		Menu_CacheContents(&Menus[i]);
CNSTI4 1300
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 Menus
ADDP4
ARGP4
ADDRGP4 Menu_CacheContents
CALLV
pop
line 6212
;6212:	}
LABELV $2906
line 6210
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2908
ADDRLP4 0
INDIRI4
ADDRGP4 menuCount
INDIRI4
LTI4 $2905
line 6213
;6213:}
LABELV $2904
endproc Display_CacheAll 4 4
proc Menu_OverActiveItem 32 12
line 6216
;6214:
;6215:
;6216:static qboolean Menu_OverActiveItem(menuDef_t *menu, float x, float y) {
line 6217
;6217: 	if (menu && menu->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED)) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2910
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
EQI4 $2910
line 6218
;6218:		if (Rect_ContainsPoint(&menu->window.rect, x, y)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2912
line 6220
;6219:			int i;
;6220:			for (i = 0; i < menu->itemCount; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2917
JUMPV
LABELV $2914
line 6224
;6221:				// turn off focus each item
;6222:				// menu->items[i].window.flags &= ~WINDOW_HASFOCUS;
;6223:
;6224:				if (!(menu->items[i]->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 1048580
BANDI4
CNSTI4 0
NEI4 $2918
line 6225
;6225:					continue;
ADDRGP4 $2915
JUMPV
LABELV $2918
line 6228
;6226:				}
;6227:
;6228:				if (menu->items[i]->window.flags & WINDOW_DECORATION) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2920
line 6229
;6229:					continue;
ADDRGP4 $2915
JUMPV
LABELV $2920
line 6232
;6230:				}
;6231:
;6232:				if (Rect_ContainsPoint(&menu->items[i]->window.rect, x, y)) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2922
line 6233
;6233:					itemDef_t *overItem = menu->items[i];
ADDRLP4 16
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDP4
INDIRP4
ASGNP4
line 6234
;6234:					if (overItem->type == ITEM_TYPE_TEXT && overItem->text) {
ADDRLP4 16
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2924
ADDRLP4 16
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2924
line 6235
;6235:						if (Rect_ContainsPoint(Item_CorrectedTextRect(overItem), x, y)) {
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Item_CorrectedTextRect
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Rect_ContainsPoint
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2915
line 6236
;6236:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2909
JUMPV
line 6237
;6237:						} else {
line 6238
;6238:							continue;
LABELV $2924
line 6240
;6239:						}
;6240:					} else {
line 6241
;6241:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2909
JUMPV
LABELV $2922
line 6244
;6242:					}
;6243:				}
;6244:			}
LABELV $2915
line 6220
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2917
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
LTI4 $2914
line 6246
;6245:
;6246:		}
LABELV $2912
line 6247
;6247:	}
LABELV $2910
line 6248
;6248:	return qfalse;
CNSTI4 0
RETI4
LABELV $2909
endproc Menu_OverActiveItem 32 12
bss
align 4
LABELV captureY
skip 4
align 4
LABELV captureX
skip 4
export g_nameBind2
align 1
LABELV g_nameBind2
skip 32
export g_nameBind1
align 1
LABELV g_nameBind1
skip 32
import UI_RunExtendedMenuScript
export strHandle
align 4
LABELV strHandle
skip 8192
export strPool
align 1
LABELV strPool
skip 131072
align 4
LABELV outOfMemory
skip 4
align 4
LABELV allocPoint
skip 4
align 1
LABELV memoryPool
skip 1048576
import Menu_SetupKeywordHash
import Item_SetupKeywordHash
export menuStack
align 4
LABELV menuStack
skip 64
export Menus
align 4
LABELV Menus
skip 83200
align 4
LABELV scrollInfo
skip 32
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Script_Parse
import Display_ExpandMacros
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
LABELV $2850
byte 1 102
byte 1 112
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $2832
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2828
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2821
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
byte 1 105
byte 1 110
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $2809
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 65
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $2808
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2807
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $2806
byte 1 112
byte 1 111
byte 1 112
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2805
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 68
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $2804
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $2803
byte 1 111
byte 1 117
byte 1 116
byte 1 79
byte 1 102
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2802
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2801
byte 1 102
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2800
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $2799
byte 1 111
byte 1 110
byte 1 69
byte 1 83
byte 1 67
byte 1 0
align 1
LABELV $2798
byte 1 111
byte 1 110
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $2797
byte 1 111
byte 1 110
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $2796
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $2795
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $2693
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2674
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2670
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2652
byte 1 117
byte 1 115
byte 1 101
byte 1 83
byte 1 116
byte 1 114
byte 1 101
byte 1 99
byte 1 104
byte 1 80
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $2651
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2650
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 114
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2649
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 99
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2648
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $2647
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2646
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2645
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2644
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 84
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2643
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2642
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 114
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $2641
byte 1 97
byte 1 100
byte 1 100
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2640
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 70
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2639
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 83
byte 1 116
byte 1 114
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2638
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 70
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2637
byte 1 102
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $2636
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 67
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2635
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2634
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $2633
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $2632
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2631
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $2630
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $2629
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2628
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2627
byte 1 108
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2626
byte 1 111
byte 1 110
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2625
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $2624
byte 1 111
byte 1 117
byte 1 116
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2623
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2622
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2621
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 121
byte 1 0
align 1
LABELV $2620
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 120
byte 1 0
align 1
LABELV $2619
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 0
align 1
LABELV $2618
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 0
align 1
LABELV $2617
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 114
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $2616
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2615
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $2614
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2613
byte 1 99
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2612
byte 1 101
byte 1 108
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2611
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2610
byte 1 101
byte 1 108
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2609
byte 1 101
byte 1 108
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $2608
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2607
byte 1 104
byte 1 111
byte 1 114
byte 1 105
byte 1 122
byte 1 111
byte 1 110
byte 1 116
byte 1 97
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2606
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 119
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2605
byte 1 119
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2604
byte 1 110
byte 1 111
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2603
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2602
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2601
byte 1 114
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2600
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2599
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2598
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 121
byte 1 0
align 1
LABELV $2597
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 120
byte 1 0
align 1
LABELV $2596
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2595
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2594
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $2593
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2592
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $2591
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2528
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
byte 1 105
byte 1 110
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $1860
byte 1 70
byte 1 73
byte 1 88
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $1822
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $1821
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 0
align 1
LABELV $1791
byte 1 105
byte 1 110
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1758
byte 1 99
byte 1 108
byte 1 95
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $1757
byte 1 109
byte 1 95
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1756
byte 1 106
byte 1 111
byte 1 121
byte 1 95
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $1755
byte 1 105
byte 1 110
byte 1 95
byte 1 106
byte 1 111
byte 1 121
byte 1 115
byte 1 116
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1754
byte 1 115
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1753
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $1752
byte 1 109
byte 1 95
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $1751
byte 1 99
byte 1 108
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1750
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 98
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $1749
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 98
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1748
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 98
byte 1 103
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $1747
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 104
byte 1 111
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1746
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 100
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1745
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1744
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 115
byte 1 97
byte 1 102
byte 1 101
byte 1 0
align 1
LABELV $1743
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1742
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1741
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $1740
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1739
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1738
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1737
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1736
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1735
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 103
byte 1 111
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $1734
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1733
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1732
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1731
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1730
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1729
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 110
byte 1 101
byte 1 103
byte 1 97
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1728
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 97
byte 1 102
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1727
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $1726
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $1725
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $1724
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1723
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1722
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 85
byte 1 112
byte 1 0
align 1
LABELV $1721
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $1720
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $1719
byte 1 43
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1718
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $1717
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 57
byte 1 0
align 1
LABELV $1716
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 56
byte 1 0
align 1
LABELV $1715
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 55
byte 1 0
align 1
LABELV $1714
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 54
byte 1 0
align 1
LABELV $1713
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 53
byte 1 0
align 1
LABELV $1712
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 52
byte 1 0
align 1
LABELV $1711
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $1710
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $1709
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $1708
byte 1 118
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $1707
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
LABELV $1706
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1705
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1704
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1703
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 57
byte 1 0
align 1
LABELV $1702
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 56
byte 1 0
align 1
LABELV $1701
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 55
byte 1 0
align 1
LABELV $1700
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1699
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 0
align 1
LABELV $1698
byte 1 98
byte 1 97
byte 1 110
byte 1 100
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1697
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 54
byte 1 0
align 1
LABELV $1696
byte 1 43
byte 1 109
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $1695
byte 1 43
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1694
byte 1 43
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1693
byte 1 43
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 0
align 1
LABELV $1692
byte 1 43
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1691
byte 1 43
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $1690
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1689
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1688
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1687
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $1686
byte 1 43
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1685
byte 1 43
byte 1 102
byte 1 111
byte 1 114
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $1684
byte 1 43
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1683
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 50
byte 1 0
align 1
LABELV $1682
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1665
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $1664
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1508
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1504
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1353
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 108
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1177
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $1119
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $762
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 0
align 1
LABELV $761
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $760
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $759
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $758
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $757
byte 1 115
byte 1 101
byte 1 116
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $756
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $755
byte 1 115
byte 1 101
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $754
byte 1 115
byte 1 101
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $753
byte 1 115
byte 1 101
byte 1 116
byte 1 102
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $752
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $751
byte 1 115
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $750
byte 1 115
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $749
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $748
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $747
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $746
byte 1 115
byte 1 101
byte 1 116
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $745
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $744
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $743
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $742
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $738
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $737
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $736
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $735
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $734
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $733
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $732
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $731
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $730
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $729
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $728
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $725
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $724
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $723
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $722
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $721
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $720
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $719
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $718
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $717
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $716
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $715
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $712
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $711
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $710
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $709
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $708
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $707
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $706
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $705
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $704
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 52
byte 1 48
byte 1 109
byte 1 109
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $703
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 52
byte 1 48
byte 1 109
byte 1 109
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $702
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 107
byte 1 50
byte 1 54
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $701
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 107
byte 1 50
byte 1 54
byte 1 0
align 1
LABELV $700
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $699
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $698
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $697
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $696
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 107
byte 1 101
byte 1 118
byte 1 108
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $695
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 107
byte 1 101
byte 1 118
byte 1 108
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $694
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $693
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $692
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $691
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $690
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $689
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $688
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 117
byte 1 99
byte 1 107
byte 1 98
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $687
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 117
byte 1 99
byte 1 107
byte 1 98
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $686
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $685
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $684
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $683
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $682
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $681
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $680
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $679
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $678
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $677
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $676
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $675
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $674
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $673
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $672
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $671
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $670
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $669
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $668
byte 1 47
byte 1 47
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
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
byte 1 10
byte 1 47
byte 1 47
byte 1 32
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
byte 1 58
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
byte 1 40
byte 1 99
byte 1 41
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 48
byte 1 45
byte 1 50
byte 1 48
byte 1 48
byte 1 49
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 45
byte 1 109
byte 1 105
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 10
byte 1 47
byte 1 47
byte 1 32
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 58
byte 1 47
byte 1 47
byte 1 119
byte 1 119
byte 1 119
byte 1 46
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 45
byte 1 109
byte 1 105
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 46
byte 1 110
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $665
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $664
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 47
byte 1 102
byte 1 102
byte 1 97
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $663
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 47
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $660
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $657
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $656
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $646
byte 1 37
byte 1 115
byte 1 32
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $639
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $635
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $479
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $476
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $473
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $256
byte 1 32
byte 1 0
align 1
LABELV $253
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $248
byte 1 125
byte 1 0
align 1
LABELV $239
byte 1 123
byte 1 0
align 1
LABELV $200
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $167
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $144
byte 1 94
byte 1 49
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
LABELV $140
byte 1 94
byte 1 51
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
LABELV $129
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 80
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 46
byte 1 49
byte 1 102
byte 1 37
byte 1 37
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $128
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 80
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 46
byte 1 49
byte 1 102
byte 1 37
byte 1 37
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $127
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
LABELV $126
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 47
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 80
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $107
byte 1 0
align 1
LABELV $98
byte 1 85
byte 1 73
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 58
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 46
byte 1 32
byte 1 79
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 33
byte 1 10
byte 1 0
