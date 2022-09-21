data
align 4
LABELV MonthAbbrev
address $97
address $98
address $99
address $100
address $101
address $102
address $103
address $104
address $105
address $106
address $107
address $108
align 4
LABELV skillLevels
address $109
address $110
address $111
address $112
address $113
lit
align 4
LABELV numSkillLevels
byte 4 5
data
align 4
LABELV netSources
address $114
address $115
address $116
address $117
lit
align 4
LABELV numNetSources
byte 4 4
align 4
LABELV serverFilters
address $118
address $119
address $120
address $119
address $121
address $122
address $123
address $124
address $125
address $126
data
align 4
LABELV teamArenaGameTypes
address $127
address $128
address $129
address $130
lit
align 4
LABELV numTeamArenaGameTypes
byte 4 4
data
align 4
LABELV teamArenaGameNames
address $131
address $132
address $133
address $134
address $135
address $136
address $137
address $138
address $139
lit
align 4
LABELV numTeamArenaGameNames
byte 4 9
align 4
LABELV numServerFilters
byte 4 5
data
align 4
LABELV sortKeys
address $140
address $141
address $142
address $143
address $144
lit
align 4
LABELV numSortKeys
byte 4 5
data
align 4
LABELV netnames
address $145
address $146
address $147
byte 4 0
align 1
LABELV quake3worldMessage
byte 1 86
byte 1 105
byte 1 115
byte 1 105
byte 1 116
byte 1 32
byte 1 119
byte 1 119
byte 1 119
byte 1 46
byte 1 110
byte 1 115
byte 1 45
byte 1 99
byte 1 111
byte 1 46
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 78
byte 1 101
byte 1 119
byte 1 115
byte 1 44
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 121
byte 1 44
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
align 4
LABELV uitogamecode
byte 4 4
byte 4 6
byte 4 2
byte 4 3
byte 4 1
byte 4 5
byte 4 7
export cvarTable
align 4
LABELV cvarTable
address ui_ffa_fraglimit
address $149
address $150
byte 4 1
address ui_ffa_timelimit
address $151
address $152
byte 4 1
address ui_tourney_fraglimit
address $153
address $152
byte 4 1
address ui_tourney_timelimit
address $154
address $155
byte 4 1
address ui_team_fraglimit
address $156
address $152
byte 4 1
address ui_team_timelimit
address $157
address $150
byte 4 1
address ui_team_friendly
address $158
address $159
byte 4 1
address ui_ctf_capturelimit
address $160
address $161
byte 4 1
address ui_ctf_timelimit
address $162
address $163
byte 4 1
address ui_ctf_friendly
address $164
address $152
byte 4 1
address ui_arenasFile
address $165
address $119
byte 4 80
address ui_botsFile
address $166
address $119
byte 4 80
address ui_spScores1
address $167
address $119
byte 4 65
address ui_spScores2
address $168
address $119
byte 4 65
address ui_spScores3
address $169
address $119
byte 4 65
address ui_spScores4
address $170
address $119
byte 4 65
address ui_spScores5
address $171
address $119
byte 4 65
address ui_spAwards
address $172
address $119
byte 4 65
address ui_spVideos
address $173
address $119
byte 4 65
address ui_spSkill
address $174
address $175
byte 4 1
address ui_spSelection
address $176
address $119
byte 4 64
address ui_browserMaster
address $177
address $152
byte 4 1
address ui_browserGameType
address $178
address $152
byte 4 1
address ui_browserSortKey
address $179
address $180
byte 4 1
address ui_browserShowFull
address $181
address $159
byte 4 1
address ui_browserShowEmpty
address $182
address $159
byte 4 1
address ui_brassTime
address $183
address $184
byte 4 1
address ui_drawCrosshair
address $185
address $180
byte 4 1
address ui_drawCrosshairNames
address $186
address $159
byte 4 1
address ui_marks
address $187
address $159
byte 4 1
address ui_server1
address $188
address $119
byte 4 1
address ui_server2
address $189
address $119
byte 4 1
address ui_server3
address $190
address $119
byte 4 1
address ui_server4
address $191
address $119
byte 4 1
address ui_server5
address $192
address $119
byte 4 1
address ui_server6
address $193
address $119
byte 4 1
address ui_server7
address $194
address $119
byte 4 1
address ui_server8
address $195
address $119
byte 4 1
address ui_server9
address $196
address $119
byte 4 1
address ui_server10
address $197
address $119
byte 4 1
address ui_server11
address $198
address $119
byte 4 1
address ui_server12
address $199
address $119
byte 4 1
address ui_server13
address $200
address $119
byte 4 1
address ui_server14
address $201
address $119
byte 4 1
address ui_server15
address $202
address $119
byte 4 1
address ui_server16
address $203
address $119
byte 4 1
address ui_cdkeychecked
address $204
address $152
byte 4 64
address ui_new
address $205
address $152
byte 4 256
address ui_debug
address $206
address $152
byte 4 256
address ui_initialized
address $207
address $152
byte 4 256
address ui_teamName
address $208
address $209
byte 4 1
address ui_opponentName
address $210
address $211
byte 4 1
address ui_redteam
address $212
address $209
byte 4 1
address ui_blueteam
address $213
address $211
byte 4 1
address ui_dedicated
address $214
address $152
byte 4 1
address ui_gameType
address $215
address $216
byte 4 1
address ui_joinGameType
address $217
address $152
byte 4 1
address ui_netGameType
address $218
address $216
byte 4 1
address ui_actualNetGameType
address $219
address $152
byte 4 1
address ui_redteam1
address $220
address $152
byte 4 1
address ui_redteam2
address $221
address $152
byte 4 1
address ui_redteam3
address $222
address $152
byte 4 1
address ui_redteam4
address $223
address $152
byte 4 1
address ui_redteam5
address $224
address $152
byte 4 1
address ui_redteam6
address $225
address $152
byte 4 1
address ui_blueteam1
address $226
address $152
byte 4 1
address ui_blueteam2
address $227
address $152
byte 4 1
address ui_blueteam3
address $228
address $152
byte 4 1
address ui_blueteam4
address $229
address $152
byte 4 1
address ui_blueteam5
address $230
address $152
byte 4 1
address ui_blueteam6
address $231
address $152
byte 4 1
address ui_netSource
address $232
address $152
byte 4 1
address ui_menuFiles
address $233
address $234
byte 4 1
address ui_currentTier
address $235
address $152
byte 4 1
address ui_currentMap
address $236
address $152
byte 4 1
address ui_currentNetMap
address $237
address $152
byte 4 1
address ui_mapIndex
address $238
address $152
byte 4 1
address ui_currentOpponent
address $239
address $152
byte 4 1
address ui_selectedPlayer
address $240
address $152
byte 4 1
address ui_selectedPlayerName
address $241
address $119
byte 4 1
address ui_lastServerRefresh_0
address $242
address $119
byte 4 1
address ui_lastServerRefresh_1
address $243
address $119
byte 4 1
address ui_lastServerRefresh_2
address $244
address $119
byte 4 1
address ui_lastServerRefresh_3
address $245
address $119
byte 4 1
address ui_singlePlayerActive
address $246
address $152
byte 4 0
address ui_scoreAccuracy
address $247
address $152
byte 4 1
address ui_scoreImpressives
address $248
address $152
byte 4 1
address ui_scoreExcellents
address $249
address $152
byte 4 1
address ui_scoreCaptures
address $250
address $152
byte 4 1
address ui_scoreDefends
address $251
address $152
byte 4 1
address ui_scoreAssists
address $252
address $152
byte 4 1
address ui_scoreGauntlets
address $253
address $152
byte 4 1
address ui_scoreScore
address $254
address $152
byte 4 1
address ui_scorePerfect
address $255
address $152
byte 4 1
address ui_scoreTeam
address $256
address $257
byte 4 1
address ui_scoreBase
address $258
address $152
byte 4 1
address ui_scoreTime
address $259
address $260
byte 4 1
address ui_scoreTimeBonus
address $261
address $152
byte 4 1
address ui_scoreSkillBonus
address $262
address $152
byte 4 1
address ui_scoreShutoutBonus
address $263
address $152
byte 4 1
address ui_fragLimit
address $264
address $265
byte 4 0
address ui_captureLimit
address $266
address $267
byte 4 0
address ui_smallFont
address $268
address $269
byte 4 1
address ui_bigFont
address $270
address $271
byte 4 1
address ui_findPlayer
address $272
address $273
byte 4 1
address ui_Q3Model
address $274
address $152
byte 4 1
address ui_hudFiles
address $275
address $276
byte 4 1
address ui_recordSPDemo
address $277
address $152
byte 4 1
address ui_teamArenaFirstRun
address $278
address $152
byte 4 1
address ui_realWarmUp
address $279
address $150
byte 4 1
address ui_realCaptureLimit
address $280
address $161
byte 4 1029
address ui_serverStatusTimeOut
address $281
address $282
byte 4 1
address ui_t_e_eyes
address $283
address $119
byte 4 1
address ui_t_e_head
address $284
address $119
byte 4 1
address ui_t_e_mouth
address $285
address $119
byte 4 1
address ui_s_e_eyes
address $286
address $119
byte 4 1
address ui_s_e_mouth
address $287
address $119
byte 4 1
address ui_s_e_head
address $288
address $119
byte 4 1
address ui_s_model
address $289
address $290
byte 4 1
address ui_s_skin
address $291
address $292
byte 4 1
address ui_t_model
address $293
address $294
byte 4 1
address ui_t_skin
address $295
address $296
byte 4 1
address g_logradio
address $297
address $159
byte 4 0
address g_keepCharacter
address $298
address $159
byte 4 0
address g_allowKnifes
address $299
address $159
byte 4 37
address g_maxTeamKill
address $300
address $216
byte 4 37
address g_roundTime
address $301
address $267
byte 4 37
address g_overrideGoals
address $302
address $152
byte 4 36
address g_invenTime
address $303
address $216
byte 4 1
address g_bombTime
address $304
address $305
byte 4 32
address cg_gunSmoke
address $306
address $159
byte 4 1
address cg_enableTimeSelect
address $307
address $159
byte 4 1
address cg_atmosphericEffects
address $308
address $159
byte 4 1
address cg_lowEffects
address $309
address $152
byte 4 1
address cg_customTracerColor
address $310
address $159
byte 4 1
address cg_gunSmokeTime
address $311
address $312
byte 4 1
address cg_particleTime
address $313
address $314
byte 4 1
address ui_test
address $315
address $152
byte 4 1
address ui_character
address $316
address $317
byte 4 64
address ui_char_xp
address $318
address $319
byte 4 64
address ui_char_xp
address $320
address $319
byte 4 64
address ui_char_accuracy
address $321
address $159
byte 4 64
address ui_char_accuracy
address $322
address $159
byte 4 64
address ui_char_accuracy
address $323
address $159
byte 4 64
address ui_char_accuracy
address $324
address $159
byte 4 64
address ui_char_accuracy
address $325
address $159
byte 4 64
address ui_char_accuracy
address $326
address $159
byte 4 64
address ui_char_accuracy
address $327
address $152
byte 4 64
export cvarTableSize
align 4
LABELV cvarTableSize
byte 4 148
export vmMain
code
proc vmMain 12 8
file "../ui_main.c"
line 493
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:USER INTERFACE MAIN
;7:
;8:=======================================================================
;9:*/
;10:
;11:// use this to get a demo build without an explicit demo build, i.e. to get the demo ui files to build
;12://#define PRE_RELEASE_TADEMO
;13:
;14:#include "ui_local.h"
;15:
;16:#include "variables.h"
;17:
;18:#define DEBUGCHARACTER 0
;19:
;20:uiInfo_t uiInfo;
;21:
;22:static const char *MonthAbbrev[] = {
;23:	"Jan","Feb","Mar",
;24:	"Apr","May","Jun",
;25:	"Jul","Aug","Sep",
;26:	"Oct","Nov","Dec"
;27:};
;28:
;29:
;30:static const char *skillLevels[] = {
;31:  "Very Easy",
;32:  "Easy",
;33:  "Normal",
;34:  "Hard",
;35:  "Very Hard"
;36:};
;37:
;38:// i tried to remove the GT_* defines but it always crashed.
;39:#define GT_OBELISK	10
;40:#define GT_HARVESTER 11
;41:#define GT_TOURNAMENT	12
;42:static const int numSkillLevels = sizeof(skillLevels) / sizeof(const char*);
;43:
;44: 
;45:static const char *netSources[] = {
;46:	"Local",
;47:	"Mplayer",
;48:	"Internet",
;49:	"Favorites"
;50:};
;51:static const int numNetSources = sizeof(netSources) / sizeof(const char*);
;52:
;53:static const serverFilter_t serverFilters[] = {
;54:	{"All", "" },
;55:	{"Quake 3 Arena", "" },
;56:	{"Team Arena", "missionpack" },
;57:	{"Rocket Arena", "arena" },
;58:	{"Alliance", "alliance" },
;59:};
;60:
;61:static const char *teamArenaGameTypes[] = {
;62:	"FFA", // free for all
;63:	"TRAINING",
;64:	"FTP", // free team play
;65:	"TEAMOPS"
;66:};
;67:
;68:static int const numTeamArenaGameTypes = sizeof(teamArenaGameTypes) / sizeof(const char*);
;69:
;70:
;71:static const char *teamArenaGameNames[] = {
;72:	"Free For All",
;73:	"Tournament",
;74:	"Single Player",
;75:	"Team Teamplay",
;76:	"Capture the Flag",
;77:	"One Flag CTF",
;78:	"Overload",
;79:	"Harvester",
;80:	"Team Operations",
;81:};
;82:
;83:static int const numTeamArenaGameNames = sizeof(teamArenaGameNames) / sizeof(const char*);
;84:
;85:
;86:static const int numServerFilters = sizeof(serverFilters) / sizeof(serverFilter_t);
;87:
;88:static const char *sortKeys[] = {
;89:	"Server Name",
;90:	"Map Name",
;91:	"Open Player Spots",
;92:	"Game Type",
;93:	"Ping Time"
;94:};
;95:static const int numSortKeys = sizeof(sortKeys) / sizeof(const char*);
;96:
;97:static char* netnames[] = {
;98:	"???",
;99:	"UDP",
;100:	"IPX",
;101:	NULL
;102:};
;103:
;104:static char quake3worldMessage[] = "Visit www.ns-co.net for News, Community, Events, Files";
;105:
;106:static int gamecodetoui[] = {4,2,3,0,5,1,6};
;107:static int uitogamecode[] = {4,6,2,3,1,5,7};
;108:
;109:
;110:static void UI_StartServerRefresh(qboolean full);
;111:static void UI_StopServerRefresh( void );
;112:static void UI_DoServerRefresh( void );
;113:static void UI_FeederSelection(float feederID, int index);
;114:static void UI_BuildServerDisplayList(qboolean force);
;115:static void UI_BuildServerStatus(qboolean force);
;116:static void UI_BuildFindPlayerList(qboolean force);
;117:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 );
;118:static int UI_MapCountByGameType(qboolean singlePlayer);
;119:static void UI_ParseGameInfo(const char *teamFile);
;120:static void UI_ParseTeamInfo(const char *teamFile);
;121:static const char *UI_SelectedMap(int index, int *actual);
;122:static int UI_GetIndexFromSelection(int actual);
;123:
;124:int ProcessNewUI( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6 );
;125:
;126:/*
;127:================
;128:cvars
;129:================
;130:*/
;131:
;132:typedef struct {
;133:	vmCvar_t	*vmCvar;
;134:	char		*cvarName;
;135:	char		*defaultString;
;136:	int			cvarFlags;
;137:} cvarTable_t;
;138:
;139:vmCvar_t	ui_ffa_fraglimit;
;140:vmCvar_t	ui_ffa_timelimit;
;141:
;142:vmCvar_t	ui_tourney_fraglimit;
;143:vmCvar_t	ui_tourney_timelimit;
;144:
;145:vmCvar_t	ui_team_fraglimit;
;146:vmCvar_t	ui_team_timelimit;
;147:vmCvar_t	ui_team_friendly;
;148:
;149:vmCvar_t	ui_ctf_capturelimit;
;150:vmCvar_t	ui_ctf_timelimit;
;151:vmCvar_t	ui_ctf_friendly;
;152:
;153:vmCvar_t	ui_arenasFile;
;154:vmCvar_t	ui_botsFile;
;155:vmCvar_t	ui_spScores1;
;156:vmCvar_t	ui_spScores2;
;157:vmCvar_t	ui_spScores3;
;158:vmCvar_t	ui_spScores4;
;159:vmCvar_t	ui_spScores5;
;160:vmCvar_t	ui_spAwards;
;161:vmCvar_t	ui_spVideos;
;162:vmCvar_t	ui_spSkill;
;163:
;164:vmCvar_t	ui_spSelection;
;165:
;166:vmCvar_t	ui_browserMaster;
;167:vmCvar_t	ui_browserGameType;
;168:vmCvar_t	ui_browserSortKey;
;169:vmCvar_t	ui_browserShowFull;
;170:vmCvar_t	ui_browserShowEmpty;
;171:
;172:vmCvar_t	ui_brassTime;
;173:vmCvar_t	ui_drawCrosshair;
;174:vmCvar_t	ui_drawCrosshairNames;
;175:vmCvar_t	ui_marks;
;176:
;177:vmCvar_t	ui_server1;
;178:vmCvar_t	ui_server2;
;179:vmCvar_t	ui_server3;
;180:vmCvar_t	ui_server4;
;181:vmCvar_t	ui_server5;
;182:vmCvar_t	ui_server6;
;183:vmCvar_t	ui_server7;
;184:vmCvar_t	ui_server8;
;185:vmCvar_t	ui_server9;
;186:vmCvar_t	ui_server10;
;187:vmCvar_t	ui_server11;
;188:vmCvar_t	ui_server12;
;189:vmCvar_t	ui_server13;
;190:vmCvar_t	ui_server14;
;191:vmCvar_t	ui_server15;
;192:vmCvar_t	ui_server16;
;193:
;194:vmCvar_t	ui_cdkeychecked;
;195:
;196:vmCvar_t	ui_redteam;
;197:vmCvar_t	ui_redteam1;
;198:vmCvar_t	ui_redteam2;
;199:vmCvar_t	ui_redteam3;
;200:vmCvar_t	ui_redteam4;
;201:vmCvar_t	ui_redteam5;
;202:vmCvar_t	ui_redteam6;
;203:vmCvar_t	ui_blueteam;
;204:vmCvar_t	ui_blueteam1;
;205:vmCvar_t	ui_blueteam2;
;206:vmCvar_t	ui_blueteam3;
;207:vmCvar_t	ui_blueteam4;
;208:vmCvar_t	ui_blueteam5;
;209:vmCvar_t	ui_blueteam6;
;210:vmCvar_t	ui_teamName;
;211:vmCvar_t	ui_dedicated;
;212:vmCvar_t	ui_gameType;
;213:vmCvar_t	ui_netGameType;
;214:vmCvar_t	ui_actualNetGameType;
;215:vmCvar_t	ui_joinGameType;
;216:vmCvar_t	ui_netSource;
;217:vmCvar_t	ui_serverFilterType;
;218:vmCvar_t	ui_opponentName;
;219:vmCvar_t	ui_menuFiles;
;220:vmCvar_t	ui_currentTier;
;221:vmCvar_t	ui_currentMap;
;222:vmCvar_t	ui_currentNetMap;
;223:vmCvar_t	ui_mapIndex;
;224:vmCvar_t	ui_currentOpponent;
;225:vmCvar_t	ui_selectedPlayer;
;226:vmCvar_t	ui_selectedPlayerName;
;227:vmCvar_t	ui_lastServerRefresh_0;
;228:vmCvar_t	ui_lastServerRefresh_1;
;229:vmCvar_t	ui_lastServerRefresh_2;
;230:vmCvar_t	ui_lastServerRefresh_3;
;231:vmCvar_t	ui_singlePlayerActive;
;232:vmCvar_t	ui_scoreAccuracy;
;233:vmCvar_t	ui_scoreImpressives;
;234:vmCvar_t	ui_scoreExcellents;
;235:vmCvar_t	ui_scoreCaptures;
;236:vmCvar_t	ui_scoreDefends;
;237:vmCvar_t	ui_scoreAssists;
;238:vmCvar_t	ui_scoreGauntlets;
;239:vmCvar_t	ui_scoreScore;
;240:vmCvar_t	ui_scorePerfect;
;241:vmCvar_t	ui_scoreTeam;
;242:vmCvar_t	ui_scoreBase;
;243:vmCvar_t	ui_scoreTimeBonus;
;244:vmCvar_t	ui_scoreSkillBonus;
;245:vmCvar_t	ui_scoreShutoutBonus;
;246:vmCvar_t	ui_scoreTime;
;247:vmCvar_t	ui_captureLimit;
;248:vmCvar_t	ui_fragLimit;
;249:vmCvar_t	ui_smallFont;
;250:vmCvar_t	ui_bigFont;
;251:vmCvar_t	ui_findPlayer;
;252:vmCvar_t	ui_Q3Model;
;253:vmCvar_t	ui_hudFiles;
;254:vmCvar_t	ui_recordSPDemo;
;255:vmCvar_t	ui_realCaptureLimit;
;256:vmCvar_t	ui_realWarmUp;
;257:vmCvar_t	ui_serverStatusTimeOut;
;258:vmCvar_t	ui_t_e_eyes;
;259:vmCvar_t	ui_t_e_head;
;260:vmCvar_t	ui_t_e_mouth;
;261:vmCvar_t	ui_s_e_eyes;
;262:vmCvar_t	ui_s_e_head;
;263:vmCvar_t	ui_s_e_mouth; 
;264:vmCvar_t	ui_new;
;265:vmCvar_t	ui_debug;
;266:vmCvar_t	ui_initialized;
;267:vmCvar_t	ui_teamArenaFirstRun;
;268:
;269:vmCvar_t	ui_s_model;
;270:vmCvar_t	ui_s_skin;
;271:
;272:vmCvar_t	ui_t_model;
;273:vmCvar_t	ui_t_skin;
;274:vmCvar_t	g_logradio;
;275:vmCvar_t	g_allowKnifes;
;276:vmCvar_t	g_maxTeamKill;
;277:vmCvar_t	g_roundTime;
;278:vmCvar_t	g_keepCharacter;
;279:vmCvar_t	g_stopbots;
;280:vmCvar_t	g_overrideGoals;
;281:vmCvar_t	g_invenTime;
;282:vmCvar_t	g_bombTime;
;283:vmCvar_t	cg_atmosphericEffects;
;284:vmCvar_t	cg_lowEffects;
;285:vmCvar_t	cg_customTracerColor;
;286:vmCvar_t	cg_gunSmokeTime;
;287:vmCvar_t	cg_particleTime;
;288:vmCvar_t	cg_gunSmoke;
;289:vmCvar_t	cg_enableTimeSelect;
;290:
;291:vmCvar_t	ui_test;
;292:
;293:vmCvar_t  ui_character;
;294:vmCvar_t  ui_char_xp;
;295:vmCvar_t  ui_char_old_xp;
;296:vmCvar_t  ui_char_accuracy;
;297:vmCvar_t  ui_char_strength;
;298:vmCvar_t  ui_char_stamina;
;299:vmCvar_t  ui_char_stealth;
;300:vmCvar_t  ui_char_technical;
;301:vmCvar_t  ui_char_speed;
;302:vmCvar_t  ui_gamestate;
;303:
;304:cvarTable_t		cvarTable[] = {
;305:	{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
;306:	{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },
;307:
;308:	{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
;309:	{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },
;310:
;311:	{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
;312:	{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
;313:	{ &ui_team_friendly, "ui_team_friendly",  "1", CVAR_ARCHIVE },
;314:
;315:	{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
;316:	{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
;317:	{ &ui_ctf_friendly, "ui_ctf_friendly",  "0", CVAR_ARCHIVE },
;318:
;319:	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
;320:	{ &ui_botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM },
;321:	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
;322:	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
;323:	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
;324:	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
;325:	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
;326:	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
;327:	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
;328:	{ &ui_spSkill, "g_spSkill", "2", CVAR_ARCHIVE },
;329:
;330:	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;331:
;332:	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;333:	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;334:	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;335:	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;336:	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;337:
;338:	{ &ui_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;339:	{ &ui_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;340:	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;341:	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;342:
;343:	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;344:	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;345:	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;346:	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;347:	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;348:	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;349:	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;350:	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;351:	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;352:	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;353:	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;354:	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;355:	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;356:	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;357:	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;358:	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;359:	{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },
;360:	{ &ui_new, "ui_new", "0", CVAR_TEMP },
;361:	{ &ui_debug, "ui_debug", "0", CVAR_TEMP },
;362:	{ &ui_initialized, "ui_initialized", "0", CVAR_TEMP },
;363:	{ &ui_teamName, "ui_teamName", "Pagans", CVAR_ARCHIVE },
;364:	{ &ui_opponentName, "ui_opponentName", "Stroggs", CVAR_ARCHIVE },
;365:	{ &ui_redteam, "ui_redteam", "Pagans", CVAR_ARCHIVE },
;366:	{ &ui_blueteam, "ui_blueteam", "Stroggs", CVAR_ARCHIVE },
;367:	{ &ui_dedicated, "ui_dedicated", "0", CVAR_ARCHIVE },
;368:	{ &ui_gameType, "ui_gametype", "3", CVAR_ARCHIVE },
;369:	{ &ui_joinGameType, "ui_joinGametype", "0", CVAR_ARCHIVE },
;370:	{ &ui_netGameType, "ui_netGametype", "3", CVAR_ARCHIVE },
;371:	{ &ui_actualNetGameType, "ui_actualNetGametype", "0", CVAR_ARCHIVE },
;372:	{ &ui_redteam1, "ui_redteam1", "0", CVAR_ARCHIVE },
;373:	{ &ui_redteam2, "ui_redteam2", "0", CVAR_ARCHIVE },
;374:	{ &ui_redteam3, "ui_redteam3", "0", CVAR_ARCHIVE },
;375:	{ &ui_redteam4, "ui_redteam4", "0", CVAR_ARCHIVE },
;376:	{ &ui_redteam5, "ui_redteam5", "0", CVAR_ARCHIVE },
;377:	{ &ui_redteam6, "ui_redteam6", "0", CVAR_ARCHIVE },
;378:	{ &ui_blueteam1, "ui_blueteam1", "0", CVAR_ARCHIVE },
;379:	{ &ui_blueteam2, "ui_blueteam2", "0", CVAR_ARCHIVE },
;380:	{ &ui_blueteam3, "ui_blueteam3", "0", CVAR_ARCHIVE },
;381:	{ &ui_blueteam4, "ui_blueteam4", "0", CVAR_ARCHIVE },
;382:	{ &ui_blueteam5, "ui_blueteam5", "0", CVAR_ARCHIVE },
;383:	{ &ui_blueteam6, "ui_blueteam6", "0", CVAR_ARCHIVE },
;384:	{ &ui_netSource, "ui_netSource", "0", CVAR_ARCHIVE },
;385:	{ &ui_menuFiles, "ui_menuFiles", "ui/menus.txt", CVAR_ARCHIVE },
;386:	{ &ui_currentTier, "ui_currentTier", "0", CVAR_ARCHIVE },
;387:	{ &ui_currentMap, "ui_currentMap", "0", CVAR_ARCHIVE },
;388:	{ &ui_currentNetMap, "ui_currentNetMap", "0", CVAR_ARCHIVE },
;389:	{ &ui_mapIndex, "ui_mapIndex", "0", CVAR_ARCHIVE },
;390:	{ &ui_currentOpponent, "ui_currentOpponent", "0", CVAR_ARCHIVE },
;391:	{ &ui_selectedPlayer, "cg_selectedPlayer", "0", CVAR_ARCHIVE},
;392:	{ &ui_selectedPlayerName, "cg_selectedPlayerName", "", CVAR_ARCHIVE},
;393:	{ &ui_lastServerRefresh_0, "ui_lastServerRefresh_0", "", CVAR_ARCHIVE},
;394:	{ &ui_lastServerRefresh_1, "ui_lastServerRefresh_1", "", CVAR_ARCHIVE},
;395:	{ &ui_lastServerRefresh_2, "ui_lastServerRefresh_2", "", CVAR_ARCHIVE},
;396:	{ &ui_lastServerRefresh_3, "ui_lastServerRefresh_3", "", CVAR_ARCHIVE},
;397:	{ &ui_singlePlayerActive, "ui_singlePlayerActive", "0", 0},
;398:	{ &ui_scoreAccuracy, "ui_scoreAccuracy", "0", CVAR_ARCHIVE},
;399:	{ &ui_scoreImpressives, "ui_scoreImpressives", "0", CVAR_ARCHIVE},
;400:	{ &ui_scoreExcellents, "ui_scoreExcellents", "0", CVAR_ARCHIVE},
;401:	{ &ui_scoreCaptures, "ui_scoreCaptures", "0", CVAR_ARCHIVE},
;402:	{ &ui_scoreDefends, "ui_scoreDefends", "0", CVAR_ARCHIVE},
;403:	{ &ui_scoreAssists, "ui_scoreAssists", "0", CVAR_ARCHIVE},
;404:	{ &ui_scoreGauntlets, "ui_scoreGauntlets", "0",CVAR_ARCHIVE},
;405:	{ &ui_scoreScore, "ui_scoreScore", "0", CVAR_ARCHIVE},
;406:	{ &ui_scorePerfect, "ui_scorePerfect", "0", CVAR_ARCHIVE},
;407:	{ &ui_scoreTeam, "ui_scoreTeam", "0 to 0", CVAR_ARCHIVE},
;408:	{ &ui_scoreBase, "ui_scoreBase", "0", CVAR_ARCHIVE},
;409:	{ &ui_scoreTime, "ui_scoreTime", "00:00", CVAR_ARCHIVE},
;410:	{ &ui_scoreTimeBonus, "ui_scoreTimeBonus", "0", CVAR_ARCHIVE},
;411:	{ &ui_scoreSkillBonus, "ui_scoreSkillBonus", "0", CVAR_ARCHIVE},
;412:	{ &ui_scoreShutoutBonus, "ui_scoreShutoutBonus", "0", CVAR_ARCHIVE},
;413:	{ &ui_fragLimit, "ui_fragLimit", "10",  0},
;414:	{ &ui_captureLimit, "ui_captureLimit", "5", 0},
;415:	{ &ui_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;416:	{ &ui_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;417:	{ &ui_findPlayer, "ui_findPlayer", "Sarge", CVAR_ARCHIVE},
;418:	{ &ui_Q3Model, "ui_q3model", "0", CVAR_ARCHIVE},
;419:	{ &ui_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;420:	{ &ui_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;421:	{ &ui_teamArenaFirstRun, "ui_teamArenaFirstRun", "0", CVAR_ARCHIVE},
;422:	{ &ui_realWarmUp, "g_warmup", "20", CVAR_ARCHIVE},
;423:	{ &ui_realCaptureLimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART},
;424:	{ &ui_serverStatusTimeOut, "ui_serverStatusTimeOut", "7000", CVAR_ARCHIVE},
;425:        
;426:	{ &ui_t_e_eyes, "ui_t_e_eyes"	, "", CVAR_ARCHIVE },
;427:	{ &ui_t_e_head , "ui_t_e_head"	, "", CVAR_ARCHIVE },
;428:	{ &ui_t_e_mouth , "ui_t_e_mouth"	, "", CVAR_ARCHIVE },
;429:
;430:	{ &ui_s_e_eyes, "ui_s_e_eyes"	, "", CVAR_ARCHIVE },
;431:	{ &ui_s_e_mouth , "ui_s_e_mouth"	, "", CVAR_ARCHIVE },
;432:	{ &ui_s_e_head , "ui_s_e_head"	, "", CVAR_ARCHIVE },
;433:
;434:
;435:	{ &ui_s_model, "ui_s_model"	, "s_medium", CVAR_ARCHIVE },
;436:	{ &ui_s_skin , "ui_s_skin"	, "bruce", CVAR_ARCHIVE },
;437:
;438:	{ &ui_t_model, "ui_t_model"	, "t_medium", CVAR_ARCHIVE },
;439:	{ &ui_t_skin , "ui_t_skin"	, "jayant", CVAR_ARCHIVE },
;440:
;441:	{ &g_logradio, "g_logradio", "1", 0 },
;442:	{ &g_keepCharacter, "g_keepCharacter", "1", 0 },
;443:
;444:	// server infos [ vmcvars that need to be visible to the client]
;445:	{ &g_allowKnifes, "g_allowKnifes", "1", CVAR_SERVERINFO | CVAR_LATCH  | CVAR_ARCHIVE },
;446:	{ &g_maxTeamKill, "g_maxTeamKill", "3", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE },
;447:	{ &g_roundTime, "roundtime", "5", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE }, 
;448:	
;449:	{ &g_overrideGoals, "g_overridegoals", "0", CVAR_SERVERINFO | CVAR_LATCH   },  
;450:	{ &g_invenTime, "g_inventoryUpdateTime", "3", CVAR_ARCHIVE },
;451:	{ &g_bombTime, "g_bombTime", "80", CVAR_LATCH   },
;452:	{ &cg_gunSmoke, "cg_gunSmoke", "1", CVAR_ARCHIVE },
;453:
;454:	{ &cg_enableTimeSelect, "cg_enabletimeselect", "1", CVAR_ARCHIVE},
;455:
;456:	{ &cg_atmosphericEffects, "cg_enviromentFX", "1", CVAR_ARCHIVE },
;457:	{ &cg_lowEffects, "cg_enviromentFX_quality", "0", CVAR_ARCHIVE },
;458:	{ &cg_customTracerColor, "cg_customTracerColor", "1", CVAR_ARCHIVE },
;459:	{ &cg_gunSmokeTime, "cg_gunSmokeTime", "1500", CVAR_ARCHIVE },
;460:	{ &cg_particleTime, "cg_particleTime", "500", CVAR_ARCHIVE },
;461:
;462:	{ &ui_test, "ui_test", "0", CVAR_ARCHIVE },
;463:  { &ui_character, "ui_character", "C1111111", CVAR_ROM},
;464:  { &ui_char_xp, "ui_char_xp", "-1", CVAR_ROM},
;465:  { &ui_char_xp, "ui_char_old_xp", "-1", CVAR_ROM},
;466:  { &ui_char_accuracy, "ui_char_accuracy", "1", CVAR_ROM},
;467:  { &ui_char_accuracy, "ui_char_strength", "1", CVAR_ROM},
;468:  { &ui_char_accuracy, "ui_char_stamina", "1", CVAR_ROM},
;469:  { &ui_char_accuracy, "ui_char_stealth", "1", CVAR_ROM},
;470:  { &ui_char_accuracy, "ui_char_technical", "1", CVAR_ROM},
;471:  { &ui_char_accuracy, "ui_char_speed", "1", CVAR_ROM},
;472:  { &ui_char_accuracy, "ui_gamestate", "0", CVAR_ROM}
;473:
;474:};
;475:
;476:int		cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;477:  
;478:/*
;479:================
;480:vmMain
;481:
;482:This is the only way control passes into the module.
;483:This must be the very first function compiled into the .qvm file
;484:================
;485:*/
;486:
;487:void _UI_Init( qboolean );
;488:void _UI_Shutdown( void );
;489:void _UI_KeyEvent( int key, qboolean down );
;490:void _UI_MouseEvent( int dx, int dy );
;491:void _UI_Refresh( int realtime );
;492:qboolean _UI_IsFullscreen( void );
;493:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 494
;494:  switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $329
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $329
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $342
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $342
address $331
address $332
address $333
address $334
address $335
address $336
address $337
address $338
address $339
address $340
address $341
code
LABELV $331
line 496
;495:	  case UI_GETAPIVERSION: 
;496:		  return UI_API_VERSION;
CNSTI4 6
RETI4
ADDRGP4 $328
JUMPV
LABELV $332
line 499
;497:
;498:	  case UI_INIT:
;499:		  _UI_Init(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Init
CALLV
pop
line 500
;500:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $333
line 503
;501:
;502:	  case UI_SHUTDOWN:
;503:		  _UI_Shutdown();
ADDRGP4 _UI_Shutdown
CALLV
pop
line 504
;504:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $334
line 507
;505:
;506:	  case UI_KEY_EVENT:
;507:		  _UI_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_KeyEvent
CALLV
pop
line 508
;508:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $335
line 511
;509:
;510:	  case UI_MOUSE_EVENT:
;511:		  _UI_MouseEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_MouseEvent
CALLV
pop
line 512
;512:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $336
line 515
;513:
;514:	  case UI_REFRESH:
;515:		  _UI_Refresh( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Refresh
CALLV
pop
line 516
;516:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $337
line 519
;517:
;518:	  case UI_IS_FULLSCREEN:
;519:		  return _UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 _UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $328
JUMPV
LABELV $338
line 522
;520:
;521:	  case UI_SET_ACTIVE_MENU:
;522:		  _UI_SetActiveMenu( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 523
;523:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $339
line 526
;524:
;525:	  case UI_CONSOLE_COMMAND:
;526:		  return UI_ConsoleCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $328
JUMPV
LABELV $340
line 529
;527:
;528:	  case UI_DRAW_CONNECT_SCREEN:
;529:		  UI_DrawConnectScreen( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 530
;530:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $341
line 532
;531:	  case UI_HASUNIQUECDKEY:				// mod authors need to observe this
;532:		  return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $328
JUMPV
LABELV $329
line 536
;533:
;534:	}
;535:
;536:	return -1;
CNSTI4 -1
RETI4
LABELV $328
endproc vmMain 12 8
export UI_ParseCvarFile
proc UI_ParseCvarFile 20080 12
line 563
;537:}
;538:
;539:/*
;540:======================
;541:UI_ParseCvarFile
;542:
;543:Read a cvarfile for blocked cvars
;544:======================
;545:*/
;546:#define MAX_BLOCKEDCVARS	64
;547:#define CVAR_FILENAME	"scripts/cvars.cfg"
;548:
;549:// the modules that run in the virtual machine can't access the cvar_t directly,
;550:// so they must ask for structured updates
;551:typedef struct {
;552:	char		maxvalue[MAX_CVAR_VALUE_STRING];
;553:	char		minvalue[MAX_CVAR_VALUE_STRING];
;554:	qboolean	restart_video;
;555:	char		string[MAX_CVAR_VALUE_STRING];
;556:} vmBlockedCvar_t;
;557:
;558:vmBlockedCvar_t			blockedCvars[MAX_BLOCKEDCVARS];
;559:int						num_blockedCvars;
;560:
;561:
;562:
;563:qboolean	UI_ParseCvarFile( void ) {
line 572
;564:	char		*text_p;
;565:	int			len;
;566:	int			i;
;567:	char		*token;
;568: 	char		text[20000];
;569:	fileHandle_t	f; 
;570:
;571: 
;572:	memset( &blockedCvars , 0, sizeof(blockedCvars ) );
ADDRGP4 blockedCvars
ARGP4
CNSTI4 0
ARGI4
CNSTI4 49408
ARGI4
ADDRGP4 memset
CALLP4
pop
line 574
;573:	// load the file
;574:	len = trap_FS_FOpenFile( CVAR_FILENAME, &f, FS_READ );
ADDRGP4 $345
ARGP4
ADDRLP4 20016
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20020
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20020
INDIRI4
ASGNI4
line 575
;575:	if ( len <= 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $346
line 576
;576:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $344
JUMPV
LABELV $346
line 578
;577:	}
;578:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $348
line 579
;579:		Com_Printf( "File %s too long\n", CVAR_FILENAME );
ADDRGP4 $350
ARGP4
ADDRGP4 $345
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 580
;580:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $344
JUMPV
LABELV $348
line 582
;581:	}
;582:	trap_FS_Read( text, len, f );
ADDRLP4 16
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20016
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 583
;583:	text[len] = 0;
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 584
;584:	trap_FS_FCloseFile( f );
ADDRLP4 20016
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 587
;585:
;586:	// parse the text
;587:	text_p = text; 
ADDRLP4 8
ADDRLP4 16
ASGNP4
line 589
;588:
;589:	num_blockedCvars = 0; 
ADDRGP4 num_blockedCvars
CNSTI4 0
ASGNI4
line 592
;590:
;591:	// read information  
;592:	for ( i = 0 ; i < MAX_BLOCKEDCVARS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $351
line 595
;593:
;594:		// get string
;595:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20024
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20024
INDIRP4
ASGNP4
line 596
;596:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $357
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20032
INDIRI4
CNSTI4 0
GTI4 $355
LABELV $357
line 597
;597:			break;
ADDRGP4 $353
JUMPV
LABELV $355
line 599
;598:		}
;599:		strcpy( blockedCvars[i].string, token ); 
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 blockedCvars+516
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 602
;600: 
;601:		// get min value
;602:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 603
;603:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $361
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
GTI4 $359
LABELV $361
line 604
;604:			break;
ADDRGP4 $353
JUMPV
LABELV $359
line 606
;605:		} 
;606:		strcpy( blockedCvars[i].minvalue, token ); 
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 blockedCvars+256
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 609
;607:
;608:		// get max value
;609:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 610
;610:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $365
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
GTI4 $363
LABELV $365
line 611
;611:			break;
ADDRGP4 $353
JUMPV
LABELV $363
line 613
;612:		} 
;613:		strcpy( blockedCvars[i].maxvalue, token ); 
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 blockedCvars
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 616
;614:
;615:		// vid_restart
;616:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 617
;617:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $368
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
GTI4 $366
LABELV $368
line 618
;618:			break; 
ADDRGP4 $353
JUMPV
LABELV $366
line 621
;619:		}
;620:		
;621:		if ( !Q_stricmp( "yes", token ) )
ADDRGP4 $371
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $369
line 622
;622:			blockedCvars[i].restart_video = qtrue;
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 blockedCvars+512
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $370
JUMPV
LABELV $369
line 624
;623:		else
;624:			blockedCvars[i].restart_video = qfalse;
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 blockedCvars+512
ADDP4
CNSTI4 0
ASGNI4
LABELV $370
line 626
;625:
;626:		num_blockedCvars++;
ADDRLP4 20076
ADDRGP4 num_blockedCvars
ASGNP4
ADDRLP4 20076
INDIRP4
ADDRLP4 20076
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 629
;627:
;628:	//	CG_Printf("parsed blocked cvar: %s min %s max %s restart video %i\n", blockedCvars[i].string, blockedCvars[i].minvalue, blockedCvars[i].maxvalue, blockedCvars[i].restart_video );
;629:	}
LABELV $352
line 592
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $351
LABELV $353
line 634
;630:    
;631:	// BLUTENGEL 07.01.2004
;632:	// removed as noone really wants to know this!
;633:	// Com_Printf("parsed %i blocked cvars.\n", num_blockedCvars );
;634:	return qtrue;
CNSTI4 1
RETI4
LABELV $344
endproc UI_ParseCvarFile 20080 12
export UI_CheckForceCvar
proc UI_CheckForceCvar 292 12
line 638
;635:}
;636:
;637:void UI_CheckForceCvar( void )
;638:{
line 639
;639:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 646
;640:
;641:	char str_value[MAX_CVAR_VALUE_STRING];
;642:	float minvalue;
;643:	float maxvalue;
;644:	float value;
;645:
;646:	qboolean	vid_restart = qfalse;
ADDRLP4 272
CNSTI4 0
ASGNI4
line 649
;647:
;648:
;649:	for ( i = 0; i < num_blockedCvars ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $378
JUMPV
LABELV $375
line 650
;650:	{
line 651
;651:		trap_Cvar_VariableStringBuffer( blockedCvars[i].string, str_value, sizeof( str_value ) );
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 blockedCvars+516
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 653
;652:
;653:		minvalue = atof(blockedCvars[i].minvalue);
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 blockedCvars+256
ADDP4
ARGP4
ADDRLP4 276
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 264
ADDRLP4 276
INDIRF4
ASGNF4
line 654
;654:		maxvalue = atof(blockedCvars[i].maxvalue);
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 blockedCvars
ADDP4
ARGP4
ADDRLP4 280
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 268
ADDRLP4 280
INDIRF4
ASGNF4
line 656
;655:
;656:		value = atof( str_value );
ADDRLP4 4
ARGP4
ADDRLP4 284
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 260
ADDRLP4 284
INDIRF4
ASGNF4
line 658
;657:  
;658:		if ( value < minvalue )
ADDRLP4 260
INDIRF4
ADDRLP4 264
INDIRF4
GEF4 $381
line 659
;659:		{				
line 660
;660:			trap_Cvar_Set( blockedCvars[i].string , blockedCvars[i].minvalue );
ADDRLP4 288
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 288
INDIRI4
ADDRGP4 blockedCvars+516
ADDP4
ARGP4
ADDRLP4 288
INDIRI4
ADDRGP4 blockedCvars+256
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 661
;661:			Com_Printf("forced cvar %s to %f\n", blockedCvars[i].string, minvalue );
ADDRGP4 $385
ARGP4
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 blockedCvars+516
ADDP4
ARGP4
ADDRLP4 264
INDIRF4
ARGF4
ADDRGP4 Com_Printf
CALLV
pop
line 663
;662:
;663:			if ( blockedCvars[i].restart_video )
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 blockedCvars+512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $387
line 664
;664:				vid_restart = qtrue;
ADDRLP4 272
CNSTI4 1
ASGNI4
LABELV $387
line 665
;665:		}
LABELV $381
line 666
;666:		if ( value > maxvalue )
ADDRLP4 260
INDIRF4
ADDRLP4 268
INDIRF4
LEF4 $390
line 667
;667:		{
line 668
;668:			trap_Cvar_Set( blockedCvars[i].string , blockedCvars[i].maxvalue );
ADDRLP4 288
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 288
INDIRI4
ADDRGP4 blockedCvars+516
ADDP4
ARGP4
ADDRLP4 288
INDIRI4
ADDRGP4 blockedCvars
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 669
;669:			Com_Printf("forced cvar %s to %f\n", blockedCvars[i].string, maxvalue );
ADDRGP4 $385
ARGP4
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 blockedCvars+516
ADDP4
ARGP4
ADDRLP4 268
INDIRF4
ARGF4
ADDRGP4 Com_Printf
CALLV
pop
line 671
;670:
;671:			if ( blockedCvars[i].restart_video )
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 blockedCvars+512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $394
line 672
;672:				vid_restart = qtrue;
ADDRLP4 272
CNSTI4 1
ASGNI4
LABELV $394
line 673
;673:		} 
LABELV $390
line 674
;674:	}
LABELV $376
line 649
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $378
ADDRLP4 0
INDIRI4
ADDRGP4 num_blockedCvars
INDIRI4
LTI4 $375
line 676
;675:
;676:	if ( vid_restart )
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $397
line 677
;677:	{
line 678
;678:		trap_Cmd_ExecuteText( EXEC_NOW, "vid_restart \n" );   
CNSTI4 0
ARGI4
ADDRGP4 $399
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 679
;679:	}//
LABELV $397
line 680
;680:}
LABELV $374
endproc UI_CheckForceCvar 292 12
export AssetCache
proc AssetCache 84 8
line 682
;681:
;682:void AssetCache() {
line 688
;683:	int n;
;684:	//if (Assets.textFont == NULL) {
;685:	//}
;686:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;687:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;688:	uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
ADDRGP4 $403
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61660
ADDRLP4 4
INDIRI4
ASGNI4
line 689
;689:	uiInfo.uiDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $406
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61816
ADDRLP4 8
INDIRI4
ASGNI4
line 690
;690:	uiInfo.uiDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $409
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61820
ADDRLP4 12
INDIRI4
ASGNI4
line 691
;691:	uiInfo.uiDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $413
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61820+4
ADDRLP4 16
INDIRI4
ASGNI4
line 692
;692:	uiInfo.uiDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $417
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61820+8
ADDRLP4 20
INDIRI4
ASGNI4
line 693
;693:	uiInfo.uiDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $421
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61820+12
ADDRLP4 24
INDIRI4
ASGNI4
line 694
;694:	uiInfo.uiDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $425
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61820+16
ADDRLP4 28
INDIRI4
ASGNI4
line 695
;695:	uiInfo.uiDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $429
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61820+20
ADDRLP4 32
INDIRI4
ASGNI4
line 696
;696:	uiInfo.uiDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $433
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61820+24
ADDRLP4 36
INDIRI4
ASGNI4
line 697
;697:	uiInfo.uiDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
ADDRGP4 $436
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61680
ADDRLP4 40
INDIRI4
ASGNI4
line 698
;698:	uiInfo.uiDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
ADDRGP4 $439
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61668
ADDRLP4 44
INDIRI4
ASGNI4
line 699
;699:	uiInfo.uiDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
ADDRGP4 $442
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61664
ADDRLP4 48
INDIRI4
ASGNI4
line 700
;700:	uiInfo.uiDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
ADDRGP4 $445
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61672
ADDRLP4 52
INDIRI4
ASGNI4
line 701
;701:	uiInfo.uiDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
ADDRGP4 $448
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61676
ADDRLP4 56
INDIRI4
ASGNI4
line 702
;702:	uiInfo.uiDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
ADDRGP4 $451
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61684
ADDRLP4 60
INDIRI4
ASGNI4
line 703
;703:	uiInfo.uiDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
ADDRGP4 $454
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61700
ADDRLP4 64
INDIRI4
ASGNI4
line 704
;704:	uiInfo.uiDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
ADDRGP4 $457
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61704
ADDRLP4 68
INDIRI4
ASGNI4
line 706
;705:
;706:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $458
line 707
;707:		uiInfo.uiDC.Assets.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $464
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+232+61848
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 708
;708:	}
LABELV $459
line 706
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $458
line 710
;709:
;710: }
LABELV $400
endproc AssetCache 84 8
export _UI_DrawSides
proc _UI_DrawSides 12 36
line 712
;711:
;712:void _UI_DrawSides(float x, float y, float w, float h, float size) {
line 713
;713:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 714
;714:	size *= uiInfo.uiDC.xscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+204
INDIRF4
MULF4
ASGNF4
line 715
;715:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
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
ADDRGP4 uiInfo+73452
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 716
;716:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
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
ADDRGP4 uiInfo+73452
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 717
;717:}
LABELV $465
endproc _UI_DrawSides 12 36
export _UI_DrawTopBottom
proc _UI_DrawTopBottom 12 36
line 719
;718:
;719:void _UI_DrawTopBottom(float x, float y, float w, float h, float size) {
line 720
;720:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 721
;721:	size *= uiInfo.uiDC.yscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+200
INDIRF4
MULF4
ASGNF4
line 722
;722:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
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
ADDRGP4 uiInfo+73452
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 723
;723:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
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
ADDRGP4 uiInfo+73452
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 724
;724:}
LABELV $469
endproc _UI_DrawTopBottom 12 36
export _UI_DrawRect
proc _UI_DrawRect 0 20
line 732
;725:/*
;726:================
;727:UI_DrawRect
;728:
;729:Coordinates are 640*480 virtual values
;730:=================
;731:*/
;732:void _UI_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 733
;733:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 735
;734:
;735:  _UI_DrawTopBottom(x, y, width, height, size);
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
ADDRGP4 _UI_DrawTopBottom
CALLV
pop
line 736
;736:  _UI_DrawSides(x, y, width, height, size);
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
ADDRGP4 _UI_DrawSides
CALLV
pop
line 738
;737:
;738:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 739
;739:}
LABELV $473
endproc _UI_DrawRect 0 20
export Text_Width
proc Text_Width 48 4
line 744
;740:
;741:
;742:
;743:
;744:int Text_Width(const char *text, float scale, int limit) {
line 749
;745:  int count,len;
;746:	float out;
;747:	glyphInfo_t *glyph;
;748:	float useScale;
;749:	const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 750
;750:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 12
ADDRGP4 uiInfo+232+12
ASGNP4
line 751
;751:	if (scale <= ui_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $477
line 752
;752:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 12
ADDRGP4 uiInfo+232+20560
ASGNP4
line 753
;753:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $478
JUMPV
LABELV $477
ADDRFP4 4
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $482
line 754
;754:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 12
ADDRGP4 uiInfo+232+41108
ASGNP4
line 755
;755:	}
LABELV $482
LABELV $478
line 756
;756:	useScale = scale * font->glyphScale;
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
line 757
;757:  out = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 758
;758:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $487
line 759
;759:    len = strlen(text);
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
line 760
;760:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $489
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $489
line 761
;761:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 762
;762:		}
LABELV $489
line 763
;763:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $492
JUMPV
LABELV $491
line 764
;764:		while (s && *s && count < len) {
line 765
;765:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $494
ADDRLP4 40
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
NEI4 $494
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
EQI4 $494
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $494
line 766
;766:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 767
;767:				continue;
ADDRGP4 $492
JUMPV
LABELV $494
line 768
;768:			} else {
line 769
;769:				glyph = &font->glyphs[*s];
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
line 770
;770:				out += glyph->xSkip;
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
line 771
;771:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 772
;772:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 773
;773:			}
line 774
;774:    }
LABELV $492
line 764
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $497
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $497
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $491
LABELV $497
line 775
;775:  }
LABELV $487
line 776
;776:  return out * useScale;
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $474
endproc Text_Width 48 4
export Text_Height
proc Text_Height 48 4
line 779
;777:}
;778:
;779:int Text_Height(const char *text, float scale, int limit) {
line 784
;780:  int len, count;
;781:	float max;
;782:	glyphInfo_t *glyph;
;783:	float useScale;
;784:	const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 785
;785:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 20
ADDRGP4 uiInfo+232+12
ASGNP4
line 786
;786:	if (scale <= ui_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $501
line 787
;787:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 20
ADDRGP4 uiInfo+232+20560
ASGNP4
line 788
;788:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $502
JUMPV
LABELV $501
ADDRFP4 4
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $506
line 789
;789:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 20
ADDRGP4 uiInfo+232+41108
ASGNP4
line 790
;790:	}
LABELV $506
LABELV $502
line 791
;791:	useScale = scale * font->glyphScale;
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
line 792
;792:  max = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 793
;793:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $511
line 794
;794:    len = strlen(text);
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
line 795
;795:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $513
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $513
line 796
;796:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 797
;797:		}
LABELV $513
line 798
;798:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $516
JUMPV
LABELV $515
line 799
;799:		while (s && *s && count < len) {
line 800
;800:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $518
ADDRLP4 40
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
NEI4 $518
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
EQI4 $518
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $518
line 801
;801:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 802
;802:				continue;
ADDRGP4 $516
JUMPV
LABELV $518
line 803
;803:			} else {
line 804
;804:				glyph = &font->glyphs[*s];
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
line 805
;805:	      if (max < glyph->height) {
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
GEF4 $520
line 806
;806:		      max = glyph->height;
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 807
;807:			  }
LABELV $520
line 808
;808:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 809
;809:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 810
;810:			}
line 811
;811:    }
LABELV $516
line 799
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $523
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $515
LABELV $523
line 812
;812:  }
LABELV $511
line 813
;813:  return max * useScale;
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $498
endproc Text_Height 48 4
export Text_PaintChar
proc Text_PaintChar 8 36
line 816
;814:}
;815:
;816:void Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
line 818
;817:  float w, h;
;818:  w = width * scale;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 819
;819:  h = height * scale;
ADDRLP4 4
ADDRFP4 12
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 820
;820:  UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 821
;821:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
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
line 822
;822:}
LABELV $524
endproc Text_PaintChar 8 36
export Text_Paint
proc Text_Paint 116 40
line 824
;823:
;824:void Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
line 829
;825:  int len, count;
;826:	vec4_t newColor;
;827:	glyphInfo_t *glyph;
;828:	float useScale;
;829:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 28
ADDRGP4 uiInfo+232+12
ASGNP4
line 830
;830:	if (scale <= ui_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $528
line 831
;831:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 28
ADDRGP4 uiInfo+232+20560
ASGNP4
line 832
;832:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $529
JUMPV
LABELV $528
ADDRFP4 8
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $533
line 833
;833:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 28
ADDRGP4 uiInfo+232+41108
ASGNP4
line 834
;834:	}
LABELV $533
LABELV $529
line 835
;835:	useScale = scale * font->glyphScale;
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
line 836
;836:  if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $538
line 837
;837:		const char *s = text;
ADDRLP4 36
ADDRFP4 16
INDIRP4
ASGNP4
line 838
;838:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 839
;839:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
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
line 840
;840:    len = strlen(text);
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
line 841
;841:		if (limit > 0 && len > limit) {
ADDRLP4 44
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LEI4 $540
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $540
line 842
;842:			len = limit;
ADDRLP4 32
ADDRFP4 24
INDIRI4
ASGNI4
line 843
;843:		}
LABELV $540
line 844
;844:		count = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $543
JUMPV
LABELV $542
line 845
;845:		while (s && *s && count < len) {
line 846
;846:			glyph = &font->glyphs[*s];
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
line 849
;847:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;848:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;849:			if ( Q_IsColorString( s ) ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $545
ADDRLP4 52
CNSTI4 94
ASGNI4
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
NEI4 $545
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
EQI4 $545
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $545
line 850
;850:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
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
line 851
;851:				newColor[3] = color[3];
ADDRLP4 8+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 852
;852:				trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 853
;853:				s += 2;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 854
;854:				continue;
ADDRGP4 $543
JUMPV
LABELV $545
line 855
;855:			} else {
line 856
;856:				float yadj = useScale * glyph->top;
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
line 857
;857:								if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE || style == ITEM_TEXTSTYLE_OUTLINESHADOWED) 
ADDRLP4 64
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 3
EQI4 $551
ADDRLP4 64
INDIRI4
CNSTI4 6
EQI4 $551
ADDRLP4 64
INDIRI4
CNSTI4 5
NEI4 $548
LABELV $551
line 858
;858:				{
line 859
;859:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $553
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $554
JUMPV
LABELV $553
ADDRLP4 72
CNSTI4 2
ASGNI4
LABELV $554
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 861
;860:
;861:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 8+12
INDIRF4
ASGNF4
line 862
;862:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 864
;863:
;864:					Text_PaintChar(x + ofs, y - yadj + ofs, 
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 873
;865:														glyph->imageWidth,
;866:														glyph->imageHeight,
;867:														useScale, 
;868:														glyph->s,
;869:														glyph->t,
;870:														glyph->s2,
;871:														glyph->t2,
;872:														glyph->glyph);
;873:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 874
;874:					trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 875
;875:				}
LABELV $548
line 876
;876:				if (style == ITEM_TEXTSTYLE_OUTLINED || style == ITEM_TEXTSTYLE_OUTLINESHADOWED ) 
ADDRLP4 68
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 4
EQI4 $560
ADDRLP4 68
INDIRI4
CNSTI4 5
NEI4 $558
LABELV $560
line 877
;877:				{ 
line 879
;878:					
;879:					int ofs = 1;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 880
;880:					colorBlack[3] = newColor[3] - 0.25;
ADDRGP4 colorBlack+12
ADDRLP4 8+12
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 881
;881:					if ( colorBlack[3] <= 0.0f)
ADDRGP4 colorBlack+12
INDIRF4
CNSTF4 0
GTF4 $563
line 882
;882:						colorBlack[3] = 0.0f;
ADDRGP4 colorBlack+12
CNSTF4 0
ASGNF4
LABELV $563
line 884
;883:
;884:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 888
;885:
;886:
;887:				
;888:					Text_PaintChar(x + ofs, y - yadj + ofs, 
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 899
;889:														glyph->imageWidth,
;890:														glyph->imageHeight,
;891:														useScale, 
;892:														glyph->s,
;893:														glyph->t,
;894:														glyph->s2,
;895:														glyph->t2,
;896:														glyph->glyph); 
;897:
;898:					
;899:					Text_PaintChar(x - ofs, y - yadj + ofs, 
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 908
;900:														glyph->imageWidth,
;901:														glyph->imageHeight,
;902:														useScale, 
;903:														glyph->s,
;904:														glyph->t,
;905:														glyph->s2,
;906:														glyph->t2,
;907:														glyph->glyph); 
;908:					Text_PaintChar(x + ofs, y - yadj - ofs, 
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 917
;909:														glyph->imageWidth,
;910:														glyph->imageHeight,
;911:														useScale, 
;912:														glyph->s,
;913:														glyph->t,
;914:														glyph->s2,
;915:														glyph->t2,
;916:														glyph->glyph); 
;917:					Text_PaintChar(x - ofs, y - yadj - ofs, 
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 926
;918:														glyph->imageWidth,
;919:														glyph->imageHeight,
;920:														useScale, 
;921:														glyph->s,
;922:														glyph->t,
;923:														glyph->s2,
;924:														glyph->t2,
;925:														glyph->glyph); 
;926:					Text_PaintChar(x - ofs, y - yadj, 
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 935
;927:														glyph->imageWidth,
;928:														glyph->imageHeight,
;929:														useScale, 
;930:														glyph->s,
;931:														glyph->t,
;932:														glyph->s2,
;933:														glyph->t2,
;934:														glyph->glyph); 
;935:					Text_PaintChar(x + ofs, y - yadj, 
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 945
;936:														glyph->imageWidth,
;937:														glyph->imageHeight,
;938:														useScale, 
;939:														glyph->s,
;940:														glyph->t,
;941:														glyph->s2,
;942:														glyph->t2,
;943:														glyph->glyph); 
;944:
;945:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 946
;946:					trap_R_SetColor( newColor );
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 947
;947:				}
LABELV $558
line 948
;948:				Text_PaintChar(x, y - yadj, 
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 958
;949:													glyph->imageWidth,
;950:													glyph->imageHeight,
;951:													useScale, 
;952:													glyph->s,
;953:													glyph->t,
;954:													glyph->s2,
;955:													glyph->t2,
;956:													glyph->glyph);
;957:
;958:				x += (glyph->xSkip * useScale) + adjust;
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
line 959
;959:				s++;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 960
;960:				count++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 961
;961:			}
line 962
;962:    }
LABELV $543
line 845
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $569
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $569
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $542
LABELV $569
line 963
;963:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 964
;964:  }
LABELV $538
line 965
;965:}
LABELV $525
endproc Text_Paint 116 40
export Text_PaintWithCursor
proc Text_PaintWithCursor 120 40
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 967
;966:
;967:void Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
line 973
;968:  int len, count;
;969:	vec4_t newColor;
;970:	glyphInfo_t *glyph, *glyph2;
;971:	float yadj;
;972:	float useScale;
;973:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 uiInfo+232+12
ASGNP4
line 974
;974:	if (scale <= ui_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $573
line 975
;975:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 uiInfo+232+20560
ASGNP4
line 976
;976:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $574
JUMPV
LABELV $573
ADDRFP4 8
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $578
line 977
;977:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 uiInfo+232+41108
ASGNP4
line 978
;978:	}
LABELV $578
LABELV $574
line 979
;979:	useScale = scale * font->glyphScale;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 980
;980:  if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $583
line 981
;981:		const char *s = text;
ADDRLP4 44
ADDRFP4 16
INDIRP4
ASGNP4
line 982
;982:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 983
;983:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 12
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 984
;984:    len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 48
INDIRI4
ASGNI4
line 985
;985:		if (limit > 0 && len > limit) {
ADDRLP4 52
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LEI4 $585
ADDRLP4 40
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $585
line 986
;986:			len = limit;
ADDRLP4 40
ADDRFP4 28
INDIRI4
ASGNI4
line 987
;987:		}
LABELV $585
line 988
;988:		count = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 989
;989:		glyph2 = &font->glyphs[cursor];
ADDRLP4 28
CNSTI4 80
ADDRFP4 24
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
ADDRGP4 $588
JUMPV
LABELV $587
line 990
;990:		while (s && *s && count < len) {
line 991
;991:			glyph = &font->glyphs[*s];
ADDRLP4 0
CNSTI4 80
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 994
;992:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;993:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;994:			if ( Q_IsColorString( s ) ) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $590
ADDRLP4 60
CNSTI4 94
ASGNI4
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $590
ADDRLP4 64
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $590
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $590
line 995
;995:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 12
ARGP4
ADDRLP4 44
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
line 996
;996:				newColor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 997
;997:				trap_R_SetColor( newColor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 998
;998:				s += 2;
ADDRLP4 44
ADDRLP4 44
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 999
;999:				continue;
ADDRGP4 $588
JUMPV
LABELV $590
line 1000
;1000:			} else {
line 1001
;1001:				yadj = useScale * glyph->top;
ADDRLP4 8
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
line 1002
;1002:								if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE || style == ITEM_TEXTSTYLE_OUTLINESHADOWED) 
ADDRLP4 68
ADDRFP4 32
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 3
EQI4 $596
ADDRLP4 68
INDIRI4
CNSTI4 6
EQI4 $596
ADDRLP4 68
INDIRI4
CNSTI4 5
NEI4 $593
LABELV $596
line 1003
;1003:				{
line 1004
;1004:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 32
INDIRI4
CNSTI4 3
NEI4 $598
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $599
JUMPV
LABELV $598
ADDRLP4 76
CNSTI4 2
ASGNI4
LABELV $599
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 1006
;1005:
;1006:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 12+12
INDIRF4
ASGNF4
line 1007
;1007:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1009
;1008:
;1009:					Text_PaintChar(x + ofs, y - yadj + ofs, 
ADDRLP4 80
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRLP4 80
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1018
;1010:														glyph->imageWidth,
;1011:														glyph->imageHeight,
;1012:														useScale, 
;1013:														glyph->s,
;1014:														glyph->t,
;1015:														glyph->s2,
;1016:														glyph->t2,
;1017:														glyph->glyph);
;1018:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 1019
;1019:					trap_R_SetColor( newColor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1020
;1020:				}
LABELV $593
line 1022
;1021:				
;1022:				if (style == ITEM_TEXTSTYLE_OUTLINED || style == ITEM_TEXTSTYLE_OUTLINESHADOWED ) 
ADDRLP4 72
ADDRFP4 32
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 4
EQI4 $605
ADDRLP4 72
INDIRI4
CNSTI4 5
NEI4 $603
LABELV $605
line 1023
;1023:				{ 
line 1025
;1024:					
;1025:					int ofs = 1;
ADDRLP4 76
CNSTI4 1
ASGNI4
line 1026
;1026:					colorBlack[3] = newColor[3] - 0.25;
ADDRGP4 colorBlack+12
ADDRLP4 12+12
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1027
;1027:					if ( colorBlack[3] <= 0.0f)
ADDRGP4 colorBlack+12
INDIRF4
CNSTF4 0
GTF4 $608
line 1028
;1028:						colorBlack[3] = 0.0f;
ADDRGP4 colorBlack+12
CNSTF4 0
ASGNF4
LABELV $608
line 1030
;1029:
;1030:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1034
;1031:
;1032:
;1033:				
;1034:					Text_PaintChar(x + ofs, y - yadj + ofs, 
ADDRLP4 80
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRLP4 80
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1045
;1035:														glyph->imageWidth,
;1036:														glyph->imageHeight,
;1037:														useScale, 
;1038:														glyph->s,
;1039:														glyph->t,
;1040:														glyph->s2,
;1041:														glyph->t2,
;1042:														glyph->glyph); 
;1043:
;1044:					
;1045:					Text_PaintChar(x - ofs, y - yadj + ofs, 
ADDRLP4 88
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRLP4 88
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1054
;1046:														glyph->imageWidth,
;1047:														glyph->imageHeight,
;1048:														useScale, 
;1049:														glyph->s,
;1050:														glyph->t,
;1051:														glyph->s2,
;1052:														glyph->t2,
;1053:														glyph->glyph); 
;1054:					Text_PaintChar(x + ofs, y - yadj - ofs, 
ADDRLP4 96
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 96
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRLP4 96
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1063
;1055:														glyph->imageWidth,
;1056:														glyph->imageHeight,
;1057:														useScale, 
;1058:														glyph->s,
;1059:														glyph->t,
;1060:														glyph->s2,
;1061:														glyph->t2,
;1062:														glyph->glyph); 
;1063:					Text_PaintChar(x - ofs, y - yadj - ofs, 
ADDRLP4 104
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRLP4 104
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1072
;1064:														glyph->imageWidth,
;1065:														glyph->imageHeight,
;1066:														useScale, 
;1067:														glyph->s,
;1068:														glyph->t,
;1069:														glyph->s2,
;1070:														glyph->t2,
;1071:														glyph->glyph); 
;1072:					Text_PaintChar(x - ofs, y - yadj, 
ADDRFP4 0
INDIRF4
ADDRLP4 76
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1081
;1073:														glyph->imageWidth,
;1074:														glyph->imageHeight,
;1075:														useScale, 
;1076:														glyph->s,
;1077:														glyph->t,
;1078:														glyph->s2,
;1079:														glyph->t2,
;1080:														glyph->glyph); 
;1081:					Text_PaintChar(x + ofs, y - yadj, 
ADDRFP4 0
INDIRF4
ADDRLP4 76
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1091
;1082:														glyph->imageWidth,
;1083:														glyph->imageHeight,
;1084:														useScale, 
;1085:														glyph->s,
;1086:														glyph->t,
;1087:														glyph->s2,
;1088:														glyph->t2,
;1089:														glyph->glyph); 
;1090:
;1091:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 1092
;1092:					trap_R_SetColor( newColor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1093
;1093:				}
LABELV $603
line 1094
;1094:				Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1105
;1095:													glyph->imageWidth,
;1096:													glyph->imageHeight,
;1097:													useScale, 
;1098:													glyph->s,
;1099:													glyph->t,
;1100:													glyph->s2,
;1101:													glyph->t2,
;1102:													glyph->glyph);
;1103:
;1104:				// CG_DrawPic(x, y - yadj, scale * uiDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * uiDC.Assets.textFont.glyphs[text[i]].imageHeight, uiDC.Assets.textFont.glyphs[text[i]].glyph);
;1105:	      yadj = useScale * glyph2->top;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1106
;1106:		    if (count == cursorPos && !((uiInfo.uiDC.realTime/BLINK_DIVISOR) & 1)) {
ADDRLP4 32
INDIRI4
ADDRFP4 20
INDIRI4
NEI4 $613
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $613
line 1107
;1107:					Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 1116
;1108:														glyph2->imageWidth,
;1109:														glyph2->imageHeight,
;1110:														useScale, 
;1111:														glyph2->s,
;1112:														glyph2->t,
;1113:														glyph2->s2,
;1114:														glyph2->t2,
;1115:														glyph2->glyph);
;1116:				}
LABELV $613
line 1118
;1117:
;1118:				x += (glyph->xSkip * useScale);
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
ADDF4
ASGNF4
line 1119
;1119:				s++;
ADDRLP4 44
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1120
;1120:				count++;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1121
;1121:			}
line 1122
;1122:    }
LABELV $588
line 990
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $617
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $617
ADDRLP4 32
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $587
LABELV $617
line 1124
;1123:    // need to paint cursor at end of text
;1124:    if (cursorPos == len && !((uiInfo.uiDC.realTime/BLINK_DIVISOR) & 1)) {
ADDRFP4 20
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $618
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $618
line 1125
;1125:        yadj = useScale * glyph2->top;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1126
;1126:        Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 1136
;1127:                          glyph2->imageWidth,
;1128:                          glyph2->imageHeight,
;1129:                          useScale, 
;1130:                          glyph2->s,
;1131:                          glyph2->t,
;1132:                          glyph2->s2,
;1133:                          glyph2->t2,
;1134:                          glyph2->glyph);
;1135:
;1136:    }
LABELV $618
line 1139
;1137:
;1138:
;1139:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1140
;1140:  }
LABELV $583
line 1141
;1141:}
LABELV $570
endproc Text_PaintWithCursor 120 40
proc Text_Paint_Limit 76 40
line 1144
;1142:
;1143:
;1144:static void Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit) {
line 1148
;1145:  int len, count;
;1146:	vec4_t newColor;
;1147:	glyphInfo_t *glyph;
;1148:  if (text) {
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $622
line 1149
;1149:		const char *s = text;
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
line 1150
;1150:		float max = *maxX;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1152
;1151:		float useScale;
;1152:		fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 uiInfo+232+12
ASGNP4
line 1153
;1153:		if (scale <= ui_smallFont.value) {
ADDRFP4 12
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $626
line 1154
;1154:			font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 uiInfo+232+20560
ASGNP4
line 1155
;1155:		} else if (scale > ui_bigFont.value) {
ADDRGP4 $627
JUMPV
LABELV $626
ADDRFP4 12
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LEF4 $631
line 1156
;1156:			font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 uiInfo+232+41108
ASGNP4
line 1157
;1157:		}
LABELV $631
LABELV $627
line 1158
;1158:		useScale = scale * font->glyphScale;
ADDRLP4 32
ADDRFP4 12
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 1159
;1159:		trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1160
;1160:    len = strlen(text);					 
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 1161
;1161:		if (limit > 0 && len > limit) {
ADDRLP4 48
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LEI4 $636
ADDRLP4 24
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $636
line 1162
;1162:			len = limit;
ADDRLP4 24
ADDRFP4 28
INDIRI4
ASGNI4
line 1163
;1163:		}
LABELV $636
line 1164
;1164:		count = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $639
JUMPV
LABELV $638
line 1165
;1165:		while (s && *s && count < len) {
line 1166
;1166:			glyph = &font->glyphs[*s];
ADDRLP4 0
CNSTI4 80
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 1167
;1167:			if ( Q_IsColorString( s ) ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $641
ADDRLP4 56
CNSTI4 94
ASGNI4
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
NEI4 $641
ADDRLP4 60
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $641
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $641
line 1168
;1168:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 4
ARGP4
ADDRLP4 28
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
line 1169
;1169:				newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1170
;1170:				trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1171
;1171:				s += 2;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 1172
;1172:				continue;
ADDRGP4 $639
JUMPV
LABELV $641
line 1173
;1173:			} else {
line 1174
;1174:	      float yadj = useScale * glyph->top;
ADDRLP4 64
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1175
;1175:				if (Text_Width(s, useScale, 1) + x > max) {
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDF4
ADDRLP4 40
INDIRF4
LEF4 $644
line 1176
;1176:					*maxX = 0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 1177
;1177:					break;
ADDRGP4 $640
JUMPV
LABELV $644
line 1179
;1178:				}
;1179:		    Text_PaintChar(x, y - yadj, 
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ADDRLP4 64
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
ADDRLP4 32
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
ADDRGP4 Text_PaintChar
CALLV
pop
line 1188
;1180:			                 glyph->imageWidth,
;1181:				               glyph->imageHeight,
;1182:				               useScale, 
;1183:						           glyph->s,
;1184:								       glyph->t,
;1185:								       glyph->s2,
;1186:									     glyph->t2,
;1187:										   glyph->glyph);
;1188:	      x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDF4
ADDF4
ASGNF4
line 1189
;1189:				*maxX = x;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ASGNF4
line 1190
;1190:				count++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1191
;1191:				s++;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1192
;1192:	    }
line 1193
;1193:		}
LABELV $639
line 1165
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $647
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $647
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $638
LABELV $647
LABELV $640
line 1194
;1194:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1195
;1195:  }
LABELV $622
line 1197
;1196:
;1197:}
LABELV $621
endproc Text_Paint_Limit 76 40
export UI_ShowPostGame
proc UI_ShowPostGame 0 8
line 1200
;1198:
;1199:
;1200:void UI_ShowPostGame(qboolean newHigh) {
line 1201
;1201:	trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $649
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1202
;1202:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $650
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1203
;1203:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $651
ARGP4
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1204
;1204:	uiInfo.soundHighScore = newHigh;
ADDRGP4 uiInfo+73488
ADDRFP4 0
INDIRI4
ASGNI4
line 1205
;1205:  _UI_SetActiveMenu(UIMENU_POSTGAME);
CNSTI4 6
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 1206
;1206:}
LABELV $648
endproc UI_ShowPostGame 0 8
export UI_DrawCenteredPic
proc UI_DrawCenteredPic 8 20
line 1213
;1207:/*
;1208:=================
;1209:_UI_Refresh
;1210:=================
;1211:*/
;1212:
;1213:void UI_DrawCenteredPic(qhandle_t image, int w, int h) {
line 1215
;1214:  int x, y;
;1215:  x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 0
CNSTI4 640
ADDRFP4 4
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 1216
;1216:  y = (SCREEN_HEIGHT - h) / 2;
ADDRLP4 4
CNSTI4 480
ADDRFP4 8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 1217
;1217:  UI_DrawHandlePic(x, y, w, h, image);
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
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
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1218
;1218:}
LABELV $653
endproc UI_DrawCenteredPic 8 20
data
export frameCount
align 4
LABELV frameCount
byte 4 0
bss
align 4
LABELV $655
skip 4
align 4
LABELV $656
skip 16
export _UI_Refresh
code
proc _UI_Refresh 76 20
line 1227
;1219:
;1220:int frameCount = 0;
;1221:int startTime;
;1222:
;1223: #define UI_UPDATE_TIME	1000
;1224:
;1225:#define	UI_FPS_FRAMES	4
;1226:void _UI_Refresh( int realtime )
;1227:{
line 1238
;1228:	static int index;
;1229:	static int	previousTimes[UI_FPS_FRAMES];
;1230:	int xp, xpo;
;1231:
;1232:	//if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
;1233:	//	return;
;1234:	//}
;1235:	
;1236:	// new menu hack
;1237:	
;1238:	xp = trap_Cvar_VariableValue("ui_char_xp");
ADDRGP4 $318
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1239
;1239:	xpo = trap_Cvar_VariableValue("char_xp");
ADDRGP4 $657
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1240
;1240:	if (xp < 0) { // first time on server
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $658
line 1241
;1241:		if (xpo != 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $659
line 1242
;1242:			trap_Cvar_Set("ui_char_xp", va("%i", xpo) );
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $318
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1243
;1243:			trap_Cvar_Set("ui_char_old_xp", va("%i", xpo) );
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $320
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1244
;1244:		}
line 1245
;1245:	} else { // intermission
ADDRGP4 $659
JUMPV
LABELV $658
line 1246
;1246:		xpo = trap_Cvar_VariableValue("ui_char_old_xp");
ADDRGP4 $320
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1247
;1247:		xp = trap_Cvar_VariableValue("char_xp");
ADDRGP4 $657
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1249
;1248:
;1249:		if (xp > xpo) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $663
line 1251
;1250:
;1251:			trap_Cvar_Set("ui_char_old_xp", va("%i", xp));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $320
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1253
;1252:		
;1253:			xp -= xpo;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 1254
;1254:			xpo = trap_Cvar_VariableValue("ui_char_xp");
ADDRGP4 $318
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1255
;1255:			xpo += xp;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1256
;1256:			trap_Cvar_Set("ui_char_xp", va("%i", xpo));
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $318
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1258
;1257:			
;1258:		}
LABELV $663
line 1259
;1259:	}
LABELV $659
line 1261
;1260:	
;1261:	uiInfo.uiDC.frameTime = realtime - uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+216
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
SUBI4
ASGNI4
line 1262
;1262:	uiInfo.uiDC.realTime = realtime;
ADDRGP4 uiInfo+212
ADDRFP4 0
INDIRI4
ASGNI4
line 1264
;1263:
;1264:	previousTimes[index % UI_FPS_FRAMES] = uiInfo.uiDC.frameTime;
ADDRGP4 $655
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $656
ADDP4
ADDRGP4 uiInfo+216
INDIRI4
ASGNI4
line 1265
;1265:	index++;
ADDRLP4 16
ADDRGP4 $655
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1266
;1266:	if ( index > UI_FPS_FRAMES ) {
ADDRGP4 $655
INDIRI4
CNSTI4 4
LEI4 $669
line 1269
;1267:		int i, total;
;1268:		// average multiple frames together to smooth changes out a bit
;1269:		total = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1270
;1270:		for ( i = 0 ; i < UI_FPS_FRAMES ; i++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $671
line 1271
;1271:			total += previousTimes[i];
ADDRLP4 24
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $656
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1272
;1272:		}
LABELV $672
line 1270
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 4
LTI4 $671
line 1273
;1273:		if ( !total ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $675
line 1274
;1274:			total = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 1275
;1275:		}
LABELV $675
line 1276
;1276:		uiInfo.uiDC.FPS = 1000 * UI_FPS_FRAMES / total;
ADDRGP4 uiInfo+73464
CNSTI4 4000
ADDRLP4 24
INDIRI4
DIVI4
CVIF4 4
ASGNF4
line 1277
;1277:	}
LABELV $669
line 1281
;1278:
;1279:
;1280:
;1281:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 1283
;1282:
;1283:	if (Menu_Count() > 0) {
ADDRLP4 20
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LEI4 $678
line 1285
;1284:		// paint all the menus
;1285:		Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 1287
;1286:		// refresh server browser list
;1287:		UI_DoServerRefresh();
ADDRGP4 UI_DoServerRefresh
CALLV
pop
line 1289
;1288:		// refresh server status
;1289:		UI_BuildServerStatus(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 1291
;1290:		// refresh find player list
;1291:		UI_BuildFindPlayerList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 1292
;1292:	} 
LABELV $678
line 1294
;1293:
;1294:	{
line 1295
;1295:		int acc = trap_Cvar_VariableValue("char_accuracy");
ADDRGP4 $680
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 1296
;1296:		int str = trap_Cvar_VariableValue("char_strength");
ADDRGP4 $681
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 52
INDIRF4
CVFI4 4
ASGNI4
line 1297
;1297:		int stl = trap_Cvar_VariableValue("char_stealth");
ADDRGP4 $682
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 1298
;1298:		int sta = trap_Cvar_VariableValue("char_stamina");
ADDRGP4 $683
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 60
INDIRF4
CVFI4 4
ASGNI4
line 1299
;1299:		int tech = trap_Cvar_VariableValue("char_technical");
ADDRGP4 $684
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 64
INDIRF4
CVFI4 4
ASGNI4
line 1300
;1300:		int	spd = trap_Cvar_VariableValue("char_speed"); 
ADDRGP4 $685
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 68
INDIRF4
CVFI4 4
ASGNI4
line 1302
;1301:
;1302:		if ( uiInfo.raise_level_acc < acc )
ADDRGP4 uiInfo+136392
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $686
line 1303
;1303:			uiInfo.raise_level_acc = acc;
ADDRGP4 uiInfo+136392
ADDRLP4 24
INDIRI4
ASGNI4
LABELV $686
line 1304
;1304:		if ( uiInfo.raise_level_spd < spd )
ADDRGP4 uiInfo+136412
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $690
line 1305
;1305:			uiInfo.raise_level_spd = spd;
ADDRGP4 uiInfo+136412
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $690
line 1306
;1306:		if ( uiInfo.raise_level_str < str )
ADDRGP4 uiInfo+136400
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $694
line 1307
;1307:			uiInfo.raise_level_str = str;
ADDRGP4 uiInfo+136400
ADDRLP4 28
INDIRI4
ASGNI4
LABELV $694
line 1308
;1308:		if ( uiInfo.raise_level_stl < stl )
ADDRGP4 uiInfo+136408
INDIRI4
ADDRLP4 32
INDIRI4
GEI4 $698
line 1309
;1309:			uiInfo.raise_level_stl = stl;
ADDRGP4 uiInfo+136408
ADDRLP4 32
INDIRI4
ASGNI4
LABELV $698
line 1310
;1310:		if ( uiInfo.raise_level_sta < sta )
ADDRGP4 uiInfo+136396
INDIRI4
ADDRLP4 36
INDIRI4
GEI4 $702
line 1311
;1311:			uiInfo.raise_level_sta = sta;
ADDRGP4 uiInfo+136396
ADDRLP4 36
INDIRI4
ASGNI4
LABELV $702
line 1312
;1312:		if ( uiInfo.raise_level_tec < tech )
ADDRGP4 uiInfo+136404
INDIRI4
ADDRLP4 40
INDIRI4
GEI4 $706
line 1313
;1313:			uiInfo.raise_level_tec = tech;
ADDRGP4 uiInfo+136404
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $706
line 1316
;1314:
;1315:		// it seems like we changed our team. so reset these settings
;1316:		if ( acc == 1 &&
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $710
ADDRLP4 28
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $710
ADDRLP4 32
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $710
ADDRLP4 36
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $710
ADDRLP4 40
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $710
ADDRLP4 44
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $710
ADDRGP4 uiInfo+136404
INDIRI4
ADDRGP4 uiInfo+136396
INDIRI4
ADDI4
ADDRGP4 uiInfo+136408
INDIRI4
ADDI4
ADDRGP4 uiInfo+136400
INDIRI4
ADDI4
ADDRGP4 uiInfo+136412
INDIRI4
ADDI4
ADDRGP4 uiInfo+136392
INDIRI4
ADDI4
CNSTI4 6
LEI4 $710
line 1324
;1317:			str == 1 &&
;1318:			stl == 1 &&
;1319:			sta == 1 &&
;1320:			tech == 1 &&
;1321:			spd == 1 && 
;1322:			( uiInfo.raise_level_tec + uiInfo.raise_level_sta + uiInfo.raise_level_stl + uiInfo.raise_level_str + uiInfo.raise_level_spd + uiInfo.raise_level_acc ) > 6 			
;1323:			)
;1324:		{
line 1325
;1325:			uiInfo.raise_level_acc = acc; 
ADDRGP4 uiInfo+136392
ADDRLP4 24
INDIRI4
ASGNI4
line 1326
;1326:			uiInfo.raise_level_spd = spd; 
ADDRGP4 uiInfo+136412
ADDRLP4 44
INDIRI4
ASGNI4
line 1327
;1327:			uiInfo.raise_level_str = str; 
ADDRGP4 uiInfo+136400
ADDRLP4 28
INDIRI4
ASGNI4
line 1328
;1328:			uiInfo.raise_level_stl = stl; 
ADDRGP4 uiInfo+136408
ADDRLP4 32
INDIRI4
ASGNI4
line 1329
;1329:			uiInfo.raise_level_sta = sta; 
ADDRGP4 uiInfo+136396
ADDRLP4 36
INDIRI4
ASGNI4
line 1330
;1330:			uiInfo.raise_level_tec = tech; 
ADDRGP4 uiInfo+136404
ADDRLP4 40
INDIRI4
ASGNI4
line 1331
;1331:		}
LABELV $710
line 1332
;1332:	}
line 1334
;1333:
;1334:	{
line 1335
;1335:		int flash = trap_Cvar_VariableValue("inven_ammo_flash");
ADDRGP4 $724
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 1336
;1336:		int smoke = trap_Cvar_VariableValue("inven_ammo_smoke");
ADDRGP4 $725
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 1337
;1337:		int gren40mm = trap_Cvar_VariableValue("inven_ammo_40mmgren");
ADDRGP4 $726
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 1338
;1338:		int mk26 = trap_Cvar_VariableValue("inven_ammo_mk26");
ADDRGP4 $727
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 52
INDIRF4
CVFI4 4
ASGNI4
line 1340
;1339:
;1340:		if (flash + smoke + gren40mm + mk26 > SEALS_MAX_GRENADES) {
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ADDRLP4 32
INDIRI4
ADDI4
ADDRLP4 36
INDIRI4
ADDI4
CNSTI4 4
LEI4 $728
line 1341
;1341:			trap_Cvar_Set("inven_ammo_flash", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $724
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1342
;1342:			trap_Cvar_Set("inven_ammo_smoke", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $725
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1343
;1343:			trap_Cvar_Set("inven_ammo_40mmgren", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $726
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1344
;1344:			trap_Cvar_Set("inven_ammo_mk26", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $727
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1345
;1345:		}
LABELV $728
line 1346
;1346:	}
line 1349
;1347:	
;1348:	// draw cursor
;1349:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 1351
;1350:
;1351:	if (Menu_Count() > 0) {
ADDRLP4 24
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LEI4 $730
line 1352
;1352:		UI_DrawHandlePic( uiInfo.uiDC.cursorx-16, uiInfo.uiDC.cursory-16, 32, 32, uiInfo.uiDC.Assets.cursor);
ADDRLP4 28
CNSTI4 16
ASGNI4
ADDRGP4 uiInfo+220
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 uiInfo+224
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 32
CNSTF4 1107296256
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 uiInfo+232+61656
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1353
;1353:	}
LABELV $730
line 1356
;1354:
;1355:#ifndef NDEBUG
;1356:	if (uiInfo.uiDC.debug)
ADDRGP4 uiInfo+228
INDIRI4
CNSTI4 0
EQI4 $736
line 1357
;1357:	{
line 1361
;1358:		// cursor coordinates
;1359:		//FIXME
;1360:		//UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorMdGrey );
;1361:	}
LABELV $736
line 1364
;1362:#endif
;1363:
;1364:}
LABELV $654
endproc _UI_Refresh 76 20
export _UI_Shutdown
proc _UI_Shutdown 0 0
line 1371
;1365:
;1366:/*
;1367:=================
;1368:_UI_Shutdown
;1369:=================
;1370:*/
;1371:void _UI_Shutdown( void ) {
line 1372
;1372:	trap_LAN_SaveCachedServers();
ADDRGP4 trap_LAN_SaveCachedServers
CALLV
pop
line 1373
;1373:}
LABELV $739
endproc _UI_Shutdown 0 0
data
export defaultMenu
align 4
LABELV defaultMenu
byte 4 0
bss
align 1
LABELV $741
skip 32768
export GetMenuBuffer
code
proc GetMenuBuffer 16 16
line 1377
;1374:
;1375:char *defaultMenu = NULL;
;1376:
;1377:char *GetMenuBuffer(const char *filename) {
line 1382
;1378:	int	len;
;1379:	fileHandle_t	f;
;1380:	static char buf[MAX_MENUFILE];
;1381:
;1382:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1383
;1383:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $742
line 1384
;1384:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
ADDRGP4 $744
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1385
;1385:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $740
JUMPV
LABELV $742
line 1387
;1386:	}
;1387:	if ( len >= MAX_MENUFILE ) {
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $745
line 1388
;1388:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
ADDRGP4 $747
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 32768
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1389
;1389:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1390
;1390:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $740
JUMPV
LABELV $745
line 1393
;1391:	}
;1392:
;1393:	trap_FS_Read( buf, len, f );
ADDRGP4 $741
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1394
;1394:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $741
ADDP4
CNSTI1 0
ASGNI1
line 1395
;1395:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1397
;1396:	//COM_Compress(buf);
;1397:  return buf;
ADDRGP4 $741
RETP4
LABELV $740
endproc GetMenuBuffer 16 16
export Asset_Parse
proc Asset_Parse 1124 12
line 1401
;1398:
;1399:}
;1400:
;1401:qboolean Asset_Parse(int handle) {
line 1405
;1402:	pc_token_t token;
;1403:	const char *tempStr;
;1404:
;1405:	if (!trap_PC_ReadToken(handle, &token))
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
NEI4 $749
line 1406
;1406:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $749
line 1407
;1407:	if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $754
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $756
line 1408
;1408:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $755
line 1411
;1409:	}
;1410:    
;1411:	while ( 1 ) {
line 1413
;1412:
;1413:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1415
;1414:
;1415:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
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
NEI4 $758
line 1416
;1416:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $758
line 1418
;1417:
;1418:		if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $763
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $760
line 1419
;1419:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $748
JUMPV
LABELV $760
line 1423
;1420:		}
;1421:
;1422:		// font
;1423:		if (Q_stricmp(token.string, "font") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $767
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $764
line 1425
;1424:			int pointSize;
;1425:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1068
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $770
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ARGP4
ADDRLP4 1072
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $768
LABELV $770
line 1426
;1426:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $768
line 1428
;1427:			}
;1428:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.textFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+12
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 1429
;1429:			uiInfo.uiDC.Assets.fontRegistered = qtrue;
ADDRGP4 uiInfo+232+61764
CNSTI4 1
ASGNI4
line 1430
;1430:			continue;
ADDRGP4 $756
JUMPV
LABELV $764
line 1433
;1431:		}
;1432:
;1433:		if (Q_stricmp(token.string, "smallFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $778
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $775
line 1435
;1434:			int pointSize;
;1435:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1072
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $781
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ARGP4
ADDRLP4 1076
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $779
LABELV $781
line 1436
;1436:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $779
line 1438
;1437:			}
;1438:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.smallFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+20560
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 1439
;1439:			continue;
ADDRGP4 $756
JUMPV
LABELV $775
line 1442
;1440:		}
;1441:
;1442:		if (Q_stricmp(token.string, "bigFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $787
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $784
line 1444
;1443:			int pointSize;
;1444:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $790
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ARGP4
ADDRLP4 1080
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $788
LABELV $790
line 1445
;1445:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $788
line 1447
;1446:			}
;1447:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.bigFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+41108
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 1448
;1448:			continue;
ADDRGP4 $756
JUMPV
LABELV $784
line 1453
;1449:		}
;1450:
;1451:
;1452:		// gradientbar
;1453:		if (Q_stricmp(token.string, "gradientbar") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $796
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $793
line 1454
;1454:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $797
line 1455
;1455:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $797
line 1457
;1456:			}
;1457:			uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61660
ADDRLP4 1080
INDIRI4
ASGNI4
line 1458
;1458:			continue;
ADDRGP4 $756
JUMPV
LABELV $793
line 1462
;1459:		}
;1460:
;1461:		// enterMenuSound
;1462:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $804
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $801
line 1463
;1463:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1080
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $805
line 1464
;1464:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $805
line 1466
;1465:			}
;1466:			uiInfo.uiDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61708
ADDRLP4 1084
INDIRI4
ASGNI4
line 1467
;1467:			continue;
ADDRGP4 $756
JUMPV
LABELV $801
line 1471
;1468:		}
;1469:
;1470:		// exitMenuSound
;1471:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $812
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $809
line 1472
;1472:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1084
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $813
line 1473
;1473:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $813
line 1475
;1474:			}
;1475:			uiInfo.uiDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61712
ADDRLP4 1088
INDIRI4
ASGNI4
line 1476
;1476:			continue;
ADDRGP4 $756
JUMPV
LABELV $809
line 1480
;1477:		}
;1478:
;1479:		// itemFocusSound
;1480:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $820
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $817
line 1481
;1481:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1088
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $821
line 1482
;1482:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $821
line 1484
;1483:			}
;1484:			uiInfo.uiDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1092
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61720
ADDRLP4 1092
INDIRI4
ASGNI4
line 1485
;1485:			continue;
ADDRGP4 $756
JUMPV
LABELV $817
line 1489
;1486:		}
;1487:
;1488:		// menuBuzzSound
;1489:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $828
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $825
line 1490
;1490:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1092
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $829
line 1491
;1491:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $829
line 1493
;1492:			}
;1493:			uiInfo.uiDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1096
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61716
ADDRLP4 1096
INDIRI4
ASGNI4
line 1494
;1494:			continue;
ADDRGP4 $756
JUMPV
LABELV $825
line 1497
;1495:		}
;1496:
;1497:		if (Q_stricmp(token.string, "cursor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $836
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $833
line 1498
;1498:			if (!PC_String_Parse(handle, &uiInfo.uiDC.Assets.cursorStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+4
ARGP4
ADDRLP4 1096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $837
line 1499
;1499:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $837
line 1501
;1500:			}
;1501:			uiInfo.uiDC.Assets.cursor = trap_R_RegisterShaderNoMip( uiInfo.uiDC.Assets.cursorStr);
ADDRGP4 uiInfo+232+4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+232+61656
ADDRLP4 1100
INDIRI4
ASGNI4
line 1502
;1502:			continue;
ADDRGP4 $756
JUMPV
LABELV $833
line 1505
;1503:		}
;1504:
;1505:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $848
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $845
line 1506
;1506:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeClamp)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+61724
ARGP4
ADDRLP4 1100
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $756
line 1507
;1507:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
line 1509
;1508:			}
;1509:			continue;
LABELV $845
line 1512
;1510:		}
;1511:
;1512:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $856
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $853
line 1513
;1513:			if (!PC_Int_Parse(handle, &uiInfo.uiDC.Assets.fadeCycle)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+61728
ARGP4
ADDRLP4 1104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $756
line 1514
;1514:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
line 1516
;1515:			}
;1516:			continue;
LABELV $853
line 1519
;1517:		}
;1518:
;1519:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $864
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $861
line 1520
;1520:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeAmount)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+61732
ARGP4
ADDRLP4 1108
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $756
line 1521
;1521:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
line 1523
;1522:			}
;1523:			continue;
LABELV $861
line 1526
;1524:		}
;1525:
;1526:		if (Q_stricmp(token.string, "shadowX") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $872
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $869
line 1527
;1527:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowX)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+61736
ARGP4
ADDRLP4 1112
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $756
line 1528
;1528:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
line 1530
;1529:			}
;1530:			continue;
LABELV $869
line 1533
;1531:		}
;1532:
;1533:		if (Q_stricmp(token.string, "shadowY") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $880
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $877
line 1534
;1534:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowY)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+61740
ARGP4
ADDRLP4 1116
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $756
line 1535
;1535:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
line 1537
;1536:			}
;1537:			continue;
LABELV $877
line 1540
;1538:		}
;1539:
;1540:		if (Q_stricmp(token.string, "shadowColor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $888
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $885
line 1541
;1541:			if (!PC_Color_Parse(handle, &uiInfo.uiDC.Assets.shadowColor)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+232+61744
ARGP4
ADDRLP4 1120
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $889
line 1542
;1542:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $748
JUMPV
LABELV $889
line 1544
;1543:			}
;1544:			uiInfo.uiDC.Assets.shadowFadeClamp = uiInfo.uiDC.Assets.shadowColor[3];
ADDRGP4 uiInfo+232+61760
ADDRGP4 uiInfo+232+61744+12
INDIRF4
ASGNF4
line 1545
;1545:			continue;
LABELV $885
line 1548
;1546:		}
;1547:
;1548:	}
LABELV $756
line 1411
ADDRGP4 $755
JUMPV
line 1549
;1549:	return qfalse;
CNSTI4 0
RETI4
LABELV $748
endproc Asset_Parse 1124 12
export Font_Report
proc Font_Report 8 12
line 1552
;1550:}
;1551:
;1552:void Font_Report() {
line 1554
;1553:  int i;
;1554:  Com_Printf("Font Info\n");
ADDRGP4 $899
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1555
;1555:  Com_Printf("=========\n");
ADDRGP4 $900
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1556
;1556:  for ( i = 32; i < 96; i++) {
ADDRLP4 0
CNSTI4 32
ASGNI4
LABELV $901
line 1557
;1557:    Com_Printf("Glyph handle %i: %i\n", i, uiInfo.uiDC.Assets.textFont.glyphs[i].glyph);
ADDRGP4 $905
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 80
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+232+12+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1558
;1558:  }
LABELV $902
line 1556
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 96
LTI4 $901
line 1559
;1559:}
LABELV $898
endproc Font_Report 8 12
export UI_Report
proc UI_Report 0 0
line 1561
;1560:
;1561:void UI_Report() {
line 1562
;1562:  String_Report();
ADDRGP4 String_Report
CALLV
pop
line 1565
;1563:  //Font_Report();
;1564:
;1565:}
LABELV $909
endproc UI_Report 0 0
export UI_ParseMenu
proc UI_ParseMenu 1060 12
line 1567
;1566:
;1567:void UI_ParseMenu(const char *menuFile) {
line 1573
;1568:	int handle;
;1569:	pc_token_t token;
;1570:
;1571://	Com_Printf("Parsing menu file:%s\n", menuFile);
;1572:
;1573:	handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 1574
;1574:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $914
line 1575
;1575:		return;
ADDRGP4 $910
JUMPV
LABELV $913
line 1578
;1576:	}
;1577:
;1578:	while ( 1 ) {
line 1579
;1579:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1580
;1580:		if (!trap_PC_ReadToken( handle, &token )) {
ADDRLP4 1040
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
NEI4 $916
line 1581
;1581:			break;
ADDRGP4 $915
JUMPV
LABELV $916
line 1594
;1582:		}
;1583:
;1584:		//if ( Q_stricmp( token, "{" ) ) {
;1585:		//	Com_Printf( "Missing { in menu file\n" );
;1586:		//	break;
;1587:		//}
;1588:
;1589:		//if ( menuCount == MAX_MENUS ) {
;1590:		//	Com_Printf( "Too many menus!\n" );
;1591:		//	break;
;1592:		//}
;1593:
;1594:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $918
line 1595
;1595:			break;
ADDRGP4 $915
JUMPV
LABELV $918
line 1598
;1596:		}
;1597:
;1598:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $924
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $921
line 1599
;1599:			if (Asset_Parse(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $915
line 1600
;1600:				continue;
ADDRGP4 $914
JUMPV
line 1601
;1601:			} else {
line 1602
;1602:				break;
LABELV $921
line 1606
;1603:			}
;1604:		}
;1605:
;1606:		if (Q_stricmp(token.string, "menudef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $930
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $927
line 1608
;1607:			// start a new menu
;1608:			Menu_New(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 1609
;1609:		}
LABELV $927
line 1610
;1610:	}
LABELV $914
line 1578
ADDRGP4 $913
JUMPV
LABELV $915
line 1611
;1611:	trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 1612
;1612:}
LABELV $910
endproc UI_ParseMenu 1060 12
export Load_Menu
proc Load_Menu 1048 8
line 1614
;1613:
;1614:qboolean Load_Menu(int handle) {
line 1617
;1615:	pc_token_t token;
;1616:
;1617:	if (!trap_PC_ReadToken(handle, &token))
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
NEI4 $932
line 1618
;1618:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $931
JUMPV
LABELV $932
line 1619
;1619:	if (token.string[0] != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $938
line 1620
;1620:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $931
JUMPV
LABELV $937
line 1623
;1621:	}
;1622:
;1623:	while ( 1 ) {
line 1625
;1624:
;1625:		if (!trap_PC_ReadToken(handle, &token))
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
NEI4 $940
line 1626
;1626:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $931
JUMPV
LABELV $940
line 1628
;1627:    
;1628:		if ( token.string[0] == 0 ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $942
line 1629
;1629:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $931
JUMPV
LABELV $942
line 1632
;1630:		}
;1631:
;1632:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $945
line 1633
;1633:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $931
JUMPV
LABELV $945
line 1636
;1634:		}
;1635:
;1636:		UI_ParseMenu(token.string); 
ADDRLP4 0+16
ARGP4
ADDRGP4 UI_ParseMenu
CALLV
pop
line 1637
;1637:	}
LABELV $938
line 1623
ADDRGP4 $937
JUMPV
line 1638
;1638:	return qfalse;
CNSTI4 0
RETI4
LABELV $931
endproc Load_Menu 1048 8
export UI_LoadMenus
proc UI_LoadMenus 1068 8
line 1641
;1639:}
;1640:
;1641:void UI_LoadMenus(const char *menuFile, qboolean reset) {
line 1646
;1642:	pc_token_t token;
;1643:	int handle;
;1644:	int start;
;1645:
;1646:	start = trap_Milliseconds();
ADDRLP4 1048
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1048
INDIRI4
ASGNI4
line 1648
;1647:
;1648:	handle = trap_PC_LoadSource( menuFile );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 1649
;1649:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $950
line 1650
;1650:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
ADDRGP4 $952
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1651
;1651:		handle = trap_PC_LoadSource( "ui/menus.txt" );
ADDRGP4 $234
ARGP4
ADDRLP4 1060
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1060
INDIRI4
ASGNI4
line 1652
;1652:		if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $953
line 1653
;1653:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/menus.txt, unable to continue!\n", menuFile ) );
ADDRGP4 $955
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1654
;1654:		}
LABELV $953
line 1655
;1655:	}
LABELV $950
line 1657
;1656:
;1657:	ui_new.integer = 1;
ADDRGP4 ui_new+12
CNSTI4 1
ASGNI4
line 1659
;1658:
;1659:	if (reset) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $960
line 1660
;1660:		Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 1661
;1661:	}
ADDRGP4 $960
JUMPV
LABELV $959
line 1663
;1662:
;1663:	while ( 1 ) {
line 1664
;1664:		if (!trap_PC_ReadToken(handle, &token))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $962
line 1665
;1665:			break;
ADDRGP4 $961
JUMPV
LABELV $962
line 1666
;1666:		if( token.string[0] == 0 || token.string[0] == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $968
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $964
LABELV $968
line 1667
;1667:			break;
ADDRGP4 $961
JUMPV
LABELV $964
line 1670
;1668:		}
;1669:
;1670:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $969
line 1671
;1671:			break;
ADDRGP4 $961
JUMPV
LABELV $969
line 1674
;1672:		}
;1673:
;1674:		if (Q_stricmp(token.string, "loadmenu") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $975
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $972
line 1675
;1675:			if (Load_Menu(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 Load_Menu
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $961
line 1676
;1676:				continue;
line 1677
;1677:			} else {
line 1678
;1678:				break;
LABELV $972
line 1681
;1679:			}
;1680:		}
;1681:	}
LABELV $960
line 1663
ADDRGP4 $959
JUMPV
LABELV $961
line 1687
;1682:
;1683:	// BLUTENGEL 07.01.2004
;1684:	// removed as noone really wants to know that!
;1685:	// Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;1686:
;1687:	trap_PC_FreeSource( handle );
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 1688
;1688:}
LABELV $949
endproc UI_LoadMenus 1068 8
export UI_Load
proc UI_Load 1052 8
line 1690
;1689:
;1690:void UI_Load() {
line 1692
;1691:	char lastName[1024];
;1692:  menuDef_t *menu = Menu_GetFocused();
ADDRLP4 1032
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1032
INDIRP4
ASGNP4
line 1693
;1693:	char *menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $233
ARGP4
ADDRLP4 1036
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 1694
;1694:	if (menu && menu->window.name) {
ADDRLP4 1044
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 1044
INDIRU4
EQU4 $979
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1044
INDIRU4
EQU4 $979
line 1695
;1695:		strcpy(lastName, menu->window.name);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1696
;1696:	}
LABELV $979
line 1697
;1697:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $983
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $981
LABELV $983
line 1698
;1698:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $234
ASGNP4
line 1699
;1699:	}
LABELV $981
line 1701
;1700:
;1701:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 1706
;1702:
;1703:#ifdef PRE_RELEASE_TADEMO
;1704:	UI_ParseGameInfo("demogameinfo.txt");
;1705:#else
;1706:	UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $984
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 1707
;1707:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 1710
;1708:#endif
;1709:
;1710:	UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 1711
;1711:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 1712
;1712:	Menus_ActivateByName(lastName);
ADDRLP4 8
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 1714
;1713:
;1714:}
LABELV $978
endproc UI_Load 1052 8
data
align 4
LABELV handicapValues
address $985
address $986
address $987
address $988
address $305
address $989
address $990
address $991
address $992
address $993
address $994
address $995
address $996
address $997
address $163
address $998
address $150
address $155
address $265
address $267
byte 4 0
align 4
LABELV numHandicaps
byte 4 21
code
proc UI_DrawHandicap 20 32
line 1719
;1715:
;1716:static const char *handicapValues[] = {"None","95","90","85","80","75","70","65","60","55","50","45","40","35","30","25","20","15","10","5",NULL};
;1717:static int numHandicaps = sizeof(handicapValues) / sizeof(const char*);
;1718:
;1719:static void UI_DrawHandicap(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1722
;1720:  int i, h;
;1721:
;1722:  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $1000
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1723
;1723:  i = 20 - h / 5;
ADDRLP4 0
CNSTI4 20
ADDRLP4 4
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 1725
;1724:
;1725:  Text_Paint(rect->x, rect->y, scale, color, handicapValues[i], 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1726
;1726:}
LABELV $999
endproc UI_DrawHandicap 20 32
proc UI_DrawClanName 8 32
line 1728
;1727:
;1728:static void UI_DrawClanName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1729
;1729:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_teamName"), 0, 0, textStyle);
ADDRGP4 $208
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1730
;1730:}
LABELV $1001
endproc UI_DrawClanName 8 32
proc UI_SetCapFragLimits 16 8
line 1733
;1731:
;1732:
;1733:static void UI_SetCapFragLimits(qboolean uiVars) {
line 1734
;1734:	int cap = 5;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1735
;1735:	int frag = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 1736
;1736:	if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_OBELISK) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1003
line 1737
;1737:		cap = 4;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1738
;1738:	} else if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_HARVESTER) {
ADDRGP4 $1004
JUMPV
LABELV $1003
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CNSTI4 11
NEI4 $1008
line 1739
;1739:		cap = 15;
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1740
;1740:	}
LABELV $1008
LABELV $1004
line 1741
;1741:	if (uiVars) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1013
line 1742
;1742:		trap_Cvar_Set("ui_captureLimit", va("%d", cap));
ADDRGP4 $1015
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $266
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1743
;1743:		trap_Cvar_Set("ui_fragLimit", va("%d", frag));
ADDRGP4 $1015
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $264
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1744
;1744:	} else {
ADDRGP4 $1014
JUMPV
LABELV $1013
line 1745
;1745:		trap_Cvar_Set("capturelimit", va("%d", cap));
ADDRGP4 $1015
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $280
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1746
;1746:		trap_Cvar_Set("fraglimit", va("%d", frag));
ADDRGP4 $1015
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1016
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1747
;1747:	}
LABELV $1014
line 1748
;1748:}
LABELV $1002
endproc UI_SetCapFragLimits 16 8
proc UI_DrawGameType 4 32
line 1750
;1749:// ui_gameType assumes gametype 0 is -1 ALL and will not show
;1750:static void UI_DrawGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1751
;1751:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_gameType.integer].gameType, 0, 0, textStyle);
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1752
;1752:}
LABELV $1017
endproc UI_DrawGameType 4 32
proc UI_DrawNetGameType 4 32
line 1754
;1753:
;1754:static void UI_DrawNetGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1755
;1755:	if (ui_netGameType.integer < 0 || ui_netGameType.integer > uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $1026
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78116
INDIRI4
LEI4 $1021
LABELV $1026
line 1756
;1756:		trap_Cvar_Set("ui_netGameType", "0");
ADDRGP4 $1027
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1757
;1757:		trap_Cvar_Set("ui_actualNetGameType", "0");
ADDRGP4 $1028
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1758
;1758:	}
LABELV $1021
line 1759
;1759:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_netGameType.integer].gameType , 0, 0, textStyle);
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1760
;1760:}
LABELV $1020
endproc UI_DrawNetGameType 4 32
proc UI_DrawJoinGameType 4 32
line 1762
;1761:
;1762:static void UI_DrawJoinGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1763
;1763:	if (ui_joinGameType.integer < 0 || ui_joinGameType.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
LTI4 $1037
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+78248
INDIRI4
LEI4 $1032
LABELV $1037
line 1764
;1764:		trap_Cvar_Set("ui_joinGameType", "0");
ADDRGP4 $1038
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1765
;1765:	}
LABELV $1032
line 1766
;1766:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.joinGameTypes[ui_joinGameType.integer].gameType , 0, 0, textStyle);
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78252
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1767
;1767:}
LABELV $1031
endproc UI_DrawJoinGameType 4 32
proc UI_TeamIndexFromName 12 8
line 1771
;1768:
;1769:
;1770:
;1771:static int UI_TeamIndexFromName(const char *name) {
line 1774
;1772:  int i;
;1773:
;1774:  if (name && *name) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1042
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1042
line 1775
;1775:    for (i = 0; i < uiInfo.teamCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1047
JUMPV
LABELV $1044
line 1776
;1776:      if (Q_stricmp(name, uiInfo.teamList[i].teamName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
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
NEI4 $1049
line 1777
;1777:        return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1041
JUMPV
LABELV $1049
line 1779
;1778:      }
;1779:    }
LABELV $1045
line 1775
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1047
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
LTI4 $1044
line 1780
;1780:  } 
LABELV $1042
line 1782
;1781:
;1782:  return 0;
CNSTI4 0
RETI4
LABELV $1041
endproc UI_TeamIndexFromName 12 8
proc UI_DrawClanLogo 48 20
line 1786
;1783:
;1784:}
;1785:
;1786:static void UI_DrawClanLogo(rectDef_t *rect, float scale, vec4_t color) {
line 1788
;1787:  int i;
;1788:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1789
;1789:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1053
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
GEI4 $1053
line 1790
;1790:  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1792
;1791:
;1792:		if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1056
line 1793
;1793:      uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 16
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75300+28
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1794
;1794:      uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $1066
ARGP4
ADDRLP4 24
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+75300+32
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1795
;1795:      uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $1071
ARGP4
ADDRLP4 36
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75300+36
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 1796
;1796:		}
LABELV $1056
line 1798
;1797:
;1798:  	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1799
;1799:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1800
;1800:  }
LABELV $1053
line 1801
;1801:}
LABELV $1052
endproc UI_DrawClanLogo 48 20
proc UI_DrawClanCinematic 32 24
line 1803
;1802:
;1803:static void UI_DrawClanCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1805
;1804:  int i;
;1805:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1806
;1806:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1077
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
GEI4 $1077
line 1808
;1807:
;1808:		if (uiInfo.teamList[i].cinematic >= -2) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
CNSTI4 -2
LTI4 $1080
line 1809
;1809:			if (uiInfo.teamList[i].cinematic == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1084
line 1810
;1810:				uiInfo.teamList[i].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.teamList[i].imageName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $1090
ARGP4
ADDRLP4 16
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 28
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75300+40
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1811
;1811:			}
LABELV $1084
line 1812
;1812:			if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1093
line 1813
;1813:			  trap_CIN_RunCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1814
;1814:				trap_CIN_SetExtents(uiInfo.teamList[i].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1815
;1815:	 			trap_CIN_DrawCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1816
;1816:			} else {
ADDRGP4 $1081
JUMPV
LABELV $1093
line 1817
;1817:				uiInfo.teamList[i].cinematic = -2;
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
CNSTI4 -2
ASGNI4
line 1818
;1818:			}
line 1819
;1819:		} else {
ADDRGP4 $1081
JUMPV
LABELV $1080
line 1820
;1820:	  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1821
;1821:			UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1822
;1822:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1823
;1823:		}
LABELV $1081
line 1824
;1824:	}
LABELV $1077
line 1826
;1825:
;1826:}
LABELV $1076
endproc UI_DrawClanCinematic 32 24
proc UI_DrawPreviewCinematic 16 24
line 1828
;1827:
;1828:static void UI_DrawPreviewCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1829
;1829:	if (uiInfo.previewMovie > -2) {
ADDRGP4 uiInfo+99832
INDIRI4
CNSTI4 -2
LEI4 $1108
line 1830
;1830:		uiInfo.previewMovie = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.movieList[uiInfo.movieIndex]), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $1090
ARGP4
ADDRGP4 uiInfo+99828
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98800
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+99832
ADDRLP4 8
INDIRI4
ASGNI4
line 1831
;1831:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99832
INDIRI4
CNSTI4 0
LTI4 $1114
line 1832
;1832:		  trap_CIN_RunCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99832
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1833
;1833:			trap_CIN_SetExtents(uiInfo.previewMovie, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+99832
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1834
;1834: 			trap_CIN_DrawCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99832
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1835
;1835:		} else {
ADDRGP4 $1115
JUMPV
LABELV $1114
line 1836
;1836:			uiInfo.previewMovie = -2;
ADDRGP4 uiInfo+99832
CNSTI4 -2
ASGNI4
line 1837
;1837:		}
LABELV $1115
line 1838
;1838:	} 
LABELV $1108
line 1840
;1839:
;1840:}
LABELV $1107
endproc UI_DrawPreviewCinematic 16 24
proc UI_DrawSkill 16 32
line 1844
;1841:
;1842:
;1843:
;1844:static void UI_DrawSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1846
;1845:  int i;
;1846:	i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $174
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1847
;1847:  if (i < 1 || i > numSkillLevels) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $1124
ADDRLP4 0
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1122
LABELV $1124
line 1848
;1848:    i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1849
;1849:  }
LABELV $1122
line 1850
;1850:  Text_Paint(rect->x, rect->y, scale, color, skillLevels[i-1],0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1851
;1851:}
LABELV $1121
endproc UI_DrawSkill 16 32
proc UI_DrawTeamName 32 32
line 1854
;1852:
;1853:
;1854:static void UI_DrawTeamName(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int textStyle) {
line 1856
;1855:  int i;
;1856:  i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1130
ADDRLP4 4
ADDRGP4 $1127
ASGNP4
ADDRGP4 $1131
JUMPV
LABELV $1130
ADDRLP4 4
ADDRGP4 $1128
ASGNP4
LABELV $1131
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1857
;1857:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1132
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
GEI4 $1132
line 1858
;1858:    Text_Paint(rect->x, rect->y, scale, color, va("%s: %s", (blue) ? "Tangos" : "Seals", uiInfo.teamList[i].teamName),0, 0, textStyle);
ADDRGP4 $1135
ARGP4
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1140
ADDRLP4 20
ADDRGP4 $1136
ASGNP4
ADDRGP4 $1141
JUMPV
LABELV $1140
ADDRLP4 20
ADDRGP4 $1137
ASGNP4
LABELV $1141
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1859
;1859:  }
LABELV $1132
line 1860
;1860:}
LABELV $1126
endproc UI_DrawTeamName 32 32
proc UI_DrawTeamMember 28 32
line 1862
;1861:
;1862:static void UI_DrawTeamMember(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int num, int textStyle) {
line 1866
;1863:	// 0 - None
;1864:	// 1 - Human
;1865:	// 2..NumCharacters - Bot
;1866:	int value = trap_Cvar_VariableValue(va(blue ? "ui_blueteam%i" : "ui_redteam%i", num));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1146
ADDRLP4 8
ADDRGP4 $1143
ASGNP4
ADDRGP4 $1147
JUMPV
LABELV $1146
ADDRLP4 8
ADDRGP4 $1144
ASGNP4
LABELV $1147
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1868
;1867:	const char *text;
;1868:	if (value <= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1148
line 1869
;1869:		text = "Closed";
ADDRLP4 4
ADDRGP4 $1150
ASGNP4
line 1870
;1870:	} else if (value == 1) {
ADDRGP4 $1149
JUMPV
LABELV $1148
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1151
line 1871
;1871:		text = "Human";
ADDRLP4 4
ADDRGP4 $1153
ASGNP4
line 1872
;1872:	} else {
ADDRGP4 $1152
JUMPV
LABELV $1151
line 1873
;1873:		value -= 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1875
;1874:
;1875:		if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 1
LTI4 $1154
line 1876
;1876:			if (value >= uiInfo.characterCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73492
INDIRI4
LTI4 $1157
line 1877
;1877:				value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1878
;1878:			}
LABELV $1157
line 1879
;1879:			text = uiInfo.characterList[value].name;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500
ADDP4
INDIRP4
ASGNP4
line 1880
;1880:		} else {
ADDRGP4 $1155
JUMPV
LABELV $1154
line 1881
;1881:			if (value >= UI_GetNumBots()) {
ADDRLP4 20
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $1161
line 1882
;1882:				value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1883
;1883:			}
LABELV $1161
line 1884
;1884:			text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 1885
;1885:		}
LABELV $1155
line 1886
;1886:	}
LABELV $1152
LABELV $1149
line 1887
;1887:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1888
;1888:}
LABELV $1142
endproc UI_DrawTeamMember 28 32
proc UI_DrawEffects 16 20
line 1890
;1889:
;1890:static void UI_DrawEffects(rectDef_t *rect, float scale, vec4_t color) {
line 1891
;1891:	UI_DrawHandlePic( rect->x, rect->y - 14, 128, 8, uiInfo.uiDC.Assets.fxBasePic );
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
CNSTF4 1096810496
SUBF4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 uiInfo+232+61816
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1892
;1892:	UI_DrawHandlePic( rect->x + uiInfo.effectsColor * 16 + 8, rect->y - 16, 16, 12, uiInfo.uiDC.Assets.fxPic[uiInfo.effectsColor] );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uiInfo+136384
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
CVIF4 4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 12
CNSTF4 1098907648
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1094713344
ARGF4
ADDRGP4 uiInfo+136384
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+232+61820
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1893
;1893:}
LABELV $1163
endproc UI_DrawEffects 16 20
proc UI_DrawMapPreview 20 20
line 1895
;1894:
;1895:static void UI_DrawMapPreview(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1896
;1896:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1174
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1175
JUMPV
LABELV $1174
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1175
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1897
;1897:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1179
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LEI4 $1176
LABELV $1179
line 1898
;1898:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1180
line 1899
;1899:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1900
;1900:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $237
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1901
;1901:		} else {
ADDRGP4 $1181
JUMPV
LABELV $1180
line 1902
;1902:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1903
;1903:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $236
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1904
;1904:		}
LABELV $1181
line 1905
;1905:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1906
;1906:	}
LABELV $1176
line 1908
;1907:
;1908:	if (uiInfo.mapList[map].levelShot == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1184
line 1909
;1909:		uiInfo.mapList[map].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[map].imageName);
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+82768+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+82768+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1910
;1910:	}
LABELV $1184
line 1912
;1911:
;1912:	if (uiInfo.mapList[map].levelShot > 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+92
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1192
line 1913
;1913:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.mapList[map].levelShot);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+92
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1914
;1914:	} else {
ADDRGP4 $1193
JUMPV
LABELV $1192
line 1915
;1915:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $1198
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1916
;1916:	}
LABELV $1193
line 1917
;1917:}						 
LABELV $1170
endproc UI_DrawMapPreview 20 20
proc UI_DrawMapTimeToBeat 20 32
line 1920
;1918:
;1919:
;1920:static void UI_DrawMapTimeToBeat(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1922
;1921:	int minutes, seconds, time;
;1922:	if (ui_currentMap.integer < 0 || ui_currentMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentMap+12
INDIRI4
CNSTI4 0
LTI4 $1205
ADDRGP4 ui_currentMap+12
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LEI4 $1200
LABELV $1205
line 1923
;1923:		ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1924
;1924:		trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $236
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1925
;1925:	}
LABELV $1200
line 1927
;1926:
;1927:	time = uiInfo.mapList[ui_currentMap.integer].timeToBeat[uiInfo.gameTypes[ui_gameType.integer].gtEnum];
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+28
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1929
;1928:
;1929:	minutes = time / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1930
;1930:	seconds = time % 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
MODI4
ASGNI4
line 1932
;1931:
;1932:  Text_Paint(rect->x, rect->y, scale, color, va("%02i:%02i", minutes, seconds), 0, 0, textStyle);
ADDRGP4 $1213
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1933
;1933:}
LABELV $1199
endproc UI_DrawMapTimeToBeat 20 32
proc UI_DrawMapCinematic 28 24
line 1937
;1934:
;1935:
;1936:
;1937:static void UI_DrawMapCinematic(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1939
;1938:
;1939:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer; 
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1218
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1219
JUMPV
LABELV $1218
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1219
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1940
;1940:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1223
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LEI4 $1220
LABELV $1223
line 1941
;1941:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1224
line 1942
;1942:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1943
;1943:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $237
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1944
;1944:		} else {
ADDRGP4 $1225
JUMPV
LABELV $1224
line 1945
;1945:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1946
;1946:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $236
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1947
;1947:		}
LABELV $1225
line 1948
;1948:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1949
;1949:	}
LABELV $1220
line 1951
;1950:
;1951:	if (uiInfo.mapList[map].cinematic >= -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
CNSTI4 -1
LTI4 $1228
line 1952
;1952:		if (uiInfo.mapList[map].cinematic == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1232
line 1953
;1953:			uiInfo.mapList[map].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[map].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $1090
ARGP4
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
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
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+82768+24
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1954
;1954:		}
LABELV $1232
line 1955
;1955:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1240
line 1956
;1956:		  trap_CIN_RunCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1957
;1957:		  trap_CIN_SetExtents(uiInfo.mapList[map].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1958
;1958: 			trap_CIN_DrawCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1959
;1959:		} else {
ADDRGP4 $1229
JUMPV
LABELV $1240
line 1960
;1960:			uiInfo.mapList[map].cinematic = -2;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
CNSTI4 -2
ASGNI4
line 1961
;1961:		}
line 1962
;1962:	} else {
ADDRGP4 $1229
JUMPV
LABELV $1228
line 1963
;1963:		UI_DrawMapPreview(rect, scale, color, net);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 1964
;1964:	}
LABELV $1229
line 1965
;1965:}
LABELV $1214
endproc UI_DrawMapCinematic 28 24
data
align 4
LABELV updateModel
byte 4 1
align 4
LABELV q3Model
byte 4 0
bss
align 4
LABELV $1253
skip 1904
code
proc UI_DrawPlayerModel 612 28
line 1973
;1966:
;1967:
;1968:
;1969:static qboolean updateModel = qtrue;
;1970:static qboolean q3Model = qfalse;
;1971:void UI_DrawHead( float x, float y, float w, float h, playerInfo_t *pi, int time );
;1972:extern vmCvar_t ui_s_e_mouth;
;1973:static void UI_DrawPlayerModel(rectDef_t *rect) {
line 1981
;1974:  static playerInfo_t info;
;1975:  char model[MAX_QPATH];
;1976:  char team[256];
;1977:	char head[256];
;1978:	vec3_t	viewangles;
;1979:	vec3_t	moveangles;
;1980: 
;1981:	strcpy(model, UI_Cvar_VariableString("model"));
ADDRGP4 $1254
ARGP4
ADDRLP4 600
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 600
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1982
;1982:	strcpy(head, UI_Cvar_VariableString("headmodel"));
ADDRGP4 $1255
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1983
;1983: 	q3Model = qtrue;
ADDRGP4 q3Model
CNSTI4 1
ASGNI4
line 1984
;1984:	updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 1985
;1985: 	team[0] = '\0';
ADDRLP4 76
CNSTI1 0
ASGNI1
line 1987
;1986: 
;1987:  if (updateModel) 
ADDRGP4 updateModel
INDIRI4
CNSTI4 0
EQI4 $1256
line 1988
;1988:  {
line 1989
;1989:  	memset( &info, 0, sizeof(playerInfo_t) );
ADDRGP4 $1253
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1904
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1990
;1990:  	viewangles[YAW]   = 180 - 10  ;
ADDRLP4 0+4
CNSTF4 1126825984
ASGNF4
line 1991
;1991:  	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1992
;1992:  	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1993
;1993:  	VectorClear( moveangles );
ADDRLP4 608
CNSTF4 0
ASGNF4
ADDRLP4 588+8
ADDRLP4 608
INDIRF4
ASGNF4
ADDRLP4 588+4
ADDRLP4 608
INDIRF4
ASGNF4
ADDRLP4 588
ADDRLP4 608
INDIRF4
ASGNF4
line 1997
;1994:
;1995://
;1996://	UI_RegisterClientStyleModels( &info, ui_s_e_mouth.string,ui_s_e_eyes.string,ui_s_e_head.string );
;1997:    UI_PlayerInfo_SetInfo( &info, LEGS_IDLE, TORSO_STAND_RIFLE, viewangles, vec3_origin, WP_M4, qfalse );
ADDRGP4 $1253
ARGP4
CNSTI4 43
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 1998
;1998:	UI_RegisterClientModelname( &info, model, head, team);
ADDRGP4 $1253
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 1999
;1999:    updateModel = qfalse;
ADDRGP4 updateModel
CNSTI4 0
ASGNI4
line 2000
;2000:  }
LABELV $1256
line 2003
;2001:
;2002:
;2003:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2);
ADDRLP4 608
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 608
INDIRP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $1253
ARGP4
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 2005
;2004:
;2005:}
LABELV $1252
endproc UI_DrawPlayerModel 612 28
bss
align 4
LABELV $1264
skip 1904
code
proc UI_DrawPlayerModelForTeam 612 28
line 2051
;2006:void UI_DrawPlayerHead( float x, float y, float w, float h, playerInfo_t *pi, int time, int team );
;2007://qboolean UI_RegisterClientStyleModels( playerInfo_t *pi, const char *mouthName, const char *eyesName, const char *headName );
;2008:
;2009:/*static void UI_DrawPlayerModel2(rectDef_t *rect) {
;2010:  static playerInfo_t info;
;2011:  char model[MAX_QPATH];
;2012:  char team[256];
;2013:	char head[256];
;2014:	vec3_t	viewangles;
;2015:	vec3_t	moveangles;
;2016: 
;2017:	strcpy(model, UI_Cvar_VariableString("model"));
;2018:	strcpy(head, UI_Cvar_VariableString("headmodel"));
;2019: 	q3Model = qtrue;
;2020:	updateModel = qtrue;
;2021: 	team[0] = '\0';
;2022: 
;2023:  if (updateModel) 
;2024:  {
;2025:  	memset( &info, 0, sizeof(playerInfo_t) );
;2026:  	viewangles[YAW]   = 180 - 10  ;
;2027:  	viewangles[PITCH] = 0;
;2028:  	viewangles[ROLL]  = 0;
;2029:  	VectorClear( moveangles );
;2030:
;2031:	Com_sprintf(model,sizeof(model),"%s/%s",ui_s_model.string,ui_s_skin.string );
;2032:    	UI_RegisterClientModelname( &info, model, head, team);
;2033:
;2034:	UI_PlayerInfo_SetModel( &info, model , "fixme" , team);
;2035:
;2036:	//
;2037:	
;2038:    UI_PlayerInfo_SetInfo( &info, LEGS_IDLE, TORSO_STAND_RIFLE, viewangles, vec3_origin, WP_M4, qfalse );
;2039:    updateModel = qfalse;
;2040:
;2041:	UI_RegisterClientStyleModels( &info, ui_s_e_mouth.string,"goggles",ui_s_e_head.string );
;2042:
;2043:  }
;2044:
;2045:  UI_DrawPlayerHead( rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2);
;2046:
;2047:}
;2048:*/
;2049:
;2050:qboolean UI_RegisterClientStyleModels( playerInfo_t *pi, const char *mouthName, const char *eyesName, const char *headName );
;2051:static void UI_DrawPlayerModelForTeam(rectDef_t *rect, int numteam) {
line 2059
;2052:  static playerInfo_t info;
;2053:  char model[MAX_QPATH];
;2054:  char team[256];
;2055:	char head[256];
;2056:	vec3_t	viewangles;
;2057:	vec3_t	moveangles;
;2058: 
;2059:	strcpy(model, UI_Cvar_VariableString("model"));
ADDRGP4 $1254
ARGP4
ADDRLP4 600
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 600
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2060
;2060:	strcpy(head, UI_Cvar_VariableString("headmodel"));
ADDRGP4 $1255
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2061
;2061: 	q3Model = qtrue;
ADDRGP4 q3Model
CNSTI4 1
ASGNI4
line 2062
;2062:	updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 2063
;2063: 	team[0] = '\0';
ADDRLP4 64
CNSTI1 0
ASGNI1
line 2065
;2064: 
;2065:  if (updateModel) 
ADDRGP4 updateModel
INDIRI4
CNSTI4 0
EQI4 $1265
line 2066
;2066:  {
line 2067
;2067:  	memset( &info, 0, sizeof(playerInfo_t) );
ADDRGP4 $1264
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1904
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2068
;2068:  	viewangles[YAW]   = 180 - 10  ;
ADDRLP4 320+4
CNSTF4 1126825984
ASGNF4
line 2069
;2069:  	viewangles[PITCH] = 0;
ADDRLP4 320
CNSTF4 0
ASGNF4
line 2070
;2070:  	viewangles[ROLL]  = 0;
ADDRLP4 320+8
CNSTF4 0
ASGNF4
line 2071
;2071:  	VectorClear( moveangles );
ADDRLP4 608
CNSTF4 0
ASGNF4
ADDRLP4 588+8
ADDRLP4 608
INDIRF4
ASGNF4
ADDRLP4 588+4
ADDRLP4 608
INDIRF4
ASGNF4
ADDRLP4 588
ADDRLP4 608
INDIRF4
ASGNF4
line 2074
;2072:
;2073:
;2074:	if ( numteam == TEAM_RED )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $1271
line 2075
;2075:	{
line 2076
;2076:		Com_sprintf(model,sizeof(model),"%s/%s",ui_s_model.string,ui_s_skin.string );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $1273
ARGP4
ADDRGP4 ui_s_model+16
ARGP4
ADDRGP4 ui_s_skin+16
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2077
;2077:		UI_RegisterClientModelname( &info, model, head, team);
ADDRGP4 $1264
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 2080
;2078:
;2079:		//
;2080:		UI_PlayerInfo_SetInfo( &info, LEGS_IDLE, TORSO_STAND_RIFLE, viewangles, vec3_origin, WP_M4, qfalse );
ADDRGP4 $1264
ARGP4
CNSTI4 43
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 320
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 2081
;2081:		UI_PlayerInfo_SetModel( &info, model , "fixme" , team);
ADDRGP4 $1264
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 $1276
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 2083
;2082:
;2083:		UI_RegisterClientModelname( &info, model, head, team);
ADDRGP4 $1264
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 2085
;2084:
;2085:		UI_RegisterClientStyleModels( &info, ui_s_e_mouth.string,ui_s_e_eyes.string,ui_s_e_head.string );
ADDRGP4 $1264
ARGP4
ADDRGP4 ui_s_e_mouth+16
ARGP4
ADDRGP4 ui_s_e_eyes+16
ARGP4
ADDRGP4 ui_s_e_head+16
ARGP4
ADDRGP4 UI_RegisterClientStyleModels
CALLI4
pop
line 2086
;2086:	}
ADDRGP4 $1272
JUMPV
LABELV $1271
line 2087
;2087:	else if ( numteam == TEAM_BLUE )
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $1263
line 2088
;2088:	{
line 2089
;2089:		Com_sprintf(model,sizeof(model),"%s/%s",ui_t_model.string,ui_t_skin.string );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $1273
ARGP4
ADDRGP4 ui_t_model+16
ARGP4
ADDRGP4 ui_t_skin+16
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2090
;2090:		UI_RegisterClientModelname( &info, model, head, team);
ADDRGP4 $1264
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 2092
;2091:
;2092:		UI_PlayerInfo_SetInfo( &info, LEGS_IDLE, TORSO_STAND_RIFLE, viewangles, vec3_origin, WP_M4, qfalse );
ADDRGP4 $1264
ARGP4
CNSTI4 43
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 320
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 2093
;2093:		UI_PlayerInfo_SetModel( &info, model , "fixme" , team);
ADDRGP4 $1264
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 $1276
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 2096
;2094:
;2095:		//
;2096:		UI_RegisterClientStyleModels( &info, ui_t_e_mouth.string,ui_t_e_eyes.string,ui_t_e_head.string );
ADDRGP4 $1264
ARGP4
ADDRGP4 ui_t_e_mouth+16
ARGP4
ADDRGP4 ui_t_e_eyes+16
ARGP4
ADDRGP4 ui_t_e_head+16
ARGP4
ADDRGP4 UI_RegisterClientStyleModels
CALLI4
pop
line 2097
;2097:	}
line 2099
;2098:	else
;2099:		return;
LABELV $1281
LABELV $1272
line 2102
;2100:
;2101:
;2102:    updateModel = qfalse;
ADDRGP4 updateModel
CNSTI4 0
ASGNI4
line 2103
;2103:  }
LABELV $1265
line 2105
;2104:
;2105:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2);
ADDRLP4 608
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 608
INDIRP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $1264
ARGP4
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 2107
;2106:
;2107:}
LABELV $1263
endproc UI_DrawPlayerModelForTeam 612 28
bss
align 4
LABELV $1289
skip 1904
code
proc UI_DrawHeadModel 612 28
line 2111
;2108:
;2109:void UI_DrawPlayerHead( float x, float y, float w, float h, playerInfo_t *pi, int time, int team );
;2110:static void UI_DrawHeadModel(rectDef_t *rect, int numteam ) 
;2111:{
line 2119
;2112:	static playerInfo_t info;
;2113:	char model[MAX_QPATH];
;2114:	char team[256];
;2115:	char head[256];
;2116:	vec3_t	viewangles;
;2117:	vec3_t	moveangles;
;2118:
;2119:	strcpy(model, UI_Cvar_VariableString("model"));
ADDRGP4 $1254
ARGP4
ADDRLP4 600
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 600
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2120
;2120:	strcpy(head, UI_Cvar_VariableString("headmodel"));
ADDRGP4 $1255
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 344
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2121
;2121:	q3Model = qtrue;
ADDRGP4 q3Model
CNSTI4 1
ASGNI4
line 2122
;2122:	updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 2123
;2123:	team[0] = '\0';
ADDRLP4 76
CNSTI1 0
ASGNI1
line 2126
;2124: 
;2125:#if 1
;2126:	if (updateModel) 
ADDRGP4 updateModel
INDIRI4
CNSTI4 0
EQI4 $1290
line 2127
;2127:	{
line 2128
;2128:		memset( &info, 0, sizeof(playerInfo_t) );
ADDRGP4 $1289
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1904
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2129
;2129:		viewangles[YAW]   = 180 - 10  ;
ADDRLP4 64+4
CNSTF4 1126825984
ASGNF4
line 2130
;2130:		viewangles[PITCH] = 0;
ADDRLP4 64
CNSTF4 0
ASGNF4
line 2131
;2131:		viewangles[ROLL]  = 0;
ADDRLP4 64+8
CNSTF4 0
ASGNF4
line 2132
;2132:		VectorClear( moveangles );
ADDRLP4 608
CNSTF4 0
ASGNF4
ADDRLP4 332+8
ADDRLP4 608
INDIRF4
ASGNF4
ADDRLP4 332+4
ADDRLP4 608
INDIRF4
ASGNF4
ADDRLP4 332
ADDRLP4 608
INDIRF4
ASGNF4
line 2134
;2133:
;2134:		if ( numteam == TEAM_RED )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $1296
line 2135
;2135:		{
line 2136
;2136:			Com_sprintf(model,sizeof(model),"%s/%s",ui_s_model.string,ui_s_skin.string );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $1273
ARGP4
ADDRGP4 ui_s_model+16
ARGP4
ADDRGP4 ui_s_skin+16
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2139
;2137:   			//UI_RegisterClientModelname( &info, model, head, team);
;2138:
;2139:			UI_PlayerInfo_SetModel( &info, model , head , team);
ADDRGP4 $1289
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 344
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 2142
;2140:
;2141:			//			
;2142:			UI_PlayerInfo_SetInfo( &info, LEGS_IDLE, TORSO_STAND_RIFLE, viewangles, vec3_origin, WP_M4, qfalse );
ADDRGP4 $1289
ARGP4
CNSTI4 43
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 64
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 2143
;2143:			updateModel = qfalse;
ADDRGP4 updateModel
CNSTI4 0
ASGNI4
line 2145
;2144:
;2145:			UI_RegisterClientStyleModels( &info, ui_s_e_mouth.string,ui_s_e_eyes.string,ui_s_e_head.string );
ADDRGP4 $1289
ARGP4
ADDRGP4 ui_s_e_mouth+16
ARGP4
ADDRGP4 ui_s_e_eyes+16
ARGP4
ADDRGP4 ui_s_e_head+16
ARGP4
ADDRGP4 UI_RegisterClientStyleModels
CALLI4
pop
line 2146
;2146:		}
ADDRGP4 $1297
JUMPV
LABELV $1296
line 2147
;2147:		else if ( numteam == TEAM_BLUE )
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $1303
line 2148
;2148:		{
line 2149
;2149:			Com_sprintf(model,sizeof(model),"%s/%s",ui_t_model.string,ui_t_skin.string );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $1273
ARGP4
ADDRGP4 ui_t_model+16
ARGP4
ADDRGP4 ui_t_skin+16
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2150
;2150:   			UI_RegisterClientModelname( &info, model, head, team);
ADDRGP4 $1289
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 344
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 2152
;2151:
;2152:			UI_PlayerInfo_SetModel( &info, model , "fixme" , team);
ADDRGP4 $1289
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 $1276
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 2155
;2153:
;2154:			//			
;2155:			UI_PlayerInfo_SetInfo( &info, LEGS_IDLE, TORSO_STAND_RIFLE, viewangles, vec3_origin, WP_M4, qfalse );
ADDRGP4 $1289
ARGP4
CNSTI4 43
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 64
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 2156
;2156:			updateModel = qfalse;
ADDRGP4 updateModel
CNSTI4 0
ASGNI4
line 2158
;2157:
;2158:			UI_RegisterClientStyleModels( &info, ui_t_e_mouth.string,ui_t_e_eyes.string,ui_t_e_head.string );
ADDRGP4 $1289
ARGP4
ADDRGP4 ui_t_e_mouth+16
ARGP4
ADDRGP4 ui_t_e_eyes+16
ARGP4
ADDRGP4 ui_t_e_head+16
ARGP4
ADDRGP4 UI_RegisterClientStyleModels
CALLI4
pop
line 2159
;2159:		}
LABELV $1303
LABELV $1297
line 2160
;2160:	}
LABELV $1290
line 2162
;2161:
;2162:	UI_DrawPlayerHead( rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2, numteam);
ADDRLP4 608
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 608
INDIRP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $1289
ARGP4
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawPlayerHead
CALLV
pop
line 2164
;2163:#endif
;2164:}
LABELV $1288
endproc UI_DrawHeadModel 612 28
proc UI_DrawNetSource 8 32
line 2166
;2165:
;2166:static void UI_DrawNetSource(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2167
;2167:	if (ui_netSource.integer < 0 || ui_netSource.integer > numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1316
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LEI4 $1312
LABELV $1316
line 2168
;2168:		ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 2169
;2169:	}
LABELV $1312
line 2170
;2170:  Text_Paint(rect->x, rect->y, scale, color, va("Source: %s", netSources[ui_netSource.integer]), 0, 0, textStyle);
ADDRGP4 $1318
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netSources
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2171
;2171:}
LABELV $1311
endproc UI_DrawNetSource 8 32
proc UI_DrawNetMapPreview 8 20
line 2173
;2172:
;2173:static void UI_DrawNetMapPreview(rectDef_t *rect, float scale, vec4_t color) {
line 2175
;2174:
;2175:	if (uiInfo.serverStatus.currentServerPreview > 0) {
ADDRGP4 uiInfo+99836+9340
INDIRI4
CNSTI4 0
LEI4 $1321
line 2176
;2176:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.serverStatus.currentServerPreview);
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
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+99836+9340
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2177
;2177:	} else {
ADDRGP4 $1322
JUMPV
LABELV $1321
line 2178
;2178:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $1198
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2179
;2179:	}
LABELV $1322
line 2180
;2180:}
LABELV $1320
endproc UI_DrawNetMapPreview 8 20
proc UI_DrawNetMapCinematic 4 20
line 2182
;2181:
;2182:static void UI_DrawNetMapCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 2183
;2183:	if (ui_currentNetMap.integer < 0 || ui_currentNetMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $1333
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LEI4 $1328
LABELV $1333
line 2184
;2184:		ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 2185
;2185:		trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $237
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2186
;2186:	}
LABELV $1328
line 2188
;2187:
;2188:	if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99836+9344
INDIRI4
CNSTI4 0
LTI4 $1335
line 2189
;2189:	  trap_CIN_RunCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99836+9344
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 2190
;2190:	  trap_CIN_SetExtents(uiInfo.serverStatus.currentServerCinematic, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+99836+9344
INDIRI4
ARGI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 2191
;2191: 	  trap_CIN_DrawCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99836+9344
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 2192
;2192:	} else {
ADDRGP4 $1336
JUMPV
LABELV $1335
line 2193
;2193:		UI_DrawNetMapPreview(rect, scale, color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 2194
;2194:	}
LABELV $1336
line 2195
;2195:}
LABELV $1327
endproc UI_DrawNetMapCinematic 4 20
proc UI_DrawNetFilter 8 32
line 2199
;2196:
;2197:
;2198:
;2199:static void UI_DrawNetFilter(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2200
;2200:	if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1350
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1346
LABELV $1350
line 2201
;2201:		ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 2202
;2202:	}
LABELV $1346
line 2203
;2203:  Text_Paint(rect->x, rect->y, scale, color, va("Filter: %s", serverFilters[ui_serverFilterType.integer].description), 0, 0, textStyle);
ADDRGP4 $1352
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2204
;2204:}
LABELV $1345
endproc UI_DrawNetFilter 8 32
proc UI_DrawTier 20 32
line 2207
;2205:
;2206:
;2207:static void UI_DrawTier(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2209
;2208:  int i;
;2209:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $235
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 2210
;2210:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1358
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95568
INDIRI4
LTI4 $1355
LABELV $1358
line 2211
;2211:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2212
;2212:  }
LABELV $1355
line 2213
;2213:  Text_Paint(rect->x, rect->y, scale, color, va("Tier: %s", uiInfo.tierList[i].tierName),0, 0, textStyle);
ADDRGP4 $1359
ARGP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95572
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2214
;2214:}
LABELV $1354
endproc UI_DrawTier 20 32
proc UI_DrawTierMap 28 20
line 2216
;2215:
;2216:static void UI_DrawTierMap(rectDef_t *rect, int index) {
line 2218
;2217:  int i;
;2218:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $235
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 2219
;2219:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1365
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95568
INDIRI4
LTI4 $1362
LABELV $1365
line 2220
;2220:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2221
;2221:  }
LABELV $1362
line 2223
;2222:
;2223:	if (uiInfo.tierList[i].mapHandles[index] == -1) {
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95572+28
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1366
line 2224
;2224:		uiInfo.tierList[i].mapHandles[index] = trap_R_RegisterShaderNoMip(va("levelshots/%s", uiInfo.tierList[i].maps[index]));
ADDRGP4 $1372
ARGP4
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+95572+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+95572+28
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 2225
;2225:	}
LABELV $1366
line 2227
;2226:												 
;2227:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.tierList[i].mapHandles[index]);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95572+28
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2228
;2228:}
LABELV $1361
endproc UI_DrawTierMap 28 20
proc UI_EnglishMapName 8 8
line 2230
;2229:
;2230:static const char *UI_EnglishMapName(const char *map) {
line 2232
;2231:	int i;
;2232:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1381
JUMPV
LABELV $1378
line 2233
;2233:		if (Q_stricmp(map, uiInfo.mapList[i].mapLoadName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
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
NEI4 $1383
line 2234
;2234:			return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768
ADDP4
INDIRP4
RETP4
ADDRGP4 $1377
JUMPV
LABELV $1383
line 2236
;2235:		}
;2236:	}
LABELV $1379
line 2232
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1381
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LTI4 $1378
line 2237
;2237:	return "";
ADDRGP4 $119
RETP4
LABELV $1377
endproc UI_EnglishMapName 8 8
proc UI_DrawTierMapName 32 32
line 2240
;2238:}
;2239:
;2240:static void UI_DrawTierMapName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2242
;2241:  int i, j;
;2242:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $235
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 2243
;2243:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1392
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95568
INDIRI4
LTI4 $1389
LABELV $1392
line 2244
;2244:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2245
;2245:  }
LABELV $1389
line 2246
;2246:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $236
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 2247
;2247:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1395
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1393
LABELV $1395
line 2248
;2248:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2249
;2249:	}
LABELV $1393
line 2251
;2250:
;2251:  Text_Paint(rect->x, rect->y, scale, color, UI_EnglishMapName(uiInfo.tierList[i].maps[j]), 0, 0, textStyle);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95572+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_EnglishMapName
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2252
;2252:}
LABELV $1388
endproc UI_DrawTierMapName 32 32
proc UI_DrawTierGameType 28 32
line 2254
;2253:
;2254:static void UI_DrawTierGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2256
;2255:  int i, j;
;2256:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $235
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 2257
;2257:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1402
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95568
INDIRI4
LTI4 $1399
LABELV $1402
line 2258
;2258:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2259
;2259:  }
LABELV $1399
line 2260
;2260:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $236
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 2261
;2261:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1405
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1403
LABELV $1405
line 2262
;2262:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2263
;2263:	}
LABELV $1403
line 2265
;2264:
;2265:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[uiInfo.tierList[i].gameTypes[j]].gameType , 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+95572+16
ADDP4
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2266
;2266:}
LABELV $1398
endproc UI_DrawTierGameType 28 32
proc UI_AIFromName 8 8
line 2274
;2267:
;2268:
;2269:/*static const char *UI_OpponentLeaderName() {
;2270:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;2271:	return uiInfo.teamList[i].teamMembers[0];
;2272:}*/
;2273:
;2274:static const char *UI_AIFromName(const char *name) {
line 2276
;2275:	int j;
;2276:	for (j = 0; j < uiInfo.aliasCount; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1413
JUMPV
LABELV $1410
line 2277
;2277:		if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0) {
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+74528
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
NEI4 $1415
line 2278
;2278:			return uiInfo.aliasList[j].ai;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+74528+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1409
JUMPV
LABELV $1415
line 2280
;2279:		}
;2280:	}
LABELV $1411
line 2276
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1413
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+74524
INDIRI4
LTI4 $1410
line 2281
;2281:	return "James";
ADDRGP4 $1420
RETP4
LABELV $1409
endproc UI_AIFromName 8 8
data
align 4
LABELV updateOpponentModel
byte 4 1
bss
align 4
LABELV $1422
skip 1904
code
proc UI_DrawOpponent 420 28
line 2328
;2282:}
;2283:
;2284:/*static const int UI_AIIndex(const char *name) {
;2285:	int j;
;2286:	for (j = 0; j < uiInfo.characterCount; j++) {
;2287:		if (Q_stricmp(name, uiInfo.characterList[j].name) == 0) {
;2288:			return j;
;2289:		}
;2290:	}
;2291:	return 0;
;2292:}
;2293:*/
;2294:/*static const int UI_AIIndexFromName(const char *name) {
;2295:	int j;
;2296:	for (j = 0; j < uiInfo.aliasCount; j++) {
;2297:		if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0) {
;2298:			return UI_AIIndex(uiInfo.aliasList[j].ai);
;2299:		}
;2300:	}
;2301:	return 0;
;2302:}
;2303:
;2304:*/
;2305:
;2306:/*static const char *UI_OpponentLeaderHead() {
;2307:	const char *leader = UI_OpponentLeaderName();
;2308:	return UI_AIFromName(leader);
;2309:}
;2310:*/
;2311:/*static const char *UI_OpponentLeaderModel() {
;2312:	int i;
;2313:	const char *head = UI_OpponentLeaderHead();
;2314:	for (i = 0; i < uiInfo.characterCount; i++) {
;2315:		if (Q_stricmp(head, uiInfo.characterList[i].name) == 0) {
;2316:			if (uiInfo.characterList[i].female) {
;2317:				return "Janet";
;2318:			} else {
;2319:				return "James";
;2320:			}
;2321:		}
;2322:	}
;2323:	return "James";
;2324:}
;2325:
;2326:*/
;2327:static qboolean updateOpponentModel = qtrue;
;2328:static void UI_DrawOpponent(rectDef_t *rect) {
line 2336
;2329:  static playerInfo_t info2;
;2330:  char model[MAX_QPATH];
;2331:  char headmodel[MAX_QPATH];
;2332:  char team[256];
;2333:	vec3_t	viewangles;
;2334:	vec3_t	moveangles;
;2335:  
;2336:	if (updateOpponentModel) {
ADDRGP4 updateOpponentModel
INDIRI4
CNSTI4 0
EQI4 $1423
line 2338
;2337:		
;2338:		strcpy(model, UI_Cvar_VariableString("ui_opponentModel"));
ADDRGP4 $1425
ARGP4
ADDRLP4 408
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2339
;2339:	  strcpy(headmodel, UI_Cvar_VariableString("ui_opponentModel"));
ADDRGP4 $1425
ARGP4
ADDRLP4 412
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2340
;2340:		team[0] = '\0';
ADDRLP4 152
CNSTI1 0
ASGNI1
line 2342
;2341:
;2342:  	memset( &info2, 0, sizeof(playerInfo_t) );
ADDRGP4 $1422
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1904
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2343
;2343:  	viewangles[YAW]   = 180 - 10;
ADDRLP4 0+4
CNSTF4 1126825984
ASGNF4
line 2344
;2344:  	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2345
;2345:  	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2346
;2346:  	VectorClear( moveangles );
ADDRLP4 416
CNSTF4 0
ASGNF4
ADDRLP4 140+8
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 140
ADDRLP4 416
INDIRF4
ASGNF4
line 2347
;2347:    UI_PlayerInfo_SetModel( &info2, model, headmodel, "");
ADDRGP4 $1422
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 2348
;2348:    UI_PlayerInfo_SetInfo( &info2, LEGS_IDLE, TORSO_STAND_RIFLE, viewangles, vec3_origin, WP_M4, qfalse );
ADDRGP4 $1422
ARGP4
CNSTI4 43
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 2349
;2349:		UI_RegisterClientModelname( &info2, model, headmodel, team);
ADDRGP4 $1422
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 2350
;2350:    updateOpponentModel = qfalse;
ADDRGP4 updateOpponentModel
CNSTI4 0
ASGNI4
line 2351
;2351:  }
LABELV $1423
line 2353
;2352:
;2353:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info2, uiInfo.uiDC.realTime / 2);
ADDRLP4 408
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 408
INDIRP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $1422
ARGP4
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 2355
;2354:
;2355:}
LABELV $1421
endproc UI_DrawOpponent 420 28
proc UI_NextOpponent 24 8
line 2357
;2356:
;2357:static void UI_NextOpponent() {
line 2358
;2358:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $210
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2359
;2359:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 2360
;2360:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2361
;2361:	if (i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
LTI4 $1432
line 2362
;2362:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2363
;2363:	}
LABELV $1432
line 2364
;2364:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1435
line 2365
;2365:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2366
;2366:		if ( i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
LTI4 $1437
line 2367
;2367:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2368
;2368:		}
LABELV $1437
line 2369
;2369:	}
LABELV $1435
line 2370
;2370: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $210
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2371
;2371:}
LABELV $1431
endproc UI_NextOpponent 24 8
proc UI_PriorOpponent 24 8
line 2373
;2372:
;2373:static void UI_PriorOpponent() {
line 2374
;2374:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $210
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2375
;2375:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 2376
;2376:	i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2377
;2377:	if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1442
line 2378
;2378:		i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+75296
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2379
;2379:	}
LABELV $1442
line 2380
;2380:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1445
line 2381
;2381:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2382
;2382:		if ( i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1447
line 2383
;2383:			i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+75296
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2384
;2384:		}
LABELV $1447
line 2385
;2385:	}
LABELV $1445
line 2386
;2386: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $210
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2387
;2387:}
LABELV $1441
endproc UI_PriorOpponent 24 8
proc UI_DrawPlayerLogo 44 20
line 2389
;2388:
;2389:static void	UI_DrawPlayerLogo(rectDef_t *rect, vec3_t color) {
line 2390
;2390:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2392
;2391:
;2392:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1452
line 2393
;2393:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2394
;2394:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $1066
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2395
;2395:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $1071
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2396
;2396:	}
LABELV $1452
line 2398
;2397:
;2398: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2399
;2399:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2400
;2400: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2401
;2401:}
LABELV $1451
endproc UI_DrawPlayerLogo 44 20
proc UI_DrawPlayerLogoMetal 44 20
line 2403
;2402:
;2403:static void	UI_DrawPlayerLogoMetal(rectDef_t *rect, vec3_t color) {
line 2404
;2404:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2405
;2405:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1471
line 2406
;2406:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2407
;2407:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $1066
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2408
;2408:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $1071
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2409
;2409:	}
LABELV $1471
line 2411
;2410:
;2411: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2412
;2412:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2413
;2413: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2414
;2414:}
LABELV $1470
endproc UI_DrawPlayerLogoMetal 44 20
proc UI_DrawPlayerLogoName 44 20
line 2416
;2415:
;2416:static void	UI_DrawPlayerLogoName(rectDef_t *rect, vec3_t color) {
line 2417
;2417:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2418
;2418:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1490
line 2419
;2419:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2420
;2420:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $1066
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2421
;2421:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $1071
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2422
;2422:	}
LABELV $1490
line 2424
;2423:
;2424: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2425
;2425:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+36
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2426
;2426: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2427
;2427:}
LABELV $1489
endproc UI_DrawPlayerLogoName 44 20
proc UI_DrawOpponentLogo 44 20
line 2429
;2428:
;2429:static void	UI_DrawOpponentLogo(rectDef_t *rect, vec3_t color) {
line 2430
;2430:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $210
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2431
;2431:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1509
line 2432
;2432:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2433
;2433:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $1066
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2434
;2434:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $1071
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2435
;2435:	}
LABELV $1509
line 2437
;2436:
;2437: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2438
;2438:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2439
;2439: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2440
;2440:}
LABELV $1508
endproc UI_DrawOpponentLogo 44 20
proc UI_DrawOpponentLogoMetal 44 20
line 2442
;2441:
;2442:static void	UI_DrawOpponentLogoMetal(rectDef_t *rect, vec3_t color) {
line 2443
;2443:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $210
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2444
;2444:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1528
line 2445
;2445:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2446
;2446:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $1066
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2447
;2447:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $1071
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2448
;2448:	}
LABELV $1528
line 2450
;2449:
;2450: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2451
;2451:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2452
;2452: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2453
;2453:}
LABELV $1527
endproc UI_DrawOpponentLogoMetal 44 20
proc UI_DrawOpponentLogoName 44 20
line 2455
;2454:
;2455:static void	UI_DrawOpponentLogoName(rectDef_t *rect, vec3_t color) {
line 2456
;2456:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $210
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2457
;2457:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1547
line 2458
;2458:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75300+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2459
;2459:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $1066
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75300+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2460
;2460:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $1071
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75300+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2461
;2461:	}
LABELV $1547
line 2463
;2462:
;2463: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2464
;2464:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+36
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2465
;2465: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2466
;2466:}
LABELV $1546
endproc UI_DrawOpponentLogoName 44 20
proc UI_DrawAllMapsSelection 16 32
line 2468
;2467:
;2468:static void UI_DrawAllMapsSelection(rectDef_t *rect, float scale, vec4_t color, int textStyle, qboolean net) {
line 2469
;2469:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1569
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1570
JUMPV
LABELV $1569
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1570
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2470
;2470:	if (map >= 0 && map < uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1571
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
GEI4 $1571
line 2471
;2471:	  Text_Paint(rect->x, rect->y, scale, color, uiInfo.mapList[map].mapName, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2472
;2472:	}
LABELV $1571
line 2473
;2473:}
LABELV $1565
endproc UI_DrawAllMapsSelection 16 32
proc UI_DrawOpponentName 8 32
line 2475
;2474:
;2475:static void UI_DrawOpponentName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2476
;2476:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_opponentName"), 0, 0, textStyle);
ADDRGP4 $210
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2477
;2477:}
LABELV $1575
endproc UI_DrawOpponentName 8 32
proc UI_OwnerDrawWidth 132 12
line 2480
;2478:
;2479:
;2480:static int UI_OwnerDrawWidth(int ownerDraw, float scale) {
line 2483
;2481:	int i, h, value;
;2482:	const char *text;
;2483:	const char *s = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2485
;2484:
;2485:  switch (ownerDraw) {
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 234
LTI4 $1647
ADDRLP4 20
INDIRI4
CNSTI4 237
GTI4 $1648
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1649-936
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1649
address $1578
address $1578
address $1578
address $1578
code
LABELV $1647
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 200
LTI4 $1578
ADDRLP4 24
INDIRI4
CNSTI4 209
GTI4 $1651
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1652-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1652
address $1579
address $1578
address $1578
address $1580
address $1578
address $1581
address $1578
address $1584
address $1589
address $1594
code
LABELV $1651
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 220
EQI4 $1618
ADDRLP4 28
INDIRI4
CNSTI4 222
EQI4 $1626
ADDRLP4 28
INDIRI4
CNSTI4 223
EQI4 $1578
ADDRGP4 $1578
JUMPV
LABELV $1648
ADDRLP4 32
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 36
CNSTI4 247
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $1644
ADDRLP4 32
INDIRI4
CNSTI4 250
EQI4 $1639
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $1578
LABELV $1654
ADDRLP4 40
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 300
LTI4 $1578
ADDRLP4 40
INDIRI4
CNSTI4 311
GTI4 $1578
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1655-1200
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1655
address $1599
address $1599
address $1599
address $1599
address $1599
address $1599
address $1609
address $1609
address $1609
address $1609
address $1609
address $1609
code
LABELV $1579
line 2487
;2486:    case UI_HANDICAP:
;2487:			  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $1000
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 2488
;2488:				i = 20 - h / 5;
ADDRLP4 4
CNSTI4 20
ADDRLP4 16
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 2489
;2489:				s = handicapValues[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ASGNP4
line 2490
;2490:      break;
ADDRGP4 $1578
JUMPV
LABELV $1580
line 2492
;2491:    case UI_CLANNAME:
;2492:				s = UI_Cvar_VariableString("ui_teamName");
ADDRGP4 $208
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 2493
;2493:      break;
ADDRGP4 $1578
JUMPV
LABELV $1581
line 2495
;2494:    case UI_GAMETYPE:
;2495:				s = uiInfo.gameTypes[ui_gameType.integer].gameType;
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120
ADDP4
INDIRP4
ASGNP4
line 2496
;2496:      break;
ADDRGP4 $1578
JUMPV
LABELV $1584
line 2498
;2497:    case UI_SKILL:
;2498:				i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $174
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 2499
;2499:				if (i < 1 || i > numSkillLevels) {
ADDRLP4 60
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
LTI4 $1587
ADDRLP4 60
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1585
LABELV $1587
line 2500
;2500:					i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2501
;2501:				}
LABELV $1585
line 2502
;2502:			  s = skillLevels[i-1];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ASGNP4
line 2503
;2503:      break;
ADDRGP4 $1578
JUMPV
LABELV $1589
line 2505
;2504:    case UI_BLUETEAMNAME:
;2505:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_blueTeam"));
ADDRGP4 $1127
ARGP4
ADDRLP4 64
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
line 2506
;2506:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $1578
ADDRLP4 72
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
GEI4 $1578
line 2507
;2507:			    s = va("%s: %s", "Tangos", uiInfo.teamList[i].teamName);
ADDRGP4 $1135
ARGP4
ADDRGP4 $1136
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 2508
;2508:			  }
line 2509
;2509:      break;
ADDRGP4 $1578
JUMPV
LABELV $1594
line 2511
;2510:    case UI_REDTEAMNAME:
;2511:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_redTeam"));
ADDRGP4 $1128
ARGP4
ADDRLP4 76
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 2512
;2512:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 84
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
LTI4 $1578
ADDRLP4 84
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
GEI4 $1578
line 2513
;2513:			    s = va("%s: %s", "Seals", uiInfo.teamList[i].teamName);
ADDRGP4 $1135
ARGP4
ADDRGP4 $1137
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ASGNP4
line 2514
;2514:			  }
line 2515
;2515:      break;
ADDRGP4 $1578
JUMPV
LABELV $1599
line 2522
;2516:    case UI_BLUETEAM1:
;2517:		case UI_BLUETEAM2:
;2518:		case UI_BLUETEAM3:
;2519:		case UI_BLUETEAM4:
;2520:		case UI_BLUETEAM5:
;2521:			case UI_BLUETEAM6:
;2522:			value = trap_Cvar_VariableValue(va("ui_blueteam%i", ownerDraw-UI_BLUETEAM1 + 1));
ADDRGP4 $1143
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 300
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 92
INDIRF4
CVFI4 4
ASGNI4
line 2523
;2523:			if (value <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1600
line 2524
;2524:				text = "Closed";
ADDRLP4 12
ADDRGP4 $1150
ASGNP4
line 2525
;2525:			} else if (value == 1) {
ADDRGP4 $1601
JUMPV
LABELV $1600
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1602
line 2526
;2526:				text = "Human";
ADDRLP4 12
ADDRGP4 $1153
ASGNP4
line 2527
;2527:			} else {
ADDRGP4 $1603
JUMPV
LABELV $1602
line 2528
;2528:				value -= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2529
;2529:				if (value >= uiInfo.aliasCount) {
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+74524
INDIRI4
LTI4 $1604
line 2530
;2530:					value = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2531
;2531:				}
LABELV $1604
line 2532
;2532:				text = uiInfo.aliasList[value].name;
ADDRLP4 12
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+74528
ADDP4
INDIRP4
ASGNP4
line 2533
;2533:			}
LABELV $1603
LABELV $1601
line 2534
;2534:			s = va("%i. %s", ownerDraw-UI_BLUETEAM1 + 1, text);
ADDRGP4 $1608
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 300
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 96
INDIRP4
ASGNP4
line 2535
;2535:      break;
ADDRGP4 $1578
JUMPV
LABELV $1609
line 2542
;2536:    case UI_REDTEAM1:
;2537:		case UI_REDTEAM2:
;2538:		case UI_REDTEAM3:
;2539:		case UI_REDTEAM4:
;2540:		case UI_REDTEAM5:
;2541:		case UI_REDTEAM6:
;2542:			value = trap_Cvar_VariableValue(va("ui_redteam%i", ownerDraw-UI_REDTEAM1 + 1));
ADDRGP4 $1144
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 306
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 104
INDIRF4
CVFI4 4
ASGNI4
line 2543
;2543:			if (value <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1610
line 2544
;2544:				text = "Closed";
ADDRLP4 12
ADDRGP4 $1150
ASGNP4
line 2545
;2545:			} else if (value == 1) {
ADDRGP4 $1611
JUMPV
LABELV $1610
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1612
line 2546
;2546:				text = "Human";
ADDRLP4 12
ADDRGP4 $1153
ASGNP4
line 2547
;2547:			} else {
ADDRGP4 $1613
JUMPV
LABELV $1612
line 2548
;2548:				value -= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2549
;2549:				if (value >= uiInfo.aliasCount) {
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+74524
INDIRI4
LTI4 $1614
line 2550
;2550:					value = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2551
;2551:				}
LABELV $1614
line 2552
;2552:				text = uiInfo.aliasList[value].name;
ADDRLP4 12
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+74528
ADDP4
INDIRP4
ASGNP4
line 2553
;2553:			}
LABELV $1613
LABELV $1611
line 2554
;2554:			s = va("%i. %s", ownerDraw-UI_REDTEAM1 + 1, text);
ADDRGP4 $1608
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 306
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 2555
;2555:      break;
ADDRGP4 $1578
JUMPV
LABELV $1618
line 2557
;2556:		case UI_NETSOURCE:
;2557:			if (ui_netSource.integer < 0 || ui_netSource.integer > numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1623
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LEI4 $1619
LABELV $1623
line 2558
;2558:				ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 2559
;2559:			}
LABELV $1619
line 2560
;2560:			s = va("Source: %s", netSources[ui_netSource.integer]);
ADDRGP4 $1318
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netSources
ADDP4
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 112
INDIRP4
ASGNP4
line 2561
;2561:			break;
ADDRGP4 $1578
JUMPV
LABELV $1626
line 2563
;2562:		case UI_NETFILTER:
;2563:			if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1631
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1627
LABELV $1631
line 2564
;2564:				ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 2565
;2565:			}
LABELV $1627
line 2566
;2566:			s = va("Filter: %s", serverFilters[ui_serverFilterType.integer].description );
ADDRGP4 $1352
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 2567
;2567:			break;
ADDRGP4 $1578
JUMPV
line 2569
;2568:		case UI_TIER:
;2569:			break;
line 2571
;2570:		case UI_TIER_MAPNAME:
;2571:			break;
line 2573
;2572:		case UI_TIER_GAMETYPE:
;2573:			break;
line 2575
;2574:		case UI_ALLMAPS_SELECTION:
;2575:			break;
line 2577
;2576:		case UI_OPPONENT_NAME:
;2577:			break;
LABELV $1639
line 2579
;2578:		case UI_KEYBINDSTATUS:
;2579:			if (Display_KeyBindPending()) {
ADDRLP4 120
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1640
line 2580
;2580:				s = "Waiting for new key... Press ESCAPE to cancel";
ADDRLP4 0
ADDRGP4 $1642
ASGNP4
line 2581
;2581:			} else {
ADDRGP4 $1578
JUMPV
LABELV $1640
line 2582
;2582:				s = "Press ENTER or CLICK to change, Press BACKSPACE to clear";
ADDRLP4 0
ADDRGP4 $1643
ASGNP4
line 2583
;2583:			}
line 2584
;2584:			break;
ADDRGP4 $1578
JUMPV
LABELV $1644
line 2586
;2585:		case UI_SERVERREFRESHDATE:
;2586:			s = UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer));
ADDRGP4 $1645
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 128
INDIRP4
ASGNP4
line 2587
;2587:			break;
line 2589
;2588:    default:
;2589:      break;
LABELV $1578
line 2592
;2590:  }
;2591:
;2592:	if (s) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1657
line 2593
;2593:		return Text_Width(s, scale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
RETI4
ADDRGP4 $1576
JUMPV
LABELV $1657
line 2595
;2594:	}
;2595:	return 0;
CNSTI4 0
RETI4
LABELV $1576
endproc UI_OwnerDrawWidth 132 12
proc UI_DrawBotName 24 32
line 2598
;2596:}
;2597:
;2598:static void UI_DrawBotName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2599
;2599:	int value = uiInfo.botIndex;
ADDRLP4 0
ADDRGP4 uiInfo+73496
INDIRI4
ASGNI4
line 2600
;2600:	int game = trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $1661
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2601
;2601:	const char *text = "";
ADDRLP4 4
ADDRGP4 $119
ASGNP4
line 2602
;2602:	if (game >= GT_TEAM) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1662
line 2603
;2603:		if (value >= uiInfo.characterCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73492
INDIRI4
LTI4 $1664
line 2604
;2604:			value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2605
;2605:		}
LABELV $1664
line 2606
;2606:		text = uiInfo.characterList[value].name;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500
ADDP4
INDIRP4
ASGNP4
line 2607
;2607:	} else {
ADDRGP4 $1663
JUMPV
LABELV $1662
line 2608
;2608:		if (value >= UI_GetNumBots()) {
ADDRLP4 16
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1668
line 2609
;2609:			value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2610
;2610:		}
LABELV $1668
line 2611
;2611:		text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 2612
;2612:	}
LABELV $1663
line 2613
;2613:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2614
;2614:}
LABELV $1659
endproc UI_DrawBotName 24 32
proc UI_DrawBotSkill 4 32
line 2616
;2615:
;2616:static void UI_DrawBotSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2617
;2617:	if (uiInfo.skillIndex >= 0 && uiInfo.skillIndex < numSkillLevels) {
ADDRGP4 uiInfo+96212
INDIRI4
CNSTI4 0
LTI4 $1671
ADDRGP4 uiInfo+96212
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
GEI4 $1671
line 2618
;2618:	  Text_Paint(rect->x, rect->y, scale, color, skillLevels[uiInfo.skillIndex], 0, 0, textStyle);
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+96212
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2619
;2619:	}
LABELV $1671
line 2620
;2620:}
LABELV $1670
endproc UI_DrawBotSkill 4 32
proc UI_DrawRedBlue 8 32
line 2622
;2621:
;2622:static void UI_DrawRedBlue(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2623
;2623:  Text_Paint(rect->x, rect->y, scale, color, (uiInfo.redBlue == 0) ? "Seals" : "Tangos", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+78380
INDIRI4
CNSTI4 0
NEI4 $1679
ADDRLP4 0
ADDRGP4 $1137
ASGNP4
ADDRGP4 $1680
JUMPV
LABELV $1679
ADDRLP4 0
ADDRGP4 $1136
ASGNP4
LABELV $1680
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2624
;2624:}
LABELV $1676
endproc UI_DrawRedBlue 8 32
proc UI_DrawCrosshair 8 20
line 2626
;2625:
;2626:static void UI_DrawCrosshair(rectDef_t *rect, float scale, vec4_t color) {
line 2627
;2627: 	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2628
;2628:	if (uiInfo.currentCrosshair < 0 || uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+118960
INDIRI4
CNSTI4 0
LTI4 $1686
ADDRGP4 uiInfo+118960
INDIRI4
CNSTI4 10
LTI4 $1682
LABELV $1686
line 2629
;2629:		uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+118960
CNSTI4 0
ASGNI4
line 2630
;2630:	}
LABELV $1682
line 2631
;2631:	UI_DrawHandlePic( rect->x, rect->y - rect->h, rect->w, rect->h, uiInfo.uiDC.Assets.crosshairShader[uiInfo.currentCrosshair]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 uiInfo+118960
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+232+61848
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2632
;2632: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2633
;2633:}
LABELV $1681
endproc UI_DrawCrosshair 8 20
proc UI_BuildPlayerList 4176 12
line 2640
;2634:
;2635:/*
;2636:===============
;2637:UI_BuildPlayerList
;2638:===============
;2639:*/
;2640:static void UI_BuildPlayerList() {
line 2645
;2641:	uiClientState_t	cs;
;2642:	int		n, count, team, team2, playerTeamNumber;
;2643:	char	info[MAX_INFO_STRING];
;2644:
;2645:	trap_GetClientState( &cs );
ADDRLP4 1040
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 2646
;2646:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1040+8
INDIRI4
CNSTI4 548
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2647
;2647:	uiInfo.playerNumber = cs.clientNum;
ADDRGP4 uiInfo+78404
ADDRLP4 1040+8
INDIRI4
ASGNI4
line 2648
;2648:	uiInfo.teamLeader = atoi(Info_ValueForKey(info, "tl"));
ADDRLP4 4
ARGP4
ADDRGP4 $1696
ARGP4
ADDRLP4 4128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4128
INDIRP4
ARGP4
ADDRLP4 4132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiInfo+78408
ADDRLP4 4132
INDIRI4
ASGNI4
line 2649
;2649:	team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1697
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 4140
INDIRI4
ASGNI4
line 2650
;2650:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2651
;2651:	count = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $1698
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4148
INDIRI4
ASGNI4
line 2652
;2652:	uiInfo.playerCount = 0;
ADDRGP4 uiInfo+78384
CNSTI4 0
ASGNI4
line 2653
;2653:	uiInfo.myTeamCount = 0;
ADDRGP4 uiInfo+78388
CNSTI4 0
ASGNI4
line 2654
;2654:	playerTeamNumber = 0;
ADDRLP4 4124
CNSTI4 0
ASGNI4
line 2655
;2655:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1704
JUMPV
LABELV $1701
line 2656
;2656:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 548
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2658
;2657:
;2658:		if (info[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1705
line 2659
;2659:			Q_strncpyz( uiInfo.playerNames[uiInfo.playerCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1709
ARGP4
ADDRLP4 4152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+78384
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78412
ADDP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2660
;2660:			Q_CleanStr( uiInfo.playerNames[uiInfo.playerCount] );
ADDRGP4 uiInfo+78384
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78412
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2661
;2661:			uiInfo.playerCount++;
ADDRLP4 4156
ADDRGP4 uiInfo+78384
ASGNP4
ADDRLP4 4156
INDIRP4
ADDRLP4 4156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2662
;2662:			team2 = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1697
ARGP4
ADDRLP4 4160
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 4164
INDIRI4
ASGNI4
line 2663
;2663:			if (team2 == team) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
NEI4 $1713
line 2664
;2664:				Q_strncpyz( uiInfo.teamNames[uiInfo.myTeamCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1709
ARGP4
ADDRLP4 4168
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+78388
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80460
ADDP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2665
;2665:				Q_CleanStr( uiInfo.teamNames[uiInfo.myTeamCount] );
ADDRGP4 uiInfo+78388
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80460
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2666
;2666:				uiInfo.teamClientNums[uiInfo.myTeamCount] = n;
ADDRGP4 uiInfo+78388
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82508
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2667
;2667:				if (uiInfo.playerNumber == n) {
ADDRGP4 uiInfo+78404
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1721
line 2668
;2668:					playerTeamNumber = uiInfo.myTeamCount;
ADDRLP4 4124
ADDRGP4 uiInfo+78388
INDIRI4
ASGNI4
line 2669
;2669:				}
LABELV $1721
line 2670
;2670:				uiInfo.myTeamCount++;
ADDRLP4 4172
ADDRGP4 uiInfo+78388
ASGNP4
ADDRLP4 4172
INDIRP4
ADDRLP4 4172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2671
;2671:			}
LABELV $1713
line 2672
;2672:		}
LABELV $1705
line 2673
;2673:	}
LABELV $1702
line 2655
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1704
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $1701
line 2675
;2674:
;2675:	if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78408
INDIRI4
CNSTI4 0
NEI4 $1726
line 2676
;2676:		trap_Cvar_Set("cg_selectedPlayer", va("%d", playerTeamNumber));
ADDRGP4 $1015
ARGP4
ADDRLP4 4124
INDIRI4
ARGI4
ADDRLP4 4152
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $240
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2677
;2677:	}
LABELV $1726
line 2679
;2678:
;2679:	n = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $240
ARGP4
ADDRLP4 4152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4152
INDIRF4
CVFI4 4
ASGNI4
line 2680
;2680:	if (n < 0 || n > uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1732
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
LEI4 $1729
LABELV $1732
line 2681
;2681:		n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2682
;2682:	}
LABELV $1729
line 2683
;2683:	if (n < uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
GEI4 $1733
line 2684
;2684:		trap_Cvar_Set("cg_selectedPlayerName", uiInfo.teamNames[n]);
ADDRGP4 $241
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80460
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2685
;2685:	}
LABELV $1733
line 2686
;2686:}
LABELV $1691
endproc UI_BuildPlayerList 4176 12
proc UI_DrawSelectedPlayer 16 32
line 2689
;2687:
;2688:
;2689:static void UI_DrawSelectedPlayer(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2690
;2690:	if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+212
INDIRI4
ADDRGP4 uiInfo+78396
INDIRI4
LEI4 $1738
line 2691
;2691:		uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78396
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 2692
;2692:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 2693
;2693:	}
LABELV $1738
line 2694
;2694:  Text_Paint(rect->x, rect->y, scale, color, (uiInfo.teamLeader) ? UI_Cvar_VariableString("cg_selectedPlayerName") : UI_Cvar_VariableString("name") , 0, 0, textStyle);
ADDRGP4 uiInfo+78408
INDIRI4
CNSTI4 0
EQI4 $1747
ADDRGP4 $241
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $1748
JUMPV
LABELV $1747
ADDRGP4 $1745
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $1748
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2695
;2695:}
LABELV $1737
endproc UI_DrawSelectedPlayer 16 32
proc UI_DrawServerRefreshDate 80 32
line 2697
;2696:
;2697:static void UI_DrawServerRefreshDate(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2698
;2698:	if (uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99836+1124
INDIRI4
CNSTI4 0
EQI4 $1750
line 2700
;2699:		vec4_t lowLight, newColor;
;2700:		lowLight[0] = 0.8 * color[0]; 
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2701
;2701:		lowLight[1] = 0.8 * color[1]; 
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2702
;2702:		lowLight[2] = 0.8 * color[2]; 
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2703
;2703:		lowLight[3] = 0.8 * color[3]; 
ADDRLP4 0+12
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 2704
;2704:		LerpColor(color,lowLight,newColor,0.5+0.5*sin(uiInfo.uiDC.realTime / PULSE_DIVISOR));
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
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
line 2705
;2705:	  Text_Paint(rect->x, rect->y, scale, newColor, va("Getting info for %d servers (ESC to cancel)", trap_LAN_GetServerCount(ui_netSource.integer)), 0, 0, textStyle);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 $1758
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2706
;2706:	} else {
ADDRGP4 $1751
JUMPV
LABELV $1750
line 2708
;2707:		char buff[64];
;2708:		Q_strncpyz(buff, UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer)), 64);
ADDRGP4 $1645
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2709
;2709:	  Text_Paint(rect->x, rect->y, scale, color, va("Refresh Time: %s", buff), 0, 0, textStyle);
ADDRGP4 $1761
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2710
;2710:	}
LABELV $1751
line 2711
;2711:}
LABELV $1749
endproc UI_DrawServerRefreshDate 80 32
proc UI_DrawServerMOTD 24 32
line 2713
;2712:
;2713:static void UI_DrawServerMOTD(rectDef_t *rect, float scale, vec4_t color) {
line 2714
;2714:	if (uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99836+9348
INDIRI4
CNSTI4 0
EQI4 $1763
line 2717
;2715:		float maxX;
;2716:	 
;2717:		if (uiInfo.serverStatus.motdWidth == -1) {
ADDRGP4 uiInfo+99836+9352
INDIRI4
CNSTI4 -1
NEI4 $1767
line 2718
;2718:			uiInfo.serverStatus.motdWidth = 0;
ADDRGP4 uiInfo+99836+9352
CNSTI4 0
ASGNI4
line 2719
;2719:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+99836+9356
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 2720
;2720:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99836+9360
CNSTI4 -1
ASGNI4
line 2721
;2721:		}
LABELV $1767
line 2723
;2722:
;2723:		if (uiInfo.serverStatus.motdOffset > uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99836+9364
INDIRI4
ADDRGP4 uiInfo+99836+9348
INDIRI4
LEI4 $1777
line 2724
;2724:			uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+99836+9364
CNSTI4 0
ASGNI4
line 2725
;2725:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+99836+9356
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 2726
;2726:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99836+9360
CNSTI4 -1
ASGNI4
line 2727
;2727:		}
LABELV $1777
line 2729
;2728:
;2729:		if (uiInfo.uiDC.realTime > uiInfo.serverStatus.motdTime) {
ADDRGP4 uiInfo+212
INDIRI4
ADDRGP4 uiInfo+99836+9368
INDIRI4
LEI4 $1789
line 2730
;2730:			uiInfo.serverStatus.motdTime = uiInfo.uiDC.realTime + 10;
ADDRGP4 uiInfo+99836+9368
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2731
;2731:			if (uiInfo.serverStatus.motdPaintX <= rect->x + 2) {
ADDRGP4 uiInfo+99836+9356
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $1797
line 2732
;2732:				if (uiInfo.serverStatus.motdOffset < uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99836+9364
INDIRI4
ADDRGP4 uiInfo+99836+9348
INDIRI4
GEI4 $1801
line 2733
;2733:					uiInfo.serverStatus.motdPaintX += Text_Width(&uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], scale, 1) - 1;
ADDRGP4 uiInfo+99836+9364
INDIRI4
ADDRGP4 uiInfo+99836+9372
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 uiInfo+99836+9356
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 2734
;2734:					uiInfo.serverStatus.motdOffset++;
ADDRLP4 12
ADDRGP4 uiInfo+99836+9364
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2735
;2735:				} else {
ADDRGP4 $1798
JUMPV
LABELV $1801
line 2736
;2736:					uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+99836+9364
CNSTI4 0
ASGNI4
line 2737
;2737:					if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99836+9360
INDIRI4
CNSTI4 0
LTI4 $1817
line 2738
;2738:						uiInfo.serverStatus.motdPaintX = uiInfo.serverStatus.motdPaintX2;
ADDRGP4 uiInfo+99836+9356
ADDRGP4 uiInfo+99836+9360
INDIRI4
ASGNI4
line 2739
;2739:					} else {
ADDRGP4 $1818
JUMPV
LABELV $1817
line 2740
;2740:						uiInfo.serverStatus.motdPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+99836+9356
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 2741
;2741:					}
LABELV $1818
line 2742
;2742:					uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99836+9360
CNSTI4 -1
ASGNI4
line 2743
;2743:				}
line 2744
;2744:			} else {
ADDRGP4 $1798
JUMPV
LABELV $1797
line 2746
;2745:				//serverStatus.motdPaintX--;
;2746:				uiInfo.serverStatus.motdPaintX -= 2;
ADDRLP4 4
ADDRGP4 uiInfo+99836+9356
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2747
;2747:				if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99836+9360
INDIRI4
CNSTI4 0
LTI4 $1831
line 2749
;2748:					//serverStatus.motdPaintX2--;
;2749:					uiInfo.serverStatus.motdPaintX2 -= 2;
ADDRLP4 8
ADDRGP4 uiInfo+99836+9360
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2750
;2750:				}
LABELV $1831
line 2751
;2751:			}
LABELV $1798
line 2752
;2752:		}
LABELV $1789
line 2754
;2753:
;2754:		maxX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2755
;2755:		Text_Paint_Limit(&maxX, uiInfo.serverStatus.motdPaintX, rect->y + rect->h - 3, scale, color, &uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], 0, 0); 
ADDRLP4 0
ARGP4
ADDRGP4 uiInfo+99836+9356
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
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
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+99836+9364
INDIRI4
ADDRGP4 uiInfo+99836+9372
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 2756
;2756:		if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99836+9360
INDIRI4
CNSTI4 0
LTI4 $1843
line 2757
;2757:			float maxX2 = rect->x + rect->w - 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 2758
;2758:			Text_Paint_Limit(&maxX2, uiInfo.serverStatus.motdPaintX2, rect->y + rect->h - 3, scale, color, uiInfo.serverStatus.motd, 0, uiInfo.serverStatus.motdOffset); 
ADDRLP4 12
ARGP4
ADDRGP4 uiInfo+99836+9360
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+99836+9372
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 uiInfo+99836+9364
INDIRI4
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 2759
;2759:		}
LABELV $1843
line 2760
;2760:		if (uiInfo.serverStatus.motdOffset && maxX > 0) {
ADDRGP4 uiInfo+99836+9364
INDIRI4
CNSTI4 0
EQI4 $1853
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1853
line 2762
;2761:			// if we have an offset ( we are skipping the first part of the string ) and we fit the string
;2762:			if (uiInfo.serverStatus.motdPaintX2 == -1) {
ADDRGP4 uiInfo+99836+9360
INDIRI4
CNSTI4 -1
NEI4 $1854
line 2763
;2763:						uiInfo.serverStatus.motdPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+99836+9360
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 2764
;2764:			}
line 2765
;2765:		} else {
ADDRGP4 $1854
JUMPV
LABELV $1853
line 2766
;2766:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99836+9360
CNSTI4 -1
ASGNI4
line 2767
;2767:		}
LABELV $1854
line 2769
;2768:
;2769:	}
LABELV $1763
line 2770
;2770:}
LABELV $1762
endproc UI_DrawServerMOTD 24 32
proc UI_DrawKeyBindStatus 8 32
line 2772
;2771:
;2772:static void UI_DrawKeyBindStatus(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2774
;2773://	int ofs = 0;
;2774:	if (Display_KeyBindPending()) {
ADDRLP4 0
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1866
line 2775
;2775:		Text_Paint(rect->x, rect->y, scale, color, "Choose a key for this command... Press ESCAPE to cancel", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1868
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2776
;2776:	} else {
ADDRGP4 $1867
JUMPV
LABELV $1866
line 2777
;2777:		Text_Paint(rect->x, rect->y, scale, color, "Press ENTER or CLICK to change, Press BACKSPACE to clear", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1643
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2778
;2778:	}
LABELV $1867
line 2779
;2779:}
LABELV $1865
endproc UI_DrawKeyBindStatus 8 32
proc UI_DrawGLInfo 4408 32
line 2781
;2780:
;2781:static void UI_DrawGLInfo(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 2787
;2782:	char * eptr;
;2783:	char buff[4096];
;2784:	const char *lines[64];
;2785:	int y, numLines, i;
;2786:
;2787:	Text_Paint(rect->x + 2, rect->y, scale, color, va("VENDOR: %s", uiInfo.uiDC.glconfig.vendor_string), 0, 30, textStyle);
ADDRGP4 $1870
ARGP4
ADDRGP4 uiInfo+62120+1024
ARGP4
ADDRLP4 4368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4372
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4372
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4368
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2788
;2788:	Text_Paint(rect->x + 2, rect->y + 15, scale, color, va("VERSION: %s: %s", uiInfo.uiDC.glconfig.version_string,uiInfo.uiDC.glconfig.renderer_string), 0, 30, textStyle);
ADDRGP4 $1873
ARGP4
ADDRGP4 uiInfo+62120+2048
ARGP4
ADDRGP4 uiInfo+62120
ARGP4
ADDRLP4 4376
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4380
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4380
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1097859072
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4376
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2789
;2789:	Text_Paint(rect->x + 2, rect->y + 30, scale, color, va ("PIXELFORMAT: color(%d-bits) Z(%d-bits) stencil(%d-bits)", uiInfo.uiDC.glconfig.colorBits, uiInfo.uiDC.glconfig.depthBits, uiInfo.uiDC.glconfig.stencilBits), 0, 30, textStyle);
ADDRGP4 $1877
ARGP4
ADDRGP4 uiInfo+62120+11272
INDIRI4
ARGI4
ADDRGP4 uiInfo+62120+11276
INDIRI4
ARGI4
ADDRGP4 uiInfo+62120+11280
INDIRI4
ARGI4
ADDRLP4 4384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4388
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4388
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4388
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1106247680
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4384
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2792
;2790:
;2791:	// build null terminated extension strings
;2792:	Q_strncpyz(buff, uiInfo.uiDC.glconfig.extensions_string, 4096);
ADDRLP4 272
ARGP4
ADDRGP4 uiInfo+62120+3072
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2793
;2793:	eptr = buff;
ADDRLP4 0
ADDRLP4 272
ASGNP4
line 2794
;2794:	y = rect->y + 45;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1110704128
ADDF4
CVFI4 4
ASGNI4
line 2795
;2795:	numLines = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1887
JUMPV
line 2797
;2796:	while ( y < rect->y + rect->h && *eptr )
;2797:	{
LABELV $1889
line 2799
;2798:		while ( *eptr && *eptr == ' ' )
;2799:			*eptr++ = '\0';
ADDRLP4 4392
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4392
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4392
INDIRP4
CNSTI1 0
ASGNI1
LABELV $1890
line 2798
ADDRLP4 4396
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4396
INDIRI4
CNSTI4 0
EQI4 $1892
ADDRLP4 4396
INDIRI4
CNSTI4 32
EQI4 $1889
LABELV $1892
line 2802
;2800:
;2801:		// track start of valid string
;2802:		if (*eptr && *eptr != ' ') {
ADDRLP4 4400
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4400
INDIRI4
CNSTI4 0
EQI4 $1896
ADDRLP4 4400
INDIRI4
CNSTI4 32
EQI4 $1896
line 2803
;2803:			lines[numLines++] = eptr;
ADDRLP4 4404
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 4404
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2804
;2804:		}
ADDRGP4 $1896
JUMPV
LABELV $1895
line 2807
;2805:
;2806:		while ( *eptr && *eptr != ' ' )
;2807:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1896
line 2806
ADDRLP4 4404
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
EQI4 $1898
ADDRLP4 4404
INDIRI4
CNSTI4 32
NEI4 $1895
LABELV $1898
line 2808
;2808:	}
LABELV $1887
line 2796
ADDRLP4 4392
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 4392
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4392
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
GEF4 $1899
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1890
LABELV $1899
line 2810
;2809:
;2810:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1901
JUMPV
LABELV $1900
line 2811
;2811:	while (i < numLines) {
line 2812
;2812:		Text_Paint(rect->x + 2, y, scale, color, lines[i++], 0, 20, textStyle);
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4396
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 4396
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4396
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2813
;2813:		if (i < numLines) {
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1903
line 2814
;2814:			Text_Paint(rect->x + rect->w / 2, y, scale, color, lines[i++], 0, 20, textStyle);
ADDRLP4 4404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4404
INDIRP4
INDIRF4
ADDRLP4 4404
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4400
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 4400
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4400
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2815
;2815:		}
LABELV $1903
line 2816
;2816:		y += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2817
;2817:		if (y > rect->y + rect->h - 11) {
ADDRLP4 4400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 4400
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4400
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1093664768
SUBF4
LEF4 $1905
line 2818
;2818:			break;
ADDRGP4 $1902
JUMPV
LABELV $1905
line 2820
;2819:		}
;2820:	}
LABELV $1901
line 2811
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $1900
LABELV $1902
line 2823
;2821:
;2822:
;2823:}
LABELV $1869
endproc UI_DrawGLInfo 4408 32
proc UI_CheckWeapon 52 4
line 2826
;2824:
;2825:static qboolean UI_CheckWeapon ( int weapon )
;2826:{
line 2827
;2827:	int acc = trap_Cvar_VariableValue("ui_char_accuracy");
ADDRGP4 $321
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 2828
;2828:	int str = trap_Cvar_VariableValue("ui_char_strength");
ADDRGP4 $322
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 2829
;2829:	int stl = trap_Cvar_VariableValue("ui_char_stealth");
ADDRGP4 $324
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 2830
;2830:	int sta = trap_Cvar_VariableValue("ui_char_stamina");
ADDRGP4 $323
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 2831
;2831:	int tech = trap_Cvar_VariableValue("ui_char_technical");
ADDRGP4 $325
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 2834
;2832:
;2833:	// to avoid compiler warnings
;2834:	stl = stl;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ASGNI4
line 2835
;2835:	sta = sta;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ASGNI4
line 2836
;2836:	tech = tech;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ASGNI4
line 2838
;2837:
;2838:	if ( trap_Cvar_VariableValue("g_gametype") < GT_TEAM )
ADDRGP4 $1661
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1065353216
GEF4 $1908
line 2839
;2839:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
LABELV $1908
line 2842
;2840:
;2841:	// min char requirements for the weapons. and see if our char meets them
;2842:	switch ( weapon )
ADDRLP4 44
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 6
LTI4 $1910
ADDRLP4 44
INDIRI4
CNSTI4 24
GTI4 $1910
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1937-24
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1937
address $1915
address $1915
address $1915
address $1915
address $1916
address $1916
address $1919
address $1915
address $1915
address $1915
address $1915
address $1922
address $1928
address $1915
address $1915
address $1931
address $1912
address $1934
address $1925
code
line 2843
;2843:	{
LABELV $1912
line 2845
;2844:		case WP_M14:
;2845:			if ( str > 5 )
ADDRLP4 12
INDIRI4
CNSTI4 5
LEI4 $1911
line 2846
;2846:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
line 2847
;2847:			break;
LABELV $1915
line 2858
;2848:		case WP_MP5:
;2849:		case WP_M4:
;2850:		case WP_MK23:
;2851:		case WP_P9S:
;2852:		case WP_870:
;2853:		case WP_MAC10:
;2854:		case WP_AK47:
;2855:		case WP_GLOCK:
;2856:		case WP_SW40T:
;2857:		case WP_M590:
;2858:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
line 2859
;2859:			break;
LABELV $1916
line 2862
;2860:		case WP_SW629:
;2861:		case WP_DEAGLE:
;2862:			if ( str > 3 )
ADDRLP4 12
INDIRI4
CNSTI4 3
LEI4 $1911
line 2863
;2863:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
line 2864
;2864:			break;
LABELV $1919
line 2866
;2865:		case WP_PDW:
;2866:			if ( str > 3 && acc > 4 )
ADDRLP4 12
INDIRI4
CNSTI4 3
LEI4 $1911
ADDRLP4 16
INDIRI4
CNSTI4 4
LEI4 $1911
line 2867
;2867:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
line 2868
;2868:			break;
LABELV $1922
line 2870
;2869:		case WP_PSG1:
;2870:			if ( acc > 6 )
ADDRLP4 16
INDIRI4
CNSTI4 6
LEI4 $1911
line 2871
;2871:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
line 2872
;2872:			break;
LABELV $1925
line 2874
;2873:		case WP_SL8SD:
;2874:			if ( acc > 5 && stl > 5 )
ADDRLP4 48
CNSTI4 5
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $1911
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $1911
line 2875
;2875:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
line 2876
;2876:			break;
LABELV $1928
line 2878
;2877:		case WP_MACMILLAN:
;2878:			if ( acc > 8 && str > 4 )
ADDRLP4 16
INDIRI4
CNSTI4 8
LEI4 $1911
ADDRLP4 12
INDIRI4
CNSTI4 4
LEI4 $1911
line 2879
;2879:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
line 2880
;2880:			break;
LABELV $1931
line 2882
;2881:		case WP_SPAS15:
;2882:			if ( str > 4 )
ADDRLP4 12
INDIRI4
CNSTI4 4
LEI4 $1911
line 2883
;2883:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
line 2884
;2884:			break;
LABELV $1934
line 2886
;2885:		case WP_M249:
;2886:			if ( str >= 4 && sta >= 5)
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $1935
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $1935
line 2887
;2887:				return qtrue; 
CNSTI4 1
RETI4
ADDRGP4 $1907
JUMPV
LABELV $1935
line 2888
;2888:	} 
LABELV $1910
LABELV $1911
line 2890
;2889:			
;2890:	return qfalse;
CNSTI4 0
RETI4
LABELV $1907
endproc UI_CheckWeapon 52 4
proc CG_DrawWeaponPrimaryAddon1 120 32
line 2899
;2891:}
;2892:
;2893:static qboolean CG_HandleWeaponPrimaryAddon1( int flags, float *special, int key );
;2894:static qboolean CG_HandleWeaponPrimaryAddon2( int flags, float *special, int key );
;2895:static qboolean CG_HandleWeaponPrimaryAddon3( int flags, float *special, int key );
;2896:static qboolean CG_HandleWeaponSecondaryAddon1( int flags, float *special, int key );
;2897:static qboolean CG_HandleWeaponSecondaryAddon2( int flags, float *special, int key );
;2898:
;2899:static void CG_DrawWeaponPrimaryAddon1( rectDef_t *rect, int special, float scale, vec4_t color, int textStyle ) {
line 2904
;2900: 	int			primary;
;2901:	int			wMods;
;2902:	int			silencer,duckbill;
;2903:	char		var[64];
;2904:	int		xp = 0; 
ADDRLP4 68
CNSTI4 0
ASGNI4
line 2907
;2905:
;2906:
;2907:	trap_Cvar_VariableStringBuffer("inven_duckbill", var , sizeof(var ) );
ADDRGP4 $1940
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2908
;2908:	duckbill = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 84
INDIRI4
ASGNI4
line 2910
;2909:
;2910:	trap_Cvar_VariableStringBuffer("inven_silencer", var , sizeof(var ) );
ADDRGP4 $1941
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2911
;2911:	silencer = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 88
INDIRI4
ASGNI4
line 2915
;2912:
;2913:	// ---
;2914:
;2915:	trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2916
;2916:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 92
INDIRI4
ASGNI4
line 2918
;2917:  
;2918:	wMods = BG_WeaponMods(primary);
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 96
INDIRI4
ASGNI4
line 2920
;2919:
;2920: 	if ( silencer )
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $1943
line 2921
;2921:	{
line 2922
;2922:		char *mode = "Suppressor";
ADDRLP4 100
ADDRGP4 $1945
ASGNP4
line 2924
;2923:
;2924:		if ( primary == WP_M4 || primary == WP_AK47 )
ADDRLP4 64
INDIRI4
CNSTI4 16
EQI4 $1948
ADDRLP4 64
INDIRI4
CNSTI4 15
NEI4 $1946
LABELV $1948
line 2925
;2925:			mode = "Muzzle Hider";
ADDRLP4 100
ADDRGP4 $1949
ASGNP4
LABELV $1946
line 2926
;2926:		xp = trap_Cvar_VariableValue("ui_char_stealth");
ADDRGP4 $324
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 108
INDIRF4
CVFI4 4
ASGNI4
line 2929
;2927:
;2928:
;2929:		if ( !(wMods & ( 1 << WM_SILENCER ) ) )
ADDRLP4 76
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1950
line 2930
;2930:		{			
line 2931
;2931:			CG_HandleWeaponPrimaryAddon1( 0,0,0 );
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon1
CALLI4
pop
line 2932
;2932:		}
ADDRGP4 $1944
JUMPV
LABELV $1950
line 2933
;2933:		else if ( xp < 5 )
ADDRLP4 68
INDIRI4
CNSTI4 5
GEI4 $1952
line 2934
;2934:		{
line 2935
;2935:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, va("%s (stl>=5)",mode) , 0, 30, textStyle);
ADDRGP4 $1954
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
INDIRF4
ARGF4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2936
;2936:		}
ADDRGP4 $1944
JUMPV
LABELV $1952
line 2938
;2937:		else
;2938:			Text_Paint(rect->x, rect->y, scale, color, va("%s",mode), 0, 30, textStyle);
ADDRGP4 $1955
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
INDIRF4
ARGF4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2939
;2939:	}
ADDRGP4 $1944
JUMPV
LABELV $1943
line 2940
;2940:	else if ( duckbill )
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $1956
line 2941
;2941:	{
line 2942
;2942:		xp = trap_Cvar_VariableValue("ui_char_strength");
ADDRGP4 $322
ARGP4
ADDRLP4 100
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 100
INDIRF4
CVFI4 4
ASGNI4
line 2944
;2943:
;2944: 		if ( !(wMods & ( 1 << WM_DUCKBILL ) )  )
ADDRLP4 76
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $1958
line 2945
;2945:		{
line 2946
;2946:			CG_HandleWeaponPrimaryAddon1( 0,0,0 );
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon1
CALLI4
pop
line 2947
;2947:		}
ADDRGP4 $1957
JUMPV
LABELV $1958
line 2948
;2948:		else if ( xp < 5 )
ADDRLP4 68
INDIRI4
CNSTI4 5
GEI4 $1960
line 2949
;2949:		{
line 2950
;2950:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "Duckbill (str>=5)" , 0, 30, textStyle);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
INDIRF4
ARGF4
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $1962
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2951
;2951:		}
ADDRGP4 $1957
JUMPV
LABELV $1960
line 2953
;2952:		else
;2953:			Text_Paint(rect->x, rect->y, scale, color, "Duckbill", 0, 30, textStyle);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
INDIRF4
ARGF4
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $1963
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2954
;2954:	}
ADDRGP4 $1957
JUMPV
LABELV $1956
line 2956
;2955:	else
;2956:	{
line 2957
;2957:		Text_Paint(rect->x, rect->y, scale, color, "No Muzzle add-on", 0, 30, textStyle);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
INDIRF4
ARGF4
ADDRLP4 100
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $1964
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2958
;2958:	} 
LABELV $1957
LABELV $1944
line 2959
;2959:}
LABELV $1939
endproc CG_DrawWeaponPrimaryAddon1 120 32
proc CG_DrawWeaponPrimaryAddon2 124 32
line 2961
;2960:
;2961:static void CG_DrawWeaponPrimaryAddon2( rectDef_t *rect, int special, float scale, vec4_t color, int textStyle ) {
line 2968
;2962: 	int			primary;
;2963:	int			wMods;
;2964:	int			bayonet,gl,flashlight;
;2965:	char		var[64];
;2966:	int			xp;
;2967:
;2968:	trap_Cvar_VariableStringBuffer("inven_grenadelauncher", var , sizeof(var ) );
ADDRGP4 $1966
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2969
;2969:	gl = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 88
INDIRI4
ASGNI4
line 2971
;2970:
;2971:	trap_Cvar_VariableStringBuffer("inven_bayonet", var , sizeof(var ) );
ADDRGP4 $1967
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2972
;2972:	bayonet = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 92
INDIRI4
ASGNI4
line 2974
;2973:
;2974:	trap_Cvar_VariableStringBuffer("inven_flashlight", var , sizeof(var ) );
ADDRGP4 $1968
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2975
;2975:	flashlight = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 96
INDIRI4
ASGNI4
line 2977
;2976:
;2977:  	trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2978
;2978:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 100
INDIRI4
ASGNI4
line 2980
;2979:
;2980:	wMods = BG_WeaponMods(primary);
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 104
INDIRI4
ASGNI4
line 2982
;2981:
;2982: 	if ( gl )
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1969
line 2983
;2983:	{
line 2984
;2984:		int xp2 = trap_Cvar_VariableValue("ui_char_strength");
ADDRGP4 $322
ARGP4
ADDRLP4 112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 112
INDIRF4
CVFI4 4
ASGNI4
line 2985
;2985:		xp = trap_Cvar_VariableValue("ui_char_technical");
ADDRGP4 $325
ARGP4
ADDRLP4 116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 80
ADDRLP4 116
INDIRF4
CVFI4 4
ASGNI4
line 2987
;2986:
;2987:		if ( !(wMods & ( 1 << WM_GRENADELAUNCHER ) ) )
ADDRLP4 72
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $1971
line 2988
;2988:		{			
line 2989
;2989:			CG_HandleWeaponPrimaryAddon2( 0,0,0 );
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 120
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon2
CALLI4
pop
line 2990
;2990:		}
ADDRGP4 $1970
JUMPV
LABELV $1971
line 2991
;2991:		else if ( xp < 5 || xp2 < 3 )
ADDRLP4 80
INDIRI4
CNSTI4 5
LTI4 $1975
ADDRLP4 108
INDIRI4
CNSTI4 3
GEI4 $1973
LABELV $1975
line 2992
;2992:		{
line 2993
;2993:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "GL (tec>=5 str>=3)" , 0, 30, textStyle);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
INDIRF4
ARGF4
ADDRLP4 120
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $1976
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2995
;2994:
;2995:		}
ADDRGP4 $1970
JUMPV
LABELV $1973
line 2997
;2996:		else
;2997:			Text_Paint(rect->x, rect->y, scale, color, "Grenadelauncher", 0, 30, textStyle);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
INDIRF4
ARGF4
ADDRLP4 120
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $1977
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2998
;2998:	}
ADDRGP4 $1970
JUMPV
LABELV $1969
line 2999
;2999:	else if ( bayonet )
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1978
line 3000
;3000:	{
line 3001
;3001:		xp = trap_Cvar_VariableValue("ui_char_strength");
ADDRGP4 $322
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 80
ADDRLP4 108
INDIRF4
CVFI4 4
ASGNI4
line 3003
;3002:
;3003:		if ( !(wMods & ( 1 << WM_BAYONET ) ) )
ADDRLP4 72
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $1980
line 3004
;3004:			CG_HandleWeaponPrimaryAddon2( 0,0,0 );
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon2
CALLI4
pop
ADDRGP4 $1979
JUMPV
LABELV $1980
line 3005
;3005:		else if ( xp < 4 )
ADDRLP4 80
INDIRI4
CNSTI4 4
GEI4 $1982
line 3006
;3006:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "Bayonet (str>=4)" , 0, 30, textStyle);
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
INDIRF4
ARGF4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $1984
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
ADDRGP4 $1979
JUMPV
LABELV $1982
line 3008
;3007:		else
;3008:			Text_Paint(rect->x, rect->y, scale, color, "Bayonet", 0, 30, textStyle);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
INDIRF4
ARGF4
ADDRLP4 120
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $1985
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3009
;3009:	}
ADDRGP4 $1979
JUMPV
LABELV $1978
line 3010
;3010:	else if ( flashlight )
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $1986
line 3011
;3011:	{
line 3012
;3012: 		xp = trap_Cvar_VariableValue("ui_char_technical");
ADDRGP4 $325
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 80
ADDRLP4 108
INDIRF4
CVFI4 4
ASGNI4
line 3014
;3013:
;3014:		if (!(wMods & ( 1 << WM_FLASHLIGHT ) ) )
ADDRLP4 72
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $1988
line 3015
;3015:			CG_HandleWeaponPrimaryAddon2( 0,0,0 );
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon2
CALLI4
pop
ADDRGP4 $1987
JUMPV
LABELV $1988
line 3016
;3016:		else if ( xp < 4 )
ADDRLP4 80
INDIRI4
CNSTI4 4
GEI4 $1990
line 3017
;3017:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "Flashlight (tec>=4)" , 0, 30, textStyle);
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
INDIRF4
ARGF4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $1992
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
ADDRGP4 $1987
JUMPV
LABELV $1990
line 3019
;3018:		else
;3019:			Text_Paint(rect->x, rect->y, scale, color, "Flashlight", 0, 30, textStyle);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
INDIRF4
ARGF4
ADDRLP4 120
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $1993
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3020
;3020:	}
ADDRGP4 $1987
JUMPV
LABELV $1986
line 3022
;3021:	else
;3022:	{
line 3023
;3023:		Text_Paint(rect->x, rect->y, scale, color, "No Underslung add-on", 0, 30, textStyle);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
INDIRF4
ARGF4
ADDRLP4 108
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $1994
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3024
;3024:	} 
LABELV $1987
LABELV $1979
LABELV $1970
line 3025
;3025:}
LABELV $1965
endproc CG_DrawWeaponPrimaryAddon2 124 32
proc CG_DrawWeaponPrimaryAddon3 120 32
line 3027
;3026:
;3027:static void CG_DrawWeaponPrimaryAddon3( rectDef_t *rect, int special, float scale, vec4_t color, int textStyle ) {
line 3034
;3028: 	int			primary;
;3029:	int			wMods;
;3030:	int			laser,scope,nvgscope;
;3031:	char		var[64];
;3032:	int			xp;
;3033:
;3034:	trap_Cvar_VariableStringBuffer("inven_lasersight", var , sizeof(var ) );
ADDRGP4 $1996
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3035
;3035:	laser = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 88
INDIRI4
ASGNI4
line 3037
;3036:
;3037:	trap_Cvar_VariableStringBuffer("inven_scope", var , sizeof(var ) );
ADDRGP4 $1997
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3038
;3038:	scope = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 92
INDIRI4
ASGNI4
line 3040
;3039:
;3040:	trap_Cvar_VariableStringBuffer("inven_nvgscope", var , sizeof(var ) );
ADDRGP4 $1998
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3041
;3041:	nvgscope = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 96
INDIRI4
ASGNI4
line 3043
;3042:
;3043:  	trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3044
;3044:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 100
INDIRI4
ASGNI4
line 3046
;3045:
;3046:	wMods = BG_WeaponMods(primary);
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 104
INDIRI4
ASGNI4
line 3048
;3047:
;3048: 	if ( laser )
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1999
line 3049
;3049:	{
line 3050
;3050:		xp = trap_Cvar_VariableValue("ui_char_accuracy");
ADDRGP4 $321
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 108
INDIRF4
CVFI4 4
ASGNI4
line 3052
;3051:
;3052:		if ( !(wMods & ( 1 << WM_LASER ) ) )
ADDRLP4 72
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $2001
line 3053
;3053:		{
line 3054
;3054:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "Lasersight" , 0, 30, textStyle);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRF4
ARGF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $2003
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3055
;3055:			CG_HandleWeaponPrimaryAddon3( 0,0,0 );
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon3
CALLI4
pop
line 3056
;3056:		}
ADDRGP4 $2000
JUMPV
LABELV $2001
line 3057
;3057:		else if ( xp < 4 )
ADDRLP4 84
INDIRI4
CNSTI4 4
GEI4 $2004
line 3058
;3058:		{
line 3059
;3059:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "Lasersight (acc>=4)" , 0, 30, textStyle);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRF4
ARGF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $2006
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3060
;3060:		}
ADDRGP4 $2000
JUMPV
LABELV $2004
line 3062
;3061:		else
;3062:			Text_Paint(rect->x, rect->y, scale, color, "Lasersight", 0, 30, textStyle);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRF4
ARGF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $2003
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3063
;3063:	}
ADDRGP4 $2000
JUMPV
LABELV $1999
line 3064
;3064:	else if ( scope )
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $2007
line 3065
;3065:	{
line 3066
;3066:		xp = trap_Cvar_VariableValue("ui_char_accuracy");
ADDRGP4 $321
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 108
INDIRF4
CVFI4 4
ASGNI4
line 3068
;3067:
;3068:		if ( !(wMods & ( 1 << WM_SCOPE ) ) )
ADDRLP4 72
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $2009
line 3069
;3069:		{			
line 3070
;3070:			CG_HandleWeaponPrimaryAddon3( 0,0,0 );
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon3
CALLI4
pop
line 3071
;3071:		}
ADDRGP4 $2008
JUMPV
LABELV $2009
line 3072
;3072:		else if ( xp < 6 )
ADDRLP4 84
INDIRI4
CNSTI4 6
GEI4 $2011
line 3073
;3073:		{
line 3074
;3074:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "Scope (acc>=6)" , 0, 30, textStyle);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRF4
ARGF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $2013
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3075
;3075:		}
ADDRGP4 $2008
JUMPV
LABELV $2011
line 3077
;3076:		else
;3077:			Text_Paint(rect->x, rect->y, scale, color, "Scope", 0, 30, textStyle);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRF4
ARGF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $2014
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3078
;3078:	}
ADDRGP4 $2008
JUMPV
LABELV $2007
line 3079
;3079:	else if ( nvgscope )
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $2015
line 3080
;3080:	{
line 3081
;3081:		xp = trap_Cvar_VariableValue("ui_char_stealth");
ADDRGP4 $324
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 108
INDIRF4
CVFI4 4
ASGNI4
line 3084
;3082:
;3083:#if 1 // fixme: add flashlight
;3084:		if ( 1 )//!(wMods & ( 1 << WM_NVGSCOPE ) )
line 3085
;3085:		{
line 3086
;3086:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "NV Scope" , 0, 30, textStyle);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRF4
ARGF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $2019
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3087
;3087:			CG_HandleWeaponPrimaryAddon3( 0,0,0 );
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon3
CALLI4
pop
line 3088
;3088:		}
ADDRGP4 $2016
JUMPV
LABELV $2017
line 3090
;3089:		else
;3090:			Text_Paint(rect->x, rect->y, scale, color, "NV Scope", 0, 30, textStyle);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRF4
ARGF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $2019
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3092
;3091:#endif
;3092:	}
ADDRGP4 $2016
JUMPV
LABELV $2015
line 3094
;3093:	else
;3094:	{
line 3095
;3095:		Text_Paint(rect->x, rect->y, scale, color, "No on weapon add-on", 0, 30, textStyle);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
INDIRF4
ARGF4
ADDRLP4 108
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $2020
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3096
;3096:	} 
LABELV $2016
LABELV $2008
LABELV $2000
line 3097
;3097:}
LABELV $1995
endproc CG_DrawWeaponPrimaryAddon3 120 32
proc CG_DrawWeaponSecondaryAddon1 108 32
line 3099
;3098:
;3099:static void CG_DrawWeaponSecondaryAddon1( rectDef_t *rect, int special, float scale, vec4_t color, int textStyle ) {
line 3107
;3100: 	int			primary;
;3101:	int			wMods;
;3102:	int			silencer ;
;3103: 	char		var[64];
;3104:	int			xp;
;3105:
;3106:
;3107:	trap_Cvar_VariableStringBuffer("inven_silencer_secondary", var , sizeof(var ) );
ADDRGP4 $2022
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3108
;3108:	silencer = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ASGNI4
line 3110
;3109:
;3110:	trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof(var ) );
ADDRGP4 $2023
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3111
;3111:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 84
INDIRI4
ASGNI4
line 3113
;3112:  
;3113:	wMods = BG_WeaponMods(primary);
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 88
INDIRI4
ASGNI4
line 3115
;3114:
;3115: 	if ( silencer )
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $2024
line 3116
;3116:	{
line 3117
;3117:		xp = trap_Cvar_VariableValue("ui_char_stealth");
ADDRGP4 $324
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 76
ADDRLP4 92
INDIRF4
CVFI4 4
ASGNI4
line 3119
;3118:
;3119:		if ( !(wMods & ( 1 << WM_SILENCER ) ) ) // skip equipment
ADDRLP4 72
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $2026
line 3120
;3120:			CG_HandleWeaponSecondaryAddon1( 0,0,0 );
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponSecondaryAddon1
CALLI4
pop
ADDRGP4 $2025
JUMPV
LABELV $2026
line 3121
;3121:		else if ( xp < 3 ) // no enough xp. keep equipment but tell user.
ADDRLP4 76
INDIRI4
CNSTI4 3
GEI4 $2028
line 3122
;3122:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "Suppressor (stl>=3)" , 0, 30, textStyle);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
INDIRF4
ARGF4
ADDRLP4 100
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $2030
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
ADDRGP4 $2025
JUMPV
LABELV $2028
line 3124
;3123:		else
;3124:			Text_Paint(rect->x, rect->y, scale, color, "Suppressor", 0, 30, textStyle);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
INDIRF4
ARGF4
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $1945
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3125
;3125:	} 
ADDRGP4 $2025
JUMPV
LABELV $2024
line 3127
;3126:	else
;3127:	{
line 3128
;3128:		Text_Paint(rect->x, rect->y, scale, color, "No Muzzle add-on", 0, 30, textStyle);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $1964
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3129
;3129:	} 
LABELV $2025
line 3130
;3130:}
LABELV $2021
endproc CG_DrawWeaponSecondaryAddon1 108 32
proc CG_DrawWeaponSecondaryAddon2 108 32
line 3132
;3131: 
;3132:static void CG_DrawWeaponSecondaryAddon2( rectDef_t *rect, int special, float scale, vec4_t color, int textStyle ) {
line 3139
;3133: 	int			primary;
;3134:	int			wMods;
;3135:	int			laser ;
;3136:	char		var[64];
;3137:	int			xp;
;3138:
;3139:	trap_Cvar_VariableStringBuffer("inven_lasersight_secondary", var , sizeof(var ) );
ADDRGP4 $2032
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3140
;3140:	laser = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ASGNI4
line 3142
;3141:
;3142:	trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof(var ) );
ADDRGP4 $2023
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3143
;3143:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 84
INDIRI4
ASGNI4
line 3145
;3144:  
;3145:	wMods = BG_WeaponMods(primary);
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 88
INDIRI4
ASGNI4
line 3147
;3146:
;3147: 	if ( laser )
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $2033
line 3148
;3148:	{
line 3149
;3149:		xp = trap_Cvar_VariableValue("ui_char_accuracy");
ADDRGP4 $321
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 76
ADDRLP4 92
INDIRF4
CVFI4 4
ASGNI4
line 3151
;3150:
;3151:		if ( !(wMods & ( 1 << WM_LASER ) ) )
ADDRLP4 72
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $2035
line 3152
;3152:			CG_HandleWeaponSecondaryAddon2( 0,0,0 );
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponSecondaryAddon2
CALLI4
pop
ADDRGP4 $2034
JUMPV
LABELV $2035
line 3153
;3153:		else if ( xp < 3 )
ADDRLP4 76
INDIRI4
CNSTI4 3
GEI4 $2037
line 3154
;3154:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, "Lasersight (acc>=3)" , 0, 30, textStyle);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
INDIRF4
ARGF4
ADDRLP4 100
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 $2039
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
ADDRGP4 $2034
JUMPV
LABELV $2037
line 3156
;3155:		else
;3156:			Text_Paint(rect->x, rect->y, scale, color, "Lasersight", 0, 30, textStyle);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
INDIRF4
ARGF4
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $2003
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3157
;3157:	} 
ADDRGP4 $2034
JUMPV
LABELV $2033
line 3159
;3158:	else
;3159:	{
line 3160
;3160:		Text_Paint(rect->x, rect->y, scale, color, "No on weapon add-on", 0, 30, textStyle);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
INDIRF4
ARGF4
ADDRLP4 92
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $2020
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3161
;3161:	} 
LABELV $2034
line 3162
;3162:}
LABELV $2031
endproc CG_DrawWeaponSecondaryAddon2 108 32
proc CG_DrawWeaponText 24 32
line 3165
;3163:
;3164:
;3165:static void CG_DrawWeaponText( rectDef_t *rect, int special, float scale, vec4_t color, int textStyle ) {
line 3167
;3166://	qhandle_t	icon = 0;  
;3167:	int			wNum = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3169
;3168:	
;3169:	if ( special )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $2041
line 3170
;3170:		wNum = special;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $2041
line 3172
;3171: 
;3172:	if ( wNum )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2043
line 3173
;3173:	{
line 3174
;3174:		gitem_t *it = BG_FindItemForWeapon( wNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 3176
;3175:		
;3176:		if (!UI_CheckWeapon(wNum))
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_CheckWeapon
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2045
line 3177
;3177:		{
line 3178
;3178:			Text_Paint(rect->x, rect->y, scale, colorMdGrey, va("%s", it->pickup_name ), 0, 30, textStyle);
ADDRGP4 $1955
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 colorMdGrey
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3179
;3179:		}
ADDRGP4 $2046
JUMPV
LABELV $2045
line 3181
;3180:		else
;3181:			Text_Paint(rect->x, rect->y, scale, color, va("%s", it->pickup_name ), 0, 30, textStyle);
ADDRGP4 $1955
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
LABELV $2046
line 3183
;3182:		
;3183:	}
LABELV $2043
line 3184
;3184:}
LABELV $2040
endproc CG_DrawWeaponText 24 32
proc UI_CalcWeight 1120 12
line 3195
;3185:
;3186:/*
;3187:=================
;3188:NSQ3 Calculate Weight
;3189:author: Defcon-X
;3190:date:  
;3191:description: calculates players current weight
;3192:=================
;3193:*/  
;3194:static float UI_CalcWeight ( void )
;3195:{
line 3196
;3196:	float weight = 0;
ADDRLP4 1024
CNSTF4 0
ASGNF4
line 3197
;3197:	float weapon_weight = 0;
ADDRLP4 1028
CNSTF4 0
ASGNF4
line 3218
;3198: 
;3199: 	int primary ;
;3200:	int secondary;
;3201:	int priammo;
;3202:	int secammo;
;3203:	int mmgrenades;
;3204:
;3205:	int grenades;
;3206:	int fl_grenades; 
;3207:	int sm_grenades;
;3208:
;3209:	int kevlar;
;3210:	int helmet;
;3211:  
;3212:	char		var[MAX_TOKEN_CHARS];
;3213: 
;3214:
;3215:	//
;3216:	// equipment
;3217:	//
;3218:	trap_Cvar_VariableStringBuffer("inven_helmet", var , sizeof(var ) );
ADDRGP4 $2048
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3219
;3219:	helmet = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1072
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1072
INDIRI4
ASGNI4
line 3221
;3220:
;3221:	trap_Cvar_VariableStringBuffer("inven_kevlar", var , sizeof(var ) );
ADDRGP4 $2049
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3222
;3222:	kevlar = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1076
INDIRI4
ASGNI4
line 3227
;3223:
;3224:	//
;3225:	// grenades
;3226:	//
;3227:	trap_Cvar_VariableStringBuffer("inven_ammo_flash", var , sizeof(var ) );
ADDRGP4 $724
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3228
;3228:	fl_grenades = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1080
INDIRI4
ASGNI4
line 3230
;3229:
;3230:	trap_Cvar_VariableStringBuffer("inven_ammo_smoke", var , sizeof(var ) );
ADDRGP4 $725
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3231
;3231:	sm_grenades = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1068
ADDRLP4 1084
INDIRI4
ASGNI4
line 3233
;3232:
;3233:	trap_Cvar_VariableStringBuffer("inven_ammo_mk26", var , sizeof(var ) );
ADDRGP4 $727
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3234
;3234:	grenades = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1088
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1088
INDIRI4
ASGNI4
line 3236
;3235:
;3236:	trap_Cvar_VariableStringBuffer("inven_ammo_40mmgren", var , sizeof(var ) );
ADDRGP4 $726
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3237
;3237:	mmgrenades = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1092
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1056
ADDRLP4 1092
INDIRI4
ASGNI4
line 3242
;3238:
;3239:	//
;3240:	// primary weapon
;3241:	//
;3242:	trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3243
;3243:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1096
INDIRI4
ASGNI4
line 3248
;3244:
;3245:	//
;3246:	// secondary weapon
;3247:	//
;3248:	trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof(var ) );
ADDRGP4 $2023
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3249
;3249:	secondary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1100
INDIRI4
ASGNI4
line 3254
;3250:
;3251:	//
;3252:	// ammo
;3253:	//
;3254:	trap_Cvar_VariableStringBuffer("inven_ammo_primary", var , sizeof(var ) );
ADDRGP4 $2050
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3255
;3255:	priammo = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1104
INDIRI4
ASGNI4
line 3257
;3256:
;3257:	trap_Cvar_VariableStringBuffer("inven_ammo_secondary", var , sizeof(var ) );
ADDRGP4 $2051
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3258
;3258:	secammo = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 1108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1108
INDIRI4
ASGNI4
line 3264
;3259:
;3260: 	//
;3261:	// Weapons
;3262:	//
;3263:
;3264:	switch (primary) 
ADDRLP4 1112
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 12
LTI4 $2052
ADDRLP4 1112
INDIRI4
CNSTI4 24
GTI4 $2052
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2066-48
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2066
address $2057
address $2052
address $2056
address $2054
address $2055
address $2064
address $2065
address $2060
address $2062
address $2059
address $2058
address $2061
address $2063
code
line 3265
;3265:	{
LABELV $2054
line 3267
;3266:		case WP_AK47:
;3267:			weapon_weight = 19;
ADDRLP4 1028
CNSTF4 1100480512
ASGNF4
line 3268
;3268:			break;
ADDRGP4 $2053
JUMPV
LABELV $2055
line 3270
;3269:		case WP_M4:
;3270:			weapon_weight = 20;
ADDRLP4 1028
CNSTF4 1101004800
ASGNF4
line 3271
;3271:			break;
ADDRGP4 $2053
JUMPV
LABELV $2056
line 3273
;3272:		case WP_MP5:
;3273:			weapon_weight = 15;
ADDRLP4 1028
CNSTF4 1097859072
ASGNF4
line 3274
;3274:			break;
ADDRGP4 $2053
JUMPV
LABELV $2057
line 3276
;3275:		case WP_PDW:
;3276:			weapon_weight = 20;
ADDRLP4 1028
CNSTF4 1101004800
ASGNF4
line 3277
;3277:			break; 
ADDRGP4 $2053
JUMPV
LABELV $2058
line 3279
;3278:		case WP_M14:
;3279:			weapon_weight = 32;
ADDRLP4 1028
CNSTF4 1107296256
ASGNF4
line 3280
;3280:			break;
ADDRGP4 $2053
JUMPV
LABELV $2059
line 3282
;3281:		case WP_SPAS15:
;3282:			weapon_weight = 24;
ADDRLP4 1028
CNSTF4 1103101952
ASGNF4
line 3283
;3283:			break;
ADDRGP4 $2053
JUMPV
LABELV $2060
line 3285
;3284:		case WP_870:
;3285:			weapon_weight = 20;
ADDRLP4 1028
CNSTF4 1101004800
ASGNF4
line 3286
;3286:			break;
ADDRGP4 $2053
JUMPV
LABELV $2061
line 3288
;3287:		case WP_M249:
;3288:			weapon_weight = 21;
ADDRLP4 1028
CNSTF4 1101529088
ASGNF4
line 3289
;3289:			break;
ADDRGP4 $2053
JUMPV
LABELV $2062
line 3291
;3290:		case WP_M590:
;3291:			weapon_weight = 16;
ADDRLP4 1028
CNSTF4 1098907648
ASGNF4
line 3292
;3292:			break;
ADDRGP4 $2053
JUMPV
LABELV $2063
line 3294
;3293:		case WP_SL8SD:
;3294:			weapon_weight = 17;
ADDRLP4 1028
CNSTF4 1099431936
ASGNF4
line 3295
;3295:			break;
ADDRGP4 $2053
JUMPV
LABELV $2064
line 3297
;3296:		case WP_PSG1:
;3297:			weapon_weight = 18;
ADDRLP4 1028
CNSTF4 1099956224
ASGNF4
line 3298
;3298:			break;
ADDRGP4 $2053
JUMPV
LABELV $2065
line 3300
;3299:		case WP_MACMILLAN:
;3300:			weapon_weight = 15;
ADDRLP4 1028
CNSTF4 1097859072
ASGNF4
line 3301
;3301:			break; 
ADDRGP4 $2053
JUMPV
LABELV $2052
line 3303
;3302:		default:
;3303:			weapon_weight = 15;
ADDRLP4 1028
CNSTF4 1097859072
ASGNF4
line 3304
;3304:			break;
LABELV $2053
line 3307
;3305:	}
;3306:	
;3307:	weight += weapon_weight;
ADDRLP4 1024
ADDRLP4 1024
INDIRF4
ADDRLP4 1028
INDIRF4
ADDF4
ASGNF4
line 3309
;3308:
;3309:	switch (secondary) 
ADDRLP4 1116
ADDRLP4 1036
INDIRI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 6
LTI4 $2068
ADDRLP4 1116
INDIRI4
CNSTI4 11
GTI4 $2068
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2075-24
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2075
address $2072
address $2073
address $2071
address $2074
address $2070
address $2070
code
line 3310
;3310:	{
LABELV $2070
line 3313
;3311:		case WP_SW629:
;3312:		case WP_DEAGLE:
;3313:			weapon_weight = 9;
ADDRLP4 1028
CNSTF4 1091567616
ASGNF4
line 3314
;3314:			break;
ADDRGP4 $2069
JUMPV
LABELV $2071
line 3316
;3315:		case WP_SW40T:
;3316:			weapon_weight = 7;
ADDRLP4 1028
CNSTF4 1088421888
ASGNF4
line 3317
;3317:			break;
ADDRGP4 $2069
JUMPV
LABELV $2072
line 3319
;3318:		case WP_MK23:
;3319:			weapon_weight = 6;
ADDRLP4 1028
CNSTF4 1086324736
ASGNF4
line 3320
;3320:			break;
ADDRGP4 $2069
JUMPV
LABELV $2073
line 3322
;3321:		case WP_GLOCK:
;3322:			weapon_weight = 6;
ADDRLP4 1028
CNSTF4 1086324736
ASGNF4
line 3323
;3323:			break;
ADDRGP4 $2069
JUMPV
LABELV $2074
line 3325
;3324:		case WP_P9S:
;3325:			weapon_weight = 5;
ADDRLP4 1028
CNSTF4 1084227584
ASGNF4
line 3326
;3326:			break;
ADDRGP4 $2069
JUMPV
LABELV $2068
line 3328
;3327:		default:
;3328:			weapon_weight = 6;
ADDRLP4 1028
CNSTF4 1086324736
ASGNF4
line 3329
;3329:			break;
LABELV $2069
line 3332
;3330:	}
;3331:	
;3332:	weight += weapon_weight;
ADDRLP4 1024
ADDRLP4 1024
INDIRF4
ADDRLP4 1028
INDIRF4
ADDF4
ASGNF4
line 3334
;3333:
;3334:	weight += (priammo+secammo)/2;
ADDRLP4 1024
ADDRLP4 1024
INDIRF4
ADDRLP4 1040
INDIRI4
ADDRLP4 1044
INDIRI4
ADDI4
CNSTI4 2
DIVI4
CVIF4 4
ADDF4
ASGNF4
line 3341
;3335: 
;3336: 
;3337:	//
;3338:	// Kevlar Vest
;3339:	//
;3340:
;3341:	if (kevlar)
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $2077
line 3342
;3342:		weight += 6.5; 
ADDRLP4 1024
ADDRLP4 1024
INDIRF4
CNSTF4 1087373312
ADDF4
ASGNF4
LABELV $2077
line 3348
;3343:
;3344:	//
;3345:	// Helmet
;3346:	//
;3347:
;3348:	if (helmet)
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $2079
line 3349
;3349:		weight += 6;
ADDRLP4 1024
ADDRLP4 1024
INDIRF4
CNSTF4 1086324736
ADDF4
ASGNF4
LABELV $2079
line 3352
;3350: 
;3351:	 
;3352:	if ( weight > 200)
ADDRLP4 1024
INDIRF4
CNSTF4 1128792064
LEF4 $2081
line 3353
;3353:		weight = 200;
ADDRLP4 1024
CNSTF4 1128792064
ASGNF4
LABELV $2081
line 3355
;3354:
;3355: 	return weight;
ADDRLP4 1024
INDIRF4
RETF4
LABELV $2047
endproc UI_CalcWeight 1120 12
proc UI_DrawWeight 16 32
line 3358
;3356:} 
;3357:
;3358:static void UI_DrawWeight(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 3359
;3359:	int weight = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3361
;3360:
;3361:	weight = UI_CalcWeight();
ADDRLP4 4
ADDRGP4 UI_CalcWeight
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 3363
;3362:
;3363:	Text_Paint(rect->x, rect->y, scale, color, va("Weight: %ikg",weight), 0, 0, textStyle);
ADDRGP4 $2084
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 3364
;3364:}
LABELV $2083
endproc UI_DrawWeight 16 32
proc CG_DrawWeaponIcon 48 20
line 3366
;3365:
;3366:static void CG_DrawWeaponIcon( rectDef_t *rect, int special ) {
line 3367
;3367:	qhandle_t	icon = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3368
;3368:	qboolean	weapon = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3369
;3369:	qboolean	item = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3370
;3370:	int			wNum = WP_NONE;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3372
;3371:	
;3372:	if ( special )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $2086
line 3373
;3373:	{
line 3375
;3374:	
;3375:		wNum = special;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
line 3376
;3376:	}
LABELV $2086
line 3378
;3377:
;3378:	if (!weapon&&!item)
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $2088
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $2088
line 3379
;3379:		return;
ADDRGP4 $2085
JUMPV
LABELV $2088
line 3381
;3380:
;3381:	if ( weapon )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2090
line 3382
;3382:	{
line 3383
;3383:		gitem_t *it =		BG_FindItemForWeapon( wNum);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
ASGNP4
line 3386
;3384:
;3385:
;3386:		icon = trap_R_RegisterShaderNoMip( it->icon );
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 3387
;3387:	}
LABELV $2090
line 3389
;3388:
;3389:	if ( icon ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2092
line 3391
;3390:		
;3391:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, icon );
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
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 3393
;3392:		
;3393:		if (!UI_CheckWeapon(wNum))
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_CheckWeapon
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2094
line 3394
;3394:		{
line 3397
;3395:			float color[4];
;3396:
;3397:			color[0] = colorRed[0];
ADDRLP4 28
ADDRGP4 colorRed
INDIRF4
ASGNF4
line 3398
;3398:			color[1] = colorRed[1];
ADDRLP4 28+4
ADDRGP4 colorRed+4
INDIRF4
ASGNF4
line 3399
;3399:			color[2] = colorRed[2];
ADDRLP4 28+8
ADDRGP4 colorRed+8
INDIRF4
ASGNF4
line 3400
;3400:			color[3] = colorRed[3] - 0.5;
ADDRLP4 28+12
ADDRGP4 colorRed+12
INDIRF4
CNSTF4 1056964608
SUBF4
ASGNF4
line 3401
;3401:			UI_FillRect( rect->x, rect->y, rect->w, rect->h, color );
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
ADDRLP4 28
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 3402
;3402:		}
LABELV $2094
line 3404
;3403:
;3404:	}
LABELV $2092
line 3405
;3405:}
LABELV $2085
endproc CG_DrawWeaponIcon 48 20
proc CG_DrawCharacterButton 100 20
line 3407
;3406:
;3407:static void CG_DrawCharacterButton( rectDef_t *rect, int special ) {
line 3409
;3408://	qhandle_t	icon = 0;
;3409:	int		xp = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3417
;3410:	int		value; 
;3411:	char	buff[64];
;3412:
;3413:#if DEBUGCHARACTER
;3414:	Com_Printf("DrawCharacterButton\n");
;3415:#endif
;3416:	
;3417:	if ( special == PC_STRENGTH )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $2103
line 3418
;3418:		value = trap_Cvar_VariableValue("ui_char_strength");
ADDRGP4 $322
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 72
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $2104
JUMPV
LABELV $2103
line 3419
;3419:	else if ( special == PC_TECHNICAL )
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $2105
line 3420
;3420:		value = trap_Cvar_VariableValue("ui_char_technical");
ADDRGP4 $325
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $2106
JUMPV
LABELV $2105
line 3421
;3421:	else if ( special == PC_STAMINA )
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $2107
line 3422
;3422:		value = trap_Cvar_VariableValue("ui_char_stamina");
ADDRGP4 $323
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 80
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $2108
JUMPV
LABELV $2107
line 3423
;3423:	else if ( special == PC_ACCURACY )
ADDRFP4 4
INDIRI4
CNSTI4 4
NEI4 $2109
line 3424
;3424:		value = trap_Cvar_VariableValue("ui_char_accuracy");
ADDRGP4 $321
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $2110
JUMPV
LABELV $2109
line 3425
;3425:	else if ( special == PC_SPEED )
ADDRFP4 4
INDIRI4
CNSTI4 5
NEI4 $2111
line 3426
;3426:		value = trap_Cvar_VariableValue("ui_char_speed");
ADDRGP4 $326
ARGP4
ADDRLP4 88
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 88
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $2112
JUMPV
LABELV $2111
line 3427
;3427:	else if ( special == PC_STEALTH )
ADDRFP4 4
INDIRI4
CNSTI4 6
NEI4 $2102
line 3428
;3428:		value = trap_Cvar_VariableValue("ui_char_stealth");
ADDRGP4 $324
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 92
INDIRF4
CVFI4 4
ASGNI4
line 3430
;3429:	else
;3430:		return;
LABELV $2114
LABELV $2112
LABELV $2110
LABELV $2108
LABELV $2106
LABELV $2104
line 3433
;3431:
;3432:	// cannot raise level
;3433:	if ( xp <= value )
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $2115
line 3434
;3434:	{
line 3435
;3435:		UI_FillRect( rect->x, rect->y, rect->w, rect->h, colorRed );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 3436
;3436:	}		
ADDRGP4 $2116
JUMPV
LABELV $2115
line 3438
;3437:	else // possible
;3438:	{
line 3439
;3439:		UI_FillRect( rect->x, rect->y, rect->w, rect->h, colorGreen );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 colorGreen
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 3440
;3440:	}
LABELV $2116
line 3441
;3441:}
LABELV $2102
endproc CG_DrawCharacterButton 100 20
proc UI_OwnerDraw 1056 24
line 3445
;3442: 
;3443:// FIXME: table drive
;3444://
;3445:static void UI_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw, int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 3448
;3446:	rectDef_t rect;
;3447:
;3448:  rect.x = x + text_x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 3449
;3449:  rect.y = y + text_y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
ADDRFP4 20
INDIRF4
ADDF4
ASGNF4
line 3450
;3450:  rect.w = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
ASGNF4
line 3451
;3451:  rect.h = h; 
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 3452
;3452:	switch (ownerDraw) {
ADDRLP4 20
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 200
LTI4 $2122
ADDRLP4 20
INDIRI4
CNSTI4 311
GTI4 $2122
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2196-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2196
address $2144
address $2145
address $2146
address $2151
address $2152
address $2155
address $2158
address $2162
address $2163
address $2164
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2167
address $2168
address $2170
address $2171
address $2172
address $2173
address $2174
address $2175
address $2176
address $2179
address $2177
address $2180
address $2178
address $2181
address $2182
address $2183
address $2184
address $2186
address $2122
address $2187
address $2188
address $2189
address $2190
address $2191
address $2160
address $2156
address $2169
address $2192
address $2193
address $2194
address $2195
address $2153
address $2159
address $2157
address $2154
address $2161
address $2185
address $2142
address $2129
address $2129
address $2128
address $2148
address $2147
address $2149
address $2150
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2123
address $2124
address $2125
address $2126
address $2127
address $2135
address $2136
address $2136
address $2143
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2165
address $2165
address $2165
address $2165
address $2165
address $2165
address $2166
address $2166
address $2166
address $2166
address $2166
address $2166
code
LABELV $2123
line 3455
;3453:
;3454:	case UI_PRIMARY_ADDON1:
;3455:		CG_DrawWeaponPrimaryAddon1( &rect, special, scale, color, textStyle );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawWeaponPrimaryAddon1
CALLV
pop
line 3456
;3456:		break;
ADDRGP4 $2122
JUMPV
LABELV $2124
line 3458
;3457:	case UI_PRIMARY_ADDON2:
;3458:		CG_DrawWeaponPrimaryAddon2( &rect, special, scale, color, textStyle );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawWeaponPrimaryAddon2
CALLV
pop
line 3459
;3459:		break;
ADDRGP4 $2122
JUMPV
LABELV $2125
line 3461
;3460:	case UI_PRIMARY_ADDON3:
;3461:		CG_DrawWeaponPrimaryAddon3( &rect, special, scale, color, textStyle );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawWeaponPrimaryAddon3
CALLV
pop
line 3462
;3462:		break;
ADDRGP4 $2122
JUMPV
LABELV $2126
line 3465
;3463:
;3464:	case UI_SIDEARM_ADDON1:
;3465:		CG_DrawWeaponSecondaryAddon1( &rect, special, scale, color, textStyle );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawWeaponSecondaryAddon1
CALLV
pop
line 3466
;3466:		break;
ADDRGP4 $2122
JUMPV
LABELV $2127
line 3468
;3467:	case UI_SIDEARM_ADDON2:
;3468:		CG_DrawWeaponSecondaryAddon2( &rect, special, scale, color, textStyle );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawWeaponSecondaryAddon2
CALLV
pop
line 3469
;3469:		break;
ADDRGP4 $2122
JUMPV
LABELV $2128
line 3471
;3470:	case CG_CHARACTERBUTTON:
;3471:		CG_DrawCharacterButton( &rect, special );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawCharacterButton
CALLV
pop
line 3472
;3472:		break;
ADDRGP4 $2122
JUMPV
LABELV $2129
line 3475
;3473:	case CG_PRIMARY: 
;3474:	case CG_SECONDARY: 
;3475:		{
line 3478
;3476:			char		var[MAX_TOKEN_CHARS]; 
;3477:
;3478:			if (ownerDraw == CG_PRIMARY)
ADDRFP4 24
INDIRI4
CNSTI4 258
NEI4 $2130
line 3479
;3479:				trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof( var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
ADDRGP4 $2131
JUMPV
LABELV $2130
line 3481
;3480:			else
;3481:				trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof( var ) );
ADDRGP4 $2023
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
LABELV $2131
line 3484
;3482:
;3483:			// set the "special to our current weapon"
;3484:			special = atoi(var);
ADDRLP4 24
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 36
ADDRLP4 1048
INDIRI4
CVIF4 4
ASGNF4
line 3486
;3485:			
;3486:			if ( special <= 0 || special >= WP_NUM_WEAPONS)
ADDRLP4 1052
ADDRFP4 36
INDIRF4
ASGNF4
ADDRLP4 1052
INDIRF4
CNSTF4 0
LEF4 $2134
ADDRLP4 1052
INDIRF4
CNSTF4 1104150528
LTF4 $2132
LABELV $2134
line 3487
;3487:				return; 
ADDRGP4 $2117
JUMPV
LABELV $2132
line 3489
;3488:
;3489:			CG_DrawWeaponIcon( &rect, special );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawWeaponIcon
CALLV
pop
line 3490
;3490:		}
line 3491
;3491:		break; 
ADDRGP4 $2122
JUMPV
LABELV $2135
line 3493
;3492:	case UI_TOTALWEIGHT:
;3493:		UI_DrawWeight(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawWeight
CALLV
pop
line 3494
;3494:		break;
ADDRGP4 $2122
JUMPV
LABELV $2136
line 3497
;3495:	case UI_TEXT_PRIMARY: 
;3496:	case UI_TEXT_SIDEARM: 
;3497:		{
line 3500
;3498:			char		var[MAX_TOKEN_CHARS]; 
;3499:
;3500:			if (ownerDraw == UI_TEXT_PRIMARY)
ADDRFP4 24
INDIRI4
CNSTI4 284
NEI4 $2137
line 3501
;3501:				trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof( var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
ADDRGP4 $2138
JUMPV
LABELV $2137
line 3503
;3502:			else
;3503:				trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof( var ) );
ADDRGP4 $2023
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
LABELV $2138
line 3506
;3504:
;3505:			// set the "special to our current weapon"
;3506:			special = atoi(var);
ADDRLP4 24
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 36
ADDRLP4 1048
INDIRI4
CVIF4 4
ASGNF4
line 3508
;3507:			
;3508:			if ( special <= 0 || special >= WP_NUM_WEAPONS)
ADDRLP4 1052
ADDRFP4 36
INDIRF4
ASGNF4
ADDRLP4 1052
INDIRF4
CNSTF4 0
LEF4 $2141
ADDRLP4 1052
INDIRF4
CNSTF4 1104150528
LTF4 $2139
LABELV $2141
line 3509
;3509:				return; 
ADDRGP4 $2117
JUMPV
LABELV $2139
line 3511
;3510:
;3511:			CG_DrawWeaponText( &rect, special, scale, color, textStyle );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawWeaponText
CALLV
pop
line 3512
;3512:		}
line 3513
;3513:		break; 
ADDRGP4 $2122
JUMPV
LABELV $2142
line 3515
;3514:	case CG_PICKUP:
;3515:	  CG_DrawWeaponIcon( &rect, special );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawWeaponIcon
CALLV
pop
line 3516
;3516:	  break;
ADDRGP4 $2122
JUMPV
LABELV $2143
line 3519
;3517:
;3518:	case CG_TEXT_PICKUP:
;3519:	  CG_DrawWeaponText( &rect, special, scale, color, textStyle );
ADDRLP4 0
ARGP4
ADDRFP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawWeaponText
CALLV
pop
line 3520
;3520:	  break;
ADDRGP4 $2122
JUMPV
LABELV $2144
line 3523
;3521:
;3522:    case UI_HANDICAP:
;3523:      UI_DrawHandicap(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandicap
CALLV
pop
line 3524
;3524:      break;
ADDRGP4 $2122
JUMPV
LABELV $2145
line 3526
;3525:    case UI_EFFECTS:
;3526:      UI_DrawEffects(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawEffects
CALLV
pop
line 3527
;3527:      break;
ADDRGP4 $2122
JUMPV
LABELV $2146
line 3529
;3528:    case UI_PLAYERMODEL:
;3529:      UI_DrawPlayerModel(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawPlayerModel
CALLV
pop
line 3530
;3530:      break;
ADDRGP4 $2122
JUMPV
LABELV $2147
line 3532
;3531:	case UI_TANGO_HEADMODEL:
;3532:		UI_DrawHeadModel(&rect, TEAM_BLUE);//, TEAM_BLUE );
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 UI_DrawHeadModel
CALLV
pop
line 3533
;3533:		break;
ADDRGP4 $2122
JUMPV
LABELV $2148
line 3535
;3534:	case UI_SEAL_HEADMODEL:
;3535:		UI_DrawHeadModel(&rect, TEAM_RED );
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawHeadModel
CALLV
pop
line 3536
;3536:		break;
ADDRGP4 $2122
JUMPV
LABELV $2149
line 3538
;3537:	case UI_SEAL_PLAYERMODEL:
;3538:		UI_DrawPlayerModelForTeam( &rect, TEAM_BLUE );
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 UI_DrawPlayerModelForTeam
CALLV
pop
line 3539
;3539:		break;
ADDRGP4 $2122
JUMPV
LABELV $2150
line 3541
;3540:	case UI_TANGO_PLAYERMODEL:
;3541:		UI_DrawPlayerModelForTeam( &rect, TEAM_RED );
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawPlayerModelForTeam
CALLV
pop
line 3542
;3542:		break;
ADDRGP4 $2122
JUMPV
LABELV $2151
line 3544
;3543:    case UI_CLANNAME:
;3544:      UI_DrawClanName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawClanName
CALLV
pop
line 3545
;3545:      break;
ADDRGP4 $2122
JUMPV
LABELV $2152
line 3547
;3546:    case UI_CLANLOGO:
;3547:      UI_DrawClanLogo(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanLogo
CALLV
pop
line 3548
;3548:      break;
ADDRGP4 $2122
JUMPV
LABELV $2153
line 3550
;3549:    case UI_CLANCINEMATIC:
;3550:      UI_DrawClanCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanCinematic
CALLV
pop
line 3551
;3551:      break;
ADDRGP4 $2122
JUMPV
LABELV $2154
line 3553
;3552:    case UI_PREVIEWCINEMATIC:
;3553:      UI_DrawPreviewCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPreviewCinematic
CALLV
pop
line 3554
;3554:      break;
ADDRGP4 $2122
JUMPV
LABELV $2155
line 3556
;3555:    case UI_GAMETYPE:
;3556:      UI_DrawGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawGameType
CALLV
pop
line 3557
;3557:      break;
ADDRGP4 $2122
JUMPV
LABELV $2156
line 3559
;3558:    case UI_NETGAMETYPE:
;3559:      UI_DrawNetGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetGameType
CALLV
pop
line 3560
;3560:      break;
ADDRGP4 $2122
JUMPV
LABELV $2157
line 3562
;3561:    case UI_JOINGAMETYPE:
;3562:	  UI_DrawJoinGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawJoinGameType
CALLV
pop
line 3563
;3563:	  break;
ADDRGP4 $2122
JUMPV
LABELV $2158
line 3565
;3564:    case UI_MAPPREVIEW:
;3565:      UI_DrawMapPreview(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 3566
;3566:      break;
ADDRGP4 $2122
JUMPV
LABELV $2159
line 3568
;3567:    case UI_MAP_TIMETOBEAT:
;3568:      UI_DrawMapTimeToBeat(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapTimeToBeat
CALLV
pop
line 3569
;3569:      break;
ADDRGP4 $2122
JUMPV
LABELV $2160
line 3571
;3570:    case UI_MAPCINEMATIC:
;3571:      UI_DrawMapCinematic(&rect, scale, color, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 3572
;3572:      break;
ADDRGP4 $2122
JUMPV
LABELV $2161
line 3574
;3573:    case UI_STARTMAPCINEMATIC:
;3574:      UI_DrawMapCinematic(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 3575
;3575:      break;
ADDRGP4 $2122
JUMPV
LABELV $2162
line 3577
;3576:    case UI_SKILL:
;3577:      UI_DrawSkill(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawSkill
CALLV
pop
line 3578
;3578:      break;
ADDRGP4 $2122
JUMPV
LABELV $2163
line 3580
;3579:    case UI_BLUETEAMNAME:
;3580:      UI_DrawTeamName(&rect, scale, color, qtrue, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 3581
;3581:      break;
ADDRGP4 $2122
JUMPV
LABELV $2164
line 3583
;3582:    case UI_REDTEAMNAME:
;3583:      UI_DrawTeamName(&rect, scale, color, qfalse, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 3584
;3584:      break;
ADDRGP4 $2122
JUMPV
LABELV $2165
line 3591
;3585:    case UI_BLUETEAM1:
;3586:		case UI_BLUETEAM2:
;3587:		case UI_BLUETEAM3:
;3588:		case UI_BLUETEAM4:
;3589:		case UI_BLUETEAM5:
;3590:		case UI_BLUETEAM6:
;3591:      UI_DrawTeamMember(&rect, scale, color, qtrue, ownerDraw - UI_BLUETEAM1 + 1, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 300
SUBI4
ADDRLP4 24
INDIRI4
ADDI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 3592
;3592:      break;
ADDRGP4 $2122
JUMPV
LABELV $2166
line 3599
;3593:    case UI_REDTEAM1:
;3594:		case UI_REDTEAM2:
;3595:		case UI_REDTEAM3:
;3596:		case UI_REDTEAM4:
;3597:		case UI_REDTEAM5:
;3598:		case UI_REDTEAM6:
;3599:      UI_DrawTeamMember(&rect, scale, color, qfalse, ownerDraw - UI_REDTEAM1 + 1, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 306
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 3600
;3600:      break;
ADDRGP4 $2122
JUMPV
LABELV $2167
line 3602
;3601:		case UI_NETSOURCE:
;3602:      UI_DrawNetSource(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetSource
CALLV
pop
line 3603
;3603:			break;
ADDRGP4 $2122
JUMPV
LABELV $2168
line 3605
;3604:    case UI_NETMAPPREVIEW:
;3605:      UI_DrawNetMapPreview(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 3606
;3606:      break;
ADDRGP4 $2122
JUMPV
LABELV $2169
line 3608
;3607:    case UI_NETMAPCINEMATIC:
;3608:      UI_DrawNetMapCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapCinematic
CALLV
pop
line 3609
;3609:      break;
ADDRGP4 $2122
JUMPV
LABELV $2170
line 3611
;3610:		case UI_NETFILTER:
;3611:      UI_DrawNetFilter(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetFilter
CALLV
pop
line 3612
;3612:			break;
ADDRGP4 $2122
JUMPV
LABELV $2171
line 3614
;3613:		case UI_TIER:
;3614:			UI_DrawTier(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTier
CALLV
pop
line 3615
;3615:			break;
ADDRGP4 $2122
JUMPV
LABELV $2172
line 3617
;3616:		case UI_OPPONENTMODEL:
;3617:			UI_DrawOpponent(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawOpponent
CALLV
pop
line 3618
;3618:			break;
ADDRGP4 $2122
JUMPV
LABELV $2173
line 3620
;3619:		case UI_TIERMAP1:
;3620:			UI_DrawTierMap(&rect, 0);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 3621
;3621:			break;
ADDRGP4 $2122
JUMPV
LABELV $2174
line 3623
;3622:		case UI_TIERMAP2:
;3623:			UI_DrawTierMap(&rect, 1);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 3624
;3624:			break;
ADDRGP4 $2122
JUMPV
LABELV $2175
line 3626
;3625:		case UI_TIERMAP3:
;3626:			UI_DrawTierMap(&rect, 2);
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 3627
;3627:			break;
ADDRGP4 $2122
JUMPV
LABELV $2176
line 3629
;3628:		case UI_PLAYERLOGO:
;3629:			UI_DrawPlayerLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogo
CALLV
pop
line 3630
;3630:			break;
ADDRGP4 $2122
JUMPV
LABELV $2177
line 3632
;3631:		case UI_PLAYERLOGO_METAL:
;3632:			UI_DrawPlayerLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoMetal
CALLV
pop
line 3633
;3633:			break;
ADDRGP4 $2122
JUMPV
LABELV $2178
line 3635
;3634:		case UI_PLAYERLOGO_NAME:
;3635:			UI_DrawPlayerLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoName
CALLV
pop
line 3636
;3636:			break;
ADDRGP4 $2122
JUMPV
LABELV $2179
line 3638
;3637:		case UI_OPPONENTLOGO:
;3638:			UI_DrawOpponentLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogo
CALLV
pop
line 3639
;3639:			break;
ADDRGP4 $2122
JUMPV
LABELV $2180
line 3641
;3640:		case UI_OPPONENTLOGO_METAL:
;3641:			UI_DrawOpponentLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoMetal
CALLV
pop
line 3642
;3642:			break;
ADDRGP4 $2122
JUMPV
LABELV $2181
line 3644
;3643:		case UI_OPPONENTLOGO_NAME:
;3644:			UI_DrawOpponentLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoName
CALLV
pop
line 3645
;3645:			break;
ADDRGP4 $2122
JUMPV
LABELV $2182
line 3647
;3646:		case UI_TIER_MAPNAME:
;3647:			UI_DrawTierMapName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierMapName
CALLV
pop
line 3648
;3648:			break;
ADDRGP4 $2122
JUMPV
LABELV $2183
line 3650
;3649:		case UI_TIER_GAMETYPE:
;3650:			UI_DrawTierGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierGameType
CALLV
pop
line 3651
;3651:			break;
ADDRGP4 $2122
JUMPV
LABELV $2184
line 3653
;3652:		case UI_ALLMAPS_SELECTION:
;3653:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 3654
;3654:			break;
ADDRGP4 $2122
JUMPV
LABELV $2185
line 3656
;3655:		case UI_MAPS_SELECTION:
;3656:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 3657
;3657:			break;
ADDRGP4 $2122
JUMPV
LABELV $2186
line 3659
;3658:		case UI_OPPONENT_NAME:
;3659:			UI_DrawOpponentName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawOpponentName
CALLV
pop
line 3660
;3660:			break;
ADDRGP4 $2122
JUMPV
LABELV $2187
line 3662
;3661:		case UI_BOTNAME:
;3662:			UI_DrawBotName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotName
CALLV
pop
line 3663
;3663:			break;
ADDRGP4 $2122
JUMPV
LABELV $2188
line 3665
;3664:		case UI_BOTSKILL:
;3665:			UI_DrawBotSkill(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotSkill
CALLV
pop
line 3666
;3666:			break;
ADDRGP4 $2122
JUMPV
LABELV $2189
line 3668
;3667:		case UI_REDBLUE:
;3668:			UI_DrawRedBlue(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawRedBlue
CALLV
pop
line 3669
;3669:			break;
ADDRGP4 $2122
JUMPV
LABELV $2190
line 3671
;3670:		case UI_CROSSHAIR:
;3671:			UI_DrawCrosshair(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawCrosshair
CALLV
pop
line 3672
;3672:			break;
ADDRGP4 $2122
JUMPV
LABELV $2191
line 3674
;3673:		case UI_SELECTEDPLAYER:
;3674:			UI_DrawSelectedPlayer(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawSelectedPlayer
CALLV
pop
line 3675
;3675:			break;
ADDRGP4 $2122
JUMPV
LABELV $2192
line 3677
;3676:		case UI_SERVERREFRESHDATE:
;3677:			UI_DrawServerRefreshDate(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawServerRefreshDate
CALLV
pop
line 3678
;3678:			break;
ADDRGP4 $2122
JUMPV
LABELV $2193
line 3680
;3679:		case UI_SERVERMOTD:
;3680:			UI_DrawServerMOTD(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawServerMOTD
CALLV
pop
line 3681
;3681:			break;
ADDRGP4 $2122
JUMPV
LABELV $2194
line 3683
;3682:		case UI_GLINFO:
;3683:			UI_DrawGLInfo(&rect,scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawGLInfo
CALLV
pop
line 3684
;3684:			break;
ADDRGP4 $2122
JUMPV
LABELV $2195
line 3686
;3685:		case UI_KEYBINDSTATUS:
;3686:			UI_DrawKeyBindStatus(&rect,scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawKeyBindStatus
CALLV
pop
line 3687
;3687:			break;
line 3689
;3688:    default:
;3689:      break;
LABELV $2122
line 3692
;3690:  }
;3691:
;3692:}
LABELV $2117
endproc UI_OwnerDraw 1056 24
proc UI_OwnerDrawVisible 8 4
line 3694
;3693:
;3694:static qboolean UI_OwnerDrawVisible(int flags) {
line 3695
;3695:	qboolean vis = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $2200
JUMPV
LABELV $2199
line 3697
;3696:
;3697:	while (flags) {
line 3699
;3698:
;3699:		if (flags & UI_SHOW_FFA) {
ADDRFP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2202
line 3700
;3700:			if (trap_Cvar_VariableValue("g_gametype") != GT_FFA) {
ADDRGP4 $1661
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $2204
line 3701
;3701:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3702
;3702:			}
LABELV $2204
line 3703
;3703:			flags &= ~UI_SHOW_FFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 3704
;3704:		}
LABELV $2202
line 3706
;3705:
;3706:		if (flags & UI_SHOW_NOTFFA) {
ADDRFP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2206
line 3707
;3707:			if (trap_Cvar_VariableValue("g_gametype") == GT_FFA) {
ADDRGP4 $1661
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $2208
line 3708
;3708:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3709
;3709:			}
LABELV $2208
line 3710
;3710:			flags &= ~UI_SHOW_NOTFFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 3711
;3711:		}
LABELV $2206
line 3713
;3712:
;3713:		if (flags & UI_SHOW_LEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2210
line 3715
;3714:			// these need to show when this client can give orders to a player or a group
;3715:			if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78408
INDIRI4
CNSTI4 0
NEI4 $2212
line 3716
;3716:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3717
;3717:			} else {
ADDRGP4 $2213
JUMPV
LABELV $2212
line 3719
;3718:				// if showing yourself
;3719:				if (ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
GEI4 $2215
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82508
ADDP4
INDIRI4
ADDRGP4 uiInfo+78404
INDIRI4
NEI4 $2215
line 3720
;3720:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3721
;3721:				}
LABELV $2215
line 3722
;3722:			}
LABELV $2213
line 3723
;3723:			flags &= ~UI_SHOW_LEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 3724
;3724:		} 
LABELV $2210
line 3725
;3725:		if (flags & UI_SHOW_NOTLEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2222
line 3727
;3726:			// these need to show when this client is assigning their own status or they are NOT the leader
;3727:			if (uiInfo.teamLeader) {
ADDRGP4 uiInfo+78408
INDIRI4
CNSTI4 0
EQI4 $2224
line 3729
;3728:				// if not showing yourself
;3729:				if (!(ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber)) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
GEI4 $2234
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82508
ADDP4
INDIRI4
ADDRGP4 uiInfo+78404
INDIRI4
EQI4 $2227
LABELV $2234
line 3730
;3730:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3731
;3731:				}
LABELV $2227
line 3732
;3732:			}
LABELV $2224
line 3733
;3733:			flags &= ~UI_SHOW_NOTLEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 3734
;3734:		} 
LABELV $2222
line 3735
;3735:		if (flags & UI_SHOW_FAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2235
line 3737
;3736:			// this assumes you only put this type of display flag on something showing in the proper context
;3737:			if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $2237
line 3738
;3738:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3739
;3739:			}
LABELV $2237
line 3740
;3740:			flags &= ~UI_SHOW_FAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 3741
;3741:		} 
LABELV $2235
line 3742
;3742:		if (flags & UI_SHOW_NOTFAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2240
line 3744
;3743:			// this assumes you only put this type of display flag on something showing in the proper context
;3744:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $2242
line 3745
;3745:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3746
;3746:			}
LABELV $2242
line 3747
;3747:			flags &= ~UI_SHOW_NOTFAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 3748
;3748:		} 
LABELV $2240
line 3749
;3749:		if (flags & UI_SHOW_ANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2245
line 3750
;3750:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum <= GT_TEAM ) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CNSTI4 1
GTI4 $2247
line 3751
;3751:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3752
;3752:			}
LABELV $2247
line 3753
;3753:			flags &= ~UI_SHOW_ANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 3754
;3754:		} 
LABELV $2245
line 3755
;3755:		if (flags & UI_SHOW_ANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $2252
line 3756
;3756:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum > GT_TEAM ) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2254
line 3757
;3757:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3758
;3758:			}
LABELV $2254
line 3759
;3759:			flags &= ~UI_SHOW_ANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 3760
;3760:		} 
LABELV $2252
line 3761
;3761:		if (flags & UI_SHOW_NETANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $2259
line 3762
;3762:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum <= GT_TEAM ) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CNSTI4 1
GTI4 $2261
line 3763
;3763:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3764
;3764:			}
LABELV $2261
line 3765
;3765:			flags &= ~UI_SHOW_NETANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 3766
;3766:		} 
LABELV $2259
line 3767
;3767:		if (flags & UI_SHOW_NETANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2266
line 3768
;3768:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum > GT_TEAM ) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2268
line 3769
;3769:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3770
;3770:			}
LABELV $2268
line 3771
;3771:			flags &= ~UI_SHOW_NETANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 3772
;3772:		}   
LABELV $2266
line 3773
;3773:		if (flags & UI_SHOW_DEMOAVAILABLE) {
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2273
line 3774
;3774:			if (!uiInfo.demoAvailable) {
ADDRGP4 uiInfo+73484
INDIRI4
CNSTI4 0
NEI4 $2275
line 3775
;3775:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3776
;3776:			}
LABELV $2275
line 3777
;3777:			flags &= ~UI_SHOW_DEMOAVAILABLE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 3778
;3778:		} else {
ADDRGP4 $2274
JUMPV
LABELV $2273
line 3779
;3779:			flags = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 3780
;3780:		}
LABELV $2274
line 3781
;3781:	}
LABELV $2200
line 3697
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $2199
line 3782
;3782:  return vis;
ADDRLP4 0
INDIRI4
RETI4
LABELV $2198
endproc UI_OwnerDrawVisible 8 4
proc CG_HandleWeaponPrimaryAddon1 96 12
line 3785
;3783:}
;3784:
;3785:static qboolean CG_HandleWeaponPrimaryAddon1( int flags, float *special, int key ) {
line 3790
;3786: 	int			silencer,duckbill;
;3787:	char		var[64];
;3788:	int			primary;
;3789:
;3790:	trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3791
;3791:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 76
INDIRI4
ASGNI4
line 3794
;3792:
;3793:
;3794:	trap_Cvar_VariableStringBuffer("inven_duckbill", var , sizeof(var ) );
ADDRGP4 $1940
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3795
;3795:	duckbill = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 80
INDIRI4
ASGNI4
line 3797
;3796:
;3797:	trap_Cvar_VariableStringBuffer("inven_silencer", var , sizeof(var ) );
ADDRGP4 $1941
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3798
;3798:	silencer = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 84
INDIRI4
ASGNI4
line 3801
;3799: 
;3800:
;3801: 	if ( silencer )
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $2279
line 3802
;3802:	{
line 3803
;3803:		trap_Cvar_SetValue("inven_silencer", 0);
ADDRGP4 $1941
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3805
;3804:		
;3805:		if ( BG_WeaponMods( primary ) & ( 1 << WM_DUCKBILL ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2281
line 3806
;3806:			trap_Cvar_SetValue("inven_duckbill", 1);
ADDRGP4 $1940
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
ADDRGP4 $2280
JUMPV
LABELV $2281
line 3808
;3807:		else
;3808:			trap_Cvar_SetValue("inven_duckbill", 0);
ADDRGP4 $1940
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3809
;3809:	}
ADDRGP4 $2280
JUMPV
LABELV $2279
line 3810
;3810:	else if ( duckbill )
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $2283
line 3811
;3811:	{
line 3812
;3812:		trap_Cvar_SetValue("inven_duckbill", 0);
ADDRGP4 $1940
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3813
;3813:		trap_Cvar_SetValue("inven_silencer", 0); 
ADDRGP4 $1941
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3814
;3814:	}
ADDRGP4 $2284
JUMPV
LABELV $2283
line 3816
;3815:	else
;3816:	{
line 3817
;3817:		trap_Cvar_SetValue("inven_silencer", 0);
ADDRGP4 $1941
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3818
;3818:		trap_Cvar_SetValue("inven_duckbill", 0);
ADDRGP4 $1940
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3820
;3819:
;3820:		if ( BG_WeaponMods( primary ) & ( 1 << WM_SILENCER ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $2285
line 3821
;3821:			trap_Cvar_SetValue("inven_silencer", 1);
ADDRGP4 $1941
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
ADDRGP4 $2286
JUMPV
LABELV $2285
line 3822
;3822:		else if ( BG_WeaponMods( primary ) & ( 1 << WM_DUCKBILL ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2287
line 3823
;3823:			trap_Cvar_SetValue("inven_duckbill", 1);		
ADDRGP4 $1940
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
LABELV $2287
LABELV $2286
line 3824
;3824:	} 
LABELV $2284
LABELV $2280
line 3825
;3825:	return qtrue;
CNSTI4 1
RETI4
LABELV $2278
endproc CG_HandleWeaponPrimaryAddon1 96 12
proc CG_HandleWeaponPrimaryAddon2 108 12
line 3828
;3826:}
;3827:  
;3828:static qboolean CG_HandleWeaponPrimaryAddon2( int flags, float *special, int key ) {
line 3833
;3829: 	int			bayonet,gl,flashlight;
;3830:	char		var[64];
;3831:	int			primary;
;3832:
;3833:	trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3834
;3834:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ASGNI4
line 3836
;3835:
;3836:	trap_Cvar_VariableStringBuffer("inven_grenadelauncher", var , sizeof(var ) );
ADDRGP4 $1966
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3837
;3837:	gl = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 84
INDIRI4
ASGNI4
line 3839
;3838:
;3839:	trap_Cvar_VariableStringBuffer("inven_bayonet", var , sizeof(var ) );
ADDRGP4 $1967
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3840
;3840:	bayonet = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 88
INDIRI4
ASGNI4
line 3842
;3841:
;3842:	trap_Cvar_VariableStringBuffer("inven_flashlight", var , sizeof(var ) );
ADDRGP4 $1968
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3843
;3843:	flashlight = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 92
INDIRI4
ASGNI4
line 3846
;3844:
;3845: 
;3846: 	if ( gl )
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $2290
line 3847
;3847:	{
line 3848
;3848:		trap_Cvar_SetValue("inven_grenadelauncher", 0);
ADDRGP4 $1966
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3849
;3849:		if ( BG_WeaponMods( primary ) & ( 1 << WM_BAYONET ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2292
line 3850
;3850:		{
line 3851
;3851:			trap_Cvar_SetValue("inven_bayonet", 1);
ADDRGP4 $1967
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3852
;3852:			trap_Cvar_SetValue("inven_flashlight", 0); 
ADDRGP4 $1968
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3853
;3853:		}
ADDRGP4 $2291
JUMPV
LABELV $2292
line 3854
;3854:		else if ( 0 ) // BG_WeaponMods( primary ) & ( 1 << WM_FLASHLIGHT ) )
ADDRGP4 $2294
JUMPV
line 3855
;3855:		{
line 3856
;3856:			trap_Cvar_SetValue("inven_bayonet", 0);
ADDRGP4 $1967
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3857
;3857:			trap_Cvar_SetValue("inven_flashlight", 1); 
ADDRGP4 $1968
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3858
;3858:		}
ADDRGP4 $2291
JUMPV
LABELV $2294
line 3860
;3859:		else
;3860:		{
line 3861
;3861:			trap_Cvar_SetValue("inven_flashlight", 0); 
ADDRGP4 $1968
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3862
;3862:			trap_Cvar_SetValue("inven_bayonet", 0);
ADDRGP4 $1967
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3863
;3863:		}
line 3864
;3864:	}
ADDRGP4 $2291
JUMPV
LABELV $2290
line 3865
;3865:	else if ( bayonet )
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $2296
line 3866
;3866:	{
line 3867
;3867:		trap_Cvar_SetValue("inven_grenadelauncher", 0);
ADDRGP4 $1966
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3868
;3868:		trap_Cvar_SetValue("inven_bayonet", 0 );
ADDRGP4 $1967
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3869
;3869:		if ( BG_WeaponMods( primary ) & ( 1 << WM_FLASHLIGHT ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2298
line 3870
;3870:			trap_Cvar_SetValue("inven_flashlight", 1);  
ADDRGP4 $1968
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
ADDRGP4 $2297
JUMPV
LABELV $2298
line 3872
;3871:		else
;3872:			trap_Cvar_SetValue("inven_flashlight", 0); 
ADDRGP4 $1968
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3873
;3873:	}
ADDRGP4 $2297
JUMPV
LABELV $2296
line 3874
;3874:	else if ( flashlight )
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $2300
line 3875
;3875:	{
line 3876
;3876:		trap_Cvar_SetValue("inven_grenadelauncher", 0);
ADDRGP4 $1966
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3877
;3877:		trap_Cvar_SetValue("inven_bayonet", 0);
ADDRGP4 $1967
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3878
;3878:		trap_Cvar_SetValue("inven_flashlight", 0); 
ADDRGP4 $1968
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3879
;3879:	}
ADDRGP4 $2301
JUMPV
LABELV $2300
line 3881
;3880:	else
;3881:	{
line 3882
;3882:		trap_Cvar_SetValue("inven_grenadelauncher", 0);
ADDRGP4 $1966
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3883
;3883:		trap_Cvar_SetValue("inven_bayonet", 0);
ADDRGP4 $1967
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3884
;3884:		trap_Cvar_SetValue("inven_flashlight", 0); 
ADDRGP4 $1968
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3886
;3885:
;3886:		if ( BG_WeaponMods( primary ) & ( 1 << WM_GRENADELAUNCHER ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2302
line 3887
;3887:			trap_Cvar_SetValue("inven_grenadelauncher", 1 );
ADDRGP4 $1966
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
ADDRGP4 $2303
JUMPV
LABELV $2302
line 3888
;3888:		else if ( BG_WeaponMods( primary ) & ( 1 << WM_BAYONET ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2304
line 3889
;3889:			trap_Cvar_SetValue("inven_bayonet", 1 );
ADDRGP4 $1967
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
ADDRGP4 $2305
JUMPV
LABELV $2304
line 3890
;3890:		else if ( BG_WeaponMods( primary ) & ( 1 << WM_FLASHLIGHT ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2306
line 3891
;3891:			trap_Cvar_SetValue("inven_flashlight", 1 );
ADDRGP4 $1968
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
LABELV $2306
LABELV $2305
LABELV $2303
line 3892
;3892:	} 
LABELV $2301
LABELV $2297
LABELV $2291
line 3893
;3893:	return qtrue;
CNSTI4 1
RETI4
LABELV $2289
endproc CG_HandleWeaponPrimaryAddon2 108 12
proc CG_HandleWeaponPrimaryAddon3 104 12
line 3896
;3894:}
;3895:
;3896:static qboolean CG_HandleWeaponPrimaryAddon3( int flags, float *special, int key ) {
line 3901
;3897: 	int			laser,scope,nvgscope;
;3898:	char		var[64];
;3899:	int			primary;
;3900:
;3901:	trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3902
;3902:	primary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ASGNI4
line 3904
;3903:
;3904:	trap_Cvar_VariableStringBuffer("inven_lasersight", var , sizeof(var ) );
ADDRGP4 $1996
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3905
;3905:	laser = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 84
INDIRI4
ASGNI4
line 3907
;3906:
;3907:	trap_Cvar_VariableStringBuffer("inven_scope", var , sizeof(var ) );
ADDRGP4 $1997
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3908
;3908:	scope = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 88
INDIRI4
ASGNI4
line 3910
;3909:
;3910:	trap_Cvar_VariableStringBuffer("inven_nvgscope", var , sizeof(var ) );
ADDRGP4 $1998
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3911
;3911:	nvgscope = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 92
INDIRI4
ASGNI4
line 3913
;3912: 
;3913: 	if ( laser )
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $2309
line 3914
;3914:	{
line 3915
;3915:		trap_Cvar_SetValue("inven_lasersight", 0);
ADDRGP4 $1996
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3917
;3916:
;3917:		if ( BG_WeaponMods( primary ) & ( 1 << WM_SCOPE ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $2311
line 3918
;3918:		{
line 3919
;3919:			trap_Cvar_SetValue("inven_scope", 1);
ADDRGP4 $1997
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3920
;3920:			trap_Cvar_SetValue("inven_nvgscope", 0); 
ADDRGP4 $1998
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3921
;3921:		}
ADDRGP4 $2310
JUMPV
LABELV $2311
line 3922
;3922:		else  if ( 0 ) // BG_WeaponMods( primary ) & ( 1 << WM_NVGSCOPE ) )
ADDRGP4 $2313
JUMPV
line 3923
;3923:		{
line 3924
;3924:			trap_Cvar_SetValue("inven_scope", 0);
ADDRGP4 $1997
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3925
;3925:			trap_Cvar_SetValue("inven_nvgscope", 1); 
ADDRGP4 $1998
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3926
;3926:		}
ADDRGP4 $2310
JUMPV
LABELV $2313
line 3928
;3927:		else 
;3928:		{
line 3929
;3929:			trap_Cvar_SetValue("inven_scope", 0);
ADDRGP4 $1997
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3930
;3930:			trap_Cvar_SetValue("inven_nvgscope", 0); 
ADDRGP4 $1998
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3931
;3931:		}
line 3932
;3932:	}
ADDRGP4 $2310
JUMPV
LABELV $2309
line 3933
;3933:	else if ( scope )
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $2315
line 3934
;3934:	{
line 3935
;3935:		trap_Cvar_SetValue("inven_lasersight", 0);
ADDRGP4 $1996
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3936
;3936:		trap_Cvar_SetValue("inven_scope", 0);
ADDRGP4 $1997
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3938
;3937:
;3938:		if ( 0 ) // BG_WeaponMods( primary ) & ( 1 << WM_NVGSCOPE ) )
ADDRGP4 $2317
JUMPV
line 3939
;3939:		{
line 3940
;3940:			trap_Cvar_SetValue("inven_scope", 0);
ADDRGP4 $1997
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3941
;3941:			trap_Cvar_SetValue("inven_nvgscope", 1); 
ADDRGP4 $1998
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3942
;3942:		}
ADDRGP4 $2316
JUMPV
LABELV $2317
line 3944
;3943:		else
;3944:		{
line 3945
;3945:			trap_Cvar_SetValue("inven_nvgscope", 0); 
ADDRGP4 $1998
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3946
;3946:			trap_Cvar_SetValue("inven_scope", 0);
ADDRGP4 $1997
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3947
;3947:		}
line 3949
;3948:		
;3949:	}
ADDRGP4 $2316
JUMPV
LABELV $2315
line 3950
;3950:	else if ( nvgscope )
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $2319
line 3951
;3951:	{
line 3952
;3952:		trap_Cvar_SetValue("inven_lasersight", 0);
ADDRGP4 $1996
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3953
;3953:		trap_Cvar_SetValue("inven_scope", 0);
ADDRGP4 $1997
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3954
;3954:		trap_Cvar_SetValue("inven_nvgscope", 0); 
ADDRGP4 $1998
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3955
;3955:	}
ADDRGP4 $2320
JUMPV
LABELV $2319
line 3957
;3956:	else
;3957:	{
line 3959
;3958:
;3959:		trap_Cvar_SetValue("inven_lasersight", 0);
ADDRGP4 $1996
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3960
;3960:		trap_Cvar_SetValue("inven_scope", 0);
ADDRGP4 $1997
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3961
;3961:		trap_Cvar_SetValue("inven_nvgscope", 0); 
ADDRGP4 $1998
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3963
;3962:
;3963:		if ( BG_WeaponMods( primary ) & ( 1 << WM_SCOPE ) ) 
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $2321
line 3964
;3964:			trap_Cvar_SetValue("inven_scope", 1);  
ADDRGP4 $1997
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
ADDRGP4 $2322
JUMPV
LABELV $2321
line 3965
;3965:		else  if ( 0 ) // BG_WeaponMods( primary ) & ( 1 << WM_NVGSCOPE ) ) 
ADDRGP4 $2323
JUMPV
line 3966
;3966:			trap_Cvar_SetValue("inven_nvgscope", 1);  
ADDRGP4 $1998
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
ADDRGP4 $2324
JUMPV
LABELV $2323
line 3967
;3967:		else  if ( BG_WeaponMods( primary ) & ( 1 << WM_LASER ) ) 
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2325
line 3968
;3968:			trap_Cvar_SetValue("inven_lasersight", 1);  
ADDRGP4 $1996
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
LABELV $2325
LABELV $2324
LABELV $2322
line 3969
;3969:	} 
LABELV $2320
LABELV $2316
LABELV $2310
line 3970
;3970:	return qtrue;
CNSTI4 1
RETI4
LABELV $2308
endproc CG_HandleWeaponPrimaryAddon3 104 12
proc CG_HandleWeaponSecondaryAddon1 84 12
line 3975
;3971:}
;3972: 
;3973:
;3974:
;3975:static qboolean CG_HandleWeaponSecondaryAddon1( int flags, float *special, int key ) {
line 3980
;3976: 	int			silencer ;
;3977:	char		var[64];
;3978:	int			secondary; 
;3979:
;3980:	trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof(var ) );
ADDRGP4 $2023
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3981
;3981:	secondary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 3983
;3982:
;3983:	trap_Cvar_VariableStringBuffer("inven_silencer_secondary", var , sizeof(var ) );
ADDRGP4 $2022
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3984
;3984:	silencer = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 76
INDIRI4
ASGNI4
line 3987
;3985: 
;3986:
;3987: 	if ( silencer )
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $2328
line 3988
;3988:	{
line 3989
;3989:		trap_Cvar_SetValue("inven_silencer_secondary", 0); 
ADDRGP4 $2022
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3990
;3990:	} 
ADDRGP4 $2329
JUMPV
LABELV $2328
line 3992
;3991:	else
;3992:	{
line 3993
;3993:		trap_Cvar_SetValue("inven_silencer_secondary", 0); 
ADDRGP4 $2022
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3995
;3994:
;3995:		if (BG_WeaponMods(secondary) & ( 1 << WM_SILENCER ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $2330
line 3996
;3996:			trap_Cvar_SetValue("inven_silencer_secondary", 1); 		
ADDRGP4 $2022
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
LABELV $2330
line 3997
;3997:	} 
LABELV $2329
line 3998
;3998:	return qtrue;
CNSTI4 1
RETI4
LABELV $2327
endproc CG_HandleWeaponSecondaryAddon1 84 12
proc CG_HandleWeaponSecondaryAddon2 84 12
line 4000
;3999:}
;4000:static qboolean CG_HandleWeaponSecondaryAddon2( int flags, float *special, int key ) {
line 4005
;4001: 	int			laser ;
;4002:	char		var[64];
;4003: 	int			secondary; 
;4004:
;4005:	trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof(var ) );
ADDRGP4 $2023
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4006
;4006:	secondary = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 4008
;4007:
;4008:	trap_Cvar_VariableStringBuffer("inven_lasersight_secondary", var , sizeof(var ) );
ADDRGP4 $2032
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4009
;4009:	laser = atoi(var);
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 76
INDIRI4
ASGNI4
line 4011
;4010:
;4011: 	if ( laser )
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $2333
line 4012
;4012:	{
line 4013
;4013:		trap_Cvar_SetValue("inven_lasersight_secondary", 0); 
ADDRGP4 $2032
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4014
;4014:	} 
ADDRGP4 $2334
JUMPV
LABELV $2333
line 4016
;4015:	else
;4016:	{
line 4017
;4017:		trap_Cvar_SetValue("inven_lasersight_secondary", 0); 
ADDRGP4 $2032
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4019
;4018:
;4019:		if (BG_WeaponMods(secondary) & ( 1 << WM_LASER ) )
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2335
line 4020
;4020:			trap_Cvar_SetValue("inven_lasersight_secondary", 1); 		
ADDRGP4 $2032
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
LABELV $2335
line 4021
;4021:	} 
LABELV $2334
line 4022
;4022:	return qtrue;
CNSTI4 1
RETI4
LABELV $2332
endproc CG_HandleWeaponSecondaryAddon2 84 12
export CG_GetTotalXPforLevel
proc CG_GetTotalXPforLevel 8 0
line 4028
;4023:}
;4024:  
;4025:#define TIME_FIRSTUPDATE	1000
;4026:
;4027:int CG_GetTotalXPforLevel( int level )
;4028:{
line 4029
;4029:	int total=0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4032
;4030:	int i;
;4031:
;4032:	for (i=0;i<level;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2341
JUMPV
LABELV $2338
line 4033
;4033:	{
line 4034
;4034:		if ( i <= 1 )
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $2342
line 4035
;4035:			continue;
ADDRGP4 $2339
JUMPV
LABELV $2342
line 4037
;4036:
;4037:		total += i;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 4038
;4038:	}
LABELV $2339
line 4032
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2341
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $2338
line 4039
;4039:	return total;
ADDRLP4 4
INDIRI4
RETI4
LABELV $2337
endproc CG_GetTotalXPforLevel 8 0
export CG_FreeXP
proc CG_FreeXP 92 8
line 4042
;4040:}
;4041:
;4042:void CG_FreeXP( void ) {
line 4046
;4043:	int accuracy, strength, stamina, stealth, technical, speed, xp;
;4044:	int i;
;4045:
;4046:	xp = trap_Cvar_VariableValue("ui_gamestate");
ADDRGP4 $327
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 4047
;4047:	if (xp == STATE_LOCKED) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $2345
line 4048
;4048:		trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_no.wav" , qfalse ) , CHAN_LOCAL );
ADDRGP4 $2347
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4049
;4049:		return;
ADDRGP4 $2344
JUMPV
LABELV $2345
line 4051
;4050:	}
;4051:	accuracy = trap_Cvar_VariableValue("ui_char_accuracy");
ADDRGP4 $321
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 4052
;4052:	strength = trap_Cvar_VariableValue("ui_char_strength");
ADDRGP4 $322
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 4053
;4053:	stamina = trap_Cvar_VariableValue("ui_char_stamina");
ADDRGP4 $323
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 4054
;4054:	stealth = trap_Cvar_VariableValue("ui_char_stealth");
ADDRGP4 $324
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 4055
;4055:	technical = trap_Cvar_VariableValue("ui_char_technical");
ADDRGP4 $325
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 52
INDIRF4
CVFI4 4
ASGNI4
line 4056
;4056:	speed = trap_Cvar_VariableValue("ui_char_speed");
ADDRGP4 $326
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 4057
;4057:	xp = trap_Cvar_VariableValue("ui_char_xp");
ADDRGP4 $318
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 60
INDIRF4
CVFI4 4
ASGNI4
line 4059
;4058:
;4059:	for (i = accuracy; i>1; i--) xp += i;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $2351
JUMPV
LABELV $2348
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
LABELV $2349
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2351
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $2348
line 4060
;4060:	for (i = strength; i>1; i--) xp += i;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $2355
JUMPV
LABELV $2352
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
LABELV $2353
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2355
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $2352
line 4061
;4061:	for (i = stamina; i>1; i--) xp += i;
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 $2359
JUMPV
LABELV $2356
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
LABELV $2357
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2359
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $2356
line 4062
;4062:	for (i = stealth; i>1; i--) xp += i;
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $2363
JUMPV
LABELV $2360
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
LABELV $2361
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2363
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $2360
line 4063
;4063:	for (i = technical; i>1; i--) xp += i;
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $2367
JUMPV
LABELV $2364
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
LABELV $2365
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2367
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $2364
line 4064
;4064:	for (i = speed; i>1; i--) xp += i;
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $2371
JUMPV
LABELV $2368
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
LABELV $2369
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2371
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $2368
line 4066
;4065:
;4066:	trap_Cvar_Set("ui_char_xp", va("%i", xp));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $318
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4067
;4067:	trap_Cvar_Set("ui_char_accuracy", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $321
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4068
;4068:	trap_Cvar_Set("ui_char_strength", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $322
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4069
;4069:	trap_Cvar_Set("ui_char_stamina", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $323
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4070
;4070:	trap_Cvar_Set("ui_char_stealth", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $324
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4071
;4071:	trap_Cvar_Set("ui_char_technical", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $325
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4072
;4072:	trap_Cvar_Set("ui_char_speed", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $326
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4073
;4073:}
LABELV $2344
endproc CG_FreeXP 92 8
export CG_CopyCharacterVariables
proc CG_CopyCharacterVariables 88 8
line 4075
;4074:
;4075:void CG_CopyCharacterVariables( void ) {
line 4078
;4076:	int acc, str, sta, ste, tec, spe, xp;
;4077:	
;4078:	acc = trap_Cvar_VariableValue("char_accuracy");
ADDRGP4 $680
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 4079
;4079:	str = trap_Cvar_VariableValue("char_strength");
ADDRGP4 $681
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 4080
;4080:	sta = trap_Cvar_VariableValue("char_stamina");
ADDRGP4 $683
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 4081
;4081:	ste = trap_Cvar_VariableValue("char_stealth");
ADDRGP4 $682
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 4082
;4082:	tec = trap_Cvar_VariableValue("char_technical");
ADDRGP4 $684
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 4083
;4083:	spe = trap_Cvar_VariableValue("char_speed");
ADDRGP4 $685
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 4084
;4084:	xp = trap_Cvar_VariableValue("char_xp");
ADDRGP4 $657
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 52
INDIRF4
CVFI4 4
ASGNI4
line 4085
;4085:	trap_Cvar_Set("ui_char_accuracy", va("%i", acc));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $321
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4086
;4086:	trap_Cvar_Set("ui_char_strength", va("%i", str));
ADDRGP4 $662
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $322
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4087
;4087:	trap_Cvar_Set("ui_char_stamina", va("%i", sta));
ADDRGP4 $662
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $323
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4088
;4088:	trap_Cvar_Set("ui_char_stealth", va("%i", ste));
ADDRGP4 $662
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $324
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4089
;4089:	trap_Cvar_Set("ui_char_technical", va("%i", tec));
ADDRGP4 $662
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $325
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4090
;4090:	trap_Cvar_Set("ui_char_speed", va("%i", spe));
ADDRGP4 $662
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $326
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4091
;4091:	trap_Cvar_Set("ui_char_xp", va("%i", xp));
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $318
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4092
;4092:	trap_Cvar_Set("ui_char_old_xp", va("%i", xp));
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $320
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4093
;4093:}
LABELV $2372
endproc CG_CopyCharacterVariables 88 8
export CG_CopyCharacterVariablesBack
proc CG_CopyCharacterVariablesBack 76 8
line 4095
;4094:
;4095:void CG_CopyCharacterVariablesBack( void ) {
line 4098
;4096:	int acc, str, sta, ste, tec, spe, xp;
;4097:	
;4098:	acc = trap_Cvar_VariableValue("ui_char_accuracy");
ADDRGP4 $321
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 4099
;4099:	str = trap_Cvar_VariableValue("ui_char_strength");
ADDRGP4 $322
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 4100
;4100:	sta = trap_Cvar_VariableValue("ui_char_stamina");
ADDRGP4 $323
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 4101
;4101:	ste = trap_Cvar_VariableValue("ui_char_stealth");
ADDRGP4 $324
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 4102
;4102:	tec = trap_Cvar_VariableValue("ui_char_technical");
ADDRGP4 $325
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 4103
;4103:	spe = trap_Cvar_VariableValue("ui_char_speed");
ADDRGP4 $326
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 4104
;4104:	trap_Cvar_Set("char_accuracy", va("%i", acc));
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $680
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4105
;4105:	trap_Cvar_Set("char_strength", va("%i", str));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $681
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4106
;4106:	trap_Cvar_Set("char_stamina", va("%i", sta));
ADDRGP4 $662
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $683
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4107
;4107:	trap_Cvar_Set("char_stealth", va("%i", ste));
ADDRGP4 $662
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $682
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4108
;4108:	trap_Cvar_Set("char_technical", va("%i", tec));
ADDRGP4 $662
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $684
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4109
;4109:	trap_Cvar_Set("char_speed", va("%i", spe));
ADDRGP4 $662
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $685
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4110
;4110:}
LABELV $2373
endproc CG_CopyCharacterVariablesBack 76 8
export CG_SetCharacter
proc CG_SetCharacter 44 12
line 4113
;4111:
;4112:void CG_SetCharacter ( void )
;4113:{
line 4117
;4114:	int xp;
;4115:	char buff[16];
;4116:
;4117:	memset( &buff, 0, sizeof( buff ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4119
;4118:
;4119:	buff[0] = 'C';
ADDRLP4 0
CNSTI1 67
ASGNI1
line 4120
;4120:	buff[PC_STRENGTH] = 48+trap_Cvar_VariableValue("char_strength");
ADDRGP4 $681
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+1
ADDRLP4 20
INDIRF4
CNSTF4 1111490560
ADDF4
CVFI4 4
CVII1 4
ASGNI1
line 4121
;4121:	buff[PC_TECHNICAL] = 48+trap_Cvar_VariableValue("char_technical");
ADDRGP4 $684
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+2
ADDRLP4 24
INDIRF4
CNSTF4 1111490560
ADDF4
CVFI4 4
CVII1 4
ASGNI1
line 4122
;4122:	buff[PC_STAMINA] = 48+trap_Cvar_VariableValue("char_stamina");
ADDRGP4 $683
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+3
ADDRLP4 28
INDIRF4
CNSTF4 1111490560
ADDF4
CVFI4 4
CVII1 4
ASGNI1
line 4123
;4123:	buff[PC_ACCURACY] = 48+trap_Cvar_VariableValue("char_accuracy");
ADDRGP4 $680
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRF4
CNSTF4 1111490560
ADDF4
CVFI4 4
CVII1 4
ASGNI1
line 4124
;4124:	buff[PC_SPEED] = 48+trap_Cvar_VariableValue("char_speed");
ADDRGP4 $685
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+5
ADDRLP4 36
INDIRF4
CNSTF4 1111490560
ADDF4
CVFI4 4
CVII1 4
ASGNI1
line 4125
;4125:	buff[PC_STEALTH] = 48+trap_Cvar_VariableValue("char_stealth");
ADDRGP4 $682
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+6
ADDRLP4 40
INDIRF4
CNSTF4 1111490560
ADDF4
CVFI4 4
CVII1 4
ASGNI1
line 4126
;4126:	buff[7] = '\0';
ADDRLP4 0+7
CNSTI1 0
ASGNI1
line 4128
;4127: 
;4128:	trap_Cvar_Set("ui_character", buff);
ADDRGP4 $316
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4129
;4129:	trap_Cvar_Set("character", buff);
ADDRGP4 $2382
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4131
;4130:			
;4131:}
LABELV $2374
endproc CG_SetCharacter 44 12
export CG_InitialCharacterVariables
proc CG_InitialCharacterVariables 40 8
line 4133
;4132:
;4133:void CG_InitialCharacterVariables( void ) {
line 4135
;4134:	// reset the ui variables
;4135:	trap_Cvar_Set("ui_char_xp", va("%i", -1));
ADDRGP4 $662
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $318
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4136
;4136:	trap_Cvar_Set("ui_char_old_xp", va("%i", -1));
ADDRGP4 $662
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $320
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4137
;4137:	trap_Cvar_Set("char_xp", va("%i", 0));
ADDRGP4 $662
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $657
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4138
;4138:	trap_Cvar_Set("ui_char_accuracy", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $321
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4139
;4139:	trap_Cvar_Set("ui_char_speed", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $326
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4140
;4140:	trap_Cvar_Set("ui_char_strength", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $322
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4141
;4141:	trap_Cvar_Set("ui_char_stamina", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $323
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4142
;4142:	trap_Cvar_Set("ui_char_stealth", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $324
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4143
;4143:	trap_Cvar_Set("ui_char_technical", va("%i", 1));
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $325
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4144
;4144:	trap_Cvar_Set("ui_gamestate", va("%i", 0));
ADDRGP4 $662
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $327
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4145
;4145:}
LABELV $2383
endproc CG_InitialCharacterVariables 40 8
proc CG_HandleGrenadeButton 88 8
line 4147
;4146:
;4147:static qboolean CG_HandleGrenadeButton( int flags, float *special, int key ) {
line 4150
;4148:	int flash, smoke, mk26, gren40mm;
;4149:	
;4150:	if (key != K_MOUSE1 && key != K_MOUSE2 ) return qfalse;
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 178
EQI4 $2385
ADDRLP4 16
INDIRI4
CNSTI4 179
EQI4 $2385
CNSTI4 0
RETI4
ADDRGP4 $2384
JUMPV
LABELV $2385
line 4152
;4151:
;4152:	flash = trap_Cvar_VariableValue("inven_ammo_flash");
ADDRGP4 $724
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 4154
;4153:
;4154:	smoke = trap_Cvar_VariableValue("inven_ammo_smoke");
ADDRGP4 $725
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 4156
;4155:
;4156:	mk26 = trap_Cvar_VariableValue("inven_ammo_mk26");
ADDRGP4 $727
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 4158
;4157:	
;4158:	gren40mm = trap_Cvar_VariableValue("inven_ammo_40mmgren");
ADDRGP4 $726
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 4160
;4159:
;4160:	switch ( flags ) {
ADDRLP4 36
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 330
LTI4 $2387
ADDRLP4 36
INDIRI4
CNSTI4 333
GTI4 $2387
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2437-1320
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2437
address $2389
address $2401
address $2413
address $2425
code
LABELV $2389
line 4163
;4161:	
;4162:		case CG_INVEN_AMMO_FLASH:
;4163:			if ( key == K_MOUSE1 ) flash++; else flash--; 
ADDRFP4 8
INDIRI4
CNSTI4 178
NEI4 $2390
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2391
JUMPV
LABELV $2390
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2391
line 4165
;4164:			
;4165:			if (flash < 0) flash = 0; if (flash > 2) flash = 2;
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2392
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2392
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $2394
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $2394
line 4167
;4166:			
;4167:			if (flash + smoke + mk26 + gren40mm > SEALS_MAX_GRENADES ) flash--;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 4
LEI4 $2396
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2396
line 4169
;4168:
;4169:			if (flash < 0 || (flash + smoke + mk26 + gren40mm > SEALS_MAX_GRENADES) ) {
ADDRLP4 40
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $2400
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 4
LEI4 $2398
LABELV $2400
line 4170
;4170:				trap_Cvar_Set( "inven_ammo_flash", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $724
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4171
;4171:				trap_Cvar_Set( "inven_ammo_mk26", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $727
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4172
;4172:				trap_Cvar_Set( "inven_ammo_40mmgren", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $726
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4173
;4173:				trap_Cvar_Set( "inven_ammo_smoke", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $725
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4174
;4174:				trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_no.wav" , qfalse ) , CHAN_LOCAL );
ADDRGP4 $2347
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 60
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4175
;4175:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2384
JUMPV
LABELV $2398
line 4178
;4176:			}
;4177:				
;4178:			trap_Cvar_Set( "inven_ammo_flash", va("%i", flash) );
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $724
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4180
;4179:
;4180:			break;
ADDRGP4 $2388
JUMPV
LABELV $2401
line 4183
;4181:			
;4182:		case CG_INVEN_AMMO_SMOKE:
;4183:			if ( key == K_MOUSE1 ) smoke++; else smoke--; 
ADDRFP4 8
INDIRI4
CNSTI4 178
NEI4 $2402
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2403
JUMPV
LABELV $2402
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2403
line 4185
;4184:			
;4185:			if (smoke < 0) smoke = 0; if (smoke > 2) smoke = 2;
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2404
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2404
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $2406
ADDRLP4 4
CNSTI4 2
ASGNI4
LABELV $2406
line 4187
;4186:			
;4187:			if (flash + smoke + mk26 + gren40mm > SEALS_MAX_GRENADES ) smoke--;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 4
LEI4 $2408
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2408
line 4189
;4188:
;4189:			if (smoke < 0 || (flash + smoke + mk26 + gren40mm > SEALS_MAX_GRENADES) ) {
ADDRLP4 48
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LTI4 $2412
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 4
LEI4 $2410
LABELV $2412
line 4190
;4190:				trap_Cvar_Set( "inven_ammo_flash", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $724
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4191
;4191:				trap_Cvar_Set( "inven_ammo_mk26", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $727
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4192
;4192:				trap_Cvar_Set( "inven_ammo_40mmgren", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $726
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4193
;4193:				trap_Cvar_Set( "inven_ammo_smoke", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $725
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4194
;4194:				trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_no.wav" , qfalse ) , CHAN_LOCAL );
ADDRGP4 $2347
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4195
;4195:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2384
JUMPV
LABELV $2410
line 4198
;4196:			}
;4197:
;4198:			trap_Cvar_Set( "inven_ammo_smoke", va("%i", smoke) );
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $725
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4200
;4199:
;4200:			break;
ADDRGP4 $2388
JUMPV
LABELV $2413
line 4203
;4201:			
;4202:		case CG_INVEN_AMMO_MK26:
;4203:			if ( key == K_MOUSE1 ) mk26++; else mk26--; 
ADDRFP4 8
INDIRI4
CNSTI4 178
NEI4 $2414
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2415
JUMPV
LABELV $2414
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2415
line 4205
;4204:			
;4205:			if (mk26 < 0) mk26 = 0; if (mk26 > 2) mk26 = 2;
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $2416
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2416
ADDRLP4 8
INDIRI4
CNSTI4 2
LEI4 $2418
ADDRLP4 8
CNSTI4 2
ASGNI4
LABELV $2418
line 4207
;4206:			
;4207:			if (flash + smoke + mk26 + gren40mm > SEALS_MAX_GRENADES ) mk26--;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 4
LEI4 $2420
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2420
line 4209
;4208:
;4209:			if (mk26 < 0 || (flash + smoke + mk26 + gren40mm > SEALS_MAX_GRENADES) ) {
ADDRLP4 56
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
LTI4 $2424
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 56
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 4
LEI4 $2422
LABELV $2424
line 4210
;4210:				trap_Cvar_Set( "inven_ammo_flash", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $724
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4211
;4211:				trap_Cvar_Set( "inven_ammo_mk26", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $727
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4212
;4212:				trap_Cvar_Set( "inven_ammo_40mmgren", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $726
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4213
;4213:				trap_Cvar_Set( "inven_ammo_smoke", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $725
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4214
;4214:				trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_no.wav" , qfalse ) , CHAN_LOCAL );
ADDRGP4 $2347
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4215
;4215:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2384
JUMPV
LABELV $2422
line 4218
;4216:			}
;4217:
;4218:			trap_Cvar_Set( "inven_ammo_mk26", va("%i", mk26) );
ADDRGP4 $662
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $727
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4220
;4219:
;4220:			break;
ADDRGP4 $2388
JUMPV
LABELV $2425
line 4223
;4221:			
;4222:		case CG_INVEN_AMMO_40MM:
;4223:			if ( key == K_MOUSE1 ) gren40mm++; else gren40mm--; 
ADDRFP4 8
INDIRI4
CNSTI4 178
NEI4 $2426
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2427
JUMPV
LABELV $2426
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2427
line 4225
;4224:			
;4225:			if (gren40mm < 0) gren40mm = 0; if (gren40mm > 2) gren40mm = 2;
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $2428
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $2428
ADDRLP4 12
INDIRI4
CNSTI4 2
LEI4 $2430
ADDRLP4 12
CNSTI4 2
ASGNI4
LABELV $2430
line 4227
;4226:			
;4227:			if (flash + smoke + mk26 + gren40mm > SEALS_MAX_GRENADES ) gren40mm--;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 4
LEI4 $2432
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2432
line 4229
;4228:
;4229:			if (gren40mm < 0 || (flash + smoke + mk26 + gren40mm > SEALS_MAX_GRENADES) ) {
ADDRLP4 64
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
LTI4 $2436
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 64
INDIRI4
ADDI4
CNSTI4 4
LEI4 $2434
LABELV $2436
line 4230
;4230:				trap_Cvar_Set( "inven_ammo_flash", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $724
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4231
;4231:				trap_Cvar_Set( "inven_ammo_mk26", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $727
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4232
;4232:				trap_Cvar_Set( "inven_ammo_40mmgren", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $726
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4233
;4233:				trap_Cvar_Set( "inven_ammo_smoke", va("%i", 1) );
ADDRGP4 $662
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $725
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4234
;4234:				trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_no.wav" , qfalse ) , CHAN_LOCAL );
ADDRGP4 $2347
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4235
;4235:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2384
JUMPV
LABELV $2434
line 4238
;4236:			}
;4237:
;4238:			trap_Cvar_Set( "inven_ammo_40mmgren", va("%i", gren40mm) );
ADDRGP4 $662
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $726
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4240
;4239:
;4240:			break;
LABELV $2387
LABELV $2388
line 4243
;4241:	}
;4242:		
;4243:	trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_yes.wav", qfalse ) , CHAN_LOCAL );
ADDRGP4 $2439
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4245
;4244:
;4245:	return qtrue;
CNSTI4 1
RETI4
LABELV $2384
endproc CG_HandleGrenadeButton 88 8
proc CG_HandleCharacterButton 56 8
line 4248
;4246:}
;4247:
;4248:static qboolean CG_HandleCharacterButton( int flags, float *special, int key ) {
line 4249
;4249:	int value = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4250
;4250:	int xp = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4252
;4251:
;4252:	xp = trap_Cvar_VariableValue("ui_gamestate");
ADDRGP4 $327
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 4253
;4253:	if (xp == STATE_LOCKED) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $2441
line 4254
;4254:		trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_no.wav" , qfalse ) , CHAN_LOCAL );
ADDRGP4 $2347
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4255
;4255:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2440
JUMPV
LABELV $2441
line 4258
;4256:	}
;4257:	
;4258:	xp = trap_Cvar_VariableValue("ui_char_xp");
ADDRGP4 $318
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 4260
;4259:  
;4260:	if ( key != K_MOUSE1 && key != K_MOUSE2 )
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 178
EQI4 $2443
ADDRLP4 16
INDIRI4
CNSTI4 179
EQI4 $2443
line 4261
;4261:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2440
JUMPV
LABELV $2443
line 4263
;4262:  
;4263:	switch (flags) {
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 287
LTI4 $2445
ADDRLP4 20
INDIRI4
CNSTI4 292
GTI4 $2445
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2453-1148
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2453
address $2447
address $2448
address $2449
address $2450
address $2451
address $2452
code
LABELV $2447
line 4265
;4264:		case CG_CHARACTER_STRENGTH: 
;4265:			value = trap_Cvar_VariableValue("ui_char_strength"); 
ADDRGP4 $322
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 4266
;4266:			break;
ADDRGP4 $2446
JUMPV
LABELV $2448
line 4268
;4267:		case CG_CHARACTER_TECHINCAL: 
;4268:			value = trap_Cvar_VariableValue("ui_char_technical"); 
ADDRGP4 $325
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 4269
;4269:			break;
ADDRGP4 $2446
JUMPV
LABELV $2449
line 4271
;4270:		case CG_CHARACTER_STAMINA: 
;4271:			value = trap_Cvar_VariableValue("ui_char_stamina"); 
ADDRGP4 $323
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 4272
;4272:			break;
ADDRGP4 $2446
JUMPV
LABELV $2450
line 4274
;4273:		case CG_CHARACTER_ACCURACY: 
;4274:			value = trap_Cvar_VariableValue("ui_char_accuracy"); 
ADDRGP4 $321
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 4275
;4275:			break;
ADDRGP4 $2446
JUMPV
LABELV $2451
line 4277
;4276:		case CG_CHARACTER_SPEED: 
;4277:			value = trap_Cvar_VariableValue("ui_char_speed"); 
ADDRGP4 $326
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 4278
;4278:			break;
ADDRGP4 $2446
JUMPV
LABELV $2452
line 4280
;4279:		case CG_CHARACTER_STEALTH: 
;4280:			value = trap_Cvar_VariableValue("ui_char_stealth"); 
ADDRGP4 $324
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 4281
;4281:			break;
ADDRGP4 $2446
JUMPV
LABELV $2445
line 4282
;4282:		default: return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2440
JUMPV
LABELV $2446
line 4286
;4283:	}
;4284:  
;4285:	// cannot manipulate XP
;4286:	if ( ( value >= 10 && key == K_MOUSE1 ) ||
ADDRLP4 4
INDIRI4
CNSTI4 10
LTI4 $2458
ADDRFP4 8
INDIRI4
CNSTI4 178
EQI4 $2459
LABELV $2458
ADDRLP4 4
INDIRI4
CNSTI4 1
GTI4 $2460
ADDRFP4 8
INDIRI4
CNSTI4 179
EQI4 $2459
LABELV $2460
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $2455
ADDRFP4 8
INDIRI4
CNSTI4 178
NEI4 $2455
LABELV $2459
line 4288
;4287:			 ( value <= 1  && key == K_MOUSE2 ) ||
;4288:			 ( xp <= value && key == K_MOUSE1 ) ) {
line 4289
;4289:		trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_no.wav" , qfalse ) , CHAN_LOCAL );
ADDRGP4 $2347
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4290
;4290:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2440
JUMPV
LABELV $2455
line 4293
;4291:	}
;4292:
;4293:	if (xp > value && key == K_MOUSE1) {     
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $2461
ADDRFP4 8
INDIRI4
CNSTI4 178
NEI4 $2461
line 4294
;4294:		value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4295
;4295:		xp -= value;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 4296
;4296:		trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_yes.wav", qfalse ) , CHAN_LOCAL );
ADDRGP4 $2439
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4297
;4297:	} else if (key == K_MOUSE2) {
ADDRGP4 $2462
JUMPV
LABELV $2461
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2463
line 4298
;4298:		xp += value;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 4299
;4299:		value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4300
;4300:		trap_S_StartLocalSound( trap_S_RegisterSound( "ui/assets/menu_yes.wav", qfalse ) , CHAN_LOCAL );
ADDRGP4 $2439
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 4301
;4301:	}
LABELV $2463
LABELV $2462
line 4303
;4302:
;4303:	trap_Cvar_Set("ui_char_xp", va("%i", xp));
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $318
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4305
;4304:
;4305:	switch (flags) {
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 287
LTI4 $2465
ADDRLP4 28
INDIRI4
CNSTI4 292
GTI4 $2465
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2473-1148
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2473
address $2467
address $2468
address $2469
address $2470
address $2471
address $2472
code
LABELV $2467
line 4307
;4306:		case CG_CHARACTER_STRENGTH: 
;4307:			trap_Cvar_Set("ui_char_strength", va("%i", value));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $322
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4308
;4308:			break;
ADDRGP4 $2466
JUMPV
LABELV $2468
line 4310
;4309:		case CG_CHARACTER_TECHINCAL:
;4310:			trap_Cvar_Set("ui_char_technical", va("%i", value));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $325
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4311
;4311:			break;
ADDRGP4 $2466
JUMPV
LABELV $2469
line 4313
;4312:		case CG_CHARACTER_STAMINA:
;4313:			trap_Cvar_Set("ui_char_stamina", va("%i", value));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $323
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4314
;4314:			break;
ADDRGP4 $2466
JUMPV
LABELV $2470
line 4316
;4315:		case CG_CHARACTER_ACCURACY:
;4316:			trap_Cvar_Set("ui_char_accuracy", va("%i", value));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $321
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4317
;4317:			break;
ADDRGP4 $2466
JUMPV
LABELV $2471
line 4319
;4318:		case CG_CHARACTER_SPEED:
;4319:			trap_Cvar_Set("ui_char_speed", va("%i", value));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $326
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4320
;4320:			break;
ADDRGP4 $2466
JUMPV
LABELV $2472
line 4322
;4321:		case CG_CHARACTER_STEALTH:
;4322:			trap_Cvar_Set("ui_char_stealth", va("%i", value));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $324
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4323
;4323:			break;
LABELV $2465
LABELV $2466
line 4326
;4324:	}
;4325:
;4326:	return qtrue; 
CNSTI4 1
RETI4
LABELV $2440
endproc CG_HandleCharacterButton 56 8
proc UI_Handicap_HandleKey 20 12
line 4330
;4327:}
;4328: 
;4329:
;4330:static qboolean UI_Handicap_HandleKey(int flags, float *special, int key) {
line 4331
;4331:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2480
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2480
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2480
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2476
LABELV $2480
line 4333
;4332:    int h;
;4333:    h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $1000
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 4334
;4334:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2481
line 4335
;4335:	    h -= 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 4336
;4336:		} else {
ADDRGP4 $2482
JUMPV
LABELV $2481
line 4337
;4337:	    h += 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 4338
;4338:		}
LABELV $2482
line 4339
;4339:    if (h > 100) {
ADDRLP4 4
INDIRI4
CNSTI4 100
LEI4 $2483
line 4340
;4340:      h = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 4341
;4341:    } else if (h < 0) {
ADDRGP4 $2484
JUMPV
LABELV $2483
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2485
line 4342
;4342:			h = 100;
ADDRLP4 4
CNSTI4 100
ASGNI4
line 4343
;4343:		}
LABELV $2485
LABELV $2484
line 4344
;4344:  	trap_Cvar_Set( "handicap", va( "%i", h) );
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1000
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4345
;4345:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2475
JUMPV
LABELV $2476
line 4347
;4346:  }
;4347:  return qfalse;
CNSTI4 0
RETI4
LABELV $2475
endproc UI_Handicap_HandleKey 20 12
proc UI_Effects_HandleKey 8 8
line 4350
;4348:}
;4349:
;4350:static qboolean UI_Effects_HandleKey(int flags, float *special, int key) {
line 4351
;4351:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2492
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2492
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2492
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2488
LABELV $2492
line 4353
;4352:
;4353:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2493
line 4354
;4354:	    uiInfo.effectsColor--;
ADDRLP4 4
ADDRGP4 uiInfo+136384
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4355
;4355:		} else {
ADDRGP4 $2494
JUMPV
LABELV $2493
line 4356
;4356:	    uiInfo.effectsColor++;
ADDRLP4 4
ADDRGP4 uiInfo+136384
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4357
;4357:		}
LABELV $2494
line 4359
;4358:
;4359:    if( uiInfo.effectsColor > 6 ) {
ADDRGP4 uiInfo+136384
INDIRI4
CNSTI4 6
LEI4 $2497
line 4360
;4360:	  	uiInfo.effectsColor = 0;
ADDRGP4 uiInfo+136384
CNSTI4 0
ASGNI4
line 4361
;4361:		} else if (uiInfo.effectsColor < 0) {
ADDRGP4 $2498
JUMPV
LABELV $2497
ADDRGP4 uiInfo+136384
INDIRI4
CNSTI4 0
GEI4 $2501
line 4362
;4362:	  	uiInfo.effectsColor = 6;
ADDRGP4 uiInfo+136384
CNSTI4 6
ASGNI4
line 4363
;4363:		}
LABELV $2501
LABELV $2498
line 4365
;4364:
;4365:	  trap_Cvar_SetValue( "color", uitogamecode[uiInfo.effectsColor] );
ADDRGP4 $2505
ARGP4
ADDRGP4 uiInfo+136384
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uitogamecode
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4366
;4366:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2487
JUMPV
LABELV $2488
line 4368
;4367:  }
;4368:  return qfalse;
CNSTI4 0
RETI4
LABELV $2487
endproc UI_Effects_HandleKey 8 8
proc UI_ClanName_HandleKey 16 8
line 4371
;4369:}
;4370:
;4371:static qboolean UI_ClanName_HandleKey(int flags, float *special, int key) {
line 4372
;4372:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2512
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2512
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2512
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2508
LABELV $2512
line 4374
;4373:    int i;
;4374:    i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 4375
;4375:		if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2513
line 4376
;4376:		  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4377
;4377:			uiInfo.teamList[i].cinematic = -1;
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
CNSTI4 -1
ASGNI4
line 4378
;4378:		}
LABELV $2513
line 4379
;4379:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2521
line 4380
;4380:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4381
;4381:		} else {
ADDRGP4 $2522
JUMPV
LABELV $2521
line 4382
;4382:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4383
;4383:		}
LABELV $2522
line 4384
;4384:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
LTI4 $2523
line 4385
;4385:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4386
;4386:    } else if (i < 0) {
ADDRGP4 $2524
JUMPV
LABELV $2523
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2526
line 4387
;4387:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+75296
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4388
;4388:		}
LABELV $2526
LABELV $2524
line 4389
;4389:  	trap_Cvar_Set( "ui_teamName", uiInfo.teamList[i].teamName);
ADDRGP4 $208
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4390
;4390:		updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 4391
;4391:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2507
JUMPV
LABELV $2508
line 4393
;4392:  }
;4393:  return qfalse;
CNSTI4 0
RETI4
LABELV $2507
endproc UI_ClanName_HandleKey 16 8
proc UI_GameType_HandleKey 20 16
line 4396
;4394:}
;4395:
;4396:static qboolean UI_GameType_HandleKey(int flags, float *special, int key, qboolean resetMap) {
line 4397
;4397:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2535
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2535
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2535
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2531
LABELV $2535
line 4398
;4398:		int oldCount = UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 4401
;4399:
;4400:		// hard coded mess here
;4401:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2536
line 4402
;4402:			ui_gameType.integer--;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4403
;4403:			if (ui_gameType.integer == 2) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $2539
line 4404
;4404:				ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 4405
;4405:			} else if (ui_gameType.integer < 2) {
ADDRGP4 $2537
JUMPV
LABELV $2539
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
GEI4 $2537
line 4406
;4406:				ui_gameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_gameType+12
ADDRGP4 uiInfo+78116
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4407
;4407:			}
line 4408
;4408:		} else {
ADDRGP4 $2537
JUMPV
LABELV $2536
line 4409
;4409:			ui_gameType.integer++;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4410
;4410:			if (ui_gameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 ui_gameType+12
INDIRI4
ADDRGP4 uiInfo+78116
INDIRI4
LTI4 $2549
line 4411
;4411:				ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 4412
;4412:			} else if (ui_gameType.integer == 2) {
ADDRGP4 $2550
JUMPV
LABELV $2549
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $2554
line 4413
;4413:				ui_gameType.integer = 3;
ADDRGP4 ui_gameType+12
CNSTI4 3
ASGNI4
line 4414
;4414:			}
LABELV $2554
LABELV $2550
line 4415
;4415:		} 
LABELV $2537
line 4417
;4416:
;4417:		if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_TOURNAMENT) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CNSTI4 12
NEI4 $2558
line 4418
;4418:			trap_Cvar_Set("ui_Q3Model", "1");
ADDRGP4 $2563
ARGP4
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4419
;4419:		} else {
ADDRGP4 $2559
JUMPV
LABELV $2558
line 4420
;4420:			trap_Cvar_Set("ui_Q3Model", "0");
ADDRGP4 $2563
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4421
;4421:		}
LABELV $2559
line 4423
;4422:
;4423:		trap_Cvar_Set("ui_gameType", va("%d", ui_gameType.integer));
ADDRGP4 $1015
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2564
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4424
;4424:		UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 4425
;4425:		UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 4426
;4426:		if (resetMap && oldCount != UI_MapCountByGameType(qtrue)) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2572
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2572
line 4427
;4427:	  	trap_Cvar_Set( "ui_currentMap", "0");
ADDRGP4 $236
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4428
;4428:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4429
;4429:		}
LABELV $2572
line 4430
;4430:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2530
JUMPV
LABELV $2531
line 4432
;4431:  }
;4432:  return qfalse;
CNSTI4 0
RETI4
LABELV $2530
endproc UI_GameType_HandleKey 20 16
proc UI_NetGameType_HandleKey 12 16
line 4435
;4433:}
;4434:
;4435:static qboolean UI_NetGameType_HandleKey(int flags, float *special, int key) {
line 4436
;4436:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2579
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2579
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2579
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2575
LABELV $2579
line 4438
;4437:
;4438:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2580
line 4439
;4439:			ui_netGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4440
;4440:		} else {
ADDRGP4 $2581
JUMPV
LABELV $2580
line 4441
;4441:			ui_netGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4442
;4442:		}
LABELV $2581
line 4444
;4443:
;4444:    if (ui_netGameType.integer < 0) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
GEI4 $2584
line 4445
;4445:      ui_netGameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_netGameType+12
ADDRGP4 uiInfo+78116
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4446
;4446:		} else if (ui_netGameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 $2585
JUMPV
LABELV $2584
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78116
INDIRI4
LTI4 $2589
line 4447
;4447:      ui_netGameType.integer = 0;
ADDRGP4 ui_netGameType+12
CNSTI4 0
ASGNI4
line 4448
;4448:    } 
LABELV $2589
LABELV $2585
line 4450
;4449:
;4450:  	trap_Cvar_Set( "ui_netGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $1015
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1027
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4451
;4451:  	trap_Cvar_Set( "ui_actualnetGameType", va("%d", uiInfo.gameTypes[ui_netGameType.integer].gtEnum));
ADDRGP4 $1015
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2595
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4452
;4452:  	trap_Cvar_Set( "ui_currentNetMap", "0");
ADDRGP4 $237
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4453
;4453:		UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4454
;4454:		Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4455
;4455:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2574
JUMPV
LABELV $2575
line 4457
;4456:  }
;4457:  return qfalse;
CNSTI4 0
RETI4
LABELV $2574
endproc UI_NetGameType_HandleKey 12 16
proc UI_JoinGameType_HandleKey 8 8
line 4460
;4458:}
;4459:
;4460:static qboolean UI_JoinGameType_HandleKey(int flags, float *special, int key) {
line 4461
;4461:	if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2604
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2604
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2604
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2600
LABELV $2604
line 4463
;4462:
;4463:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2605
line 4464
;4464:			ui_joinGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4465
;4465:		} else {
ADDRGP4 $2606
JUMPV
LABELV $2605
line 4466
;4466:			ui_joinGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4467
;4467:		}
LABELV $2606
line 4469
;4468:
;4469:		if (ui_joinGameType.integer < 0) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
GEI4 $2609
line 4470
;4470:			ui_joinGameType.integer = uiInfo.numJoinGameTypes - 1;
ADDRGP4 ui_joinGameType+12
ADDRGP4 uiInfo+78248
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4471
;4471:		} else if (ui_joinGameType.integer >= uiInfo.numJoinGameTypes) {
ADDRGP4 $2610
JUMPV
LABELV $2609
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+78248
INDIRI4
LTI4 $2614
line 4472
;4472:			ui_joinGameType.integer = 0;
ADDRGP4 ui_joinGameType+12
CNSTI4 0
ASGNI4
line 4473
;4473:		}
LABELV $2614
LABELV $2610
line 4475
;4474:
;4475:		trap_Cvar_Set( "ui_joinGameType", va("%d", ui_joinGameType.integer));
ADDRGP4 $1015
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1038
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4476
;4476:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4477
;4477:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2599
JUMPV
LABELV $2600
line 4479
;4478:	}
;4479:	return qfalse;
CNSTI4 0
RETI4
LABELV $2599
endproc UI_JoinGameType_HandleKey 8 8
proc UI_Skill_HandleKey 16 8
line 4484
;4480:}
;4481:
;4482:
;4483:
;4484:static qboolean UI_Skill_HandleKey(int flags, float *special, int key) {
line 4485
;4485:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2625
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2625
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2625
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2621
LABELV $2625
line 4486
;4486:  	int i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $174
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 4488
;4487:
;4488:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2626
line 4489
;4489:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4490
;4490:		} else {
ADDRGP4 $2627
JUMPV
LABELV $2626
line 4491
;4491:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4492
;4492:		}
LABELV $2627
line 4494
;4493:
;4494:    if (i < 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $2628
line 4495
;4495:			i = numSkillLevels;
ADDRLP4 4
ADDRGP4 numSkillLevels
INDIRI4
ASGNI4
line 4496
;4496:		} else if (i > numSkillLevels) {
ADDRGP4 $2629
JUMPV
LABELV $2628
ADDRLP4 4
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $2630
line 4497
;4497:      i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4498
;4498:    }
LABELV $2630
LABELV $2629
line 4500
;4499:
;4500:    trap_Cvar_Set("g_spSkill", va("%i", i));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $174
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4501
;4501:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2620
JUMPV
LABELV $2621
line 4503
;4502:  }
;4503:  return qfalse;
CNSTI4 0
RETI4
LABELV $2620
endproc UI_Skill_HandleKey 16 8
proc UI_TeamName_HandleKey 24 8
line 4506
;4504:}
;4505:
;4506:static qboolean UI_TeamName_HandleKey(int flags, float *special, int key, qboolean blue) {
line 4507
;4507:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2637
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2637
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2637
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2633
LABELV $2637
line 4509
;4508:    int i;
;4509:    i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2639
ADDRLP4 8
ADDRGP4 $1127
ASGNP4
ADDRGP4 $2640
JUMPV
LABELV $2639
ADDRLP4 8
ADDRGP4 $1128
ASGNP4
LABELV $2640
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 4511
;4510:
;4511:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2641
line 4512
;4512:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4513
;4513:		} else {
ADDRGP4 $2642
JUMPV
LABELV $2641
line 4514
;4514:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4515
;4515:		}
LABELV $2642
line 4517
;4516:
;4517:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
LTI4 $2643
line 4518
;4518:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4519
;4519:    } else if (i < 0) {
ADDRGP4 $2644
JUMPV
LABELV $2643
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2646
line 4520
;4520:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+75296
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4521
;4521:		}
LABELV $2646
LABELV $2644
line 4523
;4522:
;4523:    trap_Cvar_Set( (blue) ? "ui_blueTeam" : "ui_redTeam", uiInfo.teamList[i].teamName);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2651
ADDRLP4 20
ADDRGP4 $1127
ASGNP4
ADDRGP4 $2652
JUMPV
LABELV $2651
ADDRLP4 20
ADDRGP4 $1128
ASGNP4
LABELV $2652
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4525
;4524:
;4525:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2632
JUMPV
LABELV $2633
line 4527
;4526:  }
;4527:  return qfalse;
CNSTI4 0
RETI4
LABELV $2632
endproc UI_TeamName_HandleKey 24 8
proc UI_TeamMember_HandleKey 32 8
line 4530
;4528:}
;4529:
;4530:static qboolean UI_TeamMember_HandleKey(int flags, float *special, int key, qboolean blue, int num) {
line 4531
;4531:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2658
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2658
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2658
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2654
LABELV $2658
line 4535
;4532:		// 0 - None
;4533:		// 1 - Human
;4534:		// 2..NumCharacters - Bot
;4535:		char *cvar = va(blue ? "ui_blueteam%i" : "ui_redteam%i", num);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2660
ADDRLP4 12
ADDRGP4 $1143
ASGNP4
ADDRGP4 $2661
JUMPV
LABELV $2660
ADDRLP4 12
ADDRGP4 $1144
ASGNP4
LABELV $2661
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 4536
;4536:		int value = trap_Cvar_VariableValue(cvar);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 4538
;4537:
;4538:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2662
line 4539
;4539:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4540
;4540:		} else {
ADDRGP4 $2663
JUMPV
LABELV $2662
line 4541
;4541:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4542
;4542:		}
LABELV $2663
line 4544
;4543:
;4544:		if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 1
LTI4 $2664
line 4545
;4545:			if (value >= uiInfo.characterCount + 2) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2667
line 4546
;4546:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4547
;4547:			} else if (value < 0) {
ADDRGP4 $2665
JUMPV
LABELV $2667
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2665
line 4548
;4548:				value = uiInfo.characterCount + 2 - 1;
ADDRLP4 4
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 4549
;4549:			}
line 4550
;4550:		} else {
ADDRGP4 $2665
JUMPV
LABELV $2664
line 4551
;4551:			if (value >= UI_GetNumBots() + 2) {
ADDRLP4 24
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2673
line 4552
;4552:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4553
;4553:			} else if (value < 0) {
ADDRGP4 $2674
JUMPV
LABELV $2673
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2675
line 4554
;4554:				value = UI_GetNumBots() + 2 - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 4555
;4555:			}
LABELV $2675
LABELV $2674
line 4556
;4556:		}
LABELV $2665
line 4558
;4557:
;4558:		trap_Cvar_Set(cvar, va("%i", value));
ADDRGP4 $662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4559
;4559:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2653
JUMPV
LABELV $2654
line 4561
;4560:  }
;4561:  return qfalse;
CNSTI4 0
RETI4
LABELV $2653
endproc UI_TeamMember_HandleKey 32 8
proc UI_NetSource_HandleKey 8 8
line 4564
;4562:}
;4563:
;4564:static qboolean UI_NetSource_HandleKey(int flags, float *special, int key) {
line 4565
;4565:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2682
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2682
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2682
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2678
LABELV $2682
line 4567
;4566:		
;4567:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2683
line 4568
;4568:			ui_netSource.integer--;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4569
;4569:		} else {
ADDRGP4 $2684
JUMPV
LABELV $2683
line 4570
;4570:			ui_netSource.integer++;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4571
;4571:		}
LABELV $2684
line 4573
;4572:    
;4573:		if (ui_netSource.integer >= numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LTI4 $2687
line 4574
;4574:      ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 4575
;4575:    } else if (ui_netSource.integer < 0) {
ADDRGP4 $2688
JUMPV
LABELV $2687
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
GEI4 $2691
line 4576
;4576:      ui_netSource.integer = numNetSources - 1;
ADDRGP4 ui_netSource+12
ADDRGP4 numNetSources
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4577
;4577:		}
LABELV $2691
LABELV $2688
line 4579
;4578:
;4579:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4580
;4580:		if (ui_netSource.integer != AS_GLOBAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $2695
line 4581
;4581:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4582
;4582:		}
LABELV $2695
line 4583
;4583:  	trap_Cvar_Set( "ui_netSource", va("%d", ui_netSource.integer));
ADDRGP4 $1015
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $232
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4584
;4584:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2677
JUMPV
LABELV $2678
line 4586
;4585:  }
;4586:  return qfalse;
CNSTI4 0
RETI4
LABELV $2677
endproc UI_NetSource_HandleKey 8 8
proc UI_NetFilter_HandleKey 8 4
line 4589
;4587:}
;4588:
;4589:static qboolean UI_NetFilter_HandleKey(int flags, float *special, int key) {
line 4590
;4590:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2704
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2704
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2704
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2700
LABELV $2704
line 4592
;4591:
;4592:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2705
line 4593
;4593:			ui_serverFilterType.integer--;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4594
;4594:		} else {
ADDRGP4 $2706
JUMPV
LABELV $2705
line 4595
;4595:			ui_serverFilterType.integer++;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4596
;4596:		}
LABELV $2706
line 4598
;4597:
;4598:    if (ui_serverFilterType.integer >= numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LTI4 $2709
line 4599
;4599:      ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 4600
;4600:    } else if (ui_serverFilterType.integer < 0) {
ADDRGP4 $2710
JUMPV
LABELV $2709
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
GEI4 $2713
line 4601
;4601:      ui_serverFilterType.integer = numServerFilters - 1;
ADDRGP4 ui_serverFilterType+12
ADDRGP4 numServerFilters
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4602
;4602:		}
LABELV $2713
LABELV $2710
line 4603
;4603:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4604
;4604:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2699
JUMPV
LABELV $2700
line 4606
;4605:  }
;4606:  return qfalse;
CNSTI4 0
RETI4
LABELV $2699
endproc UI_NetFilter_HandleKey 8 4
proc UI_OpponentName_HandleKey 4 0
line 4609
;4607:}
;4608:
;4609:static qboolean UI_OpponentName_HandleKey(int flags, float *special, int key) {
line 4610
;4610:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2722
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2722
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2722
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2718
LABELV $2722
line 4611
;4611:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2723
line 4612
;4612:			UI_PriorOpponent();
ADDRGP4 UI_PriorOpponent
CALLV
pop
line 4613
;4613:		} else {
ADDRGP4 $2724
JUMPV
LABELV $2723
line 4614
;4614:			UI_NextOpponent();
ADDRGP4 UI_NextOpponent
CALLV
pop
line 4615
;4615:		}
LABELV $2724
line 4616
;4616:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2717
JUMPV
LABELV $2718
line 4618
;4617:  }
;4618:  return qfalse;
CNSTI4 0
RETI4
LABELV $2717
endproc UI_OpponentName_HandleKey 4 0
proc UI_BotName_HandleKey 24 4
line 4621
;4619:}
;4620:
;4621:static qboolean UI_BotName_HandleKey(int flags, float *special, int key) {
line 4622
;4622:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2730
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2730
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2730
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2726
LABELV $2730
line 4623
;4623:		int game = trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $1661
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 4624
;4624:		int value = uiInfo.botIndex;
ADDRLP4 4
ADDRGP4 uiInfo+73496
INDIRI4
ASGNI4
line 4626
;4625:
;4626:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2732
line 4627
;4627:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4628
;4628:		} else {
ADDRGP4 $2733
JUMPV
LABELV $2732
line 4629
;4629:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4630
;4630:		}
LABELV $2733
line 4632
;4631:
;4632:		if (game >= GT_TEAM) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $2734
line 4633
;4633:			if (value >= uiInfo.characterCount + 2) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2736
line 4634
;4634:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4635
;4635:			} else if (value < 0) {
ADDRGP4 $2735
JUMPV
LABELV $2736
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2735
line 4636
;4636:				value = uiInfo.characterCount + 2 - 1;
ADDRLP4 4
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 4637
;4637:			}
line 4638
;4638:		} else {
ADDRGP4 $2735
JUMPV
LABELV $2734
line 4639
;4639:			if (value >= UI_GetNumBots() + 2) {
ADDRLP4 16
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2742
line 4640
;4640:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4641
;4641:			} else if (value < 0) {
ADDRGP4 $2743
JUMPV
LABELV $2742
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2744
line 4642
;4642:				value = UI_GetNumBots() + 2 - 1;
ADDRLP4 20
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 4643
;4643:			}
LABELV $2744
LABELV $2743
line 4644
;4644:		}
LABELV $2735
line 4645
;4645:		uiInfo.botIndex = value;
ADDRGP4 uiInfo+73496
ADDRLP4 4
INDIRI4
ASGNI4
line 4646
;4646:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2725
JUMPV
LABELV $2726
line 4648
;4647:  }
;4648:  return qfalse;
CNSTI4 0
RETI4
LABELV $2725
endproc UI_BotName_HandleKey 24 4
proc UI_BotSkill_HandleKey 8 0
line 4651
;4649:}
;4650:
;4651:static qboolean UI_BotSkill_HandleKey(int flags, float *special, int key) {
line 4652
;4652:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2752
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2752
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2752
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2748
LABELV $2752
line 4653
;4653:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2753
line 4654
;4654:			uiInfo.skillIndex--;
ADDRLP4 4
ADDRGP4 uiInfo+96212
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4655
;4655:		} else {
ADDRGP4 $2754
JUMPV
LABELV $2753
line 4656
;4656:			uiInfo.skillIndex++;
ADDRLP4 4
ADDRGP4 uiInfo+96212
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4657
;4657:		}
LABELV $2754
line 4658
;4658:		if (uiInfo.skillIndex >= numSkillLevels) {
ADDRGP4 uiInfo+96212
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LTI4 $2757
line 4659
;4659:			uiInfo.skillIndex = 0;
ADDRGP4 uiInfo+96212
CNSTI4 0
ASGNI4
line 4660
;4660:		} else if (uiInfo.skillIndex < 0) {
ADDRGP4 $2758
JUMPV
LABELV $2757
ADDRGP4 uiInfo+96212
INDIRI4
CNSTI4 0
GEI4 $2761
line 4661
;4661:			uiInfo.skillIndex = numSkillLevels-1;
ADDRGP4 uiInfo+96212
ADDRGP4 numSkillLevels
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4662
;4662:		}
LABELV $2761
LABELV $2758
line 4663
;4663:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2747
JUMPV
LABELV $2748
line 4665
;4664:  }
;4665:	return qfalse;
CNSTI4 0
RETI4
LABELV $2747
endproc UI_BotSkill_HandleKey 8 0
proc UI_RedBlue_HandleKey 8 0
line 4668
;4666:}
;4667:
;4668:static qboolean UI_RedBlue_HandleKey(int flags, float *special, int key) {
line 4669
;4669:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2770
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2770
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2770
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2766
LABELV $2770
line 4670
;4670:		uiInfo.redBlue ^= 1;
ADDRLP4 4
ADDRGP4 uiInfo+78380
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 4671
;4671:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2765
JUMPV
LABELV $2766
line 4673
;4672:	}
;4673:	return qfalse;
CNSTI4 0
RETI4
LABELV $2765
endproc UI_RedBlue_HandleKey 8 0
proc UI_Crosshair_HandleKey 8 8
line 4676
;4674:}
;4675:
;4676:static qboolean UI_Crosshair_HandleKey(int flags, float *special, int key) {
line 4677
;4677:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2777
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2777
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2777
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2773
LABELV $2777
line 4678
;4678:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2778
line 4679
;4679:			uiInfo.currentCrosshair--;
ADDRLP4 4
ADDRGP4 uiInfo+118960
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4680
;4680:		} else {
ADDRGP4 $2779
JUMPV
LABELV $2778
line 4681
;4681:			uiInfo.currentCrosshair++;
ADDRLP4 4
ADDRGP4 uiInfo+118960
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4682
;4682:		}
LABELV $2779
line 4684
;4683:
;4684:		if (uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+118960
INDIRI4
CNSTI4 10
LTI4 $2782
line 4685
;4685:			uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+118960
CNSTI4 0
ASGNI4
line 4686
;4686:		} else if (uiInfo.currentCrosshair < 0) {
ADDRGP4 $2783
JUMPV
LABELV $2782
ADDRGP4 uiInfo+118960
INDIRI4
CNSTI4 0
GEI4 $2786
line 4687
;4687:			uiInfo.currentCrosshair = NUM_CROSSHAIRS - 1;
ADDRGP4 uiInfo+118960
CNSTI4 9
ASGNI4
line 4688
;4688:		}
LABELV $2786
LABELV $2783
line 4689
;4689:		trap_Cvar_Set("cg_drawCrosshair", va("%d", uiInfo.currentCrosshair)); 
ADDRGP4 $1015
ARGP4
ADDRGP4 uiInfo+118960
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $185
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4690
;4690:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2772
JUMPV
LABELV $2773
line 4692
;4691:	}
;4692:	return qfalse;
CNSTI4 0
RETI4
LABELV $2772
endproc UI_Crosshair_HandleKey 8 8
proc UI_SelectedPlayer_HandleKey 16 8
line 4697
;4693:}
;4694:
;4695:
;4696:
;4697:static qboolean UI_SelectedPlayer_HandleKey(int flags, float *special, int key) {
line 4698
;4698:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2796
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2796
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2796
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2792
LABELV $2796
line 4701
;4699:		int selected;
;4700:
;4701:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 4702
;4702:		if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78408
INDIRI4
CNSTI4 0
NEI4 $2797
line 4703
;4703:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2791
JUMPV
LABELV $2797
line 4705
;4704:		}
;4705:		selected = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $240
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 4707
;4706:		
;4707:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2800
line 4708
;4708:			selected--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4709
;4709:		} else {
ADDRGP4 $2801
JUMPV
LABELV $2800
line 4710
;4710:			selected++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4711
;4711:		}
LABELV $2801
line 4713
;4712:
;4713:		if (selected > uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
LEI4 $2802
line 4714
;4714:			selected = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4715
;4715:		} else if (selected < 0) {
ADDRGP4 $2803
JUMPV
LABELV $2802
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2805
line 4716
;4716:			selected = uiInfo.myTeamCount;
ADDRLP4 4
ADDRGP4 uiInfo+78388
INDIRI4
ASGNI4
line 4717
;4717:		}
LABELV $2805
LABELV $2803
line 4719
;4718:
;4719:		if (selected == uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
NEI4 $2808
line 4720
;4720:		 	trap_Cvar_Set( "cg_selectedPlayerName", "Everyone");
ADDRGP4 $241
ARGP4
ADDRGP4 $2811
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4721
;4721:		} else {
ADDRGP4 $2809
JUMPV
LABELV $2808
line 4722
;4722:		 	trap_Cvar_Set( "cg_selectedPlayerName", uiInfo.teamNames[selected]);
ADDRGP4 $241
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80460
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4723
;4723:		}
LABELV $2809
line 4724
;4724:	 	trap_Cvar_Set( "cg_selectedPlayer", va("%d", selected));
ADDRGP4 $1015
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $240
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4725
;4725:	}
LABELV $2792
line 4726
;4726:	return qfalse;
CNSTI4 0
RETI4
LABELV $2791
endproc UI_SelectedPlayer_HandleKey 16 8
proc UI_OwnerDrawHandleKey 68 20
line 4730
;4727:}
;4728:
;4729:
;4730:static qboolean UI_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
line 4731
;4731:	switch (ownerDraw) { 
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 237
LTI4 $2842
ADDRLP4 0
INDIRI4
CNSTI4 245
GTI4 $2843
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2844-948
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2844
address $2836
address $2815
address $2837
address $2838
address $2839
address $2840
address $2841
address $2815
address $2827
code
LABELV $2842
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 200
LTI4 $2815
ADDRLP4 4
INDIRI4
CNSTI4 209
GTI4 $2846
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2847-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2847
address $2823
address $2824
address $2815
address $2825
address $2815
address $2826
address $2815
address $2829
address $2830
address $2831
code
LABELV $2846
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 220
EQI4 $2834
ADDRLP4 8
INDIRI4
CNSTI4 222
EQI4 $2835
ADDRGP4 $2815
JUMPV
LABELV $2843
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 278
LTI4 $2849
ADDRLP4 12
INDIRI4
CNSTI4 311
GTI4 $2850
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2851-1112
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2851
address $2816
address $2817
address $2818
address $2819
address $2820
address $2815
address $2815
address $2815
address $2815
address $2821
address $2821
address $2821
address $2821
address $2821
address $2821
address $2815
address $2815
address $2815
address $2815
address $2815
address $2815
address $2815
address $2832
address $2832
address $2832
address $2832
address $2832
address $2832
address $2833
address $2833
address $2833
address $2833
address $2833
address $2833
code
LABELV $2849
ADDRFP4 0
INDIRI4
CNSTI4 253
EQI4 $2828
ADDRGP4 $2815
JUMPV
LABELV $2850
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 330
LTI4 $2815
ADDRLP4 16
INDIRI4
CNSTI4 333
GTI4 $2815
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2853-1320
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2853
address $2822
address $2822
address $2822
address $2822
code
LABELV $2816
line 4733
;4732: 	case UI_PRIMARY_ADDON1:
;4733:		CG_HandleWeaponPrimaryAddon1( flags, special, key );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon1
CALLI4
pop
line 4734
;4734:		break;
ADDRGP4 $2815
JUMPV
LABELV $2817
line 4736
;4735:	case UI_PRIMARY_ADDON2:
;4736:		CG_HandleWeaponPrimaryAddon2( flags, special, key );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon2
CALLI4
pop
line 4737
;4737:		break;
ADDRGP4 $2815
JUMPV
LABELV $2818
line 4739
;4738:	case UI_PRIMARY_ADDON3:
;4739:		CG_HandleWeaponPrimaryAddon3( flags, special, key );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponPrimaryAddon3
CALLI4
pop
line 4740
;4740:		break;
ADDRGP4 $2815
JUMPV
LABELV $2819
line 4742
;4741:	case UI_SIDEARM_ADDON1:
;4742:		CG_HandleWeaponSecondaryAddon1( flags, special, key );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponSecondaryAddon1
CALLI4
pop
line 4743
;4743:		break;
ADDRGP4 $2815
JUMPV
LABELV $2820
line 4745
;4744:	case UI_SIDEARM_ADDON2:
;4745:		CG_HandleWeaponSecondaryAddon2( flags, special, key );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_HandleWeaponSecondaryAddon2
CALLI4
pop
line 4746
;4746:		break;
ADDRGP4 $2815
JUMPV
LABELV $2821
line 4753
;4747:	case CG_CHARACTER_STRENGTH:
;4748:	case CG_CHARACTER_TECHINCAL:
;4749:	case CG_CHARACTER_ACCURACY:
;4750:	case CG_CHARACTER_SPEED:
;4751:	case CG_CHARACTER_STAMINA:
;4752:	case CG_CHARACTER_STEALTH:
;4753:		CG_HandleCharacterButton(ownerDraw, special, key );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_HandleCharacterButton
CALLI4
pop
line 4754
;4754:		break;
ADDRGP4 $2815
JUMPV
LABELV $2822
line 4759
;4755:	case CG_INVEN_AMMO_FLASH:
;4756:	case CG_INVEN_AMMO_SMOKE:
;4757:	case CG_INVEN_AMMO_MK26:
;4758:	case CG_INVEN_AMMO_40MM:
;4759:		CG_HandleGrenadeButton( ownerDraw, special, key );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_HandleGrenadeButton
CALLI4
pop
line 4760
;4760:		break;
ADDRGP4 $2815
JUMPV
LABELV $2823
line 4762
;4761:    case UI_HANDICAP:
;4762:      return UI_Handicap_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_Handicap_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4763
;4763:      break;
LABELV $2824
line 4765
;4764:    case UI_EFFECTS:
;4765:      return UI_Effects_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_Effects_HandleKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4766
;4766:      break;
LABELV $2825
line 4768
;4767:    case UI_CLANNAME:
;4768:      return UI_ClanName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_ClanName_HandleKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4769
;4769:      break;
LABELV $2826
line 4771
;4770:    case UI_GAMETYPE:
;4771:      return UI_GameType_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 UI_GameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4772
;4772:      break;
LABELV $2827
line 4774
;4773:    case UI_NETGAMETYPE:
;4774:      return UI_NetGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_NetGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4775
;4775:      break;
LABELV $2828
line 4777
;4776:    case UI_JOINGAMETYPE:
;4777:      return UI_JoinGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 UI_JoinGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4778
;4778:      break;
LABELV $2829
line 4780
;4779:    case UI_SKILL:
;4780:      return UI_Skill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 UI_Skill_HandleKey
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4781
;4781:      break;
LABELV $2830
line 4783
;4782:    case UI_BLUETEAMNAME:
;4783:      return UI_TeamName_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 48
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4784
;4784:      break;
LABELV $2831
line 4786
;4785:    case UI_REDTEAMNAME:
;4786:      return UI_TeamName_HandleKey(flags, special, key, qfalse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4787
;4787:      break;
LABELV $2832
line 4794
;4788:    case UI_BLUETEAM1:
;4789:		case UI_BLUETEAM2:
;4790:		case UI_BLUETEAM3:
;4791:		case UI_BLUETEAM4:
;4792:		case UI_BLUETEAM5:
;4793:		case UI_BLUETEAM6:
;4794:      UI_TeamMember_HandleKey(flags, special, key, qtrue, ownerDraw - UI_BLUETEAM1 + 1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 300
SUBI4
ADDRLP4 56
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 4795
;4795:      break;
ADDRGP4 $2815
JUMPV
LABELV $2833
line 4802
;4796:    case UI_REDTEAM1:
;4797:		case UI_REDTEAM2:
;4798:		case UI_REDTEAM3:
;4799:		case UI_REDTEAM4:
;4800:		case UI_REDTEAM5:
;4801:		case UI_REDTEAM6:
;4802:      UI_TeamMember_HandleKey(flags, special, key, qfalse, ownerDraw - UI_REDTEAM1 + 1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 306
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 4803
;4803:      break;
ADDRGP4 $2815
JUMPV
LABELV $2834
line 4805
;4804:		case UI_NETSOURCE:
;4805:      UI_NetSource_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetSource_HandleKey
CALLI4
pop
line 4806
;4806:			break;
ADDRGP4 $2815
JUMPV
LABELV $2835
line 4808
;4807:		case UI_NETFILTER:
;4808:      UI_NetFilter_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetFilter_HandleKey
CALLI4
pop
line 4809
;4809:			break;
ADDRGP4 $2815
JUMPV
LABELV $2836
line 4811
;4810:		case UI_OPPONENT_NAME:
;4811:			UI_OpponentName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_OpponentName_HandleKey
CALLI4
pop
line 4812
;4812:			break;
ADDRGP4 $2815
JUMPV
LABELV $2837
line 4814
;4813:		case UI_BOTNAME:
;4814:			return UI_BotName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 UI_BotName_HandleKey
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4815
;4815:			break;
LABELV $2838
line 4817
;4816:		case UI_BOTSKILL:
;4817:			return UI_BotSkill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 UI_BotSkill_HandleKey
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
ADDRGP4 $2813
JUMPV
line 4818
;4818:			break;
LABELV $2839
line 4820
;4819:		case UI_REDBLUE:
;4820:			UI_RedBlue_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_RedBlue_HandleKey
CALLI4
pop
line 4821
;4821:			break;
ADDRGP4 $2815
JUMPV
LABELV $2840
line 4823
;4822:		case UI_CROSSHAIR:
;4823:			UI_Crosshair_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_Crosshair_HandleKey
CALLI4
pop
line 4824
;4824:			break;
ADDRGP4 $2815
JUMPV
LABELV $2841
line 4826
;4825:		case UI_SELECTEDPLAYER:
;4826:			UI_SelectedPlayer_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_SelectedPlayer_HandleKey
CALLI4
pop
line 4827
;4827:			break;
line 4829
;4828:    default:
;4829:      break;
LABELV $2815
line 4832
;4830:  }
;4831:
;4832:  return qfalse;
CNSTI4 0
RETI4
LABELV $2813
endproc UI_OwnerDrawHandleKey 68 20
proc UI_GetValue 0 0
line 4836
;4833:}
;4834:
;4835:
;4836:static float UI_GetValue(int ownerDraw) {
line 4837
;4837:  return 0;
CNSTF4 0
RETF4
LABELV $2855
endproc UI_GetValue 0 0
proc UI_ServersQsortCompare 4 20
line 4845
;4838:}
;4839:
;4840:/*
;4841:=================
;4842:UI_ServersQsortCompare
;4843:=================
;4844:*/
;4845:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 ) {
line 4846
;4846:	return trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey, uiInfo.serverStatus.sortDir, *(int*)arg1, *(int*)arg2);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+1112
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+1116
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2856
endproc UI_ServersQsortCompare 4 20
export UI_ServersSort
proc UI_ServersSort 0 16
line 4855
;4847:}
;4848:
;4849:
;4850:/*
;4851:=================
;4852:UI_ServersSort
;4853:=================
;4854:*/
;4855:void UI_ServersSort(int column, qboolean force) {
line 4857
;4856:
;4857:	if ( !force ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2863
line 4858
;4858:		if ( uiInfo.serverStatus.sortKey == column ) {
ADDRGP4 uiInfo+99836+1112
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2865
line 4859
;4859:			return;
ADDRGP4 $2862
JUMPV
LABELV $2865
line 4861
;4860:		}
;4861:	}
LABELV $2863
line 4863
;4862:
;4863:	uiInfo.serverStatus.sortKey = column;
ADDRGP4 uiInfo+99836+1112
ADDRFP4 0
INDIRI4
ASGNI4
line 4864
;4864:	qsort( &uiInfo.serverStatus.displayServers[0], uiInfo.serverStatus.numDisplayServers, sizeof(int), UI_ServersQsortCompare);
ADDRGP4 uiInfo+99836+1132
ARGP4
ADDRGP4 uiInfo+99836+9324
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_ServersQsortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 4865
;4865:}
LABELV $2862
endproc UI_ServersSort 0 16
proc UI_LoadMods 2092 16
line 4912
;4866:
;4867:/*
;4868:static void UI_StartSinglePlayer() {
;4869:	int i,j, k, skill;
;4870:	char buff[1024];
;4871:	i = trap_Cvar_VariableValue( "ui_currentTier" );
;4872:  if (i < 0 || i >= tierCount) {
;4873:    i = 0;
;4874:  }
;4875:	j = trap_Cvar_VariableValue("ui_currentMap");
;4876:	if (j < 0 || j > MAPS_PER_TIER) {
;4877:		j = 0;
;4878:	}
;4879:
;4880: 	trap_Cvar_SetValue( "singleplayer", 1 );
;4881: 	trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 7, tierList[i].gameTypes[j] ) );
;4882:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", tierList[i].maps[j] ) );
;4883:	skill = trap_Cvar_VariableValue( "g_spSkill" );
;4884:
;4885:	if (j == MAPS_PER_TIER-1) {
;4886:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;4887:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[0]), skill, "", teamList[k].teamMembers[0]);
;4888:	} else {
;4889:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;4890:		for (i = 0; i < PLAYERS_PER_TEAM; i++) {
;4891:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Blue", teamList[k].teamMembers[i]);
;4892:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;4893:		}
;4894:
;4895:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
;4896:		for (i = 1; i < PLAYERS_PER_TEAM; i++) {
;4897:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Red", teamList[k].teamMembers[i]);
;4898:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;4899:		}
;4900:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
;4901:	}
;4902:	
;4903:
;4904:}
;4905:*/
;4906:
;4907:/*
;4908:===============
;4909:UI_LoadMods
;4910:===============
;4911:*/
;4912:static void UI_LoadMods() {
line 4920
;4913:	int		numdirs;
;4914:	char	dirlist[2048];
;4915:	char	*dirptr;
;4916:  char  *descptr;
;4917:	int		i;
;4918:	int		dirlen;
;4919:
;4920:	uiInfo.modCount = 0;
ADDRGP4 uiInfo+96728
CNSTI4 0
ASGNI4
line 4921
;4921:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $2877
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 4922
;4922:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 4923
;4923:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $2881
JUMPV
LABELV $2878
line 4924
;4924:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4925
;4925:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 4926
;4926:		uiInfo.modList[uiInfo.modCount].modName = String_Alloc(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+96728
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96216
ADDP4
ADDRLP4 2076
INDIRP4
ASGNP4
line 4927
;4927:		uiInfo.modList[uiInfo.modCount].modDescr = String_Alloc(descptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+96728
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96216+4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 4928
;4928:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2084
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 4929
;4929:		uiInfo.modCount++;
ADDRLP4 2088
ADDRGP4 uiInfo+96728
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4930
;4930:		if (uiInfo.modCount >= MAX_MODS) {
ADDRGP4 uiInfo+96728
INDIRI4
CNSTI4 64
LTI4 $2888
line 4931
;4931:			break;
ADDRGP4 $2880
JUMPV
LABELV $2888
line 4933
;4932:		}
;4933:	}
LABELV $2879
line 4923
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2881
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2878
LABELV $2880
line 4935
;4934:
;4935:}
LABELV $2875
endproc UI_LoadMods 2092 16
proc UI_LoadMovies 4124 16
line 4945
;4936:
;4937: 
;4938:
;4939:
;4940:/*
;4941:===============
;4942:UI_LoadMovies
;4943:===============
;4944:*/
;4945:static void UI_LoadMovies() {
line 4950
;4946:	char	movielist[4096];
;4947:	char	*moviename;
;4948:	int		i, len;
;4949:
;4950:	uiInfo.movieCount = trap_FS_GetFileList( "video", "roq", movielist, 4096 );
ADDRGP4 $2893
ARGP4
ADDRGP4 $2894
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4108
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+99824
ADDRLP4 4108
INDIRI4
ASGNI4
line 4952
;4951:
;4952:	if (uiInfo.movieCount) {
ADDRGP4 uiInfo+99824
INDIRI4
CNSTI4 0
EQI4 $2895
line 4953
;4953:		if (uiInfo.movieCount > MAX_MOVIES) {
ADDRGP4 uiInfo+99824
INDIRI4
CNSTI4 256
LEI4 $2898
line 4954
;4954:			uiInfo.movieCount = MAX_MOVIES;
ADDRGP4 uiInfo+99824
CNSTI4 256
ASGNI4
line 4955
;4955:		}
LABELV $2898
line 4956
;4956:		moviename = movielist;
ADDRLP4 0
ADDRLP4 12
ASGNP4
line 4957
;4957:		for ( i = 0; i < uiInfo.movieCount; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2905
JUMPV
LABELV $2902
line 4958
;4958:			len = strlen( moviename );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4112
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4112
INDIRI4
ASGNI4
line 4959
;4959:			if (!Q_stricmp(moviename +  len - 4,".roq")) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $2909
ARGP4
ADDRLP4 4116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4116
INDIRI4
CNSTI4 0
NEI4 $2907
line 4960
;4960:				moviename[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 4961
;4961:			}
LABELV $2907
line 4962
;4962:			Q_strupr(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 4963
;4963:			uiInfo.movieList[i] = String_Alloc(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98800
ADDP4
ADDRLP4 4120
INDIRP4
ASGNP4
line 4964
;4964:			moviename += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 4965
;4965:		}
LABELV $2903
line 4957
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2905
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+99824
INDIRI4
LTI4 $2902
line 4966
;4966:	}
LABELV $2895
line 4968
;4967:
;4968:}
LABELV $2891
endproc UI_LoadMovies 4124 16
proc UI_LoadDemos 4168 16
line 4977
;4969:
;4970:
;4971:
;4972:/*
;4973:===============
;4974:UI_LoadDemos
;4975:===============
;4976:*/
;4977:static void UI_LoadDemos() {
line 4983
;4978:	char	demolist[4096];
;4979:	char demoExt[32];
;4980:	char	*demoname;
;4981:	int		i, len;
;4982:
;4983:	Com_sprintf(demoExt, sizeof(demoExt), "dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2913
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2912
ARGP4
ADDRLP4 4140
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4985
;4984:
;4985:	uiInfo.demoCount = trap_FS_GetFileList( "demos", demoExt, demolist, 4096 );
ADDRGP4 $2915
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4144
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+98792
ADDRLP4 4144
INDIRI4
ASGNI4
line 4987
;4986:
;4987:	Com_sprintf(demoExt, sizeof(demoExt), ".dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2913
ARGP4
ADDRLP4 4148
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2916
ARGP4
ADDRLP4 4148
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4989
;4988:
;4989:	if (uiInfo.demoCount) {
ADDRGP4 uiInfo+98792
INDIRI4
CNSTI4 0
EQI4 $2917
line 4990
;4990:		if (uiInfo.demoCount > MAX_DEMOS) {
ADDRGP4 uiInfo+98792
INDIRI4
CNSTI4 256
LEI4 $2920
line 4991
;4991:			uiInfo.demoCount = MAX_DEMOS;
ADDRGP4 uiInfo+98792
CNSTI4 256
ASGNI4
line 4992
;4992:		}
LABELV $2920
line 4993
;4993:		demoname = demolist;
ADDRLP4 0
ADDRLP4 44
ASGNP4
line 4994
;4994:		for ( i = 0; i < uiInfo.demoCount; i++ ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $2927
JUMPV
LABELV $2924
line 4995
;4995:			len = strlen( demoname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 4152
INDIRI4
ASGNI4
line 4996
;4996:			if (!Q_stricmp(demoname +  len - strlen(demoExt), demoExt)) {
ADDRLP4 4
ARGP4
ADDRLP4 4156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 4156
INDIRI4
SUBP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4160
INDIRI4
CNSTI4 0
NEI4 $2929
line 4997
;4997:				demoname[len-strlen(demoExt)] = '\0';
ADDRLP4 4
ARGP4
ADDRLP4 4164
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4164
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 4998
;4998:			}
LABELV $2929
line 4999
;4999:			Q_strupr(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 5000
;5000:			uiInfo.demoList[i] = String_Alloc(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97768
ADDP4
ADDRLP4 4164
INDIRP4
ASGNP4
line 5001
;5001:			demoname += len + 1;
ADDRLP4 0
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 5002
;5002:		}
LABELV $2925
line 4994
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2927
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+98792
INDIRI4
LTI4 $2924
line 5003
;5003:	}
LABELV $2917
line 5005
;5004:
;5005:}
LABELV $2911
endproc UI_LoadDemos 4168 16
proc UI_LoadScripts 20040 12
line 5013
;5006:/*
;5007:===============
;5008:UI_LoadScripts
;5009:===============
;5010:*/
;5011:char scriptList[MAX_SCRIPTS][256];
;5012:
;5013:static void UI_LoadScripts() {
line 5021
;5014:	char		*text_p;
;5015:	int			len;
;5016:	int			i;
;5017:	char		*token;
;5018: 	char		text[20000];
;5019:	fileHandle_t	f; 
;5020:
;5021:	uiInfo.scriptCount = 0;
ADDRGP4 uiInfo+97760
CNSTI4 0
ASGNI4
line 5023
;5022:	// load the file
;5023:	len = trap_FS_FOpenFile( "scripts.cfg", &f, FS_READ );
ADDRGP4 $2934
ARGP4
ADDRLP4 20016
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20020
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20020
INDIRI4
ASGNI4
line 5025
;5024:
;5025:	if ( len <= 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $2935
line 5026
;5026:		Com_Printf( "%s not found.\n", "scripts.cfg" );
ADDRGP4 $2937
ARGP4
ADDRGP4 $2934
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5027
;5027:		return ;
ADDRGP4 $2932
JUMPV
LABELV $2935
line 5029
;5028:	}
;5029:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $2938
line 5030
;5030:		Com_Printf( "File %s too long\n", "scripts.cfg" );
ADDRGP4 $350
ARGP4
ADDRGP4 $2934
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5031
;5031:		return ;
ADDRGP4 $2932
JUMPV
LABELV $2938
line 5033
;5032:	}
;5033:	trap_FS_Read( text, len, f );
ADDRLP4 16
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20016
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 5034
;5034:	text[len] = 0;
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 5035
;5035:	trap_FS_FCloseFile( f );
ADDRLP4 20016
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 5038
;5036:
;5037:	// parse the text
;5038:	text_p = text; 
ADDRLP4 8
ADDRLP4 16
ASGNP4
line 5041
;5039:
;5040:	// read information  
;5041:	for ( i = 0 ; i < MAX_SCRIPTS ; i++ ) { 
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2940
line 5043
;5042:		// get string
;5043:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20024
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20024
INDIRP4
ASGNP4
line 5044
;5044:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2946
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20032
INDIRI4
CNSTI4 0
GTI4 $2944
LABELV $2946
line 5045
;5045:			break;
ADDRGP4 $2942
JUMPV
LABELV $2944
line 5047
;5046:		}
;5047:		strcpy( scriptList[uiInfo.scriptCount], token ); 
ADDRGP4 uiInfo+97760
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 scriptList
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5048
;5048:		uiInfo.scriptCount++;
ADDRLP4 20036
ADDRGP4 uiInfo+97760
ASGNP4
ADDRLP4 20036
INDIRP4
ADDRLP4 20036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5049
;5049: 	}
LABELV $2941
line 5041
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $2940
LABELV $2942
line 5051
;5050:    
;5051:	Com_Printf("parsed %i scripts.\n", uiInfo.scriptCount );
ADDRGP4 $2949
ARGP4
ADDRGP4 uiInfo+97760
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 5052
;5052:	return;
LABELV $2932
endproc UI_LoadScripts 20040 12
proc UI_SetNextMap 8 16
line 5056
;5053:}
;5054: 
;5055:
;5056:static qboolean UI_SetNextMap(int actual, int index) {
line 5058
;5057:	int i;
;5058:	for (i = actual + 1; i < uiInfo.mapCount; i++) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2955
JUMPV
LABELV $2952
line 5059
;5059:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2957
line 5060
;5060:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, index + 1, "skirmish");
CNSTP4 0
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ARGI4
ADDRGP4 $2961
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5061
;5061:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2951
JUMPV
LABELV $2957
line 5063
;5062:		}
;5063:	}
LABELV $2953
line 5058
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2955
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LTI4 $2952
line 5064
;5064:	return qfalse;
CNSTI4 0
RETI4
LABELV $2951
endproc UI_SetNextMap 8 16
proc UI_StartSkirmish 1160 32
line 5068
;5065:}
;5066:
;5067:
;5068:static void UI_StartSkirmish(qboolean next) {
line 5073
;5069:	int i, k, g, delay, temp;
;5070:	float skill;
;5071:	char buff[MAX_STRING_CHARS];
;5072:
;5073:	if (next) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2963
line 5075
;5074:		int actual;
;5075:		int index = trap_Cvar_VariableValue("ui_mapIndex");
ADDRGP4 $238
ARGP4
ADDRLP4 1056
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
ADDRLP4 1056
INDIRF4
CVFI4 4
ASGNI4
line 5076
;5076:	 	UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 5077
;5077:		UI_SelectedMap(index, &actual);
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 5078
;5078:		if (UI_SetNextMap(actual, index)) {
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 UI_SetNextMap
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $2965
line 5079
;5079:		} else {
ADDRGP4 $2966
JUMPV
LABELV $2965
line 5080
;5080:			UI_GameType_HandleKey(0, 0, K_MOUSE1, qfalse);
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 178
ARGI4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 5081
;5081:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 5082
;5082:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2961
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5083
;5083:		}
LABELV $2966
line 5084
;5084:	}
LABELV $2963
line 5086
;5085:
;5086:	g = uiInfo.gameTypes[ui_gameType.integer].gtEnum;
ADDRLP4 1036
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ASGNI4
line 5087
;5087:	trap_Cvar_SetValue( "g_gametype", g );
ADDRGP4 $1661
ARGP4
ADDRLP4 1036
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5088
;5088:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName) );
ADDRGP4 $2970
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5089
;5089:	skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $174
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1052
INDIRF4
ASGNF4
line 5090
;5090:	trap_Cvar_Set("ui_scoreMap", uiInfo.mapList[ui_currentMap.integer].mapName);
ADDRGP4 $2974
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5092
;5091:
;5092:	k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $210
ARGP4
ADDRLP4 1056
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1060
INDIRI4
ASGNI4
line 5094
;5093:
;5094:	trap_Cvar_Set("ui_singlePlayerActive", "1");
ADDRGP4 $246
ARGP4
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5097
;5095:
;5096:	// set up sp overrides, will be replaced on postgame
;5097:	temp = trap_Cvar_VariableValue( "capturelimit" );
ADDRGP4 $280
ARGP4
ADDRLP4 1064
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1064
INDIRF4
CVFI4 4
ASGNI4
line 5098
;5098:	trap_Cvar_Set("ui_saveCaptureLimit", va("%i", temp));
ADDRGP4 $662
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2977
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5099
;5099:	temp = trap_Cvar_VariableValue( "fraglimit" );
ADDRGP4 $1016
ARGP4
ADDRLP4 1072
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1072
INDIRF4
CVFI4 4
ASGNI4
line 5100
;5100:	trap_Cvar_Set("ui_saveFragLimit", va("%i", temp));
ADDRGP4 $662
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2978
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5102
;5101:
;5102:	UI_SetCapFragLimits(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 5104
;5103:
;5104:	temp = trap_Cvar_VariableValue( "cg_drawTimer" );
ADDRGP4 $2979
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1080
INDIRF4
CVFI4 4
ASGNI4
line 5105
;5105:	trap_Cvar_Set("ui_drawTimer", va("%i", temp));
ADDRGP4 $662
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2980
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5106
;5106:	temp = trap_Cvar_VariableValue( "g_doWarmup" );
ADDRGP4 $2981
ARGP4
ADDRLP4 1088
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1088
INDIRF4
CVFI4 4
ASGNI4
line 5107
;5107:	trap_Cvar_Set("ui_doWarmup", va("%i", temp));
ADDRGP4 $662
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2982
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5108
;5108:	temp = trap_Cvar_VariableValue( "g_friendlyFire" );
ADDRGP4 $2983
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 5109
;5109:	trap_Cvar_Set("ui_friendlyFire", va("%i", temp));
ADDRGP4 $662
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2984
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5110
;5110:	temp = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $2985
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 5111
;5111:	trap_Cvar_Set("ui_maxClients", va("%i", temp));
ADDRGP4 $662
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2986
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5112
;5112:	temp = trap_Cvar_VariableValue( "g_warmup" );
ADDRGP4 $279
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 5113
;5113:	trap_Cvar_Set("ui_Warmup", va("%i", temp));
ADDRGP4 $662
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2987
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5114
;5114:	temp = trap_Cvar_VariableValue( "sv_pure" );
ADDRGP4 $2988
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 5115
;5115:	trap_Cvar_Set("ui_pure", va("%i", temp));
ADDRGP4 $662
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2989
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5117
;5116:
;5117:	trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $649
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5118
;5118:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $650
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5119
;5119:	trap_Cvar_Set("cg_drawTimer", "1");
ADDRGP4 $2979
ARGP4
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5120
;5120:	trap_Cvar_Set("g_doWarmup", "1");
ADDRGP4 $2981
ARGP4
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5121
;5121:	trap_Cvar_Set("g_warmup", "15");
ADDRGP4 $279
ARGP4
ADDRGP4 $155
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5122
;5122:	trap_Cvar_Set("sv_pure", "0");
ADDRGP4 $2988
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5123
;5123:	trap_Cvar_Set("g_friendlyFire", "0");
ADDRGP4 $2983
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5124
;5124:	trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 1128
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2990
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5125
;5125:	trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $210
ARGP4
ADDRLP4 1132
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2991
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5127
;5126:
;5127:	if (trap_Cvar_VariableValue("ui_recordSPDemo")) {
ADDRGP4 $277
ARGP4
ADDRLP4 1136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1136
INDIRF4
CNSTF4 0
EQF4 $2992
line 5128
;5128:		Com_sprintf(buff, MAX_STRING_CHARS, "%s_%i", uiInfo.mapList[ui_currentMap.integer].mapLoadName, g);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2994
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5129
;5129:		trap_Cvar_Set("ui_recordSPDemoName", buff);
ADDRGP4 $2998
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5130
;5130:	}
LABELV $2992
line 5132
;5131:
;5132:	delay = 500;
ADDRLP4 1032
CNSTI4 500
ASGNI4
line 5134
;5133: 
;5134:	{
line 5135
;5135:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1044
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 5136
;5136:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $1015
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2985
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5138
;5137:
;5138:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers; i++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3005
JUMPV
LABELV $3002
line 5139
;5139:		{
line 5140
;5140:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "tangos", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3009
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1040
INDIRF4
ARGF4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $3016
ADDRLP4 1144
ADDRGP4 $119
ASGNP4
ADDRGP4 $3017
JUMPV
LABELV $3016
ADDRLP4 1144
ADDRGP4 $3012
ASGNP4
LABELV $3017
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5141
;5141:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5142
;5142:			delay += 500;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5143
;5143:		}
LABELV $3003
line 5138
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3005
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+16
ADDP4
INDIRI4
LTI4 $3002
line 5145
;5144:
;5145:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 1144
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1148
INDIRI4
ASGNI4
line 5146
;5146:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers-1; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3021
JUMPV
LABELV $3018
line 5147
;5147:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "seals", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3009
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1040
INDIRF4
ARGF4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $3031
ADDRLP4 1152
ADDRGP4 $119
ASGNP4
ADDRGP4 $3032
JUMPV
LABELV $3031
ADDRLP4 1152
ADDRGP4 $3027
ASGNP4
LABELV $3032
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5148
;5148:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5149
;5149:			delay += 500;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5150
;5150:		}
LABELV $3019
line 5146
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3021
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $3018
line 5151
;5151:	}
line 5152
;5152:	if (g >= GT_TEAM ) {
ADDRLP4 1036
INDIRI4
CNSTI4 1
LTI4 $3033
line 5153
;5153:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team seals\n" );
CNSTI4 2
ARGI4
ADDRGP4 $3035
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5154
;5154:	}
LABELV $3033
line 5155
;5155:}
LABELV $2962
endproc UI_StartSkirmish 1160 32
proc UI_Update 36 8
line 5157
;5156:
;5157:static void UI_Update(const char *name) {
line 5158
;5158:	int	val = trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 5160
;5159:
;5160: 	if (Q_stricmp(name, "ui_SetName") == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3039
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $3037
line 5161
;5161:		trap_Cvar_Set( "name", UI_Cvar_VariableString("ui_Name"));
ADDRGP4 $3040
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $1745
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5162
;5162: 	} else if (Q_stricmp(name, "ui_setRate") == 0) {
ADDRGP4 $3038
JUMPV
LABELV $3037
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3043
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $3041
line 5163
;5163:		float rate = trap_Cvar_VariableValue("rate");
ADDRGP4 $3044
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20
INDIRF4
ASGNF4
line 5164
;5164:		if (rate >= 5000) {
ADDRLP4 16
INDIRF4
CNSTF4 1167867904
LTF4 $3045
line 5165
;5165:			trap_Cvar_Set("cl_maxpackets", "30");
ADDRGP4 $3047
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5166
;5166:			trap_Cvar_Set("cl_packetdup", "1");
ADDRGP4 $3048
ARGP4
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5167
;5167:		} else if (rate >= 4000) {
ADDRGP4 $3042
JUMPV
LABELV $3045
ADDRLP4 16
INDIRF4
CNSTF4 1165623296
LTF4 $3049
line 5168
;5168:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $3047
ARGP4
ADDRGP4 $155
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5169
;5169:			trap_Cvar_Set("cl_packetdup", "2");		// favor less prediction errors when there's packet loss
ADDRGP4 $3048
ARGP4
ADDRGP4 $175
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5170
;5170:		} else {
ADDRGP4 $3042
JUMPV
LABELV $3049
line 5171
;5171:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $3047
ARGP4
ADDRGP4 $155
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5172
;5172:			trap_Cvar_Set("cl_packetdup", "1");		// favor lower bandwidth
ADDRGP4 $3048
ARGP4
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5173
;5173:		}
line 5174
;5174: 	} else if (Q_stricmp(name, "ui_GetName") == 0) {
ADDRGP4 $3042
JUMPV
LABELV $3041
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3053
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $3051
line 5175
;5175:		trap_Cvar_Set( "ui_Name", UI_Cvar_VariableString("name"));
ADDRGP4 $1745
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $3040
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5176
;5176: 	} else if (Q_stricmp(name, "r_colorbits") == 0) {
ADDRGP4 $3052
JUMPV
LABELV $3051
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3056
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $3054
line 5177
;5177:		switch (val) {
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $3062
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
GTI4 $3065
LABELV $3064
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $3059
ADDRGP4 $3055
JUMPV
LABELV $3065
ADDRLP4 0
INDIRI4
CNSTI4 32
EQI4 $3063
ADDRGP4 $3055
JUMPV
LABELV $3059
line 5179
;5178:			case 0:
;5179:				trap_Cvar_SetValue( "r_depthbits", 0 );
ADDRGP4 $3060
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5180
;5180:				trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $3061
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5181
;5181:			break;
ADDRGP4 $3055
JUMPV
LABELV $3062
line 5183
;5182:			case 16:
;5183:				trap_Cvar_SetValue( "r_depthbits", 16 );
ADDRGP4 $3060
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5184
;5184:				trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $3061
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5185
;5185:			break;
ADDRGP4 $3055
JUMPV
LABELV $3063
line 5187
;5186:			case 32:
;5187:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $3060
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5188
;5188:			break;
line 5190
;5189:		}
;5190:	} else if (Q_stricmp(name, "r_lodbias") == 0) {
ADDRGP4 $3055
JUMPV
LABELV $3054
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3068
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $3066
line 5191
;5191:		switch (val) {
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $3071
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $3073
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $3074
ADDRGP4 $3067
JUMPV
LABELV $3071
line 5193
;5192:			case 0:
;5193:				trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $3072
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5194
;5194:			break;
ADDRGP4 $3067
JUMPV
LABELV $3073
line 5196
;5195:			case 1:
;5196:				trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $3072
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5197
;5197:			break;
ADDRGP4 $3067
JUMPV
LABELV $3074
line 5199
;5198:			case 2:
;5199:				trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $3072
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5200
;5200:			break;
line 5202
;5201:		}
;5202:	} else if (Q_stricmp(name, "ui_glCustom") == 0) {
ADDRGP4 $3067
JUMPV
LABELV $3066
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3077
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3075
line 5203
;5203:		switch (val) {
ADDRLP4 32
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $3076
ADDRLP4 32
INDIRI4
CNSTI4 3
GTI4 $3076
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3095
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3095
address $3080
address $3091
address $3092
address $3094
code
LABELV $3080
line 5205
;5204:			case 0:	// high quality
;5205:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $3081
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5206
;5206:				trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $3072
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5207
;5207:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $3082
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5208
;5208:				trap_Cvar_SetValue( "r_lodbias", 0 );
ADDRGP4 $3068
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5209
;5209:				trap_Cvar_SetValue( "r_colorbits", 32 );
ADDRGP4 $3056
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5210
;5210:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $3060
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5211
;5211:				trap_Cvar_SetValue( "r_picmip", 0 );
ADDRGP4 $3083
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5212
;5212:				trap_Cvar_SetValue( "r_mode", 4 );
ADDRGP4 $3084
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5213
;5213:				trap_Cvar_SetValue( "r_texturebits", 32 );
ADDRGP4 $3085
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5214
;5214:				trap_Cvar_SetValue( "r_fastSky", 0 );
ADDRGP4 $3086
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5215
;5215:				trap_Cvar_SetValue( "r_inGameVideo", 1 );
ADDRGP4 $3087
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5216
;5216:				trap_Cvar_SetValue( "cg_shadows", 1 );
ADDRGP4 $3088
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5217
;5217:				trap_Cvar_SetValue( "cg_brassTime", 2500 );
ADDRGP4 $183
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5218
;5218:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $3089
ARGP4
ADDRGP4 $3090
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5219
;5219:			break;
ADDRGP4 $3076
JUMPV
LABELV $3091
line 5221
;5220:			case 1: // normal 
;5221:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $3081
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5222
;5222:				trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $3072
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5223
;5223:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $3082
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5224
;5224:				trap_Cvar_SetValue( "r_lodbias", 0 );
ADDRGP4 $3068
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5225
;5225:				trap_Cvar_SetValue( "r_colorbits", 0 );
ADDRGP4 $3056
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5226
;5226:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $3060
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5227
;5227:				trap_Cvar_SetValue( "r_picmip", 0 );
ADDRGP4 $3083
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5228
;5228:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $3084
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5229
;5229:				trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $3085
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5230
;5230:				trap_Cvar_SetValue( "r_fastSky", 0 );
ADDRGP4 $3086
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5231
;5231:				trap_Cvar_SetValue( "r_inGameVideo", 1 );
ADDRGP4 $3087
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5232
;5232:				trap_Cvar_SetValue( "cg_brassTime", 2500 );
ADDRGP4 $183
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5233
;5233:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $3089
ARGP4
ADDRGP4 $3090
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5234
;5234:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $3088
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5235
;5235:			break;
ADDRGP4 $3076
JUMPV
LABELV $3092
line 5237
;5236:			case 2: // fast
;5237:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $3081
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5238
;5238:				trap_Cvar_SetValue( "r_subdivisions", 8 );
ADDRGP4 $3072
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5239
;5239:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $3082
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5240
;5240:				trap_Cvar_SetValue( "r_lodbias", 1 );
ADDRGP4 $3068
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5241
;5241:				trap_Cvar_SetValue( "r_colorbits", 0 );
ADDRGP4 $3056
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5242
;5242:				trap_Cvar_SetValue( "r_depthbits", 0 );
ADDRGP4 $3060
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5243
;5243:				trap_Cvar_SetValue( "r_picmip", 1 );
ADDRGP4 $3083
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5244
;5244:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $3084
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5245
;5245:				trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $3085
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5246
;5246:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $3088
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5247
;5247:				trap_Cvar_SetValue( "r_fastSky", 1 );
ADDRGP4 $3086
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5248
;5248:				trap_Cvar_SetValue( "r_inGameVideo", 0 );
ADDRGP4 $3087
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5249
;5249:				trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $183
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5250
;5250:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $3089
ARGP4
ADDRGP4 $3093
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5251
;5251:			break;
ADDRGP4 $3076
JUMPV
LABELV $3094
line 5253
;5252:			case 3: // fastest
;5253:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $3081
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5254
;5254:				trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $3072
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5255
;5255:				trap_Cvar_SetValue( "r_vertexlight", 1 );
ADDRGP4 $3082
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5256
;5256:				trap_Cvar_SetValue( "r_lodbias", 2 );
ADDRGP4 $3068
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5257
;5257:				trap_Cvar_SetValue( "r_colorbits", 16 );
ADDRGP4 $3056
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5258
;5258:				trap_Cvar_SetValue( "r_depthbits", 16 );
ADDRGP4 $3060
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5259
;5259:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $3084
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5260
;5260:				trap_Cvar_SetValue( "r_picmip", 2 );
ADDRGP4 $3083
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5261
;5261:				trap_Cvar_SetValue( "r_texturebits", 16 );
ADDRGP4 $3085
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5262
;5262:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $3088
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5263
;5263:				trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $183
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5264
;5264:				trap_Cvar_SetValue( "r_fastSky", 1 );
ADDRGP4 $3086
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5265
;5265:				trap_Cvar_SetValue( "r_inGameVideo", 0 );
ADDRGP4 $3087
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5266
;5266:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $3089
ARGP4
ADDRGP4 $3093
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5267
;5267:			break;
line 5269
;5268:		}
;5269:	} else if (Q_stricmp(name, "ui_mousePitch") == 0) {
ADDRGP4 $3076
JUMPV
LABELV $3075
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3098
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $3096
line 5270
;5270:		if (val == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $3099
line 5271
;5271:			trap_Cvar_SetValue( "m_pitch", 0.022f );
ADDRGP4 $3101
ARGP4
CNSTF4 1018444120
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5272
;5272:		} else {
ADDRGP4 $3100
JUMPV
LABELV $3099
line 5273
;5273:			trap_Cvar_SetValue( "m_pitch", -0.022f );
ADDRGP4 $3101
ARGP4
CNSTF4 3165927768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5274
;5274:		}
LABELV $3100
line 5275
;5275:	}
LABELV $3096
LABELV $3076
LABELV $3067
LABELV $3055
LABELV $3052
LABELV $3042
LABELV $3038
line 5276
;5276:}
LABELV $3036
endproc UI_Update 36 8
proc UI_RunMenuScript 2284 96
line 5278
;5277:
;5278:static void UI_RunMenuScript(char **args) {
line 5282
;5279:	const char *name, *name2;
;5280:	char buff[1024];
;5281:
;5282:	if (String_Parse(args, &name))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $3103
line 5283
;5283:	{ 
line 5284
;5284:		if ( Q_stricmp(name, "freexp") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3107
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $3105
line 5286
;5285:			//Com_Printf("freexp\n");
;5286:			CG_FreeXP();
ADDRGP4 CG_FreeXP
CALLV
pop
line 5287
;5287:		} else if ( Q_stricmp(name, "copyCharacter") == 0) {
ADDRGP4 $3106
JUMPV
LABELV $3105
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3110
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $3108
line 5289
;5288:			//Com_Printf("copyCharacter\n");
;5289:			CG_CopyCharacterVariables();
ADDRGP4 CG_CopyCharacterVariables
CALLV
pop
line 5290
;5290:		} else if ( Q_stricmp(name, "initialCharacter") == 0) {
ADDRGP4 $3109
JUMPV
LABELV $3108
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3113
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $3111
line 5292
;5291:			//Com_Printf("initialCharacter\n");
;5292:			CG_InitialCharacterVariables();
ADDRGP4 CG_InitialCharacterVariables
CALLV
pop
line 5293
;5293:		} else if ( Q_stricmp(name, "updateCharacter") == 0) {
ADDRGP4 $3112
JUMPV
LABELV $3111
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3116
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $3114
line 5295
;5294:			//Com_Printf("updateCharacter\n");
;5295:			CG_CopyCharacterVariablesBack();
ADDRGP4 CG_CopyCharacterVariablesBack
CALLV
pop
line 5296
;5296:			CG_SetCharacter();
ADDRGP4 CG_SetCharacter
CALLV
pop
line 5297
;5297:		}	else if ( Q_stricmp(name, "updateInventory") == 0 ) {
ADDRGP4 $3115
JUMPV
LABELV $3114
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3119
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $3117
line 5338
;5298:			char *command;
;5299:
;5300:			int primary ;
;5301:			int secondary;
;5302:			int priammo;
;5303:			int secammo;
;5304:			
;5305:			int mmgrenades;
;5306:			int grenades;
;5307:			int fl_grenades; 
;5308:			int sm_grenades;
;5309:
;5310:			int kevlar;
;5311:			int helmet;
;5312:
;5313:			int scope;
;5314:			int gl;
;5315:			int bayonet;
;5316:			int lasersight;
;5317:			int silencer;
;5318:			int	duckbill;
;5319:			int	flashlight;
;5320:
;5321:			int scope_secondary;
;5322:			int gl_secondary;
;5323:			int bayonet_secondary;
;5324:			int lasersight_secondary; 
;5325:			int silencer_secondary;
;5326:
;5327:			char		var[MAX_TOKEN_CHARS];
;5328:			
;5329:			gitem_t *it_primary;
;5330:			gitem_t *it_secondary;
;5331:
;5332:			//Com_Printf("updateInventory\n");
;5333:			//Com_Printf(S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: ui_main.c / UI_RunMenuScript\n");
;5334:
;5335:			//
;5336:			// secondary weapon items
;5337:			//
;5338:			trap_Cvar_VariableStringBuffer("inven_lasersight_secondary", var , sizeof(var ) );
ADDRGP4 $2032
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5339
;5339:			lasersight_secondary = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2180
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2164
ADDRLP4 2180
INDIRI4
ASGNI4
line 5341
;5340:
;5341:			trap_Cvar_VariableStringBuffer("inven_bayonet_secondary", var , sizeof(var ) );
ADDRGP4 $3120
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5342
;5342:			bayonet_secondary = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2160
ADDRLP4 2184
INDIRI4
ASGNI4
line 5344
;5343:
;5344:			trap_Cvar_VariableStringBuffer("inven_grenadelauncher_secondary", var , sizeof(var ) );
ADDRGP4 $3121
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5345
;5345:			gl_secondary = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2188
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2156
ADDRLP4 2188
INDIRI4
ASGNI4
line 5347
;5346:
;5347:			trap_Cvar_VariableStringBuffer("inven_scope_secondary", var , sizeof(var ) );
ADDRGP4 $3122
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5348
;5348:			scope_secondary = atoi(var); 
ADDRLP4 1056
ARGP4
ADDRLP4 2192
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2152
ADDRLP4 2192
INDIRI4
ASGNI4
line 5350
;5349:
;5350:			trap_Cvar_VariableStringBuffer("inven_silencer_secondary", var , sizeof(var ) );
ADDRGP4 $2022
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5351
;5351:			silencer_secondary = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2168
ADDRLP4 2196
INDIRI4
ASGNI4
line 5356
;5352:
;5353:			//
;5354:			// primary weapon items
;5355:			//
;5356:			trap_Cvar_VariableStringBuffer("inven_lasersight", var , sizeof(var ) );
ADDRGP4 $1996
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5357
;5357:			lasersight = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2200
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2136
ADDRLP4 2200
INDIRI4
ASGNI4
line 5359
;5358:
;5359:			trap_Cvar_VariableStringBuffer("inven_bayonet", var , sizeof(var ) );
ADDRGP4 $1967
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5360
;5360:			bayonet = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2132
ADDRLP4 2204
INDIRI4
ASGNI4
line 5362
;5361:
;5362:			trap_Cvar_VariableStringBuffer("inven_grenadelauncher", var , sizeof(var ) );
ADDRGP4 $1966
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5363
;5363:			gl = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2208
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2128
ADDRLP4 2208
INDIRI4
ASGNI4
line 5365
;5364:
;5365:			trap_Cvar_VariableStringBuffer("inven_scope", var , sizeof(var ) );
ADDRGP4 $1997
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5366
;5366:			scope = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2212
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2124
ADDRLP4 2212
INDIRI4
ASGNI4
line 5368
;5367:
;5368:			trap_Cvar_VariableStringBuffer("inven_silencer", var , sizeof(var ) );
ADDRGP4 $1941
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5369
;5369:			silencer = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2216
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2140
ADDRLP4 2216
INDIRI4
ASGNI4
line 5371
;5370:
;5371:			trap_Cvar_VariableStringBuffer("inven_duckbill", var , sizeof(var ) );
ADDRGP4 $1940
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5372
;5372:			duckbill = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2220
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2144
ADDRLP4 2220
INDIRI4
ASGNI4
line 5374
;5373:
;5374:			trap_Cvar_VariableStringBuffer("inven_flashlight", var , sizeof(var ) );
ADDRGP4 $1968
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5375
;5375:			flashlight = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2224
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2148
ADDRLP4 2224
INDIRI4
ASGNI4
line 5381
;5376:
;5377:
;5378:			//
;5379:			// equipment
;5380:			//
;5381:			trap_Cvar_VariableStringBuffer("inven_helmet", var , sizeof(var ) );
ADDRGP4 $2048
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5382
;5382:			helmet = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2228
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2120
ADDRLP4 2228
INDIRI4
ASGNI4
line 5384
;5383:
;5384:			trap_Cvar_VariableStringBuffer("inven_kevlar", var , sizeof(var ) );
ADDRGP4 $2049
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5385
;5385:			kevlar = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2232
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2116
ADDRLP4 2232
INDIRI4
ASGNI4
line 5390
;5386:
;5387:			//
;5388:			// grenades
;5389:			//
;5390:			trap_Cvar_VariableStringBuffer("inven_ammo_flash", var , sizeof(var ) );
ADDRGP4 $724
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5391
;5391:			fl_grenades = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2236
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2108
ADDRLP4 2236
INDIRI4
ASGNI4
line 5393
;5392:
;5393:			trap_Cvar_VariableStringBuffer("inven_ammo_smoke", var , sizeof(var ) );
ADDRGP4 $725
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5394
;5394:			sm_grenades = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2240
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2112
ADDRLP4 2240
INDIRI4
ASGNI4
line 5396
;5395:
;5396:			trap_Cvar_VariableStringBuffer("inven_ammo_mk26", var , sizeof(var ) );
ADDRGP4 $727
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5397
;5397:			grenades = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2244
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2104
ADDRLP4 2244
INDIRI4
ASGNI4
line 5399
;5398:
;5399:			trap_Cvar_VariableStringBuffer("inven_ammo_40mmgren", var , sizeof(var ) );
ADDRGP4 $726
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5400
;5400:			mmgrenades = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2248
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2100
ADDRLP4 2248
INDIRI4
ASGNI4
line 5405
;5401:
;5402:			//
;5403:			// primary weapon
;5404:			//
;5405:			trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1942
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5406
;5406:			primary = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2252
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2080
ADDRLP4 2252
INDIRI4
ASGNI4
line 5411
;5407:
;5408:			//
;5409:			// secondary weapon
;5410:			//
;5411:			trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof(var ) );
ADDRGP4 $2023
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5412
;5412:			secondary = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2256
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2084
ADDRLP4 2256
INDIRI4
ASGNI4
line 5417
;5413:
;5414:			//
;5415:			// ammo
;5416:			//
;5417:			trap_Cvar_VariableStringBuffer("inven_ammo_primary", var , sizeof(var ) );
ADDRGP4 $2050
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5418
;5418:			priammo = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2260
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2092
ADDRLP4 2260
INDIRI4
ASGNI4
line 5420
;5419:
;5420:			trap_Cvar_VariableStringBuffer("inven_ammo_secondary", var , sizeof(var ) );
ADDRGP4 $2051
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5421
;5421:			secammo = atoi(var);
ADDRLP4 1056
ARGP4
ADDRLP4 2264
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2096
ADDRLP4 2264
INDIRI4
ASGNI4
line 5426
;5422:
;5423:			//
;5424:			// character
;5425:			//
;5426:			trap_Cvar_VariableStringBuffer("character", var, sizeof(var));
ADDRGP4 $2382
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5428
;5427:
;5428:			if ( primary )
ADDRLP4 2080
INDIRI4
CNSTI4 0
EQI4 $3123
line 5429
;5429:				it_primary = BG_FindItemForWeapon( primary );
ADDRLP4 2080
INDIRI4
ARGI4
ADDRLP4 2268
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 2172
ADDRLP4 2268
INDIRP4
ASGNP4
LABELV $3123
line 5430
;5430:			if ( secondary )
ADDRLP4 2084
INDIRI4
CNSTI4 0
EQI4 $3125
line 5431
;5431:				it_secondary = BG_FindItemForWeapon( secondary );
ADDRLP4 2084
INDIRI4
ARGI4
ADDRLP4 2272
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 2176
ADDRLP4 2272
INDIRP4
ASGNP4
LABELV $3125
line 5435
;5432:
;5433:		//	<cmd>  <primary> <secondary> <PriAmmo> <SecAmmo> <40mm grenades> <Grenades> 
;5434:		// <Fl Grenades> <SmokeGrenades> <kevlar> <helmet> <scope secondary > <scope secondary> <character>
;5435:			command = va("%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %s", 
ADDRGP4 $3127
ARGP4
ADDRLP4 2080
INDIRI4
ARGI4
ADDRLP4 2084
INDIRI4
ARGI4
ADDRLP4 2092
INDIRI4
ARGI4
ADDRLP4 2096
INDIRI4
ARGI4
ADDRLP4 2100
INDIRI4
ARGI4
ADDRLP4 2104
INDIRI4
ARGI4
ADDRLP4 2108
INDIRI4
ARGI4
ADDRLP4 2112
INDIRI4
ARGI4
ADDRLP4 2116
INDIRI4
ARGI4
ADDRLP4 2120
INDIRI4
ARGI4
ADDRLP4 2124
INDIRI4
ARGI4
ADDRLP4 2128
INDIRI4
ARGI4
ADDRLP4 2132
INDIRI4
ARGI4
ADDRLP4 2136
INDIRI4
ARGI4
ADDRLP4 2140
INDIRI4
ARGI4
ADDRLP4 2152
INDIRI4
ARGI4
ADDRLP4 2156
INDIRI4
ARGI4
ADDRLP4 2160
INDIRI4
ARGI4
ADDRLP4 2164
INDIRI4
ARGI4
ADDRLP4 2168
INDIRI4
ARGI4
ADDRLP4 2144
INDIRI4
ARGI4
ADDRLP4 2148
INDIRI4
ARGI4
ADDRLP4 1056
ARGP4
ADDRLP4 2276
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2088
ADDRLP4 2276
INDIRP4
ASGNP4
line 5450
;5436:				// 1        2        3       4
;5437:			  primary,secondary,priammo,secammo,
;5438:				// 5        6        7            8
;5439:			  mmgrenades,grenades,fl_grenades,sm_grenades,
;5440:				// 9    10     11   12  13
;5441:				kevlar,helmet,scope,gl,bayonet,
;5442:				// 14        15      16
;5443:				lasersight,silencer,scope_secondary,
;5444:				// 17         18                 19
;5445:				gl_secondary,bayonet_secondary,lasersight_secondary,
;5446:				// 20                21          22       23
;5447:				silencer_secondary, duckbill, flashlight, var );
;5448:
;5449:			//then send the commmand		
;5450:			trap_Cmd_ExecuteText( EXEC_APPEND, va("inventory %s\n", command) );  
ADDRGP4 $3128
ARGP4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRLP4 2280
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 2280
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5452
;5451:
;5452:		} else if ( Q_stricmp(name, "updateLooks") == 0 )
ADDRGP4 $3118
JUMPV
LABELV $3117
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3131
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $3129
line 5453
;5453:		{
line 5454
;5454:			trap_Cmd_ExecuteText( EXEC_APPEND, va("looks") );
ADDRGP4 $3132
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5455
;5455:		}
ADDRGP4 $3130
JUMPV
LABELV $3129
line 5456
;5456:		else if ( Q_stricmp(name, "removePrimaryWeaponItems") == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3135
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $3133
line 5457
;5457:		{ 
line 5468
;5458:
;5459:		/*	trap_Cvar_Set("inven_Scope", "0");
;5460:			trap_Cvar_Set("inven_GrenadeLauncher", "0");
;5461:			trap_Cvar_Set("inven_LaserSight", "0");
;5462:			trap_Cvar_Set("inven_Bayonet", "0");
;5463:			trap_Cvar_Set("inven_Silencer", "0");
;5464:			trap_Cvar_Set("inven_Duckbill", "0");
;5465:			trap_Cvar_Set("inven_Flashlight", "0");
;5466:
;5467:			Com_Printf("Removed Primary Items!\n");  */
;5468:		}  
ADDRGP4 $3134
JUMPV
LABELV $3133
line 5469
;5469:		else if ( Q_stricmp(name, "removeSecondaryWeaponItems") == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3138
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $3136
line 5470
;5470:		{ 
line 5481
;5471:/*
;5472:			trap_Cvar_Set("inven_Scope_Secondary", "0");
;5473:			trap_Cvar_Set("inven_GrenadeLauncher_Secondary", "0");
;5474:			trap_Cvar_Set("inven_LaserSight_Secondary", "0");
;5475:			trap_Cvar_Set("inven_Bayonet_Secondary", "0");
;5476:			trap_Cvar_Set("inven_Silencer_Secondary", "0");
;5477:			trap_Cvar_Set("inven_Duckbill_Secondary", "0");
;5478:			trap_Cvar_Set("inven_Flashlight_Secondary", "0");
;5479:
;5480:			Com_Printf("Removed Secondary Items!\n"); */
;5481:		} 
ADDRGP4 $3137
JUMPV
LABELV $3136
line 5482
;5482:		else if (Q_stricmp(name, "StartServer") == 0) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3141
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $3139
line 5483
;5483:		{
line 5487
;5484:			int i, clients;
;5485:			float skill;
;5486:
;5487:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $650
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5488
;5488:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $649
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5489
;5489:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $246
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5490
;5490:			trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, ui_dedicated.integer ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRGP4 ui_dedicated+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1084
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $3142
ARGP4
ADDRLP4 1084
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5491
;5491:			trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 8, uiInfo.gameTypes[ui_netGameType.integer].gtEnum ) );
CNSTF4 0
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1088
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $1661
ARGP4
ADDRLP4 1088
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 5493
;5492:
;5493:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName ) );
ADDRGP4 $2970
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5495
;5494:
;5495:			skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $174
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1096
INDIRF4
ASGNF4
line 5498
;5496:
;5497:			// set max clients based on spots
;5498:			clients = 0;
ADDRLP4 1076
CNSTI4 0
ASGNI4
line 5499
;5499:			for (i = 0; i < PLAYERS_PER_TEAM; i++) {
ADDRLP4 1072
CNSTI4 0
ASGNI4
LABELV $3150
line 5500
;5500:				int bot = trap_Cvar_VariableValue( va("ui_blueteam%i", i+1));
ADDRGP4 $1143
ARGP4
ADDRLP4 1072
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1100
ADDRLP4 1108
INDIRF4
CVFI4 4
ASGNI4
line 5501
;5501:				if (bot >= 0) {
ADDRLP4 1100
INDIRI4
CNSTI4 0
LTI4 $3154
line 5502
;5502:					clients++;
ADDRLP4 1076
ADDRLP4 1076
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5503
;5503:				}
LABELV $3154
line 5504
;5504:				bot = trap_Cvar_VariableValue( va("ui_redteam%i", i+1));
ADDRGP4 $1144
ARGP4
ADDRLP4 1072
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1100
ADDRLP4 1116
INDIRF4
CVFI4 4
ASGNI4
line 5505
;5505:				if (bot >= 0) {
ADDRLP4 1100
INDIRI4
CNSTI4 0
LTI4 $3156
line 5506
;5506:					clients++;
ADDRLP4 1076
ADDRLP4 1076
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5507
;5507:				}
LABELV $3156
line 5508
;5508:			}
LABELV $3151
line 5499
ADDRLP4 1072
ADDRLP4 1072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 6
LTI4 $3150
line 5509
;5509:			if (clients == 0) {
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $3158
line 5510
;5510:				clients = PLAYERS_PER_TEAM*2;
ADDRLP4 1076
CNSTI4 12
ASGNI4
line 5511
;5511:			}
LABELV $3158
line 5512
;5512:			trap_Cvar_Set("sv_maxClients", va("%d",clients));
ADDRGP4 $1015
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2985
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5514
;5513:
;5514:			for (i = 0; i < PLAYERS_PER_TEAM; i++) {
ADDRLP4 1072
CNSTI4 0
ASGNI4
LABELV $3160
line 5515
;5515:				int bot = trap_Cvar_VariableValue( va("ui_blueteam%i", i+1));
ADDRGP4 $1143
ARGP4
ADDRLP4 1072
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1104
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 5516
;5516:				if (bot > 1) {
ADDRLP4 1104
INDIRI4
CNSTI4 1
LEI4 $3164
line 5517
;5517:					if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 1
LTI4 $3166
line 5518
;5518:						Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", uiInfo.characterList[bot-2].name, skill, "tangos");
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3169
ARGP4
ADDRLP4 1104
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500-32
ADDP4
INDIRP4
ARGP4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRGP4 $3012
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5519
;5519:					} else {
ADDRGP4 $3167
JUMPV
LABELV $3166
line 5520
;5520:						Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1104
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1116
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3172
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 5521
;5521:					}
LABELV $3167
line 5522
;5522:					trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5523
;5523:				}
LABELV $3164
line 5524
;5524:				bot = trap_Cvar_VariableValue( va("ui_redteam%i", i+1));
ADDRGP4 $1144
ARGP4
ADDRLP4 1072
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1104
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 5525
;5525:				if (bot > 1) {
ADDRLP4 1104
INDIRI4
CNSTI4 1
LEI4 $3173
line 5526
;5526:					if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 1
LTI4 $3175
line 5527
;5527:						Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", uiInfo.characterList[bot-2].name, skill, "seals");
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3169
ARGP4
ADDRLP4 1104
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500-32
ADDP4
INDIRP4
ARGP4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRGP4 $3027
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5528
;5528:					} else {
ADDRGP4 $3176
JUMPV
LABELV $3175
line 5529
;5529:						Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1104
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1124
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3172
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 5530
;5530:					}
LABELV $3176
line 5531
;5531:					trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5532
;5532:				}
LABELV $3173
line 5533
;5533:			}
LABELV $3161
line 5514
ADDRLP4 1072
ADDRLP4 1072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 6
LTI4 $3160
line 5534
;5534:		} else if (Q_stricmp(name, "updateSPMenu") == 0) {
ADDRGP4 $3140
JUMPV
LABELV $3139
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3182
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $3180
line 5535
;5535:			UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 5536
;5536:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 5537
;5537:			ui_mapIndex.integer = UI_GetIndexFromSelection(ui_currentMap.integer);
ADDRGP4 ui_currentMap+12
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 UI_GetIndexFromSelection
CALLI4
ASGNI4
ADDRGP4 ui_mapIndex+12
ADDRLP4 1076
INDIRI4
ASGNI4
line 5538
;5538:			trap_Cvar_Set("ui_mapIndex", va("%d", ui_mapIndex.integer));
ADDRGP4 $1015
ARGP4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $238
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5539
;5539:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, ui_mapIndex.integer, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRGP4 $2961
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5540
;5540:			UI_GameType_HandleKey(0, 0, K_MOUSE1, qfalse);
ADDRLP4 1084
CNSTI4 0
ASGNI4
ADDRLP4 1084
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 178
ARGI4
ADDRLP4 1084
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 5541
;5541:			UI_GameType_HandleKey(0, 0, K_MOUSE2, qfalse);
ADDRLP4 1088
CNSTI4 0
ASGNI4
ADDRLP4 1088
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 179
ARGI4
ADDRLP4 1088
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 5542
;5542:		} else if (Q_stricmp(name, "resetDefaults") == 0) 
ADDRGP4 $3181
JUMPV
LABELV $3180
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3189
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $3187
line 5543
;5543:		{
line 5544
;5544:			trap_Cmd_ExecuteText( EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $3190
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5545
;5545:			trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $3191
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5546
;5546:			Controls_SetDefaults();
ADDRGP4 Controls_SetDefaults
CALLV
pop
line 5547
;5547:			trap_Cvar_Set("com_introPlayed", "1" );
ADDRGP4 $3192
ARGP4
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5548
;5548:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $3193
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5549
;5549:		} else if (Q_stricmp(name, "getCDKey") == 0) {
ADDRGP4 $3188
JUMPV
LABELV $3187
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3196
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $3194
line 5551
;5550:			char out[17];
;5551:			trap_GetCDKey(buff, 17);
ADDRLP4 4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 trap_GetCDKey
CALLV
pop
line 5552
;5552:			trap_Cvar_Set("cdkey1", "");
ADDRGP4 $3197
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5553
;5553:			trap_Cvar_Set("cdkey2", "");
ADDRGP4 $3198
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5554
;5554:			trap_Cvar_Set("cdkey3", "");
ADDRGP4 $3199
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5555
;5555:			trap_Cvar_Set("cdkey4", "");
ADDRGP4 $3200
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5556
;5556:			if (strlen(buff) == CDKEY_LEN) {
ADDRLP4 4
ARGP4
ADDRLP4 1104
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 16
NEI4 $3195
line 5557
;5557:				Q_strncpyz(out, buff, 5);
ADDRLP4 1084
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5558
;5558:				trap_Cvar_Set("cdkey1", out);
ADDRGP4 $3197
ARGP4
ADDRLP4 1084
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5559
;5559:				Q_strncpyz(out, buff + 4, 5);
ADDRLP4 1084
ARGP4
ADDRLP4 4+4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5560
;5560:				trap_Cvar_Set("cdkey2", out);
ADDRGP4 $3198
ARGP4
ADDRLP4 1084
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5561
;5561:				Q_strncpyz(out, buff + 8, 5);
ADDRLP4 1084
ARGP4
ADDRLP4 4+8
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5562
;5562:				trap_Cvar_Set("cdkey3", out);
ADDRGP4 $3199
ARGP4
ADDRLP4 1084
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5563
;5563:				Q_strncpyz(out, buff + 12, 5);
ADDRLP4 1084
ARGP4
ADDRLP4 4+12
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5564
;5564:				trap_Cvar_Set("cdkey4", out);
ADDRGP4 $3200
ARGP4
ADDRLP4 1084
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5565
;5565:			}
line 5567
;5566:
;5567:		} else if (Q_stricmp(name, "verifyCDKey") == 0) {
ADDRGP4 $3195
JUMPV
LABELV $3194
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3208
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $3206
line 5568
;5568:			buff[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 5569
;5569:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey1")); 
ADDRGP4 $3197
ARGP4
ADDRLP4 1088
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 5570
;5570:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey2")); 
ADDRGP4 $3198
ARGP4
ADDRLP4 1092
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 5571
;5571:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey3")); 
ADDRGP4 $3199
ARGP4
ADDRLP4 1096
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 5572
;5572:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey4")); 
ADDRGP4 $3200
ARGP4
ADDRLP4 1100
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 5573
;5573:			trap_Cvar_Set("cdkey", buff);
ADDRGP4 $3209
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5574
;5574:			if (trap_VerifyCDKey(buff, UI_Cvar_VariableString("cdkeychecksum"))) {
ADDRGP4 $3212
ARGP4
ADDRLP4 1104
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 trap_VerifyCDKey
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
EQI4 $3210
line 5575
;5575:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key Appears to be valid.");
ADDRGP4 $3213
ARGP4
ADDRGP4 $3214
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5576
;5576:				trap_SetCDKey(buff);
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetCDKey
CALLV
pop
line 5577
;5577:			} else {
ADDRGP4 $3207
JUMPV
LABELV $3210
line 5578
;5578:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key does not appear to be valid.");
ADDRGP4 $3213
ARGP4
ADDRGP4 $3215
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5579
;5579:			}
line 5580
;5580:		} else if (Q_stricmp(name, "loadArenas") == 0) {
ADDRGP4 $3207
JUMPV
LABELV $3206
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3218
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $3216
line 5581
;5581:			UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 5582
;5582:			UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 5583
;5583:			Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, "createserver");
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $3219
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5584
;5584:		} else if (Q_stricmp(name, "saveControls") == 0) {
ADDRGP4 $3217
JUMPV
LABELV $3216
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3222
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $3220
line 5585
;5585:			Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 5586
;5586:		} else if (Q_stricmp(name, "loadControls") == 0) {
ADDRGP4 $3221
JUMPV
LABELV $3220
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3225
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $3223
line 5587
;5587:			Controls_GetConfig();
ADDRGP4 Controls_GetConfig
CALLV
pop
line 5588
;5588:		} else if (Q_stricmp(name, "clearError") == 0) {
ADDRGP4 $3224
JUMPV
LABELV $3223
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3228
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $3226
line 5589
;5589:			trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $3229
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5590
;5590:		} else if (Q_stricmp(name, "loadGameInfo") == 0) {
ADDRGP4 $3227
JUMPV
LABELV $3226
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3232
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $3230
line 5594
;5591:#ifdef PRE_RELEASE_TADEMO
;5592:			UI_ParseGameInfo("demogameinfo.txt");
;5593:#else
;5594:			UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $984
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 5596
;5595:#endif
;5596:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 5597
;5597:		} else if (Q_stricmp(name, "resetScores") == 0) {
ADDRGP4 $3231
JUMPV
LABELV $3230
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3241
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $3239
line 5598
;5598:			UI_ClearScores();
ADDRGP4 UI_ClearScores
CALLV
pop
line 5599
;5599:		} else if (Q_stricmp(name, "RefreshServers") == 0) {
ADDRGP4 $3240
JUMPV
LABELV $3239
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3244
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $3242
line 5600
;5600:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 5601
;5601:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 5602
;5602:		} else if (Q_stricmp(name, "RefreshFilter") == 0) {
ADDRGP4 $3243
JUMPV
LABELV $3242
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3247
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $3245
line 5603
;5603:			UI_StartServerRefresh(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 5604
;5604:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 5605
;5605:		} else if (Q_stricmp(name, "RunSPDemo") == 0) {
ADDRGP4 $3246
JUMPV
LABELV $3245
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3250
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $3248
line 5606
;5606:			if (uiInfo.demoAvailable) {
ADDRGP4 uiInfo+73484
INDIRI4
CNSTI4 0
EQI4 $3249
line 5607
;5607:			  trap_Cmd_ExecuteText( EXEC_APPEND, va("demo %s_%i", uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum));
ADDRGP4 $3254
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5608
;5608:			}
line 5609
;5609:		} else if (Q_stricmp(name, "LoadDemos") == 0) {
ADDRGP4 $3249
JUMPV
LABELV $3248
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3263
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $3261
line 5610
;5610:			UI_LoadDemos();
ADDRGP4 UI_LoadDemos
CALLV
pop
line 5611
;5611:		} else if (Q_stricmp(name, "LoadScripts") == 0) {
ADDRGP4 $3262
JUMPV
LABELV $3261
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3266
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $3264
line 5612
;5612:			UI_LoadScripts();
ADDRGP4 UI_LoadScripts
CALLV
pop
line 5613
;5613:		} 		 
ADDRGP4 $3265
JUMPV
LABELV $3264
line 5614
;5614:		else if (Q_stricmp(name, "LoadMovies") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3269
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $3267
line 5615
;5615:			UI_LoadMovies();
ADDRGP4 UI_LoadMovies
CALLV
pop
line 5616
;5616:		} else if (Q_stricmp(name, "LoadMods") == 0) {
ADDRGP4 $3268
JUMPV
LABELV $3267
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3272
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $3270
line 5617
;5617:			UI_LoadMods();
ADDRGP4 UI_LoadMods
CALLV
pop
line 5618
;5618:		} else if (Q_stricmp(name, "playMovie") == 0) {
ADDRGP4 $3271
JUMPV
LABELV $3270
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3275
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $3273
line 5619
;5619:			if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99832
INDIRI4
CNSTI4 0
LTI4 $3276
line 5620
;5620:			  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99832
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 5621
;5621:			}
LABELV $3276
line 5622
;5622:			trap_Cmd_ExecuteText( EXEC_APPEND, va("cinematic %s.roq 2\n", uiInfo.movieList[uiInfo.movieIndex]));
ADDRGP4 $3280
ARGP4
ADDRGP4 uiInfo+99828
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98800
ADDP4
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5623
;5623:		} else if (Q_stricmp(name, "RunMod") == 0) {
ADDRGP4 $3274
JUMPV
LABELV $3273
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3285
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $3283
line 5624
;5624:			trap_Cvar_Set( "fs_game", uiInfo.modList[uiInfo.modIndex].modName);
ADDRGP4 $3286
ARGP4
ADDRGP4 uiInfo+96732
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96216
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5625
;5625:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $3289
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5626
;5626:		} else if (Q_stricmp(name, "RunDemo") == 0) {
ADDRGP4 $3284
JUMPV
LABELV $3283
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3292
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $3290
line 5627
;5627:			trap_Cmd_ExecuteText( EXEC_APPEND, va("demo %s\n", uiInfo.demoList[uiInfo.demoIndex]));
ADDRGP4 $3293
ARGP4
ADDRGP4 uiInfo+98796
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97768
ADDP4
INDIRP4
ARGP4
ADDRLP4 1152
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5628
;5628:		} else if (Q_stricmp(name, "RunScript") == 0) {
ADDRGP4 $3291
JUMPV
LABELV $3290
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3298
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $3296
line 5629
;5629:			trap_Cmd_ExecuteText( EXEC_APPEND, va("exec nssl/%s.cfg\n", scriptList[uiInfo.scriptIndex]));
ADDRGP4 $3299
ARGP4
ADDRGP4 uiInfo+97764
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 scriptList
ADDP4
ARGP4
ADDRLP4 1156
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5630
;5630:		} else if (Q_stricmp(name, "Quake3") == 0) {
ADDRGP4 $3297
JUMPV
LABELV $3296
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3303
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $3301
line 5631
;5631:			trap_Cvar_Set( "fs_game", "");
ADDRGP4 $3286
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5632
;5632:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $3289
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5633
;5633:		} else if (Q_stricmp(name, "closeJoin") == 0) {
ADDRGP4 $3302
JUMPV
LABELV $3301
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3306
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $3304
line 5634
;5634:			if (uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99836+1124
INDIRI4
CNSTI4 0
EQI4 $3307
line 5635
;5635:				UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 5636
;5636:				uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+99836+9332
CNSTI4 0
ASGNI4
line 5637
;5637:				uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+113628
CNSTI4 0
ASGNI4
line 5638
;5638:				uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+118956
CNSTI4 0
ASGNI4
line 5639
;5639:				UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 5640
;5640:			} else {
ADDRGP4 $3305
JUMPV
LABELV $3307
line 5641
;5641:				Menus_CloseByName("joinserver");
ADDRGP4 $3315
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 5642
;5642:				Menus_OpenByName("main");
ADDRGP4 $3316
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 5643
;5643:			}
line 5644
;5644:		} else if (Q_stricmp(name, "StopRefresh") == 0) {
ADDRGP4 $3305
JUMPV
LABELV $3304
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3319
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $3317
line 5645
;5645:			UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 5646
;5646:			uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+99836+9332
CNSTI4 0
ASGNI4
line 5647
;5647:			uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+113628
CNSTI4 0
ASGNI4
line 5648
;5648:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+118956
CNSTI4 0
ASGNI4
line 5649
;5649:		} else if (Q_stricmp(name, "UpdateFilter") == 0) {
ADDRGP4 $3318
JUMPV
LABELV $3317
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3326
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $3324
line 5650
;5650:			if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $3327
line 5651
;5651:				UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 5652
;5652:			}
LABELV $3327
line 5653
;5653:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 5654
;5654:			UI_FeederSelection(FEEDER_SERVERS, 0);
CNSTF4 1073741824
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 5655
;5655:		} else if (Q_stricmp(name, "ServerStatus") == 0) {
ADDRGP4 $3325
JUMPV
LABELV $3324
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3332
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $3330
line 5656
;5656:			trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], uiInfo.serverStatusAddress, sizeof(uiInfo.serverStatusAddress));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+1128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
ADDRGP4 uiInfo+110232
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 5657
;5657:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 5658
;5658:		} else if (Q_stricmp(name, "FoundPlayerServerStatus") == 0) {
ADDRGP4 $3331
JUMPV
LABELV $3330
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3342
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $3340
line 5659
;5659:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+110232
ARGP4
ADDRGP4 uiInfo+118948
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+116900
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5660
;5660:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 5661
;5661:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5662
;5662:		} else if (Q_stricmp(name, "FindPlayer") == 0) {
ADDRGP4 $3341
JUMPV
LABELV $3340
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3349
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $3347
line 5663
;5663:			UI_BuildFindPlayerList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 5665
;5664:			// clear the displayed server status info
;5665:			uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+110296+3328
CNSTI4 0
ASGNI4
line 5666
;5666:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5667
;5667:		} else if (Q_stricmp(name, "JoinServer") == 0) {
ADDRGP4 $3348
JUMPV
LABELV $3347
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3354
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $3352
line 5668
;5668:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $650
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5669
;5669:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $649
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5670
;5670:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $246
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5671
;5671:			if (uiInfo.serverStatus.currentServer >= 0 && uiInfo.serverStatus.currentServer < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+99836+1128
INDIRI4
CNSTI4 0
LTI4 $3353
ADDRGP4 uiInfo+99836+1128
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
GEI4 $3353
line 5672
;5672:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, 1024);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+1128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 5673
;5673:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", buff ) );
ADDRGP4 $3368
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5674
;5674:			}
line 5675
;5675:		} else if (Q_stricmp(name, "FoundPlayerJoinServer") == 0) {
ADDRGP4 $3353
JUMPV
LABELV $3352
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3371
ARGP4
ADDRLP4 1188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $3369
line 5676
;5676:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $246
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5677
;5677:			if (uiInfo.currentFoundPlayerServer >= 0 && uiInfo.currentFoundPlayerServer < uiInfo.numFoundPlayerServers) {
ADDRGP4 uiInfo+118948
INDIRI4
CNSTI4 0
LTI4 $3370
ADDRGP4 uiInfo+118948
INDIRI4
ADDRGP4 uiInfo+118952
INDIRI4
GEI4 $3370
line 5678
;5678:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer] ) );
ADDRGP4 $3368
ARGP4
ADDRGP4 uiInfo+118948
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+116900
ADDP4
ARGP4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5679
;5679:			}
line 5680
;5680:		} else if (Q_stricmp(name, "Quit") == 0) {
ADDRGP4 $3370
JUMPV
LABELV $3369
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3381
ARGP4
ADDRLP4 1192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $3379
line 5681
;5681:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $246
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5682
;5682:			trap_Cmd_ExecuteText( EXEC_NOW, "quit");
CNSTI4 0
ARGI4
ADDRGP4 $3382
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5683
;5683:		} else if (Q_stricmp(name, "Controls") == 0) {
ADDRGP4 $3380
JUMPV
LABELV $3379
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3385
ARGP4
ADDRLP4 1196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $3383
line 5684
;5684:		  trap_Cvar_Set( "cl_paused", "0" );//1
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5685
;5685:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5686
;5686:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5687
;5687:			Menus_ActivateByName("setup_menu2");
ADDRGP4 $3387
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5688
;5688:		} else if (Q_stricmp(name, "Leave") == 0) {
ADDRGP4 $3384
JUMPV
LABELV $3383
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3390
ARGP4
ADDRLP4 1200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $3388
line 5689
;5689:			trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $3391
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5690
;5690:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5691
;5691:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5692
;5692:			Menus_ActivateByName("main");
ADDRGP4 $3316
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5693
;5693:		} else if (Q_stricmp(name, "ServerSort") == 0) {
ADDRGP4 $3389
JUMPV
LABELV $3388
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3394
ARGP4
ADDRLP4 1204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $3392
line 5695
;5694:			int sortColumn;
;5695:			if (Int_Parse(args, &sortColumn)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1208
ARGP4
ADDRLP4 1212
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $3393
line 5697
;5696:				// if same column we're already sorting on then flip the direction
;5697:				if (sortColumn == uiInfo.serverStatus.sortKey) {
ADDRLP4 1208
INDIRI4
ADDRGP4 uiInfo+99836+1112
INDIRI4
NEI4 $3397
line 5698
;5698:					uiInfo.serverStatus.sortDir = !uiInfo.serverStatus.sortDir;
ADDRGP4 uiInfo+99836+1116
INDIRI4
CNSTI4 0
NEI4 $3406
ADDRLP4 1216
CNSTI4 1
ASGNI4
ADDRGP4 $3407
JUMPV
LABELV $3406
ADDRLP4 1216
CNSTI4 0
ASGNI4
LABELV $3407
ADDRGP4 uiInfo+99836+1116
ADDRLP4 1216
INDIRI4
ASGNI4
line 5699
;5699:				}
LABELV $3397
line 5701
;5700:				// make sure we sort again
;5701:				UI_ServersSort(sortColumn, qtrue);
ADDRLP4 1208
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_ServersSort
CALLV
pop
line 5702
;5702:			}
line 5703
;5703:		} else if (Q_stricmp(name, "nextSkirmish") == 0) {
ADDRGP4 $3393
JUMPV
LABELV $3392
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3410
ARGP4
ADDRLP4 1208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
NEI4 $3408
line 5704
;5704:			UI_StartSkirmish(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 5705
;5705:		} else if (Q_stricmp(name, "SkirmishStart") == 0) {
ADDRGP4 $3409
JUMPV
LABELV $3408
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3413
ARGP4
ADDRLP4 1212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
NEI4 $3411
line 5706
;5706:			UI_StartSkirmish(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 5707
;5707:		} else if (Q_stricmp(name, "closeingame") == 0) {
ADDRGP4 $3412
JUMPV
LABELV $3411
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3416
ARGP4
ADDRLP4 1216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
NEI4 $3414
line 5708
;5708:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1220
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5709
;5709:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 5710
;5710:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5711
;5711:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5712
;5712:		} else if (Q_stricmp(name, "voteMap") == 0) {
ADDRGP4 $3415
JUMPV
LABELV $3414
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3419
ARGP4
ADDRLP4 1220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
NEI4 $3417
line 5713
;5713:			if (ui_currentNetMap.integer >=0 && ui_currentNetMap.integer < uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $3418
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
GEI4 $3418
line 5714
;5714:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote map %s\n",uiInfo.mapList[ui_currentNetMap.integer].mapLoadName) );
ADDRGP4 $3425
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5715
;5715:			}
line 5716
;5716:		} else if (Q_stricmp(name, "voteKick") == 0) {
ADDRGP4 $3418
JUMPV
LABELV $3417
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3431
ARGP4
ADDRLP4 1224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
NEI4 $3429
line 5717
;5717:			if (uiInfo.playerIndex >= 0 && uiInfo.playerIndex < uiInfo.playerCount) {
ADDRGP4 uiInfo+78400
INDIRI4
CNSTI4 0
LTI4 $3430
ADDRGP4 uiInfo+78400
INDIRI4
ADDRGP4 uiInfo+78384
INDIRI4
GEI4 $3430
line 5718
;5718:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote kick %s\n",uiInfo.playerNames[uiInfo.playerIndex]) );
ADDRGP4 $3437
ARGP4
ADDRGP4 uiInfo+78400
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78412
ADDP4
ARGP4
ADDRLP4 1228
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5719
;5719:			}
line 5720
;5720:		} else if (Q_stricmp(name, "voteGame") == 0) {
ADDRGP4 $3430
JUMPV
LABELV $3429
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3442
ARGP4
ADDRLP4 1228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $3440
line 5721
;5721:			if (ui_netGameType.integer >= 0 && ui_netGameType.integer < uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $3441
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78116
INDIRI4
GEI4 $3441
line 5722
;5722:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote g_gametype %i\n",uiInfo.gameTypes[ui_netGameType.integer].gtEnum) );
ADDRGP4 $3448
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5723
;5723:			}
line 5724
;5724:		} else if (Q_stricmp(name, "voteLeader") == 0) {
ADDRGP4 $3441
JUMPV
LABELV $3440
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3454
ARGP4
ADDRLP4 1232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $3452
line 5725
;5725:			if (uiInfo.teamIndex >= 0 && uiInfo.teamIndex < uiInfo.myTeamCount) {
ADDRGP4 uiInfo+78392
INDIRI4
CNSTI4 0
LTI4 $3453
ADDRGP4 uiInfo+78392
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
GEI4 $3453
line 5726
;5726:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callteamvote leader %s\n",uiInfo.teamNames[uiInfo.teamIndex]) );
ADDRGP4 $3460
ARGP4
ADDRGP4 uiInfo+78392
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80460
ADDP4
ARGP4
ADDRLP4 1236
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5727
;5727:			}
line 5728
;5728:		} else if (Q_stricmp(name, "addBot") == 0) {
ADDRGP4 $3453
JUMPV
LABELV $3452
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3465
ARGP4
ADDRLP4 1236
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $3463
line 5729
;5729:			if (trap_Cvar_VariableValue("g_gametype") >= GT_TEAM) {
ADDRGP4 $1661
ARGP4
ADDRLP4 1240
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1240
INDIRF4
CNSTF4 1065353216
LTF4 $3466
line 5730
;5730:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", uiInfo.characterList[uiInfo.botIndex].name, uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "seals" : "tangos") );
ADDRGP4 $3468
ARGP4
ADDRGP4 uiInfo+73496
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500
ADDP4
INDIRP4
ARGP4
ADDRGP4 uiInfo+96212
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+78380
INDIRI4
CNSTI4 0
NEI4 $3474
ADDRLP4 1244
ADDRGP4 $3027
ASGNP4
ADDRGP4 $3475
JUMPV
LABELV $3474
ADDRLP4 1244
ADDRGP4 $3012
ASGNP4
LABELV $3475
ADDRLP4 1244
INDIRP4
ARGP4
ADDRLP4 1248
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1248
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5731
;5731:			} else {
ADDRGP4 $3464
JUMPV
LABELV $3466
line 5732
;5732:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", UI_GetBotNameByNumber(uiInfo.botIndex), uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "seals" : "tangos") );
ADDRGP4 uiInfo+73496
INDIRI4
ARGI4
ADDRLP4 1248
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRGP4 $3468
ARGP4
ADDRLP4 1248
INDIRP4
ARGP4
ADDRGP4 uiInfo+96212
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+78380
INDIRI4
CNSTI4 0
NEI4 $3480
ADDRLP4 1244
ADDRGP4 $3027
ASGNP4
ADDRGP4 $3481
JUMPV
LABELV $3480
ADDRLP4 1244
ADDRGP4 $3012
ASGNP4
LABELV $3481
ADDRLP4 1244
INDIRP4
ARGP4
ADDRLP4 1252
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5733
;5733:			}
line 5734
;5734:		} else if (Q_stricmp(name, "addFavorite") == 0) {
ADDRGP4 $3464
JUMPV
LABELV $3463
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3484
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $3482
line 5735
;5735:			if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $3483
line 5740
;5736:				char name[MAX_NAME_LENGTH];
;5737:				char addr[MAX_NAME_LENGTH];
;5738:				int res;
;5739:
;5740:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+1128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5741
;5741:				name[0] = addr[0] = '\0';
ADDRLP4 1312
CNSTI1 0
ASGNI1
ADDRLP4 1244
ADDRLP4 1312
INDIRI1
ASGNI1
ADDRLP4 1276
ADDRLP4 1312
INDIRI1
ASGNI1
line 5742
;5742:				Q_strncpyz(name, 	Info_ValueForKey(buff, "hostname"), MAX_NAME_LENGTH);
ADDRLP4 4
ARGP4
ADDRGP4 $3493
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1276
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5743
;5743:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 4
ARGP4
ADDRGP4 $3494
ARGP4
ADDRLP4 1320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1244
ARGP4
ADDRLP4 1320
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5744
;5744:				if (strlen(name) > 0 && strlen(addr) > 0) {
ADDRLP4 1276
ARGP4
ADDRLP4 1324
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
LEI4 $3483
ADDRLP4 1244
ARGP4
ADDRLP4 1328
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 0
LEI4 $3483
line 5745
;5745:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 3
ARGI4
ADDRLP4 1276
ARGP4
ADDRLP4 1244
ARGP4
ADDRLP4 1332
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1308
ADDRLP4 1332
INDIRI4
ASGNI4
line 5746
;5746:					if (res == 0) {
ADDRLP4 1308
INDIRI4
CNSTI4 0
NEI4 $3497
line 5748
;5747:						// server already in the list
;5748:						Com_Printf("Favorite already in list\n");
ADDRGP4 $3499
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5749
;5749:					}
ADDRGP4 $3483
JUMPV
LABELV $3497
line 5750
;5750:					else if (res == -1) {
ADDRLP4 1308
INDIRI4
CNSTI4 -1
NEI4 $3500
line 5752
;5751:						// list full
;5752:						Com_Printf("Favorite list full\n");
ADDRGP4 $3502
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5753
;5753:					}
ADDRGP4 $3483
JUMPV
LABELV $3500
line 5754
;5754:					else {
line 5756
;5755:						// successfully added
;5756:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $3503
ARGP4
ADDRLP4 1244
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5757
;5757:					}
line 5758
;5758:				}
line 5759
;5759:			}
line 5760
;5760:		} else if (Q_stricmp(name, "deleteFavorite") == 0) {
ADDRGP4 $3483
JUMPV
LABELV $3482
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3506
ARGP4
ADDRLP4 1244
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
NEI4 $3504
line 5761
;5761:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3505
line 5763
;5762:				char addr[MAX_NAME_LENGTH];
;5763:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+1128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5764
;5764:				addr[0] = '\0';
ADDRLP4 1248
CNSTI1 0
ASGNI1
line 5765
;5765:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 4
ARGP4
ADDRGP4 $3494
ARGP4
ADDRLP4 1280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1248
ARGP4
ADDRLP4 1280
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5766
;5766:				if (strlen(addr) > 0) {
ADDRLP4 1248
ARGP4
ADDRLP4 1284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 0
LEI4 $3505
line 5767
;5767:					trap_LAN_RemoveServer(AS_FAVORITES, addr);
CNSTI4 3
ARGI4
ADDRLP4 1248
ARGP4
ADDRGP4 trap_LAN_RemoveServer
CALLV
pop
line 5768
;5768:				}
line 5769
;5769:			}
line 5770
;5770:		} else if (Q_stricmp(name, "createFavorite") == 0) {
ADDRGP4 $3505
JUMPV
LABELV $3504
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3519
ARGP4
ADDRLP4 1248
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
NEI4 $3517
line 5771
;5771:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3518
line 5776
;5772:				char name[MAX_NAME_LENGTH];
;5773:				char addr[MAX_NAME_LENGTH];
;5774:				int res;
;5775:
;5776:				name[0] = addr[0] = '\0';
ADDRLP4 1320
CNSTI1 0
ASGNI1
ADDRLP4 1252
ADDRLP4 1320
INDIRI1
ASGNI1
ADDRLP4 1284
ADDRLP4 1320
INDIRI1
ASGNI1
line 5777
;5777:				Q_strncpyz(name, 	UI_Cvar_VariableString("ui_favoriteName"), MAX_NAME_LENGTH);
ADDRGP4 $3523
ARGP4
ADDRLP4 1324
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1284
ARGP4
ADDRLP4 1324
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5778
;5778:				Q_strncpyz(addr, 	UI_Cvar_VariableString("ui_favoriteAddress"), MAX_NAME_LENGTH);
ADDRGP4 $3524
ARGP4
ADDRLP4 1328
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1252
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5779
;5779:				if (strlen(name) > 0 && strlen(addr) > 0) {
ADDRLP4 1284
ARGP4
ADDRLP4 1332
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
LEI4 $3518
ADDRLP4 1252
ARGP4
ADDRLP4 1336
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1336
INDIRI4
CNSTI4 0
LEI4 $3518
line 5780
;5780:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 3
ARGI4
ADDRLP4 1284
ARGP4
ADDRLP4 1252
ARGP4
ADDRLP4 1340
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1316
ADDRLP4 1340
INDIRI4
ASGNI4
line 5781
;5781:					if (res == 0) {
ADDRLP4 1316
INDIRI4
CNSTI4 0
NEI4 $3527
line 5783
;5782:						// server already in the list
;5783:						Com_Printf("Favorite already in list\n");
ADDRGP4 $3499
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5784
;5784:					}
ADDRGP4 $3518
JUMPV
LABELV $3527
line 5785
;5785:					else if (res == -1) {
ADDRLP4 1316
INDIRI4
CNSTI4 -1
NEI4 $3529
line 5787
;5786:						// list full
;5787:						Com_Printf("Favorite list full\n");
ADDRGP4 $3502
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5788
;5788:					}
ADDRGP4 $3518
JUMPV
LABELV $3529
line 5789
;5789:					else {
line 5791
;5790:						// successfully added
;5791:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $3503
ARGP4
ADDRLP4 1252
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5792
;5792:					}
line 5793
;5793:				}
line 5794
;5794:			}
line 5795
;5795:		} else if (Q_stricmp(name, "orders") == 0) {
ADDRGP4 $3518
JUMPV
LABELV $3517
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3533
ARGP4
ADDRLP4 1252
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $3531
line 5797
;5796:			const char *orders;
;5797:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1256
ARGP4
ADDRLP4 1260
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1260
INDIRI4
CNSTI4 0
EQI4 $3532
line 5798
;5798:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $240
ARGP4
ADDRLP4 1268
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1264
ADDRLP4 1268
INDIRF4
CVFI4 4
ASGNI4
line 5799
;5799:				if (selectedPlayer < uiInfo.myTeamCount) {
ADDRLP4 1264
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
GEI4 $3536
line 5800
;5800:					strcpy(buff, orders);
ADDRLP4 4
ARGP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5801
;5801:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 4
ARGP4
ADDRLP4 1264
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82508
ADDP4
INDIRI4
ARGI4
ADDRLP4 1272
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5802
;5802:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $3540
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5803
;5803:				} else {
ADDRGP4 $3537
JUMPV
LABELV $3536
line 5805
;5804:					int i;
;5805:					for (i = 0; i < uiInfo.myTeamCount; i++) {
ADDRLP4 1272
CNSTI4 0
ASGNI4
ADDRGP4 $3544
JUMPV
LABELV $3541
line 5806
;5806:						if (Q_stricmp(UI_Cvar_VariableString("name"), uiInfo.teamNames[i]) == 0) {
ADDRGP4 $1745
ARGP4
ADDRLP4 1276
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1276
INDIRP4
ARGP4
ADDRLP4 1272
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80460
ADDP4
ARGP4
ADDRLP4 1280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1280
INDIRI4
CNSTI4 0
NEI4 $3546
line 5807
;5807:							continue;
ADDRGP4 $3542
JUMPV
LABELV $3546
line 5809
;5808:						}
;5809:						strcpy(buff, orders);
ADDRLP4 4
ARGP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5810
;5810:						trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamNames[i]) );
ADDRLP4 4
ARGP4
ADDRLP4 1272
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80460
ADDP4
ARGP4
ADDRLP4 1284
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5811
;5811:						trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $3540
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5812
;5812:					}
LABELV $3542
line 5805
ADDRLP4 1272
ADDRLP4 1272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3544
ADDRLP4 1272
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
LTI4 $3541
line 5813
;5813:				}
LABELV $3537
line 5814
;5814:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1272
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1272
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5815
;5815:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 5816
;5816:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5817
;5817:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5818
;5818:			}
line 5819
;5819:		} else if (Q_stricmp(name, "voiceOrdersTeam") == 0) {
ADDRGP4 $3532
JUMPV
LABELV $3531
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3552
ARGP4
ADDRLP4 1256
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
NEI4 $3550
line 5821
;5820:			const char *orders;
;5821:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1260
ARGP4
ADDRLP4 1264
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
EQI4 $3551
line 5822
;5822:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $240
ARGP4
ADDRLP4 1272
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1268
ADDRLP4 1272
INDIRF4
CVFI4 4
ASGNI4
line 5823
;5823:				if (selectedPlayer == uiInfo.myTeamCount) {
ADDRLP4 1268
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
NEI4 $3555
line 5824
;5824:					trap_Cmd_ExecuteText( EXEC_APPEND, orders );
CNSTI4 2
ARGI4
ADDRLP4 1260
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5825
;5825:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $3540
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5826
;5826:				}
LABELV $3555
line 5827
;5827:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1276
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1276
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5828
;5828:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 5829
;5829:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5830
;5830:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5831
;5831:			}
line 5832
;5832:		} else if (Q_stricmp(name, "voiceOrders") == 0) {
ADDRGP4 $3551
JUMPV
LABELV $3550
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3560
ARGP4
ADDRLP4 1260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1260
INDIRI4
CNSTI4 0
NEI4 $3558
line 5834
;5833:			const char *orders;
;5834:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1264
ARGP4
ADDRLP4 1268
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1268
INDIRI4
CNSTI4 0
EQI4 $3559
line 5835
;5835:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $240
ARGP4
ADDRLP4 1276
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1272
ADDRLP4 1276
INDIRF4
CVFI4 4
ASGNI4
line 5836
;5836:				if (selectedPlayer < uiInfo.myTeamCount) {
ADDRLP4 1272
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
GEI4 $3563
line 5837
;5837:					strcpy(buff, orders);
ADDRLP4 4
ARGP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5838
;5838:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 4
ARGP4
ADDRLP4 1272
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82508
ADDP4
INDIRI4
ARGI4
ADDRLP4 1280
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1280
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5839
;5839:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $3540
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5840
;5840:				}
LABELV $3563
line 5841
;5841:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1280
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1280
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5842
;5842:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 5843
;5843:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5844
;5844:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5845
;5845:			}
line 5846
;5846:		} else if (Q_stricmp(name, "glCustom") == 0) {
ADDRGP4 $3559
JUMPV
LABELV $3558
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3569
ARGP4
ADDRLP4 1264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $3567
line 5847
;5847:			trap_Cvar_Set("ui_glCustom", "4");
ADDRGP4 $3077
ARGP4
ADDRGP4 $180
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5848
;5848:		} else if (Q_stricmp(name, "update") == 0) {
ADDRGP4 $3568
JUMPV
LABELV $3567
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3572
ARGP4
ADDRLP4 1268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1268
INDIRI4
CNSTI4 0
NEI4 $3570
line 5849
;5849:			if (String_Parse(args, &name2)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1272
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1272
INDIRI4
CNSTI4 0
EQI4 $3571
line 5850
;5850:				UI_Update(name2);
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 UI_Update
CALLV
pop
line 5851
;5851:			}
line 5852
;5852:		} 
ADDRGP4 $3571
JUMPV
LABELV $3570
line 5853
;5853:		else {
line 5854
;5854:			Com_Printf("unknown UI script %s\n", name);
ADDRGP4 $3575
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 5855
;5855:			}
LABELV $3571
LABELV $3568
LABELV $3559
LABELV $3551
LABELV $3532
LABELV $3518
LABELV $3505
LABELV $3483
LABELV $3464
LABELV $3453
LABELV $3441
LABELV $3430
LABELV $3418
LABELV $3415
LABELV $3412
LABELV $3409
LABELV $3393
LABELV $3389
LABELV $3384
LABELV $3380
LABELV $3370
LABELV $3353
LABELV $3348
LABELV $3341
LABELV $3331
LABELV $3325
LABELV $3318
LABELV $3305
LABELV $3302
LABELV $3297
LABELV $3291
LABELV $3284
LABELV $3274
LABELV $3271
LABELV $3268
LABELV $3265
LABELV $3262
LABELV $3249
LABELV $3246
LABELV $3243
LABELV $3240
LABELV $3231
LABELV $3227
LABELV $3224
LABELV $3221
LABELV $3217
LABELV $3207
LABELV $3195
LABELV $3188
LABELV $3181
LABELV $3140
LABELV $3137
LABELV $3134
LABELV $3130
LABELV $3118
LABELV $3115
LABELV $3112
LABELV $3109
LABELV $3106
line 5856
;5856:		}
LABELV $3103
line 5857
;5857:	} 
LABELV $3102
endproc UI_RunMenuScript 2284 96
proc UI_GetTeamColor 0 0
line 5858
;5858:static void UI_GetTeamColor(vec4_t *color) {
line 5859
;5859:}
LABELV $3576
endproc UI_GetTeamColor 0 0
proc UI_MapCountByGameType 16 0
line 5866
;5860:
;5861:/*
;5862:==================
;5863:UI_MapCountByGameType
;5864:==================
;5865:*/
;5866:static int UI_MapCountByGameType(qboolean singlePlayer) {
line 5868
;5867:	int i, c, game;
;5868:	c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5869
;5869:	game = singlePlayer ? uiInfo.gameTypes[ui_gameType.integer].gtEnum : uiInfo.gameTypes[ui_netGameType.integer].gtEnum;
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3585
ADDRLP4 12
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $3586
JUMPV
LABELV $3585
ADDRLP4 12
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ASGNI4
LABELV $3586
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 5871
;5870: 
;5871:	if (game == GT_TEAM) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3587
line 5872
;5872:		game = GT_FFA;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5873
;5873:	}
LABELV $3587
line 5875
;5874:
;5875:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3592
JUMPV
LABELV $3589
line 5876
;5876:		uiInfo.mapList[i].active = qfalse;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+96
ADDP4
CNSTI4 0
ASGNI4
line 5877
;5877:		if ( uiInfo.mapList[i].typeBits & (1 << game)) { 
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3596
line 5878
;5878:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5879
;5879:			uiInfo.mapList[i].active = qtrue;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+96
ADDP4
CNSTI4 1
ASGNI4
line 5880
;5880:		}
LABELV $3596
line 5881
;5881:	}
LABELV $3590
line 5875
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3592
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LTI4 $3589
line 5882
;5882:	return c;
ADDRLP4 8
INDIRI4
RETI4
LABELV $3577
endproc UI_MapCountByGameType 16 0
proc UI_InsertServerIntoDisplayList 16 0
line 5890
;5883:}
;5884:
;5885:/*
;5886:==================
;5887:UI_InsertServerIntoDisplayList
;5888:==================
;5889:*/
;5890:static void UI_InsertServerIntoDisplayList(int num, int position) {
line 5893
;5891:	int i;
;5892:
;5893:	if (position < 0 || position > uiInfo.serverStatus.numDisplayServers ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3607
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
LEI4 $3603
LABELV $3607
line 5894
;5894:		return;
ADDRGP4 $3602
JUMPV
LABELV $3603
line 5897
;5895:	}
;5896:	//
;5897:	uiInfo.serverStatus.numDisplayServers++;
ADDRLP4 8
ADDRGP4 uiInfo+99836+9324
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5898
;5898:	for (i = uiInfo.serverStatus.numDisplayServers; i > position; i--) {
ADDRLP4 0
ADDRGP4 uiInfo+99836+9324
INDIRI4
ASGNI4
ADDRGP4 $3613
JUMPV
LABELV $3610
line 5899
;5899:		uiInfo.serverStatus.displayServers[i] = uiInfo.serverStatus.displayServers[i-1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99836+1132
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99836+1132-4
ADDP4
INDIRI4
ASGNI4
line 5900
;5900:	}
LABELV $3611
line 5898
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $3613
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $3610
line 5901
;5901:	uiInfo.serverStatus.displayServers[position] = num;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 5902
;5902:}
LABELV $3602
endproc UI_InsertServerIntoDisplayList 16 0
proc UI_RemoveServerFromDisplayList 16 0
line 5909
;5903:
;5904:/*
;5905:==================
;5906:UI_RemoveServerFromDisplayList
;5907:==================
;5908:*/
;5909:static void UI_RemoveServerFromDisplayList(int num) {
line 5912
;5910:	int i, j;
;5911:
;5912:	for (i = 0; i < uiInfo.serverStatus.numDisplayServers; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3627
JUMPV
LABELV $3624
line 5913
;5913:		if (uiInfo.serverStatus.displayServers[i] == num) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3630
line 5914
;5914:			uiInfo.serverStatus.numDisplayServers--;
ADDRLP4 8
ADDRGP4 uiInfo+99836+9324
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5915
;5915:			for (j = i; j < uiInfo.serverStatus.numDisplayServers; j++) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $3639
JUMPV
LABELV $3636
line 5916
;5916:				uiInfo.serverStatus.displayServers[j] = uiInfo.serverStatus.displayServers[j+1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99836+1132
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99836+1132+4
ADDP4
INDIRI4
ASGNI4
line 5917
;5917:			}
LABELV $3637
line 5915
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3639
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
LTI4 $3636
line 5918
;5918:			return;
ADDRGP4 $3623
JUMPV
LABELV $3630
line 5920
;5919:		}
;5920:	}
LABELV $3625
line 5912
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3627
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
LTI4 $3624
line 5921
;5921:}
LABELV $3623
endproc UI_RemoveServerFromDisplayList 16 0
proc UI_BinaryServerInsertion 20 20
line 5928
;5922:
;5923:/*
;5924:==================
;5925:UI_BinaryServerInsertion
;5926:==================
;5927:*/
;5928:static void UI_BinaryServerInsertion(int num) {
line 5932
;5929:	int mid, offset, res, len;
;5930:
;5931:	// use binary search to insert server
;5932:	len = uiInfo.serverStatus.numDisplayServers;
ADDRLP4 12
ADDRGP4 uiInfo+99836+9324
INDIRI4
ASGNI4
line 5933
;5933:	mid = len;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 5934
;5934:	offset = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5935
;5935:	res = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3651
JUMPV
LABELV $3650
line 5936
;5936:	while(mid > 0) {
line 5937
;5937:		mid = len >> 1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
line 5939
;5938:		//
;5939:		res = trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey,
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+1112
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+1116
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 5942
;5940:					uiInfo.serverStatus.sortDir, num, uiInfo.serverStatus.displayServers[offset+mid]);
;5941:		// if equal
;5942:		if (res == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3660
line 5943
;5943:			UI_InsertServerIntoDisplayList(num, offset+mid);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 5944
;5944:			return;
ADDRGP4 $3647
JUMPV
LABELV $3660
line 5947
;5945:		}
;5946:		// if larger
;5947:		else if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3662
line 5948
;5948:			offset += mid;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 5949
;5949:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 5950
;5950:		}
ADDRGP4 $3663
JUMPV
LABELV $3662
line 5952
;5951:		// if smaller
;5952:		else {
line 5953
;5953:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 5954
;5954:		}
LABELV $3663
line 5955
;5955:	}
LABELV $3651
line 5936
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $3650
line 5956
;5956:	if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3664
line 5957
;5957:		offset++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5958
;5958:	}
LABELV $3664
line 5959
;5959:	UI_InsertServerIntoDisplayList(num, offset);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 5960
;5960:}
LABELV $3647
endproc UI_BinaryServerInsertion 20 20
bss
align 4
LABELV $3667
skip 4
code
proc UI_BuildServerDisplayList 1104 16
line 5967
;5961:
;5962:/*
;5963:==================
;5964:UI_BuildServerDisplayList
;5965:==================
;5966:*/
;5967:static void UI_BuildServerDisplayList(qboolean force) {
line 5973
;5968:	int i, count, clients, maxClients, ping, game, len, visible;
;5969:	char info[MAX_STRING_CHARS];
;5970://	qboolean startRefresh = qtrue;
;5971:	static int numinvisible;
;5972:
;5973:	if (!(force || uiInfo.uiDC.realTime > uiInfo.serverStatus.nextDisplayRefresh)) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3668
ADDRGP4 uiInfo+212
INDIRI4
ADDRGP4 uiInfo+99836+9332
INDIRI4
GTI4 $3668
line 5974
;5974:		return;
ADDRGP4 $3666
JUMPV
LABELV $3668
line 5977
;5975:	}
;5976:	// if we shouldn't reset
;5977:	if ( force == 2 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $3673
line 5978
;5978:		force = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 5979
;5979:	}
LABELV $3673
line 5982
;5980:
;5981:	// do motd updates here too
;5982:	trap_Cvar_VariableStringBuffer( "cl_motdString", uiInfo.serverStatus.motd, sizeof(uiInfo.serverStatus.motd) );
ADDRGP4 $3675
ARGP4
ADDRGP4 uiInfo+99836+9372
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5983
;5983:	len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+99836+9372
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1056
INDIRI4
ASGNI4
line 5984
;5984:	if (len == 0) {
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $3682
line 5985
;5985:		strcpy(uiInfo.serverStatus.motd, "Welcome to Navy Seals : Covert Operations.");
ADDRGP4 uiInfo+99836+9372
ARGP4
ADDRGP4 $3686
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5986
;5986:		len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+99836+9372
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1060
INDIRI4
ASGNI4
line 5987
;5987:	} 
LABELV $3682
line 5988
;5988:	if (len != uiInfo.serverStatus.motdLen) {
ADDRLP4 1052
INDIRI4
ADDRGP4 uiInfo+99836+9348
INDIRI4
EQI4 $3689
line 5989
;5989:		uiInfo.serverStatus.motdLen = len;
ADDRGP4 uiInfo+99836+9348
ADDRLP4 1052
INDIRI4
ASGNI4
line 5990
;5990:		uiInfo.serverStatus.motdWidth = -1;
ADDRGP4 uiInfo+99836+9352
CNSTI4 -1
ASGNI4
line 5991
;5991:	} 
LABELV $3689
line 5993
;5992:
;5993:	if (force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3697
line 5994
;5994:		numinvisible = 0;
ADDRGP4 $3667
CNSTI4 0
ASGNI4
line 5996
;5995:		// clear number of displayed servers
;5996:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99836+9324
CNSTI4 0
ASGNI4
line 5997
;5997:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99836+9328
CNSTI4 0
ASGNI4
line 5999
;5998:		// set list box index to zero
;5999:		Menu_SetFeederSelection(NULL, FEEDER_SERVERS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 6001
;6000:		// mark all servers as visible so we store ping updates for them
;6001:		trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 6002
;6002:	}
LABELV $3697
line 6005
;6003:
;6004:	// get the server count (comes from the master)
;6005:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1060
INDIRI4
ASGNI4
line 6006
;6006:	if (count == -1 || (ui_netSource.integer == AS_LOCAL && count == 0) ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
EQI4 $3708
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRGP4 ui_netSource+12
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3705
ADDRLP4 1036
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3705
LABELV $3708
line 6008
;6007:		// still waiting on a response from the master
;6008:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99836+9324
CNSTI4 0
ASGNI4
line 6009
;6009:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99836+9328
CNSTI4 0
ASGNI4
line 6010
;6010:		uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+99836+9332
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 6011
;6011:		return;
ADDRGP4 $3666
JUMPV
LABELV $3705
line 6014
;6012:	}
;6013:
;6014:	visible = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 6015
;6015:	for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3719
JUMPV
LABELV $3716
line 6017
;6016:		// if we already got info for this server
;6017:		if (!trap_LAN_ServerIsVisible(ui_netSource.integer, i)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 trap_LAN_ServerIsVisible
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $3720
line 6018
;6018:			continue;
ADDRGP4 $3717
JUMPV
LABELV $3720
line 6020
;6019:		}
;6020:		visible = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 6022
;6021:		// get the ping for this server
;6022:		ping = trap_LAN_GetServerPing(ui_netSource.integer, i);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 trap_LAN_GetServerPing
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1076
INDIRI4
ASGNI4
line 6023
;6023:		if (ping > 0 || ui_netSource.integer == AS_FAVORITES) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $3727
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3724
LABELV $3727
line 6025
;6024:
;6025:			trap_LAN_GetServerInfo(ui_netSource.integer, i, info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 6027
;6026:
;6027:			clients = atoi(Info_ValueForKey(info, "clients"));
ADDRLP4 8
ARGP4
ADDRGP4 $3729
ARGP4
ADDRLP4 1080
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1084
INDIRI4
ASGNI4
line 6028
;6028:			uiInfo.serverStatus.numPlayersOnServers += clients;
ADDRLP4 1088
ADDRGP4 uiInfo+99836+9328
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 6030
;6029:
;6030:			if (ui_browserShowEmpty.integer == 0) {
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CNSTI4 0
NEI4 $3732
line 6031
;6031:				if (clients == 0) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $3735
line 6032
;6032:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 6033
;6033:					continue;
ADDRGP4 $3717
JUMPV
LABELV $3735
line 6035
;6034:				}
;6035:			}
LABELV $3732
line 6037
;6036:
;6037:			if (ui_browserShowFull.integer == 0) {
ADDRGP4 ui_browserShowFull+12
INDIRI4
CNSTI4 0
NEI4 $3738
line 6038
;6038:				maxClients = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 8
ARGP4
ADDRGP4 $1698
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1096
INDIRI4
ASGNI4
line 6039
;6039:				if (clients == maxClients) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $3741
line 6040
;6040:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 6041
;6041:					continue;
ADDRGP4 $3717
JUMPV
LABELV $3741
line 6043
;6042:				}
;6043:			}
LABELV $3738
line 6045
;6044:
;6045:			if (uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum != -1) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78252+4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3744
line 6046
;6046:				game = atoi(Info_ValueForKey(info, "gametype"));
ADDRLP4 8
ARGP4
ADDRGP4 $3749
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1096
INDIRI4
ASGNI4
line 6047
;6047:				if (game != uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum) {
ADDRLP4 1048
INDIRI4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78252+4
ADDP4
INDIRI4
EQI4 $3750
line 6048
;6048:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 6049
;6049:					continue;
ADDRGP4 $3717
JUMPV
LABELV $3750
line 6051
;6050:				}
;6051:			}
LABELV $3744
line 6054
;6052:
;6053:			// only show ns-co servers
;6054:			if (Q_stricmp(Info_ValueForKey(info, "game"), "seals") != 0) {
ADDRLP4 8
ARGP4
ADDRGP4 $3758
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 $3027
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $3756
line 6055
;6055:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 6056
;6056:					continue;
ADDRGP4 $3717
JUMPV
LABELV $3756
line 6067
;6057:				}
;6058:			/*
;6059://			if (ui_serverFilterType.integer > 0) {
;6060:				if (Q_stricmp(Info_ValueForKey(info, "game"), serverFilters[ui_serverFilterType.integer].basedir) != 0) {
;6061:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
;6062:					continue;
;6063:				}
;6064://			}
;6065:*/
;6066:			// make sure we never add a favorite server twice
;6067:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3760
line 6068
;6068:				UI_RemoveServerFromDisplayList(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_RemoveServerFromDisplayList
CALLV
pop
line 6069
;6069:			}
LABELV $3760
line 6071
;6070:			// insert the server into the list
;6071:			UI_BinaryServerInsertion(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_BinaryServerInsertion
CALLV
pop
line 6073
;6072:			// done with this server
;6073:			if (ping > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $3763
line 6074
;6074:				trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 6075
;6075:				numinvisible++;
ADDRLP4 1100
ADDRGP4 $3667
ASGNP4
ADDRLP4 1100
INDIRP4
ADDRLP4 1100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6076
;6076:			}
LABELV $3763
line 6077
;6077:		}
LABELV $3724
line 6078
;6078:	}
LABELV $3717
line 6015
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3719
ADDRLP4 0
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $3716
line 6080
;6079:
;6080:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+99836+1104
ADDRGP4 uiInfo+212
INDIRI4
ASGNI4
line 6083
;6081:
;6082:	// if there were no servers visible for ping updates
;6083:	if (!visible) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $3769
line 6086
;6084://		UI_StopServerRefresh();
;6085://		uiInfo.serverStatus.nextDisplayRefresh = 0;
;6086:	}
LABELV $3769
line 6087
;6087:}
LABELV $3666
endproc UI_BuildServerDisplayList 1104 16
data
export serverStatusCvars
align 4
LABELV serverStatusCvars
address $3772
address $3773
address $3774
address $119
address $3775
address $3776
address $1661
address $3777
address $3778
address $3779
address $3780
address $119
address $2913
address $119
address $3781
address $119
address $1016
address $119
byte 4 0
byte 4 0
code
proc UI_SortServerStatusInfo 56 8
line 6112
;6088:
;6089:typedef struct
;6090:{
;6091:	char *name, *altName;
;6092:} serverStatusCvar_t;
;6093:
;6094:serverStatusCvar_t serverStatusCvars[] = {
;6095:	{"sv_hostname", "Name"},
;6096:	{"Address", ""},
;6097:	{"gamename", "Game name"},
;6098:	{"g_gametype", "Game type"},
;6099:	{"mapname", "Map"},
;6100:	{"version", ""},
;6101:	{"protocol", ""},
;6102:	{"timelimit", ""},
;6103:	{"fraglimit", ""},
;6104:	{NULL, NULL}
;6105:};
;6106:
;6107:/*
;6108:==================
;6109:UI_SortServerStatusInfo
;6110:==================
;6111:*/
;6112:static void UI_SortServerStatusInfo( serverStatusInfo_t *info ) {
line 6119
;6113:	int i, j, index;
;6114:	char *tmp1, *tmp2;
;6115:
;6116:	// FIXME: if "gamename" == "baseq3" or "missionpack" then
;6117:	// replace the gametype number by FFA, CTF etc.
;6118:	//
;6119:	index = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 6120
;6120:	for (i = 0; serverStatusCvars[i].name; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3786
JUMPV
LABELV $3783
line 6121
;6121:		for (j = 0; j < info->numLines; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3790
JUMPV
LABELV $3787
line 6122
;6122:			if ( !info->lines[j][1] || info->lines[j][1][0] ) {
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3793
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3791
LABELV $3793
line 6123
;6123:				continue;
ADDRGP4 $3788
JUMPV
LABELV $3791
line 6125
;6124:			}
;6125:			if ( !Q_stricmp(serverStatusCvars[i].name, info->lines[j][0]) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3794
line 6127
;6126:				// swap lines
;6127:				tmp1 = info->lines[index][0];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ASGNP4
line 6128
;6128:				tmp2 = info->lines[index][3];
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 6129
;6129:				info->lines[index][0] = info->lines[j][0];
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 6130
;6130:				info->lines[index][3] = info->lines[j][3];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 12
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 6131
;6131:				info->lines[j][0] = tmp1;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 6132
;6132:				info->lines[j][3] = tmp2;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 6134
;6133:				//
;6134:				if ( strlen(serverStatusCvars[i].altName) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $3796
line 6135
;6135:					info->lines[index][0] = serverStatusCvars[i].altName;
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ASGNP4
line 6136
;6136:				}
LABELV $3796
line 6137
;6137:				index++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6138
;6138:			}
LABELV $3794
line 6139
;6139:		}
LABELV $3788
line 6121
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3790
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
LTI4 $3787
line 6140
;6140:	}
LABELV $3784
line 6120
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3786
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3783
line 6141
;6141:}
LABELV $3782
endproc UI_SortServerStatusInfo 56 8
proc UI_GetServerStatusInfo 168 16
line 6148
;6142:
;6143:/*
;6144:==================
;6145:UI_GetServerStatusInfo
;6146:==================
;6147:*/
;6148:static int UI_GetServerStatusInfo( const char *serverAddress, serverStatusInfo_t *info ) {
line 6152
;6149:	char *p, *score, *ping, *name;
;6150:	int i, len;
;6151:
;6152:	if (!info) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3801
line 6153
;6153:		trap_LAN_ServerStatus( serverAddress, NULL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 6154
;6154:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3800
JUMPV
LABELV $3801
line 6156
;6155:	}
;6156:	memset(info, 0, sizeof(*info));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3332
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6157
;6157:	if ( trap_LAN_ServerStatus( serverAddress, info->text, sizeof(info->text)) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 24
ADDRGP4 trap_LAN_ServerStatus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3803
line 6158
;6158:		Q_strncpyz(info->address, serverAddress, sizeof(info->address));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 6159
;6159:		p = info->text;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ASGNP4
line 6160
;6160:		info->numLines = 0;
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
CNSTI4 0
ASGNI4
line 6161
;6161:		info->lines[info->numLines][0] = "Address";
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3774
ASGNP4
line 6162
;6162:		info->lines[info->numLines][1] = "";
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRGP4 $119
ASGNP4
line 6163
;6163:		info->lines[info->numLines][2] = "";
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $119
ASGNP4
line 6164
;6164:		info->lines[info->numLines][3] = info->address;
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 6165
;6165:		info->numLines++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $3806
JUMPV
LABELV $3805
line 6167
;6166:		// get the cvars
;6167:		while (p && *p) {
line 6168
;6168:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 52
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 6169
;6169:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3808
ADDRGP4 $3807
JUMPV
LABELV $3808
line 6170
;6170:			*p++ = '\0';
ADDRLP4 56
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI1 0
ASGNI1
line 6171
;6171:			if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3810
line 6172
;6172:				break;
ADDRGP4 $3807
JUMPV
LABELV $3810
line 6173
;6173:			info->lines[info->numLines][0] = p;
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 6174
;6174:			info->lines[info->numLines][1] = "";
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRGP4 $119
ASGNP4
line 6175
;6175:			info->lines[info->numLines][2] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $119
ASGNP4
line 6176
;6176:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 76
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 6177
;6177:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3812
ADDRGP4 $3807
JUMPV
LABELV $3812
line 6178
;6178:			*p++ = '\0';
ADDRLP4 80
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI1 0
ASGNI1
line 6179
;6179:			info->lines[info->numLines][3] = p;
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 6181
;6180:
;6181:			info->numLines++;
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6182
;6182:			if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3814
line 6183
;6183:				break;
ADDRGP4 $3807
JUMPV
LABELV $3814
line 6184
;6184:		}
LABELV $3806
line 6167
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3816
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3805
LABELV $3816
LABELV $3807
line 6186
;6185:		// get the player list
;6186:		if (info->numLines < MAX_SERVERSTATUS_LINES-3) {
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 125
GEI4 $3817
line 6188
;6187:			// empty line
;6188:			info->lines[info->numLines][0] = "";
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $119
ASGNP4
line 6189
;6189:			info->lines[info->numLines][1] = "";
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRGP4 $119
ASGNP4
line 6190
;6190:			info->lines[info->numLines][2] = "";
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $119
ASGNP4
line 6191
;6191:			info->lines[info->numLines][3] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $119
ASGNP4
line 6192
;6192:			info->numLines++;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6194
;6193:			// header
;6194:			info->lines[info->numLines][0] = "num";
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 80
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3819
ASGNP4
line 6195
;6195:			info->lines[info->numLines][1] = "score";
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRGP4 $3820
ASGNP4
line 6196
;6196:			info->lines[info->numLines][2] = "ping";
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $3821
ASGNP4
line 6197
;6197:			info->lines[info->numLines][3] = "name";
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 96
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $1745
ASGNP4
line 6198
;6198:			info->numLines++;
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6200
;6199:			// parse players
;6200:			i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 6201
;6201:			len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3823
JUMPV
LABELV $3822
line 6202
;6202:			while (p && *p) {
line 6203
;6203:				if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3825
line 6204
;6204:					*p++ = '\0';
ADDRLP4 104
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 104
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI1 0
ASGNI1
LABELV $3825
line 6205
;6205:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3827
line 6206
;6206:					break;
ADDRGP4 $3824
JUMPV
LABELV $3827
line 6207
;6207:				score = p;
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 6208
;6208:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 108
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 6209
;6209:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3829
line 6210
;6210:					break;
ADDRGP4 $3824
JUMPV
LABELV $3829
line 6211
;6211:				*p++ = '\0';
ADDRLP4 112
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 112
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI1 0
ASGNI1
line 6212
;6212:				ping = p;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 6213
;6213:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 116
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 6214
;6214:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3831
line 6215
;6215:					break;
ADDRGP4 $3824
JUMPV
LABELV $3831
line 6216
;6216:				*p++ = '\0';
ADDRLP4 120
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 120
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI1 0
ASGNI1
line 6217
;6217:				name = p;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 6218
;6218:				Com_sprintf(&info->pings[len], sizeof(info->pings)-len, "%d", i);
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
CNSTU4 192
ADDRLP4 4
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $1015
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6219
;6219:				info->lines[info->numLines][0] = &info->pings[len];
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 128
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 128
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ASGNP4
line 6220
;6220:				len += strlen(&info->pings[len]) + 1;
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 6221
;6221:				info->lines[info->numLines][1] = score;
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRLP4 140
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 6222
;6222:				info->lines[info->numLines][2] = ping;
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 6223
;6223:				info->lines[info->numLines][3] = name;
ADDRLP4 152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 6224
;6224:				info->numLines++;
ADDRLP4 156
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6225
;6225:				if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3833
line 6226
;6226:					break;
ADDRGP4 $3824
JUMPV
LABELV $3833
line 6227
;6227:				p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
line 6228
;6228:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3835
line 6229
;6229:					break;
ADDRGP4 $3824
JUMPV
LABELV $3835
line 6230
;6230:				*p++ = '\0';
ADDRLP4 164
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI1 0
ASGNI1
line 6232
;6231:				//
;6232:				i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6233
;6233:			}
LABELV $3823
line 6202
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3837
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3822
LABELV $3837
LABELV $3824
line 6234
;6234:		}
LABELV $3817
line 6235
;6235:		UI_SortServerStatusInfo( info );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 UI_SortServerStatusInfo
CALLV
pop
line 6236
;6236:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3800
JUMPV
LABELV $3803
line 6238
;6237:	}
;6238:	return qfalse;
CNSTI4 0
RETI4
LABELV $3800
endproc UI_GetServerStatusInfo 168 16
proc stristr 12 4
line 6246
;6239:}
;6240:
;6241:/*
;6242:==================
;6243:stristr
;6244:==================
;6245:*/
;6246:static char *stristr(char *str, char *charset) {
ADDRGP4 $3840
JUMPV
LABELV $3839
line 6249
;6247:	int i;
;6248:
;6249:	while(*str) {
line 6250
;6250:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3845
JUMPV
LABELV $3842
line 6251
;6251:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3846
ADDRGP4 $3844
JUMPV
LABELV $3846
line 6252
;6252:		}
LABELV $3843
line 6250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3845
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $3848
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $3842
LABELV $3848
LABELV $3844
line 6253
;6253:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3849
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $3838
JUMPV
LABELV $3849
line 6254
;6254:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 6255
;6255:	}
LABELV $3840
line 6249
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3839
line 6256
;6256:	return NULL;
CNSTP4 0
RETP4
LABELV $3838
endproc stristr 12 4
bss
align 4
LABELV $3852
skip 4
align 4
LABELV $3853
skip 4
code
proc UI_BuildFindPlayerList 4424 24
line 6264
;6257:}
;6258:
;6259:/*
;6260:==================
;6261:UI_BuildFindPlayerList
;6262:==================
;6263:*/
;6264:static void UI_BuildFindPlayerList(qboolean force) {
line 6271
;6265:	static numFound, numTimeOuts;
;6266:	int i, j, resend;
;6267:	serverStatusInfo_t info;
;6268:	char name[MAX_NAME_LENGTH+2];
;6269:	char infoString[MAX_STRING_CHARS];
;6270:
;6271:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3854
line 6272
;6272:		if (!uiInfo.nextFindPlayerRefresh || uiInfo.nextFindPlayerRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+118956
INDIRI4
CNSTI4 0
EQI4 $3861
ADDRGP4 uiInfo+118956
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
LEI4 $3855
LABELV $3861
line 6273
;6273:			return;
ADDRGP4 $3851
JUMPV
line 6275
;6274:		}
;6275:	}
LABELV $3854
line 6276
;6276:	else {
line 6277
;6277:		memset(&uiInfo.pendingServerStatus, 0, sizeof(uiInfo.pendingServerStatus));
ADDRGP4 uiInfo+113632
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6278
;6278:		uiInfo.numFoundPlayerServers = 0;
ADDRGP4 uiInfo+118952
CNSTI4 0
ASGNI4
line 6279
;6279:		uiInfo.currentFoundPlayerServer = 0;
ADDRGP4 uiInfo+118948
CNSTI4 0
ASGNI4
line 6280
;6280:		trap_Cvar_VariableStringBuffer( "ui_findPlayer", uiInfo.findPlayerName, sizeof(uiInfo.findPlayerName));
ADDRGP4 $272
ARGP4
ADDRGP4 uiInfo+115876
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 6281
;6281:		Q_CleanStr(uiInfo.findPlayerName);
ADDRGP4 uiInfo+115876
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 6283
;6282:		// should have a string of some length
;6283:		if (!strlen(uiInfo.findPlayerName)) {
ADDRGP4 uiInfo+115876
ARGP4
ADDRLP4 4404
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
NEI4 $3869
line 6284
;6284:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+118956
CNSTI4 0
ASGNI4
line 6285
;6285:			return;
ADDRGP4 $3851
JUMPV
LABELV $3869
line 6288
;6286:		}
;6287:		// set resend time
;6288:		resend = ui_serverStatusTimeOut.integer / 2 - 10;
ADDRLP4 4400
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 10
SUBI4
ASGNI4
line 6289
;6289:		if (resend < 50) {
ADDRLP4 4400
INDIRI4
CNSTI4 50
GEI4 $3874
line 6290
;6290:			resend = 50;
ADDRLP4 4400
CNSTI4 50
ASGNI4
line 6291
;6291:		}
LABELV $3874
line 6292
;6292:		trap_Cvar_Set("cl_serverStatusResendTime", va("%d", resend));
ADDRGP4 $1015
ARGP4
ADDRLP4 4400
INDIRI4
ARGI4
ADDRLP4 4408
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $3876
ARGP4
ADDRLP4 4408
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6294
;6293:		// reset all server status requests
;6294:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 6296
;6295:		//
;6296:		uiInfo.numFoundPlayerServers = 1;
ADDRGP4 uiInfo+118952
CNSTI4 1
ASGNI4
line 6297
;6297:		Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117924-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3884
ARGP4
ADDRGP4 uiInfo+113632
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6300
;6298:						sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;6299:							"searching %d...", uiInfo.pendingServerStatus.num);
;6300:		numFound = 0;
ADDRGP4 $3852
CNSTI4 0
ASGNI4
line 6301
;6301:		numTimeOuts++;
ADDRLP4 4412
ADDRGP4 $3853
ASGNP4
ADDRLP4 4412
INDIRP4
ADDRLP4 4412
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6302
;6302:	}
LABELV $3855
line 6303
;6303:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3886
line 6305
;6304:		// if this pending server is valid
;6305:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3890
line 6307
;6306:			// try to get the server status for this server
;6307:			if (UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, &info ) ) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4404
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
EQI4 $3895
line 6309
;6308:				//
;6309:				numFound++;
ADDRLP4 4408
ADDRGP4 $3852
ASGNP4
ADDRLP4 4408
INDIRP4
ADDRLP4 4408
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6311
;6310:				// parse through the server status lines
;6311:				for (j = 0; j < info.numLines; j++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3902
JUMPV
LABELV $3899
line 6313
;6312:					// should have ping info
;6313:					if ( !info.lines[j][2] || !info.lines[j][2][0] ) {
ADDRLP4 4412
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4412
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3910
ADDRLP4 4412
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3904
LABELV $3910
line 6314
;6314:						continue;
ADDRGP4 $3900
JUMPV
LABELV $3904
line 6317
;6315:					}
;6316:					// clean string first
;6317:					Q_strncpyz(name, info.lines[j][3], sizeof(name));
ADDRLP4 3340
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 8+64+12
ADDP4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 6318
;6318:					Q_CleanStr(name);
ADDRLP4 3340
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 6320
;6319:					// if the player name is a substring
;6320:					if (stristr(name, uiInfo.findPlayerName)) {
ADDRLP4 3340
ARGP4
ADDRGP4 uiInfo+115876
ARGP4
ADDRLP4 4416
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 4416
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3913
line 6322
;6321:						// add to found server list if we have space (always leave space for a line with the number found)
;6322:						if (uiInfo.numFoundPlayerServers < MAX_FOUNDPLAYER_SERVERS-1) {
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 15
GEI4 $3916
line 6324
;6323:							//
;6324:							Q_strncpyz(uiInfo.foundPlayerServerAddresses[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+116900-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 6327
;6325:										uiInfo.pendingServerStatus.server[i].adrstr,
;6326:											sizeof(uiInfo.foundPlayerServerAddresses[0]));
;6327:							Q_strncpyz(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117924-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 6330
;6328:										uiInfo.pendingServerStatus.server[i].name,
;6329:											sizeof(uiInfo.foundPlayerServerNames[0]));
;6330:							uiInfo.numFoundPlayerServers++;
ADDRLP4 4420
ADDRGP4 uiInfo+118952
ASGNP4
ADDRLP4 4420
INDIRP4
ADDRLP4 4420
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6331
;6331:						}
ADDRGP4 $3917
JUMPV
LABELV $3916
line 6332
;6332:						else {
line 6334
;6333:							// can't add any more so we're done
;6334:							uiInfo.pendingServerStatus.num = uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+113632
ADDRGP4 uiInfo+99836+9324
INDIRI4
ASGNI4
line 6335
;6335:						}
LABELV $3917
line 6336
;6336:					}
LABELV $3913
line 6337
;6337:				}
LABELV $3900
line 6311
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3902
ADDRLP4 4
INDIRI4
ADDRLP4 8+3328
INDIRI4
LTI4 $3899
line 6338
;6338:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117924-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3942
ARGP4
ADDRGP4 uiInfo+113632
INDIRI4
ARGI4
ADDRGP4 $3852
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6342
;6339:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;6340:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;6341:				// retrieved the server status so reuse this spot
;6342:				uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+136
ADDP4
CNSTI4 0
ASGNI4
line 6343
;6343:			}
LABELV $3895
line 6344
;6344:		}
LABELV $3890
line 6346
;6345:		// if empty pending slot or timed out
;6346:		if (!uiInfo.pendingServerStatus.server[i].valid ||
ADDRLP4 4404
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4404
INDIRI4
ADDRGP4 uiInfo+113632+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3957
ADDRLP4 4404
INDIRI4
ADDRGP4 uiInfo+113632+4+128
ADDP4
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
SUBI4
GEI4 $3947
LABELV $3957
line 6347
;6347:			uiInfo.pendingServerStatus.server[i].startTime < uiInfo.uiDC.realTime - ui_serverStatusTimeOut.integer) {
line 6348
;6348:			if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3958
line 6349
;6349:				numTimeOuts++;
ADDRLP4 4408
ADDRGP4 $3853
ASGNP4
ADDRLP4 4408
INDIRP4
ADDRLP4 4408
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6350
;6350:			}
LABELV $3958
line 6352
;6351:			// reset server status request for this address
;6352:			UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, NULL );
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 6354
;6353:			// reuse pending slot
;6354:			uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+136
ADDP4
CNSTI4 0
ASGNI4
line 6356
;6355:			// if we didn't try to get the status of all servers in the main browser yet
;6356:			if (uiInfo.pendingServerStatus.num < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+113632
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
GEI4 $3968
line 6357
;6357:				uiInfo.pendingServerStatus.server[i].startTime = uiInfo.uiDC.realTime;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+128
ADDP4
ADDRGP4 uiInfo+212
INDIRI4
ASGNI4
line 6358
;6358:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num],
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+113632
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 6360
;6359:							uiInfo.pendingServerStatus.server[i].adrstr, sizeof(uiInfo.pendingServerStatus.server[i].adrstr));
;6360:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num], infoString, sizeof(infoString));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+113632
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
ADDRLP4 3374
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 6361
;6361:				Q_strncpyz(uiInfo.pendingServerStatus.server[i].name, Info_ValueForKey(infoString, "hostname"), sizeof(uiInfo.pendingServerStatus.server[0].name));
ADDRLP4 3374
ARGP4
ADDRGP4 $3493
ARGP4
ADDRLP4 4408
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+64
ADDP4
ARGP4
ADDRLP4 4408
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 6362
;6362:				uiInfo.pendingServerStatus.server[i].valid = qtrue;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+136
ADDP4
CNSTI4 1
ASGNI4
line 6363
;6363:				uiInfo.pendingServerStatus.num++;
ADDRLP4 4412
ADDRGP4 uiInfo+113632
ASGNP4
ADDRLP4 4412
INDIRP4
ADDRLP4 4412
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6364
;6364:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117924-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3942
ARGP4
ADDRGP4 uiInfo+113632
INDIRI4
ARGI4
ADDRGP4 $3852
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6367
;6365:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;6366:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;6367:			}
LABELV $3968
line 6368
;6368:		}
LABELV $3947
line 6369
;6369:	}
LABELV $3887
line 6303
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3886
line 6370
;6370:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $4006
line 6371
;6371:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+113632+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4010
line 6372
;6372:			break;
ADDRGP4 $4008
JUMPV
LABELV $4010
line 6374
;6373:		}
;6374:	}
LABELV $4007
line 6370
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $4006
LABELV $4008
line 6376
;6375:	// if still trying to retrieve server status info
;6376:	if (i < MAX_SERVERSTATUSREQUESTS) {
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $4015
line 6377
;6377:		uiInfo.nextFindPlayerRefresh = uiInfo.uiDC.realTime + 25;
ADDRGP4 uiInfo+118956
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 6378
;6378:	}
ADDRGP4 $4016
JUMPV
LABELV $4015
line 6379
;6379:	else {
line 6381
;6380:		// add a line that shows the number of servers found
;6381:		if (!uiInfo.numFoundPlayerServers) {
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 0
NEI4 $4019
line 6382
;6382:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]), "no servers found");
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117924-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $4026
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6383
;6383:		}
ADDRGP4 $4020
JUMPV
LABELV $4019
line 6384
;6384:		else {
line 6385
;6385:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]),
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117924-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $4031
ARGP4
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 2
NEI4 $4037
ADDRLP4 4404
ADDRGP4 $119
ASGNP4
ADDRGP4 $4038
JUMPV
LABELV $4037
ADDRLP4 4404
ADDRGP4 $4034
ASGNP4
LABELV $4038
ADDRLP4 4404
INDIRP4
ARGP4
ADDRGP4 uiInfo+115876
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6388
;6386:						"%d server%s found with player %s", uiInfo.numFoundPlayerServers-1,
;6387:						uiInfo.numFoundPlayerServers == 2 ? "":"s", uiInfo.findPlayerName);
;6388:		}
LABELV $4020
line 6389
;6389:		uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+118956
CNSTI4 0
ASGNI4
line 6391
;6390:		// show the server status info for the selected server
;6391:		UI_FeederSelection(FEEDER_FINDPLAYER, uiInfo.currentFoundPlayerServer);
CNSTF4 1096810496
ARGF4
ADDRGP4 uiInfo+118948
INDIRI4
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 6392
;6392:	}
LABELV $4016
line 6393
;6393:}
LABELV $3851
endproc UI_BuildFindPlayerList 4424 24
proc UI_BuildServerStatus 8 16
line 6400
;6394:
;6395:/*
;6396:==================
;6397:UI_BuildServerStatus
;6398:==================
;6399:*/
;6400:static void UI_BuildServerStatus(qboolean force) {
line 6402
;6401:
;6402:	if (uiInfo.nextFindPlayerRefresh) {
ADDRGP4 uiInfo+118956
INDIRI4
CNSTI4 0
EQI4 $4042
line 6403
;6403:		return;
ADDRGP4 $4041
JUMPV
LABELV $4042
line 6405
;6404:	}
;6405:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4045
line 6406
;6406:		if (!uiInfo.nextServerStatusRefresh || uiInfo.nextServerStatusRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+113628
INDIRI4
CNSTI4 0
EQI4 $4052
ADDRGP4 uiInfo+113628
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
LEI4 $4046
LABELV $4052
line 6407
;6407:			return;
ADDRGP4 $4041
JUMPV
line 6409
;6408:		}
;6409:	}
LABELV $4045
line 6410
;6410:	else {
line 6411
;6411:		Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 6412
;6412:		uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+110296+3328
CNSTI4 0
ASGNI4
line 6414
;6413:		// reset all server status requests
;6414:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 6415
;6415:	}
LABELV $4046
line 6416
;6416:	if (uiInfo.serverStatus.currentServer < 0 || uiInfo.serverStatus.currentServer > uiInfo.serverStatus.numDisplayServers || uiInfo.serverStatus.numDisplayServers == 0) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 uiInfo+99836+1128
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $4066
ADDRGP4 uiInfo+99836+1128
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
GTI4 $4066
ADDRGP4 uiInfo+99836+9324
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $4055
LABELV $4066
line 6417
;6417:		return;
ADDRGP4 $4041
JUMPV
LABELV $4055
line 6419
;6418:	}
;6419:	if (UI_GetServerStatusInfo( uiInfo.serverStatusAddress, &uiInfo.serverStatusInfo ) ) {
ADDRGP4 uiInfo+110232
ARGP4
ADDRGP4 uiInfo+110296
ARGP4
ADDRLP4 4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $4067
line 6420
;6420:		uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+113628
CNSTI4 0
ASGNI4
line 6421
;6421:		UI_GetServerStatusInfo( uiInfo.serverStatusAddress, NULL );
ADDRGP4 uiInfo+110232
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 6422
;6422:	}
ADDRGP4 $4068
JUMPV
LABELV $4067
line 6423
;6423:	else {
line 6424
;6424:		uiInfo.nextServerStatusRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+113628
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 6425
;6425:	}
LABELV $4068
line 6426
;6426:}
LABELV $4041
endproc UI_BuildServerStatus 8 16
proc UI_FeederCount 12 4
line 6433
;6427:
;6428:/*
;6429:==================
;6430:UI_FeederCount
;6431:==================
;6432:*/
;6433:static int UI_FeederCount(float feederID) {
line 6434
;6434:	if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $4076
line 6435
;6435:		return uiInfo.characterCount;
ADDRGP4 uiInfo+73492
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4076
line 6436
;6436:	} else if (feederID == FEEDER_Q3HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $4079
line 6437
;6437:		return uiInfo.q3HeadCount;
ADDRGP4 uiInfo+118968
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4079
line 6438
;6438:	} else if (feederID == FEEDER_CINEMATICS) {
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $4082
line 6439
;6439:		return uiInfo.movieCount;
ADDRGP4 uiInfo+99824
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4082
line 6440
;6440:	} else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $4087
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4085
LABELV $4087
line 6441
;6441:		return UI_MapCountByGameType(feederID == FEEDER_MAPS ? qtrue : qfalse);
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4089
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $4090
JUMPV
LABELV $4089
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $4090
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4085
line 6442
;6442:	} else if (feederID == FEEDER_SERVERS) {
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $4091
line 6443
;6443:		return uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+99836+9324
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4091
line 6444
;6444:	} else if (feederID == FEEDER_SERVERSTATUS) {
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $4095
line 6445
;6445:		return uiInfo.serverStatusInfo.numLines;
ADDRGP4 uiInfo+110296+3328
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4095
line 6446
;6446:	} else if (feederID == FEEDER_FINDPLAYER) {
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $4099
line 6447
;6447:		return uiInfo.numFoundPlayerServers;
ADDRGP4 uiInfo+118952
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4099
line 6448
;6448:	} else if (feederID == FEEDER_PLAYER_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $4102
line 6449
;6449:		if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+212
INDIRI4
ADDRGP4 uiInfo+78396
INDIRI4
LEI4 $4104
line 6450
;6450:			uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78396
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 6451
;6451:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6452
;6452:		}
LABELV $4104
line 6453
;6453:		return uiInfo.playerCount;
ADDRGP4 uiInfo+78384
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4102
line 6454
;6454:	} else if (feederID == FEEDER_TEAM_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $4111
line 6455
;6455:		if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+212
INDIRI4
ADDRGP4 uiInfo+78396
INDIRI4
LEI4 $4113
line 6456
;6456:			uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78396
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 6457
;6457:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6458
;6458:		}
LABELV $4113
line 6459
;6459:		return uiInfo.myTeamCount;
ADDRGP4 uiInfo+78388
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4111
line 6460
;6460:	} else if (feederID == FEEDER_MODS) {
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $4120
line 6461
;6461:		return uiInfo.modCount;
ADDRGP4 uiInfo+96728
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4120
line 6462
;6462:	} else if (feederID == FEEDER_DEMOS) {
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $4123
line 6463
;6463:		return uiInfo.demoCount;
ADDRGP4 uiInfo+98792
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4123
line 6464
;6464:	} else if (feederID == FEEDER_SCRIPTS) {
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $4126
line 6465
;6465:		return uiInfo.scriptCount;
ADDRGP4 uiInfo+97760
INDIRI4
RETI4
ADDRGP4 $4075
JUMPV
LABELV $4126
line 6467
;6466:	}
;6467:	return 0;
CNSTI4 0
RETI4
LABELV $4075
endproc UI_FeederCount 12 4
proc UI_SelectedMap 8 0
line 6470
;6468:}
;6469:
;6470:static const char *UI_SelectedMap(int index, int *actual) {
line 6472
;6471:	int i, c;
;6472:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 6473
;6473:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 6474
;6474:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $4133
JUMPV
LABELV $4130
line 6475
;6475:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4135
line 6476
;6476:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $4139
line 6477
;6477:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 6478
;6478:				return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768
ADDP4
INDIRP4
RETP4
ADDRGP4 $4129
JUMPV
LABELV $4139
line 6479
;6479:			} else {
line 6480
;6480:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6481
;6481:			}
line 6482
;6482:		}
LABELV $4135
line 6483
;6483:	}
LABELV $4131
line 6474
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4133
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LTI4 $4130
line 6484
;6484:	return "";
ADDRGP4 $119
RETP4
LABELV $4129
endproc UI_SelectedMap 8 0
proc UI_GetIndexFromSelection 8 0
line 6487
;6485:}
;6486:
;6487:static int UI_GetIndexFromSelection(int actual) {
line 6489
;6488:	int i, c;
;6489:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 6490
;6490:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $4146
JUMPV
LABELV $4143
line 6491
;6491:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4148
line 6492
;6492:			if (i == actual) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $4152
line 6493
;6493:				return c;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $4142
JUMPV
LABELV $4152
line 6495
;6494:			}
;6495:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6496
;6496:		}
LABELV $4148
line 6497
;6497:	}
LABELV $4144
line 6490
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4146
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
LTI4 $4143
line 6498
;6498:  return 0;
CNSTI4 0
RETI4
LABELV $4142
endproc UI_GetIndexFromSelection 8 0
proc UI_UpdatePendingPings 0 4
line 6501
;6499:}
;6500:
;6501:static void UI_UpdatePendingPings() { 
line 6502
;6502:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 6503
;6503:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+99836+1124
CNSTI4 1
ASGNI4
line 6504
;6504:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99836+1104
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 6506
;6505:
;6506:}
LABELV $4154
endproc UI_UpdatePendingPings 0 4
bss
align 1
LABELV $4162
skip 1024
align 1
LABELV $4163
skip 1024
align 1
LABELV $4164
skip 32
data
align 4
LABELV $4165
byte 4 -1
align 4
LABELV $4166
byte 4 0
code
proc UI_FeederItemText 56 20
line 6508
;6507:
;6508:static const char *UI_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
line 6514
;6509:	static char info[MAX_STRING_CHARS];
;6510:	static char hostname[1024];
;6511:	static char clientBuff[32];
;6512:	static lastColumn = -1;
;6513:	static lastTime = 0;
;6514:	*handle = -1;
ADDRFP4 12
INDIRP4
CNSTI4 -1
ASGNI4
line 6515
;6515:	if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $4167
line 6516
;6516:		if (index >= 0 && index < uiInfo.characterCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $4168
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73492
INDIRI4
GEI4 $4168
line 6517
;6517:			return uiInfo.characterList[index].name;
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500
ADDP4
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
line 6519
;6518:		}
;6519:	} else if (feederID == FEEDER_Q3HEADS) {
LABELV $4167
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $4173
line 6520
;6520:		if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $4174
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+118968
INDIRI4
GEI4 $4174
line 6521
;6521:			return uiInfo.q3HeadNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118972
ADDP4
RETP4
ADDRGP4 $4161
JUMPV
line 6523
;6522:		}
;6523:	} else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
LABELV $4173
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $4181
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4179
LABELV $4181
line 6525
;6524:		int actual;
;6525:		return UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 UI_SelectedMap
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4179
line 6526
;6526:	} else if (feederID == FEEDER_SERVERS) {
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $4182
line 6527
;6527:		if (index >= 0 && index < uiInfo.serverStatus.numDisplayServers) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4183
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
GEI4 $4183
line 6529
;6528:			int ping, game;
;6529:			if (lastColumn != column || lastTime > uiInfo.uiDC.realTime + 5000) {
ADDRGP4 $4165
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $4191
ADDRGP4 $4166
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 5000
ADDI4
LEI4 $4188
LABELV $4191
line 6530
;6530:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
ADDRGP4 $4162
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 6531
;6531:				lastColumn = column;
ADDRGP4 $4165
ADDRFP4 8
INDIRI4
ASGNI4
line 6532
;6532:				lastTime = uiInfo.uiDC.realTime;
ADDRGP4 $4166
ADDRGP4 uiInfo+212
INDIRI4
ASGNI4
line 6533
;6533:			}
LABELV $4188
line 6534
;6534:			ping = atoi(Info_ValueForKey(info, "ping"));
ADDRGP4 $4162
ARGP4
ADDRGP4 $3821
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 6535
;6535:			if (ping == -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $4196
line 6538
;6536:				// if we ever see a ping that is out of date, do a server refresh
;6537:				// UI_UpdatePendingPings();
;6538:			}
LABELV $4196
line 6539
;6539:			switch (column) {
ADDRLP4 24
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $4183
ADDRLP4 24
INDIRI4
CNSTI4 4
GTI4 $4183
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4219
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4219
address $4200
address $4208
address $4209
address $4211
address $4215
code
LABELV $4200
line 6541
;6540:				case SORT_HOST : 
;6541:					if (ping <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $4201
line 6542
;6542:						return Info_ValueForKey(info, "addr");
ADDRGP4 $4162
ARGP4
ADDRGP4 $3494
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4201
line 6543
;6543:					} else {
line 6544
;6544:						if ( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4203
line 6545
;6545:							Com_sprintf( hostname, sizeof(hostname), "%s [%s]",
ADDRGP4 $4162
ARGP4
ADDRGP4 $3493
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $4162
ARGP4
ADDRGP4 $4207
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $4163
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $4206
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6548
;6546:											Info_ValueForKey(info, "hostname"),
;6547:											netnames[atoi(Info_ValueForKey(info, "nettype"))] );
;6548:							return hostname;
ADDRGP4 $4163
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4203
line 6550
;6549:						}
;6550:						else {
line 6551
;6551:							return Info_ValueForKey(info, "hostname");
ADDRGP4 $4162
ARGP4
ADDRGP4 $3493
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4208
line 6554
;6552:						}
;6553:					}
;6554:				case SORT_MAP : return Info_ValueForKey(info, "mapname");
ADDRGP4 $4162
ARGP4
ADDRGP4 $3778
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4209
line 6556
;6555:				case SORT_CLIENTS : 
;6556:					Com_sprintf( clientBuff, sizeof(clientBuff), "%s (%s)", Info_ValueForKey(info, "clients"), Info_ValueForKey(info, "sv_maxclients"));
ADDRGP4 $4162
ARGP4
ADDRGP4 $3729
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $4162
ARGP4
ADDRGP4 $1698
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $4164
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $4210
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6557
;6557:					return clientBuff;
ADDRGP4 $4164
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4211
line 6559
;6558:				case SORT_GAME : 
;6559:					game = atoi(Info_ValueForKey(info, "gametype"));
ADDRGP4 $4162
ARGP4
ADDRGP4 $3749
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 6560
;6560:					if (game >= 0 && game < numTeamArenaGameTypes) {
ADDRLP4 48
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LTI4 $4212
ADDRLP4 48
INDIRI4
ADDRGP4 numTeamArenaGameTypes
INDIRI4
GEI4 $4212
line 6561
;6561:						return teamArenaGameTypes[game];
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamArenaGameTypes
ADDP4
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4212
line 6562
;6562:					} else {
line 6563
;6563:						return "Unknown";
ADDRGP4 $4214
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4215
line 6566
;6564:					}
;6565:				case SORT_PING : 
;6566:					if (ping <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $4216
line 6567
;6567:						return "...";
ADDRGP4 $4218
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4216
line 6568
;6568:					} else {
line 6569
;6569:						return Info_ValueForKey(info, "ping");
ADDRGP4 $4162
ARGP4
ADDRGP4 $3821
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
line 6572
;6570:					}
;6571:			}
;6572:		}
line 6573
;6573:	} else if (feederID == FEEDER_SERVERSTATUS) {
LABELV $4182
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $4220
line 6574
;6574:		if ( index >= 0 && index < uiInfo.serverStatusInfo.numLines ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4221
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+110296+3328
INDIRI4
GEI4 $4221
line 6575
;6575:			if ( column >= 0 && column < 4 ) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $4221
ADDRLP4 8
INDIRI4
CNSTI4 4
GEI4 $4221
line 6576
;6576:				return uiInfo.serverStatusInfo.lines[index][column];
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+110296+64
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
line 6578
;6577:			}
;6578:		}
line 6579
;6579:	} else if (feederID == FEEDER_FINDPLAYER) {
LABELV $4220
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $4230
line 6580
;6580:		if ( index >= 0 && index < uiInfo.numFoundPlayerServers ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4231
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+118952
INDIRI4
GEI4 $4231
line 6582
;6581:			//return uiInfo.foundPlayerServerAddresses[index];
;6582:			return uiInfo.foundPlayerServerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117924
ADDP4
RETP4
ADDRGP4 $4161
JUMPV
line 6584
;6583:		}
;6584:	} else if (feederID == FEEDER_PLAYER_LIST) {
LABELV $4230
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $4236
line 6585
;6585:		if (index >= 0 && index < uiInfo.playerCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4237
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78384
INDIRI4
GEI4 $4237
line 6586
;6586:			return uiInfo.playerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78412
ADDP4
RETP4
ADDRGP4 $4161
JUMPV
line 6588
;6587:		}
;6588:	} else if (feederID == FEEDER_TEAM_LIST) {
LABELV $4236
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $4242
line 6589
;6589:		if (index >= 0 && index < uiInfo.myTeamCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4243
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78388
INDIRI4
GEI4 $4243
line 6590
;6590:			return uiInfo.teamNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80460
ADDP4
RETP4
ADDRGP4 $4161
JUMPV
line 6592
;6591:		}
;6592:	} else if (feederID == FEEDER_MODS) {
LABELV $4242
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $4248
line 6593
;6593:		if (index >= 0 && index < uiInfo.modCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4249
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+96728
INDIRI4
GEI4 $4249
line 6594
;6594:			if (uiInfo.modList[index].modDescr && *uiInfo.modList[index].modDescr) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+96216+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4253
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+96216+4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4253
line 6595
;6595:				return uiInfo.modList[index].modDescr;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96216+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4253
line 6596
;6596:			} else {
line 6597
;6597:				return uiInfo.modList[index].modName;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96216
ADDP4
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
line 6600
;6598:			}
;6599:		}
;6600:	} else if (feederID == FEEDER_CINEMATICS) {
LABELV $4248
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $4262
line 6601
;6601:		if (index >= 0 && index < uiInfo.movieCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4263
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99824
INDIRI4
GEI4 $4263
line 6602
;6602:			return uiInfo.movieList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98800
ADDP4
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
line 6604
;6603:		}
;6604:	} else if (feederID == FEEDER_DEMOS) {
LABELV $4262
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $4268
line 6605
;6605:		if (index >= 0 && index < uiInfo.demoCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4269
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+98792
INDIRI4
GEI4 $4269
line 6606
;6606:			return uiInfo.demoList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97768
ADDP4
INDIRP4
RETP4
ADDRGP4 $4161
JUMPV
line 6608
;6607:		}
;6608:	} else if (feederID == FEEDER_SCRIPTS) {
LABELV $4268
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $4274
line 6609
;6609:		if (index >= 0 && index < uiInfo.scriptCount) { 
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4276
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+97760
INDIRI4
GEI4 $4276
line 6610
;6610:			return scriptList[index];
ADDRFP4 4
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 scriptList
ADDP4
RETP4
ADDRGP4 $4161
JUMPV
LABELV $4276
line 6612
;6611:		}
;6612:	}
LABELV $4274
LABELV $4269
LABELV $4263
LABELV $4249
LABELV $4243
LABELV $4237
LABELV $4231
LABELV $4221
LABELV $4183
LABELV $4174
LABELV $4168
line 6613
;6613:	return "";
ADDRGP4 $119
RETP4
LABELV $4161
endproc UI_FeederItemText 56 20
proc UI_FeederItemImage 20 8
line 6617
;6614:}
;6615:
;6616:
;6617:static qhandle_t UI_FeederItemImage(float feederID, int index) {
line 6618
;6618:  if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $4280
line 6619
;6619:    if (index >= 0 && index < uiInfo.characterCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $4281
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73492
INDIRI4
GEI4 $4281
line 6620
;6620:			if (uiInfo.characterList[index].headImage == -1) {
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500+8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $4285
line 6621
;6621:	      uiInfo.characterList[index].headImage = trap_R_RegisterShaderNoMip(uiInfo.characterList[index].imageName);
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73500+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73500+8
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 6622
;6622:			}
LABELV $4285
line 6623
;6623:      return uiInfo.characterList[index].headImage;
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500+8
ADDP4
INDIRI4
RETI4
ADDRGP4 $4279
JUMPV
line 6625
;6624:    }
;6625:  } else if (feederID == FEEDER_Q3HEADS) {
LABELV $4280
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $4295
line 6626
;6626:    if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $4296
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+118968
INDIRI4
GEI4 $4296
line 6627
;6627:      return uiInfo.q3HeadIcons[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+135356
ADDP4
INDIRI4
RETI4
ADDRGP4 $4279
JUMPV
line 6629
;6628:    }
;6629:	} else if (feederID == FEEDER_ALLMAPS || feederID == FEEDER_MAPS) {
LABELV $4295
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
EQF4 $4303
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4301
LABELV $4303
line 6631
;6630:		int actual;
;6631:		UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 6632
;6632:		index = actual;
ADDRFP4 4
ADDRLP4 4
INDIRI4
ASGNI4
line 6633
;6633:		if (index >= 0 && index < uiInfo.mapCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $4304
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
GEI4 $4304
line 6634
;6634:			if (uiInfo.mapList[index].levelShot == -1) {
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $4307
line 6635
;6635:				uiInfo.mapList[index].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[index].imageName);
ADDRLP4 12
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+82768+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+82768+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 6636
;6636:			}
LABELV $4307
line 6637
;6637:			return uiInfo.mapList[index].levelShot;
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+92
ADDP4
INDIRI4
RETI4
ADDRGP4 $4279
JUMPV
LABELV $4304
line 6639
;6638:		}
;6639:	}
LABELV $4301
LABELV $4296
LABELV $4281
line 6640
;6640:  return 0;
CNSTI4 0
RETI4
LABELV $4279
endproc UI_FeederItemImage 20 8
bss
align 1
LABELV $4318
skip 1024
code
proc UI_FeederSelection 40 24
line 6643
;6641:}
;6642:
;6643:static void UI_FeederSelection(float feederID, int index) {
line 6646
;6644:	static char info[MAX_STRING_CHARS];
;6645:
;6646:  if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $4319
line 6647
;6647:    if (index >= 0 && index < uiInfo.characterCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $4320
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73492
INDIRI4
GEI4 $4320
line 6648
;6648:      trap_Cvar_Set( "team_model", uiInfo.characterList[index].female ? "janet" : "james");
ADDRGP4 $4324
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500+12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4330
ADDRLP4 4
ADDRGP4 $4327
ASGNP4
ADDRGP4 $4331
JUMPV
LABELV $4330
ADDRLP4 4
ADDRGP4 $4328
ASGNP4
LABELV $4331
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6649
;6649:      trap_Cvar_Set( "team_headmodel", va("*%s", uiInfo.characterList[index].name)); 
ADDRGP4 $4333
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4332
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6650
;6650:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 6651
;6651:    }
line 6652
;6652:  } else if (feederID == FEEDER_Q3HEADS) {
ADDRGP4 $4320
JUMPV
LABELV $4319
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $4335
line 6653
;6653:    if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $4336
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+118968
INDIRI4
GEI4 $4336
line 6654
;6654:      trap_Cvar_Set( "model", uiInfo.q3HeadNames[index]);
ADDRGP4 $1254
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118972
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6655
;6655:      trap_Cvar_Set( "headmodel", uiInfo.q3HeadNames[index]);
ADDRGP4 $1255
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118972
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6656
;6656:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 6657
;6657:		}
line 6658
;6658:  } else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
ADDRGP4 $4336
JUMPV
LABELV $4335
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $4344
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4342
LABELV $4344
line 6660
;6659:		int actual, map;
;6660:		map = (feederID == FEEDER_ALLMAPS) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4348
ADDRLP4 12
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $4349
JUMPV
LABELV $4348
ADDRLP4 12
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $4349
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 6661
;6661:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4350
line 6662
;6662:		  trap_CIN_StopCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6663
;6663:		  uiInfo.mapList[map].cinematic = -1;
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
CNSTI4 -1
ASGNI4
line 6664
;6664:		}
LABELV $4350
line 6665
;6665:		UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 6666
;6666:		trap_Cvar_Set("ui_mapIndex", va("%d", index));
ADDRGP4 $1015
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $238
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6667
;6667:		ui_mapIndex.integer = index;
ADDRGP4 ui_mapIndex+12
ADDRFP4 4
INDIRI4
ASGNI4
line 6669
;6668:
;6669:		if (feederID == FEEDER_MAPS) {
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4359
line 6670
;6670:			ui_currentMap.integer = actual;
ADDRGP4 ui_currentMap+12
ADDRLP4 4
INDIRI4
ASGNI4
line 6671
;6671:			trap_Cvar_Set("ui_currentMap", va("%d", actual));
ADDRGP4 $1015
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $236
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6672
;6672:	  	uiInfo.mapList[ui_currentMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $1090
ARGP4
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 6673
;6673:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 6674
;6674:			trap_Cvar_Set("ui_opponentModel", uiInfo.mapList[ui_currentMap.integer].opponentName);
ADDRGP4 $1425
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+12
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6675
;6675:			updateOpponentModel = qtrue;
ADDRGP4 updateOpponentModel
CNSTI4 1
ASGNI4
line 6676
;6676:		} else {
ADDRGP4 $4343
JUMPV
LABELV $4359
line 6677
;6677:			ui_currentNetMap.integer = actual;
ADDRGP4 ui_currentNetMap+12
ADDRLP4 4
INDIRI4
ASGNI4
line 6678
;6678:			trap_Cvar_Set("ui_currentNetMap", va("%d", actual));
ADDRGP4 $1015
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $237
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6679
;6679:	  	uiInfo.mapList[ui_currentNetMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $1090
ARGP4
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 6680
;6680:		}
line 6682
;6681:
;6682:  } else if (feederID == FEEDER_SERVERS) {
ADDRGP4 $4343
JUMPV
LABELV $4342
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $4384
line 6683
;6683:		const char *mapName = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 6684
;6684:		uiInfo.serverStatus.currentServer = index;
ADDRGP4 uiInfo+99836+1128
ADDRFP4 4
INDIRI4
ASGNI4
line 6685
;6685:		trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99836+1132
ADDP4
INDIRI4
ARGI4
ADDRGP4 $4318
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 6686
;6686:		uiInfo.serverStatus.currentServerPreview = trap_R_RegisterShaderNoMip(va("levelshots/%s", Info_ValueForKey(info, "mapname")));
ADDRGP4 $4318
ARGP4
ADDRGP4 $3778
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $1372
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+99836+9340
ADDRLP4 16
INDIRI4
ASGNI4
line 6687
;6687:		if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99836+9344
INDIRI4
CNSTI4 0
LTI4 $4393
line 6688
;6688:		  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99836+9344
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6689
;6689:			uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99836+9344
CNSTI4 -1
ASGNI4
line 6690
;6690:		}
LABELV $4393
line 6691
;6691:		mapName = Info_ValueForKey(info, "mapname");
ADDRGP4 $4318
ARGP4
ADDRGP4 $3778
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 6692
;6692:		if (mapName && *mapName) {
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4385
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4385
line 6693
;6693:			uiInfo.serverStatus.currentServerCinematic = trap_CIN_PlayCinematic(va("%s.roq", mapName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $1090
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+99836+9344
ADDRLP4 36
INDIRI4
ASGNI4
line 6694
;6694:		}
line 6695
;6695:  } else if (feederID == FEEDER_SERVERSTATUS) {
ADDRGP4 $4385
JUMPV
LABELV $4384
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $4405
line 6697
;6696:		//
;6697:  } else if (feederID == FEEDER_FINDPLAYER) {
ADDRGP4 $4406
JUMPV
LABELV $4405
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $4407
line 6698
;6698:	  uiInfo.currentFoundPlayerServer = index;
ADDRGP4 uiInfo+118948
ADDRFP4 4
INDIRI4
ASGNI4
line 6700
;6699:	  //
;6700:	  if ( index < uiInfo.numFoundPlayerServers-1) {
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+118952
INDIRI4
CNSTI4 1
SUBI4
GEI4 $4408
line 6702
;6701:			// build a new server status for this server
;6702:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+110232
ARGP4
ADDRGP4 uiInfo+118948
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+116900
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 6703
;6703:			Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 6704
;6704:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 6705
;6705:	  }
line 6706
;6706:  } else if (feederID == FEEDER_PLAYER_LIST) {
ADDRGP4 $4408
JUMPV
LABELV $4407
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $4417
line 6707
;6707:		uiInfo.playerIndex = index;
ADDRGP4 uiInfo+78400
ADDRFP4 4
INDIRI4
ASGNI4
line 6708
;6708:  } else if (feederID == FEEDER_TEAM_LIST) {
ADDRGP4 $4418
JUMPV
LABELV $4417
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $4420
line 6709
;6709:		uiInfo.teamIndex = index;
ADDRGP4 uiInfo+78392
ADDRFP4 4
INDIRI4
ASGNI4
line 6710
;6710:  } else if (feederID == FEEDER_MODS) {
ADDRGP4 $4421
JUMPV
LABELV $4420
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $4423
line 6711
;6711:		uiInfo.modIndex = index;
ADDRGP4 uiInfo+96732
ADDRFP4 4
INDIRI4
ASGNI4
line 6712
;6712:  } else if (feederID == FEEDER_CINEMATICS) {
ADDRGP4 $4424
JUMPV
LABELV $4423
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $4426
line 6713
;6713:		uiInfo.movieIndex = index;
ADDRGP4 uiInfo+99828
ADDRFP4 4
INDIRI4
ASGNI4
line 6714
;6714:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99832
INDIRI4
CNSTI4 0
LTI4 $4429
line 6715
;6715:		  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99832
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6716
;6716:		}
LABELV $4429
line 6717
;6717:		uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+99832
CNSTI4 -1
ASGNI4
line 6718
;6718:  } else if (feederID == FEEDER_DEMOS) {
ADDRGP4 $4427
JUMPV
LABELV $4426
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $4434
line 6719
;6719:		uiInfo.demoIndex = index;
ADDRGP4 uiInfo+98796
ADDRFP4 4
INDIRI4
ASGNI4
line 6720
;6720:  } else if ( feederID == FEEDER_SCRIPTS ) {
ADDRGP4 $4435
JUMPV
LABELV $4434
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $4437
line 6721
;6721:	  uiInfo.scriptIndex = index;
ADDRGP4 uiInfo+97764
ADDRFP4 4
INDIRI4
ASGNI4
line 6722
;6722:  }
LABELV $4437
LABELV $4435
LABELV $4427
LABELV $4424
LABELV $4421
LABELV $4418
LABELV $4408
LABELV $4406
LABELV $4385
LABELV $4343
LABELV $4336
LABELV $4320
line 6723
;6723:}
LABELV $4317
endproc UI_FeederSelection 40 24
proc Team_Parse 72 12
line 6725
;6724:
;6725:static qboolean Team_Parse(char **p) {
line 6731
;6726:  char *token;
;6727:  const char *tempStr;
;6728:	int i;
;6729: 
;6730:
;6731:  token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 6733
;6732:
;6733:  if (token[0] != '{') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4444
line 6734
;6734:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4440
JUMPV
LABELV $4443
line 6737
;6735:  }
;6736:
;6737:  while ( 1 ) {
line 6739
;6738:
;6739:    token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 6741
;6740:    
;6741:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $763
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $4446
line 6742
;6742:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4440
JUMPV
LABELV $4446
line 6745
;6743:    }
;6744:
;6745:    if ( !token || token[0] == 0 ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4450
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4448
LABELV $4450
line 6746
;6746:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4440
JUMPV
LABELV $4448
line 6749
;6747:    }
;6748:
;6749:    if (token[0] == '{') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4451
line 6751
;6750:      // seven tokens per line, team name and icon, and 5 team member names
;6751:      if (!String_Parse(p, &uiInfo.teamList[uiInfo.teamCount].teamName) || !String_Parse(p, &tempStr)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $4457
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4453
LABELV $4457
line 6752
;6752:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4440
JUMPV
LABELV $4453
line 6756
;6753:      }
;6754:    
;6755:
;6756:			uiInfo.teamList[uiInfo.teamCount].imageName = tempStr;
CNSTI4 44
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+4
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 6757
;6757:	    uiInfo.teamList[uiInfo.teamCount].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[uiInfo.teamCount].imageName);
ADDRLP4 36
CNSTI4 44
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+28
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 6758
;6758:		  uiInfo.teamList[uiInfo.teamCount].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[uiInfo.teamCount].imageName));
ADDRGP4 $1066
ARGP4
ADDRLP4 44
CNSTI4 44
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+32
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 6759
;6759:			uiInfo.teamList[uiInfo.teamCount].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[uiInfo.teamCount].imageName));
ADDRGP4 $1071
ARGP4
ADDRLP4 56
CNSTI4 44
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+36
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 6761
;6760:
;6761:			uiInfo.teamList[uiInfo.teamCount].cinematic = -1;
CNSTI4 44
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
CNSTI4 -1
ASGNI4
line 6763
;6762:
;6763:			for (i = 0; i < TEAM_MEMBERS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $4482
line 6764
;6764:				uiInfo.teamList[uiInfo.teamCount].teamMembers[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+8
ADDP4
ADDP4
CNSTP4 0
ASGNP4
line 6765
;6765:				if (!String_Parse(p, &uiInfo.teamList[uiInfo.teamCount].teamMembers[i])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+8
ADDP4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $4489
line 6766
;6766:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4440
JUMPV
LABELV $4489
line 6768
;6767:				}
;6768:			}
LABELV $4483
line 6763
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $4482
line 6770
;6769:
;6770:      Com_Printf("Loaded team %s with team icon %s.\n", uiInfo.teamList[uiInfo.teamCount].teamName, tempStr);
ADDRGP4 $4494
ARGP4
CNSTI4 44
ADDRGP4 uiInfo+75296
INDIRI4
MULI4
ADDRGP4 uiInfo+75300
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6771
;6771:      if (uiInfo.teamCount < MAX_TEAMS) {
ADDRGP4 uiInfo+75296
INDIRI4
CNSTI4 64
GEI4 $4497
line 6772
;6772:        uiInfo.teamCount++;
ADDRLP4 68
ADDRGP4 uiInfo+75296
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6773
;6773:      } else {
ADDRGP4 $4498
JUMPV
LABELV $4497
line 6774
;6774:        Com_Printf("Too many teams, last team replaced!\n");
ADDRGP4 $4501
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6775
;6775:      }
LABELV $4498
line 6776
;6776:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 68
INDIRP4
ASGNP4
line 6777
;6777:      if (token[0] != '}') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $4502
line 6778
;6778:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4440
JUMPV
LABELV $4502
line 6780
;6779:      }
;6780:    }
LABELV $4451
line 6781
;6781:  }
LABELV $4444
line 6737
ADDRGP4 $4443
JUMPV
line 6783
;6782:
;6783:  return qfalse;
CNSTI4 0
RETI4
LABELV $4440
endproc Team_Parse 72 12
proc Character_Parse 56 8
line 6786
;6784:}
;6785:
;6786:static qboolean Character_Parse(char **p) {
line 6790
;6787:  char *token;
;6788:  const char *tempStr;
;6789:
;6790:  token = COM_ParseExt(p, qtrue);
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
line 6792
;6791:
;6792:  if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4508
line 6793
;6793:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4504
JUMPV
LABELV $4507
line 6797
;6794:  }
;6795:
;6796:
;6797:  while ( 1 ) {
line 6798
;6798:    token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 6800
;6799:
;6800:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $763
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $4510
line 6801
;6801:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4504
JUMPV
LABELV $4510
line 6804
;6802:    }
;6803:
;6804:    if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4514
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4512
LABELV $4514
line 6805
;6805:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4504
JUMPV
LABELV $4512
line 6808
;6806:    }
;6807:
;6808:    if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4515
line 6810
;6809:      // two tokens per line, character name and sex
;6810:      if (!String_Parse(p, &uiInfo.characterList[uiInfo.characterCount].name) || !String_Parse(p, &tempStr)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4521
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4517
LABELV $4521
line 6811
;6811:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4504
JUMPV
LABELV $4517
line 6814
;6812:      }
;6813:    
;6814:      uiInfo.characterList[uiInfo.characterCount].headImage = -1;
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500+8
ADDP4
CNSTI4 -1
ASGNI4
line 6815
;6815:			uiInfo.characterList[uiInfo.characterCount].imageName = String_Alloc(va("models/players/heads/%s/icon_default.tga", uiInfo.characterList[uiInfo.characterCount].name));
ADDRGP4 $4528
ARGP4
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRGP4 uiInfo+73492
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 uiInfo+73500
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+73492
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 uiInfo+73500+4
ADDP4
ADDRLP4 40
INDIRP4
ASGNP4
line 6817
;6816:
;6817:      if (tempStr && (tempStr[0] == 'f' || tempStr[0] == 'F')) {
ADDRLP4 44
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4531
ADDRLP4 48
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 102
EQI4 $4533
ADDRLP4 48
INDIRI4
CNSTI4 70
NEI4 $4531
LABELV $4533
line 6818
;6818:        uiInfo.characterList[uiInfo.characterCount].female = qtrue;
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500+12
ADDP4
CNSTI4 1
ASGNI4
line 6819
;6819:      } else {
ADDRGP4 $4532
JUMPV
LABELV $4531
line 6820
;6820:        uiInfo.characterList[uiInfo.characterCount].female = qfalse;
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+73500+12
ADDP4
CNSTI4 0
ASGNI4
line 6821
;6821:      }
LABELV $4532
line 6824
;6822:
;6823:    //  Com_Printf("Loaded %s character %s.\n", tempStr, uiInfo.characterList[uiInfo.characterCount].name);
;6824:      if (uiInfo.characterCount < MAX_HEADS) {
ADDRGP4 uiInfo+73492
INDIRI4
CNSTI4 64
GEI4 $4540
line 6825
;6825:        uiInfo.characterCount++;
ADDRLP4 52
ADDRGP4 uiInfo+73492
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6826
;6826:      } else {
ADDRGP4 $4541
JUMPV
LABELV $4540
line 6827
;6827:        Com_Printf("Too many characters, last character replaced!\n");
ADDRGP4 $4544
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6828
;6828:      }
LABELV $4541
line 6830
;6829:     
;6830:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 52
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 6831
;6831:      if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $4545
line 6832
;6832:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4504
JUMPV
LABELV $4545
line 6834
;6833:      }
;6834:    }
LABELV $4515
line 6835
;6835:  }
LABELV $4508
line 6797
ADDRGP4 $4507
JUMPV
line 6837
;6836:
;6837:  return qfalse;
CNSTI4 0
RETI4
LABELV $4504
endproc Character_Parse 56 8
proc Alias_Parse 36 8
line 6841
;6838:}
;6839:
;6840:
;6841:static qboolean Alias_Parse(char **p) {
line 6844
;6842:  char *token;
;6843:
;6844:  token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6846
;6845:
;6846:  if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4551
line 6847
;6847:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4547
JUMPV
LABELV $4550
line 6850
;6848:  }
;6849:
;6850:  while ( 1 ) {
line 6851
;6851:    token = COM_ParseExt(p, qtrue);
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
line 6853
;6852:
;6853:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $763
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4553
line 6854
;6854:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4547
JUMPV
LABELV $4553
line 6857
;6855:    }
;6856:
;6857:    if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4557
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4555
LABELV $4557
line 6858
;6858:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4547
JUMPV
LABELV $4555
line 6861
;6859:    }
;6860:
;6861:    if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4558
line 6863
;6862:      // three tokens per line, character name, bot alias, and preferred action a - all purpose, d - defense, o - offense
;6863:      if (!String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].name) || !String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].ai) || !String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].action)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74524
INDIRI4
MULI4
ADDRGP4 uiInfo+74528
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4571
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74524
INDIRI4
MULI4
ADDRGP4 uiInfo+74528+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4571
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74524
INDIRI4
MULI4
ADDRGP4 uiInfo+74528+8
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4560
LABELV $4571
line 6864
;6864:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4547
JUMPV
LABELV $4560
line 6868
;6865:      }
;6866:    
;6867:    //  Com_Printf("Loaded character alias %s using character ai %s.\n", uiInfo.aliasList[uiInfo.aliasCount].name, uiInfo.aliasList[uiInfo.aliasCount].ai);
;6868:      if (uiInfo.aliasCount < MAX_ALIASES) {
ADDRGP4 uiInfo+74524
INDIRI4
CNSTI4 64
GEI4 $4572
line 6869
;6869:        uiInfo.aliasCount++;
ADDRLP4 32
ADDRGP4 uiInfo+74524
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6870
;6870:      } else {
ADDRGP4 $4573
JUMPV
LABELV $4572
line 6871
;6871:        Com_Printf("Too many aliases, last alias replaced!\n");
ADDRGP4 $4576
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6872
;6872:      }
LABELV $4573
line 6874
;6873:     
;6874:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 6875
;6875:      if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $4577
line 6876
;6876:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4547
JUMPV
LABELV $4577
line 6878
;6877:      }
;6878:    }
LABELV $4558
line 6879
;6879:  }
LABELV $4551
line 6850
ADDRGP4 $4550
JUMPV
line 6881
;6880:
;6881:  return qfalse;
CNSTI4 0
RETI4
LABELV $4547
endproc Alias_Parse 36 8
proc UI_ParseTeamInfo 44 8
line 6890
;6882:}
;6883:
;6884:
;6885:
;6886:// mode 
;6887:// 0 - high level parsing
;6888:// 1 - team parsing
;6889:// 2 - character parsing
;6890:static void UI_ParseTeamInfo(const char *teamFile) {
line 6893
;6891:	char	*token;
;6892:  char *p;
;6893:  char *buff = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 6896
;6894://  int mode = 0;
;6895:
;6896:  buff = GetMenuBuffer(teamFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 GetMenuBuffer
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 6897
;6897:  if (!buff) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $4580
line 6898
;6898:    return;
ADDRGP4 $4579
JUMPV
LABELV $4580
line 6901
;6899:  }
;6900:
;6901:  p = buff;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $4583
JUMPV
LABELV $4582
line 6903
;6902:
;6903:	while ( 1 ) {
line 6904
;6904:		token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 6905
;6905:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4588
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4588
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $4585
LABELV $4588
line 6906
;6906:			break;
ADDRGP4 $4584
JUMPV
LABELV $4585
line 6909
;6907:		}
;6908:
;6909:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $763
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4589
line 6910
;6910:      break;
ADDRGP4 $4584
JUMPV
LABELV $4589
line 6913
;6911:    }
;6912:
;6913:    if (Q_stricmp(token, "teams") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4593
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4591
line 6915
;6914:
;6915:      if (Team_Parse(&p)) {
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 Team_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $4584
line 6916
;6916:        continue;
ADDRGP4 $4583
JUMPV
line 6917
;6917:      } else {
line 6918
;6918:        break;
LABELV $4591
line 6922
;6919:      }
;6920:    }
;6921:
;6922:    if (Q_stricmp(token, "characters") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4598
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $4596
line 6923
;6923:      Character_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 Character_Parse
CALLI4
pop
line 6924
;6924:    }
LABELV $4596
line 6926
;6925:
;6926:    if (Q_stricmp(token, "aliases") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4601
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $4599
line 6927
;6927:      Alias_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 Alias_Parse
CALLI4
pop
line 6928
;6928:    }
LABELV $4599
line 6930
;6929:
;6930:  }
LABELV $4583
line 6903
ADDRGP4 $4582
JUMPV
LABELV $4584
line 6932
;6931:
;6932:}
LABELV $4579
endproc UI_ParseTeamInfo 44 8
proc GameType_Parse 28 8
line 6935
;6933:
;6934:
;6935:static qboolean GameType_Parse(char **p, qboolean join) {
line 6938
;6936:	char *token;
;6937:
;6938:	token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6940
;6939:
;6940:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4603
line 6941
;6941:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4602
JUMPV
LABELV $4603
line 6944
;6942:	}
;6943:
;6944:	if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4605
line 6945
;6945:		uiInfo.numJoinGameTypes = 0;
ADDRGP4 uiInfo+78248
CNSTI4 0
ASGNI4
line 6946
;6946:	} else {
ADDRGP4 $4610
JUMPV
LABELV $4605
line 6947
;6947:		uiInfo.numGameTypes = 0;
ADDRGP4 uiInfo+78116
CNSTI4 0
ASGNI4
line 6948
;6948:	}
ADDRGP4 $4610
JUMPV
LABELV $4609
line 6950
;6949:
;6950:	while ( 1 ) {
line 6951
;6951:		token = COM_ParseExt(p, qtrue);
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
line 6953
;6952:
;6953:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $763
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4612
line 6954
;6954:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4602
JUMPV
LABELV $4612
line 6957
;6955:		}
;6956:
;6957:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4616
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4614
LABELV $4616
line 6958
;6958:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4602
JUMPV
LABELV $4614
line 6961
;6959:		}
;6960:
;6961:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4617
line 6963
;6962:			// two tokens per line, character name and sex
;6963:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4619
line 6964
;6964:				if (!String_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gameType) || !Int_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78248
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78252
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4628
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78248
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78252+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $4620
LABELV $4628
line 6965
;6965:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4602
JUMPV
line 6967
;6966:				}
;6967:			} else {
LABELV $4619
line 6968
;6968:				if (!String_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gameType) || !Int_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78116
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4636
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78116
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $4629
LABELV $4636
line 6969
;6969:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4602
JUMPV
LABELV $4629
line 6971
;6970:				}
;6971:			}
LABELV $4620
line 6973
;6972:    
;6973:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4637
line 6974
;6974:				if (uiInfo.numJoinGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+78248
INDIRI4
CNSTI4 16
GEI4 $4639
line 6975
;6975:					uiInfo.numJoinGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+78248
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6976
;6976:				} else {
ADDRGP4 $4638
JUMPV
LABELV $4639
line 6977
;6977:					Com_Printf("Too many net game types, last one replace!\n");
ADDRGP4 $4643
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6978
;6978:				}		
line 6979
;6979:			} else {
ADDRGP4 $4638
JUMPV
LABELV $4637
line 6980
;6980:				if (uiInfo.numGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+78116
INDIRI4
CNSTI4 16
GEI4 $4644
line 6981
;6981:					uiInfo.numGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+78116
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6982
;6982:				} else {
ADDRGP4 $4645
JUMPV
LABELV $4644
line 6983
;6983:					Com_Printf("Too many game types, last one replace!\n");
ADDRGP4 $4648
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6984
;6984:				}		
LABELV $4645
line 6985
;6985:			}
LABELV $4638
line 6987
;6986:     
;6987:			token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 6988
;6988:			if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $4649
line 6989
;6989:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4602
JUMPV
LABELV $4649
line 6991
;6990:			}
;6991:		}
LABELV $4617
line 6992
;6992:	}
LABELV $4610
line 6950
ADDRGP4 $4609
JUMPV
line 6993
;6993:	return qfalse;
CNSTI4 0
RETI4
LABELV $4602
endproc GameType_Parse 28 8
proc MapList_Parse 52 8
line 6996
;6994:}
;6995:
;6996:static qboolean MapList_Parse(char **p) {
line 6999
;6997:	char *token;
;6998:
;6999:	token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 7001
;7000:
;7001:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4652
line 7002
;7002:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4651
JUMPV
LABELV $4652
line 7005
;7003:	}
;7004:
;7005:	uiInfo.mapCount = 0;
ADDRGP4 uiInfo+82764
CNSTI4 0
ASGNI4
ADDRGP4 $4656
JUMPV
LABELV $4655
line 7007
;7006:
;7007:	while ( 1 ) {
line 7008
;7008:		token = COM_ParseExt(p, qtrue);
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
line 7010
;7009:
;7010:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $763
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4658
line 7011
;7011:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4651
JUMPV
LABELV $4658
line 7014
;7012:		}
;7013:
;7014:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4662
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4660
LABELV $4662
line 7015
;7015:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4651
JUMPV
LABELV $4660
line 7018
;7016:		}
;7017:
;7018:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4663
line 7019
;7019:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapName) || !String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapLoadName) 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4676
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4676
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+16
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4665
LABELV $4676
line 7020
;7020:				||!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].teamMembers) ) {
line 7021
;7021:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4651
JUMPV
LABELV $4665
line 7024
;7022:			}
;7023:
;7024:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].opponentName)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+12
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4677
line 7025
;7025:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4651
JUMPV
LABELV $4677
line 7028
;7026:			}
;7027:
;7028:			uiInfo.mapList[uiInfo.mapCount].typeBits = 0;
CNSTI4 100
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+20
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $4686
JUMPV
LABELV $4685
line 7030
;7029:
;7030:			while (1) {
line 7031
;7031:				token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 7032
;7032:				if (token[0] >= '0' && token[0] <= '9') {
ADDRLP4 40
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $4687
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $4687
line 7033
;7033:					uiInfo.mapList[uiInfo.mapCount].typeBits |= (1 << (token[0] - 0x030));
ADDRLP4 44
CNSTI4 100
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+20
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 7034
;7034:					if (!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].timeToBeat[token[0] - 0x30])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 2
LSHI4
CNSTI4 192
SUBI4
CNSTI4 100
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+28
ADDP4
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $4689
line 7035
;7035:						return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4651
JUMPV
line 7037
;7036:					}
;7037:				} else {
line 7038
;7038:					break;
LABELV $4689
line 7040
;7039:				} 
;7040:			}
LABELV $4686
line 7030
ADDRGP4 $4685
JUMPV
LABELV $4687
line 7047
;7041:
;7042:			//mapList[mapCount].imageName = String_Alloc(va("levelshots/%s", mapList[mapCount].mapLoadName));
;7043:			//if (uiInfo.mapCount == 0) {
;7044:			  // only load the first cinematic, selection loads the others
;7045:  			//  uiInfo.mapList[uiInfo.mapCount].cinematic = trap_CIN_PlayCinematic(va("%s.roq",uiInfo.mapList[uiInfo.mapCount].mapLoadName), qfalse, qfalse, qtrue, 0, 0, 0, 0);
;7046:			//}
;7047:  		uiInfo.mapList[uiInfo.mapCount].cinematic = -1;
CNSTI4 100
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
CNSTI4 -1
ASGNI4
line 7048
;7048:			uiInfo.mapList[uiInfo.mapCount].levelShot = trap_R_RegisterShaderNoMip(va("levelshots/%s_small", uiInfo.mapList[uiInfo.mapCount].mapLoadName));
ADDRGP4 $4704
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+82764
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+92
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 7050
;7049:
;7050:			if (uiInfo.mapCount < MAX_MAPS) {
ADDRGP4 uiInfo+82764
INDIRI4
CNSTI4 128
GEI4 $4708
line 7051
;7051:				uiInfo.mapCount++;
ADDRLP4 48
ADDRGP4 uiInfo+82764
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 7052
;7052:			} else {
ADDRGP4 $4709
JUMPV
LABELV $4708
line 7053
;7053:				Com_Printf("Too many maps, last one replaced!\n");
ADDRGP4 $4712
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 7054
;7054:			}
LABELV $4709
line 7055
;7055:		}
LABELV $4663
line 7056
;7056:	}
LABELV $4656
line 7007
ADDRGP4 $4655
JUMPV
line 7057
;7057:	return qfalse;
CNSTI4 0
RETI4
LABELV $4651
endproc MapList_Parse 52 8
proc UI_ParseGameInfo 44 8
line 7060
;7058:}
;7059:
;7060:static void UI_ParseGameInfo(const char *teamFile) {
line 7063
;7061:	char	*token;
;7062:	char *p;
;7063:	char *buff = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 7066
;7064://	int mode = 0;
;7065:
;7066:	buff = GetMenuBuffer(teamFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 GetMenuBuffer
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 7067
;7067:	if (!buff) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $4714
line 7068
;7068:		return;
ADDRGP4 $4713
JUMPV
LABELV $4714
line 7071
;7069:	}
;7070:
;7071:	p = buff;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $4717
JUMPV
LABELV $4716
line 7073
;7072:
;7073:	while ( 1 ) {
line 7074
;7074:		token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 7075
;7075:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4722
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4722
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $4719
LABELV $4722
line 7076
;7076:			break;
ADDRGP4 $4718
JUMPV
LABELV $4719
line 7079
;7077:		}
;7078:
;7079:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $763
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4723
line 7080
;7080:			break;
ADDRGP4 $4718
JUMPV
LABELV $4723
line 7083
;7081:		}
;7082:
;7083:		if (Q_stricmp(token, "gametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4727
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4725
line 7085
;7084:
;7085:			if (GameType_Parse(&p, qfalse)) {
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $4718
line 7086
;7086:				continue;
ADDRGP4 $4717
JUMPV
line 7087
;7087:			} else {
line 7088
;7088:				break;
LABELV $4725
line 7092
;7089:			}
;7090:		}
;7091:
;7092:		if (Q_stricmp(token, "joingametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4732
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $4730
line 7094
;7093:
;7094:			if (GameType_Parse(&p, qtrue)) {
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $4718
line 7095
;7095:				continue;
ADDRGP4 $4717
JUMPV
line 7096
;7096:			} else {
line 7097
;7097:				break;
LABELV $4730
line 7101
;7098:			}
;7099:		}
;7100:
;7101:		if (Q_stricmp(token, "maps") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4737
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $4735
line 7103
;7102:			// start a new menu
;7103:			MapList_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 MapList_Parse
CALLI4
pop
line 7104
;7104:		}
LABELV $4735
line 7106
;7105:
;7106:	}
LABELV $4717
line 7073
ADDRGP4 $4716
JUMPV
LABELV $4718
line 7107
;7107:}
LABELV $4713
endproc UI_ParseGameInfo 44 8
proc UI_Pause 4 8
line 7109
;7108:
;7109:static void UI_Pause(qboolean b) {
line 7110
;7110:	if (b) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $4739
line 7112
;7111:		// pause the game and set the ui keycatcher
;7112:	  trap_Cvar_Set( "cl_paused", "0" );//1
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7113
;7113:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 7114
;7114:	} else {
ADDRGP4 $4740
JUMPV
LABELV $4739
line 7116
;7115:		// unpause the game and clear the ui keycatcher
;7116:		trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 7117
;7117:		trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 7118
;7118:		trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7119
;7119:	}
LABELV $4740
line 7120
;7120:}
LABELV $4738
endproc UI_Pause 4 8
proc UI_PlayCinematic 4 24
line 7126
;7121:
;7122:/*static int UI_OwnerDraw_Width(int ownerDraw) {
;7123:return 0;
;7124:}*/
;7125:
;7126:static int UI_PlayCinematic(const char *name, float x, float y, float w, float h) {
line 7127
;7127:  return trap_CIN_PlayCinematic(name, x, y, w, h, (CIN_loop | CIN_silent));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4741
endproc UI_PlayCinematic 4 24
proc UI_StopCinematic 20 4
line 7130
;7128:}
;7129:
;7130:static void UI_StopCinematic(int handle) {
line 7131
;7131:	if (handle >= 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
LTI4 $4743
line 7132
;7132:	  trap_CIN_StopCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 7133
;7133:	} else {
ADDRGP4 $4744
JUMPV
LABELV $4743
line 7134
;7134:		handle = abs(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 abs
CALLI4
ASGNI4
ADDRFP4 0
ADDRLP4 0
INDIRI4
ASGNI4
line 7135
;7135:		if (handle == UI_MAPCINEMATIC) {
ADDRFP4 0
INDIRI4
CNSTI4 244
NEI4 $4745
line 7136
;7136:			if (uiInfo.mapList[ui_currentMap.integer].cinematic >= 0) {
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4746
line 7137
;7137:			  trap_CIN_StopCinematic(uiInfo.mapList[ui_currentMap.integer].cinematic);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 7138
;7138:			  uiInfo.mapList[ui_currentMap.integer].cinematic = -1;
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+82768+24
ADDP4
CNSTI4 -1
ASGNI4
line 7139
;7139:			}
line 7140
;7140:		} else if (handle == UI_NETMAPCINEMATIC) {
ADDRGP4 $4746
JUMPV
LABELV $4745
ADDRFP4 0
INDIRI4
CNSTI4 246
NEI4 $4758
line 7141
;7141:			if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99836+9344
INDIRI4
CNSTI4 0
LTI4 $4759
line 7142
;7142:			  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99836+9344
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 7143
;7143:				uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99836+9344
CNSTI4 -1
ASGNI4
line 7144
;7144:			}
line 7145
;7145:		} else if (handle == UI_CLANCINEMATIC) {
ADDRGP4 $4759
JUMPV
LABELV $4758
ADDRFP4 0
INDIRI4
CNSTI4 251
NEI4 $4768
line 7146
;7146:		  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $208
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 7147
;7147:		  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $4770
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75296
INDIRI4
GEI4 $4770
line 7148
;7148:				if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4773
line 7149
;7149:				  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 7150
;7150:					uiInfo.teamList[i].cinematic = -1;
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75300+40
ADDP4
CNSTI4 -1
ASGNI4
line 7151
;7151:				}
LABELV $4773
line 7152
;7152:			}
LABELV $4770
line 7153
;7153:		}
LABELV $4768
LABELV $4759
LABELV $4746
line 7154
;7154:	}
LABELV $4744
line 7155
;7155:}
LABELV $4742
endproc UI_StopCinematic 20 4
proc UI_DrawCinematic 0 20
line 7157
;7156:
;7157:static void UI_DrawCinematic(int handle, float x, float y, float w, float h) {
line 7158
;7158:	trap_CIN_SetExtents(handle, x, y, w, h);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 7159
;7159:  trap_CIN_DrawCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 7160
;7160:}
LABELV $4781
endproc UI_DrawCinematic 0 20
proc UI_RunCinematicFrame 0 4
line 7162
;7161:
;7162:static void UI_RunCinematicFrame(int handle) {
line 7163
;7163:  trap_CIN_RunCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 7164
;7164:}
LABELV $4782
endproc UI_RunCinematicFrame 0 4
proc UI_BuildQ3Model_List 4248 16
line 7174
;7165:
;7166:
;7167:
;7168:/*
;7169:=================
;7170:PlayerModel_BuildList
;7171:=================
;7172:*/
;7173:static void UI_BuildQ3Model_List( void )
;7174:{
line 7187
;7175:	int		numdirs;
;7176:	int		numfiles;
;7177:	char	dirlist[2048];
;7178:	char	filelist[2048];
;7179:	char	skinname[64];
;7180:	char*	dirptr;
;7181:	char*	fileptr;
;7182:	int		i;
;7183:	int		j;
;7184:	int		dirlen;
;7185:	int		filelen;
;7186:
;7187:	uiInfo.q3HeadCount = 0;
ADDRGP4 uiInfo+118968
CNSTI4 0
ASGNI4
line 7190
;7188:
;7189:	// iterate directory of all player models
;7190:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048 );
ADDRGP4 $4785
ARGP4
ADDRGP4 $4786
ARGP4
ADDRLP4 2144
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4192
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2140
ADDRLP4 4192
INDIRI4
ASGNI4
line 7191
;7191:	dirptr  = dirlist;
ADDRLP4 76
ADDRLP4 2144
ASGNP4
line 7192
;7192:	for (i=0; i<numdirs && uiInfo.q3HeadCount < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 $4790
JUMPV
LABELV $4787
line 7193
;7193:	{
line 7194
;7194:		dirlen = strlen(dirptr);
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4196
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 4196
INDIRI4
ASGNI4
line 7196
;7195:		
;7196:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $4792
ADDRLP4 84
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $4792
ADDRLP4 84
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $4792
line 7198
;7197:
;7198:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $4796
ARGP4
ADDRLP4 4204
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4204
INDIRI4
CNSTI4 0
EQI4 $4798
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $4797
ARGP4
ADDRLP4 4208
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4208
INDIRI4
CNSTI4 0
NEI4 $4794
LABELV $4798
line 7199
;7199:			continue;
ADDRGP4 $4788
JUMPV
LABELV $4794
line 7202
;7200:			
;7201:		// iterate all skin files in directory
;7202:		numfiles = trap_FS_GetFileList( va("models/players/%s",dirptr), "tga", filelist, 2048 );
ADDRGP4 $4799
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4212
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4212
INDIRP4
ARGP4
ADDRGP4 $4800
ARGP4
ADDRLP4 92
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4216
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 4216
INDIRI4
ASGNI4
line 7203
;7203:		fileptr  = filelist;
ADDRLP4 0
ADDRLP4 92
ASGNP4
line 7204
;7204:		for (j=0; j<numfiles && uiInfo.q3HeadCount < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $4804
JUMPV
LABELV $4801
line 7205
;7205:		{
line 7206
;7206:			filelen = strlen(fileptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4220
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 4220
INDIRI4
ASGNI4
line 7208
;7207:
;7208:			COM_StripExtension(fileptr,skinname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 7211
;7209:
;7210:			// look for icon_????
;7211:			if ( Q_stricmpn(skinname, "preview_", 8) == 0 )
ADDRLP4 4
ARGP4
ADDRGP4 $4808
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 4224
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 4224
INDIRI4
CNSTI4 0
NEI4 $4806
line 7212
;7212:			{
line 7213
;7213:				if (Q_stricmp(skinname, "preview_") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $4808
ARGP4
ADDRLP4 4228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4228
INDIRI4
CNSTI4 0
NEI4 $4809
line 7214
;7214:					Com_sprintf( uiInfo.q3HeadNames[uiInfo.q3HeadCount], sizeof(uiInfo.q3HeadNames[uiInfo.q3HeadCount]), dirptr);
ADDRGP4 uiInfo+118968
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118972
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 7215
;7215:				} else {
ADDRGP4 $4810
JUMPV
LABELV $4809
line 7216
;7216:					Com_sprintf( uiInfo.q3HeadNames[uiInfo.q3HeadCount], sizeof(uiInfo.q3HeadNames[uiInfo.q3HeadCount]), "%s",dirptr );
ADDRGP4 uiInfo+118968
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118972
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $1955
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 7217
;7217:				}
LABELV $4810
line 7218
;7218:				uiInfo.q3HeadIcons[uiInfo.q3HeadCount++] = trap_R_RegisterShaderNoMip(va("models/players/%s/%s",dirptr,skinname));
ADDRLP4 4236
ADDRGP4 uiInfo+118968
ASGNP4
ADDRLP4 4232
ADDRLP4 4236
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4236
INDIRP4
ADDRLP4 4232
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $4821
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4240
INDIRP4
ARGP4
ADDRLP4 4244
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4232
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+135356
ADDP4
ADDRLP4 4244
INDIRI4
ASGNI4
line 7219
;7219:			}
LABELV $4806
line 7221
;7220:
;7221:		}
LABELV $4802
line 7204
ADDRLP4 4220
CNSTI4 1
ASGNI4
ADDRLP4 68
ADDRLP4 68
INDIRI4
ADDRLP4 4220
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 72
INDIRI4
ADDRLP4 4220
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $4804
ADDRLP4 68
INDIRI4
ADDRLP4 80
INDIRI4
GEI4 $4822
ADDRGP4 uiInfo+118968
INDIRI4
CNSTI4 256
LTI4 $4801
LABELV $4822
line 7222
;7222:	}	
LABELV $4788
line 7192
ADDRLP4 4196
CNSTI4 1
ASGNI4
ADDRLP4 88
ADDRLP4 88
INDIRI4
ADDRLP4 4196
INDIRI4
ADDI4
ASGNI4
ADDRLP4 76
ADDRLP4 84
INDIRI4
ADDRLP4 4196
INDIRI4
ADDI4
ADDRLP4 76
INDIRP4
ADDP4
ASGNP4
LABELV $4790
ADDRLP4 88
INDIRI4
ADDRLP4 2140
INDIRI4
GEI4 $4823
ADDRGP4 uiInfo+118968
INDIRI4
CNSTI4 256
LTI4 $4787
LABELV $4823
line 7224
;7223:
;7224:}
LABELV $4783
endproc UI_BuildQ3Model_List 4248 16
export UI_RunExtendedMenuScript
proc UI_RunExtendedMenuScript 36 8
line 7229
;7225:
;7226: 
;7227:
;7228:void UI_RunExtendedMenuScript(char **args, int parameter )
;7229:{
line 7234
;7230:	const char *name; 
;7231:
;7232:	//Com_Printf(S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: ui_main.c / UI_RunExtendedMenuScript\n");
;7233:	
;7234:	if (String_Parse(args, &name))
ADDRFP4 0
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
EQI4 $4825
line 7235
;7235:	{
line 7236
;7236:		if (Q_stricmp(name, "setPrimaryWeapon") == 0) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4829
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $4827
line 7237
;7237:		{ 
line 7238
;7238:			if (!UI_CheckWeapon(parameter))
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_CheckWeapon
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4830
line 7239
;7239:			{
line 7240
;7240:				trap_S_StartLocalSound( (trap_S_RegisterSound("sound/misc/refuse.wav", qfalse ) ), CHAN_AUTO );
ADDRGP4 $4832
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 7241
;7241:			}
ADDRGP4 $4828
JUMPV
LABELV $4830
line 7243
;7242:			else
;7243:				trap_Cvar_Set("inven_Primary", va("%i", parameter) );
ADDRGP4 $662
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4833
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7244
;7244:		}
ADDRGP4 $4828
JUMPV
LABELV $4827
line 7245
;7245:		else if (Q_stricmp(name, "setSecondaryWeapon") == 0) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4836
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4834
line 7246
;7246:		{
line 7247
;7247:			trap_Cvar_Set("inven_Secondary", va("%i",parameter) );
ADDRGP4 $662
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4837
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7248
;7248:		}
ADDRGP4 $4835
JUMPV
LABELV $4834
line 7249
;7249:		else if ( Q_stricmp(name, "setItem") == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4840
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $4838
line 7250
;7250:		{ 
line 7254
;7251:			char *cvarname;
;7252:			int	 Value;
;7253:
;7254:			if ( parameter == ITEM_HELMET )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $4841
line 7255
;7255:				cvarname = "inven_Helmet";
ADDRLP4 24
ADDRGP4 $4843
ASGNP4
ADDRGP4 $4842
JUMPV
LABELV $4841
line 7256
;7256:			else if ( parameter == ITEM_VEST )
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $4844
line 7257
;7257:				cvarname = "inven_Vest";
ADDRLP4 24
ADDRGP4 $4846
ASGNP4
ADDRGP4 $4845
JUMPV
LABELV $4844
line 7258
;7258:			else if ( parameter == ITEM_SCOPE_SECONDARY  )
ADDRFP4 4
INDIRI4
CNSTI4 12
NEI4 $4847
line 7259
;7259:				cvarname = "inven_Scope_Secondary";
ADDRLP4 24
ADDRGP4 $4849
ASGNP4
ADDRGP4 $4848
JUMPV
LABELV $4847
line 7260
;7260:			else if( parameter == ITEM_GRENADELAUNCHER_SECONDARY  )
ADDRFP4 4
INDIRI4
CNSTI4 10
NEI4 $4850
line 7261
;7261:				cvarname = "inven_GrenadeLauncher_secondary";
ADDRLP4 24
ADDRGP4 $4852
ASGNP4
ADDRGP4 $4851
JUMPV
LABELV $4850
line 7262
;7262:			else if( parameter == ITEM_LASERSIGHT_SECONDARY  )
ADDRFP4 4
INDIRI4
CNSTI4 9
NEI4 $4853
line 7263
;7263:				cvarname = "inven_LaserSight_secondary";
ADDRLP4 24
ADDRGP4 $4855
ASGNP4
ADDRGP4 $4854
JUMPV
LABELV $4853
line 7264
;7264:			else if( parameter == ITEM_BAYONET_SECONDARY  )
ADDRFP4 4
INDIRI4
CNSTI4 11
NEI4 $4856
line 7265
;7265:				cvarname = "inven_Bayonet_secondary";
ADDRLP4 24
ADDRGP4 $4858
ASGNP4
ADDRGP4 $4857
JUMPV
LABELV $4856
line 7266
;7266:			else if( parameter == ITEM_SILENCER_SECONDARY )
ADDRFP4 4
INDIRI4
CNSTI4 8
NEI4 $4859
line 7267
;7267:				cvarname = "inven_Silencer_secondary";
ADDRLP4 24
ADDRGP4 $4861
ASGNP4
ADDRGP4 $4860
JUMPV
LABELV $4859
line 7268
;7268:			else if ( parameter == ITEM_SCOPE  )
ADDRFP4 4
INDIRI4
CNSTI4 7
NEI4 $4862
line 7269
;7269:				cvarname = "inven_Scope";
ADDRLP4 24
ADDRGP4 $4864
ASGNP4
ADDRGP4 $4863
JUMPV
LABELV $4862
line 7270
;7270:			else if( parameter == ITEM_GRENADELAUNCHER  )
ADDRFP4 4
INDIRI4
CNSTI4 5
NEI4 $4865
line 7271
;7271:				cvarname = "inven_GrenadeLauncher";
ADDRLP4 24
ADDRGP4 $4867
ASGNP4
ADDRGP4 $4866
JUMPV
LABELV $4865
line 7272
;7272:			else if( parameter == ITEM_LASERSIGHT  )
ADDRFP4 4
INDIRI4
CNSTI4 4
NEI4 $4868
line 7273
;7273:				cvarname = "inven_LaserSight";
ADDRLP4 24
ADDRGP4 $4870
ASGNP4
ADDRGP4 $4869
JUMPV
LABELV $4868
line 7274
;7274:			else if( parameter == ITEM_BAYONET  )
ADDRFP4 4
INDIRI4
CNSTI4 6
NEI4 $4871
line 7275
;7275:				cvarname = "inven_Bayonet";
ADDRLP4 24
ADDRGP4 $4873
ASGNP4
ADDRGP4 $4872
JUMPV
LABELV $4871
line 7276
;7276:			else if( parameter == ITEM_SILENCER)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $4874
line 7277
;7277:				cvarname = "inven_Silencer";
ADDRLP4 24
ADDRGP4 $4876
ASGNP4
ADDRGP4 $4875
JUMPV
LABELV $4874
line 7278
;7278:			else if( parameter == ITEM_FLASHLIGHT)
ADDRFP4 4
INDIRI4
CNSTI4 14
NEI4 $4877
line 7279
;7279:				cvarname = "inven_Flashlight";
ADDRLP4 24
ADDRGP4 $4879
ASGNP4
ADDRGP4 $4878
JUMPV
LABELV $4877
line 7280
;7280:			else if( parameter == ITEM_DUCKBILL )
ADDRFP4 4
INDIRI4
CNSTI4 13
NEI4 $4880
line 7281
;7281:				cvarname =" inven_Duckbill";
ADDRLP4 24
ADDRGP4 $4882
ASGNP4
ADDRGP4 $4881
JUMPV
LABELV $4880
line 7282
;7282:			else if( parameter == ITEM_FLASHLIGHT_SECONDARY )
ADDRFP4 4
INDIRI4
CNSTI4 15
NEI4 $4883
line 7283
;7283:				cvarname =" inven_Duckbill_Secondary";
ADDRLP4 24
ADDRGP4 $4885
ASGNP4
ADDRGP4 $4884
JUMPV
LABELV $4883
line 7285
;7284:			else
;7285:				cvarname = "inven_error";
ADDRLP4 24
ADDRGP4 $4886
ASGNP4
LABELV $4884
LABELV $4881
LABELV $4878
LABELV $4875
LABELV $4872
LABELV $4869
LABELV $4866
LABELV $4863
LABELV $4860
LABELV $4857
LABELV $4854
LABELV $4851
LABELV $4848
LABELV $4845
LABELV $4842
line 7288
;7286:
;7287:
;7288:			Value = (int)trap_Cvar_VariableValue(cvarname);
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 7291
;7289:
;7290:			// items only got activate or disable
;7291:			if ( Value == 1 ) // if it's activated, disable it
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $4887
line 7292
;7292:				Value = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $4888
JUMPV
LABELV $4887
line 7294
;7293:			else
;7294:				Value = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $4888
line 7296
;7295:
;7296:			trap_Cvar_Set(cvarname, va("%i",Value) );			
ADDRGP4 $662
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7297
;7297:		}  
ADDRGP4 $4839
JUMPV
LABELV $4838
line 7298
;7298:		else if ( Q_stricmp(name, "raiseCharacter") == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4891
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $4889
line 7299
;7299:		{   
line 7300
;7300:			if ( parameter <= 0 || parameter > PC_STEALTH )
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LEI4 $4894
ADDRLP4 24
INDIRI4
CNSTI4 6
LEI4 $4892
LABELV $4894
line 7301
;7301:				return; 
ADDRGP4 $4824
JUMPV
LABELV $4892
line 7304
;7302:			   
;7303:			
;7304:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "character %i",parameter ) );  
ADDRGP4 $4895
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7305
;7305:		}  
LABELV $4889
LABELV $4839
LABELV $4835
LABELV $4828
line 7307
;7306:
;7307:	} 
LABELV $4825
line 7308
;7308:}
LABELV $4824
endproc UI_RunExtendedMenuScript 36 8
export _UI_Init
proc _UI_Init 44 16
line 7315
;7309:
;7310:/*
;7311:=================
;7312:UI_Init
;7313:=================
;7314:*/
;7315:void _UI_Init( qboolean inGameLoad ) {
line 7321
;7316:	const char *menuSet;
;7317:	int start;
;7318:
;7319:	//uiInfo.inGameLoad = inGameLoad;
;7320:
;7321:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 7322
;7322:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 7325
;7323:
;7324:	// cache redundant calulations
;7325:	trap_GetGlconfig( &uiInfo.uiDC.glconfig );
ADDRGP4 uiInfo+62120
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 7328
;7326:
;7327:	// for 640x480 virtualized screen
;7328:	uiInfo.uiDC.yscale = uiInfo.uiDC.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uiInfo+200
CNSTF4 990414985
ADDRGP4 uiInfo+62120+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 7329
;7329:	uiInfo.uiDC.xscale = uiInfo.uiDC.glconfig.vidWidth * (1.0/640.0);
ADDRGP4 uiInfo+204
CNSTF4 986500301
ADDRGP4 uiInfo+62120+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 7330
;7330:	if ( uiInfo.uiDC.glconfig.vidWidth * 480 > uiInfo.uiDC.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uiInfo+62120+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uiInfo+62120+11308
INDIRI4
MULI4
LEI4 $4904
line 7332
;7331:		// wide screen
;7332:		uiInfo.uiDC.bias = 0.5 * ( uiInfo.uiDC.glconfig.vidWidth - ( uiInfo.uiDC.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 uiInfo+208
CNSTF4 1056964608
ADDRGP4 uiInfo+62120+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uiInfo+62120+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 7333
;7333:	}
ADDRGP4 $4905
JUMPV
LABELV $4904
line 7334
;7334:	else {
line 7336
;7335:		// no wide screen
;7336:		uiInfo.uiDC.bias = 0;
ADDRGP4 uiInfo+208
CNSTF4 0
ASGNF4
line 7337
;7337:	}
LABELV $4905
line 7341
;7338:
;7339:
;7340:  //UI_Load();
;7341:	uiInfo.uiDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
ADDRGP4 uiInfo
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 7342
;7342:	uiInfo.uiDC.setColor = &UI_SetColor;
ADDRGP4 uiInfo+4
ADDRGP4 UI_SetColor
ASGNP4
line 7343
;7343:	uiInfo.uiDC.drawHandlePic = &UI_DrawHandlePic;
ADDRGP4 uiInfo+8
ADDRGP4 UI_DrawHandlePic
ASGNP4
line 7344
;7344:	uiInfo.uiDC.drawStretchPic = &trap_R_DrawStretchPic;
ADDRGP4 uiInfo+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 7345
;7345:	uiInfo.uiDC.drawText = &Text_Paint;
ADDRGP4 uiInfo+16
ADDRGP4 Text_Paint
ASGNP4
line 7346
;7346:	uiInfo.uiDC.textWidth = &Text_Width;
ADDRGP4 uiInfo+20
ADDRGP4 Text_Width
ASGNP4
line 7347
;7347:	uiInfo.uiDC.textHeight = &Text_Height;
ADDRGP4 uiInfo+24
ADDRGP4 Text_Height
ASGNP4
line 7348
;7348:	uiInfo.uiDC.registerModel = &trap_R_RegisterModel;
ADDRGP4 uiInfo+28
ADDRGP4 trap_R_RegisterModel
ASGNP4
line 7349
;7349:	uiInfo.uiDC.modelBounds = &trap_R_ModelBounds;
ADDRGP4 uiInfo+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 7350
;7350:	uiInfo.uiDC.fillRect = &UI_FillRect;
ADDRGP4 uiInfo+36
ADDRGP4 UI_FillRect
ASGNP4
line 7351
;7351:	uiInfo.uiDC.drawRect = &_UI_DrawRect;
ADDRGP4 uiInfo+40
ADDRGP4 _UI_DrawRect
ASGNP4
line 7352
;7352:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 7353
;7353:	uiInfo.uiDC.drawTopBottom = &_UI_DrawTopBottom;
ADDRGP4 uiInfo+48
ADDRGP4 _UI_DrawTopBottom
ASGNP4
line 7354
;7354:	uiInfo.uiDC.clearScene = &trap_R_ClearScene;
ADDRGP4 uiInfo+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 7355
;7355:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 7356
;7356:	uiInfo.uiDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
ADDRGP4 uiInfo+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 7357
;7357:	uiInfo.uiDC.renderScene = &trap_R_RenderScene;
ADDRGP4 uiInfo+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 7358
;7358:	uiInfo.uiDC.registerFont = &trap_R_RegisterFont;
ADDRGP4 uiInfo+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 7359
;7359:	uiInfo.uiDC.ownerDrawItem = &UI_OwnerDraw;
ADDRGP4 uiInfo+68
ADDRGP4 UI_OwnerDraw
ASGNP4
line 7360
;7360:	uiInfo.uiDC.getValue = &UI_GetValue;
ADDRGP4 uiInfo+72
ADDRGP4 UI_GetValue
ASGNP4
line 7361
;7361:	uiInfo.uiDC.ownerDrawVisible = &UI_OwnerDrawVisible;
ADDRGP4 uiInfo+76
ADDRGP4 UI_OwnerDrawVisible
ASGNP4
line 7362
;7362:	uiInfo.uiDC.runScript = &UI_RunMenuScript;
ADDRGP4 uiInfo+80
ADDRGP4 UI_RunMenuScript
ASGNP4
line 7363
;7363: 	uiInfo.uiDC.setWeapon = &UI_RunExtendedMenuScript;
ADDRGP4 uiInfo+84
ADDRGP4 UI_RunExtendedMenuScript
ASGNP4
line 7364
;7364:	uiInfo.uiDC.getTeamColor = &UI_GetTeamColor;
ADDRGP4 uiInfo+88
ADDRGP4 UI_GetTeamColor
ASGNP4
line 7365
;7365:	uiInfo.uiDC.setCVar = trap_Cvar_Set;
ADDRGP4 uiInfo+100
ADDRGP4 trap_Cvar_Set
ASGNP4
line 7366
;7366:	uiInfo.uiDC.getCVarString = trap_Cvar_VariableStringBuffer;
ADDRGP4 uiInfo+92
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 7367
;7367:	uiInfo.uiDC.getCVarValue = trap_Cvar_VariableValue;
ADDRGP4 uiInfo+96
ADDRGP4 trap_Cvar_VariableValue
ASGNP4
line 7368
;7368:	uiInfo.uiDC.drawTextWithCursor = &Text_PaintWithCursor;
ADDRGP4 uiInfo+104
ADDRGP4 Text_PaintWithCursor
ASGNP4
line 7369
;7369:	uiInfo.uiDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
ADDRGP4 uiInfo+108
ADDRGP4 trap_Key_SetOverstrikeMode
ASGNP4
line 7370
;7370:	uiInfo.uiDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
ADDRGP4 uiInfo+112
ADDRGP4 trap_Key_GetOverstrikeMode
ASGNP4
line 7371
;7371:	uiInfo.uiDC.startLocalSound = &trap_S_StartLocalSound;
ADDRGP4 uiInfo+116
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 7372
;7372:	uiInfo.uiDC.ownerDrawHandleKey = &UI_OwnerDrawHandleKey;
ADDRGP4 uiInfo+120
ADDRGP4 UI_OwnerDrawHandleKey
ASGNP4
line 7373
;7373:	uiInfo.uiDC.feederCount = &UI_FeederCount;
ADDRGP4 uiInfo+124
ADDRGP4 UI_FeederCount
ASGNP4
line 7374
;7374:	uiInfo.uiDC.feederItemImage = &UI_FeederItemImage;
ADDRGP4 uiInfo+132
ADDRGP4 UI_FeederItemImage
ASGNP4
line 7375
;7375:	uiInfo.uiDC.feederItemText = &UI_FeederItemText;
ADDRGP4 uiInfo+128
ADDRGP4 UI_FeederItemText
ASGNP4
line 7376
;7376:	uiInfo.uiDC.feederSelection = &UI_FeederSelection;
ADDRGP4 uiInfo+136
ADDRGP4 UI_FeederSelection
ASGNP4
line 7377
;7377:	uiInfo.uiDC.setBinding = &trap_Key_SetBinding;
ADDRGP4 uiInfo+148
ADDRGP4 trap_Key_SetBinding
ASGNP4
line 7378
;7378:	uiInfo.uiDC.getBindingBuf = &trap_Key_GetBindingBuf;
ADDRGP4 uiInfo+144
ADDRGP4 trap_Key_GetBindingBuf
ASGNP4
line 7379
;7379:	uiInfo.uiDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
ADDRGP4 uiInfo+140
ADDRGP4 trap_Key_KeynumToStringBuf
ASGNP4
line 7380
;7380:	uiInfo.uiDC.executeText = &trap_Cmd_ExecuteText;
ADDRGP4 uiInfo+152
ADDRGP4 trap_Cmd_ExecuteText
ASGNP4
line 7381
;7381:	uiInfo.uiDC.Error = &Com_Error; 
ADDRGP4 uiInfo+156
ADDRGP4 Com_Error
ASGNP4
line 7382
;7382:	uiInfo.uiDC.Print = &Com_Printf; 
ADDRGP4 uiInfo+160
ADDRGP4 Com_Printf
ASGNP4
line 7383
;7383:	uiInfo.uiDC.Pause = &UI_Pause;
ADDRGP4 uiInfo+164
ADDRGP4 UI_Pause
ASGNP4
line 7384
;7384:	uiInfo.uiDC.ownerDrawWidth = &UI_OwnerDrawWidth;
ADDRGP4 uiInfo+168
ADDRGP4 UI_OwnerDrawWidth
ASGNP4
line 7385
;7385:	uiInfo.uiDC.registerSound = &trap_S_RegisterSound;
ADDRGP4 uiInfo+172
ADDRGP4 trap_S_RegisterSound
ASGNP4
line 7386
;7386:	uiInfo.uiDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 uiInfo+176
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 7387
;7387:	uiInfo.uiDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
ADDRGP4 uiInfo+180
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 7388
;7388:	uiInfo.uiDC.playCinematic = &UI_PlayCinematic;
ADDRGP4 uiInfo+184
ADDRGP4 UI_PlayCinematic
ASGNP4
line 7389
;7389:	uiInfo.uiDC.stopCinematic = &UI_StopCinematic;
ADDRGP4 uiInfo+188
ADDRGP4 UI_StopCinematic
ASGNP4
line 7390
;7390:	uiInfo.uiDC.drawCinematic = &UI_DrawCinematic;
ADDRGP4 uiInfo+192
ADDRGP4 UI_DrawCinematic
ASGNP4
line 7391
;7391:	uiInfo.uiDC.runCinematicFrame = &UI_RunCinematicFrame;
ADDRGP4 uiInfo+196
ADDRGP4 UI_RunCinematicFrame
ASGNP4
line 7393
;7392:
;7393:	Init_Display(&uiInfo.uiDC);
ADDRGP4 uiInfo
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 7395
;7394: 
;7395: 	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 7397
;7396:  
;7397:	uiInfo.uiDC.cursor	= trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $4967
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+73460
ADDRLP4 8
INDIRI4
ASGNI4
line 7398
;7398:	uiInfo.uiDC.whiteShader = trap_R_RegisterShaderNoMip( "white" );
ADDRGP4 $4969
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+73452
ADDRLP4 12
INDIRI4
ASGNI4
line 7400
;7399:
;7400:	AssetCache();
ADDRGP4 AssetCache
CALLV
pop
line 7402
;7401:
;7402:	start = trap_Milliseconds();
ADDRLP4 16
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 7404
;7403:
;7404:  uiInfo.teamCount = 0;
ADDRGP4 uiInfo+75296
CNSTI4 0
ASGNI4
line 7405
;7405:  uiInfo.characterCount = 0;
ADDRGP4 uiInfo+73492
CNSTI4 0
ASGNI4
line 7406
;7406:  uiInfo.aliasCount = 0;
ADDRGP4 uiInfo+74524
CNSTI4 0
ASGNI4
line 7414
;7407:
;7408:#ifdef PRE_RELEASE_TADEMO
;7409:	UI_ParseTeamInfo("demoteaminfo.txt");
;7410:	UI_ParseGameInfo("demogameinfo.txt");
;7411:#else
;7412://	UI_ParseTeamInfo("teaminfo.txt");
;7413://	UI_LoadTeams();
;7414:	UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $984
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 7417
;7415:#endif
;7416:
;7417:	menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $233
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 7418
;7418:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4975
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4973
LABELV $4975
line 7419
;7419:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $234
ASGNP4
line 7420
;7420:	}
LABELV $4973
line 7428
;7421:
;7422:#if 0
;7423:	if (uiInfo.inGameLoad) {
;7424:		UI_LoadMenus("ui/ingame.txt", qtrue);
;7425:	} else {
;7426:	}
;7427:#else 
;7428:	UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 7429
;7429:	UI_LoadMenus("ui/ingame.txt", qfalse);
ADDRGP4 $4976
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 7432
;7430:#endif
;7431:	
;7432:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 7434
;7433:
;7434:	trap_LAN_LoadCachedServers();
ADDRGP4 trap_LAN_LoadCachedServers
CALLV
pop
line 7435
;7435:	UI_LoadBestScores(uiInfo.mapList[0].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
ADDRGP4 uiInfo+82768+4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78120+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 7437
;7436:
;7437:	UI_BuildQ3Model_List();
ADDRGP4 UI_BuildQ3Model_List
CALLV
pop
line 7438
;7438:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 7441
;7439:
;7440:	// sets defaults for ui temp cvars
;7441:	uiInfo.effectsColor = gamecodetoui[(int)trap_Cvar_VariableValue("color")-1];
ADDRGP4 $2505
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+136384
ADDRLP4 28
INDIRF4
CVFI4 4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui-4
ADDP4
INDIRI4
ASGNI4
line 7442
;7442:	uiInfo.currentCrosshair = (int)trap_Cvar_VariableValue("cg_drawCrosshair");
ADDRGP4 $185
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+118960
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 7443
;7443:	trap_Cvar_Set("ui_mousePitch", (trap_Cvar_VariableValue("m_pitch") >= 0) ? "0" : "1");
ADDRGP4 $3101
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 0
LTF4 $4986
ADDRLP4 36
ADDRGP4 $152
ASGNP4
ADDRGP4 $4987
JUMPV
LABELV $4986
ADDRLP4 36
ADDRGP4 $159
ASGNP4
LABELV $4987
ADDRGP4 $3098
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7445
;7444:
;7445:	uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99836+9344
CNSTI4 -1
ASGNI4
line 7446
;7446:	uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+99832
CNSTI4 -1
ASGNI4
line 7449
;7447:
;7448:
;7449:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $4991
ARGP4
ADDRGP4 $119
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7452
;7450:
;7451:// 	UI_ParseCvarFile( );
;7452:}
LABELV $4896
endproc _UI_Init 44 16
export _UI_KeyEvent
proc _UI_KeyEvent 16 12
line 7460
;7453:
;7454:
;7455:/*
;7456:=================
;7457:UI_KeyEvent
;7458:=================
;7459:*/
;7460:void _UI_KeyEvent( int key, qboolean down ) {
line 7462
;7461:
;7462:  if (Menu_Count() > 0) {
ADDRLP4 0
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4993
line 7463
;7463:    menuDef_t *menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 7465
;7464:	
;7465:		if (menu) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4995
line 7466
;7466:			if (key == K_ESCAPE && down && !Menus_AnyFullScreenVisible()) {
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $4997
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4997
ADDRLP4 12
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4997
line 7467
;7467:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 7468
;7468:			} else {
ADDRGP4 $4996
JUMPV
LABELV $4997
line 7469
;7469:				Menu_HandleKey(menu, key, down );
ADDRLP4 4
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
line 7470
;7470:			}
line 7471
;7471:		} else {
ADDRGP4 $4996
JUMPV
LABELV $4995
line 7472
;7472:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 12
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 7473
;7473:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 7474
;7474:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7475
;7475:		}
LABELV $4996
line 7476
;7476:  }
LABELV $4993
line 7481
;7477:
;7478:  //if ((s > 0) && (s != menu_null_sound)) {
;7479:	//  trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
;7480:  //}
;7481:}
LABELV $4992
endproc _UI_KeyEvent 16 12
export _UI_MouseEvent
proc _UI_MouseEvent 12 12
line 7489
;7482:
;7483:/*
;7484:=================
;7485:UI_MouseEvent
;7486:=================
;7487:*/
;7488:void _UI_MouseEvent( int dx, int dy )
;7489:{
line 7491
;7490:	// update mouse screen position
;7491:	uiInfo.uiDC.cursorx += dx;
ADDRLP4 0
ADDRGP4 uiInfo+220
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
line 7492
;7492:	if (uiInfo.uiDC.cursorx < 0)
ADDRGP4 uiInfo+220
INDIRI4
CNSTI4 0
GEI4 $5001
line 7493
;7493:		uiInfo.uiDC.cursorx = 0;
ADDRGP4 uiInfo+220
CNSTI4 0
ASGNI4
ADDRGP4 $5002
JUMPV
LABELV $5001
line 7494
;7494:	else if (uiInfo.uiDC.cursorx > SCREEN_WIDTH)
ADDRGP4 uiInfo+220
INDIRI4
CNSTI4 640
LEI4 $5005
line 7495
;7495:		uiInfo.uiDC.cursorx = SCREEN_WIDTH;
ADDRGP4 uiInfo+220
CNSTI4 640
ASGNI4
LABELV $5005
LABELV $5002
line 7497
;7496:
;7497:	uiInfo.uiDC.cursory += dy;
ADDRLP4 4
ADDRGP4 uiInfo+224
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 7498
;7498:	if (uiInfo.uiDC.cursory < 0)
ADDRGP4 uiInfo+224
INDIRI4
CNSTI4 0
GEI4 $5010
line 7499
;7499:		uiInfo.uiDC.cursory = 0;
ADDRGP4 uiInfo+224
CNSTI4 0
ASGNI4
ADDRGP4 $5011
JUMPV
LABELV $5010
line 7500
;7500:	else if (uiInfo.uiDC.cursory > SCREEN_HEIGHT)
ADDRGP4 uiInfo+224
INDIRI4
CNSTI4 480
LEI4 $5014
line 7501
;7501:		uiInfo.uiDC.cursory = SCREEN_HEIGHT;
ADDRGP4 uiInfo+224
CNSTI4 480
ASGNI4
LABELV $5014
LABELV $5011
line 7503
;7502:
;7503:  if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $5018
line 7506
;7504:    //menuDef_t *menu = Menu_GetFocused();
;7505:    //Menu_HandleMouseMove(menu, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
;7506:		Display_MouseMove(NULL, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
CNSTP4 0
ARGP4
ADDRGP4 uiInfo+220
INDIRI4
ARGI4
ADDRGP4 uiInfo+224
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 7507
;7507:  }
LABELV $5018
line 7509
;7508:
;7509:}
LABELV $4999
endproc _UI_MouseEvent 12 12
export UI_LoadNonIngame
proc UI_LoadNonIngame 12 8
line 7511
;7510:
;7511:void UI_LoadNonIngame() {
line 7512
;7512:	const char *menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $233
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 7513
;7513:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $5025
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $5023
LABELV $5025
line 7514
;7514:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $234
ASGNP4
line 7515
;7515:	}
LABELV $5023
line 7516
;7516:	UI_LoadMenus(menuSet, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 7517
;7517:	uiInfo.inGameLoad = qfalse;
ADDRGP4 uiInfo+136388
CNSTI4 0
ASGNI4
line 7518
;7518:}
LABELV $5022
endproc UI_LoadNonIngame 12 8
export _UI_SetActiveMenu
proc _UI_SetActiveMenu 292 12
line 7520
;7519:
;7520:void _UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 7525
;7521:	char buf[256];
;7522:
;7523:	// this should be the ONLY way the menu system is brought up
;7524:	// enusure minumum menu data is cached
;7525:  if (Menu_Count() > 0) {
ADDRLP4 256
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
LEI4 $5028
line 7527
;7526:		vec3_t v;
;7527:		v[0] = v[1] = v[2] = 0;
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 260+8
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260
ADDRLP4 272
INDIRF4
ASGNF4
line 7528
;7528:	  switch ( menu ) {
ADDRLP4 276
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
LTI4 $5032
ADDRLP4 276
INDIRI4
CNSTI4 6
GTI4 $5032
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $5058
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $5058
address $5035
address $5036
address $5056
address $5027
address $5027
address $5047
address $5051
code
LABELV $5035
line 7530
;7529:	  case UIMENU_NONE:
;7530:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 284
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 7531
;7531:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 7532
;7532:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7533
;7533:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 7535
;7534:
;7535:		  return;
ADDRGP4 $5027
JUMPV
LABELV $5036
line 7538
;7536:	  case UIMENU_MAIN:
;7537:			//trap_Cvar_Set( "sv_killserver", "1" );
;7538:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 7540
;7539:			//trap_S_StartLocalSound( trap_S_RegisterSound("sound/misc/menu_background.wav", qfalse) , CHAN_LOCAL_SOUND );
;7540:			trap_S_StartBackgroundTrack("sound/misc/nsmt.wav", NULL);
ADDRGP4 $5037
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 7541
;7541:			if (uiInfo.inGameLoad) {
ADDRGP4 uiInfo+136388
INDIRI4
CNSTI4 0
EQI4 $5038
line 7542
;7542:				UI_LoadNonIngame();
ADDRGP4 UI_LoadNonIngame
CALLV
pop
line 7543
;7543:			}
LABELV $5038
line 7544
;7544:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 7545
;7545:			Menus_ActivateByName("main");
ADDRGP4 $3316
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 7546
;7546:			trap_Cvar_VariableStringBuffer("com_errorMessage", buf, sizeof(buf));
ADDRGP4 $3229
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 7547
;7547:			if (strlen(buf)) {
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $5027
line 7548
;7548:				if (!ui_singlePlayerActive.integer) {
ADDRGP4 ui_singlePlayerActive+12
INDIRI4
CNSTI4 0
NEI4 $5043
line 7549
;7549:					Menus_ActivateByName("error_popmenu");
ADDRGP4 $5046
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 7550
;7550:				} else {
ADDRGP4 $5027
JUMPV
LABELV $5043
line 7551
;7551:					trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $3229
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7552
;7552:				}
line 7553
;7553:			}
line 7554
;7554:		  return;
ADDRGP4 $5027
JUMPV
LABELV $5047
line 7556
;7555:	  case UIMENU_TEAM:
;7556:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 7557
;7557:      Menus_ActivateByName("team");
ADDRGP4 $5048
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 7558
;7558:		  return;
ADDRGP4 $5027
JUMPV
line 7564
;7559:	  case UIMENU_NEED_CD:
;7560:			// no cd check in TA
;7561:			//trap_Key_SetCatcher( KEYCATCH_UI );
;7562:      //Menus_ActivateByName("needcd");
;7563:		  //UI_ConfirmMenu( "Insert the CD", NULL, NeedCDAction );
;7564:		  return;
line 7570
;7565:	  case UIMENU_BAD_CD_KEY:
;7566:			// no cd check in TA
;7567:			//trap_Key_SetCatcher( KEYCATCH_UI );
;7568:      //Menus_ActivateByName("badcd");
;7569:		  //UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
;7570:		  return;
LABELV $5051
line 7573
;7571:	  case UIMENU_POSTGAME:
;7572:			//trap_Cvar_Set( "sv_killserver", "1" );
;7573:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 7574
;7574:			if (uiInfo.inGameLoad) {
ADDRGP4 uiInfo+136388
INDIRI4
CNSTI4 0
EQI4 $5052
line 7575
;7575:				UI_LoadNonIngame();
ADDRGP4 UI_LoadNonIngame
CALLV
pop
line 7576
;7576:			}
LABELV $5052
line 7577
;7577:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 7578
;7578:			Menus_ActivateByName("endofgame");
ADDRGP4 $5055
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 7580
;7579:		  //UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
;7580:		  return;
ADDRGP4 $5027
JUMPV
LABELV $5056
line 7582
;7581:	  case UIMENU_INGAME:
;7582:		  trap_Cvar_Set( "cl_paused", "0" ); //1
ADDRGP4 $3386
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7583
;7583:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 7584
;7584:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 7585
;7585:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 7586
;7586:			Menus_ActivateByName("ingame");
ADDRGP4 $5057
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 7587
;7587:		  return;
LABELV $5032
line 7589
;7588:	  }
;7589:  }
LABELV $5028
line 7590
;7590:}
LABELV $5027
endproc _UI_SetActiveMenu 292 12
export _UI_IsFullscreen
proc _UI_IsFullscreen 4 0
line 7592
;7591:
;7592:qboolean _UI_IsFullscreen( void ) {
line 7593
;7593:	return Menus_AnyFullScreenVisible();
ADDRLP4 0
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $5059
endproc _UI_IsFullscreen 4 0
proc UI_ReadableSize 16 16
line 7602
;7594:}
;7595:
;7596:
;7597:
;7598:static connstate_t	lastConnState;
;7599:static char			lastLoadingText[MAX_INFO_VALUE];
;7600:
;7601:static void UI_ReadableSize ( char *buf, int bufsize, int value )
;7602:{
line 7603
;7603:	if (value > 1024*1024*1024 ) { // gigs
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $5061
line 7604
;7604:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1015
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7605
;7605:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d GB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $5063
ARGP4
ADDRLP4 12
CNSTI4 1073741824
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7607
;7606:			(value % (1024*1024*1024))*100 / (1024*1024*1024) );
;7607:	} else if (value > 1024*1024 ) { // megs
ADDRGP4 $5062
JUMPV
LABELV $5061
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $5064
line 7608
;7608:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1015
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7609
;7609:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d MB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $5066
ARGP4
ADDRLP4 12
CNSTI4 1048576
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7611
;7610:			(value % (1024*1024))*100 / (1024*1024) );
;7611:	} else if (value > 1024 ) { // kilos
ADDRGP4 $5065
JUMPV
LABELV $5064
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $5067
line 7612
;7612:		Com_sprintf( buf, bufsize, "%d KB", value / 1024 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $5069
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7613
;7613:	} else { // bytes
ADDRGP4 $5068
JUMPV
LABELV $5067
line 7614
;7614:		Com_sprintf( buf, bufsize, "%d bytes", value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $5070
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7615
;7615:	}
LABELV $5068
LABELV $5065
LABELV $5062
line 7616
;7616:}
LABELV $5060
endproc UI_ReadableSize 16 16
proc UI_PrintTime 8 20
line 7619
;7617:
;7618:// Assumes time is in msec
;7619:static void UI_PrintTime ( char *buf, int bufsize, int time ) {
line 7620
;7620:	time /= 1000;  // change to seconds
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 7622
;7621:
;7622:	if (time > 3600) { // in the hours range
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $5072
line 7623
;7623:		Com_sprintf( buf, bufsize, "%d hr %d min", time / 3600, (time % 3600) / 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $5074
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 3600
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7624
;7624:	} else if (time > 60) { // mins
ADDRGP4 $5073
JUMPV
LABELV $5072
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $5075
line 7625
;7625:		Com_sprintf( buf, bufsize, "%d min %d sec", time / 60, time % 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $5077
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7626
;7626:	} else  { // secs
ADDRGP4 $5076
JUMPV
LABELV $5075
line 7627
;7627:		Com_sprintf( buf, bufsize, "%d sec", time );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $5078
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 7628
;7628:	}
LABELV $5076
LABELV $5073
line 7629
;7629:}
LABELV $5071
endproc UI_PrintTime 8 20
export Text_PaintCenter
proc Text_PaintCenter 8 32
line 7631
;7630:
;7631:void Text_PaintCenter(float x, float y, float scale, vec4_t color, const char *text, float adjust) {
line 7632
;7632:	int len = Text_Width(text, scale, 0);
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 7633
;7633:	Text_Paint(x - len / 2, y, scale, color, text, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 7634
;7634:}
LABELV $5079
endproc Text_PaintCenter 8 32
data
align 1
LABELV $5081
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $5082
byte 1 69
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $5083
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
code
proc UI_DisplayDownloadInfo 312 32
line 7637
;7635:
;7636:
;7637:static void UI_DisplayDownloadInfo( const char *downloadName, float centerPoint, float yStart, float scale ) {
line 7648
;7638:	static char dlText[]	= "Downloading:";
;7639:	static char etaText[]	= "Estimated time left:";
;7640:	static char xferText[]	= "Transfer rate:";
;7641:
;7642:	int downloadSize, downloadCount, downloadTime;
;7643:	char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64];
;7644:	int xferRate;
;7645:	int leftWidth;
;7646:	const char *s;
;7647:
;7648:	downloadSize = trap_Cvar_VariableValue( "cl_downloadSize" );
ADDRGP4 $5084
ARGP4
ADDRLP4 280
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 280
INDIRF4
CVFI4 4
ASGNI4
line 7649
;7649:	downloadCount = trap_Cvar_VariableValue( "cl_downloadCount" );
ADDRGP4 $5085
ARGP4
ADDRLP4 284
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 284
INDIRF4
CVFI4 4
ASGNI4
line 7650
;7650:	downloadTime = trap_Cvar_VariableValue( "cl_downloadTime" );
ADDRGP4 $5086
ARGP4
ADDRLP4 288
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 140
ADDRLP4 288
INDIRF4
CVFI4 4
ASGNI4
line 7652
;7651:
;7652:	leftWidth = 320;
ADDRLP4 8
CNSTI4 320
ASGNI4
line 7654
;7653:
;7654:	UI_SetColor(colorWhite);
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 7655
;7655:	Text_PaintCenter(centerPoint, yStart + 112, scale, colorWhite, dlText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1121976320
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $5081
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7656
;7656:	Text_PaintCenter(centerPoint, yStart + 144, scale, colorWhite, etaText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1125122048
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $5082
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7657
;7657:	Text_PaintCenter(centerPoint, yStart + 208, scale, colorWhite, xferText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129316352
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $5083
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7659
;7658:
;7659:	if (downloadSize > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $5087
line 7660
;7660:		s = va( "%s (%d%%)", downloadName, downloadCount * 100 / downloadSize );
ADDRGP4 $5089
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
DIVI4
ARGI4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 292
INDIRP4
ASGNP4
line 7661
;7661:	} else {
ADDRGP4 $5088
JUMPV
LABELV $5087
line 7662
;7662:		s = downloadName;
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
line 7663
;7663:	}
LABELV $5088
line 7665
;7664:
;7665:	Text_Paint(centerPoint, yStart + 244, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1131675648
ADDF4
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 7667
;7666:
;7667:	UI_ReadableSize( dlSizeBuf,		sizeof dlSizeBuf,		downloadCount );
ADDRLP4 12
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 7668
;7668:	UI_ReadableSize( totalSizeBuf,	sizeof totalSizeBuf,	downloadSize );
ADDRLP4 76
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 7670
;7669:
;7670:	if (downloadCount < 4096 || !downloadTime) {
ADDRLP4 4
INDIRI4
CNSTI4 4096
LTI4 $5092
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $5090
LABELV $5092
line 7671
;7671:		Text_PaintCenter(leftWidth, 160, 0.6f, colorWhite, "estimating", 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $5093
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7672
;7672:		Text_PaintCenter(leftWidth, 192, 0.6f, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $5094
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1128267776
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 292
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7673
;7673:	} else {
ADDRGP4 $5091
JUMPV
LABELV $5090
line 7674
;7674:		if ((uiInfo.uiDC.realTime - downloadTime) / 1000) {
ADDRGP4 uiInfo+212
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $5095
line 7675
;7675:			xferRate = downloadCount / ((uiInfo.uiDC.realTime - downloadTime) / 1000);
ADDRLP4 144
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
line 7676
;7676:		} else {
ADDRGP4 $5096
JUMPV
LABELV $5095
line 7677
;7677:			xferRate = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 7678
;7678:		}
LABELV $5096
line 7679
;7679:		UI_ReadableSize( xferRateBuf, sizeof xferRateBuf, xferRate );
ADDRLP4 152
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 7682
;7680:
;7681:		// Extrapolate estimated completion time
;7682:		if (downloadSize && xferRate) {
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $5099
ADDRLP4 144
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $5099
line 7683
;7683:			int n = downloadSize / xferRate; // estimated time for entire d/l in secs
ADDRLP4 296
ADDRLP4 0
INDIRI4
ADDRLP4 144
INDIRI4
DIVI4
ASGNI4
line 7686
;7684:
;7685:			// We do it in K (/1024) because we'd overflow around 4MB
;7686:			UI_PrintTime ( dlTimeBuf, sizeof dlTimeBuf, 
ADDRLP4 216
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 300
ADDRLP4 296
INDIRI4
ASGNI4
ADDRLP4 304
CNSTI4 1024
ASGNI4
CNSTI4 1000
ADDRLP4 300
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 304
INDIRI4
DIVI4
ADDRLP4 300
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
DIVI4
DIVI4
SUBI4
MULI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
line 7689
;7687:				(n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000);
;7688:
;7689:			Text_PaintCenter(leftWidth, 160, 0.6f, colorWhite, dlTimeBuf, 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 216
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7690
;7690:			Text_PaintCenter(leftWidth, 192, 0.6f, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $5094
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1128267776
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 308
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7691
;7691:		} else {
ADDRGP4 $5100
JUMPV
LABELV $5099
line 7692
;7692:			Text_PaintCenter(leftWidth, 160, 0.6f, colorWhite, "estimating", 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $5093
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7693
;7693:			if (downloadSize) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $5101
line 7694
;7694:				Text_PaintCenter(leftWidth, 160, 0.6f, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $5094
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7695
;7695:			} else {
ADDRGP4 $5102
JUMPV
LABELV $5101
line 7696
;7696:				Text_PaintCenter(leftWidth, 160, 0.6f, colorWhite, va("(%s copied)", dlSizeBuf), 0);
ADDRGP4 $5103
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7697
;7697:			}
LABELV $5102
line 7698
;7698:		}
LABELV $5100
line 7700
;7699:
;7700:		if (xferRate) {
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $5104
line 7701
;7701:			Text_PaintCenter(leftWidth, 160, 0.6f, colorWhite, va("%s/Sec", xferRateBuf), 0);
ADDRGP4 $5106
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1126170624
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7702
;7702:		}
LABELV $5104
line 7703
;7703:	}
LABELV $5091
line 7704
;7704:}
LABELV $5080
endproc UI_DisplayDownloadInfo 312 32
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5440 24
line 7714
;7705:
;7706:/*
;7707:========================
;7708:UI_DrawConnectScreen
;7709:
;7710:This will also be overlaid on the cgame info screen during loading
;7711:to prevent it from blinking away too rapidly on local or lan games.
;7712:========================
;7713:*/
;7714:void UI_DrawConnectScreen( qboolean overlay ) {
line 7721
;7715:	char			*s;
;7716:	uiClientState_t	cstate;
;7717:	char			info[MAX_INFO_VALUE];
;7718:	char text[256];
;7719:	float centerPoint, yStart, scale;
;7720:	
;7721:	menuDef_t *menu = Menus_FindByName("Connect");
ADDRGP4 $5108
ARGP4
ADDRLP4 4384
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4384
INDIRP4
ASGNP4
line 7724
;7722:
;7723:
;7724:	if ( !overlay && menu ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $5109
ADDRLP4 4120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $5109
line 7725
;7725:		Menu_Paint(menu, qtrue);
ADDRLP4 4120
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 7726
;7726:	}
LABELV $5109
line 7728
;7727:
;7728:	if (!overlay) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $5111
line 7729
;7729:		centerPoint = 320;
ADDRLP4 3084
CNSTF4 1134559232
ASGNF4
line 7730
;7730:		yStart = 130;
ADDRLP4 4116
CNSTF4 1124204544
ASGNF4
line 7731
;7731:		scale = 0.5f;
ADDRLP4 3088
CNSTF4 1056964608
ASGNF4
line 7732
;7732:	} else {
ADDRGP4 $5112
JUMPV
LABELV $5111
line 7733
;7733:		centerPoint = 320;
ADDRLP4 3084
CNSTF4 1134559232
ASGNF4
line 7734
;7734:		yStart = 32;
ADDRLP4 4116
CNSTF4 1107296256
ASGNF4
line 7735
;7735:		scale = 0.6f;
ADDRLP4 3088
CNSTF4 1058642330
ASGNF4
line 7736
;7736:		return;
ADDRGP4 $5107
JUMPV
LABELV $5112
line 7740
;7737:	}
;7738:
;7739:	// see what information we should display
;7740:	trap_GetClientState( &cstate );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 7742
;7741:
;7742:	info[0] = '\0';
ADDRLP4 3092
CNSTI1 0
ASGNI1
line 7743
;7743:	if( trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) ) ) {
CNSTI4 0
ARGI4
ADDRLP4 3092
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4388
ADDRGP4 trap_GetConfigString
CALLI4
ASGNI4
ADDRLP4 4388
INDIRI4
CNSTI4 0
EQI4 $5113
line 7744
;7744:		Text_PaintCenter(centerPoint, yStart, scale, colorWhite, va( "Loading %s", Info_ValueForKey( info, "mapname" )), 0);
ADDRLP4 3092
ARGP4
ADDRGP4 $3778
ARGP4
ADDRLP4 4392
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $5115
ARGP4
ADDRLP4 4392
INDIRP4
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 4116
INDIRF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7745
;7745:	}
LABELV $5113
line 7747
;7746:
;7747:	if (!Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $5119
ARGP4
ADDRLP4 4392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4392
INDIRI4
CNSTI4 0
NEI4 $5116
line 7749
;7748://		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite, va("Starting up..."), ITEM_TEXTSTYLE_SHADOWEDMORE);
;7749:	} else {
ADDRGP4 $5117
JUMPV
LABELV $5116
line 7750
;7750:		strcpy(text, va("Connecting to %s", cstate.servername));
ADDRGP4 $5120
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4124
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 7751
;7751:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite,text , ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 4116
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4124
ARGP4
CNSTF4 1086324736
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7752
;7752:	}
LABELV $5117
line 7757
;7753:
;7754:	//UI_DrawProportionalString( 320, 96, "Press Esc to abort", UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
;7755:
;7756:	// display global MOTD at bottom
;7757:	Text_PaintCenter(centerPoint, 600, scale, colorWhite, Info_ValueForKey( cstate.updateInfoString, "motd" ), 0);
ADDRLP4 0+1036
ARGP4
ADDRGP4 $5123
ARGP4
ADDRLP4 4396
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
CNSTF4 1142292480
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7759
;7758:	// print any server info (server full, bad version, etc)
;7759:	if ( cstate.connState < CA_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $5124
line 7760
;7760:		Text_PaintCenter(centerPoint, yStart + 176, scale, colorWhite, cstate.messageString, 0);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 4116
INDIRF4
CNSTF4 1127219200
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0+2060
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7761
;7761:	}
LABELV $5124
line 7763
;7762:
;7763:	if ( lastConnState > cstate.connState ) {
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $5127
line 7764
;7764:		lastLoadingText[0] = '\0';
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
line 7765
;7765:	}
LABELV $5127
line 7766
;7766:	lastConnState = cstate.connState;
ADDRGP4 lastConnState
ADDRLP4 0
INDIRI4
ASGNI4
line 7768
;7767:
;7768:	switch ( cstate.connState ) {
ADDRLP4 4400
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4400
INDIRI4
CNSTI4 3
LTI4 $5107
ADDRLP4 4400
INDIRI4
CNSTI4 7
GTI4 $5107
ADDRLP4 4400
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $5145-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $5145
address $5132
address $5135
address $5138
address $5107
address $5107
code
LABELV $5132
line 7770
;7769:	case CA_CONNECTING:
;7770:		s = va("Awaiting connection...%i", cstate.connectPacketCount);
ADDRGP4 $5133
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRLP4 4408
INDIRP4
ASGNP4
line 7771
;7771:		break;
ADDRGP4 $5130
JUMPV
LABELV $5135
line 7773
;7772:	case CA_CHALLENGING:
;7773:		s = va("Awaiting challenge...%i", cstate.connectPacketCount);
ADDRGP4 $5136
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRLP4 4412
INDIRP4
ASGNP4
line 7774
;7774:		break;
ADDRGP4 $5130
JUMPV
LABELV $5138
line 7775
;7775:	case CA_CONNECTED: {
line 7778
;7776:		char downloadName[MAX_INFO_VALUE];
;7777:
;7778:			trap_Cvar_VariableStringBuffer( "cl_downloadName", downloadName, sizeof(downloadName) );
ADDRGP4 $5139
ARGP4
ADDRLP4 4416
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 7779
;7779:			if (*downloadName) {
ADDRLP4 4416
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $5140
line 7780
;7780:				UI_DisplayDownloadInfo( downloadName, centerPoint, yStart, scale );
ADDRLP4 4416
ARGP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 4116
INDIRF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
line 7781
;7781:				return;
ADDRGP4 $5107
JUMPV
LABELV $5140
line 7783
;7782:			}
;7783:		}
line 7784
;7784:		s = "Awaiting gamestate...";
ADDRLP4 4380
ADDRGP4 $5142
ASGNP4
line 7785
;7785:		break;
line 7787
;7786:	case CA_LOADING:
;7787:		return;
line 7789
;7788:	case CA_PRIMED:
;7789:		return;
line 7791
;7790:	default:
;7791:		return;
LABELV $5130
line 7795
;7792:	}
;7793:
;7794:
;7795:	if (Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $5119
ARGP4
ADDRLP4 4408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4408
INDIRI4
CNSTI4 0
EQI4 $5147
line 7796
;7796:		Text_PaintCenter(centerPoint, yStart + 80, scale, colorWhite, s, 0);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 4116
INDIRF4
CNSTF4 1117782016
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4380
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 7797
;7797:	}
LABELV $5147
line 7800
;7798:
;7799:	// password required / connection rejected information goes here
;7800:}
LABELV $5107
endproc UI_DrawConnectScreen 5440 24
export UI_RegisterCvars
proc UI_RegisterCvars 52 16
line 7809
;7801:
;7802:
;7803:
;7804:/*
;7805:=================
;7806:UI_RegisterCvars
;7807:=================
;7808:*/
;7809:void UI_RegisterCvars( void ) {
line 7815
;7810:	int			i;
;7811:	cvarTable_t	*cv;
;7812:	int			zonemegs,hunkmegs,soundmegs;
;7813:	char		var[16];
;7814:
;7815:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $5154
JUMPV
LABELV $5151
line 7816
;7816:		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
ADDRLP4 0
INDIRP4
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
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7817
;7817:	}
LABELV $5152
line 7815
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $5154
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $5151
line 7819
;7818:
;7819:	trap_Cvar_VariableStringBuffer( "com_hunkmegs", var, sizeof( var ) );
ADDRGP4 $5155
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 7820
;7820:	hunkmegs = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 7822
;7821:
;7822:	trap_Cvar_VariableStringBuffer( "com_zonemegs", var, sizeof( var ) );
ADDRGP4 $5156
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 7823
;7823:	zonemegs = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 7825
;7824:
;7825:	trap_Cvar_VariableStringBuffer( "com_soundmegs", var, sizeof( var ) );
ADDRGP4 $5157
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 7826
;7826:	soundmegs = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 44
INDIRI4
ASGNI4
line 7832
;7827:
;7828:	// BLUTENGEL 07.01.2004
;7829:	// removed as noone really wants to know that!
;7830:	// Com_Printf("UI: hunkmegs: %i zonemegs: %i soundmegs: %i\n", hunkmegs,zonemegs,soundmegs );
;7831:	
;7832:	if ( hunkmegs < 135 )
ADDRLP4 28
INDIRI4
CNSTI4 135
GEI4 $5158
line 7833
;7833:	{
line 7834
;7834:		trap_Error( va( 
ADDRGP4 $5160
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 7841
;7835:			"You can't start NS-CO because of your memorysettings."
;7836:			"You might have started NS-CO via the Quake3 mods menu."
;7837:			"Please use a shortcut, start with the required parameters or use the launcher."
;7838:			"Your 'com_hunkmegs' setting is %i, it must be atleast 135."
;7839:			"Please refer to the troubleshooting faq for more information.", hunkmegs ) );
;7840:			
;7841:		return;
ADDRGP4 $5150
JUMPV
LABELV $5158
line 7844
;7842:	}
;7843:	
;7844:	if ( zonemegs < 16 )
ADDRLP4 24
INDIRI4
CNSTI4 16
GEI4 $5161
line 7845
;7845:	{
line 7846
;7846:		trap_Error( va( 
ADDRGP4 $5163
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 7852
;7847:			"You can't start NS-CO because of your memorysettings."
;7848:			"You might have started NS-CO via the Quake3 mods menu."
;7849:			"Please use a shortcut, start with the required parameters or use the launcher."
;7850:			"Your 'com_zonemegs' setting is %i, it must be atleast 16."
;7851:			"Please refer to the troubleshooting faq for more information.", zonemegs ) );
;7852:		return;	
ADDRGP4 $5150
JUMPV
LABELV $5161
line 7855
;7853:	}
;7854:
;7855:	if ( soundmegs < 8 )
ADDRLP4 32
INDIRI4
CNSTI4 8
GEI4 $5164
line 7856
;7856:	{
line 7857
;7857:		trap_Error( va( 
ADDRGP4 $5166
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 7863
;7858:			"You can't start NS-CO because of your memorysettings."
;7859:			"You might have started NS-CO via the Quake3 mods menu."
;7860:			"Please use a shortcut, start with the required parameters or use the launcher."
;7861:			"Your 'com_soundmegs' setting is %i, it must be atleast 8."
;7862:			"Please refer to the troubleshooting faq for more information.", soundmegs ) );
;7863:		return;	
LABELV $5164
line 7865
;7864:	}
;7865:}
LABELV $5150
endproc UI_RegisterCvars 52 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 7872
;7866:
;7867:/*
;7868:=================
;7869:UI_UpdateCvars
;7870:=================
;7871:*/
;7872:void UI_UpdateCvars( void ) {
line 7876
;7873:	int			i;
;7874:	cvarTable_t	*cv;
;7875:
;7876:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $5171
JUMPV
LABELV $5168
line 7877
;7877:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 7878
;7878:	}
LABELV $5169
line 7876
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $5171
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $5168
line 7882
;7879:
;7880:	// check for blocked cvars
;7881: //	UI_CheckForceCvar( );
;7882:}
LABELV $5167
endproc UI_UpdateCvars 8 4
proc UI_StopServerRefresh 12 12
line 7891
;7883:
;7884:
;7885:/*
;7886:=================
;7887:ArenaServers_StopRefresh
;7888:=================
;7889:*/
;7890:static void UI_StopServerRefresh( void )
;7891:{
line 7894
;7892:	int count;
;7893:
;7894:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99836+1124
INDIRI4
CNSTI4 0
NEI4 $5173
line 7896
;7895:		// not currently refreshing
;7896:		return;
ADDRGP4 $5172
JUMPV
LABELV $5173
line 7898
;7897:	}
;7898:	uiInfo.serverStatus.refreshActive = qfalse;
ADDRGP4 uiInfo+99836+1124
CNSTI4 0
ASGNI4
line 7899
;7899:	Com_Printf("%d servers listed in browser with %d players.\n",
ADDRGP4 $5179
ARGP4
ADDRGP4 uiInfo+99836+9324
INDIRI4
ARGI4
ADDRGP4 uiInfo+99836+9328
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 7902
;7900:					uiInfo.serverStatus.numDisplayServers,
;7901:					uiInfo.serverStatus.numPlayersOnServers);
;7902:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 7903
;7903:	if (count - uiInfo.serverStatus.numDisplayServers > 0) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
SUBI4
CNSTI4 0
LEI4 $5185
line 7904
;7904:		Com_Printf("%d servers not listed due to packet loss or pings higher than %d\n",
ADDRGP4 $5192
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $5189
ARGP4
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99836+9324
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 7907
;7905:						count - uiInfo.serverStatus.numDisplayServers,
;7906:						(int) trap_Cvar_VariableValue("cl_maxPing"));
;7907:	}
LABELV $5185
line 7909
;7908:
;7909:}
LABELV $5172
endproc UI_StopServerRefresh 12 12
proc UI_DoServerRefresh 8 4
line 7932
;7910:
;7911:/*
;7912:=================
;7913:ArenaServers_MaxPing
;7914:=================
;7915:*/
;7916:/*static int ArenaServers_MaxPing( void ) {
;7917:	int		maxPing;
;7918:
;7919:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
;7920:	if( maxPing < 100 ) {
;7921:		maxPing = 100;
;7922:	}
;7923:	return maxPing;
;7924:}
;7925:*/
;7926:/*
;7927:=================
;7928:UI_DoServerRefresh
;7929:=================
;7930:*/
;7931:static void UI_DoServerRefresh( void )
;7932:{
line 7933
;7933:	qboolean wait = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 7935
;7934:
;7935:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99836+1124
INDIRI4
CNSTI4 0
NEI4 $5194
line 7936
;7936:		return;
ADDRGP4 $5193
JUMPV
LABELV $5194
line 7938
;7937:	}
;7938:	if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $5198
line 7939
;7939:		if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $5201
line 7940
;7940:			if (!trap_LAN_GetServerCount(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $5202
line 7941
;7941:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 7942
;7942:			}
line 7943
;7943:		} else {
ADDRGP4 $5202
JUMPV
LABELV $5201
line 7944
;7944:			if (trap_LAN_GetServerCount(ui_netSource.integer) < 0) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $5207
line 7945
;7945:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 7946
;7946:			}
LABELV $5207
line 7947
;7947:		}
LABELV $5202
line 7948
;7948:	}
LABELV $5198
line 7950
;7949:
;7950:	if (uiInfo.uiDC.realTime < uiInfo.serverStatus.refreshtime) {
ADDRGP4 uiInfo+212
INDIRI4
ADDRGP4 uiInfo+99836+1104
INDIRI4
GEI4 $5210
line 7951
;7951:		if (wait) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $5215
line 7952
;7952:			return;
ADDRGP4 $5193
JUMPV
LABELV $5215
line 7954
;7953:		}
;7954:	}
LABELV $5210
line 7957
;7955:
;7956:	// if still trying to retrieve pings
;7957:	if (trap_LAN_UpdateVisiblePings(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_UpdateVisiblePings
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $5217
line 7958
;7958:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99836+1104
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7959
;7959:	} else if (!wait) {
ADDRGP4 $5218
JUMPV
LABELV $5217
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $5223
line 7961
;7960:		// get the last servers in the list
;7961:		UI_BuildServerDisplayList(2);
CNSTI4 2
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 7963
;7962:		// stop the refresh
;7963:		UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 7964
;7964:	}
LABELV $5223
LABELV $5218
line 7966
;7965:	//
;7966:	UI_BuildServerDisplayList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 7967
;7967:}
LABELV $5193
endproc UI_DoServerRefresh 8 4
proc UI_StartServerRefresh 68 24
line 7975
;7968:
;7969:/*
;7970:=================
;7971:UI_StartServerRefresh
;7972:=================
;7973:*/
;7974:static void UI_StartServerRefresh(qboolean full)
;7975:{
line 7980
;7976:	int		i;
;7977:	char	*ptr;
;7978:
;7979:	qtime_t q;
;7980:	trap_RealTime(&q);
ADDRLP4 0
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 7981
;7981: 	trap_Cvar_Set( va("ui_lastServerRefresh_%i", ui_netSource.integer), va("%s-%i, %i at %i:%i", MonthAbbrev[q.tm_mon],q.tm_mday, 1900+q.tm_year,q.tm_hour,q.tm_min));
ADDRGP4 $1645
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $5227
ARGP4
ADDRLP4 0+16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 MonthAbbrev
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+12
INDIRI4
ARGI4
ADDRLP4 0+20
INDIRI4
CNSTI4 1900
ADDI4
ARGI4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7983
;7982:
;7983:	if (!full) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $5233
line 7984
;7984:		UI_UpdatePendingPings();
ADDRGP4 UI_UpdatePendingPings
CALLV
pop
line 7985
;7985:		return;
ADDRGP4 $5225
JUMPV
LABELV $5233
line 7988
;7986:	}
;7987:
;7988:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+99836+1124
CNSTI4 1
ASGNI4
line 7989
;7989:	uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99836+9332
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7991
;7990:	// clear number of displayed servers
;7991:	uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99836+9324
CNSTI4 0
ASGNI4
line 7992
;7992:	uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99836+9328
CNSTI4 0
ASGNI4
line 7994
;7993:	// mark all servers as visible so we store ping updates for them
;7994:	trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 7996
;7995:	// reset all the pings
;7996:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 7998
;7997:	//
;7998:	if( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $5246
line 7999
;7999:		trap_Cmd_ExecuteText( EXEC_NOW, "localservers\n" );
CNSTI4 0
ARGI4
ADDRGP4 $5249
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 8000
;8000:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99836+1104
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 8001
;8001:		return;
ADDRGP4 $5225
JUMPV
LABELV $5246
line 8004
;8002:	}
;8003:
;8004:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 5000;
ADDRGP4 uiInfo+99836+1104
ADDRGP4 uiInfo+212
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 8005
;8005:	if( ui_netSource.integer == AS_GLOBAL || ui_netSource.integer == AS_MPLAYER ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $5260
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $5256
LABELV $5260
line 8006
;8006:		if( ui_netSource.integer == AS_GLOBAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $5261
line 8007
;8007:			i = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 8008
;8008:		}
ADDRGP4 $5262
JUMPV
LABELV $5261
line 8009
;8009:		else {
line 8010
;8010:			i = 1;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 8011
;8011:		}
LABELV $5262
line 8013
;8012:
;8013:		ptr = UI_Cvar_VariableString("debug_protocol");
ADDRGP4 $4991
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 52
INDIRP4
ASGNP4
line 8014
;8014:		if (strlen(ptr)) {
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $5264
line 8015
;8015:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %s full empty\n", i, ptr));
ADDRGP4 $5266
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 8016
;8016:		}
ADDRGP4 $5265
JUMPV
LABELV $5264
line 8017
;8017:		else {
line 8018
;8018:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %d full empty\n", i, (int)trap_Cvar_VariableValue( "protocol" ) ) );
ADDRGP4 $2913
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $5267
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 60
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 8019
;8019:		}
LABELV $5265
line 8020
;8020:	}
LABELV $5256
line 8021
;8021:}
LABELV $5225
endproc UI_StartServerRefresh 68 24
bss
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
export scriptList
align 1
LABELV scriptList
skip 65536
import UI_RegisterClientStyleModels
import UI_DrawPlayerHead
import UI_DrawHead
export startTime
align 4
LABELV startTime
skip 4
export num_blockedCvars
align 4
LABELV num_blockedCvars
skip 4
export blockedCvars
align 4
LABELV blockedCvars
skip 49408
export ui_gamestate
align 4
LABELV ui_gamestate
skip 272
export ui_char_speed
align 4
LABELV ui_char_speed
skip 272
export ui_char_technical
align 4
LABELV ui_char_technical
skip 272
export ui_char_stealth
align 4
LABELV ui_char_stealth
skip 272
export ui_char_stamina
align 4
LABELV ui_char_stamina
skip 272
export ui_char_strength
align 4
LABELV ui_char_strength
skip 272
export ui_char_accuracy
align 4
LABELV ui_char_accuracy
skip 272
export ui_char_old_xp
align 4
LABELV ui_char_old_xp
skip 272
export ui_char_xp
align 4
LABELV ui_char_xp
skip 272
export ui_test
align 4
LABELV ui_test
skip 272
export cg_enableTimeSelect
align 4
LABELV cg_enableTimeSelect
skip 272
export cg_gunSmoke
align 4
LABELV cg_gunSmoke
skip 272
export cg_particleTime
align 4
LABELV cg_particleTime
skip 272
export cg_gunSmokeTime
align 4
LABELV cg_gunSmokeTime
skip 272
export cg_customTracerColor
align 4
LABELV cg_customTracerColor
skip 272
export cg_lowEffects
align 4
LABELV cg_lowEffects
skip 272
export cg_atmosphericEffects
align 4
LABELV cg_atmosphericEffects
skip 272
export g_bombTime
align 4
LABELV g_bombTime
skip 272
export g_invenTime
align 4
LABELV g_invenTime
skip 272
export g_overrideGoals
align 4
LABELV g_overrideGoals
skip 272
export g_stopbots
align 4
LABELV g_stopbots
skip 272
export g_keepCharacter
align 4
LABELV g_keepCharacter
skip 272
export g_roundTime
align 4
LABELV g_roundTime
skip 272
export g_maxTeamKill
align 4
LABELV g_maxTeamKill
skip 272
export g_allowKnifes
align 4
LABELV g_allowKnifes
skip 272
export g_logradio
align 4
LABELV g_logradio
skip 272
export ui_t_skin
align 4
LABELV ui_t_skin
skip 272
export ui_t_model
align 4
LABELV ui_t_model
skip 272
export ui_s_skin
align 4
LABELV ui_s_skin
skip 272
export ui_s_model
align 4
LABELV ui_s_model
skip 272
export ui_teamArenaFirstRun
align 4
LABELV ui_teamArenaFirstRun
skip 272
export ui_initialized
align 4
LABELV ui_initialized
skip 272
export ui_debug
align 4
LABELV ui_debug
skip 272
export ui_new
align 4
LABELV ui_new
skip 272
export ui_s_e_mouth
align 4
LABELV ui_s_e_mouth
skip 272
export ui_s_e_head
align 4
LABELV ui_s_e_head
skip 272
export ui_s_e_eyes
align 4
LABELV ui_s_e_eyes
skip 272
export ui_t_e_mouth
align 4
LABELV ui_t_e_mouth
skip 272
export ui_t_e_head
align 4
LABELV ui_t_e_head
skip 272
export ui_t_e_eyes
align 4
LABELV ui_t_e_eyes
skip 272
export ui_realWarmUp
align 4
LABELV ui_realWarmUp
skip 272
export ui_realCaptureLimit
align 4
LABELV ui_realCaptureLimit
skip 272
export ui_recordSPDemo
align 4
LABELV ui_recordSPDemo
skip 272
export ui_hudFiles
align 4
LABELV ui_hudFiles
skip 272
export ui_Q3Model
align 4
LABELV ui_Q3Model
skip 272
export ui_findPlayer
align 4
LABELV ui_findPlayer
skip 272
export ui_scoreCaptures
align 4
LABELV ui_scoreCaptures
skip 272
export ui_teamName
align 4
LABELV ui_teamName
skip 272
export ui_blueteam6
align 4
LABELV ui_blueteam6
skip 272
export ui_blueteam5
align 4
LABELV ui_blueteam5
skip 272
export ui_blueteam4
align 4
LABELV ui_blueteam4
skip 272
export ui_blueteam3
align 4
LABELV ui_blueteam3
skip 272
export ui_blueteam2
align 4
LABELV ui_blueteam2
skip 272
export ui_blueteam1
align 4
LABELV ui_blueteam1
skip 272
export ui_blueteam
align 4
LABELV ui_blueteam
skip 272
export ui_redteam6
align 4
LABELV ui_redteam6
skip 272
export ui_redteam5
align 4
LABELV ui_redteam5
skip 272
export ui_redteam4
align 4
LABELV ui_redteam4
skip 272
export ui_redteam3
align 4
LABELV ui_redteam3
skip 272
export ui_redteam2
align 4
LABELV ui_redteam2
skip 272
export ui_redteam1
align 4
LABELV ui_redteam1
skip 272
export ui_redteam
align 4
LABELV ui_redteam
skip 272
import ProcessNewUI
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetBotNameByNumber
import UI_LoadBots
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_VerifyCDKey
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_R_RegisterFont
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import UI_LoadBestScores
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawSides
import UI_DrawTopBottom
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
export uiInfo
align 4
LABELV uiInfo
skip 136440
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ClearScores
import UI_AdjustTimeByGame
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
export ui_character
align 4
LABELV ui_character
skip 272
export ui_serverStatusTimeOut
align 4
LABELV ui_serverStatusTimeOut
skip 272
export ui_bigFont
align 4
LABELV ui_bigFont
skip 272
export ui_smallFont
align 4
LABELV ui_smallFont
skip 272
export ui_scoreTime
align 4
LABELV ui_scoreTime
skip 272
export ui_scoreShutoutBonus
align 4
LABELV ui_scoreShutoutBonus
skip 272
export ui_scoreSkillBonus
align 4
LABELV ui_scoreSkillBonus
skip 272
export ui_scoreTimeBonus
align 4
LABELV ui_scoreTimeBonus
skip 272
export ui_scoreBase
align 4
LABELV ui_scoreBase
skip 272
export ui_scoreTeam
align 4
LABELV ui_scoreTeam
skip 272
export ui_scorePerfect
align 4
LABELV ui_scorePerfect
skip 272
export ui_scoreScore
align 4
LABELV ui_scoreScore
skip 272
export ui_scoreGauntlets
align 4
LABELV ui_scoreGauntlets
skip 272
export ui_scoreAssists
align 4
LABELV ui_scoreAssists
skip 272
export ui_scoreDefends
align 4
LABELV ui_scoreDefends
skip 272
export ui_scoreExcellents
align 4
LABELV ui_scoreExcellents
skip 272
export ui_scoreImpressives
align 4
LABELV ui_scoreImpressives
skip 272
export ui_scoreAccuracy
align 4
LABELV ui_scoreAccuracy
skip 272
export ui_singlePlayerActive
align 4
LABELV ui_singlePlayerActive
skip 272
export ui_lastServerRefresh_3
align 4
LABELV ui_lastServerRefresh_3
skip 272
export ui_lastServerRefresh_2
align 4
LABELV ui_lastServerRefresh_2
skip 272
export ui_lastServerRefresh_1
align 4
LABELV ui_lastServerRefresh_1
skip 272
export ui_lastServerRefresh_0
align 4
LABELV ui_lastServerRefresh_0
skip 272
export ui_selectedPlayerName
align 4
LABELV ui_selectedPlayerName
skip 272
export ui_selectedPlayer
align 4
LABELV ui_selectedPlayer
skip 272
export ui_currentOpponent
align 4
LABELV ui_currentOpponent
skip 272
export ui_mapIndex
align 4
LABELV ui_mapIndex
skip 272
export ui_currentNetMap
align 4
LABELV ui_currentNetMap
skip 272
export ui_currentMap
align 4
LABELV ui_currentMap
skip 272
export ui_currentTier
align 4
LABELV ui_currentTier
skip 272
export ui_menuFiles
align 4
LABELV ui_menuFiles
skip 272
export ui_opponentName
align 4
LABELV ui_opponentName
skip 272
export ui_dedicated
align 4
LABELV ui_dedicated
skip 272
export ui_serverFilterType
align 4
LABELV ui_serverFilterType
skip 272
export ui_netSource
align 4
LABELV ui_netSource
skip 272
export ui_joinGameType
align 4
LABELV ui_joinGameType
skip 272
export ui_actualNetGameType
align 4
LABELV ui_actualNetGameType
skip 272
export ui_netGameType
align 4
LABELV ui_netGameType
skip 272
export ui_gameType
align 4
LABELV ui_gameType
skip 272
export ui_fragLimit
align 4
LABELV ui_fragLimit
skip 272
export ui_captureLimit
align 4
LABELV ui_captureLimit
skip 272
export ui_cdkeychecked
align 4
LABELV ui_cdkeychecked
skip 272
import ui_cdkey
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_brassTime
align 4
LABELV ui_brassTime
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
export ui_ctf_friendly
align 4
LABELV ui_ctf_friendly
skip 272
export ui_ctf_timelimit
align 4
LABELV ui_ctf_timelimit
skip 272
export ui_ctf_capturelimit
align 4
LABELV ui_ctf_capturelimit
skip 272
export ui_team_friendly
align 4
LABELV ui_team_friendly
skip 272
export ui_team_timelimit
align 4
LABELV ui_team_timelimit
skip 272
export ui_team_fraglimit
align 4
LABELV ui_team_fraglimit
skip 272
export ui_tourney_timelimit
align 4
LABELV ui_tourney_timelimit
skip 272
export ui_tourney_fraglimit
align 4
LABELV ui_tourney_fraglimit
skip 272
export ui_ffa_timelimit
align 4
LABELV ui_ffa_timelimit
skip 272
export ui_ffa_fraglimit
align 4
LABELV ui_ffa_fraglimit
skip 272
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
LABELV $5267
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $5266
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $5249
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $5227
byte 1 37
byte 1 115
byte 1 45
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $5192
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $5189
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $5179
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $5166
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 98
byte 1 101
byte 1 99
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 118
byte 1 105
byte 1 97
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 99
byte 1 117
byte 1 116
byte 1 44
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 100
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
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 39
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 56
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 113
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
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
byte 1 46
byte 1 0
align 1
LABELV $5163
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 98
byte 1 101
byte 1 99
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 118
byte 1 105
byte 1 97
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 99
byte 1 117
byte 1 116
byte 1 44
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 100
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
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 39
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 122
byte 1 111
byte 1 110
byte 1 101
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 49
byte 1 54
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 113
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
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
byte 1 46
byte 1 0
align 1
LABELV $5160
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 98
byte 1 101
byte 1 99
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 118
byte 1 105
byte 1 97
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 99
byte 1 117
byte 1 116
byte 1 44
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 100
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
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 39
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 49
byte 1 51
byte 1 53
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 113
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
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
byte 1 46
byte 1 0
align 1
LABELV $5157
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $5156
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 122
byte 1 111
byte 1 110
byte 1 101
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $5155
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $5142
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $5139
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $5136
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $5133
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $5123
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $5120
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $5119
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $5115
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $5108
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $5106
byte 1 37
byte 1 115
byte 1 47
byte 1 83
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $5103
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $5094
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $5093
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $5089
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 37
byte 1 37
byte 1 41
byte 1 0
align 1
LABELV $5086
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $5085
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $5084
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $5078
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $5077
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $5074
byte 1 37
byte 1 100
byte 1 32
byte 1 104
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $5070
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $5069
byte 1 37
byte 1 100
byte 1 32
byte 1 75
byte 1 66
byte 1 0
align 1
LABELV $5066
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 77
byte 1 66
byte 1 0
align 1
LABELV $5063
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 71
byte 1 66
byte 1 0
align 1
LABELV $5057
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $5055
byte 1 101
byte 1 110
byte 1 100
byte 1 111
byte 1 102
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $5048
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $5046
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 95
byte 1 112
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $5037
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 110
byte 1 115
byte 1 109
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $4991
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $4976
byte 1 117
byte 1 105
byte 1 47
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4969
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $4967
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $4895
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4891
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 67
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
LABELV $4886
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $4885
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 68
byte 1 117
byte 1 99
byte 1 107
byte 1 98
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 83
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
LABELV $4882
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 68
byte 1 117
byte 1 99
byte 1 107
byte 1 98
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $4879
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 70
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
LABELV $4876
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 83
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $4873
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 66
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $4870
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 76
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $4867
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $4864
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 83
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4861
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 83
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
LABELV $4858
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 66
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
LABELV $4855
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 76
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 83
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
LABELV $4852
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 76
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
LABELV $4849
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 83
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 83
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
LABELV $4846
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 86
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $4843
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 72
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $4840
byte 1 115
byte 1 101
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $4837
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 83
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
LABELV $4836
byte 1 115
byte 1 101
byte 1 116
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $4833
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $4832
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 114
byte 1 101
byte 1 102
byte 1 117
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $4829
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $4821
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4808
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 95
byte 1 0
align 1
LABELV $4800
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $4799
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4797
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4796
byte 1 46
byte 1 0
align 1
LABELV $4786
byte 1 47
byte 1 0
align 1
LABELV $4785
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $4737
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $4732
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4727
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4712
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $4704
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
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $4648
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $4643
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $4601
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4598
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $4593
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $4576
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $4544
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $4528
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $4501
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $4494
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $4333
byte 1 42
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4332
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
LABELV $4328
byte 1 106
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4327
byte 1 106
byte 1 97
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $4324
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
LABELV $4218
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4214
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $4210
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $4207
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4206
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $4034
byte 1 115
byte 1 0
align 1
LABELV $4031
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4026
byte 1 110
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $3942
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 47
byte 1 37
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3884
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3876
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3821
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3820
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $3819
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $3781
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
LABELV $3780
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $3779
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $3778
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3777
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3776
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3775
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3774
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $3773
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3772
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
LABELV $3758
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3749
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3729
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3686
byte 1 87
byte 1 101
byte 1 108
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 111
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
byte 1 46
byte 1 0
align 1
LABELV $3675
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3575
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 85
byte 1 73
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3572
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3569
byte 1 103
byte 1 108
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $3560
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $3552
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $3540
byte 1 10
byte 1 0
align 1
LABELV $3533
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $3524
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $3523
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3519
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3506
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3503
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3502
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $3499
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
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
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $3494
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 0
align 1
LABELV $3493
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
LABELV $3484
byte 1 97
byte 1 100
byte 1 100
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3468
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3465
byte 1 97
byte 1 100
byte 1 100
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $3460
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
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3454
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3448
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $3442
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3437
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3431
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $3425
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3419
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $3416
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3413
byte 1 83
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $3410
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $3394
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $3391
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $3390
byte 1 76
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $3387
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $3386
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $3385
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3382
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $3381
byte 1 81
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $3371
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3368
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3354
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3349
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3342
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $3332
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $3326
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3319
byte 1 83
byte 1 116
byte 1 111
byte 1 112
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $3316
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $3315
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3306
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $3303
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $3299
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 110
byte 1 115
byte 1 115
byte 1 108
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $3298
byte 1 82
byte 1 117
byte 1 110
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $3293
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3292
byte 1 82
byte 1 117
byte 1 110
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $3289
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $3286
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3285
byte 1 82
byte 1 117
byte 1 110
byte 1 77
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $3280
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 32
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $3275
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 77
byte 1 111
byte 1 118
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $3272
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $3269
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 118
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3266
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3263
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $3254
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $3250
byte 1 82
byte 1 117
byte 1 110
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $3247
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3244
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $3241
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3232
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $3229
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $3228
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $3225
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3222
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3219
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3218
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $3215
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $3214
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 65
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $3213
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $3212
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 115
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $3209
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $3208
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 102
byte 1 121
byte 1 67
byte 1 68
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $3200
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 52
byte 1 0
align 1
LABELV $3199
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 51
byte 1 0
align 1
LABELV $3198
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 50
byte 1 0
align 1
LABELV $3197
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 49
byte 1 0
align 1
LABELV $3196
byte 1 103
byte 1 101
byte 1 116
byte 1 67
byte 1 68
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $3193
byte 1 118
byte 1 105
byte 1 100
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
LABELV $3192
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $3191
byte 1 99
byte 1 118
byte 1 97
byte 1 114
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
LABELV $3190
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $3189
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3182
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 83
byte 1 80
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $3172
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $3169
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3142
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $3141
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3138
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $3135
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $3132
byte 1 108
byte 1 111
byte 1 111
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $3131
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 76
byte 1 111
byte 1 111
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $3128
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3127
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3122
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
LABELV $3121
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
LABELV $3120
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
LABELV $3119
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 73
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
LABELV $3116
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 67
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
LABELV $3113
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 67
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
LABELV $3110
byte 1 99
byte 1 111
byte 1 112
byte 1 121
byte 1 67
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
LABELV $3107
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 120
byte 1 112
byte 1 0
align 1
LABELV $3101
byte 1 109
byte 1 95
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $3098
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 80
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $3093
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $3090
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $3089
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $3088
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $3087
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $3086
byte 1 114
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $3085
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3084
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $3083
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $3082
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $3081
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 83
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $3077
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 108
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $3072
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $3068
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 98
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $3061
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3060
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3056
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3053
byte 1 117
byte 1 105
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3048
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 100
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $3047
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3044
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3043
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 116
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3040
byte 1 117
byte 1 105
byte 1 95
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3039
byte 1 117
byte 1 105
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3035
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 53
byte 1 59
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3027
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3012
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $3009
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2998
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2994
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2991
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2990
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2989
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2988
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2987
byte 1 117
byte 1 105
byte 1 95
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2986
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2985
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2984
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2983
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2982
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2981
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2980
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2979
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2978
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2977
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2974
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2970
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2961
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2949
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2937
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2934
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2916
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2915
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $2913
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $2912
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2909
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $2894
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $2893
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $2877
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2811
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $2595
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2564
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2563
byte 1 117
byte 1 105
byte 1 95
byte 1 81
byte 1 51
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $2505
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2439
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
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 121
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2382
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
LABELV $2347
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
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 110
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2084
byte 1 87
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 107
byte 1 103
byte 1 0
align 1
LABELV $2051
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
LABELV $2050
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
LABELV $2049
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
LABELV $2048
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
LABELV $2039
byte 1 76
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
byte 1 40
byte 1 97
byte 1 99
byte 1 99
byte 1 62
byte 1 61
byte 1 51
byte 1 41
byte 1 0
align 1
LABELV $2032
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
LABELV $2030
byte 1 83
byte 1 117
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 114
byte 1 32
byte 1 40
byte 1 115
byte 1 116
byte 1 108
byte 1 62
byte 1 61
byte 1 51
byte 1 41
byte 1 0
align 1
LABELV $2023
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
LABELV $2022
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
LABELV $2020
byte 1 78
byte 1 111
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 45
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2019
byte 1 78
byte 1 86
byte 1 32
byte 1 83
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2014
byte 1 83
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2013
byte 1 83
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 32
byte 1 40
byte 1 97
byte 1 99
byte 1 99
byte 1 62
byte 1 61
byte 1 54
byte 1 41
byte 1 0
align 1
LABELV $2006
byte 1 76
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
byte 1 40
byte 1 97
byte 1 99
byte 1 99
byte 1 62
byte 1 61
byte 1 52
byte 1 41
byte 1 0
align 1
LABELV $2003
byte 1 76
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
LABELV $1998
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 110
byte 1 118
byte 1 103
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1997
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
LABELV $1996
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
LABELV $1994
byte 1 78
byte 1 111
byte 1 32
byte 1 85
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 108
byte 1 117
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 45
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1993
byte 1 70
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
LABELV $1992
byte 1 70
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
byte 1 40
byte 1 116
byte 1 101
byte 1 99
byte 1 62
byte 1 61
byte 1 52
byte 1 41
byte 1 0
align 1
LABELV $1985
byte 1 66
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1984
byte 1 66
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 40
byte 1 115
byte 1 116
byte 1 114
byte 1 62
byte 1 61
byte 1 52
byte 1 41
byte 1 0
align 1
LABELV $1977
byte 1 71
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
LABELV $1976
byte 1 71
byte 1 76
byte 1 32
byte 1 40
byte 1 116
byte 1 101
byte 1 99
byte 1 62
byte 1 61
byte 1 53
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 62
byte 1 61
byte 1 51
byte 1 41
byte 1 0
align 1
LABELV $1968
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
LABELV $1967
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
LABELV $1966
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
LABELV $1964
byte 1 78
byte 1 111
byte 1 32
byte 1 77
byte 1 117
byte 1 122
byte 1 122
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 45
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1963
byte 1 68
byte 1 117
byte 1 99
byte 1 107
byte 1 98
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1962
byte 1 68
byte 1 117
byte 1 99
byte 1 107
byte 1 98
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 40
byte 1 115
byte 1 116
byte 1 114
byte 1 62
byte 1 61
byte 1 53
byte 1 41
byte 1 0
align 1
LABELV $1955
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1954
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 115
byte 1 116
byte 1 108
byte 1 62
byte 1 61
byte 1 53
byte 1 41
byte 1 0
align 1
LABELV $1949
byte 1 77
byte 1 117
byte 1 122
byte 1 122
byte 1 108
byte 1 101
byte 1 32
byte 1 72
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1945
byte 1 83
byte 1 117
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1942
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
LABELV $1941
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
LABELV $1940
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
LABELV $1877
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $1873
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1870
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1868
byte 1 67
byte 1 104
byte 1 111
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 114
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
byte 1 46
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 65
byte 1 80
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1761
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1758
byte 1 71
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 40
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 41
byte 1 0
align 1
LABELV $1745
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1709
byte 1 110
byte 1 0
align 1
LABELV $1698
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1697
byte 1 116
byte 1 0
align 1
LABELV $1696
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $1661
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1645
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1643
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 78
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 67
byte 1 76
byte 1 73
byte 1 67
byte 1 75
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $1642
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
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 65
byte 1 80
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1608
byte 1 37
byte 1 105
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1425
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1420
byte 1 74
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1372
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
byte 1 0
align 1
LABELV $1359
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1352
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1318
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1276
byte 1 102
byte 1 105
byte 1 120
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1273
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1255
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
LABELV $1254
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1213
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $1198
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
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
LABELV $1153
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $1150
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1144
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1143
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1137
byte 1 83
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $1136
byte 1 84
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $1135
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1128
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1127
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1090
byte 1 37
byte 1 115
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $1071
byte 1 37
byte 1 115
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1066
byte 1 37
byte 1 115
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1038
byte 1 117
byte 1 105
byte 1 95
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1028
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 78
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1027
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1016
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
LABELV $1015
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1000
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $998
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $997
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $996
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $995
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $994
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $993
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $992
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $991
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $990
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $989
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $988
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $987
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $986
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $985
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $984
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $975
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $955
byte 1 94
byte 1 49
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 117
byte 1 105
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 105
byte 1 110
byte 1 117
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $952
byte 1 94
byte 1 51
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $930
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 100
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $924
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 71
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 68
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $905
byte 1 71
byte 1 108
byte 1 121
byte 1 112
byte 1 104
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $900
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $899
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $888
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $880
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 89
byte 1 0
align 1
LABELV $872
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 88
byte 1 0
align 1
LABELV $864
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
LABELV $856
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
LABELV $848
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
LABELV $836
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $828
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 66
byte 1 117
byte 1 122
byte 1 122
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $820
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 70
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
LABELV $812
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $804
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $796
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $787
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $778
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $767
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $763
byte 1 125
byte 1 0
align 1
LABELV $754
byte 1 123
byte 1 0
align 1
LABELV $747
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $744
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $727
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
LABELV $726
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
LABELV $725
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
LABELV $724
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
LABELV $685
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $684
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 99
byte 1 104
byte 1 110
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $683
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $682
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $681
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $680
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $662
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $657
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 120
byte 1 112
byte 1 0
align 1
LABELV $651
byte 1 115
byte 1 118
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $650
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
LABELV $649
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
LABELV $464
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $457
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
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 95
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $454
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
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $451
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
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 104
byte 1 117
byte 1 109
byte 1 98
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $448
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
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $445
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
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $442
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
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 117
byte 1 112
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $439
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
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 100
byte 1 119
byte 1 110
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $436
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
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $433
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $429
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $425
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $421
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $417
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $413
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $409
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $406
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $403
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
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $399
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $385
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 99
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
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $371
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $350
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
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
LABELV $345
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $327
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $326
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $325
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 99
byte 1 104
byte 1 110
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $324
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $323
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $322
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $321
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $320
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 95
byte 1 120
byte 1 112
byte 1 0
align 1
LABELV $319
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $318
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 120
byte 1 112
byte 1 0
align 1
LABELV $317
byte 1 67
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $316
byte 1 117
byte 1 105
byte 1 95
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
LABELV $315
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $314
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $313
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $312
byte 1 49
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $311
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $310
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 84
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $309
byte 1 99
byte 1 103
byte 1 95
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
byte 1 70
byte 1 88
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $308
byte 1 99
byte 1 103
byte 1 95
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
byte 1 70
byte 1 88
byte 1 0
align 1
LABELV $307
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $306
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $305
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $304
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $303
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $302
byte 1 103
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 114
byte 1 105
byte 1 100
byte 1 101
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $301
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $300
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $299
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 75
byte 1 110
byte 1 105
byte 1 102
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $298
byte 1 103
byte 1 95
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 67
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
LABELV $297
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 0
align 1
LABELV $296
byte 1 106
byte 1 97
byte 1 121
byte 1 97
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $295
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
LABELV $294
byte 1 116
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $293
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
LABELV $292
byte 1 98
byte 1 114
byte 1 117
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $291
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
LABELV $290
byte 1 115
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $289
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
LABELV $288
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
LABELV $287
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
LABELV $286
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
LABELV $285
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
LABELV $284
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
LABELV $283
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
LABELV $282
byte 1 55
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $281
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 79
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $280
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $279
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $278
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $277
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $276
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
LABELV $275
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
LABELV $274
byte 1 117
byte 1 105
byte 1 95
byte 1 113
byte 1 51
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $273
byte 1 83
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $271
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $270
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $269
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $268
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $267
byte 1 53
byte 1 0
align 1
LABELV $266
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $265
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $264
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $263
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 111
byte 1 117
byte 1 116
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $262
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $261
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $260
byte 1 48
byte 1 48
byte 1 58
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $259
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $258
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $257
byte 1 48
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $256
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $255
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $254
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $253
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $252
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $251
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $250
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $249
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $248
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $247
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $246
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $245
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $244
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $243
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $242
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $241
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $240
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $239
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 79
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $238
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $237
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 101
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $236
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $235
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $234
byte 1 117
byte 1 105
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $233
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $232
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $231
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 54
byte 1 0
align 1
LABELV $230
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 53
byte 1 0
align 1
LABELV $229
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 52
byte 1 0
align 1
LABELV $228
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $227
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $226
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $225
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 54
byte 1 0
align 1
LABELV $224
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 53
byte 1 0
align 1
LABELV $223
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 52
byte 1 0
align 1
LABELV $222
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $221
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $220
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $219
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 78
byte 1 101
byte 1 116
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
LABELV $218
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
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
LABELV $217
byte 1 117
byte 1 105
byte 1 95
byte 1 106
byte 1 111
byte 1 105
byte 1 110
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
LABELV $216
byte 1 51
byte 1 0
align 1
LABELV $215
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $214
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $213
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $212
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $211
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $210
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $209
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $208
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $207
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $206
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $205
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $204
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $203
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $202
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $201
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $200
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $199
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $198
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $197
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $196
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 57
byte 1 0
align 1
LABELV $195
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 56
byte 1 0
align 1
LABELV $194
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 55
byte 1 0
align 1
LABELV $193
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 54
byte 1 0
align 1
LABELV $192
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 53
byte 1 0
align 1
LABELV $191
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $190
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $189
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $188
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $187
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $186
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $185
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $184
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $183
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $181
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $180
byte 1 52
byte 1 0
align 1
LABELV $179
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $178
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $177
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $176
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $175
byte 1 50
byte 1 0
align 1
LABELV $174
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $173
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $172
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $171
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $170
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $169
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $168
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $167
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $166
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $165
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $164
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
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
LABELV $163
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $162
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
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
LABELV $161
byte 1 56
byte 1 0
align 1
LABELV $160
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $159
byte 1 49
byte 1 0
align 1
LABELV $158
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
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
LABELV $157
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
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
LABELV $156
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
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
LABELV $155
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $154
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
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
LABELV $153
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
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
LABELV $152
byte 1 48
byte 1 0
align 1
LABELV $151
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
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
LABELV $150
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $149
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
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
LABELV $147
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $146
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $145
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $144
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $142
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $141
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $140
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $139
byte 1 84
byte 1 101
byte 1 97
byte 1 109
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
byte 1 0
align 1
LABELV $138
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $137
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $136
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $135
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $134
byte 1 84
byte 1 101
byte 1 97
byte 1 109
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
LABELV $133
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $132
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $131
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $130
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 79
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $129
byte 1 70
byte 1 84
byte 1 80
byte 1 0
align 1
LABELV $128
byte 1 84
byte 1 82
byte 1 65
byte 1 73
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $127
byte 1 70
byte 1 70
byte 1 65
byte 1 0
align 1
LABELV $126
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $125
byte 1 65
byte 1 108
byte 1 108
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $123
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $122
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $121
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $120
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 51
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $119
byte 1 0
align 1
LABELV $118
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $117
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $116
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $115
byte 1 77
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $114
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $113
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $112
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $111
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $110
byte 1 69
byte 1 97
byte 1 115
byte 1 121
byte 1 0
align 1
LABELV $109
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 69
byte 1 97
byte 1 115
byte 1 121
byte 1 0
align 1
LABELV $108
byte 1 68
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $107
byte 1 78
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $106
byte 1 79
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $105
byte 1 83
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $104
byte 1 65
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $103
byte 1 74
byte 1 117
byte 1 108
byte 1 0
align 1
LABELV $102
byte 1 74
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $101
byte 1 77
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $100
byte 1 65
byte 1 112
byte 1 114
byte 1 0
align 1
LABELV $99
byte 1 77
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $98
byte 1 70
byte 1 101
byte 1 98
byte 1 0
align 1
LABELV $97
byte 1 74
byte 1 97
byte 1 110
byte 1 0
