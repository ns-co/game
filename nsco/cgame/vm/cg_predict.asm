export CG_BuildSolidList
code
proc CG_BuildSolidList 28 0
file "../cg_predict.c"
line 33
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_predict.c -- this file generates cg.predictedPlayerState by either
;4:// interpolating between snapshots from the server or locally predicting
;5:// ahead the client's movement.
;6:// It also handles local physics interaction, like fragments bouncing off walls
;7:
;8:// every line of code that differs from the quake3:arena SDK
;9:// is property of manfred nerurkar
;10:// no commercial explotation allowed
;11:// you are only allowed to use this code in navy seals: covert operations 
;12:// a quake3 arena modifiation
;13:// defcon-x@ns-co.net
;14:
;15:#include "cg_local.h"
;16:
;17:static	pmove_t		cg_pmove;
;18:
;19:static	int			cg_numSolidEntities;
;20:static	centity_t	*cg_solidEntities[MAX_ENTITIES_IN_SNAPSHOT];
;21:static	int			cg_numTriggerEntities;
;22:static	centity_t	*cg_triggerEntities[MAX_ENTITIES_IN_SNAPSHOT];
;23:
;24:/*
;25:====================
;26:CG_BuildSolidList
;27:
;28:When a new cg.snap has been set, this function builds a sublist
;29:of the entities that are actually solid, to make for more
;30:efficient collision detection
;31:====================
;32:*/
;33:void CG_BuildSolidList( void ) {
line 39
;34:	int			i;
;35:	centity_t	*cent;
;36:	snapshot_t	*snap;
;37:	entityState_t	*ent;
;38:
;39:	cg_numSolidEntities = 0;
ADDRGP4 cg_numSolidEntities
CNSTI4 0
ASGNI4
line 40
;40:	cg_numTriggerEntities = 0;
ADDRGP4 cg_numTriggerEntities
CNSTI4 0
ASGNI4
line 42
;41:
;42:	if ( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $85
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 cg+107596
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $85
ADDRGP4 cg+107592
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $85
line 43
;43:		snap = cg.nextSnap;
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 44
;44:	} else {
ADDRGP4 $86
JUMPV
LABELV $85
line 45
;45:		snap = cg.snap;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 46
;46:	}
LABELV $86
line 48
;47:
;48:	for ( i = 0 ; i < snap->numEntities ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $92
line 49
;49:		cent = &cg_entities[ snap->entities[ i ].number ];
ADDRLP4 0
CNSTI4 728
CNSTI4 208
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 50
;50:		ent = &cent->currentState;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 52
;51:
;52:		if ( ent->eType == ET_ITEM || ent->eType == ET_PUSH_TRIGGER || ent->eType == ET_TELEPORT_TRIGGER ) {
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $99
ADDRLP4 20
INDIRI4
CNSTI4 8
EQI4 $99
ADDRLP4 20
INDIRI4
CNSTI4 9
NEI4 $96
LABELV $99
line 53
;53:			cg_triggerEntities[cg_numTriggerEntities] = cent;
ADDRGP4 cg_numTriggerEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 54
;54:			cg_numTriggerEntities++;
ADDRLP4 24
ADDRGP4 cg_numTriggerEntities
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 55
;55:			continue;
ADDRGP4 $93
JUMPV
LABELV $96
line 58
;56:		}
;57:
;58:		if ( cent->nextState.solid ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $100
line 59
;59:			cg_solidEntities[cg_numSolidEntities] = cent;
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 60
;60:			cg_numSolidEntities++;
ADDRLP4 24
ADDRGP4 cg_numSolidEntities
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 61
;61:			continue;
LABELV $100
line 63
;62:		}
;63:	}
LABELV $93
line 48
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $92
line 64
;64:}
LABELV $84
endproc CG_BuildSolidList 28 0
proc CG_ClipMoveToEntities 144 36
line 73
;65:
;66:/*
;67:====================
;68:CG_ClipMoveToEntities
;69:
;70:====================
;71:*/
;72:static void CG_ClipMoveToEntities ( const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end,
;73:							int skipNumber, int mask, trace_t *tr ) {
line 82
;74:	int			i, x, zd, zu;
;75:	trace_t		trace;
;76:	entityState_t	*ent;
;77:	clipHandle_t 	cmodel;
;78:	vec3_t		bmins, bmaxs;
;79:	vec3_t		origin, angles;
;80:	centity_t	*cent;
;81:
;82:	for ( i = 0 ; i < cg_numSolidEntities ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $103
line 83
;83:		cent = cg_solidEntities[ i ];
ADDRLP4 60
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 84
;84:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 86
;85:
;86:		if ( ent->number == skipNumber ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 16
INDIRI4
NEI4 $107
line 87
;87:			continue;
ADDRGP4 $104
JUMPV
LABELV $107
line 90
;88:		}
;89:
;90:		if ( ent->solid == SOLID_BMODEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $109
line 92
;91:			// special value for bmodel
;92:			cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 132
INDIRI4
ASGNI4
line 93
;93:			VectorCopy( cent->lerpAngles, angles );
ADDRLP4 108
ADDRLP4 60
INDIRP4
CNSTI4 712
ADDP4
INDIRB
ASGNB 12
line 94
;94:			BG_EvaluateTrajectory( &cent->currentState.pos, cg.physicsTime, origin );
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 95
;95:		} else {
ADDRGP4 $110
JUMPV
LABELV $109
line 97
;96:			// encoded bbox
;97:			x = (ent->solid & 255);
ADDRLP4 120
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 98
;98:			zd = ((ent->solid>>8) & 255);
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 99
;99:			zu = ((ent->solid>>16) & 255) - 32;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CNSTI4 32
SUBI4
ASGNI4
line 101
;100:
;101:			bmins[0] = bmins[1] = -x;
ADDRLP4 132
ADDRLP4 120
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 72+4
ADDRLP4 132
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 132
INDIRF4
ASGNF4
line 102
;102:			bmaxs[0] = bmaxs[1] = x;
ADDRLP4 136
ADDRLP4 120
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84+4
ADDRLP4 136
INDIRF4
ASGNF4
ADDRLP4 84
ADDRLP4 136
INDIRF4
ASGNF4
line 103
;103:			bmins[2] = -zd;
ADDRLP4 72+8
ADDRLP4 124
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 104
;104:			bmaxs[2] = zu;
ADDRLP4 84+8
ADDRLP4 128
INDIRI4
CVIF4 4
ASGNF4
line 106
;105:
;106:			cmodel = trap_CM_TempBoxModel( bmins, bmaxs );
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 140
ADDRGP4 trap_CM_TempBoxModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 140
INDIRI4
ASGNI4
line 107
;107:			VectorCopy( vec3_origin, angles );
ADDRLP4 108
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 108
;108:			VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 96
ADDRLP4 60
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 109
;109:		}
LABELV $110
line 112
;110:
;111:
;112:		trap_CM_TransformedBoxTrace ( &trace, start, end,
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 trap_CM_TransformedBoxTrace
CALLV
pop
line 115
;113:			mins, maxs, cmodel,  mask, origin, angles);
;114:
;115:		if (trace.allsolid || trace.fraction < tr->fraction) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $119
ADDRLP4 4+8
INDIRF4
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GEF4 $116
LABELV $119
line 116
;116:			trace.entityNum = ent->number;
ADDRLP4 4+52
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 117
;117:			*tr = trace;
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 56
line 118
;118:		} else if (trace.startsolid) {
ADDRGP4 $117
JUMPV
LABELV $116
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $121
line 119
;119:			tr->startsolid = qtrue;
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 120
;120:		}
LABELV $121
LABELV $117
line 121
;121:		if ( tr->allsolid ) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $124
line 122
;122:			return;
ADDRGP4 $102
JUMPV
LABELV $124
line 124
;123:		}
;124:	}
LABELV $104
line 82
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $106
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $103
line 125
;125:}
LABELV $102
endproc CG_ClipMoveToEntities 144 36
export CG_Trace
proc CG_Trace 60 28
line 133
;126:
;127:/*
;128:================
;129:CG_Trace
;130:================
;131:*/
;132:void	CG_Trace( trace_t *result, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, 
;133:					 int skipNumber, int mask ) {
line 136
;134:	trace_t	t;
;135:
;136:	trap_CM_BoxTrace ( &t, start, end, mins, maxs, 0, mask);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 137
;137:	t.entityNum = t.fraction != 1.0 ? ENTITYNUM_WORLD : ENTITYNUM_NONE;
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $130
ADDRLP4 56
CNSTI4 1022
ASGNI4
ADDRGP4 $131
JUMPV
LABELV $130
ADDRLP4 56
CNSTI4 1023
ASGNI4
LABELV $131
ADDRLP4 0+52
ADDRLP4 56
INDIRI4
ASGNI4
line 139
;138:	// check all other solid models
;139:	CG_ClipMoveToEntities (start, mins, maxs, end, skipNumber, mask, &t);
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
ADDRLP4 0
ARGP4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
line 141
;140:
;141:	*result = t;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 56
line 142
;142:}
LABELV $126
endproc CG_Trace 60 28
export CG_PointContents
proc CG_PointContents 36 16
line 149
;143:
;144:/*
;145:================
;146:CG_PointContents
;147:================
;148:*/
;149:int		CG_PointContents( const vec3_t point, int passEntityNum ) {
line 156
;150:	int			i;
;151:	entityState_t	*ent;
;152:	centity_t	*cent;
;153:	clipHandle_t cmodel;
;154:	int			contents;
;155:
;156:	contents = trap_CM_PointContents (point, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 158
;157:
;158:	for ( i = 0 ; i < cg_numSolidEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $133
line 159
;159:		cent = cg_solidEntities[ i ];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 161
;160:
;161:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 163
;162:
;163:		if ( ent->number == passEntityNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $137
line 164
;164:			continue;
ADDRGP4 $134
JUMPV
LABELV $137
line 167
;165:		}
;166:
;167:		if (ent->solid != SOLID_BMODEL) { // special value for bmodel
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $139
line 168
;168:			continue;
ADDRGP4 $134
JUMPV
LABELV $139
line 171
;169:		}
;170:
;171:		cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 172
;172:		if ( !cmodel ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $141
line 173
;173:			continue;
ADDRGP4 $134
JUMPV
LABELV $141
line 176
;174:		}
;175:
;176:		contents |= trap_CM_TransformedPointContents( point, cmodel, ent->origin, ent->angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_CM_TransformedPointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 177
;177:	}
LABELV $134
line 158
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $136
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $133
line 179
;178:
;179:	return contents;
ADDRLP4 16
INDIRI4
RETI4
LABELV $132
endproc CG_PointContents 36 16
proc CG_InterpolatePlayerState 64 12
line 191
;180:}
;181:
;182:
;183:/*
;184:========================
;185:CG_InterpolatePlayerState
;186:
;187:Generates cg.predictedPlayerState by interpolating between
;188:cg.snap->player_state and cg.nextFrame->player_state
;189:========================
;190:*/
;191:static void CG_InterpolatePlayerState( qboolean grabAngles ) {
line 197
;192:	float			f;
;193:	int				i;
;194:	playerState_t	*out;
;195:	snapshot_t		*prev, *next;
;196:
;197:	out = &cg.predictedPlayerState;
ADDRLP4 12
ADDRGP4 cg+107636
ASGNP4
line 198
;198:	prev = cg.snap;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 199
;199:	next = cg.nextSnap;
ADDRLP4 8
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 201
;200:
;201:	*out = cg.snap->ps;
ADDRLP4 12
INDIRP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 204
;202:
;203:	// if we are still allowing local input, short circuit the view angles
;204:	if ( grabAngles ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $148
line 208
;205:		usercmd_t	cmd;
;206:		int			cmdNum;
;207:
;208:		cmdNum = trap_GetCurrentCmdNumber();
ADDRLP4 48
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 209
;209:		trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 211
;210:
;211:		PM_UpdateViewAngles( out, &cmd );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 212
;212:	}
LABELV $148
line 215
;213:
;214:	// if the next frame is a teleport, we can't lerp to it
;215:	if ( cg.nextFrameTeleport ) {
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
EQI4 $150
line 216
;216:		return;
ADDRGP4 $143
JUMPV
LABELV $150
line 219
;217:	}
;218:
;219:	if ( !next || next->serverTime <= prev->serverTime ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $155
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
GTI4 $153
LABELV $155
line 220
;220:		return;
ADDRGP4 $143
JUMPV
LABELV $153
line 223
;221:	}
;222:
;223:	f = (float)( cg.time - prev->serverTime ) / ( next->serverTime - prev->serverTime );
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 225
;224:
;225:	i = next->ps.bobCycle;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 226
;226:	if ( i < prev->ps.bobCycle ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
GEI4 $157
line 227
;227:		i += 256;		// handle wraparound
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ASGNI4
line 228
;228:	}
LABELV $157
line 229
;229:	out->bobCycle = prev->ps.bobCycle + f * ( i - prev->ps.bobCycle );
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 231
;230:
;231:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $159
line 232
;232:		out->origin[i] = prev->ps.origin[i] + f * (next->ps.origin[i] - prev->ps.origin[i] );
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 44
CNSTI4 64
ASGNI4
ADDRLP4 48
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRLP4 48
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 40
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 233
;233:		if ( !grabAngles ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $163
line 234
;234:			out->viewangles[i] = LerpAngle( 
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
CNSTI4 196
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 52
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
line 236
;235:				prev->ps.viewangles[i], next->ps.viewangles[i], f );
;236:		}
LABELV $163
line 237
;237:		out->velocity[i] = prev->ps.velocity[i] + 
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
CNSTI4 76
ASGNI4
ADDRLP4 60
ADDRLP4 52
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 52
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 239
;238:			f * (next->ps.velocity[i] - prev->ps.velocity[i] );
;239:	}
LABELV $160
line 231
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $159
line 241
;240:
;241:}
LABELV $143
endproc CG_InterpolatePlayerState 64 12
proc CG_TouchTriggerPrediction 88 28
line 250
;242: 
;243:/*
;244:=========================
;245:CG_TouchTriggerPrediction
;246:
;247:Predict push triggers and items
;248:=========================
;249:*/
;250:static void CG_TouchTriggerPrediction( void ) {
line 259
;251:	int			i;
;252:	trace_t		trace;
;253:	entityState_t	*ent;
;254:	clipHandle_t cmodel;
;255:	centity_t	*cent;
;256:	qboolean	spectator;
;257:
;258:	// dead clients don't activate triggers
;259:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $166
line 260
;260:		return;
ADDRGP4 $165
JUMPV
LABELV $166
line 263
;261:	}
;262:
;263:	spectator = ( cg.predictedPlayerState.pm_type == PM_SPECTATOR );
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $173
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $173
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $174
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 265
;264:
;265:	if ( cg.predictedPlayerState.pm_type != PM_NORMAL && !spectator ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 cg+107636+4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $175
ADDRLP4 72
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $175
line 266
;266:		return;
ADDRGP4 $165
JUMPV
LABELV $175
line 269
;267:	}
;268:
;269:	for ( i = 0 ; i < cg_numTriggerEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $182
JUMPV
LABELV $179
line 270
;270:		cent = cg_triggerEntities[ i ];
ADDRLP4 68
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
INDIRP4
ASGNP4
line 271
;271:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 278
;272:
;273:	/*	if ( ent->eType == ET_ITEM && !spectator ) {
;274:			CG_TouchItem( cent );
;275:			continue;
;276:		}*/
;277:
;278:		if ( ent->solid != SOLID_BMODEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $183
line 279
;279:			continue;
ADDRGP4 $180
JUMPV
LABELV $183
line 282
;280:		}
;281:
;282:		cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
ASGNI4
line 283
;283:		if ( !cmodel ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $185
line 284
;284:			continue;
ADDRGP4 $180
JUMPV
LABELV $185
line 287
;285:		}
;286:
;287:		trap_CM_BoxTrace( &trace, cg.predictedPlayerState.origin, cg.predictedPlayerState.origin, 
ADDRLP4 12
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg_pmove+180
ARGP4
ADDRGP4 cg_pmove+192
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 290
;288:			cg_pmove.mins, cg_pmove.maxs, cmodel, -1 );
;289:
;290:		if ( !trace.startsolid ) {
ADDRLP4 12+4
INDIRI4
CNSTI4 0
NEI4 $193
line 291
;291:			continue;
ADDRGP4 $180
JUMPV
LABELV $193
line 294
;292:		}
;293:
;294:		if ( ent->eType == ET_TELEPORT_TRIGGER ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $196
line 295
;295:			cg.hyperspace = qtrue;
ADDRGP4 cg+107632
CNSTI4 1
ASGNI4
line 296
;296:		} else if ( ent->eType == ET_PUSH_TRIGGER ) {
ADDRGP4 $197
JUMPV
LABELV $196
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $199
line 297
;297:			BG_TouchJumpPad( &cg.predictedPlayerState, ent );
ADDRGP4 cg+107636
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 298
;298:		}
LABELV $199
LABELV $197
line 299
;299:	}
LABELV $180
line 269
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $182
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numTriggerEntities
INDIRI4
LTI4 $179
line 302
;300:
;301:	// if we didn't touch a jump pad this pmove frame
;302:	if ( cg.predictedPlayerState.jumppad_frame != cg.predictedPlayerState.pmove_framecount ) {
ADDRGP4 cg+107636+460
INDIRI4
ADDRGP4 cg+107636+456
INDIRI4
EQI4 $202
line 303
;303:		cg.predictedPlayerState.jumppad_frame = 0;
ADDRGP4 cg+107636+460
CNSTI4 0
ASGNI4
line 304
;304:		cg.predictedPlayerState.jumppad_ent = 0;
ADDRGP4 cg+107636+448
CNSTI4 0
ASGNI4
line 305
;305:	}
LABELV $202
line 306
;306:}
LABELV $165
endproc CG_TouchTriggerPrediction 88 28
export CG_PredictPlayerState
proc CG_PredictPlayerState 592 20
line 336
;307:
;308:
;309:
;310:/*
;311:=================
;312:CG_PredictPlayerState
;313:
;314:Generates cg.predictedPlayerState for the current cg.time
;315:cg.predictedPlayerState is guaranteed to be valid after exiting.
;316:
;317:For demo playback, this will be an interpolation between two valid
;318:playerState_t.
;319:
;320:For normal gameplay, it will be the result of predicted usercmd_t on
;321:top of the most recent playerState_t received from the server.
;322:
;323:Each new snapshot will usually have one or more new usercmd over the last,
;324:but we simulate all unacknowledged commands each time, not just the new ones.
;325:This means that on an internet connection, quite a few pmoves may be issued
;326:each frame.
;327:
;328:OPTIMIZE: don't re-simulate unless the newly arrived snapshot playerState_t
;329:differs from the predicted one.  Would require saving all intermediate
;330:playerState_t during prediction.
;331:
;332:We detect prediction errors and allow them to be decayed off over several frames
;333:to ease the jerk.
;334:=================
;335:*/
;336:void CG_PredictPlayerState( void ) {
line 343
;337:	int			cmdNum, current;
;338:	playerState_t	oldPlayerState;
;339:	qboolean	moved;
;340:	usercmd_t	oldestCmd;
;341:	usercmd_t	latestCmd;
;342:
;343:	cg.hyperspace = qfalse;	// will be set if touching a trigger_teleport
ADDRGP4 cg+107632
CNSTI4 0
ASGNI4
line 348
;344:
;345:	// if this is the first frame we must guarantee
;346:	// predictedPlayerState is valid even if there is some
;347:	// other error condition
;348:	if ( !cg.validPPS ) {
ADDRGP4 cg+108832
INDIRI4
CNSTI4 0
NEI4 $214
line 349
;349:		cg.validPPS = qtrue;
ADDRGP4 cg+108832
CNSTI4 1
ASGNI4
line 350
;350:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 351
;351:	}
LABELV $214
line 355
;352:
;353:
;354:	// demo playback just copies the moves
;355:	if ( cg.demoPlayback  || (cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRLP4 528
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 528
INDIRI4
NEI4 $224
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 528
INDIRI4
EQI4 $220
LABELV $224
line 356
;356:		CG_InterpolatePlayerState( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 357
;357:		return;
ADDRGP4 $212
JUMPV
LABELV $220
line 361
;358:	}
;359:
;360:	// non-predicting local movement will grab the latest angles
;361:	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
ADDRLP4 532
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 532
INDIRI4
NEI4 $229
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 532
INDIRI4
EQI4 $225
LABELV $229
line 362
;362:		CG_InterpolatePlayerState( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 363
;363:		return;
ADDRGP4 $212
JUMPV
LABELV $225
line 367
;364:	}
;365:
;366:	// prepare for pmove
;367:	cg_pmove.ps = &cg.predictedPlayerState;
ADDRGP4 cg_pmove
ADDRGP4 cg+107636
ASGNP4
line 368
;368:	cg_pmove.trace = CG_Trace;
ADDRGP4 cg_pmove+224
ADDRGP4 CG_Trace
ASGNP4
line 369
;369:	cg_pmove.pointcontents = CG_PointContents;
ADDRGP4 cg_pmove+228
ADDRGP4 CG_PointContents
ASGNP4
line 370
;370:	if ( cg_pmove.ps->pm_type == PM_DEAD ) {
ADDRGP4 cg_pmove
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $233
line 371
;371:		cg_pmove.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRGP4 cg_pmove+28
CNSTI4 65537
ASGNI4
line 372
;372:	}
ADDRGP4 $234
JUMPV
LABELV $233
line 373
;373:	else {
line 374
;374:		cg_pmove.tracemask = MASK_PLAYERSOLID;
ADDRGP4 cg_pmove+28
CNSTI4 33619969
ASGNI4
line 375
;375:	}
LABELV $234
line 376
;376:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.pm_type == PM_NOCLIP ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $241
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 1
NEI4 $237
LABELV $241
line 377
;377:		cg_pmove.tracemask &= ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 536
ADDRGP4 cg_pmove+28
ASGNP4
ADDRLP4 536
INDIRP4
ADDRLP4 536
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 378
;378:	}
LABELV $237
line 379
;379:	cg_pmove.noFootsteps = ( cgs.dmflags & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 cgs+31460
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $246
ADDRLP4 536
CNSTI4 1
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $246
ADDRLP4 536
CNSTI4 0
ASGNI4
LABELV $247
ADDRGP4 cg_pmove+36
ADDRLP4 536
INDIRI4
ASGNI4
line 382
;380:
;381:	// save the state before the pmove so we can detect transitions
;382:	oldPlayerState = cg.predictedPlayerState;
ADDRLP4 4
ADDRGP4 cg+107636
INDIRB
ASGNB 468
line 384
;383:
;384:	current = trap_GetCurrentCmdNumber();
ADDRLP4 540
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 472
ADDRLP4 540
INDIRI4
ASGNI4
line 389
;385:
;386:	// if we don't have the commands right after the snapshot, we
;387:	// can't accurately predict a current position, so just freeze at
;388:	// the last good position we had
;389:	cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 0
ADDRLP4 472
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 390
;390:	trap_GetUserCmd( cmdNum, &oldestCmd );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 504
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 391
;391:	if ( oldestCmd.serverTime > cg.snap->ps.commandTime 
ADDRLP4 544
ADDRLP4 504
INDIRI4
ASGNI4
ADDRLP4 544
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $249
ADDRLP4 544
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $249
line 392
;392:		&& oldestCmd.serverTime < cg.time ) {	// special check for map_restart
line 393
;393:		if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $212
line 394
;394:			CG_Printf ("exceeded PACKET_BACKUP on commands\n");
ADDRGP4 $256
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 395
;395:		}
line 396
;396:		return;
ADDRGP4 $212
JUMPV
LABELV $249
line 400
;397:	}
;398:
;399:	// get the latest command so we can know which commands are from previous map_restarts
;400:	trap_GetUserCmd( current, &latestCmd );
ADDRLP4 472
INDIRI4
ARGI4
ADDRLP4 480
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 406
;401:
;402:	// get the most recent information we have, even if
;403:	// the server time is beyond our current cg.time,
;404:	// because predicted player positions are going to 
;405:	// be ahead of everything else anyway
;406:	if ( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $257
ADDRLP4 548
CNSTI4 0
ASGNI4
ADDRGP4 cg+107596
INDIRI4
ADDRLP4 548
INDIRI4
NEI4 $257
ADDRGP4 cg+107592
INDIRI4
ADDRLP4 548
INDIRI4
NEI4 $257
line 407
;407:		cg.predictedPlayerState = cg.nextSnap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+40
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 408
;408:		cg.physicsTime = cg.nextSnap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 409
;409:	} else {
ADDRGP4 $258
JUMPV
LABELV $257
line 410
;410:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 411
;411:		cg.physicsTime = cg.snap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 412
;412:	}
LABELV $258
line 414
;413:
;414:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $270
line 415
;415:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $273
ARGP4
ADDRGP4 $274
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 416
;416:	}
ADDRGP4 $271
JUMPV
LABELV $270
line 417
;417:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $275
line 418
;418:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $273
ARGP4
ADDRGP4 $278
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 419
;419:	}
LABELV $275
LABELV $271
line 421
;420:
;421:	cg_pmove.pmove_fixed = pmove_fixed.integer;// | cg_pmove_fixed.integer;
ADDRGP4 cg_pmove+216
ADDRGP4 pmove_fixed+12
INDIRI4
ASGNI4
line 422
;422:	cg_pmove.pmove_msec = pmove_msec.integer;
ADDRGP4 cg_pmove+220
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 425
;423:
;424:	// run cmds
;425:	moved = qfalse;
ADDRLP4 476
CNSTI4 0
ASGNI4
line 426
;426:	for ( cmdNum = current - CMD_BACKUP + 1 ; cmdNum <= current ; cmdNum++ ) {
ADDRLP4 0
ADDRLP4 472
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $283
line 428
;427:		// get the command
;428:		trap_GetUserCmd( cmdNum, &cg_pmove.cmd );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 430
;429:
;430:		if ( cg_pmove.pmove_fixed ) {
ADDRGP4 cg_pmove+216
INDIRI4
CNSTI4 0
EQI4 $288
line 431
;431:			PM_UpdateViewAngles( cg_pmove.ps, &cg_pmove.cmd );
ADDRGP4 cg_pmove
INDIRP4
ARGP4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 432
;432:		}
LABELV $288
line 435
;433:
;434:		// don't do anything if the time is before the snapshot player time
;435:		if ( cg_pmove.cmd.serverTime <= cg.predictedPlayerState.commandTime ) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 cg+107636
INDIRI4
GTI4 $292
line 436
;436:			continue;
ADDRGP4 $284
JUMPV
LABELV $292
line 440
;437:		}
;438:
;439:		// don't do anything if the command was from a previous map_restart
;440:		if ( cg_pmove.cmd.serverTime > latestCmd.serverTime ) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRLP4 480
INDIRI4
LEI4 $296
line 441
;441:			continue;
ADDRGP4 $284
JUMPV
LABELV $296
line 449
;442:		}
;443: 
;444:		// check for a prediction error from last frame
;445:		// on a lan, this will often be the exact value
;446:		// from the snapshot, but on a wan we will have
;447:		// to predict several commands to get to the point
;448:		// we want to compare
;449:		if ( cg.predictedPlayerState.commandTime == oldPlayerState.commandTime ) {
ADDRGP4 cg+107636
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $299
line 453
;450:			vec3_t	delta;
;451:			float	len;
;452:
;453:			if ( cg.thisFrameTeleport ) {
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
EQI4 $302
line 455
;454:				// a teleport will not cause an error decay
;455:				VectorClear( cg.predictedError );
ADDRLP4 568
CNSTF4 0
ASGNF4
ADDRGP4 cg+108840+8
ADDRLP4 568
INDIRF4
ASGNF4
ADDRGP4 cg+108840+4
ADDRLP4 568
INDIRF4
ASGNF4
ADDRGP4 cg+108840
ADDRLP4 568
INDIRF4
ASGNF4
line 456
;456:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $310
line 457
;457:					CG_Printf( "PredictionTeleport\n" );
ADDRGP4 $313
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 458
;458:				}
LABELV $310
line 459
;459:				cg.thisFrameTeleport = qfalse;
ADDRGP4 cg+107592
CNSTI4 0
ASGNI4
line 460
;460:			} else {
ADDRGP4 $303
JUMPV
LABELV $302
line 462
;461:				vec3_t	adjusted;
;462:				CG_AdjustPositionForMover( cg.predictedPlayerState.origin, 
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107608
INDIRI4
ARGI4
ADDRLP4 568
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 465
;463:					cg.predictedPlayerState.groundEntityNum, cg.physicsTime, cg.oldTime, adjusted );
;464:
;465:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $321
line 466
;466:					if (!VectorCompare( oldPlayerState.origin, adjusted )) {
ADDRLP4 4+20
ARGP4
ADDRLP4 568
ARGP4
ADDRLP4 580
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 580
INDIRI4
CNSTI4 0
NEI4 $324
line 467
;467:						CG_Printf("prediction error\n");
ADDRGP4 $327
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 468
;468:					}
LABELV $324
line 469
;469:				}
LABELV $321
line 470
;470:				VectorSubtract( oldPlayerState.origin, adjusted, delta );
ADDRLP4 552
ADDRLP4 4+20
INDIRF4
ADDRLP4 568
INDIRF4
SUBF4
ASGNF4
ADDRLP4 552+4
ADDRLP4 4+20+4
INDIRF4
ADDRLP4 568+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 552+8
ADDRLP4 4+20+8
INDIRF4
ADDRLP4 568+8
INDIRF4
SUBF4
ASGNF4
line 471
;471:				len = VectorLength( delta );
ADDRLP4 552
ARGP4
ADDRLP4 580
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 564
ADDRLP4 580
INDIRF4
ASGNF4
line 472
;472:				if ( len > 0.1 ) {
ADDRLP4 564
INDIRF4
CNSTF4 1036831949
LEF4 $337
line 473
;473:					if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $339
line 474
;474:						CG_Printf("Prediction miss: %f\n", len);
ADDRGP4 $342
ARGP4
ADDRLP4 564
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 475
;475:					}
LABELV $339
line 476
;476:					if ( cg_errorDecay.integer ) {
ADDRGP4 cg_errorDecay+12
INDIRI4
CNSTI4 0
EQI4 $343
line 480
;477:						int		t;
;478:						float	f;
;479:
;480:						t = cg.time - cg.predictedErrorTime;
ADDRLP4 588
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108836
INDIRI4
SUBI4
ASGNI4
line 481
;481:						f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 584
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 588
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 482
;482:						if ( f < 0 ) {
ADDRLP4 584
INDIRF4
CNSTF4 0
GEF4 $350
line 483
;483:							f = 0;
ADDRLP4 584
CNSTF4 0
ASGNF4
line 484
;484:						}
LABELV $350
line 485
;485:						if ( f > 0 && cg_showmiss.integer ) {
ADDRLP4 584
INDIRF4
CNSTF4 0
LEF4 $352
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $352
line 486
;486:							CG_Printf("Double prediction decay: %f\n", f);
ADDRGP4 $355
ARGP4
ADDRLP4 584
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 487
;487:						}
LABELV $352
line 488
;488:						VectorScale( cg.predictedError, f, cg.predictedError );
ADDRGP4 cg+108840
ADDRGP4 cg+108840
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+108840+4
ADDRGP4 cg+108840+4
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+108840+8
ADDRGP4 cg+108840+8
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ASGNF4
line 489
;489:					} else {
ADDRGP4 $344
JUMPV
LABELV $343
line 490
;490:						VectorClear( cg.predictedError );
ADDRLP4 584
CNSTF4 0
ASGNF4
ADDRGP4 cg+108840+8
ADDRLP4 584
INDIRF4
ASGNF4
ADDRGP4 cg+108840+4
ADDRLP4 584
INDIRF4
ASGNF4
ADDRGP4 cg+108840
ADDRLP4 584
INDIRF4
ASGNF4
line 491
;491:					}
LABELV $344
line 492
;492:					VectorAdd( delta, cg.predictedError, cg.predictedError );
ADDRGP4 cg+108840
ADDRLP4 552
INDIRF4
ADDRGP4 cg+108840
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+108840+4
ADDRLP4 552+4
INDIRF4
ADDRGP4 cg+108840+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+108840+8
ADDRLP4 552+8
INDIRF4
ADDRGP4 cg+108840+8
INDIRF4
ADDF4
ASGNF4
line 493
;493:					cg.predictedErrorTime = cg.oldTime;
ADDRGP4 cg+108836
ADDRGP4 cg+107608
INDIRI4
ASGNI4
line 494
;494:				}
LABELV $337
line 495
;495:			}
LABELV $303
line 496
;496:		}
LABELV $299
line 500
;497:
;498:		// don't predict gauntlet firing, which is only supposed to happen
;499:		// when it actually inflicts damage
;500:		cg_pmove.gauntletHit = qfalse;
ADDRGP4 cg_pmove+40
CNSTI4 0
ASGNI4
line 502
;501:
;502:		if ( cg_pmove.pmove_fixed ) {
ADDRGP4 cg_pmove+216
INDIRI4
CNSTI4 0
EQI4 $386
line 503
;503:			cg_pmove.cmd.serverTime = ((cg_pmove.cmd.serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
ADDRGP4 cg_pmove+4
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 504
;504:		}
LABELV $386
line 506
;505:
;506:		Pmove (&cg_pmove);
ADDRGP4 cg_pmove
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 508
;507:
;508:		moved = qtrue;
ADDRLP4 476
CNSTI4 1
ASGNI4
line 511
;509:
;510:		// add push trigger movement effects
;511:		CG_TouchTriggerPrediction();
ADDRGP4 CG_TouchTriggerPrediction
CALLV
pop
line 515
;512:
;513:		// check for predictable events that changed from previous predictions
;514:		//CG_CheckChangedPredictableEvents(&cg.predictedPlayerState);
;515:	}
LABELV $284
line 426
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $286
ADDRLP4 0
INDIRI4
ADDRLP4 472
INDIRI4
LEI4 $283
line 517
;516:
;517:	if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $394
line 518
;518:		CG_Printf( "[%i : %i] ", cg_pmove.cmd.serverTime, cg.time );
ADDRGP4 $397
ARGP4
ADDRGP4 cg_pmove+4
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 519
;519:	}
LABELV $394
line 521
;520:
;521:	if ( !moved ) {
ADDRLP4 476
INDIRI4
CNSTI4 0
NEI4 $400
line 522
;522:		if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $212
line 523
;523:			CG_Printf( "not moved\n" );
ADDRGP4 $405
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 524
;524:		}
line 525
;525:		return;
ADDRGP4 $212
JUMPV
LABELV $400
line 529
;526:	}
;527:
;528:	// adjust for the movement of the groundentity
;529:	CG_AdjustPositionForMover( cg.predictedPlayerState.origin, 
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 533
;530:		cg.predictedPlayerState.groundEntityNum, 
;531:		cg.physicsTime, cg.time, cg.predictedPlayerState.origin );
;532:
;533:	if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $414
line 534
;534:		if (cg.predictedPlayerState.eventSequence > oldPlayerState.eventSequence + MAX_PS_EVENTS) {
ADDRGP4 cg+107636+108
INDIRI4
ADDRLP4 4+108
INDIRI4
CNSTI4 2
ADDI4
LEI4 $417
line 535
;535:			CG_Printf("WARNING: dropped event\n");
ADDRGP4 $422
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 536
;536:		}
LABELV $417
line 537
;537:	}
LABELV $414
line 540
;538:
;539:	// fire events and other transition triggered things
;540:	CG_TransitionPlayerState( &cg.predictedPlayerState, &oldPlayerState );
ADDRGP4 cg+107636
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 542
;541:
;542:	if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $424
line 543
;543:		if (cg.eventSequence > cg.predictedPlayerState.eventSequence) {
ADDRGP4 cg+108852
INDIRI4
ADDRGP4 cg+107636+108
INDIRI4
LEI4 $427
line 544
;544:			CG_Printf("WARNING: double event\n");
ADDRGP4 $432
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 545
;545:			cg.eventSequence = cg.predictedPlayerState.eventSequence;
ADDRGP4 cg+108852
ADDRGP4 cg+107636+108
INDIRI4
ASGNI4
line 546
;546:		}
LABELV $427
line 547
;547:	}
LABELV $424
line 548
;548:}
LABELV $212
endproc CG_PredictPlayerState 592 20
bss
align 4
LABELV cg_triggerEntities
skip 1024
align 4
LABELV cg_numTriggerEntities
skip 4
align 4
LABELV cg_solidEntities
skip 1024
align 4
LABELV cg_numSolidEntities
skip 4
align 4
LABELV cg_pmove
skip 232
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
LABELV $432
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $422
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $405
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $397
byte 1 91
byte 1 37
byte 1 105
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $355
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $327
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $313
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $278
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $274
byte 1 56
byte 1 0
align 1
LABELV $273
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $256
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
