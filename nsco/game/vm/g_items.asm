export Pickup_Powerup
code
proc Pickup_Powerup 132 28
file "../g_items.c"
line 38
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
;13:/*
;14:
;15:  Items are any object that a player can touch to gain some effect.
;16:
;17:  Pickup will return the number of seconds until they should respawn.
;18:
;19:  all items should pop when dropped in lava or slime
;20:
;21:  Respawnable items don't actually go away when picked up, they are
;22:  just made invisible and untouchable.  This allows them to ride
;23:  movers and respawn apropriately.
;24:
;25:*/
;26:
;27:
;28:#define	RESPAWN_ARMOR		25
;29:#define	RESPAWN_HEALTH		35
;30:#define	RESPAWN_AMMO		40
;31:#define	RESPAWN_HOLDABLE	60
;32:#define	RESPAWN_MEGAHEALTH	35//120
;33:#define	RESPAWN_POWERUP		120
;34:
;35:
;36://======================================================================
;37:
;38:int Pickup_Powerup( gentity_t *ent, gentity_t *other ) {
line 43
;39:	int			quantity;
;40:	int			i;
;41:	gclient_t	*client;
;42:
;43:	if ( !other->client->ps.powerups[ent->item->giTag] ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $69
line 46
;44:		// round timing to seconds to make multiple powerup timers
;45:		// count in sync
;46:		other->client->ps.powerups[ent->item->giTag] = 
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 48
;47:			level.time - ( level.time % 1000 );
;48:	}
LABELV $69
line 50
;49:
;50:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $73
line 51
;51:		quantity = ent->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 52
;52:	} else {
ADDRGP4 $74
JUMPV
LABELV $73
line 53
;53:		quantity = ent->item->quantity;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 54
;54:	}
LABELV $74
line 56
;55:
;56:	other->client->ps.powerups[ent->item->giTag] += quantity * 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ASGNI4
line 59
;57:
;58:	// give any nearby players a "denied" anti-reward
;59:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $78
JUMPV
LABELV $75
line 65
;60:		vec3_t		delta;
;61:		float		len;
;62:		vec3_t		forward;
;63:		trace_t		tr;
;64:
;65:		client = &level.clients[i];
ADDRLP4 0
CNSTI4 7668
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 66
;66:		if ( client == other->client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $80
line 67
;67:			continue;
ADDRGP4 $76
JUMPV
LABELV $80
line 69
;68:		}
;69:		if ( client->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $82
line 70
;70:			continue;
ADDRGP4 $76
JUMPV
LABELV $82
line 72
;71:		}
;72:		if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $84
line 73
;73:			continue;
ADDRGP4 $76
JUMPV
LABELV $84
line 78
;74:		}
;75:
;76:    // if same team in team game, no sound
;77:    // cannot use OnSameTeam as it expects to g_entities, not clients
;78:  	if ( g_gametype.integer >= GT_TEAM && other->client->sess.sessionTeam == client->sess.sessionTeam  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
LTI4 $86
ADDRLP4 100
CNSTI4 1800
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
NEI4 $86
line 79
;79:      continue;
ADDRGP4 $76
JUMPV
LABELV $86
line 83
;80:    }
;81:
;82:		// if too far away, no sound
;83:		VectorSubtract( ent->s.pos.trBase, client->ps.origin, delta );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTI4 24
ASGNI4
ADDRLP4 16
ADDRLP4 104
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 104
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 84
;84:		len = VectorNormalize( delta );
ADDRLP4 16
ARGP4
ADDRLP4 116
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 116
INDIRF4
ASGNF4
line 85
;85:		if ( len > 192 ) {
ADDRLP4 40
INDIRF4
CNSTF4 1128267776
LEF4 $91
line 86
;86:			continue;
ADDRGP4 $76
JUMPV
LABELV $91
line 90
;87:		}
;88:
;89:		// if not facing, no sound
;90:		AngleVectors( client->ps.viewangles, forward, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 120
CNSTP4 0
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 91
;91:		if ( DotProduct( delta, forward ) < 0.4 ) {
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
CNSTF4 1053609165
GEF4 $93
line 92
;92:			continue;
ADDRGP4 $76
JUMPV
LABELV $93
line 96
;93:		}
;94:
;95:		// if not line of sight, no sound
;96:		trap_Trace( &tr, client->ps.origin, NULL, NULL, ent->s.pos.trBase, ENTITYNUM_NONE, CONTENTS_SOLID );
ADDRLP4 44
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 97
;97:		if ( tr.fraction != 1.0 ) {
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $99
line 98
;98:			continue;
ADDRGP4 $76
JUMPV
LABELV $99
line 102
;99:		}
;100:
;101:		// anti-reward
;102:		client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_DENIEDREWARD;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 103
;103:	}
LABELV $76
line 59
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $78
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $75
line 104
;104:	return RESPAWN_POWERUP;
CNSTI4 120
RETI4
LABELV $68
endproc Pickup_Powerup 132 28
export AddAmmo
proc AddAmmo 8 0
line 116
;105:}
;106:
;107://======================================================================
;108:
;109:  
;110:
;111:
;112://======================================================================
;113:
;114:// Navy Seals ++
;115:void AddAmmo (gentity_t *ent, int ammotype, int count)
;116:{ 
line 117
;117:	int max = 3;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 119
;118:
;119:	switch( ammotype ) {
ADDRGP4 $103
JUMPV
LABELV $103
line 121
;120:		default:
;121:			max = MAX_DEFAULT;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 122
;122:			break;
LABELV $104
line 125
;123:	}
;124:
;125:	ent->client->ps.ammo[ammotype] += count;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 126
;126:	if ( ent->client->ps.ammo[ammotype] > max ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $105
line 127
;127:		ent->client->ps.ammo[ammotype] = max;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 128
;128:	} 
LABELV $105
line 129
;129:}
LABELV $102
endproc AddAmmo 8 0
export Pickup_Ammo
proc Pickup_Ammo 4 12
line 132
;130:
;131:int Pickup_Ammo (gentity_t *ent, gentity_t *other)
;132:{
line 135
;133:	int		quantity;
;134:
;135:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $108
line 136
;136:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 137
;137:	} else {
ADDRGP4 $109
JUMPV
LABELV $108
line 138
;138:		quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 139
;139:	}
LABELV $109
line 141
;140:
;141:	AddAmmo (other, ent->item->giTag , quantity);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 AddAmmo
CALLV
pop
line 143
;142:
;143:	return RESPAWN_AMMO;
CNSTI4 40
RETI4
LABELV $107
endproc Pickup_Ammo 4 12
export Pickup_Weapon
proc Pickup_Weapon 20 28
line 150
;144:}
;145:// Navy Seals --
;146:
;147://======================================================================
;148:
;149:// Navy Seals ++
;150:int Pickup_Weapon (gentity_t *ent, gentity_t *other) {
line 152
;151: 
;152:	if ( ent->ns_team != other->client->sess.sessionTeam
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
EQI4 $111
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $111
line 154
;153:		&& ent->ns_team != TEAM_FREE )
;154:	{
line 156
;155:		// not same team.
;156:		PrintMsg( other, S_COLOR_RED "This item is not for your team.\n");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 157
;157:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $111
line 160
;158:	}
;159:
;160:	if ( !PI_CheckWeapon ( other->client->sess.sessionTeam, ent->item->giTag,
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 PI_CheckWeapon
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $114
line 163
;161:			other->client->pers.nsPC.accuracy, other->client->pers.nsPC.strength,
;162:			other->client->pers.nsPC.stamina, other->client->pers.nsPC.stealth , qtrue ) )
;163:	{
line 164
;164:		PrintMsg( other, S_COLOR_RED "You cannot use this weapon.\n");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 165
;165:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $114
line 168
;166:	}
;167:
;168:	BG_PackWeapon( ent->item->giTag, other->client->ps.stats ); 
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_PackWeapon
CALLV
pop
line 170
;169:
;170:	if ( ent->item->giAmmoTag == AM_FLASHBANGS) // give grenades
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 11
NEI4 $117
line 171
;171:	{
line 172
;172:		if ( other->client->ps.ammo[AM_FLASHBANGS] < 2 )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
GEI4 $119
line 173
;173:			other->client->ps.ammo[AM_FLASHBANGS]++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 420
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
LABELV $119
line 175
;174:		
;175:		return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
ADDRGP4 $110
JUMPV
LABELV $117
line 177
;176:	}
;177:	else if ( ent->item->giAmmoTag == AM_GRENADES) // give grenades
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 10
NEI4 $122
line 178
;178:	{
line 179
;179:		if ( other->client->ps.ammo[AM_GRENADES] < 2 )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 2
GEI4 $124
line 180
;180:			other->client->ps.ammo[AM_GRENADES]++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 416
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
LABELV $124
line 182
;181:  
;182:		return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
ADDRGP4 $110
JUMPV
LABELV $122
line 184
;183:	} 
;184:	else if ( ent->item->giAmmoTag == AM_SMOKE ) // give grenades
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 12
NEI4 $127
line 185
;185:	{
line 186
;186:		if ( other->client->ps.ammo[AM_SMOKE] < 2 )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 2
GEI4 $129
line 187
;187:			other->client->ps.ammo[AM_SMOKE]++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 424
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
LABELV $129
line 189
;188:  
;189:		return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
ADDRGP4 $110
JUMPV
LABELV $127
line 193
;190:	}
;191:
;192:
;193:	if (ent->flags & FL_DROPPED_ITEM)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $132
line 194
;194:	{
line 195
;195:		other->client->ns.rounds[ent->item->giTag] = ent->count;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2868
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 197
;196:		// has got additional equipment?
;197:		if ( ent->s.generic1 ) 
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $133
line 198
;198:		{			
line 199
;199:			other->client->ns.weaponmode[ent->item->giTag] = ent->s.generic1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3180
ADDP4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 200
;200:			ent->s.generic1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 201
;201:		} 
line 202
;202:	}
ADDRGP4 $133
JUMPV
LABELV $132
line 203
;203:	else {
line 205
;204:		// full out clips
;205:		other->client->ns.rounds[ent->item->giTag] = BG_GetMaxRoundForWeapon( ent->item->giTag );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_GetMaxRoundForWeapon
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2868
ADDP4
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 206
;206:	}
LABELV $133
line 210
;207:	
;208: 
;209:	// if we're in training / singplayer / dm mode
;210:	if (g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $136
line 211
;211:	{
line 212
;212:		return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
ADDRGP4 $110
JUMPV
LABELV $136
line 268
;213:	}
;214:/*
;215:	if ( BG_IsPrimary( ent->item->giTag ) )
;216:	{
;217: 		int num_clips = 0;
;218:
;219:		// get old primary
;220:		gitem_t *it_wp;
;221: 
;222:		if ( other->client->pers.nsInven.primaryweapon != WP_NONE )
;223:		{
;224:			it_wp = BG_FindItemForWeapon( other->client->pers.nsInven.primaryweapon );
;225:
;226:			if ( it_wp )
;227:			{
;228:				num_clips = other->client->pers.nsInven.ammo[ it_wp->giAmmoTag ];
;229:				other->client->pers.nsInven.ammo[ it_wp->giAmmoTag ] = 0;
;230:			}
;231:		}
;232:
;233:		NS_SetPrimary( other, ent->item->giTag );
;234:
;235:		// get new ammo  
;236:		num_clips = other->client->pers.nsInven.ammo[ ent->item->giAmmoTag ];
;237:
;238:		if ( ent->item->giTag == WP_M249 )
;239:			other->client->pers.nsInven.ammo[ ent->item->giAmmoTag ] = 1;
;240:		else
;241:			other->client->pers.nsInven.ammo[ ent->item->giAmmoTag ] = 6;
;242:	}
;243:	else if ( BG_IsSecondary( ent->item->giTag ) )
;244:	{
;245: 		int num_clips = 0;
;246:
;247:		// get old primary
;248:		gitem_t *it_wp;
;249:
;250:		if ( other->client->pers.nsInven.secondaryweapon != WP_NONE   )
;251:		{
;252:			it_wp = BG_FindItemForWeapon( other->client->pers.nsInven.secondaryweapon );
;253:
;254:			if ( it_wp )
;255:			{
;256:				num_clips = other->client->pers.nsInven.ammo[ it_wp->giAmmoTag ];
;257:				other->client->pers.nsInven.ammo[ it_wp->giAmmoTag ] = 0;
;258:			}
;259:		}
;260:
;261: 		NS_SetSecondary( other, ent->item->giTag );
;262:
;263:		// get new ammo  
;264:		num_clips = other->client->pers.nsInven.ammo[ ent->item->giAmmoTag ];
;265:		other->client->pers.nsInven.ammo[ ent->item->giAmmoTag ] = 4;
;266:	} 
;267:*/
;268:	return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
LABELV $110
endproc Pickup_Weapon 20 28
export Checked_BotRoam
proc Checked_BotRoam 4 4
line 276
;269:}
;270:
;271:// Navy Seals --
;272:
;273://======================================================================
;274:
;275: int Checked_BotRoam( gentity_t *ent, gentity_t *other)
;276:{
line 277
;277:	if ( !NS_IsBot(other) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 NS_IsBot
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $142
line 278
;278:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $142
line 280
;279:
;280:	return 350;
CNSTI4 350
RETI4
LABELV $141
endproc Checked_BotRoam 4 4
export Pickup_Armor
proc Pickup_Armor 0 0
line 285
;281:}
;282://======================================================================
;283:
;284:// Navy Seals ++
;285:int Pickup_Armor (gentity_t *ent, gentity_t *other) {
line 288
;286: 
;287:	// already got this item.
;288:	if ( other->client->ps.powerups[ent->item->giTag])
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $145
line 289
;289:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $145
line 292
;290:
;291:	// add item
;292:	other->client->ps.powerups[ent->item->giTag] = ARMOR_LIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 294
;293:
;294:	return 50;
CNSTI4 50
RETI4
LABELV $144
endproc Pickup_Armor 0 0
export RespawnItem
proc RespawnItem 24 12
line 305
;295:}
;296:// Navy Seals --
;297:
;298://======================================================================
;299:
;300:/*
;301:===============
;302:RespawnItem
;303:===============
;304:*/
;305:void RespawnItem( gentity_t *ent ) {
line 307
;306:	// randomly select from teamed entities
;307:	if (ent->team) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $148
line 312
;308:		gentity_t	*master;
;309:		int	count;
;310:		int choice;
;311:
;312:		if ( !ent->teammaster ) {
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $150
line 313
;313:			G_Error( "RespawnItem: bad teammaster");
ADDRGP4 $152
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 314
;314:		}
LABELV $150
line 315
;315:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ASGNP4
line 317
;316:
;317:		for (count = 0, ent = master; ent; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $156
JUMPV
LABELV $153
line 318
;318:			;
LABELV $154
line 317
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $156
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $153
line 320
;319:
;320:		choice = rand() % count;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 322
;321:
;322:		for (count = 0, ent = master; count < choice; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $160
JUMPV
LABELV $157
line 323
;323:			;
LABELV $158
line 322
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $160
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $157
line 324
;324:	}
LABELV $148
line 326
;325:
;326:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 327
;327:	ent->s.eFlags &= ~EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 328
;328:	ent->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 329
;329:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 331
;330:
;331:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $161
line 336
;332:		// play powerup spawn sound to all clients
;333:		gentity_t	*te;
;334:
;335:		// if the powerup respawn sound should Not be global
;336:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
EQF4 $163
line 337
;337:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 338
;338:		}
ADDRGP4 $164
JUMPV
LABELV $163
line 339
;339:		else {
line 340
;340:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 341
;341:		}
LABELV $164
line 342
;342:		te->s.eventParm = G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $165
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 343
;343:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 344
;344:	}
LABELV $161
line 346
;345:
;346:	if ( ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_KAMIKAZE ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $166
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $166
line 351
;347:		// play powerup spawn sound to all clients
;348:		gentity_t	*te;
;349:
;350:		// if the powerup respawn sound should Not be global
;351:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
EQF4 $168
line 352
;352:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 353
;353:		}
ADDRGP4 $169
JUMPV
LABELV $168
line 354
;354:		else {
line 355
;355:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 356
;356:		}
LABELV $169
line 357
;357:		te->s.eventParm = G_SoundIndex( "sound/items/kamikazerespawn.wav" );
ADDRGP4 $170
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 358
;358:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 359
;359:	}
LABELV $166
line 360
;360:	if ( ent->item->giType == IT_BOTROAM )
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $171
line 361
;361:	{ 
line 363
;362:		// we previously removed it, now set it again... :-p
;363: 		ent->s.eFlags |= EF_NODRAW;  
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 364
;364:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 366
;365:
;366:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 367
;367:		return;
ADDRGP4 $147
JUMPV
LABELV $171
line 371
;368:	}
;369:
;370:	// play the normal respawn sound only to nearby clients
;371:	G_AddEvent( ent, EV_ITEM_RESPAWN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 47
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 373
;372:
;373:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 374
;374:}
LABELV $147
endproc RespawnItem 24 12
export BotCanItemBeGrabbed
proc BotCanItemBeGrabbed 40 8
line 376
;375:
;376:qboolean BotCanItemBeGrabbed( int gametype, const entityState_t *ent, const playerState_t *ps ) {
line 379
;377:	gitem_t	*item; 
;378:
;379:	if ( ent->modelindex < 1 || ent->modelindex >= bg_numItems ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $176
ADDRLP4 4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $174
LABELV $176
line 380
;380:		Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: index out of range" );
CNSTI4 1
ARGI4
ADDRGP4 $177
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 381
;381:	}
LABELV $174
line 383
;382:// Navy Seals ++
;383:	item = &bg_itemlist[ent->modelindex];
ADDRLP4 0
CNSTI4 56
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 386
;384:	// if vip return
;385:
;386:	if ( ps->eFlags & EF_VIP ) {
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $178
line 387
;387:		if ( BG_IsPistol( item->giTag ) )
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_IsPistol
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $180
line 388
;388:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $180
line 389
;389:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $178
line 394
;390:	}
;391:
;392:// Navy Seals --
;393:
;394:	switch( item->giType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $182
ADDRLP4 8
INDIRI4
CNSTI4 9
GTI4 $182
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $227
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $227
address $225
address $185
address $204
address $210
address $182
address $182
address $224
address $213
address $182
address $214
code
LABELV $185
line 397
;395:		// Navy Seals ++
;396:	case IT_WEAPON:
;397:		{
line 398
;398:			if ( BG_IsPrimary ( item->giTag ) && BG_GotPrimary( ps ) )
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $186
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BG_GotPrimary
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $186
line 399
;399:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $186
line 400
;400:			if ( BG_IsSecondary ( item->giTag  ) && BG_GotSecondary( ps ) )
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_IsSecondary
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $188
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 BG_GotSecondary
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $188
line 401
;401:				return qfalse;  
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $188
line 403
;402:
;403:			if ( item->giTag == WP_FLASHBANG ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $190
line 404
;404:				if ( ps->ammo[AM_FLASHBANGS] < 2 )
ADDRFP4 8
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
GEI4 $192
line 405
;405:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $192
line 407
;406:				else
;407:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $190
line 409
;408:			}
;409:			else if ( item->giTag == WP_GRENADE ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $194
line 410
;410:				if ( ps->ammo[AM_GRENADES] < 2 )
ADDRFP4 8
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 2
GEI4 $196
line 411
;411:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $196
line 413
;412:				else
;413:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $194
line 414
;414:			} else if ( item->giTag == WP_SMOKE ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 25
NEI4 $198
line 415
;415:				if ( ps->ammo[AM_SMOKE] < 2 )
ADDRFP4 8
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 2
GEI4 $200
line 416
;416:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $200
line 418
;417:				else
;418:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $198
line 422
;419:			}
;420:
;421:			// already got a c4 - max is one
;422:			if ( item->giTag == WP_C4 && ( BG_GotWeapon( WP_C4, (int*)ps->stats ) ) )
ADDRLP4 32
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $202
ADDRLP4 32
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $202
line 423
;423:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $202
line 425
;424:
;425:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $204
line 431
;426:		}
;427:		// Navy Seals --
;428:
;429:	case IT_AMMO:
;430:		// Navy Seals ++
;431:		{
line 432
;432:			int max = 3;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 434
;433:
;434:			switch( item->giTag ) { 
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $205
line 436
;435:				default:
;436:					max = MAX_DEFAULT;
ADDRLP4 16
CNSTI4 5
ASGNI4
line 437
;437:					break;
LABELV $206
line 440
;438:			}
;439:		
;440:			if ( ps->ammo[ item->giTag ] >= max ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $208
line 441
;441:				return qfalse;	// can't hold any more
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $208
line 444
;442:			}
;443:
;444:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $210
line 450
;445:		}
;446:		// Navy Seals --
;447:
;448:	case IT_ARMOR:
;449:		// Navy Seals ++
;450:		{
line 451
;451:			if ( ps->powerups[ item->giTag ] )
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $211
line 452
;452:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $211
line 454
;453:
;454:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $213
line 458
;455:		}// Navy Seals --
;456:
;457:	case IT_BOTROAM:
;458:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $214
line 461
;459:
;460:	case IT_TEAM: // team items, such as flags 
;461:		if (item->giTag == PW_BRIEFCASE_RETURN) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
NEI4 $215
line 462
;462:			if ( ps->powerups[PW_BRIEFCASE] && ps->persistant[PERS_TEAM] == TEAM_RED)
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $217
ADDRLP4 16
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
NEI4 $217
line 463
;463:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $217
line 465
;464:
;465:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $215
line 468
;466:		}
;467:
;468:		if (item->giTag == PW_BRIEFCASE) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $219
line 469
;469:			if ( ps->persistant[PERS_TEAM] == TEAM_BLUE || ps->powerups[PW_BRIEFCASE] )
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
EQI4 $223
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $221
LABELV $223
line 470
;470:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $221
line 472
;471:			else
;472:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $173
JUMPV
LABELV $219
line 474
;473:		} 
;474:  		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $182
LABELV $224
line 478
;475:
;476:	default:
;477:	case IT_HOLDABLE:		
;478:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $173
JUMPV
LABELV $225
line 480
;479:	case IT_BAD:
;480:        Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: IT_BAD" );
CNSTI4 1
ARGI4
ADDRGP4 $226
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 481
;481:	}
line 483
;482:
;483:	return qfalse;
CNSTI4 0
RETI4
LABELV $173
endproc BotCanItemBeGrabbed 40 8
export Touch_Item
proc Touch_Item 64 12
line 495
;484:}
;485:
;486:
;487:/*
;488:===============
;489:Touch_Item
;490:
;491:  +defcon-X: reactivated it.
;492:  defcon-X: just keep this for bots!
;493:===============
;494:*/
;495:void Touch_Item (gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 498
;496:	int			respawn;
;497: 
;498:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $229
line 499
;499:		return;
ADDRGP4 $228
JUMPV
LABELV $229
line 500
;500:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
GEI4 $231
line 501
;501:		return;		// dead people can't pickup
ADDRGP4 $228
JUMPV
LABELV $231
line 502
;502:	if ( NS_IsBot( other ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 NS_IsBot
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $233
line 504
;503:		// the same pickup rules are used for client side and server side
;504:		if ( !BotCanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) ) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotCanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $234
line 505
;505:			return;
ADDRGP4 $228
JUMPV
line 507
;506:		}	
;507:	}
LABELV $233
line 508
;508:	else if ( ent->item->giTag == PW_BRIEFCASE_RETURN && ent->item->giType == IT_TEAM )
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 9
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $238
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $238
line 509
;509:	{
line 510
;510:		if ( other->client->ps.powerups[PW_BRIEFCASE] <= 0 )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
GTI4 $239
line 511
;511:			return;
ADDRGP4 $228
JUMPV
line 512
;512:	}
LABELV $238
line 513
;513:	else if ( !(other->client->buttons & BUTTON_USE) || (other->client->oldbuttons & BUTTON_USE)  )
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1848
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $244
ADDRLP4 16
INDIRP4
CNSTI4 1852
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $242
LABELV $244
line 514
;514:		return; 
ADDRGP4 $228
JUMPV
LABELV $242
LABELV $239
LABELV $234
line 515
;515:	if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) && !NS_IsBot(other) ) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $245
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 NS_IsBot
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $245
line 516
;516:		return;
ADDRGP4 $228
JUMPV
LABELV $245
line 520
;517:	} 
;518:  
;519:	// call the item-specific pickup function
;520:	switch( ent->item->giType ) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1
LTI4 $228
ADDRLP4 36
INDIRI4
CNSTI4 9
GTI4 $228
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $256-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $256
address $251
address $252
address $253
address $228
address $228
address $228
address $255
address $228
address $254
code
LABELV $251
line 522
;521:	case IT_WEAPON:
;522:		respawn = Pickup_Weapon(ent, other); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Pickup_Weapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 523
;523:		break;
ADDRGP4 $249
JUMPV
LABELV $252
line 525
;524:	case IT_AMMO:
;525:		respawn = Pickup_Ammo(ent, other); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Pickup_Ammo
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 48
INDIRI4
ASGNI4
line 526
;526:		break;
ADDRGP4 $249
JUMPV
LABELV $253
line 528
;527:	case IT_ARMOR:
;528:		respawn = Pickup_Armor(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Pickup_Armor
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 52
INDIRI4
ASGNI4
line 529
;529:		break;
ADDRGP4 $249
JUMPV
LABELV $254
line 531
;530:	case IT_TEAM:
;531:		respawn = Pickup_Team(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 Pickup_Team
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 56
INDIRI4
ASGNI4
line 532
;532:		break;
ADDRGP4 $249
JUMPV
LABELV $255
line 534
;533:	case IT_BOTROAM:
;534:		respawn = Checked_BotRoam(ent,other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 Checked_BotRoam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 535
;535:		break; 
line 537
;536:	default:
;537:		return;
LABELV $249
line 540
;538:	}
;539:
;540:	if ( respawn == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $258
line 541
;541:		return;
ADDRGP4 $228
JUMPV
LABELV $258
line 545
;542:	}
;543:
;544:	// play the normal pickup sound
;545:	if ( (ent->item->giTag != PW_BRIEFCASE_RETURN) && (ent->item->giTag != PW_BRIEFCASE ) ) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $260
ADDRLP4 44
INDIRI4
CNSTI4 8
EQI4 $260
line 546
;546:		if ( ent->item->giType != IT_BOTROAM ) 
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
EQI4 $262
line 547
;547:			G_AddEvent( other, EV_ITEM_PICKUP, ent->s.modelindex ); 
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 25
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
LABELV $262
line 548
;548:	} 
LABELV $260
line 551
;549:
;550:	// fire item targets
;551:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 554
;552:
;553:	// wait of -1 will not respawn
;554:	if ( ent->wait == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $264
line 555
;555:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 556
;556:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 557
;557:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 558
;558:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 559
;559:		return;
ADDRGP4 $228
JUMPV
LABELV $264
line 563
;560:	}
;561:
;562:	// non zero wait overrides respawn time
;563:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $266
line 564
;564:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 565
;565:	}
LABELV $266
line 568
;566:
;567:	// random can be used to vary the respawn time
;568:	if ( ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $268
line 569
;569:		respawn += crandom() * ent->random;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 570
;570:		if ( respawn < 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $270
line 571
;571:			respawn = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 572
;572:		}
LABELV $270
line 573
;573:	}
LABELV $268
line 576
;574:
;575:	// dropped items will not respawn
;576:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $272
line 577
;577:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 578
;578:	}
LABELV $272
line 583
;579:
;580:	// picked up items still stay around, they just don't
;581:	// draw anything.  This allows respawnable items
;582:	// to be placed on movers.
;583:	ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 584
;584:	ent->s.eFlags |= EF_NODRAW;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 585
;585:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 591
;586:
;587:	// ZOID
;588:	// A negative respawn times means to never respawn this item (but don't 
;589:	// delete it).  This is used by items that are respawned by third party 
;590:	// events such as ctf flags
;591:	if ( respawn <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $274
line 592
;592:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 593
;593:		ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTP4 0
ASGNP4
line 594
;594:	} else {
ADDRGP4 $275
JUMPV
LABELV $274
line 595
;595:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 596
;596:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 597
;597:	}
LABELV $275
line 598
;598:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 599
;599:}
LABELV $228
endproc Touch_Item 64 12
export Pick_Item
proc Pick_Item 36 12
line 608
;600:
;601:/*
;602:===============
;603:Touch_Item
;604:
;605:  defcon-X: just keep this for bots!
;606:===============
;607:*/
;608:void Pick_Item (gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 611
;609:	int			respawn;
;610: 
;611:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $278
line 612
;612:		return;
ADDRGP4 $277
JUMPV
LABELV $278
line 613
;613:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
GEI4 $280
line 614
;614:		return;		// dead people can't pickup  
ADDRGP4 $277
JUMPV
LABELV $280
line 615
;615:	if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) ) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $282
line 616
;616:		return;
ADDRGP4 $277
JUMPV
LABELV $282
line 620
;617:	} 
;618: 
;619:	// call the item-specific pickup function
;620:	switch( ent->item->giType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $288
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $289
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $290
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $277
LABELV $292
ADDRLP4 8
INDIRI4
CNSTI4 9
EQI4 $291
ADDRGP4 $277
JUMPV
LABELV $288
line 622
;621:	case IT_WEAPON:
;622:		respawn = Pickup_Weapon(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Pickup_Weapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 623
;623: 		break;
ADDRGP4 $286
JUMPV
LABELV $289
line 625
;624:	case IT_AMMO:
;625:		respawn = Pickup_Ammo(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Pickup_Ammo
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 626
;626: 		break;
ADDRGP4 $286
JUMPV
LABELV $290
line 628
;627:	case IT_ARMOR:
;628:		respawn = Pickup_Armor(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Pickup_Armor
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 629
;629:		break;
ADDRGP4 $286
JUMPV
LABELV $291
line 631
;630:	case IT_TEAM:
;631:		respawn = Pickup_Team(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Pickup_Team
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ASGNI4
line 632
;632:		break;
line 634
;633: 	default:
;634:		return;
LABELV $286
line 637
;635:	}
;636:
;637:	if ( !respawn ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $293
line 638
;638:		return;
ADDRGP4 $277
JUMPV
LABELV $293
line 642
;639:	}
;640:
;641:	// play the normal pickup sound
;642:	if ( (ent->item->giTag != PW_BRIEFCASE_RETURN) && (ent->item->giTag != PW_BRIEFCASE ) ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 9
EQI4 $295
ADDRLP4 20
INDIRI4
CNSTI4 8
EQI4 $295
line 643
;643:		if ( ent->item->giType != IT_BOTROAM ) 
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
EQI4 $297
line 644
;644:	 		G_AddEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 25
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
LABELV $297
line 645
;645: 	}
LABELV $295
line 649
;646:// Navy Seals ++ 
;647:
;648:	// fire item targets
;649:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 652
;650:
;651:	// wait of -1 will not respawn
;652:	if ( ent->wait == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $299
line 653
;653:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 654
;654:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 655
;655:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 656
;656:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 657
;657:		return;
ADDRGP4 $277
JUMPV
LABELV $299
line 661
;658:	}
;659:
;660:	// non zero wait overrides respawn time
;661:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $301
line 662
;662:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 663
;663:	}
LABELV $301
line 666
;664:
;665:	// random can be used to vary the respawn time
;666:	if ( ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $303
line 667
;667:		respawn += crandom() * ent->random;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 668
;668:		if ( respawn < 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $305
line 669
;669:			respawn = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 670
;670:		}
LABELV $305
line 671
;671:	}
LABELV $303
line 674
;672:
;673:	// dropped items will not respawn
;674:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $307
line 675
;675:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 676
;676:	}
LABELV $307
line 681
;677:
;678:	// picked up items still stay around, they just don't
;679:	// draw anything.  This allows respawnable items
;680:	// to be placed on movers.
;681:	ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 682
;682:	ent->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 683
;683:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 689
;684:
;685:	// ZOID
;686:	// A negative respawn times means to never respawn this item (but don't 
;687:	// delete it).  This is used by items that are respawned by third party 
;688:	// events such as ctf flags
;689:	if ( respawn <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $309
line 690
;690:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 691
;691:		ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTP4 0
ASGNP4
line 692
;692:	} else {
ADDRGP4 $310
JUMPV
LABELV $309
line 693
;693:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 694
;694:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 695
;695:	}
LABELV $310
line 696
;696:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 697
;697:}
LABELV $277
endproc Pick_Item 36 12
export LaunchItem
proc LaunchItem 12 8
line 708
;698:
;699://======================================================================
;700:
;701:/*
;702:================
;703:LaunchItem
;704:
;705:Spawns an item and tosses it forward
;706:================
;707:*/
;708:gentity_t *LaunchItem( gitem_t *item, vec3_t origin, vec3_t velocity ) {
line 711
;709:	gentity_t	*dropped;
;710:
;711:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 713
;712:
;713:	dropped->s.eType = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 714
;714:	dropped->s.modelindex = item - bg_itemlist;	// store item number in modelindex
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 56
DIVI4
ASGNI4
line 715
;715:	dropped->s.modelindex2 = 1; // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 1
ASGNI4
line 717
;716:
;717:	dropped->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 718
;718:	dropped->item = item;
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 719
;719:	VectorSet (dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3240099840
ASGNF4
line 720
;720:	VectorSet (dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1092616192
ASGNF4
line 721
;721:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 723
;722:
;723: 	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 725
;724:
;725:	G_SetOrigin( dropped, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 726
;726:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 727
;727:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 728
;728:	VectorCopy( velocity, dropped->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 730
;729:
;730:	dropped->s.eFlags |= EF_BOUNCE_HALF;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 732
;731:	// Navy Seals ++
;732:	if (g_gametype.integer >= GT_TEAM && item->giType == IT_TEAM) { // Special case for CTF flags
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
LTI4 $314
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 9
NEI4 $314
line 733
;733: 		Team_CheckDroppedItem( dropped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 734
;734:	} else if ( g_gametype.integer != GT_LTS ) { // auto-remove after 10 seconds
ADDRGP4 $315
JUMPV
LABELV $314
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $317
line 735
;735:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 736
;736:		dropped->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 737
;737:	}
LABELV $317
LABELV $315
line 739
;738:// Navy Seals --
;739:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 4096
ASGNI4
line 741
;740:
;741:	trap_LinkEntity (dropped); 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 742
;742:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $312
endproc LaunchItem 12 8
export Drop_Item
proc Drop_Item 40 16
line 752
;743:}
;744:
;745:/*
;746:================
;747:Drop_Item
;748:
;749:Spawns an item and tosses it forward
;750:================
;751:*/
;752:gentity_t *Drop_Item( gentity_t *ent, gitem_t *item, float angle ) {
line 756
;753:	vec3_t	velocity;
;754:	vec3_t	angles;
;755:
;756:	VectorCopy( ent->s.apos.trBase, angles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 757
;757:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 758
;758:	angles[PITCH] = 0;	// always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 760
;759:
;760:	AngleVectors( angles, velocity, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 761
;761:	VectorScale( velocity, 150, velocity );
ADDRLP4 28
CNSTF4 1125515264
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1125515264
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 762
;762:	velocity[2] += 200 + crandom() * 50;
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1112014848
CNSTF4 1073741824
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1128792064
ADDF4
ADDF4
ASGNF4
line 764
;763:	
;764:	return LaunchItem( item, ent->s.pos.trBase, velocity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
RETP4
LABELV $321
endproc Drop_Item 40 16
export Use_Item
proc Use_Item 0 4
line 775
;765:}
;766:
;767:
;768:/*
;769:================
;770:Use_Item
;771:
;772:Respawn the item
;773:================
;774:*/
;775:void Use_Item( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 776
;776:	RespawnItem( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 777
;777:}
LABELV $328
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 92 28
line 789
;778:
;779://======================================================================
;780:
;781:/*
;782:================
;783:FinishSpawningItem
;784:
;785:Traces down to find where an item should rest, instead of letting them
;786:free fall from their spawn points
;787:================
;788:*/
;789:void FinishSpawningItem( gentity_t *ent ) {
line 793
;790:	trace_t		tr;
;791:	vec3_t		dest;
;792:
;793:	VectorSet( ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3240099840
ASGNF4
line 794
;794:	VectorSet( ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1092616192
ASGNF4
line 796
;795:
;796:	ent->s.eType = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 797
;797:	ent->s.modelindex = ent->item - bg_itemlist;		// store item number in modelindex
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 56
DIVI4
ASGNI4
line 798
;798:	ent->s.modelindex2 = 0; // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 800
;799:
;800:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 801
;801: 	ent->touch = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 803
;802:	// useing an item causes it to respawn
;803:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 805
;804:
;805:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $330
line 807
;806:		// suspended
;807:		G_SetOrigin( ent, ent->s.origin );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 808
;808:	} else {
ADDRGP4 $331
JUMPV
LABELV $330
line 810
;809:		// drop to floor
;810:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 72
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 811
;811:		trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 812
;812:		if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $334
line 813
;813:			G_Printf ("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $337
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 814
;814:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 815
;815:			return;
ADDRGP4 $329
JUMPV
LABELV $334
line 819
;816:		}
;817:
;818:		// allow to ride movers
;819:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 821
;820:
;821:		G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 822
;822:	}
LABELV $331
line 825
;823:
;824:	// team slaves and targeted items aren't present at start
;825:	if ( ( ent->flags & FL_TEAMSLAVE ) || ent->targetname ) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $342
ADDRLP4 72
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $340
LABELV $342
line 826
;826:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 827
;827:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 828
;828:		return;
ADDRGP4 $329
JUMPV
LABELV $340
line 830
;829:	}
;830:	if ( !Q_stricmp(ent->item->classname , "item_botroam" ) )
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $343
line 831
;831:	{
line 832
;832:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 833
;833:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 835
;834:		// G_LogPrintf("Spawned item_botroam at %s\n", vtos( ent->s.origin ) );
;835:	}
LABELV $343
line 838
;836:
;837:	// powerups don't spawn in for a while
;838:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $346
line 841
;839:		float	respawn;
;840:
;841:		respawn = 45 + crandom() * 15;
ADDRLP4 84
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 80
CNSTF4 1097859072
CNSTF4 1073741824
ADDRLP4 84
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 842
;842:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 843
;843:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 844
;844:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 80
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 845
;845:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 846
;846:		return;
ADDRGP4 $329
JUMPV
LABELV $346
line 850
;847:	}
;848:
;849:
;850:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 851
;851:}
LABELV $329
endproc FinishSpawningItem 92 28
export G_CheckTeamItems
proc G_CheckTeamItems 0 0
line 861
;852:
;853:
;854:qboolean	itemRegistered[MAX_ITEMS];
;855:
;856:/*
;857:==================
;858:G_CheckTeamItems
;859:==================
;860:*/
;861:void G_CheckTeamItems( void ) {
line 864
;862:
;863:	// Set up team stuff
;864:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 880
;865:
;866:/*	if( g_gametype.integer == GT_CTF ) {
;867:		gitem_t	*item;
;868:
;869:		// check for the two flags
;870:		item = BG_FindItem( "Red Flag" );
;871:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;872:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
;873:		}
;874:		item = BG_FindItem( "Blue Flag" );
;875:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;876:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
;877:		}
;878:	}*/
;879:
;880:}
LABELV $349
endproc G_CheckTeamItems 0 0
export ClearRegisteredItems
proc ClearRegisteredItems 8 12
line 888
;881:
;882:#define REGISTER_ALL_ITEMS	1
;883:/*
;884:==============
;885:ClearRegisteredItems
;886:==============
;887:*/
;888:void ClearRegisteredItems( void ) {
line 890
;889:
;890: 	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 891
;891:	memset( itemRegistered, 0, sizeof( itemRegistered ) );
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 895
;892:
;893:	
;894: 	// Navy Seals ++ 
;895:	if ( g_cheats.integer == 0 ) { 
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $351
line 896
;896:		for ( i = 1 ; i < WP_NUM_WEAPONS-1;i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $354
line 898
;897:			// if ( i == WP_NUTSHELL ) continue;
;898:			if ( i == WP_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $358
line 899
;899:				continue;
ADDRGP4 $355
JUMPV
LABELV $358
line 901
;900:
;901:			RegisterItem( BG_FindItemForWeapon( i ) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 902
;902:		} 
LABELV $355
line 896
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 25
LTI4 $354
line 903
;903:	}
LABELV $351
line 906
;904:	// Navy Seals --
;905:
;906:}
LABELV $350
endproc ClearRegisteredItems 8 12
export RegisterItem
proc RegisterItem 0 4
line 915
;907:
;908:/*
;909:===============
;910:RegisterItem
;911:
;912:The item will be added to the precache list
;913:===============
;914:*/
;915:void RegisterItem( gitem_t *item ) {
line 916
;916:	if ( !item ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $361
line 917
;917:		G_Error( "RegisterItem: NULL" );
ADDRGP4 $363
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 918
;918:	}
LABELV $361
line 919
;919:	itemRegistered[ item - bg_itemlist ] = qtrue;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 56
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
CNSTI4 1
ASGNI4
line 920
;920:}
LABELV $360
endproc RegisterItem 0 4
export SaveRegisteredItems
proc SaveRegisteredItems 268 8
line 931
;921:
;922:
;923:/*
;924:===============
;925:SaveRegisteredItems
;926:
;927:Write the needed items to a config string
;928:so the client will know which ones to precache
;929:===============
;930:*/
;931:void SaveRegisteredItems( void ) {
line 936
;932:	char	string[MAX_ITEMS+1];
;933:	int		i;
;934:	int		count;
;935:
;936:	count = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 937
;937:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $368
JUMPV
LABELV $365
line 938
;938:		if ( itemRegistered[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $369
line 939
;939:			count++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 940
;940:			string[i] = '1';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 49
ASGNI1
line 941
;941:		} else {
ADDRGP4 $370
JUMPV
LABELV $369
line 942
;942:			string[i] = '0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 48
ASGNI1
line 943
;943:		}
LABELV $370
line 944
;944:	}
LABELV $366
line 937
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $368
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $365
line 945
;945:	string[ bg_numItems ] = 0;
ADDRGP4 bg_numItems
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 947
;946:
;947:	G_Printf( "%i items registered\n", count );
ADDRGP4 $371
ARGP4
ADDRLP4 264
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 948
;948:	trap_SetConfigstring(CS_ITEMS, string);
CNSTI4 27
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 949
;949:}
LABELV $364
endproc SaveRegisteredItems 268 8
export G_ItemDisabled
proc G_ItemDisabled 132 16
line 956
;950:
;951:/*
;952:============
;953:G_ItemDisabled
;954:============
;955:*/
;956:int G_ItemDisabled( gitem_t *item ) {
line 960
;957:
;958:	char name[128];
;959:
;960:	Com_sprintf(name, sizeof(name), "disable_%s", item->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $373
ARGP4
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 961
;961:	return trap_Cvar_VariableIntegerValue( name );
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
RETI4
LABELV $372
endproc G_ItemDisabled 132 16
export G_SpawnItem
proc G_SpawnItem 4 12
line 974
;962:}
;963:
;964:/*
;965:============
;966:G_SpawnItem
;967:
;968:Sets the clipping size and plants the object on the floor.
;969:
;970:Items can't be immediately dropped to floor, because they might
;971:be on an entity that hasn't spawned yet.
;972:============
;973:*/
;974:void G_SpawnItem (gentity_t *ent, gitem_t *item) {
line 975
;975:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $375
ARGP4
ADDRGP4 $376
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 976
;976:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $377
ARGP4
ADDRGP4 $376
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 978
;977:
;978:	RegisterItem( item );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 979
;979:	if ( G_ItemDisabled(item) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_ItemDisabled
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $378
line 980
;980:		return;
ADDRGP4 $374
JUMPV
LABELV $378
line 982
;981:
;982:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 985
;983:	// some movers spawn on the second frame, so delay item
;984:	// spawns until the third frame so they can ride trains
;985:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 986
;986:	ent->think = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 988
;987:
;988:	ent->physicsBounce = 0.50;		// items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 1056964608
ASGNF4
line 990
;989:
;990:	if ( item->giType == IT_POWERUP ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $381
line 991
;991:		G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $165
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 992
;992:		G_SpawnFloat( "noglobalsound", "0", &ent->speed);
ADDRGP4 $383
ARGP4
ADDRGP4 $376
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 993
;993:	}
LABELV $381
line 1000
;994:
;995:#ifdef MISSIONPACK
;996:	if ( item->giType == IT_PERSISTANT_POWERUP ) {
;997:		ent->s.generic1 = ent->spawnflags;
;998:	}
;999:#endif
;1000:}
LABELV $374
endproc G_SpawnItem 4 12
export G_BounceItem
proc G_BounceItem 64 12
line 1009
;1001:
;1002:
;1003:/*
;1004:================
;1005:G_BounceItem
;1006:
;1007:================
;1008:*/
;1009:void G_BounceItem( gentity_t *ent, trace_t *trace ) {
line 1015
;1010:	vec3_t	velocity;
;1011:	float	dot;
;1012:	int		hitTime;
;1013:
;1014:	// reflect the velocity on the trace plane
;1015:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1016
;1016:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1017
;1017:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1018
;1018:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1021
;1019:
;1020:	// cut the velocity to keep from bouncing forever
;1021:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
line 1024
;1022:
;1023:	// check for stop
;1024:	if ( trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $392
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $392
line 1025
;1025:		trace->endpos[2] += 1.0;	// make sure it is off ground
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1026
;1026:		SnapVector( trace->endpos );
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1027
;1027:		G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1028
;1028:		ent->s.groundEntityNum = trace->entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 1029
;1029:		return;
ADDRGP4 $384
JUMPV
LABELV $392
line 1032
;1030:	}
;1031:
;1032:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1033
;1033:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1034
;1034:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1035
;1035:}
LABELV $384
endproc G_BounceItem 64 12
export G_RunItem
proc G_RunItem 88 28
line 1044
;1036:
;1037:
;1038:/*
;1039:================
;1040:G_RunItem
;1041:
;1042:================
;1043:*/
;1044:void G_RunItem( gentity_t *ent ) {
line 1051
;1045:	vec3_t		origin;
;1046:	trace_t		tr;
;1047:	int			contents;
;1048:	int			mask;
;1049:
;1050:	// if groundentity has been set to -1, it may have been pushed off an edge
;1051:	if ( ent->s.groundEntityNum == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $396
line 1052
;1052:		if ( ent->s.pos.trType != TR_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $398
line 1053
;1053:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1054
;1054:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1055
;1055:		}
LABELV $398
line 1056
;1056:	}
LABELV $396
line 1058
;1057:
;1058:	if ( ent->s.pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $401
line 1060
;1059:		// check think function
;1060:		G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1061
;1061:		return;
ADDRGP4 $395
JUMPV
LABELV $401
line 1065
;1062:	}
;1063:
;1064:	// get current position
;1065:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1068
;1066:
;1067:	// trace a line from the previous position to the current position
;1068:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $404
line 1069
;1069:		mask = ent->clipmask;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ASGNI4
line 1070
;1070:	} else {
ADDRGP4 $405
JUMPV
LABELV $404
line 1071
;1071:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;//MASK_SOLID;
ADDRLP4 72
CNSTI4 65537
ASGNI4
line 1072
;1072:	}
LABELV $405
line 1073
;1073:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1076
;1074:		ent->r.ownerNum, mask );
;1075:
;1076:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1078
;1077:
;1078:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $407
line 1079
;1079:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1080
;1080:	}
LABELV $407
line 1082
;1081:
;1082:	trap_LinkEntity( ent );	// FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1085
;1083:
;1084:	// check think function
;1085:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1087
;1086:
;1087:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $411
line 1088
;1088:		return;
ADDRGP4 $395
JUMPV
LABELV $411
line 1092
;1089:	}
;1090:
;1091:	// if it is in a nodrop volume, remove it
;1092:	contents = trap_PointContents( ent->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 80
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ASGNI4
line 1093
;1093:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $414
line 1094
;1094:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $416
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 9
NEI4 $416
line 1095
;1095:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 1096
;1096:		} else {
ADDRGP4 $395
JUMPV
LABELV $416
line 1097
;1097:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1098
;1098:		}
line 1099
;1099:		return;
ADDRGP4 $395
JUMPV
LABELV $414
line 1102
;1100:	}
;1101:
;1102:	G_BounceItem( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 1103
;1103:}
LABELV $395
endproc G_RunItem 88 28
bss
export itemRegistered
align 4
LABELV itemRegistered
skip 1024
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
import Add_Ammo
import ArmorIndex
import Think_Weapon
import SetRespawn
import PrecacheItem
import UseHoldableItem
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
LABELV $383
byte 1 110
byte 1 111
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $377
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $376
byte 1 48
byte 1 0
align 1
LABELV $375
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $373
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $371
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $363
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $345
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $337
byte 1 70
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $226
byte 1 66
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 66
byte 1 101
byte 1 71
byte 1 114
byte 1 97
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 73
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $177
byte 1 66
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 66
byte 1 101
byte 1 71
byte 1 114
byte 1 97
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
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
LABELV $170
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $165
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $152
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $116
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
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
LABELV $113
byte 1 94
byte 1 49
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
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
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 0
