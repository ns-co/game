export NS_Menu
code
proc NS_Menu 4 12
file "../g_seal_menu.c"
line 59
;1:#include "g_local.h" 
;2://
;3:// all code in this file is property of manfred nerurkar
;4:// no commercial explotation allowed
;5:// you are only allowed to use this code in navy seals: covert operations 
;6:// a quake3 arena modifiation
;7:// defcon-x@ns-co.net
;8:
;9:/*
;10:==============
;11:
;12:  MENUING SYSTEM
;13:
;14:==============
;15:*/ 
;16:
;17:/*
;18:=================
;19:NSQ3 Call Menu
;20:author: dX
;21:date: 10-05-2k
;22:description: calls menu
;23:=================
;24:*/
;25:
;26:// menu
;27:#define MENU_NONE		0
;28:
;29:#define MENU_TEAM		1
;30:#define MENU_PRIM_WEAP	2
;31:#define MENU_SPECTATOR	3
;32:#define MENU_SECO_WEAP	4
;33:#define MENU_MAIN		5
;34:#define MENU_AMMO		6
;35:#define MENU_CHARACTER	7
;36:#define MENU_CLASS		8
;37:#define MENU_RADIO		9
;38:#define MENU_EQUIP		10
;39:#define MENU_OWNCLASS	11
;40:#define MENU_PLAYER		12
;41:#define MENU_MAX		13
;42:
;43:#define SLOTS_TEAMMENU	3
;44:#define SLOTS_PRIM_WEAP	10
;45:#define SLOTS_SPECTATOR	1
;46:#define SLOTS_SECO_WEAP	5
;47:#define SLOTS_MAIN		7
;48:#define SLOTS_AMMO		6
;49:#define SLOTS_CHARACTER	1
;50:#define	SLOTS_CLASSMENU	7
;51:#define SLOTS_RADIO		9
;52:#define SLOTS_EQUIP		9
;53:#define SLOTS_OWNCLASS	7
;54:#define SLOTS_PLAYER	5
;55:
;56:
;57:
;58:void NS_Menu (gentity_t *ent,char *string, int avaiable_options, int menu)
;59:{
line 61
;60:	// no slots set? set to max
;61:	if (avaiable_options <= 0)
ADDRFP4 8
INDIRI4
CNSTI4 0
GTI4 $69
line 62
;62:		avaiable_options = 9;
ADDRFP4 8
CNSTI4 9
ASGNI4
LABELV $69
line 65
;63:
;64:	// set menu
;65:	ent->client->pers.activeMenu = menu;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 67
;66:
;67:	trap_SendServerCommand( ent-g_entities, va("menu %i %s", avaiable_options, string) );
ADDRGP4 $71
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1108
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 68
;68:}
LABELV $68
endproc NS_Menu 4 12
export NS_CallMenu
proc NS_CallMenu 12 8
line 71
;69:
;70:void NS_CallMenu( gentity_t *ent, int menu, int menuSlot )
;71:{
line 72
;72:	if ( !menu || !menuSlot || !ent || menu >= MENU_MAX )
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $77
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $77
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $77
ADDRLP4 0
INDIRI4
CNSTI4 13
LTI4 $73
LABELV $77
line 73
;73:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 75
;74:	
;75:	switch (menu) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $79
ADDRLP4 8
INDIRI4
CNSTI4 12
GTI4 $79
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $92-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $92
address $80
address $81
address $79
address $83
address $84
address $85
address $86
address $87
address $88
address $89
address $90
address $91
code
LABELV $80
line 77
;76:		case MENU_TEAM:
;77:			NS_HandleTeamMenu( ent, menuSlot);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleTeamMenu
CALLV
pop
line 78
;78:			break;
ADDRGP4 $79
JUMPV
LABELV $81
line 80
;79:		case MENU_PRIM_WEAP:
;80:			NS_HandlePrimaryWeaponMenu ( ent, menuSlot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandlePrimaryWeaponMenu
CALLV
pop
line 81
;81:			break;
ADDRGP4 $79
JUMPV
line 83
;82:		case MENU_SPECTATOR:
;83:			break;
LABELV $83
line 85
;84:		case MENU_SECO_WEAP:
;85:			NS_HandleSecondaryWeaponMenu (ent, menuSlot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleSecondaryWeaponMenu
CALLV
pop
line 86
;86:			break;
ADDRGP4 $79
JUMPV
LABELV $84
line 88
;87:		case MENU_MAIN:
;88:			NS_HandleMainMenu(ent, menuSlot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleMainMenu
CALLV
pop
line 89
;89:			break;
ADDRGP4 $79
JUMPV
LABELV $85
line 91
;90:		case MENU_AMMO:
;91:			NS_HandleAmmoMenu(ent, menuSlot);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleAmmoMenu
CALLV
pop
line 92
;92:			break;
ADDRGP4 $79
JUMPV
LABELV $86
line 94
;93:		case MENU_CHARACTER:
;94:			NS_HandleCharacterMenu(ent,menuSlot);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleCharacterMenu
CALLV
pop
line 95
;95:			break;
ADDRGP4 $79
JUMPV
LABELV $87
line 97
;96:		case MENU_CLASS:
;97:			NS_HandleClassMenu(ent,menuSlot);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleClassMenu
CALLV
pop
line 98
;98:			break;
ADDRGP4 $79
JUMPV
LABELV $88
line 100
;99:		case MENU_RADIO:
;100:			NS_HandleRadioMenu(ent,menuSlot);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleRadioMenu
CALLV
pop
line 101
;101:			break;
ADDRGP4 $79
JUMPV
LABELV $89
line 103
;102:		case MENU_EQUIP:
;103:			NS_HandleEquipmentMenu(ent, menuSlot);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleEquipmentMenu
CALLV
pop
line 104
;104:			break;
ADDRGP4 $79
JUMPV
LABELV $90
line 106
;105:		case MENU_OWNCLASS:
;106:			NS_HandleCreateClassMenu( ent, menuSlot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandleCreateClassMenu
CALLV
pop
line 107
;107:			break;
ADDRGP4 $79
JUMPV
LABELV $91
line 109
;108:		case MENU_PLAYER:
;109:			NS_HandlePlayerMenu( ent, menuSlot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 NS_HandlePlayerMenu
CALLV
pop
line 110
;110:			break;
line 112
;111:		default:
;112:			break;
LABELV $79
line 114
;113:	}
;114:}
LABELV $72
endproc NS_CallMenu 12 8
export NS_MenuSelect
proc NS_MenuSelect 1040 12
line 116
;115:void NS_MenuSelect ( gentity_t *ent )
;116:{
line 118
;117:	char		arg[MAX_TOKEN_CHARS];
;118:	int menuSlot = 0;
ADDRLP4 1024
CNSTI4 0
ASGNI4
line 122
;119:	int	menu;
;120:
;121:	// no Active Menu?
;122:	if (ent->client->pers.activeMenu == MENU_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $95
line 123
;123:		return;
ADDRGP4 $94
JUMPV
LABELV $95
line 126
;124:
;125:	// smaller then 1 command?
;126:	if ( trap_Argc () < 1 ) {
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
GEI4 $97
line 127
;127:		return;
ADDRGP4 $94
JUMPV
LABELV $97
line 130
;128:	}
;129:
;130:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 131
;131:	menuSlot = atoi( arg );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 132
;132:	menu = ent->client->pers.activeMenu;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ASGNI4
line 134
;133:	
;134:	ent->client->pers.activeMenu = MENU_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 136
;135:
;136:	NS_CallMenu( ent, menu, menuSlot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 NS_CallMenu
CALLV
pop
line 137
;137:}
LABELV $94
endproc NS_MenuSelect 1040 12
export NS_OpenRadioMenu
proc NS_OpenRadioMenu 8 16
line 146
;138:
;139:/*
;140:====================================
;141:	Radio Menu Handling
;142:====================================
;143:*/
;144:
;145:void NS_OpenRadioMenu ( gentity_t *ent )
;146:{
line 147
;147:	char *radio_menu = "\"1. Go\" \"2. Team Report In\" \"3. Enemy Down\" \"4. Taking Fire - Need Assistance\" \"5. Teammate Down\" \"6. Cover Me\" \"7. I Am Hit\" \"8. Get in position\" \" \" \"9. Exit\"";
ADDRLP4 0
ADDRGP4 $100
ASGNP4
line 150
;148:
;149:	// if not on teamplay
;150:	if (g_gametype.integer < GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $101
line 151
;151:		return;
ADDRGP4 $99
JUMPV
LABELV $101
line 153
;152:
;153:	NS_Menu(ent,radio_menu,SLOTS_RADIO, MENU_RADIO);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 9
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 154
;154:}
LABELV $99
endproc NS_OpenRadioMenu 8 16
export NS_HandleRadioMenu
proc NS_HandleRadioMenu 0 0
line 157
;155:
;156:void NS_HandleRadioMenu ( gentity_t *ent, int menuSlot )
;157:{ 
line 158
;158:}
LABELV $104
endproc NS_HandleRadioMenu 0 0
export NS_OpenTeamMenu
proc NS_OpenTeamMenu 4 16
line 168
;159:
;160:
;161:/*
;162:====================================
;163:	Team Selection Menu Handling
;164:====================================
;165:*/
;166:
;167:void NS_OpenTeamMenu ( gentity_t *ent )
;168:{	
line 169
;169:	char *team_menu = "\"Welcome to Navy Seals : Covert Operations\" \" \" \"Please select a Team using the Weapon keys\" \"?\" \"1. Join Seals\" \"2. Join Tangos\" \" \" \"3. Spectate\"";
ADDRLP4 0
ADDRGP4 $106
ASGNP4
line 171
;170:
;171:	if ( g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $107
line 172
;172:	{
line 173
;173:		team_menu = "\"Welcome to Navy Seals : Covert Operations\" \" \" \"Please select a Team using the Weapon keys\" \"?\" \"1. Join Game\" \" \" \"2. Spectate\"";
ADDRLP4 0
ADDRGP4 $110
ASGNP4
line 174
;174:		NS_Menu(ent,team_menu,2, MENU_TEAM);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 175
;175:	}
ADDRGP4 $108
JUMPV
LABELV $107
line 177
;176:	else
;177:		NS_Menu(ent,team_menu,SLOTS_TEAMMENU, MENU_TEAM);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
LABELV $108
line 178
;178:}
LABELV $105
endproc NS_OpenTeamMenu 4 16
export NS_HandleTeamMenu
proc NS_HandleTeamMenu 4 8
line 181
;179:
;180:void NS_HandleTeamMenu ( gentity_t *ent, int menuSlot )
;181:{
line 182
;182:	if ( g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $112
line 183
;183:	{
line 184
;184:		switch (menuSlot) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $117
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $119
ADDRGP4 $111
JUMPV
LABELV $117
line 186
;185:		case 1:
;186:			SetTeam(ent, "free" );	
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $118
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 187
;187:			NS_NavySeals_ClientInit(ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 NS_NavySeals_ClientInit
CALLV
pop
line 188
;188:			break;
ADDRGP4 $111
JUMPV
LABELV $119
line 190
;189:		case 2:
;190:			SetTeam(ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 191
;191:			break;
line 193
;192: 		default:
;193:			break;
line 195
;194:		}
;195:		return;
ADDRGP4 $111
JUMPV
LABELV $112
line 197
;196:	}
;197:	switch (menuSlot) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $123
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $129
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $133
ADDRGP4 $122
JUMPV
LABELV $123
line 200
;198:	case 1:
;199:		// if we're in LTS mode, wait for the next round
;200:		if (g_gametype.integer == GT_LTS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $124
line 201
;201:			SetTeam(ent, "seals" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRGP4 SetTeam
CALLV
pop
ADDRGP4 $122
JUMPV
LABELV $124
line 203
;202:		else // else place us immediately
;203:			SetTeam(ent, "tangos" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 207
;204:		
;205:		// first time we played. set custom class
;206:
;207:		break;
ADDRGP4 $122
JUMPV
LABELV $129
line 209
;208:	case 2:
;209:		if (g_gametype.integer == GT_LTS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $130
line 210
;210:			SetTeam(ent, "seals" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRGP4 SetTeam
CALLV
pop
ADDRGP4 $122
JUMPV
LABELV $130
line 212
;211:		else 
;212:			SetTeam(ent, "tangos" ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 216
;213:		
;214:		// first time we played. set custom class
;215:
;216:		break;
ADDRGP4 $122
JUMPV
LABELV $133
line 219
;217:	case 3:
;218:		// respawn as spectator
;219:		SetTeam(ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 220
;220:		SetClass( ent, CLASS_NONE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 221
;221:		NS_OpenSpectatorMenu ( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenSpectatorMenu
CALLV
pop
line 222
;222:		break;
line 224
;223:	default:
;224:		break;
LABELV $122
line 226
;225:	}
;226:}
LABELV $111
endproc NS_HandleTeamMenu 4 8
export NS_AbilityPointsUsed
proc NS_AbilityPointsUsed 4 0
line 255
;227:
;228:/*
;229:====================================
;230:	Create Custom Class Menu Handling
;231:
;232:  valid abilities ( max class : 10 ) points to share 3:
;233:
;234:  
;235:	accuracy
;236:	speed	
;237:	stamina
;238:	stealth
;239:	strength
;240:	technical
;241:  
;242:====================================
;243:*/
;244:
;245:/*
;246:
;247:   returns no of used points
;248:
;249:  */
;250:
;251:#define CLASS_ABILITYPOINTS			4
;252:#define CLASS_MAXSTARTABILITYPOINTS	10
;253:
;254:int NS_AbilityPointsUsed ( gentity_t *ent )
;255:{
line 256
;256:	int points = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 258
;257:	
;258:	if ( ent->client->pers.nsPC.speed > 1 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
CNSTI4 1
LEI4 $135
line 259
;259:		points += ent->client->pers.nsPC.speed - 1; // 1 = base point
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
LABELV $135
line 260
;260:	if ( ent->client->pers.nsPC.accuracy > 1 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
CNSTI4 1
LEI4 $137
line 261
;261:		points += ent->client->pers.nsPC.accuracy - 1;		
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
LABELV $137
line 262
;262:	if ( ent->client->pers.nsPC.stamina > 1 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
CNSTI4 1
LEI4 $139
line 263
;263:		points += ent->client->pers.nsPC.stamina - 1;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
LABELV $139
line 264
;264:	if ( ent->client->pers.nsPC.stealth > 1 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 1
LEI4 $141
line 265
;265:		points += ent->client->pers.nsPC.stealth - 1;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
LABELV $141
line 266
;266:	if ( ent->client->pers.nsPC.strength > 1 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 1
LEI4 $143
line 267
;267:		points += ent->client->pers.nsPC.strength - 1;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
LABELV $143
line 268
;268:	if ( ent->client->pers.nsPC.technical > 1 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 1
LEI4 $145
line 269
;269:		points += ent->client->pers.nsPC.technical - 1;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
LABELV $145
line 271
;270:
;271:	return points;
ADDRLP4 0
INDIRI4
RETI4
LABELV $134
endproc NS_AbilityPointsUsed 4 0
export NS_GotEnoughXPfornextLevel
proc NS_GotEnoughXPfornextLevel 0 0
line 275
;272:}
;273:
;274:qboolean NS_GotEnoughXPfornextLevel ( gentity_t *ent , int cur_level )
;275:{
line 276
;276:	if ( ( ent->client->pers.nsPC.xp - ( cur_level + 1 ) ) >= 0 ) // got enough
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
SUBI4
CNSTI4 0
LTI4 $148
line 277
;277:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $147
JUMPV
LABELV $148
line 279
;278:
;279:	return qfalse;
CNSTI4 0
RETI4
LABELV $147
endproc NS_GotEnoughXPfornextLevel 0 0
export NS_OpenCreateClassMenu
proc NS_OpenCreateClassMenu 516 40
line 283
;280:}
;281:
;282:void NS_OpenCreateClassMenu ( gentity_t *ent )
;283:{
line 286
;284:	char create_class_menu[512];
;285:	
;286:	Com_sprintf( create_class_menu, sizeof ( create_class_menu ), 
ADDRLP4 0
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $151
ARGP4
ADDRLP4 512
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 512
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 290
;287:		"\"Please create your Character.\" \"To reach next level it costs you x XP ,\" \"where x is the level you want to reach.\" \"You got [%i] XP Points left.\" \"?\" \"1. Accuracy (Cur:%i/10)\" \"2. Speed (Cur:%i/10)\" \"3. Stamina (Cur:%i/10)\" \"4. Stealth (Cur: %i/10)\" \"5. Strength (Cur: %i/10)\" \"6. Technical (Cur: %i/10)\" \" \" \"7. Exit\""
;288:		, ent->client->pers.nsPC.xp, ent->client->pers.nsPC.accuracy , ent->client->pers.nsPC.speed, ent->client->pers.nsPC.stamina , ent->client->pers.nsPC.stealth , ent->client->pers.nsPC.strength, ent->client->pers.nsPC.technical    );
;289:
;290:	NS_Menu(ent,create_class_menu,SLOTS_OWNCLASS, MENU_OWNCLASS);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 7
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 291
;291:}
LABELV $150
endproc NS_OpenCreateClassMenu 516 40
export NS_HandleCreateClassMenu
proc NS_HandleCreateClassMenu 60 12
line 299
;292:// 1 accuracy
;293:// 2 speed
;294:// 3 stamina
;295:// 4 stealth 
;296:// 5 strength
;297:// 6 technical
;298:void NS_HandleCreateClassMenu ( gentity_t *ent, int menuSlot )
;299:{
line 300
;300:	switch (menuSlot) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $154
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $154
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $175-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $175
address $155
address $159
address $162
address $165
address $168
address $171
address $174
code
LABELV $155
line 302
;301:	case 1:
;302:		if ( NS_GotEnoughXPfornextLevel ( ent, ent->client->pers.nsPC.accuracy ) && ent->client->pers.nsPC.accuracy < 10 )  {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 NS_GotEnoughXPfornextLevel
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
CNSTI4 10
GEI4 $156
line 303
;303:			ent->client->pers.nsPC.accuracy ++;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 305
;304:			
;305:			NS_GiveXP( ent, ent->client->pers.nsPC.accuracy , qtrue ); 
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 306
;306:		}
ADDRGP4 $157
JUMPV
LABELV $156
line 308
;307:		else
;308:			PrintMsg( ent, "Not enough Experience Points\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $157
line 310
;309:		
;310:		NS_OpenCreateClassMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenCreateClassMenu
CALLV
pop
line 311
;311:		break;
ADDRGP4 $154
JUMPV
LABELV $159
line 313
;312:	case 2:
;313:		if ( NS_GotEnoughXPfornextLevel ( ent, ent->client->pers.nsPC.speed ) && ent->client->pers.nsPC.speed < 10 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 NS_GotEnoughXPfornextLevel
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
CNSTI4 10
GEI4 $160
line 314
;314:			ent->client->pers.nsPC.speed ++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 316
;315:
;316:			NS_GiveXP( ent, ent->client->pers.nsPC.speed, qtrue);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 317
;317:		}
ADDRGP4 $161
JUMPV
LABELV $160
line 319
;318:		else
;319:			PrintMsg( ent, "Not enough Experience Points\n" ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $161
line 321
;320:		
;321:		NS_OpenCreateClassMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenCreateClassMenu
CALLV
pop
line 322
;322:		break;
ADDRGP4 $154
JUMPV
LABELV $162
line 324
;323:	case 3:
;324:		if ( NS_GotEnoughXPfornextLevel ( ent, ent->client->pers.nsPC.stamina ) && ent->client->pers.nsPC.stamina < 10 ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 NS_GotEnoughXPfornextLevel
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $163
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
CNSTI4 10
GEI4 $163
line 325
;325:			ent->client->pers.nsPC.stamina ++;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 327
;326:
;327:			NS_GiveXP( ent, ent->client->pers.nsPC.stamina , qtrue );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 328
;328:		}
ADDRGP4 $164
JUMPV
LABELV $163
line 330
;329:		else
;330:			PrintMsg( ent, "Not enough Experience Points\n" ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $164
line 332
;331:		
;332:		NS_OpenCreateClassMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenCreateClassMenu
CALLV
pop
line 333
;333:		break;
ADDRGP4 $154
JUMPV
LABELV $165
line 335
;334:	case 4:
;335:		if ( NS_GotEnoughXPfornextLevel ( ent, ent->client->pers.nsPC.stealth ) && ent->client->pers.nsPC.stealth < 10 ) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 NS_GotEnoughXPfornextLevel
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $166
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 10
GEI4 $166
line 336
;336:			ent->client->pers.nsPC.stealth ++;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 337
;337:			ent->client->ps.stats[STAT_STEALTH] ++ ;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 339
;338:
;339:			NS_GiveXP( ent, ent->client->pers.nsPC.stealth , qtrue );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 340
;340:		}
ADDRGP4 $167
JUMPV
LABELV $166
line 342
;341:		else
;342:			PrintMsg( ent, "Not enough Experience Points\n" ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $167
line 344
;343:
;344:		NS_OpenCreateClassMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenCreateClassMenu
CALLV
pop
line 345
;345:		break;
ADDRGP4 $154
JUMPV
LABELV $168
line 347
;346:	case 5:
;347:		if ( NS_GotEnoughXPfornextLevel ( ent, ent->client->pers.nsPC.strength ) && ent->client->pers.nsPC.strength < 10 ) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 NS_GotEnoughXPfornextLevel
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $169
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 10
GEI4 $169
line 348
;348:			ent->client->pers.nsPC.strength ++;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
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
line 350
;349:			
;350:			NS_GiveXP( ent, ent->client->pers.nsPC.strength , qtrue );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 351
;351:		}
ADDRGP4 $170
JUMPV
LABELV $169
line 353
;352:		else
;353:			PrintMsg( ent, "Not enough Experience Points\n" ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $170
line 355
;354:
;355:		NS_OpenCreateClassMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenCreateClassMenu
CALLV
pop
line 356
;356:		break;
ADDRGP4 $154
JUMPV
LABELV $171
line 358
;357:	case 6:
;358:		if ( NS_GotEnoughXPfornextLevel ( ent, ent->client->pers.nsPC.technical ) && ent->client->pers.nsPC.technical < 10 ) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 NS_GotEnoughXPfornextLevel
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $172
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 10
GEI4 $172
line 359
;359:			ent->client->pers.nsPC.technical ++;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 361
;360:			
;361:			NS_GiveXP( ent, ent->client->pers.nsPC.technical  , qtrue );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 362
;362:		}
ADDRGP4 $173
JUMPV
LABELV $172
line 364
;363:		else
;364:			PrintMsg( ent, "Not enough Experience Points\n" ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $173
line 366
;365:
;366:		NS_OpenCreateClassMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenCreateClassMenu
CALLV
pop
line 367
;367:		break;
ADDRGP4 $154
JUMPV
LABELV $174
line 369
;368:	case 7:
;369:		NS_OpenMainMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 370
;370:		break;
line 372
;371:	default:
;372:		break;
LABELV $154
line 374
;373:	}
;374:}
LABELV $152
endproc NS_HandleCreateClassMenu 60 12
export NS_OpenClassMenu
proc NS_OpenClassMenu 4 16
line 383
;375:
;376:/*
;377:====================================
;378:	Class Selection Menu Handling
;379:====================================
;380:*/
;381:
;382:void NS_OpenClassMenu ( gentity_t *ent )
;383:{
line 384
;384:	char *class_menu = "\"1. Recon\" \"2. Assault\" \"3. Commander\" \"4. Heavy Support\" \"5. Sniper\" \"6. Demolishions Expert\" \"7. Create Custom Class\" ";
ADDRLP4 0
ADDRGP4 $178
ASGNP4
line 386
;385:	
;386:	NS_Menu(ent,class_menu,SLOTS_CLASSMENU, MENU_CLASS);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
CNSTI4 8
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 387
;387:}
LABELV $177
endproc NS_OpenClassMenu 4 16
export NS_HandleClassMenu
proc NS_HandleClassMenu 4 8
line 390
;388:
;389:void NS_HandleClassMenu ( gentity_t *ent, int menuSlot )
;390:{
line 391
;391:	switch (menuSlot) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $181
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $181
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $189-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $189
address $182
address $183
address $184
address $185
address $186
address $187
address $188
code
LABELV $182
line 393
;392:	case 1:
;393:		SetClass(ent, CLASS_RECON);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 394
;394:		NS_OpenMainMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 395
;395:		break;
ADDRGP4 $181
JUMPV
LABELV $183
line 397
;396:	case 2:
;397:		SetClass(ent, CLASS_ASSAULT);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 398
;398:		NS_OpenMainMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 399
;399:		break;
ADDRGP4 $181
JUMPV
LABELV $184
line 401
;400:	case 3:
;401:		SetClass(ent, CLASS_COMMANDER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 402
;402:		NS_OpenMainMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 403
;403:		break;
ADDRGP4 $181
JUMPV
LABELV $185
line 405
;404:	case 4:
;405:		SetClass(ent, CLASS_HEAVYSUPPORT);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 406
;406:		NS_OpenMainMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 407
;407:		break;
ADDRGP4 $181
JUMPV
LABELV $186
line 409
;408:	case 5:
;409:		SetClass(ent, CLASS_SNIPER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 410
;410:		NS_OpenMainMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 411
;411:		break;
ADDRGP4 $181
JUMPV
LABELV $187
line 413
;412:	case 6:
;413:		SetClass(ent, CLASS_DEMOMAN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 414
;414:		NS_OpenMainMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 415
;415:		break; 
ADDRGP4 $181
JUMPV
LABELV $188
line 418
;416:	case  7:
;417:		// choose custom class
;418:		SetClass(ent, CLASS_CUSTOM );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 419
;419:		NS_OpenCreateClassMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenCreateClassMenu
CALLV
pop
line 420
;420:		break;
line 423
;421:
;422:	default:
;423:		break;
LABELV $181
line 425
;424:	}
;425:}
LABELV $179
endproc NS_HandleClassMenu 4 8
export NS_OpenPrimaryWeaponMenu
proc NS_OpenPrimaryWeaponMenu 36 32
line 433
;426:
;427:/*
;428:====================================
;429:	Primary Weapon Menu Handling
;430:====================================
;431:*/
;432:void NS_OpenPrimaryWeaponMenu ( gentity_t *ent )
;433:{
line 439
;434:	// mp5,m4,remington870
;435:	// spas-15 str > 6
;436:	// psg-1 accuracy > 6
;437:	// pdw str > 3 & accuracy > 4
;438:	// macmillan accuracy > 8 & str > 4
;439:	char *line_1 = "\"1. Heckler & Koch Mp5-A5\"";
ADDRLP4 0
ADDRGP4 $192
ASGNP4
line 440
;440:	char *line_2 = "\"2. Colt M4-A1\"";
ADDRLP4 4
ADDRGP4 $193
ASGNP4
line 441
;441:	char *line_3 = "\"3. Remington 870-Mark 1\"";
ADDRLP4 8
ADDRGP4 $194
ASGNP4
line 442
;442:	char *line_4 = "\"4. Frenchi Spas-15 ( str > 6 )\"";
ADDRLP4 12
ADDRGP4 $195
ASGNP4
line 443
;443:	char *line_5 = "\"5. Heckler & Koch PSG-1 ( acc > 6 )\"";
ADDRLP4 16
ADDRGP4 $196
ASGNP4
line 444
;444:	char *line_6 = "\"6. Heckler & Koch PDW ( str > 3 & acc > 4 )\"";
ADDRLP4 20
ADDRGP4 $197
ASGNP4
line 445
;445:	char *line_7 = "\"7. Mac Millan .50 ( str > 4 & acc > 8 )\"";
ADDRLP4 24
ADDRGP4 $198
ASGNP4
line 448
;446:	char *primary_weapon_menu;
;447:
;448:	if ( ent->client->sess.sessionTeam == TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $199
line 449
;449:	{
line 450
;450:		line_1 = "\"1. Ingram Mac-10\"";
ADDRLP4 0
ADDRGP4 $201
ASGNP4
line 451
;451:		line_2 = "\"2. Avtomat Kalashnikov 47.223\"";
ADDRLP4 4
ADDRGP4 $202
ASGNP4
line 452
;452:	}
LABELV $199
line 454
;453:	
;454:	 primary_weapon_menu = va("\"Please select your primary Weapon.\" \"?\" %s %s %s %s %s %s %s \" \"		\"0. Exit\"", line_1,line_2,line_3,line_4,line_5,line_6,line_7 );
ADDRGP4 $203
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
ASGNP4
line 457
;455:
;456: 
;457:	NS_Menu(ent,primary_weapon_menu,SLOTS_PRIM_WEAP, MENU_PRIM_WEAP);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 459
;458:	//3. Ak47 .233\"
;459:}
LABELV $191
endproc NS_OpenPrimaryWeaponMenu 36 32
export NS_SetPrimary
proc NS_SetPrimary 168 8
line 463
;460: 
;461:
;462:void NS_SetPrimary( gentity_t *ent , int primary )
;463:{
line 466
;464:	gentity_t *temp;
;465:
;466:	temp = G_TempEntity( ent->client->ps.origin, EV_STOLENWEAPON );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 18
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 467
;467:	temp->s.weapon = primary;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 468
;468:	temp->s.otherEntityNum = ent->client->ps.clientNum;
ADDRLP4 8
CNSTI4 140
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 471
;469:
;470:	// copy old primary modifications to the new one [only for some weapon - some can't handle weaponmods]
;471:	if ( BG_WeaponMods( primary ) & ( 1 << WM_SILENCER ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $205
line 472
;472:		ent->client->pers.nsInven.weapon_mods[primary].silencer = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].silencer;
ADDRLP4 16
CNSTI4 28
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
LABELV $205
line 473
;473:	if ( BG_WeaponMods( primary ) & ( 1 << WM_LASER ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $207
line 474
;474:		ent->client->pers.nsInven.weapon_mods[primary].lasersight = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].lasersight;
ADDRLP4 36
CNSTI4 28
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 36
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 44
INDIRP4
ADDP4
INDIRI4
ASGNI4
LABELV $207
line 475
;475:	if ( BG_WeaponMods( primary ) & ( 1 << WM_SCOPE ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $209
line 476
;476:		ent->client->pers.nsInven.weapon_mods[primary].scope = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].scope;
ADDRLP4 52
CNSTI4 28
ASGNI4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 64
CNSTI4 8
ASGNI4
ADDRLP4 52
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 60
INDIRP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 60
INDIRP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ASGNI4
LABELV $209
line 477
;477:	if ( BG_WeaponMods( primary ) & ( 1 << WM_BAYONET ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $211
line 478
;478:		ent->client->pers.nsInven.weapon_mods[primary].bayonet = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet;
ADDRLP4 72
CNSTI4 28
ASGNI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 76
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 84
CNSTI4 12
ASGNI4
ADDRLP4 72
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 80
INDIRP4
ADDP4
ADDRLP4 84
INDIRI4
ADDP4
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 80
INDIRP4
ADDP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRI4
ASGNI4
LABELV $211
line 479
;479:	if ( BG_WeaponMods( primary ) & ( 1 << WM_GRENADELAUNCHER ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $213
line 480
;480:		ent->client->pers.nsInven.weapon_mods[primary].gl = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].gl;
ADDRLP4 92
CNSTI4 28
ASGNI4
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 104
CNSTI4 16
ASGNI4
ADDRLP4 92
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 100
INDIRP4
ADDP4
ADDRLP4 104
INDIRI4
ADDP4
ADDRLP4 92
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 100
INDIRP4
ADDP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRI4
ASGNI4
LABELV $213
line 481
;481:	if ( BG_WeaponMods( primary ) & ( 1 << WM_DUCKBILL ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $215
line 482
;482:		ent->client->pers.nsInven.weapon_mods[primary].duckbill = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].duckbill;
ADDRLP4 112
CNSTI4 28
ASGNI4
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 116
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 124
CNSTI4 20
ASGNI4
ADDRLP4 112
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 120
INDIRP4
ADDP4
ADDRLP4 124
INDIRI4
ADDP4
ADDRLP4 112
INDIRI4
ADDRLP4 116
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 120
INDIRP4
ADDP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
ASGNI4
LABELV $215
line 483
;483:	if ( BG_WeaponMods( primary ) & ( 1 << WM_FLASHLIGHT ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $217
line 484
;484:		ent->client->pers.nsInven.weapon_mods[primary].flashlight = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].flashlight;
ADDRLP4 132
CNSTI4 28
ASGNI4
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 136
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 144
CNSTI4 24
ASGNI4
ADDRLP4 132
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 140
INDIRP4
ADDP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 140
INDIRP4
ADDP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRI4
ASGNI4
LABELV $217
line 487
;485:	
;486:	// delete old mods
;487:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].silencer = 0;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 148
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 148
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 488
;488:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].lasersight = 0;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 152
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 152
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 489
;489:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].scope = 0;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 156
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 156
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 490
;490:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet = 0;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 160
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 160
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 491
;491:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].gl = 0;
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 164
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 164
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 495
;492:
;493:	
;494:	// now set the new primary weapon
;495:	ent->client->pers.nsInven.primaryweapon = primary;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 496
;496:}
LABELV $204
endproc NS_SetPrimary 168 8
export NS_HandlePrimaryWeaponMenu
proc NS_HandlePrimaryWeaponMenu 20 8
line 499
;497:
;498:void NS_HandlePrimaryWeaponMenu ( gentity_t *ent, int menuSlot )
;499:{
line 500
;500:	qboolean seals = ( ent->client->sess.sessionTeam == TEAM_RED );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $221
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $222
JUMPV
LABELV $221
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $222
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 501
;501:	int acc = ent->client->pers.nsPC.accuracy;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ASGNI4
line 502
;502:	int str = ent->client->pers.nsPC.strength;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ASGNI4
line 509
;503:	// mp5,m4,remington870
;504:	// spas-15 str > 6
;505:	// psg-1 accuracy > 6
;506:	// pdw str > 3 & accuracy > 4
;507:	// macmillan accuracy > 8 & str > 4
;508:
;509:	switch (menuSlot) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $223
ADDRLP4 16
INDIRI4
CNSTI4 10
GTI4 $223
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $246-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $246
address $225
address $228
address $231
address $232
address $239
address $236
address $242
address $223
address $223
address $245
code
LABELV $225
line 511
;510:	case 1:
;511:		if (seals)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $226
line 512
;512:			NS_SetPrimary( ent, WP_MP5 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
ADDRGP4 $227
JUMPV
LABELV $226
line 514
;513:		else
;514:			NS_SetPrimary( ent, WP_MAC10 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
LABELV $227
line 515
;515:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 516
;516:		break;
ADDRGP4 $224
JUMPV
LABELV $228
line 518
;517:	case 2:
;518:		if (seals)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $229
line 519
;519:			NS_SetPrimary( ent, WP_M4 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
ADDRGP4 $230
JUMPV
LABELV $229
line 521
;520:		else
;521:			NS_SetPrimary( ent, WP_AK47 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 15
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
LABELV $230
line 522
;522:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 523
;523:		break;
ADDRGP4 $224
JUMPV
LABELV $231
line 525
;524:	case 3:
;525:		NS_SetPrimary( ent, WP_870 );  
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
line 526
;526:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 527
;527:		break;
ADDRGP4 $224
JUMPV
LABELV $232
line 529
;528:	case 4:	
;529:		if ( str > 6 ) {
ADDRLP4 4
INDIRI4
CNSTI4 6
LEI4 $233
line 530
;530:			NS_SetPrimary( ent, WP_SPAS15 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 21
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
line 531
;531:			NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 532
;532:		}
ADDRGP4 $224
JUMPV
LABELV $233
line 534
;533:		else
;534:		{
line 535
;535:			PrintMsg(ent,"You're not good enough for this weapon.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $235
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 536
;536:			NS_OpenPrimaryWeaponMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPrimaryWeaponMenu
CALLV
pop
line 537
;537:		}
line 538
;538:		break;
ADDRGP4 $224
JUMPV
LABELV $236
line 540
;539:	case 6:
;540:		if ( str > 3 && acc > 4 ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $237
ADDRLP4 0
INDIRI4
CNSTI4 4
LEI4 $237
line 541
;541:			NS_SetPrimary( ent, WP_PDW ); 		
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
line 542
;542:			NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 543
;543:		}
ADDRGP4 $224
JUMPV
LABELV $237
line 545
;544:		else
;545:		{
line 546
;546:			PrintMsg(ent,"You're not good enough for this weapon.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $235
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 547
;547:			NS_OpenPrimaryWeaponMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPrimaryWeaponMenu
CALLV
pop
line 548
;548:		}
line 549
;549:		break;
ADDRGP4 $224
JUMPV
LABELV $239
line 551
;550:	case 5:
;551:		if ( acc > 6 ) {
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $240
line 552
;552:			NS_SetPrimary( ent, WP_PSG1 ); 		
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
line 553
;553:			NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 554
;554:		}
ADDRGP4 $224
JUMPV
LABELV $240
line 556
;555:		else
;556:		{
line 557
;557:			PrintMsg(ent,"You're not good enough for this weapon.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $235
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 558
;558:			NS_OpenPrimaryWeaponMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPrimaryWeaponMenu
CALLV
pop
line 559
;559:		}
line 560
;560:		break;
ADDRGP4 $224
JUMPV
LABELV $242
line 562
;561:	case 7:
;562:		if ( acc > 8 && str > 4 )
ADDRLP4 0
INDIRI4
CNSTI4 8
LEI4 $243
ADDRLP4 4
INDIRI4
CNSTI4 4
LEI4 $243
line 563
;563:		{
line 564
;564:			NS_SetPrimary( ent, WP_MACMILLAN ); 		
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 NS_SetPrimary
CALLV
pop
line 565
;565:			NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 566
;566:		}
ADDRGP4 $224
JUMPV
LABELV $243
line 568
;567:		else
;568:		{
line 569
;569:			PrintMsg(ent,"You're not good enough for this weapon.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $235
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 570
;570:			NS_OpenPrimaryWeaponMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPrimaryWeaponMenu
CALLV
pop
line 571
;571:		}
line 572
;572:		break;
ADDRGP4 $224
JUMPV
LABELV $245
line 574
;573:	case 10:
;574:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 575
;575:		break;
ADDRGP4 $224
JUMPV
LABELV $223
line 577
;576:	default:
;577:		NS_OpenPrimaryWeaponMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPrimaryWeaponMenu
CALLV
pop
line 578
;578:		break;
LABELV $224
line 580
;579:	}
;580:}
LABELV $219
endproc NS_HandlePrimaryWeaponMenu 20 8
export NS_OpenSecondaryWeaponMenu
proc NS_OpenSecondaryWeaponMenu 4 16
line 588
;581:
;582:/*
;583:====================================
;584:	Secondary Weapon Loadout Menu
;585:====================================
;586:*/
;587:void NS_OpenSecondaryWeaponMenu ( gentity_t *ent )
;588:{
line 590
;589:	char *secondary_weapon_menu =
;590:		"\"Please select your secondary Weapon.\" 		\"?\" 		\"1. H&K P9s\"		\"2. H&K Mk23 Socom Pistol\" \"3. Desert Eagle ( strength > 3 )\" 			\" \" 		\"0. Exit\"";
ADDRLP4 0
ADDRGP4 $249
ASGNP4
line 592
;591:
;592:	if ( ent->client->sess.sessionTeam == TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $250
line 593
;593:	secondary_weapon_menu = "\"Please select your secondary Weapon.\" 		\"1. Glock-18 (20 Round)\" 		\"2. S&W 40t\" \"3. Desert Eagle ( strength > 3)\"		\" \" 		 \"0. Exit\"";
ADDRLP4 0
ADDRGP4 $252
ASGNP4
LABELV $250
line 595
;594:
;595:	NS_Menu(ent,secondary_weapon_menu,SLOTS_SECO_WEAP, MENU_SECO_WEAP);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 596
;596:}
LABELV $248
endproc NS_OpenSecondaryWeaponMenu 4 16
export NS_SetSecondary
proc NS_SetSecondary 64 8
line 598
;597:void NS_SetSecondary( gentity_t *ent , int secondary )
;598:{
line 601
;599:	gentity_t *temp;
;600:
;601:	temp = G_TempEntity( ent->client->ps.origin, EV_STOLENWEAPON );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 18
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 602
;602:	temp->s.weapon = secondary;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 603
;603:	temp->s.otherEntityNum = ent->client->ps.clientNum;
ADDRLP4 8
CNSTI4 140
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 606
;604:
;605:	// copy old primary modifications to the new one [only for some weapon - some can't handle weaponmods]
;606:	if ( BG_WeaponMods( secondary ) & ( 1 << WM_SILENCER ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $254
line 607
;607:		ent->client->pers.nsInven.weapon_mods[secondary].silencer = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].silencer;
ADDRLP4 16
CNSTI4 28
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
LABELV $254
line 608
;608:	if ( BG_WeaponMods( secondary ) & ( 1 << WM_LASER ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $256
line 609
;609:		ent->client->pers.nsInven.weapon_mods[secondary].lasersight = ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].lasersight;
ADDRLP4 36
CNSTI4 28
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 36
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 44
INDIRP4
ADDP4
INDIRI4
ASGNI4
LABELV $256
line 612
;610:
;611: 	//	 delete old mods
;612:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].silencer = 0;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 48
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 613
;613:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].lasersight = 0;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 52
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 614
;614:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].scope = 0;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 56
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 615
;615:	ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].bayonet = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 60
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 60
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 618
;616:
;617:	// now set the new primary weapon
;618:	ent->client->pers.nsInven.secondaryweapon = secondary;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 619
;619:}
LABELV $253
endproc NS_SetSecondary 64 8
export NS_HandleSecondaryWeaponMenu
proc NS_HandleSecondaryWeaponMenu 12 8
line 622
;620:
;621:void NS_HandleSecondaryWeaponMenu ( gentity_t *ent, int menuSlot )
;622:{
line 623
;623:	qboolean seals = (ent->client->sess.sessionTeam == TEAM_RED);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $260
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $260
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $261
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 625
;624:
;625:	switch (menuSlot) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $262
ADDRLP4 8
INDIRI4
CNSTI4 3
GTI4 $262
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $274
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $274
address $273
address $264
address $267
address $270
code
LABELV $264
line 627
;626:	case 1:
;627:		if (seals)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $265
line 628
;628:			NS_SetSecondary(ent, WP_P9S);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 NS_SetSecondary
CALLV
pop
ADDRGP4 $266
JUMPV
LABELV $265
line 630
;629:		else
;630:			NS_SetSecondary(ent, WP_GLOCK);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 NS_SetSecondary
CALLV
pop
LABELV $266
line 631
;631:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 632
;632:		break;
ADDRGP4 $263
JUMPV
LABELV $267
line 634
;633:	case 2:
;634:		if (seals)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $268
line 635
;635:			NS_SetSecondary(ent, WP_MK23);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 NS_SetSecondary
CALLV
pop
ADDRGP4 $269
JUMPV
LABELV $268
line 637
;636:		else
;637:			NS_SetSecondary(ent, WP_SW40T);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 NS_SetSecondary
CALLV
pop
LABELV $269
line 638
;638:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 639
;639:		break;
ADDRGP4 $263
JUMPV
LABELV $270
line 641
;640:	case 3:
;641:		if ( ent->client->pers.nsPC.strength > 3 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 3
LEI4 $271
line 642
;642:		{
line 643
;643:		NS_SetSecondary(ent, WP_DEAGLE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 NS_SetSecondary
CALLV
pop
line 644
;644:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 645
;645:		}
ADDRGP4 $263
JUMPV
LABELV $271
line 647
;646:		else
;647:			NS_OpenSecondaryWeaponMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenSecondaryWeaponMenu
CALLV
pop
line 648
;648:		break;
ADDRGP4 $263
JUMPV
LABELV $273
line 650
;649:	case 0:
;650:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 651
;651:		break;
ADDRGP4 $263
JUMPV
LABELV $262
line 653
;652:	default:
;653:		NS_OpenSecondaryWeaponMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenSecondaryWeaponMenu
CALLV
pop
line 654
;654:		break;
LABELV $263
line 656
;655:	}
;656:}
LABELV $258
endproc NS_HandleSecondaryWeaponMenu 12 8
export return_headstuffname
proc return_headstuffname 4 0
line 677
;657:
;658:// tango |  seals
;659:// ------+-------
;660:// bruce |  curtis, jamal
;661://
;662:
;663:#if 0
;664: "Configurate your Playerstyle"
;665: ""
;666: "Use your Weaponkeys."
;667: "----------------------------"
;668: "1. Faceskin: %s"
;669: "2. -Camouflage: %s"
;670: "3. -Facemask:   %s"
;671: "4. Headequipment: %s"
;672: " "
;673: "5. Exit"
;674:#endif
;675:
;676:char *return_headstuffname( int headstuff )
;677:{
line 678
;678:	switch ( headstuff ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $277
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $277
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $292-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $292
address $278
address $280
address $282
address $284
address $286
address $288
address $290
code
LABELV $278
line 680
;679:	case EQ_STORMGOGGLES:
;680:		return "Storm Goggles";
ADDRGP4 $279
RETP4
ADDRGP4 $275
JUMPV
line 681
;681:		break;
LABELV $280
line 683
;682:	case EQ_JOINT:
;683:		return "Joint";
ADDRGP4 $281
RETP4
ADDRGP4 $275
JUMPV
line 684
;684:		break;
LABELV $282
line 686
;685:	case EQ_PIECEOFHAY: 
;686:		return "Piece of Hay";
ADDRGP4 $283
RETP4
ADDRGP4 $275
JUMPV
line 687
;687:		break;
LABELV $284
line 689
;688:	case EQ_NVGOGGLES:
;689:		return "Night Vision Goggles";
ADDRGP4 $285
RETP4
ADDRGP4 $275
JUMPV
line 690
;690:		break;
LABELV $286
line 692
;691:	case EQ_SEALHAT:
;692:		return "Seal Hat";
ADDRGP4 $287
RETP4
ADDRGP4 $275
JUMPV
line 693
;693:		break;
LABELV $288
line 695
;694:	case EQ_TURBAN:
;695:		return "Turban";
ADDRGP4 $289
RETP4
ADDRGP4 $275
JUMPV
line 696
;696:		break;
LABELV $290
line 698
;697:	case EQ_HELMET:
;698:		return "Helmet";
ADDRGP4 $291
RETP4
ADDRGP4 $275
JUMPV
line 699
;699:		break;
line 701
;700:	default: 
;701:		break;
LABELV $277
line 704
;702:	}
;703:
;704:	return "None";
ADDRGP4 $294
RETP4
LABELV $275
endproc return_headstuffname 4 0
export return_skinname
proc return_skinname 8 0
line 708
;705:}
;706:
;707:char *return_skinname( int skin, int team )
;708:{
line 709
;709:	if ( team == TEAM_RED )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $296
line 710
;710:		switch ( skin ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $302
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $300
ADDRGP4 $298
JUMPV
LABELV $300
line 712
;711:			case SKIN_S_BRUCE:
;712:				return "Bruce W.";
ADDRGP4 $301
RETP4
ADDRGP4 $295
JUMPV
line 713
;713:				break;
LABELV $302
line 715
;714:			case SKIN_S_CURTIS:
;715:				return "Curits S.";
ADDRGP4 $303
RETP4
ADDRGP4 $295
JUMPV
line 716
;716:				break;
LABELV $298
LABELV $296
line 718
;717:		}
;718:	if ( team == TEAM_BLUE )
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $304
line 719
;719:		switch ( skin ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $310
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $308
ADDRGP4 $306
JUMPV
LABELV $308
line 721
;720:			case SKIN_T_MUSTAFA:
;721:				return "Mustafa B.";
ADDRGP4 $309
RETP4
ADDRGP4 $295
JUMPV
line 722
;722:				break;				
LABELV $310
line 724
;723:			case SKIN_T_JAMAL:
;724:				return "Jamal C.";
ADDRGP4 $311
RETP4
ADDRGP4 $295
JUMPV
line 725
;725:				break;
LABELV $306
LABELV $304
line 729
;726:  			
;727:		}
;728:
;729:	return "Default";
ADDRGP4 $312
RETP4
LABELV $295
endproc return_skinname 8 0
export NS_CheckSkinValid
proc NS_CheckSkinValid 8 0
line 733
;730:}
;731:
;732:void NS_CheckSkinValid( gentity_t *ent )
;733:{ 
line 734
;734:	 if ( ent->client->pers.nsPC.style == EQ_NVGOGGLES )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 4
NEI4 $314
line 735
;735:		 ent->client->pers.nsPC.style++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $314
line 738
;736: 
;737:
;738:	 if ( ent->client->sess.sessionTeam == TEAM_RED ) 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $316
line 739
;739:	 {
line 740
;740:		 if ( ent->client->pers.nsInven.faceskin >= SKIN_S_MAXSKINS )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
LTI4 $318
line 741
;741:			 ent->client->pers.nsInven.faceskin = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
ADDP4
CNSTI4 0
ASGNI4
LABELV $318
line 748
;742:		 /*
;743:		 new skins: disable
;744:		 if ( ent->client->pers.nsInven.face_tatoo )
;745:			 ent->client->pers.nsInven.face_tatoo = qfalse; 
;746:		 */
;747:
;748:		 if ( ent->client->pers.nsPC.style == EQ_TURBAN )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 6
NEI4 $320
line 749
;749:			 ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
LABELV $320
line 750
;750:		 if ( ent->client->pers.nsPC.style == EQ_SEALHAT && ent->client->pers.nsInven.powerups[PW_HELMET] )
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 5
NEI4 $322
ADDRLP4 4
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
CNSTI4 0
EQI4 $322
line 751
;751:			 ent->client->pers.nsPC.style = 0;	 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
LABELV $322
line 752
;752:	 }
LABELV $316
line 753
;753:	 if ( ent->client->sess.sessionTeam == TEAM_BLUE ) 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $324
line 754
;754:	 {
line 755
;755:		 if ( ent->client->pers.nsInven.faceskin >= SKIN_T_MAXSKINS )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
LTI4 $326
line 756
;756:			 ent->client->pers.nsInven.faceskin = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
ADDP4
CNSTI4 0
ASGNI4
LABELV $326
line 762
;757:		 /*
;758:		 new skins: disable
;759:		 if ( ent->client->pers.nsInven.face_camo )
;760:			 ent->client->pers.nsInven.face_camo = qfalse;
;761:			 */ 
;762:		if ( ent->client->pers.nsPC.style == EQ_SEALHAT )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 5
NEI4 $328
line 763
;763:			 ent->client->pers.nsPC.style = EQ_TURBAN;	 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 6
ASGNI4
LABELV $328
line 765
;764:
;765:		if ( ent->client->pers.nsPC.style == EQ_TURBAN && ent->client->pers.nsInven.powerups[PW_HELMET] )
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 6
NEI4 $330
ADDRLP4 4
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
CNSTI4 0
EQI4 $330
line 766
;766:			 ent->client->pers.nsPC.style = 0;	 		 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
LABELV $330
line 767
;767:	 }
LABELV $324
line 769
;768:
;769:	if ( ent->client->pers.nsPC.style > EQ_TURBAN )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 6
LEI4 $332
line 770
;770:		 ent->client->pers.nsPC.style = 0;  
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
LABELV $332
line 771
;771:}
LABELV $313
endproc NS_CheckSkinValid 8 0
export NS_OpenPlayerMenu
proc NS_OpenPlayerMenu 532 28
line 779
;772: 
;773:/*
;774:====================================
;775:	Player Menu
;776:====================================
;777:*/
;778:void NS_OpenPlayerMenu ( gentity_t *ent )
;779:{
line 782
;780:	char player_menu[512];
;781: 
;782:	NS_CheckSkinValid( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_CheckSkinValid
CALLV
pop
line 784
;783:
;784:	Com_sprintf( player_menu, sizeof ( player_menu ), 
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 520
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRLP4 520
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 524
ADDRGP4 return_skinname
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
ARGI4
ADDRLP4 528
ADDRGP4 return_headstuffname
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $335
ARGP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
CNSTI4 0
EQI4 $342
ADDRLP4 512
ADDRGP4 $336
ASGNP4
ADDRGP4 $343
JUMPV
LABELV $342
ADDRLP4 512
ADDRGP4 $337
ASGNP4
LABELV $343
ADDRLP4 512
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 0
EQI4 $344
ADDRLP4 516
ADDRGP4 $339
ASGNP4
ADDRGP4 $345
JUMPV
LABELV $344
ADDRLP4 516
ADDRGP4 $340
ASGNP4
LABELV $345
ADDRLP4 516
INDIRP4
ARGP4
ADDRLP4 528
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 798
;785: "\"Configurate your Playerstyle\""
;786: "\" \""
;787: "\"Use your Weaponkeys.\""
;788: "\"----------------------------\""
;789: "\"1. Faceskin: %s\""
;790: "\"2. -Camouflage: %s\""
;791: "\"3. -Facemask:   %s\""
;792: "\"4. Headequipment: %s\""
;793: "\" \""
;794: "\"5. Exit\""
;795:
;796: , return_skinname( ent->client->pers.nsInven.faceskin, ent->client->sess.sessionTeam ) , ent->client->pers.nsInven.face_camo?"Painted!":"Nope", ent->client->pers.nsInven.face_mask?"Dressed!":"No", return_headstuffname(ent->client->pers.nsPC.style) );
;797: 
;798:	NS_Menu(ent,player_menu,SLOTS_PLAYER, MENU_PLAYER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 5
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 799
;799:}
LABELV $334
endproc NS_OpenPlayerMenu 532 28
export NS_HandlePlayerMenu
proc NS_HandlePlayerMenu 12 8
line 802
;800:
;801:void NS_HandlePlayerMenu ( gentity_t *ent, int menuSlot )
;802:{
line 803
;803:	int team = ent->client->sess.sessionTeam;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ASGNI4
line 805
;804: 
;805:	switch (menuSlot) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $348
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $348
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $365-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $365
address $349
address $356
address $359
address $362
address $363
code
LABELV $349
line 807
;806:	case 1:
;807:		if ( team == TEAM_RED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $350
line 808
;808:			if ( ent->client->pers.nsInven.faceskin == SKIN_S_MAXSKINS )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
NEI4 $352
line 809
;809:				ent->client->pers.nsInven.faceskin = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $352
line 811
;810:			else
;811:				ent->client->pers.nsInven.faceskin ++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
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
line 812
;812:		}
ADDRGP4 $351
JUMPV
LABELV $350
line 813
;813:		else {
line 814
;814:			if ( ent->client->pers.nsInven.faceskin == SKIN_T_MAXSKINS )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
NEI4 $354
line 815
;815:				ent->client->pers.nsInven.faceskin = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $354
line 817
;816:			else
;817:				ent->client->pers.nsInven.faceskin ++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 792
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
LABELV $355
line 818
;818:		}
LABELV $351
line 819
;819:		NS_OpenPlayerMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPlayerMenu
CALLV
pop
line 820
;820:		break;
ADDRGP4 $348
JUMPV
LABELV $356
line 822
;821:	case 2:
;822:		if ( ent->client->pers.nsInven.face_camo )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
CNSTI4 0
EQI4 $357
line 823
;823:			ent->client->pers.nsInven.face_camo = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 796
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $357
line 825
;824:		else
;825:			ent->client->pers.nsInven.face_camo = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 796
ADDP4
CNSTI4 1
ASGNI4
LABELV $358
line 827
;826:
;827:		NS_OpenPlayerMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPlayerMenu
CALLV
pop
line 828
;828:		break;
ADDRGP4 $348
JUMPV
LABELV $359
line 830
;829:	case 3:
;830:		if ( ent->client->pers.nsInven.face_mask )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 0
EQI4 $360
line 831
;831:			ent->client->pers.nsInven.face_mask = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $361
JUMPV
LABELV $360
line 833
;832:		else
;833:			ent->client->pers.nsInven.face_mask = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 1
ASGNI4
LABELV $361
line 835
;834:
;835:		NS_OpenPlayerMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPlayerMenu
CALLV
pop
line 836
;836:		break;
ADDRGP4 $348
JUMPV
LABELV $362
line 838
;837:	case 4:
;838:		ent->client->pers.nsPC.style++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
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
line 839
;839:		NS_OpenPlayerMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPlayerMenu
CALLV
pop
line 840
;840:		break;
ADDRGP4 $348
JUMPV
LABELV $363
line 842
;841:	case 5:
;842:		ClientUserinfoChanged( ent->client->ps.clientNum );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 843
;843:		trap_SendServerCommand( -1, "loaddefered\n" );	// FIXME: spelled wrong, but not changing for demo
CNSTI4 -1
ARGI4
ADDRGP4 $364
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 844
;844:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 845
;845:		break;
line 847
;846:	default:
;847:		break;
LABELV $348
line 849
;848:	}
;849:}
LABELV $346
endproc NS_HandlePlayerMenu 12 8
export NS_OpenAmmoMenu
proc NS_OpenAmmoMenu 548 32
line 857
;850:
;851:/*
;852:====================================
;853:	Ammonition Menu
;854:====================================
;855:*/
;856:void NS_OpenAmmoMenu ( gentity_t *ent )
;857:{
line 862
;858:	char ammo_menu[512];
;859: 
;860:	gitem_t *pri,*sec;
;861:
;862:	pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 520
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 512
ADDRLP4 520
INDIRP4
ASGNP4
line 863
;863:	sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 524
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 516
ADDRLP4 524
INDIRP4
ASGNP4
line 865
;864:
;865:	Com_sprintf( ammo_menu, sizeof ( ammo_menu ), 
ADDRLP4 0
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $368
ARGP4
ADDRLP4 528
CNSTI4 44
ASGNI4
ADDRLP4 532
CNSTI4 2
ASGNI4
ADDRLP4 536
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 540
ADDRLP4 536
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 512
INDIRP4
ADDRLP4 528
INDIRI4
ADDP4
INDIRI4
ADDRLP4 532
INDIRI4
LSHI4
ADDRLP4 540
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 516
INDIRP4
ADDRLP4 528
INDIRI4
ADDP4
INDIRI4
ADDRLP4 532
INDIRI4
LSHI4
ADDRLP4 540
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 536
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ARGI4
ADDRLP4 536
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 536
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 878
;866:		"\"Please select your Ammo.\""
;867:		"\"?\""
;868:		"\"1. Primary Ammo (Cur:%i/6)(+1)\""
;869:		"\"2. Secondary Ammo (Cur:%i/10)(+1)\""
;870: 		"\"3. Grenades    (Cur:%i/3)\""
;871:		"\"4. Flash Bangs (Cur:%i/3)\""
;872:		"\"5. 40mm Grenades (Cur:%i/3)\""
;873:		"\" \""
;874:		"\"6. Exit\""		
;875:		, ent->client->pers.nsInven.ammo[pri->giAmmoTag],ent->client->pers.nsInven.ammo[sec->giAmmoTag]
;876:		, ent->client->pers.nsInven.ammo[AM_GRENADES], ent->client->pers.nsInven.ammo[AM_FLASHBANGS], ent->client->pers.nsInven.ammo[AM_40MMGRENADES] );
;877: 
;878:	NS_Menu(ent,ammo_menu,SLOTS_AMMO, MENU_AMMO);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 544
CNSTI4 6
ASGNI4
ADDRLP4 544
INDIRI4
ARGI4
ADDRLP4 544
INDIRI4
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 879
;879:}
LABELV $367
endproc NS_OpenAmmoMenu 548 32
export NS_HandleAmmoMenu
proc NS_HandleAmmoMenu 56 4
line 882
;880:
;881:void NS_HandleAmmoMenu ( gentity_t *ent, int menuSlot )
;882:{
line 883
;883:	gitem_t *pri = NULL,*sec = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 8
CNSTP4 0
ASGNP4
line 884
;884:	int tag = AM_GRENADES;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 886
;885:
;886:	if ( menuSlot == 4 )
ADDRFP4 4
INDIRI4
CNSTI4 4
NEI4 $370
line 887
;887:		tag = AM_FLASHBANGS;
ADDRLP4 0
CNSTI4 11
ASGNI4
ADDRGP4 $371
JUMPV
LABELV $370
line 888
;888:	else if ( menuSlot == 5)
ADDRFP4 4
INDIRI4
CNSTI4 5
NEI4 $372
line 889
;889:		tag = AM_40MMGRENADES;
ADDRLP4 0
CNSTI4 13
ASGNI4
LABELV $372
LABELV $371
line 891
;890:	
;891:	if (ent->client->pers.nsInven.primaryweapon)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $374
line 892
;892:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
LABELV $374
line 893
;893:	if (ent->client->pers.nsInven.secondaryweapon)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $376
line 894
;894:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
LABELV $376
line 897
;895:
;896:
;897:	switch (menuSlot) {
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LTI4 $379
ADDRLP4 20
INDIRI4
CNSTI4 6
GTI4 $379
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $397-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $397
address $380
address $386
address $392
address $392
address $392
address $396
code
LABELV $380
line 899
;898:	case 1:
;899:		if (!pri) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $381
line 900
;900:			NS_OpenAmmoMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenAmmoMenu
CALLV
pop
line 901
;901:			break;
ADDRGP4 $379
JUMPV
LABELV $381
line 903
;902:		}
;903:		if (ent->client->pers.nsInven.ammo[pri->giAmmoTag] < 0 || ent->client->pers.nsInven.ammo[pri->giAmmoTag] >= 6)
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $385
ADDRLP4 24
INDIRI4
CNSTI4 6
LTI4 $383
LABELV $385
line 904
;904:			ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $383
line 906
;905:		else
;906:			ent->client->pers.nsInven.ammo[pri->giAmmoTag]++;
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $384
line 907
;907:		NS_OpenAmmoMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenAmmoMenu
CALLV
pop
line 908
;908:		break;
ADDRGP4 $379
JUMPV
LABELV $386
line 910
;909:	case 2:
;910:		if (!sec) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $387
line 911
;911:			NS_OpenAmmoMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenAmmoMenu
CALLV
pop
line 912
;912:			break;
ADDRGP4 $379
JUMPV
LABELV $387
line 914
;913:		}
;914:		if (ent->client->pers.nsInven.ammo[pri->giAmmoTag] < 0 || ent->client->pers.nsInven.ammo[sec->giAmmoTag] >= 10)
ADDRLP4 32
CNSTI4 44
ASGNI4
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRLP4 40
INDIRP4
ADDP4
INDIRI4
CNSTI4 0
LTI4 $391
ADDRLP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRLP4 40
INDIRP4
ADDP4
INDIRI4
CNSTI4 10
LTI4 $389
LABELV $391
line 915
;915:			ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 0;
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $390
JUMPV
LABELV $389
line 917
;916:		else
;917:			ent->client->pers.nsInven.ammo[sec->giAmmoTag]++;
ADDRLP4 44
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
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
LABELV $390
line 918
;918:		NS_OpenAmmoMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenAmmoMenu
CALLV
pop
line 919
;919:		break;
ADDRGP4 $379
JUMPV
LABELV $392
line 923
;920:	case 3:
;921:	case 4: 
;922:	case 5:
;923:		if (ent->client->pers.nsInven.ammo[tag] < 0 || ent->client->pers.nsInven.ammo[tag] >= 3)
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LTI4 $395
ADDRLP4 48
INDIRI4
CNSTI4 3
LTI4 $393
LABELV $395
line 924
;924:			ent->client->pers.nsInven.ammo[tag] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $394
JUMPV
LABELV $393
line 926
;925:		else
;926:			ent->client->pers.nsInven.ammo[tag]++;
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $394
line 927
;927:		NS_OpenAmmoMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenAmmoMenu
CALLV
pop
line 928
;928:		break;
ADDRGP4 $379
JUMPV
LABELV $396
line 930
;929:	case 6:
;930:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 931
;931:		break;
line 933
;932:	default:
;933:		break;
LABELV $379
line 935
;934:	}
;935:}
LABELV $369
endproc NS_HandleAmmoMenu 56 4
export NS_OpenEquipmentMenu
proc NS_OpenEquipmentMenu 568 44
line 943
;936:
;937:/*
;938:====================================
;939:	Equipment Menu
;940:====================================
;941:*/
;942:void NS_OpenEquipmentMenu ( gentity_t *ent )
;943:{
line 947
;944:	char equipment_menu[512];
;945:
;946:	// these both got no lasersight, they got a gl
;947:	if ( ent->client->pers.nsInven.primaryweapon && BG_WeaponMods(ent->client->pers.nsInven.primaryweapon ) & ( 1 << WM_GRENADELAUNCHER ) )
ADDRLP4 512
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 512
INDIRI4
CNSTI4 0
EQI4 $400
ADDRLP4 512
INDIRI4
ARGI4
ADDRLP4 516
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $400
line 948
;948:	{		
line 949
;949:	Com_sprintf( equipment_menu, sizeof ( equipment_menu ), "\"Customize your Equipment\" \"?\" \"1. Kevlar Vest (%i/1)\" \"2. Helmet (%i/1)\" \"3. Silencer for Primary (min: Stealth 5 - %s)\" \"4. Scope for Primary (min: Accuracy 6 - %s)\" \"5. GrenadeLauncher for Primary (min: Technical 4 - %s)\" \"6. Bayonet for Primary (min: Strength 4 - %s)\" \"7. Silencer for Secondary (min: Stealth 3 - %s)\"  \"8. Lasersight for Secondary (min: Accuracy 3 - %s)\"\" \" \"9. Exit\" ", 
ADDRLP4 0
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $402
ARGP4
ADDRLP4 544
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 544
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ARGI4
ADDRLP4 544
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ARGI4
CNSTI4 28
ADDRLP4 544
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 544
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $411
ADDRLP4 520
ADDRGP4 $403
ASGNP4
ADDRGP4 $412
JUMPV
LABELV $411
ADDRLP4 520
ADDRGP4 $404
ASGNP4
LABELV $412
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 548
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 548
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 548
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $413
ADDRLP4 524
ADDRGP4 $403
ASGNP4
ADDRGP4 $414
JUMPV
LABELV $413
ADDRLP4 524
ADDRGP4 $404
ASGNP4
LABELV $414
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 552
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 552
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 552
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $415
ADDRLP4 528
ADDRGP4 $403
ASGNP4
ADDRGP4 $416
JUMPV
LABELV $415
ADDRLP4 528
ADDRGP4 $404
ASGNP4
LABELV $416
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 556
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 556
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 556
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $417
ADDRLP4 532
ADDRGP4 $403
ASGNP4
ADDRGP4 $418
JUMPV
LABELV $417
ADDRLP4 532
ADDRGP4 $404
ASGNP4
LABELV $418
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 560
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 560
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 560
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
ADDRLP4 536
ADDRGP4 $403
ASGNP4
ADDRGP4 $420
JUMPV
LABELV $419
ADDRLP4 536
ADDRGP4 $404
ASGNP4
LABELV $420
ADDRLP4 536
INDIRP4
ARGP4
ADDRLP4 564
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 564
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 564
INDIRP4
CNSTI4 808
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $421
ADDRLP4 540
ADDRGP4 $403
ASGNP4
ADDRGP4 $422
JUMPV
LABELV $421
ADDRLP4 540
ADDRGP4 $404
ASGNP4
LABELV $422
ADDRLP4 540
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 959
;950:		ent->client->pers.nsInven.powerups[PW_VEST],
;951:		ent->client->pers.nsInven.powerups[PW_HELMET], 
;952:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].silencer ? "Active" : "Off", 
;953:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].scope ? "Active" : "Off", 
;954:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].gl ? "Active" : "Off",
;955:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet ? "Active" : "Off",
;956:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].silencer ? "Active" : "Off",
;957:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].lasersight ? "Active" : "Off");
;958:
;959:	} else {		
ADDRGP4 $401
JUMPV
LABELV $400
line 960
;960:	Com_sprintf( equipment_menu, sizeof ( equipment_menu ), "\"Customize your Equipment\" \"?\" \"1. Kevlar Vest (%i/1)\" \"2. Helmet (%i/1)\" \"3. Silencer for Primary (min: Stealth 5 - %s)\" \"4. Scope for Primary (min: Accuracy 6 - %s)\" \"5. Lasersight for Primary (min: Accuracy 4 - %s)\" \"6. Bayonet for Primary (min: Strength 4 - %s)\" \"7. Silencer for Secondary (min: Stealth 3 - %s)\"  \"8. Lasersight for Secondary (min: Accuracy 3 - %s)\"\" \" \"9. Exit\" ", 
ADDRLP4 0
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $423
ARGP4
ADDRLP4 544
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 544
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ARGI4
ADDRLP4 544
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ARGI4
CNSTI4 28
ADDRLP4 544
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 544
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $430
ADDRLP4 520
ADDRGP4 $403
ASGNP4
ADDRGP4 $431
JUMPV
LABELV $430
ADDRLP4 520
ADDRGP4 $404
ASGNP4
LABELV $431
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 548
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 548
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 548
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $432
ADDRLP4 524
ADDRGP4 $403
ASGNP4
ADDRGP4 $433
JUMPV
LABELV $432
ADDRLP4 524
ADDRGP4 $404
ASGNP4
LABELV $433
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 552
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 552
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 552
INDIRP4
CNSTI4 808
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $434
ADDRLP4 528
ADDRGP4 $403
ASGNP4
ADDRGP4 $435
JUMPV
LABELV $434
ADDRLP4 528
ADDRGP4 $404
ASGNP4
LABELV $435
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 556
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 556
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 556
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $436
ADDRLP4 532
ADDRGP4 $403
ASGNP4
ADDRGP4 $437
JUMPV
LABELV $436
ADDRLP4 532
ADDRGP4 $404
ASGNP4
LABELV $437
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 560
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 560
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 560
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $438
ADDRLP4 536
ADDRGP4 $403
ASGNP4
ADDRGP4 $439
JUMPV
LABELV $438
ADDRLP4 536
ADDRGP4 $404
ASGNP4
LABELV $439
ADDRLP4 536
INDIRP4
ARGP4
ADDRLP4 564
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 564
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 564
INDIRP4
CNSTI4 808
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $440
ADDRLP4 540
ADDRGP4 $403
ASGNP4
ADDRGP4 $441
JUMPV
LABELV $440
ADDRLP4 540
ADDRGP4 $404
ASGNP4
LABELV $441
ADDRLP4 540
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 969
;961:		ent->client->pers.nsInven.powerups[PW_VEST],
;962:		ent->client->pers.nsInven.powerups[PW_HELMET], 
;963:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].silencer ? "Active" : "Off", 
;964:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].scope ? "Active" : "Off", 
;965:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].lasersight ? "Active" : "Off",
;966:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet ? "Active" : "Off",
;967:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].silencer ? "Active" : "Off",
;968:		ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].lasersight ? "Active" : "Off");
;969:	}
LABELV $401
line 970
;970:	NS_Menu(ent,equipment_menu,SLOTS_EQUIP, MENU_EQUIP);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 9
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 971
;971:}
LABELV $399
endproc NS_OpenEquipmentMenu 568 44
export NS_HandleEquipmentMenu
proc NS_HandleEquipmentMenu 80 4
line 974
;972:
;973:void NS_HandleEquipmentMenu ( gentity_t *ent, int menuSlot )
;974:{
line 975
;975:	switch (menuSlot) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $444
ADDRLP4 0
INDIRI4
CNSTI4 9
GTI4 $444
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $506-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $506
address $445
address $448
address $451
address $458
address $465
address $482
address $491
address $498
address $505
code
LABELV $445
line 977
;976:	case 1:
;977:		if (ent->client->pers.nsInven.powerups[PW_VEST])
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 0
EQI4 $446
line 978
;978:			ent->client->pers.nsInven.powerups[PW_VEST] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $447
JUMPV
LABELV $446
line 980
;979:		else
;980:			ent->client->pers.nsInven.powerups[PW_VEST] = 1; 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 1
ASGNI4
LABELV $447
line 981
;981:		NS_OpenEquipmentMenu(ent); // !fixme
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 982
;982:		break;
ADDRGP4 $444
JUMPV
LABELV $448
line 984
;983:	case 2:
;984:		if (ent->client->pers.nsInven.powerups[PW_HELMET])
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
CNSTI4 0
EQI4 $449
line 985
;985:			ent->client->pers.nsInven.powerups[PW_HELMET] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $450
JUMPV
LABELV $449
line 987
;986:		else
;987:			ent->client->pers.nsInven.powerups[PW_HELMET] = 1; 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 1
ASGNI4
LABELV $450
line 988
;988:		NS_OpenEquipmentMenu(ent); // !fixme
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 989
;989:		break;
ADDRGP4 $444
JUMPV
LABELV $451
line 991
;990:	case 3: // silencer
;991:		if ( ! ( BG_WeaponMods(ent->client->pers.nsInven.primaryweapon ) & ( 1 << WM_SILENCER ) ) )			
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $452
line 992
;992:		{
line 993
;993:			NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 994
;994:			return;
ADDRGP4 $442
JUMPV
LABELV $452
line 996
;995:		}
;996:		if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].silencer )
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 8
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $454
line 997
;997:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].silencer = 0;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 12
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $455
JUMPV
LABELV $454
line 998
;998:		else if ( ent->client->pers.nsPC.stealth >= 5 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 5
LTI4 $456
line 999
;999:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].silencer = 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 16
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
LABELV $456
LABELV $455
line 1001
;1000:
;1001:		NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1002
;1002:		break;
ADDRGP4 $444
JUMPV
LABELV $458
line 1004
;1003:	case 4: // scope
;1004:		if ( ! ( BG_WeaponMods(ent->client->pers.nsInven.primaryweapon ) & ( 1 << WM_SCOPE ) ) )			
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $459
line 1005
;1005:		{
line 1006
;1006:			NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1007
;1007:			return;
ADDRGP4 $442
JUMPV
LABELV $459
line 1009
;1008:		}
;1009:		if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].scope )
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 24
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $461
line 1010
;1010:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].scope = 0;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 28
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $462
JUMPV
LABELV $461
line 1011
;1011:		else if ( ent->client->pers.nsPC.accuracy >= 6 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
CNSTI4 6
LTI4 $463
line 1012
;1012:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].scope = 1;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 32
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
LABELV $463
LABELV $462
line 1014
;1013:
;1014:		NS_OpenEquipmentMenu(ent); // !fixme
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1015
;1015:		break;
ADDRGP4 $444
JUMPV
LABELV $465
line 1017
;1016:	case 5: // laser
;1017:		{
line 1018
;1018:		int type = WM_LASER;
ADDRLP4 36
CNSTI4 4
ASGNI4
line 1020
;1019:		
;1020:		if ( BG_WeaponMods(ent->client->pers.nsInven.primaryweapon ) & ( 1 << WM_GRENADELAUNCHER ) )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $466
line 1021
;1021:			type = WM_GRENADELAUNCHER;
ADDRLP4 36
CNSTI4 9
ASGNI4
LABELV $466
line 1023
;1022:
;1023:		if ( ! ( BG_WeaponMods(ent->client->pers.nsInven.primaryweapon ) & ( 1 << type ) ) )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDRLP4 36
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $468
line 1024
;1024:		{
line 1025
;1025:			NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1026
;1026:			return;
ADDRGP4 $442
JUMPV
LABELV $468
line 1028
;1027:		}
;1028:		if ( type == WM_GRENADELAUNCHER )
ADDRLP4 36
INDIRI4
CNSTI4 9
NEI4 $470
line 1029
;1029:		{
line 1030
;1030:			if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].gl )
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 48
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $472
line 1031
;1031:				ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].gl = 0;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 52
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $471
JUMPV
LABELV $472
line 1032
;1032:			else if ( ent->client->pers.nsPC.technical >= 5 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 5
LTI4 $471
line 1035
;1033:		
;1034:				// disable bayonet if GL.. both causes trouble
;1035:				if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet )
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 56
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
line 1036
;1036:					ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 60
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 60
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
LABELV $476
line 1038
;1037:
;1038:				ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].gl = 1;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 64
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 64
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
line 1039
;1039:			}
line 1040
;1040:		}
ADDRGP4 $471
JUMPV
LABELV $470
line 1041
;1041:		else {
line 1042
;1042:			if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].lasersight )
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 48
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
CNSTI4 808
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $478
line 1043
;1043:				ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].lasersight = 0;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 52
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $479
JUMPV
LABELV $478
line 1044
;1044:			else if ( ent->client->pers.nsPC.accuracy >= 4 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
CNSTI4 4
LTI4 $480
line 1045
;1045:				ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].lasersight = 1;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 56
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 1
ASGNI4
LABELV $480
LABELV $479
line 1046
;1046:		}
LABELV $471
line 1048
;1047:
;1048:		NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1049
;1049:		break;
ADDRGP4 $444
JUMPV
LABELV $482
line 1052
;1050:		}
;1051:	case 6: // bayonet
;1052:		if ( ! ( BG_WeaponMods(ent->client->pers.nsInven.primaryweapon ) & ( 1 << WM_BAYONET ) ) )			
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $483
line 1053
;1053:		{
line 1054
;1054:			NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1055
;1055:			return;
ADDRGP4 $442
JUMPV
LABELV $483
line 1057
;1056:		}
;1057:		if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet )
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 40
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 40
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
line 1058
;1058:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet = 0;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 44
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 44
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $486
JUMPV
LABELV $485
line 1059
;1059:		else if ( ent->client->pers.nsPC.strength >= 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 4
LTI4 $487
line 1061
;1060:			// disable GL with bayonet... causes trouble
;1061:			if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].gl )
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 48
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $489
line 1062
;1062:				ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].gl = 0;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 52
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
LABELV $489
line 1064
;1063:			
;1064:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.primaryweapon].bayonet = 1;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 56
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 1065
;1065:		}
LABELV $487
LABELV $486
line 1066
;1066:		NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1067
;1067:		break;
ADDRGP4 $444
JUMPV
LABELV $491
line 1069
;1068:	case 7: // silencer
;1069:		if ( ! ( BG_WeaponMods(ent->client->pers.nsInven.secondaryweapon ) & ( 1 << WM_SILENCER ) ) )			
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $492
line 1070
;1070:		{
line 1071
;1071:			NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1072
;1072:			return;
ADDRGP4 $442
JUMPV
LABELV $492
line 1074
;1073:		}
;1074:		if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].silencer )
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 52
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $494
line 1075
;1075:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].silencer = 0;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 56
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $495
JUMPV
LABELV $494
line 1076
;1076:		else if ( ent->client->pers.nsPC.stealth >= 3 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 3
LTI4 $496
line 1077
;1077:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].silencer = 1;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 60
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 60
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
LABELV $496
LABELV $495
line 1079
;1078:
;1079:		NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1080
;1080:		break;
ADDRGP4 $444
JUMPV
LABELV $498
line 1082
;1081:	case 8: // laser
;1082:		if ( ! ( BG_WeaponMods(ent->client->pers.nsInven.secondaryweapon ) & ( 1 << WM_LASER ) ) )			
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $499
line 1083
;1083:		{
line 1084
;1084:			NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1085
;1085:			return;
ADDRGP4 $442
JUMPV
LABELV $499
line 1087
;1086:		}
;1087:		if ( ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].lasersight )
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 68
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 68
INDIRP4
CNSTI4 808
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $501
line 1088
;1088:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].lasersight = 0;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 72
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 72
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $502
JUMPV
LABELV $501
line 1089
;1089:		else if ( ent->client->pers.nsPC.accuracy >= 3 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
CNSTI4 3
LTI4 $503
line 1090
;1090:			ent->client->pers.nsInven.weapon_mods[ent->client->pers.nsInven.secondaryweapon].lasersight = 1;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 28
ADDRLP4 76
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRLP4 76
INDIRP4
CNSTI4 808
ADDP4
ADDP4
CNSTI4 1
ASGNI4
LABELV $503
LABELV $502
line 1092
;1091:
;1092:		NS_OpenEquipmentMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1093
;1093:		break;
ADDRGP4 $444
JUMPV
LABELV $505
line 1096
;1094:
;1095:	case 9:
;1096:		NS_OpenMainMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 1098
;1097:	default:
;1098:		break;
LABELV $444
line 1100
;1099:	}
;1100:}
LABELV $442
endproc NS_HandleEquipmentMenu 80 4
export NS_OpenCharacterMenu
proc NS_OpenCharacterMenu 516 36
line 1109
;1101:
;1102:
;1103:/*
;1104:====================================
;1105:	View Character
;1106:====================================
;1107:*/
;1108:void NS_OpenCharacterMenu ( gentity_t *ent )
;1109:{
line 1112
;1110:	char character_menu[512];
;1111:	
;1112:	Com_sprintf( character_menu, sizeof ( character_menu ), "\"Here you can view your character\"  \"Experience Points : %i\" \"?\" \"Strength: %i\" \"Speed: %i\" \"Stamina: %i\" \"Accuracy: %i\" \"Stealth: %i\" \" \" \"1. Exit\" ", ent->client->pers.nsPC.xp,ent->client->pers.nsPC.strength,ent->client->pers.nsPC.speed,ent->client->pers.nsPC.stamina,ent->client->pers.nsPC.accuracy,ent->client->pers.nsPC.stealth );
ADDRLP4 0
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $509
ARGP4
ADDRLP4 512
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 512
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1114
;1113:
;1114:	NS_Menu(ent,character_menu,SLOTS_CHARACTER, MENU_CHARACTER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 1115
;1115:}
LABELV $508
endproc NS_OpenCharacterMenu 516 36
export NS_HandleCharacterMenu
proc NS_HandleCharacterMenu 0 4
line 1118
;1116:
;1117:void NS_HandleCharacterMenu ( gentity_t *ent, int menuSlot )
;1118:{
line 1119
;1119:	switch (menuSlot) {
ADDRFP4 4
INDIRI4
CNSTI4 1
EQI4 $513
ADDRGP4 $512
JUMPV
LABELV $513
line 1121
;1120:	case 1:
;1121:		NS_OpenMainMenu( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenMainMenu
CALLV
pop
line 1122
;1122:		break;
line 1124
;1123:	default:
;1124:		break;
LABELV $512
line 1126
;1125:	}
;1126:}
LABELV $510
endproc NS_HandleCharacterMenu 0 4
export NS_OpenMainMenu
proc NS_OpenMainMenu 8 16
line 1135
;1127:
;1128:
;1129:/*
;1130:====================================
;1131:	Main Menu (select weaps/ammo/equip)
;1132:====================================
;1133:*/
;1134:void NS_OpenMainMenu ( gentity_t *ent )
;1135:{
line 1136
;1136:	char *main_menu = "\"Please Choose:\" \"?\" \"1. Primary Weapon\" \"2. Secondary Weapon\" \"3. Ammunition\" \"4. Equipment\" \"5. Modify Character Details\" \"6. Player Style\" \" \" \"7. Exit\"";
ADDRLP4 0
ADDRGP4 $515
ASGNP4
line 1138
;1137:
;1138:	if ( g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $516
line 1139
;1139:	{ 
line 1140
;1140:		return;
ADDRGP4 $514
JUMPV
LABELV $516
line 1142
;1141:	}
;1142:	if (ent->client->sess.sessionTeam != TEAM_RED && ent->client->sess.sessionTeam != TEAM_BLUE)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $519
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $519
line 1143
;1143:		return;
ADDRGP4 $514
JUMPV
LABELV $519
line 1145
;1144:
;1145:	NS_Menu(ent,main_menu,SLOTS_MAIN, MENU_MAIN);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 1146
;1146:}
LABELV $514
endproc NS_OpenMainMenu 8 16
export NS_HandleMainMenu
proc NS_HandleMainMenu 4 4
line 1149
;1147:
;1148:void NS_HandleMainMenu ( gentity_t *ent, int menuSlot )
;1149:{
line 1150
;1150:	switch (menuSlot) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $523
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $523
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $530-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $530
address $524
address $525
address $526
address $527
address $528
address $529
code
LABELV $524
line 1152
;1151:	case 1: // 1st weapon
;1152:		NS_OpenPrimaryWeaponMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPrimaryWeaponMenu
CALLV
pop
line 1153
;1153:		break;
ADDRGP4 $523
JUMPV
LABELV $525
line 1155
;1154:	case 2: // 2nd weapon
;1155:		NS_OpenSecondaryWeaponMenu(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenSecondaryWeaponMenu
CALLV
pop
line 1156
;1156:		break;
ADDRGP4 $523
JUMPV
LABELV $526
line 1158
;1157:	case 3: // ammo
;1158:		NS_OpenAmmoMenu(ent); // !fixme
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenAmmoMenu
CALLV
pop
line 1159
;1159:		break;
ADDRGP4 $523
JUMPV
LABELV $527
line 1161
;1160:	case 4: // equipment
;1161:		NS_OpenEquipmentMenu(ent); // !fixme
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenEquipmentMenu
CALLV
pop
line 1162
;1162:		break;
ADDRGP4 $523
JUMPV
LABELV $528
line 1164
;1163:	case 5: // character view
;1164:		NS_OpenCreateClassMenu(ent); // !fixme
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenCreateClassMenu
CALLV
pop
line 1165
;1165:		break;
ADDRGP4 $523
JUMPV
LABELV $529
line 1167
;1166:	case 6: // exit
;1167:		NS_OpenPlayerMenu(ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_OpenPlayerMenu
CALLV
pop
line 1168
;1168:		break;
line 1170
;1169:	default:
;1170:		break;
LABELV $523
line 1172
;1171:	}
;1172:}
LABELV $521
endproc NS_HandleMainMenu 4 4
export NS_OpenSpectatorMenu
proc NS_OpenSpectatorMenu 4 16
line 1181
;1173:
;1174:/*
;1175:====================================
;1176:	Spectator Menu
;1177:====================================
;1178:*/
;1179:
;1180:void NS_OpenSpectatorMenu ( gentity_t *ent )
;1181:{
line 1182
;1182:	char *spectator_menu = "\"#You are spectating!\" \"Remember that you can only chat with other spectators!\" \"Press your Attack key to open the Join menu again\" \" \"???\"1. Exit\"";
ADDRLP4 0
ADDRGP4 $533
ASGNP4
line 1184
;1183:
;1184:	NS_Menu(ent,spectator_menu,SLOTS_SPECTATOR, MENU_SPECTATOR);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 NS_Menu
CALLV
pop
line 1185
;1185:}
LABELV $532
endproc NS_OpenSpectatorMenu 4 16
export NS_GetNameForClass
proc NS_GetNameForClass 8 0
line 1189
;1186:
;1187:
;1188:char* NS_GetNameForClass ( int class_num )
;1189:{
line 1192
;1190:	char *classname;
;1191:
;1192:	switch (class_num) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $535
ADDRLP4 4
INDIRI4
CNSTI4 7
GTI4 $535
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $554
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $554
address $551
address $537
address $539
address $541
address $543
address $545
address $547
address $549
code
LABELV $537
line 1194
;1193:	case CLASS_RECON:
;1194:		classname = "Recon";
ADDRLP4 0
ADDRGP4 $538
ASGNP4
line 1195
;1195:		break;
ADDRGP4 $536
JUMPV
LABELV $539
line 1197
;1196:	case CLASS_ASSAULT:
;1197:		classname = "Assault";
ADDRLP4 0
ADDRGP4 $540
ASGNP4
line 1198
;1198:		break;
ADDRGP4 $536
JUMPV
LABELV $541
line 1200
;1199:	case CLASS_COMMANDER:
;1200:		classname = "Commander";
ADDRLP4 0
ADDRGP4 $542
ASGNP4
line 1201
;1201:		break;
ADDRGP4 $536
JUMPV
LABELV $543
line 1203
;1202:	case CLASS_HEAVYSUPPORT:
;1203:		classname = "Heavy Support";
ADDRLP4 0
ADDRGP4 $544
ASGNP4
line 1204
;1204:		break;
ADDRGP4 $536
JUMPV
LABELV $545
line 1206
;1205:	case CLASS_SNIPER:
;1206:		classname = "Sniper";
ADDRLP4 0
ADDRGP4 $546
ASGNP4
line 1207
;1207:		break;
ADDRGP4 $536
JUMPV
LABELV $547
line 1209
;1208:	case CLASS_DEMOMAN:
;1209:		classname = "Demolishions Expert";
ADDRLP4 0
ADDRGP4 $548
ASGNP4
line 1210
;1210:		break;
ADDRGP4 $536
JUMPV
LABELV $549
line 1212
;1211:	case CLASS_CUSTOM:
;1212:		classname = "Custom Class";
ADDRLP4 0
ADDRGP4 $550
ASGNP4
line 1213
;1213:		break;
ADDRGP4 $536
JUMPV
LABELV $551
line 1215
;1214:	case CLASS_NONE:
;1215:		classname = "no class";
ADDRLP4 0
ADDRGP4 $552
ASGNP4
line 1216
;1216:		break;
ADDRGP4 $536
JUMPV
LABELV $535
line 1218
;1217:	default:
;1218:		classname = "UNKNOWN";
ADDRLP4 0
ADDRGP4 $553
ASGNP4
line 1219
;1219:		break;			
LABELV $536
line 1221
;1220:	}
;1221:	return classname;
ADDRLP4 0
INDIRP4
RETP4
LABELV $534
endproc NS_GetNameForClass 8 0
export SetClass
proc SetClass 88 12
line 1225
;1222:}
;1223:
;1224:void SetClass ( gentity_t *ent, int des_class ) 
;1225:{
line 1229
;1226:	gitem_t *pri,*sec;
;1227:
;1228:
;1229:	switch (des_class) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $556
ADDRLP4 8
INDIRI4
CNSTI4 7
GTI4 $556
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $608
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $608
address $597
address $558
address $563
address $568
address $573
address $578
address $583
address $586
code
LABELV $558
line 1232
;1230:	case CLASS_RECON:	
;1231:		// set playerclass
;1232:		ent->client->pers.nsPC.stealth = 3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 3
ASGNI4
line 1233
;1233:		ent->client->pers.nsPC.strength = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 1234
;1234:		NS_GiveXP( ent, 666, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 666
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 1235
;1235:		ent->client->pers.nsPC.stamina = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 2
ASGNI4
line 1236
;1236:		ent->client->pers.nsPC.speed = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 2
ASGNI4
line 1237
;1237:		ent->client->pers.nsPC.accuracy = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 1
ASGNI4
line 1238
;1238:		ent->client->pers.nsPC.technical = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 2
ASGNI4
line 1239
;1239:		ent->client->pers.nsPC.playerclass = CLASS_RECON;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 1
ASGNI4
line 1243
;1240:		// set inventory
;1241:
;1242:		// primary weapon
;1243:		if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $559
line 1244
;1244:			ent->client->pers.nsInven.primaryweapon = WP_MP5;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 14
ASGNI4
ADDRGP4 $560
JUMPV
LABELV $559
line 1246
;1245:		else
;1246:			ent->client->pers.nsInven.primaryweapon = WP_MAC10;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 13
ASGNI4
LABELV $560
line 1249
;1247:
;1248:		// secondary
;1249:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $561
line 1250
;1250:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
ADDRGP4 $562
JUMPV
LABELV $561
line 1252
;1251:		else
;1252:			ent->client->pers.nsInven.secondaryweapon = WP_MK23;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 6
ASGNI4
LABELV $562
line 1254
;1253:
;1254:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1255
;1255:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1258
;1256:
;1257:	
;1258:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 6;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 6
ASGNI4
line 1259
;1259:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 3;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 1262
;1260:
;1261:		// powerups
;1262:		ent->client->pers.nsInven.powerups[PW_VEST] = ARMOR_LIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 1
ASGNI4
line 1263
;1263:		ent->client->pers.nsInven.powerups[PW_HELMET] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 0
ASGNI4
line 1264
;1264:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1265
;1265:		break;
ADDRGP4 $557
JUMPV
LABELV $563
line 1267
;1266:	case CLASS_ASSAULT:
;1267:		ent->client->pers.nsPC.stealth = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 2
ASGNI4
line 1268
;1268:		ent->client->pers.nsPC.strength = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 2
ASGNI4
line 1269
;1269:		ent->client->pers.nsPC.stamina = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 2
ASGNI4
line 1270
;1270:		ent->client->pers.nsPC.speed = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 2
ASGNI4
line 1271
;1271:		ent->client->pers.nsPC.accuracy = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 2
ASGNI4
line 1272
;1272:		ent->client->pers.nsPC.technical = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 1
ASGNI4
line 1273
;1273:		ent->client->pers.nsPC.playerclass = CLASS_ASSAULT;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 2
ASGNI4
line 1274
;1274:		NS_GiveXP( ent, 666, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 666
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 1276
;1275:		// set inventory
;1276:		if ( ent->client->sess.sessionTeam == TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $564
line 1277
;1277:			ent->client->pers.nsInven.primaryweapon = WP_MP5;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 14
ASGNI4
ADDRGP4 $565
JUMPV
LABELV $564
line 1279
;1278:		else
;1279:			ent->client->pers.nsInven.primaryweapon = WP_MAC10;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 13
ASGNI4
LABELV $565
line 1282
;1280:
;1281:		// give ammo
;1282:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1285
;1283:
;1284:		// secondary
;1285:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $566
line 1286
;1286:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
ADDRGP4 $567
JUMPV
LABELV $566
line 1288
;1287:		else
;1288:			ent->client->pers.nsInven.secondaryweapon = WP_MK23;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 6
ASGNI4
LABELV $567
line 1290
;1289:
;1290:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1291
;1291:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 1294
;1292:
;1293:	
;1294:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 6;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 6
ASGNI4
line 1295
;1295:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 3;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 1298
;1296:
;1297:		// powerups
;1298:		ent->client->pers.nsInven.powerups[PW_VEST] = ARMOR_MEDIUM;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 2
ASGNI4
line 1299
;1299:		ent->client->pers.nsInven.powerups[PW_HELMET] = ARMOR_LIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 1
ASGNI4
line 1300
;1300:		break;
ADDRGP4 $557
JUMPV
LABELV $568
line 1302
;1301:	case CLASS_COMMANDER:
;1302:		ent->client->pers.nsPC.stealth = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 1
ASGNI4
line 1303
;1303:		ent->client->pers.nsPC.strength = 3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 3
ASGNI4
line 1304
;1304:		ent->client->pers.nsPC.stamina = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 2
ASGNI4
line 1305
;1305:		ent->client->pers.nsPC.speed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 1
ASGNI4
line 1306
;1306:		ent->client->pers.nsPC.accuracy = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 2
ASGNI4
line 1307
;1307:		ent->client->pers.nsPC.technical = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 2
ASGNI4
line 1308
;1308:		NS_GiveXP( ent, 666, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 666
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 1309
;1309:		ent->client->pers.nsPC.playerclass = CLASS_COMMANDER;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 3
ASGNI4
line 1313
;1310:		// set inventory
;1311:
;1312:		// primary weapon
;1313:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $569
line 1314
;1314:			ent->client->pers.nsInven.primaryweapon = WP_AK47;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 15
ASGNI4
ADDRGP4 $570
JUMPV
LABELV $569
line 1316
;1315:		else
;1316:			ent->client->pers.nsInven.primaryweapon = WP_M4;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 16
ASGNI4
LABELV $570
line 1319
;1317:
;1318:		// secondary
;1319:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $571
line 1320
;1320:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
ADDRGP4 $572
JUMPV
LABELV $571
line 1322
;1321:		else
;1322:			ent->client->pers.nsInven.secondaryweapon = WP_MK23;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 6
ASGNI4
LABELV $572
line 1324
;1323:
;1324:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1325
;1325:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 1327
;1326:	
;1327:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 6;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 6
ASGNI4
line 1328
;1328:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 3;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 1331
;1329:
;1330:		// powerups
;1331:		ent->client->pers.nsInven.powerups[PW_VEST] = ARMOR_HEAVY;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 3
ASGNI4
line 1332
;1332:		ent->client->pers.nsInven.powerups[PW_HELMET] = ARMOR_LIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 1
ASGNI4
line 1333
;1333:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1334
;1334:		break;	
ADDRGP4 $557
JUMPV
LABELV $573
line 1336
;1335:	case CLASS_HEAVYSUPPORT:
;1336:		ent->client->pers.nsPC.stealth = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 1
ASGNI4
line 1337
;1337:		ent->client->pers.nsPC.strength = 3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 3
ASGNI4
line 1338
;1338:		ent->client->pers.nsPC.stamina = 3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 3
ASGNI4
line 1339
;1339:		ent->client->pers.nsPC.speed = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 2
ASGNI4
line 1340
;1340:		ent->client->pers.nsPC.accuracy = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 2
ASGNI4
line 1341
;1341:		ent->client->pers.nsPC.technical = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 2
ASGNI4
line 1342
;1342:		NS_GiveXP( ent, 666, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 666
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 1343
;1343:		ent->client->pers.nsPC.playerclass = CLASS_HEAVYSUPPORT;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 4
ASGNI4
line 1348
;1344:
;1345:		// set inventory
;1346:
;1347:		// primary weapon
;1348:		if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $574
line 1349
;1349:			ent->client->pers.nsInven.primaryweapon = WP_M4;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $575
JUMPV
LABELV $574
line 1351
;1350:		else
;1351:			ent->client->pers.nsInven.primaryweapon = WP_AK47;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 15
ASGNI4
LABELV $575
line 1354
;1352:
;1353:		// secondary
;1354:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $576
line 1355
;1355:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
ADDRGP4 $577
JUMPV
LABELV $576
line 1357
;1356:		else
;1357:			ent->client->pers.nsInven.secondaryweapon = WP_MK23;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 6
ASGNI4
LABELV $577
line 1359
;1358:
;1359:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 1360
;1360:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 40
INDIRP4
ASGNP4
line 1363
;1361:	
;1362:		
;1363:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 5;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 5
ASGNI4
line 1364
;1364:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 4;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 4
ASGNI4
line 1367
;1365:
;1366:		// powerups
;1367:		ent->client->pers.nsInven.powerups[PW_VEST] = ARMOR_HEAVY;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 3
ASGNI4
line 1368
;1368:		ent->client->pers.nsInven.powerups[PW_HELMET] = ARMOR_LIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 1
ASGNI4
line 1369
;1369:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1370
;1370:		break;
ADDRGP4 $557
JUMPV
LABELV $578
line 1372
;1371:	case CLASS_SNIPER:
;1372:		ent->client->pers.nsPC.stealth = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 2
ASGNI4
line 1373
;1373:		ent->client->pers.nsPC.strength = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 1374
;1374:		ent->client->pers.nsPC.stamina = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 1
ASGNI4
line 1375
;1375:		ent->client->pers.nsPC.speed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 1
ASGNI4
line 1376
;1376:		ent->client->pers.nsPC.accuracy = 4;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 4
ASGNI4
line 1377
;1377:		ent->client->pers.nsPC.technical = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 2
ASGNI4
line 1378
;1378:		NS_GiveXP( ent, 666, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 666
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 1379
;1379:		ent->client->pers.nsPC.playerclass = CLASS_SNIPER;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 5
ASGNI4
line 1380
;1380:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1384
;1381:		// set inventory
;1382:
;1383:		// primary weapon
;1384:		if ( ent->client->sess.sessionTeam == TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $579
line 1385
;1385:			ent->client->pers.nsInven.primaryweapon = WP_MP5;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 14
ASGNI4
ADDRGP4 $580
JUMPV
LABELV $579
line 1387
;1386:		else
;1387:			ent->client->pers.nsInven.primaryweapon = WP_MAC10;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 13
ASGNI4
LABELV $580
line 1390
;1388:
;1389:		// secondary
;1390:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $581
line 1391
;1391:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
ADDRGP4 $582
JUMPV
LABELV $581
line 1393
;1392:		else
;1393:			ent->client->pers.nsInven.secondaryweapon = WP_P9S;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 9
ASGNI4
LABELV $582
line 1395
;1394:
;1395:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
line 1396
;1396:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
ASGNP4
line 1398
;1397:	
;1398:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 6;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 6
ASGNI4
line 1399
;1399:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 2;
ADDRLP4 52
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 1402
;1400:
;1401:		// powerups
;1402:		ent->client->pers.nsInven.powerups[PW_VEST] = ARMOR_MEDIUM;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 2
ASGNI4
line 1403
;1403:		ent->client->pers.nsInven.powerups[PW_HELMET] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 0
ASGNI4
line 1404
;1404:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1405
;1405:		break;
ADDRGP4 $557
JUMPV
LABELV $583
line 1407
;1406:	case CLASS_DEMOMAN:
;1407:		ent->client->pers.nsPC.stealth = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 2
ASGNI4
line 1408
;1408:		ent->client->pers.nsPC.strength = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 2
ASGNI4
line 1409
;1409:		ent->client->pers.nsPC.stamina = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 2
ASGNI4
line 1410
;1410:		ent->client->pers.nsPC.speed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 1
ASGNI4
line 1411
;1411:		ent->client->pers.nsPC.accuracy = 2;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 2
ASGNI4
line 1412
;1412:		ent->client->pers.nsPC.technical = 3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 3
ASGNI4
line 1413
;1413:		ent->client->pers.nsPC.playerclass = CLASS_DEMOMAN;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 6
ASGNI4
line 1414
;1414:		NS_GiveXP( ent, 666, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 666
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
line 1422
;1415:
;1416:		// set inventory
;1417:
;1418:		// secondary 
;1419:		
;1420:
;1421:		// primary weapon	
;1422:		if ( ent->client->sess.sessionTeam == TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $584
line 1423
;1423:		{
line 1424
;1424:			ent->client->pers.nsInven.primaryweapon = WP_870;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 19
ASGNI4
line 1425
;1425:			ent->client->pers.nsInven.secondaryweapon = WP_MK23;  
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 6
ASGNI4
line 1426
;1426:		}
ADDRGP4 $585
JUMPV
LABELV $584
line 1428
;1427:		else
;1428:		{
line 1429
;1429:			ent->client->pers.nsInven.primaryweapon = WP_M590;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 20
ASGNI4
line 1430
;1430:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK; 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
line 1431
;1431:		}
LABELV $585
line 1434
;1432:
;1433:		
;1434:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1436
;1435:
;1436:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 1437
;1437:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 60
INDIRP4
ASGNP4
line 1439
;1438:	
;1439:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 6;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 6
ASGNI4
line 1440
;1440:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 3;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 1443
;1441:
;1442:		// powerups
;1443:		ent->client->pers.nsInven.powerups[PW_VEST] = ARMOR_MEDIUM;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 2
ASGNI4
line 1444
;1444:		ent->client->pers.nsInven.powerups[PW_HELMET] = ARMOR_LIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 1
ASGNI4
line 1446
;1445:
;1446:		break;
ADDRGP4 $557
JUMPV
LABELV $586
line 1448
;1447:	case CLASS_CUSTOM:
;1448:		ent->client->pers.nsPC.xp = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 1449
;1449:		ent->client->pers.nsPC.entire_xp = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1568
ADDP4
CNSTI4 0
ASGNI4
line 1452
;1450:
;1451:		// and we will reset all these values
;1452:		ent->client->pers.nsPC.stealth = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 1
ASGNI4
line 1453
;1453:		ent->client->pers.nsPC.strength = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 1454
;1454:		ent->client->pers.nsPC.stamina = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 1
ASGNI4
line 1455
;1455:		ent->client->pers.nsPC.speed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 1
ASGNI4
line 1456
;1456:		ent->client->pers.nsPC.accuracy = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 1
ASGNI4
line 1457
;1457:		ent->client->pers.nsPC.technical = 1;  
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 1
ASGNI4
line 1459
;1458: 
;1459:		if ( g_matchLockXP.integer )
ADDRGP4 g_matchLockXP+12
INDIRI4
CNSTI4 0
EQI4 $587
line 1460
;1460:		{
line 1461
;1461:			ent->client->pers.nsPC.stealth = 
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
ADDRGP4 g_matchLockXP+12
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 1536
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 1556
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 1552
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 1548
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 1540
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 1544
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 1468
;1462:			ent->client->pers.nsPC.strength = 
;1463:			ent->client->pers.nsPC.stamina =
;1464:			ent->client->pers.nsPC.speed = 
;1465:			ent->client->pers.nsPC.accuracy = 
;1466:			ent->client->pers.nsPC.technical = g_matchLockXP.integer;
;1467:
;1468:			if ( ent->client->pers.nsPC.stealth > 5 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 5
LEI4 $588
line 1469
;1469:				ent->client->pers.nsPC.stealth = 5;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 5
ASGNI4
line 1470
;1470:		} else 		// we will give him  xp 
ADDRGP4 $588
JUMPV
LABELV $587
line 1471
;1471:			NS_GiveXP( ent, NS_CalculateStartingXP( ent->client->sess.sessionTeam ) , qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 NS_CalculateStartingXP
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
LABELV $588
line 1475
;1472:
;1473:
;1474:		// primary weapon
;1475:		if ( ent->client->sess.sessionTeam == TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $593
line 1476
;1476:			ent->client->pers.nsInven.primaryweapon = WP_MAC10;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 13
ASGNI4
ADDRGP4 $594
JUMPV
LABELV $593
line 1478
;1477:		else
;1478:			ent->client->pers.nsInven.primaryweapon = WP_MP5;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 14
ASGNI4
LABELV $594
line 1481
;1479:
;1480:		// secondary
;1481:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $595
line 1482
;1482:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
ADDRGP4 $596
JUMPV
LABELV $595
line 1484
;1483:		else
;1484:			ent->client->pers.nsInven.secondaryweapon = WP_P9S;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 9
ASGNI4
LABELV $596
line 1486
;1485:
;1486:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1488
;1487:
;1488:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 1489
;1489:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 72
INDIRP4
ASGNP4
line 1491
;1490:	
;1491:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 4;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 4
ASGNI4
line 1492
;1492:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 4;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 4
ASGNI4
line 1493
;1493:		ent->client->pers.nsInven.ammo[AM_GRENADES] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 1
ASGNI4
line 1494
;1494:		ent->client->pers.nsInven.ammo[AM_FLASHBANGS] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 1
ASGNI4
line 1497
;1495:
;1496:		// powerups
;1497:		ent->client->pers.nsInven.powerups[PW_VEST] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 1
ASGNI4
line 1498
;1498:		ent->client->pers.nsInven.powerups[PW_HELMET] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 0
ASGNI4
line 1500
;1499:
;1500:		ent->client->pers.nsPC.playerclass = CLASS_CUSTOM;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 7
ASGNI4
line 1501
;1501:		break;
ADDRGP4 $557
JUMPV
LABELV $597
LABELV $556
line 1504
;1502:	case CLASS_NONE: // this is more or less the same as custom - except you don't get any XPs at all
;1503:	default:
;1504:		ent->client->pers.nsPC.xp = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 1505
;1505:		ent->client->pers.nsPC.entire_xp = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1568
ADDP4
CNSTI4 0
ASGNI4
line 1509
;1506:		// we will give him  xp 
;1507:
;1508:		// and we will reset all these values
;1509:		ent->client->pers.nsPC.stealth = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 1
ASGNI4
line 1510
;1510:		ent->client->pers.nsPC.strength = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 1511
;1511:		ent->client->pers.nsPC.stamina = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 1
ASGNI4
line 1512
;1512:		ent->client->pers.nsPC.speed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 1
ASGNI4
line 1513
;1513:		ent->client->pers.nsPC.accuracy = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 1
ASGNI4
line 1514
;1514:		ent->client->pers.nsPC.technical = 1;  
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 1
ASGNI4
line 1516
;1515:
;1516: 		if ( g_matchLockXP.integer )
ADDRGP4 g_matchLockXP+12
INDIRI4
CNSTI4 0
EQI4 $598
line 1517
;1517:		{
line 1518
;1518:			ent->client->pers.nsPC.stealth =
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRGP4 g_matchLockXP+12
INDIRI4
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 1536
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 1556
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 1552
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 1548
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 1540
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 1544
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 1525
;1519:			ent->client->pers.nsPC.strength = 
;1520:			ent->client->pers.nsPC.stamina =
;1521:			ent->client->pers.nsPC.speed = 
;1522:			ent->client->pers.nsPC.accuracy = 
;1523:			ent->client->pers.nsPC.technical = g_matchLockXP.integer;
;1524:
;1525:			if ( ent->client->pers.nsPC.stealth > 5 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 5
LEI4 $599
line 1526
;1526:				ent->client->pers.nsPC.stealth = 5;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 5
ASGNI4
line 1527
;1527:		} else 		// we will give him  xp 
ADDRGP4 $599
JUMPV
LABELV $598
line 1528
;1528:			NS_GiveXP( ent, NS_CalculateStartingXP( ent->client->sess.sessionTeam ) , qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 NS_CalculateStartingXP
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
LABELV $599
line 1532
;1529:
;1530:
;1531:		// primary weapon
;1532:		if ( ent->client->sess.sessionTeam == TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $604
line 1533
;1533:			ent->client->pers.nsInven.primaryweapon = WP_MAC10;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 13
ASGNI4
ADDRGP4 $605
JUMPV
LABELV $604
line 1535
;1534:		else
;1535:			ent->client->pers.nsInven.primaryweapon = WP_MP5;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 14
ASGNI4
LABELV $605
line 1538
;1536:
;1537:		// secondary
;1538:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $606
line 1539
;1539:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
ADDRGP4 $607
JUMPV
LABELV $606
line 1541
;1540:		else
;1541:			ent->client->pers.nsInven.secondaryweapon = WP_P9S;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 9
ASGNI4
LABELV $607
line 1542
;1542:		ent->client->pers.nsPC.style = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1544
;1543:
;1544:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
ASGNP4
line 1545
;1545:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRP4
ASGNP4
line 1547
;1546:	
;1547:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 4;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 4
ASGNI4
line 1548
;1548:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 4;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 4
ASGNI4
line 1551
;1549:
;1550:		// powerups
;1551:		ent->client->pers.nsInven.powerups[PW_VEST] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 1
ASGNI4
line 1552
;1552:		ent->client->pers.nsInven.powerups[PW_HELMET] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 0
ASGNI4
line 1554
;1553:
;1554:		ent->client->pers.nsPC.playerclass = CLASS_CUSTOM;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 7
ASGNI4
line 1555
;1555:		break;			
LABELV $557
line 1559
;1556:	}
;1557:
;1558:	// update character if anything changed - so knows about any changes
;1559:	if ( ent->client->ps.persistant[PERS_STRENGTH] != ent->client->pers.nsPC.strength )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
EQI4 $609
line 1560
;1560:		ent->client->ps.persistant[PERS_STRENGTH] = ent->client->pers.nsPC.strength;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 272
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ASGNI4
LABELV $609
line 1562
;1561:
;1562:	if ( ent->client->ps.persistant[PERS_TECHNICAL] != ent->client->pers.nsPC.technical )
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
EQI4 $611
line 1563
;1563:		ent->client->ps.persistant[PERS_TECHNICAL] = ent->client->pers.nsPC.technical;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ASGNI4
LABELV $611
line 1565
;1564:
;1565:	if ( ent->client->ps.persistant[PERS_STAMINA] != ent->client->pers.nsPC.stamina )
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
EQI4 $613
line 1566
;1566:		ent->client->ps.persistant[PERS_STAMINA] = ent->client->pers.nsPC.stamina;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ASGNI4
LABELV $613
line 1568
;1567:
;1568:	if ( ent->client->ps.persistant[PERS_SPEED] != ent->client->pers.nsPC.speed )
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
EQI4 $615
line 1569
;1569:		ent->client->ps.persistant[PERS_SPEED] = ent->client->pers.nsPC.speed;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 288
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ASGNI4
LABELV $615
line 1571
;1570:
;1571:	if ( ent->client->ps.persistant[PERS_STEALTH] != ent->client->pers.nsPC.stealth )
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
EQI4 $617
line 1572
;1572:		ent->client->ps.persistant[PERS_STEALTH] = ent->client->pers.nsPC.stealth;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ASGNI4
LABELV $617
line 1574
;1573:
;1574:	if ( ent->client->ps.persistant[PERS_ACCURACY] != ent->client->pers.nsPC.accuracy )
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
EQI4 $619
line 1575
;1575:		ent->client->ps.persistant[PERS_ACCURACY] = ent->client->pers.nsPC.accuracy;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ASGNI4
LABELV $619
line 1578
;1576:
;1577:	// send xp
;1578:	trap_SendServerCommand( ent-g_entities, va("uxp %i", ent->client->pers.nsPC.xp ) );
ADDRGP4 $621
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1108
DIVI4
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1579
;1579:}
LABELV $555
endproc SetClass 88 12
export NS_DirectMenuSelect
proc NS_DirectMenuSelect 1048 12
line 1590
;1580:
;1581:/*
;1582:=================
;1583:NSQ3 Direct Menuselect
;1584:author: Defcon-X
;1585:date: 24-08-2000
;1586:description: directly selects a menu.
;1587:================= 
;1588:*/
;1589:void NS_DirectMenuSelect( gentity_t *ent )
;1590:{
line 1594
;1591:	char	str[MAX_TOKEN_CHARS];
;1592: 	int		menu,menuSlot;
;1593:
;1594:	if ( trap_Argc () < 2 ) {
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 2
GEI4 $623
line 1595
;1595:		PrintMsg( ent, "Usage:\ncmd dms <menunum> <slotnum>\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $625
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1596
;1596:		return;
ADDRGP4 $622
JUMPV
LABELV $623
line 1599
;1597:	} 
;1598:
;1599:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1600
;1600:	menu = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1602
;1601:
;1602:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1603
;1603:	menuSlot = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1040
INDIRI4
ASGNI4
line 1605
;1604:	
;1605:	if (!menu || !menuSlot) {
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1044
INDIRI4
EQI4 $628
ADDRLP4 1028
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $626
LABELV $628
line 1606
;1606:		PrintMsg( ent, "Usage:\ncmd dms <menunum> <slotnum>\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $625
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1607
;1607:		return;
ADDRGP4 $622
JUMPV
LABELV $626
line 1610
;1608:	}  
;1609:
;1610:	if ( menu >= MENU_MAX ) {
ADDRLP4 1024
INDIRI4
CNSTI4 13
LTI4 $629
line 1611
;1611:		PrintMsg( ent, "<menunum> out of range\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $631
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1612
;1612:		return;
ADDRGP4 $622
JUMPV
LABELV $629
line 1615
;1613:	}  
;1614:
;1615:	NS_CallMenu( ent, menu, menuSlot );	
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 NS_CallMenu
CALLV
pop
line 1616
;1616:} 
LABELV $622
endproc NS_DirectMenuSelect 1048 12
export NS_KillMenu
proc NS_KillMenu 0 0
line 1626
;1617:/*
;1618:=================
;1619:NSQ3 Kill Menu
;1620:author: Defcon-X
;1621:date: 24-08-2000
;1622:description: directly selects a menu.
;1623:================= 
;1624:*/
;1625:void NS_KillMenu( gentity_t *ent )
;1626:{
line 1628
;1627: 
;1628:}
LABELV $632
endproc NS_KillMenu 0 0
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import LTS_Rounds
import i_sCountDown
import b_sWaitingForPlayers
import i_sNextWaitPrint
import g_antilag
import g_squadAssault
import g_minPlayers
import g_testSmoke
import g_teamlockcamera
import g_shotgunleedvelocity
import g_leedvelocity
import g_teamRespawn
import g_teamXp
import g_baseXp
import g_roundTime
import g_maxTeamKill
import g_allowKnifes
import g_logradio
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import Weapon_HookThink
import CheckMeleeAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import Team_SetFlagStatus
import ElevatorReset
import NS_GetTime
import NS_RestoreHitboxes
import NS_FixHitboxes
import NS_SendMessageToTeam
import NS_InitHeadGear
import NS_GetMapName
import NS_ActiveRound
import Think_SetupTrainTargets
import NS_RecalcCharacter
import NS_ValidatePlayerLooks
import NS_CalculateRadar
import G_ApplyAntiLag
import G_UndoAntiLag
import G_UpdateClientAntiLag
import NS_FreeXP
import NS_TeamKill
import NS_GiveReward
import NS_SetClientCrosshairState
import PrintMsgToAllAlive
import NS_PlayerAnimation
import Use_BinaryMover
import Use_BinaryMover2
import CenterPrintAll
import G_Say
import PrintMsg
import BodySink
import CopyToBodyQue
import G_ExplodeMissile
import Drop_Weapon
import fire_smoke_grenade
import NS_FindRadius
import SelectTeamSpawnPoint
import pointinback
import is_func_explosive
import DoorRotating_ResetState
import TriggerToggle_ResetState
import Door_ResetState
import Think_Goal
import Touch_Goal
import Laser_Gen
import CheckTeamplay
import NS_CalcWeight
import NS_CheckEndRound
import bomb_explode
import bomb_drop
import bomb_explode_instantly
import bomb_defused
import bomb_checkremovewire
import NS_BombExistForTeam
import NS_CalcSpeed
import AliveTeamCount
import NS_CalculateStartingXP
import NS_CalcDamageOnRange
import NS_BulletHoleTypeForSurface
import NS_GotWounds
import BG_GetMaxRoundForWeapon
import NS_GetRounds
import NS_CheckLocationDamage
import BG_MaximumWeaponRange
import NS_GetAccuracy
import NS_GetPrevMap
import NS_GetNextMap
import NS_InitMapCycle
import assault_field_stopall
import NS_ModifyClientBBox
import NS_InitHeadBBoxes
import G_SetupServerInfo
import NS_RaiseCharacterLevel
import NS_PlayerInventory
import NS_SpawnFlare
import Pick_Item
import G_LocalSound
import NS_AdjustClientVWeap
import NS_Gesture
import NS_EndRoundForTeam
import NS_OpenDoor
import NS_HolsterWeapon
import Reset_Briefcase
import NS_EndRound
import NS_WeaponMode
import NS_GiveXP
import NS_WonRound
import NS_ClearInventory
import NS_RemoveItems
import NS_DropWeapon
import NS_StartBandage
import NS_Bandaging
import NS_NavySeals_ClientInit
import NS_CauseBleeding
import NS_SprayBlood
import Cmd_Reload_f
import G_RunActor
import NS_CheckRemoveTeamKill
import Fire_Lead
import BG_GotSecondary
import NS_IsVipAlive
import NS_CanShotgunBlowHead
import NS_GotPowerup
import Is_OnBrushTeam
import NS_IsBot
import Is_Spectator
import PI_CheckWeapon
import Weapon_C4
import RadioBroadcast
import Cmd_Radio_power_f
import Cmd_Radioteam_f
import RadioThink
import PrecacheRadioSounds
import Pickup_Briefcase
import NS_Itsame
import NS_TMequip
import NS_SetGameState
import lastvip
import GameState
import g_LockXP
import g_matchLockXP
import g_mapcycle
import g_firstCountdown
import g_TeamKillRemoveTime
import g_TeamScores
import g_TeamPlayers
import g_updateServerInfoTime
import g_allowTeampointlimitVote
import g_allowTimelimitVote
import g_allowKickVote
import g_allowMapVote
import g_noGrenades
import g_noSecondary
import g_noPrimary
import g_realLead
import g_silentBullets
import g_snipermod
import g_pistolmod
import g_riflemod
import g_bombTime
import g_invenTime
import g_aimCorrect
import g_overrideGoals
import g_keepCharacter
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
LABELV $631
byte 1 60
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $625
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 10
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 100
byte 1 109
byte 1 115
byte 1 32
byte 1 60
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 32
byte 1 60
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $621
byte 1 117
byte 1 120
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $553
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
align 1
LABELV $552
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $550
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $548
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 108
byte 1 105
byte 1 115
byte 1 104
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 69
byte 1 120
byte 1 112
byte 1 101
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $546
byte 1 83
byte 1 110
byte 1 105
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $544
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 83
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $542
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $540
byte 1 65
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $538
byte 1 82
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $533
byte 1 34
byte 1 35
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 33
byte 1 34
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 109
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 33
byte 1 34
byte 1 32
byte 1 34
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
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 63
byte 1 63
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $515
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 67
byte 1 104
byte 1 111
byte 1 111
byte 1 115
byte 1 101
byte 1 58
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 69
byte 1 113
byte 1 117
byte 1 105
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 34
byte 1 32
byte 1 34
byte 1 53
byte 1 46
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 34
byte 1 32
byte 1 34
byte 1 54
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 55
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $509
byte 1 34
byte 1 72
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
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
byte 1 34
byte 1 32
byte 1 32
byte 1 34
byte 1 69
byte 1 120
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 34
byte 1 83
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 34
byte 1 32
byte 1 34
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 34
byte 1 32
byte 1 34
byte 1 83
byte 1 116
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 34
byte 1 32
byte 1 34
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 34
byte 1 32
byte 1 34
byte 1 83
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 32
byte 1 0
align 1
LABELV $423
byte 1 34
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 69
byte 1 113
byte 1 117
byte 1 105
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 75
byte 1 101
byte 1 118
byte 1 108
byte 1 97
byte 1 114
byte 1 32
byte 1 86
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 72
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 83
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 83
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 53
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 83
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 32
byte 1 54
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 53
byte 1 46
byte 1 32
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
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 32
byte 1 52
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 54
byte 1 46
byte 1 32
byte 1 66
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 52
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 55
byte 1 46
byte 1 32
byte 1 83
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 83
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 51
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 32
byte 1 34
byte 1 56
byte 1 46
byte 1 32
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
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 32
byte 1 51
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 57
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 32
byte 1 0
align 1
LABELV $404
byte 1 79
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $403
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $402
byte 1 34
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 69
byte 1 113
byte 1 117
byte 1 105
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 75
byte 1 101
byte 1 118
byte 1 108
byte 1 97
byte 1 114
byte 1 32
byte 1 86
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 72
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 83
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 83
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 53
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 83
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 32
byte 1 54
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 53
byte 1 46
byte 1 32
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
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 84
byte 1 101
byte 1 99
byte 1 104
byte 1 110
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 52
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 54
byte 1 46
byte 1 32
byte 1 66
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 52
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 55
byte 1 46
byte 1 32
byte 1 83
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 83
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 51
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 32
byte 1 32
byte 1 34
byte 1 56
byte 1 46
byte 1 32
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
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 32
byte 1 51
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 34
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 57
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 32
byte 1 0
align 1
LABELV $368
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 46
byte 1 34
byte 1 34
byte 1 63
byte 1 34
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 47
byte 1 54
byte 1 41
byte 1 40
byte 1 43
byte 1 49
byte 1 41
byte 1 34
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 48
byte 1 41
byte 1 40
byte 1 43
byte 1 49
byte 1 41
byte 1 34
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 47
byte 1 51
byte 1 41
byte 1 34
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 32
byte 1 66
byte 1 97
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 47
byte 1 51
byte 1 41
byte 1 34
byte 1 34
byte 1 53
byte 1 46
byte 1 32
byte 1 52
byte 1 48
byte 1 109
byte 1 109
byte 1 32
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 47
byte 1 51
byte 1 41
byte 1 34
byte 1 34
byte 1 32
byte 1 34
byte 1 34
byte 1 54
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $364
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
byte 1 10
byte 1 0
align 1
LABELV $340
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $339
byte 1 68
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 33
byte 1 0
align 1
LABELV $337
byte 1 78
byte 1 111
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $336
byte 1 80
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 33
byte 1 0
align 1
LABELV $335
byte 1 34
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 34
byte 1 34
byte 1 32
byte 1 34
byte 1 34
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 46
byte 1 34
byte 1 34
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
byte 1 34
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 70
byte 1 97
byte 1 99
byte 1 101
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 34
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 45
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 34
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 45
byte 1 70
byte 1 97
byte 1 99
byte 1 101
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 58
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 34
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 34
byte 1 34
byte 1 32
byte 1 34
byte 1 34
byte 1 53
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $312
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $311
byte 1 74
byte 1 97
byte 1 109
byte 1 97
byte 1 108
byte 1 32
byte 1 67
byte 1 46
byte 1 0
align 1
LABELV $309
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 97
byte 1 102
byte 1 97
byte 1 32
byte 1 66
byte 1 46
byte 1 0
align 1
LABELV $303
byte 1 67
byte 1 117
byte 1 114
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 83
byte 1 46
byte 1 0
align 1
LABELV $301
byte 1 66
byte 1 114
byte 1 117
byte 1 99
byte 1 101
byte 1 32
byte 1 87
byte 1 46
byte 1 0
align 1
LABELV $294
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $291
byte 1 72
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $289
byte 1 84
byte 1 117
byte 1 114
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $287
byte 1 83
byte 1 101
byte 1 97
byte 1 108
byte 1 32
byte 1 72
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $285
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 86
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 71
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $283
byte 1 80
byte 1 105
byte 1 101
byte 1 99
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 72
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $281
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $279
byte 1 83
byte 1 116
byte 1 111
byte 1 114
byte 1 109
byte 1 32
byte 1 71
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $252
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
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
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 46
byte 1 34
byte 1 32
byte 1 9
byte 1 9
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 71
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 45
byte 1 49
byte 1 56
byte 1 32
byte 1 40
byte 1 50
byte 1 48
byte 1 32
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 41
byte 1 34
byte 1 32
byte 1 9
byte 1 9
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 83
byte 1 38
byte 1 87
byte 1 32
byte 1 52
byte 1 48
byte 1 116
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 68
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 69
byte 1 97
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 40
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 62
byte 1 32
byte 1 51
byte 1 41
byte 1 34
byte 1 9
byte 1 9
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 9
byte 1 9
byte 1 32
byte 1 34
byte 1 48
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $249
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
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
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 46
byte 1 34
byte 1 32
byte 1 9
byte 1 9
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 9
byte 1 9
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 72
byte 1 38
byte 1 75
byte 1 32
byte 1 80
byte 1 57
byte 1 115
byte 1 34
byte 1 9
byte 1 9
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 72
byte 1 38
byte 1 75
byte 1 32
byte 1 77
byte 1 107
byte 1 50
byte 1 51
byte 1 32
byte 1 83
byte 1 111
byte 1 99
byte 1 111
byte 1 109
byte 1 32
byte 1 80
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 68
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 69
byte 1 97
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 40
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 62
byte 1 32
byte 1 51
byte 1 32
byte 1 41
byte 1 34
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 9
byte 1 9
byte 1 34
byte 1 48
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $235
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 103
byte 1 111
byte 1 111
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
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
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $203
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 46
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 9
byte 1 9
byte 1 34
byte 1 48
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $202
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 65
byte 1 118
byte 1 116
byte 1 111
byte 1 109
byte 1 97
byte 1 116
byte 1 32
byte 1 75
byte 1 97
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 110
byte 1 105
byte 1 107
byte 1 111
byte 1 118
byte 1 32
byte 1 52
byte 1 55
byte 1 46
byte 1 50
byte 1 50
byte 1 51
byte 1 34
byte 1 0
align 1
LABELV $201
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 73
byte 1 110
byte 1 103
byte 1 114
byte 1 97
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 99
byte 1 45
byte 1 49
byte 1 48
byte 1 34
byte 1 0
align 1
LABELV $198
byte 1 34
byte 1 55
byte 1 46
byte 1 32
byte 1 77
byte 1 97
byte 1 99
byte 1 32
byte 1 77
byte 1 105
byte 1 108
byte 1 108
byte 1 97
byte 1 110
byte 1 32
byte 1 46
byte 1 53
byte 1 48
byte 1 32
byte 1 40
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 62
byte 1 32
byte 1 52
byte 1 32
byte 1 38
byte 1 32
byte 1 97
byte 1 99
byte 1 99
byte 1 32
byte 1 62
byte 1 32
byte 1 56
byte 1 32
byte 1 41
byte 1 34
byte 1 0
align 1
LABELV $197
byte 1 34
byte 1 54
byte 1 46
byte 1 32
byte 1 72
byte 1 101
byte 1 99
byte 1 107
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 38
byte 1 32
byte 1 75
byte 1 111
byte 1 99
byte 1 104
byte 1 32
byte 1 80
byte 1 68
byte 1 87
byte 1 32
byte 1 40
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 62
byte 1 32
byte 1 51
byte 1 32
byte 1 38
byte 1 32
byte 1 97
byte 1 99
byte 1 99
byte 1 32
byte 1 62
byte 1 32
byte 1 52
byte 1 32
byte 1 41
byte 1 34
byte 1 0
align 1
LABELV $196
byte 1 34
byte 1 53
byte 1 46
byte 1 32
byte 1 72
byte 1 101
byte 1 99
byte 1 107
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 38
byte 1 32
byte 1 75
byte 1 111
byte 1 99
byte 1 104
byte 1 32
byte 1 80
byte 1 83
byte 1 71
byte 1 45
byte 1 49
byte 1 32
byte 1 40
byte 1 32
byte 1 97
byte 1 99
byte 1 99
byte 1 32
byte 1 62
byte 1 32
byte 1 54
byte 1 32
byte 1 41
byte 1 34
byte 1 0
align 1
LABELV $195
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 70
byte 1 114
byte 1 101
byte 1 110
byte 1 99
byte 1 104
byte 1 105
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 115
byte 1 45
byte 1 49
byte 1 53
byte 1 32
byte 1 40
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 62
byte 1 32
byte 1 54
byte 1 32
byte 1 41
byte 1 34
byte 1 0
align 1
LABELV $194
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 82
byte 1 101
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 116
byte 1 111
byte 1 110
byte 1 32
byte 1 56
byte 1 55
byte 1 48
byte 1 45
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 32
byte 1 49
byte 1 34
byte 1 0
align 1
LABELV $193
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 67
byte 1 111
byte 1 108
byte 1 116
byte 1 32
byte 1 77
byte 1 52
byte 1 45
byte 1 65
byte 1 49
byte 1 34
byte 1 0
align 1
LABELV $192
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 72
byte 1 101
byte 1 99
byte 1 107
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 38
byte 1 32
byte 1 75
byte 1 111
byte 1 99
byte 1 104
byte 1 32
byte 1 77
byte 1 112
byte 1 53
byte 1 45
byte 1 65
byte 1 53
byte 1 34
byte 1 0
align 1
LABELV $178
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 82
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 65
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 34
byte 1 32
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 83
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 34
byte 1 32
byte 1 34
byte 1 53
byte 1 46
byte 1 32
byte 1 83
byte 1 110
byte 1 105
byte 1 112
byte 1 101
byte 1 114
byte 1 34
byte 1 32
byte 1 34
byte 1 54
byte 1 46
byte 1 32
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 108
byte 1 105
byte 1 115
byte 1 104
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 69
byte 1 120
byte 1 112
byte 1 101
byte 1 114
byte 1 116
byte 1 34
byte 1 32
byte 1 34
byte 1 55
byte 1 46
byte 1 32
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 34
byte 1 32
byte 1 0
align 1
LABELV $158
byte 1 78
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
byte 1 69
byte 1 120
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $151
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 34
byte 1 32
byte 1 34
byte 1 84
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 115
byte 1 116
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 120
byte 1 32
byte 1 88
byte 1 80
byte 1 32
byte 1 44
byte 1 34
byte 1 32
byte 1 34
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 120
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 46
byte 1 34
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 88
byte 1 80
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 48
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 48
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 48
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 83
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 48
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 53
byte 1 46
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 48
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 54
byte 1 46
byte 1 32
byte 1 84
byte 1 101
byte 1 99
byte 1 104
byte 1 110
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 40
byte 1 67
byte 1 117
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 47
byte 1 49
byte 1 48
byte 1 41
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 55
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $128
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $120
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
LABELV $118
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $110
byte 1 34
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
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 34
byte 1 0
align 1
LABELV $106
byte 1 34
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
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 34
byte 1 32
byte 1 34
byte 1 63
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 83
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 34
byte 1 32
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 84
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 34
byte 1 0
align 1
LABELV $100
byte 1 34
byte 1 49
byte 1 46
byte 1 32
byte 1 71
byte 1 111
byte 1 34
byte 1 32
byte 1 34
byte 1 50
byte 1 46
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 82
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 73
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 51
byte 1 46
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 52
byte 1 46
byte 1 32
byte 1 84
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 45
byte 1 32
byte 1 78
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 34
byte 1 32
byte 1 34
byte 1 53
byte 1 46
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 54
byte 1 46
byte 1 32
byte 1 67
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 77
byte 1 101
byte 1 34
byte 1 32
byte 1 34
byte 1 55
byte 1 46
byte 1 32
byte 1 73
byte 1 32
byte 1 65
byte 1 109
byte 1 32
byte 1 72
byte 1 105
byte 1 116
byte 1 34
byte 1 32
byte 1 34
byte 1 56
byte 1 46
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 32
byte 1 34
byte 1 57
byte 1 46
byte 1 32
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $71
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
