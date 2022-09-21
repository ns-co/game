data
align 4
LABELV playerMins
byte 4 3240099840
byte 4 3240099840
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1092616192
byte 4 1092616192
byte 4 1106771968
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "../g_client.c"
line 33
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:// every line of code that differs from the quake3:arena SDK
;5:// is property of manfred nerurkar
;6:// no commercial explotation allowed
;7:// you are only allowed to use this code in navy seals: covert operations 
;8:// a quake3 arena modifiation
;9:// defcon-x@ns-co.net
;10:
;11:#include "g_local.h"
;12:
;13:// removed as defconx said 07.01.2004
;14:// #include "camclient.h"
;15:
;16:void NS_SendPlayersStatusToAllPlayers( int clientNum, int status );
;17:void NS_SendStatusMessageToTeam ( gentity_t *affected, int status, int team );
;18:// g_client.c -- client functions that don't happen every frame
;19:
;20:// static vec3_t	playerMins = {-15, -15, -24};
;21:// static vec3_t	playerMaxs = { 15, 15, 32};
;22:
;23:static vec3_t	playerMins = {-10, -10, MINS_Z};
;24:static vec3_t	playerMaxs = {10, 10, MAXS_Z};
;25:
;26:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;27:potential spawning position for deathmatch games.
;28:The first time a player enters the game, they will be at an 'initial' spot.
;29:Targets will be fired when someone spawns in on them.
;30:"nobots" will prevent bots from using this spot.
;31:"nohumans" will prevent non-bots from using this spot.
;32:*/
;33:void SP_info_player_deathmatch( gentity_t *ent ) {
line 36
;34:	int		i;
;35:
;36:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $69
ARGP4
ADDRGP4 $70
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 37
;37:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $71
line 38
;38:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 39
;39:	}
LABELV $71
line 40
;40:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $73
ARGP4
ADDRGP4 $70
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 41
;41:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $74
line 42
;42:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 43
;43:	}
LABELV $74
line 44
;44:}
LABELV $68
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 49
;45:
;46:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;47:equivelant to info_player_deathmatch
;48:*/
;49:void SP_info_player_start(gentity_t *ent) {
line 50
;50:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $77
ASGNP4
line 51
;51:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 52
;52:}
LABELV $76
endproc SP_info_player_start 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 57
;53:
;54:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;55:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;56:*/
;57:void SP_info_player_intermission( gentity_t *ent ) {
line 59
;58:
;59:}
LABELV $78
endproc SP_info_player_intermission 0 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 77
;60:
;61:
;62:
;63:/*
;64:=======================================================================
;65:
;66:  SelectSpawnPoint
;67:
;68:=======================================================================
;69:*/
;70:
;71:/*
;72:================
;73:SpotWouldTelefrag
;74:
;75:================
;76:*/
;77:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 83
;78:	int			i, num;
;79:	int			touch[MAX_GENTITIES];
;80:	gentity_t	*hit;
;81:	vec3_t		mins, maxs;
;82:
;83:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 84
;84:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 85
;85:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 87
;86:
;87:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $91
JUMPV
LABELV $88
line 88
;88:		hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 1108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 90
;89:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;90:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $92
line 91
;91:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $79
JUMPV
LABELV $92
line 94
;92:		}
;93:
;94:	}
LABELV $89
line 87
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $91
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $88
line 96
;95:
;96:	return qfalse;
CNSTI4 0
RETI4
LABELV $79
endproc SpotWouldTelefrag 4144 16
export SelectNearestDeathmatchSpawnPoint
proc SelectNearestDeathmatchSpawnPoint 40 12
line 107
;97:}
;98:
;99:/*
;100:================
;101:SelectNearestDeathmatchSpawnPoint
;102:
;103:Find the spot that we DON'T want to use
;104:================
;105:*/
;106:#define	MAX_SPAWN_POINTS	128
;107:gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
line 113
;108:	gentity_t	*spot;
;109:	vec3_t		delta;
;110:	float		dist, nearestDist;
;111:	gentity_t	*nearestSpot;
;112:
;113:	nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 114
;114:	nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 115
;115:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $96
JUMPV
LABELV $95
line 117
;116:
;117:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 119
;118:
;119:		VectorSubtract( spot->s.origin, from, delta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 120
;120:		dist = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 121
;121:		if ( dist < nearestDist ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $100
line 122
;122:			nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 123
;123:			nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 124
;124:		}
LABELV $100
line 125
;125:	}
LABELV $96
line 117
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $77
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $95
line 127
;126:
;127:	return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $94
endproc SelectNearestDeathmatchSpawnPoint 40 12
export SelectRandomDeathmatchSpawnPoint
proc SelectRandomDeathmatchSpawnPoint 532 12
line 139
;128:}
;129:
;130:
;131:/*
;132:================
;133:SelectRandomDeathmatchSpawnPoint
;134:
;135:go to a random point that doesn't telefrag
;136:================
;137:*/
;138:#define	MAX_SPAWN_POINTS	128
;139:gentity_t *SelectRandomDeathmatchSpawnPoint( void ) {
line 145
;140:	gentity_t	*spot;
;141:	int			count;
;142:	int			selection;
;143:	gentity_t	*spots[MAX_SPAWN_POINTS];
;144:
;145:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 146
;146:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $104
JUMPV
LABELV $103
line 148
;147:
;148:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 149
;149:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
EQI4 $106
line 150
;150:			continue;
ADDRGP4 $104
JUMPV
LABELV $106
line 152
;151:		}
;152:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 153
;153:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 154
;154:	}
LABELV $104
line 148
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $77
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
line 156
;155:
;156:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $108
line 157
;157:		return G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $77
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $102
JUMPV
LABELV $108
line 160
;158:	}
;159:
;160:	selection = rand() % count;
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 528
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 161
;161:	return spots[ selection ];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $102
endproc SelectRandomDeathmatchSpawnPoint 532 12
export SelectRandomFurthestSpawnPoint
proc SelectRandomFurthestSpawnPoint 572 12
line 171
;162:}
;163:
;164:/*
;165:===========
;166:SelectRandomFurthestSpawnPoint
;167:
;168:Chooses a player start, deathmatch start, etc
;169:============
;170:*/
;171:gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 179
;172:	gentity_t	*spot;
;173:	vec3_t		delta;
;174:	float		dist;
;175:	float		list_dist[64];
;176:	gentity_t	*list_spot[64];
;177:	int			numSpots, rnd, i, j;
;178:
;179:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 180
;180:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $112
JUMPV
LABELV $111
line 182
;181:
;182:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 183
;183:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $114
line 184
;184:			continue;
ADDRGP4 $112
JUMPV
LABELV $114
line 186
;185:		}
;186:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 556
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 187
;187:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 560
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 560
INDIRF4
ASGNF4
line 188
;188:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $118
line 189
;189:			if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $122
line 190
;190:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $124
line 191
;191:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $124
line 192
;192:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $126
line 193
;193:					list_dist[j] = list_dist[j-1];
ADDRLP4 564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 564
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 564
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 194
;194:					list_spot[j] = list_spot[j-1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 195
;195:				}
LABELV $127
line 192
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $129
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $126
line 196
;196:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 197
;197:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 198
;198:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 199
;199:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $120
line 200
;200:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 201
;201:				break;
ADDRGP4 $120
JUMPV
LABELV $122
line 203
;202:			}
;203:		}
LABELV $119
line 188
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $121
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $118
LABELV $120
line 204
;204:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $134
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $134
line 205
;205:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 206
;206:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 207
;207:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 208
;208:		}
LABELV $134
line 209
;209:	}
LABELV $112
line 182
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $77
ARGP4
ADDRLP4 548
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 548
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $111
line 210
;210:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $136
line 211
;211:		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $77
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
line 212
;212:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $138
line 213
;213:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $140
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $138
line 214
;214:		VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 215
;215:		origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 216
;216:		VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 217
;217:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $110
JUMPV
LABELV $136
line 221
;218:	}
;219:
;220:	// select a random spot from the spawn points furthest away
;221:	rnd = random() * (numSpots / 2);
ADDRLP4 552
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 552
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 223
;222:
;223:	VectorCopy (list_spot[rnd]->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 224
;224:	origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 225
;225:	VectorCopy (list_spot[rnd]->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 227
;226:
;227:	return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $110
endproc SelectRandomFurthestSpawnPoint 572 12
export SelectSpawnPoint
proc SelectSpawnPoint 4 12
line 237
;228:}
;229:
;230:/*
;231:===========
;232:SelectSpawnPoint
;233:
;234:Chooses a player start, deathmatch start, etc
;235:============
;236:*/
;237:gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 238
;238:	return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $141
endproc SelectSpawnPoint 4 12
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 12
line 277
;239:
;240:	/*
;241:	gentity_t	*spot;
;242:	gentity_t	*nearestSpot;
;243:
;244:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
;245:
;246:	spot = SelectRandomDeathmatchSpawnPoint ( );
;247:	if ( spot == nearestSpot ) {
;248:		// roll again if it would be real close to point of death
;249:		spot = SelectRandomDeathmatchSpawnPoint ( );
;250:		if ( spot == nearestSpot ) {
;251:			// last try
;252:			spot = SelectRandomDeathmatchSpawnPoint ( );
;253:		}		
;254:	}
;255:
;256:	// find a single player start spot
;257:	if (!spot) {
;258:		G_Error( "Couldn't find a spawn point" );
;259:	}
;260:
;261:	VectorCopy (spot->s.origin, origin);
;262:	origin[2] += 9;
;263:	VectorCopy (spot->s.angles, angles);
;264:
;265:	return spot;
;266:	*/
;267:}
;268:
;269:/*
;270:===========
;271:SelectInitialSpawnPoint
;272:
;273:Try to find a spawn point marked 'initial', otherwise
;274:use normal spawn selection.
;275:============
;276:*/
;277:gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
line 280
;278:	gentity_t	*spot;
;279:
;280:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $143
line 281
;281:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 282
;282:		if ( spot->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $146
line 283
;283:			break;
ADDRGP4 $145
JUMPV
LABELV $146
line 285
;284:		}
;285:	}
LABELV $144
line 281
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $77
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $143
LABELV $145
line 287
;286:
;287:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $150
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $148
LABELV $150
line 288
;288:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $142
JUMPV
LABELV $148
line 291
;289:	}
;290:
;291:	VectorCopy (spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 292
;292:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 293
;293:	VectorCopy (spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 295
;294:
;295:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $142
endproc SelectInitialSpawnPoint 20 12
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 304
;296:}
;297:
;298:/*
;299:===========
;300:SelectSpectatorSpawnPoint
;301:
;302:============
;303:*/
;304:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 305
;305:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 307
;306:
;307:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+7100
INDIRB
ASGNB 12
line 308
;308:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+7112
INDIRB
ASGNB 12
line 310
;309:
;310:	return NULL;
CNSTP4 0
RETP4
LABELV $151
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 326
;311:}
;312:
;313:/*
;314:=======================================================================
;315:
;316:BODYQUE
;317:
;318:=======================================================================
;319:*/
;320:
;321:/*
;322:===============
;323:InitBodyQue
;324:===============
;325:*/
;326:void InitBodyQue (void) {
line 330
;327:	int		i;
;328:	gentity_t	*ent;
;329:
;330:	level.bodyQueIndex = 0;
ADDRGP4 level+7132
CNSTI4 0
ASGNI4
line 331
;331:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $156
line 332
;332:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 333
;333:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $160
ASGNP4
line 334
;334:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 335
;335:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7136
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 336
;336:	}
LABELV $157
line 331
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $156
line 337
;337:}
LABELV $154
endproc InitBodyQue 12 0
export UnlinkBodyfromQueforClient
proc UnlinkBodyfromQueforClient 8 4
line 340
;338:
;339:void UnlinkBodyfromQueforClient( int clientNum )
;340:{
line 343
;341:	int i;
;342:
;343:	for (i=0; i<BODY_QUEUE_SIZE ; i++) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $163
line 344
;344:		if (  level.bodyQue[i]->r.ownerNum == clientNum  && level.bodyQue[i]->physicsObject )
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 level+7136
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $167
ADDRLP4 4
INDIRI4
ADDRGP4 level+7136
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $167
line 345
;345:		{
line 347
;346:			// free it
;347:			trap_UnlinkEntity( level.bodyQue[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7136
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 348
;348:			level.bodyQue[i]->physicsObject = qfalse; 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7136
ADDP4
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
line 349
;349:		}
LABELV $167
line 350
;350:	} 
LABELV $164
line 343
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $163
line 351
;351:}
LABELV $162
endproc UnlinkBodyfromQueforClient 8 4
export BodySink
proc BodySink 4 4
line 359
;352:/*
;353:=============
;354:BodySink
;355:
;356:After sitting around for five seconds, fall into the ground and dissapear
;357:=============
;358:*/
;359:void BodySink( gentity_t *ent ) {
line 362
;360:
;361:
;362:	if ( level.time - ent->timestamp > 30 * ONE_SECOND ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
SUBI4
CNSTI4 30000
LEI4 $174
line 364
;363:		// the body ques are never actually freed, they are just unlinked
;364:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 365
;365:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
line 366
;366:		return;	
ADDRGP4 $173
JUMPV
LABELV $174
line 368
;367:	} 
;368:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 369
;369:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 370
;370:}
LABELV $173
endproc BodySink 4 4
export BodyBloodPool
proc BodyBloodPool 0 12
line 379
;371:
;372:/*
;373:=============
;374:BodyBloodPool
;375:
;376:Sends tempentity to clients
;377:=============
;378:*/
;379:void BodyBloodPool( gentity_t *ent ) { 
line 381
;380:
;381:	G_AddEvent( ent, EV_BLOODPOOL, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 98
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 383
;382:
;383:	if (g_gametype.integer == GT_LTS )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $179
line 384
;384:	{
line 385
;385:		ent->nextthink = level.time + 600 * ONE_SECOND; // a max of 10 minutes
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 600000
ADDI4
ASGNI4
line 386
;386:		ent->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 387
;387:	}
ADDRGP4 $180
JUMPV
LABELV $179
line 389
;388:	else
;389:	{
line 390
;390:		ent->nextthink = level.time + 30 * ONE_SECOND; // stay 10seconds on ground
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 391
;391:		ent->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 392
;392:	}
LABELV $180
line 395
;393:
;394:	
;395:	ent->think = BodySink;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 BodySink
ASGNP4
line 397
;396: 
;397:}
LABELV $178
endproc BodyBloodPool 0 12
export BodyTouch
proc BodyTouch 20 12
line 400
;398:
;399:void BodyTouch( gentity_t *ent, gentity_t *other, trace_t *trace )
;400:{
line 402
;401:	// when somebody stepped on us, he actually see who he killed and he'll tell the over radio (if it's one of ours)
;402:	if ( !other || !other->client )
ADDRLP4 0
ADDRFP4 4
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
EQU4 $189
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $187
LABELV $189
line 403
;403:		return;
ADDRGP4 $186
JUMPV
LABELV $187
line 405
;404:
;405:	if ( ent->ns_team == other->client->sess.sessionTeam && ent->bot_chattime == 0 )
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
NEI4 $190
ADDRLP4 8
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
CNSTI4 0
NEI4 $190
line 406
;406:	{
line 407
;407:		NS_SendStatusMessageToTeam( ent, MS_DEAD, ent->ns_team );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 410
;408:		// BLUTENGEL 20040207 removed, need bot_chattime for
;409:		// bomb placement
;410:		ent->bot_chattime = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 1
ASGNI4
line 411
;411:	}
ADDRGP4 $191
JUMPV
LABELV $190
line 412
;412:	else if ( ent->ns_team == OtherTeam( other->client->sess.sessionTeam ) && ent->count == 0 )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $192
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $192
line 413
;413:	{
line 414
;414:		NS_SendStatusMessageToTeam( ent, MS_DEAD, OtherTeam(ent->ns_team) );
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 415
;415:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 416
;416:	}
LABELV $192
LABELV $191
line 417
;417:}
LABELV $186
endproc BodyTouch 20 12
export CopyToBodyQue
proc CopyToBodyQue 92 8
line 427
;418:
;419:/*
;420:=============
;421:CopyToBodyQue
;422:
;423:A player is respawning, so make an entity that looks
;424:just like the existing corpse to leave behind.
;425:=============
;426:*/
;427:void CopyToBodyQue( gentity_t *ent ) {
line 432
;428: 	int	i;
;429:	gentity_t		*body;
;430:	int			contents;
;431:
;432:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 436
;433:
;434://	G_Printf("waiting %i dead %i bbox_head %i\n", ent->client->sess.waiting, (ent->client->ps.pm_type == PM_DEAD ),( !Q_stricmp( ent->classname, "player_bbox_head") ) );
;435: 	if (
;436:		( !ent->client->sess.waiting || ent->client->ps.pm_type != PM_DEAD ) &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $198
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $195
LABELV $198
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $195
line 439
;437:		g_gametype.integer == GT_LTS
;438:		)
;439:		return;  
ADDRGP4 $194
JUMPV
LABELV $195
line 442
;440:
;441:	// if client is in a nodrop area, don't leave the body
;442:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 444
;443:
;444:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $199
line 445
;445:		return;
ADDRGP4 $194
JUMPV
LABELV $199
line 449
;446:	}
;447:
;448:	// grab a body que and cycle to the next one
;449:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 4
ADDRGP4 level+7132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7136
ADDP4
INDIRP4
ASGNP4
line 450
;450:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+7132
ADDRGP4 level+7132
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 64
MODI4
ASGNI4
line 452
;451:
;452:	ent->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 453
;453:	trap_UnlinkEntity (body);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 455
;454:
;455:	body->s = ent->s;
ADDRLP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 208
line 456
;456:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 459
;457: 
;458://	body->s.powerups = 0;	// clear powerups
;459:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 4
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 460
;460:	body->s.weapon = WP_NONE;
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 461
;461:	body->s.number = body - g_entities;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1108
DIVI4
ASGNI4
line 462
;462:	body->timestamp = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 463
;463:	body->physicsObject = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 464
;464:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 4
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 0
ASGNF4
line 465
;465:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $206
line 466
;466:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 467
;467:		body->s.pos.trTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 468
;468:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 469
;469:	} else {
ADDRGP4 $207
JUMPV
LABELV $206
line 470
;470:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 471
;471:	}
LABELV $207
line 472
;472:	body->s.event = 0;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 474
;473: 
;474:	for (i=WP_NUM_WEAPONS-1;i>0;i--)
ADDRLP4 0
CNSTI4 25
ASGNI4
LABELV $209
line 475
;475:	{
line 476
;476:		if (BG_GotWeapon( i , ent->client->ps.stats ) ) 
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $213
line 477
;477:			if ( BG_IsPrimary( i ) || BG_IsSecondary( i ) )
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $217
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_IsSecondary
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $215
LABELV $217
line 478
;478:				body->s.frame |= 1 << i;	
ADDRLP4 40
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
LABELV $215
LABELV $213
line 479
;479:	}
LABELV $210
line 474
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $209
line 483
;480:
;481:	// change the animation to the last-frame only, so the sequence
;482:	// doesn't repeat anew for the body
;483:	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $218
ADDRLP4 28
INDIRI4
CNSTI4 13
GTI4 $218
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $228
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $228
address $227
address $227
address $226
address $226
address $225
address $225
address $224
address $224
address $223
address $223
address $222
address $222
address $221
address $221
code
LABELV $221
line 486
;484:		case BOTH_DEATH_LEGS:
;485:		case BOTH_DEAD_LEGS:
;486:			body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD_LEGS;
ADDRLP4 40
CNSTI4 13
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 487
;487:			break;
ADDRGP4 $219
JUMPV
LABELV $222
line 490
;488:		case BOTH_DEATH_BACK:
;489:		case BOTH_DEAD_BACK:
;490:			body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD_BACK;
ADDRLP4 48
CNSTI4 11
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 491
;491:			break;
ADDRGP4 $219
JUMPV
LABELV $223
line 494
;492:		case BOTH_DEATH_NECK:
;493:		case BOTH_DEAD_NECK: 
;494:			body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD_NECK;
ADDRLP4 56
CNSTI4 9
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 495
;495:			break;
ADDRGP4 $219
JUMPV
LABELV $224
LABELV $218
line 499
;496:		case BOTH_DEATH_BLEED:
;497:		case BOTH_DEAD_BLEED:
;498:		default:
;499:			body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD_BLEED;
ADDRLP4 64
CNSTI4 7
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 500
;500:			break;
ADDRGP4 $219
JUMPV
LABELV $225
line 503
;501:		case BOTH_DEATH_STOMACH:
;502:		case BOTH_DEAD_STOMACH:
;503:			body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD_STOMACH;
ADDRLP4 72
CNSTI4 5
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 504
;504:			break;
ADDRGP4 $219
JUMPV
LABELV $226
line 507
;505:		case BOTH_DEATH_CHEST:
;506:		case BOTH_DEAD_CHEST: 
;507:			body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD_CHEST;
ADDRLP4 80
CNSTI4 3
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 508
;508:			break;
ADDRGP4 $219
JUMPV
LABELV $227
line 511
;509:		case BOTH_DEATH_FACE:
;510:		case BOTH_DEAD_FACE: 
;511:			body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD_FACE;
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 512
;512:			break;
LABELV $219
line 515
;513:	}
;514:
;515:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 36
CNSTI4 424
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 517
;516:
;517:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 40
CNSTI4 436
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 518
;518:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 44
CNSTI4 448
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 520
;519:
;520:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 48
CNSTI4 464
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 521
;521:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 52
CNSTI4 476
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 523
;522:
;523: 	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 4
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 524
;524:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 525
;525:	body->r.ownerNum = ent->s.number;
ADDRLP4 4
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 529
;526:
;527:	
;528:
;529:	body->nextthink = level.time + 250;
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 530
;530:	body->think = BodyBloodPool; 
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 BodyBloodPool
ASGNP4
line 535
;531:
;532: //	body->die = body_die;
;533:
;534:	// don't take more damage if already gibbed
;535:  	body->takedamage = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 537
;536:	 
;537:	if (g_gametype.integer == GT_LTS )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $230
line 538
;538:	{
line 539
;539:		body->touch = BodyTouch;
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 BodyTouch
ASGNP4
line 540
;540:		body->ns_team = ent->client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ASGNI4
line 541
;541:	}
LABELV $230
line 543
;542:
;543:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 544
;544:	VectorCopy ( ent->client->ps.viewangles, body->r.currentAngles );
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 545
;545:	VectorCopy ( ent->client->ps.viewangles, body->s.apos.trBase ) ;
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 547
;546:	// VectorCopy ( ent-> body->s.apos.trBase ); 
;547:	trap_LinkEntity (body);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 548
;548:}
LABELV $194
endproc CopyToBodyQue 92 8
export SetClientViewAngle
proc SetClientViewAngle 16 0
line 559
;549:
;550://======================================================================
;551:
;552:
;553:/*
;554:==================
;555:SetClientViewAngle
;556:
;557:==================
;558:*/
;559:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 563
;560:	int			i;
;561:
;562:	// set the delta angle
;563:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $234
line 566
;564:		int		cmdAngle;
;565:
;566:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 567
;567:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 568
;568:	}
LABELV $235
line 563
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $234
line 569
;569:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 570
;570:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 571
;571:}
LABELV $233
endproc SetClientViewAngle 16 0
export respawn
proc respawn 0 4
line 578
;572:
;573:/*
;574:================
;575:respawn
;576:================
;577:*/
;578:void respawn( gentity_t *ent ) {
line 582
;579://	gentity_t	*tent;
;580:
;581:	
;582:	CopyToBodyQue(ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 583
;583:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 590
;584:
;585:	/* defcon-X: do not....
;586:	// add a teleportation effect
;587:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
;588:	tent->s.clientNum = ent->s.clientNum;
;589:	*/
;590:}
LABELV $238
endproc respawn 0 4
export TeamCount
proc TeamCount 8 0
line 599
;591:
;592:/*
;593:================
;594:TeamCount
;595:
;596:Returns number of players on a team
;597:================
;598:*/
;599:team_t TeamCount( int ignoreClientNum, int team ) {
line 601
;600:	int		i;
;601:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 603
;602:
;603:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $243
JUMPV
LABELV $240
line 604
;604:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $245
line 605
;605:			continue;
ADDRGP4 $241
JUMPV
LABELV $245
line 607
;606:		}
;607:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $247
line 608
;608:			continue;
ADDRGP4 $241
JUMPV
LABELV $247
line 611
;609:		}	
;610:		// Navy Seals ++
;611:		if ( g_gametype.integer == GT_LTS && level.clients[i].pers.connected != CON_CONNECTED )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $249
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $249
line 612
;612:			continue;
ADDRGP4 $241
JUMPV
LABELV $249
line 614
;613:
;614:		if ( level.clients[i].pers.nsPC.playerclass <= CLASS_NONE)
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1560
ADDP4
INDIRI4
CNSTI4 0
GTI4 $252
line 615
;615:			continue;		
ADDRGP4 $241
JUMPV
LABELV $252
line 617
;616:		// Navy Seals --
;617:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1800
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $254
line 618
;618:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 619
;619:		}
LABELV $254
line 620
;620:	}
LABELV $241
line 603
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $243
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $240
line 622
;621:
;622:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $239
endproc TeamCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 632
;623:}
;624:
;625:/*
;626:================
;627:TeamLeader
;628:
;629:Returns the client number of the team leader
;630:================
;631:*/
;632:int TeamLeader( int team ) {
line 635
;633:	int		i;
;634:
;635:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $260
JUMPV
LABELV $257
line 636
;636:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $262
line 637
;637:			continue;
ADDRGP4 $258
JUMPV
LABELV $262
line 639
;638:		}
;639:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1800
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $264
line 640
;640:			if ( level.clients[i].sess.teamLeader )
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $266
line 641
;641:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $256
JUMPV
LABELV $266
line 642
;642:		}
LABELV $264
line 643
;643:	}
LABELV $258
line 635
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $260
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $257
line 645
;644:
;645:	return -1;
CNSTI4 -1
RETI4
LABELV $256
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 655
;646:}
;647:
;648:
;649:/*
;650:================
;651:PickTeam
;652:
;653:================
;654:*/
;655:team_t PickTeam( int ignoreClientNum ) {
line 658
;656:	int		counts[TEAM_NUM_TEAMS];
;657:
;658:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 659
;659:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 661
;660:
;661:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $271
line 662
;662:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $268
JUMPV
LABELV $271
line 664
;663:	}
;664:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $275
line 665
;665:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $268
JUMPV
LABELV $275
line 668
;666:	}
;667:	// equal team count, so join the team with the lowest score
;668:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 level+48+4
INDIRI4
LEI4 $279
line 669
;669:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $268
JUMPV
LABELV $279
line 671
;670:	}
;671:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $268
endproc PickTeam 24 8
proc ClientCleanName 48 12
line 679
;672:}
;673: 
;674:/*
;675:===========
;676:ClientCheckName
;677:============
;678:*/
;679:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 687
;680:	int		len, colorlessLen;
;681:	char	ch;
;682:	char  oldch;
;683:	char	*p;
;684:	int		spaces;
;685:
;686:	//save room for trailing null byte
;687:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 689
;688:
;689:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 690
;690:	colorlessLen = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 691
;691:	p = out;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
line 692
;692:	*p = 0;
ADDRLP4 20
INDIRP4
CNSTI1 0
ASGNI1
line 693
;693:	spaces = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 694
;694:	oldch = ' ';
ADDRLP4 12
CNSTI1 32
ASGNI1
ADDRGP4 $287
JUMPV
LABELV $286
line 696
;695:
;696:	while( 1 ) {
line 697
;697:		ch = *in++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRI1
ASGNI1
line 698
;698:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $289
line 699
;699:			break;
ADDRGP4 $288
JUMPV
LABELV $289
line 706
;700:		}
;701:
;702:		// BLUTENGEL
;703:		//
;704:		// do not allow special characters (could be produced by hex-editing
;705:		// the config file!)
;706:		if ( (ch < '!') || (ch > '~') ) continue;
ADDRLP4 28
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 33
LTI4 $293
ADDRLP4 28
INDIRI4
CNSTI4 126
LEI4 $291
LABELV $293
ADDRGP4 $287
JUMPV
LABELV $291
line 714
;707:
;708:		// don't allow leading spaces
;709:		//
;710:		// BLUTENGEL
;711:		// what about colors at the beginning, after that
;712:		// spaces are allowed???? weird, removing that
;713:		// if( !*p && ch == ' ' ) {
;714:		if (!colorlessLen && ch == ' ') {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $294
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $294
line 715
;715:			continue;
ADDRGP4 $287
JUMPV
LABELV $294
line 719
;716:		}
;717:
;718:		// check colors
;719:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $296
line 721
;720:			// solo trailing carat is not a color prefix
;721:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $298
line 722
;722:				break;
ADDRGP4 $288
JUMPV
LABELV $298
line 729
;723:			}
;724:
;725:			// don't allow black in a name, period
;726:			//
;727:			// BLUTENGEL:
;728:			// ignore ^^
;729:			if( (*in == '^') ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $300
line 730
;730:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 731
;731:				continue;
ADDRGP4 $287
JUMPV
LABELV $300
line 735
;732:			}
;733:
;734:			// make sure room in dest for both chars
;735:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $302
line 736
;736:				break;
ADDRGP4 $288
JUMPV
LABELV $302
line 739
;737:			}
;738:
;739:			*out++ = ch;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 740
;740:			*out++ = *in++;
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI1
ASGNI1
line 741
;741:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 742
;742:			continue;
ADDRGP4 $287
JUMPV
LABELV $296
line 749
;743:		}
;744:
;745:		// don't allow too many consecutive spaces
;746:		//
;747:		// BLUTENGEL
;748:		// removed repeated characters, not only spaces
;749:		if( ch == oldch ) {
ADDRLP4 0
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI1
CVII4 1
NEI4 $304
line 750
;750:			spaces++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 751
;751:			if( spaces > 3 ) {
ADDRLP4 16
INDIRI4
CNSTI4 3
LEI4 $305
line 752
;752:				continue;
ADDRGP4 $287
JUMPV
line 754
;753:			}
;754:		}
LABELV $304
line 755
;755:		else {
line 756
;756:			spaces = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 757
;757:		}
LABELV $305
line 759
;758:
;759:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $308
line 760
;760:			break;
ADDRGP4 $288
JUMPV
LABELV $308
line 763
;761:		}
;762:
;763:		*out++ = ch;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 764
;764:		oldch = ch;
ADDRLP4 12
ADDRLP4 0
INDIRI1
ASGNI1
line 765
;765:		colorlessLen++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 766
;766:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 767
;767:	}
LABELV $287
line 696
ADDRGP4 $286
JUMPV
LABELV $288
line 768
;768:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 771
;769:
;770:	// don't allow empty names
;771:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $312
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $310
LABELV $312
line 772
;772:		Q_strncpyz(p, "^1U^0ber^1N^0oob", outSize );
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 773
;773:	}
LABELV $310
line 774
;774:}
LABELV $285
endproc ClientCleanName 48 12
export ClientUserinfoChanged
proc ClientUserinfoChanged 3584 52
line 790
;775:
;776:qboolean NS_ActiveRound( void );
;777:
;778:/*
;779:===========
;780:ClientUserInfoChanged
;781:
;782:Called from ClientConnect when the player first connects and
;783:directly by the server system when the player updates a userinfo variable.
;784:
;785:The game can override any of the settings and call trap_SetUserinfo
;786:if desired.
;787:============
;788:*/
;789:
;790:void ClientUserinfoChanged( int clientNum ) {
line 804
;791:	gentity_t *ent;
;792:	int		team,i;//, health;
;793:	char	*s;
;794: 	char	e_head[MAX_QPATH],e_eyes[MAX_QPATH],e_mouth[MAX_QPATH];
;795:	char	custom[MAX_QPATH];
;796:	char	oldname[MAX_STRING_CHARS];
;797:	gclient_t	*client;
;798:	char	c1[MAX_INFO_STRING];
;799:	char	userinfo[MAX_INFO_STRING];
;800:
;801:	char	modelName[MAX_QPATH];
;802:	char	headName[MAX_QPATH];
;803:
;804:	ent = g_entities + clientNum;
ADDRLP4 1352
CNSTI4 1108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 805
;805:	client = ent->client;
ADDRLP4 0
ADDRLP4 1352
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 807
;806:
;807:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 810
;808:
;809:	// check for malformed or illegal info strings
;810:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 8
ARGP4
ADDRLP4 3476
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 3476
INDIRI4
CNSTI4 0
NEI4 $315
line 811
;811:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 8
ARGP4
ADDRGP4 $317
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 812
;812:	}
LABELV $315
line 815
;813:
;814:	// check for local client
;815:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 8
ARGP4
ADDRGP4 $318
ARGP4
ADDRLP4 3480
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3480
INDIRP4
ASGNP4
line 816
;816:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 3484
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3484
INDIRI4
CNSTI4 0
NEI4 $319
line 817
;817:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 818
;818:	}
LABELV $319
line 821
;819:  
;820:	// Is anti-lag turned on?
;821:	s = Info_ValueForKey ( userinfo, "cg_antiLag" );
ADDRLP4 8
ARGP4
ADDRGP4 $322
ARGP4
ADDRLP4 3488
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3488
INDIRP4
ASGNP4
line 822
;822:	client->pers.antiLag = atoi( s )?qtrue:qfalse;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 3496
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3496
INDIRI4
CNSTI4 0
EQI4 $324
ADDRLP4 3492
CNSTI4 1
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $324
ADDRLP4 3492
CNSTI4 0
ASGNI4
LABELV $325
ADDRLP4 0
INDIRP4
CNSTI4 1604
ADDP4
ADDRLP4 3492
INDIRI4
ASGNI4
line 825
;823:
;824:	// Is auto reload active
;825:	s = Info_ValueForKey ( userinfo, "cg_autoReload" );
ADDRLP4 8
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 3500
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3500
INDIRP4
ASGNP4
line 826
;826:	client->pers.autoReload = atoi( s )?qtrue:qfalse;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 3508
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3508
INDIRI4
CNSTI4 0
EQI4 $328
ADDRLP4 3504
CNSTI4 1
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $328
ADDRLP4 3504
CNSTI4 0
ASGNI4
LABELV $329
ADDRLP4 0
INDIRP4
CNSTI4 1608
ADDP4
ADDRLP4 3504
INDIRI4
ASGNI4
line 829
;827:
;828:	// Is autobandage active?
;829:	s = Info_ValueForKey ( userinfo, "cg_useBandage" );
ADDRLP4 8
ARGP4
ADDRGP4 $330
ARGP4
ADDRLP4 3512
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3512
INDIRP4
ASGNP4
line 830
;830:	client->pers.useBandage = atoi( s )?qtrue:qfalse;   
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 3520
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3520
INDIRI4
CNSTI4 0
EQI4 $332
ADDRLP4 3516
CNSTI4 1
ASGNI4
ADDRGP4 $333
JUMPV
LABELV $332
ADDRLP4 3516
CNSTI4 0
ASGNI4
LABELV $333
ADDRLP4 0
INDIRP4
CNSTI4 1612
ADDP4
ADDRLP4 3516
INDIRI4
ASGNI4
line 833
;831:
;832:	// Is autobandage active?
;833:	i = atoi ( Info_ValueForKey ( userinfo, "cg_radarUpdate" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $334
ARGP4
ADDRLP4 3524
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3524
INDIRP4
ARGP4
ADDRLP4 3528
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1356
ADDRLP4 3528
INDIRI4
ASGNI4
line 835
;834:	
;835:	if ( i < 500 )
ADDRLP4 1356
INDIRI4
CNSTI4 500
GEI4 $335
line 836
;836:		i = 500;
ADDRLP4 1356
CNSTI4 500
ASGNI4
LABELV $335
line 838
;837:
;838:	client->pers.radarUpdateTime = i;   
ADDRLP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDRLP4 1356
INDIRI4
ASGNI4
line 841
;839:
;840:	// get the quitmessage
;841:	s = Info_ValueForKey ( userinfo, "quitmsg" );
ADDRLP4 8
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 3532
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3532
INDIRP4
ASGNP4
line 842
;842:	Q_strncpyz( client->pers.quitMsg, s, sizeof( client->pers.quitMsg ) );
ADDRLP4 0
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 845
;843:
;844:	// character
;845:	s = Info_ValueForKey ( userinfo, "character" );
ADDRLP4 8
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 3536
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3536
INDIRP4
ASGNP4
line 846
;846:	{
line 847
;847:		if ( strlen(s) < 7 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 3540
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 3540
INDIRI4
CNSTI4 7
GEI4 $339
line 848
;848:			s = "C111111";
ADDRLP4 4
ADDRGP4 $341
ASGNP4
line 849
;849:		}
LABELV $339
line 852
;850:
;851:		// only recalc the character if it's changed
;852:		if ( Q_stricmp( client->pers.character, s ) ) // it's not the same 
ADDRLP4 0
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 3544
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3544
INDIRI4
CNSTI4 0
EQI4 $342
line 853
;853:		{
line 854
;854:			Q_strncpyz( client->pers.character, s, sizeof( client->pers.character ) );	
ADDRLP4 0
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 855
;855:			NS_RecalcCharacter( ent );
ADDRLP4 1352
INDIRP4
ARGP4
ADDRGP4 NS_RecalcCharacter
CALLV
pop
line 856
;856:		}
LABELV $342
line 857
;857:	}
line 860
;858:
;859:	// set name
;860:	if ( !NS_ActiveRound( ) || client->pers.connected == CON_CONNECTING )
ADDRLP4 3540
ADDRGP4 NS_ActiveRound
CALLI4
ASGNI4
ADDRLP4 3540
INDIRI4
CNSTI4 0
EQI4 $346
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $344
LABELV $346
line 861
;861:	{
line 862
;862:		Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 2448
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 863
;863:		s = Info_ValueForKey (userinfo, "name");
ADDRLP4 8
ARGP4
ADDRGP4 $347
ARGP4
ADDRLP4 3544
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3544
INDIRP4
ASGNP4
line 868
;864:		
;865:		// BLUTENGEL:
;866:		//
;867:		// really sick, the input string s will be manipulated
;868:		ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 870
;869:
;870:		if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
NEI4 $348
line 871
;871:			if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 1808
ADDP4
INDIRI4
CNSTI4 3
NEI4 $350
line 872
;872:				Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 $352
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 873
;873:			}
LABELV $350
line 874
;874:		}
LABELV $348
line 876
;875:
;876:		if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $353
line 877
;877:			if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 2448
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 3548
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3548
INDIRI4
CNSTI4 0
EQI4 $355
line 878
;878:				trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, 
ADDRGP4 $357
ARGP4
ADDRLP4 2448
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 3552
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 3552
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 880
;879:					client->pers.netname) );
;880:			}
LABELV $355
line 881
;881:		}
LABELV $353
line 882
;882:	}
LABELV $344
line 887
;883:
;884:	// set model
;885:
;886:	// bots set their team a few frames later
;887:	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
LTI4 $358
CNSTI4 1108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $358
line 888
;888:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 8
ARGP4
ADDRGP4 $363
ARGP4
ADDRLP4 3544
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3544
INDIRP4
ASGNP4
line 889
;889:		if ( !Q_stricmp( s, "seals" ) || !Q_stricmp( s, "s" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $366
ARGP4
ADDRLP4 3548
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3548
INDIRI4
CNSTI4 0
EQI4 $368
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $367
ARGP4
ADDRLP4 3552
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3552
INDIRI4
CNSTI4 0
NEI4 $364
LABELV $368
line 890
;890:			team = TEAM_RED;
ADDRLP4 3472
CNSTI4 1
ASGNI4
line 891
;891:		} else if ( !Q_stricmp( s, "tangos" ) || !Q_stricmp( s, "t" ) ) {
ADDRGP4 $365
JUMPV
LABELV $364
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $371
ARGP4
ADDRLP4 3556
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3556
INDIRI4
CNSTI4 0
EQI4 $373
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 3560
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3560
INDIRI4
CNSTI4 0
NEI4 $369
LABELV $373
line 892
;892:			team = TEAM_BLUE;
ADDRLP4 3472
CNSTI4 2
ASGNI4
line 893
;893:		} else {
ADDRGP4 $370
JUMPV
LABELV $369
line 895
;894:			// pick the team with the least number of players
;895:			team = PickTeam( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 3564
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 3472
ADDRLP4 3564
INDIRI4
ASGNI4
line 896
;896:		}
LABELV $370
LABELV $365
line 898
;897: 
;898:		{
line 901
;899:		// add bot class stuff
;900:		// bot class shit 
;901:			float a = random() ;
ADDRLP4 3572
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 3568
ADDRLP4 3572
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 902
;902:			int class_num = CLASS_NONE;
ADDRLP4 3564
CNSTI4 0
ASGNI4
line 904
;903:
;904:			if (a <= 0.2)
ADDRLP4 3568
INDIRF4
CNSTF4 1045220557
GTF4 $374
line 905
;905:				class_num = CLASS_RECON;
ADDRLP4 3564
CNSTI4 1
ASGNI4
ADDRGP4 $375
JUMPV
LABELV $374
line 906
;906:			else if (a <= 0.4)
ADDRLP4 3568
INDIRF4
CNSTF4 1053609165
GTF4 $376
line 907
;907:				class_num = CLASS_ASSAULT;
ADDRLP4 3564
CNSTI4 2
ASGNI4
ADDRGP4 $377
JUMPV
LABELV $376
line 908
;908:			else if (a <= 0.6)
ADDRLP4 3568
INDIRF4
CNSTF4 1058642330
GTF4 $378
line 909
;909:				class_num = CLASS_HEAVYSUPPORT;
ADDRLP4 3564
CNSTI4 4
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $378
line 910
;910:			else if ( a <= 0.8 )
ADDRLP4 3568
INDIRF4
CNSTF4 1061997773
GTF4 $380
line 911
;911:				class_num = CLASS_SNIPER; 
ADDRLP4 3564
CNSTI4 5
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $380
line 913
;912:			else
;913:				class_num = CLASS_DEMOMAN; 
ADDRLP4 3564
CNSTI4 6
ASGNI4
LABELV $381
LABELV $379
LABELV $377
LABELV $375
line 915
;914:
;915:			SetClass(ent, class_num); 
ADDRLP4 1352
INDIRP4
ARGP4
ADDRLP4 3564
INDIRI4
ARGI4
ADDRGP4 SetClass
CALLV
pop
line 916
;916:		}  
line 917
;917:	}
ADDRGP4 $359
JUMPV
LABELV $358
line 918
;918:	else {
line 919
;919:		team = client->sess.sessionTeam;
ADDRLP4 3472
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ASGNI4
line 920
;920:	}
LABELV $359
line 922
;921:
;922:	Q_strncpyz( custom, "0",sizeof(custom ) );
ADDRLP4 1360
ARGP4
ADDRGP4 $70
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 924
;923: 
;924:	{	// use the model we want
line 927
;925:		char		*slash;
;926:
;927:		Q_strncpyz( modelName, Info_ValueForKey (userinfo, "model"), sizeof( modelName ) );
ADDRLP4 8
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 3548
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ARGP4
ADDRLP4 3548
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 929
;928:
;929:		slash = strchr( modelName, '/' );
ADDRLP4 1032
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 3552
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 3544
ADDRLP4 3552
INDIRP4
ASGNP4
line 930
;930:		if ( !slash ) {
ADDRLP4 3544
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $383
line 932
;931:			// modelName didn not include a skin name
;932:			Q_strncpyz( headName, "curtis", sizeof( headName ) );
ADDRLP4 1160
ARGP4
ADDRGP4 $385
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 933
;933:		} else {
ADDRGP4 $384
JUMPV
LABELV $383
line 934
;934:			Q_strncpyz( headName, slash + 1, sizeof( headName ) );
ADDRLP4 1160
ARGP4
ADDRLP4 3544
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 936
;935:			// truncate modelName
;936:			*slash = 0;
ADDRLP4 3544
INDIRP4
CNSTI1 0
ASGNI1
line 937
;937:		}
LABELV $384
line 939
;938: 
;939:	}
line 941
;940:
;941:	Q_strncpyz( e_eyes, Info_ValueForKey (userinfo, "e_eyes"), sizeof( e_eyes ) ); 
ADDRLP4 8
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 3544
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1288
ARGP4
ADDRLP4 3544
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 942
;942: 	Q_strncpyz( e_mouth, Info_ValueForKey (userinfo, "e_mouth"), sizeof( e_mouth ) );
ADDRLP4 8
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 3548
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1224
ARGP4
ADDRLP4 3548
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 943
;943:	Q_strncpyz( e_head, Info_ValueForKey (userinfo, "e_head"), sizeof( e_head ) ); 
ADDRLP4 8
ARGP4
ADDRGP4 $388
ARGP4
ADDRLP4 3552
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1096
ARGP4
ADDRLP4 3552
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 946
;944:   
;945:	// check and confirm (or change) the users looks!
;946:	NS_ValidatePlayerLooks( client->sess.sessionTeam,
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
ARGP4
ADDRLP4 1288
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1160
ARGP4
ADDRGP4 NS_ValidatePlayerLooks
CALLV
pop
line 951
;947:		e_head, e_eyes, e_mouth, modelName, headName ); 
;948:
;949:	// for the player to the VIP model if he's the VIP
;950:	// do this after validating the looks, so he won't change it back to seal
;951:	if ( client->ns.is_vip )
ADDRLP4 0
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 0
EQI4 $389
line 952
;952:	{
line 953
;953:		Q_strncpyz( modelName, "vip_male", sizeof(modelName) );
ADDRLP4 1032
ARGP4
ADDRGP4 $391
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 954
;954:		Q_strncpyz( headName, "vip", sizeof(headName) );
ADDRLP4 1160
ARGP4
ADDRGP4 $392
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 955
;955:	}
LABELV $389
line 958
;956:
;957:	// apply the "hardcoded" looks 
;958:	if ( client->pers.nsPC.is_defconx_cap )
ADDRLP4 0
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
CNSTI4 0
EQI4 $393
line 959
;959:		Com_sprintf( e_head, sizeof(e_head), "cap_tm_defcon" );
ADDRLP4 1096
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $395
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $394
JUMPV
LABELV $393
line 960
;960: 	else if ( client->pers.nsPC.is_defconx_hat )
ADDRLP4 0
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $396
line 961
;961:		Com_sprintf( e_head, sizeof(e_head), "sealhat_tm_defcon" );
ADDRLP4 1096
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $398
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $397
JUMPV
LABELV $396
line 962
;962:	else if ( client->pers.nsPC.is_democritus )
ADDRLP4 0
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $399
line 963
;963:	{
line 964
;964:		if ( client->pers.nsPC.is_democritus == 2 )
ADDRLP4 0
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
CNSTI4 2
NEI4 $401
line 965
;965:			Com_sprintf( e_mouth, sizeof(e_mouth), "dcs_mask2" );
ADDRLP4 1224
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $403
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $400
JUMPV
LABELV $401
line 967
;966:		else
;967:			Com_sprintf( e_mouth, sizeof(e_mouth), "dcs_mask" ); 
ADDRLP4 1224
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $404
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 968
;968:	}
ADDRGP4 $400
JUMPV
LABELV $399
line 969
;969:	else if ( client->pers.nsPC.is_hoak )
ADDRLP4 0
INDIRP4
CNSTI4 1592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $405
line 970
;970:	{
line 971
;971:		if ( client->pers.nsPC.is_hoak == 2 )
ADDRLP4 0
INDIRP4
CNSTI4 1592
ADDP4
INDIRI4
CNSTI4 2
NEI4 $407
line 972
;972:			Com_sprintf( e_eyes, sizeof(e_eyes), "nvg_hoak" );
ADDRLP4 1288
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $409
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $406
JUMPV
LABELV $407
line 974
;973:		else
;974:			Com_sprintf( e_eyes, sizeof(e_eyes), "mask_hoak" ); 
ADDRLP4 1288
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $410
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 975
;975:	}
ADDRGP4 $406
JUMPV
LABELV $405
line 976
;976:	else if ( client->pers.nsPC.is_ogun )
ADDRLP4 0
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $411
line 977
;977:	{
line 978
;978:		if ( client->pers.nsPC.is_ogun == 2 )
ADDRLP4 0
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
CNSTI4 2
NEI4 $413
line 979
;979:			Com_sprintf( e_eyes, sizeof(e_eyes), "glasses_ogun2" );
ADDRLP4 1288
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $415
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $414
JUMPV
LABELV $413
line 981
;980:		else
;981:			Com_sprintf( e_eyes, sizeof(e_eyes), "glasses_ogun" ); 
ADDRLP4 1288
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $416
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $414
line 982
;982:	}
LABELV $411
LABELV $406
LABELV $400
LABELV $397
LABELV $394
line 986
;983:	// Navy Seals -- 
;984:
;985:	// teamInfo
;986:	s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 8
ARGP4
ADDRGP4 $417
ARGP4
ADDRLP4 3556
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3556
INDIRP4
ASGNP4
line 987
;987:	if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $420
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 3564
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3564
INDIRI4
CNSTI4 0
EQI4 $418
LABELV $420
line 988
;988:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 989
;989:	} else {
ADDRGP4 $419
JUMPV
LABELV $418
line 990
;990:		client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 991
;991:	} 
LABELV $419
line 994
;992:
;993:	// colors
;994:	strcpy(c1, Info_ValueForKey( userinfo, "color" )); 
ADDRLP4 8
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 3568
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1424
ARGP4
ADDRLP4 3568
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 998
;995: 
;996:	// send over a subset of the userinfo keys so other clients can
;997:	// print scoreboards, display models, and play custom sounds
;998:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1352
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $422
line 999
;999:		s = va("n\\%s\\t\\%i\\model\\%s/%s\\c1\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\e_eyes\\%s\\e_head\\%s\\e_mouth\\%s",
ADDRLP4 8
ARGP4
ADDRGP4 $425
ARGP4
ADDRLP4 3572
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $424
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1424
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRI4
ARGI4
ADDRLP4 3572
INDIRP4
ARGP4
ADDRLP4 1288
ARGP4
ADDRLP4 1096
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 3580
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3580
INDIRP4
ASGNP4
line 1003
;1000:			client->pers.netname, client->sess.sessionTeam, modelName, headName, c1,
;1001:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;1002:			Info_ValueForKey( userinfo, "skill" ), e_eyes,e_head,e_mouth );
;1003:	} else {
ADDRGP4 $423
JUMPV
LABELV $422
line 1004
;1004:		s = va("n\\%s\\t\\%i\\model\\%s/%s\\c1\\%s\\hc\\%i\\w\\%i\\l\\%i\\e_eyes\\%s\\e_head\\%s\\e_mouth\\%s",
ADDRGP4 $426
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1424
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRI4
ARGI4
ADDRLP4 1288
ARGP4
ADDRLP4 1096
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 3576
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 3576
INDIRP4
ASGNP4
line 1007
;1005:			client->pers.netname, client->sess.sessionTeam, modelName, headName, c1,
;1006:			client->pers.maxHealth, client->sess.wins, client->sess.losses , e_eyes,e_head,e_mouth );
;1007:	}
LABELV $423
line 1009
;1008:
;1009:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 548
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1011
;1010:
;1011:	G_LogPrintf( "ClientUserinfoChanged: [%i] \"%s\"\n", clientNum, s );
ADDRGP4 $427
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1012
;1012:}
LABELV $314
endproc ClientUserinfoChanged 3584 52
export ClientConnect
proc ClientConnect 1064 12
line 1035
;1013:
;1014:
;1015:/*
;1016:===========
;1017:ClientConnect
;1018:
;1019:Called when a player begins connecting to the server.
;1020:Called again for every map change or tournement restart.
;1021:
;1022:The session information will be valid after exit.
;1023:
;1024:Return NULL if the client should be allowed, otherwise return
;1025:a string with the reason for denial.
;1026:
;1027:Otherwise, the client will be sent the current gamestate
;1028:and will eventually get to ClientBegin.
;1029:
;1030:firstTime will be qtrue the very first time a client connects
;1031:to the server machine, but qfalse on map changes and tournement
;1032:restarts.
;1033:============
;1034:*/
;1035:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 1042
;1036:	char		*value;
;1037://	char		*areabits;
;1038:	gclient_t	*client;
;1039:	char		userinfo[MAX_INFO_STRING];
;1040:	gentity_t	*ent;
;1041:
;1042:	ent = &g_entities[ clientNum ];
ADDRLP4 1032
CNSTI4 1108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1044
;1043:
;1044:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1047
;1045:
;1046:	// check to see if they are on the banned IP list
;1047:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 4
ARGP4
ADDRGP4 $318
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1036
INDIRP4
ASGNP4
line 1048
;1048:	if ( G_FilterPacket( value ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $429
line 1049
;1049:		return "You are banned from this server.";
ADDRGP4 $431
RETP4
ADDRGP4 $428
JUMPV
LABELV $429
line 1053
;1050:	}
;1051:
;1052:	// check for a password
;1053:	value = Info_ValueForKey (userinfo, "password");
ADDRLP4 4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1044
INDIRP4
ASGNP4
line 1054
;1054:	if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $433
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $437
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $433
ADDRGP4 g_password+16
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $433
line 1055
;1055:		strcmp( g_password.string, value) != 0) {
line 1056
;1056:		return "Invalid password";
ADDRGP4 $439
RETP4
ADDRGP4 $428
JUMPV
LABELV $433
line 1060
;1057:	}
;1058:
;1059:	// they can connect
;1060:	ent->client = level.clients + clientNum;
ADDRLP4 1032
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 7668
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1061
;1061:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1065
;1062:
;1063://	areabits = client->areabits;
;1064:
;1065:	memset( client, 0, sizeof(*client) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7668
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1067
;1066:
;1067:	client->pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 1070
;1068:
;1069:	// read or initialize the session data
;1070:	if ( firstTime || level.newSession ) {
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1056
INDIRI4
NEI4 $443
ADDRGP4 level+68
INDIRI4
ADDRLP4 1056
INDIRI4
EQI4 $440
LABELV $443
line 1071
;1071:		G_InitSessionData( client, userinfo );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_InitSessionData
CALLV
pop
line 1072
;1072:	}
LABELV $440
line 1073
;1073:	G_ReadSessionData( client ); 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1076
;1074:
;1075:	// get and distribute relevent paramters
;1076:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $444
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1077
;1077:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1080
;1078:
;1079:	// don't do the "xxx connected" messages if they were caried over from previous level
;1080:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $445
line 1081
;1081:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname) );
ADDRGP4 $447
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1082
;1082:	}
LABELV $445
line 1084
;1083:
;1084:	if ( g_gametype.integer >= GT_TEAM &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
LTI4 $448
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $448
line 1085
;1085:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1086
;1086:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1087
;1087:	}
LABELV $448
line 1090
;1088:
;1089:	// count current clients and rank for scoreboard
;1090:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1092
;1091:
;1092:	if ( client->sess.sessionTeam == TEAM_SPECTATOR )
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
NEI4 $451
line 1093
;1093:		client->sess.waiting = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1828
ADDP4
CNSTI4 1
ASGNI4
LABELV $451
line 1100
;1094:
;1095:	// for statistics
;1096://	client->areabits = areabits;
;1097://	if ( !client->areabits )
;1098://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;1099:
;1100:	return NULL;
CNSTP4 0
RETP4
LABELV $428
endproc ClientConnect 1064 12
export ClientBegin
proc ClientBegin 36 12
line 1112
;1101:}
;1102:
;1103:/*
;1104:===========
;1105:ClientBegin
;1106:
;1107:called when a client has finished connecting, and is ready
;1108:to be placed into the level.  This will happen every level load,
;1109:and on transition between teams, but doesn't happen on respawns
;1110:============
;1111:*/
;1112:void ClientBegin( int clientNum ) {
line 1118
;1113:	gentity_t	*ent;
;1114:	gclient_t	*client;
;1115:	gentity_t	*tent;
;1116:	int			flags;
;1117:
;1118:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 1108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1120
;1119:
;1120:	client = level.clients + clientNum;
ADDRLP4 4
CNSTI4 7668
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1122
;1121:
;1122:	if ( ent->r.linked ) {
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $454
line 1123
;1123:		trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1124
;1124:	}
LABELV $454
line 1125
;1125:	G_InitGentity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1126
;1126:	ent->touch = 0;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTP4 0
ASGNP4
line 1127
;1127:	ent->pain = 0;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTP4 0
ASGNP4
line 1128
;1128:	ent->client = client;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1130
;1129:
;1130:	client->pers.connected = CON_CONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 2
ASGNI4
line 1131
;1131:	client->pers.enterTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1132
;1132:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 1133
;1133:	client->pers.lmt = level.time; // remember this as the last message sent to client
ADDRLP4 4
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1140
;1134:
;1135:	// save eflags around this, because changing teams will
;1136:	// cause this to happen with a valid entity, and we
;1137:	// want to make sure the teleport bit is set right
;1138:	// so the viewpoint doesn't interpolate through the
;1139:	// world to the new position
;1140:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1141
;1141:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 468
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1142
;1142:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1145
;1143:
;1144:	// force to spectator
;1145:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ||
ADDRLP4 16
CNSTI4 3
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $461
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $458
LABELV $461
line 1147
;1146:		g_gametype.integer == GT_LTS )
;1147:		client->sess.waiting = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1828
ADDP4
CNSTI4 1
ASGNI4
LABELV $458
line 1149
;1148: 
;1149:	NS_ClearInventory( ent ); 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 NS_ClearInventory
CALLV
pop
line 1151
;1150:
;1151:	if ( client->sess.sessionTeam != TEAM_SPECTATOR )
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $462
line 1152
;1152: 		SetClass( ent, CLASS_CUSTOM );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 SetClass
CALLV
pop
LABELV $462
line 1154
;1153:
;1154:	ent->health = 0; 
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 1157
;1155: 
;1156:	// locate ent at a spawn point
;1157:	ClientSpawn( ent ); 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1159
;1158:
;1159:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $464
line 1161
;1160:		// send event
;1161:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 49
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 1162
;1162:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 24
CNSTI4 168
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1164
;1163:
;1164:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
ADDRGP4 $466
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1165
;1165:	}
LABELV $464
line 1168
;1166:	
;1167:	// Navy Seals -- 
;1168:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $467
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1171
;1169:
;1170:	// count current clients and rank for scoreboard
;1171:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1173
;1172:
;1173:	if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $468
line 1174
;1174:	{
line 1178
;1175:		gitem_t *pri,*sec;
;1176:		//PrintMsg(NULL, S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: weapons changed for client %i\n", clientNum);
;1177:		// primary weapon
;1178:		if ( ent->client->sess.sessionTeam == TEAM_BLUE )
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $471
line 1179
;1179:			ent->client->pers.nsInven.primaryweapon = WP_MAC10;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 13
ASGNI4
ADDRGP4 $472
JUMPV
LABELV $471
line 1181
;1180:		else
;1181:			ent->client->pers.nsInven.primaryweapon = WP_MP5;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 14
ASGNI4
LABELV $472
line 1184
;1182:
;1183:		// secondary
;1184:		if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $473
line 1185
;1185:			ent->client->pers.nsInven.secondaryweapon = WP_GLOCK;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 7
ASGNI4
ADDRGP4 $474
JUMPV
LABELV $473
line 1187
;1186:		else
;1187:			ent->client->pers.nsInven.secondaryweapon = WP_MK23;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 6
ASGNI4
LABELV $474
line 1188
;1188:		ent->client->pers.nsPC.style = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 0
ASGNI4
line 1190
;1189:
;1190:		pri = BG_FindItemForWeapon( ent->client->pers.nsInven.primaryweapon );
ADDRLP4 0
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
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 1191
;1191:		sec = BG_FindItemForWeapon( ent->client->pers.nsInven.secondaryweapon );
ADDRLP4 0
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
ADDRLP4 24
ADDRLP4 32
INDIRP4
ASGNP4
line 1193
;1192:	
;1193:		ent->client->pers.nsInven.ammo[pri->giAmmoTag] = 5;
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 5
ASGNI4
line 1194
;1194:		ent->client->pers.nsInven.ammo[sec->giAmmoTag] = 5;
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 688
ADDP4
ADDP4
CNSTI4 5
ASGNI4
line 1197
;1195:
;1196:		// powerups
;1197:		ent->client->pers.nsInven.powerups[PW_VEST] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 1
ASGNI4
line 1198
;1198:		ent->client->pers.nsInven.powerups[PW_HELMET] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 0
ASGNI4
line 1200
;1199:
;1200:		NS_NavySeals_ClientInit( ent, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 NS_NavySeals_ClientInit
CALLV
pop
line 1201
;1201:	}
LABELV $468
line 1202
;1202:}
LABELV $453
endproc ClientBegin 36 12
export ClientSpawn
proc ClientSpawn 2580 16
line 1213
;1203:
;1204:/*
;1205:===========
;1206:ClientSpawn
;1207:
;1208:Called every time a client is placed fresh in the world:
;1209:after the first ClientBegin, and after each respawn
;1210:Initializes all non-persistant parts of playerState
;1211:============
;1212:*/
;1213:void ClientSpawn(gentity_t *ent) {
line 1232
;1214:	int		index;
;1215:	vec3_t	spawn_origin, spawn_angles;
;1216:	gclient_t	*client;
;1217:	int		i;
;1218:	clientPersistant_t	saved;
;1219:	clientSession_t		savedSess;
;1220:	int		persistant[MAX_PERSISTANT];
;1221:	gentity_t	*spawnPoint;
;1222:	int		flags;
;1223:	int		savedPing;
;1224://	char	*savedAreaBits;
;1225:	int		accuracy_hits, accuracy_shots;
;1226:	int		savedEvents[MAX_PS_EVENTS];
;1227:	int		eventSequence;
;1228:	char	userinfo[MAX_INFO_STRING];
;1229:	int		rewards,kills,knifekills;
;1230:
;1231:
;1232:	index = ent - g_entities;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1108
DIVI4
ASGNI4
line 1233
;1233:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1236
;1234:
;1235:	// select spawnpoint
;1236:	spawnPoint = SelectSpawnPoint ( 
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 2532
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 92
ADDRLP4 2532
INDIRP4
ASGNP4
line 1246
;1237:		client->ps.origin, 
;1238:		spawn_origin, spawn_angles);
;1239:
;1240:	// find a spawn point
;1241:	// do it before setting health back up, so farthest
;1242:	// ranging doesn't count this client
;1243:
;1244:	// if we just died, just spawn directly where we died so we can track the following action
;1245:	
;1246:	if ( client->sess.waiting && ent->r.contents == CONTENTS_CORPSE && ( client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE ) )
ADDRLP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 67108864
NEI4 $476
ADDRLP4 2540
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2540
INDIRI4
CNSTI4 1
EQI4 $478
ADDRLP4 2540
INDIRI4
CNSTI4 2
NEI4 $476
LABELV $478
line 1247
;1247:	{
line 1249
;1248:		// spawn right in place of death
;1249:		VectorCopy( client->ps.origin, spawn_origin );
ADDRLP4 80
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1250
;1250:		spawn_origin[2] += 15;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1251
;1251:	}
ADDRGP4 $477
JUMPV
LABELV $476
line 1252
;1252:	else if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
NEI4 $480
line 1253
;1253:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 80
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 2544
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 92
ADDRLP4 2544
INDIRP4
ASGNP4
line 1255
;1254:						spawn_origin, spawn_angles);
;1255:	} else if (g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $481
JUMPV
LABELV $480
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
LTI4 $482
line 1257
;1256:		// all base oriented team games use the team spawn points
;1257:		spawnPoint = SelectTeamSpawnPoint ( 
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 2548
ADDRGP4 SelectTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 92
ADDRLP4 2548
INDIRP4
ASGNP4
line 1261
;1258:						client->sess.sessionTeam, 
;1259:						client->pers.teamState.state, 
;1260:						spawn_origin, spawn_angles);
;1261:	} else {
ADDRGP4 $483
JUMPV
LABELV $482
LABELV $485
line 1262
;1262:		do {
line 1264
;1263:			// the first spawn should be at a good looking spot
;1264:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 2548
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 2548
INDIRI4
NEI4 $488
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 2548
INDIRI4
EQI4 $488
line 1265
;1265:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1266
;1266:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 80
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 2552
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 92
ADDRLP4 2552
INDIRP4
ASGNP4
line 1267
;1267:			} else {
ADDRGP4 $489
JUMPV
LABELV $488
line 1269
;1268:				// don't spawn near existing origin if possible
;1269:				spawnPoint = SelectSpawnPoint ( 
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 2552
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 92
ADDRLP4 2552
INDIRP4
ASGNP4
line 1272
;1270:					client->ps.origin, 
;1271:					spawn_origin, spawn_angles);
;1272:			}
LABELV $489
line 1276
;1273:
;1274:			// Tim needs to prevent bots from spawning at the initial point
;1275:			// on q3dm0...
;1276:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2552
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 2552
INDIRI4
EQI4 $490
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2552
INDIRI4
EQI4 $490
line 1277
;1277:				continue;	// try again
ADDRGP4 $486
JUMPV
LABELV $490
line 1280
;1278:			}
;1279:			// just to be symetric, we have a nohumans option...
;1280:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2556
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 2556
INDIRI4
EQI4 $487
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2556
INDIRI4
NEI4 $487
line 1281
;1281:				continue;	// try again
line 1284
;1282:			}
;1283:
;1284:			break;
LABELV $486
line 1286
;1285:
;1286:		} while ( 1 );
ADDRGP4 $485
JUMPV
LABELV $487
line 1287
;1287:	}
LABELV $483
LABELV $481
LABELV $477
line 1288
;1288:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 1
ASGNI4
line 1295
;1289:
;1290:	// always clear the kamikaze flag
;1291://	ent->s.eFlags &= ~EF_KAMIKAZE;
;1292:
;1293:	// toggle the teleport bit so the client knows to not lerp
;1294:	// and never clear the voted flag
;1295:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1296
;1296:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 112
ADDRLP4 112
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1299
;1297:
;1298:	// clear everything but the persistant data 
;1299:	saved = client->pers;
ADDRLP4 116
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 1332
line 1300
;1300:	savedSess = client->sess;
ADDRLP4 1448
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRB
ASGNB 32
line 1301
;1301:	savedPing = client->ps.ping;
ADDRLP4 1480
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1303
;1302://	savedAreaBits = client->areabits;
;1303:	accuracy_hits = client->accuracy_hits;
ADDRLP4 1484
ADDRLP4 4
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
ASGNI4
line 1304
;1304:	accuracy_shots = client->accuracy_shots;
ADDRLP4 1488
ADDRLP4 4
INDIRP4
CNSTI4 1900
ADDP4
INDIRI4
ASGNI4
line 1305
;1305:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $494
line 1306
;1306:		persistant[i] = client->ps.persistant[i];
ADDRLP4 2544
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2544
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 2544
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1308
;1307:		//if (i == PERS_TEAM) PrintMsg(NULL, S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: Saved Team %i\n", persistant[i]);
;1308:	}
LABELV $495
line 1305
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $494
line 1310
;1309:	// also save the predictable events otherwise we might get double or dropped events
;1310:	for (i = 0; i < MAX_PS_EVENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $498
line 1311
;1311:		savedEvents[i] = client->ps.events[i];
ADDRLP4 2544
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2544
INDIRI4
ADDRLP4 72
ADDP4
ADDRLP4 2544
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1312
;1312:	} 
LABELV $499
line 1310
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $498
line 1313
;1313:	eventSequence = client->ps.eventSequence;
ADDRLP4 1492
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1318
;1314:
;1315:	//memcpy( &rewards, &client->ns.rewards, sizeof(int) );
;1316:	//memcpy( &kills, &client->ns.num_killed, sizeof(int) );
;1317:	//memcpy( &knifekills, &client->knife_kills, sizeof(int) );	
;1318:	rewards = client->ns.rewards;
ADDRLP4 2520
ADDRLP4 4
INDIRP4
CNSTI4 3324
ADDP4
INDIRI4
ASGNI4
line 1319
;1319:	kills = client->ns.num_killed;
ADDRLP4 2524
ADDRLP4 4
INDIRP4
CNSTI4 3320
ADDP4
INDIRI4
ASGNI4
line 1320
;1320:	knifekills = client->knife_kills;
ADDRLP4 2528
ADDRLP4 4
INDIRP4
CNSTI4 5168
ADDP4
INDIRI4
ASGNI4
line 1322
;1321:
;1322:	memset (client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7668
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1324
;1323:
;1324:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 116
INDIRB
ASGNB 1332
line 1325
;1325:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
ADDRLP4 1448
INDIRB
ASGNB 32
line 1326
;1326:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 1480
INDIRI4
ASGNI4
line 1328
;1327:	//client->areabits = savedAreaBits;
;1328:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 1904
ADDP4
ADDRLP4 1484
INDIRI4
ASGNI4
line 1329
;1329:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 1900
ADDP4
ADDRLP4 1488
INDIRI4
ASGNI4
line 1330
;1330:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 1908
ADDP4
CNSTI4 -1
ASGNI4
line 1332
;1331: 
;1332:	client->ns.rewards = rewards;
ADDRLP4 4
INDIRP4
CNSTI4 3324
ADDP4
ADDRLP4 2520
INDIRI4
ASGNI4
line 1333
;1333:	client->knife_kills = knifekills;
ADDRLP4 4
INDIRP4
CNSTI4 5168
ADDP4
ADDRLP4 2528
INDIRI4
ASGNI4
line 1334
;1334:	client->ns.num_killed = kills;
ADDRLP4 4
INDIRP4
CNSTI4 3320
ADDP4
ADDRLP4 2524
INDIRI4
ASGNI4
line 1336
;1335:
;1336:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $502
line 1337
;1337:		client->ps.persistant[i] = persistant[i];
ADDRLP4 2544
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2544
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 2544
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1339
;1338:		//if (i == PERS_TEAM) PrintMsg(NULL, S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: Restored Team %i\n", client->ps.persistant[i]);
;1339:	}
LABELV $503
line 1336
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $502
line 1340
;1340:	for (i = 0; i < MAX_PS_EVENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $506
line 1341
;1341:		client->ps.events[i] = savedEvents[i];
ADDRLP4 2544
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2544
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
ADDRLP4 2544
INDIRI4
ADDRLP4 72
ADDP4
INDIRI4
ASGNI4
line 1342
;1342:	}
LABELV $507
line 1340
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $506
line 1343
;1343:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1492
INDIRI4
ASGNI4
line 1345
;1344:	// increment the spawncount so the client will detect the respawn
;1345:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 2544
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 2544
INDIRP4
ADDRLP4 2544
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1355
;1346:	//PrintMsg(NULL, S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: game/g_client.c ClientSpawn %i %i  (%i:%i:%i:%i:%i:%i)\n", 
;1347:			//client->ps.persistant[PERS_TEAM], 
;1348:			//client->sess.sessionTeam,
;1349:			//client->ps.persistant[PERS_ACCURACY],
;1350:			//client->ps.persistant[PERS_STRENGTH],
;1351:			//client->ps.persistant[PERS_SPEED],
;1352:			//client->ps.persistant[PERS_STAMINA],
;1353:			//client->ps.persistant[PERS_STEALTH],
;1354:			//client->ps.persistant[PERS_TECHNICAL]);
;1355:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ASGNI4
line 1357
;1356:
;1357:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 1936
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1359
;1358:
;1359:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 96
INDIRI4
ARGI4
ADDRLP4 1496
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1362
;1360:
;1361:	// set max health based on stamina
;1362:	client->pers.maxHealth = 100 + ( client->pers.nsPC.stamina * 3 );
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 3
ADDRLP4 4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
MULI4
CNSTI4 100
ADDI4
ASGNI4
line 1365
;1363:
;1364:	// clear entity values
;1365:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 112
INDIRI4
ASGNI4
line 1367
;1366:
;1367:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1368
;1368:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 7668
ADDRLP4 96
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1369
;1369:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1370
;1370:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1371
;1371:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $511
ASGNP4
line 1372
;1372:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
line 1373
;1373:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 33619969
ASGNI4
line 1374
;1374:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 player_die
ASGNP4
line 1375
;1375:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 0
ASGNI4
line 1376
;1376:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 1377
;1377:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 1380
;1378:
;1379:	
;1380:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1381
;1381:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1383
;1382:
;1383:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 1388
;1384:
;1385:	// Navy Seals ++
;1386:
;1387:	// if we're a late-time joiner, lock our weapons
;1388:	if ( g_gametype.integer == GT_LTS && GameState == STATE_OPEN )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $512
ADDRGP4 GameState
INDIRI4
CNSTI4 0
NEI4 $512
line 1389
;1389:	{
line 1390
;1390:		client->ps.eFlags |= EF_WEAPONS_LOCKED; 
ADDRLP4 2556
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2556
INDIRP4
ADDRLP4 2556
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 1391
;1391:		NS_SendPlayersStatusToAllPlayers( client->ps.clientNum , MS_HEALTH5 );
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 NS_SendPlayersStatusToAllPlayers
CALLV
pop
line 1392
;1392:	}
ADDRGP4 $513
JUMPV
LABELV $512
line 1393
;1393:	else if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $515
line 1394
;1394:		NS_SendPlayersStatusToAllPlayers(  client->ps.clientNum, MS_HEALTH5 );
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 NS_SendPlayersStatusToAllPlayers
CALLV
pop
ADDRGP4 $516
JUMPV
LABELV $515
line 1396
;1395:	else
;1396:		NS_SendPlayersStatusToAllPlayers( client->ps.clientNum, MS_DEAD );
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 NS_SendPlayersStatusToAllPlayers
CALLV
pop
LABELV $516
LABELV $513
line 1401
;1397:
;1398:	// Navy Seals --
;1399:
;1400:	// set max health
;1401:	ent->health = client->ps.stats[STAT_HEALTH] = client->pers.maxHealth;
ADDRLP4 2560
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 2560
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 2560
INDIRI4
ASGNI4
line 1403
;1402:
;1403:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1404
;1404:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 80
INDIRB
ASGNB 12
line 1407
;1405:
;1406:	// the respawned flag will be cleared after the attack and jump keys come up
;1407:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 2564
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2564
INDIRP4
ADDRLP4 2564
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1409
;1408:
;1409:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 7668
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1410
;1410:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 100
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1412
;1411:
;1412:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR || client->sess.waiting ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $520
ADDRLP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $518
LABELV $520
line 1413
;1413:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 2568
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 2568
INDIRP4
ADDRLP4 2568
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1414
;1414:	} else {
ADDRGP4 $519
JUMPV
LABELV $518
line 1415
;1415:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1416
;1416:		ent->r.svFlags &= ~ SVF_NOCLIENT;
ADDRLP4 2568
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 2568
INDIRP4
ADDRLP4 2568
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1417
;1417:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1420
;1418:// Navy Seals ++
;1419:		// force the base weapon up 
;1420:		NS_NavySeals_ClientInit(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 NS_NavySeals_ClientInit
CALLV
pop
line 1422
;1421:// Navy Seals --
;1422:	}
LABELV $519
line 1427
;1423:// Navy Seals ++
;1424:	
;1425:// Navy Seals --
;1426:	// don't allow full run speed for a bit
;1427:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 2568
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2568
INDIRP4
ADDRLP4 2568
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1428
;1428:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1430
;1429:
;1430:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1431
;1431:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 1924
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1432
;1432:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1856
ADDP4
CNSTI4 0
ASGNI4
line 1434
;1433:
;1434:	if (!client->sess.waiting) 
ADDRLP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
NEI4 $524
line 1435
;1435:	{
line 1436
;1436:		if ( level.intermissiontime )
ADDRGP4 level+7084
INDIRI4
CNSTI4 0
EQI4 $526
line 1437
;1437:		{
line 1438
;1438:			MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1439
;1439:		}
ADDRGP4 $527
JUMPV
LABELV $526
line 1441
;1440:		else 
;1441:		{
line 1443
;1442:			// fire the targets of the spawn point
;1443:			if (spawnPoint)
ADDRLP4 92
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $529
line 1444
;1444:				G_UseTargets( spawnPoint, ent );
ADDRLP4 92
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $529
line 1448
;1445:
;1446:			// select the highest weapon number available, after any
;1447:			// spawn given items have fired
;1448:			if ( g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $531
line 1449
;1449:			{
line 1450
;1450:				client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1451
;1451:				for ( i = WP_SMOKE - 1 ; i > 0 ; i-- )
ADDRLP4 0
CNSTI4 24
ASGNI4
LABELV $534
line 1452
;1452:				{
line 1453
;1453:					if ( BG_GotWeapon(i, client->ps.stats ) )
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 2572
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 2572
INDIRI4
CNSTI4 0
EQI4 $538
line 1454
;1454:					{
line 1455
;1455:						client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1456
;1456:						break;
ADDRGP4 $536
JUMPV
LABELV $538
line 1458
;1457:					}
;1458:				}
LABELV $535
line 1451
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $534
LABELV $536
line 1459
;1459:			}
LABELV $531
line 1460
;1460:		}
LABELV $527
line 1461
;1461:	}
LABELV $524
line 1465
;1462:
;1463:	// run a client frame to drop exactly to the floor,
;1464:	// initialize animations and other things
;1465:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1466
;1466:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1467
;1467:	ClientThink( ent-g_entities );
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
ADDRGP4 ClientThink
CALLV
pop
line 1470
;1468:
;1469:	// positively link the client, even if the command times are weird
;1470:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR && !ent->client->sess.waiting ) {
ADDRLP4 2572
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2572
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $542
ADDRLP4 2572
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
NEI4 $542
line 1471
;1471:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1472
;1472:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 2576
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2576
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 2576
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1473
;1473:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1474
;1474:	}
LABELV $542
line 1477
;1475:
;1476:	// run the presend to set anything else
;1477:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1480
;1478:
;1479:	// clear entity state values
;1480:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1481
;1481:}
LABELV $475
endproc ClientSpawn 2580 16
export ClientDisconnect
proc ClientDisconnect 32 16
line 1496
;1482:
;1483:
;1484:/*
;1485:===========
;1486:ClientDisconnect
;1487:
;1488:Called when a player drops from the server.
;1489:Will not be called between levels.
;1490:
;1491:This should NOT be called directly by any game logic,
;1492:call trap_DropClient(), which will call this and do
;1493:server system housekeeping.
;1494:============
;1495:*/
;1496:void ClientDisconnect( int clientNum ) {
line 1503
;1497:	gentity_t	*ent;
;1498:	gentity_t	*tent;
;1499:	int			i;
;1500:
;1501:	// cleanup if we are kicking a bot that
;1502:	// hasn't spawned yet  
;1503:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 1108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1504
;1504:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $545
line 1505
;1505:		return;
ADDRGP4 $544
JUMPV
LABELV $545
line 1509
;1506:	}
;1507:
;1508:
;1509:	if ( strlen( ent->client->pers.quitMsg ) > 0 )
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $547
line 1510
;1510:		PrintMsg( NULL, "%s "S_COLOR_WHITE"quit (%s"S_COLOR_WHITE")\n", ent->client->pers.netname,ent->client->pers.quitMsg );
CNSTP4 0
ARGP4
ADDRGP4 $549
ARGP4
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
ADDRGP4 $548
JUMPV
LABELV $547
line 1512
;1511:	else
;1512:		PrintMsg( NULL, "%s "S_COLOR_WHITE"quit\n", ent->client->pers.netname );
CNSTP4 0
ARGP4
ADDRGP4 $550
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $548
line 1515
;1513:
;1514:	// send effect if they were completely connected
;1515:	if ( !level.intermissiontime ) // only do this when we're not on the intermission
ADDRGP4 level+7084
INDIRI4
CNSTI4 0
NEI4 $551
line 1517
;1516:	if (
;1517:		ent->client->pers.connected == CON_CONNECTED && 
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $554
ADDRLP4 20
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $554
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $554
line 1520
;1518:		ent->client->sess.sessionTeam != TEAM_SPECTATOR &&
;1519:		! (ent->client->ps.pm_flags & PMF_FOLLOW )
;1520:		) {
line 1521
;1521:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 24
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1522
;1522:		tent->s.clientNum = ent->s.clientNum; 
ADDRLP4 28
CNSTI4 168
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1526
;1523:
;1524:		// They don't get to take powerups with them!
;1525:		// Especially important for stuff like CTF flags
;1526:		TossClientItems( ent ); 
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1527
;1527:	}
LABELV $554
LABELV $551
line 1530
;1528:
;1529:	// stop any following clients
;1530:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $559
JUMPV
LABELV $556
line 1531
;1531:		if ( level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
ADDRLP4 24
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1808
ADDP4
INDIRI4
CNSTI4 2
NEI4 $561
ADDRLP4 24
INDIRP4
CNSTI4 1812
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $561
line 1532
;1532:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1533
;1533:			StopFollowing( &g_entities[i] );
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1534
;1534:		}
LABELV $561
line 1535
;1535:		if ( level.clients[i].sess.waiting && level.clients[i].sess.spectatorClient == clientNum )
ADDRLP4 28
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $563
ADDRLP4 28
INDIRP4
CNSTI4 1812
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $563
line 1536
;1536:			StopFollowing( &g_entities[i] );
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
LABELV $563
line 1537
;1537:	} 
LABELV $557
line 1530
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $559
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $556
line 1539
;1538:
;1539:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $565
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1541
;1540:
;1541:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1542
;1542:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1543
;1543:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1544
;1544:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $566
ASGNP4
line 1545
;1545:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1547
;1546:	//PrintMsg(NULL, S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: g_client.c ClientDisconnect changed PERS_TEAM to TEAM_FREE\n");
;1547:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1548
;1548:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
CNSTI4 0
ASGNI4
line 1550
;1549:
;1550:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 548
ADDI4
ARGI4
ADDRGP4 $567
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1552
;1551:
;1552:	CalculateRanks(); 
ADDRGP4 CalculateRanks
CALLV
pop
line 1553
;1553:}
LABELV $544
endproc ClientDisconnect 32 16
import NS_SendStatusMessageToTeam
import NS_SendPlayersStatusToAllPlayers
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
import CalculateRanks
import AddScore
import player_die
import InitClientResp
import InitClientPersistant
import BeginIntermission
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
import G_ExplodeMissile
import NS_GetNameForClass
import Drop_Weapon
import fire_smoke_grenade
import NS_FindRadius
import SelectTeamSpawnPoint
import NS_HandlePlayerMenu
import NS_HandleCreateClassMenu
import NS_HandleEquipmentMenu
import NS_HandleRadioMenu
import NS_HandleClassMenu
import NS_HandleCharacterMenu
import NS_HandleAmmoMenu
import NS_HandleMainMenu
import NS_HandleSecondaryWeaponMenu
import NS_HandleTeamMenu
import NS_HandlePrimaryWeaponMenu
import SetClass
import NS_OpenPlayerMenu
import NS_OpenCreateClassMenu
import NS_OpenEquipmentMenu
import NS_OpenSpectatorMenu
import NS_OpenPrimaryWeaponMenu
import NS_OpenRadioMenu
import NS_OpenMainMenu
import NS_OpenClassMenu
import NS_OpenTeamMenu
import NS_MenuSelect
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
import NS_GotEnoughXPfornextLevel
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
import NS_KillMenu
import G_LocalSound
import NS_DirectMenuSelect
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
import NS_SetSecondary
import NS_SetPrimary
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
LABELV $567
byte 1 0
align 1
LABELV $566
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
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $565
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $550
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $549
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $511
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $467
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $466
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $447
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $444
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $439
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $437
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $432
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $431
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $427
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $426
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $425
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $424
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $421
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $417
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $416
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 115
byte 1 95
byte 1 111
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $415
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 115
byte 1 95
byte 1 111
byte 1 103
byte 1 117
byte 1 110
byte 1 50
byte 1 0
align 1
LABELV $410
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 95
byte 1 104
byte 1 111
byte 1 97
byte 1 107
byte 1 0
align 1
LABELV $409
byte 1 110
byte 1 118
byte 1 103
byte 1 95
byte 1 104
byte 1 111
byte 1 97
byte 1 107
byte 1 0
align 1
LABELV $404
byte 1 100
byte 1 99
byte 1 115
byte 1 95
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $403
byte 1 100
byte 1 99
byte 1 115
byte 1 95
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 50
byte 1 0
align 1
LABELV $398
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 104
byte 1 97
byte 1 116
byte 1 95
byte 1 116
byte 1 109
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $395
byte 1 99
byte 1 97
byte 1 112
byte 1 95
byte 1 116
byte 1 109
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $392
byte 1 118
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $391
byte 1 118
byte 1 105
byte 1 112
byte 1 95
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $388
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $387
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $386
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $385
byte 1 99
byte 1 117
byte 1 114
byte 1 116
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $382
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $372
byte 1 116
byte 1 0
align 1
LABELV $371
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $367
byte 1 115
byte 1 0
align 1
LABELV $366
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $363
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $357
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $352
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $347
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $341
byte 1 67
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $338
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
LABELV $337
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 109
byte 1 115
byte 1 103
byte 1 0
align 1
LABELV $334
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $330
byte 1 99
byte 1 103
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 66
byte 1 97
byte 1 110
byte 1 100
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $326
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 82
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $322
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $321
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
LABELV $318
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $317
byte 1 92
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 92
byte 1 98
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $313
byte 1 94
byte 1 49
byte 1 85
byte 1 94
byte 1 48
byte 1 98
byte 1 101
byte 1 114
byte 1 94
byte 1 49
byte 1 78
byte 1 94
byte 1 48
byte 1 111
byte 1 111
byte 1 98
byte 1 0
align 1
LABELV $160
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $140
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $77
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $73
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $70
byte 1 48
byte 1 0
align 1
LABELV $69
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
