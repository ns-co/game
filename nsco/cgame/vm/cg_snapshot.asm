code
proc CG_ResetEntity 8 4
file "../cg_snapshot.c"
line 22
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_snapshot.c -- things that happen on snapshot transition,
;4:// not necessarily every single rendered frame
;5:
;6:// every line of code that differs from the quake3:arena SDK
;7:// is property of manfred nerurkar
;8:// no commercial explotation allowed
;9:// you are only allowed to use this code in navy seals: covert operations 
;10:// a quake3 arena modifiation
;11:// defcon-x@ns-co.net
;12:
;13:#include "cg_local.h"
;14:
;15:
;16:
;17:/*
;18:==================
;19:CG_ResetEntity
;20:==================
;21:*/
;22:static void CG_ResetEntity( centity_t *cent ) {
line 25
;23:	// if an event is set, assume it is new enough to use
;24:	// if the event had timed out, it would have been cleared
;25:	cent->previousEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 27
;26:
;27:	cent->wakemarkTime = cg.snap->serverTime;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 28
;28:	cent->trailTime = cg.snap->serverTime;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 30
;29:
;30:	VectorCopy (cent->currentState.origin, cent->lerpOrigin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 31
;31:	VectorCopy (cent->currentState.angles, cent->lerpAngles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 32
;32:	if ( cent->currentState.eType == ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $87
line 33
;33:		CG_ResetPlayerEntity( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 34
;34:	}
LABELV $87
line 35
;35:}
LABELV $84
endproc CG_ResetEntity 8 4
proc CG_TransitionEntity 4 4
line 44
;36:
;37:/*
;38:===============
;39:CG_TransitionEntity
;40:
;41:cent->nextState is moved to cent->currentState and events are fired
;42:===============
;43:*/
;44:static void CG_TransitionEntity( centity_t *cent ) {
line 45
;45:	cent->currentState = cent->nextState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRB
ASGNB 208
line 46
;46:	cent->currentValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 49
;47:
;48:	// reset if the entity wasn't in the last frame or was teleported
;49:	if ( !cent->interpolate ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $90
line 50
;50:		CG_ResetEntity( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 51
;51:	}
LABELV $90
line 54
;52:
;53:	// clear the next state.  if will be set by the next CG_SetNextSnap
;54:	cent->interpolate = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 57
;55:
;56:	// check for events
;57:	CG_CheckEvents( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 58
;58:}
LABELV $89
endproc CG_TransitionEntity 4 4
export CG_SetInitialSnapshot
proc CG_SetInitialSnapshot 16 12
line 72
;59:
;60:
;61:/*
;62:==================
;63:CG_SetInitialSnapshot
;64:
;65:This will only happen on the very first snapshot, or
;66:on tourney restarts.  All other times will use 
;67:CG_TransitionSnapshot instead.
;68:
;69:FIXME: Also called by map_restart?
;70:==================
;71:*/
;72:void CG_SetInitialSnapshot( snapshot_t *snap ) {
line 77
;73:	int				i;
;74:	centity_t		*cent;
;75:	entityState_t	*state;
;76:
;77:	cg.snap = snap;
ADDRGP4 cg+36
ADDRFP4 0
INDIRP4
ASGNP4
line 79
;78:
;79:	BG_PlayerStateToEntityState( &snap->ps, &cg_entities[ snap->ps.clientNum ].currentState, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 728
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 82
;80:
;81:	// sort out solid entities
;82:	CG_BuildSolidList();
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 84
;83:
;84:	CG_ExecuteNewServerCommands( snap->serverCommandSequence );
ADDRFP4 0
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 88
;85:
;86:	// set our local weapon selection pointer to
;87:	// what the server has indicated the current weapon is
;88:	CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 90
;89:
;90:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $94
line 91
;91:		state = &cg.snap->entities[ i ];
ADDRLP4 8
CNSTI4 208
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 92
;92:		cent = &cg_entities[ state->number ];
ADDRLP4 0
CNSTI4 728
ADDRLP4 8
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 94
;93:
;94:		memcpy(&cent->currentState, state, sizeof(entityState_t));
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 96
;95:		//cent->currentState = *state;
;96:		cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 97
;97:		cent->currentValid = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 99
;98:
;99:		CG_ResetEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 102
;100:
;101:		// check for events
;102:		CG_CheckEvents( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 103
;103:	}
LABELV $95
line 90
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $97
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $94
line 104
;104:}
LABELV $92
endproc CG_SetInitialSnapshot 16 12
proc CG_TransitionSnapshot 28 12
line 114
;105:
;106:
;107:/*
;108:===================
;109:CG_TransitionSnapshot
;110:
;111:The transition point from snap to nextSnap has passed
;112:===================
;113:*/
;114:static void CG_TransitionSnapshot( void ) {
line 119
;115:	centity_t			*cent;
;116:	snapshot_t			*oldFrame;
;117:	int					i;
;118:
;119:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
line 120
;120:		CG_Error( "CG_TransitionSnapshot: NULL cg.snap" );
ADDRGP4 $104
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 121
;121:	}
LABELV $101
line 122
;122:	if ( !cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $105
line 123
;123:		CG_Error( "CG_TransitionSnapshot: NULL cg.nextSnap" );
ADDRGP4 $108
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 124
;124:	}
LABELV $105
line 127
;125:
;126:	// execute any server string commands before transitioning entities
;127:	CG_ExecuteNewServerCommands( cg.nextSnap->serverCommandSequence );
ADDRGP4 cg+40
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 130
;128:
;129:	// if we had a map_restart, set everthing with initial
;130:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $110
line 131
;131:	}
LABELV $110
line 134
;132:
;133:	// clear the currentValid flag for all entities in the existing snapshot
;134:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $113
line 135
;135:		cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 4
CNSTI4 728
CNSTI4 208
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 136
;136:		cent->currentValid = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 0
ASGNI4
line 137
;137:	}
LABELV $114
line 134
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $116
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $113
line 140
;138:
;139:	// move nextSnap to snap and do the transitions
;140:	oldFrame = cg.snap;
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 141
;141:	cg.snap = cg.nextSnap;
ADDRGP4 cg+36
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 143
;142:
;143:	BG_PlayerStateToEntityState( &cg.snap->ps, &cg_entities[ cg.snap->ps.clientNum ].currentState, qfalse );
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 144
;144:	cg_entities[ cg.snap->ps.clientNum ].interpolate = qfalse;
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 0
ASGNI4
line 146
;145:
;146:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $126
line 147
;147:		cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 4
CNSTI4 728
CNSTI4 208
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 148
;148:		CG_TransitionEntity( cent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 149
;149:	}
LABELV $127
line 146
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $129
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $126
line 151
;150:
;151:	cg.nextSnap = NULL;
ADDRGP4 cg+40
CNSTP4 0
ASGNP4
line 154
;152:
;153:	// check for playerstate transition events
;154:	if ( oldFrame ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $133
line 157
;155:		playerState_t	*ops, *ps;
;156:
;157:		ops = &oldFrame->ps;
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 158
;158:		ps = &cg.snap->ps;
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 160
;159:		// teleporting checks are irrespective of prediction
;160:		if ( ( ps->eFlags ^ ops->eFlags ) & EF_TELEPORT_BIT ) {
ADDRLP4 20
CNSTI4 104
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $136
line 161
;161:			cg.thisFrameTeleport = qtrue;	// will be cleared by prediction code
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 162
;162:		}
LABELV $136
line 167
;163: 
;164:
;165:		// if we are not doing client side movement prediction for any
;166:		// reason, then the client events and view changes will be issued now
;167:		if ( cg.demoPlayback   || (cg.snap->ps.pm_flags & PMF_FOLLOW ) 
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $147
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $147
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $147
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $139
LABELV $147
line 168
;168:			|| cg_nopredict.integer || cg_synchronousClients.integer ) {
line 169
;169:			CG_TransitionPlayerState( ps, ops );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 170
;170:		}
LABELV $139
line 171
;171:	}
LABELV $133
line 173
;172:
;173:}
LABELV $100
endproc CG_TransitionSnapshot 28 12
proc CG_SetNextSnap 32 12
line 183
;174:
;175:
;176:/*
;177:===================
;178:CG_SetNextSnap
;179:
;180:A new snapshot has just been read in from the client system.
;181:===================
;182:*/
;183:static void CG_SetNextSnap( snapshot_t *snap ) {
line 188
;184:	int					num;
;185:	entityState_t		*es;
;186:	centity_t			*cent;
;187:
;188:	cg.nextSnap = snap;
ADDRGP4 cg+40
ADDRFP4 0
INDIRP4
ASGNP4
line 190
;189:
;190:	BG_PlayerStateToEntityState( &snap->ps, &cg_entities[ snap->ps.clientNum ].nextState, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 728
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+208
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 191
;191:	cg_entities[ cg.snap->ps.clientNum ].interpolate = qtrue;
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 1
ASGNI4
line 194
;192:
;193:	// check for extrapolation errors
;194:	for ( num = 0 ; num < snap->numEntities ; num++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $153
line 195
;195:		es = &snap->entities[num];
ADDRLP4 4
CNSTI4 208
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 196
;196:		cent = &cg_entities[ es->number ];
ADDRLP4 0
CNSTI4 728
ADDRLP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 198
;197:
;198:		memcpy(&cent->nextState, es, sizeof(entityState_t));
ADDRLP4 16
CNSTI4 208
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 203
;199:		//cent->nextState = *es;
;200:
;201:		// if this frame is a teleport, or the entity wasn't in the
;202:		// previous frame, don't interpolate
;203:		if ( ( !cent->currentValid || ( ( cent->currentState.eFlags ^ es->eFlags ) & EF_TELEPORT_BIT ) ) ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $159
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $157
LABELV $159
line 204
;204:				cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 205
;205:		} else {
ADDRGP4 $158
JUMPV
LABELV $157
line 206
;206:			cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 207
;207:		}
LABELV $158
line 208
;208:	}
LABELV $154
line 194
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $156
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $153
line 212
;209:
;210:	// if the next frame is a teleport for the playerstate, we
;211:	// can't interpolate during demos
;212:	if ( cg.snap && ( ( snap->ps.eFlags ^ cg.snap->ps.eFlags ) & EF_TELEPORT_BIT ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $160
ADDRLP4 16
CNSTI4 148
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $160
line 213
;213:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 214
;214:	} else {
ADDRGP4 $161
JUMPV
LABELV $160
line 215
;215:		cg.nextFrameTeleport = qfalse;
ADDRGP4 cg+107596
CNSTI4 0
ASGNI4
line 216
;216:	}
LABELV $161
line 219
;217:
;218:	// if changing follow mode, don't interpolate
;219:	if ( cg.nextSnap->ps.clientNum != cg.snap->ps.clientNum ) {
ADDRLP4 20
CNSTI4 184
ASGNI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $166
line 220
;220:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 221
;221:	}
LABELV $166
line 224
;222:
;223:	// if changing server restarts, don't interpolate
;224:	if ( ( cg.nextSnap->snapFlags ^ cg.snap->snapFlags ) & SNAPFLAG_SERVERCOUNT ) {
ADDRGP4 cg+40
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $171
line 225
;225:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 226
;226:	}
LABELV $171
line 229
;227:
;228:	// sort out solid entities
;229:	CG_BuildSolidList();
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 230
;230:}
LABELV $148
endproc CG_SetNextSnap 32 12
proc CG_ReadNextSnapshot 20 12
line 243
;231:
;232:
;233:/*
;234:========================
;235:CG_ReadNextSnapshot
;236:
;237:This is the only place new snapshots are requested
;238:This may increment cgs.processedSnapshotNum multiple
;239:times if the client system fails to return a
;240:valid snapshot.
;241:========================
;242:*/
;243:static snapshot_t *CG_ReadNextSnapshot( void ) {
line 247
;244:	qboolean	r;
;245:	snapshot_t	*dest;
;246:
;247:	if ( cg.latestSnapshotNum > cgs.processedSnapshotNum + 1000 ) {
ADDRGP4 cg+28
INDIRI4
ADDRGP4 cgs+31448
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $185
line 248
;248:		CG_Printf( "WARNING: CG_ReadNextSnapshot: way out of range, %i > %i", 
ADDRGP4 $181
ARGP4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31448
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 250
;249:			cg.latestSnapshotNum, cgs.processedSnapshotNum );
;250:	}
ADDRGP4 $185
JUMPV
LABELV $184
line 252
;251:
;252:	while ( cgs.processedSnapshotNum < cg.latestSnapshotNum ) {
line 254
;253:		// decide which of the two slots to load it into
;254:		if ( cg.snap == &cg.activeSnapshots[0] ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
ADDRGP4 cg+44
CVPU4 4
NEU4 $189
line 255
;255:			dest = &cg.activeSnapshots[1];
ADDRLP4 0
ADDRGP4 cg+44+53772
ASGNP4
line 256
;256:		} else {
ADDRGP4 $190
JUMPV
LABELV $189
line 257
;257:			dest = &cg.activeSnapshots[0];
ADDRLP4 0
ADDRGP4 cg+44
ASGNP4
line 258
;258:		}
LABELV $190
line 261
;259:
;260:		// try to read the snapshot from the client system
;261:		cgs.processedSnapshotNum++;
ADDRLP4 8
ADDRGP4 cgs+31448
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 262
;262:		r = trap_GetSnapshot( cgs.processedSnapshotNum, dest );
ADDRGP4 cgs+31448
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_GetSnapshot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 265
;263:
;264:		// FIXME: why would trap_GetSnapshot return a snapshot with the same server time
;265:		if ( cg.snap && r && dest->serverTime == cg.snap->serverTime ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $198
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $198
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
NEI4 $198
line 267
;266:			//continue;
;267:		}
LABELV $198
line 270
;268:
;269:		// if it succeeded, return
;270:		if ( r ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $202
line 271
;271:			CG_AddLagometerSnapshotInfo( dest );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 272
;272:			return dest;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $176
JUMPV
LABELV $202
line 281
;273:		}
;274:
;275:		// a GetSnapshot will return failure if the snapshot
;276:		// never arrived, or  is so old that its entities
;277:		// have been shoved off the end of the circular
;278:		// buffer in the client system.
;279:
;280:		// record as a dropped packet
;281:		CG_AddLagometerSnapshotInfo( NULL );
CNSTP4 0
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 285
;282:
;283:		// If there are additional snapshots, continue trying to
;284:		// read them.
;285:	}
LABELV $185
line 252
ADDRGP4 cgs+31448
INDIRI4
ADDRGP4 cg+28
INDIRI4
LTI4 $184
line 288
;286:
;287:	// nothing left to read
;288:	return NULL;
CNSTP4 0
RETP4
LABELV $176
endproc CG_ReadNextSnapshot 20 12
export CG_ProcessSnapshots
proc CG_ProcessSnapshots 16 8
line 311
;289:}
;290:
;291:
;292:/*
;293:============
;294:CG_ProcessSnapshots
;295:
;296:We are trying to set up a renderable view, so determine
;297:what the simulated time is, and try to get snapshots
;298:both before and after that time if available.
;299:
;300:If we don't have a valid cg.snap after exiting this function,
;301:then a 3D game view cannot be rendered.  This should only happen
;302:right after the initial connection.  After cg.snap has been valid
;303:once, it will never turn invalid.
;304:
;305:Even if cg.snap is valid, cg.nextSnap may not be, if the snapshot
;306:hasn't arrived yet (it becomes an extrapolating situation instead
;307:of an interpolating one)
;308:
;309:============
;310:*/
;311:void CG_ProcessSnapshots( void ) {
line 316
;312:	snapshot_t		*snap;
;313:	int				n;
;314:
;315:	// see what the latest snapshot the client system has is
;316:	trap_GetCurrentSnapshotNumber( &n, &cg.latestSnapshotTime );
ADDRLP4 4
ARGP4
ADDRGP4 cg+32
ARGP4
ADDRGP4 trap_GetCurrentSnapshotNumber
CALLV
pop
line 317
;317:	if ( n != cg.latestSnapshotNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
EQI4 $215
line 318
;318:		if ( n < cg.latestSnapshotNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
GEI4 $209
line 320
;319:			// this should never happen
;320:			CG_Error( "CG_ProcessSnapshots: n < cg.latestSnapshotNum" );
ADDRGP4 $212
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 321
;321:		}
LABELV $209
line 322
;322:		cg.latestSnapshotNum = n;
ADDRGP4 cg+28
ADDRLP4 4
INDIRI4
ASGNI4
line 323
;323:	}
ADDRGP4 $215
JUMPV
LABELV $214
line 328
;324:
;325:	// If we have yet to receive a snapshot, check for it.
;326:	// Once we have gotten the first snapshot, cg.snap will
;327:	// always have valid data for the rest of the game
;328:	while ( !cg.snap ) {
line 329
;329:		snap = CG_ReadNextSnapshot();
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 330
;330:		if ( !snap ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $218
line 332
;331:			// we can't continue until we get a snapshot
;332:			return;
ADDRGP4 $204
JUMPV
LABELV $218
line 337
;333:		}
;334:
;335:		// set our weapon selection to what
;336:		// the playerstate is currently using
;337:		if ( !( snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $220
line 338
;338:			CG_SetInitialSnapshot( snap );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetInitialSnapshot
CALLV
pop
line 339
;339:		}
LABELV $220
line 340
;340:	}
LABELV $215
line 328
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
LABELV $222
line 345
;341:
;342:	// loop until we either have a valid nextSnap with a serverTime
;343:	// greater than cg.time to interpolate towards, or we run
;344:	// out of available snapshots
;345:	do {
line 347
;346:		// if we don't have a nextframe, try and read a new one in
;347:		if ( !cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $225
line 348
;348:			snap = CG_ReadNextSnapshot();
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 352
;349:
;350:			// if we still don't have a nextframe, we will just have to
;351:			// extrapolate
;352:			if ( !snap ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $228
line 353
;353:				break;
ADDRGP4 $224
JUMPV
LABELV $228
line 356
;354:			}
;355:
;356:			CG_SetNextSnap( snap );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetNextSnap
CALLV
pop
line 360
;357:
;358:
;359:			// if time went backwards, we have a level restart
;360:			if ( cg.nextSnap->serverTime < cg.snap->serverTime ) {
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
GEI4 $230
line 361
;361:				CG_Error( "CG_ProcessSnapshots: Server time went backwards" );
ADDRGP4 $234
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 362
;362:			}
LABELV $230
line 363
;363:		}
LABELV $225
line 366
;364:
;365:		// if our time is < nextFrame's, we have a nice interpolating state
;366:		if ( cg.time >= cg.snap->serverTime && cg.time < cg.nextSnap->serverTime ) {
ADDRLP4 8
CNSTI4 8
ASGNI4
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
LTI4 $235
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
GEI4 $235
line 367
;367:			break;
ADDRGP4 $224
JUMPV
LABELV $235
line 371
;368:		}
;369:
;370:		// we have passed the transition from nextFrame to frame
;371:		CG_TransitionSnapshot();
ADDRGP4 CG_TransitionSnapshot
CALLV
pop
line 372
;372:	} while ( 1 );
LABELV $223
ADDRGP4 $222
JUMPV
LABELV $224
line 375
;373:
;374:	// assert our valid conditions upon exiting
;375:	if ( cg.snap == NULL ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $241
line 376
;376:		CG_Error( "CG_ProcessSnapshots: cg.snap == NULL" );
ADDRGP4 $244
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 377
;377:	}
LABELV $241
line 378
;378:	if ( cg.time < cg.snap->serverTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $245
line 380
;379:		// this can happen right after a vid_restart
;380:		cg.time = cg.snap->serverTime;
ADDRGP4 cg+107604
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 381
;381:	}
LABELV $245
line 382
;382:	if ( cg.nextSnap != NULL && cg.nextSnap->serverTime <= cg.time ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $251
line 383
;383:		CG_Error( "CG_ProcessSnapshots: cg.nextSnap->serverTime <= cg.time" );
ADDRGP4 $256
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 384
;384:	}
LABELV $251
line 386
;385:
;386:}
LABELV $204
endproc CG_ProcessSnapshots 16 8
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
LABELV $256
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 45
byte 1 62
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 60
byte 1 61
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $244
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 32
byte 1 61
byte 1 61
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $234
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $212
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 32
byte 1 60
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $181
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 121
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
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $108
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $104
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 0
