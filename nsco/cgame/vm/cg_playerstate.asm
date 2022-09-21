export CG_DamageFeedback
code
proc CG_DamageFeedback 72 16
file "../cg_playerstate.c"
line 82
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_playerstate.c -- this file acts on changes in a new playerState_t
;4:// With normal play, this will be done after local prediction, but when
;5:// following another player or playing back a demo, it will be checked
;6:// when the snapshot transitions like all the other entities
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
;17:
;18:#if 0
;19:
;20:// defcon-X:  I decided to leave this in, might be ofuse sometime later
;21:
;22:/*
;23:==============
;24:CG_CheckAmmo
;25:
;26:If the ammo has gone low enough to generate the warning, play a sound
;27:==============
;28:*/
;29:void CG_CheckAmmo( void ) {
;30://	int		i;
;31://	int		total;
;32://	int		previous;
;33://	int		weapons;
;34:
;35:	// see about how many seconds of ammo we have remaining
;36:	weapons = cg.snap->ps.stats[ STAT_WEAPONS ];
;37:	total = 0;
;38:	for ( i = WP_MACHINEGUN ; i < WP_NUM_WEAPONS ; i++ ) {
;39:		if ( ! ( weapons & ( 1 << i ) ) ) {
;40:			continue;
;41:		}
;42:		switch ( i ) {
;43:		case WP_ROCKET_LAUNCHER:
;44:		case WP_GRENADE_LAUNCHER:
;45:		case WP_RAILGUN:
;46:		case WP_SHOTGUN: 
;47:		case WP_PROX_LAUNCHER: 
;48:
;49:			total += cg.snap->ps.ammo[i] * 1000;
;50:			break;
;51:		default:
;52:			total += cg.snap->ps.ammo[i] * 200;
;53:			break;
;54:		}
;55:		if ( total >= 5000 ) {
;56:			cg.lowAmmoWarning = 0;
;57:			return;
;58:		}
;59:	}
;60:
;61:	previous = cg.lowAmmoWarning;
;62:
;63:	if ( total == 0 ) {
;64:		cg.lowAmmoWarning = 2;
;65:	} else {
;66:		cg.lowAmmoWarning = 1;
;67:	}
;68:
;69:	// play a sound on transitions
;70:	if ( cg.lowAmmoWarning != previous ) {
;71:		trap_S_StartLocalSound( cgs.media.noAmmoSound, CHAN_LOCAL_SOUND );
;72:	}
;73:
;74:}
;75:#endif
;76:
;77:/*
;78:==============
;79:CG_DamageFeedback
;80:==============
;81:*/
;82:void CG_DamageFeedback( int yawByte, int pitchByte, int damage, int damageDuration ) {
line 93
;83:	float		left, front, up;
;84:	float		kick;
;85:	int			health;
;86:	float		scale;
;87:	vec3_t		dir;
;88:	vec3_t		angles;
;89:	float		dist;
;90:	float		yaw, pitch;
;91:
;92:	// show the attacking player's head and name in corner
;93:	cg.attackerTime = cg.time;
ADDRGP4 cg+115052
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 96
;94:
;95:	// the lower on health you are, the greater the view kick will be
;96:	health = cg.snap->ps.stats[STAT_HEALTH];
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 97
;97:	if ( health < 40 ) {
ADDRLP4 20
INDIRI4
CNSTI4 40
GEI4 $88
line 98
;98:		scale = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 99
;99:	} else {
ADDRGP4 $89
JUMPV
LABELV $88
line 100
;100:		scale = 40.0 / health;
ADDRLP4 28
CNSTF4 1109393408
ADDRLP4 20
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 101
;101:	}
LABELV $89
line 102
;102:	kick = damage * scale;
ADDRLP4 12
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 104
;103:
;104:	if (kick < 5)
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
GEF4 $90
line 105
;105:		kick = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
LABELV $90
line 106
;106:	if (kick > 50)
ADDRLP4 12
INDIRF4
CNSTF4 1112014848
LEF4 $92
line 107
;107:		kick = 50;
ADDRLP4 12
CNSTF4 1112014848
ASGNF4
LABELV $92
line 110
;108:
;109:	// if yaw and pitch are both 255, make the damage always centered (falling, etc)
;110:	if ( yawByte == 255 && pitchByte == 255 ) {
ADDRLP4 60
CNSTI4 255
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $94
ADDRFP4 4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $94
line 111
;111:		cg.damageX = 0;
ADDRGP4 cg+115316
CNSTF4 0
ASGNF4
line 112
;112:		cg.damageY = 0;
ADDRGP4 cg+115320
CNSTF4 0
ASGNF4
line 113
;113:		cg.v_dmg_roll = 0;
ADDRGP4 cg+115364
CNSTF4 0
ASGNF4
line 114
;114:		cg.v_dmg_pitch = -kick;
ADDRGP4 cg+115360
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
line 115
;115:	} else {
ADDRGP4 $95
JUMPV
LABELV $94
line 117
;116:		// positional
;117:		pitch = pitchByte / 255.0 * 360;
ADDRLP4 56
CNSTF4 1135869952
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1132396544
DIVF4
MULF4
ASGNF4
line 118
;118:		yaw = yawByte / 255.0 * 360;
ADDRLP4 52
CNSTF4 1135869952
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1132396544
DIVF4
MULF4
ASGNF4
line 120
;119:
;120:		angles[PITCH] = pitch;
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 121
;121:		angles[YAW] = yaw;
ADDRLP4 32+4
ADDRLP4 52
INDIRF4
ASGNF4
line 122
;122:		angles[ROLL] = 0;
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 124
;123:
;124:		AngleVectors( angles, dir, NULL, NULL );
ADDRLP4 32
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 125
;125:		VectorSubtract( vec3_origin, dir, dir );
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 127
;126:
;127:		front = DotProduct (dir, cg.refdef.viewaxis[0] );
ADDRLP4 16
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109044+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109044+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109044+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 128
;128:		left = DotProduct (dir, cg.refdef.viewaxis[1] );
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109044+36+12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109044+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109044+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 129
;129:		up = DotProduct (dir, cg.refdef.viewaxis[2] );
ADDRLP4 48
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109044+36+24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109044+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109044+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 131
;130:
;131:		dir[0] = front;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 132
;132:		dir[1] = left;
ADDRLP4 0+4
ADDRLP4 24
INDIRF4
ASGNF4
line 133
;133:		dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 134
;134:		dist = VectorLength( dir );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 68
INDIRF4
ASGNF4
line 135
;135:		if ( dist < 0.1 ) {
ADDRLP4 44
INDIRF4
CNSTF4 1036831949
GEF4 $146
line 136
;136:			dist = 0.1f;
ADDRLP4 44
CNSTF4 1036831949
ASGNF4
line 137
;137:		}
LABELV $146
line 139
;138:
;139:		cg.v_dmg_roll = kick * left;
ADDRGP4 cg+115364
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 141
;140:		
;141:		cg.v_dmg_pitch = -kick * front;
ADDRGP4 cg+115360
ADDRLP4 12
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 143
;142:
;143:		if ( front <= 0.1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1036831949
GTF4 $150
line 144
;144:			front = 0.1f;
ADDRLP4 16
CNSTF4 1036831949
ASGNF4
line 145
;145:		}
LABELV $150
line 146
;146:		cg.damageX = -left / front;
ADDRGP4 cg+115316
ADDRLP4 24
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 147
;147:		cg.damageY = up / dist;
ADDRGP4 cg+115320
ADDRLP4 48
INDIRF4
ADDRLP4 44
INDIRF4
DIVF4
ASGNF4
line 148
;148:	}
LABELV $95
line 151
;149:
;150:	// clamp the position
;151:	if ( cg.damageX > 1.0 ) {
ADDRGP4 cg+115316
INDIRF4
CNSTF4 1065353216
LEF4 $154
line 152
;152:		cg.damageX = 1.0;
ADDRGP4 cg+115316
CNSTF4 1065353216
ASGNF4
line 153
;153:	}
LABELV $154
line 154
;154:	if ( cg.damageX < - 1.0 ) {
ADDRGP4 cg+115316
INDIRF4
CNSTF4 3212836864
GEF4 $158
line 155
;155:		cg.damageX = -1.0;
ADDRGP4 cg+115316
CNSTF4 3212836864
ASGNF4
line 156
;156:	}
LABELV $158
line 158
;157:
;158:	if ( cg.damageY > 1.0 ) {
ADDRGP4 cg+115320
INDIRF4
CNSTF4 1065353216
LEF4 $162
line 159
;159:		cg.damageY = 1.0;
ADDRGP4 cg+115320
CNSTF4 1065353216
ASGNF4
line 160
;160:	}
LABELV $162
line 161
;161:	if ( cg.damageY < - 1.0 ) {
ADDRGP4 cg+115320
INDIRF4
CNSTF4 3212836864
GEF4 $166
line 162
;162:		cg.damageY = -1.0;
ADDRGP4 cg+115320
CNSTF4 3212836864
ASGNF4
line 163
;163:	}
LABELV $166
line 166
;164:
;165:	// don't let the screen flashes vary as much
;166:	if ( kick > 10 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $170
line 167
;167:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
line 168
;168:	}
LABELV $170
line 169
;169:	cg.damageValue = kick;
ADDRGP4 cg+115324
ADDRLP4 12
INDIRF4
ASGNF4
line 170
;170:	cg.v_dmg_time = cg.time + damageDuration;
ADDRGP4 cg+115356
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 171
;171:	cg.damageTime = cg.snap->serverTime;
ADDRGP4 cg+115312
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 172
;172:	cg.damageDuration = damageDuration;
ADDRGP4 cg+117872
ADDRFP4 12
INDIRI4
ASGNI4
line 173
;173:}
LABELV $84
endproc CG_DamageFeedback 72 16
export CG_Respawn
proc CG_Respawn 0 4
line 185
;174:
;175:
;176:
;177:
;178:/*
;179:================
;180:CG_Respawn
;181:
;182:A respawn happened this snapshot
;183:================
;184:*/
;185:void CG_Respawn( void ) {
line 187
;186:	// no error decay on player movement
;187:	cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 190
;188:
;189:	// display weapons available
;190:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+115300
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 193
;191:
;192:
;193:	cg.damageDuration = 0;
ADDRGP4 cg+117872
CNSTI4 0
ASGNI4
line 195
;194:	// clear all these
;195:	cg.flashedVision_x = 0;
ADDRGP4 cg+116300
CNSTI4 0
ASGNI4
line 196
;196:	cg.flashedVision_y = 0;
ADDRGP4 cg+116304
CNSTI4 0
ASGNI4
line 197
;197:	cg.flashedVisionTime = 0;
ADDRGP4 cg+116296
CNSTI4 0
ASGNI4
line 198
;198:	cg.FlashTime = 0;
ADDRGP4 cg+116284
CNSTI4 0
ASGNI4
line 199
;199:	cg.ConcussionTime = 0;
ADDRGP4 cg+116288
CNSTI4 0
ASGNI4
line 200
;200:	cg.damageTime = 0;
ADDRGP4 cg+115312
CNSTF4 0
ASGNF4
line 201
;201:	cg.DeafTime = 0;
ADDRGP4 cg+116292
CNSTI4 0
ASGNI4
line 203
;202:
;203:	cg.deathZoom = 0;
ADDRGP4 cg+201992
CNSTI4 0
ASGNI4
line 204
;204:	cg.deathRotation = 0;
ADDRGP4 cg+201988
CNSTI4 0
ASGNI4
line 208
;205:
;206:
;207:	// restart at idle frame
;208:	cg.predictedPlayerEntity.pe.weapAnim = WANIM_IDLE;
ADDRGP4 cg+108104+472+152
CNSTI4 6
ASGNI4
line 209
;209:	cg.predictedPlayerEntity.pe.nextweapAnim = WANIM_IDLE;
ADDRGP4 cg+108104+472+156
CNSTI4 6
ASGNI4
line 211
;210:
;211:	cg.weaponPos = 1.0f;
ADDRGP4 cg+116308
CNSTF4 1065353216
ASGNF4
line 214
;212:
;213:	// select the weapon the server says we are using
;214:	cg.weaponSelect = cg.snap->ps.weapon;
ADDRGP4 cg+108944
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 216
;215:
;216:	cg.DeathBlendTime = cg.time + 500;
ADDRGP4 cg+171488
ADDRGP4 cg+107604
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 218
;217:
;218:	trap_SendConsoleCommand( "; -movedown;" );
ADDRGP4 $203
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 219
;219:}
LABELV $178
endproc CG_Respawn 0 4
export CG_CheckPlayerstateEvents
proc CG_CheckPlayerstateEvents 52 8
line 228
;220:
;221:extern char *eventnames[];
;222:
;223:/*
;224:==============
;225:CG_CheckPlayerstateEvents
;226:==============
;227:*/
;228:void CG_CheckPlayerstateEvents( playerState_t *ps, playerState_t *ops ) {
line 233
;229:	int			i;
;230:	int			event;
;231:	centity_t	*cent;
;232:
;233:	if ( ps->externalEvent && ps->externalEvent != ops->externalEvent ) {
ADDRLP4 12
CNSTI4 128
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $205
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
EQI4 $205
line 234
;234:		cent = &cg_entities[ ps->clientNum ];
ADDRLP4 4
CNSTI4 728
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 235
;235:		cent->currentState.event = ps->externalEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 236
;236:		cent->currentState.eventParm = ps->externalEventParm;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 237
;237:		CG_EntityEvent( cent, cent->lerpOrigin );
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
line 238
;238:	}
LABELV $205
line 240
;239:
;240:	cent = &cg.predictedPlayerEntity; // cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
line 242
;241:	// go through the predictable events buffer
;242:	for ( i = ps->eventSequence - MAX_PS_EVENTS ; i < ps->eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $211
JUMPV
LABELV $208
line 244
;243:		// if we have a new predictable event
;244:		if ( i >= ops->eventSequence
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $214
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
LEI4 $212
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 32
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
CNSTI4 112
ASGNI4
ADDRLP4 36
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 24
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
EQI4 $212
LABELV $214
line 247
;245:			// or the server told us to play another event instead of a predicted event we already issued
;246:			// or something the server told us changed our prediction causing a different event
;247:			|| (i > ops->eventSequence - MAX_PS_EVENTS && ps->events[i & (MAX_PS_EVENTS-1)] != ops->events[i & (MAX_PS_EVENTS-1)]) ) {
line 249
;248:
;249:			event = ps->events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 250
;250:			cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 251
;251:			cent->currentState.eventParm = ps->eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 252
;252:			CG_EntityEvent( cent, cent->lerpOrigin );
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
line 254
;253:
;254:			cg.predictableEvents[ i & (MAX_PREDICTED_EVENTS-1) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+108856
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 256
;255:
;256:			cg.eventSequence++;
ADDRLP4 48
ADDRGP4 cg+108852
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 257
;257:		}
LABELV $212
line 258
;258:	}
LABELV $209
line 242
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $211
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $208
line 259
;259:}
LABELV $204
endproc CG_CheckPlayerstateEvents 52 8
export CG_CheckChangedPredictableEvents
proc CG_CheckChangedPredictableEvents 24 8
line 266
;260:
;261:/*
;262:==================
;263:CG_CheckChangedPredictableEvents
;264:==================
;265:*/
;266:void CG_CheckChangedPredictableEvents( playerState_t *ps ) {
line 271
;267:	int i;
;268:	int event;
;269:	centity_t	*cent;
;270:
;271:	cent = &cg.predictedPlayerEntity;
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
line 272
;272:	for ( i = ps->eventSequence - MAX_PS_EVENTS ; i < ps->eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $222
JUMPV
LABELV $219
line 274
;273:		//
;274:		if (i >= cg.eventSequence) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+108852
INDIRI4
LTI4 $223
line 275
;275:			continue;
ADDRGP4 $220
JUMPV
LABELV $223
line 278
;276:		}
;277:		// if this event is not further back in than the maximum predictable events we remember
;278:		if (i > cg.eventSequence - MAX_PREDICTED_EVENTS) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+108852
INDIRI4
CNSTI4 16
SUBI4
LEI4 $226
line 280
;279:			// if the new playerstate event is different from a previously predicted one
;280:			if ( ps->events[i & (MAX_PS_EVENTS-1)] != cg.predictableEvents[i & (MAX_PREDICTED_EVENTS-1) ] ) {
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 cg+108856
ADDP4
INDIRI4
EQI4 $229
line 282
;281:
;282:				event = ps->events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 283
;283:				cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 284
;284:				cent->currentState.eventParm = ps->eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 285
;285:				CG_EntityEvent( cent, cent->lerpOrigin );
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
line 287
;286:
;287:				cg.predictableEvents[ i & (MAX_PREDICTED_EVENTS-1) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+108856
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 289
;288:
;289:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $233
line 290
;290:					CG_Printf("WARNING: changed predicted event\n");
ADDRGP4 $236
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 291
;291:				}
LABELV $233
line 292
;292:			}
LABELV $229
line 293
;293:		}
LABELV $226
line 294
;294:	}
LABELV $220
line 272
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $222
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $219
line 295
;295:}
LABELV $217
endproc CG_CheckChangedPredictableEvents 24 8
export CG_CheckLocalSounds
proc CG_CheckLocalSounds 1608 12
line 318
;296:
;297:/*
;298:==================
;299:pushReward
;300:==================
;301:static void pushReward(sfxHandle_t sfx, qhandle_t shader, int rewardCount) {
;302:	if (cg.rewardStack < (MAX_REWARDSTACK-1)) {
;303:		cg.rewardStack++;
;304:		cg.rewardSound[cg.rewardStack] = sfx;
;305:		cg.rewardShader[cg.rewardStack] = shader;
;306:		cg.rewardCount[cg.rewardStack] = rewardCount;
;307:	}
;308:}
;309:*/
;310:
;311://void CG_SendInventory_f( );
;312:/*
;313:==================
;314:CG_CheckLocalSounds
;315:==================
;316:*/
;317:
;318:void CG_CheckLocalSounds( playerState_t *ps, playerState_t *ops ) {
line 323
;319:	int			highScore,/* health,  armor*/  reward;
;320:	char    buf[16];
;321:	int     prim, sec;
;322://	sfxHandle_t sfx;
;323:	buf[0] = 'C';
ADDRLP4 0
CNSTI1 67
ASGNI1
line 324
;324:	buf[1] = '1';
ADDRLP4 0+1
CNSTI1 49
ASGNI1
line 325
;325:	buf[2] = '1';
ADDRLP4 0+2
CNSTI1 49
ASGNI1
line 326
;326:	buf[3] = '1';
ADDRLP4 0+3
CNSTI1 49
ASGNI1
line 327
;327:	buf[4] = '1';
ADDRLP4 0+4
CNSTI1 49
ASGNI1
line 328
;328:	buf[5] = '1';
ADDRLP4 0+5
CNSTI1 49
ASGNI1
line 329
;329:	buf[6] = '1';
ADDRLP4 0+6
CNSTI1 49
ASGNI1
line 330
;330:	buf[7] = '\0';
ADDRLP4 0+7
CNSTI1 0
ASGNI1
line 333
;331:
;332:	// don't play the sounds if the player just changed teams
;333:	if ( ps->persistant[PERS_TEAM] != ops->persistant[PERS_TEAM]) {
ADDRLP4 32
CNSTI4 260
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $245
line 340
;334:		char var[MAX_TOKEN_CHARS];
;335:		char model[256],skin[256];
;336:
;337:		//CG_Printf(S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: Teamchange occured [%i:%i:%i:%i:%i]\n", ps->persistant[PERS_TEAM], ops->persistant[PERS_TEAM], TEAM_RED, TEAM_BLUE, TEAM_SPECTATOR);
;338:
;339:		// clear the XP for client, server and UI
;340:		trap_Cvar_Set("character", buf);
ADDRGP4 $247
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 341
;341:		trap_Cvar_Set("ui_character", buf);
ADDRGP4 $248
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 344
;342:		
;343:		// get the current weapons
;344:		trap_Cvar_VariableStringBuffer("inven_primary", buf, sizeof(buf));
ADDRGP4 $249
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 345
;345:		prim = atoi(buf);
ADDRLP4 0
ARGP4
ADDRLP4 1572
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 1572
INDIRI4
ASGNI4
line 346
;346:		trap_Cvar_VariableStringBuffer("inven_secondary", buf, sizeof(buf));
ADDRGP4 $250
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 347
;347:		sec = atoi(buf);
ADDRLP4 0
ARGP4
ADDRLP4 1576
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1576
INDIRI4
ASGNI4
line 350
;348:
;349:		// teamchange happend. update inventory
;350:		if ( ps->persistant[PERS_TEAM] == TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
NEI4 $251
line 351
;351:		{	
line 353
;352:			// we are seals now, check the weapons
;353:			if (prim == WP_MAC10) 
ADDRLP4 20
INDIRI4
CNSTI4 13
NEI4 $253
line 354
;354:				trap_Cvar_Set("inven_primary", va("%i", WP_MP5));
ADDRGP4 $255
ARGP4
CNSTI4 14
ARGI4
ADDRLP4 1580
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $249
ARGP4
ADDRLP4 1580
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $254
JUMPV
LABELV $253
line 355
;355:			else if (prim == WP_AK47)
ADDRLP4 20
INDIRI4
CNSTI4 15
NEI4 $256
line 356
;356:				trap_Cvar_Set("inven_primary", va("%i", WP_M4));
ADDRGP4 $255
ARGP4
CNSTI4 16
ARGI4
ADDRLP4 1584
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $249
ARGP4
ADDRLP4 1584
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $257
JUMPV
LABELV $256
line 357
;357:			else if (prim == WP_M590)
ADDRLP4 20
INDIRI4
CNSTI4 20
NEI4 $258
line 358
;358:				trap_Cvar_Set("inven_primary", va("%i", WP_870));
ADDRGP4 $255
ARGP4
CNSTI4 19
ARGI4
ADDRLP4 1588
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $249
ARGP4
ADDRLP4 1588
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $258
LABELV $257
LABELV $254
line 360
;359:			
;360:			if (sec == WP_GLOCK)
ADDRLP4 24
INDIRI4
CNSTI4 7
NEI4 $260
line 361
;361:				trap_Cvar_Set("inven_secondary", va("%i", WP_P9S));
ADDRGP4 $255
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 1592
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $250
ARGP4
ADDRLP4 1592
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $261
JUMPV
LABELV $260
line 362
;362:			else if (sec == WP_SW40T)
ADDRLP4 24
INDIRI4
CNSTI4 8
NEI4 $262
line 363
;363:				trap_Cvar_Set("inven_secondary", va("%i", WP_MK23));
ADDRGP4 $255
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1596
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $250
ARGP4
ADDRLP4 1596
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $263
JUMPV
LABELV $262
line 364
;364:			else if (sec == WP_DEAGLE)
ADDRLP4 24
INDIRI4
CNSTI4 10
NEI4 $264
line 365
;365:				trap_Cvar_Set("inven_secondary", va("%i", WP_SW629));
ADDRGP4 $255
ARGP4
CNSTI4 11
ARGI4
ADDRLP4 1600
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $250
ARGP4
ADDRLP4 1600
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $264
LABELV $263
LABELV $261
line 369
;366:
;367:											
;368:			// update looks
;369:			trap_Cvar_VariableStringBuffer("ui_s_e_eyes", var , sizeof(var ) );
ADDRGP4 $266
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 370
;370:			trap_Cvar_Set("e_eyes", var );
ADDRGP4 $267
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 371
;371:			trap_Cvar_VariableStringBuffer("ui_s_e_head", var , sizeof(var ) );
ADDRGP4 $268
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 372
;372:			trap_Cvar_Set("e_head", var );
ADDRGP4 $269
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 373
;373:			trap_Cvar_VariableStringBuffer("ui_s_e_mouth", var , sizeof(var ) );
ADDRGP4 $270
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 374
;374:			trap_Cvar_Set("e_mouth", var );
ADDRGP4 $271
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 377
;375:
;376:			 // model
;377:			trap_Cvar_VariableStringBuffer("ui_s_model", model , sizeof( model ) ); 
ADDRGP4 $272
ARGP4
ADDRLP4 1060
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 378
;378:			trap_Cvar_VariableStringBuffer("ui_s_skin", skin , sizeof( skin ) );
ADDRGP4 $273
ARGP4
ADDRLP4 1316
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 379
;379:			trap_Cvar_Set( "model", va("%s/%s",model,skin) );
ADDRGP4 $275
ARGP4
ADDRLP4 1060
ARGP4
ADDRLP4 1316
ARGP4
ADDRLP4 1604
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $274
ARGP4
ADDRLP4 1604
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 380
;380:		}
ADDRGP4 $237
JUMPV
LABELV $251
line 381
;381:		else if ( ps->persistant[PERS_TEAM] == TEAM_BLUE )
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
NEI4 $237
line 382
;382:		{
line 384
;383:			// we are tangos now, check the weapons
;384:			if (prim == WP_MP5) 
ADDRLP4 20
INDIRI4
CNSTI4 14
NEI4 $278
line 385
;385:				trap_Cvar_Set("inven_primary", va("%i", WP_MAC10));
ADDRGP4 $255
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 1580
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $249
ARGP4
ADDRLP4 1580
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $279
JUMPV
LABELV $278
line 386
;386:			else if (prim == WP_M4)
ADDRLP4 20
INDIRI4
CNSTI4 16
NEI4 $280
line 387
;387:				trap_Cvar_Set("inven_primary", va("%i", WP_AK47));
ADDRGP4 $255
ARGP4
CNSTI4 15
ARGI4
ADDRLP4 1584
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $249
ARGP4
ADDRLP4 1584
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $281
JUMPV
LABELV $280
line 388
;388:			else if (prim == WP_870)
ADDRLP4 20
INDIRI4
CNSTI4 19
NEI4 $282
line 389
;389:				trap_Cvar_Set("inven_primary", va("%i", WP_M590));
ADDRGP4 $255
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 1588
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $249
ARGP4
ADDRLP4 1588
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $282
LABELV $281
LABELV $279
line 391
;390:			
;391:			if (sec == WP_P9S)
ADDRLP4 24
INDIRI4
CNSTI4 9
NEI4 $284
line 392
;392:				trap_Cvar_Set("inven_secondary", va("%i", WP_GLOCK));
ADDRGP4 $255
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 1592
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $250
ARGP4
ADDRLP4 1592
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $285
JUMPV
LABELV $284
line 393
;393:			else if (sec == WP_MK23)
ADDRLP4 24
INDIRI4
CNSTI4 6
NEI4 $286
line 394
;394:				trap_Cvar_Set("inven_secondary", va("%i", WP_SW40T));
ADDRGP4 $255
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 1596
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $250
ARGP4
ADDRLP4 1596
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $287
JUMPV
LABELV $286
line 395
;395:			else if (sec == WP_SW629)
ADDRLP4 24
INDIRI4
CNSTI4 11
NEI4 $288
line 396
;396:				trap_Cvar_Set("inven_secondary", va("%i", WP_DEAGLE));
ADDRGP4 $255
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 1600
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $250
ARGP4
ADDRLP4 1600
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $288
LABELV $287
LABELV $285
line 400
;397:
;398:											
;399:			// update looks
;400:			trap_Cvar_VariableStringBuffer("ui_t_e_eyes", var , sizeof(var ) );
ADDRGP4 $290
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 401
;401:			trap_Cvar_Set("e_eyes", var );
ADDRGP4 $267
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 402
;402:			trap_Cvar_VariableStringBuffer("ui_t_e_head", var , sizeof(var ) );
ADDRGP4 $291
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 403
;403:			trap_Cvar_Set("e_head", var );
ADDRGP4 $269
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 404
;404:			trap_Cvar_VariableStringBuffer("ui_t_e_mouth", var , sizeof(var ) );
ADDRGP4 $292
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 405
;405:			trap_Cvar_Set("e_mouth", var );
ADDRGP4 $271
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 408
;406:
;407:			 // model
;408:			trap_Cvar_VariableStringBuffer("ui_t_model", model , sizeof( model ) ); 
ADDRGP4 $293
ARGP4
ADDRLP4 1060
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 409
;409:			trap_Cvar_VariableStringBuffer("ui_t_skin", skin , sizeof( skin ) );
ADDRGP4 $294
ARGP4
ADDRLP4 1316
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 411
;410:
;411:			trap_Cvar_Set( "model", va("%s/%s",model,skin) );
ADDRGP4 $275
ARGP4
ADDRLP4 1060
ARGP4
ADDRLP4 1316
ARGP4
ADDRLP4 1604
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $274
ARGP4
ADDRLP4 1604
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 412
;412:		}
line 414
;413:
;414:		return;
ADDRGP4 $237
JUMPV
LABELV $245
line 418
;415:	}
;416:
;417:	// health changes of more than -1 should call twitching screen 
;418:	if ( ps->stats[STAT_HEALTH] < ops->stats[STAT_HEALTH] - 1 ) {
ADDRLP4 36
CNSTI4 184
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $295
line 419
;419:		if ( ps->stats[STAT_HEALTH] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $297
line 420
;420:			cg.predictedPlayerEntity.pe.painTime = cg.time;
ADDRGP4 cg+108104+472+96
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 421
;421:			cg.predictedPlayerEntity.pe.painDirection ^= 1;
ADDRLP4 40
ADDRGP4 cg+108104+472+100
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 422
;422:		}
LABELV $297
line 423
;423:	}
LABELV $295
line 427
;424:
;425:
;426:	// if we are going into the intermission, don't start any voices
;427:	if ( cg.intermissionStarted ) {
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $306
line 428
;428:		return;
ADDRGP4 $237
JUMPV
LABELV $306
line 432
;429:	}
;430:
;431:	// reward sounds
;432:	reward = qfalse;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 509
;433:	/*
;434:	if (ps->persistant[PERS_CAPTURES] != ops->persistant[PERS_CAPTURES]) {
;435:		pushReward(cgs.media.captureAwardSound, cgs.media.medalCapture, ps->persistant[PERS_CAPTURES]);
;436:		reward = qtrue;
;437:		//Com_Printf("capture\n");
;438:	}
;439:	if (ps->persistant[PERS_IMPRESSIVE_COUNT] != ops->persistant[PERS_IMPRESSIVE_COUNT]) {
;440: 
;441:		sfx = cgs.media.impressiveSound; 
;442:		pushReward(sfx, cgs.media.medalImpressive, ps->persistant[PERS_IMPRESSIVE_COUNT]);
;443:		reward = qtrue;
;444:		//Com_Printf("impressive\n");
;445:	}
;446:	if (ps->persistant[PERS_EXCELLENT_COUNT] != ops->persistant[PERS_EXCELLENT_COUNT]) {
;447:#ifdef MISSIONPACK
;448:		if (ps->persistant[PERS_EXCELLENT_COUNT] == 1) {
;449:			sfx = cgs.media.firstExcellentSound;
;450:		} else {
;451:			sfx = cgs.media.excellentSound;
;452:		}
;453:#else
;454:		sfx = cgs.media.excellentSound;
;455:#endif
;456:		pushReward(sfx, cgs.media.medalExcellent, ps->persistant[PERS_EXCELLENT_COUNT]);
;457:		reward = qtrue;
;458:		//Com_Printf("excellent\n");
;459:	}
;460:	if (ps->persistant[PERS_GAUNTLET_FRAG_COUNT] != ops->persistant[PERS_GAUNTLET_FRAG_COUNT]) {
;461: 		sfx = cgs.media.humiliationSound;
;462: 		pushReward(sfx, cgs.media.medalGauntlet, ps->persistant[PERS_GAUNTLET_FRAG_COUNT]);
;463:		reward = qtrue;
;464:		//Com_Printf("guantlet frag\n");
;465:	}
;466:	if (ps->persistant[PERS_DEFEND_COUNT] != ops->persistant[PERS_DEFEND_COUNT]) {
;467:		pushReward(cgs.media.defendSound, cgs.media.medalDefend, ps->persistant[PERS_DEFEND_COUNT]);
;468:		reward = qtrue;
;469:		//Com_Printf("defend\n");
;470:	}
;471:	if (ps->persistant[PERS_ASSIST_COUNT] != ops->persistant[PERS_ASSIST_COUNT]) {
;472:		pushReward(cgs.media.assistSound, cgs.media.medalAssist, ps->persistant[PERS_ASSIST_COUNT]);
;473:		reward = qtrue;
;474:		//Com_Printf("assist\n");
;475:	}
;476:	*/
;477:	// if any of the player event bits changed
;478:#if 0
;479:	if (ps->persistant[PERS_PLAYEREVENTS] != ops->persistant[PERS_PLAYEREVENTS]) {
;480:		if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD) !=
;481:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD)) {
;482:			trap_S_StartLocalSound( cgs.media.deniedSound, CHAN_ANNOUNCER );
;483:		}
;484:		else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD) !=
;485:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD)) {
;486:			trap_S_StartLocalSound( cgs.media.humiliationSound, CHAN_ANNOUNCER );
;487:		}
;488:		else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT) !=
;489:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT)) {
;490:			trap_S_StartLocalSound( cgs.media.holyShitSound, CHAN_ANNOUNCER );
;491:		}
;492:		reward = qtrue;
;493:	}
;494:#endif
;495:	// check for flag pickup
;496:/*
;497:	if ( cgs.gametype >= GT_TEAM ) {
;498:		if ((ps->powerups[PW_REDFLAG] != ops->powerups[PW_REDFLAG] && ps->powerups[PW_REDFLAG]) ||
;499:			(ps->powerups[PW_BLUEFLAG] != ops->powerups[PW_BLUEFLAG] && ps->powerups[PW_BLUEFLAG]) 
;500:			//(ps->powerups[PW_NEUTRALFLAG] != ops->powerups[PW_NEUTRALFLAG] && ps->powerups[PW_NEUTRALFLAG]) 
;501:			)
;502:		{
;503:			trap_S_StartLocalSound( cgs.media.youHaveFlagSound, CHAN_ANNOUNCER );
;504:		}
;505:	} 
;506:*/
;507:
;508:	// timelimit warnings
;509:	if ( cgs.levelRoundStartTime > 0 )
ADDRGP4 cgs+214076
INDIRI4
CNSTI4 0
LEI4 $309
line 510
;510:	{
line 513
;511:		int		msec;
;512:
;513:		msec = cgs.levelRoundStartTime - cg.time;
ADDRLP4 40
ADDRGP4 cgs+214076
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 516
;514:
;515:		// break it down into seconds
;516:		msec /= 1000;  
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 519
;517:
;518:		//fixme: precache sounds
;519:		if ( msec <= 0 && !(cg.roundlimitWarnings & 8192 ) )
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
GTI4 $314
ADDRGP4 cg+116316
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 44
INDIRI4
NEI4 $314
line 520
;520:		{
line 521
;521:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 | 4096 | 8192;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 16383
BORI4
ASGNI4
line 523
;522:			// 1 seconds left
;523:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/rt_limithit.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $318
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 524
;524:		}
LABELV $314
line 525
;525:		if ( msec <= 1 && !(cg.roundlimitWarnings & 4096 ) )
ADDRLP4 40
INDIRI4
CNSTI4 1
GTI4 $319
ADDRGP4 cg+116316
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $319
line 526
;526:		{
line 527
;527:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 | 4096;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 8191
BORI4
ASGNI4
line 529
;528:			// 1 seconds left
;529:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/1.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $323
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 530
;530:		}
ADDRGP4 $320
JUMPV
LABELV $319
line 531
;531:		else if ( msec <= 2 && !(cg.roundlimitWarnings & 2048 ) )
ADDRLP4 40
INDIRI4
CNSTI4 2
GTI4 $324
ADDRGP4 cg+116316
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
NEI4 $324
line 532
;532:		{
line 533
;533:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 4095
BORI4
ASGNI4
line 535
;534:			// 2 seconds left
;535:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/2.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $328
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 536
;536:		}
ADDRGP4 $325
JUMPV
LABELV $324
line 537
;537:		else if ( msec <= 3 && !(cg.roundlimitWarnings & 1024 ) )
ADDRLP4 40
INDIRI4
CNSTI4 3
GTI4 $329
ADDRGP4 cg+116316
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $329
line 538
;538:		{
line 539
;539:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 2047
BORI4
ASGNI4
line 541
;540:			// 3 seconds left
;541:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/3.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $333
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 542
;542:		}
ADDRGP4 $330
JUMPV
LABELV $329
line 543
;543:		else if ( msec <= 4 && !(cg.roundlimitWarnings & 512 ) )
ADDRLP4 40
INDIRI4
CNSTI4 4
GTI4 $334
ADDRGP4 cg+116316
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $334
line 544
;544:		{
line 545
;545:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1023
BORI4
ASGNI4
line 547
;546:			// 4 seconds left
;547:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/4.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $338
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 548
;548:		}
ADDRGP4 $335
JUMPV
LABELV $334
line 549
;549:		else if ( msec <= 5 && !(cg.roundlimitWarnings & 256 ) )
ADDRLP4 40
INDIRI4
CNSTI4 5
GTI4 $339
ADDRGP4 cg+116316
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $339
line 550
;550:		{
line 551
;551:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 511
BORI4
ASGNI4
line 553
;552:			// 5 seconds left
;553:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/5.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $343
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 554
;554:		}
ADDRGP4 $340
JUMPV
LABELV $339
line 555
;555:		else if ( msec <= 6 && !(cg.roundlimitWarnings & 128 ) )
ADDRLP4 40
INDIRI4
CNSTI4 6
GTI4 $344
ADDRGP4 cg+116316
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $344
line 556
;556:		{
line 557
;557:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 255
BORI4
ASGNI4
line 559
;558:			// 6 seconds left
;559:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/6.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $348
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 560
;560:		}
ADDRGP4 $345
JUMPV
LABELV $344
line 561
;561:		else if ( msec <= 7 && !(cg.roundlimitWarnings & 64 ) )
ADDRLP4 40
INDIRI4
CNSTI4 7
GTI4 $349
ADDRGP4 cg+116316
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $349
line 562
;562:		{
line 563
;563:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32 | 64;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 127
BORI4
ASGNI4
line 565
;564:			// 7 seconds left
;565:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/7.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $353
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 566
;566:		}
ADDRGP4 $350
JUMPV
LABELV $349
line 567
;567:		else if ( msec <= 8 && !(cg.roundlimitWarnings & 32 ) )
ADDRLP4 40
INDIRI4
CNSTI4 8
GTI4 $354
ADDRGP4 cg+116316
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $354
line 568
;568:		{
line 569
;569:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 | 32;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 63
BORI4
ASGNI4
line 571
;570:			// 8 seconds left
;571:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/8.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $358
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 572
;572:		}
ADDRGP4 $355
JUMPV
LABELV $354
line 573
;573:		else if ( msec <= 9 && !(cg.roundlimitWarnings & 16 ) )
ADDRLP4 40
INDIRI4
CNSTI4 9
GTI4 $359
ADDRGP4 cg+116316
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $359
line 574
;574:		{
line 575
;575:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8 | 16 ;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 31
BORI4
ASGNI4
line 577
;576:			// 9 seconds left
;577:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/9.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $363
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 578
;578:		}
ADDRGP4 $360
JUMPV
LABELV $359
line 579
;579:		else if ( msec <= 10 && !(cg.roundlimitWarnings & 8 ) )
ADDRLP4 40
INDIRI4
CNSTI4 10
GTI4 $364
ADDRGP4 cg+116316
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $364
line 580
;580:		{
line 581
;581:			cg.roundlimitWarnings |= 1 | 2 | 4 | 8  ;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 15
BORI4
ASGNI4
line 583
;582:			// 10 seconds left
;583:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/10.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $368
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 584
;584:		}
ADDRGP4 $365
JUMPV
LABELV $364
line 585
;585:		else if ( msec <= 30 && !(cg.roundlimitWarnings & 4 ) )
ADDRLP4 40
INDIRI4
CNSTI4 30
GTI4 $369
ADDRGP4 cg+116316
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $369
line 586
;586:		{
line 587
;587:			cg.roundlimitWarnings |= 1 | 2 | 4  ;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 589
;588:			// 30 seconds left
;589:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/30seconds.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $373
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 590
;590:		}
ADDRGP4 $370
JUMPV
LABELV $369
line 591
;591:		else if ( msec <= 60 && !(cg.roundlimitWarnings & 2 ) )
ADDRLP4 40
INDIRI4
CNSTI4 60
GTI4 $374
ADDRGP4 cg+116316
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $374
line 592
;592:		{
line 593
;593:			cg.roundlimitWarnings |= 1 | 2 ;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 595
;594:			// one minute left
;595:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/oneminute.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $378
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 596
;596:		}
ADDRGP4 $375
JUMPV
LABELV $374
line 597
;597:		else if ( msec <= 120 && !(cg.roundlimitWarnings & 1 ) )
ADDRLP4 40
INDIRI4
CNSTI4 120
GTI4 $379
ADDRGP4 cg+116316
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $379
line 598
;598:		{
line 599
;599:			cg.roundlimitWarnings |= 1 ;
ADDRLP4 48
ADDRGP4 cg+116316
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 600
;600:			trap_S_StartLocalSound( trap_S_RegisterSound( "sound/commentary/twominutes.wav", qfalse ) , CHAN_ANNOUNCER );
ADDRGP4 $383
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 602
;601:			// two minutes left
;602:		}
LABELV $379
LABELV $375
LABELV $370
LABELV $365
LABELV $360
LABELV $355
LABELV $350
LABELV $345
LABELV $340
LABELV $335
LABELV $330
LABELV $325
LABELV $320
line 604
;603: 
;604:	} 
LABELV $309
line 607
;605: 
;606:	// pointlimit warning
;607:	if ( cgs.teampointlimit > 0 && cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+214072
INDIRI4
CNSTI4 0
LEI4 $384
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $384
line 610
;608:			
;609:		// only caculate for the team W/ higher points
;610:		if ( cgs.scores1 > cgs.scores2 )
ADDRGP4 cgs+32492
INDIRI4
ADDRGP4 cgs+32496
INDIRI4
LEI4 $388
line 611
;611:			highScore = cgs.scores1;
ADDRLP4 16
ADDRGP4 cgs+32492
INDIRI4
ASGNI4
ADDRGP4 $389
JUMPV
LABELV $388
line 613
;612:		else
;613:			highScore = cgs.scores2;
ADDRLP4 16
ADDRGP4 cgs+32496
INDIRI4
ASGNI4
LABELV $389
line 615
;614:
;615:		if ( !( cg.fraglimitWarnings & 4 ) && highScore == cgs.teampointlimit ) {
ADDRGP4 cg+107620
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $394
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+214072
INDIRI4
NEI4 $394
line 616
;616:			cg.fraglimitWarnings |= 1 | 2 | 4;
ADDRLP4 40
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 617
;617:			CG_AddBufferedSound( trap_S_RegisterSound("sound/commentary/pt_limithit.wav",qfalse) );
ADDRGP4 $399
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 618
;618:		}
ADDRGP4 $395
JUMPV
LABELV $394
line 619
;619:		else if ( !( cg.fraglimitWarnings & 2 ) && highScore == (cgs.teampointlimit - 1) ) {
ADDRGP4 cg+107620
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $400
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+214072
INDIRI4
CNSTI4 1
SUBI4
NEI4 $400
line 620
;620:			cg.fraglimitWarnings |= 1 | 2 ;
ADDRLP4 40
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 621
;621:			CG_AddBufferedSound( trap_S_RegisterSound("sound/commentary/one_ptleft.wav",qfalse) );
ADDRGP4 $405
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 622
;622:		}
ADDRGP4 $401
JUMPV
LABELV $400
line 623
;623:		else if ( cgs.fraglimit > 2 && !( cg.fraglimitWarnings & 1 ) && highScore == (cgs.teampointlimit - 2) ) {
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 40
INDIRI4
LEI4 $406
ADDRGP4 cg+107620
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $406
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+214072
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
NEI4 $406
line 624
;624:			cg.fraglimitWarnings |= 1 ;
ADDRLP4 44
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 625
;625:			CG_AddBufferedSound( trap_S_RegisterSound("sound/commentary/two_ptleft.wav",qfalse) );
ADDRGP4 $412
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 626
;626:		} 
LABELV $406
LABELV $401
LABELV $395
line 627
;627:	}
LABELV $384
line 647
;628:
;629:	// fraglimit warnings
;630:	/*
;631:	 else if ( cgs.fraglimit > 0 && cgs.gametype < GT_TEAM) {
;632:		highScore = cgs.scores1;
;633:		if ( !( cg.fraglimitWarnings & 4 ) && highScore == (cgs.fraglimit - 1) ) {
;634:			cg.fraglimitWarnings |= 1 | 2 | 4;
;635:			CG_AddBufferedSound(cgs.media.oneFragSound);
;636:		}
;637:		else if ( cgs.fraglimit > 2 && !( cg.fraglimitWarnings & 2 ) && highScore == (cgs.fraglimit - 2) ) {
;638:			cg.fraglimitWarnings |= 1 | 2;
;639:			CG_AddBufferedSound(cgs.media.twoFragSound);
;640:		}
;641:		else if ( cgs.fraglimit > 3 && !( cg.fraglimitWarnings & 1 ) && highScore == (cgs.fraglimit - 3) ) {
;642:			cg.fraglimitWarnings |= 1;
;643:			CG_AddBufferedSound(cgs.media.threeFragSound);
;644:		}
;645:	}
;646:	 DISABLED */
;647:}
LABELV $237
endproc CG_CheckLocalSounds 1608 12
export CG_TransitionPlayerState
proc CG_TransitionPlayerState 232 16
line 658
;648:
;649:int CG_ButtonPushed ( int button );
;650:extern	vmCvar_t	cg_newbeeHeight;
;651:
;652:/*
;653:===============
;654:CG_TransitionPlayerState
;655:
;656:===============
;657:*/
;658:void CG_TransitionPlayerState( playerState_t *ps, playerState_t *ops ) {
line 660
;659:	// check for changing follow mode
;660:	if ( ps->clientNum != ops->clientNum ) {
ADDRLP4 0
CNSTI4 140
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
EQI4 $414
line 661
;661:		cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 662
;662:		cg.predictedPlayerEntity.pe.hand_weapon.animation = NULL;
ADDRGP4 cg+108104+472+104+40
CNSTP4 0
ASGNP4
line 664
;663:		// clear all these flashbang related values
;664:		cg.flashedVision_x = 0;
ADDRGP4 cg+116300
CNSTI4 0
ASGNI4
line 665
;665:		cg.flashedVision_y = 0;
ADDRGP4 cg+116304
CNSTI4 0
ASGNI4
line 666
;666:		cg.flashedVisionTime = 0;
ADDRGP4 cg+116296
CNSTI4 0
ASGNI4
line 667
;667:		cg.FlashTime = 0;
ADDRGP4 cg+116284
CNSTI4 0
ASGNI4
line 668
;668:		cg.ConcussionTime = 0;
ADDRGP4 cg+116288
CNSTI4 0
ASGNI4
line 669
;669:		cg.damageTime = 0;
ADDRGP4 cg+115312
CNSTF4 0
ASGNF4
line 670
;670:		cg.DeafTime = 0;
ADDRGP4 cg+116292
CNSTI4 0
ASGNI4
line 672
;671:		// make sure we don't get any unwanted transition effects
;672:		*ops = *ps;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 468
line 673
;673:	}
LABELV $414
line 676
;674:
;675:	// damage events (player is getting wounded)
;676:	if ( ps->damageEvent != ops->damageEvent && ps->damageCount ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
EQI4 $428
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
line 677
;677:		CG_DamageFeedback( ps->damageYaw, ps->damagePitch, ps->damageCount, 500 );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
CNSTI4 500
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
line 678
;678:	}
LABELV $428
line 680
;679:
;680:	if ( ps->pm_flags & PMF_FOLLOW && !(ops->pm_flags & PMF_FOLLOW) )
ADDRLP4 12
CNSTI4 12
ASGNI4
ADDRLP4 16
CNSTI4 4096
ASGNI4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $430
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $430
line 681
;681:	{
line 682
;682:		cg.predictedPlayerEntity.pe.hand_weapon.animation = NULL;
ADDRGP4 cg+108104+472+104+40
CNSTP4 0
ASGNP4
line 683
;683:	}
LABELV $430
line 685
;684:	// respawning
;685:	if ( ps->persistant[PERS_SPAWN_COUNT] != ops->persistant[PERS_SPAWN_COUNT] ) {
ADDRLP4 24
CNSTI4 264
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
EQI4 $436
line 686
;686:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 687
;687:	}
LABELV $436
line 689
;688:
;689:	if( ps->stats[STAT_HEALTH] <= 0 && ops->stats[STAT_HEALTH] > 0 )
ADDRLP4 28
CNSTI4 184
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $438
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $438
line 690
;690:	{
line 692
;691:		// set death time
;692:		cg.deathTime = cg.time; 
ADDRGP4 cg+201984
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 694
;693:		// the game is over for us, allow to change xp
;694:		trap_Cvar_Set("ui_gamestate", va("%i", STATE_OVER));
ADDRGP4 $255
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $442
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 695
;695:	}
LABELV $438
line 697
;696:
;697:	if ( cg.mapRestart ) {
ADDRGP4 cg+107624
INDIRI4
CNSTI4 0
EQI4 $443
line 698
;698:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 699
;699:		cg.mapRestart = qfalse;
ADDRGP4 cg+107624
CNSTI4 0
ASGNI4
line 700
;700:	}
LABELV $443
line 702
;701:
;702:	if ( cg.snap->ps.pm_type != PM_INTERMISSION 
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $447
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
EQI4 $447
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $447
line 704
;703:		&& ps->persistant[PERS_TEAM] != TEAM_SPECTATOR
;704:		&& !(ps->pm_flags & PMF_FOLLOW) ) {
line 705
;705:		CG_CheckLocalSounds( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSounds
CALLV
pop
line 706
;706:	}
LABELV $447
line 708
;707:
;708:	if ( ps->stats[STAT_CHEST_DAMAGE] != ops->stats[STAT_CHEST_DAMAGE] )		
ADDRLP4 40
CNSTI4 208
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
EQI4 $450
line 709
;709:		cg.flashDmgLocTime[0] = cg.time + 1000;
ADDRGP4 cg+117948
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
LABELV $450
line 710
;710: 	if ( ps->stats[STAT_STOMACH_DAMAGE] != ops->stats[STAT_STOMACH_DAMAGE] )
ADDRLP4 44
CNSTI4 212
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
EQI4 $454
line 711
;711:		cg.flashDmgLocTime[1] = cg.time + 1000; 
ADDRGP4 cg+117948+4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
LABELV $454
line 712
;712:	if ( ps->stats[STAT_ARM_DAMAGE] != ops->stats[STAT_ARM_DAMAGE] )
ADDRLP4 48
CNSTI4 200
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
EQI4 $459
line 713
;713:		cg.flashDmgLocTime[2] = cg.time + 1000;
ADDRGP4 cg+117948+8
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
LABELV $459
line 714
;714:	if ( ps->stats[STAT_LEG_DAMAGE] != ops->stats[STAT_LEG_DAMAGE] ) 
ADDRLP4 52
CNSTI4 204
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
EQI4 $464
line 715
;715:		cg.flashDmgLocTime[3] = cg.time + 1000; 
ADDRGP4 cg+117948+12
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
LABELV $464
line 716
;716:	if ( ps->stats[STAT_HEAD_DAMAGE] != ops->stats[STAT_HEAD_DAMAGE] )
ADDRLP4 56
CNSTI4 216
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
EQI4 $469
line 717
;717:		cg.flashDmgLocTime[4] = cg.time + 1000; 
ADDRGP4 cg+117948+16
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
LABELV $469
line 719
;718:
;719:	if ( ps->pm_type == PM_NORMAL )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $474
line 720
;720:	{
line 721
;721:		if ( BG_GotWeapon( WP_C4, ps->stats ) && !BG_GotWeapon( WP_C4, ops->stats ) && !cg.ns_newbiehelp.w_gotBomb )
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 60
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $476
CNSTI4 3
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $476
ADDRGP4 cg+116724
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $476
line 722
;722:		{ 
line 723
;723:			CG_NewbieMessage(S_COLOR_GREEN "You've got the c4-bomb.\nSelect it from your inventory and go to the defuse point and arm it.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $479
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 724
;724:			cg.ns_newbiehelp.w_gotBomb = qtrue;
ADDRGP4 cg+116724
CNSTI4 1
ASGNI4
line 725
;725:		}
LABELV $476
line 726
;726:		if ( ps->pm_flags & PMF_BOMBRANGE && !(ops->pm_flags & PMF_BOMBRANGE) && !cg.ns_newbiehelp.w_bombRange )
ADDRLP4 72
CNSTI4 12
ASGNI4
ADDRLP4 76
CNSTI4 1024
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $482
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $482
ADDRGP4 cg+116724+4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $482
line 727
;727:		{
line 728
;728:			cg.ns_newbiehelp.w_bombRange = qtrue;
ADDRGP4 cg+116724+4
CNSTI4 1
ASGNI4
line 729
;729:			CG_NewbieMessage(S_COLOR_GREEN"You're in an bomb-field.\nThe bomb has to be placed here.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $488
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 730
;730:		}
LABELV $482
line 732
;731:
;732:		if ( ps->eFlags & EF_VIP && !(ops->eFlags & EF_VIP) && !cg.ns_newbiehelp.w_vipTime && cgs.mi_vipTime )
ADDRLP4 84
CNSTI4 104
ASGNI4
ADDRLP4 88
CNSTI4 2048
ASGNI4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $490
ADDRFP4 4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $490
ADDRGP4 cg+116724+16
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $490
ADDRGP4 cgs+214180
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $490
line 733
;733:		{
line 734
;734:			cg.ns_newbiehelp.w_vipTime = qtrue;
ADDRGP4 cg+116724+16
CNSTI4 1
ASGNI4
line 735
;735:			CG_NewbieMessage(S_COLOR_GREEN"You are the V.I.P.\nHide yourself until the round is over.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $497
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 736
;736:		}
ADDRGP4 $491
JUMPV
LABELV $490
line 737
;737:		else if ( ps->eFlags & EF_VIP && !(ops->eFlags & EF_VIP) && !cg.ns_newbiehelp.w_vipRescue && cgs.mi_vipRescue )
ADDRLP4 96
CNSTI4 104
ASGNI4
ADDRLP4 100
CNSTI4 2048
ASGNI4
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
BANDI4
ADDRLP4 104
INDIRI4
EQI4 $499
ADDRFP4 4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
BANDI4
ADDRLP4 104
INDIRI4
NEI4 $499
ADDRGP4 cg+116724+20
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $499
ADDRGP4 cgs+214176
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $499
line 738
;738:		{
line 739
;739:			cg.ns_newbiehelp.w_vipRescue = qtrue;
ADDRGP4 cg+116724+20
CNSTI4 1
ASGNI4
line 740
;740:			CG_NewbieMessage(S_COLOR_GREEN"You are the V.I.P.\nFollow your team to the extraction point.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $506
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 741
;741:		}
LABELV $499
LABELV $491
line 743
;742:
;743:		if ( ps->stats[STAT_ROUNDS] >  ops->stats[STAT_ROUNDS] && ( ps->weaponstate == WEAPON_RELOADING || ps->weaponstate == WEAPON_RELOADING_EMPTY ) && BG_IsRifle( ps->weapon ) && BG_IsRifle( ops->weapon ) && ps->weapon == ops->weapon && !cg.ns_newbiehelp.w_reloadRifle )
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
CNSTI4 236
ASGNI4
ADDRLP4 108
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
LEI4 $508
ADDRLP4 116
ADDRLP4 108
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 7
EQI4 $512
ADDRLP4 116
INDIRI4
CNSTI4 10
NEI4 $508
LABELV $512
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $508
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 BG_IsRifle
CALLI4
ASGNI4
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 124
INDIRI4
ADDRLP4 128
INDIRI4
EQI4 $508
ADDRLP4 132
CNSTI4 144
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRI4
NEI4 $508
ADDRGP4 cg+116724+28
INDIRI4
ADDRLP4 128
INDIRI4
NEI4 $508
line 744
;744:		{
line 745
;745:			cg.ns_newbiehelp.w_reloadRifle = qtrue;
ADDRGP4 cg+116724+28
CNSTI4 1
ASGNI4
line 746
;746:			CG_NewbieMessage(S_COLOR_GREEN"You can change the firemode of this weapon.\nPush the WEAPONMODE1 key to switch through the avaiable Firemodes.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $515
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 747
;747:		}
ADDRGP4 $509
JUMPV
LABELV $508
line 748
;748:		else if ( ps->stats[STAT_ROUNDS] > ops->stats[STAT_ROUNDS] && ps->weapon != WP_SPAS15 && BG_IsShotgun( ps->weapon ) && ps->weapon == ops->weapon && !cg.ns_newbiehelp.w_reloadShotgun )
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
CNSTI4 236
ASGNI4
ADDRLP4 136
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRI4
LEI4 $517
ADDRLP4 144
ADDRLP4 136
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 21
EQI4 $517
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BG_IsShotgun
CALLI4
ASGNI4
ADDRLP4 152
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $517
ADDRLP4 156
CNSTI4 144
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
NEI4 $517
ADDRGP4 cg+116724+32
INDIRI4
ADDRLP4 152
INDIRI4
NEI4 $517
line 749
;749:		{
line 750
;750:			cg.ns_newbiehelp.w_reloadShotgun = qtrue;
ADDRGP4 cg+116724+32
CNSTI4 1
ASGNI4
line 751
;751:			CG_NewbieMessage(S_COLOR_GREEN "You can break the reloading sequence by holding the ATTACK key.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $523
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 752
;752:		}
LABELV $517
LABELV $509
line 754
;753:		
;754:		if ( ps->stats[STAT_ROUNDS] == 0 && ops->stats[STAT_ROUNDS] == 0 && CG_ButtonPushed( BUTTON_ATTACK ) && !cg.ns_newbiehelp.w_weaponEmpty
ADDRLP4 160
CNSTI4 236
ASGNI4
ADDRLP4 164
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRI4
ADDRLP4 164
INDIRI4
NEI4 $525
ADDRFP4 4
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRI4
ADDRLP4 164
INDIRI4
NEI4 $525
CNSTI4 1
ARGI4
ADDRLP4 168
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRI4
ADDRLP4 172
INDIRI4
EQI4 $525
ADDRGP4 cg+116724+40
INDIRI4
ADDRLP4 172
INDIRI4
NEI4 $525
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 BG_IsGrenade
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $525
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 BG_IsMelee
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $525
line 757
;755:			&& !BG_IsGrenade( cg.snap->ps.weapon )
;756:			&& !BG_IsMelee( cg.snap->ps.weapon ) )
;757:		{
line 758
;758:			cg.ns_newbiehelp.w_weaponEmpty = qtrue;
ADDRGP4 cg+116724+40
CNSTI4 1
ASGNI4
line 759
;759:			CG_NewbieMessage(S_COLOR_GREEN "This weapon is out of rounds.\nTry to reload it using your RELOAD key.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $533
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 760
;760:		}
LABELV $525
line 762
;761:
;762:		if ( ps->powerups[PW_BRIEFCASE] && ops->powerups[PW_BRIEFCASE] == 0 && !(ps->eFlags & EF_VIP) && !cg.ns_newbiehelp.w_gotBriefcase )
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
CNSTI4 344
ASGNI4
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRLP4 184
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRI4
ADDRLP4 192
INDIRI4
EQI4 $535
ADDRFP4 4
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRI4
ADDRLP4 192
INDIRI4
NEI4 $535
ADDRLP4 184
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 192
INDIRI4
NEI4 $535
ADDRGP4 cg+116724+44
INDIRI4
ADDRLP4 192
INDIRI4
NEI4 $535
line 763
;763:		{
line 764
;764:			cg.ns_newbiehelp.w_gotBriefcase = qtrue;
ADDRGP4 cg+116724+44
CNSTI4 1
ASGNI4
line 765
;765:			CG_NewbieMessage(S_COLOR_GREEN "You've got the briefcase.\nBring it to a briefcase capture point.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $541
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 767
;766:
;767:		}
LABELV $535
line 769
;768: 
;769:		if ( ps->stats[STAT_HEALTH] > 0 && ps->stats[STAT_HEALTH] < ops->stats[STAT_HEALTH]-20 && !cg.ns_newbiehelp.w_firstHit )
ADDRLP4 196
CNSTI4 184
ASGNI4
ADDRLP4 200
ADDRFP4 0
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ADDRLP4 204
INDIRI4
LEI4 $543
ADDRLP4 200
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
INDIRI4
CNSTI4 20
SUBI4
GEI4 $543
ADDRGP4 cg+116724+56
INDIRI4
ADDRLP4 204
INDIRI4
NEI4 $543
line 770
;770:		{
line 771
;771:			cg.ns_newbiehelp.w_firstHit = qtrue;
ADDRGP4 cg+116724+56
CNSTI4 1
ASGNI4
line 772
;772:			CG_NewbieMessage(S_COLOR_GREEN "You've been badly injured.\nUse the BANDAGE key to bandage yourself.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $549
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 773
;773:		}
LABELV $543
line 774
;774:		if ( cg.xpPoints > 15 && !cg.ns_newbiehelp.w_gotlotsXp )
ADDRGP4 cg+115708
INDIRI4
CNSTI4 15
LEI4 $551
ADDRGP4 cg+116724+24
INDIRI4
CNSTI4 0
NEI4 $551
line 775
;775:		{
line 776
;776:			cg.ns_newbiehelp.w_gotlotsXp = qtrue;
ADDRGP4 cg+116724+24
CNSTI4 1
ASGNI4
line 777
;777:			CG_NewbieMessage( va( S_COLOR_GREEN "You've got %i XP.\nIt's time to open the playermenu (ESC->PLAYER) to spend them on your abilities", char_xp.integer ) , SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $558
ARGP4
ADDRGP4 char_xp+12
INDIRI4
ARGI4
ADDRLP4 208
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 208
INDIRP4
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 778
;778:		}
LABELV $551
line 779
;779:		if ( ps->pm_flags & PMF_ASSAULTRANGE && !(ops->pm_flags & PMF_ASSAULTRANGE) && !cg.ns_newbiehelp.w_assaultRange )
ADDRLP4 208
CNSTI4 12
ASGNI4
ADDRLP4 212
CNSTI4 32768
ASGNI4
ADDRLP4 216
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
BANDI4
ADDRLP4 216
INDIRI4
EQI4 $561
ADDRFP4 4
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
BANDI4
ADDRLP4 216
INDIRI4
NEI4 $561
ADDRGP4 cg+116724+36
INDIRI4
ADDRLP4 216
INDIRI4
NEI4 $561
line 780
;780:		{
line 781
;781:			cg.ns_newbiehelp.w_assaultRange = qtrue;
ADDRGP4 cg+116724+36
CNSTI4 1
ASGNI4
line 782
;782:			CG_NewbieMessage(S_COLOR_GREEN "You're in an assault field.\nTry to tap it by staying inside it until it's timer runs out.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $567
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 783
;783:		} 
LABELV $561
line 784
;784:		if ( ps->pm_flags & PMF_BLOCKED && !(ops->pm_flags & PMF_BLOCKED) && !cg.ns_newbiehelp.w_assaultBlocked )
ADDRLP4 220
CNSTI4 12
ASGNI4
ADDRLP4 224
CNSTI4 128
ASGNI4
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRI4
ADDRLP4 224
INDIRI4
BANDI4
ADDRLP4 228
INDIRI4
EQI4 $569
ADDRFP4 4
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRI4
ADDRLP4 224
INDIRI4
BANDI4
ADDRLP4 228
INDIRI4
NEI4 $569
ADDRGP4 cg+116724+60
INDIRI4
ADDRLP4 228
INDIRI4
NEI4 $569
line 785
;785:		{
line 786
;786:			cg.ns_newbiehelp.w_assaultBlocked = qtrue;
ADDRGP4 cg+116724+60
CNSTI4 1
ASGNI4
line 787
;787:			CG_NewbieMessage(S_COLOR_GREEN "This assault field has been blocked, because an enemy player is inside of it.", SCREEN_HEIGHT * 0.60, cg_newbeeHeight.value );
ADDRGP4 $575
ARGP4
CNSTI4 287
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
ARGF4
ADDRGP4 CG_NewbieMessage
CALLV
pop
line 788
;788:		} 
LABELV $569
line 790
;789:
;790:	}
LABELV $474
line 797
;791:#if 0 
;792:	// check for going low on ammo
;793:	CG_CheckAmmo();
;794:#endif
;795:
;796:	// run events
;797:	CG_CheckPlayerstateEvents( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckPlayerstateEvents
CALLV
pop
line 800
;798:
;799:	// smooth the ducking viewheight change
;800:	if ( ps->viewheight != ops->viewheight ) {
ADDRLP4 60
CNSTI4 164
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
EQI4 $577
line 801
;801:		cg.duckChange = ps->viewheight - ops->viewheight;
ADDRLP4 64
CNSTI4 164
ASGNI4
ADDRGP4 cg+108928
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 802
;802:		cg.duckTime = cg.time;
ADDRGP4 cg+108932
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 803
;803:	}
LABELV $577
line 805
;804:
;805:}
LABELV $413
endproc CG_TransitionPlayerState 232 16
import CG_ButtonPushed
import eventnames
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
LABELV $575
byte 1 94
byte 1 50
byte 1 84
byte 1 104
byte 1 105
byte 1 115
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
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 101
byte 1 99
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $567
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 110
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
byte 1 46
byte 1 10
byte 1 84
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 105
byte 1 116
byte 1 39
byte 1 115
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $558
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 88
byte 1 80
byte 1 46
byte 1 10
byte 1 73
byte 1 116
byte 1 39
byte 1 115
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 40
byte 1 69
byte 1 83
byte 1 67
byte 1 45
byte 1 62
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 41
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $549
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 106
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 65
byte 1 78
byte 1 68
byte 1 65
byte 1 71
byte 1 69
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 100
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 0
align 1
LABELV $541
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 10
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $533
byte 1 94
byte 1 50
byte 1 84
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
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 84
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 82
byte 1 69
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 46
byte 1 0
align 1
LABELV $523
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 65
byte 1 84
byte 1 84
byte 1 65
byte 1 67
byte 1 75
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 46
byte 1 0
align 1
LABELV $515
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 111
byte 1 102
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
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 49
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $506
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 86
byte 1 46
byte 1 73
byte 1 46
byte 1 80
byte 1 46
byte 1 10
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
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
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $497
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 86
byte 1 46
byte 1 73
byte 1 46
byte 1 80
byte 1 46
byte 1 10
byte 1 72
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $488
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 45
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 46
byte 1 10
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $479
byte 1 94
byte 1 50
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 52
byte 1 45
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 46
byte 1 10
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 103
byte 1 111
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $442
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
LABELV $412
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
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 112
byte 1 116
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $405
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
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 112
byte 1 116
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $399
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
byte 1 112
byte 1 116
byte 1 95
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $383
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
byte 1 116
byte 1 119
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $378
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
byte 1 111
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $373
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
byte 1 51
byte 1 48
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $368
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
byte 1 49
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $363
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
byte 1 57
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $358
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
byte 1 56
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $353
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
byte 1 55
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $348
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
byte 1 54
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $343
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
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $338
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
byte 1 52
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $333
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
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $328
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
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $323
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
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $318
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
byte 1 114
byte 1 116
byte 1 95
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $294
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $293
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $292
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $291
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $290
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 95
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $275
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $274
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $273
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $272
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $271
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $270
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $269
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $268
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $267
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $266
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 95
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $255
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $250
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
LABELV $249
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
LABELV $248
byte 1 117
byte 1 105
byte 1 95
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
LABELV $247
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
LABELV $236
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
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
LABELV $203
byte 1 59
byte 1 32
byte 1 45
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 59
byte 1 0
