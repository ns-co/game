export InitTrigger
code
proc InitTrigger 12 8
file "../g_trigger.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// every line of code that differs from the quake3:arena SDK
;4:// is property of manfred nerurkar
;5:// no commercial explotation allowed
;6:// you are only allowed to use this code in navy seals: covert operations 
;7:// a quake3 arena modifiation
;8:// defcon-x@ns-co.net
;9:
;10:#include "g_local.h"
;11:
;12:
;13:void InitTrigger( gentity_t *self ) {
line 14
;14:	if (!VectorCompare (self->s.angles, vec3_origin))
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $69
line 15
;15:		G_SetMovedir (self->s.angles, self->movedir);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
LABELV $69
line 17
;16:
;17:	trap_SetBrushModel( self, self->model );
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
line 18
;18:	self->r.contents = CONTENTS_TRIGGER;		// replaces the -1 from trap_SetBrushModel
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 19
;19:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 20
;20:}
LABELV $68
endproc InitTrigger 12 8
export multi_wait
proc multi_wait 0 0
line 24
;21:
;22:
;23:// the wait time has passed, so set back up for another activation
;24:void multi_wait( gentity_t *ent ) {
line 25
;25:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 26
;26:}
LABELV $71
endproc multi_wait 0 0
export multi_trigger
proc multi_trigger 12 8
line 32
;27:
;28:
;29:// the trigger was just activated
;30:// ent->activator should be set to the activator so it can be held through a delay
;31:// so wait for the delay time before firing
;32:void multi_trigger( gentity_t *ent, gentity_t *activator ) {
line 33
;33:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 34
;34:	if ( ent->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $73
line 35
;35:		return;		// can't retrigger until the wait is over
ADDRGP4 $72
JUMPV
LABELV $73
line 38
;36:	}
;37:
;38:	if ( activator->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $75
line 39
;39:		if ( ( ent->spawnflags & 1 ) &&
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $77
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $77
line 40
;40:			activator->client->sess.sessionTeam != TEAM_RED ) {
line 41
;41:			return;
ADDRGP4 $72
JUMPV
LABELV $77
line 43
;42:		}
;43:		if ( ( ent->spawnflags & 2 ) &&
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $79
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
EQI4 $79
line 44
;44:			activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 45
;45:			return;
ADDRGP4 $72
JUMPV
LABELV $79
line 47
;46:		}
;47:	}
LABELV $75
line 49
;48:
;49:	G_UseTargets (ent, ent->activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 51
;50:
;51:	if ( ent->wait > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
LEF4 $81
line 52
;52:		ent->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 53
;53:		ent->nextthink = level.time + ( ent->wait + ent->random * crandom() ) * 1000;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
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
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 4
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
ADDF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 54
;54:	} else {
ADDRGP4 $82
JUMPV
LABELV $81
line 57
;55:		// we can't just remove (self) here, because this is a touch function
;56:		// called while looping through area links...
;57:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTP4 0
ASGNP4
line 58
;58:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 59
;59:		ent->think = trap_UnlinkEntity;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 trap_UnlinkEntity
ASGNP4
line 61
;60:		// defcon don't free, unlink so we can relink it later. 
;61:	}
LABELV $82
line 62
;62:}
LABELV $72
endproc multi_trigger 12 8
export Use_Multi
proc Use_Multi 0 8
line 64
;63:
;64:void Use_Multi( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 65
;65:	multi_trigger( ent, activator );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 66
;66:}
LABELV $85
endproc Use_Multi 0 8
export Touch_Multi
proc Touch_Multi 0 8
line 68
;67:
;68:void Touch_Multi( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 69
;69:	if( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $87
line 70
;70:		return;
ADDRGP4 $86
JUMPV
LABELV $87
line 72
;71:	}
;72:	multi_trigger( self, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 73
;73:} 
LABELV $86
endproc Touch_Multi 0 8
export SP_trigger_multiple
proc SP_trigger_multiple 12 12
line 81
;74:/*QUAKED trigger_multiple (.5 .5 .5) ?
;75:"wait" : Seconds between triggerings, 0.5 default, -1 = one time only.
;76:"random"	wait variance, default is 0
;77:Variable sized repeatable trigger.  Must be targeted at one or more entities.
;78:so, the basic time between firing is a random time between
;79:(wait - random) and (wait + random)
;80:*/
;81:void SP_trigger_multiple( gentity_t *ent ) {
line 82
;82:	G_SpawnFloat( "wait", "0.5", &ent->wait );
ADDRGP4 $90
ARGP4
ADDRGP4 $91
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 83
;83:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $92
ARGP4
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 85
;84:
;85:	if ( ent->random >= ent->wait && ent->wait >= 0 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
LTF4 $94
ADDRLP4 4
INDIRF4
CNSTF4 0
LTF4 $94
line 86
;86:		ent->random = ent->wait - FRAMETIME;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 87
;87:		G_Printf( "trigger_multiple has random >= wait\n" );
ADDRGP4 $96
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 88
;88:	}
LABELV $94
line 90
;89:
;90:	ent->touch = Touch_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Multi
ASGNP4
line 91
;91:	ent->use = Use_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Multi
ASGNP4
line 93
;92:
;93:	InitTrigger( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 94
;94:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 95
;95:}
LABELV $89
endproc SP_trigger_multiple 12 12
export trigger_always_think
proc trigger_always_think 4 8
line 107
;96:
;97:
;98:
;99:/*
;100:==============================================================================
;101:
;102:trigger_always
;103:
;104:==============================================================================
;105:*/
;106:
;107:void trigger_always_think( gentity_t *ent ) {
line 108
;108:	G_UseTargets(ent, ent);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 109
;109:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 110
;110:}
LABELV $97
endproc trigger_always_think 4 8
export SP_trigger_always
proc SP_trigger_always 0 0
line 115
;111:
;112:/*QUAKED trigger_always (.5 .5 .5) (-8 -8 -8) (8 8 8)
;113:This trigger will always fire.  It is activated by the world.
;114:*/
;115:void SP_trigger_always (gentity_t *ent) {
line 117
;116:	// we must have some delay to make sure our use targets are present
;117:	ent->nextthink = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 118
;118:	ent->think = trigger_always_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 trigger_always_think
ASGNP4
line 119
;119:}
LABELV $98
endproc SP_trigger_always 0 0
export trigger_push_touch
proc trigger_push_touch 0 8
line 130
;120:
;121:
;122:/*
;123:==============================================================================
;124:
;125:trigger_push
;126:
;127:==============================================================================
;128:*/
;129:
;130:void trigger_push_touch (gentity_t *self, gentity_t *other, trace_t *trace ) {
line 132
;131:
;132:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
line 133
;133:		return;
ADDRGP4 $100
JUMPV
LABELV $101
line 136
;134:	}
;135:
;136:	BG_TouchJumpPad( &other->client->ps, &self->s );
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 137
;137:}
LABELV $100
endproc trigger_push_touch 0 8
export AimAtTarget
proc AimAtTarget 72 4
line 147
;138:
;139:
;140:/*
;141:=================
;142:AimAtTarget
;143:
;144:Calculate origin2 so the target apogee will be hit
;145:=================
;146:*/
;147:void AimAtTarget( gentity_t *self ) {
line 153
;148:	gentity_t	*ent;
;149:	vec3_t		origin;
;150:	float		height, gravity, time, forward;
;151:	float		dist;
;152:
;153:	VectorAdd( self->r.absmin, self->r.absmax, origin );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 154
;154:	VectorScale ( origin, 0.5, origin );
ADDRLP4 44
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 156
;155:
;156:	ent = G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 48
INDIRP4
ASGNP4
line 157
;157:	if ( !ent ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $110
line 158
;158:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 159
;159:		return;
ADDRGP4 $103
JUMPV
LABELV $110
line 162
;160:	}
;161:
;162:	height = ent->s.origin[2] - origin[2];
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 163
;163:	gravity = g_gravity.value;
ADDRLP4 24
ADDRGP4 g_gravity+8
INDIRF4
ASGNF4
line 164
;164:	time = sqrt( height / ( .5 * gravity ) );
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 52
INDIRF4
ASGNF4
line 165
;165:	if ( !time ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $114
line 166
;166:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 167
;167:		return;
ADDRGP4 $103
JUMPV
LABELV $114
line 171
;168:	}
;169:
;170:	// set s.origin2 to the push velocity
;171:	VectorSubtract ( ent->s.origin, origin, self->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 172
;172:	self->s.origin2[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 0
ASGNF4
line 173
;173:	dist = VectorNormalize( self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 175
;174:
;175:	forward = dist / time;
ADDRLP4 20
ADDRLP4 32
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 176
;176:	VectorScale( self->s.origin2, forward, self->s.origin2 );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 178
;177:
;178:	self->s.origin2[2] = time * gravity;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 179
;179:}
LABELV $103
endproc AimAtTarget 72 4
export SP_trigger_push
proc SP_trigger_push 4 4
line 188
;180:
;181:
;182:/*
;183:QUAKED trigger_push (.5 .5 .5) ?
;184:
;185:Must point at a target_position, which will be the apex of the leap.
;186:This will be client side predicted, unlike target_push
;187:*/
;188:void SP_trigger_push( gentity_t *self ) {
line 189
;189:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 192
;190:
;191:	// unlike other triggers, we need to send this one to the client
;192:	self->r.svFlags &= ~SVF_NOCLIENT;
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
line 194
;193:
;194:	self->s.eType = ET_PUSH_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 8
ASGNI4
line 195
;195:	self->touch = trigger_push_touch;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 trigger_push_touch
ASGNP4
line 196
;196:	self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 197
;197:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 198
;198:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 199
;199:}
LABELV $118
endproc SP_trigger_push 4 4
export Use_target_push
proc Use_target_push 0 12
line 202
;200:
;201:
;202:void Use_target_push( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 203
;203:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $121
line 204
;204:		return;
ADDRGP4 $120
JUMPV
LABELV $121
line 207
;205:	}
;206:
;207:	if ( activator->client->ps.pm_type != PM_NORMAL ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $123
line 208
;208:		return;
ADDRGP4 $120
JUMPV
LABELV $123
line 214
;209:	}
;210:/*	if ( activator->client->ps.powerups[PW_FLIGHT] ) {
;211:		return;
;212:	}
;213:*/
;214:	VectorCopy (self->s.origin2, activator->client->ps.velocity);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 217
;215:
;216:	// play fly sound every 1.5 seconds
;217:	if ( activator->fly_sound_debounce_time < level.time ) {
ADDRFP4 8
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $125
line 218
;218:		activator->fly_sound_debounce_time = level.time + 1500;
ADDRFP4 8
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 219
;219:		G_Sound( activator, CHAN_AUTO, self->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 220
;220:	}
LABELV $125
line 221
;221:}
LABELV $120
endproc Use_target_push 0 12
export SP_target_push
proc SP_target_push 36 8
line 228
;222:
;223:/*QUAKED target_push (.5 .5 .5) (-8 -8 -8) (8 8 8) bouncepad
;224:Pushes the activator in the direction.of angle, or towards a target apex.
;225:"speed"		defaults to 1000
;226:if "bouncepad", play bounce noise instead of windfly
;227:*/
;228:void SP_target_push( gentity_t *self ) {
line 229
;229:	if (!self->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $130
line 230
;230:		self->speed = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1148846080
ASGNF4
line 231
;231:	}
LABELV $130
line 232
;232:	G_SetMovedir (self->s.angles, self->s.origin2);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 233
;233:	VectorScale (self->s.origin2, self->speed, self->s.origin2);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
line 235
;234:
;235:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $132
line 236
;236:		self->noise_index = G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $134
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 237
;237:	} else {
ADDRGP4 $133
JUMPV
LABELV $132
line 238
;238:		self->noise_index = G_SoundIndex("sound/misc/windfly.wav");
ADDRGP4 $135
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 239
;239:	}
LABELV $133
line 240
;240:	if ( self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $136
line 241
;241:		VectorCopy( self->s.origin, self->r.absmin );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 464
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 242
;242:		VectorCopy( self->s.origin, self->r.absmax );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 243
;243:		self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 244
;244:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 245
;245:	}
LABELV $136
line 246
;246:	self->use = Use_target_push;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_target_push
ASGNP4
line 247
;247:}
LABELV $129
endproc SP_target_push 36 8
export trigger_teleporter_touch
proc trigger_teleporter_touch 12 12
line 257
;248:
;249:/*
;250:==============================================================================
;251:
;252:trigger_teleport
;253:
;254:==============================================================================
;255:*/
;256:
;257:void trigger_teleporter_touch (gentity_t *self, gentity_t *other, trace_t *trace ) {
line 260
;258:	gentity_t	*dest;
;259:
;260:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $140
line 261
;261:		return;
ADDRGP4 $139
JUMPV
LABELV $140
line 263
;262:	}
;263:	if ( other->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $142
line 264
;264:		return;
ADDRGP4 $139
JUMPV
LABELV $142
line 267
;265:	}
;266:	// Spectators only?
;267:	if ( ( self->spawnflags & 1 ) && 
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $144
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $144
line 268
;268:		other->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 269
;269:		return;
ADDRGP4 $139
JUMPV
LABELV $144
line 273
;270:	}
;271:
;272:
;273:	dest = 	G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 274
;274:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $146
line 275
;275:		G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $148
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 276
;276:		return;
ADDRGP4 $139
JUMPV
LABELV $146
line 279
;277:	}
;278:
;279:	TeleportPlayer( other, dest->s.origin, dest->s.angles );
ADDRFP4 4
INDIRP4
ARGP4
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
ADDRGP4 TeleportPlayer
CALLV
pop
line 280
;280:}
LABELV $139
endproc trigger_teleporter_touch 12 12
export SP_trigger_teleport
proc SP_trigger_teleport 4 4
line 291
;281:
;282:
;283:/*QUAKED trigger_teleport (.5 .5 .5) ? SPECTATOR
;284:Allows client side prediction of teleportation events.
;285:Must point at a target_position, which will be the teleport destination.
;286:
;287:If spectator is set, only spectators can use this teleport
;288:Spectator teleporters are not normally placed in the editor, but are created
;289:automatically near doors to allow spectators to move through them
;290:*/
;291:void SP_trigger_teleport( gentity_t *self ) {
line 292
;292:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 296
;293:
;294:	// unlike other triggers, we need to send this one to the client
;295:	// unless is a spectator trigger
;296:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $150
line 297
;297:		self->r.svFlags |= SVF_NOCLIENT;
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
line 298
;298:	} else {
ADDRGP4 $151
JUMPV
LABELV $150
line 299
;299:		self->r.svFlags &= ~SVF_NOCLIENT;
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
line 300
;300:	}
LABELV $151
line 303
;301:
;302:	// make sure the client precaches this sound
;303:	G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $134
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 305
;304:
;305:	self->s.eType = ET_TELEPORT_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 9
ASGNI4
line 306
;306:	self->touch = trigger_teleporter_touch;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 trigger_teleporter_touch
ASGNP4
line 308
;307:
;308:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 309
;309:}
LABELV $149
endproc SP_trigger_teleport 4 4
export hurt_use
proc hurt_use 0 4
line 334
;310:
;311:
;312:/*
;313:==============================================================================
;314:
;315:trigger_hurt
;316:
;317:==============================================================================
;318:*/
;319:
;320:/*QUAKED trigger_hurt (.5 .5 .5) ? START_OFF TOGGABLE SILENT NO_PROTECTION SLOW
;321:Any entity that touches this will be hurt.
;322:It does dmg points of damage each server frame
;323:Targeting the trigger will toggle its on / off state.
;324:
;325:SILENT			supresses playing the sound
;326:SLOW			changes the damage rate to once per second
;327:NO_PROTECTION	*nothing* stops the damage
;328:START_OFF		starts deactivated
;329:TOGGABLE		it can be triggered on / off
;330:
;331:"dmg"			default 5 (whole numbers only)
;332:
;333:*/
;334:void hurt_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 335
;335:	if ( self->r.linked ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $153
line 336
;336:		trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 337
;337:	} else {
ADDRGP4 $154
JUMPV
LABELV $153
line 338
;338:		trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 339
;339:	}
LABELV $154
line 340
;340:}
LABELV $152
endproc hurt_use 0 4
export hurt_touch
proc hurt_touch 12 32
line 342
;341:
;342:void hurt_touch( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 345
;343:	int		dflags;
;344:
;345:	if ( !other->takedamage ) {
ADDRFP4 4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $156
line 346
;346:		return;
ADDRGP4 $155
JUMPV
LABELV $156
line 349
;347:	}
;348:
;349:	if ( self->timestamp > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $158
line 350
;350:		return;
ADDRGP4 $155
JUMPV
LABELV $158
line 353
;351:	}
;352:
;353:	if ( self->spawnflags & 16 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $161
line 354
;354:		self->timestamp = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 355
;355:	} else {
ADDRGP4 $162
JUMPV
LABELV $161
line 356
;356:		self->timestamp = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 357
;357:	}
LABELV $162
line 360
;358:
;359:	// play sound
;360:	if ( !(self->spawnflags & 4) ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $165
line 361
;361:		G_Sound( other, CHAN_AUTO, self->noise_index );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 362
;362:	}
LABELV $165
line 364
;363:
;364:	if (self->spawnflags & 8)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $167
line 365
;365:		dflags = DAMAGE_NO_PROTECTION;
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
line 367
;366:	else
;367:		dflags = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $168
line 368
;368:	G_Damage (other, self, self, NULL, NULL, self->damage, dflags, MOD_TRIGGER_HURT);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 G_Damage
CALLI4
pop
line 369
;369:}
LABELV $155
endproc hurt_touch 12 32
export SP_trigger_hurt
proc SP_trigger_hurt 4 4
line 371
;370:
;371:void SP_trigger_hurt( gentity_t *self ) {
line 372
;372:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 374
;373:
;374:	self->noise_index = G_SoundIndex( "sound/world/electro.wav" );
ADDRGP4 $170
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 375
;375:	self->touch = hurt_touch;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 hurt_touch
ASGNP4
line 377
;376:
;377:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $171
line 378
;378:		self->damage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 5
ASGNI4
line 379
;379:	}
LABELV $171
line 381
;380:
;381:	self->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 383
;382:
;383:	if ( self->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $173
line 384
;384:		self->use = hurt_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 hurt_use
ASGNP4
line 385
;385:	}
LABELV $173
line 388
;386:
;387:	// link in to the world if starting active
;388:	if ( ! (self->spawnflags & 1) ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $175
line 389
;389:		trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 390
;390:	}
LABELV $175
line 391
;391:}
LABELV $169
endproc SP_trigger_hurt 4 4
export func_timer_think
proc func_timer_think 12 8
line 414
;392:
;393:
;394:/*
;395:==============================================================================
;396:
;397:timer
;398:
;399:==============================================================================
;400:*/
;401:
;402:
;403:/*QUAKED func_timer (0.3 0.1 0.6) (-8 -8 -8) (8 8 8) START_ON
;404:This should be renamed trigger_timer...
;405:Repeatedly fires its targets.
;406:Can be turned on or off by using.
;407:
;408:"wait"			base time between triggering all targets, default is 1
;409:"random"		wait variance, default is 0
;410:so, the basic time between firing is a random time between
;411:(wait - random) and (wait + random)
;412:
;413:*/
;414:void func_timer_think( gentity_t *self ) {
line 415
;415:	G_UseTargets (self, self->activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 417
;416:	// set time before next firing
;417:	self->nextthink = level.time + 1000 * ( self->wait + crandom() * self->random );
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
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
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 4
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
MULF4
ADDF4
CVFI4 4
ASGNI4
line 418
;418:}
LABELV $177
endproc func_timer_think 12 8
export func_timer_use
proc func_timer_use 0 4
line 420
;419:
;420:void func_timer_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 421
;421:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 424
;422:
;423:	// if on, turn it off
;424:	if ( self->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $180
line 425
;425:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 426
;426:		return;
ADDRGP4 $179
JUMPV
LABELV $180
line 430
;427:	}
;428:
;429:	// turn it on
;430:	func_timer_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 func_timer_think
CALLV
pop
line 431
;431:}
LABELV $179
endproc func_timer_use 0 4
export SP_func_timer
proc SP_func_timer 12 12
line 433
;432:
;433:void SP_func_timer( gentity_t *self ) {
line 434
;434:	G_SpawnFloat( "random", "1", &self->random);
ADDRGP4 $92
ARGP4
ADDRGP4 $183
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 435
;435:	G_SpawnFloat( "wait", "1", &self->wait );
ADDRGP4 $90
ARGP4
ADDRGP4 $183
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 437
;436:
;437:	self->use = func_timer_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 func_timer_use
ASGNP4
line 438
;438:	self->think = func_timer_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 func_timer_think
ASGNP4
line 440
;439:
;440:	if ( self->random >= self->wait ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
LTF4 $184
line 441
;441:		self->random = self->wait - FRAMETIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 442
;442:		G_Printf( "func_timer at %s has random >= wait\n", vtos( self->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $186
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 443
;443:	}
LABELV $184
line 445
;444:
;445:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $187
line 446
;446:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 447
;447:		self->activator = self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 448
;448:	}
LABELV $187
line 450
;449:
;450:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 451
;451:}
LABELV $182
endproc SP_func_timer 12 12
export Touch_Trigger_Use
proc Touch_Trigger_Use 152 28
line 464
;452:
;453:
;454:/*QUAKED trigger_use (.5 .5 .5) 
;455:  
;456:Triggers only if the client is pressing the use button
;457:
;458:"target"	Target to the elvator
;459:"team"    2 = for all, 0 = only for seals, 1 = only for tangos
;460:"elevator_index" index of the elevator level where the elevator shall go after beeing triggered (0 - 7)
;461: 
;462:
;463:*/
;464:void Touch_Trigger_Use(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 467
;465:	trace_t tr;
;466:	vec3_t end, forward, up, right, start;
;467:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $191
line 468
;468:		return;
ADDRGP4 $190
JUMPV
LABELV $191
line 475
;469:	}
;470:	// if game is open
;471:	//if (GameState == STATE_OPEN && g_gametype.integer == GT_LTS)
;472:	//	return;
;473:	
;474:	// e 2 - means free 
;475:	if (ent->ns_team != 2 && !Is_OnBrushTeam(ent,other) )
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
EQI4 $193
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
NEI4 $193
line 476
;476:		return;
ADDRGP4 $190
JUMPV
LABELV $193
line 478
;477:
;478:	if ( other->client && !( other->client->buttons & BUTTON_USE ) )
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
EQU4 $195
ADDRLP4 124
INDIRP4
CNSTI4 1848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $195
line 479
;479:		return;
ADDRGP4 $190
JUMPV
LABELV $195
line 481
;480:	
;481:	if ( other->client && ( other->client->buttons & BUTTON_USE) && (other->client->oldbuttons & BUTTON_USE)) return;
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
EQU4 $197
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
EQI4 $197
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
EQI4 $197
ADDRGP4 $190
JUMPV
LABELV $197
line 483
;482:
;483:	VectorCopy(other->client->ps.viewangles, end);
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
line 484
;484:	AngleVectors(end, forward, right, up);
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
line 485
;485:	VectorCopy(other->client->ps.origin, start);
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
line 486
;486:	start[2] += other->client->ps.viewheight;
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
line 487
;487:	VectorMA(start, 32, forward, end);
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
line 488
;488:	VectorMA(start, -32, forward, start);
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
line 490
;489:	
;490:	trap_Trace( &tr, start, NULL, NULL, end, other->s.number, MASK_ALL);
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
line 492
;491:
;492:	if (tr.entityNum == ent->s.number) G_UseTargets( ent, NULL);
ADDRLP4 36+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $212
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $212
line 493
;493:}
LABELV $190
endproc Touch_Trigger_Use 152 28
export SP_trigger_use
proc SP_trigger_use 8 12
line 495
;494:
;495:void SP_trigger_use( gentity_t *ent ) {
line 497
;496:
;497:	G_SpawnInt("team","2", &ent->ns_team);
ADDRGP4 $216
ARGP4
ADDRGP4 $217
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 498
;498:	G_SpawnInt("elevator_index", "0", &ent->elevator_index);
ADDRGP4 $218
ARGP4
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 500
;499:
;500:	ent->touch = Touch_Trigger_Use;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Trigger_Use
ASGNP4
line 502
;501:
;502:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 504
;503:
;504:	ent->classname = "trigger_use";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $219
ASGNP4
line 505
;505:	switch (ent->elevator_index) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $220
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $220
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $231
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $231
address $223
address $224
address $225
address $226
address $227
address $228
address $229
address $230
code
LABELV $223
line 506
;506:		case 0: ent->s.eType = ET_ELEVBUT0; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 18
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $224
line 507
;507:		case 1: ent->s.eType = ET_ELEVBUT1; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 19
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $225
line 508
;508:		case 2: ent->s.eType = ET_ELEVBUT2; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 20
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $226
line 509
;509:		case 3: ent->s.eType = ET_ELEVBUT3; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 21
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $227
line 510
;510:		case 4: ent->s.eType = ET_ELEVBUT4; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 22
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $228
line 511
;511:		case 5: ent->s.eType = ET_ELEVBUT5; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 23
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $229
line 512
;512:		case 6: ent->s.eType = ET_ELEVBUT6; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 24
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $230
line 513
;513:		case 7: ent->s.eType = ET_ELEVBUT7; break;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 25
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $220
line 514
;514:		default: ent->s.eType = ET_ELEVBUT0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 18
ASGNI4
line 515
;515:	}
LABELV $221
line 517
;516:
;517:	InitTrigger( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 518
;518:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 520
;519:
;520:}
LABELV $215
endproc SP_trigger_use 8 12
export Use_Toggle
proc Use_Toggle 0 0
line 522
;521:
;522:void Use_Toggle( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 523
;523:	if (ent->count > 0) ent->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
LEI4 $233
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $234
JUMPV
LABELV $233
line 524
;524:	else ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
LABELV $234
line 525
;525:}
LABELV $232
endproc Use_Toggle 0 0
export Touch_Toggle
proc Touch_Toggle 8 8
line 527
;526:
;527:void Touch_Toggle( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 528
;528:	if( (!other->client) || (self->count > 0)) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $238
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
LEI4 $236
LABELV $238
line 529
;529:		return;
ADDRGP4 $235
JUMPV
LABELV $236
line 532
;530:	}
;531:
;532:	if (self->ns_team != 2 && !Is_OnBrushTeam(self,other) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 2
EQI4 $239
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Is_OnBrushTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $239
line 533
;533:		return;
ADDRGP4 $235
JUMPV
LABELV $239
line 535
;534:	
;535:	multi_trigger( self, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 536
;536:} 
LABELV $235
endproc Touch_Toggle 8 8
export SP_trigger_toggle
proc SP_trigger_toggle 12 12
line 548
;537:
;538:/*QUAKED trigger_toggle (.5 .5 .5) TOGGLE
;539:
;540:Press toggle to deactivate the trigger on start.
;541:
;542:"wait" : Seconds between triggerings, 0.5 default, -1 = one time only.
;543:"random"	wait variance, default is 0
;544:Variable sized repeatable trigger.  Must be targeted at one or more entities.
;545:so, the basic time between firing is a random time between
;546:(wait - random) and (wait + random)
;547:*/
;548:void SP_trigger_toggle( gentity_t *ent ) {
line 549
;549:	G_SpawnFloat( "wait", "0.5", &ent->wait );
ADDRGP4 $90
ARGP4
ADDRGP4 $91
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 550
;550:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $92
ARGP4
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 551
;551:	G_SpawnInt( "team", "2", &ent->ns_team );
ADDRGP4 $216
ARGP4
ADDRGP4 $217
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 553
;552:
;553:	if ( ent->random >= ent->wait && ent->wait >= 0 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
LTF4 $242
ADDRLP4 4
INDIRF4
CNSTF4 0
LTF4 $242
line 554
;554:		ent->random = ent->wait - FRAMETIME;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 555
;555:		G_Printf( "trigger_toggle has random >= wait\n" );
ADDRGP4 $244
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 556
;556:	}
LABELV $242
line 558
;557:
;558:	ent->count = ent->spawnflags;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 560
;559:
;560:	ent->touch = Touch_Toggle;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Toggle
ASGNP4
line 561
;561:	ent->use = Use_Toggle;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Toggle
ASGNP4
line 563
;562:
;563:	InitTrigger( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 564
;564:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 565
;565:}
LABELV $241
endproc SP_trigger_toggle 12 12
export TriggerToggle_ResetState
proc TriggerToggle_ResetState 4 0
line 568
;566:
;567:
;568:void TriggerToggle_ResetState( gentity_t *ent ) {
line 569
;569:	ent->count = ent->spawnflags;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 570
;570:}
LABELV $245
endproc TriggerToggle_ResetState 4 0
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
import is_func_explosive
import DoorRotating_ResetState
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
LABELV $244
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $219
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $218
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
LABELV $217
byte 1 50
byte 1 0
align 1
LABELV $216
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $186
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $183
byte 1 49
byte 1 0
align 1
LABELV $170
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $148
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
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $135
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 100
byte 1 102
byte 1 108
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $134
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $96
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $93
byte 1 48
byte 1 0
align 1
LABELV $92
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $91
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $90
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
