export CG_TargetCommand_f
code
proc CG_TargetCommand_f 20 12
file "../cg_consolecmds.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_consolecmds.c -- text commands typed in at the local console, or
;4:// executed by a key binding
;5:
;6:#include "cg_local.h"
;7:#include "../ui/ui_shared.h"
;8:#ifdef MISSIONPACK
;9:extern menuDef_t *menuScoreboard;
;10:#endif
;11:
;12:
;13:void CG_TargetCommand_f( void ) {
line 17
;14:	int		targetNum;
;15:	char	test[4];
;16:
;17:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 18
;18:	if (!targetNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $94
line 19
;19:		return;
ADDRGP4 $93
JUMPV
LABELV $94
line 22
;20:	}
;21:
;22:	trap_Argv( 1, test, 4 );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 23
;23:	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( test ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $96
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 24
;24:}
LABELV $93
endproc CG_TargetCommand_f 20 12
export CG_WriteRadarInfoToBRF_f
proc CG_WriteRadarInfoToBRF_f 660 28
line 28
;25:
;26:
;27:  void CG_WriteRadarInfoToBRF_f( void )
;28:{
line 34
;29:	char filename[128];
;30:	fileHandle_t	brfFile;
;31:	char		string[512];
;32:	int	i;
;33:
;34:	if ( !cg.cheatsEnabled )
ADDRGP4 cg+201980
INDIRI4
CNSTI4 0
NEI4 $98
line 35
;35:	{
line 36
;36:		CG_Printf("Please start your game with 'devmap' to use this command.\n");
ADDRGP4 $101
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 37
;37:		return;
ADDRGP4 $97
JUMPV
LABELV $98
line 39
;38:	}
;39:	Com_sprintf(filename, sizeof( filename), "briefing/map_%s.brf", cgs.cleanMapName );
ADDRLP4 520
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $102
ARGP4
ADDRGP4 cgs+214232
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 41
;40:
;41:	trap_FS_FOpenFile( filename, &brfFile, FS_APPEND_SYNC );
ADDRLP4 520
ARGP4
ADDRLP4 516
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 43
;42:
;43:	Com_sprintf( string, sizeof(string), "[radar]\n" );
ADDRLP4 4
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $104
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 44
;44:	trap_FS_Write( string, strlen( string ), brfFile );
ADDRLP4 4
ARGP4
ADDRLP4 648
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 648
INDIRI4
ARGI4
ADDRLP4 516
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 46
;45:
;46:	for ( i = 0; i < cg.radarNumObjects; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $105
line 47
;47:	{
line 48
;48:    	Com_sprintf( string, sizeof(string), "%c %f %f %f\n", cg.radarObjects[i].type, cg.radarObjects[i].origin[0], cg.radarObjects[i].origin[1], cg.radarObjects[i].origin[2] );
ADDRLP4 4
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $110
ARGP4
ADDRLP4 652
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 652
INDIRI4
ADDRGP4 cg+173308
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 652
INDIRI4
ADDRGP4 cg+173308+16
ADDP4
INDIRF4
ARGF4
ADDRLP4 652
INDIRI4
ADDRGP4 cg+173308+16+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 652
INDIRI4
ADDRGP4 cg+173308+16+8
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 49
;49:		trap_FS_Write( string, strlen( string ), brfFile );    
ADDRLP4 4
ARGP4
ADDRLP4 656
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 656
INDIRI4
ARGI4
ADDRLP4 516
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 50
;50:	}
LABELV $106
line 46
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $108
ADDRLP4 0
INDIRI4
ADDRGP4 cg+173304
INDIRI4
LTI4 $105
line 54
;51:
;52:	// todo
;53:	//  add radar entity writeout
;54:	Com_sprintf( string, sizeof(string), "[end]\n$EOF" );
ADDRLP4 4
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $120
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 55
;55:	trap_FS_Write( string, strlen( string ), brfFile );
ADDRLP4 4
ARGP4
ADDRLP4 652
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 652
INDIRI4
ARGI4
ADDRLP4 516
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 57
;56:
;57:	CG_Printf("Wrote %i radar entities to %s.\n", cg.radarNumObjects, filename );
ADDRGP4 $121
ARGP4
ADDRGP4 cg+173304
INDIRI4
ARGI4
ADDRLP4 520
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 59
;58:	
;59:}
LABELV $97
endproc CG_WriteRadarInfoToBRF_f 660 28
proc CG_SizeUp_f 4 8
line 68
;60:
;61:/*
;62:=================
;63:CG_SizeUp_f
;64:
;65:Keybinding command
;66:=================
;67:*/
;68:static void CG_SizeUp_f (void) {
line 69
;69:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
ADDRGP4 $125
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $124
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 70
;70:}
LABELV $123
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 80
;71:
;72:
;73:/*
;74:=================
;75:CG_SizeDown_f
;76:
;77:Keybinding command
;78:=================
;79:*/
;80:static void CG_SizeDown_f (void) {
line 81
;81:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
ADDRGP4 $125
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $124
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 82
;82:}
LABELV $127
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 92
;83:
;84:
;85:/*
;86:=============
;87:CG_Viewpos_f
;88:
;89:Debugging command to print the current position
;90:=============
;91:*/
;92:static void CG_Viewpos_f (void) {
line 93
;93:	CG_Printf ("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
ADDRGP4 $130
ARGP4
ADDRGP4 cg+109044+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109044+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109044+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109412+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 96
;94:		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
;95:		(int)cg.refdefViewAngles[YAW]);
;96:}
LABELV $129
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
line 99
;97:
;98:
;99:static void CG_ScoresDown_f( void ) {
line 102
;100:
;101:#ifdef MISSIONPACK
;102:		CG_BuildSpectatorString(); 
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 104
;103:#endif
;104:	if ( cg.scoresRequestTime + 2000 < cg.time ) {
ADDRGP4 cg+110828
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $142
line 107
;105:		// the scores are more than two seconds out of data,
;106:		// so request new ones
;107:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110828
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 108
;108:		trap_SendClientCommand( "score" );
ADDRGP4 $148
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 111
;109:
;110:		// leave the current scores up if they were already 
;111:		if ( !cg.showScores ) {
ADDRGP4 cg+112896
INDIRI4
CNSTI4 0
NEI4 $143
line 112
;112:			cg.showScores = qtrue; 
ADDRGP4 cg+112896
CNSTI4 1
ASGNI4
line 113
;113:		}
line 114
;114:	} else {
ADDRGP4 $143
JUMPV
LABELV $142
line 117
;115:		// show the cached contents even if they just pressed if it
;116:		// is within two seconds
;117:		cg.showScores = qtrue;
ADDRGP4 cg+112896
CNSTI4 1
ASGNI4
line 118
;118:	}
LABELV $143
line 119
;119:}
LABELV $141
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 0
line 121
;120:
;121:static void CG_ScoresUp_f( void ) {
line 122
;122:	if ( cg.showScores ) {
ADDRGP4 cg+112896
INDIRI4
CNSTI4 0
EQI4 $155
line 123
;123:		cg.showScores = qfalse;
ADDRGP4 cg+112896
CNSTI4 0
ASGNI4
line 124
;124:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+112904
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 125
;125:	}
LABELV $155
line 126
;126:}
LABELV $154
endproc CG_ScoresUp_f 0 0
proc CG_IronSightDown_f 4 4
line 128
;127:
;128:static void CG_IronSightDown_f( void ) {
line 130
;129:  // BLUTENGEL: disabled ironsights
;130:	return;
ADDRGP4 $161
JUMPV
line 131
;131: 	if (cg.ns_ironsightState == IS_NONE)
ADDRGP4 cg+116688
INDIRI4
CNSTI4 0
NEI4 $162
line 132
;132:	{
line 133
;133:		cg.ns_ironsightState = IS_PUTUP; 
ADDRGP4 cg+116688
CNSTI4 1
ASGNI4
line 135
;134:
;135:		if ( BG_IsRifle( cg.snap->ps.weapon ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $166
line 136
;136:			cg.ns_ironsightTimer = cg.time + IS_RIFLE_TIME;
ADDRGP4 cg+116716
ADDRGP4 cg+107604
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
ADDRGP4 $167
JUMPV
LABELV $166
line 138
;137:		else
;138:			cg.ns_ironsightTimer = cg.time + IS_TIME;
ADDRGP4 cg+116716
ADDRGP4 cg+107604
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
LABELV $167
line 140
;139:
;140:		cg.ns_ironsightDeactivate = qfalse;
ADDRGP4 cg+116720
CNSTI4 0
ASGNI4
line 141
;141:	}
LABELV $162
line 142
;142:}
LABELV $161
endproc CG_IronSightDown_f 4 4
proc CG_IronSightUp_f 0 0
line 143
;143:static void CG_IronSightUp_f( void ) {
line 145
;144:  // BLUTENGEL: disabled ironsights
;145:	return;
ADDRGP4 $174
JUMPV
line 146
;146:	cg.ns_ironsightDeactivate = qtrue;
ADDRGP4 cg+116720
CNSTI4 1
ASGNI4
line 147
;147:}
LABELV $174
endproc CG_IronSightUp_f 0 0
proc CG_ReloadDown_f 0 4
line 149
;148:
;149:static void CG_ReloadDown_f( void ) {
line 150
;150: 	if ( cg.scoresRequestTime + 500 < cg.time ) {
ADDRGP4 cg+110828
INDIRI4
CNSTI4 500
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $177
line 153
;151:		// the scores are more than two seconds out of data,
;152:		// so request new ones
;153:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110828
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 154
;154:		trap_SendClientCommand( "reload\n" );
ADDRGP4 $183
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 155
;155:	}
LABELV $177
line 156
;156:}
LABELV $176
endproc CG_ReloadDown_f 0 4
proc CG_ReloadUp_f 0 0
line 158
;157:
;158:static void CG_ReloadUp_f( void ) { 
line 159
;159:	cg.scoresRequestTime = 0;
ADDRGP4 cg+110828
CNSTI4 0
ASGNI4
line 160
;160:}
LABELV $184
endproc CG_ReloadUp_f 0 0
proc CG_MapDown_f 0 0
line 163
;161:
;162:
;163:static void CG_MapDown_f( void ) {
line 164
;164: 	if ( !cg.mapVisible ) {
ADDRGP4 cg+167388
INDIRI4
CNSTI4 0
NEI4 $187
line 166
;165:	//	cg.mapVisible = qtrue;
;166:	}
LABELV $187
line 167
;167:}
LABELV $186
endproc CG_MapDown_f 0 0
proc CG_MapUp_f 0 0
line 169
;168:
;169:static void CG_MapUp_f( void ) { 
line 170
;170:	cg.mapVisible = qfalse;
ADDRGP4 cg+167388
CNSTI4 0
ASGNI4
line 171
;171:}
LABELV $190
endproc CG_MapUp_f 0 0
proc CG_WeaponMode1Up_f 0 0
line 174
;172:
;173: 
;174:static void CG_WeaponMode1Up_f( void ) { 
line 175
;175:	cg.scoresRequestTime = 0;
ADDRGP4 cg+110828
CNSTI4 0
ASGNI4
line 176
;176:}
LABELV $192
endproc CG_WeaponMode1Up_f 0 0
proc CG_WeaponMode1_f 0 4
line 178
;177:
;178:static void CG_WeaponMode1_f( void ) {
line 179
;179: 	if ( cg.scoresRequestTime + 500 < cg.time ) {
ADDRGP4 cg+110828
INDIRI4
CNSTI4 500
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $195
line 182
;180:		// the scores are more than two seconds out of data,
;181:		// so request new ones
;182:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110828
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 183
;183:		trap_SendClientCommand( "weaponmode1" );
ADDRGP4 $201
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 184
;184:	}
LABELV $195
line 185
;185:}
LABELV $194
endproc CG_WeaponMode1_f 0 4
proc CG_WeaponMode2Up_f 0 0
line 187
;186:
;187:static void CG_WeaponMode2Up_f( void ) {
line 188
;188:	cg.scoresRequestTime = 0;
ADDRGP4 cg+110828
CNSTI4 0
ASGNI4
line 189
;189:}
LABELV $202
endproc CG_WeaponMode2Up_f 0 0
proc CG_WeaponMode2_f 0 4
line 191
;190:
;191:static void CG_WeaponMode2_f( void ) {
line 192
;192: 	if ( cg.scoresRequestTime + 500 < cg.time ) {
ADDRGP4 cg+110828
INDIRI4
CNSTI4 500
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $205
line 195
;193:		// the scores are more than two seconds out of data,
;194:		// so request new ones
;195:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110828
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 196
;196:		trap_SendClientCommand( "weaponmode2" );
ADDRGP4 $211
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 197
;197:	}
LABELV $205
line 198
;198:}
LABELV $204
endproc CG_WeaponMode2_f 0 4
proc CG_WeaponMode3Up_f 0 0
line 200
;199:
;200:static void CG_WeaponMode3Up_f( void ) { 
line 201
;201:	cg.scoresRequestTime = 0;
ADDRGP4 cg+110828
CNSTI4 0
ASGNI4
line 202
;202:}
LABELV $212
endproc CG_WeaponMode3Up_f 0 0
proc CG_WeaponMode3_f 0 4
line 204
;203:
;204:static void CG_WeaponMode3_f( void ) {
line 205
;205: 	if ( cg.scoresRequestTime + 500 < cg.time ) {
ADDRGP4 cg+110828
INDIRI4
CNSTI4 500
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $215
line 206
;206:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110828
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 207
;207:		trap_SendClientCommand( "weaponmode3" );
ADDRGP4 $221
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 208
;208:	}
LABELV $215
line 209
;209:}
LABELV $214
endproc CG_WeaponMode3_f 0 4
proc CG_LoadHud_f 1032 12
line 231
;210: 
;211:#ifdef MISSIONPACK
;212:extern menuDef_t *menuScoreboard;
;213:void Menu_Reset();			// FIXME: add to right include file
;214:
;215:extern /**static*/ int strPoolIndex;
;216:#define HASH_TABLE_SIZE 2048
;217:
;218:extern /*static*/ char strPool[STRING_POOL_SIZE];
;219:typedef struct stringDef_s {
;220:	struct stringDef_s *next;
;221:	const char *str;
;222:} stringDef_t;
;223:extern int strHandleCount;
;224:extern stringDef_t *strHandle[HASH_TABLE_SIZE];
;225:#include "../ui/ui_shared.h"
;226:// display context for new ui stuff
;227:extern displayContextDef_t cgDC;
;228://void Item_SetupKeywordHash();
;229://void Menu_SetupKeywordHash();
;230:
;231:static void CG_LoadHud_f( void) {
line 238
;232:  char buff[1024];
;233:	const char *hudSet;
;234:
;235:
;236:	int i;
;237:
;238:	  memset(buff, 0, sizeof(buff));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 240
;239:
;240:	for (i = 0; i < HASH_TABLE_SIZE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $223
line 241
;241:		strHandle[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 strHandle
ADDP4
CNSTP4 0
ASGNP4
line 242
;242:	}
LABELV $224
line 240
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2048
LTI4 $223
line 243
;243:	strHandleCount = 0;
ADDRGP4 strHandleCount
CNSTI4 0
ASGNI4
line 244
;244:	strPoolIndex = 0;
ADDRGP4 strPoolIndex
CNSTI4 0
ASGNI4
line 247
;245://	menuCount = 0;
;246://	openMenuCount = 0;
;247:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 250
;248://	Item_SetupKeywordHash();
;249: //	Menu_SetupKeywordHash();
;250: 	if ( cgDC.getBindingBuf) {
ADDRGP4 cgDC+144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
line 251
;251:		Controls_GetConfig();
ADDRGP4 Controls_GetConfig
CALLV
pop
line 252
;252:	} 
LABELV $227
line 255
;253:
;254://	String_Init();
;255:	Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 257
;256:	
;257:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
ADDRGP4 $230
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 258
;258:	hudSet = buff;
ADDRLP4 1028
ADDRLP4 4
ASGNP4
line 259
;259:	if (hudSet[0] == '\0') {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $231
line 260
;260:		hudSet = "ui/hud.txt";
ADDRLP4 1028
ADDRGP4 $233
ASGNP4
line 261
;261:	}
LABELV $231
line 263
;262:
;263:	CG_LoadMenus(hudSet);
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 CG_LoadMenus
CALLV
pop
line 264
;264:  menuScoreboard = NULL;
ADDRGP4 menuScoreboard
CNSTP4 0
ASGNP4
line 265
;265:}
LABELV $222
endproc CG_LoadHud_f 1032 12
proc CG_scrollScoresDown_f 0 12
line 268
;266:
;267:
;268:static void CG_scrollScoresDown_f( void) {
line 269
;269:	if (menuScoreboard && cg.scoreBoardShowing) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $235
ADDRGP4 cg+112900
INDIRI4
CNSTI4 0
EQI4 $235
line 270
;270:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 271
;271:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 272
;272:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 273
;273:	}
LABELV $235
line 274
;274:}
LABELV $234
endproc CG_scrollScoresDown_f 0 12
proc CG_scrollScoresUp_f 0 12
line 277
;275:
;276:
;277:static void CG_scrollScoresUp_f( void) {
line 278
;278:	if (menuScoreboard && cg.scoreBoardShowing) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
ADDRGP4 cg+112900
INDIRI4
CNSTI4 0
EQI4 $239
line 279
;279:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 280
;280:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 281
;281:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 282
;282:	}
LABELV $239
line 283
;283:}
LABELV $238
endproc CG_scrollScoresUp_f 0 12
proc CG_spWin_f 0 12
line 286
;284:
;285:
;286:static void CG_spWin_f( void) {
line 287
;287:	trap_Cvar_Set("cg_cameraOrbit", "2");
ADDRGP4 $243
ARGP4
ADDRGP4 $244
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 288
;288:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
ADDRGP4 $245
ARGP4
ADDRGP4 $246
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 289
;289:	trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $247
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 290
;290:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $249
ARGP4
ADDRGP4 $250
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 291
;291:	trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $251
ARGP4
ADDRGP4 $252
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 293
;292:	//trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
;293:	CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
ADDRGP4 $253
ARGP4
CNSTI4 143
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 294
;294:}
LABELV $242
endproc CG_spWin_f 0 12
proc CG_spLose_f 0 12
line 296
;295:
;296:static void CG_spLose_f( void) {
line 297
;297:	trap_Cvar_Set("cg_cameraOrbit", "2");
ADDRGP4 $243
ARGP4
ADDRGP4 $244
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 298
;298:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
ADDRGP4 $245
ARGP4
ADDRGP4 $246
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 299
;299:	trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $247
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 300
;300:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $249
ARGP4
ADDRGP4 $250
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 301
;301:	trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $251
ARGP4
ADDRGP4 $252
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 303
;302:	//trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
;303:	CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
ADDRGP4 $255
ARGP4
CNSTI4 143
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 304
;304:}
LABELV $254
endproc CG_spLose_f 0 12
proc CG_TellTarget_f 264 20
line 308
;305:
;306:#endif
;307:
;308:static void CG_TellTarget_f( void ) {
line 313
;309:	int		clientNum;
;310:	char	command[128];
;311:	char	message[128];
;312:
;313:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 314
;314:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $257
line 315
;315:		return;
ADDRGP4 $256
JUMPV
LABELV $257
line 318
;316:	}
;317:
;318:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 319
;319:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $259
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 320
;320:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 321
;321:}
LABELV $256
endproc CG_TellTarget_f 264 20
proc CG_StartOrbit_f 0 8
line 365
;322: 
;323:
;324:// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
;325://  
;326:
;327:
;328:/*
;329:==================
;330:CG_TeamMenu_f
;331:==================
;332: 
;333:static void CG_TeamMenu_f( void ) {
;334:  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
;335:    CG_EventHandling(CGAME_EVENT_NONE);
;336:    trap_Key_SetCatcher(0);
;337:  } else {
;338:    CG_EventHandling(CGAME_EVENT_TEAMMENU);
;339:    //trap_Key_SetCatcher(KEYCATCH_CGAME);
;340:  }
;341:}
;342: 
;343:*/
;344:
;345:/*
;346:==================
;347:CG_EditHud_f
;348:==================
;349: 
;350:static void CG_EditHud_f( void ) {
;351:  //cls.keyCatchers ^= KEYCATCH_CGAME;
;352:  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
;353:}
;354: 
;355:*/
;356:
;357: 
;358:
;359:/*
;360:==================
;361:CG_StartOrbit_f
;362:==================
;363:*/
;364:
;365:static void CG_StartOrbit_f( void ) {
line 366
;366:	if (cg_cameraOrbit.value != 0) {
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $261
line 367
;367:		trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $243
ARGP4
ADDRGP4 $250
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 368
;368:		trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $247
ARGP4
ADDRGP4 $250
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 369
;369:	} else {
ADDRGP4 $262
JUMPV
LABELV $261
line 370
;370:		trap_Cvar_Set("cg_cameraOrbit", "5");
ADDRGP4 $243
ARGP4
ADDRGP4 $264
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 371
;371:		trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $247
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 372
;372:		trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $249
ARGP4
ADDRGP4 $250
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 373
;373:		trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $251
ARGP4
ADDRGP4 $252
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 374
;374:	}
LABELV $262
line 375
;375:}
LABELV $260
endproc CG_StartOrbit_f 0 8
proc CG_QuitHud_f 0 4
line 381
;376:void CG_NewbieMessage( const char *str, int y, float charHeight );
;377:void CG_MWheel_f( int prev );
;378:extern vmCvar_t cg_newbeeHeight;
;379:qboolean CG_CheckForCheats( void );
;380:
;381:static void CG_QuitHud_f( void ) {
line 382
;382:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 383
;383:	 	trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 384
;384:}
LABELV $265
endproc CG_QuitHud_f 0 4
proc CG_ConsoleTestCmd 0 0
line 388
;385:extern char SealBriefing[ 128 ][ 128 ]; // max chars per line
;386:extern int	sealBriefingLines;
;387:
;388:static void CG_ConsoleTestCmd( void ) {
line 426
;389://	vec3_t forward;
;390://	trace_t trace;
;391://	int value;
;392:
;393://trap_Cvar_Set("r_vertexlight", "0" );
;394:
;395:/*
;396:	if ( sealBriefingLines > 0 ) {
;397:
;398:			for ( value = 0; value <= sealBriefingLines; value ++ )
;399:			{
;400:				CG_Printf( SealBriefing[value] );//ITEM_TEXTSTYLE_SHADOWED);
;401:			}	
;402:		}*/
;403:	/*
;404:	AngleVectors( cg.refdefViewAngles, forward,NULL,NULL );
;405:
;406:	VectorMA( cg.snap->ps.origin, 10, forward, end );
;407:
;408:
;409:	trap_CM_BoxTrace( &trace, cg.snap->ps.origin, end, NULL, NULL, 0, CONTENTS_SOLID );
;410:
;411:	CG_Printf("Origin: %s. TR: %f %i %i\n", vtos( cg.snap->ps.origin ), trace.fraction,trace.entityNum,trace.surfaceFlags  );
;412:
;413:	VectorCopy( cg.snap->ps.origin, cgs.mi_helpers[0] );*/
;414:/*
;415:	CG_ParseHelpFile();
;416: 	CG_NewbieMessage("Loaded Newbee Messages.\n123456789012345678901234567890\n", SCREEN_HEIGHT *0.5, cg_newbeeHeight.value );
;417:
;418://	CG_SpawnBloodParticle( cg.snap->ps.origin, cg.snap->ps.viewangles , 100, 0.1, 4+random()*2, 0.7,0.2,0.2,1.0f,qfalse );
;419:
;420://	CG_SpawnEffect( cg.snap->ps.origin );
;421://	CG_GoChase();
;422:*/
;423: 
;424:
;425: 
;426:}
LABELV $266
endproc CG_ConsoleTestCmd 0 0
proc CG_ViewQCmd_f 4 8
line 429
;427:extern vmCvar_t cg_qcmd_close;
;428:
;429:static void CG_ViewQCmd_f( void ) {  
line 430
;430:	if ( cg.viewCmd )
ADDRGP4 cg+171500
INDIRI4
CNSTI4 0
EQI4 $268
line 431
;431:	{
line 432
;432:		cg.viewCmd = qfalse; 
ADDRGP4 cg+171500
CNSTI4 0
ASGNI4
line 433
;433:		trap_SendConsoleCommand( va("%s ;", cg_qcmd_close.string ) );
ADDRGP4 $272
ARGP4
ADDRGP4 cg_qcmd_close+16
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 434
;434:	}
ADDRGP4 $269
JUMPV
LABELV $268
line 436
;435:	else
;436:		cg.viewCmd = qtrue; 
ADDRGP4 cg+171500
CNSTI4 1
ASGNI4
LABELV $269
line 437
;437:}
LABELV $267
endproc CG_ViewQCmd_f 4 8
proc CG_ViewMissionInfo_f 0 0
line 438
;438:static void CG_ViewMissionInfo_f( void ) {  
line 439
;439:	if ( cg.viewMissionInfo )
ADDRGP4 cg+171504
INDIRI4
CNSTI4 0
EQI4 $276
line 440
;440:		cg.viewMissionInfo = qfalse; 
ADDRGP4 cg+171504
CNSTI4 0
ASGNI4
ADDRGP4 $277
JUMPV
LABELV $276
line 442
;441:	else
;442:		cg.viewMissionInfo = qtrue; 
ADDRGP4 cg+171504
CNSTI4 1
ASGNI4
LABELV $277
line 443
;443:}
LABELV $275
endproc CG_ViewMissionInfo_f 0 0
proc CG_EditRadar_f 4 4
line 444
;444:static void CG_EditRadar_f( void ) {  
line 446
;445://	CG_Printf("To set a new position for the Q-Command Menu press your Left Mouse Button.\n");
;446:	if ( !cg.cheatsEnabled )
ADDRGP4 cg+201980
INDIRI4
CNSTI4 0
NEI4 $282
line 447
;447:	{
line 448
;448:		CG_Printf("Please start your game with 'devmap' to use this command.\n");
ADDRGP4 $101
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 449
;449:		return;
ADDRGP4 $281
JUMPV
LABELV $282
line 452
;450:	}
;451:
;452:	if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $285
line 453
;453:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 454
;454:	 	trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 455
;455:	} else {
ADDRGP4 $286
JUMPV
LABELV $285
line 456
;456:		CG_EventHandling(CGAME_EVENT_EDITRADAR);
CNSTI4 5
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 457
;457:	 	trap_Key_SetCatcher(KEYCATCH_CGAME);
CNSTI4 8
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 458
;458:	}
LABELV $286
line 461
;459:
;460: 
;461:}
LABELV $281
endproc CG_EditRadar_f 4 4
proc CG_EditHud_f 4 4
line 462
;462:static void CG_EditHud_f( void ) {
line 463
;463:	CG_Printf("Press your Left Mouse Button to set a new position for your current HUD.\nPress your Right Mouse Button to Quit.\n");
ADDRGP4 $288
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 465
;464:
;465:	if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $289
line 466
;466:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 467
;467:	 	trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 468
;468:	} else {
ADDRGP4 $290
JUMPV
LABELV $289
line 469
;469:		CG_EventHandling(CGAME_EVENT_EDITHUD);
CNSTI4 3
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 470
;470:	 	trap_Key_SetCatcher(KEYCATCH_CGAME);
CNSTI4 8
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 471
;471:	} 
LABELV $290
line 472
;472:}
LABELV $287
endproc CG_EditHud_f 4 4
proc CG_EditRadarPos_f 4 4
line 473
;473:static void CG_EditRadarPos_f( void ) {
line 474
;474:	CG_Printf("Press your Left Mouse Button to set a new position for Radar.\nPress your Right Mouse Button to Quit.\n");
ADDRGP4 $292
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 476
;475:
;476:	if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $293
line 477
;477:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 478
;478:	 	trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 479
;479:	} else {
ADDRGP4 $294
JUMPV
LABELV $293
line 480
;480:		CG_EventHandling(CGAME_EVENT_EDITRADARPOS);
CNSTI4 6
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 481
;481:	 	trap_Key_SetCatcher(KEYCATCH_CGAME);
CNSTI4 8
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 482
;482:	} 
LABELV $294
line 483
;483:}
LABELV $291
endproc CG_EditRadarPos_f 4 4
proc CG_EditQCmd_f 4 4
line 485
;484:
;485:static void CG_EditQCmd_f( void ) {  
line 486
;486:	CG_Printf("To set a new position for the Q-Command Menu press your Left Mouse Button.\n");
ADDRGP4 $296
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 488
;487:
;488:	if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $297
line 489
;489:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 490
;490:	 	trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 491
;491:	} else {
ADDRGP4 $298
JUMPV
LABELV $297
line 492
;492:		CG_EventHandling(CGAME_EVENT_EDITQCMD);
CNSTI4 4
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 493
;493:	 	trap_Key_SetCatcher(KEYCATCH_CGAME);
CNSTI4 8
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 494
;494:	} 
LABELV $298
line 495
;495:}
LABELV $295
endproc CG_EditQCmd_f 4 4
proc CG_RadioMenu_f 4 4
line 496
;496:static void CG_RadioMenu_f( void ) { 
line 497
;497:	if ( cgs.gametype < GT_TEAM )
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
GEI4 $300
line 498
;498:		return;
ADDRGP4 $299
JUMPV
LABELV $300
line 500
;499:
;500:	if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $303
line 501
;501:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 502
;502:	 	trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 503
;503:	} else {
ADDRGP4 $304
JUMPV
LABELV $303
line 504
;504:		CG_EventHandling(CGAME_EVENT_RADIOMENU);
CNSTI4 1
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 505
;505:	 	trap_Key_SetCatcher(KEYCATCH_CGAME);
CNSTI4 8
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 506
;506:	}
LABELV $304
line 509
;507:
;508: 
;509:}
LABELV $299
endproc CG_RadioMenu_f 4 4
proc CG_MWhellup_f 0 4
line 511
;510:// Navy Seals ++
;511:static void CG_MWhellup_f ( void ) {
line 512
;512:	CG_MWheel_f( 0 );
CNSTI4 0
ARGI4
ADDRGP4 CG_MWheel_f
CALLV
pop
line 513
;513:}
LABELV $305
endproc CG_MWhellup_f 0 4
proc CG_MWhelldn_f 0 4
line 514
;514:static void CG_MWhelldn_f ( void ) {
line 515
;515:	CG_MWheel_f( 1 );
CNSTI4 1
ARGI4
ADDRGP4 CG_MWheel_f
CALLV
pop
line 516
;516:}
LABELV $306
endproc CG_MWhelldn_f 0 4
export CG_UpdateLooks_f
proc CG_UpdateLooks_f 264 12
line 519
;517: 
;518:void CG_UpdateLooks_f ( void )
;519:{
line 523
;520:	playerState_t *ps;
;521:	char var[128],model[64],skin[64];
;522:
;523:	ps = &cg.snap->ps;
ADDRLP4 128
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 525
;524:
;525:	if ( ps->persistant[PERS_TEAM] == TEAM_RED )
ADDRLP4 128
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
NEI4 $309
line 526
;526:	{ 
line 528
;527:		// update looks
;528:		trap_Cvar_VariableStringBuffer("ui_s_e_eyes", var , sizeof(var ) );
ADDRGP4 $311
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 529
;529:		trap_Cvar_Set("e_eyes", var );
ADDRGP4 $312
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 530
;530:		trap_Cvar_VariableStringBuffer("ui_s_e_head", var , sizeof(var ) );
ADDRGP4 $313
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 531
;531:		trap_Cvar_Set("e_head", var );
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 532
;532:		trap_Cvar_VariableStringBuffer("ui_s_e_mouth", var , sizeof(var ) );
ADDRGP4 $315
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 533
;533:		trap_Cvar_Set("e_mouth", var );
ADDRGP4 $316
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 536
;534:
;535:		 // model
;536:		trap_Cvar_VariableStringBuffer("ui_s_model", model , sizeof( model ) ); 
ADDRGP4 $317
ARGP4
ADDRLP4 132
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 537
;537:		trap_Cvar_VariableStringBuffer("ui_s_skin", skin , sizeof( skin ) );
ADDRGP4 $318
ARGP4
ADDRLP4 196
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 539
;538:
;539:		trap_Cvar_Set( "model", va("%s/%s",model,skin) );
ADDRGP4 $320
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 260
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $319
ARGP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 540
;540:	}
ADDRGP4 $310
JUMPV
LABELV $309
line 541
;541:	else if ( ps->persistant[PERS_TEAM] == TEAM_BLUE )
ADDRLP4 128
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
NEI4 $321
line 542
;542:	{ 	  
line 544
;543:		// update looks
;544:		trap_Cvar_VariableStringBuffer("ui_t_e_eyes", var , sizeof(var ) );
ADDRGP4 $323
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 545
;545:		trap_Cvar_Set("e_eyes", var );
ADDRGP4 $312
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 546
;546:		trap_Cvar_VariableStringBuffer("ui_t_e_head", var , sizeof(var ) );
ADDRGP4 $324
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 547
;547:		trap_Cvar_Set("e_head", var );
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 548
;548:		trap_Cvar_VariableStringBuffer("ui_t_e_mouth", var , sizeof(var ) );
ADDRGP4 $325
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 549
;549:		trap_Cvar_Set("e_mouth", var );
ADDRGP4 $316
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 552
;550:
;551:		 // model
;552:		trap_Cvar_VariableStringBuffer("ui_t_model", model , sizeof( model ) ); 
ADDRGP4 $326
ARGP4
ADDRLP4 132
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 553
;553:		trap_Cvar_VariableStringBuffer("ui_t_skin", skin , sizeof( skin ) );
ADDRGP4 $327
ARGP4
ADDRLP4 196
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 555
;554:
;555:		trap_Cvar_Set( "model", va("%s/%s",model,skin) );
ADDRGP4 $320
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 260
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $319
ARGP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 556
;556:	}  
LABELV $321
LABELV $310
line 557
;557:}
LABELV $307
endproc CG_UpdateLooks_f 264 12
proc CG_NSEcho_f 260 8
line 559
;558:static void CG_NSEcho_f ( void )
;559:{ 
line 562
;560:	char	message[256];
;561:  
;562:	trap_Args( message, sizeof(message) );
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 563
;563: 	CG_Printf( va("%s\n",message) );
ADDRGP4 $329
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 256
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 564
;564:}
LABELV $328
endproc CG_NSEcho_f 260 8
proc CG_Alias_f 28 8
line 567
;565: 
;566:static void CG_Alias_f ( void )
;567:{   
line 568
;568:	const char *token = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 570
;569:	 
;570:	if ( !Q_stricmp( token,"+alias") )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $333
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $331
line 571
;571:		token = CG_Argv(1);
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRGP4 $332
JUMPV
LABELV $331
line 572
;572:	else if ( !Q_stricmp( token,"-alias") )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $334
line 573
;573:		token = CG_Argv(2);
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
LABELV $334
LABELV $332
line 575
;574:
;575:	if ( !token )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $337
line 576
;576:	{
line 577
;577:		CG_Printf("usage: +alias <cvar> <cvar>\n");
ADDRGP4 $339
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 578
;578:		return;
ADDRGP4 $330
JUMPV
LABELV $337
line 580
;579:	}
;580:	trap_SendConsoleCommand( va("vstr %s;",token) );
ADDRGP4 $340
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 581
;581:}
LABELV $330
endproc CG_Alias_f 28 8
data
align 4
LABELV commands
address $342
address CG_TestGun_f
address $343
address CG_TestModel_f
address $344
address CG_TestModelNextFrame_f
address $345
address CG_TestModelPrevFrame_f
address $346
address CG_TestModelNextSkin_f
address $347
address CG_TestModelPrevSkin_f
address $348
address CG_Viewpos_f
address $349
address CG_ScoresDown_f
address $350
address CG_ScoresUp_f
address $351
address CG_ReloadDown_f
address $352
address CG_ReloadUp_f
address $353
address CG_IronSightUp_f
address $354
address CG_IronSightDown_f
address $355
address CG_MapDown_f
address $356
address CG_MapUp_f
address $333
address CG_Alias_f
address $336
address CG_Alias_f
address $357
address CG_WeaponMode3_f
address $358
address CG_WeaponMode3Up_f
address $359
address CG_WeaponMode2_f
address $360
address CG_WeaponMode2Up_f
address $361
address CG_WeaponMode1_f
address $362
address CG_WeaponMode1Up_f
address $363
address CG_SizeUp_f
address $364
address CG_SizeDown_f
address $365
address CG_MWhellup_f
address $366
address CG_MWhelldn_f
address $367
address CG_Weapon_f
address $368
address CG_TellTarget_f
address $369
address CG_TargetCommand_f
address $370
address CG_LoadHud_f
address $371
address CG_spWin_f
address $372
address CG_spLose_f
address $373
address CG_scrollScoresDown_f
address $374
address CG_scrollScoresUp_f
address $375
address CG_StartOrbit_f
address $376
address CG_LoadDeferredPlayers
address $377
address CG_ConsoleTestCmd
address $378
address CG_UpdateLooks_f
address $379
address CG_NSEcho_f
address $380
address CG_RadioMenu_f
address $381
address CG_QuitHud_f
address $382
address CG_ClientScript_f
address $383
address CG_ClientScript_f
address $384
address CG_ClientScript_f
address $385
address CG_ViewQCmd_f
address $386
address CG_ViewMissionInfo_f
address $387
address CG_WriteRadarInfoToBRF_f
address $388
address CG_EditQCmd_f
address $389
address CG_EditRadar_f
address $390
address CG_EditHud_f
address $391
address CG_EditRadarPos_f
address $392
address CG_GameMem_f
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 665
;582:
;583:// Navy Seals --
;584:void CG_ClientScript_f( void );
;585:
;586:typedef struct {
;587:	char	*cmd;
;588:	void	(*function)(void);
;589:} consoleCommand_t;
;590:
;591:
;592:static consoleCommand_t	commands[] = {
;593:	{ "testgun", CG_TestGun_f },
;594:	{ "testmodel", CG_TestModel_f },
;595:	{ "nextframe", CG_TestModelNextFrame_f },
;596:	{ "prevframe", CG_TestModelPrevFrame_f },
;597:	{ "nextskin", CG_TestModelNextSkin_f },
;598:	{ "prevskin", CG_TestModelPrevSkin_f },
;599:	{ "viewpos", CG_Viewpos_f },
;600:	{ "+scores", CG_ScoresDown_f },
;601:	{ "-scores", CG_ScoresUp_f },
;602:	{ "+reload", CG_ReloadDown_f },
;603:	{ "-reload", CG_ReloadUp_f },
;604:
;605:	{ "-ironsight", CG_IronSightUp_f },
;606:	{ "+ironsight", CG_IronSightDown_f },
;607:
;608:	{ "+map", CG_MapDown_f },
;609:	{ "-map", CG_MapUp_f },
;610:
;611:	{ "+alias", CG_Alias_f },
;612:	{ "-alias", CG_Alias_f }, 
;613:	
;614:	{ "+weaponmode3", CG_WeaponMode3_f },
;615:	{ "-weaponmode3", CG_WeaponMode3Up_f },
;616:	{ "+weaponmode2", CG_WeaponMode2_f },
;617:	{ "-weaponmode2", CG_WeaponMode2Up_f },
;618:	{ "+weaponmode1", CG_WeaponMode1_f },
;619:	{ "-weaponmode1", CG_WeaponMode1Up_f },
;620:
;621:	{ "sizeup", CG_SizeUp_f },
;622:	{ "sizedown", CG_SizeDown_f },
;623:	// Navy Seals ++
;624:	{ "weapnext", CG_MWhellup_f },
;625:	{ "weapprev", CG_MWhelldn_f },
;626:	// Navy Seals --
;627:	{ "weapon", CG_Weapon_f },
;628:	{ "tell_target", CG_TellTarget_f }, 
;629:	{ "tcmd", CG_TargetCommand_f },
;630:#ifdef MISSIONPACK
;631:	{ "loadhud", CG_LoadHud_f },
;632:	{ "spWin", CG_spWin_f },
;633:	{ "spLose", CG_spLose_f },
;634:	{ "scoresDown", CG_scrollScoresDown_f },
;635:	{ "scoresUp", CG_scrollScoresUp_f },
;636:#endif
;637:	{ "startOrbit", CG_StartOrbit_f },
;638:	{ "loaddeferred", CG_LoadDeferredPlayers }	,
;639:	{ "testcmd", CG_ConsoleTestCmd },
;640:	{ "looks", CG_UpdateLooks_f },
;641:	{ "nsecho", CG_NSEcho_f },
;642:	{ "radiomenu", CG_RadioMenu_f },
;643:	{ "quithudmenu", CG_QuitHud_f },
;644:	{ "nssl", CG_ClientScript_f },
;645:	{ "cs", CG_ClientScript_f },
;646:	{ "clientscript", CG_ClientScript_f },
;647:	{ "vqcmd", CG_ViewQCmd_f },
;648:	{ "missioninfo", CG_ViewMissionInfo_f },
;649:	{ "writeradar", CG_WriteRadarInfoToBRF_f },
;650:	{ "editqcmd", CG_EditQCmd_f },
;651:	{ "editradar", CG_EditRadar_f },
;652:	{ "edithud", CG_EditHud_f },
;653:	{ "editradarpos", CG_EditRadarPos_f },
;654:	{ "cgamemem", CG_GameMem_f }
;655:};
;656:
;657:/*
;658:=================
;659:CG_ConsoleCommand
;660:
;661:The string has been tokenized and can be retrieved with
;662:Cmd_Argc() / Cmd_Argv()
;663:=================
;664:*/
;665:qboolean CG_ConsoleCommand( void ) {
line 669
;666:	const char	*cmd;
;667:	int		i;
;668:
;669:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 671
;670:
;671:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $397
JUMPV
LABELV $394
line 672
;672:		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
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
NEI4 $398
line 673
;673:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 674
;674:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $393
JUMPV
LABELV $398
line 676
;675:		}
;676:	}
LABELV $395
line 671
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $397
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 53
LTU4 $394
line 678
;677:
;678:	return qfalse;
CNSTI4 0
RETI4
LABELV $393
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 8 8
line 689
;679:}
;680:
;681:/*
;682:=================
;683:CG_InitConsoleCommands
;684:
;685:Let the client system know about all of our commands
;686:so it can perform tab completion
;687:=================
;688:*/
;689:void CG_InitConsoleCommands( void ) {
line 692
;690:	int		i;
;691:
;692:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $405
JUMPV
LABELV $402
line 693
;693:		if ( !Q_stricmp( commands[i].cmd , "quithudmenu" ) )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $406
line 694
;694:			continue;
ADDRGP4 $403
JUMPV
LABELV $406
line 696
;695:
;696:		trap_AddCommand( commands[i].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 697
;697:	}
LABELV $403
line 692
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $405
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 53
LTU4 $402
line 703
;698:
;699:	//
;700:	// the game server will interpret these commands, which will be automatically
;701:	// forwarded to the server after they are not recognized locally
;702:	//
;703:	trap_AddCommand ("kill");
ADDRGP4 $408
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 704
;704:	trap_AddCommand ("say");
ADDRGP4 $409
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 705
;705:	trap_AddCommand ("say_team");
ADDRGP4 $410
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 706
;706:	trap_AddCommand ("tell");
ADDRGP4 $411
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 707
;707:	trap_AddCommand ("vsay");
ADDRGP4 $412
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 708
;708:	trap_AddCommand ("vsay_team");
ADDRGP4 $413
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 709
;709:	trap_AddCommand ("vtell");
ADDRGP4 $414
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 710
;710:	trap_AddCommand ("vtaunt");
ADDRGP4 $415
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 711
;711:	trap_AddCommand ("vosay");
ADDRGP4 $416
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 712
;712:	trap_AddCommand ("vosay_team");
ADDRGP4 $417
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 713
;713:	trap_AddCommand ("votell");
ADDRGP4 $418
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 714
;714:	trap_AddCommand ("give");
ADDRGP4 $419
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 715
;715:	trap_AddCommand ("god");
ADDRGP4 $420
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 716
;716:	trap_AddCommand ("notarget");
ADDRGP4 $421
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 717
;717:	trap_AddCommand ("noclip");
ADDRGP4 $422
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 718
;718:	trap_AddCommand ("team");
ADDRGP4 $423
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 719
;719:	trap_AddCommand ("follow");
ADDRGP4 $424
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 720
;720:	trap_AddCommand ("levelshot");
ADDRGP4 $425
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 721
;721:	trap_AddCommand ("addbot");
ADDRGP4 $426
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 722
;722:	trap_AddCommand ("setviewpos");
ADDRGP4 $427
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 723
;723:	trap_AddCommand ("callvote");
ADDRGP4 $428
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 724
;724:	trap_AddCommand ("vote");
ADDRGP4 $429
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 725
;725:	trap_AddCommand ("callteamvote");
ADDRGP4 $430
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 726
;726:	trap_AddCommand ("teamvote");
ADDRGP4 $431
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 727
;727:	trap_AddCommand ("stats");
ADDRGP4 $432
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 728
;728:	trap_AddCommand ("teamtask");
ADDRGP4 $433
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 729
;729:	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
ADDRGP4 $434
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 730
;730:	trap_AddCommand ("menuselect");
ADDRGP4 $435
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 731
;731:	trap_AddCommand ("inventory");
ADDRGP4 $436
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 732
;732:	trap_AddCommand ("character");
ADDRGP4 $437
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 733
;733:	trap_AddCommand ("looks");
ADDRGP4 $378
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 734
;734:	trap_AddCommand ("reload");
ADDRGP4 $438
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 735
;735:	trap_AddCommand ("weaponmode1");  
ADDRGP4 $201
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 736
;736:	trap_AddCommand ("weaponmode2");
ADDRGP4 $211
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 737
;737:	trap_AddCommand ("weaponmode3"); 
ADDRGP4 $221
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 738
;738:	trap_AddCommand ("resetxpdist");
ADDRGP4 $439
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 739
;739:	trap_AddCommand ("openxpdist");
ADDRGP4 $440
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 740
;740:	trap_AddCommand ("sendxpdist");
ADDRGP4 $441
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 753
;741:/*	trap_AddCommand ("inc_acc");
;742:	trap_AddCommand ("inc_sta");
;743:	trap_AddCommand ("inc_str");
;744:	trap_AddCommand ("inc_sth");
;745:	trap_AddCommand ("inc_tec");
;746:	trap_AddCommand ("inc_spd");
;747:	trap_AddCommand ("dec_acc");
;748:	trap_AddCommand ("dec_sta");
;749:	trap_AddCommand ("dec_str");
;750:	trap_AddCommand ("dec_sth");
;751:	trap_AddCommand ("dec_tec");
;752:	trap_AddCommand ("dec_spd");*/
;753:}
LABELV $401
endproc CG_InitConsoleCommands 8 8
import CG_ClientScript_f
import cg_qcmd_close
import sealBriefingLines
import SealBriefing
import CG_CheckForCheats
import CG_MWheel_f
import cgDC
import strHandle
import strHandleCount
import strPool
import strPoolIndex
import menuScoreboard
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
LABELV $441
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 120
byte 1 112
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $440
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 120
byte 1 112
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $439
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 120
byte 1 112
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $438
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $437
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $436
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $435
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $434
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $433
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $432
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $431
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $430
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $429
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $428
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $427
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $426
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $425
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $424
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $423
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $422
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $421
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $420
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $419
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $418
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $417
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $416
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $415
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $414
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $413
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $412
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $411
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $410
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $409
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $408
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $392
byte 1 99
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 109
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $391
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $390
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 104
byte 1 117
byte 1 100
byte 1 0
align 1
LABELV $389
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $388
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $387
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $386
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
LABELV $385
byte 1 118
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $384
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $383
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $382
byte 1 110
byte 1 115
byte 1 115
byte 1 108
byte 1 0
align 1
LABELV $381
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 104
byte 1 117
byte 1 100
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $380
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
LABELV $379
byte 1 110
byte 1 115
byte 1 101
byte 1 99
byte 1 104
byte 1 111
byte 1 0
align 1
LABELV $378
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $377
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $376
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $375
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $374
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
LABELV $373
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
LABELV $372
byte 1 115
byte 1 112
byte 1 76
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $371
byte 1 115
byte 1 112
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $370
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 104
byte 1 117
byte 1 100
byte 1 0
align 1
LABELV $369
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $368
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $367
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $366
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
LABELV $365
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
LABELV $364
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $363
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $362
byte 1 45
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $361
byte 1 43
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $360
byte 1 45
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $359
byte 1 43
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $358
byte 1 45
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $357
byte 1 43
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $356
byte 1 45
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $355
byte 1 43
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $354
byte 1 43
byte 1 105
byte 1 114
byte 1 111
byte 1 110
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $353
byte 1 45
byte 1 105
byte 1 114
byte 1 111
byte 1 110
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $352
byte 1 45
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $351
byte 1 43
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $350
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $349
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $348
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $347
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $346
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $345
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $344
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $343
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $342
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $340
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 0
align 1
LABELV $339
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 43
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 32
byte 1 60
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 62
byte 1 32
byte 1 60
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $336
byte 1 45
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $333
byte 1 43
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $329
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $327
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
LABELV $326
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
LABELV $325
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
LABELV $324
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
LABELV $323
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
LABELV $320
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $319
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $318
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
LABELV $317
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
LABELV $316
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $315
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
LABELV $314
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $313
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
LABELV $312
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $311
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
LABELV $296
byte 1 84
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 81
byte 1 45
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 76
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 77
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 66
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $292
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 76
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 77
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 66
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 82
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 46
byte 1 10
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 82
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 77
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 66
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 81
byte 1 117
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $288
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 76
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 77
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 66
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 72
byte 1 85
byte 1 68
byte 1 46
byte 1 10
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 82
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 77
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 66
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 81
byte 1 117
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $272
byte 1 37
byte 1 115
byte 1 32
byte 1 59
byte 1 0
align 1
LABELV $264
byte 1 53
byte 1 0
align 1
LABELV $259
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $255
byte 1 89
byte 1 79
byte 1 85
byte 1 32
byte 1 76
byte 1 79
byte 1 83
byte 1 69
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $253
byte 1 89
byte 1 79
byte 1 85
byte 1 32
byte 1 87
byte 1 73
byte 1 78
byte 1 33
byte 1 0
align 1
LABELV $252
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $251
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $250
byte 1 48
byte 1 0
align 1
LABELV $249
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $248
byte 1 49
byte 1 0
align 1
LABELV $247
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $246
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $245
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $244
byte 1 50
byte 1 0
align 1
LABELV $243
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $233
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $230
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $221
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $211
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $201
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $183
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $148
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $125
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $121
byte 1 87
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $120
byte 1 91
byte 1 101
byte 1 110
byte 1 100
byte 1 93
byte 1 10
byte 1 36
byte 1 69
byte 1 79
byte 1 70
byte 1 0
align 1
LABELV $110
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $104
byte 1 91
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $102
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
LABELV $101
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 39
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $96
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
