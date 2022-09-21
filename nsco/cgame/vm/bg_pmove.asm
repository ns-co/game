data
export pm_stopspeed
align 4
LABELV pm_stopspeed
byte 4 1120403456
export pm_scopeScale
align 4
LABELV pm_scopeScale
byte 4 1055286886
export pm_duckScale
align 4
LABELV pm_duckScale
byte 4 1053609165
export pm_swimScale
align 4
LABELV pm_swimScale
byte 4 1058642330
export pm_wadeScale
align 4
LABELV pm_wadeScale
byte 4 1060320051
export pm_sprintScale
align 4
LABELV pm_sprintScale
byte 4 1071644672
export pm_accelerate
align 4
LABELV pm_accelerate
byte 4 1092616192
export pm_walkaccelerate
align 4
LABELV pm_walkaccelerate
byte 4 1103626240
export pm_airaccelerate
align 4
LABELV pm_airaccelerate
byte 4 1065353216
export pm_wateraccelerate
align 4
LABELV pm_wateraccelerate
byte 4 1082130432
export pm_flyaccelerate
align 4
LABELV pm_flyaccelerate
byte 4 1090519040
export pm_friction
align 4
LABELV pm_friction
byte 4 1086324736
export pm_waterfriction
align 4
LABELV pm_waterfriction
byte 4 1065353216
export pm_flightfriction
align 4
LABELV pm_flightfriction
byte 4 1077936128
export pm_spectatorfriction
align 4
LABELV pm_spectatorfriction
byte 4 1065353216
export c_pmove
align 4
LABELV c_pmove
byte 4 0
export pm_ladderScale
align 4
LABELV pm_ladderScale
byte 4 1056964608
export pm_ladderaccelerate
align 4
LABELV pm_ladderaccelerate
byte 4 1161527296
export pm_ladderfriction
align 4
LABELV pm_ladderfriction
byte 4 1161527296
export PM_AddEvent
code
proc PM_AddEvent 0 12
file "../../game/bg_pmove.c"
line 65
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_pmove.c -- both games player movement code
;4:
;5:// takes a playerstate and a usercmd as input and returns a modifed playerstate
;6:// every line of code that differs from the quake3:arena SDK
;7:// is property of manfred nerurkar
;8:// no commercial explotation allowed
;9:// you are only allowed to use this code in navy seals: covert operations 
;10:// a quake3 arena modifiation
;11:// defcon-x@ns-co.net
;12:
;13:#include "q_shared.h"
;14:#include "bg_public.h"
;15:#include "bg_local.h"
;16:
;17:#include "variables.h"
;18:
;19:pmove_t		*pm;
;20:pml_t		pml;
;21:
;22:// movement parameters
;23:float	pm_stopspeed = 100.0f;
;24:float	pm_scopeScale = 0.45f;
;25:float	pm_duckScale = 0.40f;
;26:float	pm_swimScale = 0.60f;
;27:float	pm_wadeScale = 0.70f;
;28:
;29:float	pm_sprintScale = 1.75f;
;30:
;31:float	pm_accelerate = 10.0f;
;32:float	pm_walkaccelerate = 25.0f;
;33:
;34:float	pm_airaccelerate = 1.0f;
;35:float	pm_wateraccelerate = 4.0f;
;36:float	pm_flyaccelerate = 8.0f;
;37:
;38:float	pm_friction = 6.0f;
;39:float	pm_waterfriction = 1.0f;
;40:float	pm_flightfriction = 3.0f;
;41:float	pm_spectatorfriction = 1.0f;
;42:
;43:int		c_pmove = 0;
;44:
;45:// Navy Seals ++
;46:float	pm_ladderScale = 0.50;
;47:float	pm_ladderaccelerate = 3000;
;48:float	pm_ladderfriction = 3000;
;49:
;50:int		NS_OnLadder();
;51:
;52:vec3_t pm_previous_origin[MAX_CLIENTS];
;53:int    pm_lastsprint[MAX_CLIENTS];
;54:
;55:// Navy Seals --
;56:
;57:int BG_GetMaxRoundForWeapon( int weapon );
;58:
;59:/*
;60:===============
;61:PM_AddEvent
;62:
;63:===============
;64:*/
;65:void PM_AddEvent( int newEvent ) {
line 66
;66:	BG_AddPredictableEventToPlayerstate( newEvent, 0, pm->ps );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 67
;67:}
LABELV $51
endproc PM_AddEvent 0 12
export PM_AddTouchEnt
proc PM_AddTouchEnt 12 0
line 74
;68:
;69:/*
;70:===============
;71:PM_AddTouchEnt
;72:===============
;73:*/
;74:void PM_AddTouchEnt( int entityNum ) {
line 77
;75:	int		i;
;76:
;77:	if ( entityNum == ENTITYNUM_WORLD ) {
ADDRFP4 0
INDIRI4
CNSTI4 1022
NEI4 $53
line 78
;78:		return;
ADDRGP4 $52
JUMPV
LABELV $53
line 80
;79:	}
;80:	if ( pm->numtouch == MAXTOUCH ) {
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 32
NEI4 $55
line 81
;81:		return;
ADDRGP4 $52
JUMPV
LABELV $55
line 85
;82:	}
;83:
;84:	// see if it is already added
;85:	for ( i = 0 ; i < pm->numtouch ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $60
JUMPV
LABELV $57
line 86
;86:		if ( pm->touchents[ i ] == entityNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $61
line 87
;87:			return;
ADDRGP4 $52
JUMPV
LABELV $61
line 89
;88:		}
;89:	}
LABELV $58
line 85
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $60
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
LTI4 $57
line 92
;90:
;91:	// add it
;92:	pm->touchents[pm->numtouch] = entityNum;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 93
;93:	pm->numtouch++;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
CNSTI4 48
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
line 94
;94:}
LABELV $52
endproc PM_AddTouchEnt 12 0
proc PM_StartTorsoAnim 8 0
line 101
;95:
;96:/*
;97:===================
;98:PM_StartTorsoAnim
;99:===================
;100:*/
;101:static void PM_StartTorsoAnim( int anim ) {
line 102
;102:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $64
line 103
;103:		return;
ADDRGP4 $63
JUMPV
LABELV $64
line 105
;104:	}
;105:	pm->ps->torsoAnim = ( ( pm->ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 107
;106:		| anim;
;107:}
LABELV $63
endproc PM_StartTorsoAnim 8 0
proc PM_StartLegsAnim 8 0
line 108
;108:static void PM_StartLegsAnim( int anim ) {
line 109
;109:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $67
line 110
;110:		return;
ADDRGP4 $66
JUMPV
LABELV $67
line 112
;111:	}
;112:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $69
line 113
;113:		return;		// a high priority animation is running
ADDRGP4 $66
JUMPV
LABELV $69
line 115
;114:	}
;115:	pm->ps->legsAnim = ( ( pm->ps->legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 117
;116:		| anim;
;117:}
LABELV $66
endproc PM_StartLegsAnim 8 0
proc PM_ContinueLegsAnim 0 4
line 119
;118:
;119:static void PM_ContinueLegsAnim( int anim ) {
line 120
;120:	if ( ( pm->ps->legsAnim & ~ANIM_TOGGLEBIT ) == anim ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $72
line 121
;121:		return;
ADDRGP4 $71
JUMPV
LABELV $72
line 123
;122:	}
;123:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $74
line 124
;124:		return;		// a high priority animation is running
ADDRGP4 $71
JUMPV
LABELV $74
line 126
;125:	}
;126:	PM_StartLegsAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 127
;127:}
LABELV $71
endproc PM_ContinueLegsAnim 0 4
proc PM_ContinueTorsoAnim 0 4
line 129
;128:
;129:static void PM_ContinueTorsoAnim( int anim ) {
line 130
;130:	if ( ( pm->ps->torsoAnim & ~ANIM_TOGGLEBIT ) == anim ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $77
line 131
;131:		return;
ADDRGP4 $76
JUMPV
LABELV $77
line 133
;132:	}
;133:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $79
line 134
;134:		return;		// a high priority animation is running
ADDRGP4 $76
JUMPV
LABELV $79
line 136
;135:	}
;136:	PM_StartTorsoAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 137
;137:}
LABELV $76
endproc PM_ContinueTorsoAnim 0 4
proc PM_ForceLegsAnim 0 4
line 139
;138:
;139:static void PM_ForceLegsAnim( int anim ) {
line 140
;140:	pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 141
;141:	PM_StartLegsAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 142
;142:}
LABELV $81
endproc PM_ForceLegsAnim 0 4
export PM_ClipVelocity
proc PM_ClipVelocity 32 0
line 152
;143:
;144:
;145:/*
;146:==================
;147:PM_ClipVelocity
;148:
;149:Slide off of the impacting surface
;150:==================
;151:*/
;152:void PM_ClipVelocity( vec3_t in, vec3_t normal, vec3_t out, float overbounce ) {
line 157
;153:	float	backoff;
;154:	float	change;
;155:	int		i;
;156:	
;157:	backoff = DotProduct (in, normal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRLP4 12
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
MULF4
ADDF4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 159
;158:	
;159:	if ( backoff < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $83
line 160
;160:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 161
;161:	} else {
ADDRGP4 $84
JUMPV
LABELV $83
line 162
;162:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 163
;163:	}
LABELV $84
line 165
;164:
;165:	for ( i=0 ; i<3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $85
line 166
;166:		change = normal[i]*backoff;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 167
;167:		out[i] = in[i] - change;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 168
;168:	}
LABELV $86
line 165
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $85
line 169
;169:}
LABELV $82
endproc PM_ClipVelocity 32 0
proc PM_Friction 52 4
line 179
;170:
;171:
;172:/*
;173:==================
;174:PM_Friction
;175:
;176:Handles both ground friction and water friction
;177:==================
;178:*/
;179:static void PM_Friction( void ) {
line 185
;180:	vec3_t	vec;
;181:	float	*vel;
;182:	float	speed, newspeed, control;
;183:	float	drop;
;184:	
;185:	vel = pm->ps->velocity;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 187
;186:	
;187:	VectorCopy( vel, vec );
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 188
;188:	if ( pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $90
line 189
;189:		vec[2] = 0;	// ignore slope movement
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 190
;190:	}
LABELV $90
line 192
;191:
;192:	speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 193
;193:	if (speed < 1) {
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $94
line 194
;194:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 195
;195:		vel[1] = 0;		// allow sinking underwater
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 197
;196:		// FIXME: still have z friction underwater?
;197:		return;
ADDRGP4 $89
JUMPV
LABELV $94
line 200
;198:	}
;199:
;200:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 203
;201:
;202:	// apply ground friction
;203:	if ( pm->waterlevel <= 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
GTI4 $96
line 204
;204:		if ( pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK) ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 pml+44
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $98
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $98
line 206
;205:			// if getting knocked back, no friction
;206:			if ( ! (pm->ps->pm_flags & PMF_TIME_KNOCKBACK) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $103
line 207
;207:				control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $106
ADDRLP4 40
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $107
JUMPV
LABELV $106
ADDRLP4 40
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $107
ADDRLP4 28
ADDRLP4 40
INDIRF4
ASGNF4
line 208
;208:				drop += control*pm_friction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
ADDRGP4 pm_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 209
;209:			}
LABELV $103
line 210
;210:		}
LABELV $98
line 211
;211:	}
LABELV $96
line 214
;212:
;213:	// apply water friction even if just wading
;214:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
EQI4 $109
line 215
;215:		drop += speed*pm_waterfriction*pm->waterlevel*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_waterfriction
INDIRF4
MULF4
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 216
;216:	}
LABELV $109
line 219
;217:
;218:	// apply flying friction  
;219:	if ( pm->ps->pm_type == PM_SPECTATOR  ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $112
line 220
;220:		drop += speed*pm_spectatorfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_spectatorfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 221
;221:	}
LABELV $112
line 223
;222:// Navy Seals ++
;223:	if ( NS_OnLadder() != 0 ) // ladder?
ADDRLP4 36
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $115
line 224
;224:	{
line 225
;225:		drop += speed*pm_ladderfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_ladderfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 226
;226:	}
LABELV $115
line 229
;227:// Navy Seals --
;228:	// scale the velocity
;229:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 230
;230:	if (newspeed < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $118
line 231
;231:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 232
;232:	}
LABELV $118
line 233
;233:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 235
;234:
;235:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 236
;236:	vel[1] = vel[1] * newspeed;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 237
;237:	vel[2] = vel[2] * newspeed;
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 238
;238:}
LABELV $89
endproc PM_Friction 52 4
proc PM_Accelerate 60 4
line 248
;239:
;240:
;241:/*
;242:==============
;243:PM_Accelerate
;244:
;245:Handles user intended acceleration
;246:==============
;247:*/
;248:static void PM_Accelerate( vec3_t wishdir, float wishspeed, float accel ) {
line 274
;249:#if 0
;250:	// q2 style
;251:	int			i;
;252:	float		addspeed, accelspeed, currentspeed;
;253:
;254:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
;255:	addspeed = wishspeed - currentspeed;
;256:	if (addspeed <= 0) {
;257:		return;
;258:	}
;259:	accelspeed = accel*pml.frametime*wishspeed;
;260:	if (accelspeed > addspeed) {
;261:		accelspeed = addspeed;
;262:	}
;263:	
;264:	for (i=0 ; i<3 ; i++) {
;265:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
;266:	}
;267:#else
;268:	// proper way (avoids strafe jump maxspeed bug), but feels bad
;269:	vec3_t		wishVelocity;
;270:	vec3_t		pushDir;
;271:	float		pushLen;
;272:	float		canPush;
;273:
;274:	VectorScale( wishdir, wishspeed, wishVelocity );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 275
;275:	VectorSubtract( wishVelocity, pm->ps->velocity, pushDir );
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
SUBF4
ASGNF4
line 276
;276:	pushLen = VectorNormalize( pushDir );
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 44
INDIRF4
ASGNF4
line 278
;277:
;278:	canPush = accel*pml.frametime*wishspeed;
ADDRLP4 24
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 279
;279:	if (canPush > pushLen) {
ADDRLP4 24
INDIRF4
ADDRLP4 28
INDIRF4
LEF4 $128
line 280
;280:		canPush = pushLen;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ASGNF4
line 281
;281:	}
LABELV $128
line 283
;282:
;283:	VectorMA( pm->ps->velocity, canPush, pushDir, pm->ps->velocity );
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 285
;284:#endif
;285:}
LABELV $120
endproc PM_Accelerate 60 4
proc PM_CmdScale 44 4
line 298
;286:
;287:
;288:
;289:/*
;290:============
;291:PM_CmdScale
;292:
;293:Returns the scale factor to apply to cmd movements
;294:This allows the clients to use axial -127 to 127 values for all directions
;295:without getting a sqrt(2) distortion in speed.
;296:============
;297:*/
;298:static float PM_CmdScale( usercmd_t *cmd ) {
line 303
;299:	int		max;
;300:	float	total;
;301:	float	scale;
;302:
;303:	max = abs( cmd->forwardmove );
ADDRFP4 0
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 304
;304:	if ( abs( cmd->rightmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $133
line 305
;305:		max = abs( cmd->rightmove );
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 306
;306:	}
LABELV $133
line 307
;307:	if ( abs( cmd->upmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $135
line 308
;308:		max = abs( cmd->upmove );
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 309
;309:	}
LABELV $135
line 310
;310:	if ( !max ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $137
line 311
;311:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $132
JUMPV
LABELV $137
line 314
;312:	}
;313:
;314:	total = sqrt( cmd->forwardmove * cmd->forwardmove
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
ADDRLP4 24
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 28
INDIRI4
MULI4
ADDRLP4 32
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
ADDI4
ADDRLP4 36
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 40
INDIRF4
ASGNF4
line 316
;315:		+ cmd->rightmove * cmd->rightmove + cmd->upmove * cmd->upmove );
;316:	scale = (float)pm->ps->speed * max / ( 127.0 * total );
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CNSTF4 1123942400
ADDRLP4 4
INDIRF4
MULF4
DIVF4
ASGNF4
line 318
;317:
;318:	return scale;
ADDRLP4 8
INDIRF4
RETF4
LABELV $132
endproc PM_CmdScale 44 4
proc PM_SetMovementDir 72 0
line 330
;319:}
;320:
;321:
;322:/*
;323:================
;324:PM_SetMovementDir
;325:
;326:Determine the rotation of the legs reletive
;327:to the facing dir
;328:================
;329:*/
;330:static void PM_SetMovementDir( void ) {
line 331
;331:	if ( pm->cmd.forwardmove || pm->cmd.rightmove ) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $142
ADDRLP4 0
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
EQI4 $140
LABELV $142
line 332
;332:		if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove > 0 ) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $143
ADDRLP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
LEI4 $143
line 333
;333:			pm->ps->movementDir = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 334
;334:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $141
JUMPV
LABELV $143
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
GEI4 $145
ADDRLP4 16
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
LEI4 $145
line 335
;335:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 336
;336:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $141
JUMPV
LABELV $145
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
GEI4 $147
ADDRLP4 24
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
NEI4 $147
line 337
;337:			pm->ps->movementDir = 2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 2
ASGNI4
line 338
;338:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $141
JUMPV
LABELV $147
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
GEI4 $149
ADDRLP4 32
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
GEI4 $149
line 339
;339:			pm->ps->movementDir = 3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 3
ASGNI4
line 340
;340:		} else if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $141
JUMPV
LABELV $149
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $151
ADDRLP4 40
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
GEI4 $151
line 341
;341:			pm->ps->movementDir = 4;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 4
ASGNI4
line 342
;342:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $141
JUMPV
LABELV $151
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
LEI4 $153
ADDRLP4 48
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
GEI4 $153
line 343
;343:			pm->ps->movementDir = 5;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 5
ASGNI4
line 344
;344:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $141
JUMPV
LABELV $153
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
LEI4 $155
ADDRLP4 56
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $155
line 345
;345:			pm->ps->movementDir = 6;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 6
ASGNI4
line 346
;346:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $141
JUMPV
LABELV $155
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
LEI4 $141
ADDRLP4 64
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
LEI4 $141
line 347
;347:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 348
;348:		}
line 349
;349:	} else {
ADDRGP4 $141
JUMPV
LABELV $140
line 353
;350:		// if they aren't actively going directly sideways,
;351:		// change the animation to the diagonal so they
;352:		// don't stop too crooked
;353:		if ( pm->ps->movementDir == 2 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 2
NEI4 $159
line 354
;354:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 355
;355:		} else if ( pm->ps->movementDir == 6 ) {
ADDRGP4 $160
JUMPV
LABELV $159
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 6
NEI4 $161
line 356
;356:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 357
;357:		} 
LABELV $161
LABELV $160
line 358
;358:	}
LABELV $141
line 359
;359:}
LABELV $139
endproc PM_SetMovementDir 72 0
proc PM_CheckJump 24 4
line 367
;360:
;361:
;362:/*
;363:=============
;364:PM_CheckJump
;365:=============
;366:*/
;367:static qboolean PM_CheckJump( void ) {
line 368
;368:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $164
line 369
;369:		return qfalse;		// don't allow jump until all buttons are up
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $164
line 371
;370:	}
;371:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $166
line 373
;372:		// not holding jump
;373:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $166
line 376
;374:	}
;375:
;376:	if ( pm->ps->pm_flags & PMF_TIME_LAND &&
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $168
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $168
line 378
;377:		pm->ps->pm_time > 0 )
;378:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $168
line 382
;379:
;380:	// Navy Seals ++
;381:		// don't allow jump if we got major leg damage
;382:	if ( pm->ps->stats[STAT_LEG_DAMAGE] > 40 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 40
LEI4 $170
line 383
;383:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $170
line 385
;384:	// need some stamina.. .against bunnyhopping
;385:	if (pm->ps->stats[STAT_STAMINA] < 25 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 25
GEI4 $172
line 386
;386:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $172
line 390
;387:
;388:// Navy Seals --
;389:	// must wait for jump to be released
;390:	if ( pm->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $174
line 392
;391:		// clear upmove so cmdscale doesn't lower running speed
;392:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 393
;393:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $174
line 396
;394:	}
;395:
;396:	pml.groundPlane = qfalse;		// jumping away
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 397
;397:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 398
;398:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 400
;399:
;400:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 403
;401:
;402:	// Navy Seals ++
;403:	if ( pm->ps->stats[STAT_LEG_DAMAGE] > 5) // leg damage lowers jumping ability
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 5
LEI4 $178
line 404
;404:		pm->ps->velocity[2] = JUMP_VELOCITY - ( pm->ps->stats[STAT_LEG_DAMAGE] * 2 );
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 270
ADDRLP4 12
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LSHI4
SUBI4
CVIF4 4
ASGNF4
ADDRGP4 $179
JUMPV
LABELV $178
line 406
;405:	else
;406:		pm->ps->velocity[2] = JUMP_VELOCITY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132920832
ASGNF4
LABELV $179
line 412
;407:	// Navy Seals --
;408:
;409:	// Navy Seals ++
;410:
;411:	// drain stamina when jumping
;412:	if (pm->ps->stats[STAT_STAMINA] > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 0
LEI4 $180
line 413
;413:		pm->ps->stats[STAT_STAMINA] -= 25;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 25
SUBI4
ASGNI4
LABELV $180
line 415
;414:
;415:	if (pm->ps->stats[STAT_STAMINA] < 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 0
GEI4 $182
line 416
;416:		pm->ps->stats[STAT_STAMINA] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
LABELV $182
line 424
;417:
;418:	// Navy Seals --
;419:
;420:	// Navy Seals ++ : no jump sound
;421:	// PM_AddEvent( EV_JUMP );
;422:
;423:/*	if ( pm->cmd.forwardmove >= 0 ) {*/
;424:		PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 50
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 425
;425:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 431
;426:/*	}/* else {
;427:		PM_ForceLegsAnim( LEGS_JUMPB );
;428:		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
;429:	}*/
;430:
;431:	return qtrue;
CNSTI4 1
RETI4
LABELV $163
endproc PM_CheckJump 24 4
proc PM_CheckWaterJump 56 8
line 439
;432:}
;433:
;434:/*
;435:=============
;436:PM_CheckWaterJump
;437:=============
;438:*/
;439:static qboolean	PM_CheckWaterJump( void ) {
line 444
;440:	vec3_t	spot;
;441:	int		cont;
;442:	vec3_t	flatforward;
;443:
;444:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $185
line 445
;445:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $184
JUMPV
LABELV $185
line 449
;446:	}
;447:
;448:	// check for water jump
;449:	if ( pm->waterlevel != 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
EQI4 $187
line 450
;450:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $184
JUMPV
LABELV $187
line 453
;451:	}
;452:
;453:	flatforward[0] = pml.forward[0];
ADDRLP4 12
ADDRGP4 pml
INDIRF4
ASGNF4
line 454
;454:	flatforward[1] = pml.forward[1];
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 455
;455:	flatforward[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 456
;456:	VectorNormalize (flatforward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 458
;457:
;458:	VectorMA (pm->ps->origin, 30, flatforward, spot);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 1106247680
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1106247680
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 459
;459:	spot[2] += 4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 460
;460:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 461
;461:	if ( !(cont & CONTENTS_SOLID) ) {
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $197
line 462
;462:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $184
JUMPV
LABELV $197
line 465
;463:	}
;464:
;465:	spot[2] += 12;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 466
;466:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 48
INDIRI4
ASGNI4
line 467
;467:	if ( cont ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $200
line 468
;468:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $184
JUMPV
LABELV $200
line 472
;469:	}
;470:
;471:	// jump out of water
;472:	VectorScale (pml.forward, 200, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1128792064
ADDRGP4 pml
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1128792064
ADDRGP4 pml+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ADDRGP4 pml+8
INDIRF4
MULF4
ASGNF4
line 473
;473:	pm->ps->velocity[2] = 450;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1138819072
ASGNF4
line 475
;474:
;475:	pm->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 476
;476:	pm->ps->pm_time = 2000;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 2000
ASGNI4
line 478
;477:
;478:	return qtrue;
CNSTI4 1
RETI4
LABELV $184
endproc PM_CheckWaterJump 56 8
export NS_OnLadder
proc NS_OnLadder 152 28
line 497
;479:}
;480:
;481://============================================================================
;482:
;483:// Navy Seals ++
;484:
;485:/*
;486:=============
;487:NS_OnLadder (...)
;488:date = 8-2-99
;489:author = dX 
;490:
;491:  return value:		-2 = trying to climb up/down ladder (finish/start)
;492:					-1 = climbing
;493:					0 = no
;494:=============
;495:*/
;496:int NS_OnLadder( void )
;497:{
line 504
;498:	vec3_t forward,spot;
;499:	vec3_t spot2;
;500:	trace_t trace;
;501:	vec3_t	traceMins;
;502:	vec3_t	traceMaxs;
;503:
;504:	if ( pm->cmd.upmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $205
line 505
;505:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $204
JUMPV
LABELV $205
line 506
;506:	if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $207
line 507
;507:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $204
JUMPV
LABELV $207
line 508
;508:	traceMins[0] = -16;
ADDRLP4 92
CNSTF4 3246391296
ASGNF4
line 509
;509:	traceMins[1] = -16;
ADDRLP4 92+4
CNSTF4 3246391296
ASGNF4
line 510
;510:	traceMins[2] = -16;
ADDRLP4 92+8
CNSTF4 3246391296
ASGNF4
line 512
;511:
;512:	traceMaxs[0] = 16;
ADDRLP4 104
CNSTF4 1098907648
ASGNF4
line 513
;513:	traceMaxs[1] = 16;
ADDRLP4 104+4
CNSTF4 1098907648
ASGNF4
line 514
;514:	traceMaxs[2] = 16;
ADDRLP4 104+8
CNSTF4 1098907648
ASGNF4
line 517
;515:
;516:	// check for ladder
;517:	forward[0] = pml.forward[0];
ADDRLP4 12
ADDRGP4 pml
INDIRF4
ASGNF4
line 518
;518:	forward[1] = pml.forward[1];
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 519
;519:	forward[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 521
;520:
;521:	VectorNormalize (forward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 523
;522:	// trace 1 unit
;523:	VectorMA (pm->ps->origin, 2 ,forward, spot);
ADDRLP4 116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 120
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 120
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 120
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 525
;524:
;525:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, spot,
ADDRLP4 24
ARGP4
ADDRLP4 124
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 128
ADDRLP4 124
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRLP4 124
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 528
;526:		pm->ps->clientNum, MASK_PLAYERSOLID);
;527:
;528:	if ( pm->ps->pm_type == PM_DEAD )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $220
line 529
;529:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $204
JUMPV
LABELV $220
line 531
;530:
;531:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $222
line 532
;532:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $204
JUMPV
LABELV $222
line 534
;533:
;534:	if ((trace.fraction < 1) && (trace.surfaceFlags & SURF_LADDER)) {
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $224
ADDRLP4 24+44
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $224
line 536
;535:		// standing on ground(succefully climbed down) and moving back, no time to climb
;536:		if ( pml.groundPlane && pm->cmd.forwardmove <= -15 )
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $228
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 -15
GTI4 $228
line 537
;537:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $204
JUMPV
LABELV $228
line 539
;538:		// else still on ladder
;539:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $204
JUMPV
LABELV $224
line 542
;540:	}		 
;541: 
;542:	VectorClear( spot);
ADDRLP4 132
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 132
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 132
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 132
INDIRF4
ASGNF4
line 544
;543:
;544:	VectorMA (pm->ps->origin, -5, forward, spot );
ADDRLP4 136
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 140
CNSTF4 3231711232
ASGNF4
ADDRLP4 0
ADDRLP4 136
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 136
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3231711232
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 546
;545:	
;546:	spot[2] -= 25; // adjust height
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1103626240
SUBF4
ASGNF4
line 548
;547:
;548:	VectorMA( spot, 10, forward, spot2 );
ADDRLP4 144
CNSTF4 1092616192
ASGNF4
ADDRLP4 80
ADDRLP4 0
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 550
;549:	
;550:	pm->trace ( &trace, spot,traceMins,traceMaxs, spot2, pm->ps->clientNum, MASK_PLAYERSOLID );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 148
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 552
;551:
;552:	if ((trace.fraction < 1) && (trace.surfaceFlags & SURF_LADDER)  ) 
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $244
ADDRLP4 24+44
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $244
line 553
;553:	{ 
line 554
;554:		if ( pml.groundPlane )
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $248
line 555
;555:			return -2; // standing on plane, allow forward/backward movement
CNSTI4 -2
RETI4
ADDRGP4 $204
JUMPV
LABELV $248
line 557
;556:		else 
;557:		{ 
line 559
;558:			// no, only upwards/downwards climbing
;559:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $204
JUMPV
LABELV $244
line 562
;560:		}
;561:	} 	 
;562:	return 0;
CNSTI4 0
RETI4
LABELV $204
endproc NS_OnLadder 152 28
proc PM_LadderMove 80 16
line 576
;563:}
;564:
;565:/*
;566:===================
;567:PM_LadderMove(...)
;568:date = 7-2-99
;569:author = dX 
;570:
;571:  basically the same as water move, some smaller changes here and there
;572:  needs some more improvements...
;573:
;574:===================
;575:*/
;576:static void PM_LadderMove( void ) {
line 584
;577:	int i;
;578:	vec3_t wishvel;
;579:	float wishspeed;
;580:	vec3_t wishdir;
;581:	float scale;
;582:	float vel;
;583:
;584:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 601
;585: 
;586:	// jump out of water
;587:#if 0
;588:	if ( pm->cmd.upmove > 0 )
;589:	{ 
;590:		VectorScale (pml.forward, -100, pm->ps->velocity);
;591:
;592:		pm->ps->pm_flags |= PMF_TIME_WATERJUMP;
;593:		pm->ps->pm_time = 3000;
;594:
;595:		PM_ForceLegsAnim( LEGS_JUMP );
;596:		return;
;597:	}
;598:#endif
;599:
;600:	// get user input
;601:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 40
INDIRF4
ASGNF4
line 603
;602:
;603:	VectorClear(wishvel); 
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 8+8
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 44
INDIRF4
ASGNF4
line 605
;604:
;605:	for (i=0 ; i<3 ; i++) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $254
line 606
;606:		if ( NS_OnLadder() == -1 )
ADDRLP4 48
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 -1
NEI4 $258
line 607
;607:		{
line 608
;608:			if ( i < 2 )
ADDRLP4 0
INDIRI4
CNSTI4 2
GEI4 $259
line 609
;609:			{
line 610
;610:				if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $262
line 611
;611:				{
line 612
;612:					wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + 
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 52
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 60
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 52
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 60
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 614
;613:				     scale * pml.right[i]*pm->cmd.rightmove;  
;614:				}
ADDRGP4 $259
JUMPV
LABELV $262
line 616
;615:				else
;616:					wishvel[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 617
;617:			}
line 618
;618:		}
ADDRGP4 $259
JUMPV
LABELV $258
line 620
;619:		// not midair, but still walking towards 
;620:		else if ( NS_OnLadder() == -2 )  {
ADDRLP4 52
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 -2
NEI4 $265
line 621
;621:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + 
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 623
;622:				     scale * pml.right[i]*pm->cmd.rightmove;  
;623:		}
ADDRGP4 $266
JUMPV
LABELV $265
line 624
;624:		else {
line 625
;625:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + 
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 634
;626:				     scale * pml.right[i]*pm->cmd.rightmove;  
;627:			/*
;628:			if ( pm->cmd.forwardmove > 0 )
;629:				wishvel[i] = scale * pml.right[i]*pm->cmd.rightmove + pml.forward[i]*pm->cmd.forwardmove;
;630:			else if ( pm->cmd.forwardmove < 0 ) 
;631:				wishvel[i] = scale * pml.right[i]*pm->cmd.rightmove + pml.forward[i]*(pm->cmd.forwardmove*-1);
;632:		//	else*/
;633:			//	wishvel[i] = scale * pml.right[i]*pm->cmd.rightmove; 
;634:		}
LABELV $266
LABELV $259
line 636
;635:		
;636:	}
LABELV $255
line 605
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $254
line 637
;637:	wishvel[2] = scale * pm->cmd.forwardmove + scale  ; 
ADDRLP4 8+8
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 639
;638:
;639:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 640
;640:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 52
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 642
;641:
;642:	if ( wishspeed > pm->ps->speed * pm_ladderScale ) {
ADDRLP4 20
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_ladderScale
INDIRF4
MULF4
LEF4 $270
line 643
;643:		wishspeed = pm->ps->speed * pm_ladderScale;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_ladderScale
INDIRF4
MULF4
ASGNF4
line 644
;644:	}
LABELV $270
line 646
;645:
;646:	PM_Accelerate (wishdir, wishspeed, pm_ladderaccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 pm_ladderaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 648
;647:
;648:	if ( pml.groundPlane && DotProduct( pm->ps->velocity,
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $272
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 56
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $272
line 650
;649:		pml.groundTrace.plane.normal ) < 0 ) {
;650:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 60
INDIRF4
ASGNF4
line 651
;651:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 654
;652:			pm->ps->velocity, OVERCLIP );
;653:
;654:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 655
;655:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 656
;656:	}
LABELV $272
line 658
;657:
;658:	PM_SlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 663
;659:
;660: 
;661:
;662: 
;663:} 
LABELV $251
endproc PM_LadderMove 80 16
proc PM_WaterJumpMove 8 4
line 674
;664:
;665:// Navy Seals --
;666:
;667:/*
;668:===================
;669:PM_WaterJumpMove
;670:
;671:Flying out of the water
;672:===================
;673:*/
;674:static void PM_WaterJumpMove( void ) {
line 677
;675:	// waterjump has no control, but falls
;676:
;677:	PM_StepSlideMove( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 679
;678:
;679:	pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 685
;680://	if (pm->ps->velocity[2] < 0) {
;681:		// cancel as soon as we are falling down again
;682://		pm->ps->pm_flags &= ~PMF_ALL_TIMES;
;683://		pm->ps->pm_time = 0;
;684://	}
;685:}
LABELV $285
endproc PM_WaterJumpMove 8 4
proc PM_WaterMove 76 16
line 693
;686:
;687:/*
;688:===================
;689:PM_WaterMove
;690:
;691:===================
;692:*/
;693:static void PM_WaterMove( void ) {
line 701
;694:	int		i;
;695:	vec3_t	wishvel;
;696:	float	wishspeed;
;697:	vec3_t	wishdir;
;698:	float	scale;
;699:	float	vel;
;700:
;701:	if ( PM_CheckWaterJump() ) {
ADDRLP4 40
ADDRGP4 PM_CheckWaterJump
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $288
line 702
;702:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 703
;703:		return;
ADDRGP4 $287
JUMPV
LABELV $288
line 707
;704:	}
;705:#if 1
;706:	// jump = head for surface
;707:	if ( pm->cmd.upmove >= 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
LTI4 $290
line 708
;708:		if (pm->ps->velocity[2] > -300) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 3281387520
LEF4 $292
line 709
;709:			if ( pm->watertype == CONTENTS_WATER ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 32
NEI4 $294
line 710
;710:				pm->ps->velocity[2] = 100;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1120403456
ASGNF4
line 711
;711:			} else if (pm->watertype == CONTENTS_SLIME) {
ADDRGP4 $295
JUMPV
LABELV $294
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 16
NEI4 $296
line 712
;712:				pm->ps->velocity[2] = 80;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1117782016
ASGNF4
line 713
;713:			} else {
ADDRGP4 $297
JUMPV
LABELV $296
line 714
;714:				pm->ps->velocity[2] = 50;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1112014848
ASGNF4
line 715
;715:			}
LABELV $297
LABELV $295
line 716
;716:		}
LABELV $292
line 717
;717:	}
LABELV $290
line 719
;718:#endif
;719:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 721
;720:
;721:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 44
INDIRF4
ASGNF4
line 725
;722:	//
;723:	// user intentions
;724:	//
;725:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $298
line 726
;726:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 727
;727:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 728
;728:		wishvel[2] = -60;		// sink towards bottom
ADDRLP4 8+8
CNSTF4 3262119936
ASGNF4
line 729
;729:	} else {
ADDRGP4 $299
JUMPV
LABELV $298
line 730
;730:		for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $302
line 731
;731:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $303
line 730
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $302
line 733
;732:
;733:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 734
;734:	}
LABELV $299
line 736
;735:
;736:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 737
;737:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 739
;738:
;739:	if ( wishspeed > pm->ps->speed * pm_swimScale ) {
ADDRLP4 20
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
LEF4 $308
line 740
;740:		wishspeed = pm->ps->speed * pm_swimScale;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
ASGNF4
line 741
;741:	}
LABELV $308
line 743
;742:
;743:	PM_Accelerate (wishdir, wishspeed, pm_wateraccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 pm_wateraccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 746
;744:
;745:	// make sure we can go up slopes easily under water
;746:	if ( pml.groundPlane && DotProduct( pm->ps->velocity, pml.groundTrace.plane.normal ) < 0 ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $310
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $310
line 747
;747:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 56
INDIRF4
ASGNF4
line 749
;748:		// slide along the ground plane
;749:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 752
;750:			pm->ps->velocity, OVERCLIP );
;751:
;752:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 753
;753:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 754
;754:	}
LABELV $310
line 756
;755:
;756:	PM_SlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 757
;757:}
LABELV $287
endproc PM_WaterMove 76 16
proc PM_AirMove 80 16
line 808
;758:  
;759:#if 0
;760:/*
;761:===================
;762:PM_FlyMove
;763:
;764:Only with the flight powerup
;765:===================
;766:*/
;767:static void PM_FlyMove( void ) {
;768:	int		i;
;769:	vec3_t	wishvel;
;770:	float	wishspeed;
;771:	vec3_t	wishdir;
;772:	float	scale;
;773:
;774:	// normal slowdown
;775:	PM_Friction ();
;776:
;777:	scale = PM_CmdScale( &pm->cmd );
;778:	//
;779:	// user intentions
;780:	//
;781:	if ( !scale ) {
;782:		wishvel[0] = 0;
;783:		wishvel[1] = 0;
;784:		wishvel[2] = 0;
;785:	} else {
;786:		for (i=0 ; i<3 ; i++) {
;787:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
;788:		}
;789:
;790:		wishvel[2] += scale * pm->cmd.upmove;
;791:	}
;792:
;793:	VectorCopy (wishvel, wishdir);
;794:	wishspeed = VectorNormalize(wishdir);
;795:
;796:	PM_Accelerate (wishdir, wishspeed, pm_flyaccelerate);
;797:
;798:	PM_StepSlideMove( qfalse );
;799:}
;800:#endif
;801:
;802:/*
;803:===================
;804:PM_AirMove
;805:
;806:===================
;807:*/
;808:static void PM_AirMove( void ) {
line 817
;809:	int			i;
;810:	vec3_t		wishvel;
;811:	float		fmove, smove;
;812:	vec3_t		wishdir;
;813:	float		wishspeed;
;814:	float		scale;
;815:	usercmd_t	cmd;
;816:
;817:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 819
;818:
;819:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 820
;820:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 822
;821:
;822:	cmd = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 823
;823:	scale = PM_CmdScale( &cmd );
ADDRLP4 44
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 68
INDIRF4
ASGNF4
line 826
;824:
;825:	// set the movementDir so clients can rotate the legs for strafing
;826:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 829
;827:
;828:	// project moves down to flat plane
;829:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 830
;830:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 831
;831:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 832
;832:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 834
;833:
;834:	for ( i = 0 ; i < 2 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $328
line 835
;835:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 72
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 72
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 836
;836:	}
LABELV $329
line 834
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $328
line 837
;837:	wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 839
;838:
;839:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 840
;840:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 72
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 72
INDIRF4
ASGNF4
line 841
;841:	wishspeed *= scale;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 844
;842:
;843:	// not on ground, so little effect on velocity
;844:	PM_Accelerate (wishdir, wishspeed, pm_airaccelerate );
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm_airaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 849
;845:
;846:	// we may have a ground plane that is very steep, even
;847:	// though we don't have a groundentity
;848:	// slide along the steep plane
;849:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $334
line 850
;850:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 852
;851:			pm->ps->velocity, OVERCLIP );
;852:	}
LABELV $334
line 864
;853:
;854:#if 0
;855:	//ZOID:  If we are on the grapple, try stair-stepping
;856:	//this allows a player to use the grapple to pull himself
;857:	//over a ledge
;858://	if (pm->ps->pm_flags & PMF_GRAPPLE_PULL)
;859://		PM_StepSlideMove ( qtrue );
;860://	else
;861:		PM_SlideMove ( qtrue );
;862:#endif
;863:
;864:	PM_StepSlideMove ( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 865
;865:}
LABELV $323
endproc PM_AirMove 80 16
proc PM_GetSprintScale 8 0
line 894
;866:
;867:/*
;868:===================
;869:PM_GrappleMove
;870:
;871:===================
;872:static void PM_GrappleMove( void ) {
;873:	vec3_t vel, v;
;874:	float vlen;
;875:
;876:	VectorScale(pml.forward, -16, v);
;877:	VectorAdd(pm->ps->grapplePoint, v, v);
;878:	VectorSubtract(v, pm->ps->origin, vel);
;879:	vlen = VectorLength(vel);
;880:	VectorNormalize( vel );
;881:
;882:	if (vlen <= 100)
;883:		VectorScale(vel, 10 * vlen, vel);
;884:	else
;885:		VectorScale(vel, 800, vel);
;886:
;887:	VectorCopy(vel, pm->ps->velocity);
;888:
;889:	pml.groundPlane = qfalse;
;890:}
;891:*/
;892:
;893:static float PM_GetSprintScale( void )
;894:{
line 895
;895:	int speed = pm->ps->persistant[PERS_SPEED];
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
line 896
;896:	float	base = pm_sprintScale;
ADDRLP4 0
ADDRGP4 pm_sprintScale
INDIRF4
ASGNF4
line 898
;897:
;898:	base -= (float)( (float)speed / 10.0f ) * 0.50;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1092616192
DIVF4
MULF4
SUBF4
ASGNF4
line 900
;899:
;900:	return base;
ADDRLP4 0
INDIRF4
RETF4
LABELV $339
endproc PM_GetSprintScale 8 0
proc PM_WalkMove 208 16
line 908
;901:}
;902:/*
;903:===================
;904:PM_WalkMove
;905:
;906:===================
;907:*/
;908:static void PM_WalkMove( void ) {
line 920
;909:	int			i;
;910:	vec3_t		wishvel;
;911:	float		fmove, smove;
;912:	vec3_t		wishdir;
;913:	float		wishspeed;
;914:	float		scale;
;915:	usercmd_t	cmd;
;916:	float		accelerate;
;917:	float		vel;
;918:	vec3_t  dist;
;919:
;920:	if ( pm->waterlevel > 2 && DotProduct( pml.forward, pml.groundTrace.plane.normal ) > 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
LEI4 $341
ADDRGP4 pml
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRGP4 pml+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $341
line 922
;921:		// begin swimming
;922:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 923
;923:		return;
ADDRGP4 $340
JUMPV
LABELV $341
line 927
;924:	}
;925:
;926:
;927:	if ( PM_CheckJump () ) {
ADDRLP4 88
ADDRGP4 PM_CheckJump
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $353
line 929
;928:		// jumped away
;929:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LEI4 $355
line 930
;930:			PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 931
;931:		} else {
ADDRGP4 $340
JUMPV
LABELV $355
line 932
;932:			PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 933
;933:		}
line 934
;934:		return;
ADDRGP4 $340
JUMPV
LABELV $353
line 937
;935:	}
;936:
;937:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 939
;938:
;939:	fmove = pm->cmd.forwardmove;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 940
;940:	smove = pm->cmd.rightmove;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 942
;941:
;942:	cmd = pm->cmd;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 943
;943:	scale = PM_CmdScale( &cmd );
ADDRLP4 48
ARGP4
ADDRLP4 92
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 92
INDIRF4
ASGNF4
line 946
;944:
;945:	// set the movementDir so clients can rotate the legs for strafing
;946:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 949
;947:
;948:	// project moves down to flat plane
;949:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 950
;950:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 953
;951:
;952:	// project the forward and right directions onto the ground plane
;953:	PM_ClipVelocity (pml.forward, pml.groundTrace.plane.normal, pml.forward, OVERCLIP );
ADDRLP4 96
ADDRGP4 pml
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 954
;954:	PM_ClipVelocity (pml.right, pml.groundTrace.plane.normal, pml.right, OVERCLIP );
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pml+12
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 956
;955:	//
;956:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 957
;957:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 959
;958:
;959:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $367
line 960
;960:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 100
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 12
ADDP4
ADDRLP4 100
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 100
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 961
;961:	}
LABELV $368
line 959
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $367
line 965
;962:	// when going up or down slopes the wish velocity should Not be zero
;963://	wishvel[2] = 0;
;964:
;965:	VectorCopy (wishvel, wishdir);
ADDRLP4 32
ADDRLP4 12
INDIRB
ASGNB 12
line 966
;966:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 100
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 100
INDIRF4
ASGNF4
line 967
;967:	wishspeed *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 969
;968:
;969:	{
line 970
;970:		float	pm_backScale = 0.60f;
ADDRLP4 104
CNSTF4 1058642330
ASGNF4
line 971
;971:		float	pm_sideScale = 0.75f;
ADDRLP4 108
CNSTF4 1061158912
ASGNF4
line 973
;972:
;973:		if ( fmove < 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $372
line 974
;974:			if ( wishspeed > pm->ps->speed * pm_backScale )
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 104
INDIRF4
MULF4
LEF4 $374
line 975
;975:				wishspeed = pm->ps->speed * pm_backScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 104
INDIRF4
MULF4
ASGNF4
LABELV $374
line 976
;976:		}
LABELV $372
line 977
;977:		if ( smove != 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $376
line 978
;978:			if ( wishspeed > pm->ps->speed * pm_sideScale )
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 108
INDIRF4
MULF4
LEF4 $378
line 979
;979:				wishspeed = pm->ps->speed * pm_sideScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 108
INDIRF4
MULF4
ASGNF4
LABELV $378
line 980
;980:		}
LABELV $376
line 982
;981:
;982:	}
line 985
;983:
;984:	// adjust speed for sprinting
;985:	if ( pm->cmd.buttons & BUTTON_SPRINT ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $380
line 986
;986:		if ( pm->ps->stats[STAT_STAMINA] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 0
EQI4 $381
line 987
;987:			int	xyzspeed = sqrt( pm->ps->velocity[0] * pm->ps->velocity[0]
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 112
ADDRLP4 108
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 116
ADDRLP4 108
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 120
ADDRLP4 108
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 112
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 116
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDF4
ADDRLP4 120
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 124
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 104
ADDRLP4 124
INDIRF4
CVFI4 4
ASGNI4
line 991
;988:				+  pm->ps->velocity[1] * pm->ps->velocity[1]
;989:				+  pm->ps->velocity[2] * pm->ps->velocity[2] );
;990:
;991:			if ( ( pm->cmd.forwardmove > 0 /* && pm->cmd.rightmove == 0 */ ) &&
ADDRLP4 128
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 132
INDIRI4
LEI4 $381
ADDRLP4 104
INDIRI4
CNSTI4 50
LEI4 $381
ADDRLP4 128
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 132
INDIRI4
NEI4 $381
ADDRLP4 128
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $381
line 997
;992:				 xyzspeed > 50 && 
;993:				!(pm->cmd.buttons & BUTTON_WALKING) &&
;994:			/*	pm->ps->stats[STAT_LEG_DAMAGE] < 25  && */
;995:				pm->ps->groundEntityNum != ENTITYNUM_NONE 
;996:				)
;997:			{
line 999
;998:				int fixme; // !insert formula 
;999:				int mod = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1001
;1000:
;1001:				switch ( pm->ps->persistant[PERS_STAMINA] ) {
ADDRLP4 144
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $386
ADDRLP4 144
INDIRI4
CNSTI4 10
GTI4 $386
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $395
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $395
address $389
address $389
address $390
address $391
address $391
address $392
address $392
address $393
address $393
address $394
address $394
code
LABELV $389
line 1004
;1002:				case 0:
;1003:				case 1:
;1004:					mod = 1;
ADDRLP4 136
CNSTI4 1
ASGNI4
line 1005
;1005:					break;
ADDRGP4 $387
JUMPV
LABELV $390
line 1007
;1006:				case 2:
;1007:					mod = 1;					
ADDRLP4 136
CNSTI4 1
ASGNI4
line 1008
;1008:					break;
ADDRGP4 $387
JUMPV
LABELV $391
line 1011
;1009:				case 3:
;1010:				case 4:
;1011:					mod = 2;
ADDRLP4 136
CNSTI4 2
ASGNI4
line 1012
;1012:					break;
ADDRGP4 $387
JUMPV
LABELV $392
line 1015
;1013:				case 5:
;1014:				case 6:
;1015:					mod = 2;
ADDRLP4 136
CNSTI4 2
ASGNI4
line 1016
;1016:					break;
ADDRGP4 $387
JUMPV
LABELV $393
line 1019
;1017:				case 7:
;1018:				case 8:
;1019:					mod = 3;
ADDRLP4 136
CNSTI4 3
ASGNI4
line 1020
;1020:					break;
ADDRGP4 $387
JUMPV
LABELV $394
line 1023
;1021:				case 9:
;1022:				case 10:
;1023:					mod = 3;
ADDRLP4 136
CNSTI4 3
ASGNI4
line 1024
;1024:					break;
ADDRGP4 $387
JUMPV
LABELV $386
line 1026
;1025:				default:
;1026:					mod = 1;
ADDRLP4 136
CNSTI4 1
ASGNI4
line 1027
;1027:					break;
LABELV $387
line 1029
;1028:				}
;1029:				fixme = 5 - mod;
ADDRLP4 140
CNSTI4 5
ADDRLP4 136
INDIRI4
SUBI4
ASGNI4
line 1034
;1030:			
;1031:	//			Com_Printf("sta lvl: %i mod: %i powr: %i scale: %f\n", pm->ps->persistant[PERS_STAMINA],
;1032:	//				mod, pm->ps->stats[STAT_STAMINA], PM_GetSprintScale() );
;1033:
;1034:				if ( ( pm->ps->stats[PW_VEST] || pm->ps->stats[PW_HELMET] ) && pm->ps->persistant[PERS_STAMINA] < 5)
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 156
CNSTI4 0
ASGNI4
ADDRLP4 152
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 156
INDIRI4
NEI4 $398
ADDRLP4 152
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 156
INDIRI4
EQI4 $396
LABELV $398
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 5
GEI4 $396
line 1035
;1035:					fixme++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $396
line 1039
;1036:			/*	if ( pm->ps->stats[PW_VEST] && pm->ps->persistant[PERS_STAMINA] < 5 )
;1037:					fixme++;
;1038:*/
;1039:				if (fixme <= 0)
ADDRLP4 140
INDIRI4
CNSTI4 0
GTI4 $399
line 1040
;1040:					fixme = 1;
ADDRLP4 140
CNSTI4 1
ASGNI4
LABELV $399
line 1044
;1041:
;1042:				
;1043:				// whee, Stamina fix
;1044:				VectorSubtract(pm->ps->origin, pm_previous_origin[pm->ps->clientNum], dist);
ADDRLP4 160
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 164
ADDRLP4 160
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 168
CNSTI4 12
ASGNI4
ADDRLP4 172
CNSTI4 140
ASGNI4
ADDRLP4 76
ADDRLP4 164
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 168
INDIRI4
ADDRLP4 164
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 pm_previous_origin
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 176
ADDRLP4 160
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76+4
ADDRLP4 176
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 168
INDIRI4
ADDRLP4 176
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 pm_previous_origin+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 180
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76+8
ADDRLP4 180
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTI4 12
ADDRLP4 180
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 pm_previous_origin+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1045
;1045:				if (VectorLength(dist) > 12) {
ADDRLP4 76
ARGP4
ADDRLP4 184
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 184
INDIRF4
CNSTF4 1094713344
LEF4 $405
line 1047
;1046:					
;1047:					VectorCopy(pm->ps->origin, pm_previous_origin[pm->ps->clientNum]);
ADDRLP4 188
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 12
ADDRLP4 188
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 pm_previous_origin
ADDP4
ADDRLP4 188
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1048
;1048:					if (pm_previous_origin[pm->ps->clientNum] == 0) {
CNSTI4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 pm_previous_origin
ADDP4
CVPU4 4
CNSTU4 0
NEU4 $407
line 1049
;1049:						pm_lastsprint[pm->ps->clientNum] = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm_lastsprint
ADDP4
CNSTI4 1
ASGNI4
line 1050
;1050:						pm->ps->stats[STAT_STAMINA] -= fixme;
ADDRLP4 192
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
ASGNI4
line 1051
;1051:					} else {
ADDRGP4 $408
JUMPV
LABELV $407
line 1052
;1052:						if ( (VectorLength(dist) / 12) > 4)
ADDRLP4 76
ARGP4
ADDRLP4 192
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1094713344
DIVF4
CNSTF4 1082130432
LEF4 $409
line 1053
;1053:							pm->ps->stats[STAT_STAMINA] -= fixme;
ADDRLP4 196
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $410
JUMPV
LABELV $409
line 1055
;1054:						else
;1055:							pm->ps->stats[STAT_STAMINA] -= fixme * VectorLength(dist) / 12;
ADDRLP4 76
ARGP4
ADDRLP4 200
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 204
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 140
INDIRI4
CVIF4 4
ADDRLP4 200
INDIRF4
MULF4
CNSTF4 1094713344
DIVF4
SUBF4
CVFI4 4
ASGNI4
LABELV $410
line 1056
;1056:					}
LABELV $408
line 1058
;1057:				
;1058:				}
LABELV $405
line 1060
;1059:
;1060:				if ( pm->ps->stats[STAT_STAMINA] < 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 0
GEI4 $411
line 1061
;1061:					pm->ps->stats[STAT_STAMINA] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
LABELV $411
line 1063
;1062:  
;1063:				wishspeed = pm->ps->speed * PM_GetSprintScale();
ADDRLP4 188
ADDRGP4 PM_GetSprintScale
CALLF4
ASGNF4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 188
INDIRF4
MULF4
ASGNF4
line 1064
;1064:			}
line 1065
;1065:		} 
line 1066
;1066:	} else {
ADDRGP4 $381
JUMPV
LABELV $380
line 1067
;1067:		VectorCopy(pm->ps->origin, pm_previous_origin[pm->ps->clientNum]);
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 12
ADDRLP4 104
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 pm_previous_origin
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1068
;1068:		pm_lastsprint[pm->ps->clientNum] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm_lastsprint
ADDP4
CNSTI4 0
ASGNI4
line 1069
;1069:	}
LABELV $381
line 1072
;1070:
;1071:	// clamp the speed lower if ducking
;1072:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $413
line 1073
;1073:		if ( wishspeed > pm->ps->speed * pm_duckScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $415
line 1074
;1074:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 1075
;1075:		}
LABELV $415
line 1076
;1076:	}
LABELV $413
line 1079
;1077:	
;1078:	// clamp the speed lower if wading or walking on the bottom
;1079:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
EQI4 $417
line 1082
;1080:		float	waterScale;
;1081:
;1082:		waterScale = pm->waterlevel / 3.0;
ADDRLP4 104
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1077936128
DIVF4
ASGNF4
line 1083
;1083:		waterScale = 1.0 - ( 1.0 - pm_swimScale ) * waterScale;
ADDRLP4 108
CNSTF4 1065353216
ASGNF4
ADDRLP4 104
ADDRLP4 108
INDIRF4
ADDRLP4 108
INDIRF4
ADDRGP4 pm_swimScale
INDIRF4
SUBF4
ADDRLP4 104
INDIRF4
MULF4
SUBF4
ASGNF4
line 1084
;1084:		if ( wishspeed > pm->ps->speed * waterScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 104
INDIRF4
MULF4
LEF4 $419
line 1085
;1085:			wishspeed = pm->ps->speed * waterScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 104
INDIRF4
MULF4
ASGNF4
line 1086
;1086:		}
LABELV $419
line 1087
;1087:	}
LABELV $417
line 1090
;1088:
;1089:	// clamp the speed lower when using a scope
;1090:	if (BG_IsZooming(pm->ps->stats[STAT_WEAPONMODE]) ){
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $421
line 1092
;1091:		// moving like crouching
;1092:		if (wishspeed  > pm->ps->speed * pm_duckScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $423
line 1093
;1093:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 1094
;1094:		}
LABELV $423
line 1095
;1095:	}
LABELV $421
line 1099
;1096:	
;1097:	// when a player gets hit, they temporarily lose
;1098:	// full control, which allows them to be moved a bit
;1099:	if ( pml.groundTrace.surfaceFlags & SURF_SLICK ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $425
line 1100
;1100:		accelerate = pm_airaccelerate;
ADDRLP4 72
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 1101
;1101:	}	else if (  pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRGP4 $426
JUMPV
LABELV $425
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $429
line 1102
;1102:		accelerate = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 1103
;1103:	}	else if ( pm->cmd.buttons & BUTTON_WALKING || pm->cmd.upmove < 0 ) {
ADDRGP4 $430
JUMPV
LABELV $429
ADDRLP4 108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 112
INDIRI4
NEI4 $433
ADDRLP4 108
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
ADDRLP4 112
INDIRI4
GEI4 $431
LABELV $433
line 1104
;1104:		accelerate = pm_walkaccelerate;
ADDRLP4 72
ADDRGP4 pm_walkaccelerate
INDIRF4
ASGNF4
line 1105
;1105:	} else if ( BG_IsZooming(pm->ps->stats[STAT_WEAPONMODE]) ) {
ADDRGP4 $432
JUMPV
LABELV $431
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $434
line 1106
;1106:		accelerate = pm_walkaccelerate;
ADDRLP4 72
ADDRGP4 pm_walkaccelerate
INDIRF4
ASGNF4
line 1107
;1107:  } else {
ADDRGP4 $435
JUMPV
LABELV $434
line 1108
;1108:		accelerate = pm_accelerate;
ADDRLP4 72
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 1109
;1109:	}
LABELV $435
LABELV $432
LABELV $430
LABELV $426
line 1111
;1110:
;1111:	PM_Accelerate (wishdir, wishspeed, accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1116
;1112:
;1113:	//Com_Printf("velocity = %1.1f %1.1f %1.1f\n", pm->ps->velocity[0], pm->ps->velocity[1], pm->ps->velocity[2]);
;1114:	//Com_Printf("velocity1 = %1.1f\n", VectorLength(pm->ps->velocity));
;1115:
;1116:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 120
INDIRI4
NEI4 $440
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 120
INDIRI4
EQI4 $436
LABELV $440
line 1117
;1117:		pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 124
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 128
ADDRLP4 124
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 1118
;1118:	} else {
LABELV $436
line 1121
;1119:		// don't reset the z velocity for slopes
;1120://		pm->ps->velocity[2] = 0;
;1121:	}
LABELV $437
line 1123
;1122:
;1123:	vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 124
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 124
INDIRF4
ASGNF4
line 1126
;1124:
;1125:	// slide along the ground plane
;1126:	PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1130
;1127:		pm->ps->velocity, OVERCLIP );
;1128:
;1129:	// don't decrease velocity when going up or down a slope
;1130:	VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1131
;1131:	VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 132
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 136
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 140
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1134
;1132:
;1133:	// don't do anything if standing still
;1134:	if (!pm->ps->velocity[0] && !pm->ps->velocity[1]) {
ADDRLP4 144
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 148
CNSTF4 0
ASGNF4
ADDRLP4 144
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
NEF4 $444
ADDRLP4 144
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
NEF4 $444
line 1135
;1135:		return;
ADDRGP4 $340
JUMPV
LABELV $444
line 1138
;1136:	}
;1137:
;1138:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 1142
;1139:
;1140:	//Com_Printf("velocity2 = %1.1f\n", VectorLength(pm->ps->velocity));
;1141:
;1142:}
LABELV $340
endproc PM_WalkMove 208 16
proc PM_DeadMove 20 4
line 1150
;1143:
;1144:
;1145:/*
;1146:==============
;1147:PM_DeadMove
;1148:==============
;1149:*/
;1150:static void PM_DeadMove( void ) {
line 1153
;1151:	float	forward;
;1152:
;1153:	if ( !pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
NEI4 $447
line 1154
;1154:		return;
ADDRGP4 $446
JUMPV
LABELV $447
line 1159
;1155:	}
;1156:
;1157:	// extra friction
;1158:
;1159:	forward = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1160
;1160:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1161
;1161:	if ( forward <= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $450
line 1162
;1162:		VectorClear (pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1163
;1163:	} else {
ADDRGP4 $451
JUMPV
LABELV $450
line 1164
;1164:		VectorNormalize (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1165
;1165:		VectorScale (pm->ps->velocity, forward, pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1166
;1166:	}
LABELV $451
line 1167
;1167:}
LABELV $446
endproc PM_DeadMove 20 4
proc PM_NoclipMove 104 12
line 1175
;1168:
;1169:#if 1
;1170:/*
;1171:===============
;1172:PM_NoclipMove
;1173:===============
;1174:*/
;1175:static void PM_NoclipMove( void ) {
line 1184
;1176:	float	speed, drop, friction, control, newspeed;
;1177:	int			i;
;1178:	vec3_t		wishvel;
;1179:	float		fmove, smove;
;1180:	vec3_t		wishdir;
;1181:	float		wishspeed;
;1182:	float		scale;
;1183:
;1184:	pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 1188
;1185:
;1186:	// friction
;1187:
;1188:	speed = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 64
INDIRF4
ASGNF4
line 1189
;1189:	if (speed < 1)
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
GEF4 $453
line 1190
;1190:	{
line 1191
;1191:		VectorCopy (vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 1192
;1192:	}
ADDRGP4 $454
JUMPV
LABELV $453
line 1194
;1193:	else
;1194:	{
line 1195
;1195:		drop = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 1197
;1196:
;1197:		friction = pm_friction*1.5;	// extra friction
ADDRLP4 56
CNSTF4 1069547520
ADDRGP4 pm_friction
INDIRF4
MULF4
ASGNF4
line 1198
;1198:		control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 24
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $456
ADDRLP4 68
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $457
JUMPV
LABELV $456
ADDRLP4 68
ADDRLP4 24
INDIRF4
ASGNF4
LABELV $457
ADDRLP4 60
ADDRLP4 68
INDIRF4
ASGNF4
line 1199
;1199:		drop += control*friction*pml.frametime;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 1202
;1200:
;1201:		// scale the velocity
;1202:		newspeed = speed - drop;
ADDRLP4 28
ADDRLP4 24
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 1203
;1203:		if (newspeed < 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GEF4 $459
line 1204
;1204:			newspeed = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
LABELV $459
line 1205
;1205:		newspeed /= speed;
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 1207
;1206:
;1207:		VectorScale (pm->ps->velocity, newspeed, pm->ps->velocity);
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1208
;1208:	}
LABELV $454
line 1211
;1209:
;1210:	// accelerate
;1211:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 68
INDIRF4
ASGNF4
line 1213
;1212:
;1213:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1214
;1214:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1216
;1215:	
;1216:	for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $461
line 1217
;1217:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 72
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 72
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $462
line 1216
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $461
line 1218
;1218:	wishvel[2] += pm->cmd.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ADDF4
ASGNF4
line 1220
;1219:
;1220:	VectorCopy (wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 1221
;1221:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 76
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 76
INDIRF4
ASGNF4
line 1222
;1222:	wishspeed *= scale;
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 1224
;1223:
;1224:	PM_Accelerate( wishdir, wishspeed, pm_accelerate );
ADDRLP4 32
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 pm_accelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1227
;1225:
;1226:	// move
;1227:	VectorMA (pm->ps->origin, pml.frametime, pm->ps->velocity, pm->ps->origin);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 1228
;1228:}
LABELV $452
endproc PM_NoclipMove 104 12
proc PM_FootstepForSurface 4 0
line 1239
;1229:#endif
;1230://============================================================================
;1231:
;1232:/*
;1233:================
;1234:PM_FootstepForSurface
;1235:
;1236:Returns an event number apropriate for the groundsurface
;1237:================
;1238:*/
;1239:static int PM_FootstepForSurface( void ) {
line 1240
;1240:	if ( pml.groundTrace.surfaceFlags & SURF_NOSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $471
line 1241
;1241:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $470
JUMPV
LABELV $471
line 1243
;1242:	}
;1243:	if ( pml.groundTrace.surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $475
line 1244
;1244:		return EV_FOOTSTEP_METAL;
CNSTI4 2
RETI4
ADDRGP4 $470
JUMPV
LABELV $475
line 1247
;1245:	} 
;1246:
;1247:	if ( pml.groundTrace.surfaceFlags & SURF_DIRTSTEPS || pml.groundTrace.surfaceFlags & SURF_SANDSTEPS ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2097152
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $485
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 8388608
BANDI4
ADDRLP4 0
INDIRI4
EQI4 $479
LABELV $485
line 1249
;1248:	//	CG_Printf("Walking on dirt!\n");
;1249:		return EV_FOOTSTEP_DIRT;
CNSTI4 3
RETI4
ADDRGP4 $470
JUMPV
LABELV $479
line 1251
;1250:	}
;1251:	if ( pml.groundTrace.surfaceFlags & SURF_SNOWSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4194304
BANDI4
CNSTI4 0
EQI4 $486
line 1254
;1252:
;1253:		//CG_Printf("Walking on snow!\n");
;1254:		return EV_FOOTSTEP_SNOW;
CNSTI4 4
RETI4
ADDRGP4 $470
JUMPV
LABELV $486
line 1256
;1255:	}
;1256:	if ( pml.groundTrace.surfaceFlags & SURF_WOODSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $490
line 1258
;1257:	//	CG_Printf("Walking on wood!\n");
;1258:		return EV_FOOTSTEP_WOOD;
CNSTI4 5
RETI4
ADDRGP4 $470
JUMPV
LABELV $490
line 1319
;1259:	}
;1260:
;1261:	// Navy Seals ++
;1262:	//  fix me!         : FOOTSTEPS FOR SURFACE !! 
;1263:	/*
;1264:	
;1265: 	new NSQ3 surfaceparms 
;1266:
;1267:
;1268:Abgesehen von den sounds unterscheiden sich die Surfaceparm materialien auch noch in den bullet-hit-wall effekten.
;1269:
;1270:
;1271:
;1272:(default)		- Für stein sowie plastik und anderes unspektakuläres material.
;1273:				minimales rausbröseln und standard q3 auftreff effekt	
;1274:			
;1275:surfaceparm metalsteps	- Metal. Ist schon in Q3 drin. schwer durchdringbar.
;1276:				fette funken und standard q3 auftreff effekt
;1277:				
;1278:surfaceparm glass	- Glass. Leicht durchdringbar
;1279:				kein auftreff effekt, nur minimale Glassplitter fliegen
;1280:				& bröseln herum.
;1281:
;1282:surfaceparm wood	- Holz. Leicht durchdringbar
;1283:				Wie glass, nur mit Holz splittern und anderem sound. Dazu
;1284:				noch etwas gebrösel
;1285:
;1286:surfaceparm soft	- Für grass, Sand und anders. Am leichtesten durchdringbar
;1287:				Standard q3 auftreff effekt und statt rausbröseln wie 
;1288:				bei standard spritzt hier das selbe zeug hoch.
;1289:
;1290:
;1291:surfaceparm steps	- zusätzlich zu anderen surfaceparms. 
;1292:			  	immer fußspuren auf dem material hinterlassen (z.B. Schnee)
;1293:
;1294:surfaceparm nosteps	- zusätzlich zu anderen surfaceparms. 
;1295:			  	Niemals fußspuren auf dem material hinterlassen (z.B. Clip
;1296:				Texes). Z.B wenn aus wasser rausgekommen
;1297:
;1298:
;1299:	standard q3 auftreff effekt (model mit animierter map das bei bullet-hit-wall
;1300:			gespwant wird)
;1301:
;1302:	rausbröseln (kleine punkte in verschiedenen Graustufen (mittlere werte bis schwarz)
;1303:			bröseln wie in Half Life oder Q2 particle like nach unten raus
;1304:			oder spritzen nach oben raus)
;1305:	
;1306:	funken (wie bereits reingecodet, aber mit etwas besserem shader, so das sie etwas
;1307:			fetter heraus kommen)
;1308:
;1309:	glas/holz splitter (minimale 1 polygon objekte) fliegen auf der anderen seite 
;1310:			sehr schnell heraus und fallen etwas langsamer auf der eintritts-
;1311:			seite herunter. so 5-10 bröckelchen. 
;1312:
;1313:
;1314:
;1315:	footsteps (werden auf "surfaceparm steps" materalien hinterlassen und auch kurze 
;1316:			zeit noch wenn man aus dem wasser kommt. Verblassen langsam)
;1317:	*/
;1318:	// Navy Seals --
;1319:	return EV_FOOTSTEP;
CNSTI4 1
RETI4
LABELV $470
endproc PM_FootstepForSurface 4 0
proc PM_CrashLand 24 8
line 1331
;1320:}
;1321:
;1322:
;1323:/*
;1324:=================
;1325:PM_CrashLand
;1326:
;1327:Check for hard landings that generate sound events
;1328:=================
;1329:*/
;1330:#define DELTA_METER	32 // 32 deltas are equal 1 meter falling
;1331:static void PM_CrashLand( void ) {
line 1341
;1332:	float		dist, vel;
;1333:
;1334:
;1335:	// decide which landing animation to use
;1336:/*	if ( pm->ps->pm_flags & PMF_BACKWARDS_JUMP ) {
;1337:		PM_ForceLegsAnim( LEGS_LANDB );
;1338:	} else {*/
;1339:/*	}*/
;1340:
;1341:	pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 130
ASGNI4
line 1344
;1342:
;1343:	// calculate the exact velocity on landing
;1344:	dist = pm->ps->origin[2] - pml.previous_origin[2];
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 pml+112+8
INDIRF4
SUBF4
ASGNF4
line 1345
;1345:	if (dist < 0) dist = -dist;
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $497
ADDRLP4 4
ADDRLP4 4
INDIRF4
NEGF4
ASGNF4
LABELV $497
line 1346
;1346:	vel = sqrt ( pml.previous_velocity[0] * pml.previous_velocity[0] + 
ADDRGP4 pml+124
INDIRF4
ADDRGP4 pml+124
INDIRF4
MULF4
ADDRGP4 pml+124+4
INDIRF4
ADDRGP4 pml+124+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+124+8
INDIRF4
ADDRGP4 pml+124+8
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 8
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1349
;1347:	             pml.previous_velocity[1] * pml.previous_velocity[1] +
;1348:               pml.previous_velocity[2] * pml.previous_velocity[2] );
;1349:	if (vel < 0) vel = -vel;
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $509
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
LABELV $509
line 1353
;1350:
;1351:
;1352:	// never take falling damage if completely underwater
;1353:	if ( pm->waterlevel == 3 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 3
NEI4 $511
line 1354
;1354:		return;
ADDRGP4 $494
JUMPV
LABELV $511
line 1358
;1355:	}
;1356:
;1357:	// reduce falling damage if there is standing water
;1358:	if ( pm->waterlevel == 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $513
line 1359
;1359:		vel *= 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1360
;1360:	}
LABELV $513
line 1361
;1361:	if ( pm->waterlevel == 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $515
line 1362
;1362:		vel *= 0.8;
ADDRLP4 0
CNSTF4 1061997773
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1363
;1363:	}
LABELV $515
line 1366
;1364:
;1365:
;1366:	PM_ForceLegsAnim( LEGS_LAND );
CNSTI4 51
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1368
;1367:
;1368:	if ( pml.groundTrace.surfaceFlags & SURF_DIRTSTEPS || pml.groundTrace.surfaceFlags & SURF_SANDSTEPS )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2097152
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $523
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 8388608
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $517
LABELV $523
line 1369
;1369:		vel *= 0.9;
ADDRLP4 0
CNSTF4 1063675494
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 $518
JUMPV
LABELV $517
line 1370
;1370:	else if ( pml.groundTrace.surfaceFlags & SURF_SNOWSTEPS || pml.groundTrace.surfaceFlags & SURF_SOFTSTEPS )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4194304
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $530
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 33554432
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $524
LABELV $530
line 1371
;1371:		vel *= 0.95;
ADDRLP4 0
CNSTF4 1064514355
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $524
LABELV $518
line 1373
;1372:
;1373: 	if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $531
line 1374
;1374:		Com_Printf("velocity %f\n", vel);
ADDRGP4 $533
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 Com_Printf
CALLV
pop
line 1375
;1375:	}
LABELV $531
line 1379
;1376:
;1377:	// SURF_NODAMAGE is used for bounce pads where you don't ever
;1378:	// want to take damage or play a crunch sound
;1379:	if ( !(pml.groundTrace.surfaceFlags & SURF_NODAMAGE) ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $534
line 1381
;1380:
;1381:		if ( vel >  700.0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1143930880
LEF4 $538
line 1383
;1382:		
;1383:			PM_AddEvent( EV_FALL_DEATH );  
CNSTI4 17
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1385
;1384:			
;1385:		} else if ( vel > 660.0 ) {
ADDRGP4 $539
JUMPV
LABELV $538
ADDRLP4 0
INDIRF4
CNSTF4 1143275520
LEF4 $540
line 1387
;1386:		
;1387:			PM_AddEvent( EV_FALL_FAR );
CNSTI4 16
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1388
;1388:			PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 20
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1390
;1389:			
;1390:		} else if ( vel > 580.0  ) {
ADDRGP4 $541
JUMPV
LABELV $540
ADDRLP4 0
INDIRF4
CNSTF4 1141964800
LEF4 $542
line 1392
;1391:		
;1392:			PM_AddEvent( EV_FALL_MEDIUM );
CNSTI4 15
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1393
;1393:			PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 20
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1395
;1394:			
;1395:		} else if ( vel > 500.0 ) {
ADDRGP4 $543
JUMPV
LABELV $542
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
LEF4 $544
line 1397
;1396:		
;1397:			PM_AddEvent( EV_FALL_LIGHT );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1398
;1398:			PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 20
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1400
;1399:			
;1400:		} else if ( vel > 400.0 ) {
ADDRGP4 $545
JUMPV
LABELV $544
ADDRLP4 0
INDIRF4
CNSTF4 1137180672
LEF4 $546
line 1402
;1401:		
;1402:			PM_AddEvent( EV_FALL_SHORT );
CNSTI4 13
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1403
;1403:			PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 20
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1405
;1404:			
;1405:		} else if ( vel > 300.0 ) {
ADDRGP4 $547
JUMPV
LABELV $546
ADDRLP4 0
INDIRF4
CNSTF4 1133903872
LEF4 $548
line 1407
;1406:		
;1407:			PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 20
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1409
;1408:
;1409:		}
LABELV $548
LABELV $547
LABELV $545
LABELV $543
LABELV $541
LABELV $539
line 1410
;1410:	} 
LABELV $534
line 1412
;1411:	// start footstep cycle over
;1412:	pm->ps->bobCycle = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1413
;1413:}
LABELV $494
endproc PM_CrashLand 24 8
proc PM_CorrectAllSolid 36 28
line 1436
;1414:
;1415:/*
;1416:=============
;1417:PM_CheckStuck
;1418:=============
;1419:*/
;1420:/*
;1421:void PM_CheckStuck(void) {
;1422:	trace_t trace;
;1423:
;1424:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask);
;1425:	if (trace.allsolid) {
;1426:		//int shit = qtrue;
;1427:	}
;1428:}
;1429:*/
;1430:
;1431:/*
;1432:=============
;1433:PM_CorrectAllSolid
;1434:=============
;1435:*/
;1436:static int PM_CorrectAllSolid( trace_t *trace ) {
line 1440
;1437:	int			i, j, k;
;1438:	vec3_t		point;
;1439:
;1440:	if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $551
line 1441
;1441:		Com_Printf("%i:allsolid\n", c_pmove);
ADDRGP4 $553
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1442
;1442:	}
LABELV $551
line 1445
;1443:
;1444:	// jitter around
;1445:	for (i = -1; i <= 1; i++) {
ADDRLP4 20
CNSTI4 -1
ASGNI4
LABELV $554
line 1446
;1446:		for (j = -1; j <= 1; j++) {
ADDRLP4 16
CNSTI4 -1
ASGNI4
LABELV $558
line 1447
;1447:			for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $562
line 1448
;1448:				VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1449
;1449:				point[0] += (float) i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1450
;1450:				point[1] += (float) j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1451
;1451:				point[2] += (float) k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1452
;1452:				pm->trace (trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1453
;1453:				if ( !trace->allsolid ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $568
line 1454
;1454:					point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1455
;1455:					point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1456
;1456:					point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1458
;1457:
;1458:					pm->trace (trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1459
;1459:					pml.groundTrace = *trace;
ADDRGP4 pml+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 56
line 1460
;1460:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $550
JUMPV
LABELV $568
line 1462
;1461:				}
;1462:			}
LABELV $563
line 1447
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LEI4 $562
line 1463
;1463:		}
LABELV $559
line 1446
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $558
line 1464
;1464:	}
LABELV $555
line 1445
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $554
line 1466
;1465:
;1466:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1467
;1467:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1468
;1468:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1470
;1469:
;1470:	return qfalse;
CNSTI4 0
RETI4
LABELV $550
endproc PM_CorrectAllSolid 36 28
proc PM_GroundTraceMissed 80 28
line 1481
;1471:}
;1472:
;1473:
;1474:/*
;1475:=============
;1476:PM_GroundTraceMissed
;1477:
;1478:The ground trace didn't hit a surface, so we are in freefall
;1479:=============
;1480:*/
;1481:static void PM_GroundTraceMissed( void ) {
line 1485
;1482:	trace_t		trace;
;1483:	vec3_t		point;
;1484:
;1485:	if ( pm->ps->groundEntityNum != ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $576
line 1487
;1486:		// we just transitioned into freefall
;1487:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $578
line 1488
;1488:			Com_Printf("%i:lift\n", c_pmove);
ADDRGP4 $580
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1489
;1489:		}
LABELV $578
line 1493
;1490:
;1491:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;1492:		// if we didn't do the trace, the player would be backflipping down staircases
;1493:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1494
;1494:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1496
;1495:
;1496:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1497
;1497:		if ( trace.fraction == 1.0 ) {
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $582
line 1499
;1498:		/*	if ( pm->cmd.forwardmove >= 0 ) {*/
;1499:				PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 50
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1500
;1500:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1505
;1501:		/*	} else {
;1502:				PM_ForceLegsAnim( LEGS_JUMPB );
;1503:				pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
;1504:			}*/
;1505:		}
LABELV $582
line 1506
;1506:	}
LABELV $576
line 1508
;1507:
;1508:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1509
;1509:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1510
;1510:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1511
;1511:}
LABELV $575
endproc PM_GroundTraceMissed 80 28
proc PM_GroundTrace 80 28
line 1519
;1512:
;1513:
;1514:/*
;1515:=============
;1516:PM_GroundTrace
;1517:=============
;1518:*/
;1519:static void PM_GroundTrace( void ) {
line 1523
;1520:	vec3_t		point;
;1521:	trace_t		trace;
;1522:
;1523:	point[0] = pm->ps->origin[0];
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1524
;1524:	point[1] = pm->ps->origin[1];
ADDRLP4 56+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1525
;1525:	point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 56+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1527
;1526:
;1527:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1528
;1528:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 56
line 1531
;1529:
;1530:	// do something corrective if the trace starts in a solid...
;1531:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $591
line 1532
;1532:		if ( !PM_CorrectAllSolid(&trace) )
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 PM_CorrectAllSolid
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $593
line 1533
;1533:			return;
ADDRGP4 $587
JUMPV
LABELV $593
line 1534
;1534:	}
LABELV $591
line 1537
;1535:
;1536:	// if the trace didn't hit anything, we are in free fall
;1537:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $595
line 1538
;1538:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 1539
;1539:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1540
;1540:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1541
;1541:		return;
ADDRGP4 $587
JUMPV
LABELV $595
line 1565
;1542:	}
;1543:
;1544:	// check if getting thrown off the ground
;1545:/*	if ( pm->ps->velocity[2] > 0 && DotProduct( pm->ps->velocity, trace.plane.normal ) > 10 ) {
;1546:		if ( pm->debugLevel ) {
;1547:			Com_Printf("%i:kickoff\n", c_pmove);
;1548:		}
;1549:		// go into jump animation
;1550://///////*		if ( pm->cmd.forwardmove >= 0 ) {*/
;1551:	/*		PM_ForceLegsAnim( LEGS_JUMP );
;1552:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;*/
;1553:	/*	} else {
;1554:			PM_ForceLegsAnim( LEGS_JUMPB );
;1555:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
;1556:		}*/
;1557:/*
;1558:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
;1559:		pml.groundPlane = qfalse;
;1560:		pml.walking = qfalse;
;1561:		return;
;1562:	}
;1563:	*/
;1564:	// slopes that are too steep will not be considered onground
;1565:	if ( trace.plane.normal[2] < MIN_WALK_NORMAL ) {
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $600
line 1566
;1566:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $604
line 1567
;1567:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $606
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1568
;1568:		}
LABELV $604
line 1571
;1569:		// FIXME: if they can't slide down the slope, let them
;1570:		// walk (sharp crevices)
;1571:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1572
;1572:		pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1573
;1573:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1574
;1574:		return;
ADDRGP4 $587
JUMPV
LABELV $600
line 1577
;1575:	}
;1576:
;1577:	pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1578
;1578:	pml.walking = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 1581
;1579:
;1580:	// hitting solid ground will end a waterjump
;1581:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $611
line 1582
;1582:	{
line 1583
;1583:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1584
;1584:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1585
;1585:	}
LABELV $611
line 1587
;1586:
;1587:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $613
line 1589
;1588:		// just hit the ground
;1589:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $615
line 1590
;1590:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $617
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1591
;1591:		}
LABELV $615
line 1593
;1592:		
;1593:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 1596
;1594:
;1595:		// don't do landing time if we were just going down a slope
;1596:		if ( pml.previous_velocity[2] < -200 ) {
ADDRGP4 pml+124+8
INDIRF4
CNSTF4 3276275712
GEF4 $618
line 1598
;1597:			// don't allow another jump for a little while
;1598:			pm->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1599
;1599:			pm->ps->pm_time = 100;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1600
;1600:		}
LABELV $618
line 1601
;1601:	}
LABELV $613
line 1603
;1602:
;1603:	pm->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1608
;1604:
;1605:	// don't reset the z velocity for slopes
;1606://	pm->ps->velocity[2] = 0;
;1607:
;1608:	PM_AddTouchEnt( trace.entityNum );
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 1609
;1609:}
LABELV $587
endproc PM_GroundTrace 80 28
proc PM_SetWaterLevel 48 8
line 1617
;1610:
;1611:
;1612:/*
;1613:=============
;1614:PM_SetWaterLevel	FIXME: avoid this twice?  certainly if not moving
;1615:=============
;1616:*/
;1617:static void PM_SetWaterLevel( void ) {
line 1626
;1618:	vec3_t		point;
;1619:	int			cont;
;1620:	int			sample1;
;1621:	int			sample2;
;1622:
;1623:	//
;1624:	// get waterlevel, accounting for ducking
;1625:	//
;1626:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 0
ASGNI4
line 1627
;1627:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1629
;1628:
;1629:	point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1630
;1630:	point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1631
;1631:	point[2] = pm->ps->origin[2] + MINS_Z + 1;	
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1632
;1632:	cont = pm->pointcontents( point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1634
;1633:
;1634:	if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $627
line 1635
;1635:		sample2 = pm->ps->viewheight - MINS_Z;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 1636
;1636:		sample1 = sample2 / 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1638
;1637:
;1638:		pm->watertype = cont;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1640
;1639:		// feet in water
;1640:		pm->waterlevel = 1;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 1
ASGNI4
line 1641
;1641:		point[2] = pm->ps->origin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1642
;1642:		cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1643
;1643:		if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $630
line 1645
;1644:			// wading
;1645:			pm->waterlevel = 2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 2
ASGNI4
line 1646
;1646:			point[2] = pm->ps->origin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1647
;1647:			cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 1649
;1648:			// face in water
;1649:			if ( cont & MASK_WATER ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $633
line 1650
;1650:				pm->waterlevel = 3;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 3
ASGNI4
line 1651
;1651:			}
LABELV $633
line 1652
;1652:		}
LABELV $630
line 1653
;1653:	}
LABELV $627
line 1655
;1654:
;1655:}
LABELV $624
endproc PM_SetWaterLevel 48 8
proc PM_CheckDuck 72 28
line 1666
;1656:
;1657:/*
;1658:==============
;1659:PM_CheckDuck
;1660:
;1661:Sets mins, maxs, and pm->ps->viewheight
;1662:==============
;1663:*/ 
;1664:
;1665:static void PM_CheckDuck (void)
;1666:{
line 1669
;1667:	trace_t	trace;
;1668: 
;1669:	pm->mins[0] = -10;
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3240099840
ASGNF4
line 1670
;1670:	pm->mins[1] = -10;
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3240099840
ASGNF4
line 1672
;1671:
;1672:	pm->maxs[0] = 10;
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1092616192
ASGNF4
line 1673
;1673:	pm->maxs[1] = 10;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1092616192
ASGNF4
line 1675
;1674:
;1675:	pm->mins[2] = MINS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 3250585600
ASGNF4
line 1677
;1676:
;1677:	if (pm->ps->pm_type == PM_DEAD)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $636
line 1678
;1678:	{
line 1679
;1679:		pm->maxs[2] = -12;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 3242196992
ASGNF4
line 1680
;1680:		pm->ps->viewheight = DEAD_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 -16
ASGNI4
line 1681
;1681:		return;
ADDRGP4 $635
JUMPV
LABELV $636
line 1684
;1682:	}
;1683:
;1684:	if (pm->cmd.upmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $638
line 1685
;1685:	{	// duck
line 1686
;1686:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1687
;1687:	}
ADDRGP4 $639
JUMPV
LABELV $638
line 1689
;1688:	else
;1689:	{	// stand up if possible
line 1690
;1690:		if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $640
line 1691
;1691:		{
line 1693
;1692:			// try to stand up
;1693:			pm->maxs[2] = MAXS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1106771968
ASGNF4
line 1694
;1694:			pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1695
;1695:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $642
line 1696
;1696:				pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $642
line 1697
;1697:		}
LABELV $640
line 1698
;1698:	}
LABELV $639
line 1700
;1699:
;1700:	if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $644
line 1701
;1701:	{
line 1702
;1702:		pm->maxs[2] = 18; // original 18 
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1099956224
ASGNF4
line 1703
;1703:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1704
;1704:	}
ADDRGP4 $645
JUMPV
LABELV $644
line 1706
;1705:	else
;1706:	{
line 1707
;1707:		pm->maxs[2] = MAXS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1106771968
ASGNF4
line 1708
;1708:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 1709
;1709:	}
LABELV $645
line 1710
;1710:}
LABELV $635
endproc PM_CheckDuck 72 28
proc PM_Footsteps 124 4
line 1722
;1711:
;1712:
;1713:
;1714://===================================================================
;1715:
;1716:
;1717:/*
;1718:===============
;1719:PM_Footsteps
;1720:===============
;1721:*/
;1722:static void PM_Footsteps( void ) {
line 1727
;1723:	float		bobmove;
;1724:	int			old;
;1725:	qboolean	footstep;
;1726:	int			xyzspeed;
;1727:	int			onladder = NS_OnLadder();
ADDRLP4 20
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 1733
;1728:
;1729:	//
;1730:	// calculate speed and cycle to be used for
;1731:	// all cyclic walking effects
;1732:	//
;1733:	pm->xyspeed = sqrt( pm->ps->velocity[0] * pm->ps->velocity[0]
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 1735
;1734:		+  pm->ps->velocity[1] * pm->ps->velocity[1] );
;1735:	xyzspeed = sqrt( pm->ps->velocity[0] * pm->ps->velocity[0]
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52
ADDRLP4 44
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56
ADDRLP4 44
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 48
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDRLP4 52
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ADDRLP4 56
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 60
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 60
INDIRF4
CVFI4 4
ASGNI4
line 1742
;1736:		+  pm->ps->velocity[1] * pm->ps->velocity[1]
;1737:		+  pm->ps->velocity[2] * pm->ps->velocity[2] );
;1738:
;1739:	// Navy Seals ++
;1740: //	CG_Printf("ladder: %i\n", onladder );
;1741:
;1742:	if ( onladder == -1 || onladder == 1 ) // on ladder
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $649
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $647
LABELV $649
line 1743
;1743:	{
line 1745
;1744:		// moving up or down)
;1745:		if ( xyzspeed ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $650
line 1746
;1746:			PM_ContinueTorsoAnim ( TORSO_CLIMB );
CNSTI4 39
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1747
;1747:			PM_ContinueLegsAnim  ( LEGS_CLIMB );
CNSTI4 52
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1748
;1748:			footstep = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1749
;1749:		}
ADDRGP4 $651
JUMPV
LABELV $650
line 1750
;1750:		else {
line 1751
;1751:			PM_ContinueTorsoAnim( TORSO_CLIMB_IDLE );
CNSTI4 40
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1752
;1752:			PM_ContinueLegsAnim( LEGS_CLIMB_IDLE );
CNSTI4 53
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1753
;1753:			pm->ps->bobCycle = 0;	// start at beginning of cycle again 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1754
;1754:			footstep = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1755
;1755:		}
LABELV $651
line 1757
;1756:
;1757:		bobmove = 0.45f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1055286886
ASGNF4
line 1758
;1758:		old = pm->ps->bobCycle;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1759
;1759:		pm->ps->bobCycle = (int)( old + bobmove * pml.msec ) & 255;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
CNSTI4 255
BANDI4
ASGNI4
line 1762
;1760:
;1761:		// Navy Seals ++
;1762:		if ( ( ( old + 64 ) ^ ( pm->ps->bobCycle + 64 ) ) & 128 ) {
ADDRLP4 68
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
ADDI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
ADDI4
BXORI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $646
line 1764
;1763:			// on ground will only play sounds if running
;1764:			if ( footstep && !pm->noFootsteps && ( pm->ps->stats[STAT_STEALTH] < 7  ||  pm->ps->eFlags & EF_VIP  || pm->cmd.buttons & BUTTON_SPRINT )  ) {
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $646
ADDRLP4 76
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $646
ADDRLP4 80
ADDRLP4 76
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 7
LTI4 $658
ADDRLP4 80
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 72
INDIRI4
NEI4 $658
ADDRLP4 76
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 72
INDIRI4
EQI4 $646
LABELV $658
line 1765
;1765:				PM_AddEvent( EV_FOOTSTEP_METAL );
CNSTI4 2
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1766
;1766:			}
line 1767
;1767:		}
line 1768
;1768:		return;
ADDRGP4 $646
JUMPV
LABELV $647
line 1772
;1769:	}
;1770:	// Navy Seals --
;1771:
;1772:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $659
line 1776
;1773:
;1774: 
;1775:		// airborne leaves position in cycle intact, but doesn't advance
;1776:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LEI4 $646
line 1777
;1777:			PM_ContinueLegsAnim( LEGS_SWIM );
CNSTI4 49
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1778
;1778:		}
line 1779
;1779:		return;
ADDRGP4 $646
JUMPV
LABELV $659
line 1783
;1780:	}
;1781:
;1782:	// if not trying to move
;1783:	if ( !pm->cmd.forwardmove && !pm->cmd.rightmove ) {
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 72
INDIRI4
NEI4 $663
ADDRLP4 68
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 72
INDIRI4
NEI4 $663
line 1784
;1784:		if (  pm->xyspeed < 5 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 212
ADDP4
INDIRF4
CNSTF4 1084227584
GEF4 $646
line 1785
;1785:			pm->ps->bobCycle = 0;	// start at beginning of cycle again
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1786
;1786:			if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $667
line 1788
;1787:				if ( 
;1788:						BG_IsZooming( pm->ps->stats[STAT_WEAPONMODE] )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $669
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $669
line 1792
;1789:						&&
;1790:						pm->ps->weaponstate == WEAPON_READY
;1791:					   ) 
;1792:					{
line 1793
;1793:						PM_ContinueLegsAnim( LEGS_IDLECR_RIFLE_SCOPED ); 
CNSTI4 58
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1794
;1794:					}
ADDRGP4 $646
JUMPV
LABELV $669
line 1796
;1795:				else
;1796:				PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 41
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1797
;1797:			} else { 
ADDRGP4 $646
JUMPV
LABELV $667
line 1801
;1798:
;1799:				// soulcroushers tip: stop playermodels from bobbing.
;1800:					if ( 
;1801:						BG_IsZooming( pm->ps->stats[STAT_WEAPONMODE] )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $671
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $671
line 1805
;1802:						&&
;1803:						pm->ps->weaponstate == WEAPON_READY
;1804:					   ) 
;1805:					{
line 1806
;1806:						PM_ContinueLegsAnim( LEGS_IDLE_RIFLE_SCOPED ); 
CNSTI4 57
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1807
;1807:					}
ADDRGP4 $646
JUMPV
LABELV $671
line 1809
;1808:					else
;1809:					{
line 1810
;1810:						PM_ContinueLegsAnim( LEGS_IDLE );
CNSTI4 43
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1811
;1811:					}
line 1812
;1812:			}
line 1813
;1813:		}
line 1814
;1814:		return;
ADDRGP4 $646
JUMPV
LABELV $663
line 1818
;1815:	}
;1816:	
;1817:
;1818:	footstep = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1820
;1819:
;1820:	if ( (pm->ps->pm_flags & PMF_DUCKED) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $673
line 1821
;1821:		bobmove = 0.3f;	// ducked characters bob much slower
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 1822
;1822:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $675
line 1823
;1823:			PM_ContinueLegsAnim( LEGS_BACKCR ); // need back cr
CNSTI4 55
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1824
;1824:		}
ADDRGP4 $674
JUMPV
LABELV $675
line 1825
;1825:		else {
line 1826
;1826:			PM_ContinueLegsAnim( LEGS_WALKCR );
CNSTI4 42
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1827
;1827:		}
line 1839
;1828:		// ducked characters never play footsteps
;1829:	/*
;1830:	} else 	if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
;1831:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
;1832:			bobmove = 0.4;	// faster speeds bob faster
;1833:			footstep = qtrue;
;1834:		} else {
;1835:			bobmove = 0.3;
;1836:		}
;1837:		PM_ContinueLegsAnim( LEGS_BACK );
;1838:	*/
;1839:	} else if ( (pm->ps->stats[STAT_WEAPONMODE] & (1 << WM_ZOOM2X) ) ||
ADDRGP4 $674
JUMPV
LABELV $673
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $679
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $677
LABELV $679
line 1840
;1840:							(pm->ps->stats[STAT_WEAPONMODE] & (1 << WM_ZOOM2X) ) ) {
line 1842
;1841:
;1842:			bobmove = 0.3f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 1844
;1843:				
;1844:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $680
line 1845
;1845:				PM_ContinueLegsAnim( LEGS_BACK  );
CNSTI4 46
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1846
;1846:			}
ADDRGP4 $678
JUMPV
LABELV $680
line 1847
;1847:			else {
line 1848
;1848:				PM_ContinueLegsAnim( LEGS_WALK );
CNSTI4 44
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1849
;1849:			}
line 1850
;1850:	} else {
ADDRGP4 $678
JUMPV
LABELV $677
line 1851
;1851:		if ( pm->ps->stats[STAT_LEG_DAMAGE] > 20 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 20
LEI4 $682
line 1852
;1852:			bobmove = 0.2f;
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 1853
;1853:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $684
line 1854
;1854:				PM_ContinueLegsAnim( LEGS_BACKLIMB );
CNSTI4 56
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
ADDRGP4 $685
JUMPV
LABELV $684
line 1856
;1855:			else
;1856:				PM_ContinueLegsAnim( LEGS_LIMP );
CNSTI4 47
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
LABELV $685
line 1857
;1857:			footstep = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1858
;1858:		} 
ADDRGP4 $683
JUMPV
LABELV $682
line 1860
;1859:		else
;1860:		{
line 1861
;1861:			if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $686
line 1862
;1862:				bobmove = 0.4f;	// faster speeds bob faster
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1863
;1863:				if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $688
line 1864
;1864:					PM_ContinueLegsAnim( LEGS_BACK );
CNSTI4 46
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1865
;1865:				}
ADDRGP4 $689
JUMPV
LABELV $688
line 1866
;1866:				else {
line 1867
;1867:					PM_ContinueLegsAnim( LEGS_RUN );
CNSTI4 45
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1868
;1868:				}
LABELV $689
line 1869
;1869:				footstep = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1870
;1870:			} else {
ADDRGP4 $687
JUMPV
LABELV $686
line 1871
;1871:				bobmove = 0.3f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 1873
;1872:				
;1873:				if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $690
line 1874
;1874:					PM_ContinueLegsAnim( LEGS_BACK  );
CNSTI4 46
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1875
;1875:				}
ADDRGP4 $691
JUMPV
LABELV $690
line 1876
;1876:				else {
line 1878
;1877:
;1878:					PM_ContinueLegsAnim( LEGS_WALK );
CNSTI4 44
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1879
;1879:				}
LABELV $691
line 1880
;1880:			}
LABELV $687
line 1881
;1881:		}
LABELV $683
line 1882
;1882:	}
LABELV $678
LABELV $674
line 1885
;1883:
;1884:	// check for footstep / splash sounds
;1885:	old = pm->ps->bobCycle;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1886
;1886:	pm->ps->bobCycle = (int)( old + bobmove * pml.msec ) & 255;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
CNSTI4 255
BANDI4
ASGNI4
line 1889
;1887:
;1888:	// Navy Seals ++
;1889:	if ( ( ( old + 64 ) ^ ( pm->ps->bobCycle + 64 ) ) & 128 ) {
ADDRLP4 84
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
BXORI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $693
line 1890
;1890:		if ( pm->waterlevel == 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
NEI4 $695
line 1892
;1891:			// on ground will only play sounds if running
;1892:			if ( footstep && !pm->noFootsteps && ( pm->ps->stats[STAT_STEALTH] < 6  ||  pm->ps->eFlags & EF_VIP  || pm->cmd.buttons & BUTTON_SPRINT ) && PM_FootstepForSurface() == EV_FOOTSTEP ) {
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $697
ADDRLP4 92
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $697
ADDRLP4 96
ADDRLP4 92
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 6
LTI4 $700
ADDRLP4 96
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $700
ADDRLP4 92
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $697
LABELV $700
ADDRLP4 100
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $697
line 1893
;1893:				PM_AddEvent( EV_FOOTSTEP );
CNSTI4 1
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1894
;1894:			}
ADDRGP4 $696
JUMPV
LABELV $697
line 1895
;1895:			else if ( footstep && !pm->noFootsteps && ( pm->ps->stats[STAT_STEALTH] < 8  ||  pm->ps->eFlags & EF_VIP  || pm->cmd.buttons & BUTTON_SPRINT )&& PM_FootstepForSurface() > EV_FOOTSTEP ) {
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $696
ADDRLP4 108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $696
ADDRLP4 112
ADDRLP4 108
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 8
LTI4 $704
ADDRLP4 112
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 104
INDIRI4
NEI4 $704
ADDRLP4 108
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 104
INDIRI4
EQI4 $696
LABELV $704
ADDRLP4 116
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 1
LEI4 $696
line 1896
;1896:				PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 120
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1897
;1897:			}
line 1898
;1898:		} else if ( pm->waterlevel == 1 && ( pm->ps->stats[STAT_STEALTH] < 9  ||  pm->ps->eFlags & EF_VIP  || pm->cmd.buttons & BUTTON_SPRINT ) ){
ADDRGP4 $696
JUMPV
LABELV $695
ADDRLP4 88
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $705
ADDRLP4 92
ADDRLP4 88
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 9
LTI4 $708
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 96
INDIRI4
NEI4 $708
ADDRLP4 88
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 96
INDIRI4
EQI4 $705
LABELV $708
line 1900
;1899:			// splashing
;1900:			PM_AddEvent( EV_FOOTSPLASH );
CNSTI4 6
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1901
;1901:		} else if ( pm->waterlevel == 2 && ( pm->ps->stats[STAT_STEALTH] < 9  ||  pm->ps->eFlags & EF_VIP || pm->cmd.buttons & BUTTON_SPRINT ) ){
ADDRGP4 $706
JUMPV
LABELV $705
ADDRLP4 100
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $709
ADDRLP4 104
ADDRLP4 100
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 9
LTI4 $712
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 108
INDIRI4
NEI4 $712
ADDRLP4 100
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 108
INDIRI4
EQI4 $709
LABELV $712
line 1903
;1902:			// wading / swimming at surface
;1903:			PM_AddEvent( EV_SWIM );
CNSTI4 8
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1904
;1904:		} else if ( pm->waterlevel == 3 ) {
ADDRGP4 $710
JUMPV
LABELV $709
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 3
NEI4 $713
line 1907
;1905:			// no sound when completely underwater
;1906:
;1907:		}
LABELV $713
LABELV $710
LABELV $706
LABELV $696
line 1908
;1908:	}
LABELV $693
line 1911
;1909:	// Navy Seals --
;1910: 
;1911:}
LABELV $646
endproc PM_Footsteps 124 4
proc PM_WaterEvents 64 4
line 1920
;1912:
;1913:/*
;1914:==============
;1915:PM_WaterEvents
;1916:
;1917:Generate sound events for entering and leaving water
;1918:==============
;1919:*/
;1920:static void PM_WaterEvents( void ) {		// FIXME?
line 1925
;1921:	//
;1922:	// if just entered a water volume, play a sound
;1923:	//
;1924:// Navy Seals ++
;1925:	if ( pm->ps->stats[STAT_STEALTH] < 4 ||   pm->ps->eFlags & EF_VIP || pm->cmd.buttons & BUTTON_SPRINT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 4
LTI4 $719
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 8
INDIRI4
NEI4 $719
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $716
LABELV $719
line 1927
;1926:// Navy Seals --
;1927:	if (!pml.previous_waterlevel && pm->waterlevel) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 pml+136
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $720
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $720
line 1928
;1928:		PM_AddEvent( EV_WATER_TOUCH );
CNSTI4 21
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1929
;1929:	}
LABELV $720
LABELV $716
line 1935
;1930:
;1931:	//
;1932:	// if just completely exited a water volume, play a sound
;1933:	//
;1934:// Navy Seals ++
;1935:	if ( pm->ps->stats[STAT_STEALTH] < 4 ||   pm->ps->eFlags & EF_VIP || pm->cmd.buttons & BUTTON_SPRINT )
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 4
LTI4 $726
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $726
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $723
LABELV $726
line 1937
;1936:// Navy Seals --
;1937:	if (pml.previous_waterlevel && !pm->waterlevel) {
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 pml+136
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $727
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $727
line 1938
;1938:		PM_AddEvent( EV_WATER_LEAVE );
CNSTI4 22
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1939
;1939:	}
LABELV $727
LABELV $723
line 1945
;1940:
;1941:	//
;1942:	// check for head just going under water
;1943:	//
;1944:// Navy Seals ++
;1945:	if ( pm->ps->stats[STAT_STEALTH] < 3  || pm->ps->eFlags & EF_VIP || pm->cmd.buttons & BUTTON_SPRINT )
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $733
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $733
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $730
LABELV $733
line 1947
;1946:// Navy Seals --
;1947:	if (pml.previous_waterlevel != 3 && pm->waterlevel == 3) {
ADDRLP4 44
CNSTI4 3
ASGNI4
ADDRGP4 pml+136
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $734
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $734
line 1948
;1948:		PM_AddEvent( EV_WATER_UNDER );
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1949
;1949:	}
LABELV $734
LABELV $730
line 1955
;1950:
;1951:	//
;1952:	// check for head just coming out of water
;1953:	//
;1954:// Navy Seals ++
;1955:	if ( pm->ps->stats[STAT_STEALTH] < 3  || pm->ps->eFlags & EF_VIP || pm->cmd.buttons & BUTTON_SPRINT )
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $740
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 56
INDIRI4
NEI4 $740
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 56
INDIRI4
EQI4 $737
LABELV $740
line 1957
;1956:// Navy Seals --
;1957:	if (pml.previous_waterlevel == 3 && pm->waterlevel != 3) {
ADDRLP4 60
CNSTI4 3
ASGNI4
ADDRGP4 pml+136
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $741
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $741
line 1958
;1958:		PM_AddEvent( EV_WATER_CLEAR );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1959
;1959:	}
LABELV $741
LABELV $737
line 1960
;1960:}
LABELV $715
endproc PM_WaterEvents 64 4
proc PM_GetWeaponTimeOnRaise 8 0
line 1968
;1961:
;1962:// Navy Seals ++
;1963:/*
;1964:===============
;1965:PM_GetWeaponTimeOnRaise
;1966:===============
;1967:*/
;1968:static int PM_GetWeaponTimeOnRaise( void ) {
line 1970
;1969:
;1970:	switch (pm->ps->weapon) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $745
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $745
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $764-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $764
address $748
address $748
address $745
address $762
address $762
address $754
address $762
address $755
address $761
address $755
address $755
address $758
address $749
address $750
address $753
address $752
address $756
address $757
address $759
address $760
address $761
address $758
address $751
address $763
address $762
code
LABELV $748
line 1973
;1971:	case WP_KHURKURI:
;1972:	case WP_SEALKNIFE:
;1973:		return 480;
CNSTI4 480
RETI4
ADDRGP4 $744
JUMPV
LABELV $749
line 1975
;1974:	case WP_MAC10:
;1975:		return 600;
CNSTI4 600
RETI4
ADDRGP4 $744
JUMPV
LABELV $750
line 1977
;1976:	case WP_MP5:
;1977:		return 640;
CNSTI4 640
RETI4
ADDRGP4 $744
JUMPV
LABELV $751
line 1979
;1978:	case WP_M249:
;1979:		return 800;
CNSTI4 800
RETI4
ADDRGP4 $744
JUMPV
LABELV $752
line 1981
;1980:	case WP_M4:
;1981:		return 880;
CNSTI4 880
RETI4
ADDRGP4 $744
JUMPV
LABELV $753
line 1983
;1982:	case WP_AK47:
;1983:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $744
JUMPV
LABELV $754
line 1985
;1984:	case WP_MK23:
;1985:		return 600;
CNSTI4 600
RETI4
ADDRGP4 $744
JUMPV
LABELV $755
line 1989
;1986:	case WP_DEAGLE:
;1987:	case WP_SW629:
;1988:	case WP_SW40T:
;1989:		return 600;
CNSTI4 600
RETI4
ADDRGP4 $744
JUMPV
LABELV $756
line 1991
;1990:	case WP_PSG1:
;1991:		return 840;
CNSTI4 840
RETI4
ADDRGP4 $744
JUMPV
LABELV $757
line 1993
;1992:	case WP_MACMILLAN:
;1993:		return 750;
CNSTI4 750
RETI4
ADDRGP4 $744
JUMPV
LABELV $758
line 1996
;1994:	case WP_PDW:
;1995:	case WP_M14:
;1996:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $744
JUMPV
LABELV $759
line 1998
;1997:	case WP_870:
;1998:		return 600;	
CNSTI4 600
RETI4
ADDRGP4 $744
JUMPV
LABELV $760
line 2000
;1999:	case WP_M590:
;2000:		return 600;
CNSTI4 600
RETI4
ADDRGP4 $744
JUMPV
LABELV $761
line 2003
;2001:	case WP_P9S:
;2002:	case WP_SPAS15:
;2003:		return 600;
CNSTI4 600
RETI4
ADDRGP4 $744
JUMPV
LABELV $762
line 2008
;2004:	case WP_SMOKE:			
;2005:	case WP_GRENADE:
;2006:	case WP_FLASHBANG:
;2007:	case WP_GLOCK:
;2008:		return 400; 
CNSTI4 400
RETI4
ADDRGP4 $744
JUMPV
LABELV $763
line 2011
;2009:#ifdef SL8SD
;2010:	case WP_SL8SD:
;2011:		return 800;
CNSTI4 800
RETI4
ADDRGP4 $744
JUMPV
LABELV $745
line 2014
;2012:#endif
;2013:	default:
;2014:		return 100;
CNSTI4 100
RETI4
LABELV $744
endproc PM_GetWeaponTimeOnRaise 8 0
proc PM_GetWeaponTimeOnLower 8 0
line 2023
;2015:	}
;2016:}
;2017:
;2018:/*
;2019:===============
;2020:PM_GetWeaponTimeOnLower
;2021:===============
;2022:*/
;2023:static int PM_GetWeaponTimeOnLower( void ) {
line 2025
;2024:	
;2025:	switch (pm->ps->weapon) { 
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $767
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $767
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $783-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $783
address $772
address $772
address $767
address $781
address $781
address $774
address $774
address $774
address $774
address $774
address $774
address $777
address $774
address $773
address $770
address $774
address $776
address $775
address $778
address $779
address $780
address $772
address $771
address $782
address $781
code
LABELV $770
line 2027
;2026:	case WP_AK47:
;2027:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $766
JUMPV
LABELV $771
line 2029
;2028:	case WP_M249:
;2029:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $766
JUMPV
LABELV $772
line 2033
;2030:	case WP_M14:
;2031:	case WP_KHURKURI:
;2032:	case WP_SEALKNIFE:
;2033:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $766
JUMPV
LABELV $773
line 2035
;2034:	case WP_MP5:
;2035:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $766
JUMPV
LABELV $774
line 2044
;2036:	case WP_MK23:
;2037:	case WP_MAC10:
;2038:	case WP_M4:
;2039:	case WP_P9S:
;2040:	case WP_SW40T:
;2041:	case WP_GLOCK:
;2042:	case WP_DEAGLE:
;2043:	case WP_SW629:
;2044:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $766
JUMPV
LABELV $775
line 2046
;2045:	case WP_MACMILLAN:
;2046:		return 500; 
CNSTI4 500
RETI4
ADDRGP4 $766
JUMPV
LABELV $776
line 2048
;2047:	case WP_PSG1:
;2048:		return 600;
CNSTI4 600
RETI4
ADDRGP4 $766
JUMPV
LABELV $777
line 2050
;2049:	case WP_PDW:
;2050:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $766
JUMPV
LABELV $778
line 2052
;2051:	case WP_870:
;2052:		return 600;
CNSTI4 600
RETI4
ADDRGP4 $766
JUMPV
LABELV $779
line 2054
;2053:	case WP_M590:
;2054:		return 600;
CNSTI4 600
RETI4
ADDRGP4 $766
JUMPV
LABELV $780
line 2056
;2055:	case WP_SPAS15:
;2056:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $766
JUMPV
LABELV $781
line 2060
;2057:	case WP_SMOKE:
;2058:	case WP_GRENADE:
;2059:	case WP_FLASHBANG:
;2060:		return 360;
CNSTI4 360
RETI4
ADDRGP4 $766
JUMPV
LABELV $782
line 2063
;2061:#ifdef SL8SD
;2062:	case WP_SL8SD:
;2063:		return 400;
CNSTI4 400
RETI4
ADDRGP4 $766
JUMPV
LABELV $767
line 2066
;2064:#endif
;2065:	default:
;2066:		return 100;
CNSTI4 100
RETI4
LABELV $766
endproc PM_GetWeaponTimeOnLower 8 0
proc PM_BeginWeaponChange 28 8
line 2075
;2067:	}
;2068:}
;2069:// Navy Seals --
;2070:/*
;2071:===============
;2072:PM_BeginWeaponChange
;2073:===============
;2074:*/
;2075:static void PM_BeginWeaponChange( int weapon ) {
line 2076
;2076:	float weaponTime = PM_GetWeaponTimeOnLower() * BG_GetSpeedMod( pm->ps->persistant[PERS_TECHNICAL] );
ADDRLP4 4
ADDRGP4 PM_GetWeaponTimeOnLower
CALLI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetSpeedMod
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 2078
;2077:
;2078: 	if ( weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $788
ADDRLP4 12
INDIRI4
CNSTI4 26
LTI4 $786
LABELV $788
line 2079
;2079:		return;
ADDRGP4 $785
JUMPV
LABELV $786
line 2082
;2080:	}
;2081:
;2082:	if ( !( BG_GotWeapon( weapon, pm->ps->stats ) ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
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
NEI4 $789
line 2083
;2083:		return;
ADDRGP4 $785
JUMPV
LABELV $789
line 2086
;2084:	}
;2085:	
;2086:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $791
line 2087
;2087:		return;
ADDRGP4 $785
JUMPV
LABELV $791
line 2092
;2088:	}
;2089:
;2090://	Com_Printf("weaponTime: %3f\n", weaponTime );
;2091:
;2092:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 2093
;2093:	pm->ps->weaponTime = weaponTime;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 2097
;2094:
;2095://	Com_Printf("weapontime WEAPON_DROPPING: %i\n", (int)weaponTime );
;2096:
;2097:	pm->ps->torsoTimer = pm->ps->weaponTime;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 2099
;2098:
;2099:	if (BG_IsPrimary( pm->ps->weapon ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $793
line 2100
;2100:		PM_StartTorsoAnim( TORSO_DROP_RIFLE );
CNSTI4 36
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $794
JUMPV
LABELV $793
line 2102
;2101:	else
;2102:		PM_StartTorsoAnim( TORSO_DROP_PISTOL );
CNSTI4 38
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
LABELV $794
line 2104
;2103:	
;2104:}
LABELV $785
endproc PM_BeginWeaponChange 28 8
proc PM_FinishWeaponChange 32 8
line 2112
;2105:
;2106:
;2107:/*
;2108:===============
;2109:PM_FinishWeaponChange
;2110:===============
;2111:*/
;2112:static void PM_FinishWeaponChange( void ) {
line 2115
;2113:	// Navy Seals ++
;2114:	int		weapon;
;2115:	float weaponTime = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 2117
;2116:
;2117:	weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 2118
;2118:	if ( weapon < WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $798
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $796
LABELV $798
line 2119
;2119:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2120
;2120:	}
LABELV $796
line 2122
;2121:
;2122:	if ( ! ( BG_GotWeapon( weapon, pm->ps->stats ) ) ) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $799
line 2123
;2123:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2124
;2124:	}
LABELV $799
line 2126
;2125:
;2126:	if (pm->ps->weaponstate != WEAPON_BANDAGING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
EQI4 $801
line 2127
;2127:		pm->ps->weapon = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2129
;2128:	// only send sound if we're actually changing
;2129:	if ( pm->ps->weaponstate != WEAPON_BANDAGING_END )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 13
EQI4 $803
line 2130
;2130:		PM_AddEvent( EV_CHANGE_WEAPON ); // get weapon cock sound
CNSTI4 28
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
LABELV $803
line 2131
;2131:	} 
LABELV $801
line 2133
;2132:
;2133:	weaponTime = PM_GetWeaponTimeOnRaise() * BG_GetSpeedMod( pm->ps->persistant[PERS_TECHNICAL] );
ADDRLP4 16
ADDRGP4 PM_GetWeaponTimeOnRaise
CALLI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_GetSpeedMod
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 2137
;2134:
;2135://	Com_Printf("weaponTime: %3f\n", weaponTime );
;2136:	
;2137:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 2138
;2138:	pm->ps->weaponTime = (int)weaponTime;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 2142
;2139:
;2140://	Com_Printf("weapontime WEAPON_RAISING: %i\n", (int)weaponTime );
;2141:
;2142:	pm->ps->torsoTimer = pm->ps->weaponTime;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 2144
;2143:
;2144:	if ( BG_IsPrimary( weapon ) )
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $805
line 2145
;2145:		PM_StartTorsoAnim( TORSO_RAISE_RIFLE );
CNSTI4 35
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $806
JUMPV
LABELV $805
line 2147
;2146:	else
;2147:		PM_StartTorsoAnim( TORSO_RAISE_PISTOL );
CNSTI4 37
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
LABELV $806
line 2149
;2148:	// Navy Seals --
;2149:}
LABELV $795
endproc PM_FinishWeaponChange 32 8
proc PM_TorsoAnimation 64 4
line 2158
;2150:
;2151:
;2152:/*
;2153:==============
;2154:PM_TorsoAnimation
;2155:
;2156:==============
;2157:*/
;2158:static void PM_TorsoAnimation( void ) {
line 2160
;2159:	// Navy Seals ++
;2160:	if ( NS_OnLadder() == 1 || NS_OnLadder() == -1 )
ADDRLP4 0
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $810
ADDRLP4 4
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $808
LABELV $810
line 2161
;2161:		return;
ADDRGP4 $807
JUMPV
LABELV $808
line 2163
;2162:	
;2163: 	if ( pm->ps->weaponstate == WEAPON_READY ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $811
line 2164
;2164:		if ( pm->ps->powerups[PW_BRIEFCASE] )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $813
line 2165
;2165:			PM_ContinueTorsoAnim( TORSO_STAND_SUITCASE );
CNSTI4 26
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
ADDRGP4 $807
JUMPV
LABELV $813
line 2167
;2166:		else if ( 
;2167:			( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM2X ) ) ||
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $818
ADDRLP4 12
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $815
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $818
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 16
NEI4 $815
LABELV $818
line 2171
;2168:			( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM4X ) ) &&
;2169:			( BG_IsRifle( pm->ps->weapon ) || pm->ps->weapon == WP_M4 )
;2170:		   )
;2171:		   PM_ContinueTorsoAnim( TORSO_STAND_RIFLE_SCOPED );
CNSTI4 22
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
ADDRGP4 $807
JUMPV
LABELV $815
line 2174
;2172:		else if 
;2173:			(
;2174:				( pm->ps->weapon == WP_M4 || pm->ps->weapon == WP_AK47 ||
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 16
EQI4 $823
ADDRLP4 24
INDIRI4
CNSTI4 15
EQI4 $823
ADDRLP4 24
INDIRI4
CNSTI4 14
EQI4 $823
ADDRLP4 24
INDIRI4
CNSTI4 22
NEI4 $819
LABELV $823
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $824
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $819
LABELV $824
line 2178
;2175:				pm->ps->weapon == WP_MP5 || pm->ps->weapon == WP_M14 ) &&
;2176:				!(pm->cmd.buttons & BUTTON_SPRINT && pm->ps->stats[STAT_STAMINA] > 0) 
;2177: 			)
;2178:			PM_ContinueTorsoAnim( TORSO_STAND_RIFLE_SCOPED );
CNSTI4 22
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
ADDRGP4 $807
JUMPV
LABELV $819
line 2179
;2179:		else if ( BG_IsPistol( pm->ps->weapon ) || pm->ps->weapon == WP_PDW || pm->ps->weapon == WP_MAC10 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_IsPistol
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $828
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 12
EQI4 $828
ADDRLP4 40
INDIRI4
CNSTI4 13
NEI4 $825
LABELV $828
line 2180
;2180:			PM_ContinueTorsoAnim( TORSO_STAND_PISTOL );
CNSTI4 24
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
ADDRGP4 $807
JUMPV
LABELV $825
line 2181
;2181:		else if ( BG_IsRifle( pm->ps->weapon ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $829
line 2182
;2182:			PM_ContinueTorsoAnim( TORSO_STAND_RIFLE ); 
CNSTI4 20
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
ADDRGP4 $807
JUMPV
LABELV $829
line 2183
;2183:		else if ( BG_IsMelee( pm->ps->weapon ) || BG_IsGrenade( pm->ps->weapon ) || pm->ps->weapon == WP_C4 || pm->ps->weapon == WP_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $835
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $835
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 3
EQI4 $835
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $831
LABELV $835
line 2184
;2184:			PM_ContinueTorsoAnim( TORSO_STAND_ITEM );
CNSTI4 28
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
ADDRGP4 $807
JUMPV
LABELV $831
line 2186
;2185:		else
;2186:			PM_ContinueTorsoAnim( TORSO_STAND_RIFLE );
CNSTI4 20
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 2187
;2187:		return;
LABELV $811
line 2190
;2188:	} 
;2189:	// Navy Seals --
;2190:}
LABELV $807
endproc PM_TorsoAnimation 64 4
proc PM_GetWeaponTime 8 0
line 2200
;2191:
;2192:// Navy Seals ++
;2193:/*
;2194:============
;2195:PM_GetWeaponTime
;2196:
;2197:the firerates of weapons
;2198:============
;2199:*/
;2200:static int PM_GetWeaponTime( int weapon ) {
line 2203
;2201:	int addTime;
;2202:
;2203:	switch( weapon ) { 
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $837
ADDRLP4 4
INDIRI4
CNSTI4 24
GTI4 $837
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $860-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $860
address $859
address $858
address $837
address $837
address $837
address $844
address $843
address $857
address $842
address $856
address $855
address $839
address $841
address $840
address $853
address $852
address $851
address $849
address $846
address $845
address $847
address $848
address $854
address $850
code
LABELV $839
line 2205
;2204:	case WP_PDW:
;2205:		addTime = SEALS_FRATE_PDW;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 2206
;2206:		break;
ADDRGP4 $838
JUMPV
LABELV $840
line 2208
;2207:	case WP_MP5:
;2208:		addTime = SEALS_FRATE_MP5; 
ADDRLP4 0
CNSTI4 70
ASGNI4
line 2209
;2209:		break;
ADDRGP4 $838
JUMPV
LABELV $841
line 2211
;2210:	case WP_MAC10:
;2211:		addTime = SEALS_FRATE_MAC10;
ADDRLP4 0
CNSTI4 85
ASGNI4
line 2212
;2212:		break;
ADDRGP4 $838
JUMPV
LABELV $842
line 2214
;2213:	case WP_P9S:
;2214:    addTime = SEALS_FRATE_P9S;
ADDRLP4 0
CNSTI4 125
ASGNI4
line 2215
;2215:    break;
ADDRGP4 $838
JUMPV
LABELV $843
line 2217
;2216:	case WP_GLOCK:
;2217:    addTime = SEALS_FRATE_GLOCK;
ADDRLP4 0
CNSTI4 125
ASGNI4
line 2218
;2218:    break;
ADDRGP4 $838
JUMPV
LABELV $844
line 2220
;2219:	case WP_MK23:
;2220:		addTime = SEALS_FRATE_MK23;
ADDRLP4 0
CNSTI4 125
ASGNI4
line 2221
;2221:		break;
ADDRGP4 $838
JUMPV
LABELV $845
line 2223
;2222:	case WP_M590:
;2223:		addTime = SEALS_FRATE_M590;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 2224
;2224:		break;
ADDRGP4 $838
JUMPV
LABELV $846
line 2226
;2225:	case WP_870:
;2226:		addTime = SEALS_FRATE_870;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 2227
;2227:		break;
ADDRGP4 $838
JUMPV
LABELV $847
line 2229
;2228:	case WP_SPAS15:
;2229:		addTime = SEALS_FRATE_SPAS15;
ADDRLP4 0
CNSTI4 125
ASGNI4
line 2230
;2230:		break;
ADDRGP4 $838
JUMPV
LABELV $848
line 2232
;2231:	case WP_M14:
;2232:		addTime = SEALS_FRATE_M14;
ADDRLP4 0
CNSTI4 125
ASGNI4
line 2233
;2233:		break;
ADDRGP4 $838
JUMPV
LABELV $849
line 2235
;2234:	case WP_MACMILLAN:
;2235:		addTime = SEALS_FRATE_MACMILLAN; 
ADDRLP4 0
CNSTI4 100
ASGNI4
line 2236
;2236:		break;
ADDRGP4 $838
JUMPV
LABELV $850
line 2238
;2237:	case WP_SL8SD:
;2238:		addTime = SEALS_FRATE_SL8SD;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 2239
;2239:		break;
ADDRGP4 $838
JUMPV
LABELV $851
line 2241
;2240:	case WP_PSG1:
;2241:		addTime = SEALS_FRATE_SL8SD;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 2242
;2242:		break;	
ADDRGP4 $838
JUMPV
LABELV $852
line 2244
;2243:	case WP_M4:
;2244:		addTime = SEALS_FRATE_M4;
ADDRLP4 0
CNSTI4 90
ASGNI4
line 2245
;2245:		break;
ADDRGP4 $838
JUMPV
LABELV $853
line 2247
;2246:	case WP_AK47:
;2247:		addTime = SEALS_FRATE_AK47;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 2248
;2248:		break; 
ADDRGP4 $838
JUMPV
LABELV $854
line 2250
;2249:	case WP_M249:
;2250:		addTime = SEALS_FRATE_M249;
ADDRLP4 0
CNSTI4 80
ASGNI4
line 2251
;2251:		break;
ADDRGP4 $838
JUMPV
LABELV $855
line 2253
;2252:	case WP_SW629:
;2253:    addTime = SEALS_FRATE_SW629;
ADDRLP4 0
CNSTI4 200
ASGNI4
line 2254
;2254:    break;
ADDRGP4 $838
JUMPV
LABELV $856
line 2256
;2255:	case WP_DEAGLE:
;2256:		addTime = SEALS_FRATE_DEAGLE;
ADDRLP4 0
CNSTI4 200
ASGNI4
line 2257
;2257:		break;
ADDRGP4 $838
JUMPV
LABELV $857
line 2259
;2258:	case WP_SW40T:
;2259:		addTime = SEALS_FRATE_SW40T;
ADDRLP4 0
CNSTI4 125
ASGNI4
line 2260
;2260:		break;
ADDRGP4 $838
JUMPV
LABELV $858
line 2262
;2261:	case WP_SEALKNIFE:
;2262:    addTime = SEALS_FRATE_SEALKNIFE;
ADDRLP4 0
CNSTI4 380
ASGNI4
line 2263
;2263:    break;
ADDRGP4 $838
JUMPV
LABELV $859
line 2265
;2264:	case WP_KHURKURI:
;2265:		addTime = SEALS_FRATE_KHURKURI;
ADDRLP4 0
CNSTI4 380
ASGNI4
line 2266
;2266:		break;
ADDRGP4 $838
JUMPV
LABELV $837
line 2268
;2267:	default:
;2268:		addTime = SEALS_FRATE_DEFAULT;
ADDRLP4 0
CNSTI4 175
ASGNI4
line 2269
;2269:	}	
LABELV $838
line 2271
;2270:
;2271:	return addTime;
ADDRLP4 0
INDIRI4
RETI4
LABELV $836
endproc PM_GetWeaponTime 8 0
proc PM_Weapon_Bombcase 32 4
line 2282
;2272:}
;2273:// Navy Seals --
;2274:/*
;2275:==============
;2276:PM_BombCase
;2277:
;2278:  Handles bombcase 1st person weapon
;2279:==============
;2280:*/
;2281:static void PM_Weapon_Bombcase( void )
;2282:{
line 2283
;2283:	int event = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2285
;2284:
;2285:	if ( !(pm->ps->pm_flags & PMF_BOMBCASE) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $863
line 2286
;2286:		return;
ADDRGP4 $862
JUMPV
LABELV $863
line 2288
;2287:
;2288:	if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $865
line 2289
;2289:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
LABELV $865
line 2291
;2290:
;2291:	PM_ContinueTorsoAnim( TORSO_STAND_ITEM );
CNSTI4 28
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 2292
;2292:	PM_ContinueLegsAnim( LEGS_IDLE );
CNSTI4 43
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 2294
;2293:
;2294:	if ( pm->ps->weaponstate == WEAPON_LASTRND   
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 11
EQI4 $876
ADDRLP4 12
INDIRI4
CNSTI4 12
EQI4 $876
ADDRLP4 12
INDIRI4
CNSTI4 13
EQI4 $876
ADDRLP4 12
INDIRI4
CNSTI4 14
EQI4 $876
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $876
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $876
ADDRLP4 12
INDIRI4
CNSTI4 17
EQI4 $876
ADDRLP4 12
INDIRI4
CNSTI4 18
NEI4 $868
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 5
GTI4 $868
LABELV $876
line 2302
;2295:	|| pm->ps->weaponstate == WEAPON_BANDAGING_START   
;2296:	|| pm->ps->weaponstate == WEAPON_BANDAGING_END   
;2297:	|| pm->ps->weaponstate == WEAPON_BANDAGING   
;2298:	|| pm->ps->weaponstate == WEAPON_MELEE   
;2299:	|| pm->ps->weaponstate == WEAPON_THROW   
;2300:	|| pm->ps->weaponstate == WEAPON_FIRING21   
;2301:	|| pm->ps->weaponstate == WEAPON_FIRING22 && pm->ps->weaponTime <= 5)
;2302:	{ 
line 2303
;2303:		if ( pm->ps->weaponstate == WEAPON_LASTRND )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 11
NEI4 $877
line 2304
;2304:			event = EV_CLIPWIRE_1;
ADDRLP4 0
CNSTI4 100
ASGNI4
ADDRGP4 $878
JUMPV
LABELV $877
line 2305
;2305:		else if ( pm->ps->weaponstate == WEAPON_BANDAGING_START )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 12
NEI4 $879
line 2306
;2306:			event = EV_CLIPWIRE_2;
ADDRLP4 0
CNSTI4 101
ASGNI4
ADDRGP4 $880
JUMPV
LABELV $879
line 2307
;2307:		else if ( pm->ps->weaponstate == WEAPON_BANDAGING_END )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 13
NEI4 $881
line 2308
;2308:			event = EV_CLIPWIRE_3;
ADDRLP4 0
CNSTI4 102
ASGNI4
ADDRGP4 $882
JUMPV
LABELV $881
line 2309
;2309:		else if ( pm->ps->weaponstate == WEAPON_BANDAGING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $883
line 2310
;2310:			event = EV_CLIPWIRE_4;
ADDRLP4 0
CNSTI4 103
ASGNI4
ADDRGP4 $884
JUMPV
LABELV $883
line 2311
;2311:		else if ( pm->ps->weaponstate == WEAPON_MELEE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 15
NEI4 $885
line 2312
;2312:			event = EV_CLIPWIRE_5;
ADDRLP4 0
CNSTI4 104
ASGNI4
ADDRGP4 $886
JUMPV
LABELV $885
line 2313
;2313:		else if ( pm->ps->weaponstate == WEAPON_THROW )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 16
NEI4 $887
line 2314
;2314:			event = EV_CLIPWIRE_6;
ADDRLP4 0
CNSTI4 105
ASGNI4
ADDRGP4 $888
JUMPV
LABELV $887
line 2315
;2315:		else if ( pm->ps->weaponstate == WEAPON_FIRING21 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 17
NEI4 $889
line 2316
;2316:			event = EV_CLIPWIRE_7;
ADDRLP4 0
CNSTI4 106
ASGNI4
ADDRGP4 $890
JUMPV
LABELV $889
line 2317
;2317:		else if ( pm->ps->weaponstate == WEAPON_FIRING22 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 18
NEI4 $862
line 2318
;2318:			event = EV_CLIPWIRE_8;
ADDRLP4 0
CNSTI4 107
ASGNI4
line 2320
;2319:		else
;2320:			return;
LABELV $892
LABELV $890
LABELV $888
LABELV $886
LABELV $884
LABELV $882
LABELV $880
LABELV $878
line 2322
;2321:		 
;2322:		PM_AddEvent(event);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2323
;2323:	}
LABELV $868
line 2325
;2324:
;2325:	if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $893
line 2326
;2326:		return;
ADDRGP4 $862
JUMPV
LABELV $893
line 2330
;2327:
;2328://	Com_Printf("ws: %i  -- ", pm->ps->weaponstate );
;2329:
;2330:	if ( pm->ps->weaponstate == WEAPON_RAISING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $895
line 2332
;2331:	//	Com_Printf("finished raising.\n");
;2332:		pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2333
;2333:		return;
ADDRGP4 $862
JUMPV
LABELV $895
line 2337
;2334:	}
;2335:
;2336:	// pressing use... 
;2337:	if ( pm->cmd.buttons & BUTTON_USE && !(pm->ps->pm_flags & PMF_SHOT_LOCKED) )
ADDRLP4 16
ADDRGP4 pm
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
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $897
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $897
line 2338
;2338:	{
line 2340
;2339:	//		Com_Printf("pushed use.\n");
;2340:		pm->ps->pm_flags |= PMF_SHOT_LOCKED;   
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2351
;2341:		/*
;2342:			WEAPON_FIRING - on wire 1
;2343:			WEAPON_FIRING2 - on wire 2
;2344:			WEAPON_FIRING3 - on wire 3
;2345:			WEAPON_FIREEMPTY - on wire 4
;2346:			WEAPON_RELOADING - on wire 5
;2347:			WEAPON_RELOADING_CYCLE - on wire 6
;2348:			WEAPON_RELOADING_STOP - on wire 7
;2349:			WEAPON_RELOADING_EMPTY - on wire 8
;2350:		*/
;2351:		if ( pm->ps->weaponstate == WEAPON_FIRING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $899
line 2352
;2352:		{
line 2353
;2353:			pm->ps->weaponstate = WEAPON_FIRING2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
line 2354
;2354:		}
ADDRGP4 $900
JUMPV
LABELV $899
line 2355
;2355:		else if ( pm->ps->weaponstate == WEAPON_FIRING2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 4
NEI4 $901
line 2356
;2356:		{
line 2357
;2357:			pm->ps->weaponstate = WEAPON_FIRING3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 5
ASGNI4
line 2358
;2358:		} 
ADDRGP4 $902
JUMPV
LABELV $901
line 2359
;2359:		else if ( pm->ps->weaponstate == WEAPON_FIRING3 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $903
line 2360
;2360:		{
line 2361
;2361:			pm->ps->weaponstate = WEAPON_FIREEMPTY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 6
ASGNI4
line 2362
;2362:		}
ADDRGP4 $904
JUMPV
LABELV $903
line 2363
;2363:		else if ( pm->ps->weaponstate == WEAPON_FIREEMPTY )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 6
NEI4 $905
line 2364
;2364:		{
line 2365
;2365:			pm->ps->weaponstate = WEAPON_RELOADING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 7
ASGNI4
line 2366
;2366:		}
ADDRGP4 $906
JUMPV
LABELV $905
line 2367
;2367:		else if ( pm->ps->weaponstate == WEAPON_RELOADING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 7
NEI4 $907
line 2368
;2368:		{
line 2369
;2369:			pm->ps->weaponstate = WEAPON_RELOADING_CYCLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 8
ASGNI4
line 2370
;2370:		}
ADDRGP4 $908
JUMPV
LABELV $907
line 2371
;2371:		else if ( pm->ps->weaponstate == WEAPON_RELOADING_CYCLE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 8
NEI4 $909
line 2372
;2372:		{
line 2373
;2373:			pm->ps->weaponstate = WEAPON_RELOADING_STOP;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 9
ASGNI4
line 2374
;2374:		}
ADDRGP4 $910
JUMPV
LABELV $909
line 2375
;2375:		else if ( pm->ps->weaponstate == WEAPON_RELOADING_STOP )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 9
NEI4 $911
line 2376
;2376:		{
line 2377
;2377:			pm->ps->weaponstate = WEAPON_RELOADING_EMPTY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 10
ASGNI4
line 2378
;2378:		}
ADDRGP4 $912
JUMPV
LABELV $911
line 2379
;2379:		else if ( pm->ps->weaponstate == WEAPON_RELOADING_EMPTY )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 10
NEI4 $913
line 2380
;2380:		{
line 2381
;2381:			pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2382
;2382:		}
ADDRGP4 $914
JUMPV
LABELV $913
line 2384
;2383:		else
;2384:			pm->ps->weaponstate = WEAPON_FIRING; // if we came here from some unknown wire go back to first!
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
LABELV $914
LABELV $912
LABELV $910
LABELV $908
LABELV $906
LABELV $904
LABELV $902
LABELV $900
line 2387
;2385:		
;2386:	//		Com_Printf("Changed to wire #%i.\n", pm->ps->weaponstate );
;2387:		pm->ps->weaponTime = 200; 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 200
ASGNI4
line 2388
;2388:		return;
ADDRGP4 $862
JUMPV
LABELV $897
line 2390
;2389:	}
;2390:	if (!( pm->cmd.buttons & BUTTON_ATTACK ) ) { 
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $915
line 2391
;2391:		pm->ps->weaponTime = 0;  
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2392
;2392:		pm->ps->pm_flags &= ~PMF_SHOT_LOCKED;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2393
;2393:		return;
ADDRGP4 $862
JUMPV
LABELV $915
line 2396
;2394:	}
;2395:
;2396:	if ( pm->ps->pm_flags & PMF_SHOT_LOCKED )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $917
line 2397
;2397:		return;
ADDRGP4 $862
JUMPV
LABELV $917
line 2402
;2398:		
;2399:
;2400:	//	Com_Printf("Clipping wire #%i.\n", pm->ps->weaponstate );
;2401:
;2402:	pm->ps->pm_flags |= PMF_SHOT_LOCKED;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2404
;2403:
;2404:	if ( pm->ps->weaponstate == WEAPON_FIRING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $919
line 2405
;2405:	{
line 2406
;2406:		pm->ps->weaponstate = WEAPON_LASTRND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 11
ASGNI4
line 2407
;2407:	}
ADDRGP4 $920
JUMPV
LABELV $919
line 2408
;2408:	else if ( pm->ps->weaponstate == WEAPON_FIRING2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 4
NEI4 $921
line 2409
;2409:	{
line 2410
;2410:		pm->ps->weaponstate = WEAPON_BANDAGING_START;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 12
ASGNI4
line 2411
;2411:	} 
ADDRGP4 $922
JUMPV
LABELV $921
line 2412
;2412:	else if ( pm->ps->weaponstate == WEAPON_FIRING3 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $923
line 2413
;2413:	{
line 2414
;2414:		pm->ps->weaponstate = WEAPON_BANDAGING_END;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 13
ASGNI4
line 2415
;2415:	}
ADDRGP4 $924
JUMPV
LABELV $923
line 2416
;2416:	else if ( pm->ps->weaponstate == WEAPON_FIREEMPTY )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 6
NEI4 $925
line 2417
;2417:	{
line 2418
;2418:		pm->ps->weaponstate = WEAPON_BANDAGING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 14
ASGNI4
line 2419
;2419:	}
ADDRGP4 $926
JUMPV
LABELV $925
line 2420
;2420:	else if ( pm->ps->weaponstate == WEAPON_RELOADING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 7
NEI4 $927
line 2421
;2421:	{
line 2422
;2422:		pm->ps->weaponstate = WEAPON_MELEE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 15
ASGNI4
line 2423
;2423:	}
ADDRGP4 $928
JUMPV
LABELV $927
line 2424
;2424:	else if ( pm->ps->weaponstate == WEAPON_RELOADING_CYCLE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 8
NEI4 $929
line 2425
;2425:	{
line 2426
;2426:		pm->ps->weaponstate = WEAPON_THROW;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 16
ASGNI4
line 2427
;2427:	}
ADDRGP4 $930
JUMPV
LABELV $929
line 2428
;2428:	else if ( pm->ps->weaponstate == WEAPON_RELOADING_STOP )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 9
NEI4 $931
line 2429
;2429:	{
line 2430
;2430:		pm->ps->weaponstate = WEAPON_FIRING21;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 17
ASGNI4
line 2431
;2431:	}
ADDRGP4 $932
JUMPV
LABELV $931
line 2432
;2432:	else if ( pm->ps->weaponstate == WEAPON_RELOADING_EMPTY )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 10
NEI4 $933
line 2433
;2433:	{
line 2434
;2434:		pm->ps->weaponstate = WEAPON_FIRING22;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 18
ASGNI4
line 2435
;2435:	}
LABELV $933
LABELV $932
LABELV $930
LABELV $928
LABELV $926
LABELV $924
LABELV $922
LABELV $920
line 2437
;2436:
;2437:	pm->ps->weaponTime = 1000; 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 1000
ASGNI4
line 2439
;2438:
;2439:	return;
LABELV $862
endproc PM_Weapon_Bombcase 32 4
proc PM_Seed 4 4
line 2450
;2440:}
;2441:
;2442:/*
;2443:==============
;2444:PM_Seed
;2445:
;2446:Update weapon seed for firing
;2447:==============
;2448:*/
;2449:static void PM_Seed( void ) 
;2450:{
line 2454
;2451:	int seed;
;2452:	
;2453:	// Update the seed
;2454:	seed = pm->ps->stats[STAT_SEED];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ASGNI4
line 2455
;2455:	Q_rand ( &seed );
ADDRLP4 0
ARGP4
ADDRGP4 Q_rand
CALLI4
pop
line 2456
;2456:	seed = seed & 0xFFFF;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 65535
BANDI4
ASGNI4
line 2457
;2457:	pm->ps->stats[STAT_SEED] = seed;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 240
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2458
;2458:}
LABELV $935
endproc PM_Seed 4 4
proc PM_Weapon 160 8
line 2468
;2459:
;2460:
;2461:/*
;2462:==============
;2463:PM_Weapon
;2464:
;2465:Generates weapon events and modifes the weapon counter
;2466:==============
;2467:*/
;2468:static void PM_Weapon( void ) {
line 2471
;2469:	// Navy Seals ++ : everything has been rewritten
;2470:	// don't allow attack until all buttons are up
;2471:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $937
line 2472
;2472:		return;
ADDRGP4 $936
JUMPV
LABELV $937
line 2476
;2473:	}
;2474:
;2475:	// ignore if spectator
;2476:	if ( pm->ps->pm_type == PM_SPECTATOR || pm->ps->pm_type == PM_NOCLIP ) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $941
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $939
LABELV $941
line 2477
;2477:		return;
ADDRGP4 $936
JUMPV
LABELV $939
line 2482
;2478:	}
;2479:
;2480:	
;2481:	// check for dead player
;2482:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $942
line 2483
;2483:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2484
;2484:		return;
ADDRGP4 $936
JUMPV
LABELV $942
line 2488
;2485:	}
;2486:
;2487:	// handle bombcase
;2488:	if ( (pm->ps->pm_flags & PMF_BOMBCASE) && pm->ps->weapon == WP_C4 )
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $944
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 3
NEI4 $944
line 2489
;2489:	{
line 2490
;2490:		PM_Weapon_Bombcase();
ADDRGP4 PM_Weapon_Bombcase
CALLV
pop
line 2491
;2491:		return;
ADDRGP4 $936
JUMPV
LABELV $944
line 2514
;2492:	}
;2493:#if 0
;2494: 	// check for item using
;2495:	if ( pm->cmd.buttons & BUTTON_USE_HOLDABLE ) {
;2496:		if ( ! ( pm->ps->pm_flags & PMF_USE_ITEM_HELD ) ) {
;2497:			if ( bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag == HI_MEDKIT
;2498:				&& pm->ps->stats[STAT_HEALTH] >= pm->ps->stats[STAT_MAX_HEALTH] ) {
;2499:				// don't use medkit if at max health
;2500:			} else {
;2501:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
;2502:				PM_AddEvent( EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag );
;2503:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
;2504:			}
;2505:			return;
;2506:		}
;2507:	} else {
;2508:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
;2509:	}
;2510:#endif
;2511:
;2512:
;2513:	// make weapon function
;2514:	if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $946
line 2515
;2515:	{
line 2516
;2516:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 2522
;2517:
;2518:
;2519:		
;2520:		if
;2521:			(
;2522:			!( pm->ps->eFlags & EF_WEAPONS_LOCKED) 
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
NEI4 $949
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 3
EQI4 $952
ADDRLP4 16
INDIRI4
CNSTI4 4
EQI4 $952
ADDRLP4 16
INDIRI4
CNSTI4 5
NEI4 $949
LABELV $952
line 2530
;2523:			&&
;2524:			(
;2525:				pm->ps->weaponstate == WEAPON_FIRING || 
;2526:				pm->ps->weaponstate == WEAPON_FIRING2 ||
;2527:				pm->ps->weaponstate == WEAPON_FIRING3
;2528:			)
;2529:			)
;2530:		{
line 2532
;2531: 			// special rule for pistols to allow extrem fast trigger pushing.
;2532:			if ( BG_IsMelee( pm->ps->weapon ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $953
line 2533
;2533:			{
line 2534
;2534:				if ( (pm->cmd.buttons & BUTTON_ATTACK ) && pm->ps->weaponTime < PM_GetWeaponTime(pm->ps->weapon)-50 && !(pm->ps->pm_flags & PMF_SHOT_LOCKED) ) 
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $955
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 PM_GetWeaponTime
CALLI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 50
SUBI4
GEI4 $955
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $955
line 2535
;2535:				{
line 2536
;2536:					if ( pm->ps->weaponstate == WEAPON_FIRING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $957
line 2537
;2537:						pm->ps->weaponstate = WEAPON_FIRING2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 $958
JUMPV
LABELV $957
line 2538
;2538:					else if ( pm->ps->weaponstate == WEAPON_FIRING2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 4
NEI4 $959
line 2539
;2539:						pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
ADDRGP4 $960
JUMPV
LABELV $959
line 2541
;2540:					else
;2541:						pm->ps->weaponstate = WEAPON_FIRING2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
LABELV $960
LABELV $958
line 2543
;2542:
;2543:					if (pm->ps->stats[STAT_ROUNDS] == 1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 1
NEI4 $961
line 2544
;2544:						pm->ps->weaponstate = WEAPON_LASTRND; // go to lastrnd
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 11
ASGNI4
LABELV $961
line 2546
;2545:
;2546:					PM_AddEvent( EV_FIRE_WEAPON ); 
CNSTI4 29
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2547
;2547:					pm->ps->weaponTime = PM_GetWeaponTime( pm->ps->weapon ); 
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 PM_GetWeaponTime
CALLI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2548
;2548:					pm->ps->pm_flags |= PMF_SHOT_LOCKED;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2549
;2549:					PM_StartTorsoAnim( TORSO_ATTACK_MELEE );
CNSTI4 29
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2551
;2550:
;2551:					return;
ADDRGP4 $936
JUMPV
LABELV $955
line 2553
;2552:				}
;2553:				if ( pm->ps->pm_flags & PMF_SHOT_LOCKED && !(pm->cmd.buttons & 1 ) && pm->ps->weaponTime < PM_GetWeaponTime(pm->ps->weapon)-50 )
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 44
INDIRI4
EQI4 $954
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 44
INDIRI4
NEI4 $954
ADDRLP4 40
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 PM_GetWeaponTime
CALLI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
CNSTI4 50
SUBI4
GEI4 $954
line 2554
;2554:				{
line 2555
;2555:					pm->ps->pm_flags &=~ PMF_SHOT_LOCKED;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2556
;2556:				}
line 2557
;2557:			} 
ADDRGP4 $954
JUMPV
LABELV $953
line 2558
;2558:			else if ( BG_IsPistol( pm->ps->weapon ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_IsPistol
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $965
line 2559
;2559:			{
line 2560
;2560:				if ( (pm->cmd.buttons & BUTTON_ATTACK ) && pm->ps->weaponTime < PM_GetWeaponTime(pm->ps->weapon)-50 &&  pm->ps->stats[STAT_ROUNDS] > 0 && !(pm->ps->pm_flags & PMF_SHOT_LOCKED) ) 
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $967
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 PM_GetWeaponTime
CALLI4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 50
SUBI4
GEI4 $967
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $967
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 44
INDIRI4
NEI4 $967
line 2561
;2561:				{
line 2562
;2562:					if ( pm->ps->weaponstate == WEAPON_FIRING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $969
line 2563
;2563:						pm->ps->weaponstate = WEAPON_FIRING2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 $970
JUMPV
LABELV $969
line 2564
;2564:					else if ( pm->ps->weaponstate == WEAPON_FIRING2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 4
NEI4 $971
line 2565
;2565:						pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
ADDRGP4 $972
JUMPV
LABELV $971
line 2567
;2566:					else
;2567:						pm->ps->weaponstate = WEAPON_FIRING2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
LABELV $972
LABELV $970
line 2569
;2568:
;2569:					if (pm->ps->stats[STAT_ROUNDS] == 1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 1
NEI4 $973
line 2570
;2570:						pm->ps->weaponstate = WEAPON_LASTRND; // go to lastrnd
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 11
ASGNI4
LABELV $973
line 2572
;2571:
;2572:					PM_Seed( );
ADDRGP4 PM_Seed
CALLV
pop
line 2573
;2573:					PM_AddEvent( EV_FIRE_WEAPON ); 
CNSTI4 29
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2574
;2574:					pm->ps->weaponTime = PM_GetWeaponTime( pm->ps->weapon ); 
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 PM_GetWeaponTime
CALLI4
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 2575
;2575:					pm->ps->pm_flags |= PMF_SHOT_LOCKED;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2576
;2576:					PM_StartTorsoAnim( TORSO_ATTACK_PISTOL );
CNSTI4 25
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2577
;2577:					return;
ADDRGP4 $936
JUMPV
LABELV $967
line 2579
;2578:				}
;2579:				if ( pm->ps->pm_flags & PMF_SHOT_LOCKED && !(pm->cmd.buttons & 1 ) && pm->ps->weaponTime < PM_GetWeaponTime(pm->ps->weapon)-50 )
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 56
INDIRI4
EQI4 $975
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 56
INDIRI4
NEI4 $975
ADDRLP4 52
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 PM_GetWeaponTime
CALLI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
CNSTI4 50
SUBI4
GEI4 $975
line 2580
;2580:				{
line 2581
;2581:					pm->ps->pm_flags &=~ PMF_SHOT_LOCKED;
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2582
;2582:				}
LABELV $975
line 2583
;2583:			}
LABELV $965
LABELV $954
line 2584
;2584:		}
LABELV $949
line 2585
;2585:	}
LABELV $946
line 2588
;2586:  
;2587:	// special c4 stuff
;2588:	if ( pm->ps->weapon == WP_C4 && pm->ps->weaponstate == WEAPON_FIRING )
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 3
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $977
ADDRLP4 8
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $977
line 2589
;2589:	{
line 2590
;2590:		if ( ( pm->cmd.buttons & BUTTON_ATTACK ) && ( pm->ps->pm_flags & PMF_BOMBRANGE)) 
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $979
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $979
line 2591
;2591:		{
line 2592
;2592:			if ( pm->ps->weaponTime <= 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $981
line 2593
;2593:			{
line 2594
;2594:				pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2595
;2595:				BG_RemoveWeapon( WP_C4, pm->ps->stats );
CNSTI4 3
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_RemoveWeapon
CALLV
pop
line 2596
;2596:				pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2597
;2597:				pm->ps->weaponTime = 100;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 100
ASGNI4
line 2599
;2598:				
;2599:				PM_AddEvent( EV_C4DEPLOY );
CNSTI4 93
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2600
;2600:				return;
ADDRGP4 $936
JUMPV
LABELV $981
line 2602
;2601:			}
;2602:			pm->ps->weaponTime -= pml.msec;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 2603
;2603:			return;
ADDRGP4 $936
JUMPV
LABELV $979
line 2606
;2604:		}
;2605:		else
;2606:		{
line 2607
;2607:			pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2608
;2608:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2609
;2609:		}
line 2610
;2610:	}
LABELV $977
line 2613
;2611:
;2612:	// generic grenade throwing
;2613:	if (  pm->ps->weapon == WP_GRENADE || pm->ps->weapon == WP_FLASHBANG || pm->ps->weapon == WP_SMOKE )
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4
EQI4 $987
ADDRLP4 16
INDIRI4
CNSTI4 5
EQI4 $987
ADDRLP4 16
INDIRI4
CNSTI4 25
NEI4 $984
LABELV $987
line 2614
;2614:	{
line 2615
;2615:		int ammotype = AM_GRENADES;
ADDRLP4 20
CNSTI4 10
ASGNI4
line 2617
;2616:
;2617:		if ( pm->ps->weapon == WP_FLASHBANG )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 5
NEI4 $988
line 2618
;2618:			ammotype = AM_FLASHBANGS;
ADDRLP4 20
CNSTI4 11
ASGNI4
ADDRGP4 $989
JUMPV
LABELV $988
line 2619
;2619:		else if ( pm->ps->weapon == WP_SMOKE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 25
NEI4 $990
line 2620
;2620:			ammotype = AM_SMOKE;
ADDRLP4 20
CNSTI4 12
ASGNI4
LABELV $990
LABELV $989
line 2622
;2621:
;2622:		if ( pm->ps->weaponstate == WEAPON_FIRING2 || pm->ps->weaponstate == WEAPON_FIRING3)
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 4
EQI4 $994
ADDRLP4 24
INDIRI4
CNSTI4 5
NEI4 $992
LABELV $994
line 2623
;2623:		{
line 2624
;2624:			if ( pm->ps->weaponTime <= 0 ) // finished throwing
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $995
line 2625
;2625:			{
line 2626
;2626:				if ( pm->ps->ammo[ammotype] <= 0) {
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
GTI4 $997
line 2627
;2627:					BG_RemoveWeapon( pm->ps->weapon, pm->ps->stats );
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_RemoveWeapon
CALLV
pop
line 2628
;2628:					pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2629
;2629:				}
ADDRGP4 $936
JUMPV
LABELV $997
line 2630
;2630:				else {
line 2631
;2631:					float weaponTime = PM_GetWeaponTimeOnRaise() * BG_GetSpeedMod( pm->ps->persistant[PERS_TECHNICAL] );
ADDRLP4 32
ADDRGP4 PM_GetWeaponTimeOnRaise
CALLI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_GetSpeedMod
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 2635
;2632:
;2633://					Com_Printf("weaponTime: %3f\n", weaponTime );
;2634:
;2635:					pm->ps->weaponTime = (int)weaponTime;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 2636
;2636:					pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 2637
;2637:				}
line 2639
;2638:   
;2639:				return;
ADDRGP4 $936
JUMPV
LABELV $995
line 2641
;2640:			}
;2641:		}
LABELV $992
line 2642
;2642:		if ( pm->ps->weaponstate == WEAPON_FIRING ) // released button
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $999
line 2643
;2643:		{	
line 2644
;2644:			if ( !(pm->cmd.buttons & BUTTON_ATTACK ) && pm->ps->weaponTime <= 0 ) 
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 32
INDIRI4
NEI4 $1001
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $1001
line 2645
;2645:			{
line 2646
;2646:				PM_AddEvent( EV_FIRE_WEAPON ); // send event
CNSTI4 29
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2647
;2647:				pm->ps->ammo[ammotype]--; // remove a grenade 
ADDRLP4 36
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2648
;2648:				if ( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADEROLL ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1003
line 2649
;2649:				{
line 2650
;2650:					pm->ps->weaponstate = WEAPON_FIRING3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 5
ASGNI4
line 2651
;2651:					pm->ps->weaponTime = 560; // set weapontime
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 560
ASGNI4
line 2652
;2652:				}
ADDRGP4 $1004
JUMPV
LABELV $1003
line 2653
;2653:				else {
line 2654
;2654:					pm->ps->weaponstate = WEAPON_FIRING2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
line 2655
;2655:					pm->ps->weaponTime = 360; // set weapontime
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 360
ASGNI4
line 2656
;2656:				}
LABELV $1004
line 2657
;2657:				PM_StartTorsoAnim( TORSO_THROW );
CNSTI4 30
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2658
;2658:			}
ADDRGP4 $936
JUMPV
LABELV $1001
line 2659
;2659:			else if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $936
line 2660
;2660:			{
line 2661
;2661:				if (pm->ps->weaponTime <= -500 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 -500
GTI4 $1007
line 2662
;2662:					return;
ADDRGP4 $936
JUMPV
LABELV $1007
line 2664
;2663:
;2664:				if ( pm->ps->weaponstate == WEAPON_FIRING3 || pm->ps->weaponstate == WEAPON_FIRING2 )
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 5
EQI4 $1011
ADDRLP4 36
INDIRI4
CNSTI4 4
NEI4 $936
LABELV $1011
line 2665
;2665:					pm->ps->weaponTime--;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2667
;2666:
;2667:			}
line 2668
;2668:			return;
ADDRGP4 $936
JUMPV
LABELV $999
line 2671
;2669:		}
;2670:  
;2671:	}
LABELV $984
line 2678
;2672:	
;2673:
;2674:	//
;2675:	// Bandaging
;2676:	//
;2677: 
;2678:	if ( pm->ps->weaponstate == WEAPON_BANDAGING_START ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 12
NEI4 $1012
line 2679
;2679:		if (  pm->ps->weaponTime <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $936
line 2680
;2680:			pm->ps->weaponstate = WEAPON_BANDAGING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 14
ASGNI4
line 2681
;2681:			return;
ADDRGP4 $936
JUMPV
line 2684
;2682:		}
;2683:		else
;2684:			return;
LABELV $1012
line 2686
;2685:	}
;2686:	if ( pm->ps->weaponstate == WEAPON_BANDAGING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1016
line 2687
;2687:		if ( pm->cmd.weapon != pm->ps->weapon )
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
EQI4 $1018
line 2688
;2688:			pm->ps->weapon = pm->cmd.weapon;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
LABELV $1018
line 2690
;2689:
;2690:		if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1020
line 2691
;2691:		{
line 2692
;2692:			pm->ps->weaponstate = WEAPON_BANDAGING_END;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 13
ASGNI4
line 2693
;2693:			return;
ADDRGP4 $936
JUMPV
LABELV $1020
line 2695
;2694:		}
;2695:		if (pm->ps->weaponTime <= 0) { 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $936
line 2696
;2696:			PM_AddEvent( EV_BANDAGING );
CNSTI4 91
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2697
;2697:			return;
ADDRGP4 $936
JUMPV
line 2700
;2698:		}
;2699:		else		
;2700:			return;
LABELV $1016
line 2702
;2701:	}
;2702:	if ( pm->ps->weaponstate == WEAPON_BANDAGING_END ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1024
line 2703
;2703:		PM_FinishWeaponChange( );
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 2704
;2704:	}
LABELV $1024
line 2706
;2705:
;2706:	if ( pm->ps->weaponstate == WEAPON_RELOADING_STOP )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 9
NEI4 $1026
line 2707
;2707:	{
line 2708
;2708:		if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1028
line 2709
;2709:			return;
ADDRGP4 $936
JUMPV
LABELV $1028
line 2711
;2710:
;2711:		if ( pm->ps->weapon == WP_870 || pm->ps->weapon == WP_M590 )
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 19
EQI4 $1032
ADDRLP4 20
INDIRI4
CNSTI4 20
NEI4 $1030
LABELV $1032
line 2712
;2712:		{
line 2713
;2713:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2714
;2714:			return;
ADDRGP4 $936
JUMPV
LABELV $1030
line 2716
;2715:		}
;2716:	}
LABELV $1026
line 2718
;2717:		// change weapon to null if we've finished holstering
;2718:	if ( pm->ps->weaponstate == WEAPON_HOLSTERING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 21
NEI4 $1033
line 2719
;2719:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2720
;2720:		if ( pm->cmd.buttons & BUTTON_ATTACK ) // if we hold the button key
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $936
line 2721
;2721:		{ // un holster weapon
line 2722
;2722:			PM_FinishWeaponChange( );
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 2723
;2723:		}
line 2725
;2724:		//G_Printf("holstering\n");
;2725:		return;
ADDRGP4 $936
JUMPV
LABELV $1033
line 2728
;2726:	}
;2727:
;2728:	if ( pm->ps->weaponstate == WEAPON_RELOADING_CYCLE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1037
line 2729
;2729:	{
line 2730
;2730:		if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1039
line 2731
;2731:			return;
ADDRGP4 $936
JUMPV
LABELV $1039
line 2733
;2732:
;2733:		if ( pm->ps->weapon == WP_870 || pm->ps->weapon == WP_M590 )
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 19
EQI4 $1043
ADDRLP4 20
INDIRI4
CNSTI4 20
NEI4 $1041
LABELV $1043
line 2734
;2734:		{
line 2735
;2735:			int maxround = 7;
ADDRLP4 24
CNSTI4 7
ASGNI4
line 2737
;2736:
;2737:			maxround = BG_GetMaxRoundForWeapon(pm->ps->weapon);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_GetMaxRoundForWeapon
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 2739
;2738:
;2739:			if ( pm->ps->stats[STAT_ROUNDS] >= maxround || pm->cmd.buttons & BUTTON_ATTACK || pm->ps->ammo[ AM_SHOTGUN ] <= 0 ) 
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $1047
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $1047
ADDRLP4 36
INDIRP4
CNSTI4 376
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
GTI4 $1044
LABELV $1047
line 2740
;2740:			{
line 2741
;2741:				pm->ps->weaponstate = WEAPON_RELOADING_STOP;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 9
ASGNI4
line 2742
;2742:				pm->ps->weaponTime = 1000;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 1000
ASGNI4
line 2743
;2743:				PM_AddEvent( EV_RELOAD_EMPTY );
CNSTI4 95
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2744
;2744:				return;
ADDRGP4 $936
JUMPV
LABELV $1044
line 2746
;2745:			}
;2746:			else if ( pm->ps->stats[STAT_ROUNDS] < maxround && pm->ps->ammo[ AM_SHOTGUN ] > 0)
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $1048
ADDRLP4 44
INDIRP4
CNSTI4 376
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1048
line 2747
;2747:			{		
line 2748
;2748:				pm->ps->weaponstate = WEAPON_RELOADING_CYCLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 8
ASGNI4
line 2749
;2749:				pm->ps->weaponTime = 600;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 600
ASGNI4
line 2750
;2750:				PM_AddEvent( EV_RELOAD );
CNSTI4 94
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2751
;2751:				return;
ADDRGP4 $936
JUMPV
LABELV $1048
line 2753
;2752:			} 
;2753:		}		
LABELV $1041
line 2754
;2754:	}
LABELV $1037
line 2756
;2755:
;2756:	if ( pm->ps->weapon == WP_MACMILLAN && pm->ps->weaponstate == WEAPON_FIRING && pm->ps->weaponTime <= 0)
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 18
NEI4 $1050
ADDRLP4 20
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1050
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1050
line 2757
;2757:	{
line 2759
;2758:	//	if (pm->ps->stats[STAT_ROUNDS] > 0) {
;2759:			pm->ps->weaponstate = WEAPON_RELOADING_CYCLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 8
ASGNI4
line 2760
;2760:			pm->ps->weaponTime = 1800;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 1800
ASGNI4
line 2761
;2761:			PM_AddEvent( EV_RELOAD_EMPTY ); //  play bolt action sound
CNSTI4 95
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2762
;2762:			return;
ADDRGP4 $936
JUMPV
LABELV $1050
line 2765
;2763:	//	}
;2764:	}
;2765:	if ( pm->ps->weaponstate == WEAPON_RELOADING || pm->ps->weaponstate == WEAPON_RELOADING_EMPTY) {
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 7
EQI4 $1054
ADDRLP4 24
INDIRI4
CNSTI4 10
NEI4 $1052
LABELV $1054
line 2766
;2766:		if (pm->ps->weapon == WP_MACMILLAN && pm->ps->weaponstate == WEAPON_RELOADING_EMPTY)
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 18
NEI4 $1055
ADDRLP4 28
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1055
line 2767
;2767:		{
line 2768
;2768:			if (pm->ps->weaponTime <= 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1057
line 2769
;2769:			{
line 2770
;2770:				pm->ps->weaponstate = WEAPON_RELOADING_CYCLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 8
ASGNI4
line 2771
;2771:				pm->ps->weaponTime = 1800;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 1800
ASGNI4
line 2772
;2772:				PM_AddEvent( EV_RELOAD_EMPTY );
CNSTI4 95
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2773
;2773:				return;
ADDRGP4 $936
JUMPV
LABELV $1057
line 2775
;2774:			}
;2775:		}
LABELV $1055
line 2776
;2776:		if ( ( pm->ps->weapon == WP_870 || pm->ps->weapon == WP_M590 ) && pm->ps->weaponTime <= 0 ) {
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 19
EQI4 $1061
ADDRLP4 32
INDIRI4
CNSTI4 20
NEI4 $1059
LABELV $1061
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1059
line 2778
;2777:
;2778:			pm->ps->weaponstate = WEAPON_RELOADING_CYCLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 8
ASGNI4
line 2779
;2779:			pm->ps->weaponTime = 600;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 600
ASGNI4
line 2780
;2780:			PM_AddEvent( EV_RELOAD );			
CNSTI4 94
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2781
;2781:		}
LABELV $1059
line 2782
;2782:		if (pm->ps->weaponTime <= 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $936
line 2783
;2783:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2785
;2784:		else
;2785:			return;
LABELV $1063
line 2786
;2786:	}
LABELV $1052
line 2788
;2787:
;2788:	if ( pm->ps->weaponstate == WEAPON_DROPPING && pm->ps->weaponTime > 0 ) {
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1064
ADDRLP4 28
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1064
line 2790
;2789: //	G_Printf("dropping: %i\n", pm->ps->weaponTime );
;2790:		return;
ADDRGP4 $936
JUMPV
LABELV $1064
line 2793
;2791:	}
;2792:
;2793:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1066
line 2794
;2794:		return;
ADDRGP4 $936
JUMPV
LABELV $1066
line 2800
;2795:	}
;2796:
;2797:	// check for weapon change
;2798:	// can't change if weapon is firing, but can change
;2799:	// again if lowering or raising
;2800:	if ( pm->ps->weaponstate == WEAPON_READY ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1068
line 2801
;2801:		if ( pm->ps->powerups[PW_BRIEFCASE] && BG_IsPrimary( pm->cmd.weapon ) && pm->cmd.weapon != WP_C4 )
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1070
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 36
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1070
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
CNSTI4 3
EQI4 $1070
line 2802
;2802:			;
ADDRGP4 $1071
JUMPV
LABELV $1070
line 2803
;2803:		else if ( pm->ps->weapon != pm->cmd.weapon && pm->ps->weaponstate != WEAPON_HOLSTERING) {
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $1072
ADDRLP4 44
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 21
EQI4 $1072
line 2804
;2804:			PM_BeginWeaponChange( pm->cmd.weapon );
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 PM_BeginWeaponChange
CALLV
pop
line 2805
;2805:			return;
ADDRGP4 $936
JUMPV
LABELV $1072
LABELV $1071
line 2807
;2806:		}
;2807:	}
LABELV $1068
line 2811
;2808:
;2809:
;2810:	// change weapon if time
;2811:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1074
line 2812
;2812:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 2813
;2813:		return;
ADDRGP4 $936
JUMPV
LABELV $1074
line 2816
;2814:	}
;2815:
;2816:	if ( pm->ps->weaponstate == WEAPON_RAISING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1076
line 2817
;2817:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2819
;2818:
;2819:		if ( pm->ps->powerups[PW_BRIEFCASE] )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1078
line 2820
;2820:			PM_StartTorsoAnim( TORSO_STAND_SUITCASE );
CNSTI4 26
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $936
JUMPV
LABELV $1078
line 2822
;2821:		else if (  
;2822:			( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM2X ) ) ||
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $1083
ADDRLP4 36
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $1080
ADDRLP4 32
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1083
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 16
NEI4 $1080
LABELV $1083
line 2826
;2823:			( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM4X ) ) &&
;2824:			( ( BG_IsRifle( pm->ps->weapon ) || pm->ps->weapon == WP_M4 ))
;2825:		   )
;2826:		   PM_StartTorsoAnim( TORSO_STAND_RIFLE_SCOPED );
CNSTI4 22
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $936
JUMPV
LABELV $1080
line 2827
;2827:		else if ( BG_IsRifle( pm->ps->weapon )  )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1084
line 2828
;2828:			PM_StartTorsoAnim( TORSO_STAND_RIFLE );
CNSTI4 20
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $936
JUMPV
LABELV $1084
line 2829
;2829:		else if ( BG_IsPistol( pm->ps->weapon ) || pm->ps->weapon == WP_PDW || pm->ps->weapon == WP_MAC10)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_IsPistol
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $1089
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 12
EQI4 $1089
ADDRLP4 56
INDIRI4
CNSTI4 13
NEI4 $1086
LABELV $1089
line 2830
;2830:			PM_StartTorsoAnim( TORSO_STAND_PISTOL );
CNSTI4 24
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $936
JUMPV
LABELV $1086
line 2831
;2831:		else if ( BG_IsMelee( pm->ps->weapon ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $1090
line 2832
;2832:			PM_StartTorsoAnim( TORSO_STAND_ITEM );
CNSTI4 28
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $936
JUMPV
LABELV $1090
line 2834
;2833:		else // default
;2834:			PM_StartTorsoAnim( TORSO_STAND_ITEM );
CNSTI4 28
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2836
;2835:
;2836:		return;
ADDRGP4 $936
JUMPV
LABELV $1076
line 2843
;2837:	}
;2838:
;2839:	//
;2840:	// bayonet attack
;2841:	//  -- instant stab -- 
;2842:	if ( /* pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ) && */
;2843:		pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_BAYONET ) && 
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1092
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 16
EQI4 $1094
ADDRLP4 36
INDIRI4
CNSTI4 15
NEI4 $1092
LABELV $1094
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 512
ASGNI4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $1092
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
BANDI4
ADDRLP4 48
INDIRI4
EQI4 $1092
line 2848
;2844:		( pm->ps->weapon == WP_M4 || pm->ps->weapon == WP_AK47 ) &&
;2845:		!( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_GRENADELAUNCHER ) ) &&
;2846:		( pm->cmd.buttons & BUTTON_WEAPON3 )
;2847:		)
;2848:	{	   
line 2849
;2849:		if ( pm->ps->pm_flags & PMF_SHOT_LOCKED )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1095
line 2850
;2850:		{
line 2851
;2851:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2852
;2852:			pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2853
;2853:			return;
ADDRGP4 $936
JUMPV
LABELV $1095
line 2856
;2854:		}
;2855:		
;2856:		pm->ps->weaponstate = WEAPON_MELEE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 15
ASGNI4
line 2857
;2857:		pm->ps->weaponTime = 400;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 400
ASGNI4
line 2859
;2858:
;2859:		PM_StartTorsoAnim( TORSO_ATTACK_MELEE ); 
CNSTI4 29
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2861
;2860:
;2861:		pm->ps->pm_flags |= PMF_SHOT_LOCKED; 
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2862
;2862:		return;
ADDRGP4 $936
JUMPV
LABELV $1092
line 2866
;2863:	}
;2864:
;2865:	// check for fire  
;2866:	if (!(pm->cmd.buttons & 1) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1097
line 2868
;2867:
;2868:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2870
;2869:   
;2870:		pm->ps->weaponstate = WEAPON_READY; 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2873
;2871:
;2872:		// remove flag
;2873:		if ( pm->ps->pm_flags & PMF_SHOT_LOCKED )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $936
line 2874
;2874:			pm->ps->pm_flags &= ~PMF_SHOT_LOCKED;		
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2875
;2875:		return;
ADDRGP4 $936
JUMPV
LABELV $1097
line 2879
;2876:	}
;2877:
;2878:	// in water no weapons
;2879:	if ( pm->waterlevel > 2 && !BG_IsMelee( pm->ps->weapon ) && !BG_IsGrenade( pm->ps->weapon ) )
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
LEI4 $1101
ADDRLP4 52
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1101
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1101
line 2880
;2880:	{
line 2881
;2881:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2882
;2882:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2883
;2883:		return;
ADDRGP4 $936
JUMPV
LABELV $1101
line 2887
;2884:	}
;2885:
;2886:	// single shot mode
;2887:	if ( pm->ps->pm_flags & PMF_SHOT_LOCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1103
line 2888
;2888: 		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2889
;2889:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2890
;2890:		return;
ADDRGP4 $936
JUMPV
LABELV $1103
line 2895
;2891:	}
;2892:
;2893:
;2894:	// ss-mode end 
;2895:	if ( pm->ps->weapon <= WP_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1105
line 2896
;2896:		return;
ADDRGP4 $936
JUMPV
LABELV $1105
line 2898
;2897:
;2898:	if ( pm->ps->weapon == WP_C4 && !( pm->ps->pm_flags & PMF_BOMBRANGE) )
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1107
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $1107
line 2899
;2899:		return;
ADDRGP4 $936
JUMPV
LABELV $1107
line 2901
;2900:
;2901:	if ( pm->ps->eFlags & EF_WEAPONS_LOCKED) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1109
line 2902
;2902:		return;
ADDRGP4 $936
JUMPV
LABELV $1109
line 2906
;2903:
;2904:	
;2905:	// start the animation even if out of ammo
;2906:	if ( BG_IsMelee( pm->ps->weapon ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1111
line 2911
;2907:		// we hit anything !!!
;2908:		int anim; 
;2909:		float rnd; 
;2910: 
;2911:		PM_Seed( );
ADDRGP4 PM_Seed
CALLV
pop
line 2913
;2912:
;2913:		rnd = Q_crandom( &pm->ps->stats[STAT_SEED] ); 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 240
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 80
INDIRF4
ASGNF4
line 2915
;2914:
;2915:		if (rnd <= 0.33)
ADDRLP4 72
INDIRF4
CNSTF4 1051260355
GTF4 $1113
line 2916
;2916:		{
line 2917
;2917:			anim = TORSO_ATTACK_MELEE;//TORSO_MEELE_ATTACK1;
ADDRLP4 76
CNSTI4 29
ASGNI4
line 2918
;2918:			pm->ps->weaponstate = WEAPON_FIRING; 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2919
;2919:		}
ADDRGP4 $1114
JUMPV
LABELV $1113
line 2920
;2920:		else if (rnd <= 0.66)
ADDRLP4 72
INDIRF4
CNSTF4 1059648963
GTF4 $1115
line 2921
;2921:		{
line 2922
;2922:			anim = TORSO_ATTACK_MELEE;//TORSO_MEELE_ATTACK2;
ADDRLP4 76
CNSTI4 29
ASGNI4
line 2923
;2923:			pm->ps->weaponstate = WEAPON_FIRING2; 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
line 2924
;2924:		}
ADDRGP4 $1116
JUMPV
LABELV $1115
line 2925
;2925:		else {
line 2926
;2926:			anim = TORSO_ATTACK_MELEE;//TORSO_MEELE_ATTACK3;
ADDRLP4 76
CNSTI4 29
ASGNI4
line 2927
;2927:			pm->ps->weaponstate = WEAPON_FIRING3; 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 5
ASGNI4
line 2928
;2928:		}
LABELV $1116
LABELV $1114
line 2929
;2929:		pm->ps->weaponTime = 380;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 380
ASGNI4
line 2930
;2930:		PM_StartTorsoAnim( anim );
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2931
;2931:		PM_AddEvent( EV_FIRE_WEAPON );  
CNSTI4 29
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2932
;2932:		pm->ps->pm_flags |= PMF_SHOT_LOCKED;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2933
;2933:		return;		
ADDRGP4 $936
JUMPV
LABELV $1111
line 2937
;2934:	}
;2935:  
;2936:	// Set correct animation
;2937:	if ( pm->ps->powerups[PW_BRIEFCASE] )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1117
line 2938
;2938:	   PM_StartTorsoAnim( TORSO_ATTACK_SUITCASE );
CNSTI4 27
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $1118
JUMPV
LABELV $1117
line 2939
;2939:	else if ( ( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM2X ) ) ||
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 72
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $1121
ADDRLP4 76
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $1119
ADDRLP4 72
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $1119
LABELV $1121
line 2943
;2940:		 ( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM4X ) ) &&
;2941:		 ( BG_IsRifle( pm->ps->weapon ) )
;2942:		   )
;2943:	   PM_StartTorsoAnim( TORSO_ATTACK_RIFLE_SCOPED );
CNSTI4 23
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $1120
JUMPV
LABELV $1119
line 2945
;2944:	else if ( 
;2945:		( pm->ps->weapon == WP_M4 || pm->ps->weapon == WP_AK47 ||
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 16
EQI4 $1126
ADDRLP4 88
INDIRI4
CNSTI4 15
EQI4 $1126
ADDRLP4 88
INDIRI4
CNSTI4 14
EQI4 $1126
ADDRLP4 88
INDIRI4
CNSTI4 22
NEI4 $1122
LABELV $1126
ADDRLP4 92
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 96
INDIRI4
EQI4 $1127
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
GTI4 $1122
LABELV $1127
line 2949
;2946:			pm->ps->weapon == WP_MP5 || pm->ps->weapon == WP_M14 ) &&
;2947:		 !(pm->cmd.buttons & BUTTON_SPRINT && pm->ps->stats[STAT_STAMINA] > 0 )
;2948:		)
;2949:		PM_StartTorsoAnim( TORSO_ATTACK_RIFLE_SCOPED );
CNSTI4 23
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $1123
JUMPV
LABELV $1122
line 2950
;2950:	else if ( BG_IsPistol( pm->ps->weapon ) || pm->ps->weapon == WP_PDW || pm->ps->weapon == WP_MAC10 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_IsPistol
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $1131
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 12
EQI4 $1131
ADDRLP4 104
INDIRI4
CNSTI4 13
NEI4 $1128
LABELV $1131
line 2951
;2951:		PM_StartTorsoAnim( TORSO_ATTACK_PISTOL ); 
CNSTI4 25
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $1129
JUMPV
LABELV $1128
line 2952
;2952:	else if ( BG_IsRifle( pm->ps->weapon ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $1132
line 2953
;2953:		PM_StartTorsoAnim( TORSO_ATTACK_RIFLE );
CNSTI4 21
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
ADDRGP4 $1133
JUMPV
LABELV $1132
line 2954
;2954:	else if ( pm->ps->weapon == WP_C4 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1134
line 2955
;2955:		PM_StartTorsoAnim( TORSO_USE );		
CNSTI4 31
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2956
;2956:		pm->ps->weaponTime = 4120;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 4120
ASGNI4
line 2957
;2957:		pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2958
;2958:		return;
ADDRGP4 $936
JUMPV
LABELV $1134
line 2959
;2959:	} else if ( pm->ps->weapon == WP_GRENADE || pm->ps->weapon == WP_FLASHBANG 
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 4
EQI4 $1139
ADDRLP4 112
INDIRI4
CNSTI4 5
EQI4 $1139
ADDRLP4 112
INDIRI4
CNSTI4 25
NEI4 $1136
LABELV $1139
line 2960
;2960:		|| pm->ps->weapon == WP_SMOKE ) {
line 2961
;2961:		int at = AM_GRENADES;
ADDRLP4 116
CNSTI4 10
ASGNI4
line 2963
;2962:
;2963:		if ( pm->ps->weapon == WP_FLASHBANG )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1140
line 2964
;2964:			at = AM_FLASHBANGS;		
ADDRLP4 116
CNSTI4 11
ASGNI4
ADDRGP4 $1141
JUMPV
LABELV $1140
line 2965
;2965:		else if ( pm->ps->weapon == WP_SMOKE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 25
NEI4 $1142
line 2966
;2966:			at = AM_SMOKE;
ADDRLP4 116
CNSTI4 12
ASGNI4
LABELV $1142
LABELV $1141
line 2968
;2967:
;2968:		if ( pm->ps->ammo[at] <= 0 )
ADDRLP4 116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1144
line 2969
;2969:			return;
ADDRGP4 $936
JUMPV
LABELV $1144
line 2971
;2970:
;2971:		pm->ps->weaponTime = 480;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 480
ASGNI4
line 2972
;2972:		pm->ps->weaponstate = WEAPON_FIRING; // go to pin pull
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2973
;2973:  		return;
ADDRGP4 $936
JUMPV
LABELV $1136
line 2976
;2974:	}
;2975:	else
;2976:		PM_StartTorsoAnim( TORSO_ATTACK_RIFLE );
CNSTI4 21
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
LABELV $1133
LABELV $1129
LABELV $1123
LABELV $1120
LABELV $1118
line 2979
;2977:
;2978:	// check for out of ammo
;2979:	if ( pm->ps->stats[STAT_ROUNDS] <= 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1146
line 2980
;2980:		PM_AddEvent( EV_NOAMMO );
CNSTI4 27
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2981
;2981:		pm->ps->weaponTime = 150;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 150
ASGNI4
line 2983
;2982:		// jump to idle , since we haven't got a fire empty
;2983:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2984
;2984:		return;
ADDRGP4 $936
JUMPV
LABELV $1146
line 2988
;2985:	} 	// fire weapon normally
;2986:	
;2987:	// last round case :
;2988:	if ( pm->ps->stats[STAT_ROUNDS] == 1 && ( pm->ps->weapon == WP_P9S || pm->ps->weapon == WP_SW40T || pm->ps->weapon == WP_MK23 || pm->ps->weapon == WP_GLOCK || pm->ps->weapon == WP_MP5 || pm->ps->weapon == WP_DEAGLE ) )
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1148
ADDRLP4 120
ADDRLP4 116
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 9
EQI4 $1154
ADDRLP4 120
INDIRI4
CNSTI4 8
EQI4 $1154
ADDRLP4 120
INDIRI4
CNSTI4 6
EQI4 $1154
ADDRLP4 120
INDIRI4
CNSTI4 7
EQI4 $1154
ADDRLP4 120
INDIRI4
CNSTI4 14
EQI4 $1154
ADDRLP4 120
INDIRI4
CNSTI4 10
NEI4 $1148
LABELV $1154
line 2989
;2989:		pm->ps->weaponstate = WEAPON_LASTRND; // go to lastrnd
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 11
ASGNI4
ADDRGP4 $1149
JUMPV
LABELV $1148
line 2991
;2990:	else
;2991:		pm->ps->weaponstate = WEAPON_FIRING; // fire normally
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
LABELV $1149
line 2993
;2992: 
;2993:	pm->ps->weaponTime = PM_GetWeaponTime(pm->ps->weapon );  
ADDRLP4 124
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 PM_GetWeaponTime
CALLI4
ASGNI4
ADDRLP4 124
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 2996
;2994: 
;2995:		// fire grenadelauncher time
;2996:	if ( BG_IsInGLMode( pm->ps->stats[STAT_WEAPONMODE] ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 BG_IsInGLMode
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $1155
line 2997
;2997:	{
line 2998
;2998:		pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2999
;2999:		pm->ps->weaponTime = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 250
ASGNI4
line 3001
;3000:
;3001:		PM_AddEvent( EV_FIRE_WEAPON_OTHER ); 
CNSTI4 30
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3002
;3002:		return;
ADDRGP4 $936
JUMPV
LABELV $1155
line 3005
;3003:	} 
;3004:
;3005:	PM_Seed( );
ADDRGP4 PM_Seed
CALLV
pop
line 3006
;3006: 	PM_AddEvent( EV_FIRE_WEAPON ); 
CNSTI4 29
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3009
;3007:
;3008://	Com_Printf("animation set\n");
;3009:	if ( pm->ps->weapon == WP_MAC10 ||
ADDRLP4 136
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 13
EQI4 $1166
ADDRLP4 136
INDIRI4
CNSTI4 23
EQI4 $1166
ADDRLP4 136
INDIRI4
CNSTI4 22
EQI4 $1166
ADDRLP4 136
INDIRI4
CNSTI4 16
EQI4 $1166
ADDRLP4 136
INDIRI4
CNSTI4 12
EQI4 $1166
ADDRLP4 136
INDIRI4
CNSTI4 24
EQI4 $1166
ADDRLP4 136
INDIRI4
CNSTI4 17
EQI4 $1166
ADDRLP4 136
INDIRI4
CNSTI4 21
EQI4 $1166
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 BG_IsPistol
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1157
LABELV $1166
line 3015
;3010:		pm->ps->weapon == WP_M249 || pm->ps->weapon == WP_M14 || pm->ps->weapon == WP_M4 || pm->ps->weapon == WP_PDW || 
;3011:#ifdef SL8SD
;3012:		pm->ps->weapon == WP_SL8SD ||
;3013:#endif	
;3014:		pm->ps->weapon == WP_PSG1 || pm->ps->weapon == WP_SPAS15 || BG_IsPistol( pm->ps->weapon ) )
;3015:	{ 
line 3016
;3016:		 float rnd = Q_crandom( &pm->ps->stats[STAT_SEED] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 240
ADDP4
ARGP4
ADDRLP4 148
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 148
INDIRF4
ASGNF4
line 3018
;3017:
;3018:		if (rnd <= 0.33)
ADDRLP4 144
INDIRF4
CNSTF4 1051260355
GTF4 $1167
line 3019
;3019:			pm->ps->weaponstate = WEAPON_FIRING; 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
ADDRGP4 $1168
JUMPV
LABELV $1167
line 3020
;3020:		else if ( (rnd <= 0.66 || BG_IsPistol( pm->ps->weapon ) ) && ( pm->ps->weapon != WP_PSG1 && pm->ps->weapon != WP_SL8SD ) )
ADDRLP4 144
INDIRF4
CNSTF4 1059648963
LEF4 $1171
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BG_IsPistol
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1169
LABELV $1171
ADDRLP4 156
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 17
EQI4 $1169
ADDRLP4 156
INDIRI4
CNSTI4 24
EQI4 $1169
line 3021
;3021:			pm->ps->weaponstate = WEAPON_FIRING2; 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 $1170
JUMPV
LABELV $1169
line 3023
;3022:		else  
;3023:			pm->ps->weaponstate = WEAPON_FIRING3; 		
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 5
ASGNI4
LABELV $1170
LABELV $1168
line 3024
;3024:	}  
LABELV $1157
line 3029
;3025:
;3026:	// now lock our weapon to semimode.
;3027:	//
;3028:	// MUST BE SAME AS IN G_SEALS.C ; NS_BackupWeaponAim
;3029:	if ( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_SINGLE ) || BG_IsSemiAutomatic( pm->ps->weapon ) )
ADDRLP4 144
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $1174
ADDRLP4 144
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BG_IsSemiAutomatic
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1172
LABELV $1174
line 3030
;3030:		pm->ps->pm_flags |= PMF_SHOT_LOCKED;
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $1172
line 3032
;3031:	// Navy Seals --
;3032:}
LABELV $936
endproc PM_Weapon 160 8
proc PM_DropTimers 4 0
line 3092
;3033:#if 0
;3034:/*
;3035:================
;3036:PM_Animate
;3037:================
;3038:*/
;3039:
;3040:static void PM_Animate( void ) {
;3041:	// Navy Seals ++
;3042:	/*
;3043:	if ( pm->cmd.buttons & BUTTON_GESTURE ) {
;3044:		if ( pm->ps->torsoTimer == 0 ) {
;3045:			PM_StartTorsoAnim( TORSO_GESTURE );
;3046:			pm->ps->torsoTimer = TIMER_GESTURE;
;3047:			PM_AddEvent( EV_TAUNT );
;3048:		}
;3049:#ifdef MISSIONPACK
;3050:	} else if ( pm->cmd.buttons & BUTTON_GETFLAG ) {
;3051:		if ( pm->ps->torsoTimer == 0 ) {
;3052:			PM_StartTorsoAnim( TORSO_GETFLAG );
;3053:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3054:		}
;3055:	} else if ( pm->cmd.buttons & BUTTON_GUARDBASE ) {
;3056:		if ( pm->ps->torsoTimer == 0 ) {
;3057:			PM_StartTorsoAnim( TORSO_GUARDBASE );
;3058:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3059:		}
;3060:	} else if ( pm->cmd.buttons & BUTTON_PATROL ) {
;3061:		if ( pm->ps->torsoTimer == 0 ) {
;3062:			PM_StartTorsoAnim( TORSO_PATROL );
;3063:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3064:		}
;3065:	} else if ( pm->cmd.buttons & BUTTON_FOLLOWME ) {
;3066:		if ( pm->ps->torsoTimer == 0 ) {
;3067:			PM_StartTorsoAnim( TORSO_FOLLOWME );
;3068:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3069:		}
;3070:	} else if ( pm->cmd.buttons & BUTTON_AFFIRMATIVE ) {
;3071:		if ( pm->ps->torsoTimer == 0 ) {
;3072:			PM_StartTorsoAnim( TORSO_AFFIRMATIVE);
;3073:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3074:		}
;3075:	} else if ( pm->cmd.buttons & BUTTON_NEGATIVE ) {
;3076:		if ( pm->ps->torsoTimer == 0 ) {
;3077:			PM_StartTorsoAnim( TORSO_NEGATIVE );
;3078:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;3079:		}
;3080:#endif
;3081:	}*/
;3082:	// Navy Seals --
;3083:}
;3084:
;3085:#endif
;3086:
;3087:/*
;3088:================
;3089:PM_DropTimers
;3090:================
;3091:*/
;3092:static void PM_DropTimers( void ) {
line 3094
;3093:	// drop misc timing counter
;3094:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1176
line 3095
;3095:		if ( pml.msec >= pm->ps->pm_time ) {
ADDRGP4 pml+40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $1178
line 3096
;3096:			pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 3097
;3097:			pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 3098
;3098:		} else {
ADDRGP4 $1179
JUMPV
LABELV $1178
line 3099
;3099:			pm->ps->pm_time -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 3100
;3100:		}
LABELV $1179
line 3101
;3101:	}
LABELV $1176
line 3104
;3102:
;3103:	// drop animation counter
;3104:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1182
line 3105
;3105:		pm->ps->legsTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 3106
;3106:		if ( pm->ps->legsTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1185
line 3107
;3107:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3108
;3108:		}
LABELV $1185
line 3109
;3109:	}
LABELV $1182
line 3111
;3110:
;3111:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1187
line 3112
;3112:		pm->ps->torsoTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 3113
;3113:		if ( pm->ps->torsoTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1190
line 3114
;3114:			pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 0
ASGNI4
line 3115
;3115:		}
LABELV $1190
line 3116
;3116:	}
LABELV $1187
line 3117
;3117:}
LABELV $1175
endproc PM_DropTimers 4 0
export PM_UpdateViewAngles
proc PM_UpdateViewAngles 32 0
line 3127
;3118:
;3119:/*
;3120:================
;3121:PM_UpdateViewAngles
;3122:
;3123:This can be used as another entry point when only the viewangles
;3124:are being updated isntead of a full move
;3125:================
;3126:*/
;3127:void PM_UpdateViewAngles( playerState_t *ps, const usercmd_t *cmd ) {
line 3131
;3128:	short		temp;
;3129:	int		i;
;3130:
;3131:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
EQI4 $1195
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $1193
LABELV $1195
line 3132
;3132:		return;		// no view changes at all
ADDRGP4 $1192
JUMPV
LABELV $1193
line 3134
;3133:	}
;3134:	if (ps->pm_type == PM_SPECTATOR  && ( ps->eFlags & EF_TELEPORT_BIT)  ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1196
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1196
line 3135
;3135:		return;
ADDRGP4 $1192
JUMPV
LABELV $1196
line 3137
;3136:	}
;3137:	if ( ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1198
ADDRLP4 20
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1198
line 3138
;3138:		return;		// no view changes at all
ADDRGP4 $1192
JUMPV
LABELV $1198
line 3142
;3139:	}
;3140:  
;3141:	// circularly clamp the angles with deltas
;3142:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1200
line 3143
;3143:		temp = cmd->angles[i] + ps->delta_angles[i];
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 3144
;3144:		if ( i == PITCH ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1204
line 3146
;3145:			// don't let the player look up or down more than 90 degrees
;3146:			if ( temp > 16000 ) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $1206
line 3147
;3147:				ps->delta_angles[i] = 16000 - cmd->angles[i];
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 16000
ADDRLP4 28
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3148
;3148:				temp = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 3149
;3149:			} else if ( temp < -16000 ) {
ADDRGP4 $1207
JUMPV
LABELV $1206
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $1208
line 3150
;3150:				ps->delta_angles[i] = -16000 - cmd->angles[i];
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 -16000
ADDRLP4 28
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 3151
;3151:				temp = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 3152
;3152:			}
LABELV $1208
LABELV $1207
line 3153
;3153:		}
LABELV $1204
line 3154
;3154:		ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDP4
CNSTF4 1001652224
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
MULF4
ASGNF4
line 3155
;3155:	}
LABELV $1201
line 3142
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1200
line 3157
;3156:
;3157:}
LABELV $1192
endproc PM_UpdateViewAngles 32 0
export PmoveSingle
proc PmoveSingle 152 16
line 3211
;3158:#if 0
;3159:/*
;3160:===================
;3161:PM_FlyMove
;3162:
;3163:Only with the flight powerup
;3164:===================
;3165:*/
;3166:static void PM_FlyMove( void ) {
;3167:	int		i;
;3168:	vec3_t	wishvel;
;3169:	float	wishspeed;
;3170:	vec3_t	wishdir;
;3171:	float	scale;
;3172:
;3173:	// normal slowdown
;3174:	PM_Friction ();
;3175:
;3176:	scale = PM_CmdScale( &pm->cmd );
;3177:	//
;3178:	// user intentions
;3179:	//
;3180:	if ( !scale ) {
;3181:		wishvel[0] = 0;
;3182:		wishvel[1] = 0;
;3183:		wishvel[2] = 0;
;3184:	} else {
;3185:		for (i=0 ; i<3 ; i++) {
;3186:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
;3187:		}
;3188:
;3189:		wishvel[2] += scale * pm->cmd.upmove;
;3190:	}
;3191:
;3192:	VectorCopy (wishvel, wishdir);
;3193:	wishspeed = VectorNormalize(wishdir);
;3194:
;3195:	PM_Accelerate (wishdir, wishspeed, pm_flyaccelerate);
;3196:
;3197:	PM_StepSlideMove( qfalse );
;3198:}
;3199:#endif
;3200:
;3201:/*
;3202:================
;3203:PmoveSingle
;3204:
;3205:================
;3206:*/
;3207:void trap_SnapVector( float *v );
;3208:
;3209:
;3210:
;3211:void PmoveSingle (pmove_t *pmove) {
line 3213
;3212:
;3213:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 3217
;3214:
;3215:	// this counter lets us debug movement problems with a journal
;3216:	// by setting a conditional breakpoint fot the previous frame
;3217:	c_pmove++;
ADDRLP4 0
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3220
;3218:
;3219:	// clear results
;3220:	pm->numtouch = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3221
;3221:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 3222
;3222:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 0
ASGNI4
line 3224
;3223:
;3224:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1211
line 3225
;3225:		pm->tracemask &= ~CONTENTS_BODY;	// corpses can fly through bodies
ADDRLP4 4
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 3226
;3226:	}
LABELV $1211
line 3230
;3227:
;3228:	// make sure walking button is clear if they are running, to avoid
;3229:	// proxy no-footsteps cheats
;3230:	if ( abs( pm->cmd.forwardmove ) > 64 || abs( pm->cmd.rightmove ) > 64 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
GTI4 $1215
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LEI4 $1213
LABELV $1215
line 3231
;3231:		pm->cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 3232
;3232:	} 
LABELV $1213
line 3235
;3233:
;3234:	// set the talk balloon flag
;3235:	if ( pm->cmd.buttons & BUTTON_TALK ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1216
line 3236
;3236:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 3237
;3237:	} else {
ADDRGP4 $1217
JUMPV
LABELV $1216
line 3238
;3238:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 3239
;3239:	}
LABELV $1217
line 3244
;3240:
;3241:
;3242:
;3243:	// set the firing flag for continuous beam weapons
;3244:	if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $1218
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1218
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $1218
line 3245
;3245:		&& ( pm->cmd.buttons & BUTTON_ATTACK )   ) {
line 3246
;3246:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 3247
;3247:	} else {
ADDRGP4 $1219
JUMPV
LABELV $1218
line 3248
;3248:		pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 3249
;3249:	}
LABELV $1219
line 3252
;3250:
;3251:
;3252:	if ( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 ) && ( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_FLASHLIGHT ) ) && 
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $1220
ADDRLP4 28
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $1220
ADDRLP4 36
ADDRLP4 24
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1224
ADDRLP4 36
INDIRI4
CNSTI4 3
EQI4 $1224
ADDRLP4 36
INDIRI4
CNSTI4 4
EQI4 $1224
ADDRLP4 36
INDIRI4
CNSTI4 5
NEI4 $1220
LABELV $1224
line 3254
;3253:		(pm->ps->weaponstate == WEAPON_READY || pm->ps->weaponstate == WEAPON_FIRING || pm->ps->weaponstate == WEAPON_FIRING2 || pm->ps->weaponstate == WEAPON_FIRING3 ) )
;3254:		pm->ps->eFlags |= EF_WEAPONMODE3;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
ADDRGP4 $1221
JUMPV
LABELV $1220
line 3256
;3255:	else
;3256:		pm->ps->eFlags &=~ EF_WEAPONMODE3;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 -131073
BANDI4
ASGNI4
LABELV $1221
line 3258
;3257:
;3258:	if ( pm->cmd.buttons & BUTTON_IRONSIGHT &&
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 52
INDIRI4
EQI4 $1225
ADDRLP4 56
ADDRLP4 48
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 52
INDIRI4
NEI4 $1225
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 2
EQI4 $1225
ADDRLP4 60
INDIRI4
CNSTI4 1
EQI4 $1225
ADDRLP4 60
INDIRI4
CNSTI4 7
EQI4 $1225
ADDRLP4 60
INDIRI4
CNSTI4 10
EQI4 $1225
line 3264
;3259:		!(pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_WEAPONMODE2 )) &&
;3260:		!(pm->ps->weaponstate == WEAPON_DROPPING) &&
;3261:		!(pm->ps->weaponstate == WEAPON_RAISING) &&
;3262:		!(pm->ps->weaponstate == WEAPON_RELOADING || pm->ps->weaponstate == WEAPON_RELOADING_EMPTY)
;3263:		)
;3264:		pm->ps->eFlags |= EF_IRONSIGHT; 
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 262144
BORI4
ASGNI4
ADDRGP4 $1226
JUMPV
LABELV $1225
line 3266
;3265:	else
;3266:		pm->ps->eFlags &= ~EF_IRONSIGHT;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -262145
BANDI4
ASGNI4
LABELV $1226
line 3269
;3267:
;3268:	// Navy Seals ++ : Silenced weapon?
;3269:	if ( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_SILENCER ) ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1227
line 3270
;3270:		pm->ps->eFlags |= EF_SILENCED;
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
ADDRGP4 $1228
JUMPV
LABELV $1227
line 3272
;3271:	else
;3272:		pm->ps->eFlags &= ~EF_SILENCED;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
LABELV $1228
line 3274
;3273:
;3274:	if ( pm->ps->stats[STAT_WEAPONMODE] & ( 1 << WM_LACTIVE )  && (pm->ps->weaponstate == WEAPON_READY || pm->ps->weaponstate == WEAPON_FIRING ) ) 	
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $1229
ADDRLP4 88
ADDRLP4 80
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $1231
ADDRLP4 88
INDIRI4
CNSTI4 3
NEI4 $1229
LABELV $1231
line 3275
;3275:		pm->ps->eFlags |= EF_LASERSIGHT; 
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
ADDRGP4 $1230
JUMPV
LABELV $1229
line 3277
;3276: 	else
;3277:		pm->ps->eFlags &= ~EF_LASERSIGHT;
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
LABELV $1230
line 3281
;3278:
;3279:
;3280:	// clear the respawned flag if attack and use are cleared
;3281:	if ( pm->ps->stats[STAT_HEALTH] > 0 && 
ADDRLP4 100
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 100
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
LEI4 $1232
ADDRLP4 100
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 104
INDIRI4
NEI4 $1232
line 3282
;3282:		!( pm->cmd.buttons & (BUTTON_ATTACK  ) ) ) {
line 3283
;3283:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 3284
;3284:	}
LABELV $1232
line 3289
;3285:
;3286:	// if talk button is down, dissallow all other input
;3287:	// this is to prevent any possible intercept proxy from
;3288:	// adding fake talk balloons
;3289:	if ( pmove->cmd.buttons & BUTTON_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1234
line 3292
;3290:		// keep the talk button set tho for when the cmd.serverTime > 66 msec
;3291:		// and the same cmd is used multiple times in Pmove
;3292:		pmove->cmd.buttons = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 2
ASGNI4
line 3293
;3293:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 3294
;3294:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 3295
;3295:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 3296
;3296:	}
LABELV $1234
line 3299
;3297:
;3298:	// clear all pmove local vars
;3299:	memset (&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3302
;3300:
;3301:	// determine the time
;3302:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
ADDRGP4 pml+40
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 3303
;3303:	if ( pml.msec < 1 ) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $1237
line 3304
;3304:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 3305
;3305:	} else if ( pml.msec > 200 ) {
ADDRGP4 $1238
JUMPV
LABELV $1237
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $1241
line 3306
;3306:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 3307
;3307:	}
LABELV $1241
LABELV $1238
line 3308
;3308:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3312
;3309:
;3310:
;3311:	// save old org for crashlanding
;3312:	if (pml.groundTrace.fraction < 1.0) {
ADDRGP4 pml+52+8
INDIRF4
CNSTF4 1065353216
GEF4 $1245
line 3313
;3313:		VectorCopy (pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3314
;3314:	}
LABELV $1245
line 3317
;3315:
;3316:	// save old velocity for crashlanding
;3317:	VectorCopy (pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 3319
;3318:
;3319:	pml.frametime = pml.msec * 0.001;
ADDRGP4 pml+36
CNSTF4 981668463
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3322
;3320:
;3321:	// update the viewangles
;3322:	PM_UpdateViewAngles( pm->ps, &pm->cmd );
ADDRLP4 108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 3324
;3323:
;3324:	AngleVectors (pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3326
;3325:
;3326:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $1255
line 3328
;3327:		// not holding jump
;3328:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 3329
;3329:	}
LABELV $1255
line 3332
;3330:
;3331:	// decide if backpedaling animations should be used
;3332:	if ( pm->cmd.forwardmove < 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1257
line 3333
;3333:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 3334
;3334:	} else if ( pm->cmd.forwardmove > 0 || ( pm->cmd.forwardmove == 0 && pm->cmd.rightmove ) ) {
ADDRGP4 $1258
JUMPV
LABELV $1257
ADDRLP4 112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 116
ADDRLP4 112
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 116
INDIRI4
ADDRLP4 120
INDIRI4
GTI4 $1261
ADDRLP4 116
INDIRI4
ADDRLP4 120
INDIRI4
NEI4 $1259
ADDRLP4 112
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 120
INDIRI4
EQI4 $1259
LABELV $1261
line 3335
;3335:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
ADDRLP4 124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 3336
;3336:	}
LABELV $1259
LABELV $1258
line 3339
;3337:  
;3338:
;3339:	if ( pm->ps->pm_type == PM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1262
line 3344
;3340://		G_Printf("handling spectator.\n");
;3341://		if ( pm->ps->eFlags & EF_TELEPORT_BIT )
;3342://			return;
;3343:
;3344:		PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 3345
;3345:		PM_NoclipMove();//
ADDRGP4 PM_NoclipMove
CALLV
pop
line 3347
;3346:// 		PM_FlyMove ();
;3347:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 3348
;3348:		return;
ADDRGP4 $1210
JUMPV
LABELV $1262
line 3351
;3349:	}
;3350:
;3351:	if ( pm->ps->pm_type == PM_NOCLIP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1264
line 3352
;3352:		PM_NoclipMove();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 3353
;3353:	 	PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 3354
;3354:		PM_NoclipMove();//
ADDRGP4 PM_NoclipMove
CALLV
pop
line 3356
;3355:// 		PM_FlyMove ();
;3356:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 3357
;3357:		return;
ADDRGP4 $1210
JUMPV
LABELV $1264
line 3362
;3358:	}
;3359:
;3360:	// defusing 
;3361:
;3362:	if ( pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 5
EQI4 $1268
ADDRLP4 124
INDIRI4
CNSTI4 6
NEI4 $1266
LABELV $1268
line 3363
;3363:		return;		// no movement at all
ADDRGP4 $1210
JUMPV
LABELV $1266
line 3367
;3364:	}
;3365:
;3366:	// set watertype, and waterlevel
;3367:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 3368
;3368:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+136
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 3371
;3369:
;3370:	// set mins, maxs, and viewheight
;3371:	PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 3374
;3372:
;3373:	// set groundentity
;3374:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 3376
;3375:
;3376:	if ( pm->ps->pm_type == PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1270
line 3377
;3377:		pm->cmd.upmove = pm->cmd.rightmove = pm->cmd.forwardmove = 0;
ADDRLP4 128
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 132
CNSTI1 0
ASGNI1
ADDRLP4 128
INDIRP4
CNSTI4 25
ADDP4
ADDRLP4 132
INDIRI1
ASGNI1
ADDRLP4 128
INDIRP4
CNSTI4 26
ADDP4
ADDRLP4 132
INDIRI1
ASGNI1
ADDRLP4 128
INDIRP4
CNSTI4 27
ADDP4
ADDRLP4 132
INDIRI1
ASGNI1
line 3378
;3378:		PM_DeadMove ();
ADDRGP4 PM_DeadMove
CALLV
pop
line 3380
;3379://		return;
;3380:	}
LABELV $1270
line 3382
;3381:
;3382:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 3384
;3383:  
;3384:	if ( NS_OnLadder() == 0 )
ADDRLP4 128
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $1272
line 3385
;3385:		pm->ps->pm_flags &= ~PMF_CLIMB;
ADDRLP4 132
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
LABELV $1272
line 3387
;3386:
;3387:	if ( pm->ps->pm_flags & PMF_BOMBCASE || pm->ps->pm_type == PM_FREEZE ) {
ADDRLP4 136
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $1276
ADDRLP4 140
CNSTI4 4
ASGNI4
ADDRLP4 136
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $1274
LABELV $1276
line 3389
;3388:		// no movement
;3389:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 3390
;3390:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 3391
;3391:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 3393
;3392:
;3393:		if ( pm->ps->pm_type == PM_FREEZE )
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
NEI4 $1275
line 3394
;3394:		{
line 3395
;3395:			pm->ps->torsoAnim = TORSO_STAND_RIFLE_SCOPED;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 22
ASGNI4
line 3396
;3396:			pm->ps->legsAnim = LEGS_IDLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 43
ASGNI4
line 3397
;3397:		}
line 3398
;3398:	}/* else if (pm->ps->pm_flags & PMF_GRAPPLE_PULL) 
ADDRGP4 $1275
JUMPV
LABELV $1274
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1279
line 3403
;3399:	 {		PM_GrappleMove();
;3400:		// We can wiggle a bit
;3401:		PM_AirMove();
;3402:	}*/  else if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
;3403:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 3404
;3404:	} else if ( NS_OnLadder () != 0) {
ADDRGP4 $1280
JUMPV
LABELV $1279
ADDRLP4 144
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1281
line 3405
;3405:		PM_LadderMove();
ADDRGP4 PM_LadderMove
CALLV
pop
line 3406
;3406:		pm->ps->pm_flags |= PMF_CLIMB;
ADDRLP4 148
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 3407
;3407:	} else if ( pm->waterlevel > 1 ) {
ADDRGP4 $1282
JUMPV
LABELV $1281
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1283
line 3409
;3408:		// swimming
;3409:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 3410
;3410:	} else if ( pml.walking ) {
ADDRGP4 $1284
JUMPV
LABELV $1283
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $1285
line 3412
;3411:		// walking on ground
;3412:		PM_WalkMove();
ADDRGP4 PM_WalkMove
CALLV
pop
line 3413
;3413:	} else {
ADDRGP4 $1286
JUMPV
LABELV $1285
line 3415
;3414:		// airborne
;3415:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 3416
;3416:	} 
LABELV $1286
LABELV $1284
LABELV $1282
LABELV $1280
LABELV $1275
line 3421
;3417: 
;3418://	PM_Animate();
;3419:
;3420:	// set groundentity, watertype, and waterlevel
;3421:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 3422
;3422:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 3425
;3423:
;3424:	// weapons
;3425:	if ( NS_OnLadder () == 0 )
ADDRLP4 148
ADDRGP4 NS_OnLadder
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1288
line 3426
;3426:		PM_Weapon();
ADDRGP4 PM_Weapon
CALLV
pop
LABELV $1288
line 3429
;3427:
;3428:	// torso animation
;3429:	PM_TorsoAnimation();
ADDRGP4 PM_TorsoAnimation
CALLV
pop
line 3432
;3430:
;3431:	// footstep events / legs animations
;3432:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 3435
;3433:
;3434:	// entering / leaving water splashes
;3435:	PM_WaterEvents();
ADDRGP4 PM_WaterEvents
CALLV
pop
line 3438
;3436:
;3437:	// snap some parts of playerstate to save network bandwidth
;3438:	trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 3439
;3439:}
LABELV $1210
endproc PmoveSingle 152 16
export Pmove
proc Pmove 20 4
line 3449
;3440:
;3441:
;3442:/*
;3443:================
;3444:Pmove
;3445:
;3446:Can be called by either the server or the client
;3447:================
;3448:*/
;3449:void Pmove (pmove_t *pmove) {
line 3452
;3450:	int			finalTime;
;3451:
;3452:	finalTime = pmove->cmd.serverTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3454
;3453:
;3454:	if ( finalTime < pmove->ps->commandTime ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
GEI4 $1291
line 3455
;3455:		return;	// should not happen
ADDRGP4 $1290
JUMPV
LABELV $1291
line 3458
;3456:	}
;3457:
;3458:	if ( finalTime > pmove->ps->commandTime + 1000 ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $1293
line 3459
;3459:		pmove->ps->commandTime = finalTime - 1000;
ADDRFP4 0
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 3460
;3460:	}
LABELV $1293
line 3462
;3461:
;3462:	pmove->ps->pmove_framecount = (pmove->ps->pmove_framecount+1) & ((1<<PS_PMOVEFRAMECOUNTBITS)-1);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 456
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 63
BANDI4
ASGNI4
ADDRGP4 $1296
JUMPV
LABELV $1295
line 3466
;3463:
;3464:	// chop the move up if it is too long, to prevent framerate
;3465:	// dependent behavior
;3466:	while ( pmove->ps->commandTime != finalTime ) {
line 3469
;3467:		int		msec;
;3468:
;3469:		msec = finalTime - pmove->ps->commandTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 3471
;3470:
;3471:		if ( pmove->pmove_fixed ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1298
line 3472
;3472:			if ( msec > pmove->pmove_msec ) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
LEI4 $1299
line 3473
;3473:				msec = pmove->pmove_msec;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 3474
;3474:			}
line 3475
;3475:		}
ADDRGP4 $1299
JUMPV
LABELV $1298
line 3476
;3476:		else {
line 3477
;3477:			if ( msec > 66 ) {
ADDRLP4 8
INDIRI4
CNSTI4 66
LEI4 $1302
line 3478
;3478:				msec = 66;
ADDRLP4 8
CNSTI4 66
ASGNI4
line 3479
;3479:			}
LABELV $1302
line 3480
;3480:		}
LABELV $1299
line 3481
;3481:		pmove->cmd.serverTime = pmove->ps->commandTime + msec;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 3482
;3482:		PmoveSingle( pmove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PmoveSingle
CALLV
pop
line 3485
;3483:	 
;3484:
;3485:		if ( pmove->ps->pm_flags & PMF_JUMP_HELD &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1304
ADDRLP4 16
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 25
LTI4 $1304
line 3486
;3486:			pmove->ps->stats[STAT_STAMINA] >= 25 ) {
line 3487
;3487:			pmove->cmd.upmove = 20;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 20
ASGNI1
line 3488
;3488:		}
LABELV $1304
line 3489
;3489:	}
LABELV $1296
line 3466
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1295
line 3493
;3490:
;3491:	//PM_CheckStuck();
;3492:
;3493:}
LABELV $1290
endproc Pmove 20 4
import trap_SnapVector
import BG_GetMaxRoundForWeapon
bss
export pm_lastsprint
align 4
LABELV pm_lastsprint
skip 256
export pm_previous_origin
align 4
LABELV pm_previous_origin
skip 768
import PM_StepSlideMove
import PM_SlideMove
export pml
align 4
LABELV pml
skip 140
export pm
align 4
LABELV pm
skip 4
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
LABELV $617
byte 1 37
byte 1 105
byte 1 58
byte 1 76
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $606
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $580
byte 1 37
byte 1 105
byte 1 58
byte 1 108
byte 1 105
byte 1 102
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $553
byte 1 37
byte 1 105
byte 1 58
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $533
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
