export ScorePlum
code
proc ScorePlum 12 8
file "../g_combat.c"
line 25
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_combat.c
;4:
;5:// every line of code that differs from the quake3:arena SDK
;6:// is property of manfred nerurkar
;7:// no commercial explotation allowed
;8:// you are only allowed to use this code in navy seals: covert operations 
;9:// a quake3 arena modifiation
;10:// defcon-x@ns-co.net
;11:
;12:#include "g_local.h"
;13:
;14:#include "variables.h"
;15:
;16:int CanTeamSeeOrigin( vec3_t vTestPoint, int team, int ignoreClientNum );
;17:void NS_BotRadioMsg ( gentity_t *ent, char *msg );
;18:void NS_SendStatusMessageToTeam ( gentity_t *affected, int status, int team );
;19:
;20:/*
;21:============
;22:ScorePlum
;23:============
;24:*/
;25:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 28
;26:	gentity_t *plum;
;27:
;28:	plum = G_TempEntity( origin, EV_SCOREPLUM );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 70
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 30
;29:	// only send this temp entity to a single client
;30:	plum->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 31
;31:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 34
;32:	
;33:	//
;34:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 35
;35:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 36
;36:}
LABELV $68
endproc ScorePlum 12 8
export AddScore
proc AddScore 12 0
line 45
;37:
;38:/*
;39:============
;40:AddScore
;41:
;42:Adds score to both the client and his team
;43:============
;44:*/
;45:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 46
;46:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $70
line 47
;47:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 49
;48:	}
;49:	if ( ent->client->ps.pm_flags & PMF_FOLLOW )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $72
line 50
;50:		return;
ADDRGP4 $69
JUMPV
LABELV $72
line 59
;51:
;52:	// no scoring during pre-match warmup
;53://	if ( level.warmupTime ) {
;54://		return;
;55://	}
;56:	// show score plum
;57://	ScorePlum(ent, origin, score);
;58:	//
;59:	ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 60
;60:	if ( score > 0 ) // prevents bugs
ADDRFP4 8
INDIRI4
CNSTI4 0
LEI4 $74
line 61
;61:		ent->client->ns.num_killed += score;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3320
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
LABELV $74
line 63
;62:
;63:	if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $76
line 64
;64:		level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+48
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
LABELV $76
line 65
;65:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 66
;66:}
LABELV $69
endproc AddScore 12 0
export TossClientItems
proc TossClientItems 40 16
line 75
;67:
;68:/*
;69:=================
;70:TossClientItems
;71:
;72:Toss the weapon and powerups for the killed player
;73:=================
;74:*/
;75:void TossClientItems( gentity_t *self ) {
line 83
;76:	gitem_t		*item;
;77:	int			weapon;
;78://	float		angle;
;79:	int			i;
;80://	gentity_t	*drop;
;81:// Navy Seals ++
;82:	// drop the weapon if not a gauntlet or machinegun
;83:	weapon = self->s.weapon;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 90
;84:
;85:	// make a special check to see if they are changing to a new
;86:	// weapon that isn't the mg or gauntlet.  Without this, a client
;87:	// can pick up a weapon, be killed, and not drop the weapon because
;88:	// their weapon change hasn't completed yet and they are still holding the MG.
;89: 
;90:	if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $81
line 91
;91:		weapon = self->client->pers.cmd.weapon;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 92
;92:	}
LABELV $81
line 94
;93:
;94:	if ( BG_GotPrimary ( &self->client->ps ) )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BG_GotPrimary
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $83
line 95
;95:	{
line 96
;96:		for ( i = 0; i < WP_NUM_WEAPONS ; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $85
line 97
;97:		{
line 99
;98:			// if we got the weapon
;99:			if ( ( BG_GotWeapon( i, self->client->ps.stats ) ) )
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
ADDRLP4 16
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $89
line 100
;100:			{ 
line 102
;101:				//  if it's primary
;102:				if ( BG_IsPrimary( i ) ) // then : drop it
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $91
line 103
;103:				{ 
line 104
;104:					weapon = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 105
;105:					break;
ADDRGP4 $87
JUMPV
LABELV $91
line 107
;106:				} 
;107:			}
LABELV $89
line 108
;108:		}
LABELV $86
line 96
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $85
LABELV $87
line 109
;109:	}
LABELV $83
line 112
;110:  
;111:	// if we got a weapon to drop
;112:	if ( weapon > WP_NONE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $93
line 115
;113:	
;114:		// find the item type for this weapon
;115:		item = BG_FindItemForWeapon( weapon );
ADDRLP4 4
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
line 118
;116:
;117:		// spawn the item
;118:		Drop_Weapon(self, item, random()*360, self->client->ns.rounds[weapon] );
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1135869952
ADDRLP4 20
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2868
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Drop_Weapon
CALLP4
pop
line 121
;119:
;120:		// remove that weapon!
;121:		BG_RemoveWeapon( weapon, self->client->ps.stats );
ADDRLP4 4
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
ADDRGP4 BG_RemoveWeapon
CALLV
pop
line 123
;122:
;123:		self->client->ps.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 124
;124:	}
LABELV $93
line 126
;125:	 
;126:	weapon = WP_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 128
;127:
;128:	if ( BG_GotSecondary( &self->client->ps ) )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 BG_GotSecondary
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $95
line 129
;129:	{
line 130
;130:		for ( i = 0; i < WP_NUM_WEAPONS ; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $97
line 131
;131:		{
line 133
;132:			// if we got the weapon
;133:			if ( ( BG_GotWeapon( i, self->client->ps.stats ) ) )
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
ADDRLP4 20
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $101
line 134
;134:			{ 
line 136
;135:				//  if it's primary
;136:				if ( BG_IsSecondary( i ) ) // then : drop it
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_IsSecondary
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $103
line 137
;137:				{ 
line 138
;138:					weapon = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 139
;139:					break;
ADDRGP4 $99
JUMPV
LABELV $103
line 141
;140:				} 
;141:			}
LABELV $101
line 142
;142:		}
LABELV $98
line 130
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $97
LABELV $99
line 143
;143:	}
LABELV $95
line 146
;144:  
;145:	// if we got a weapon to drop
;146:	if ( weapon > WP_NONE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $105
line 149
;147:	
;148:		// find the item type for this weapon
;149:		item = BG_FindItemForWeapon( weapon );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 151
;150:
;151:		self->client->ps.viewangles[YAW] += 45;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 154
;152:		
;153:		// spawn the item
;154:		Drop_Weapon(self, item, random()*360, self->client->ns.rounds[weapon] );
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1135869952
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2868
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Drop_Weapon
CALLP4
pop
line 156
;155:
;156:		self->client->ps.viewangles[YAW] -= 45;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1110704128
SUBF4
ASGNF4
line 159
;157:
;158:		// remove that weapon!
;159:		BG_RemoveWeapon( weapon, self->client->ps.stats );
ADDRLP4 4
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
ADDRGP4 BG_RemoveWeapon
CALLV
pop
line 161
;160:
;161:		self->client->ps.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 162
;162:	}
LABELV $105
line 165
;163:
;164:	// drop c4
;165:	if ( BG_GotWeapon( WP_C4, self->client->ps.stats ) ) {
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $107
line 168
;166:		gentity_t *ent;
;167:
;168:		item = BG_FindItemForWeapon( WP_C4 );
CNSTI4 3
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 170
;169:
;170:		ent = Drop_Item( self, item, random()*360 );
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1135869952
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 36
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 36
INDIRP4
ASGNP4
line 172
;171:
;172:		ent->ns_team = self->client->sess.sessionTeam;
ADDRLP4 24
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
line 173
;173:	}
LABELV $107
line 175
;174:	// briefcase
;175:	if ( self->client->ps.powerups[PW_BRIEFCASE] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $109
line 176
;176:		item = BG_FindItemForPowerup(PW_BRIEFCASE);
CNSTI4 8
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 178
;177:
;178:		Drop_Item( self, item, random()*360 );
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1135869952
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 179
;179:		self->client->ps.powerups[PW_BRIEFCASE] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 180
;180:	}
LABELV $109
line 182
;181:// Navy Seals --
;182:}
LABELV $80
endproc TossClientItems 40 16
export body_die
proc body_die 0 0
line 191
;183: 
;184: 
;185:
;186:/*
;187:==================
;188:body_die
;189:==================
;190:*/
;191:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 192
;192:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $112
line 193
;193:		return;
ADDRGP4 $111
JUMPV
LABELV $112
line 195
;194:	}
;195:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $114
line 196
;196:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -39
ASGNI4
line 197
;197:		return;
LABELV $114
line 200
;198:	}
;199:
;200:}
LABELV $111
endproc body_die 0 0
export player_die
proc player_die 124 28
line 210
;201:
;202:
;203:   
;204:
;205:/*
;206:==================
;207:player_die
;208:==================
;209:*/
;210:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 218
;211:	gentity_t	*ent;
;212:	int			anim;
;213:	int			contents;
;214:	int			killer;
;215:	int			i;
;216:	char		*killerName;
;217:
;218:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $118
line 219
;219:		return;
ADDRGP4 $117
JUMPV
LABELV $118
line 222
;220:	}
;221:
;222:	if ( level.intermissiontime ) {
ADDRGP4 level+7084
INDIRI4
CNSTI4 0
EQI4 $120
line 223
;223:		return;
ADDRGP4 $117
JUMPV
LABELV $120
line 226
;224:	}
;225:  
;226:	if (BG_IsGrenade( self->s.weapon ) )
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $123
line 227
;227:	{
line 229
;228:		// grenade IS primed
;229:		if ( self->client->ps.weaponstate == WEAPON_FIRING )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $125
line 230
;230:			FireWeapon( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
LABELV $125
line 231
;231:	}
LABELV $123
line 233
;232:   
;233:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 235
;234:
;235:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $127
line 236
;236:		killer = attacker->s.number;
ADDRLP4 8
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 237
;237:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $129
line 238
;238:			killerName = attacker->client->pers.netname;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ASGNP4
line 239
;239:		} else {
ADDRGP4 $128
JUMPV
LABELV $129
line 240
;240:			killerName = "<non-client>";
ADDRLP4 16
ADDRGP4 $131
ASGNP4
line 241
;241:		}
line 242
;242:	} else {
ADDRGP4 $128
JUMPV
LABELV $127
line 243
;243:		killer = ENTITYNUM_WORLD;
ADDRLP4 8
CNSTI4 1022
ASGNI4
line 244
;244:		killerName = "<world>";
ADDRLP4 16
ADDRGP4 $132
ASGNP4
line 245
;245:	}
LABELV $128
line 247
;246:
;247:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $135
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $133
LABELV $135
line 248
;248:		killer = ENTITYNUM_WORLD;
ADDRLP4 8
CNSTI4 1022
ASGNI4
line 249
;249:		killerName = "<world>";
ADDRLP4 16
ADDRGP4 $132
ASGNP4
line 250
;250:	}
LABELV $133
line 253
;251:  
;252:	// Navy Seals ++
;253:	if ( g_gametype.integer >= GT_LTS )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $136
line 254
;254:	{
line 255
;255:		if (NS_GotPowerup( self, PW_BRIEFCASE ) && !OnSameTeam(self,attacker) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 32
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $139
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $139
line 256
;256:		{
line 257
;257:			NS_GiveReward( attacker, REWARD_BRIEFCASE_KILL, OtherTeam( self->client->sess.sessionTeam ) );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 4194304
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 NS_GiveReward
CALLV
pop
line 258
;258:		}
LABELV $139
line 259
;259:		if (self->client->ns.is_vip)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 0
EQI4 $141
line 260
;260:		{
line 261
;261:			if (self->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $143
line 262
;262:				level.done_objectives[TEAM_BLUE]++;
ADDRLP4 40
ADDRGP4 level+7412+8
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
line 263
;263:			else if (self->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $147
line 264
;264:				level.done_objectives[TEAM_RED]++;
ADDRLP4 44
ADDRGP4 level+7412+4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $147
LABELV $144
line 266
;265:
;266:			CenterPrintAll ( "The V.I.P. has been killed!\n");
ADDRGP4 $151
ARGP4
ADDRGP4 CenterPrintAll
CALLV
pop
line 268
;267:
;268:			if ( !OnSameTeam( attacker, self ) && attacker != self )
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $152
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $152
line 269
;269:				NS_GiveReward( attacker, REWARD_VIP_KILL, OtherTeam( self->client->sess.sessionTeam ) );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 NS_GiveReward
CALLV
pop
LABELV $152
line 270
;270:		}
LABELV $141
line 272
;271:
;272:		if (self->client->ps.pm_flags & PMF_BOMBCASE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $154
line 273
;273:			bomb_drop(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 bomb_drop
CALLV
pop
LABELV $154
line 274
;274:	}
LABELV $136
line 277
;275:	// Navy Seals --
;276:
;277:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %i\n", 
ADDRGP4 $156
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 282
;278:		killer, self->s.number, meansOfDeath, killerName, 
;279:		self->client->pers.netname, attacker->s.weapon );
;280:
;281:	// broadcast the death event to everyone
;282:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 65
ARGI4
ADDRLP4 36
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
ASGNP4
line 283
;283:	ent->s.eventParm = meansOfDeath;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 284
;284:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 285
;285:	ent->s.otherEntityNum2 = killer;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 286
;286:	ent->r.singleClient = self->client->ps.clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 287
;287:	ent->r.svFlags = SVF_SINGLECLIENT;	// send to self only
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 256
ASGNI4
line 289
;288:	
;289:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 291
;290:	 
;291:	if (attacker && attacker->client) {
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
CNSTU4 0
ASGNU4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $157
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $157
line 292
;292:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1908
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 294
;293:
;294:		if ( attacker != self && !g_teamlockcamera.integer )
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $159
ADDRGP4 g_teamlockcamera+12
INDIRI4
CNSTI4 0
NEI4 $159
line 295
;295:			self->client->sess.spectatorClient = attacker->client->ps.clientNum;
ADDRLP4 48
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CNSTI4 1812
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
LABELV $159
line 297
;296:
;297:		if ( OnSameTeam (self, attacker ) ) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $162
line 298
;298:		{
line 300
;299: 			// team kill kick
;300:			if ( g_maxTeamKill.integer ) {
ADDRGP4 g_maxTeamKill+12
INDIRI4
CNSTI4 0
EQI4 $158
line 301
;301:				if ( attacker == self )
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $167
line 302
;302:					AddScore( attacker ,self->r.currentOrigin, - 1);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
ADDRGP4 $158
JUMPV
LABELV $167
line 304
;303:				else
;304:				{
line 305
;305:					NS_TeamKill( attacker, self );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_TeamKill
CALLV
pop
line 308
;306:
;307:					// add a team kill
;308:					attacker->client->pers.teamKills++;
ADDRLP4 56
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1596
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 309
;309:					attacker->client->pers.lastTeamKill = level.time + ( g_TeamKillRemoveTime.integer * ONE_SECOND );
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1600
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_TeamKillRemoveTime+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 312
;310:
;311:					// we reached max team-kills
;312:					if ( attacker->client->pers.teamKills >= g_maxTeamKill.integer )
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
ADDRGP4 g_maxTeamKill+12
INDIRI4
LTI4 $171
line 313
;313:					{
line 314
;314:						PrintMsg( NULL, S_COLOR_RED"%s"S_COLOR_WHITE" has been kicked because of team killing.\n",attacker->client->pers.netname );
CNSTP4 0
ARGP4
ADDRGP4 $174
ARGP4
ADDRFP4 8
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
line 319
;315:					//	PrintMsg( attacker, "You killed %i Team Mates! \n", g_maxTeamKill.integer );
;316:
;317:					//	G_Say( attacker, NULL, 0, "quit (reason: team kill)");
;318:
;319:						trap_DropClient( attacker->s.clientNum , "Dropped due to team kills");
ADDRFP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRGP4 $175
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 320
;320:					}
ADDRGP4 $158
JUMPV
LABELV $171
line 321
;321:					else {
line 322
;322:						PrintMsg( NULL, S_COLOR_RED"%s"S_COLOR_WHITE" killed his teammate "S_COLOR_RED"%s"S_COLOR_WHITE".\nHe is allowed to do %i more kills until he is dropped.\n",
CNSTP4 0
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 60
CNSTI4 516
ASGNI4
ADDRLP4 64
ADDRFP4 8
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 508
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ARGP4
ADDRGP4 g_maxTeamKill+12
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRGP4 PrintMsg
CALLV
pop
line 328
;323:							attacker->client->pers.netname, self->client->pers.netname, g_maxTeamKill.integer - attacker->client->pers.teamKills );
;324:						// tell us that we suck 
;325:						// PrintMsg( attacker, "Kill %i more Team Mates and you will be kicked!\n", g_maxTeamKill.integer - attacker->client->pers.teamKills );
;326:
;327:						// killing team mates sucks
;328:						AddScore( attacker, self->r.currentOrigin,-1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 329
;329:					}
line 330
;330:				}
line 331
;331:			}
line 332
;332:		} 
ADDRGP4 $158
JUMPV
LABELV $162
line 333
;333:		else if ( attacker == self )
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $178
line 334
;334:		{
line 336
;335:			// self killing.. we will remove a point for that one
;336:			AddScore( attacker, self->r.currentOrigin,-1 ); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 337
;337:		} 
ADDRGP4 $158
JUMPV
LABELV $178
line 339
;338:		else 
;339:		{
line 340
;340:			AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 342
;341: 
;342:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1940
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 343
;343:		}
line 344
;344:	} else {
ADDRGP4 $158
JUMPV
LABELV $157
line 345
;345:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 346
;346:	}
LABELV $158
line 348
;347:
;348:	if ( meansOfDeath == MOD_GAUNTLET && attacker->client && g_gametype.integer == GT_LTS )
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $181
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $181
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $181
line 349
;349:		attacker->client->knife_kills++; 
ADDRLP4 48
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5168
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
LABELV $181
line 352
;350:
;351:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;352:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 52
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 52
INDIRI4
ASGNI4
line 353
;353:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 20
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $184
line 354
;354:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 355
;355:	}
ADDRGP4 $185
JUMPV
LABELV $184
line 356
;356:	else {
line 358
;357:			// if we're in a nodrop area reset the briefcase
;358:			if ( self->client->ps.powerups[PW_BRIEFCASE] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $186
line 360
;359:				// reset briefcase
;360:				Reset_Briefcase();
ADDRGP4 Reset_Briefcase
CALLV
pop
line 361
;361:			} 
LABELV $186
line 362
;362:	} 
LABELV $185
line 365
;363:
;364:	// show scores
;365:	Cmd_Score_f( self );		
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 369
;366:
;367:	// send updated scores to any clients that are following this one,
;368:	// or they would get stale scoreboards
;369:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $191
JUMPV
LABELV $188
line 372
;370:		gclient_t	*client;
;371:
;372:		client = &level.clients[i];
ADDRLP4 56
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 373
;373:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 56
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $193
line 374
;374:			continue;
ADDRGP4 $189
JUMPV
LABELV $193
line 376
;375:		}
;376:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 56
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $195
line 377
;377:			continue;
ADDRGP4 $189
JUMPV
LABELV $195
line 379
;378:		}
;379:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 56
INDIRP4
CNSTI4 1812
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $197
line 380
;380:			Cmd_Score_f( g_entities + i );
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 381
;381:		}
LABELV $197
line 382
;382:	}
LABELV $189
line 369
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $191
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $188
line 384
;383:
;384:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 386
;385:
;386:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 388
;387://	self->s.powerups = 0;
;388:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 392
;389:
;390:	
;391://	self->s.angles[0] = 0;
;392:	self->s.angles[PITCH] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 393
;393:	self->s.angles[YAW] = self->client->ps.viewangles[YAW];
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
line 394
;394: 	self->s.angles[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 396
;395: 
;396: 	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 398
;397:
;398:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 400
;399:
;400:	self->r.maxs[2] = -12;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 3242196992
ASGNF4
line 404
;401:
;402:	// don't allow respawn until the death anim is done
;403:	// g_forcerespawn may force spawning at some later time
;404:	self->client->respawnTime = level.time + 2000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 406
;405:
;406:	if ( g_teamRespawn.value > 0.0f && g_gametype.integer == GT_TEAM )
ADDRGP4 g_teamRespawn+8
INDIRF4
CNSTF4 0
LEF4 $200
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $200
line 407
;407:	{ 
line 408
;408:		if ( g_squadAssault.integer )
ADDRGP4 g_squadAssault+12
INDIRI4
CNSTI4 0
EQI4 $204
line 409
;409:		{
line 410
;410:			if ( level.squadRespawnTime < level.time )
ADDRGP4 level+49608
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $207
line 411
;411:				level.squadRespawnTime = level.time + g_teamRespawn.value * ONE_SECOND;
ADDRGP4 level+49608
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRGP4 g_teamRespawn+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
LABELV $207
line 413
;412:
;413:			self->client->respawnTime = level.squadRespawnTime;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 level+49608
INDIRI4
ASGNI4
line 414
;414:			trap_SetConfigstring( CS_ROUND_START_TIME, va("%i", level.squadRespawnTime) );
ADDRGP4 $215
ARGP4
ADDRGP4 level+49608
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 28
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 416
;415:
;416:		}
ADDRGP4 $205
JUMPV
LABELV $204
line 418
;417:		else
;418:			self->client->respawnTime = level.time + g_teamRespawn.value * ONE_SECOND;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRGP4 g_teamRespawn+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
LABELV $205
line 419
;419:	}
LABELV $200
line 425
;420:
;421:	// remove powerups
;422://	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
;423:
;424:	// never gib in a nodrop
;425:	switch ( self->client->ns.locationOfDeath )
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3344
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
LTI4 $219
ADDRLP4 64
INDIRI4
CNSTI4 10
GTI4 $219
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $230-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $230
address $222
address $223
address $224
address $226
address $225
address $227
address $227
address $228
address $228
address $229
code
line 426
;426:	{
LABELV $222
line 428
;427:		case LOC_HEAD:
;428:			anim = BOTH_DEATH_NECK;
ADDRLP4 12
CNSTI4 8
ASGNI4
line 429
;429:			break;
ADDRGP4 $220
JUMPV
LABELV $223
line 431
;430:		case LOC_FACE:
;431:			anim = BOTH_DEATH_FACE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 432
;432:			break;
ADDRGP4 $220
JUMPV
LABELV $224
line 434
;433:		case LOC_CHEST:
;434:			anim = BOTH_DEATH_CHEST;
ADDRLP4 12
CNSTI4 2
ASGNI4
line 435
;435:			break;
ADDRGP4 $220
JUMPV
LABELV $225
line 437
;436:		case LOC_BACK:
;437:			anim = BOTH_DEATH_BACK;
ADDRLP4 12
CNSTI4 10
ASGNI4
line 438
;438:			break;
ADDRGP4 $220
JUMPV
LABELV $226
line 440
;439:		case LOC_STOMACH:
;440:			anim = BOTH_DEATH_STOMACH;
ADDRLP4 12
CNSTI4 4
ASGNI4
line 441
;441:			break;
ADDRGP4 $220
JUMPV
LABELV $227
line 444
;442:		case LOC_RIGHTARM:
;443:		case LOC_LEFTARM:
;444:			anim = BOTH_DEATH_CHEST;
ADDRLP4 12
CNSTI4 2
ASGNI4
line 445
;445:			break;
ADDRGP4 $220
JUMPV
LABELV $228
line 448
;446:		case LOC_RIGHTLEG:
;447:		case LOC_LEFTLEG:
;448:			anim = BOTH_DEATH_LEGS;
ADDRLP4 12
CNSTI4 12
ASGNI4
line 449
;449:			break;
ADDRGP4 $220
JUMPV
LABELV $229
line 451
;450:		case LOC_BLEED:
;451:			anim = BOTH_DEATH_BLEED;
ADDRLP4 12
CNSTI4 6
ASGNI4
line 452
;452:			break;
ADDRGP4 $220
JUMPV
LABELV $219
line 454
;453:		default:
;454:			anim = BOTH_DEATH_BLEED;
ADDRLP4 12
CNSTI4 6
ASGNI4
line 455
;455:			break;
LABELV $220
line 459
;456:	} 
;457:	// for the no-blood option, we need to prevent the health
;458:	// from going to gib level
;459:	if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $232
line 460
;460:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -39
ASGNI4
line 461
;461:	}
LABELV $232
line 463
;462:
;463:	self->client->ps.legsAnim = 
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
CNSTI4 128
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
ADDRLP4 76
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
BXORI4
ADDRLP4 12
INDIRI4
BORI4
ASGNI4
line 465
;464:		( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;465:	self->client->ps.torsoAnim = 
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 84
CNSTI4 128
ASGNI4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
ADDRLP4 84
INDIRI4
BXORI4
ADDRLP4 12
INDIRI4
BORI4
ASGNI4
line 468
;466:		( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;467:
;468:	if ( self->waterlevel != 3 )
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CNSTI4 3
EQI4 $234
line 469
;469:		G_AddEvent( self, EV_DEATH, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
LABELV $234
line 472
;470:
;471:	// the body can still be gibbed
;472:	self->die = body_die; 
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 body_die
ASGNP4
line 474
;473:  
;474:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 477
;475:
;476:	// did anybody see from my team saw dying?
;477:	if ( g_gametype.integer >= GT_TEAM ) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
LTI4 $236
line 478
;478:	{
line 479
;479:		i = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 480
;480:		i = CanTeamSeeOrigin( self->client->ps.origin, self->client->sess.sessionTeam, self->client->ps.clientNum );
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 CanTeamSeeOrigin
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 92
INDIRI4
ASGNI4
line 483
;481:
;482:		// yeah...  so he should definitfly tell the others!
;483:		if ( i != -1 )
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $239
line 484
;484:		{
line 485
;485:			if ( self->client->ns.is_vip )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 0
EQI4 $241
line 486
;486:				NS_BotRadioMsg( &g_entities[i], "vdown" );
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $243
ARGP4
ADDRGP4 NS_BotRadioMsg
CALLV
pop
ADDRGP4 $242
JUMPV
LABELV $241
line 488
;487:			else
;488:				NS_BotRadioMsg( &g_entities[i], "mdown" );
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRGP4 NS_BotRadioMsg
CALLV
pop
LABELV $242
line 490
;489:
;490:			NS_SendStatusMessageToTeam( self, MS_DEAD, self->client->sess.sessionTeam );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 96
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 491
;491:		}
LABELV $239
line 493
;492:
;493:		if ( attacker->client && attacker->client->sess.sessionTeam != self->client->sess.sessionTeam )
ADDRLP4 96
CNSTI4 516
ASGNI4
ADDRLP4 100
ADDRFP4 8
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $245
ADDRLP4 104
CNSTI4 1800
ASGNI4
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRI4
EQI4 $245
line 494
;494:		{
line 495
;495:			i = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 497
;496:			// did anybody see from the other team saw dying?
;497:			i = CanTeamSeeOrigin( self->client->ps.origin, attacker->client->sess.sessionTeam,  self->client->ps.clientNum );
ADDRLP4 108
CNSTI4 516
ASGNI4
ADDRLP4 112
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 CanTeamSeeOrigin
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 116
INDIRI4
ASGNI4
line 500
;498:
;499:			// yeah...  so he should definitfly tell his comrads :)
;500:			if ( i != -1 )
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $247
line 501
;501:			{
line 502
;502:				if ( self->client->ns.is_vip )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
line 503
;503:					NS_BotRadioMsg( &g_entities[i], "vdown" );
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $243
ARGP4
ADDRGP4 NS_BotRadioMsg
CALLV
pop
ADDRGP4 $250
JUMPV
LABELV $249
line 504
;504:				else if ( random() < 0.5 )
ADDRLP4 120
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $251
line 505
;505:					NS_BotRadioMsg( &g_entities[i], "edown" );
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 NS_BotRadioMsg
CALLV
pop
ADDRGP4 $252
JUMPV
LABELV $251
line 507
;506:				else 
;507:					NS_BotRadioMsg( &g_entities[i], "edown2" );
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 NS_BotRadioMsg
CALLV
pop
LABELV $252
LABELV $250
line 509
;508:
;509:				NS_SendStatusMessageToTeam( self, MS_DEAD, attacker->client->sess.sessionTeam );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 510
;510:			}
LABELV $247
line 511
;511:		}
LABELV $245
line 512
;512:	} 
LABELV $236
line 513
;513:}
LABELV $117
endproc player_die 124 28
export NS_GotPowerup
proc NS_GotPowerup 0 0
line 516
;514:
;515:qboolean NS_GotPowerup( gentity_t *ent, int powerup )
;516:{
line 517
;517:	if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $256
line 518
;518:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $255
JUMPV
LABELV $256
line 519
;519:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $258
line 520
;520:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $255
JUMPV
LABELV $258
line 523
;521:	
;522:	// got powerup? 
;523:	if (ent->client->ps.powerups[powerup] > 0 )
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $260
line 524
;524:		return qtrue; // yup
CNSTI4 1
RETI4
ADDRGP4 $255
JUMPV
LABELV $260
line 527
;525:
;526:	// nope
;527:	return qfalse;
CNSTI4 0
RETI4
LABELV $255
endproc NS_GotPowerup 0 0
export G_Damage
proc G_Damage 252 32
line 557
;528:}
;529:   
;530:/*
;531:============
;532:T_Damage
;533:
;534:targ		entity that is being damaged
;535:inflictor	entity that is causing the damage
;536:attacker	entity that caused the inflictor to damage targ
;537:	example: targ=monster, inflictor=rocket, attacker=player
;538:
;539:dir			direction of the attack for knockback
;540:point		point at which the damage is being inflicted, used for headshots
;541:damage		amount of damage being inflicted
;542:knockback	force to be applied against targ as a result of the damage
;543:
;544:inflictor, attacker, dir, and point can be NULL for environmental effects
;545:
;546:dflags		these flags are used to control how T_Damage works
;547:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;548:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;549:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;550:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;551:============
;552:*/
;553:qboolean doorlock_damage( gentity_t *ent , int attackerweapon);
;554:
;555:// Navy Seals ++
;556:int G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;557:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 565
;558:// Navy Seals --
;559:	gclient_t	*client;
;560:	int			take;
;561:	int			save;
;562:	int			asave;
;563:	int			knockback;
;564:	int     dummy;
;565: 	int HitLocation = LOC_NULL;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 566
;566:	qboolean	bleeding = qfalse;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 567
;567:	qboolean	headblown = qfalse;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 568
;568:	int			armorhit = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 569
;569:	qboolean	spray_blood = qfalse;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 570
;570:	float		through_vest = 1;
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
line 575
;571:	vec3_t  newdir;
;572:	
;573://	PrintMsg( NULL, "targ: %s|inflictor: %s|attack: %s\n", targ->classname, inflictor->classname,attacker->classname );
;574:
;575:	if ( !Q_stricmp( targ->classname, "player_bbox_head") ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $265
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $263
line 577
;576:		// PrintMsg( &g_entities[ targ->client->ps.clientNum  ], "Redirecting damage from %s to %i\n", targ->classname, targ->client->ps.clientNum );
;577:		return G_Damage( &g_entities[ targ->client->ps.clientNum  ], inflictor, attacker, dir, point, damage, dflags, MOD_HEADSHOT );
CNSTI4 1108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRLP4 64
ADDRGP4 G_Damage
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
ADDRGP4 $262
JUMPV
LABELV $263
line 580
;578:	}
;579: 
;580:	if (!targ->takedamage)
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $266
line 581
;581:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $266
line 583
;582:	
;583:	if (damage <= 0) return -1;
ADDRFP4 20
INDIRI4
CNSTI4 0
GTI4 $268
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $268
line 586
;584:
;585:	// check non-client stuff, just do 4times damage
;586:	if (!targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $270
line 587
;587:		targ->health -= damage;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRFP4 20
INDIRI4
SUBI4
ASGNI4
line 588
;588:		if (targ->health < 0) { 
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GEI4 $272
line 589
;589:			targ->health = 0;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 592
;590:			
;591:			// flying away grenades
;592:			if ( !Q_stricmp(targ->classname, "40mmgrenade") ||
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $282
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $282
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $282
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $274
LABELV $282
line 595
;593:			     !Q_stricmp(targ->classname, "smokegrenade") ||
;594:					 !Q_stricmp(targ->classname, "flashbang") ||
;595:					 !Q_stricmp(targ->classname, "grenade") ) {
line 597
;596:
;597:				VectorCopy(dir, newdir);
ADDRLP4 44
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 598
;598:				VectorScale( dir, damage/2.0, targ->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
MULF4
ASGNF4
line 599
;599:				targ->s.pos.trType = TR_MOREGRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 600
;600:				targ->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 601
;601:				VectorCopy(targ->r.currentOrigin, targ->s.pos.trBase);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 602
;602:				SnapVector(targ->s.pos.trDelta);
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 603
;603:				VectorCopy(targ->r.currentOrigin, targ->pos1);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 604
;604:				targ->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 605
;605:			}
LABELV $274
line 607
;606:
;607:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 84
INDIRP4
CNSTI4 716
ADDP4
INDIRP4
CALLV
pop
line 608
;608:		}
LABELV $272
line 609
;609:		return damage;
ADDRFP4 20
INDIRI4
RETI4
ADDRGP4 $262
JUMPV
LABELV $270
line 614
;610:	}
;611:	
;612:	
;613:	// no damage to clients in warmup mode
;614:	if ( GameState == STATE_OPEN && g_gametype.integer == GT_LTS && targ->client )
ADDRGP4 GameState
INDIRI4
CNSTI4 0
NEI4 $284
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $284
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $284
line 615
;615:		return -1; 
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $284
line 618
;616:		
;617:	// no damage to clients in TEAM mode right after being spawned
;618:	if ( ( targ->client ) &&
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $287
ADDRGP4 level+32
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 1920
ADDP4
INDIRI4
SUBI4
CNSTI4 4500
GEI4 $287
ADDRLP4 64
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
NEI4 $287
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $287
line 622
;619:		   ( ( level.time - targ->client->respawnTime ) < RESPAWN_INVUNERABILITY_TIME ) &&
;620:		   targ->health == targ->client->pers.maxHealth &&
;621:		   g_gametype.integer == GT_TEAM )
;622:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $287
line 627
;623:
;624:	
;625:	// the intermission has allready been qualified for, so don't
;626:	// allow any extra scoring
;627:	if ( level.intermissionQueued )
ADDRGP4 level+7080
INDIRI4
CNSTI4 0
EQI4 $291
line 628
;628:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $291
line 630
;629: 
;630:	if ( !inflictor )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $294
line 631
;631:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+1132376
ASGNP4
LABELV $294
line 633
;632:	
;633:	if ( !attacker )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $297
line 634
;634:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+1132376
ASGNP4
LABELV $297
line 637
;635:
;636:	// no attack at all
;637:	if ( !Q_stricmp( "misc_doorlock", targ->classname ) && 
ADDRGP4 $302
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $300
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 doorlock_damage
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $300
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 doorlock_damage
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $300
line 640
;638:	     !doorlock_damage( targ, attacker->s.weapon ) && 
;639:			 !doorlock_damage( targ, inflictor->s.weapon ) )
;640:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $300
line 643
;641:
;642:	// shootable doors / buttons don't actually have any health
;643:	if ( ( targ->s.eType == ET_MOVER ||
ADDRLP4 84
CNSTI4 4
ASGNI4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $306
ADDRLP4 88
INDIRI4
CNSTI4 15
EQI4 $306
ADDRLP4 88
INDIRI4
CNSTI4 16
NEI4 $303
LABELV $306
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 is_func_explosive
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $303
line 646
;644:		     targ->s.eType == ET_DOOR ||
;645:		     targ->s.eType == ET_FUNCEXPLOSIVE ) && 
;646:	     !is_func_explosive(targ) ) {
line 649
;647:
;648:		// shoot the door open
;649:		if ( targ->use && targ->moverState == MOVER_POS1 && targ->health > 0) 
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $307
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $307
ADDRLP4 96
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
LEI4 $307
line 650
;650:			targ->use( targ, inflictor, attacker );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
LABELV $307
line 652
;651:			
;652:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $303
line 655
;653:	}
;654:  
;655:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 657
;656: 
;657:	if ( client &&
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $309
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1836
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $311
ADDRLP4 0
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $309
LABELV $311
line 659
;658:		 ( client->noclip || client->sess.waiting) )
;659:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $309
line 662
;660:
;661:		// check for completely getting out of the damage
;662:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $312
line 666
;663:
;664:		// if g_friendlyFire is set, don't do damage to the target
;665:		// if the attacker was on the same team
;666: 		if ( targ != attacker && 
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRP4
CVPU4 4
EQU4 $314
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $314
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 116
INDIRI4
NEI4 $314
line 669
;667:				 OnSameTeam (targ, attacker) &&
;668:				 !g_friendlyFire.integer )
;669:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $314
line 672
;670: 
;671:		// check for godmode
;672:		if ( targ->flags & FL_GODMODE ) 
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $317
line 673
;673:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $317
line 674
;674:	}
LABELV $312
line 678
;675:
;676:
;677:	// modify the damage inflicted from firearms over the range
;678:	if ( attacker->client && !(dflags & DAMAGE_RADIUS) ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $319
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $319
line 681
;679:	
;680:		// calculate damage on range
;681:		damage = NS_CalcDamageOnRange( attacker->client->ps.origin, point,damage, attacker->s.weapon );
ADDRLP4 104
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 NS_CalcDamageOnRange
CALLI4
ASGNI4
ADDRFP4 20
ADDRLP4 108
INDIRI4
ASGNI4
line 684
;682:
;683:		// we always have a damage of one if someone is hit!
;684:		if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $321
line 685
;685:			damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 686
;686:		}
LABELV $321
line 687
;687:	}
LABELV $319
line 690
;688:
;689:	// initialize the take variable, later this will indicate how much of the damage is done
;690:	take = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 692
;691:	
;692:	save = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 695
;693:	
;694:	// check for falldamage
;695:	if ( mod == MOD_FALLING ) {
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $323
line 697
;696:		// add damage to both legs...
;697:		targ->client->ps.stats[STAT_LEG_DAMAGE] += take; 
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 700
;698:
;699:		// remove stamina
;700:		dummy = take*2;
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 701
;701:		if (targ->client->ps.stats[STAT_STAMINA] < dummy) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $325
line 702
;702:			dummy -= targ->client->ps.stats[STAT_STAMINA];
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
SUBI4
ASGNI4
line 703
;703:			targ->client->ps.stats[STAT_STAMINA] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 704
;704:			targ->client->ps.stats[STAT_LEG_DAMAGE] += dummy*0.5;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 705
;705:			targ->client->ps.stats[STAT_CHEST_DAMAGE] += dummy*0.4;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 706
;706:			targ->client->ps.stats[STAT_HEAD_DAMAGE] += dummy*0.1;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1036831949
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 707
;707:			take += dummy;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 708
;708:		} else {
ADDRGP4 $324
JUMPV
LABELV $325
line 709
;709:			targ->client->ps.stats[STAT_STAMINA] -= dummy;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ASGNI4
line 710
;710:		}
line 712
;711:		
;712:	} else if ( targ->client && 
ADDRGP4 $324
JUMPV
LABELV $323
ADDRLP4 104
CNSTI4 516
ASGNI4
ADDRLP4 108
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $327
ADDRLP4 112
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $327
ADDRLP4 112
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $327
ADDRFP4 16
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $327
ADDRFP4 24
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $327
line 715
;713:						( attacker && attacker->client ) && 
;714:						point && 
;715:						!(dflags & DAMAGE_NO_BLEEDING) ) {
line 718
;716:
;717:		// if dead - ignore
;718:		if ( targ->r.contents == CONTENTS_CORPSE )
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 67108864
NEI4 $329
line 719
;719:			return -1; 
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $329
line 721
;720:
;721:		if ( attacker->client->ps.weapon == WP_PSG1 ||
ADDRLP4 116
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 17
EQI4 $334
ADDRLP4 116
INDIRI4
CNSTI4 24
EQI4 $334
ADDRLP4 116
INDIRI4
CNSTI4 18
NEI4 $331
LABELV $334
line 724
;722:			attacker->client->ps.weapon == WP_SL8SD || 
;723:			attacker->client->ps.weapon == WP_MACMILLAN )
;724:			through_vest = 0;  
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRGP4 $332
JUMPV
LABELV $331
line 725
;725:		else if ( NS_GotPowerup(targ, PW_VEST ) && ( BG_IsRifle( attacker->client->ps.weapon ) ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 120
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $335
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $335
line 726
;726:			through_vest = 0;//random();
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRGP4 $336
JUMPV
LABELV $335
line 727
;727:		else if ( !NS_GotPowerup( targ, PW_VEST ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 128
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $337
line 728
;728:			through_vest = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
LABELV $337
LABELV $336
LABELV $332
line 731
;729:
;730:		// get the hit location
;731:		if (g_debugDamage.integer == 1) G_Printf("getting Hitlocation\n");
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 1
NEI4 $339
ADDRGP4 $342
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $339
line 732
;732:		HitLocation = NS_CheckLocationDamage( targ,point, mod );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 NS_CheckLocationDamage
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 132
INDIRI4
ASGNI4
line 733
;733:		if (g_debugDamage.integer == 1) G_Printf("got Hitlocation: %i\n", HitLocation);
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 1
NEI4 $343
ADDRGP4 $346
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $343
line 736
;734:
;735:		// if nothing was hit, return
;736:		if (HitLocation == LOC_NULL) return -1;
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $347
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $347
line 739
;737:
;738:		// extra handling for grenades
;739:		if (dflags & DAMAGE_RADIUS) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $349
line 743
;740:		
;741:			// if we have traced the head or face, we assume partial cover. 
;742:			// No damage to other bodyparts (except arms)
;743:			if (HitLocation == LOC_FACE) {
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $351
line 744
;744:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 745
;745:				take *= 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 746
;746:				armorhit = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 747
;747:				targ->client->ps.stats[STAT_HEAD_DAMAGE] += take*0.8;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 748
;748:				targ->client->ps.stats[STAT_ARM_DAMAGE] += take*0.2;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1045220557
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 749
;749:			} else if (HitLocation == LOC_HEAD) {
ADDRGP4 $350
JUMPV
LABELV $351
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $353
line 750
;750:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 751
;751:				if (NS_GotPowerup( targ, PW_HELMET ) ) take *= 1;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 136
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $355
ADDRLP4 4
CNSTI4 1
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRGP4 $356
JUMPV
LABELV $355
line 752
;752:				else take *= 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $356
line 753
;753:				armorhit = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 754
;754:				targ->client->ps.stats[STAT_HEAD_DAMAGE] += take*0.8;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 755
;755:				targ->client->ps.stats[STAT_ARM_DAMAGE] += take*0.2;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1045220557
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 756
;756:			} else {
ADDRGP4 $350
JUMPV
LABELV $353
line 759
;757:				// we traced chest, back, stomach, arms or legs. We assume there is
;758:				// no partial cover. damage will be distributed to the damage areas.
;759:				if (NS_GotPowerup( targ, PW_VEST ) ) take *= 0.7;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 136
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $357
ADDRLP4 4
CNSTF4 1060320051
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $357
line 760
;760:				else take *= 1;
ADDRLP4 4
CNSTI4 1
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
LABELV $358
line 761
;761:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 762
;762:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 763
;763:				if ( (random() < 0.4) || NS_GotPowerup(targ, PW_VEST) ) bleeding = qfalse;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
LTF4 $361
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 144
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $359
LABELV $361
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $360
JUMPV
LABELV $359
line 764
;764:				else bleeding = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $360
line 765
;765:				targ->client->ps.stats[STAT_CHEST_DAMAGE] += take*0.45;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1055286886
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 766
;766:				targ->client->ps.stats[STAT_STOMACH_DAMAGE] += take*0.15;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1041865114
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 767
;767:				targ->client->ps.stats[STAT_LEG_DAMAGE] += take*0.2;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1045220557
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 768
;768:				targ->client->ps.stats[STAT_ARM_DAMAGE] += take*0.1;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1036831949
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 769
;769:				targ->client->ps.stats[STAT_HEAD_DAMAGE] += take*0.1;
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1036831949
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 770
;770:			}
line 773
;771:		
;772:		// here goes the calculation for bullets / melee
;773:		} else switch ( HitLocation ) {
ADDRGP4 $350
JUMPV
LABELV $349
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $362
ADDRLP4 12
INDIRI4
CNSTI4 9
GTI4 $362
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $407-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $407
address $372
address $364
address $382
address $390
address $386
address $393
address $398
address $401
address $404
code
LABELV $364
line 776
;774:		
;775:			case LOC_FACE:
;776:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 777
;777:				armorhit = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 778
;778:				take *= 10;
ADDRLP4 4
CNSTI4 10
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
line 779
;779:				if ( (take > targ->health) && (NS_CanShotgunBlowHead( targ, attacker, attacker->s.weapon ) ) ) {
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 140
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
LEI4 $365
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 144
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 NS_CanShotgunBlowHead
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $365
line 780
;780:					headblown = qtrue;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 782
;781:
;782:					if ( attacker->client->ns.rewards & REWARD_HS_KILL )
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3324
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $367
line 783
;783:						attacker->client->ns.rewards |= REWARD_HS_2KILL;	
ADDRLP4 152
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
ADDRGP4 $368
JUMPV
LABELV $367
line 785
;784:					else
;785:						attacker->client->ns.rewards |= REWARD_HS_KILL;
ADDRLP4 156
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 262144
BORI4
ASGNI4
LABELV $368
line 787
;786:
;787:					take = 999;
ADDRLP4 4
CNSTI4 999
ASGNI4
line 788
;788:					if(! (dflags & DAMAGE_RADIUS) )
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $369
line 789
;789:						PrintMsg(NULL, S_COLOR_RED"%ss face was blown away by %s!\n", targ->client->pers.netname, attacker->client->pers.netname);
CNSTP4 0
ARGP4
ADDRGP4 $371
ARGP4
ADDRLP4 160
CNSTI4 516
ASGNI4
ADDRLP4 164
CNSTI4 508
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $369
line 790
;790:				}
LABELV $365
line 791
;791:				targ->client->ps.stats[STAT_HEAD_DAMAGE] += take;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 792
;792:				break;
ADDRGP4 $363
JUMPV
LABELV $372
line 795
;793:
;794:			case LOC_HEAD:
;795:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 796
;796:				armorhit = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 797
;797:				if (NS_GotPowerup(targ, PW_HELMET)) take *= 4;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 156
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $373
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRGP4 $374
JUMPV
LABELV $373
line 798
;798:				else take *= 8;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
LABELV $374
line 799
;799:				if ( (take > targ->health) && (NS_CanShotgunBlowHead( targ, attacker, attacker->s.weapon ) ) ) {
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 160
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
LEI4 $375
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 164
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 NS_CanShotgunBlowHead
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $375
line 800
;800:					headblown = qtrue;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 802
;801:
;802:					if ( attacker->client->ns.rewards & REWARD_HS_KILL )
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3324
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $377
line 803
;803:						attacker->client->ns.rewards |= REWARD_HS_2KILL;	
ADDRLP4 172
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
ADDRGP4 $378
JUMPV
LABELV $377
line 805
;804:					else
;805:						attacker->client->ns.rewards |= REWARD_HS_KILL;
ADDRLP4 176
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 262144
BORI4
ASGNI4
LABELV $378
line 807
;806:
;807:					take = 999;
ADDRLP4 4
CNSTI4 999
ASGNI4
line 808
;808:					if(! (dflags & DAMAGE_RADIUS) )
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $379
line 809
;809:						PrintMsg(NULL, S_COLOR_RED"%ss head was blown away by %s!\n", targ->client->pers.netname, attacker->client->pers.netname);
CNSTP4 0
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 180
CNSTI4 516
ASGNI4
ADDRLP4 184
CNSTI4 508
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRP4
ADDRLP4 184
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRP4
ADDRLP4 184
INDIRI4
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
LABELV $379
line 810
;810:				}
LABELV $375
line 811
;811:				targ->client->ps.stats[STAT_HEAD_DAMAGE] += take;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 812
;812:				break;
ADDRGP4 $363
JUMPV
LABELV $382
line 815
;813:
;814:			case LOC_CHEST:
;815:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 816
;816:				take *= 2.5;
ADDRLP4 4
CNSTF4 1075838976
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 817
;817:				if ( (random() < 0.4) || NS_GotPowerup(targ, PW_VEST) ) bleeding = qfalse;
ADDRLP4 176
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
LTF4 $385
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 180
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $383
LABELV $385
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $383
line 818
;818:				else bleeding = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $384
line 819
;819:				targ->client->ps.stats[STAT_CHEST_DAMAGE] += take;
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 820
;820:				break;
ADDRGP4 $363
JUMPV
LABELV $386
line 823
;821:
;822:			case LOC_BACK:
;823:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 824
;824:				take *= 2.0;
ADDRLP4 4
CNSTF4 1073741824
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 825
;825:				if ( (random() < 0.4) || NS_GotPowerup(targ, PW_VEST) ) bleeding = qfalse;
ADDRLP4 188
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
LTF4 $389
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 192
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $387
LABELV $389
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $388
JUMPV
LABELV $387
line 826
;826:				else bleeding = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $388
line 827
;827:				targ->client->ps.stats[STAT_CHEST_DAMAGE] += take;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 828
;828:				break;
ADDRGP4 $363
JUMPV
LABELV $390
line 831
;829:					
;830:			case LOC_STOMACH:
;831:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 832
;832:				take *= 2.5;
ADDRLP4 4
CNSTF4 1075838976
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 833
;833:				if ( NS_GotPowerup(targ, PW_VEST) ) bleeding = qfalse;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 200
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $391
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $391
line 834
;834:				else bleeding = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $392
line 835
;835:				targ->client->ps.stats[STAT_STOMACH_DAMAGE] += take;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 836
;836:				break;
ADDRGP4 $363
JUMPV
LABELV $393
line 839
;837:
;838:			case LOC_RIGHTARM:
;839:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 840
;840:				take *= 1.63;
ADDRLP4 4
CNSTF4 1070638039
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 841
;841:				if ( random() < 0.6 ) bleeding = qfalse;
ADDRLP4 208
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1058642330
GEF4 $394
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $394
line 842
;842:				else bleeding = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $395
line 843
;843:				if ( (random() < 0.1) && 
ADDRLP4 212
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1036831949
GEF4 $396
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
CNSTI4 0
ASGNI4
ADDRLP4 216
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 220
INDIRI4
NEI4 $396
ADDRLP4 216
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 220
INDIRI4
LEI4 $396
line 845
;844:				     !(targ->client->ps.eFlags & EF_VIP) && 
;845:						 !(targ->s.weapon <= WP_NONE) ) NS_DropWeapon(targ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 NS_DropWeapon
CALLV
pop
LABELV $396
line 846
;846:				targ->client->ps.stats[STAT_ARM_DAMAGE] += take;
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 847
;847:				break;
ADDRGP4 $363
JUMPV
LABELV $398
line 850
;848:				
;849:			case LOC_LEFTARM:
;850:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 851
;851:				take *= 1.63;
ADDRLP4 4
CNSTF4 1070638039
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 852
;852:				if ( random() < 0.6 ) bleeding = qfalse;
ADDRLP4 228
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1058642330
GEF4 $399
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $400
JUMPV
LABELV $399
line 853
;853:				else bleeding = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $400
line 854
;854:				targ->client->ps.stats[STAT_ARM_DAMAGE] += take;
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 232
INDIRP4
ADDRLP4 232
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 855
;855:				break;
ADDRGP4 $363
JUMPV
LABELV $401
line 858
;856:
;857:			case LOC_RIGHTLEG:
;858:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 859
;859:				take *= 1.75;
ADDRLP4 4
CNSTF4 1071644672
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 860
;860:				if ( random() < 0.6 ) bleeding = qfalse;
ADDRLP4 236
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1058642330
GEF4 $402
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $403
JUMPV
LABELV $402
line 861
;861:				else bleeding = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $403
line 862
;862:				targ->client->ps.stats[STAT_LEG_DAMAGE] += take;
ADDRLP4 240
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
ADDRLP4 240
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 863
;863:				break;
ADDRGP4 $363
JUMPV
LABELV $404
line 866
;864:				
;865:			case LOC_LEFTLEG:
;866:				spray_blood = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 867
;867:				take *= 1.75;
ADDRLP4 4
CNSTF4 1071644672
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 868
;868:				if ( random() < 0.6 ) bleeding = qfalse;
ADDRLP4 244
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1058642330
GEF4 $405
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $406
JUMPV
LABELV $405
line 869
;869:				else bleeding = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
LABELV $406
line 870
;870:				targ->client->ps.stats[STAT_LEG_DAMAGE] += take;
ADDRLP4 248
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 248
INDIRP4
ADDRLP4 248
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 871
;871:				break;
LABELV $362
LABELV $363
LABELV $350
line 877
;872:				
;873:				
;874:		}
;875:		
;876:		// get the base factor if the target wears a vest and the chest was hit
;877:		if ( NS_GotPowerup( targ, PW_VEST ) && 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 140
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $409
ADDRLP4 12
INDIRI4
CNSTI4 3
NEI4 $409
ADDRLP4 12
INDIRI4
CNSTI4 5
NEI4 $409
ADDRLP4 12
INDIRI4
CNSTI4 4
NEI4 $409
line 880
;878:		     (HitLocation == LOC_CHEST) &&
;879:				 (HitLocation == LOC_BACK) &&
;880:				 (HitLocation == LOC_STOMACH) ) switch (attacker->client->ps.weapon) {
ADDRLP4 148
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 6
LTI4 $411
ADDRLP4 148
INDIRI4
CNSTI4 24
GTI4 $411
ADDRLP4 148
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $433-24
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $433
address $416
address $414
address $417
address $415
address $419
address $418
address $422
address $421
address $420
address $425
address $424
address $431
address $430
address $429
address $428
address $427
address $423
address $426
address $432
code
LABELV $414
line 882
;881:			case WP_GLOCK:
;882:				take *= SEALS_DMG_VEST_GLOCK;
ADDRLP4 4
CNSTF4 1051931443
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 883
;883:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 884
;884:				break;
ADDRGP4 $412
JUMPV
LABELV $415
line 886
;885:			case WP_P9S:
;886:				take *= SEALS_DMG_VEST_P9S;
ADDRLP4 4
CNSTF4 1051931443
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 887
;887:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 888
;888:				break;
ADDRGP4 $412
JUMPV
LABELV $416
line 890
;889:			case WP_MK23:
;890:				take *= SEALS_DMG_VEST_MK23;
ADDRLP4 4
CNSTF4 1053609165
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 891
;891:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 892
;892:				break;
ADDRGP4 $412
JUMPV
LABELV $417
line 894
;893:			case WP_SW40T:
;894:				take *= SEALS_DMG_VEST_SW40T;
ADDRLP4 4
CNSTF4 1053609165
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 895
;895:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 896
;896:				break;
ADDRGP4 $412
JUMPV
LABELV $418
line 898
;897:			case WP_SW629:
;898:				take *= SEALS_DMG_VEST_SW629;
ADDRLP4 4
CNSTF4 1055286886
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 899
;899:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 900
;900:				break;
ADDRGP4 $412
JUMPV
LABELV $419
line 902
;901:			case WP_DEAGLE:
;902:				take *= SEALS_DMG_VEST_DEAGLE;
ADDRLP4 4
CNSTF4 1055286886
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 903
;903:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 904
;904:				break;
ADDRGP4 $412
JUMPV
LABELV $420
line 906
;905:			case WP_MP5:
;906:				take *= SEALS_DMG_VEST_MP5;
ADDRLP4 4
CNSTF4 1060320051
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 907
;907:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 908
;908:				break;
ADDRGP4 $412
JUMPV
LABELV $421
line 910
;909:			case WP_MAC10:
;910:				take *= SEALS_DMG_VEST_MAC10;
ADDRLP4 4
CNSTF4 1058642330
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 911
;911:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 912
;912:				break;
ADDRGP4 $412
JUMPV
LABELV $422
line 914
;913:			case WP_PDW:
;914:				take *= SEALS_DMG_VEST_PDW;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 915
;915:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 916
;916:				break;
ADDRGP4 $412
JUMPV
LABELV $423
line 918
;917:			case WP_M14:
;918:				take *= SEALS_DMG_VEST_M14;
ADDRLP4 4
CNSTF4 1063675494
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 919
;919:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 920
;920:				break;
ADDRGP4 $412
JUMPV
LABELV $424
line 922
;921:			case WP_M4:
;922:				take *= SEALS_DMG_VEST_M4;
ADDRLP4 4
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 923
;923:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 924
;924:				break;
ADDRGP4 $412
JUMPV
LABELV $425
line 926
;925:			case WP_AK47:
;926:				take *= SEALS_DMG_VEST_AK47;
ADDRLP4 4
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 927
;927:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 928
;928:				break;
ADDRGP4 $412
JUMPV
LABELV $426
line 930
;929:			case WP_M249:
;930:				take *= SEALS_DMG_VEST_M249;
ADDRLP4 4
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 931
;931:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 932
;932:				break;
ADDRGP4 $412
JUMPV
LABELV $427
line 934
;933:			case WP_SPAS15:
;934:				take *= SEALS_DMG_VEST_SPAS15;
ADDRLP4 4
CNSTF4 1055286886
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 935
;935:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 936
;936:				break;
ADDRGP4 $412
JUMPV
LABELV $428
line 938
;937:			case WP_M590:
;938:				take *= SEALS_DMG_VEST_M590;
ADDRLP4 4
CNSTF4 1058642330
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 939
;939:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 940
;940:				break;
ADDRGP4 $412
JUMPV
LABELV $429
line 942
;941:			case WP_870:
;942:				take *= SEALS_DMG_VEST_870;
ADDRLP4 4
CNSTF4 1058642330
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 943
;943:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 944
;944:				break;
ADDRGP4 $412
JUMPV
LABELV $430
line 946
;945:			case WP_MACMILLAN:
;946:				take *= SEALS_DMG_VEST_MACMILLAN;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 947
;947:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 948
;948:				break;
ADDRGP4 $412
JUMPV
LABELV $431
line 950
;949:			case WP_PSG1:
;950:				take *= SEALS_DMG_VEST_PSG1;
ADDRLP4 4
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 951
;951:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 952
;952:				break;
ADDRGP4 $412
JUMPV
LABELV $432
line 954
;953:			case WP_SL8SD:
;954:				take *= SEALS_DMG_VEST_SL8SD;
ADDRLP4 4
CNSTF4 1060320051
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 955
;955:				armorhit = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 956
;956:				break;
LABELV $411
LABELV $412
LABELV $409
line 960
;957:		}
;958:  
;959:		// if a grenade hit was encountered, remove stamina
;960:		if(dflags & DAMAGE_RADIUS) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $435
line 961
;961:			dummy = take*4;
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 962
;962:			if ( targ->client->ps.stats[STAT_STAMINA] > dummy )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $437
line 963
;963:				targ->client->ps.stats[STAT_STAMINA] -= dummy;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $438
JUMPV
LABELV $437
line 964
;964:			else {
line 965
;965:				dummy -= targ->client->ps.stats[STAT_STAMINA];
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
SUBI4
ASGNI4
line 966
;966:				targ->client->ps.stats[STAT_STAMINA] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 967
;967:				targ->client->ps.stats[STAT_HEAD_DAMAGE] += dummy*0.2;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1045220557
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 968
;968:				targ->client->ps.stats[STAT_CHEST_DAMAGE] += dummy*0.3;
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1050253722
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 969
;969:				targ->client->ps.stats[STAT_STOMACH_DAMAGE] += dummy*0.1;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1036831949
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 970
;970:				targ->client->ps.stats[STAT_ARM_DAMAGE] += dummy*0.2;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1045220557
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 971
;971:				targ->client->ps.stats[STAT_LEG_DAMAGE] += dummy*0.2;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1045220557
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 972
;972:				take += dummy;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 973
;973:			}
LABELV $438
line 974
;974:		}
LABELV $435
line 977
;975:
;976:		// not slashing with a knife then do a bloodsplat on wall
;977:		if (spray_blood &&  !BG_IsMelee( attacker->s.weapon ) && take > 0 && !(dflags & DAMAGE_RADIUS) )
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $439
ADDRFP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 160
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 160
INDIRI4
NEI4 $439
ADDRLP4 4
INDIRI4
ADDRLP4 160
INDIRI4
LEI4 $439
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 160
INDIRI4
NEI4 $439
line 978
;978:			NS_SprayBlood(targ,point,dir,damage, headblown );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 NS_SprayBlood
CALLV
pop
LABELV $439
line 979
;979:	}
LABELV $327
LABELV $324
line 981
;980:
;981:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $441
line 982
;982:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 983
;983:	} else {
ADDRGP4 $442
JUMPV
LABELV $441
line 984
;984:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 985
;985:	}
LABELV $442
line 987
;986:
;987:	knockback = damage = take;
ADDRFP4 20
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 989
;988:
;989:	if (BG_IsShotgun(attacker->client->ps.weapon) ) knockback *= 2;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 BG_IsShotgun
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $443
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $443
line 991
;990:
;991:	if ( knockback > SEALS_MAXKNOCKBACK ) {
ADDRLP4 8
INDIRI4
CNSTI4 128
LEI4 $445
line 992
;992:		knockback = SEALS_MAXKNOCKBACK;
ADDRLP4 8
CNSTI4 128
ASGNI4
line 993
;993:	}
LABELV $445
line 994
;994:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $447
line 995
;995:		knockback = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 996
;996:	}
LABELV $447
line 997
;997:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $449
line 998
;998:		knockback = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 999
;999:	}
LABELV $449
line 1002
;1000:
;1001:	// figure momentum add, even if the damage won't be taken
;1002:	if ( g_knockback.value && knockback && targ->client/* && ( targ->health - take > 0 )'*/ ) {
ADDRGP4 g_knockback+8
INDIRF4
CNSTF4 0
EQF4 $451
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $451
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $451
line 1006
;1003:		vec3_t	kvel;
;1004:		float	mass;
;1005:
;1006:		mass = 200;
ADDRLP4 136
CNSTF4 1128792064
ASGNF4
line 1008
;1007:
;1008:		if  (dflags & DAMAGE_RADIUS) 		
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $454
line 1009
;1009:		{
line 1010
;1010:			mass = 75;
ADDRLP4 136
CNSTF4 1117126656
ASGNF4
line 1011
;1011:			VectorScale (dir, 400 * (float)knockback / mass, kvel);
ADDRLP4 140
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 144
CNSTF4 1137180672
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 136
INDIRF4
DIVF4
ASGNF4
ADDRLP4 124
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 140
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
ADDRLP4 124+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1137180672
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 136
INDIRF4
DIVF4
MULF4
ASGNF4
line 1012
;1012:		}
ADDRGP4 $455
JUMPV
LABELV $454
line 1014
;1013:		else
;1014:			VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
ADDRLP4 140
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 148
ADDRLP4 136
INDIRF4
ASGNF4
ADDRLP4 124
ADDRLP4 140
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ADDRLP4 148
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 140
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ADDRLP4 148
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 124+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 136
INDIRF4
DIVF4
MULF4
ASGNF4
LABELV $455
line 1015
;1015:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
ADDRLP4 124
INDIRF4
ADDF4
ASGNF4
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
ADDRLP4 124+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 124+8
INDIRF4
ADDF4
ASGNF4
line 1019
;1016:
;1017:		// set the timer so that the other client can't cancel
;1018:		// out the movement immediately
;1019:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $465
line 1022
;1020:			int		t;
;1021:
;1022:			t = knockback * 2;
ADDRLP4 164
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1023
;1023:			if ( t < 50 ) {
ADDRLP4 164
INDIRI4
CNSTI4 50
GEI4 $467
line 1024
;1024:				t = 50;
ADDRLP4 164
CNSTI4 50
ASGNI4
line 1025
;1025:			}
LABELV $467
line 1026
;1026:			if ( t > 1000 ) {
ADDRLP4 164
INDIRI4
CNSTI4 1000
LEI4 $469
line 1027
;1027:				t = 1000;
ADDRLP4 164
CNSTI4 1000
ASGNI4
line 1028
;1028:			}
LABELV $469
line 1029
;1029:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 164
INDIRI4
ASGNI4
line 1030
;1030:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1031
;1031:		}
LABELV $465
line 1032
;1032:	}
LABELV $451
line 1035
;1033:
;1034:
;1035:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $471
line 1036
;1036:		PrintMsg(NULL, "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 124
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 128
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 $474
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 124
INDIRI4
ADDRLP4 128
INDIRI4
ADDI4
ARGI4
ADDRGP4 PrintMsg
CALLV
pop
line 1038
;1037:			targ->health, take, NS_GotPowerup( targ, PW_VEST ) + NS_GotPowerup( targ, PW_HELMET ) );
;1038:	}
LABELV $471
line 1041
;1039:
;1040:	// if we're using a shotgun... and the target is wearing armor.. damage = 0
;1041:	if ( BG_IsShotgun( attacker->s.weapon ) )
ADDRFP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 BG_IsShotgun
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $476
line 1042
;1042:		if ( HitLocation == LOC_CHEST || HitLocation == LOC_STOMACH || HitLocation == LOC_BACK ) 
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $481
ADDRLP4 12
INDIRI4
CNSTI4 4
EQI4 $481
ADDRLP4 12
INDIRI4
CNSTI4 5
NEI4 $478
LABELV $481
line 1043
;1043:		{
line 1044
;1044:			if ( NS_GotPowerup(targ, PW_VEST ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 132
ADDRGP4 NS_GotPowerup
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $482
line 1045
;1045:				damage = 0;
ADDRFP4 20
CNSTI4 0
ASGNI4
line 1047
;1046:				// BLUTENGEL_XXX: remove vest if damage > 50 ??
;1047:			}
LABELV $482
line 1048
;1048:		}
LABELV $478
LABELV $476
line 1050
;1049:		
;1050:	save = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1060
;1051:// Navy Seals ++
;1052:	// save some from armor
;1053://	asave = CheckArmor (targ, take, dflags);
;1054://	take -= asave;
;1055:// Navy Seals -- : nope
;1056:
;1057:	// add to the damage inflicted on a player this frame
;1058:	// the total will be turned into screen blends and view angle kicks
;1059:	// at the end of the frame
;1060:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $484
line 1061
;1061:		if (armorhit == 2)
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $486
line 1062
;1062:			client->damage_blood += take * 10;
ADDRLP4 132
ADDRLP4 0
INDIRP4
CNSTI4 1876
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 10
ADDRLP4 4
INDIRI4
MULI4
ADDI4
ASGNI4
ADDRGP4 $487
JUMPV
LABELV $486
line 1063
;1063:		else if (armorhit == 1)
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $488
line 1064
;1064:			client->damage_blood += take * 5;
ADDRLP4 136
ADDRLP4 0
INDIRP4
CNSTI4 1876
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 5
ADDRLP4 4
INDIRI4
MULI4
ADDI4
ASGNI4
ADDRGP4 $489
JUMPV
LABELV $488
line 1066
;1065:		else
;1066:			client->damage_blood += take * 2;
ADDRLP4 140
ADDRLP4 0
INDIRP4
CNSTI4 1876
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
LABELV $489
LABELV $487
line 1067
;1067:		client->damage_knockback += knockback;
ADDRLP4 144
ADDRLP4 0
INDIRP4
CNSTI4 1880
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1068
;1068:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $490
line 1069
;1069:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1070
;1070:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1896
ADDP4
CNSTI4 0
ASGNI4
line 1071
;1071:		} else {
ADDRGP4 $491
JUMPV
LABELV $490
line 1072
;1072:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1073
;1073:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1896
ADDP4
CNSTI4 1
ASGNI4
line 1074
;1074:		}
LABELV $491
line 1075
;1075:		if (!client->damage_fromWorld) // bleeding can only be caused by other clients / bots
ADDRLP4 0
INDIRP4
CNSTI4 1896
ADDP4
INDIRI4
CNSTI4 0
NEI4 $492
line 1076
;1076:		{
line 1077
;1077:			if ( bleeding )
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $494
line 1078
;1078:        	{
line 1079
;1079:					client->bleed_num++; // new bleeding
ADDRLP4 148
ADDRLP4 0
INDIRP4
CNSTI4 1964
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1081
;1080:					
;1081:					{
line 1082
;1082:						int dag = damage;
ADDRLP4 152
ADDRFP4 20
INDIRI4
ASGNI4
line 1083
;1083:						if (dag>45) dag=45;
ADDRLP4 152
INDIRI4
CNSTI4 45
LEI4 $496
ADDRLP4 152
CNSTI4 45
ASGNI4
LABELV $496
line 1085
;1084:
;1085:					client->bleed_delay[client->bleed_num] = 5000 - dag * 100 + client->pers.nsPC.strength * 50 + random()*100; // formula !
ADDRLP4 156
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 2352
ADDP4
ADDP4
CNSTI4 5000
CNSTI4 100
ADDRLP4 152
INDIRI4
MULI4
SUBI4
CNSTI4 50
ADDRLP4 0
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
MULI4
ADDI4
CVIF4 4
CNSTF4 1120403456
ADDRLP4 156
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1086
;1086:					}
line 1087
;1087:					client->bleed_point[client->bleed_num] = damage / 2;
ADDRLP4 156
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
ADDRLP4 156
INDIRI4
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 2480
ADDP4
ADDP4
ADDRFP4 20
INDIRI4
ADDRLP4 156
INDIRI4
DIVI4
ASGNI4
line 1088
;1088:					client->bleed_causer[client->bleed_num] = attacker;
ADDRLP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 2736
ADDP4
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1089
;1089:					client->bleed_methodOfDeath[client->bleed_num] = mod;
ADDRLP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 2608
ADDP4
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1090
;1090:					client->bleeding = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2864
ADDP4
CNSTI4 1
ASGNI4
line 1093
;1091:					 
;1092:				//	VectorCopy(point, client->bleed_loc[client->bleed_num] ); // fix?
;1093:           			VectorSubtract (point, targ->r.absmax, client->bleed_loc[client->bleed_num]);
CNSTI4 12
ADDRLP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDP4
ADDRFP4 16
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 176
CNSTI4 4
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDP4
ADDRLP4 176
INDIRI4
ADDP4
ADDRFP4 16
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 184
CNSTI4 8
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDP4
ADDRLP4 184
INDIRI4
ADDP4
ADDRFP4 16
INDIRP4
ADDRLP4 184
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1094
;1094:       		 }
LABELV $494
line 1095
;1095:		}
LABELV $492
line 1096
;1096:	}
LABELV $484
line 1098
;1097:
;1098:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $498
line 1100
;1099:		// set the last client who damaged the target
;1100:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1912
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1101
;1101:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1916
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1102
;1102:	}
LABELV $498
line 1105
;1103:
;1104:	// do the damage
;1105:	if (take) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $500
line 1107
;1106:		// stop here if we're a corspe, we can't recieve no damage
;1107:		if ( targ->r.contents == CONTENTS_CORPSE )
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 67108864
NEI4 $502
line 1108
;1108:			return take; 
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $262
JUMPV
LABELV $502
line 1110
;1109:
;1110:		if ( is_func_explosive(targ) && !(dflags & DAMAGE_RADIUS) ) { 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 is_func_explosive
CALLI4
ASGNI4
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
EQI4 $504
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 136
INDIRI4
NEI4 $504
line 1111
;1111:			targ->health -= take;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1114
;1112:
;1113:			// if we got hits left
;1114:			targ->ns_flags--;  // remove one
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1117
;1115:
;1116:			// didn't get destroyed
;1117:			if ( targ->ns_flags > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $505
line 1118
;1118:				return take;			
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $262
JUMPV
line 1119
;1119:		} else targ->health = targ->health - take;
LABELV $504
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
LABELV $505
line 1121
;1120:
;1121:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $508
line 1122
;1122:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 144
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1123
;1123:		}
LABELV $508
line 1125
;1124:			
;1125:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $510
line 1126
;1126:			if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $512
line 1128
;1127:				//targ->flags |= FL_NO_KNOCKBACK;
;1128:				if ( mod == MOD_BLEED )
ADDRFP4 28
INDIRI4
CNSTI4 24
NEI4 $514
line 1129
;1129:					HitLocation = LOC_BLEED;
ADDRLP4 12
CNSTI4 10
ASGNI4
LABELV $514
line 1131
;1130:
;1131:				targ->client->ns.locationOfDeath = HitLocation;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3344
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1132
;1132:			}
LABELV $512
line 1134
;1133:
;1134:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $516
line 1135
;1135:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -999
ASGNI4
LABELV $516
line 1137
;1136:
;1137:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1138
;1138:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 716
ADDP4
INDIRP4
CALLV
pop
line 1139
;1139:			return take;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $262
JUMPV
LABELV $510
line 1140
;1140:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $518
line 1141
;1141:			targ->pain (targ, attacker, take);
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CALLV
pop
line 1142
;1142:		}
LABELV $518
line 1143
;1143:	}
LABELV $500
line 1145
;1144:
;1145:	return take;
ADDRLP4 4
INDIRI4
RETI4
LABELV $262
endproc G_Damage 252 32
export CanDamage
proc CanDamage 112 28
line 1158
;1146:
;1147:}
;1148:
;1149:
;1150:/*
;1151:============
;1152:CanDamage
;1153:
;1154:Returns qtrue if the inflictor can directly damage the target.  Used for
;1155:explosions and melee attacks.
;1156:============
;1157:*/
;1158:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1165
;1159:	vec3_t	dest;
;1160:	trace_t	tr;
;1161:	vec3_t	midpoint;
;1162:
;1163:	// use the midpoint of the bounds instead of the origin, because
;1164:	// bmodels may have their origin is 0,0,0
;1165:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 84
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1166
;1166:	VectorScale (midpoint, 0.5, midpoint);
ADDRLP4 88
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 88
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 88
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1056964608
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1168
;1167:
;1168:	VectorCopy (midpoint, dest); 
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1169
;1169:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1171
;1170:	
;1171:	if( tr.fraction == 1.0 )
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $527
line 1172
;1172:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $520
JUMPV
LABELV $527
line 1177
;1173:
;1174:
;1175:	// this should probably check in the plane of projection, 
;1176:	// rather than in world coordinate, and also include Z
;1177:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1178
;1178:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1179
;1179:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1180
;1180:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1182
;1181:
;1182:	if( tr.fraction == 1.0 )
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $531
line 1183
;1183:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $520
JUMPV
LABELV $531
line 1185
;1184:
;1185:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1186
;1186:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1187
;1187:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1188
;1188:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1190
;1189:	
;1190:	if( tr.fraction == 1.0 )
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $535
line 1191
;1191:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $520
JUMPV
LABELV $535
line 1193
;1192:
;1193:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1194
;1194:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1195
;1195:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1196
;1196:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1198
;1197:
;1198:	if( tr.fraction == 1.0 )
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $539
line 1199
;1199:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $520
JUMPV
LABELV $539
line 1201
;1200:
;1201:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1202
;1202:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1203
;1203:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1204
;1204:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1206
;1205:
;1206:	if( tr.fraction == 1.0 )
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $543
line 1207
;1207:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $520
JUMPV
LABELV $543
line 1209
;1208:
;1209:	return qfalse;
CNSTI4 0
RETI4
LABELV $520
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 180 32
line 1218
;1210:}
;1211:
;1212:
;1213:/*
;1214:============
;1215:G_RadiusDamage
;1216:============
;1217:*/
;1218:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius, gentity_t *ignore, int mod) {
line 1221
;1219:	gentity_t	*ent;
;1220:	int			i, e, dmg, dist;
;1221:	int			killedClients = 0; 
ADDRLP4 104
CNSTI4 0
ASGNI4
line 1223
;1222:	vec3_t		oldOrg, tracefrom;
;1223:	qboolean	hitClient = qfalse;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 1227
;1224:	trace_t tr;
;1225:
;1226:	// unlink all assault fields
;1227:	assault_link_all( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 assault_link_all
CALLI4
pop
line 1230
;1228:
;1229:	// get the radius to a reasonable amount
;1230:	if ( radius < 1.0 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $547
line 1231
;1231:		radius = 1.0;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1232
;1232:	}
LABELV $547
line 1235
;1233: 
;1234:	// remember the origin of the grenade
;1235:	VectorCopy( origin, oldOrg );
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1238
;1236:
;1237:	// raise it a lil bit over the ground
;1238:	origin[2] += 10.0f;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
ADDRGP4 $550
JUMPV
LABELV $549
line 1242
;1239:
;1240:	// get a point that's not in any wall
;1241:	while ( trap_PointContents( origin, ENTITYNUM_NONE ) & CONTENTS_SOLID )
;1242:	{
line 1243
;1243:		origin[2] -= 0.5f;	
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTF4 1056964608
SUBF4
ASGNF4
line 1245
;1244:
;1245:		if ( origin[2] < oldOrg[2] ) { // don't get stuck in a loop
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8+8
INDIRF4
GEF4 $552
line 1246
;1246:			origin[2] = oldOrg[2]; // and don't get lost in the ground
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 1247
;1247:			break;		
ADDRGP4 $551
JUMPV
LABELV $552
line 1249
;1248:		}
;1249:	} 
LABELV $550
line 1241
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1023
ARGI4
ADDRLP4 112
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $549
LABELV $551
line 1252
;1250:
;1251:	// check every entity in the level
;1252:	for (i = 0; i < level.num_entities ; i++) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $559
JUMPV
LABELV $556
line 1253
;1253:		ent = &g_entities[ i ];
ADDRLP4 4
CNSTI4 1108
ADDRLP4 32
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1256
;1254:
;1255:		// the following entities will just be ignored
;1256:		if (! ent->inuse) continue; // ignoring entities not in use
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $561
ADDRGP4 $557
JUMPV
LABELV $561
line 1257
;1257:		if (ent == ignore) continue; // ignoring as requested
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $563
ADDRGP4 $557
JUMPV
LABELV $563
line 1258
;1258:		if (! ent->takedamage) continue; // cannot take damage, i'm not interested
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $565
ADDRGP4 $557
JUMPV
LABELV $565
line 1261
;1259:		// BLUTENGEL_XXX 08.01.2004
;1260:		// why are there lots of player_bbox_head entities????
;1261:		if (! Q_stricmp(ent->classname, "player_bbox_head") ) continue; // ignore the players head bounding box
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $265
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $567
ADDRGP4 $557
JUMPV
LABELV $567
line 1264
;1262:		
;1263:		// check the distance
;1264:		for (e=0; e<3; e++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $569
line 1265
;1265:			oldOrg[e] = origin[e] - (ent->r.currentOrigin[e] + (ent->r.mins[e] + ent->r.maxs[e])*0.5 );
ADDRLP4 120
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 120
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 120
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 120
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 120
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDP4
INDIRF4
ADDRLP4 120
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
SUBF4
ASGNF4
line 1266
;1266:		}
LABELV $570
line 1264
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $569
line 1268
;1267:		// too far away
;1268:		if ( (dist = VectorLength(oldOrg)) > radius) continue;
ADDRLP4 8
ARGP4
ADDRLP4 120
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 120
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 96
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
LEF4 $573
ADDRGP4 $557
JUMPV
LABELV $573
line 1275
;1269:		
;1270:		// BLUTENGEL_XXX:
;1271:		// perhaps i should handle the player like a normal entity!
;1272:		// dunno yet.
;1273:		
;1274:		// trace to the entity if it's a player
;1275:		if (ent->client) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $575
line 1278
;1276:			
;1277:			// get the origin of the player
;1278:			VectorCopy(ent->r.currentOrigin, tracefrom);
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1281
;1279:			
;1280:			// trace to the player's feet
;1281:			trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, (CONTENTS_SOLID | CONTENTS_BODY) );
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 128
CNSTP4 0
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1284
;1282:
;1283:			// feet not hit, trace to the head
;1284:			if (tr.fraction < 1.0) {
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $577
line 1287
;1285:				
;1286:				// move the Z value of tracefrom up to the eye spot of player
;1287:				tracefrom[2] += ent->client->ps.viewheight;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1290
;1288:
;1289:				// trace to the player's head
;1290:				trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, (CONTENTS_SOLID | CONTENTS_BODY) );
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 132
CNSTP4 0
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1293
;1291:
;1292:				// head not hit, feet not hit, trace to stomach
;1293:				if (tr.fraction < 1.0) {
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $581
line 1295
;1294:					// move the Z value to the stomach
;1295:					tracefrom[2] -= ((float)ent->client->ps.viewheight)/2.0f;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
SUBF4
ASGNF4
line 1298
;1296:
;1297:					// trace to the player's head
;1298:					trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, (CONTENTS_SOLID | CONTENTS_BODY) );
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 136
CNSTP4 0
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1301
;1299:
;1300:					// ok, no important part of the player hit -> continue
;1301:					if (tr.fraction < 1.0) continue;
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $585
ADDRGP4 $557
JUMPV
LABELV $585
line 1302
;1302:				}
LABELV $581
line 1303
;1303:			}
LABELV $577
line 1306
;1304:			
;1305:			// if we get to here, a player is hit!
;1306:			hitClient = qtrue;
ADDRLP4 100
CNSTI4 1
ASGNI4
line 1308
;1307:			
;1308:		} else if (BG_IsGrenade(ent->s.weapon) ) { // if (ent->client) {
ADDRGP4 $576
JUMPV
LABELV $575
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $588
line 1311
;1309:
;1310:			// get the origin of the entity
;1311:			VectorCopy(ent->r.currentOrigin, tracefrom);
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1314
;1312:			
;1313:			// trace to the entities origin
;1314:			trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, (CONTENTS_SOLID | CONTENTS_BODY) );
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 132
CNSTP4 0
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1317
;1315:
;1316:			// not hit, try to hit higher
;1317:			if (tr.fraction < 1.0) {
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $589
line 1320
;1318:				
;1319:				// move the Z value of tracefrom a lil bit higher
;1320:				tracefrom[2] += ent->r.mins[2] + (ent->r.maxs[2] - ent->r.mins[2])*0.9;
ADDRLP4 140
ADDRLP4 4
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
ADDRLP4 140
INDIRF4
CNSTF4 1063675494
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 140
INDIRF4
SUBF4
MULF4
ADDF4
ADDF4
ASGNF4
line 1323
;1321:
;1322:				// trace 
;1323:				trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, (CONTENTS_SOLID | CONTENTS_BODY) );
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 144
CNSTP4 0
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1326
;1324:
;1325:				// not hit
;1326:				if (tr.fraction < 1.0) continue;
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $589
ADDRGP4 $557
JUMPV
line 1328
;1327:			
;1328:			}
line 1329
;1329:		} else {
LABELV $588
line 1333
;1330:			// normal entities will be hit iff the bounding box is hit
;1331:			// first calculate the middle of the entity
;1332:
;1333:			oldOrg[0] = ent->r.mins[0] + 0.5*(ent->r.maxs[0] - ent->r.mins[0]);
ADDRLP4 136
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 136
INDIRF4
CNSTF4 1056964608
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 136
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1334
;1334:			oldOrg[1] = ent->r.mins[1] + 0.5*(ent->r.maxs[1] - ent->r.mins[1]);
ADDRLP4 144
ADDRLP4 4
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 144
INDIRF4
CNSTF4 1056964608
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDRLP4 144
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1335
;1335:			oldOrg[2] = ent->r.mins[2] + 0.5*(ent->r.maxs[2] - ent->r.mins[2]);
ADDRLP4 152
ADDRLP4 4
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 152
INDIRF4
CNSTF4 1056964608
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 152
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1340
;1336:
;1337:			// now check if the middle of any of the 6 bounding box planes
;1338:			// is reachable
;1339:			
;1340:			tracefrom[0] = ent->r.mins[0];
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ASGNF4
line 1341
;1341:			tracefrom[1] = oldOrg[1];
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 1342
;1342:			tracefrom[2] = oldOrg[2];
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
ASGNF4
line 1343
;1343:			trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, CONTENTS_SOLID);
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 156
CNSTP4 0
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1344
;1344:			if (tr.fraction == 1.0) goto ENTITY_HIT;
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
NEF4 $603
ADDRGP4 $606
JUMPV
LABELV $603
line 1346
;1345:
;1346:			tracefrom[0] = oldOrg[0];
ADDRLP4 20
ADDRLP4 8
INDIRF4
ASGNF4
line 1347
;1347:			tracefrom[1] = ent->r.mins[1];
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ASGNF4
line 1348
;1348:			tracefrom[2] = oldOrg[2];
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
ASGNF4
line 1349
;1349:			trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, CONTENTS_SOLID);
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 160
CNSTP4 0
ASGNP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1350
;1350:			if (tr.fraction == 1.0) goto ENTITY_HIT;
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
NEF4 $610
ADDRGP4 $606
JUMPV
LABELV $610
line 1352
;1351:
;1352:			tracefrom[0] = oldOrg[0];
ADDRLP4 20
ADDRLP4 8
INDIRF4
ASGNF4
line 1353
;1353:			tracefrom[1] = oldOrg[1];
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 1354
;1354:			tracefrom[2] = ent->r.mins[2];
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ASGNF4
line 1355
;1355:			trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, CONTENTS_SOLID);
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 164
CNSTP4 0
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1356
;1356:			if (tr.fraction == 1.0) goto ENTITY_HIT;
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
NEF4 $616
ADDRGP4 $606
JUMPV
LABELV $616
line 1358
;1357:			
;1358:			tracefrom[0] = ent->r.maxs[0];
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ASGNF4
line 1359
;1359:			tracefrom[1] = oldOrg[1];
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 1360
;1360:			tracefrom[2] = oldOrg[2];
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
ASGNF4
line 1361
;1361:			trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, CONTENTS_SOLID);
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 168
CNSTP4 0
ASGNP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1362
;1362:			if (tr.fraction == 1.0) goto ENTITY_HIT;
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
NEF4 $623
ADDRGP4 $606
JUMPV
LABELV $623
line 1364
;1363:
;1364:			tracefrom[0] = oldOrg[0];
ADDRLP4 20
ADDRLP4 8
INDIRF4
ASGNF4
line 1365
;1365:			tracefrom[1] = ent->r.maxs[1];
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ASGNF4
line 1366
;1366:			tracefrom[2] = oldOrg[2];
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
ASGNF4
line 1367
;1367:			trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, CONTENTS_SOLID);
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 172
CNSTP4 0
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1368
;1368:			if (tr.fraction == 1.0) goto ENTITY_HIT;
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
NEF4 $629
ADDRGP4 $606
JUMPV
LABELV $629
line 1370
;1369:
;1370:			tracefrom[0] = oldOrg[0];
ADDRLP4 20
ADDRLP4 8
INDIRF4
ASGNF4
line 1371
;1371:			tracefrom[1] = oldOrg[1];
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 1372
;1372:			tracefrom[2] = ent->r.maxs[2];
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ASGNF4
line 1373
;1373:			trap_Trace(&tr, tracefrom, NULL, NULL, origin, i, CONTENTS_SOLID);
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 176
CNSTP4 0
ASGNP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1374
;1374:			if (tr.fraction == 1.0) goto ENTITY_HIT;
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
NEF4 $557
line 1377
;1375:
;1376:			// if we have not left the if statement, the entity wasn't hit.
;1377:			continue;
LABELV $589
LABELV $576
LABELV $606
line 1384
;1378:		
;1379:		}
;1380:
;1381:ENTITY_HIT:
;1382:
;1383:		// calculate damage
;1384:		if (dist < SEALS_DEATHNADERADIUS) {
ADDRLP4 96
INDIRI4
CNSTI4 64
GEI4 $638
line 1385
;1385:			dmg = 260;
ADDRLP4 92
CNSTI4 260
ASGNI4
line 1386
;1386:		} else {
ADDRGP4 $639
JUMPV
LABELV $638
line 1387
;1387:			dmg = damage * ( 1.0 - ((float)dist) / radius);
ADDRLP4 92
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
ADDRLP4 96
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
DIVF4
SUBF4
MULF4
CVFI4 4
ASGNI4
line 1390
;1388:	
;1389:			// reduce damage if it's a client and the client is ducked
;1390:			if (ent->client && (ent->client->ps.pm_flags & PMF_DUCKED) )
ADDRLP4 132
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $640
ADDRLP4 132
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $640
line 1391
;1391:				dmg = dmg - (((float)(dmg)) / 3.0);
ADDRLP4 136
ADDRLP4 92
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 92
ADDRLP4 136
INDIRF4
ADDRLP4 136
INDIRF4
CNSTF4 1077936128
DIVF4
SUBF4
CVFI4 4
ASGNI4
LABELV $640
line 1392
;1392:		}
LABELV $639
line 1400
;1393:
;1394:		// BLUTENGEL_XXX:
;1395:		// debug purposes only
;1396:		//if (ent->client) PrintMsg(NULL, "Client %s hit by grenade with %i base damage!\n", ent->client->pers.netname, dmg);
;1397:		//else PrintMsg( NULL, "Entity %s hit by grenade with %i base damage!\n", ent->classname, dmg);
;1398:
;1399:		// send the damage
;1400:		VectorSubtract(ent->r.currentOrigin, origin, oldOrg);
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 136
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 136
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1402
;1401:
;1402:		G_Damage(ent, NULL, attacker, oldOrg, origin, dmg, DAMAGE_RADIUS, mod);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLI4
pop
line 1405
;1403:
;1404:		// check if a player died
;1405:		if ( ent->health <= 0 )
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $644
line 1406
;1406:			if (ent->client && attacker && attacker->client)
ADDRLP4 140
CNSTI4 516
ASGNI4
ADDRLP4 144
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 144
INDIRU4
EQU4 $646
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
ADDRLP4 144
INDIRU4
EQU4 $646
ADDRLP4 148
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 144
INDIRU4
EQU4 $646
line 1407
;1407:				if (ent->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
ADDRLP4 152
CNSTI4 516
ASGNI4
ADDRLP4 156
CNSTI4 1800
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
EQI4 $648
line 1408
;1408:					killedClients++;
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $648
line 1410
;1409:				else
;1410:					killedClients--;
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $649
LABELV $646
LABELV $644
line 1411
;1411:	}
LABELV $557
line 1252
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $559
ADDRLP4 32
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $556
line 1413
;1412:
;1413:	if (g_gametype.integer == GT_LTS && attacker && attacker->client )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $650
ADDRLP4 116
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 120
CNSTU4 0
ASGNU4
ADDRLP4 116
INDIRP4
CVPU4 4
ADDRLP4 120
INDIRU4
EQU4 $650
ADDRLP4 116
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 120
INDIRU4
EQU4 $650
line 1414
;1414:		if ( killedClients >= 4 )
ADDRLP4 104
INDIRI4
CNSTI4 4
LTI4 $653
line 1415
;1415:			attacker->client->ns.rewards |= REWARD_4KILL_GRENADE;
ADDRLP4 124
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
ADDRGP4 $654
JUMPV
LABELV $653
line 1416
;1416:		else if ( killedClients >= 2 )
ADDRLP4 104
INDIRI4
CNSTI4 2
LTI4 $655
line 1417
;1417:			attacker->client->ns.rewards |= REWARD_2KILL_GRENADE;
ADDRLP4 128
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
LABELV $655
LABELV $654
LABELV $650
line 1420
;1418:		
;1419:	// relink all assault fields
;1420:	assault_link_all( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 assault_link_all
CALLI4
pop
line 1422
;1421:
;1422:	return hitClient;
ADDRLP4 100
INDIRI4
RETI4
LABELV $546
endproc G_RadiusDamage 180 32
import assault_link_all
import doorlock_damage
import NS_SendStatusMessageToTeam
import NS_BotRadioMsg
import CanTeamSeeOrigin
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
import G_InvulnerabilityEffect
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
LABELV $474
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $381
byte 1 94
byte 1 49
byte 1 37
byte 1 115
byte 1 115
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 32
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
byte 1 37
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $371
byte 1 94
byte 1 49
byte 1 37
byte 1 115
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 32
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
byte 1 37
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $346
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 72
byte 1 105
byte 1 116
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 72
byte 1 105
byte 1 116
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $302
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $279
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $278
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $277
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $276
byte 1 52
byte 1 48
byte 1 109
byte 1 109
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $265
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 98
byte 1 98
byte 1 111
byte 1 120
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $254
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 50
byte 1 0
align 1
LABELV $253
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $244
byte 1 109
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $243
byte 1 118
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $215
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $176
byte 1 94
byte 1 49
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 46
byte 1 10
byte 1 72
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 104
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $175
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 112
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
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $174
byte 1 94
byte 1 49
byte 1 37
byte 1 115
byte 1 94
byte 1 55
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
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
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
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $156
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $151
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 86
byte 1 46
byte 1 73
byte 1 46
byte 1 80
byte 1 46
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $131
byte 1 60
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 0
