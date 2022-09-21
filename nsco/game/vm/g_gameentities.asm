export Is_OnBrushTeam
code
proc Is_OnBrushTeam 0 0
file "../g_gameentities.c"
line 24
;1:// Copyright (C) 1999-2000 Team Mirage
;2:// [ create 6-1-2000 ]
;3://
;4:// all code in this file is property of manfred nerurkar
;5:// no commercial explotation allowed
;6:// you are only allowed to use this code in navy seals: covert operations 
;7:// a quake3 arena modifiation
;8:// defcon-x@ns-co.net
;9:
;10:#include "g_local.h" 
;11:#include "variables.h"
;12:
;13:#define BRUSH_TEAM_RED		0
;14:#define BRUSH_TEAM_BLUE		1
;15:#define BRUSH_TEAM_ALL		2
;16:
;17:// always keep in this order: 1, 2, 4 , 8, 10 , 20 , 30 , 40, 80, 100, 200 etc..
;18:
;19:void InitMover(gentity_t*ent);
;20:void LogExit(const char *string);
;21:void InitTrigger ( gentity_t *self );
;22:
;23:qboolean Is_OnBrushTeam(gentity_t *brush, gentity_t *client)
;24:{
line 25
;25:	if (brush->ns_team == BRUSH_TEAM_RED && client->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $69
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $69
line 26
;26:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $68
JUMPV
LABELV $69
line 27
;27:	else if (brush->ns_team == BRUSH_TEAM_BLUE && client->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $71
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $71
line 28
;28:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $68
JUMPV
LABELV $71
line 29
;29:	else if (brush->ns_team == BRUSH_TEAM_ALL)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 2
NEI4 $73
line 30
;30:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $68
JUMPV
LABELV $73
line 32
;31:	else
;32:		return qfalse;
CNSTI4 0
RETI4
LABELV $68
endproc Is_OnBrushTeam 0 0
export trigger_points_use
proc trigger_points_use 8 0
line 48
;33:}
;34: 
;35:
;36:/*QUAKED  trigger_missionobjective (1 0 0) (-8 -8 -8) (8 8 8)
;37:"team"			0 = seals / 1 = tangos
;38:"optional"		it won't add a new mission objective but it will mark one as completed
;39:"targetname"	when triggered, one mission objective for the team is marked as completed.
;40:
;41:use this entity if you want to create your own type of mission. for example you could create
;42:a mission where the tangos have to destroy a func_explosive in order to win.
;43:to do this you have to target this entity using your func_explosive and set team to 1.
;44:you can use as much of these as you need
;45:*/ 
;46:
;47:void trigger_points_use( gentity_t *self, gentity_t *other, gentity_t *activator ) 
;48:{
line 55
;49:	// BLUTENGEL XXX: removed 20040205 for b release
;50:/*	if ( !Is_OnBrushTeam( self, activator ) ) {
;51://		G_Printf("not on brush team!\n");
;52:		return;
;53:	}*/
;54:	
;55:	if (g_gametype.integer == GT_LTS ) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $76
line 56
;56:	{
line 57
;57:		if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $79
line 58
;58:			level.done_objectives[TEAM_RED]++;
ADDRLP4 0
ADDRGP4 level+7412+4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $80
JUMPV
LABELV $79
line 59
;59:		else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $83
line 60
;60:			level.done_objectives[TEAM_BLUE]++;
ADDRLP4 4
ADDRGP4 level+7412+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $83
LABELV $80
line 61
;61:	}
LABELV $76
line 62
;62:}
LABELV $75
endproc trigger_points_use 8 0
export trigger_points_think
proc trigger_points_think 0 0
line 64
;63:
;64:void trigger_points_think(gentity_t *self) {
line 65
;65:	return;
LABELV $87
endproc trigger_points_think 0 0
export SP_trigger_points
proc SP_trigger_points 20 12
line 68
;66:}
;67:
;68:void SP_trigger_points( gentity_t *self ) {
line 69
;69:	int optional = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 71
;70:	
;71:	G_SpawnInt( "team","0", &self->ns_team); 
ADDRGP4 $89
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 72
;72:	G_SpawnInt( "optional", "0", &optional);
ADDRGP4 $91
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 76
;73:
;74:
;75:	// check for invalid values
;76:	if ( self->ns_team != BRUSH_TEAM_RED && self->ns_team != BRUSH_TEAM_BLUE )
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $92
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $92
line 77
;77:		G_Error( "%s: 'team' with invalid value %i\n", self->classname , self->ns_team);
ADDRGP4 $94
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
LABELV $92
line 79
;78:  
;79:	self->use = trigger_points_use; 
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 trigger_points_use
ASGNP4
line 81
;80:
;81:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 84
;82:
;83:	// we're spawning this one so we got one more objective to do
;84:	if (g_gametype.integer == GT_LTS && !optional ) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $95
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $95
line 85
;85:	{
line 86
;86:		if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $98
line 87
;87:			level.num_objectives[TEAM_RED]++;
ADDRLP4 12
ADDRGP4 level+7396+4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $98
line 88
;88:		else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $102
line 89
;89:			level.num_objectives[TEAM_BLUE]++;
ADDRLP4 16
ADDRGP4 level+7396+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $102
LABELV $99
line 90
;90:	}
LABELV $95
line 91
;91:}
LABELV $88
endproc SP_trigger_points 20 12
export trigger_counter_think
proc trigger_counter_think 12 8
line 104
;92:
;93:
;94:/*QUAKED trigger_counter (0.3 0.1 0.6) (-8 -8 -8) (8 8 8) START_ON
;95:Repeatedly fires its targets.
;96:Can be turned on or off by using.
;97:
;98:"wait"			base time between triggering all targets, default is 1 
;99:"loop"			(0) no loop, (1) always loop
;100:"targetname"	can be targeted to be turned off
;101:*/
;102:
;103:void trigger_counter_think( gentity_t *self ) 
;104:{ 
line 106
;105: 
;106:	if ( !self->activator )
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
line 107
;107:		self->activator = self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $107
line 109
;108:
;109:	G_UseTargets (self, self->activator );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 112
;110:
;111:	// off
;112:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 115
;113:	
;114:	// loop?
;115:	if (self->ns_flags & NS_FLAG_LOOP)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $109
line 116
;116:		self->nextthink = level.time + self->wait;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
LABELV $109
line 117
;117:}
LABELV $106
endproc trigger_counter_think 12 8
export trigger_counter_use
proc trigger_counter_use 4 0
line 119
;118:
;119:void trigger_counter_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 120
;120:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 123
;121:	
;122:	// if on, turn it off
;123:	if ( self->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $113
line 124
;124:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 125
;125:		return;
ADDRGP4 $112
JUMPV
LABELV $113
line 129
;126:	}
;127: 
;128:	// turn it on
;129:	self->nextthink = level.time + self->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 130
;130:}
LABELV $112
endproc trigger_counter_use 4 0
export SP_trigger_counter
proc SP_trigger_counter 16 12
line 132
;131:
;132:void SP_trigger_counter( gentity_t *self ) {
line 135
;133:	int loop;
;134:
;135: 	G_SpawnFloat( "wait", "0", &self->wait );
ADDRGP4 $117
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 136
;136:	G_SpawnInt("loop", "0", &loop);
ADDRGP4 $118
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 138
;137:
;138:	self->use = trigger_counter_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 trigger_counter_use
ASGNP4
line 141
;139: 
;140:	// in seconds please...
;141:	if (!self->wait) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $119
line 142
;142:		G_Printf("No waiting time set! Default: 10\n");
ADDRGP4 $121
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 143
;143:		self->wait = 10;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1092616192
ASGNF4
line 144
;144:	}
LABELV $119
line 146
;145:
;146:	self->wait *= ONE_SECOND;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTF4 1148846080
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 148
;147:
;148:	if (loop)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $122
line 149
;149:		self->ns_flags |= NS_FLAG_LOOP;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 812
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
LABELV $122
line 151
;150:
;151:	self->think = trigger_counter_think; 
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 trigger_counter_think
ASGNP4
line 152
;152:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 155
;153:
;154:	// set initial think only when start_on and not in g_lts.
;155:	if ( ( self->spawnflags & 1 ) && ( g_gametype.integer != GT_LTS) ) {				
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $124
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $124
line 156
;156:		self->nextthink = level.time + self->wait; 
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 157
;157:	}
LABELV $124
line 160
;158:
;159:	// no draw
;160:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 161
;161:}
LABELV $116
endproc SP_trigger_counter 16 12
export explosion_explode
proc explosion_explode 8 24
line 176
;162:
;163:/*QUAKED trigger_explosion (1 0 0) (-8 -8 -8) (8 8 8)
;164:As soon as it gets triggered an explosion will be shown
;165:and dmg will be infliced within dmg_rad.
;166:If time (in seconds) is set . it will trigger every X seconds
;167:
;168:"dmg"			default 5 ( whole numbers only )
;169:"radius"		default 50 ( whole numbers only )
;170:"wait"          default 0 ( no loop , only trigger )
;171:"delay"			default 0 ( delay when triggered in sec - only when wait=0)
;172:
;173:*/
;174:
;175:void explosion_explode( gentity_t *ent )
;176:{   
line 177
;177:	G_TempEntity( ent->s.origin, EV_EXPLOSION );
ADDRLP4 0
CNSTI4 92
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 179
;178:	// splash damage
;179:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $129
line 180
;180:		G_RadiusDamage( ent->s.origin, ent, ent->splashDamage, ent->splashRadius, NULL, ent->splashMethodOfDeath );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 181
;181:	} 
LABELV $129
line 183
;182://	G_Printf("explosion_explode\n");
;183:}
LABELV $128
endproc explosion_explode 8 24
export explosion_use
proc explosion_use 4 4
line 185
;184:
;185:void explosion_use( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 186
;186:	if ( ent->random ) 
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $132
line 187
;187:	{
line 188
;188:		ent->nextthink = level.time + (ent->random*ONE_SECOND);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 189
;189:		ent->think = explosion_explode;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 explosion_explode
ASGNP4
line 190
;190:		return;
ADDRGP4 $131
JUMPV
LABELV $132
line 195
;191:	}
;192:	//
;193:
;194://	G_Printf("explosion_use\n");
;195:	explosion_explode( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 explosion_explode
CALLV
pop
line 196
;196:}
LABELV $131
endproc explosion_use 4 4
export explosion_think
proc explosion_think 4 4
line 199
;197: 
;198:void explosion_think( gentity_t *ent )
;199:{
line 200
;200:	explosion_explode( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 explosion_explode
CALLV
pop
line 207
;201: 
;202:	/*if ( ent->wait == 100 && !Q_stricmp(NS_GetMapName(),"ns_bunker") )
;203:	{
;204:		G_Printf("applying bunker hack!\n");
;205:		return;
;206:	}*/
;207:	ent->nextthink = level.time + ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 211
;208:
;209://	G_Printf("explosion_think : %f\n", ent->wait);
;210://	G_Printf("next: %i\n", ent->wait  ); 
;211:}
LABELV $135
endproc explosion_think 4 4
export SP_trigger_explosion
proc SP_trigger_explosion 16 12
line 212
;212:void SP_trigger_explosion( gentity_t *self ) {  
line 214
;213:	// grab 2 variables
;214:	G_SpawnInt( "radius", "0", &self->splashRadius );
ADDRGP4 $138
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 215
;215:	G_SpawnInt( "dmg", "0", &self->splashDamage );
ADDRGP4 $139
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 216
;216:	G_SpawnFloat( "wait", "0", &self->wait );
ADDRGP4 $117
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 217
;217:	G_SpawnFloat( "delay", "0", &self->random );
ADDRGP4 $140
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 219
;218: 
;219:	self->s.weapon = WP_GRENADE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 221
;220:
;221:	if ( !self->splashRadius ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $141
line 222
;222:		self->splashRadius = 50;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 50
ASGNI4
line 223
;223:		G_Printf("%s at %s with no radius set! Default: 50\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $143
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 224
;224:	}
LABELV $141
line 226
;225:
;226:	if ( !self->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $144
line 227
;227:		self->splashDamage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 5
ASGNI4
line 228
;228:		G_Printf("%s at %s with no damage set! Default: 5\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $146
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 229
;229:	}
LABELV $144
line 231
;230:
;231:	if ( self->wait && self->random )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
EQF4 $147
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
EQF4 $147
line 232
;232:	{
line 233
;233:		G_Error("%s at %s with 'wait' and 'delay' set!\n", self->classname, vtos(self->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $149
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 234
;234:		return;
ADDRGP4 $137
JUMPV
LABELV $147
line 237
;235:	}
;236:
;237:	if ( self->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $150
line 238
;238:		self->wait *= ONE_SECOND;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
line 239
;239:		self->think = explosion_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 explosion_think
ASGNP4
line 240
;240:		self->nextthink = level.time + self->wait;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 241
;241:	}
LABELV $150
line 244
;242: 
;243:	// set use stats
;244:	self->use = explosion_use;  
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 explosion_use
ASGNP4
line 246
;245: 
;246:}
LABELV $137
endproc SP_trigger_explosion 16 12
export info_bomb_disarm_use
proc info_bomb_disarm_use 0 8
line 256
;247:
;248:/*QUAKED info_bomb_disarm (1 0 0) (-8 -8 -8) (8 8 8)
;249:If player standing in radius from origin of ent
;250:he is able to arm a bomb.
;251:
;252:"radius"		default 50 ( whole numbers only )
;253:"team"			team 0
;254:
;255:*/
;256:void info_bomb_disarm_use( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 257
;257:		G_UseTargets( ent, activator ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 258
;258:}
LABELV $153
endproc info_bomb_disarm_use 0 8
export info_bomb_disarm_think
proc info_bomb_disarm_think 36 8
line 261
;259: 
;260:void info_bomb_disarm_think( gentity_t *ent )
;261:{
line 264
;262:	 int i;
;263:
;264:	for ( i = 0; i < level.maxclients; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $158
JUMPV
LABELV $155
line 265
;265:	{
line 266
;266:		gclient_t *client = &level.clients[i];
ADDRLP4 4
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 268
;267:
;268:		if (client->pers.connected != CON_CONNECTED)
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $160
line 269
;269:			continue;
ADDRGP4 $156
JUMPV
LABELV $160
line 271
;270:
;271:		if ( Is_OnBrushTeam( ent, &g_entities[ client - level.clients ] ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
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
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $156
line 272
;272:		{
line 274
;273:			vec3_t origin;
;274:			VectorCopy( client->ps.origin, origin );
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 276
;275:			// this should fix the bug that you can only have one bombspot
;276:			if ( client->ns.bomb_parent && client->ns.bomb_parent != ent )
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 5056
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $164
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $164
line 277
;277:				continue;
ADDRGP4 $156
JUMPV
LABELV $164
line 279
;278:
;279:			if ( Distance( ent->s.origin, origin ) <= ent->splashRadius )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
GTF4 $163
line 280
;280:			{   
line 281
;281:				if ( !( client->ps.pm_flags & PMF_BOMBRANGE ) ) { 
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $156
line 282
;282:					client->ps.pm_flags |= PMF_BOMBRANGE;
ADDRLP4 32
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 283
;283:					client->ns.bomb_parent = ent;
ADDRLP4 4
INDIRP4
CNSTI4 5056
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 284
;284:				}
line 285
;285:				continue; // skip
ADDRGP4 $156
JUMPV
line 287
;286:			} 	 
;287:		}
line 289
;288:		else
;289:		{
line 290
;290:			continue; // skip
LABELV $163
line 293
;291:		}
;292:		
;293:		if ( client->ps.pm_flags & PMF_BOMBRANGE || client->ns.bomb_parent ) {
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $172
ADDRLP4 4
INDIRP4
CNSTI4 5056
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $170
LABELV $172
line 294
;294:			client->ps.pm_flags &=~ PMF_BOMBRANGE;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 295
;295:			client->ns.bomb_parent = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 5056
ADDP4
CNSTP4 0
ASGNP4
line 296
;296:		}
LABELV $170
line 297
;297:	}
LABELV $156
line 264
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $158
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $155
line 300
;298:
;299: 
;300:	ent->nextthink = level.time + 10; 
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 301
;301:}
LABELV $154
endproc info_bomb_disarm_think 36 8
export SP_info_bomb_disarm
proc SP_info_bomb_disarm 28 12
line 303
;302:
;303:void SP_info_bomb_disarm( gentity_t *self ) { 
line 307
;304:	int	optional, defusable;
;305:
;306:	// grab 2 variables
;307: 	G_SpawnInt( "radius", "50", &self->splashRadius );
ADDRGP4 $138
ARGP4
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 308
;308:	G_SpawnInt( "team", "0", &self->ns_team );
ADDRGP4 $89
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 309
;309:	G_SpawnInt( "optional", "0", &optional );
ADDRGP4 $91
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 310
;310:	G_SpawnFloat( "time", "120", &self->wait ); 
ADDRGP4 $176
ARGP4
ADDRGP4 $177
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 311
;311:	G_SpawnInt( "defusable", "1", &defusable);
ADDRGP4 $178
ARGP4
ADDRGP4 $179
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 312
;312:	G_SpawnInt( "addmission", "1", &self->bot_chattime);
ADDRGP4 $180
ARGP4
ADDRGP4 $179
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 315
;313:
;314:	
;315:	if ( g_gametype.integer != GT_LTS )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $181
line 316
;316:		return;
ADDRGP4 $174
JUMPV
LABELV $181
line 318
;317:
;318:	self->ns_flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 320
;319:	
;320:	if (defusable) self->ns_flags |= NS_FLAG_DEFUSABLE;
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $184
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $184
line 332
;321:
;322:	/*if ( !Q_stricmp(NS_GetMapName(),"ns_snowcamp") )
;323:	{
;324:		G_Printf("applying snowcamp mapfix.\n");
;325:		optional = 1;
;326:	}
;327:	if ( !Q_stricmp(NS_GetMapName(),"ns_sleepingwolf") )
;328:	{
;329:		G_Printf("applying sleepingwolf mapfix.\n" );
;330:		self->splashRadius *= 3; 
;331:	}*/
;332:	if ( !self->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $186
line 333
;333:		self->wait = 120;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1123024896
ASGNF4
line 334
;334:		G_Printf("%s at %s with no time set! Default: 120\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $188
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 335
;335:	} 
LABELV $186
line 337
;336:
;337:	if ( !self->splashRadius ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $189
line 338
;338:		self->splashRadius = 50;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 50
ASGNI4
line 339
;339:		G_Printf("%s at %s with no radius set! Default: 50\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $143
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 340
;340:	}
LABELV $189
line 342
;341:
;342:	if (!optional)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $191
line 343
;343:	{ 
line 344
;344:		level.num_objectives[TEAM_RED]+=self->bot_chattime; 
ADDRLP4 12
ADDRGP4 level+7396+4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
ADDI4
ASGNI4
line 345
;345:		level.num_objectives[TEAM_BLUE]+=self->bot_chattime;
ADDRLP4 16
ADDRGP4 level+7396+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
ADDI4
ASGNI4
line 346
;346:	}
LABELV $191
line 350
;347:
;348://	G_Printf("spawning bomb: %i\n", self->ns_team );
;349:
;350:	if ( self->ns_team == 0 )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $197
line 351
;351:		level.bombs[TEAM_RED]++;
ADDRLP4 12
ADDRGP4 level+7428+4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $197
line 352
;352:	else if ( self->ns_team == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $201
line 353
;353:		level.bombs[TEAM_BLUE]++;
ADDRLP4 16
ADDRGP4 level+7428+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $202
JUMPV
LABELV $201
line 354
;354:	else if ( self->ns_team == 2 )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 2
NEI4 $205
line 355
;355:		level.bombs[TEAM_FREE]++;
ADDRLP4 20
ADDRGP4 level+7428
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
LABELV $202
LABELV $198
line 357
;356:
;357:	g_bombTime.integer = (int)self->wait ;
ADDRGP4 g_bombTime+12
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 358
;358:	trap_Cvar_Set( "g_bombTime", va("%i", (int)self->wait ) );
ADDRGP4 $210
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $209
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 362
;359:
;360://	G_Printf("bomtime %i\n", g_bombTime.integer );
;361:	// set use stats
;362:	self->think = info_bomb_disarm_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 info_bomb_disarm_think
ASGNP4
line 363
;363:	self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 365
;364:
;365:	self->r.svFlags = SVF_NOCLIENT;  
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 366
;366:}
LABELV $174
endproc SP_info_bomb_disarm 28 12
export func_wall_use
proc func_wall_use 4 4
line 395
;367:
;368:/*
;369:===============================================================================
;370:
;371:WALL
;372:
;373:===============================================================================
;374:*/
;375:
;376:/*QUAKED func_wall (0 .5 .8) ? TRIGGER_SPAWN TOGGLE START_ON
;377:This is just a solid wall if not inhibited
;378:
;379:TRIGGER_SPAWN	the wall will not be present until triggered
;380:				it will then blink in to existance; it will
;381:				kill anything that was in it's way
;382:
;383:TOGGLE			only valid for TRIGGER_SPAWN walls
;384:				this allows the wall to be turned on and off
;385:
;386:START_ON		only valid for TRIGGER_SPAWN walls
;387:				the wall will initially be present
;388:
;389:"model2"	.md3 model to also draw
;390:"color"		constantLight color
;391:"light"		constantLight radius
;392:*/
;393:
;394:void func_wall_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;395:{
line 396
;396:	if (self->r.contents == 0)
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 0
NEI4 $213
line 397
;397:	{
line 398
;398:		self->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1
ASGNI4
line 399
;399:		self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
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
line 401
;400://		G_KillBox (self);
;401:	}
ADDRGP4 $214
JUMPV
LABELV $213
line 403
;402:	else
;403:	{
line 404
;404:		self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 405
;405:		self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
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
line 406
;406:	}
LABELV $214
line 407
;407:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 409
;408:
;409:}
LABELV $212
endproc func_wall_use 4 4
export SP_func_wall
proc SP_func_wall 16 8
line 412
;410:
;411:void SP_func_wall (gentity_t *self)
;412:{
line 413
;413:	trap_SetBrushModel( self, self->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 414
;414:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 415
;415:	VectorCopy( self->s.origin, self->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 416
;416:	VectorCopy( self->s.origin, self->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 419
;417:
;418:	// just a wall
;419:	if ((self->spawnflags & 7) == 0)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $216
line 420
;420:	{
line 421
;421:		self->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1
ASGNI4
line 422
;422:		trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 423
;423:		return;
ADDRGP4 $215
JUMPV
LABELV $216
line 427
;424:	}
;425:
;426:	// it must be TRIGGER_SPAWN
;427:	if (!(self->spawnflags & 1))
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $218
line 428
;428:	{
line 429
;429:		G_Printf("func_wall missing TRIGGER_SPAWN\n");
ADDRGP4 $220
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 430
;430:		self->spawnflags |= 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 431
;431:	}
LABELV $218
line 434
;432:
;433:	// yell if the spawnflags are odd
;434:	if (self->spawnflags & 4)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $221
line 435
;435:	{
line 436
;436:		if (!(self->spawnflags & 2))
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $223
line 437
;437:		{
line 438
;438:			G_Printf("func_wall START_ON without TOGGLE\n");
ADDRGP4 $225
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 439
;439:			self->spawnflags |= 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 440
;440:		}
LABELV $223
line 441
;441:	}
LABELV $221
line 443
;442:
;443:	self->use = func_wall_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 func_wall_use
ASGNP4
line 444
;444:	if (self->spawnflags & 4)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $226
line 445
;445:	{
line 446
;446:		self->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1
ASGNI4
line 447
;447:	}
ADDRGP4 $227
JUMPV
LABELV $226
line 449
;448:	else
;449:	{
line 450
;450:		self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 451
;451:		self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 12
ADDRFP4 0
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
BORI4
ASGNI4
line 452
;452:	}
LABELV $227
line 453
;453:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 454
;454:}
LABELV $215
endproc SP_func_wall 16 8
export model_die
proc model_die 72 8
line 462
;455:
;456:
;457:
;458:#define WOOD		1
;459:#define METAL		2
;460:#define STONE		4
;461:
;462:void model_die ( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 467
;463:	vec3_t origin; 
;464:	gentity_t *temp; 
;465:	vec3_t dir;
;466:
;467:	VectorSubtract(self->r.maxs, self->r.mins, origin);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 32
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ASGNF4
line 471
;468: 
;469:	// define in : bg_public.h (oder so) bei den ganzen EV_ sachen das:
;470:	// EV_FUNCEXPLOSIVE, (ganz am ende hinzufügen , vor der - aber dann dem vorletzen ein , hintendran falls keines da ist '}')
;471:	temp = G_TempEntity( origin , EV_FUNCEXPLOSIVE );
ADDRLP4 4
ARGP4
CNSTI4 96
ARGI4
ADDRLP4 36
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 473
;472:
;473:	VectorCopy( self->r.maxs, temp->s.origin );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 474
;474:	VectorCopy( self->r.mins, temp->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 477
;475:	
;476:
;477:	if ( !Q_stricmp( inflictor->classname , "reallead") )
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $231
line 478
;478:	{
line 479
;479:		VectorCopy( inflictor->movedir, dir );
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRB
ASGNB 12
line 480
;480:	}
ADDRGP4 $232
JUMPV
LABELV $231
line 481
;481:	else if ( BG_IsGrenade( inflictor->s.weapon ) )
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $234
line 482
;482:	{
line 483
;483:		VectorSubtract (inflictor->r.currentOrigin, origin, dir);
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 48
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 48
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 486
;484:		// push the center of mass higher than the origin so players
;485:		// get knocked into the air more
;486:		dir[2] += 24;
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 488
;487:
;488:		VectorNormalize( dir );
ADDRLP4 16
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 489
;489:	}
ADDRGP4 $235
JUMPV
LABELV $234
line 491
;490:	else
;491:	{
line 494
;492:		vec3_t temp;
;493:
;494:		VectorAdd ( inflictor->r.absmin, inflictor->r.absmax, temp);
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 60
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 60
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48+8
ADDRLP4 64
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 495
;495:		VectorScale ( temp, 0.5, temp);
ADDRLP4 68
CNSTF4 1056964608
ASGNF4
ADDRLP4 48
ADDRLP4 68
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 68
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 48+8
CNSTF4 1056964608
ADDRLP4 48+8
INDIRF4
MULF4
ASGNF4
line 497
;496:
;497:		VectorSubtract ( origin, temp,  dir);
ADDRLP4 16
ADDRLP4 4
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 48+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 48+8
INDIRF4
SUBF4
ASGNF4
line 499
;498:
;499:		VectorNormalize( dir );
ADDRLP4 16
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 501
;500:
;501:	}
LABELV $235
LABELV $232
line 503
;502:
;503:	VectorCopy( dir, temp->s.apos.trBase );	
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 507
;504:
;505://	G_Printf("spawned func explosive @ %s\n", vtos(origin ) );
;506:
;507: 	temp->s.eventParm = self->spawnflags;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 508
;508:	temp->r.svFlags |= SVF_BROADCAST;
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 511
;509:
;510:	// 
;511:	if ( !self->fly_sound_debounce_time )
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 0
NEI4 $253
line 512
;512:	{
line 513
;513:		temp->s.frame = self->s.number; // copy entity number so we can remove all marks from this entity.
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 514
;514:		temp->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 515
;515:		temp->s.otherEntityNum2 = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 516
;516:		temp->s.powerups = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 517
;517:	}
LABELV $253
line 519
;518:
;519:	SnapVector( temp->s.origin ); 
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 92
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
ADDRLP4 0
INDIRP4
CNSTI4 96
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
ADDRLP4 0
INDIRP4
CNSTI4 100
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
line 521
;520://	G_Printf("Temp entitity: maxs: %s mins: %s , spawnflags: %i\n", vtos(temp->s.origin ), vtos(temp->s.origin2 ), temp->s.eventParm );
;521: 	return;  
LABELV $228
endproc model_die 72 8
data
export vipSpawns
align 4
LABELV vipSpawns
byte 4 0
export SP_vip_spawn
code
proc SP_vip_spawn 8 12
line 527
;522:}
;523: 
;524:
;525:int vipSpawns = 0;
;526:
;527:void SP_vip_spawn (gentity_t *ent ) {
line 530
;528://	int numobjectives = level.num_objectives[TEAM_RED] + level.num_objectives[TEAM_BLUE];
;529:	
;530:	G_SpawnFloat( "stayalive", "0", &ent->wait );
ADDRGP4 $256
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 531
;531:	G_SpawnInt	( "team", "0", &ent->ns_team );
ADDRGP4 $89
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 532
;532:	G_SpawnInt	( "givebc", "0", &ent->ns_flags );
ADDRGP4 $257
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 534
;533: 
;534:	if ( g_gametype.integer != GT_LTS )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $258
line 535
;535:		return;
ADDRGP4 $255
JUMPV
LABELV $258
line 537
;536:
;537:	if ( vipSpawns <= 0 )
ADDRGP4 vipSpawns
INDIRI4
CNSTI4 0
GTI4 $261
line 538
;538:	{
line 539
;539:		level.num_objectives[TEAM_RED]++;
ADDRLP4 0
ADDRGP4 level+7396+4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 540
;540:		level.num_objectives[TEAM_BLUE]++; 
ADDRLP4 4
ADDRGP4 level+7396+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 541
;541:	}
LABELV $261
line 544
;542://	G_Printf("spawning vipspawnpoint: %i %i %i\n", level.num_objectives[TEAM_RED],level.num_objectives[TEAM_BLUE], numobjectives);
;543:
;544:	vipSpawns++;
ADDRLP4 0
ADDRGP4 vipSpawns
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 546
;545:
;546:	if ( ent->wait && !level.vipTime)
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $267
ADDRGP4 level+7460
INDIRI4
CNSTI4 0
NEI4 $267
line 547
;547:	{
line 548
;548:		G_Printf("Vip has to stay alive... %i seconds\n", ent->wait );
ADDRGP4 $270
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_Printf
CALLV
pop
line 550
;549:    
;550: 		if ( ent->ns_team == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $271
line 551
;551:			level.vip[TEAM_RED] = VIP_STAYALIVE;
ADDRGP4 level+7444+4
CNSTI4 2
ASGNI4
line 552
;552:		}
ADDRGP4 $272
JUMPV
LABELV $271
line 553
;553:		else if ( ent->ns_team == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $275
line 554
;554:			level.vip[TEAM_BLUE] = VIP_STAYALIVE;
ADDRGP4 level+7444+8
CNSTI4 2
ASGNI4
line 555
;555:		}
ADDRGP4 $276
JUMPV
LABELV $275
line 556
;556:		else if ( ent->ns_team >= 2 || ent->ns_team < 0 ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $281
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $279
LABELV $281
line 557
;557:			G_Error("%s: team > 1?", ent->classname );
ADDRGP4 $282
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 558
;558:			return;
ADDRGP4 $255
JUMPV
LABELV $279
LABELV $276
LABELV $272
line 560
;559:		}  
;560:		level.vipTime = ent->wait * ONE_SECOND;
ADDRGP4 level+7460
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 561
;561:	}
LABELV $267
line 562
;562:}
LABELV $255
endproc SP_vip_spawn 8 12
export info_vip_rescue_think
proc info_vip_rescue_think 40 12
line 574
;563:
;564:
;565:/*QUAKED info_vip_rescue (1 0 0) (-8 -8 -8) (8 8 8)
;566:If V.I.P. of the given team (0/1) is reaching this.
;567:Team will 
;568:
;569:"radius"		default 50 ( whole numbers only )
;570:"team"			team  0 seals, 1 tangos 
;571:"bconly"		only allow the vip to exit with the briefcase in his hand
;572:*/ 
;573:void info_vip_rescue_think( gentity_t *ent )
;574:{
line 577
;575:	int i;
;576:
;577:	for ( i = 0; i < level.maxclients; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $285
line 578
;578:	{
line 579
;579:		gclient_t *client = &level.clients[i];
ADDRLP4 4
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 581
;580:
;581:		if (client->pers.connected != CON_CONNECTED)
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $290
line 582
;582:			continue;
ADDRGP4 $286
JUMPV
LABELV $290
line 585
;583:
;584:		if (
;585:			Is_OnBrushTeam( ent, &g_entities[ client - level.clients ] ) 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
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
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $292
ADDRLP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $292
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
GTF4 $292
ADDRLP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
NEI4 $292
line 590
;586:			&& client->ns.is_vip 
;587:			&& ( Distance( ent->s.origin, client->ps.origin ) <= ent->splashRadius) 
;588:			&& client->sess.waiting == qfalse
;589:			)
;590:		{
line 592
;591:			// he hasn't got the breifcase and we're only allowed to exit with it
;592:			if ( ent->ns_flags && client->ps.powerups[PW_BRIEFCASE] <= 0 )
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $294
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $294
line 593
;593:				continue;
ADDRGP4 $286
JUMPV
LABELV $294
line 595
;594:
;595:			if (ent->ns_team == 0)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $296
line 596
;596:				level.done_objectives[TEAM_RED]++;
ADDRLP4 28
ADDRGP4 level+7412+4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $296
line 598
;597:			else
;598:				level.done_objectives[TEAM_BLUE]++;
ADDRLP4 32
ADDRGP4 level+7412+8
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $297
line 600
;599:
;600:			client->sess.waiting = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1828
ADDP4
CNSTI4 1
ASGNI4
line 602
;601:
;602:			G_LogPrintf( "OBJECTIVE: [%i] \"%s\" escaped as VIP\n", 
ADDRGP4 $302
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 606
;603:				client->ps.clientNum, client->pers.netname  );
;604:
;605:			// fire targets, ie. close doors.
;606:			G_UseTargets( ent, &g_entities[ client - level.clients ] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
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
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 607
;607:		} 
LABELV $292
line 608
;608:	} 
LABELV $286
line 577
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $288
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $285
line 610
;609: 
;610:	ent->nextthink = level.time + 100; 
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 611
;611:}
LABELV $284
endproc info_vip_rescue_think 40 12
export SP_vip_rescue
proc SP_vip_rescue 4 12
line 613
;612:
;613:void SP_vip_rescue( gentity_t *self ) {   
line 616
;614:
;615:	// grab 2 variables
;616: 	G_SpawnInt( "radius", "50", &self->splashRadius );
ADDRGP4 $138
ARGP4
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 617
;617:	G_SpawnInt( "team", "0", &self->ns_team );
ADDRGP4 $89
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 618
;618:	G_SpawnInt( "bconly", "0", &self->ns_flags );
ADDRGP4 $305
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 620
;619: 
;620:	if ( g_gametype.integer != GT_LTS )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $306
line 621
;621:		return; 
ADDRGP4 $304
JUMPV
LABELV $306
line 622
;622:	if ( level.vipTime )
ADDRGP4 level+7460
INDIRI4
CNSTI4 0
EQI4 $309
line 623
;623:		return; 
ADDRGP4 $304
JUMPV
LABELV $309
line 625
;624:
;625:	if ( !self->splashRadius ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $312
line 626
;626:		self->splashRadius = 50;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 50
ASGNI4
line 627
;627:		G_Printf("%s at %s with no radius set! Default: 50\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $143
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 628
;628:	}
LABELV $312
line 630
;629:
;630:	G_Printf("spawning vip rescue for team %s\n", TeamName(self->ns_team+1) );
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $314
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 632
;631:
;632:	if ( self->ns_team == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $315
line 633
;633:		level.vip[TEAM_RED] = VIP_ESCAPE;
ADDRGP4 level+7444+4
CNSTI4 1
ASGNI4
line 634
;634:	}
ADDRGP4 $316
JUMPV
LABELV $315
line 635
;635:	else if ( self->ns_team == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $319
line 636
;636:		level.vip[TEAM_BLUE] = VIP_ESCAPE;
ADDRGP4 level+7444+8
CNSTI4 1
ASGNI4
line 637
;637:	}
ADDRGP4 $320
JUMPV
LABELV $319
line 638
;638:	else if ( self->ns_team >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 2
LTI4 $323
line 639
;639:		G_Error("%s: team > 1?", self->classname );
ADDRGP4 $282
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 640
;640:		return;
ADDRGP4 $304
JUMPV
LABELV $323
LABELV $320
LABELV $316
line 647
;641:	}
;642:
;643://	level.num_objectives[TEAM_RED]++;
;644://	level.num_objectives[TEAM_BLUE]++;
;645:
;646:	// set use stats
;647:	self->think = info_vip_rescue_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 info_vip_rescue_think
ASGNP4
line 648
;648:	self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 650
;649:
;650:	self->r.svFlags = SVF_NOCLIENT; 
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 652
;651: 
;652:} 
LABELV $304
endproc SP_vip_rescue 4 12
export in_assault_field
proc in_assault_field 4128 16
line 659
;653:#define MAX_ASSAULT_FIELDS 64
;654:
;655:qboolean finished_assault_fields[TEAM_NUM_TEAMS][MAX_ASSAULT_FIELDS];
;656:int assault_fields[TEAM_NUM_TEAMS]; 
;657:
;658:qboolean in_assault_field( gentity_t *ent, int playerNum )
;659:{
line 665
;660:	int			 e;
;661:	gentity_t	*check; 
;662:	int			entityList[MAX_GENTITIES];
;663:	int			listedEntities; 
;664:
;665:	listedEntities = trap_EntitiesInBox( ent->r.mins, ent->r.maxs, entityList, MAX_GENTITIES );
ADDRLP4 4108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 4108
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4112
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4104
ADDRLP4 4112
INDIRI4
ASGNI4
line 668
;666:
;667:	// see if any solid entities are inside the final position
;668:	for ( e = 0 ; e < listedEntities ; e++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $330
JUMPV
LABELV $327
line 669
;669:		check = &g_entities[ entityList[ e ] ];
ADDRLP4 0
CNSTI4 1108
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 672
;670:
;671:		// only check players
;672:		if ( check->s.eType != ET_PLAYER && !check->physicsObject ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $331
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
NEI4 $331
line 673
;673:			continue;
ADDRGP4 $328
JUMPV
LABELV $331
line 675
;674:		}
;675:		if ( check->s.clientNum != playerNum )
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $333
line 676
;676:			continue;
ADDRGP4 $328
JUMPV
LABELV $333
line 677
;677:		if ( check->client->ps.pm_flags & PMF_FOLLOW )
ADDRLP4 0
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
EQI4 $335
line 678
;678:			continue;
ADDRGP4 $328
JUMPV
LABELV $335
line 681
;679:
;680:		// see if the ent needs to be tested
;681:		if ( check->r.absmin[0] <= ent->r.maxs[0]
ADDRLP4 4124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 4124
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
GTF4 $337
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 4124
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
GTF4 $337
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 4124
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
GTF4 $337
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 4124
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
LTF4 $337
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 4124
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
LTF4 $337
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 4124
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
LTF4 $337
line 686
;682:		&& check->r.absmin[1] <= ent->r.maxs[1]
;683:		&& check->r.absmin[2] <= ent->r.maxs[2]
;684:		&& check->r.absmax[0] >= ent->r.mins[0]
;685:		&& check->r.absmax[1] >= ent->r.mins[1]
;686:		&& check->r.absmax[2] >= ent->r.mins[2] ) {
line 687
;687:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $326
JUMPV
LABELV $337
line 689
;688:		}  
;689:	}
LABELV $328
line 668
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $330
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $327
line 690
;690:	return qfalse;
CNSTI4 0
RETI4
LABELV $326
endproc in_assault_field 4128 16
export assault_field_stop
proc assault_field_stop 36 8
line 694
;691:}
;692:
;693:void assault_field_stop( gentity_t *ent )
;694:{
line 699
;695:	gentity_t *target;
;696:	int i;
;697:
;698:	// restart time.
;699:	if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $340
line 700
;700:		trap_SetConfigstring( CS_ASSAULT_START_TIME+ent->health, "0" ); 
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $340
line 702
;701:
;702:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $345
JUMPV
LABELV $342
line 704
;703:					
;704:		ent->ns_linkedClientsTime[ i ] = 0; 
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 705
;705:		target = &g_entities[i];
ADDRLP4 0
CNSTI4 1108
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 707
;706:
;707:		if (target->client && (target->client->linkedto == ent->health) ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $347
ADDRLP4 8
INDIRP4
CNSTI4 5172
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
NEI4 $347
line 709
;708:						
;709:			if ( !target->client->sess.waiting && target->client->linkedto == ent->health ){
ADDRLP4 12
ADDRLP4 0
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
NEI4 $349
ADDRLP4 12
INDIRP4
CNSTI4 5172
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
NEI4 $349
line 711
;710:				// he was in the field... sorry ass!
;711:				target->client->ps.pm_flags &=~PMF_ASSAULTRANGE;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 712
;712:				target->client->ps.pm_flags &=~PMF_BLOCKED;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 713
;713:				target->client->linkedto = -1; 
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5172
ADDP4
CNSTI4 -1
ASGNI4
line 714
;714:			} // he was a blocker... he blocked it good.
ADDRGP4 $350
JUMPV
LABELV $349
line 715
;715:			else if ( !target->client->sess.waiting && ( target->client->ps.pm_flags & PMF_ASSAULTRANGE || target->client->ps.pm_flags & PMF_ASSAULTRANGE )  ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $351
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $353
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $351
LABELV $353
line 716
;716:				target->client->ps.pm_flags &=~PMF_ASSAULTRANGE;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 717
;717:				target->client->ps.pm_flags &=~PMF_BLOCKED;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 718
;718:			}
LABELV $351
LABELV $350
line 719
;719:		}
LABELV $347
line 721
;720:		
;721:	} // for
LABELV $343
line 702
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $345
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $342
line 729
;722:
;723:	//BLUTENGEL_XXX: debug
;724:#if ASSAULT_FIELD_DEBUG
;725:	PrintMsg(NULL, "An assault field has been stopped %i\n", ent->health );
;726:#endif
;727:	
;728:	// next time send CS update
;729:	ent->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 730
;730:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 731
;731:	trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 732
;732:}
LABELV $339
endproc assault_field_stop 36 8
export assault_field_stopall
proc assault_field_stopall 12 8
line 735
;733:
;734:void assault_field_stopall( void )
;735:{
line 742
;736:	int			i;
;737:	gentity_t	*ent; 
;738: 
;739://	G_Printf("Restarting all assaultfields...\n" );
;740:
;741:
;742:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 743
;743:	for (i=0 ; i<level.num_entities ; i++, ent++) { 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $355
line 744
;744:		if (!Q_stricmp("trigger_assaultfield", ent->classname))
ADDRGP4 $362
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
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
NEI4 $360
line 746
;745:			// this is an assaultfield
;746:			assault_field_stop( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 assault_field_stop
CALLV
pop
LABELV $360
line 747
;747:	} 
LABELV $356
line 743
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1108
ADDP4
ASGNP4
LABELV $358
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $355
line 748
;748:}
LABELV $354
endproc assault_field_stopall 12 8
export assault_link_all
proc assault_link_all 12 8
line 752
;749:
;750:
;751:void assault_link_all( qboolean unlink )
;752:{
line 756
;753:	int			i;
;754:	gentity_t	*ent; 
;755:   
;756:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 757
;757:	for (i=0 ; i<level.num_entities ; i++, ent++) 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $367
JUMPV
LABELV $364
line 758
;758:	{ 
line 759
;759:		if (!Q_stricmp("trigger_assaultfield", ent->classname))
ADDRGP4 $362
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
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
NEI4 $369
line 760
;760:		{	// this is an assaultfield
line 761
;761:			if ( unlink )
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $371
line 762
;762:				trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
ADDRGP4 $372
JUMPV
LABELV $371
line 764
;763:			else
;764:				trap_LinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $372
line 765
;765:		}			
LABELV $369
line 766
;766:	} 
LABELV $365
line 757
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1108
ADDP4
ASGNP4
LABELV $367
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $364
line 767
;767:}
LABELV $363
endproc assault_link_all 12 8
export assault_field_start
proc assault_field_start 4 4
line 772
;768:
;769:void assault_field_think( gentity_t *ent );
;770:
;771:void assault_field_start( gentity_t *ent )
;772:{
line 773
;773:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 776
;774://	G_Printf("Starting Asasault field. %i\n", ent->health );
;775:	// reset all values for this assault field
;776:	for ( i = 0; i < MAX_CLIENTS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $374
line 777
;777:	{
line 778
;778:		ent->ns_linkedClientsTime[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 779
;779:	}
LABELV $375
line 776
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $374
line 780
;780:	ent->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 784
;781:	
;782:
;783:	// just relink into world, and start thinking
;784: 	ent->think = assault_field_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 assault_field_think
ASGNP4
line 785
;785:	ent->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 787
;786:
;787:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 788
;788:}
LABELV $373
endproc assault_field_start 4 4
export assault_field_think
proc assault_field_think 72 16
line 793
;789:
;790:#define ASSAULT_FIELD_DEBUG	0
;791:
;792:void assault_field_think( gentity_t *ent )
;793:{
line 800
;794:	int i;
;795:	int a;
;796:	
;797:
;798://	G_Printf("An assault thinks... %i - ", ent->health );
;799:
;800:	for ( i = 0; i < level.maxclients; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $383
JUMPV
LABELV $380
line 801
;801:	{
line 802
;802:		gclient_t *client = &level.clients[i];
ADDRLP4 8
CNSTI4 7668
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 803
;803:		int clientnum = g_entities[client-level.clients].s.clientNum;
ADDRLP4 12
CNSTI4 1108
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 7668
DIVI4
MULI4
ADDRGP4 g_entities+168
ADDP4
INDIRI4
ASGNI4
line 806
;804:
;805:		// if client does not exist
;806:		if (!client)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $386
line 807
;807:			continue;
ADDRGP4 $381
JUMPV
LABELV $386
line 809
;808:		// if client isn't connected
;809:		if (client->pers.connected != CON_CONNECTED)
ADDRLP4 8
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $388
line 810
;810:			continue;
ADDRGP4 $381
JUMPV
LABELV $388
line 812
;811:		// if the client is not linked to the assaultfield in question
;812:		if ( (client->linkedto != ent->health) && (client->linkedto != -1) )
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 5172
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
EQI4 $390
ADDRLP4 16
INDIRI4
CNSTI4 -1
EQI4 $390
line 813
;813:			continue;
ADDRGP4 $381
JUMPV
LABELV $390
line 815
;814:		// if the client isn't following another one
;815:		if ( client->ps.pm_flags & PMF_FOLLOW )
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $392
line 816
;816:			continue;
ADDRGP4 $381
JUMPV
LABELV $392
line 822
;817:		// if the client is dead
;818:		//if ( g_entities[i].r.contents == CONTENTS_CORPSE )
;819:		//	continue; 
;820:
;821:		// bugfix; this handles a bug if the player was in an assaultfield at the end of a round.
;822:		if ( client->sess.waiting )// || client->ps.stats[STAT_HEALTH] <= 0 )
ADDRLP4 8
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $394
line 823
;823:		{
line 824
;824:			if ( client->ps.pm_flags & PMF_ASSAULTRANGE ) {
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $381
line 825
;825:				client->ps.pm_flags &=~ PMF_ASSAULTRANGE;
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 826
;826:				client->ps.pm_flags &=~ PMF_BLOCKED;
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 827
;827:				client->linkedto = -1;
ADDRLP4 8
INDIRP4
CNSTI4 5172
ADDP4
CNSTI4 -1
ASGNI4
line 829
;828:
;829:				if ( ent->ns_linkedClientsTime[ client->ps.clientNum ] > 0 )
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $398
line 830
;830:				{
line 831
;831:					if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $400
line 832
;832:						trap_SetConfigstring( CS_ASSAULT_START_TIME+ent->health, "0" );
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $400
line 835
;833:					
;834:					// send next configstring attemp
;835:					ent->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 836
;836:				}
LABELV $398
line 838
;837:
;838:				ent->ns_linkedClientsTime[ client->ps.clientNum ] = 0;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 845
;839:
;840:				//BLUTENGEL_XXX: debug
;841:#if ASSAULT_FIELD_DEBUG
;842:				PrintMsg(NULL, "Field %i(team:%s) left by %s (because dead or left range)\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;843:#endif
;844:				// next time send configstring
;845:			} 
line 847
;846:		//	G_Printf("(%i w-cl)");
;847:			continue;
ADDRGP4 $381
JUMPV
LABELV $394
line 849
;848:		}  
;849:		if ( client->ps.eFlags & EF_WEAPONS_LOCKED) 
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $402
line 850
;850:			continue; 
ADDRGP4 $381
JUMPV
LABELV $402
line 852
;851:
;852:		if ( !Is_OnBrushTeam( ent, &g_entities[ client-level.clients] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 7668
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $404
line 855
;853:
;854:			// other player is in this field , so disable all active timers.
;855:			if ( in_assault_field(ent, client->ps.clientNum ) ) { 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 in_assault_field
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $406
line 857
;856:							
;857:				for ( a = 0;  a < level.maxclients; a++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $411
JUMPV
LABELV $408
line 858
;858:					if ( ent->ns_linkedClientsTime[a] <= 0 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
INDIRI4
CNSTI4 0
GTI4 $413
line 859
;859:						continue;
ADDRGP4 $409
JUMPV
LABELV $413
line 861
;860:					//client is not a member of this field
;861:					if ( g_entities[a].client->linkedto != ent->health )
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 5172
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
EQI4 $415
line 862
;862:						continue;
ADDRGP4 $409
JUMPV
LABELV $415
line 865
;863:										
;864:					// it's a tango.
;865:					if ( Is_OnBrushTeam( ent, &g_entities[a] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $418
line 869
;866:						// disable time for the other clients
;867:						gclient_t *cl;
;868:
;869:						ent->ns_linkedClientsTime[ a ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 871
;870:						
;871:						cl = &level.clients[a];
ADDRLP4 32
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 873
;872:  
;873:						if ( ! ( g_entities[a].client->ps.pm_flags & PMF_BLOCKED) && 
ADDRLP4 36
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
CNSTI4 12
ASGNI4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 44
INDIRI4
NEI4 $420
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
ADDRLP4 44
INDIRI4
EQI4 $420
line 874
;874:									 ( g_entities[a].client->ps.pm_flags & PMF_ASSAULTRANGE)) {
line 875
;875:							cl->ps.pm_flags |= PMF_BLOCKED;  
ADDRLP4 48
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 876
;876:							cl->ps.pm_flags &=~PMF_ASSAULTRANGE;
ADDRLP4 52
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 878
;877:						
;878:							if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $424
line 879
;879:								trap_SetConfigstring( CS_ASSAULT_START_TIME + ent->health, "0" );
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $424
line 882
;880:						
;881:							// next time send configstring
;882:							ent->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 888
;883:							
;884:#if ASSAULT_FIELD_DEBUG 
;885:							PrintMsg(NULL, "Field %i(team:%s) entered by %s (otherteam, stopped counting)\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;886:#endif
;887:
;888:						} // if ( ! (...
LABELV $420
line 889
;889:					} // if ( Is_OnBrush...
LABELV $418
line 890
;890:				} // for ( a = 0...
LABELV $409
line 857
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $411
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $408
line 892
;891:
;892:				client->ps.pm_flags |= PMF_ASSAULTRANGE;  
ADDRLP4 28
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 893
;893:			} // if ( in_assault...
ADDRGP4 $381
JUMPV
LABELV $406
line 895
;894:			else
;895:				client->ps.pm_flags &= ~PMF_ASSAULTRANGE;  
ADDRLP4 28
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 897
;896:
;897:			continue;
ADDRGP4 $381
JUMPV
LABELV $404
line 901
;898:		}	
;899:		
;900:		// we should be blocked.see if the blocker left...
;901:		if ( client->ps.pm_flags & PMF_BLOCKED ) { 
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $426
line 903
;902:						
;903:			qboolean someoneinmyfield = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 905
;904: 
;905:			for ( a = 0;  a < level.maxclients ; a++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $428
line 908
;906:				gclient_t *cl;
;907:				
;908:				cl = &level.clients[a];
ADDRLP4 28
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 910
;909:
;910:				if ( !cl )
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $433
line 911
;911:					continue;
ADDRGP4 $429
JUMPV
LABELV $433
line 913
;912:
;913:				if ( cl->pers.connected != CON_CONNECTED)
ADDRLP4 28
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $435
line 914
;914:					continue;
ADDRGP4 $429
JUMPV
LABELV $435
line 915
;915:				if ( g_entities[a].r.contents == CONTENTS_CORPSE )
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+208+252
ADDP4
INDIRI4
CNSTI4 67108864
NEI4 $437
line 916
;916:					continue; 
ADDRGP4 $429
JUMPV
LABELV $437
line 917
;917:				if ( cl->sess.waiting )
ADDRLP4 28
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $441
line 918
;918:					continue; 
ADDRGP4 $429
JUMPV
LABELV $441
line 919
;919:				if ( cl->ps.pm_flags & PMF_FOLLOW )
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $443
line 920
;920:					continue;
ADDRGP4 $429
JUMPV
LABELV $443
line 921
;921:				if ( g_entities[a].health <= 0 )
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $445
line 922
;922:					continue;
ADDRGP4 $429
JUMPV
LABELV $445
line 925
;923:				
;924:				//client is not a member of this field
;925:				if ( g_entities[a].client->linkedto != ent->health )
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 5172
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
EQI4 $448
line 926
;926:					continue;
ADDRGP4 $429
JUMPV
LABELV $448
line 929
;927:
;928:				// skip client if same team, since we're looking for enemys in our field
;929:				if ( client->sess.sessionTeam == cl->sess.sessionTeam )
ADDRLP4 32
CNSTI4 1800
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
NEI4 $451
line 930
;930:					continue; 
ADDRGP4 $429
JUMPV
LABELV $451
line 933
;931: 
;932:				// if there is someone in my field
;933:				if ( in_assault_field(ent, g_entities[a].client->ps.clientNum ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 in_assault_field
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $453
line 935
;934:								
;935:					someoneinmyfield = qtrue; 	// then it sucks nuts, because we still can't capture					
ADDRLP4 24
CNSTI4 1
ASGNI4
line 940
;936:#if ASSAULT_FIELD_DEBUG 
;937:					PrintMsg(NULL, "Field %i(team:%s) somebody in field of %s (otherteam, blocked)\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;938:#endif
;939:
;940:					continue;
LABELV $453
line 942
;941:				}
;942:			} // for ( a = 0...
LABELV $429
line 905
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $431
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $428
line 944
;943:
;944:			if ( someoneinmyfield ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $456
line 945
;945:				continue;
ADDRGP4 $381
JUMPV
LABELV $456
line 947
;946:			}
;947:			else {
line 952
;948:#if ASSAULT_FIELD_DEBUG 
;949:				PrintMsg(NULL, "Field %i(team:%s) field opened for %s (otherteam left, counting)\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;950:#endif
;951:
;952:				client->ps.pm_flags &= ~PMF_BLOCKED;
ADDRLP4 28
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 953
;953:				client->ps.pm_flags |= PMF_ASSAULTRANGE;
ADDRLP4 32
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 954
;954:				continue;
ADDRGP4 $381
JUMPV
LABELV $426
line 960
;955:			}
;956:			
;957:		} // if ( client->ps.pm_flags
;958:
;959:		// first time activated
;960:		if ( ent->ns_linkedClientsTime[ clientnum ] <= 0 && 
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 832
ADDP4
ADDP4
INDIRI4
CNSTI4 0
GTI4 $458
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 1108
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 7668
DIVI4
MULI4
ADDRGP4 g_entities+168
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 in_assault_field
CALLI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $458
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 32
INDIRI4
NEI4 $458
line 962
;961:				 in_assault_field(ent, g_entities[client-level.clients].s.clientNum ) &&
;962:				 !(client->ps.pm_flags & PMF_BLOCKED) ) {
line 964
;963:						
;964:			qboolean failed = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 970
;965:
;966:#if ASSAULT_FIELD_DEBUG 
;967:			PrintMsg(NULL, "Field %i(team:%s) tapped by by %s\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;968:#endif
;969: 				// before letting him in see if that biatch is valid 
;970: 				for ( a = 0;  a < level.maxclients; a++ ) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $464
JUMPV
LABELV $461
line 973
;971:					gclient_t *cl;
;972:					
;973:					cl = &level.clients[a];
ADDRLP4 40
CNSTI4 7668
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 975
;974:
;975:					if ( !cl )
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $466
line 976
;976:						continue;
ADDRGP4 $462
JUMPV
LABELV $466
line 978
;977:
;978:					if ( cl->pers.connected != CON_CONNECTED)
ADDRLP4 40
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $468
line 979
;979:						continue;
ADDRGP4 $462
JUMPV
LABELV $468
line 981
;980:
;981:					if ( cl->sess.waiting )
ADDRLP4 40
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $470
line 982
;982:						continue;
ADDRGP4 $462
JUMPV
LABELV $470
line 984
;983:
;984:					if ( cl->sess.sessionTeam == client->sess.sessionTeam )
ADDRLP4 44
CNSTI4 1800
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
NEI4 $472
line 985
;985:						continue;
ADDRGP4 $462
JUMPV
LABELV $472
line 987
;986:					
;987:					if ( g_entities[a].client->ps.pm_flags & PMF_FOLLOW )
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $474
line 988
;988:						continue;
ADDRGP4 $462
JUMPV
LABELV $474
line 990
;989:
;990:					if ( g_entities[a].health <= 0 )
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $477
line 991
;991:						continue;
ADDRGP4 $462
JUMPV
LABELV $477
line 994
;992:					
;993:					//client is not a member of this field
;994:					if ( g_entities[a].client->linkedto != ent->health )
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 5172
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
EQI4 $480
line 995
;995:						continue;
ADDRGP4 $462
JUMPV
LABELV $480
line 998
;996:
;997:					//client is not a member of this field  
;998:					if ( !Is_OnBrushTeam( ent, &g_entities[a] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $483
line 1001
;999:									
;1000:						// disable time for the other clients 
;1001:						if ( in_assault_field(ent, a ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 in_assault_field
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $485
line 1002
;1002:							client->ps.pm_flags &= ~PMF_ASSAULTRANGE;
ADDRLP4 56
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 1003
;1003:							client->ps.pm_flags |= PMF_BLOCKED;
ADDRLP4 60
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1004
;1004:							failed = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 1005
;1005:							continue; // break
LABELV $485
line 1008
;1006:						}
;1007:
;1008:					}			
LABELV $483
line 1009
;1009:				} // for ( a = 0...
LABELV $462
line 970
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $464
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $461
line 1011
;1010:
;1011:			if ( failed )
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $487
line 1012
;1012:				continue;
ADDRGP4 $381
JUMPV
LABELV $487
line 1014
;1013:
;1014:			if ( !failed ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $489
line 1016
;1015:				// set assault flag for client hud
;1016:				client->ps.pm_flags |= PMF_ASSAULTRANGE;  
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 1017
;1017:				client->linkedto = ent->health;
ADDRLP4 8
INDIRP4
CNSTI4 5172
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1018
;1018:				ent->ns_linkedClientsTime[ clientnum ] = level.time + ent->wait * ONE_SECOND;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 832
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 44
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1019
;1019:			}
LABELV $489
line 1020
;1020:		} // if ( ent->ns_linkedClients...
LABELV $458
line 1021
;1021:		if ( !(client->ps.pm_flags & PMF_ASSAULTRANGE) )
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
NEI4 $492
line 1022
;1022:			continue;
ADDRGP4 $381
JUMPV
LABELV $492
line 1024
;1023:
;1024:		if ( client->ps.pm_flags & PMF_BLOCKED )
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $494
line 1025
;1025:			continue;
ADDRGP4 $381
JUMPV
LABELV $494
line 1027
;1026:
;1027:		if ( client->linkedto != ent->health )
ADDRLP4 8
INDIRP4
CNSTI4 5172
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
EQI4 $496
line 1028
;1028:			continue;
ADDRGP4 $381
JUMPV
LABELV $496
line 1031
;1029:
;1030:		// if player died and had assaultrange setted:
;1031:		if ( client->ps.stats[STAT_HEALTH] <= 0 || 
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $501
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 7668
DIVI4
MULI4
ADDRGP4 g_entities+168
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 in_assault_field
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $498
LABELV $501
line 1032
;1032:				 !in_assault_field(ent, g_entities[client-level.clients].s.clientNum )  ) {
line 1035
;1033:						
;1034:			// reset time and disable client 
;1035:			if ( client->ps.pm_flags & PMF_ASSAULTRANGE ) {
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $381
line 1036
;1036:				client->ps.pm_flags &=~ PMF_ASSAULTRANGE;
ADDRLP4 44
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 1037
;1037:				client->linkedto = -1;
ADDRLP4 8
INDIRP4
CNSTI4 5172
ADDP4
CNSTI4 -1
ASGNI4
line 1038
;1038:				ent->ns_linkedClientsTime[ client->ps.clientNum ] = 0;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1039
;1039:				if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $504
line 1040
;1040:					trap_SetConfigstring( CS_ASSAULT_START_TIME+ent->health, "0" );
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $504
line 1042
;1041:				// next time send configstring
;1042:				ent->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 1043
;1043:			}
line 1044
;1044:			continue;
ADDRGP4 $381
JUMPV
LABELV $498
line 1048
;1045:		} 
;1046:
;1047:		// another one was also waiting in the field. active HIS time
;1048:		if ( ent->fly_sound_debounce_time )
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 0
EQI4 $506
line 1049
;1049:		{
line 1050
;1050:			if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $508
line 1051
;1051:				trap_SetConfigstring( CS_ASSAULT_START_TIME + ent->health , va("%i",ent->ns_linkedClientsTime[ client->ps.clientNum ]) );
ADDRGP4 $210
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $508
line 1052
;1052:			ent->fly_sound_debounce_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 1053
;1053:		}
LABELV $506
line 1055
;1054:		// broke all limits
;1055:		if ( level.time > ent->ns_linkedClientsTime[ clientnum ] )
ADDRGP4 level+32
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
INDIRI4
LEI4 $510
line 1056
;1056:		{
line 1057
;1057:			trap_SendServerCommand( -1, va("cp \"The %s captured Field %i\n\"", TeamName(g_entities[clientnum].client->sess.sessionTeam), ent->health+1 ));
CNSTI4 1108
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $513
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1060
;1058:
;1059:
;1060:			if ( ent->count == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
NEI4 $515
line 1061
;1061:			{
line 1063
;1062:				int a;
;1063:				int tapped = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 1065
;1064:
;1065:				finished_assault_fields[client->sess.sessionTeam][ent->health] = qtrue;				
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 finished_assault_fields
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 1068
;1066:
;1067:				// check if all fields have been tapped
;1068:				for ( a = 0; a < level.fields[ client->sess.sessionTeam ]; a++ )
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRGP4 $520
JUMPV
LABELV $517
line 1069
;1069:				{
line 1070
;1070:					if (finished_assault_fields[client->sess.sessionTeam][a] )
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 finished_assault_fields
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $522
line 1071
;1071:						tapped++;
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $522
line 1072
;1072:				}
LABELV $518
line 1068
ADDRLP4 52
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $520
ADDRLP4 52
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7468
ADDP4
INDIRI4
LTI4 $517
line 1074
;1073:				
;1074:				if ( tapped == level.fields[ client->sess.sessionTeam ] )
ADDRLP4 56
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7468
ADDP4
INDIRI4
NEI4 $516
line 1075
;1075:				{
line 1076
;1076:					for ( a = 0; a < level.fields [ client->sess.sessionTeam ]; a++ )
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRGP4 $530
JUMPV
LABELV $527
line 1077
;1077:					{
line 1079
;1078:						// set state of the field to untapped
;1079:						finished_assault_fields[ client->sess.sessionTeam ][ ent->health ] = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 finished_assault_fields
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1080
;1080:					}
LABELV $528
line 1076
ADDRLP4 52
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $530
ADDRLP4 52
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7468
ADDP4
INDIRI4
LTI4 $527
line 1082
;1081:			 	//	G_Printf("Team-Fields %i(team:%s) all finished by %s\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;1082:					G_UseTargets (ent, &g_entities[ client - level.clients ] );			
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 7668
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1083
;1083:				}
line 1085
;1084:				else
;1085:				{
line 1087
;1086:				//	G_Printf("Team-Fields %i(team:%s) tapped by %s\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;1087:				}
line 1088
;1088:			}
ADDRGP4 $516
JUMPV
LABELV $515
line 1090
;1089:			else
;1090:			{
line 1093
;1091:			//	G_Printf("Field %i(team:%s) captured by %s\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;1092:				// mark one objective as done
;1093:				if ( ent->bot_chattime )
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
CNSTI4 0
EQI4 $532
line 1094
;1094:					level.done_objectives [ client->sess.sessionTeam ]++;
ADDRLP4 52
ADDRLP4 8
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7412
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
LABELV $532
line 1095
;1095:			 	G_UseTargets (ent, &g_entities[ client - level.clients ] );			
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1108
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 7668
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1096
;1096:			}
LABELV $516
line 1099
;1097:
;1098:			// disable timer
;1099:			if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $535
line 1100
;1100:				trap_SetConfigstring( CS_ASSAULT_START_TIME + ent->health, "taken" ); // means taken
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $537
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $535
line 1103
;1101:
;1102:			// taken one assault field
;1103:			if ( level.clients[i].ns.rewards & REWARD_3ASSAULT_TAKEN ) // 3 taken?
CNSTI4 7668
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 3324
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $538
line 1104
;1104:				client->ns.rewards |= REWARD_4ASSAULT_TAKEN; // add 4 taken
ADDRLP4 52
ADDRLP4 8
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
ADDRGP4 $539
JUMPV
LABELV $538
line 1105
;1105:			else if ( level.clients[i].ns.rewards & REWARD_2ASSAULT_TAKEN ) // 2 taken?
CNSTI4 7668
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 3324
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $540
line 1106
;1106:				client->ns.rewards |= REWARD_3ASSAULT_TAKEN;	// add 3 taken
ADDRLP4 56
ADDRLP4 8
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
LABELV $540
LABELV $539
line 1107
;1107:			if ( level.clients[i].ns.rewards & REWARD_ASSAULT_TAKEN )
CNSTI4 7668
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 3324
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $542
line 1108
;1108:				client->ns.rewards |= REWARD_2ASSAULT_TAKEN; // add 2 taken  
ADDRLP4 60
ADDRLP4 8
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
ADDRGP4 $543
JUMPV
LABELV $542
line 1110
;1109: 			else
;1110:				client->ns.rewards |= REWARD_ASSAULT_TAKEN;  // taken
ADDRLP4 64
ADDRLP4 8
INDIRP4
CNSTI4 3324
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $543
line 1112
;1111:			
;1112:			G_LogPrintf( "OBJECTIVE: [%i] \"%s\" captured assault field %i\n",
ADDRGP4 $544
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1115
;1113:				client->ps.clientNum, client->pers.netname , ent->health+1 );
;1114:
;1115:			assault_field_stop( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 assault_field_stop
CALLV
pop
line 1117
;1116:
;1117:			return;
ADDRGP4 $379
JUMPV
LABELV $510
line 1119
;1118:		}
;1119:	} 
LABELV $381
line 800
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $383
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $380
line 1121
;1120:
;1121:	ent->think = assault_field_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 assault_field_think
ASGNP4
line 1122
;1122:	ent->nextthink = level.time + 500; 
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1123
;1123:} 
LABELV $379
endproc assault_field_think 72 16
export num_assaultfields_for_team
proc num_assaultfields_for_team 16 8
line 1127
;1124: 
;1125:
;1126:int num_assaultfields_for_team( int team )
;1127:{
line 1130
;1128:	int			i;
;1129:	gentity_t	*ent;
;1130:	int			num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1132
;1131: 
;1132:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1133
;1133:	for (i=0 ; i<level.num_entities ; i++, ent++) { 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $550
JUMPV
LABELV $547
line 1135
;1134:
;1135:		if (!Q_stricmp("trigger_assaultfield", ent->classname))
ADDRGP4 $362
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
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
NEI4 $548
line 1136
;1136:		{
line 1137
;1137:			if (ent->ns_team == BRUSH_TEAM_RED && team == TEAM_RED)
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $554
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $554
line 1138
;1138:				num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $553
JUMPV
LABELV $554
line 1139
;1139:			else if (ent->ns_team == BRUSH_TEAM_BLUE && team == TEAM_BLUE)
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $553
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $553
line 1140
;1140:				num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1141
;1141:		}
line 1143
;1142:		else
;1143:			continue;
LABELV $553
line 1144
;1144:	}
LABELV $548
line 1133
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1108
ADDP4
ASGNP4
LABELV $550
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $547
line 1145
;1145:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $546
endproc num_assaultfields_for_team 16 8
export SP_assault_field
proc SP_assault_field 24 12
line 1148
;1146:}
;1147:void SP_assault_field( gentity_t *self ) 
;1148:{   
line 1149
;1149:	int all = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1152
;1150: 	char	*s;
;1151:	int	addmission;
;1152:	int	optional = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1155
;1153:
;1154: 	// grab variables
;1155:	G_SpawnInt( "all", "0", &all);
ADDRGP4 $559
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1156
;1156:	G_SpawnInt( "radius", "15", &self->splashRadius );
ADDRGP4 $138
ARGP4
ADDRGP4 $560
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1157
;1157:	G_SpawnString( "fieldname", "unknown", &s  );
ADDRGP4 $561
ARGP4
ADDRGP4 $562
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1158
;1158: 	G_SpawnFloat( "time", "10", &self->wait );
ADDRGP4 $176
ARGP4
ADDRGP4 $563
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1159
;1159:	G_SpawnInt( "team", "0", &self->ns_team );
ADDRGP4 $89
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1160
;1160:  	G_SpawnInt( "optional", "0", &optional);
ADDRGP4 $91
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1161
;1161:	G_SpawnInt( "addmission", "1", &addmission);
ADDRGP4 $180
ARGP4
ADDRGP4 $179
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1163
;1162:
;1163:	if ( g_gametype.integer != GT_LTS )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $564
line 1164
;1164:		return;
ADDRGP4 $558
JUMPV
LABELV $564
line 1168
;1165:
;1166://	G_Printf("spawning assault field for team %s\n", TeamName(self->ns_team) );
;1167:
;1168:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 1170
;1169: 
;1170: 	if ( all )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $567
line 1171
;1171:		self->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $568
JUMPV
LABELV $567
line 1172
;1172:	else if ( optional == 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $569
line 1173
;1173:	{
line 1174
;1174:		self->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 1177
;1175:
;1176:		// setup an objective
;1177:		if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $571
line 1178
;1178:			level.num_objectives[TEAM_RED]++;
ADDRLP4 16
ADDRGP4 level+7396+4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $572
JUMPV
LABELV $571
line 1179
;1179:		else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $575
line 1180
;1180:			level.num_objectives[TEAM_BLUE]++;
ADDRLP4 20
ADDRGP4 level+7396+8
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $575
LABELV $572
line 1181
;1181:	}
LABELV $569
LABELV $568
line 1183
;1182:
;1183:	self->bot_chattime = addmission;
ADDRFP4 0
INDIRP4
CNSTI4 1088
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1184
;1184:	self->ns_brushname = s ;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 1187
;1185: 
;1186:	// num field
;1187:	if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $579
line 1188
;1188:		self->health = level.fields[TEAM_RED];
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 level+7468+4
INDIRI4
ASGNI4
ADDRGP4 $580
JUMPV
LABELV $579
line 1189
;1189:	else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $583
line 1190
;1190:		self->health = level.fields[TEAM_BLUE];
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 level+7468+8
INDIRI4
ASGNI4
LABELV $583
LABELV $580
line 1192
;1191:
;1192:	if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $587
line 1193
;1193:	{
line 1194
;1194:		level.fields[TEAM_RED]++; 
ADDRLP4 16
ADDRGP4 level+7468+4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1195
;1195:	}
ADDRGP4 $588
JUMPV
LABELV $587
line 1196
;1196:	else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $591
line 1197
;1197:		level.fields[TEAM_BLUE]++;
ADDRLP4 16
ADDRGP4 level+7468+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $592
JUMPV
LABELV $591
line 1199
;1198:	else
;1199:		G_Error("Wrong Team for %s\n", self->classname );
ADDRGP4 $595
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $592
LABELV $588
line 1201
;1200:
;1201:	if ( level.fields[TEAM_RED] >= MAX_ASSAULT_FIELDS || level.fields[TEAM_BLUE] >= MAX_ASSAULT_FIELDS )
ADDRLP4 20
CNSTI4 64
ASGNI4
ADDRGP4 level+7468+4
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $602
ADDRGP4 level+7468+8
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $596
LABELV $602
line 1202
;1202:		G_Error("Reached Max_Fields.\n");
ADDRGP4 $603
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $596
line 1204
;1203:
;1204:	for ( all = 0;  all < MAX_CLIENTS; all++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $604
line 1205
;1205:	{
line 1206
;1206:		self->ns_linkedClientsTime[all] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1207
;1207:	}
LABELV $605
line 1204
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $604
line 1209
;1208:	// send configstring next time
;1209:	self->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 1210
;1210: 	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1211
;1211:} 
LABELV $558
endproc SP_assault_field 24 12
export NS_SpawnFlare
proc NS_SpawnFlare 0 12
line 1219
;1212:
;1213: /*
;1214:=================
;1215:SpawnFlare
;1216:
;1217:=================
;1218:*/
;1219:void NS_SpawnFlare ( gentity_t *self ) { 
line 1221
;1220:	// grab variables
;1221:	G_SpawnInt( "size", "15", &self->s.frame );
ADDRGP4 $609
ARGP4
ADDRGP4 $560
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1223
;1222:
;1223:	G_SpawnInt( "r", "100", &self->s.generic1 );		// red
ADDRGP4 $610
ARGP4
ADDRGP4 $611
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1224
;1224:	G_SpawnInt( "g", "100", &self->s.otherEntityNum );	// green
ADDRGP4 $612
ARGP4
ADDRGP4 $611
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1225
;1225:	G_SpawnInt( "b", "100", &self->s.otherEntityNum2 ); // blue
ADDRGP4 $613
ARGP4
ADDRGP4 $611
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1227
;1226:
;1227:	G_SpawnInt( "corona", "0", &self->s.eventParm ); // blue
ADDRGP4 $614
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1231
;1228:
;1229://	G_Printf("spawning flare\n" );
;1230: 
;1231:	self->s.eType = ET_FLARE; 
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 1232
;1232:  	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1234
;1233:
;1234:}
LABELV $608
endproc NS_SpawnFlare 0 12
export doorlock_die
proc doorlock_die 4 8
line 1237
;1235:  
;1236:
;1237:void doorlock_die ( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 1240
;1238:	gentity_t *target;
;1239:
;1240:	target = self->target_ent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
ASGNP4
line 1242
;1241:
;1242:	if (!target)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $616
line 1243
;1243:		return;
ADDRGP4 $615
JUMPV
LABELV $616
line 1246
;1244: 
;1245:	// door is unlocked now.
;1246:	target->pain_debounce_time = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 0
ASGNI4
line 1248
;1247:
;1248:	PrintMsg( attacker, "This door has been " S_COLOR_GREEN "opened" S_COLOR_WHITE ".\n");
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $618
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1250
;1249:
;1250:	G_TempEntity( self->s.pos.trBase , EV_BREAKLOCK );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 108
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 1252
;1251:	
;1252:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1253
;1253:}
LABELV $615
endproc doorlock_die 4 8
export doorlock_use
proc doorlock_use 12 8
line 1255
;1254:void doorlock_use  (gentity_t *self, gentity_t *other, trace_t *trace ) 
;1255:{
line 1259
;1256:	gentity_t *target;
;1257:
;1258:	
;1259:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $620
line 1260
;1260:		return;
ADDRGP4 $619
JUMPV
LABELV $620
line 1262
;1261:
;1262:	if ( !(other->client->buttons & BUTTON_USE) )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $622
line 1263
;1263:		return;
ADDRGP4 $619
JUMPV
LABELV $622
line 1265
;1264: 
;1265:	target = self->target_ent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
ASGNP4
line 1267
;1266:
;1267:	if (!target)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $624
line 1268
;1268:		return;
ADDRGP4 $619
JUMPV
LABELV $624
line 1270
;1269: 
;1270:	if ( other->client->sess.sessionTeam == TEAM_RED && self->ns_team == 1 )
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $626
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $626
line 1271
;1271:	{
line 1272
;1272:		PrintMsg( other, "This door has been " S_COLOR_GREEN "opened" S_COLOR_WHITE ".\n");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $618
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1275
;1273:
;1274: 		// door is unlocked now.
;1275:		target->pain_debounce_time = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 0
ASGNI4
line 1276
;1276:	}
ADDRGP4 $627
JUMPV
LABELV $626
line 1277
;1277:	else if ( other->client->sess.sessionTeam == TEAM_BLUE && self->ns_team == 2 )
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $619
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $619
line 1278
;1278:	{
line 1279
;1279:		PrintMsg( other, "This door has been " S_COLOR_GREEN "opened" S_COLOR_WHITE ".\n");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $618
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1282
;1280:
;1281:		// door is unlocked now.
;1282:		target->pain_debounce_time = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 0
ASGNI4
line 1283
;1283:	}
line 1285
;1284:	else
;1285:		return;
LABELV $629
LABELV $627
line 1286
;1286:}
LABELV $619
endproc doorlock_use 12 8
export Touch_LockTrigger
proc Touch_LockTrigger 12 16
line 1299
;1287:
;1288:/*
;1289:======================
;1290:SpawnLockTrigger
;1291: 
;1292:======================
;1293:*/
;1294:/*
;1295:================
;1296:Touch_DoorTrigger
;1297:================
;1298:*/ 
;1299:void Touch_LockTrigger( gentity_t *ent, gentity_t *other, trace_t *trace ) { 	
line 1300
;1300:	if ( other->client->buttons & BUTTON_USE && !(other->client->oldbuttons & BUTTON_USE) )
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1848
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $631
ADDRLP4 0
INDIRP4
CNSTI4 1852
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 8
INDIRI4
NEI4 $631
line 1301
;1301:	{
line 1302
;1302:		NS_PlayerAnimation( other, TORSO_OPEN_DOOR, 750, qfalse );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
CNSTI4 750
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 NS_PlayerAnimation
CALLV
pop
line 1303
;1303:	} 
LABELV $631
line 1304
;1304:	doorlock_use( ent->parent , other, trace );
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 doorlock_use
CALLV
pop
line 1306
;1305://	ent->parent->touch(ent,other,trace);
;1306:}
LABELV $630
endproc Touch_LockTrigger 12 16
export SpawnLockTrigger
proc SpawnLockTrigger 56 4
line 1309
;1307:void Think_SpawnNewDoorTrigger ( gentity_t *ent );
;1308:
;1309:void SpawnLockTrigger( gentity_t *ent ) {
line 1315
;1310:	gentity_t		*other;
;1311:	vec3_t		mins, maxs;
;1312:	int			i, best;
;1313: 
;1314:	// set all of the slaves as shootable 
;1315: 	ent->target_ent = G_PickTarget( ent->target );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 668
ADDP4
ADDRLP4 40
INDIRP4
ASGNP4
line 1317
;1316:
;1317:	if ( ent->target_ent )
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $634
line 1318
;1318:	{
line 1319
;1319:		ent->target_ent->pain_debounce_time = qtrue; // this door is locked
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 1
ASGNI4
line 1320
;1320:		Think_SpawnNewDoorTrigger	( ent->target_ent );
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
ARGP4
ADDRGP4 Think_SpawnNewDoorTrigger
CALLV
pop
line 1321
;1321:	} 
LABELV $634
line 1324
;1322:
;1323:	// find the bounds of everything on the team
;1324:	VectorCopy (ent->r.absmin, mins);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 1325
;1325:	VectorCopy (ent->r.absmax, maxs);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 1328
;1326: 
;1327:	// find the thinnest axis, which will be the one we expand
;1328:	best = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1329
;1329:	for ( i = 1 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $636
line 1330
;1330:		if ( maxs[i] - mins[i] < maxs[best] - mins[best] ) {
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 48
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ASGNI4
ADDRLP4 52
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 52
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 52
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
GEF4 $640
line 1331
;1331:			best = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1332
;1332:		}
LABELV $640
line 1333
;1333:	}
LABELV $637
line 1329
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $636
line 1334
;1334:	maxs[best] += 20;
ADDRLP4 44
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 1335
;1335:	mins[best] -= 20;
ADDRLP4 48
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1338
;1336:
;1337:	// create a trigger with this size
;1338:	other = G_Spawn ();
ADDRLP4 52
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 52
INDIRP4
ASGNP4
line 1339
;1339:	VectorCopy (mins, other->r.mins);
ADDRLP4 32
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1340
;1340:	VectorCopy (maxs, other->r.maxs);
ADDRLP4 32
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 1341
;1341:	other->parent = ent;
ADDRLP4 32
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1342
;1342:	other->classname = "lock_trigger";
ADDRLP4 32
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $642
ASGNP4
line 1343
;1343:	other->r.contents = CONTENTS_TRIGGER;
ADDRLP4 32
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 1344
;1344:	other->touch = Touch_LockTrigger; 
ADDRLP4 32
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_LockTrigger
ASGNP4
line 1346
;1345:	// remember the thinnest axis
;1346:	other->count = best;
ADDRLP4 32
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1347
;1347:	trap_LinkEntity (other);
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1349
;1348: 
;1349:}
LABELV $633
endproc SpawnLockTrigger 56 4
export doorlock_damage
proc doorlock_damage 36 4
line 1352
;1350:// returns true if the entity can be damaged 
;1351:qboolean doorlock_damage( gentity_t *ent , int attackerweapon) 
;1352:{
line 1353
;1353:	int locktype = ent->ns_flags;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
line 1355
;1354:
;1355:	if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $644
line 1356
;1356:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $643
JUMPV
LABELV $644
line 1358
;1357:
;1358:	if ( BG_IsGrenade( attackerweapon ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $646
line 1359
;1359:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $643
JUMPV
LABELV $646
line 1361
;1360:
;1361:	if ( locktype == 3 && !BG_IsShotgun( attackerweapon) )
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $648
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_IsShotgun
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $648
line 1362
;1362:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $643
JUMPV
LABELV $648
line 1363
;1363:	else if ( locktype == 2 && !BG_IsRifle( attackerweapon ) && !BG_IsShotgun( attackerweapon ) )
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $650
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $650
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_IsShotgun
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $650
line 1364
;1364:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $643
JUMPV
LABELV $650
line 1365
;1365:	else if ( locktype == 1 && !BG_IsSMG( attackerweapon ) && !BG_IsRifle( attackerweapon ) && !BG_IsShotgun( attackerweapon ) )
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $652
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_IsSMG
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $652
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $652
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_IsShotgun
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $652
line 1366
;1366:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $643
JUMPV
LABELV $652
line 1367
;1367:	else if ( BG_IsMelee( attackerweapon ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $654
line 1368
;1368:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $643
JUMPV
LABELV $654
line 1370
;1369:
;1370:	return qtrue;
CNSTI4 1
RETI4
LABELV $643
endproc doorlock_damage 36 4
export SP_doorlock_spawn
proc SP_doorlock_spawn 60 12
line 1374
;1371:}
;1372:
;1373:void SP_doorlock_spawn ( gentity_t *ent ) 
;1374:{ 
line 1379
;1375:	char *test;
;1376:	int  locktype;
;1377:	float	mYaw,mPitch,mRoll;
;1378:
;1379:	G_SpawnInt( "team", "0", &ent->ns_team ); // 0 = noteam | 1=open for seals | 2=open for tangos
ADDRGP4 $89
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1380
;1380:	G_SpawnString( "target", "none", &test );
ADDRGP4 $657
ARGP4
ADDRGP4 $658
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1381
;1381:	G_SpawnInt( "locktype", "0", &locktype ); // 0 light 1 medium 2 heavy 3 shotgun only
ADDRGP4 $659
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1383
;1382:
;1383:	G_SpawnFloat( "yaw", "0", &mYaw );
ADDRGP4 $660
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1384
;1384:	G_SpawnFloat( "pitch", "0", &mPitch );
ADDRGP4 $661
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1385
;1385:	G_SpawnFloat( "roll", "0", &mRoll );
ADDRGP4 $662
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1388
;1386:	
;1387:
;1388:	if ( locktype == 3 )
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $663
line 1389
;1389: 		ent->s.modelindex = G_ModelIndex( "models/misc/locks/shotgun.md3" );
ADDRGP4 $665
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $664
JUMPV
LABELV $663
line 1390
;1390:	else if ( locktype == 2 )
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $666
line 1391
;1391: 		ent->s.modelindex = G_ModelIndex( "models/misc/locks/heavy.md3" );
ADDRGP4 $668
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $667
JUMPV
LABELV $666
line 1392
;1392:	else if ( locktype == 1 )
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $669
line 1393
;1393: 		ent->s.modelindex = G_ModelIndex( "models/misc/locks/medium.md3" );
ADDRGP4 $671
ARGP4
ADDRLP4 28
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $670
JUMPV
LABELV $669
line 1395
;1394:	else
;1395:		ent->s.modelindex = G_ModelIndex( "models/misc/locks/light.md3" );
ADDRGP4 $672
ARGP4
ADDRLP4 32
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
LABELV $670
LABELV $667
LABELV $664
line 1397
;1396:
;1397: 	ent->s.eType = ET_GENERAL; 
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1399
;1398:
;1399:	VectorClear ( ent->s.pos.trDelta );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 1401
;1400:	 
;1401:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1402
;1402:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1404
;1403:
;1404:	VectorSet( ent->s.angles , mPitch, mYaw, mRoll );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1406
;1405:
;1406:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1408
;1407: 
;1408:	ent->die = doorlock_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 doorlock_die
ASGNP4
line 1409
;1409:	ent->touch = doorlock_use; 
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 doorlock_use
ASGNP4
line 1411
;1410:	
;1411:	ent->health = 50;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 50
ASGNI4
line 1413
;1412:	//c4->ns_team = ent->client->sess.sessionTeam; 
;1413:	ent->s.number = ent - g_entities;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1108
DIVI4
ASGNI4
line 1415
;1414:
;1415: 	VectorSet (ent->r.mins, -2, -1, -2);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3221225472
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3212836864
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3221225472
ASGNF4
line 1416
;1416:	VectorSet (ent->r.maxs, 2, 1, 2);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1073741824
ASGNF4
line 1417
;1417:	ent->r.contents = MASK_SHOT;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 100663297
ASGNI4
line 1419
;1418:	    
;1419:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1420
;1420: 	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1421
;1421:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1422
;1422:	ent->ns_flags = locktype;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1424
;1423: 
;1424: 	ent->physicsObject = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 1426
;1425: 
;1426:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1428
;1427:
;1428:	ent->think = SpawnLockTrigger;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 SpawnLockTrigger
ASGNP4
line 1429
;1429:	ent->nextthink = level.time + 2000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1431
;1430:	  
;1431:}
LABELV $656
endproc SP_doorlock_spawn 60 12
export TestActor
proc TestActor 8 4
line 1519
;1432:#if 0
;1433:void G_ActorIdle( gentity_t *ent )
;1434:{
;1435:	if ( ent-> actorState != ACTOR_IDLE )
;1436:		G_Error("Actor: In idle without permission\n");
;1437:	
;1438:}
;1439:void G_ActorChase( gentity_t *ent )
;1440:{
;1441:	gentity_t *other;
;1442:	vec3_t ownerPos;
;1443:	float distance;
;1444:	vec3_t	origin;
;1445:	vec3_t	movedir;
;1446:	vec3_t	neworigin;
;1447:	float	speed = ent->speed;
;1448:
;1449:	if ( ent-> actorState != ACTOR_CHASE )
;1450:		G_Error("Actor: In chase without permission\n");
;1451:
;1452:	if ( !ent->parent )
;1453:		G_Error("Actor: In chase without parent\n");
;1454:
;1455:	VectorCopy( ent->s.origin , origin );
;1456:
;1457:	other = ent->parent;
;1458:
;1459:	if ( other->r.svFlags & SVF_USE_CURRENT_ORIGIN )
;1460:		VectorCopy( other->r.currentOrigin, ownerPos );
;1461:	else if ( !other->client )
;1462:		VectorCopy( other->s.origin , ownerPos );
;1463:	else if ( other->client )
;1464:		VectorCopy( other->client->ps.origin , ownerPos );
;1465:
;1466:	distance = Distance( ownerPos, origin );
;1467:
;1468:	VectorSubtract( origin,ownerPos,  movedir );
;1469:	
;1470:	VectorMA( origin , speed, movedir, neworigin );
;1471:
;1472:#if 1
;1473:	{
;1474:		gentity_t *temp;
;1475:
;1476:		temp = G_TempEntity( origin, EV_DEBUG_LINE );
;1477:
;1478:		VectorCopy( origin, temp->s.pos.trBase );
;1479:		VectorCopy( neworigin, temp->s.origin2 );
;1480:	}
;1481:#endif
;1482:	G_Printf("Actor Chase s:%i d:%2f\n", speed, distance );
;1483:	VectorCopy( neworigin, ent->s.origin );
;1484:}
;1485:
;1486:void G_RunActor( gentity_t *ent )
;1487:{
;1488:	// actor main thinking function
;1489:	if ( ent-> actorState >= MAX_ACTOR_STATES )
;1490:		G_Error("Actor: Illegal State\n");
;1491:	
;1492:	// ACTOR_IDLE - actor idles
;1493:	// ACTOR_CHASE - chases entity
;1494:	// ACTOR_OUTOFSIGHT - lost entity out of sight
;1495:	// ACTOR_PANIC - actor panics, runs around weierd or just stands still or ducks
;1496:	// ACTOR_DEAD - actor is dead
;1497:	G_Printf("Actor o:%s s:%i\n", vtos ( ent->s.origin ), ent-> actorState );
;1498:	
;1499:	switch ( ent-> actorState )
;1500:	{ 
;1501:		case ACTOR_IDLE:
;1502:			G_ActorIdle( ent );
;1503:			break;
;1504:		case ACTOR_CHASE:
;1505:			G_ActorChase( ent );
;1506:			break;
;1507:		case ACTOR_OUTOFSIGHT:
;1508:			break;
;1509:		case ACTOR_PANIC:
;1510:			break;
;1511:		case ACTOR_DEAD:
;1512:			break;
;1513:		default:
;1514:			break;
;1515:	} 
;1516:}
;1517:#endif
;1518:void TestActor ( vec3_t origin , int clientNum ) 
;1519:{ 
line 1522
;1520:  	gentity_t *ent;
;1521:
;1522:	ent = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1533
;1523:
;1524:// 	ent->s.eType = ET_ACTOR;
;1525:
;1526://G_SetOrigin( ent, origin );
;1527:	   /*
;1528: 	VectorSet (ent->r.mins, -6, -6, -6);
;1529:	VectorSet (ent->r.maxs, 6, 6, 6);
;1530:	ent->r.contents = MASK_SHOT;
;1531:	*/
;1532:
;1533:	VectorCopy(  origin , ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1536
;1534:	    
;1535:	//ent->takedamage = qtrue;
;1536: 	ent->s.pos.trType = TR_INTERPOLATE;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 1537
;1537:	ent->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1540
;1538:
;1539: 
;1540:	ent->speed = 50;
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1112014848
ASGNF4
line 1545
;1541://	ent->actorState = ACTOR_CHASE;
;1542:
;1543:	
;1544:
;1545:	ent->parent = &g_entities[clientNum];
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
CNSTI4 1108
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1549
;1546:
;1547: 	//ent->physicsObject = qtrue;
;1548: 
;1549:	trap_LinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1551
;1550:	
;1551:}
LABELV $675
endproc TestActor 8 4
export target_Particle_think
proc target_Particle_think 8 0
line 1580
;1552:
;1553:
;1554:
;1555://==========================================================
;1556:
;1557:#define PARTFLAGS_DIRT			1
;1558:#define	PARTFLAGS_GLASS			2
;1559:#define PARTFLAGS_SAND			4
;1560:#define PARTFLAGS_SPARKS		8
;1561:#define PARTFLAGS_METALSPARKS	16
;1562:#define PARTFLAGS_SMOKE			32 
;1563:#define PARTFLAGS_STARTOFF		64
;1564:
;1565:/*QUAKED target_particle (1 0 0) (-8 -8 -8) (8 8 8) DIRT GLASS SAND SPARKS METALSPARKS SMOKE STARTOFF
;1566:"random"		randomizes amount of particles it spawns (full numbers).
;1567:"randomdir"		randomizes velocity of each particle ( x/y NOT Z(up) ) (full numbers).
;1568:"velocity"		velocity (full numbers).
;1569:"particles"		amount of particles randomized by 'random' key (full numbers).
;1570:"size"			size modifier (only for smoke) (full numbers).
;1571:"dlight"		add a dynamic light (0=none)-(255=biggest dlight) (full numbers).
;1572:"wait"			fire particles every X milliseconds.
;1573:"stop"			it stops spawning particles X milliseconds after it's been targeted.
;1574:
;1575:It will spawn X particles( and a random amount between 0 and 'random' key ) every X seconds.
;1576:Can be targeted to be toggled on/off. 
;1577:To set the type of particles spawned use the SPAWNFLAGS.
;1578:*/
;1579:void target_Particle_think (gentity_t *ent )
;1580:{  
line 1582
;1581:	// just toggle it off    
;1582:	if ( ent->r.svFlags & SVF_NOCLIENT ) 
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $678
line 1583
;1583:		ent->r.svFlags &=~SVF_NOCLIENT;  
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
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
ADDRGP4 $679
JUMPV
LABELV $678
line 1585
;1584:	else
;1585:		ent->r.svFlags |= SVF_NOCLIENT;
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
CNSTI4 1
BORI4
ASGNI4
LABELV $679
line 1586
;1586:}
LABELV $677
endproc target_Particle_think 8 0
export Use_Target_Particle
proc Use_Target_Particle 12 0
line 1589
;1587:
;1588:void Use_Target_Particle (gentity_t *ent, gentity_t *other, gentity_t *activator) 
;1589:{  
line 1591
;1590:	// toggle it off    
;1591:	if ( ent->r.svFlags & SVF_NOCLIENT ) 
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $681
line 1592
;1592:		ent->r.svFlags &=~SVF_NOCLIENT;  
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
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
ADDRGP4 $682
JUMPV
LABELV $681
line 1594
;1593:	else
;1594:		ent->r.svFlags |= SVF_NOCLIENT;
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
CNSTI4 1
BORI4
ASGNI4
LABELV $682
line 1596
;1595:
;1596:	if ( ent->wait )
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $683
line 1597
;1597:	{
line 1598
;1598:		ent->think = target_Particle_think ;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_Particle_think
ASGNP4
line 1599
;1599:		ent->nextthink = level.time + ent->wait;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 1600
;1600:	}
LABELV $683
line 1601
;1601:}
LABELV $680
endproc Use_Target_Particle 12 0
export G_ParticleSetup
proc G_ParticleSetup 40 16
line 1604
;1602: 
;1603:void G_ParticleSetup ( gentity_t *ent )
;1604:{
line 1605
;1605:	ent->r.svFlags &=~SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
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
line 1608
;1606:
;1607:	// check for prestarted looping sound 
;1608:	if (ent->target) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $687
line 1609
;1609:		gentity_t *target = G_Find (NULL, FOFS(targetname), ent->target);
CNSTP4 0
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1610
;1610:		if (!ent || !target) {
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $691
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $689
LABELV $691
line 1611
;1611:			G_Error ("%s at %s: %s is a bad target\n", ent->classname, vtos(ent->s.origin), ent->target);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 1612
;1612:		}
ADDRGP4 $690
JUMPV
LABELV $689
line 1614
;1613:		else
;1614:			VectorSubtract( target->s.origin, ent->s.origin, ent->s.angles );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 92
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 96
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
LABELV $690
line 1615
;1615:	}
LABELV $687
line 1616
;1616:}
LABELV $686
endproc G_ParticleSetup 40 16
export SP_target_Particle
proc SP_target_Particle 20 12
line 1620
;1617:
;1618:// this entity is completly client-side except if it should get triggered
;1619:void SP_target_Particle( gentity_t *ent ) 
;1620:{ 
line 1622
;1621:#ifdef PARTICLEHOST
;1622:	G_SpawnInt( "random", "4", &ent->s.powerups );
ADDRGP4 $694
ARGP4
ADDRGP4 $695
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1623
;1623:	G_SpawnInt( "randomdir", "2", &ent->s.time2 );
ADDRGP4 $696
ARGP4
ADDRGP4 $697
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1624
;1624:	G_SpawnInt( "velocity", "50", &ent->s.torsoAnim );
ADDRGP4 $698
ARGP4
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1625
;1625:	G_SpawnInt( "particles", "10", &ent->s.generic1 );
ADDRGP4 $699
ARGP4
ADDRGP4 $563
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1626
;1626:	G_SpawnInt( "size", "0", &ent->s.legsAnim );
ADDRGP4 $609
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1627
;1627:	G_SpawnInt( "dlight", "0", &ent->s.otherEntityNum2 );
ADDRGP4 $700
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1628
;1628:	G_SpawnInt( "wait", "500", &ent->s.time );	
ADDRGP4 $117
ARGP4
ADDRGP4 $701
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1629
;1629:	G_SpawnFloat( "stop", "0", &ent->wait );
ADDRGP4 $702
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1632
;1630:  	
;1631:	// set default.
;1632:	if ( ent->spawnflags == 0 )
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $703
line 1633
;1633:		ent->spawnflags |= PARTFLAGS_SMOKE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
LABELV $703
line 1635
;1634:
;1635:	ent->classname = "particle_host";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $705
ASGNP4
line 1637
;1636:
;1637: 	ent->s.eType = ET_PARTICLEHOST;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 17
ASGNI4
line 1638
;1638:	ent->s.eventParm = ent->spawnflags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 1639
;1639: 	ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1641
;1640: 
;1641: 	ent->use = Use_Target_Particle;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Particle
ASGNP4
line 1643
;1642:
;1643:	if ( ent->spawnflags & PARTFLAGS_STARTOFF )
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $706
line 1644
;1644:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 12
ADDRFP4 0
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
BORI4
ASGNI4
LABELV $706
line 1646
;1645:
;1646:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1648
;1647:
;1648:	ent->think = G_ParticleSetup;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ParticleSetup
ASGNP4
line 1649
;1649:	ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1653
;1650:#endif
;1651:	// must link the entity so we get areas and clusters so
;1652:	// the server can determine who to send updates to
;1653:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1654
;1654:}
LABELV $693
endproc SP_target_Particle 20 12
export Use_ModifyXP
proc Use_ModifyXP 16 0
line 1666
;1655:
;1656:#define MXP_STAMINA		1
;1657:#define MXP_SPEED		2
;1658:#define	MXP_ACCURACY	4
;1659:#define	MXP_STEALTH		8
;1660:#define MXP_TECHNICAL	16
;1661:#define	MXP_STRENGTH	32
;1662:
;1663:/*QUAKED target_modifyxp (1 0 0) (-8 -8 -8) (8 8 8) STAMINA SPEED ACCURACY STEALTH TECHNICAL STRENGTH
;1664:"setlevel" sets level of the selected abilities of the activator to a number
;1665:*/
;1666:void Use_ModifyXP (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 1667
;1667:	int spawnflags = ent->spawnflags;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 1668
;1668:	int	level = ent->s.time;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 1670
;1669:
;1670:	if ( !activator || !activator->client )
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $712
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $710
LABELV $712
line 1671
;1671:		return;
ADDRGP4 $709
JUMPV
LABELV $710
line 1673
;1672:
;1673:	if ( spawnflags & MXP_STAMINA )
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $713
line 1674
;1674:		activator->client->pers.nsPC.stamina = level;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $713
line 1676
;1675:	
;1676:	if ( spawnflags & MXP_SPEED )
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $715
line 1677
;1677:		activator->client->pers.nsPC.speed = level;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1552
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $715
line 1679
;1678:	
;1679:	if ( spawnflags & MXP_ACCURACY )
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $717
line 1680
;1680:		activator->client->pers.nsPC.accuracy = level;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $717
line 1682
;1681:	
;1682:	if ( spawnflags & MXP_STEALTH )
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $719
line 1683
;1683:		activator->client->pers.nsPC.stealth = level;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $719
line 1685
;1684:	
;1685:	if ( spawnflags & MXP_TECHNICAL )
ADDRLP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $721
line 1686
;1686:		activator->client->pers.nsPC.technical = level;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $721
line 1688
;1687:	
;1688:	if ( spawnflags & MXP_STRENGTH )
ADDRLP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $723
line 1689
;1689:		activator->client->pers.nsPC.strength = level;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $723
line 1691
;1690:  
;1691:}
LABELV $709
endproc Use_ModifyXP 16 0
export SP_target_modifyxp
proc SP_target_modifyxp 4 12
line 1693
;1692:
;1693:void SP_target_modifyxp ( gentity_t *ent ) {
line 1694
;1694:	G_SpawnInt( "setlevel", "0", &ent->s.time );
ADDRGP4 $726
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1696
;1695:
;1696:	if ( g_gametype.integer != 0 )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $727
line 1697
;1697:	{
line 1698
;1698:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1699
;1699:		return;
ADDRGP4 $725
JUMPV
LABELV $727
line 1703
;1700:	}
;1701:
;1702:
;1703:	ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
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
line 1704
;1704:	ent->use = Use_ModifyXP;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_ModifyXP
ASGNP4
line 1705
;1705:}
LABELV $725
endproc SP_target_modifyxp 4 12
export is_func_explosive
proc is_func_explosive 28 8
line 1709
;1706:
;1707:
;1708:qboolean is_func_explosive ( gentity_t *ent )
;1709:{
line 1710
;1710:	if ( !ent || !ent->classname )
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
EQU4 $733
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $731
LABELV $733
line 1711
;1711:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $730
JUMPV
LABELV $731
line 1714
;1712:
;1713:	if (
;1714:		!Q_stricmp( ent->classname , "func_explosive_glass" ) ||
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $736
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $744
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $737
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $744
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $738
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $744
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $739
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $744
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $740
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $734
LABELV $744
line 1720
;1715:		!Q_stricmp( ent->classname , "func_explosive_wood" ) ||
;1716:		!Q_stricmp( ent->classname , "func_explosive_metal" ) ||
;1717:		!Q_stricmp( ent->classname , "func_explosive_stone" ) ||
;1718:		!Q_stricmp( ent->classname , "func_explosive" )
;1719:		)
;1720:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $730
JUMPV
LABELV $734
line 1721
;1721:	return qfalse;
CNSTI4 0
RETI4
LABELV $730
endproc is_func_explosive 28 8
export func_explosive_die
proc func_explosive_die 4 20
line 1743
;1722:}
;1723:/*
;1724:==============================================================================
;1725:*/
;1726:
;1727:/*QUAKED func_explosive (.5 .5 .5) IS_WOOD IS_METAL
;1728: 
;1729:If targetname set, it will not be destroyable
;1730:To make it spawn an explosive let it trigger
;1731:default is: glass
;1732:an trigger_explosive
;1733:
;1734:"target"	Target to trigger when destroyed
;1735:"targetname"	If set not destroyable
;1736:"health"	Health value
;1737: 
;1738:
;1739:*/
;1740:void model_die ( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath );
;1741: 
;1742:void func_explosive_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath )
;1743:{  
line 1745
;1744:	// spawn modelparts
;1745:	model_die( self, inflictor, attacker, damage, meansOfDeath ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 model_die
CALLV
pop
line 1748
;1746: 
;1747:	// set invisible
;1748:	self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
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
line 1749
;1749:	self->r.contents = 0; 
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 1750
;1750:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 1753
;1751:
;1752:	// link back into world
;1753:	trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1758
;1754: 	
;1755:	// this has to be the last call, because else it will crash because
;1756:	// the engine is trynig to spawn a tempentity inside a brush
;1757:	// this is fatal and causes: G_NoFreeEntities 
;1758:	G_UseTargets (self, attacker);  
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1759
;1759:}
LABELV $745
endproc func_explosive_die 4 20
export func_explosive_use
proc func_explosive_use 4 20
line 1762
;1760:
;1761:void func_explosive_use (gentity_t *self, gentity_t *other, gentity_t *activator )
;1762:{ 
line 1765
;1763:	// just call the die function as it's the same and make sure that it's beeing killed.
;1764:
;1765:	self->die ( self, other, activator, 1000, 0 ); 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1000
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRP4
CALLV
pop
line 1766
;1766:}
LABELV $746
endproc func_explosive_use 4 20
export Touch_GlassTrigger
proc Touch_GlassTrigger 44 20
line 1769
;1767: 
;1768:void Touch_GlassTrigger (gentity_t *ent, gentity_t *other, trace_t *trace)
;1769:{
line 1770
;1770:	gentity_t *glass = ent->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ASGNP4
line 1774
;1771:	float length;
;1772:	vec3_t velocity;
;1773: 
;1774:	if ( !ent->parent && is_func_explosive(ent) )
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $748
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 is_func_explosive
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $748
line 1775
;1775:		glass = ent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
LABELV $748
line 1777
;1776:
;1777:	if ( other->client )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $750
line 1778
;1778:		VectorCopy( other->client->ps.velocity, velocity );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
LABELV $750
line 1780
;1779:	
;1780:	if ( !other->client )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $752
line 1781
;1781:	{
line 1782
;1782:		BG_EvaluateTrajectoryDelta( &other->s.pos, level.time, velocity );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1783
;1783:	}
LABELV $752
line 1785
;1784:
;1785: 	if ( other->r.maxs[2] >= glass->r.maxs[2] - 2 )
ADDRLP4 28
CNSTI4 456
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
CNSTF4 1073741824
SUBF4
LTF4 $755
line 1786
;1786:	{// can 1be broken when stood upon
line 1791
;1787:	
;1788://		G_Printf("broken because you stood on!\n");
;1789:		// play creaking sound here.
;1790:		//DamageSound();
;1791:		func_explosive_die( glass, other, other, glass->health, 0 );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 func_explosive_die
CALLV
pop
line 1792
;1792:		glass->fly_sound_debounce_time = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 1794
;1793:
;1794:		return;
ADDRGP4 $747
JUMPV
LABELV $755
line 1797
;1795:	}
;1796:	
;1797:	length = VectorLength( velocity ); 
ADDRLP4 8
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
line 1799
;1798:
;1799:	if ( glass->health - ( length / 2) <= 0 )
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
CNSTF4 0
GTF4 $757
line 1800
;1800:	{
line 1801
;1801:		func_explosive_die( glass, other, other, glass->health, 0 );		 
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 func_explosive_die
CALLV
pop
line 1802
;1802:		glass->fly_sound_debounce_time = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 1803
;1803:	}
LABELV $757
line 1804
;1804:}
LABELV $747
endproc Touch_GlassTrigger 44 20
export SpawnGlassTrigger
proc SpawnGlassTrigger 48 4
line 1805
;1805:void SpawnGlassTrigger( gentity_t *ent ) {
line 1811
;1806:	gentity_t		*other;
;1807:	vec3_t		mins, maxs;
;1808:	int			i, best;
;1809:   
;1810:	// find the bounds of everything on the team
;1811:	VectorCopy (ent->r.absmin, mins);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 1812
;1812:	VectorCopy (ent->r.absmax, maxs);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 1815
;1813: 
;1814:	// find the thinnest axis, which will be the one we expand
;1815:	best = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1816
;1816:	for ( i = 1 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $760
line 1817
;1817:		if ( maxs[i] - mins[i] < maxs[best] - mins[best] ) {
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 44
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 44
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
GEF4 $764
line 1818
;1818:			best = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1819
;1819:		}
LABELV $764
line 1820
;1820:	}
LABELV $761
line 1816
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $760
line 1821
;1821: 	maxs[best] += 0.5f;
ADDRLP4 36
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1822
;1822:	mins[best] -= 0.5f;
ADDRLP4 40
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1056964608
SUBF4
ASGNF4
line 1825
;1823:
;1824:	// create a trigger with this size
;1825:	other = G_Spawn ();
ADDRLP4 44
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 44
INDIRP4
ASGNP4
line 1826
;1826:	VectorCopy (mins, other->r.mins);
ADDRLP4 32
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1827
;1827:	VectorCopy (maxs, other->r.maxs);
ADDRLP4 32
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 1828
;1828:	other->parent = ent;
ADDRLP4 32
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1829
;1829:	other->classname = "glass_trigger";
ADDRLP4 32
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $766
ASGNP4
line 1830
;1830:	other->r.contents = CONTENTS_TRIGGER;
ADDRLP4 32
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 1831
;1831:	other->touch = Touch_GlassTrigger; 
ADDRLP4 32
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_GlassTrigger
ASGNP4
line 1833
;1832:	// remember the thinnest axis
;1833:	other->count = best;
ADDRLP4 32
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1835
;1834:
;1835:	trap_LinkEntity (other); 
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1836
;1836:} 
LABELV $759
endproc SpawnGlassTrigger 48 4
export SP_func_explosive
proc SP_func_explosive 12 12
line 1839
;1837:
;1838:void SP_func_explosive (gentity_t *ent) 
;1839:{
line 1840
;1840:	G_SpawnInt( "health", "50", &ent->health );
ADDRGP4 $768
ARGP4
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1841
;1841:	G_SpawnInt( "hits", "4", &ent->ns_flags );
ADDRGP4 $769
ARGP4
ADDRGP4 $695
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1842
;1842:	G_SpawnInt( "nomark", "0", &ent->fly_sound_debounce_time );
ADDRGP4 $770
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1844
;1843:
;1844:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1845
;1845:	ent->s.eType = ET_FUNCEXPLOSIVE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 16
ASGNI4
line 1848
;1846:
;1847:	// classnames
;1848:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $771
line 1849
;1849:		ent->classname = "func_explosive_wood";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $737
ASGNP4
line 1850
;1850:	}
ADDRGP4 $772
JUMPV
LABELV $771
line 1851
;1851:	else if ( ent->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $773
line 1852
;1852:		ent->classname = "func_explosive_metal";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $738
ASGNP4
line 1853
;1853:	} else if ( ent->spawnflags & 4 ) {
ADDRGP4 $774
JUMPV
LABELV $773
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $775
line 1854
;1854:		ent->classname = "func_explosive_stone";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $739
ASGNP4
line 1855
;1855:	} else
ADDRGP4 $776
JUMPV
LABELV $775
line 1856
;1856:		ent->classname = "func_explosive_glass";  
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $736
ASGNP4
LABELV $776
LABELV $774
LABELV $772
line 1858
;1857:	
;1858:	ent->timestamp = ent->ns_flags;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
line 1860
;1859:
;1860:	if ( ent->targetname )
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $777
line 1861
;1861:	{
line 1862
;1862:		ent->use = func_explosive_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 func_explosive_use
ASGNP4
line 1863
;1863:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 1865
;1864://		G_Printf("%s got target name... Can't shoot!\n", ent->classname );
;1865:	}
ADDRGP4 $778
JUMPV
LABELV $777
line 1867
;1866:	else
;1867:	{
line 1868
;1868:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1870
;1869:
;1870:		if ( ent->spawnflags & 8 )
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $779
line 1871
;1871:			; // other touch function?
ADDRGP4 $780
JUMPV
LABELV $779
line 1873
;1872:		else
;1873:		{
line 1874
;1874:			if ( !Q_stricmp( ent->classname, "func_explosive_glass") )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $736
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $781
line 1875
;1875:			{ 
line 1876
;1876:				ent->touch = Touch_GlassTrigger; 
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_GlassTrigger
ASGNP4
line 1877
;1877:				SpawnGlassTrigger( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpawnGlassTrigger
CALLV
pop
line 1878
;1878:			}
LABELV $781
line 1879
;1879:		}
LABELV $780
line 1880
;1880:	}
LABELV $778
line 1882
;1881:
;1882:	ent->die = func_explosive_die;  
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 func_explosive_die
ASGNP4
line 1883
;1883: 	ent->count = ent->health;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1885
;1884: 
;1885:	trap_SetBrushModel( ent, ent->model ); 
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1886
;1886:}    
LABELV $767
endproc SP_func_explosive 12 12
export Touch_Elevator_Button
proc Touch_Elevator_Button 152 28
line 1898
;1887:
;1888:/*QUAKED func_elevator_button (.5 .5 .5)
;1889: 
;1890:Button for the elevator
;1891:
;1892:"target"	Target to the elvator
;1893:"team"    2 = for all, 0 = only for seals, 1 = only for tangos
;1894:"elevator_index" index of the elevator level where the elevator shall go after beeing triggered (0 - 7)
;1895: 
;1896:
;1897:*/
;1898:void Touch_Elevator_Button(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1901
;1899:	trace_t tr;
;1900:	vec3_t end, forward, up, right, start;
;1901:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $784
line 1902
;1902:		return;
ADDRGP4 $783
JUMPV
LABELV $784
line 1909
;1903:	}
;1904:	// if game is open
;1905:	//if (GameState == STATE_OPEN && g_gametype.integer == GT_LTS)
;1906:	//	return;
;1907:	
;1908:	// e 2 - means free 
;1909:	if (ent->ns_team != 2 && !Is_OnBrushTeam(ent,other) )
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 2
EQI4 $786
ADDRLP4 116
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $786
line 1910
;1910:		return;
ADDRGP4 $783
JUMPV
LABELV $786
line 1912
;1911:
;1912:	if ( other->client && !( other->client->buttons & BUTTON_USE ) )
ADDRLP4 124
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $788
ADDRLP4 124
INDIRP4
CNSTI4 1848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $788
line 1913
;1913:		return;
ADDRGP4 $783
JUMPV
LABELV $788
line 1915
;1914:	
;1915:	if ( other->client && ( other->client->buttons & BUTTON_USE) && (other->client->oldbuttons & BUTTON_USE)) return;
ADDRLP4 128
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $790
ADDRLP4 132
CNSTI4 4
ASGNI4
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRP4
CNSTI4 1848
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
BANDI4
ADDRLP4 136
INDIRI4
EQI4 $790
ADDRLP4 128
INDIRP4
CNSTI4 1852
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
BANDI4
ADDRLP4 136
INDIRI4
EQI4 $790
ADDRGP4 $783
JUMPV
LABELV $790
line 1917
;1916:
;1917:	VectorCopy(other->client->ps.viewangles, end);
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 1918
;1918:	AngleVectors(end, forward, right, up);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1919
;1919:	VectorCopy(other->client->ps.origin, start);
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1920
;1920:	start[2] += other->client->ps.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
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
line 1921
;1921:	VectorMA(start, 32, forward, end);
ADDRLP4 140
CNSTF4 1107296256
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1922
;1922:	VectorMA(start, -32, forward, start);
ADDRLP4 144
CNSTF4 3254779904
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3254779904
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1924
;1923:	
;1924:	trap_Trace( &tr, start, NULL, NULL, end, other->s.number, MASK_ALL);
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1926
;1925:
;1926:	if (tr.entityNum == ent->s.number) G_UseTargets( ent, NULL);
ADDRLP4 36+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $805
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $805
line 1927
;1927:}
LABELV $783
endproc Touch_Elevator_Button 152 28
export SP_func_elevator_button
proc SP_func_elevator_button 44 12
line 1929
;1928:
;1929:void SP_func_elevator_button( gentity_t *ent ) {
line 1931
;1930:
;1931:	G_SpawnInt("team","2", &ent->ns_team);
ADDRGP4 $89
ARGP4
ADDRGP4 $697
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1932
;1932:	G_SpawnInt("elevator_index", "0", &ent->elevator_index);
ADDRGP4 $809
ARGP4
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1934
;1933:
;1934:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1936
;1935:
;1936:	InitMover(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1938
;1937:
;1938:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1939
;1939:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1942
;1940:	
;1941:
;1942:	ent->touch = Touch_Elevator_Button;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Elevator_Button
ASGNP4
line 1944
;1943:
;1944:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 1946
;1945:
;1946:	ent->r.mins[0] -= 1.0;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 1947
;1947:	ent->r.mins[1] -= 1.0;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 1948
;1948:	ent->r.mins[2] -= 1.0;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 1950
;1949:
;1950:	ent->r.maxs[0] += 1.0;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1951
;1951:	ent->r.maxs[1] += 1.0;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1952
;1952:	ent->r.maxs[2] += 1.0;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1954
;1953:
;1954:	ent->classname = "func_elevator_button";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $810
ASGNP4
line 1955
;1955:	switch (ent->elevator_index) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $811
ADDRLP4 36
INDIRI4
CNSTI4 7
GTI4 $811
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $822
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $822
address $814
address $815
address $816
address $817
address $818
address $819
address $820
address $821
code
LABELV $814
line 1956
;1956:		case 0: ent->s.eType = ET_ELEVBUT0; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 18
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $815
line 1957
;1957:		case 1: ent->s.eType = ET_ELEVBUT1; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 19
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $816
line 1958
;1958:		case 2: ent->s.eType = ET_ELEVBUT2; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 20
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $817
line 1959
;1959:		case 3: ent->s.eType = ET_ELEVBUT3; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 21
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $818
line 1960
;1960:		case 4: ent->s.eType = ET_ELEVBUT4; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 22
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $819
line 1961
;1961:		case 5: ent->s.eType = ET_ELEVBUT5; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 23
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $820
line 1962
;1962:		case 6: ent->s.eType = ET_ELEVBUT6; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 24
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $821
line 1963
;1963:		case 7: ent->s.eType = ET_ELEVBUT7; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 25
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $811
line 1964
;1964:		default: ent->s.eType = ET_ELEVBUT0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 18
ASGNI4
line 1965
;1965:	}
LABELV $812
line 1967
;1966:
;1967:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1969
;1968:
;1969:}
LABELV $808
endproc SP_func_elevator_button 44 12
import Think_SpawnNewDoorTrigger
bss
export assault_fields
align 4
LABELV assault_fields
skip 16
export finished_assault_fields
align 4
LABELV finished_assault_fields
skip 1024
import InitTrigger
import LogExit
import InitMover
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
import NS_ModifyClientBBox
import NS_InitHeadBBoxes
import G_SetupServerInfo
import NS_RaiseCharacterLevel
import NS_PlayerInventory
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
LABELV $810
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 108
byte 1 101
byte 1 118
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $809
byte 1 101
byte 1 108
byte 1 101
byte 1 118
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $770
byte 1 110
byte 1 111
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $769
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $768
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $766
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $740
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $739
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $738
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $737
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $736
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $726
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $705
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $702
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $701
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $700
byte 1 100
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $699
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $698
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $697
byte 1 50
byte 1 0
align 1
LABELV $696
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $695
byte 1 52
byte 1 0
align 1
LABELV $694
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $692
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $672
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 115
byte 1 47
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $671
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $668
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $665
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $662
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $661
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $660
byte 1 121
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $659
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $658
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $657
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $642
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $618
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 111
byte 1 114
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
byte 1 94
byte 1 50
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 101
byte 1 100
byte 1 94
byte 1 55
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $614
byte 1 99
byte 1 111
byte 1 114
byte 1 111
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $613
byte 1 98
byte 1 0
align 1
LABELV $612
byte 1 103
byte 1 0
align 1
LABELV $611
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $610
byte 1 114
byte 1 0
align 1
LABELV $609
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $603
byte 1 82
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 77
byte 1 97
byte 1 120
byte 1 95
byte 1 70
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $595
byte 1 87
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $563
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $562
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $561
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $560
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $559
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $544
byte 1 79
byte 1 66
byte 1 74
byte 1 69
byte 1 67
byte 1 84
byte 1 73
byte 1 86
byte 1 69
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
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $537
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $513
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $362
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
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
LABELV $314
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 105
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 99
byte 1 117
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $305
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $302
byte 1 79
byte 1 66
byte 1 74
byte 1 69
byte 1 67
byte 1 84
byte 1 73
byte 1 86
byte 1 69
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
byte 1 32
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 86
byte 1 73
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $282
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 62
byte 1 32
byte 1 49
byte 1 63
byte 1 0
align 1
LABELV $270
byte 1 86
byte 1 105
byte 1 112
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $257
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 98
byte 1 99
byte 1 0
align 1
LABELV $256
byte 1 115
byte 1 116
byte 1 97
byte 1 121
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $233
byte 1 114
byte 1 101
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $225
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 95
byte 1 79
byte 1 78
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 84
byte 1 79
byte 1 71
byte 1 71
byte 1 76
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $220
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $210
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $209
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
LABELV $188
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 33
byte 1 32
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 58
byte 1 32
byte 1 49
byte 1 50
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $180
byte 1 97
byte 1 100
byte 1 100
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $179
byte 1 49
byte 1 0
align 1
LABELV $178
byte 1 100
byte 1 101
byte 1 102
byte 1 117
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $177
byte 1 49
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $176
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $175
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $149
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 39
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 39
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 39
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 39
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $146
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 33
byte 1 32
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 58
byte 1 32
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $143
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 33
byte 1 32
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 58
byte 1 32
byte 1 53
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $140
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $139
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $138
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 78
byte 1 111
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 33
byte 1 32
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 58
byte 1 32
byte 1 49
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $118
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $117
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $94
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 39
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 39
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $91
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $90
byte 1 48
byte 1 0
align 1
LABELV $89
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
