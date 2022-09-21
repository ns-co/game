bss
align 1
LABELV $85
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "../cg_event.c"
line 34
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;4:
;5:// every line of code that differs from the quake3:arena SDK
;6:// is property of manfred nerurkar
;7:// no commercial explotation allowed
;8:// you are only allowed to use this code in navy seals: covert operations 
;9:// a quake3 arena modifiation
;10:// defcon-x@ns-co.net
;11:
;12:#include "cg_local.h"
;13:#include "variables.h"
;14:
;15:void CG_MissileHitPlayer( int weapon, vec3_t origin, vec3_t dir, int entityNum, int damage );
;16:void CG_ReloadWeapon ( centity_t *cent, int last_rnd );
;17:void CG_RealBloodTrail( vec3_t start, vec3_t end, float spacing );
;18:void CG_DeleteDirectMark( int entityNum );
;19:void CG_LockBreak( centity_t *cent );
;20:void CG_DamageFeedback( int yawByte, int pitchByte, int damage, int damageDuration );
;21:
;22:// for the voice chats
;23:#include "../../ui/menudef.h"
;24:
;25://==========================================================================
;26:
;27:/*
;28:===================
;29:CG_PlaceString
;30:
;31:Also called by scoreboard drawing
;32:===================
;33:*/
;34:const char	*CG_PlaceString( int rank ) {
line 39
;35:	static char	str[64];
;36:	char	*s, *t;
;37:
;38:	
;39:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $86
line 40
;40:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 41
;41:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $88
ASGNP4
line 42
;42:	} else {
ADDRGP4 $87
JUMPV
LABELV $86
line 43
;43:		t = "";
ADDRLP4 4
ADDRGP4 $89
ASGNP4
line 44
;44:	}
LABELV $87
line 46
;45:
;46:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $90
line 47
;47:		s = S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRLP4 0
ADDRGP4 $92
ASGNP4
line 48
;48:	} else if ( rank == 2 ) {
ADDRGP4 $91
JUMPV
LABELV $90
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $93
line 49
;49:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRLP4 0
ADDRGP4 $95
ASGNP4
line 50
;50:	} else if ( rank == 3 ) {
ADDRGP4 $94
JUMPV
LABELV $93
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $96
line 51
;51:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRLP4 0
ADDRGP4 $98
ASGNP4
line 52
;52:	} else if ( rank == 11 ) {
ADDRGP4 $97
JUMPV
LABELV $96
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $99
line 53
;53:		s = "11th";
ADDRLP4 0
ADDRGP4 $101
ASGNP4
line 54
;54:	} else if ( rank == 12 ) {
ADDRGP4 $100
JUMPV
LABELV $99
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $102
line 55
;55:		s = "12th";
ADDRLP4 0
ADDRGP4 $104
ASGNP4
line 56
;56:	} else if ( rank == 13 ) {
ADDRGP4 $103
JUMPV
LABELV $102
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $105
line 57
;57:		s = "13th";
ADDRLP4 0
ADDRGP4 $107
ASGNP4
line 58
;58:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $106
JUMPV
LABELV $105
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $108
line 59
;59:		s = va("%ist", rank);
ADDRGP4 $110
ARGP4
ADDRFP4 0
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
line 60
;60:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $109
JUMPV
LABELV $108
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $111
line 61
;61:		s = va("%ind", rank);
ADDRGP4 $113
ARGP4
ADDRFP4 0
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
line 62
;62:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $112
JUMPV
LABELV $111
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $114
line 63
;63:		s = va("%ird", rank);
ADDRGP4 $116
ARGP4
ADDRFP4 0
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
line 64
;64:	} else {
ADDRGP4 $115
JUMPV
LABELV $114
line 65
;65:		s = va("%ith", rank);
ADDRGP4 $117
ARGP4
ADDRFP4 0
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
line 66
;66:	}
LABELV $115
LABELV $112
LABELV $109
LABELV $106
LABELV $103
LABELV $100
LABELV $97
LABELV $94
LABELV $91
line 68
;67:
;68:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $85
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $118
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 69
;69:	return str;
ADDRGP4 $85
RETP4
LABELV $84
endproc CG_PlaceString 12 20
proc CG_Obituary 188 24
line 77
;70:}
;71:
;72:/*
;73:=============
;74:CG_Obituary
;75:=============
;76:*/
;77:static void CG_Obituary( entityState_t *ent ) {
line 89
;78:	int			mod;
;79:	int			target, attacker;
;80:	char		*message;
;81:	char		*message2;
;82:	const char	*targetInfo;
;83:	const char	*attackerInfo;
;84:	char		targetName[64];
;85:	char		attackerName[64];
;86:	gender_t	gender;
;87:	clientInfo_t	*ci;
;88:
;89:	target = ent->otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 92
;90:
;91:	// ns: only show obituary to the one that got killed
;92:	if (target != cg.snap->ps.clientNum)
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $120
line 93
;93:		return;
ADDRGP4 $119
JUMPV
LABELV $120
line 95
;94:
;95:	attacker = ent->otherEntityNum2;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 96
;96:	mod = ent->eventParm;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 98
;97:
;98:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $125
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $123
LABELV $125
line 99
;99:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $126
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 100
;100:	}
LABELV $123
line 101
;101:	ci = &cgs.clientinfo[target];
ADDRLP4 152
CNSTI4 2484
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+38664
ADDP4
ASGNP4
line 103
;102:
;103:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $130
ADDRLP4 68
INDIRI4
CNSTI4 64
LTI4 $128
LABELV $130
line 104
;104:		attacker = ENTITYNUM_WORLD;
ADDRLP4 68
CNSTI4 1022
ASGNI4
line 105
;105:		attackerInfo = NULL;
ADDRLP4 148
CNSTP4 0
ASGNP4
line 106
;106:	} else {
ADDRGP4 $129
JUMPV
LABELV $128
line 107
;107:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 68
INDIRI4
CNSTI4 548
ADDI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 172
INDIRP4
ASGNP4
line 108
;108:	}
LABELV $129
line 110
;109:
;110:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 0
INDIRI4
CNSTI4 548
ADDI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 144
ADDRLP4 172
INDIRP4
ASGNP4
line 111
;111:	if ( !targetInfo ) {
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $131
line 112
;112:		return;
ADDRGP4 $119
JUMPV
LABELV $131
line 114
;113:	}
;114:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 176
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 176
INDIRP4
ARGP4
CNSTI4 62
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 116
;115:
;116:	Com_sprintf( targetName, sizeof(targetName),"%s%s%s", S_COLOR_CYAN , targetName, S_COLOR_WHITE );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $134
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 119
;117:
;118: 
;119:	message2 = "";
ADDRLP4 156
ADDRGP4 $89
ASGNP4
line 123
;120:
;121:	// check for single client messages
;122:
;123:	switch( mod ) {
ADDRLP4 136
INDIRI4
CNSTI4 14
LTI4 $137
ADDRLP4 136
INDIRI4
CNSTI4 22
GTI4 $137
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $155-56
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $155
address $145
address $147
address $149
address $143
address $137
address $141
address $139
address $151
address $153
code
LABELV $139
line 125
;124:	case MOD_SUICIDE:
;125:		message = "tasted the sweet kiss of death";
ADDRLP4 140
ADDRGP4 $140
ASGNP4
line 126
;126:		break;
ADDRGP4 $138
JUMPV
LABELV $141
line 128
;127:	case MOD_FALLING:
;128:		message = "forgot that this is reallife";
ADDRLP4 140
ADDRGP4 $142
ASGNP4
line 129
;129:		break;
ADDRGP4 $138
JUMPV
LABELV $143
line 131
;130:	case MOD_CRUSH:
;131:		message = "got crushed";
ADDRLP4 140
ADDRGP4 $144
ASGNP4
line 132
;132:		break;
ADDRGP4 $138
JUMPV
LABELV $145
line 134
;133:	case MOD_WATER:
;134:		message = "overestimated the size of his lungs";
ADDRLP4 140
ADDRGP4 $146
ASGNP4
line 135
;135:		break;
ADDRGP4 $138
JUMPV
LABELV $147
line 137
;136:	case MOD_SLIME:
;137:		message = "melted";
ADDRLP4 140
ADDRGP4 $148
ASGNP4
line 138
;138:		break;
ADDRGP4 $138
JUMPV
LABELV $149
line 140
;139:	case MOD_LAVA:
;140:		message = "does a back flip into the lava";
ADDRLP4 140
ADDRGP4 $150
ASGNP4
line 141
;141:		break;
ADDRGP4 $138
JUMPV
LABELV $151
line 143
;142:	case MOD_TARGET_LASER:
;143:		message = "saw the light";
ADDRLP4 140
ADDRGP4 $152
ASGNP4
line 144
;144:		break;
ADDRGP4 $138
JUMPV
LABELV $153
line 146
;145:	case MOD_TRIGGER_HURT:
;146:		message = "died";
ADDRLP4 140
ADDRGP4 $154
ASGNP4
line 147
;147:		break;
ADDRGP4 $138
JUMPV
LABELV $137
line 149
;148:	default:
;149:		message = NULL;
ADDRLP4 140
CNSTP4 0
ASGNP4
line 150
;150:		break;
LABELV $138
line 153
;151:	}
;152:
;153:	if (attacker == target) {
ADDRLP4 68
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $157
line 154
;154:		gender = ci->gender;
ADDRLP4 160
ADDRLP4 152
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 155
;155:		switch (mod) {
ADDRLP4 136
INDIRI4
CNSTI4 5
EQI4 $161
ADDRGP4 $159
JUMPV
LABELV $161
line 158
;156: 
;157:		case MOD_GRENADE_SPLASH:
;158:			if ( gender == GENDER_FEMALE )
ADDRLP4 160
INDIRI4
CNSTI4 1
NEI4 $162
line 159
;159:				message = "was blown away by her own grenade";
ADDRLP4 140
ADDRGP4 $164
ASGNP4
ADDRGP4 $160
JUMPV
LABELV $162
line 160
;160:			else if ( gender == GENDER_NEUTER )
ADDRLP4 160
INDIRI4
CNSTI4 2
NEI4 $165
line 161
;161:				message = "was blown away by its own grenade";
ADDRLP4 140
ADDRGP4 $167
ASGNP4
ADDRGP4 $160
JUMPV
LABELV $165
line 163
;162:			else
;163:				message = "was blown away by his own grenade";
ADDRLP4 140
ADDRGP4 $168
ASGNP4
line 164
;164:			break; 
ADDRGP4 $160
JUMPV
LABELV $159
line 167
;165: 
;166:		default:
;167:			message = "commited suicide";
ADDRLP4 140
ADDRGP4 $169
ASGNP4
line 168
;168:			break;
LABELV $160
line 170
;169:		}
;170:	}
LABELV $157
line 172
;171:
;172:	if (message) {
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $170
line 173
;173:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $172
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 174
;174:		return;
ADDRGP4 $119
JUMPV
LABELV $170
line 178
;175:	}
;176:
;177: 	// check for double client messages
;178:	if ( !attackerInfo ) {
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
line 179
;179:		attacker = ENTITYNUM_WORLD;
ADDRLP4 68
CNSTI4 1022
ASGNI4
line 180
;180:		strcpy( attackerName, "noname" );
ADDRLP4 72
ARGP4
ADDRGP4 $175
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 181
;181:	} else {
ADDRGP4 $174
JUMPV
LABELV $173
line 182
;182:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 184
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 184
INDIRP4
ARGP4
CNSTI4 62
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 183
;183:		Com_sprintf( attackerName, sizeof(attackerName),"%s%s%s", S_COLOR_RED , attackerName, S_COLOR_WHITE );
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $134
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 186
;184:
;185:		// check for kill messages about the current clientNum
;186:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $177
line 187
;187:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+112908
ARGP4
ADDRLP4 72
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 188
;188:		}
LABELV $177
line 189
;189:	}
LABELV $174
line 191
;190:
;191:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 68
INDIRI4
CNSTI4 1022
EQI4 $182
line 192
;192:		switch (mod) { 
ADDRLP4 136
INDIRI4
CNSTI4 29
EQI4 $188
ADDRLP4 136
INDIRI4
CNSTI4 31
EQI4 $186
ADDRGP4 $184
JUMPV
LABELV $186
line 194
;193:		case MOD_LEAD:
;194:			message = "got shot by";
ADDRLP4 140
ADDRGP4 $187
ASGNP4
line 195
;195:			break;
ADDRGP4 $185
JUMPV
LABELV $188
line 197
;196:		case MOD_BLEED:
;197:			message = "bleed to death because of";
ADDRLP4 140
ADDRGP4 $189
ASGNP4
line 198
;198:			break;
ADDRGP4 $185
JUMPV
LABELV $184
line 200
;199:		default:
;200:			message = "was killed by";
ADDRLP4 140
ADDRGP4 $190
ASGNP4
line 201
;201:			break;
LABELV $185
line 204
;202:		}
;203:
;204:		if (message) {
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $191
line 205
;205:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $193
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 207
;206:				targetName, message, attackerName, message2);
;207:			return;
ADDRGP4 $119
JUMPV
LABELV $191
line 209
;208:		}
;209:	}
LABELV $182
line 212
;210:
;211:	// we don't know what it was
;212:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $194
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 213
;213:}
LABELV $119
endproc CG_Obituary 188 24
proc CG_UseItem 32 12
line 222
;214:
;215://==========================================================================
;216:
;217:/*
;218:===============
;219:CG_UseItem
;220:===============
;221:*/
;222:static void CG_UseItem( centity_t *cent ) {
line 228
;223:	clientInfo_t *ci;
;224:	int			itemNum, clientNum;
;225:	gitem_t		*item;
;226:	entityState_t *es;
;227:
;228:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 230
;229:	
;230:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 31
SUBI4
ASGNI4
line 231
;231:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $198
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $196
LABELV $198
line 232
;232:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 233
;233:	}
LABELV $196
line 236
;234:
;235:	// print a message if the local player
;236:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $199
line 237
;237:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $202
line 238
;238:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $204
ARGP4
CNSTI4 143
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 239
;239:		} else {
ADDRGP4 $203
JUMPV
LABELV $202
line 240
;240:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 241
;241:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $205
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 28
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
CNSTI4 143
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 242
;242:		}
LABELV $203
line 243
;243:	}
LABELV $199
line 245
;244:
;245:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $207
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $207
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $210
ADDRGP4 $207
JUMPV
line 249
;246:	default:
;247:	case HI_NONE:
;248://		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
;249:		break;
line 252
;250:
;251:	case HI_TELEPORTER:
;252:		break;
LABELV $210
line 255
;253:
;254:	case HI_MEDKIT:
;255:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 256
;256:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $207
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $207
line 257
;257:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 2484
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+38664
ADDP4
ASGNP4
line 258
;258:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 132
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 259
;259:		}
line 261
;260://		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
;261:		break;
LABELV $207
line 266
;262:
;263: 
;264:	}
;265:
;266:}
LABELV $195
endproc CG_UseItem 32 12
proc CG_ItemPickup 0 0
line 275
;267:
;268:/*
;269:================
;270:CG_ItemPickup
;271:
;272:A new item was picked up this frame
;273:================
;274:*/
;275:static void CG_ItemPickup( int itemNum ) {
line 276
;276:	cg.itemPickup = itemNum;
ADDRGP4 cg+115288
ADDRFP4 0
INDIRI4
ASGNI4
line 277
;277:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+115292
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 278
;278:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+115296
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 280
;279:	// see if it should be the grabbed weapon
;280:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $221
line 282
;281:		// select it immediately
;282:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_KHURKURI ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $224
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $224
line 283
;283:			cg.weaponSelectTime = cg.time + 1500;
ADDRGP4 cg+115300
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 284
;284:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+108944
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 285
;285:		}
LABELV $224
line 286
;286:	}
LABELV $221
line 288
;287:
;288:}
LABELV $215
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 4 0
line 300
;289:
;290:void CG_NewbieMessage( const char *str, int y, float charHeight );
;291:
;292:
;293:/*
;294:================
;295:CG_PainEvent
;296:
;297:Also called by playerstate transition
;298:================
;299:*/
;300:void CG_PainEvent( centity_t *cent, int health ) {
line 321
;301:/*	char	*snd;
;302:
;303:	// don't do more than two pain sounds a second
;304:	if ( cg.time - cent->pe.painTime < 500 ) {
;305:		return;
;306:	}
;307:
;308:	if ( health < 25 ) {
;309:		snd = "*pain25_1.wav";
;310:	} else if ( health < 50 ) {
;311:		snd = "*pain50_1.wav";
;312:	} else if ( health < 75 ) {
;313:		snd = "*pain75_1.wav";
;314:	} else {
;315:		snd = "*pain100_1.wav";
;316:	}
;317:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
;318:		CG_CustomSound( cent->currentState.number, snd ) );
;319:*/
;320:	// save pain time for programitic twitch animation
;321:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 322
;322:	cent->pe.painDirection ^= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 323
;323:}
LABELV $232
endproc CG_PainEvent 4 0
export CG_EntityEvent
proc CG_EntityEvent 228 40
line 336
;324:
;325:
;326:
;327:/*
;328:==============
;329:CG_EntityEvent
;330:
;331:An entity has an event value
;332:also called by CG_CheckPlayerstateEvents
;333:==============
;334:*/
;335:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;336:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 344
;337:	entityState_t	*es;
;338:	int				event;
;339:	vec3_t			dir;
;340:	const char		*s;
;341:	int				clientNum;
;342:	clientInfo_t	*ci;
;343:
;344:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 345
;345:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 347
;346:
;347:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $235
line 348
;348:		CG_Printf( "ent:%3i  event:%3i", es->number, event );
ADDRGP4 $238
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 349
;349:	}
LABELV $235
line 351
;350:
;351:	if ( !event ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $239
line 352
;352:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $234
ADDRGP4 $244
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 353
;353:		return;
ADDRGP4 $234
JUMPV
LABELV $239
line 356
;354:	}
;355:
;356:	clientNum = es->clientNum;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 357
;357:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $247
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $245
LABELV $247
line 358
;358:		clientNum = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 359
;359:	}
LABELV $245
line 360
;360:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 24
CNSTI4 2484
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+38664
ADDP4
ASGNP4
line 363
;361:
;362:	// this is a client
;363:	if ( clientNum < MAX_CLIENTS )
ADDRLP4 8
INDIRI4
CNSTI4 64
GEI4 $249
line 364
;364:	{
line 366
;365:		// generate footprints
;366:		if ( event == EV_FOOTSTEP || event == EV_FOOTSTEP_METAL || event == EV_FOOTSTEP_WOOD ||
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 5
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 4
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 7
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 13
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 14
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 15
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 16
EQI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 17
NEI4 $251
LABELV $263
line 370
;367:			 event == EV_FOOTSTEP_SNOW || event == EV_FOOTSTEP_DIRT || event == EV_FOOTSPLASH ||
;368:			 event == EV_FOOTWADE || event == EV_FALL_SHORT || event == EV_FALL_LIGHT ||	
;369:			 event == EV_FALL_MEDIUM || event == EV_FALL_FAR ||	event == EV_FALL_DEATH )
;370:		{
line 371
;371:			if ( cent->leftWaterTime + 60000 > cg.time && cent->leftWaterTime != 0 ) {
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 60000
ADDI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $264
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $264
line 372
;372:				cent->footstepSpawn = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 1
ASGNI4
line 373
;373:			}
LABELV $264
line 374
;374:		}
LABELV $251
line 375
;375:	}
LABELV $249
line 378
;376:	
;377:
;378:	switch ( event ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $267
ADDRLP4 4
INDIRI4
CNSTI4 108
GTI4 $267
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1020-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1020
address $269
address $281
address $323
address $310
address $297
address $336
address $349
address $362
address $447
address $447
address $447
address $447
address $375
address $393
address $411
address $429
address $429
address $477
address $267
address $491
address $501
address $512
address $523
address $534
address $544
address $576
address $600
address $605
address $621
address $616
address $626
address $631
address $636
address $641
address $646
address $651
address $656
address $661
address $666
address $671
address $676
address $681
address $686
address $691
address $696
address $267
address $728
address $723
address $701
address $712
address $734
address $800
address $822
address $841
address $790
address $778
address $758
address $763
address $768
address $773
address $795
address $267
address $892
address $905
address $912
address $267
address $267
address $267
address $917
address $753
address $267
address $267
address $267
address $267
address $267
address $267
address $267
address $267
address $927
address $922
address $496
address $267
address $267
address $267
address $267
address $267
address $294
address $932
address $937
address $956
address $268
address $817
address $268
address $965
address $966
address $964
address $967
address $900
address $564
address $268
address $268
address $268
address $268
address $268
address $268
address $268
address $268
address $594
code
LABELV $269
line 383
;379:	//
;380:	// movement generated events
;381:	//
;382:	case EV_FOOTSTEP:
;383:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $270
ADDRGP4 $273
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $270
line 384
;384:		if (cg_footsteps.integer && (cg.DeafTime < cg.time) ) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
line 385
;385:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+205084+1324
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 387
;386:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;387:		}		 		
line 388
;388:		break;
ADDRGP4 $268
JUMPV
LABELV $281
line 390
;389:	case EV_FOOTSTEP_METAL:
;390:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $282
ADDRGP4 $285
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $282
line 391
;391:		if (cg_footsteps.integer && (cg.DeafTime < cg.time)) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
line 392
;392:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+16
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 394
;393:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;394:		}
line 395
;395:		break;
ADDRGP4 $268
JUMPV
LABELV $294
line 397
;396:	case EV_GAMESTATE:
;397:		trap_Cvar_Set("ui_gamestate", va("%i", es->eventParm));
ADDRGP4 $296
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $295
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 398
;398:		break;
ADDRGP4 $268
JUMPV
LABELV $297
line 401
;399:		// Navy Seals ++
;400:	case EV_FOOTSTEP_WOOD:
;401:		DEBUGNAME("EV_FOOTSTEP_WOOD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $298
ADDRGP4 $301
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $298
line 402
;402:		if (cg_footsteps.integer && (cg.DeafTime < cg.time)) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
line 403
;403:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 44
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+64
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 405
;404:				cgs.media.footsteps[ FOOTSTEP_WOOD ][rand()&3] );
;405:		}
line 406
;406:		break;
ADDRGP4 $268
JUMPV
LABELV $310
line 408
;407:	case EV_FOOTSTEP_SNOW:
;408:		DEBUGNAME("EV_FOOTSTEP_SNOW");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $311
ADDRGP4 $314
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $311
line 409
;409:		if (cg_footsteps.integer && (cg.DeafTime < cg.time)) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
line 410
;410:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 44
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 412
;411:				cgs.media.footsteps[ FOOTSTEP_SNOW ][rand()&3] );
;412:		}
line 413
;413:		break;
ADDRGP4 $268
JUMPV
LABELV $323
line 415
;414:	case EV_FOOTSTEP_DIRT:
;415:		DEBUGNAME("EV_FOOTSTEP_DIRT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $324
ADDRGP4 $327
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $324
line 416
;416:		if (cg_footsteps.integer && (cg.DeafTime < cg.time)) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
line 417
;417:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 44
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 419
;418:				cgs.media.footsteps[ FOOTSTEP_DIRT ][rand()&3] );
;419:		}
line 420
;420:		break;
ADDRGP4 $268
JUMPV
LABELV $336
line 423
;421:		// Navy Seals --
;422:	case EV_FOOTSPLASH:
;423:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $337
ADDRGP4 $340
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $337
line 424
;424:		if (cg_footsteps.integer && (cg.DeafTime < cg.time)) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
line 425
;425:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 44
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 427
;426:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;427:		}
line 428
;428:		break;
ADDRGP4 $268
JUMPV
LABELV $349
line 430
;429:	case EV_FOOTWADE:
;430:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $350
ADDRGP4 $353
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $350
line 431
;431:		if (cg_footsteps.integer && (cg.DeafTime < cg.time)) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
line 432
;432:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 44
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 434
;433:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;434:		}
line 435
;435:		break;
ADDRGP4 $268
JUMPV
LABELV $362
line 437
;436:	case EV_SWIM:
;437:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $363
ADDRGP4 $366
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $363
line 438
;438:		if (cg_footsteps.integer && (cg.DeafTime < cg.time)) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
line 439
;439:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 44
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 441
;440:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;441:		}
line 442
;442:		break; 
ADDRGP4 $268
JUMPV
LABELV $375
line 444
;443:	case EV_FALL_SHORT:
;444:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $376
ADDRGP4 $379
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $376
line 445
;445:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $380
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1468
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $380
line 446
;446:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $268
line 448
;447:			// smooth landing z changes
;448:			cg.landChange = -8;
ADDRGP4 cg+108936
CNSTF4 3238002688
ASGNF4
line 449
;449:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 450
;450:		}
line 451
;451:		break;
ADDRGP4 $268
JUMPV
LABELV $393
line 453
;452:	case EV_FALL_LIGHT:
;453:		DEBUGNAME("EV_FALL_LIGHT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $394
ADDRGP4 $397
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $394
line 455
;454:		// use normal pain sound
;455:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $398
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1468
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $398
line 456
;456:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $268
line 458
;457:			// smooth landing z changes
;458:			cg.landChange = -16;
ADDRGP4 cg+108936
CNSTF4 3246391296
ASGNF4
line 459
;459:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 460
;460:		}
line 461
;461:		break;
ADDRGP4 $268
JUMPV
LABELV $411
line 463
;462:	case EV_FALL_MEDIUM:
;463:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $412
ADDRGP4 $415
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $412
line 465
;464:		// use normal pain sound
;465:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $416
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1468
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $416
line 466
;466:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $268
line 467
;467:			CG_DamageFeedback( 50+random()*50,50+random()*50, 40, 3000 );
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 52
CNSTF4 1112014848
ASGNF4
CNSTF4 1112014848
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDRLP4 52
INDIRF4
ADDF4
CVFI4 4
ARGI4
ADDRLP4 52
INDIRF4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1112014848
ADDF4
CVFI4 4
ARGI4
CNSTI4 40
ARGI4
CNSTI4 3000
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
line 469
;468:			// smooth landing z changes
;469:			cg.landChange = -16;
ADDRGP4 cg+108936
CNSTF4 3246391296
ASGNF4
line 470
;470:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 471
;471:		}
line 472
;472:		break;
ADDRGP4 $268
JUMPV
LABELV $429
line 475
;473:	case EV_FALL_FAR:
;474:	case EV_FALL_DEATH:
;475:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $430
ADDRGP4 $433
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $430
line 476
;476:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, trap_S_RegisterSound("sound/actors/player/fall1.wav", qfalse) );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $434
ADDRGP4 $438
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $434
line 477
;477:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 478
;478:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $268
line 479
;479:			CG_DamageFeedback( 75+random()*75,75+random()*75, 40, 5000 );
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 56
CNSTF4 1117126656
ASGNF4
CNSTF4 1117126656
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDRLP4 56
INDIRF4
ADDF4
CVFI4 4
ARGI4
ADDRLP4 56
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1117126656
ADDF4
CVFI4 4
ARGI4
CNSTI4 40
ARGI4
CNSTI4 5000
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
line 481
;480:			// smooth landing z changes
;481:			cg.landChange = -24;
ADDRGP4 cg+108936
CNSTF4 3250585600
ASGNF4
line 482
;482:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 483
;483:		}
line 484
;484:		break;
ADDRGP4 $268
JUMPV
LABELV $447
line 490
;485:
;486:	case EV_STEP_4:
;487:	case EV_STEP_8:
;488:	case EV_STEP_12:
;489:	case EV_STEP_16:		// smooth out step up transitions
;490:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $448
ADDRGP4 $451
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $448
line 491
;491:	{
line 496
;492:		float	oldStep;
;493:		int		delta;
;494:		int		step;
;495:
;496:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $452
line 497
;497:			break;
ADDRGP4 $268
JUMPV
LABELV $452
line 500
;498:		}
;499:		// if we are interpolating, we don't need to smooth steps
;500:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) || 
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $464
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $464
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $464
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $456
LABELV $464
line 501
;501:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 502
;502:			break;
ADDRGP4 $268
JUMPV
LABELV $456
line 505
;503:		}
;504:		// check for stepping up before a previous step is completed
;505:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108924
INDIRI4
SUBI4
ASGNI4
line 506
;506:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $467
line 507
;507:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 52
ADDRGP4 cg+108920
INDIRF4
CNSTI4 200
ADDRLP4 48
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 508
;508:		} else {
ADDRGP4 $468
JUMPV
LABELV $467
line 509
;509:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 510
;510:		}
LABELV $468
line 513
;511:
;512:		// add this amount
;513:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 56
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 36
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 514
;514:		cg.stepChange = oldStep + step;
ADDRGP4 cg+108920
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 515
;515:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+108920
INDIRF4
CNSTF4 1107296256
LEF4 $471
line 516
;516:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+108920
CNSTF4 1107296256
ASGNF4
line 517
;517:		}
LABELV $471
line 518
;518:		cg.stepTime = cg.time;
ADDRGP4 cg+108924
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 519
;519:		break;
ADDRGP4 $268
JUMPV
LABELV $477
line 523
;520:	}
;521:
;522:	case EV_STOLENWEAPON:
;523:		DEBUGNAME("EV_STOLENWEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $478
ADDRGP4 $481
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $478
line 524
;524:		if ( es->otherEntityNum != cg.snap->ps.clientNum )
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $482
line 525
;525:			return;
ADDRGP4 $234
JUMPV
LABELV $482
line 526
;526:		if ( BG_IsPrimary( es->weapon ) )
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $485
line 527
;527:			trap_Cvar_Set( "inven_primary", va( "%i", es->weapon ) );
ADDRGP4 $296
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $487
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $268
JUMPV
LABELV $485
line 528
;528:		else if ( BG_IsSecondary( es->weapon ) )
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_IsSecondary
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $268
line 529
;529:			trap_Cvar_Set( "inven_secondary", va( "%i", es->weapon ) );
ADDRGP4 $296
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $490
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 530
;530:		break;
ADDRGP4 $268
JUMPV
LABELV $491
line 533
;531:
;532:	case EV_JUMP:
;533:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 $495
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 535
;534:	//	trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
;535:		break;
ADDRGP4 $268
JUMPV
LABELV $496
line 537
;536:	case EV_TAUNT:
;537:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 $500
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 539
;538:	//	trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
;539:		break;
ADDRGP4 $268
JUMPV
LABELV $501
line 542
;540: 
;541:	case EV_WATER_TOUCH:
;542:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $502
ADDRGP4 $505
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $502
line 543
;543:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1476
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 544
;544:		break;
ADDRGP4 $268
JUMPV
LABELV $512
line 546
;545:	case EV_WATER_LEAVE:
;546:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $513
ADDRGP4 $516
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $513
line 547
;547:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1480
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 548
;548:		break;
ADDRGP4 $268
JUMPV
LABELV $523
line 550
;549:	case EV_WATER_UNDER:
;550:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $524
ADDRGP4 $527
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $524
line 551
;551:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1484
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 552
;552:		break;
ADDRGP4 $268
JUMPV
LABELV $534
line 554
;553:	case EV_WATER_CLEAR:
;554:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $535
ADDRGP4 $538
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $535
line 555
;555:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, trap_S_RegisterSound("sound/actors/player/gasp.wav", qfalse));
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
ADDRGP4 $543
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 64
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 556
;556:		break;
ADDRGP4 $268
JUMPV
LABELV $544
line 559
;557:
;558:	case EV_ITEM_PICKUP:
;559:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $545
ADDRGP4 $548
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $545
line 560
;560:		{
line 564
;561:			gitem_t	*item;
;562:			int		index;
;563:
;564:			index = es->eventParm;		// player predicted
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 566
;565:
;566:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 76
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1
LTI4 $551
ADDRLP4 76
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $549
LABELV $551
line 567
;567:				break;
ADDRGP4 $268
JUMPV
LABELV $549
line 569
;568:			}
;569:			item = &bg_itemlist[ index ];
ADDRLP4 72
CNSTI4 56
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 573
;570:
;571:			// powerups and team items will have a separate global sound, this one
;572:			// will be played at prediction time
;573:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 80
ADDRLP4 72
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 5
EQI4 $554
ADDRLP4 80
INDIRI4
CNSTI4 9
NEI4 $552
LABELV $554
line 575
;574://				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
;575:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $553
JUMPV
LABELV $552
ADDRLP4 72
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $555
line 577
;576: 
;577:			} else {
ADDRGP4 $556
JUMPV
LABELV $555
line 578
;578:				if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $557
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $557
line 579
;579:			}
LABELV $556
LABELV $553
line 582
;580:
;581:			// show icon and name on status bar
;582:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $268
line 583
;583:				CG_ItemPickup( index );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 584
;584:			}
line 585
;585:		}
line 586
;586:		break;
ADDRGP4 $268
JUMPV
LABELV $564
line 589
;587:
;588:	case EV_LOCALSOUND:
;589:		DEBUGNAME("EV_LOCALSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $565
ADDRGP4 $568
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $565
line 590
;590:		{
line 591
;591:			if ( es->otherEntityNum != cg.snap->ps.clientNum ) 
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $569
line 592
;592:				break; 
ADDRGP4 $268
JUMPV
LABELV $569
line 598
;593:
;594:			// es->frame			=		channel
;595:			// es->otherEntityNum   =		client to play to
;596:			// es->eventParm		=		soundfile
;597:
;598:			if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
CNSTI4 0
EQI4 $572
line 599
;599:				trap_S_StartLocalSound( cgs.gameSounds[ es->eventParm ] ,  es->frame );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 600
;600:			} else {
ADDRGP4 $268
JUMPV
LABELV $572
line 601
;601:				s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 292
ADDI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 68
INDIRP4
ASGNP4
line 602
;602:				trap_S_StartLocalSound( CG_CustomSound( es->number, s ) ,  es->frame ); 
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 603
;603:			}
line 604
;604:		}
line 605
;605:		break;
ADDRGP4 $268
JUMPV
LABELV $576
line 607
;606:	case EV_GLOBAL_ITEM_PICKUP:
;607:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $577
ADDRGP4 $580
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $577
line 608
;608:		{
line 612
;609:			gitem_t	*item;
;610:			int		index;
;611:
;612:			index = es->eventParm;		// player predicted
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 614
;613:
;614:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 76
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1
LTI4 $583
ADDRLP4 76
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $581
LABELV $583
line 615
;615:				break;
ADDRGP4 $268
JUMPV
LABELV $581
line 617
;616:			}
;617:			item = &bg_itemlist[ index ];
ADDRLP4 72
CNSTI4 56
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 620
;618:
;619:			// powerup pickups are global
;620:			if( item->pickup_sound ) {
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $584
line 621
;621:				if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $586
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $586
line 622
;622:			}
LABELV $584
line 625
;623:
;624:			// show icon and name on status bar
;625:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $268
line 626
;626:				CG_ItemPickup( index );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 627
;627:			}
line 628
;628:		}
line 629
;629:		break;
ADDRGP4 $268
JUMPV
LABELV $594
line 631
;630:	case EV_BREAKLOCK:
;631:		DEBUGNAME("EV_BREAKLOCK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $595
ADDRGP4 $598
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $595
line 632
;632:		{
line 633
;633:			CG_Printf("broke lock\n");
ADDRGP4 $599
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 634
;634:			CG_LockBreak( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LockBreak
CALLV
pop
line 635
;635:		}
line 636
;636:		break;
ADDRGP4 $268
JUMPV
LABELV $600
line 641
;637:	//
;638:	// weapon events
;639:	//
;640:	case EV_NOAMMO:
;641:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 $604
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 648
;642://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;643:#if 0
;644:		if ( es->number == cg.snap->ps.clientNum ) {
;645:			CG_OutOfAmmoChange();
;646:		}
;647:#endif
;648:		break;
ADDRGP4 $268
JUMPV
LABELV $605
line 650
;649:	case EV_CHANGE_WEAPON:
;650:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $606
ADDRGP4 $609
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $606
line 651
;651:		cent->gunSmokeTime = 0; // reset this
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 0
ASGNI4
line 652
;652:		cent->pe.hand_weapon.frame = 0; // also reset frame counter
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
CNSTI4 0
ASGNI4
line 655
;653:		// BLUTENGEL: 07.01.2004
;654:		// this sound effect is ok
;655:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1320
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 656
;656:		break;
ADDRGP4 $268
JUMPV
LABELV $616
line 658
;657:	case EV_FIRE_WEAPON_OTHER:
;658:		DEBUGNAME("EV_FIRE_WEAPON_OTHER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $617
ADDRGP4 $620
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $617
line 659
;659:		CG_FireWeapon( cent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 660
;660:		break;
ADDRGP4 $268
JUMPV
LABELV $621
line 662
;661:	case EV_FIRE_WEAPON:
;662:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $622
ADDRGP4 $625
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $622
line 663
;663:		CG_FireWeapon( cent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 664
;664:		break;
ADDRGP4 $268
JUMPV
LABELV $626
line 667
;665:
;666:	case EV_USE_ITEM0:
;667:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $627
ADDRGP4 $630
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $627
line 668
;668:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 669
;669:		break;
ADDRGP4 $268
JUMPV
LABELV $631
line 671
;670:	case EV_USE_ITEM1:
;671:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $632
ADDRGP4 $635
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $632
line 672
;672:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 673
;673:		break;
ADDRGP4 $268
JUMPV
LABELV $636
line 675
;674:	case EV_USE_ITEM2:
;675:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $637
ADDRGP4 $640
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $637
line 676
;676:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 677
;677:		break;
ADDRGP4 $268
JUMPV
LABELV $641
line 679
;678:	case EV_USE_ITEM3:
;679:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $642
ADDRGP4 $645
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $642
line 680
;680:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 681
;681:		break;
ADDRGP4 $268
JUMPV
LABELV $646
line 683
;682:	case EV_USE_ITEM4:
;683:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $647
ADDRGP4 $650
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $647
line 684
;684:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 685
;685:		break;
ADDRGP4 $268
JUMPV
LABELV $651
line 687
;686:	case EV_USE_ITEM5:
;687:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $652
ADDRGP4 $655
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $652
line 688
;688:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 689
;689:		break;
ADDRGP4 $268
JUMPV
LABELV $656
line 691
;690:	case EV_USE_ITEM6:
;691:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $657
ADDRGP4 $660
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $657
line 692
;692:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 693
;693:		break;
ADDRGP4 $268
JUMPV
LABELV $661
line 695
;694:	case EV_USE_ITEM7:
;695:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $662
ADDRGP4 $665
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $662
line 696
;696:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 697
;697:		break;
ADDRGP4 $268
JUMPV
LABELV $666
line 699
;698:	case EV_USE_ITEM8:
;699:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $667
ADDRGP4 $670
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $667
line 700
;700:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 701
;701:		break;
ADDRGP4 $268
JUMPV
LABELV $671
line 703
;702:	case EV_USE_ITEM9:
;703:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $672
ADDRGP4 $675
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $672
line 704
;704:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 705
;705:		break;
ADDRGP4 $268
JUMPV
LABELV $676
line 707
;706:	case EV_USE_ITEM10:
;707:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $677
ADDRGP4 $680
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $677
line 708
;708:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 709
;709:		break;
ADDRGP4 $268
JUMPV
LABELV $681
line 711
;710:	case EV_USE_ITEM11:
;711:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $682
ADDRGP4 $685
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $682
line 712
;712:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 713
;713:		break;
ADDRGP4 $268
JUMPV
LABELV $686
line 715
;714:	case EV_USE_ITEM12:
;715:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $687
ADDRGP4 $690
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $687
line 716
;716:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 717
;717:		break;
ADDRGP4 $268
JUMPV
LABELV $691
line 719
;718:	case EV_USE_ITEM13:
;719:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $692
ADDRGP4 $695
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $692
line 720
;720:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 721
;721:		break;
ADDRGP4 $268
JUMPV
LABELV $696
line 723
;722:	case EV_USE_ITEM14:
;723:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $697
ADDRGP4 $700
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $697
line 724
;724:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 725
;725:		break;
ADDRGP4 $268
JUMPV
LABELV $701
line 733
;726:
;727:	//=================================================================
;728:
;729:	//
;730:	// other events
;731:	//
;732:	case EV_PLAYER_TELEPORT_IN:
;733:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $702
ADDRGP4 $705
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $702
line 734
;734:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $706
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1452
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $706
line 735
;735:		CG_SpawnEffect( position );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 736
;736:		break;
ADDRGP4 $268
JUMPV
LABELV $712
line 739
;737:
;738:	case EV_PLAYER_TELEPORT_OUT:
;739:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $713
ADDRGP4 $716
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $713
line 740
;740:		if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $717
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1456
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $717
line 741
;741:		CG_SpawnEffect(  position );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 742
;742:		break;
ADDRGP4 $268
JUMPV
LABELV $723
line 745
;743:
;744:	case EV_ITEM_POP:
;745:		DEBUGNAME("EV_ITEM_POP"); 
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 $727
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 746
;746:		break;
ADDRGP4 $268
JUMPV
LABELV $728
line 748
;747:	case EV_ITEM_RESPAWN:
;748:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $729
ADDRGP4 $732
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $729
line 749
;749:		cent->miscTime = cg.time;	// scale up from this 
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 750
;750:		break;
ADDRGP4 $268
JUMPV
LABELV $734
line 753
;751:
;752:	case EV_GRENADE_BOUNCE:
;753:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $735
ADDRGP4 $738
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $735
line 754
;754:		if ( rand() & 1 ) {
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $739
line 755
;755:			if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1444
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 756
;756:		} else {
ADDRGP4 $268
JUMPV
LABELV $739
line 757
;757:			if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+205084+1448
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 758
;758:		}
line 759
;759:		break;
ADDRGP4 $268
JUMPV
LABELV $753
line 763
;760:
;761: 
;762:	case EV_SCOREPLUM:
;763:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $754
ADDRGP4 $757
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $754
line 764
;764:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 765
;765:		break;
ADDRGP4 $268
JUMPV
LABELV $758
line 771
;766:
;767:	//
;768:	// missile impacts
;769:	//
;770:	case EV_MISSILE_HIT:
;771:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $759
ADDRGP4 $762
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $759
line 772
;772:		ByteToDir( es->eventParm, dir ); 
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 773
;773:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum , 50);
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 50
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 774
;774:		break;
ADDRGP4 $268
JUMPV
LABELV $763
line 777
;775:
;776:	case EV_MISSILE_MISS:
;777:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $764
ADDRGP4 $767
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $764
line 778
;778:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 779
;779:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT, 0 );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 780
;780:		break;
ADDRGP4 $268
JUMPV
LABELV $768
line 783
;781:
;782:	case EV_MISSILE_MISS_METAL:
;783:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $769
ADDRGP4 $772
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $769
line 784
;784:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 785
;785:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_METAL, 0 );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 786
;786:		break;
ADDRGP4 $268
JUMPV
LABELV $773
line 789
;787:
;788:	case EV_RAILTRAIL:
;789:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $268
ADDRGP4 $777
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 790
;790:		break;
ADDRGP4 $268
JUMPV
LABELV $778
line 793
;791:
;792:	case EV_BULLET_HIT_WALL:
;793:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $779
ADDRGP4 $782
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $779
line 794
;794:		ByteToDir( es->eventParm, dir ); 
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 795
;795:		if ( es->frame == 0 && cg.snap->ps.clientNum == es->otherEntityNum 
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 0
NEI4 $783
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
NEI4 $783
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $783
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $783
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $783
ADDRGP4 cg_antiLag+12
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $783
ADDRGP4 cg_bulletpredict+12
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $783
line 802
;796:				&& !BG_IsGrenade( es->weapon ) 
;797:				&& !BG_IsMelee( es->weapon )
;798:				&& !BG_IsGrenade( es->weapon ) 
;799:				&& cg_antiLag.integer
;800:				&& cg_bulletpredict.integer
;801:			)
;802:			break;   
ADDRGP4 $268
JUMPV
LABELV $783
line 804
;803:	
;804:		if ( es->otherEntityNum2 > 0 )
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
LEI4 $788
line 805
;805:		{ 
line 806
;806:			CG_Bullet( es->pos.trBase, es->apos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD, -1, es->otherEntityNum2, es->generic1, es->weapon );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 807
;807:			break;
ADDRGP4 $268
JUMPV
LABELV $788
line 809
;808:		}
;809:		CG_Bullet( es->pos.trBase, es->apos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD, -1, es->frame, es->generic1, es->weapon  );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 810
;810:		break;
ADDRGP4 $268
JUMPV
LABELV $790
line 814
;811:
;812: 
;813:	case EV_BULLET_HIT_FLESH:
;814:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $791
ADDRGP4 $794
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $791
line 815
;815:		ByteToDir( es->torsoAnim , dir );
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 816
;816:		CG_Bullet( es->pos.trBase, es->apos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm, es->legsAnim, es->frame, 0, es->weapon  );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 817
;817:		break;
ADDRGP4 $268
JUMPV
LABELV $795
line 820
;818:
;819:	case EV_SHOTGUN:
;820:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $796
ADDRGP4 $799
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $796
line 821
;821:		CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 822
;822:		break;
ADDRGP4 $268
JUMPV
LABELV $800
line 825
;823:
;824:	case EV_GENERAL_SOUND:
;825:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $801
ADDRGP4 $804
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $801
line 826
;826:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
CNSTI4 0
EQI4 $805
line 827
;827:			if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 828
;828:		} else {
ADDRGP4 $268
JUMPV
LABELV $805
line 829
;829:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 292
ADDI4
ARGI4
ADDRLP4 116
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 116
INDIRP4
ASGNP4
line 830
;830:			if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 831
;831:		}
line 832
;832:		break;
ADDRGP4 $268
JUMPV
LABELV $817
line 834
;833:	case EV_EXPLOSION:
;834:		DEBUGNAME("EV_EXPLOSION"); 
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $818
ADDRGP4 $821
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $818
line 835
;835:		CG_Explosion( position, es->legsAnim );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Explosion
CALLV
pop
line 836
;836:		break;
ADDRGP4 $268
JUMPV
LABELV $822
line 838
;837:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;838:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $823
ADDRGP4 $826
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $823
line 839
;839:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
CNSTI4 0
EQI4 $827
line 840
;840:			if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
CNSTP4 0
ARGP4
ADDRLP4 116
CNSTI4 184
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 841
;841:		} else {
ADDRGP4 $268
JUMPV
LABELV $827
line 842
;842:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 292
ADDI4
ARGI4
ADDRLP4 116
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 116
INDIRP4
ASGNP4
line 843
;843:			if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $268
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 844
;844:		}
line 845
;845:		break;
ADDRGP4 $268
JUMPV
LABELV $841
line 848
;846:
;847:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;848:		{
line 849
;849:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $842
ADDRGP4 $845
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $842
line 850
;850:			switch( es->eventParm ) { 
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
LTI4 $268
ADDRLP4 116
INDIRI4
CNSTI4 8
GTI4 $268
ADDRLP4 116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $891
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $891
address $858
address $861
address $852
address $855
address $268
address $849
address $864
address $887
address $889
code
LABELV $849
line 852
;851:				case GTS_DRAW_ROUND:
;852:					CG_AddBufferedSound( cgs.media.roundDrawSound );
ADDRGP4 cgs+205084+1488
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 853
;853:					break;
ADDRGP4 $268
JUMPV
LABELV $852
line 855
;854:				case GTS_REDTEAM_TOOK_LEAD:
;855:					CG_AddBufferedSound( cgs.media.redLeadsSound );
ADDRGP4 cgs+205084+1500
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 856
;856:					break;
ADDRGP4 $268
JUMPV
LABELV $855
line 858
;857:				case GTS_BLUETEAM_TOOK_LEAD:
;858:					CG_AddBufferedSound( cgs.media.blueLeadsSound );
ADDRGP4 cgs+205084+1504
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 859
;859:					break;
ADDRGP4 $268
JUMPV
LABELV $858
line 861
;860:				case GTS_REDTEAM_SCORED:
;861:					CG_AddBufferedSound( cgs.media.redScoredSound );
ADDRGP4 cgs+205084+1492
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 862
;862:					break;
ADDRGP4 $268
JUMPV
LABELV $861
line 864
;863:				case GTS_BLUETEAM_SCORED:
;864:					CG_AddBufferedSound( cgs.media.blueScoredSound );
ADDRGP4 cgs+205084+1496
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 865
;865:					break;
ADDRGP4 $268
JUMPV
LABELV $864
line 867
;866:				case GTS_BRIEFCASE_TAKEN:
;867:					CG_AddBufferedSound( trap_S_RegisterSound("sound/commentary/bfc_stolen.wav", qfalse ) );
ADDRGP4 $865
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 124
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 868
;868:					if ( cg.snap->ps.powerups[PW_BRIEFCASE] <= 0 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
GTI4 $268
line 869
;869:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE && !cg.ns_newbiehelp.w_briefcaseTaken_Tango )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $869
ADDRGP4 cg+116724+52
INDIRI4
CNSTI4 0
NEI4 $869
line 870
;870:					{
line 872
;871:						// tango player
;872:						cg.ns_newbiehelp.w_briefcaseTaken_Tango = qtrue;
ADDRGP4 cg+116724+52
CNSTI4 1
ASGNI4
line 873
;873: 						CG_NewbieMessage(S_COLOR_GREEN "The Briefcase has been stolen.\nTry to kill the carrier..", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $876
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 876
;874:
;875:
;876:					}
ADDRGP4 $268
JUMPV
LABELV $869
line 877
;877:					else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED && !cg.ns_newbiehelp.w_briefcaseTaken_Seal )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $268
ADDRGP4 cg+116724+48
INDIRI4
CNSTI4 0
NEI4 $268
line 878
;878:					{
line 879
;879:						cg.ns_newbiehelp.w_briefcaseTaken_Seal = qtrue;
ADDRGP4 cg+116724+48
CNSTI4 1
ASGNI4
line 880
;880: 						CG_NewbieMessage(S_COLOR_GREEN "The Briefcase has been stolen by your Team.\nDefend the carrier at all cost.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $885
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 882
;881:						// seal player
;882:					} 
line 883
;883:					break;
ADDRGP4 $268
JUMPV
LABELV $887
line 885
;884:				case GTS_RED_BRIEFCASE_RETURN:
;885:					CG_AddBufferedSound( trap_S_RegisterSound("sound/commentary/bfc_sls_captured.wav", qfalse ) );
ADDRGP4 $888
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 886
;886:					break;
ADDRGP4 $268
JUMPV
LABELV $889
line 888
;887:				case GTS_BLUE_BRIEFCASE_RETURN:
;888:					CG_AddBufferedSound( trap_S_RegisterSound("sound/commentary/bfc_tgs_captured.wav", qfalse ) );
ADDRGP4 $890
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 132
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 889
;889:					break; 
line 892
;890: 
;891:				default:
;892:					break;
line 894
;893:			}
;894:			break;
ADDRGP4 $268
JUMPV
LABELV $892
line 900
;895:		}
;896:
;897:	case EV_PAIN:
;898:		// local player sounds are triggered in CG_CheckLocalSounds,
;899:		// so ignore events on the player
;900:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $893
ADDRGP4 $896
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $893
line 901
;901:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $268
line 902
;902:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 903
;903:		}
line 904
;904:		break;
ADDRGP4 $268
JUMPV
LABELV $900
line 907
;905:
;906:	case EV_BLOODPOOL:
;907:		DEBUGNAME("EV_BLOODPOOL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $901
ADDRGP4 $904
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $901
line 908
;908:		CG_BloodPool( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 CG_BloodPool
CALLV
pop
line 909
;909:		break;
ADDRGP4 $268
JUMPV
LABELV $905
line 911
;910:	case EV_DEATH:
;911:		{
line 912
;912:			int	rndnum = (random()*2);
ADDRLP4 120
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 116
CNSTF4 1073741824
ADDRLP4 120
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 913
;913:			DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $906
ADDRGP4 $909
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $906
line 915
;914:
;915:			rndnum++;
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 917
;916:
;917:			trap_S_StartSound( NULL, es->number, CHAN_VOICE, cgs.media.deathSounds[rndnum] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1432
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 918
;918:		}
line 919
;919:		break;
ADDRGP4 $268
JUMPV
LABELV $912
line 921
;920:	case EV_OBITUARY:
;921:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $913
ADDRGP4 $916
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $913
line 922
;922:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 923
;923:		break; 
ADDRGP4 $268
JUMPV
LABELV $917
line 926
;924: 
;925:	case EV_GIB_PLAYER:
;926:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $918
ADDRGP4 $921
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $918
line 933
;927:		// don't play gib sound when using the kamikaze because it interferes
;928:		// with the kamikaze sound, downside is that the gib sound will also
;929:		// not be played when someone is gibbed while just carrying the kamikaze
;930:/*		if ( !(es->eFlags & EF_KAMIKAZE) ) {
;931:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
;932:		}*/
;933:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 934
;934:		break;
ADDRGP4 $268
JUMPV
LABELV $922
line 937
;935:
;936:	case EV_STOPLOOPINGSOUND:
;937:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $923
ADDRGP4 $926
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $923
line 938
;938:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 939
;939:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 940
;940:		break;
ADDRGP4 $268
JUMPV
LABELV $927
line 942
;941:	case EV_DEBUG_LINE:
;942:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $928
ADDRGP4 $931
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $928
line 943
;943:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 944
;944:		break;
ADDRGP4 $268
JUMPV
LABELV $932
line 946
;945:	case	EV_BLOODER:
;946:		DEBUGNAME("EV_BLOODER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $933
ADDRGP4 $936
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $933
line 947
;947:		CG_CreateBleeder( cent->lerpOrigin , es->eventParm, es->otherEntityNum );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_CreateBleeder
CALLV
pop
line 950
;948:
;949://		CG_CreateBleeder(cent->lerpOrigin , es->torsoAnim  );
;950:		break;
ADDRGP4 $268
JUMPV
LABELV $937
line 952
;951:	case	EV_BLOOD_ON_WALL:
;952:		DEBUGNAME("EV_BLOOD_ON_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $938
ADDRGP4 $941
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $938
line 953
;953:		ByteToDir( es->eventParm, dir );   	 
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 955
;954:
;955:		if (es->legsAnim)
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $942
line 956
;956:		{	
line 958
;957:			char head_sound[64];
;958:			int	rndnum = (int)(random()*3);
ADDRLP4 216
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 120
CNSTF4 1077936128
ADDRLP4 216
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 959
;959:			int	anim = cg_entities[ es->otherEntityNum ].currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 124
CNSTI4 728
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 963
;960:			vec3_t headOrigin;
;961:			vec3_t dir;
;962:
;963:			VectorCopy( cg_entities[ es->otherEntityNum ].lerpOrigin, headOrigin );
ADDRLP4 128
CNSTI4 728
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+700
ADDP4
INDIRB
ASGNB 12
line 965
;964:
;965:			if ( anim == LEGS_WALKCR || anim == LEGS_IDLECR ) {
ADDRLP4 220
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 42
EQI4 $948
ADDRLP4 220
INDIRI4
CNSTI4 41
NEI4 $946
LABELV $948
line 966
;966:				headOrigin[2] += CROUCH_VIEWHEIGHT;
ADDRLP4 128+8
ADDRLP4 128+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 967
;967:			} else {
ADDRGP4 $947
JUMPV
LABELV $946
line 968
;968:				headOrigin[2] += DEFAULT_VIEWHEIGHT; // to get an accurate point of exuast
ADDRLP4 128+8
ADDRLP4 128+8
INDIRF4
CNSTF4 1104150528
ADDF4
ASGNF4
line 969
;969:			}
LABELV $947
line 971
;970:
;971:			rndnum++;
ADDRLP4 120
ADDRLP4 120
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 973
;972:
;973:			Com_sprintf(head_sound,sizeof(head_sound),"sound/actors/headblow_%i.wav", rndnum);
ADDRLP4 140
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $951
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 975
;974:			
;975:			ByteToDir(es->generic1, dir );
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 977
;976:			//CG_HeadBlowGFX( headOrigin , dir);
;977:			CG_RealBloodTrail( headOrigin, es->pos.trBase , 6);
ADDRLP4 128
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1086324736
ARGF4
ADDRGP4 CG_RealBloodTrail
CALLV
pop
line 979
;978:			//CG_Printf("HEADSOUND^1 %s\n",head_sound );
;979: 			if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, es->otherEntityNum, CHAN_AUTO, trap_S_RegisterSound(head_sound, qfalse) );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $952
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 224
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $952
line 980
;980:		} 
LABELV $942
line 981
;981:		CG_BloodOnWallMark( es->pos.trBase,dir, es->torsoAnim , es->legsAnim ); 
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_BloodOnWallMark
CALLV
pop
line 982
;982:		break; 
ADDRGP4 $268
JUMPV
LABELV $956
line 984
;983:	case EV_EMPTYCLIP:
;984:		DEBUGNAME("EV_EMPTYCLIP"); 
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $957
ADDRGP4 $960
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $957
line 985
;985:		if ( es->number == cg.snap->ps.clientNum ) 
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $268
line 986
;986:			CG_ReloadClipWarning(); 
ADDRGP4 CG_ReloadClipWarning
CALLV
pop
line 987
;987:		break; 
ADDRGP4 $268
JUMPV
LABELV $964
line 990
;988:	case EV_FUNCEXPLOSIVE:		
;989:		// delete all marks of this object
;990:		{
line 991
;991:			int dmark = es->frame;
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 993
;992:			
;993:			CG_DeleteDirectMark( dmark );
ADDRLP4 124
INDIRI4
ARGI4
ADDRGP4 CG_DeleteDirectMark
CALLV
pop
line 994
;994:			NS_CG_LaunchFuncExplosive( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_CG_LaunchFuncExplosive
CALLV
pop
line 995
;995:		break;
ADDRGP4 $268
JUMPV
LABELV $965
line 998
;996:		}
;997:	case EV_RELOAD:
;998:		CG_ReloadWeapon( cent, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_ReloadWeapon
CALLV
pop
line 999
;999:		break;
ADDRGP4 $268
JUMPV
LABELV $966
line 1001
;1000:	case EV_RELOAD_EMPTY:
;1001:		CG_ReloadWeapon( cent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_ReloadWeapon
CALLV
pop
line 1002
;1002:		break;
ADDRGP4 $268
JUMPV
LABELV $967
line 1004
;1003:	case EV_FLASHBANG:
;1004:		if ( es->otherEntityNum == cg.snap->ps.clientNum )
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $268
line 1005
;1005:		{
line 1006
;1006:			int blindtime = es->frame;
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 1007
;1007:			int i = 0, j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 132
CNSTI4 0
ASGNI4
line 1009
;1008:
;1009:			if (blindtime < 0) break;
ADDRLP4 124
INDIRI4
CNSTI4 0
GEI4 $971
ADDRGP4 $268
JUMPV
LABELV $971
line 1011
;1010:			
;1011:			if (blindtime < 10 )
ADDRLP4 124
INDIRI4
CNSTI4 10
GEI4 $973
line 1012
;1012:				blindtime = 10;
ADDRLP4 124
CNSTI4 10
ASGNI4
LABELV $973
line 1015
;1013:
;1014:			// play the flashbangsound according to the time blinded
;1015:			if (blindtime > 6000) 
ADDRLP4 124
INDIRI4
CNSTI4 6000
LEI4 $975
line 1016
;1016:				trap_S_StartLocalSound( cgs.media.flash_8sec , CHAN_AUTO );
ADDRGP4 cgs+205084+1308
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $976
JUMPV
LABELV $975
line 1017
;1017:			else if (blindtime > 4000)
ADDRLP4 124
INDIRI4
CNSTI4 4000
LEI4 $979
line 1018
;1018:				trap_S_StartLocalSound( cgs.media.flash_6sec , CHAN_AUTO );
ADDRGP4 cgs+205084+1304
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $980
JUMPV
LABELV $979
line 1019
;1019:			else if (blindtime > 2000)
ADDRLP4 124
INDIRI4
CNSTI4 2000
LEI4 $983
line 1020
;1020:				trap_S_StartLocalSound( cgs.media.flash_4sec , CHAN_AUTO );
ADDRGP4 cgs+205084+1300
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $984
JUMPV
LABELV $983
line 1022
;1021:			else
;1022:				trap_S_StartLocalSound( cgs.media.flash_2sec , CHAN_AUTO );
ADDRGP4 cgs+205084+1296
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $984
LABELV $980
LABELV $976
line 1025
;1023:			
;1024:			// calculate the duration of deafeffect
;1025:			j = cg.time + blindtime - SEALS_FLASHBANGFADETIME;
ADDRLP4 132
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 124
INDIRI4
ADDI4
CNSTI4 3000
SUBI4
ASGNI4
line 1027
;1026:
;1027:			if ((cg.time + SEALS_CONCUSSIONFACTOR*blindtime) > cg.ConcussionTime) 
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1067030938
ADDRLP4 124
INDIRI4
CVIF4 4
MULF4
ADDF4
ADDRGP4 cg+116288
INDIRI4
CVIF4 4
LEF4 $990
line 1028
;1028:				cg.ConcussionTime = cg.time + SEALS_CONCUSSIONFACTOR*blindtime;
ADDRGP4 cg+116288
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1067030938
ADDRLP4 124
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
LABELV $990
line 1031
;1029:
;1030:			// recalc blindtime if blinded from behind
;1031:			if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
EQI4 $996
line 1032
;1032:				blindtime *= SEALS_FLASHEDBEHINDFACTOR;
ADDRLP4 124
CNSTF4 1056964608
ADDRLP4 124
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
LABELV $996
line 1035
;1033:
;1034:			// calculate the duration of whiteouteffect
;1035:	 		i = cg.time + blindtime - SEALS_FLASHBANGFADETIME;
ADDRLP4 128
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 124
INDIRI4
ADDI4
CNSTI4 3000
SUBI4
ASGNI4
line 1038
;1036:			
;1037:			// if it's bigger than the actual whiteouteffect, change it
;1038:			if (i > cg.FlashTime) cg.FlashTime = i;
ADDRLP4 128
INDIRI4
ADDRGP4 cg+116284
INDIRI4
LEI4 $999
ADDRGP4 cg+116284
ADDRLP4 128
INDIRI4
ASGNI4
LABELV $999
line 1040
;1039:
;1040:			if (j > cg.DeafTime) cg.DeafTime = j;
ADDRLP4 132
INDIRI4
ADDRGP4 cg+116292
INDIRI4
LEI4 $1003
ADDRGP4 cg+116292
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $1003
line 1043
;1041:			
;1042:			// calculate the duration of blindspot effect
;1043:			i = cg.time + blindtime*SEALS_BLINDSPOTFACTOR;
ADDRLP4 128
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1069547520
ADDRLP4 124
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1047
;1044:
;1045:			// only change it if the player looked into the flashbang _AND_
;1046:			// the new effect duration if larger than the old one
;1047:			if ( !es->eventParm  && (i > cg.flashedVisionTime) )
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
NEI4 $268
ADDRLP4 128
INDIRI4
ADDRGP4 cg+116296
INDIRI4
LEI4 $268
line 1048
;1048:				cg.flashedVisionTime = i;
ADDRGP4 cg+116296
ADDRLP4 128
INDIRI4
ASGNI4
line 1050
;1049:			
;1050:		}
line 1051
;1051:		break;
ADDRGP4 $268
JUMPV
line 1053
;1052:	case EV_C4DEPLOY: 
;1053:		break;
line 1056
;1054:	case EV_BANDAGING:
;1055://		CG_Printf("Bandaging!\n");
;1056:		break;
line 1065
;1057:	case EV_CLIPWIRE_1:
;1058:	case EV_CLIPWIRE_2:
;1059:	case EV_CLIPWIRE_3:
;1060:	case EV_CLIPWIRE_4:
;1061:	case EV_CLIPWIRE_5:
;1062:	case EV_CLIPWIRE_6:
;1063:	case EV_CLIPWIRE_7:
;1064:	case EV_CLIPWIRE_8:
;1065:		break;
LABELV $267
line 1068
;1066:
;1067:	default:
;1068:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1015
ADDRGP4 $1018
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1015
line 1069
;1069:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1019
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1070
;1070:		break;
LABELV $268
line 1073
;1071:	}
;1072:
;1073:}
LABELV $234
endproc CG_EntityEvent 228 40
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1082
;1074:
;1075:
;1076:/*
;1077:==============
;1078:CG_CheckEvents
;1079:
;1080:==============
;1081:*/
;1082:void CG_CheckEvents( centity_t *cent ) {
line 1084
;1083:	// check for event-only entities
;1084:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 26
LEI4 $1023
line 1085
;1085:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1025
line 1086
;1086:			return;	// already fired
ADDRGP4 $1022
JUMPV
LABELV $1025
line 1089
;1087:		}
;1088:
;1089:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 1
ASGNI4
line 1091
;1090:
;1091:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 26
SUBI4
ASGNI4
line 1092
;1092:	} else {
ADDRGP4 $1024
JUMPV
LABELV $1023
line 1094
;1093:		// check for events riding with another entity
;1094:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
NEI4 $1027
line 1095
;1095:			return;
ADDRGP4 $1022
JUMPV
LABELV $1027
line 1097
;1096:		}
;1097:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1098
;1098:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1029
line 1099
;1099:			return;
ADDRGP4 $1022
JUMPV
LABELV $1029
line 1101
;1100:		}
;1101:	}
LABELV $1024
line 1104
;1102:
;1103:	// calculate the position at exactly the frame time
;1104:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1105
;1105:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1107
;1106:
;1107:	CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 1108
;1108:}
LABELV $1022
endproc CG_CheckEvents 8 12
import CG_DamageFeedback
import CG_LockBreak
import CG_DeleteDirectMark
import CG_RealBloodTrail
import CG_ReloadWeapon
import CG_MissileHitPlayer
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
LABELV $1019
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1018
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $960
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 80
byte 1 84
byte 1 89
byte 1 67
byte 1 76
byte 1 73
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $951
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $941
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 76
byte 1 79
byte 1 79
byte 1 68
byte 1 95
byte 1 79
byte 1 78
byte 1 95
byte 1 87
byte 1 65
byte 1 76
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $936
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 76
byte 1 79
byte 1 79
byte 1 68
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $931
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 85
byte 1 71
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $926
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $921
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $916
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 73
byte 1 84
byte 1 85
byte 1 65
byte 1 82
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $909
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $904
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 76
byte 1 79
byte 1 79
byte 1 68
byte 1 80
byte 1 79
byte 1 79
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $896
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $890
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
byte 1 98
byte 1 102
byte 1 99
byte 1 95
byte 1 116
byte 1 103
byte 1 115
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $888
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
byte 1 98
byte 1 102
byte 1 99
byte 1 95
byte 1 115
byte 1 108
byte 1 115
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $885
byte 1 94
byte 1 50
byte 1 84
byte 1 104
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
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 99
byte 1 111
byte 1 115
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $876
byte 1 94
byte 1 50
byte 1 84
byte 1 104
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
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 101
byte 1 110
byte 1 46
byte 1 10
byte 1 84
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $865
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
byte 1 98
byte 1 102
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $845
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $826
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $821
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 88
byte 1 80
byte 1 76
byte 1 79
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $804
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $799
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $794
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $782
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 87
byte 1 65
byte 1 76
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $777
byte 1 69
byte 1 86
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 84
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $772
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $767
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $762
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $757
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 80
byte 1 76
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $738
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $732
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 82
byte 1 69
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $727
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 79
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $716
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 79
byte 1 85
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $705
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $700
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $695
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $690
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $685
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $680
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $675
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 57
byte 1 10
byte 1 0
align 1
LABELV $670
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 56
byte 1 10
byte 1 0
align 1
LABELV $665
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $660
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 54
byte 1 10
byte 1 0
align 1
LABELV $655
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $650
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $645
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $640
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $635
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $630
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $625
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $620
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 95
byte 1 79
byte 1 84
byte 1 72
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $609
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $604
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $599
byte 1 98
byte 1 114
byte 1 111
byte 1 107
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $598
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 82
byte 1 69
byte 1 65
byte 1 75
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 10
byte 1 0
align 1
LABELV $580
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $568
byte 1 69
byte 1 86
byte 1 95
byte 1 76
byte 1 79
byte 1 67
byte 1 65
byte 1 76
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $548
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $543
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $538
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 67
byte 1 76
byte 1 69
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $527
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $516
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $505
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $500
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $495
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $490
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
LABELV $487
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
LABELV $481
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 76
byte 1 69
byte 1 78
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $451
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $438
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $433
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 70
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $415
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 77
byte 1 69
byte 1 68
byte 1 73
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $397
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $379
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 82
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $366
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 87
byte 1 73
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $353
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 87
byte 1 65
byte 1 68
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $340
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $327
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 68
byte 1 73
byte 1 82
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $314
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 83
byte 1 78
byte 1 79
byte 1 87
byte 1 10
byte 1 0
align 1
LABELV $301
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 87
byte 1 79
byte 1 79
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $296
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $295
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
LABELV $285
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $273
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $244
byte 1 90
byte 1 69
byte 1 82
byte 1 79
byte 1 69
byte 1 86
byte 1 69
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $238
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $205
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $204
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $194
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $193
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $190
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $189
byte 1 98
byte 1 108
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
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
byte 1 0
align 1
LABELV $187
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $176
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $175
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $172
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $168
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $167
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $164
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $154
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $152
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $150
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $148
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $146
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 101
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
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 117
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $144
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $142
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 102
byte 1 101
byte 1 0
align 1
LABELV $140
byte 1 116
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 119
byte 1 101
byte 1 101
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 115
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $136
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $135
byte 1 94
byte 1 53
byte 1 0
align 1
LABELV $134
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $133
byte 1 110
byte 1 0
align 1
LABELV $126
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
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
byte 1 0
align 1
LABELV $118
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $116
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $113
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $110
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $104
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $101
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $98
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $95
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $92
byte 1 94
byte 1 52
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $89
byte 1 0
align 1
LABELV $88
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 0
