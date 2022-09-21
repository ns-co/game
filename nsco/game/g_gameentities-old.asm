export Is_OnBrushTeam
code
proc Is_OnBrushTeam 0 0
file "g_gameentities.c"
line 19
;1:// Copyright (C) 1999-2000 Team Mirage
;2:// [ create 6-1-2000 ]
;3:
;4:#include "g_local.h" 
;5:
;6:#define BRUSH_TEAM_RED		0
;7:#define BRUSH_TEAM_BLUE		1
;8:#define BRUSH_TEAM_ALL		2
;9:
;10:// always keep in this order: 1, 2, 4 , 8, 10 , 20 , 30 , 40, 80, 100, 200 etc..
;11:#define	NS_FLAG_BUSY_CARRIYNG	0x00000001		 
;12:#define NS_FLAG_END_ROUND		0x00000002
;13:#define NS_FLAG_LOOP			0x00000004
;14:
;15:void InitMover(gentity_t*ent);
;16:void LogExit(const char *string);
;17:
;18:qboolean Is_OnBrushTeam(gentity_t *brush, gentity_t *client)
;19:{
line 20
;20:	if (brush->ns_team == BRUSH_TEAM_RED && client->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $67
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 1
NEI4 $67
line 21
;21:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $67
line 22
;22:	else if (brush->ns_team == BRUSH_TEAM_BLUE && client->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $69
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 2
NEI4 $69
line 23
;23:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $69
line 24
;24:	else if (brush->ns_team == BRUSH_TEAM_ALL)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 2
NEI4 $71
line 25
;25:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $71
line 27
;26:	else
;27:		return qfalse;
CNSTI4 0
RETI4
LABELV $66
endproc Is_OnBrushTeam 0 0
export Touch_Goal
proc Touch_Goal 20 4
line 43
;28:}
;29:
;30:/*
;31:QUAKED func_goal (0.3 0.1 0.6) (-8 -8 -8) (8 8 8)  
;32:This should be renamed trigger_timer...
;33:Repeatedly fires its targets.
;34:Can be turned on or off by using.
;35:
;36:value0: team (int) (team 0seals1tangos)
;37:value1: reachpoints (int) (when the team reaches this point it will get these points)
;38:value2: end (int) ( 0= no, 1= yes - end map? - also ends map if seals can't reach point in time)
;39:value3: time (int) (after this time , the enemys will get a point (in sec) , then again after X secs)
;40:value4: enemypoints (int) (how much points the team will get)
;41: 
;42:*/
;43:void Touch_Goal (gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 47
;44:
;45://   G_Printf(" Touched Goal!!!\n");
;46:
;47:	if (ent->ns_team == BRUSH_TEAM_RED && other->client && other->client->sess.sessionTeam != TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $74
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $74
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 1
EQI4 $74
line 48
;48:		return;
ADDRGP4 $73
JUMPV
LABELV $74
line 49
;49:	else if (ent->ns_team == BRUSH_TEAM_BLUE && other->client && other->client->sess.sessionTeam != TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $76
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $76
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 2
EQI4 $76
line 50
;50:		return;
ADDRGP4 $73
JUMPV
LABELV $76
line 52
;51:
;52:	if (ent->ns_team == BRUSH_TEAM_RED && other->client && other->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $78
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $78
ADDRLP4 8
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 1
NEI4 $78
line 53
;53:	{
line 55
;54://		G_Printf("seal brush!\n");
;55:		level.teamScores[TEAM_RED] += ent->count;
ADDRLP4 12
ADDRGP4 level+44+4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ADDI4
ASGNI4
line 56
;56:	}
ADDRGP4 $79
JUMPV
LABELV $78
line 57
;57:	else if (ent->ns_team == BRUSH_TEAM_BLUE && other->client && other->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $82
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $82
ADDRLP4 12
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 2
NEI4 $82
line 58
;58:	{
line 61
;59://		G_Printf("tango brush!\n");
;60:		// it's a reachpoint for the tangos
;61:		level.teamScores[TEAM_BLUE] += ent->count;
ADDRLP4 16
ADDRGP4 level+44+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ADDI4
ASGNI4
line 62
;62:	}
LABELV $82
LABELV $79
line 64
;63:
;64:	if (ent->count)
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $86
line 65
;65:		CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
LABELV $86
line 67
;66:
;67:	if (ent->ns_flags & NS_FLAG_END_ROUND)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $88
line 68
;68:	{
line 69
;69:		LogExit( "Ended map because of goalpoint." );
ADDRGP4 $90
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 70
;70:		return;
ADDRGP4 $73
JUMPV
LABELV $88
line 73
;71:	}
;72: 
;73:	ent->r.svFlags |= SVF_NOCLIENT; 
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 75
;74:	// stop thinking since it's been touched.
;75:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 77
;76:
;77:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 78
;78:}
LABELV $73
endproc Touch_Goal 20 4
export Think_Goal
proc Think_Goal 8 4
line 80
;79:
;80:void Think_Goal( gentity_t *self ) {
line 84
;81:
;82:
;83:	// d'oh!
;84:	if (self->health) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
EQI4 $92
line 85
;85:		if (self->ns_team == BRUSH_TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $94
line 86
;86:			level.teamScores[TEAM_RED] += self->health;
ADDRLP4 0
ADDRGP4 level+44+4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $94
line 88
;87:		else
;88:			level.teamScores[TEAM_BLUE] += self->health;
ADDRLP4 4
ADDRGP4 level+44+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $95
line 90
;89:
;90:		CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 91
;91:	}
LABELV $92
line 93
;92:
;93:	if (self->ns_flags & NS_FLAG_END_ROUND)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $100
line 94
;94:	{
line 95
;95:		LogExit( "Ended map because of goalpoint." );
ADDRGP4 $90
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 96
;96:		return;
ADDRGP4 $91
JUMPV
LABELV $100
line 100
;97:	}
;98:	else
;99:		// next think...
;100:		self->nextthink = level.time + self->timestamp ;
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
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ADDI4
ASGNI4
line 101
;101:}
LABELV $91
endproc Think_Goal 8 4
export SP_func_goal
proc SP_func_goal 36 12
line 103
;102: 
;103:void SP_func_goal( gentity_t *ent ) {
line 109
;104:	int		reachpoints;
;105:	int		end;
;106:	int		enemypoints;
;107:	float	time;
;108:
;109:	G_SpawnInt("reachpoints", "0", &reachpoints);
ADDRGP4 $104
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 110
;110:	G_SpawnInt("end", "0", &end);
ADDRGP4 $106
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 111
;111:	G_SpawnInt("enemypoints", "0", &enemypoints);
ADDRGP4 $107
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 112
;112:	G_SpawnInt("team", "2", &ent->ns_team );
ADDRGP4 $108
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 114
;113:
;114:	G_SpawnFloat( "time", "60", &time );
ADDRGP4 $110
ARGP4
ADDRGP4 $111
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 117
;115:
;116:	// only NS gametype
;117:	if (g_gametype.integer != GT_LTS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $112
line 118
;118:		return;
ADDRGP4 $103
JUMPV
LABELV $112
line 121
;119:
;120:	// in secs
;121:	time *= 1000;
ADDRLP4 0
CNSTF4 1148846080
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 123
;122:
;123:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 124
;124:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 127
;125:
;126:	// origin keeps.. sometimes invisible.. but don't care
;127:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 128
;128:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 130
;129:
;130:	if (ent->ns_team > 1 || ent->ns_team < 0)
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
GTI4 $117
ADDRLP4 28
INDIRI4
CNSTI4 0
GEI4 $115
LABELV $117
line 131
;131:	{
line 132
;132:		G_Printf("func_goal[%s]: Wrong Team Value, Defaulted to: 0\n", vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $118
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 133
;133:		ent->ns_team = 0;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 0
ASGNI4
line 134
;134:	}
LABELV $115
line 137
;135:
;136:	
;137:	ent->think = Think_Goal;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_Goal
ASGNP4
line 139
;138:
;139:	ent->timestamp = time;	
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 142
;140:
;141:	// argl...
;142:	ent->count = reachpoints;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 143
;143:	ent->health = enemypoints;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 145
;144:
;145:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 147
;146:
;147:	if (end)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $119
line 148
;148:		ent->ns_flags |= NS_FLAG_END_ROUND;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $119
line 150
;149: 
;150:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 151
;151:}
LABELV $103
endproc SP_func_goal 36 12
export trigger_points_use
proc trigger_points_use 12 8
line 161
;152:
;153:
;154:/*QUAKED  trigger_missionobjective (1 0 0) (-8 -8 -8) (8 8 8)
;155:
;156:value:  team (int) (0 = seals / 1 = tangos)
;157:value1: targetname (string) (when triggered, (int)team will get X points)
;158:
;159:*/ 
;160:void trigger_points_use( gentity_t *self, gentity_t *other, gentity_t *activator ) 
;161:{
line 162
;162:	if ( !Is_OnBrushTeam( self, activator ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $122
line 164
;163://		G_Printf("not on brush team!\n");
;164:		return;
ADDRGP4 $121
JUMPV
LABELV $122
line 171
;165:	}
;166:
;167://	G_Printf("on brush team %s\n", TeamName(activator->client->sess.sessionTeam ) );
;168:
;169:
;170:	// we're spawning this one so we got one more objective to do
;171:	if (g_gametype.integer == GT_LTS ) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $124
line 172
;172:	{
line 173
;173:		if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $127
line 174
;174:			level.done_objectives[TEAM_RED]++;
ADDRLP4 4
ADDRGP4 level+7184+4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $128
JUMPV
LABELV $127
line 175
;175:		else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $131
line 176
;176:			level.done_objectives[TEAM_BLUE]++;
ADDRLP4 8
ADDRGP4 level+7184+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $131
LABELV $128
line 177
;177:	}
LABELV $124
line 178
;178:}
LABELV $121
endproc trigger_points_use 12 8
export SP_trigger_points
proc SP_trigger_points 16 12
line 180
;179:
;180:void SP_trigger_points( gentity_t *self ) {
line 181
;181:	G_SpawnInt( "team","0", &self->ns_team); 
ADDRGP4 $108
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 184
;182:
;183:	// check for invalid values
;184:	if ( self->ns_team > BRUSH_TEAM_BLUE || self->ns_team < BRUSH_TEAM_RED)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $138
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $136
LABELV $138
line 185
;185:		G_Error( "%s: 'team' with invalid value %i\n", self->classname , self->ns_team);
ADDRGP4 $139
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
LABELV $136
line 187
;186:  
;187:	self->use = trigger_points_use; 
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 trigger_points_use
ASGNP4
line 189
;188:
;189:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 191
;190:
;191:	G_Printf("spawning mo for team %i\n", self->ns_team );
ADDRGP4 $140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 194
;192:
;193:	// we're spawning this one so we got one more objective to do
;194:	if (g_gametype.integer == GT_LTS ) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $141
line 195
;195:	{
line 196
;196:		if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $144
line 197
;197:			level.num_objectives[TEAM_RED]++;
ADDRLP4 8
ADDRGP4 level+7168+4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $144
line 198
;198:		else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $148
line 199
;199:			level.num_objectives[TEAM_BLUE]++;
ADDRLP4 12
ADDRGP4 level+7168+8
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
LABELV $145
line 200
;200:	}
LABELV $141
line 201
;201:}
LABELV $135
endproc SP_trigger_points 16 12
export trigger_counter_think
proc trigger_counter_think 12 8
line 214
;202:
;203:
;204:/*QUAKED trigger_counter (0.3 0.1 0.6) (-8 -8 -8) (8 8 8) START_ON
;205:Repeatedly fires its targets.
;206:Can be turned on or off by using.
;207:
;208:"wait"			base time between triggering all targets, default is 1
;209:"loop"			(0) no, (1) yea
;210:
;211:*/
;212:
;213:void trigger_counter_think( gentity_t *self ) 
;214:{ 
line 216
;215: 
;216:	if ( !self->activator )
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $153
line 217
;217:		self->activator = self;
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
LABELV $153
line 219
;218:
;219:	G_UseTargets (self, self->activator );
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
line 222
;220:
;221:	// off
;222:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 225
;223:	
;224:	// loop?
;225:	if (self->ns_flags & NS_FLAG_LOOP)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $155
line 226
;226:		self->nextthink = level.time + self->wait;
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
LABELV $155
line 227
;227:}
LABELV $152
endproc trigger_counter_think 12 8
export trigger_counter_use
proc trigger_counter_use 4 0
line 229
;228:
;229:void trigger_counter_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 230
;230:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 233
;231:	
;232:	// if on, turn it off
;233:	if ( self->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $159
line 234
;234:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 235
;235:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 239
;236:	}
;237: 
;238:	// turn it on
;239:	self->nextthink = level.time + self->wait;
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
line 240
;240:}
LABELV $158
endproc trigger_counter_use 4 0
export SP_trigger_counter
proc SP_trigger_counter 16 12
line 242
;241:
;242:void SP_trigger_counter( gentity_t *self ) {
line 245
;243:	int loop;
;244:
;245: 	G_SpawnFloat( "wait", "0", &self->wait );
ADDRGP4 $163
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 246
;246:	G_SpawnInt("loop", "0", &loop);
ADDRGP4 $164
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 248
;247:
;248:	self->use = trigger_counter_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 trigger_counter_use
ASGNP4
line 251
;249: 
;250:	// in seconds please...
;251:	if (!self->wait) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $165
line 252
;252:		G_Printf("No waiting time set! Default: 10\n");
ADDRGP4 $167
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 253
;253:		self->wait = 10;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1092616192
ASGNF4
line 254
;254:	}
LABELV $165
line 256
;255:
;256:	self->wait *= ONE_SECOND;
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
line 258
;257:
;258:	if (loop)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $168
line 259
;259:		self->ns_flags |= NS_FLAG_LOOP;
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
LABELV $168
line 261
;260:
;261:	self->think = trigger_counter_think; 
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 trigger_counter_think
ASGNP4
line 262
;262:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 265
;263:
;264:	// set initial think only when start_on and not in g_lts.
;265:	if ( ( self->spawnflags & 1 ) && ( g_gametype.integer != GT_LTS) ) {				
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $170
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $170
line 266
;266:		self->nextthink = level.time + self->wait; 
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
line 267
;267:	}
LABELV $170
line 270
;268:
;269:	// no draw
;270:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 271
;271:}
LABELV $162
endproc SP_trigger_counter 16 12
export explosion_explode
proc explosion_explode 12 24
line 286
;272:
;273:/*QUAKED trigger_explosion (1 0 0) (-8 -8 -8) (8 8 8)
;274:As soon as it gets triggered an explosion will be shown
;275:and dmg will be infliced within dmg_rad.
;276:If time (in seconds) is set . it will trigger every X seconds
;277:
;278:"dmg"			default 5 ( whole numbers only )
;279:"radius"		default 50 ( whole numbers only )
;280:"wait"          default 0 ( no loop , only trigger )
;281:"delay"			default 0 ( delay when triggered in sec - only when wait=0)
;282:
;283:*/
;284:
;285:void explosion_explode( gentity_t *ent )
;286:{
line 290
;287:	gentity_t *tent;
;288:
;289:	//
;290:	tent = G_TempEntity( ent->s.origin , EV_EXPLOSION );  
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 90
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 293
;291:
;292:	// splash damage
;293:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $175
line 294
;294:		G_RadiusDamage( ent->s.origin, ent, ent->splashDamage, ent->splashRadius, NULL, ent->splashMethodOfDeath );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 295
;295:	} 
LABELV $175
line 296
;296:}
LABELV $174
endproc explosion_explode 12 24
export explosion_use
proc explosion_use 12 24
line 298
;297:
;298:void explosion_use( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 301
;299:	gentity_t *tent;
;300:
;301:	if ( ent->random ) 
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $178
line 302
;302:	{
line 303
;303:		ent->nextthink = level.time + (ent->random*ONE_SECOND);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 304
;304:		ent->think = explosion_explode;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 explosion_explode
ASGNP4
line 305
;305:		return;
ADDRGP4 $177
JUMPV
LABELV $178
line 308
;306:	}
;307:	//
;308:	tent = G_TempEntity( ent->s.origin , EV_EXPLOSION );  
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 90
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 311
;309:
;310:	// splash damage
;311:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $181
line 312
;312:		G_RadiusDamage( ent->s.origin, ent, ent->splashDamage, ent->splashRadius, NULL, ent->splashMethodOfDeath );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 313
;313:	}
LABELV $181
line 316
;314: 
;315:
;316:}
LABELV $177
endproc explosion_use 12 24
export explosion_think
proc explosion_think 12 24
line 319
;317: 
;318:void explosion_think( gentity_t *ent )
;319:{
line 323
;320:	 gentity_t *tent;
;321:
;322:	//
;323:	tent = G_TempEntity( ent->s.origin , EV_EXPLOSION );  
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 90
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 326
;324: 
;325:	// splash damage
;326:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $184
line 327
;327:		G_RadiusDamage( ent->s.origin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 329
;328:			, ent->splashMethodOfDeath );
;329:	}
LABELV $184
line 331
;330: 
;331:	ent->nextthink = level.time + ent->wait;
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
line 333
;332://	G_Printf("next: %i\n", ent->wait  ); 
;333:}
LABELV $183
endproc explosion_think 12 24
export SP_trigger_explosion
proc SP_trigger_explosion 16 12
line 334
;334:void SP_trigger_explosion( gentity_t *self ) { 
line 338
;335:  
;336:
;337:	// grab 2 variables
;338:	G_SpawnInt( "radius", "0", &self->splashRadius );
ADDRGP4 $188
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 339
;339:	G_SpawnInt( "dmg", "0", &self->splashDamage );
ADDRGP4 $189
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 340
;340:	G_SpawnFloat( "wait", "0", &self->wait );
ADDRGP4 $163
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 341
;341:	G_SpawnFloat( "delay", "0", &self->random );
ADDRGP4 $190
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 343
;342:
;343:	if ( !self->splashRadius ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $191
line 344
;344:		self->splashRadius = 50;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 50
ASGNI4
line 345
;345:		G_Printf("%s at %s with no radius set! Default: 50\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $193
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
line 346
;346:	}
LABELV $191
line 348
;347:
;348:	if ( !self->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $194
line 349
;349:		self->splashDamage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 5
ASGNI4
line 350
;350:		G_Printf("%s at %s with no damage set! Default: 5\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $196
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
line 351
;351:	}
LABELV $194
line 353
;352:
;353:	if ( self->wait && self->random )
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
EQF4 $197
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
EQF4 $197
line 354
;354:	{
line 355
;355:		G_Error("%s at %s with 'wait' and 'delay' set!\n", self->classname, vtos(self->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $199
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
line 356
;356:		return;
ADDRGP4 $187
JUMPV
LABELV $197
line 359
;357:	}
;358:
;359:	if ( self->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $200
line 360
;360:		self->wait *= ONE_SECOND;
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
line 361
;361:		self->think = explosion_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 explosion_think
ASGNP4
line 362
;362:		self->nextthink = level.time + self->wait;
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
line 363
;363:	}
LABELV $200
line 366
;364: 
;365:	// set use stats
;366:	self->use = explosion_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 explosion_use
ASGNP4
line 368
;367:
;368:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 371
;369:
;370: 
;371:}
LABELV $187
endproc SP_trigger_explosion 16 12
export info_bomb_disarm_use
proc info_bomb_disarm_use 0 8
line 381
;372:
;373:/*QUAKED info_bomb_disarm (1 0 0) (-8 -8 -8) (8 8 8)
;374:If player standing in radius from origin of ent
;375:he is able to arm a bomb.
;376:
;377:"radius"		default 50 ( whole numbers only )
;378:"team"			team 0
;379:
;380:*/
;381:void info_bomb_disarm_use( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 382
;382:	G_UseTargets( ent, activator ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 383
;383:}
LABELV $203
endproc info_bomb_disarm_use 0 8
export info_bomb_disarm_think
proc info_bomb_disarm_think 32 8
line 386
;384: 
;385:void info_bomb_disarm_think( gentity_t *ent )
;386:{
line 389
;387:	 int i;
;388:
;389:	for ( i = 0; i < level.maxclients; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $205
line 390
;390:	{
line 391
;391:		gclient_t *client = &level.clients[i];
ADDRLP4 4
CNSTI4 4724
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 393
;392:
;393:		if (client->pers.connected != CON_CONNECTED)
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $210
line 394
;394:			continue;
ADDRGP4 $206
JUMPV
LABELV $210
line 396
;395:
;396:		if ( 1 /*Is_OnBrushTeam( ent, &g_entities[ client - level.clients ] )*/ )
line 397
;397:		{
line 399
;398:			vec3_t origin;
;399:			VectorCopy( client->ps.origin, origin );
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 401
;400:			// this should fix the bug that you can only have one bombspot
;401:			if ( client->ns.bomb_parent && client->ns.bomb_parent != ent )
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 4612
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 20
INDIRU4
CNSTU4 0
EQU4 $214
ADDRLP4 20
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $214
line 402
;402:				continue;
ADDRGP4 $206
JUMPV
LABELV $214
line 404
;403:
;404:			if ( Distance( ent->s.origin, origin ) <= ent->splashRadius )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
GTF4 $216
line 405
;405:			{   
line 406
;406:				if ( !( client->ps.pm_flags & PMF_BOMBRANGE ) ) { 
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $206
line 407
;407:					client->ps.pm_flags |= PMF_BOMBRANGE;
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 12
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
line 408
;408:					client->ns.bomb_parent = ent;
ADDRLP4 4
INDIRP4
CNSTI4 4612
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 409
;409:				}
line 410
;410:				continue; // skip
ADDRGP4 $206
JUMPV
LABELV $216
line 412
;411:			} 	 
;412:		}
LABELV $212
line 414
;413:		
;414:		if ( client->ps.pm_flags & PMF_BOMBRANGE || client->ns.bomb_parent ) {
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $222
ADDRLP4 4
INDIRP4
CNSTI4 4612
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $220
LABELV $222
line 415
;415:			client->ps.pm_flags &=~ PMF_BOMBRANGE;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 416
;416:			client->ns.bomb_parent = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 4612
ADDP4
CNSTP4 0
ASGNP4
line 417
;417:		}
LABELV $220
line 418
;418:	}
LABELV $206
line 389
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $208
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $205
line 421
;419:
;420: 
;421:	ent->nextthink = level.time + 10; 
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 422
;422:}
LABELV $204
endproc info_bomb_disarm_think 32 8
export SP_info_bomb_disarm
proc SP_info_bomb_disarm 16 12
line 424
;423:
;424:void SP_info_bomb_disarm( gentity_t *self ) { 
line 428
;425:	int	optional;
;426:
;427:	// grab 2 variables
;428: 	G_SpawnInt( "radius", "50", &self->splashRadius );
ADDRGP4 $188
ARGP4
ADDRGP4 $225
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 429
;429:	G_SpawnInt( "team", "0", &self->ns_team );
ADDRGP4 $108
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 430
;430:	G_SpawnInt( "optional", "0", &optional );
ADDRGP4 $226
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 431
;431:	G_SpawnFloat( "time", "30", &self->wait );
ADDRGP4 $110
ARGP4
ADDRGP4 $227
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 434
;432:
;433:
;434:	if ( !self->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $228
line 435
;435:		self->wait = 30;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1106247680
ASGNF4
line 436
;436:	}
LABELV $228
line 438
;437:
;438:	if ( !self->splashRadius ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $230
line 439
;439:		self->splashRadius = 50;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 50
ASGNI4
line 440
;440:		G_Printf("%s at %s with no radius set! Default: 50\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $193
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 441
;441:	}
LABELV $230
line 443
;442:
;443:	if (!optional)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $232
line 444
;444:	{ 
line 445
;445:			level.num_objectives[TEAM_RED]++; 
ADDRLP4 4
ADDRGP4 level+7168+4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 446
;446:			level.num_objectives[TEAM_BLUE]++;
ADDRLP4 8
ADDRGP4 level+7168+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 447
;447:	}
LABELV $232
line 449
;448:
;449:	G_Printf("spawning bomb: %i\n", self->ns_team );
ADDRGP4 $238
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 450
;450:	if ( self->ns_team == 0 )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $239
line 451
;451:		level.bombs[TEAM_RED]++;
ADDRLP4 4
ADDRGP4 level+7200+4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $239
line 452
;452:	else if ( self->ns_team == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $243
line 453
;453:		level.bombs[TEAM_BLUE]++;
ADDRLP4 8
ADDRGP4 level+7200+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $244
JUMPV
LABELV $243
line 454
;454:	else if ( self->ns_team == 2 )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 2
NEI4 $247
line 455
;455:		level.bombs[TEAM_FREE]++;
ADDRLP4 12
ADDRGP4 level+7200
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $247
LABELV $244
LABELV $240
line 458
;456:
;457:	// set use stats
;458:	self->think = info_bomb_disarm_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 info_bomb_disarm_think
ASGNP4
line 459
;459:	self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 461
;460:
;461:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 464
;462:
;463: 
;464:}
LABELV $224
endproc SP_info_bomb_disarm 16 12
export func_wall_use
proc func_wall_use 4 4
line 493
;465:
;466:/*
;467:===============================================================================
;468:
;469:WALL
;470:
;471:===============================================================================
;472:*/
;473:
;474:/*QUAKED func_wall (0 .5 .8) ? TRIGGER_SPAWN TOGGLE START_ON
;475:This is just a solid wall if not inhibited
;476:
;477:TRIGGER_SPAWN	the wall will not be present until triggered
;478:				it will then blink in to existance; it will
;479:				kill anything that was in it's way
;480:
;481:TOGGLE			only valid for TRIGGER_SPAWN walls
;482:				this allows the wall to be turned on and off
;483:
;484:START_ON		only valid for TRIGGER_SPAWN walls
;485:				the wall will initially be present
;486:
;487:"model2"	.md3 model to also draw
;488:"color"		constantLight color
;489:"light"		constantLight radius
;490:*/
;491:
;492:void func_wall_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;493:{
line 494
;494:	if (self->r.contents == 0)
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 0
NEI4 $252
line 495
;495:	{
line 496
;496:		self->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1
ASGNI4
line 497
;497:		self->r.svFlags &= ~SVF_NOCLIENT;
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
line 499
;498://		G_KillBox (self);
;499:	}
ADDRGP4 $253
JUMPV
LABELV $252
line 501
;500:	else
;501:	{
line 502
;502:		self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 503
;503:		self->r.svFlags |= SVF_NOCLIENT;
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
line 504
;504:	}
LABELV $253
line 505
;505:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 507
;506:
;507:}
LABELV $251
endproc func_wall_use 4 4
export SP_func_wall
proc SP_func_wall 16 8
line 510
;508:
;509:void SP_func_wall (gentity_t *self)
;510:{
line 511
;511:	trap_SetBrushModel( self, self->model );
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
line 512
;512:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 513
;513:	VectorCopy( self->s.origin, self->s.pos.trBase );
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
line 514
;514:	VectorCopy( self->s.origin, self->r.currentOrigin );
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
line 517
;515:
;516:	// just a wall
;517:	if ((self->spawnflags & 7) == 0)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $255
line 518
;518:	{
line 519
;519:		self->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1
ASGNI4
line 520
;520:		trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 521
;521:		return;
ADDRGP4 $254
JUMPV
LABELV $255
line 525
;522:	}
;523:
;524:	// it must be TRIGGER_SPAWN
;525:	if (!(self->spawnflags & 1))
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $257
line 526
;526:	{
line 527
;527:		G_Printf("func_wall missing TRIGGER_SPAWN\n");
ADDRGP4 $259
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 528
;528:		self->spawnflags |= 1;
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
line 529
;529:	}
LABELV $257
line 532
;530:
;531:	// yell if the spawnflags are odd
;532:	if (self->spawnflags & 4)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $260
line 533
;533:	{
line 534
;534:		if (!(self->spawnflags & 2))
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $262
line 535
;535:		{
line 536
;536:			G_Printf("func_wall START_ON without TOGGLE\n");
ADDRGP4 $264
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 537
;537:			self->spawnflags |= 2;
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
line 538
;538:		}
LABELV $262
line 539
;539:	}
LABELV $260
line 541
;540:
;541:	self->use = func_wall_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 func_wall_use
ASGNP4
line 542
;542:	if (self->spawnflags & 4)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $265
line 543
;543:	{
line 544
;544:		self->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1
ASGNI4
line 545
;545:	}
ADDRGP4 $266
JUMPV
LABELV $265
line 547
;546:	else
;547:	{
line 548
;548:		self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 549
;549:		self->r.svFlags |= SVF_NOCLIENT;
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
line 550
;550:	}
LABELV $266
line 551
;551:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 552
;552:}
LABELV $254
endproc SP_func_wall 16 8
export info_vip_rescue_think
proc info_vip_rescue_think 32 8
line 564
;553:
;554:/*QUAKED info_vip_rescue (1 0 0) (-8 -8 -8) (8 8 8)
;555:If V.I.P. of the given team (0/1) is reaching this.
;556:Team will 
;557:
;558:"radius"		default 50 ( whole numbers only )
;559:"team"			team  0 seals, 1 tangos 
;560:
;561:*/
;562: 
;563:void info_vip_rescue_think( gentity_t *ent )
;564:{
line 567
;565:	 int i;
;566:
;567:	for ( i = 0; i < level.maxclients; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $268
line 568
;568:	{
line 569
;569:		gclient_t *client = &level.clients[i];
ADDRLP4 4
CNSTI4 4724
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 571
;570:
;571:		if (client->pers.connected != CON_CONNECTED)
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $273
line 572
;572:			continue;
ADDRGP4 $269
JUMPV
LABELV $273
line 574
;573:
;574:		if ( Is_OnBrushTeam( ent, &g_entities[ client - level.clients ] ) && client->ns.is_vip && ( Distance( ent->s.origin, client->ps.origin ) <= ent->splashRadius) && client->sess.waiting == qfalse)
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1092
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4724
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
EQI4 $275
ADDRLP4 4
INDIRP4
CNSTI4 2892
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $275
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
GTF4 $275
ADDRLP4 4
INDIRP4
CNSTI4 1456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $275
line 575
;575:		{
line 576
;576:			if (ent->ns_team == 0)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $277
line 577
;577:				level.done_objectives[TEAM_RED]++;
ADDRLP4 24
ADDRGP4 level+7184+4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $277
line 579
;578:			else
;579:				level.done_objectives[TEAM_BLUE]++;
ADDRLP4 28
ADDRGP4 level+7184+8
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
line 581
;580:
;581:			client->sess.waiting = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1456
ADDP4
CNSTI4 1
ASGNI4
line 582
;582:		} 
LABELV $275
line 583
;583:	}
LABELV $269
line 567
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $271
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $268
line 586
;584:
;585: 
;586:	ent->nextthink = level.time + 10; 
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 587
;587:}
LABELV $267
endproc info_vip_rescue_think 32 8
export SP_vip_rescue
proc SP_vip_rescue 12 12
line 589
;588:
;589:void SP_vip_rescue( gentity_t *self ) {   
line 592
;590:
;591:	// grab 2 variables
;592: 	G_SpawnInt( "radius", "50", &self->splashRadius );
ADDRGP4 $188
ARGP4
ADDRGP4 $225
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 593
;593:	G_SpawnInt( "team", "0", &self->ns_team );
ADDRGP4 $108
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 595
;594: 
;595:	if ( level.vipTime )
ADDRGP4 level+7232
INDIRI4
CNSTI4 0
EQI4 $285
line 596
;596:		return; 
ADDRGP4 $284
JUMPV
LABELV $285
line 598
;597:
;598:	if ( !self->splashRadius ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $288
line 599
;599:		self->splashRadius = 50;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 50
ASGNI4
line 600
;600:		G_Printf("%s at %s with no radius set! Default: 50\n", self->classname,vtos(self->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $193
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
line 601
;601:	}
LABELV $288
line 603
;602:
;603:	G_Printf("spawning vip rescue for team %s\n", TeamName(self->ns_team) );
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $290
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 604
;604:	if ( self->ns_team == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $291
line 605
;605:		level.vip[TEAM_RED] = VIP_ESCAPE;
ADDRGP4 level+7216+4
CNSTI4 1
ASGNI4
line 606
;606:	}
ADDRGP4 $292
JUMPV
LABELV $291
line 607
;607:	else if ( self->ns_team == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $295
line 608
;608:		level.vip[TEAM_BLUE] = VIP_ESCAPE;
ADDRGP4 level+7216+8
CNSTI4 1
ASGNI4
line 609
;609:	}
ADDRGP4 $296
JUMPV
LABELV $295
line 610
;610:	else if ( self->ns_team >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 2
LTI4 $299
line 611
;611:		G_Error("%s: team > 1?", self->classname );
ADDRGP4 $301
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
line 612
;612:		return;
ADDRGP4 $284
JUMPV
LABELV $299
LABELV $296
LABELV $292
line 615
;613:	}
;614:
;615:	level.num_objectives[TEAM_RED]++;
ADDRLP4 4
ADDRGP4 level+7168+4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 616
;616:	level.num_objectives[TEAM_BLUE]++;
ADDRLP4 8
ADDRGP4 level+7168+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 619
;617:
;618:	// set use stats
;619:	self->think = info_vip_rescue_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 info_vip_rescue_think
ASGNP4
line 620
;620:	self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 622
;621:
;622:	self->r.svFlags = SVF_NOCLIENT; 
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 624
;623: 
;624:} 
LABELV $284
endproc SP_vip_rescue 12 12
export model_die
proc model_die 48 12
line 630
;625:
;626:#define WOOD		1
;627:#define METAL		2
;628:#define STONE		4
;629:
;630:void model_die ( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 635
;631:	vec3_t origin; 
;632:	gentity_t *temp; 
;633:	vec3_t dir;
;634:
;635:	VectorSubtract(self->r.maxs, self->r.mins, origin);
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
line 639
;636: 
;637:	// define in : bg_public.h (oder so) bei den ganzen EV_ sachen das:
;638:	// EV_FUNCEXPLOSIVE, (ganz am ende hinzufügen , vor der - aber dann dem vorletzen ein , hintendran falls keines da ist '}')
;639:	temp = G_TempEntity( origin , EV_FUNCEXPLOSIVE );
ADDRLP4 4
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 36
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 641
;640:
;641:	VectorCopy( self->r.maxs, temp->s.origin );
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
line 642
;642:	VectorCopy( self->r.mins, temp->s.origin2 );
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
line 645
;643:	
;644:
;645:	if ( !Q_stricmp( inflictor->classname , "reallead") )
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $310
line 646
;646:	{
line 647
;647:		VectorCopy( inflictor->movedir, dir );
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRB
ASGNB 12
line 648
;648:	}
ADDRGP4 $311
JUMPV
LABELV $310
line 650
;649:	else
;650:	{
line 652
;651:		// get dir based on origins.
;652:		if ( inflictor->r.svFlags & SVF_USE_CURRENT_ORIGIN )
ADDRFP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $313
line 653
;653:		{
line 654
;654:			BG_EvaluateTrajectoryDelta( &inflictor->s.pos, level.time, dir );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 655
;655:		}
ADDRGP4 $314
JUMPV
LABELV $313
line 657
;656:		else 
;657:		{
line 658
;658:			VectorClear( dir );
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 16+8
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 44
INDIRF4
ASGNF4
line 660
;659:			//VectorSubtract (   attacker->client->ps.origin,origin,  dir);	  	
;660:		}
LABELV $314
line 661
;661:	}
LABELV $311
line 663
;662:
;663:	VectorCopy( dir, temp->s.apos.trBase );	
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 667
;664:
;665://	G_Printf("spawned func explosive @ %s\n", vtos(origin ) );
;666:
;667: 	temp->s.eventParm = self->spawnflags;
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
line 668
;668:	temp->r.svFlags |= SVF_BROADCAST;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 671
;669:
;670:	// 
;671:	temp->s.frame = self->s.number; // copy entity number so we can remove all marks from this entity.
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 672
;672:	temp->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 673
;673:	temp->s.otherEntityNum2 = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 674
;674:	temp->s.powerups = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 677
;675://	G_Printf("Temp entitity: maxs: %s mins: %s , spawnflags: %i\n", vtos(temp->s.origin ), vtos(temp->s.origin2 ), temp->s.eventParm );
;676:	//	G_FreeEntity( self ); // das ist auch nicht mehr nötig
;677:	return; // der rest ist ab jetzt client side 
LABELV $307
endproc model_die 48 12
export SP_vip_spawn
proc SP_vip_spawn 12 12
line 740
;678:	// defcon-X:
;679:#if 0
;680:	height = (int)origin[2];
;681:
;682:	if(origin[0] > origin[1]){
;683:		xpos = &origin[0];
;684:		ypos = &origin[1];
;685:
;686:		width = (int)origin[1];
;687:		miny = self->r.mins[1];
;688:
;689:		border = *xpos/step;
;690:
;691:		VectorScale(origin, 0.5, origin);
;692:		VectorAdd(self->r.mins, origin, origin);
;693:
;694:		*xpos = self->r.mins[0];
;695:	} else {
;696:		xpos = &origin[1];
;697:		ypos = &origin[0];
;698:
;699:		width = (int)origin[0];
;700:		miny = self->r.mins[0];
;701:
;702:		border = *xpos/step;
;703:
;704:		VectorScale(origin, 0.5, origin);
;705:		VectorAdd(self->r.mins, origin, origin);
;706:
;707:		*xpos = self->r.mins[1];
;708:	}	
;709:
;710:	for(i = 0; i < border; i++){
;711:		VectorClear(dir);
;712:		dir[0] = (rand() % 360) - 180;
;713:		dir[1] = (rand() % 360) - 180;
;714:
;715:		VectorNormalize( dir );
;716:
;717:		*xpos += 10;
;718:		*ypos = miny + rand()%width;
;719:		origin[2] = self->r.mins[2] + rand()%height;
;720:	
;721:		if(self->spawnflags & WOOD) {
;722://			fire_woodgib(self, origin, dir);
;723:		} else if(self->spawnflags & METAL)
;724:		//	fire_metalgib(self, origin, dir);
;725:		else{
;726:	//		fire_glassgib(self, origin, dir);
;727:	//		G_AddEvent( inflictor, EV_GENERAL_SOUND, self->sound1to2);
;728:		}
;729:	}
;730:
;731:
;732:	trap_UnlinkEntity (self);		// unlink from world
;733://	self->classname = "broken";
;734://	self->flags |= EF_BROKEN;
;735://	G_UseTargets( self, self);
;736:#endif
;737:}
;738: 
;739:
;740:void SP_vip_spawn (gentity_t *ent ) {
line 741
;741:	G_SpawnFloat("stayalive", "0", &ent->wait );
ADDRGP4 $319
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 742
;742:	G_SpawnInt("team","0",&ent->ns_team );
ADDRGP4 $108
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 744
;743:
;744:	if ( ent->wait && !level.vipTime)
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $320
ADDRGP4 level+7232
INDIRI4
CNSTI4 0
NEI4 $320
line 745
;745:	{
line 746
;746:		G_Printf("Vip has to stay alive... %i seconds\n", ent->wait );
ADDRGP4 $323
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
line 748
;747:    
;748: 		if ( ent->ns_team == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $324
line 749
;749:			level.vip[TEAM_RED] = VIP_STAYALIVE;
ADDRGP4 level+7216+4
CNSTI4 2
ASGNI4
line 750
;750:		}
ADDRGP4 $325
JUMPV
LABELV $324
line 751
;751:		else if ( ent->ns_team == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $328
line 752
;752:			level.vip[TEAM_BLUE] = VIP_STAYALIVE;
ADDRGP4 level+7216+8
CNSTI4 2
ASGNI4
line 753
;753:		}
ADDRGP4 $329
JUMPV
LABELV $328
line 754
;754:		else if ( ent->ns_team >= 2 || ent->ns_team < 0 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
GEI4 $334
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $332
LABELV $334
line 755
;755:			G_Error("%s: team > 1?", ent->classname );
ADDRGP4 $301
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
line 756
;756:			return;
ADDRGP4 $318
JUMPV
LABELV $332
LABELV $329
LABELV $325
line 759
;757:		}
;758:
;759:		level.num_objectives[TEAM_RED]++;
ADDRLP4 4
ADDRGP4 level+7168+4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 760
;760:		level.num_objectives[TEAM_BLUE]++;
ADDRLP4 8
ADDRGP4 level+7168+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 762
;761:
;762:		level.vipTime = ent->wait * ONE_SECOND;
ADDRGP4 level+7232
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 763
;763:	}
LABELV $320
line 764
;764:}
LABELV $318
endproc SP_vip_spawn 12 12
export in_assault_field
proc in_assault_field 4128 16
line 781
;765:
;766:
;767:/*QUAKED info_vip_rescue (1 0 0) (-8 -8 -8) (8 8 8)
;768:If V.I.P. of the given team (0/1) is reaching this.
;769:Team will 
;770:
;771:"radius"		default 50 ( whole numbers only )
;772:"team"			team  0 seals, 1 tangos 
;773:
;774:*/
;775:#define MAX_ASSAULT_FIELDS 64
;776:
;777:qboolean finished_assault_fields[TEAM_NUM_TEAMS][MAX_ASSAULT_FIELDS];
;778:int assault_fields[TEAM_NUM_TEAMS]; 
;779:
;780:qboolean in_assault_field( gentity_t *ent, int playerNum )
;781:{
line 787
;782:	int			 e;
;783:	gentity_t	*check; 
;784:	int			entityList[MAX_GENTITIES];
;785:	int			listedEntities; 
;786:
;787:	listedEntities = trap_EntitiesInBox( ent->r.mins, ent->r.maxs, entityList, MAX_GENTITIES );
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
line 790
;788:
;789:	// see if any solid entities are inside the final position
;790:	for ( e = 0 ; e < listedEntities ; e++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $341
line 791
;791:		check = &g_entities[ entityList[ e ] ];
ADDRLP4 0
CNSTI4 1092
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
line 794
;792:
;793:		// only check players
;794:		if ( check->s.eType != ET_PLAYER && !check->physicsObject ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $345
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
NEI4 $345
line 795
;795:			continue;
ADDRGP4 $342
JUMPV
LABELV $345
line 797
;796:		}
;797:		if ( check->s.clientNum != playerNum )
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $347
line 798
;798:			continue;
ADDRGP4 $342
JUMPV
LABELV $347
line 801
;799:
;800:		// see if the ent needs to be tested
;801:		if ( check->r.absmin[0] <= ent->r.maxs[0]
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
GTF4 $349
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
GTF4 $349
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
GTF4 $349
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
LTF4 $349
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
LTF4 $349
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
LTF4 $349
line 806
;802:		&& check->r.absmin[1] <= ent->r.maxs[1]
;803:		&& check->r.absmin[2] <= ent->r.maxs[2]
;804:		&& check->r.absmax[0] >= ent->r.mins[0]
;805:		&& check->r.absmax[1] >= ent->r.mins[1]
;806:		&& check->r.absmax[2] >= ent->r.mins[2] ) {
line 807
;807:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $340
JUMPV
LABELV $349
line 809
;808:		}  
;809:	}
LABELV $342
line 790
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $344
ADDRLP4 4
INDIRI4
ADDRLP4 4104
INDIRI4
LTI4 $341
line 810
;810:	return qfalse;
CNSTI4 0
RETI4
LABELV $340
endproc in_assault_field 4128 16
export assault_field_think
proc assault_field_think 40 8
line 814
;811:}
;812:
;813:void assault_field_think( gentity_t *ent )
;814:{
line 818
;815:	int i;
;816:	
;817:
;818:	for ( i = 0; i < level.maxclients; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $352
line 819
;819:	{
line 820
;820:		gclient_t *client = &level.clients[i];
ADDRLP4 4
CNSTI4 4724
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 821
;821:		int clientnum = g_entities[client-level.clients].s.clientNum;
ADDRLP4 8
CNSTI4 1092
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4724
DIVI4
MULI4
ADDRGP4 g_entities+168
ADDP4
INDIRI4
ASGNI4
line 823
;822:
;823:		if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $358
line 824
;824:			continue;
ADDRGP4 $353
JUMPV
LABELV $358
line 825
;825:		if (client->pers.connected != CON_CONNECTED)
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $360
line 826
;826:			continue;
ADDRGP4 $353
JUMPV
LABELV $360
line 827
;827:		if ( client->ps.stats[STAT_HEALTH] <= 0 )
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $362
line 828
;828:			continue;
ADDRGP4 $353
JUMPV
LABELV $362
line 829
;829:		if ( client->ps.eFlags & EF_WEAPONS_LOCKED) 
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $364
line 830
;830:			return;
ADDRGP4 $351
JUMPV
LABELV $364
line 833
;831: 	
;832:		// bugfix; this handle a bug if the player was in an assaultfield at the end of a round.
;833:		if ( client->sess.waiting )
ADDRLP4 4
INDIRP4
CNSTI4 1456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $366
line 834
;834:		{
line 835
;835:			if ( client->ps.pm_flags & PMF_ASSAULTRANGE ) {
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $353
line 836
;836:				client->ps.pm_flags &=~ PMF_ASSAULTRANGE;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 837
;837:				client->ps.pm_flags &=~ PMF_BLOCKED;
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
line 838
;838:				client->linkedto = -1;
ADDRLP4 4
INDIRP4
CNSTI4 4720
ADDP4
CNSTI4 -1
ASGNI4
line 840
;839:
;840:				if ( ent->ns_linkedClientsTime[ client->ps.clientNum ] > 0 )
ADDRLP4 4
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
LEI4 $370
line 841
;841:				{
line 842
;842:					if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $372
line 843
;843:						trap_SetConfigstring( CS_ASSAULT_START_TIME+ent->health, "0" );
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $105
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $372
line 846
;844:					
;845:					// send next configstring attemp
;846:					ent->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 847
;847:				}
LABELV $370
line 849
;848:
;849:				ent->ns_linkedClientsTime[ client->ps.clientNum ] = 0;
ADDRLP4 4
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
line 852
;850:			//	G_Printf("Field %i(team:%s) left by %s (because dead or left range)\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;851:				// next time send configstring
;852:			}
line 854
;853:
;854:			continue;
ADDRGP4 $353
JUMPV
LABELV $366
line 857
;855:		}
;856:
;857:		if ( !Is_OnBrushTeam( ent, &g_entities[ client-level.clients] ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1092
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4724
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $374
line 858
;858:		{
line 860
;859:			// other player is in this field , so disable all active timers.
;860:			if ( in_assault_field(ent, g_entities[client-level.clients].s.clientNum ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1092
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4724
DIVI4
MULI4
ADDRGP4 g_entities+168
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 in_assault_field
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $376
line 861
;861:			{
line 864
;862:				int a;
;863: 
;864:				for ( a = 0;  a < MAX_CLIENTS; a++ )
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $379
line 865
;865:				{
line 866
;866:					if ( ent->ns_linkedClientsTime[a] <= 0 )
ADDRLP4 20
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
GTI4 $383
line 867
;867:						continue;
ADDRGP4 $380
JUMPV
LABELV $383
line 869
;868:					//client is not a member of this field
;869:					if ( g_entities[a].client->linkedto != ent->health )
CNSTI4 1092
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 4720
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
EQI4 $385
line 870
;870:						continue;
ADDRGP4 $380
JUMPV
LABELV $385
line 872
;871:					
;872:					if ( Is_OnBrushTeam( ent, &g_entities[a] ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1092
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $388
line 873
;873:					{
line 877
;874:						// disable time for the other clients
;875:						gclient_t *cl;
;876:
;877:						ent->ns_linkedClientsTime[ a ] = 0;
ADDRLP4 20
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
line 879
;878:						
;879:						cl = &level.clients[a];
ADDRLP4 28
CNSTI4 4724
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 881
;880: 
;881:						if ( ! ( cl->ps.pm_flags & PMF_BLOCKED) ) 
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $390
line 882
;882:							cl->ps.pm_flags |= PMF_BLOCKED;  
ADDRLP4 32
ADDRLP4 28
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
LABELV $390
line 884
;883:						
;884:						if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $392
line 885
;885:							trap_SetConfigstring( CS_ASSAULT_START_TIME + ent->health, "0" );
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $105
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $392
line 887
;886:						// next time send configstring
;887:						ent->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 888
;888:					}			
LABELV $388
line 889
;889:				} 	 
LABELV $380
line 864
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 64
LTI4 $379
line 890
;890:				client->ps.pm_flags |= PMF_ASSAULTRANGE;  
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 891
;891:			}
ADDRGP4 $353
JUMPV
LABELV $376
line 893
;892:			else
;893:				client->ps.pm_flags &= ~PMF_ASSAULTRANGE;  
ADDRLP4 20
ADDRLP4 4
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
line 895
;894:
;895:			continue;
ADDRGP4 $353
JUMPV
LABELV $374
line 899
;896:		}	
;897:		
;898:		// we should be blocked.
;899:		if ( client->ps.pm_flags & PMF_BLOCKED )
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $394
line 900
;900:		{
line 902
;901:			int a;
;902:			qboolean someoneinmyfield = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 904
;903: 
;904:			for ( a = 0;  a < MAX_CLIENTS; a++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $396
line 905
;905:			{
line 908
;906:				gclient_t *cl;
;907:				
;908:				cl = &level.clients[a];
ADDRLP4 24
CNSTI4 4724
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 911
;909:
;910:				// skip client if same team, since we're looking for enemys in our field
;911:				if ( client->sess.sessionTeam == cl->sess.sessionTeam )
ADDRLP4 28
CNSTI4 1428
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
NEI4 $400
line 912
;912:					continue; 
ADDRGP4 $397
JUMPV
LABELV $400
line 915
;913:
;914:				// if there is someone in my field
;915:				if ( in_assault_field(ent, a ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 in_assault_field
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $402
line 916
;916:				{
line 917
;917:					someoneinmyfield = qtrue; 	// then it sucks nuts
ADDRLP4 20
CNSTI4 1
ASGNI4
line 918
;918:					break;
ADDRGP4 $398
JUMPV
LABELV $402
line 920
;919:				}
;920:			} 
LABELV $397
line 904
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 64
LTI4 $396
LABELV $398
line 922
;921:
;922:			if ( someoneinmyfield )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $404
line 923
;923:				continue;
ADDRGP4 $353
JUMPV
LABELV $404
line 925
;924:
;925:			client->ps.pm_flags &= ~PMF_BLOCKED;
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 926
;926:		}
LABELV $394
line 928
;927:		// first time activated
;928:		if ( ent->ns_linkedClientsTime[ clientnum ] <= 0 && in_assault_field(ent, g_entities[client-level.clients].s.clientNum ) )
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 832
ADDP4
ADDP4
INDIRI4
CNSTI4 0
GTI4 $406
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 1092
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4724
DIVI4
MULI4
ADDRGP4 g_entities+168
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 in_assault_field
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $406
line 929
;929:		{
line 933
;930:		//	G_Printf("Field %i[%s](team:%s) tapped by %s\n", ent->health , ent->ns_brushname, TeamName( client->sess.sessionTeam ), client->pers.netname );
;931:
;932:			// set assault flag for client hud
;933:			client->ps.pm_flags |= PMF_ASSAULTRANGE;  
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 934
;934:			client->linkedto = ent->health;
ADDRLP4 4
INDIRP4
CNSTI4 4720
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 935
;935:			ent->ns_linkedClientsTime[ clientnum ] = level.time + ent->wait * ONE_SECOND;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 832
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 28
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 936
;936:		}
LABELV $406
line 937
;937:		if ( !(client->ps.pm_flags & PMF_ASSAULTRANGE) )
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
NEI4 $410
line 938
;938:			continue;
ADDRGP4 $353
JUMPV
LABELV $410
line 940
;939:
;940:		if ( client->linkedto != ent->health )
ADDRLP4 4
INDIRP4
CNSTI4 4720
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
EQI4 $412
line 941
;941:			continue;
ADDRGP4 $353
JUMPV
LABELV $412
line 944
;942:
;943:		// if player died and had assaultrange setted:
;944:		if ( client->ps.stats[STAT_HEALTH] <= 0 || !in_assault_field(ent, g_entities[client-level.clients].s.clientNum )  )
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $417
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1092
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4724
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
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $414
LABELV $417
line 945
;945:		{	// reset time and disable client 
line 946
;946:			if ( client->ps.pm_flags & PMF_ASSAULTRANGE ) {
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $353
line 947
;947:				client->ps.pm_flags &=~ PMF_ASSAULTRANGE;
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
CNSTI4 -32769
BANDI4
ASGNI4
line 948
;948:				client->linkedto = -1;
ADDRLP4 4
INDIRP4
CNSTI4 4720
ADDP4
CNSTI4 -1
ASGNI4
line 949
;949:				ent->ns_linkedClientsTime[ client->ps.clientNum ] = 0;
ADDRLP4 4
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
line 951
;950:			//	G_Printf("Field %i(team:%s) left by %s (because dead or left range)\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;951:				if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $420
line 952
;952:				trap_SetConfigstring( CS_ASSAULT_START_TIME+ent->health, "0" );
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $105
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $420
line 954
;953:				// next time send configstring
;954:				ent->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 955
;955:			}
line 956
;956:			continue;
ADDRGP4 $353
JUMPV
LABELV $414
line 960
;957:		} 
;958:
;959:		// another one was also waiting in the field. active HIS time
;960:		if ( ent->fly_sound_debounce_time )
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 0
EQI4 $422
line 961
;961:		{
line 962
;962:			if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $424
line 963
;963:				trap_SetConfigstring( CS_ASSAULT_START_TIME + ent->health , va("%i",ent->ns_linkedClientsTime[ client->ps.clientNum ]) );
ADDRGP4 $426
ARGP4
ADDRLP4 4
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
ADDRLP4 32
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
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $424
line 964
;964:			ent->fly_sound_debounce_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 965
;965:		}
LABELV $422
line 967
;966:		// broke all limits
;967:		if ( level.time > ent->ns_linkedClientsTime[ clientnum ] )
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDP4
INDIRI4
LEI4 $427
line 968
;968:		{
line 969
;969:			if ( ent->count == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
NEI4 $430
line 970
;970:			{
line 972
;971:				int a;
;972:				int tapped = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 974
;973:
;974:				finished_assault_fields[client->sess.sessionTeam][ent->health] = qtrue;				
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 finished_assault_fields
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 977
;975:
;976:				// check if all fields have been tapped
;977:				for ( a = 0; a < level.fields[ client->sess.sessionTeam ]; a++ )
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $435
JUMPV
LABELV $432
line 978
;978:				{
line 979
;979:					if (finished_assault_fields[client->sess.sessionTeam][a] )
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 finished_assault_fields
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $437
line 980
;980:						tapped++;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $437
line 981
;981:				}
LABELV $433
line 977
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $435
ADDRLP4 32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7240
ADDP4
INDIRI4
LTI4 $432
line 983
;982:				
;983:				if ( tapped == level.fields[ client->sess.sessionTeam ] )
ADDRLP4 36
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7240
ADDP4
INDIRI4
NEI4 $431
line 984
;984:				{
line 985
;985:					for ( a = 0; a < level.fields [ client->sess.sessionTeam ]; a++ )
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $445
JUMPV
LABELV $442
line 986
;986:					{
line 988
;987:						// set state of the field to untapped
;988:						finished_assault_fields[ client->sess.sessionTeam ][ ent->health ] = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRGP4 finished_assault_fields
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 989
;989:					}
LABELV $443
line 985
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $445
ADDRLP4 32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7240
ADDP4
INDIRI4
LTI4 $442
line 991
;990:			 	//	G_Printf("Team-Fields %i(team:%s) all finished by %s\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;991:					G_UseTargets (ent, &g_entities[ client - level.clients ] );			
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1092
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4724
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 992
;992:				}
line 994
;993:				else
;994:				{
line 996
;995:				//	G_Printf("Team-Fields %i(team:%s) tapped by %s\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;996:				}
line 997
;997:			}
ADDRGP4 $431
JUMPV
LABELV $430
line 999
;998:			else
;999:			{
line 1002
;1000:			//	G_Printf("Field %i(team:%s) captured by %s\n", ent->health , TeamName( client->sess.sessionTeam ), client->pers.netname );
;1001:				// mark one objective as done
;1002:				level.done_objectives [ client->sess.sessionTeam ]++;
ADDRLP4 32
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7184
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1004
;1003:			//	G_UseTargets (ent, &g_entities[ client - level.clients ] );			
;1004:			}
LABELV $431
line 1006
;1005:			// disable timer
;1006:			if ( ent->health < 4 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 4
GEI4 $448
line 1007
;1007:				trap_SetConfigstring( CS_ASSAULT_START_TIME + ent->health, "0" );
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 $105
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $448
line 1008
;1008:			client->ps.pm_flags &=~ PMF_ASSAULTRANGE;
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
CNSTI4 -32769
BANDI4
ASGNI4
line 1009
;1009:			client->ns.rewards |= ( 1 << REWARD_ASSAULT_TAKEN );
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 2888
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1010
;1010:			client->linkedto = -1;
ADDRLP4 4
INDIRP4
CNSTI4 4720
ADDP4
CNSTI4 -1
ASGNI4
line 1011
;1011:			ent->ns_linkedClientsTime[ client->ps.clientNum ] = 0;
ADDRLP4 4
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
line 1014
;1012:
;1013:			// disable this entity
;1014:			ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 1015
;1015:			trap_UnlinkEntity(ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1016
;1016:			return;
ADDRGP4 $351
JUMPV
LABELV $427
line 1018
;1017:		}
;1018:	} 
LABELV $353
line 818
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $355
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $352
line 1020
;1019:
;1020:	ent->think = assault_field_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 assault_field_think
ASGNP4
line 1021
;1021:	ent->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1023
;1022:
;1023:} 
LABELV $351
endproc assault_field_think 40 8
export num_assaultfields_for_team
proc num_assaultfields_for_team 16 8
line 1028
;1024: 
;1025:void InitTrigger ( gentity_t *self );
;1026:
;1027:int num_assaultfields_for_team( int team )
;1028:{
line 1031
;1029:	int			i;
;1030:	gentity_t	*ent;
;1031:	int			num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1033
;1032: 
;1033:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1034
;1034:	for (i=0 ; i<level.num_entities ; i++, ent++) { 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $455
JUMPV
LABELV $452
line 1036
;1035:
;1036:		if (!Q_stricmp("trigger_assaultfield", ent->classname))
ADDRGP4 $459
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
NEI4 $453
line 1037
;1037:		{
line 1038
;1038:			if (ent->ns_team == BRUSH_TEAM_RED && team == TEAM_RED)
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $460
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $460
line 1039
;1039:				num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $458
JUMPV
LABELV $460
line 1040
;1040:			else if (ent->ns_team == BRUSH_TEAM_BLUE && team == TEAM_BLUE)
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $458
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $458
line 1041
;1041:				num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1042
;1042:		}
line 1044
;1043:		else
;1044:			continue;
LABELV $458
line 1045
;1045:	}
LABELV $453
line 1034
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1092
ADDP4
ASGNP4
LABELV $455
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $452
line 1046
;1046:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $451
endproc num_assaultfields_for_team 16 8
export SP_assault_field
proc SP_assault_field 16 12
line 1049
;1047:}
;1048:void SP_assault_field( gentity_t *self ) 
;1049:{   
line 1050
;1050:	int all = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1054
;1051: 		char	*s;
;1052:
;1053:	// grab variables
;1054:	G_SpawnInt( "all", "0", &all);
ADDRGP4 $465
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1055
;1055:	G_SpawnInt( "radius", "15", &self->splashRadius );
ADDRGP4 $188
ARGP4
ADDRGP4 $466
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1056
;1056:	G_SpawnString( "fieldname", "unknown", &s  );
ADDRGP4 $467
ARGP4
ADDRGP4 $468
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1057
;1057: 	G_SpawnFloat( "time", "10", &self->wait );
ADDRGP4 $110
ARGP4
ADDRGP4 $469
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1058
;1058:	G_SpawnInt( "team", "0", &self->ns_team );
ADDRGP4 $108
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1063
;1059:  
;1060:
;1061://	G_Printf("spawning assault field for team %s\n", TeamName(self->ns_team) );
;1062:
;1063:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 1065
;1064: 
;1065: 	if ( all )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $470
line 1066
;1066:		self->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $471
JUMPV
LABELV $470
line 1068
;1067:	else
;1068:	{
line 1069
;1069:		self->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 1072
;1070:
;1071:		// setup an objective
;1072:		if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $472
line 1073
;1073:			level.num_objectives[TEAM_RED]++;
ADDRLP4 8
ADDRGP4 level+7168+4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $473
JUMPV
LABELV $472
line 1074
;1074:		else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $476
line 1075
;1075:			level.num_objectives[TEAM_BLUE]++;
ADDRLP4 12
ADDRGP4 level+7168+8
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $476
LABELV $473
line 1076
;1076:	}
LABELV $471
line 1079
;1077:
;1078:	
;1079:	self->ns_brushname = s ;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1082
;1080:
;1081:	// set use stats
;1082:	self->think = assault_field_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 assault_field_think
ASGNP4
line 1083
;1083:	self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1086
;1084:
;1085:	// num field
;1086:	if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $481
line 1087
;1087:		self->health = level.fields[TEAM_RED];
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 level+7240+4
INDIRI4
ASGNI4
ADDRGP4 $482
JUMPV
LABELV $481
line 1088
;1088:	else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $485
line 1089
;1089:		self->health = level.fields[TEAM_BLUE];
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 level+7240+8
INDIRI4
ASGNI4
LABELV $485
LABELV $482
line 1091
;1090:
;1091:	if ( self->ns_team == BRUSH_TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $489
line 1092
;1092:	{
line 1093
;1093:		level.fields[TEAM_RED]++; 
ADDRLP4 8
ADDRGP4 level+7240+4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1094
;1094:	}
ADDRGP4 $490
JUMPV
LABELV $489
line 1095
;1095:	else if ( self->ns_team == BRUSH_TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
NEI4 $493
line 1096
;1096:		level.fields[TEAM_BLUE]++;
ADDRLP4 8
ADDRGP4 level+7240+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $494
JUMPV
LABELV $493
line 1098
;1097:	else
;1098:		G_Error("Wrong Team for %s\n", self->classname );
ADDRGP4 $497
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
LABELV $494
LABELV $490
line 1100
;1099:
;1100:	if ( level.fields[TEAM_RED] >= MAX_ASSAULT_FIELDS || level.fields[TEAM_BLUE] >= MAX_ASSAULT_FIELDS )
ADDRLP4 12
CNSTI4 64
ASGNI4
ADDRGP4 level+7240+4
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $504
ADDRGP4 level+7240+8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $498
LABELV $504
line 1101
;1101:		G_Error("Reached Max_Fields.\n");
ADDRGP4 $505
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $498
line 1103
;1102:
;1103:	for ( all = 0;  all < MAX_CLIENTS; all++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $506
line 1104
;1104:	{
line 1105
;1105:		self->ns_linkedClientsTime[all] = 0;
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
line 1106
;1106:	}
LABELV $507
line 1103
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $506
line 1108
;1107:	// send configstring next time
;1108:	self->fly_sound_debounce_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 1109
;1109: 	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1110
;1110:} 
LABELV $464
endproc SP_assault_field 16 12
export NS_SpawnFlare
proc NS_SpawnFlare 0 12
line 1118
;1111:
;1112: /*
;1113:=================
;1114:SpawnFlare
;1115:
;1116:=================
;1117:*/
;1118:void NS_SpawnFlare ( gentity_t *self ) { 
line 1121
;1119: 
;1120:	// grab variables
;1121:	G_SpawnInt( "size", "15", &self->s.frame );
ADDRGP4 $511
ARGP4
ADDRGP4 $466
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1125
;1122:
;1123://	G_Printf("spawning flare\n" );
;1124: 
;1125:	self->s.eType = ET_FLARE; 
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 1126
;1126:  	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1128
;1127:
;1128:}
LABELV $510
endproc NS_SpawnFlare 0 12
export fun_goal_use
proc fun_goal_use 0 4
line 1146
;1129:
;1130: /*
;1131:==============================================================================
;1132:
;1133:goal
;1134:
;1135:==============================================================================
;1136:*/
;1137:
;1138:/*QUAKED trigger_fun_goal (.5 .5 .5)
;1139:When the ball enters this field it will  add one point to the 
;1140:defined team.
;1141:
;1142:"team"			default 0 (seals 0/tangos 1)
;1143:"message"		message displayed when hit
;1144:
;1145:*/
;1146:void fun_goal_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 1147
;1147:	if ( self->r.linked ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $513
line 1148
;1148:		trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1149
;1149:	} else {
ADDRGP4 $514
JUMPV
LABELV $513
line 1150
;1150:		trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1151
;1151:	}
LABELV $514
line 1152
;1152:}
LABELV $512
endproc fun_goal_use 0 4
export fun_goal_touch
proc fun_goal_touch 4 8
line 1156
;1153:
;1154:qboolean IS_Ball( gentity_t *ent );
;1155:
;1156:void fun_goal_touch( gentity_t *self, gentity_t *other, trace_t *trace ) { 
line 1158
;1157:
;1158:	if ( !IS_Ball(other) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 IS_Ball
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $516
line 1159
;1159:		if ( other->client )
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $515
line 1160
;1160:		{
line 1161
;1161:			trap_SendServerCommand( other->s.clientNum, "cp \"yeah, right.\nthis is the goal!kick the ball in here\n\"");
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRGP4 $520
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1162
;1162:		}
line 1163
;1163:		return;
ADDRGP4 $515
JUMPV
LABELV $516
line 1167
;1164:	}
;1165: 
;1166:	// end round.
;1167:	if ( self->ns_team == 0 )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $521
line 1168
;1168:		NS_EndRoundForTeam( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 NS_EndRoundForTeam
CALLV
pop
ADDRGP4 $522
JUMPV
LABELV $521
line 1170
;1169:	else
;1170:		NS_EndRoundForTeam( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 NS_EndRoundForTeam
CALLV
pop
LABELV $522
line 1172
;1171:
;1172:	if (self->message)
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
line 1173
;1173:		CenterPrintAll( self->message );
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRGP4 CenterPrintAll
CALLV
pop
ADDRGP4 $524
JUMPV
LABELV $523
line 1175
;1174:	else
;1175:		CenterPrintAll( "G-O-A-L\n");
ADDRGP4 $525
ARGP4
ADDRGP4 CenterPrintAll
CALLV
pop
LABELV $524
line 1177
;1176:
;1177:	trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1178
;1178:}
LABELV $515
endproc fun_goal_touch 4 8
export SP_trigger_fun_goal
proc SP_trigger_fun_goal 0 12
line 1180
;1179:
;1180:void SP_trigger_fun_goal( gentity_t *self ) {
line 1181
;1181:	G_SpawnInt( "team", "0", &self->ns_team );
ADDRGP4 $108
ARGP4
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1183
;1182:
;1183:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 1185
;1184: 
;1185:	self->touch = fun_goal_touch; 
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 fun_goal_touch
ASGNP4
line 1186
;1186:	self->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 1187
;1187: 	self->use = fun_goal_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 fun_goal_use
ASGNP4
line 1188
;1188:	self->classname = "fun_goal";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $527
ASGNP4
line 1190
;1189:   
;1190:	trap_LinkEntity (self); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1191
;1191:}
LABELV $526
endproc SP_trigger_fun_goal 0 12
export SP_fun_ball_spawn
proc SP_fun_ball_spawn 28 12
line 1199
;1192:
;1193:/*QUAKED fun_ball_spawn (1 0 0) (-8 -8 -8) (8 8 8)
;1194:A ball will spawn here. 
;1195:
;1196:*/
;1197:
;1198:gentity_t *fire_ball(gentity_t *self, vec3_t start, vec3_t dir );
;1199:void SP_fun_ball_spawn (gentity_t *ent ) { 
line 1203
;1200:	vec3_t dir;
;1201:	gentity_t *ball;
;1202:
;1203:	dir[0] = dir[1] = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1204
;1204:	dir[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1206
;1205:
;1206:	ball = fire_ball(ent, ent->s.origin, dir );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 fire_ball
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 1207
;1207:}
LABELV $528
endproc SP_fun_ball_spawn 28 12
import fire_ball
import IS_Ball
import InitTrigger
bss
export assault_fields
align 4
LABELV assault_fields
skip 16
export finished_assault_fields
align 4
LABELV finished_assault_fields
skip 1024
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
import g_shotgunleedvelocity
import g_leedvelocity
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
import g_quadfactor
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
import Weapon_C4
import RadioBroadcast
import Cmd_Radio_power_f
import Cmd_Radioteam_f
import RadioThink
import PrecacheRadioSounds
import female_radio_msgs
import male_radio_msgs
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
import is_func_explosive
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
import NS_CalculateStartingXP
import NS_RaiseCharacterLevel
import NS_PlayerInventory
import Pick_Item
import NS_BackupWeaponAim
import NS_KillMenu
import NS_CorrectWeaponAim
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
import BG_GotSecondary
import NS_IsVipAlive
import NS_GotPowerup
import NS_IsBot
import Is_Spectator
import lastvip
import GameState
import NS_CalcDamageOnRange
import NS_BulletHoleTypeForSurface
import NS_GotWounds
import BG_GetMaxRoundForWeapon
import NS_GetRounds
import NS_CheckLocationDamage
import NS_MaximumWeaponRange
import NS_GetAccuracy
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
import BG_IsShotgun
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
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
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
LABELV $527
byte 1 102
byte 1 117
byte 1 110
byte 1 95
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $525
byte 1 71
byte 1 45
byte 1 79
byte 1 45
byte 1 65
byte 1 45
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $520
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 121
byte 1 101
byte 1 97
byte 1 104
byte 1 44
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $511
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $505
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
LABELV $497
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
LABELV $469
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $468
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $467
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
LABELV $466
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $465
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $459
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
LABELV $426
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $323
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
LABELV $319
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
LABELV $312
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
LABELV $301
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
LABELV $290
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
LABELV $264
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
LABELV $259
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
LABELV $238
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $227
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $226
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
LABELV $225
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $199
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
LABELV $196
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
LABELV $193
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
LABELV $190
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $189
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $188
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $167
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
LABELV $164
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $163
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $140
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 111
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
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $139
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
LABELV $118
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 58
byte 1 32
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
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 44
byte 1 32
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $111
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $110
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $109
byte 1 50
byte 1 0
align 1
LABELV $108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $107
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $106
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $105
byte 1 48
byte 1 0
align 1
LABELV $104
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $90
byte 1 69
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
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
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 46
byte 1 0
