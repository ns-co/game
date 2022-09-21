export PM_SlideMove
code
proc PM_SlideMove 308 28
file "../bg_slidemove.c"
line 32
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_slidemove.c -- part of bg_pmove functionality
;4:
;5:// every line of code that differs from the quake3:arena SDK
;6:// is property of manfred nerurkar
;7:// no commercial explotation allowed
;8:// you are only allowed to use this code in navy seals: covert operations 
;9:// a quake3 arena modifiation
;10:// defcon-x@ns-co.net
;11:
;12:#include "q_shared.h"
;13:#include "bg_public.h"
;14:#include "bg_local.h"
;15:
;16:/*
;17:
;18:input: origin, velocity, bounds, groundPlane, trace function
;19:
;20:output: origin, velocity, impacts, stairup boolean
;21:
;22:*/
;23:
;24:/*
;25:==================
;26:PM_SlideMove
;27:
;28:Returns qtrue if the velocity was clipped in some way
;29:==================
;30:*/
;31:#define	MAX_CLIP_PLANES	5
;32:qboolean	PM_SlideMove( qboolean gravity ) {
line 48
;33:	int			bumpcount, numbumps;
;34:	vec3_t		dir;
;35:	float		d;
;36:	int			numplanes;
;37:	vec3_t		planes[MAX_CLIP_PLANES];
;38:	vec3_t		primal_velocity;
;39:	vec3_t		clipVelocity;
;40:	int			i, j, k;
;41:	trace_t	trace;
;42:	vec3_t		end;
;43:	float		time_left;
;44:	float		into;
;45:	vec3_t		endVelocity;
;46:	vec3_t		endClipVelocity;
;47:	
;48:	numbumps = 4;
ADDRLP4 208
CNSTI4 4
ASGNI4
line 50
;49:
;50:	VectorCopy (pm->ps->velocity, primal_velocity);
ADDRLP4 212
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 52
;51:
;52:	if ( gravity ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $52
line 53
;53:		VectorCopy( pm->ps->velocity, endVelocity );
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 54
;54:		endVelocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRGP4 pm
INDIRP4
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
line 55
;55:		pm->ps->velocity[2] = ( pm->ps->velocity[2] + endVelocity[2] ) * 0.5;
ADDRLP4 224
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTF4 1056964608
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 116+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 56
;56:		primal_velocity[2] = endVelocity[2];
ADDRLP4 212+8
ADDRLP4 116+8
INDIRF4
ASGNF4
line 57
;57:		if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $59
line 59
;58:			// slide along the ground plane
;59:			PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 228
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 228
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 61
;60:				pm->ps->velocity, OVERCLIP );
;61:		}
LABELV $59
line 62
;62:	}
LABELV $52
line 64
;63:
;64:	time_left = pml.frametime;
ADDRLP4 188
ADDRGP4 pml+36
INDIRF4
ASGNF4
line 67
;65:
;66:	// never turn against the ground plane
;67:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $65
line 68
;68:		numplanes = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 69
;69:		VectorCopy( pml.groundTrace.plane.normal, planes[0] );
ADDRLP4 4
ADDRGP4 pml+52+24
INDIRB
ASGNB 12
line 70
;70:	} else {
ADDRGP4 $66
JUMPV
LABELV $65
line 71
;71:		numplanes = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 72
;72:	}
LABELV $66
line 75
;73:
;74:	// never turn against original velocity
;75:	VectorNormalize2( pm->ps->velocity, planes[numplanes] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 76
;76:	numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 78
;77:
;78:	for ( bumpcount=0 ; bumpcount < numbumps ; bumpcount++ ) {
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRGP4 $73
JUMPV
LABELV $70
line 81
;79:
;80:		// calculate position we are trying to move to
;81:		VectorMA( pm->ps->origin, time_left, pm->ps->velocity, end );
ADDRLP4 224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 228
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192
ADDRLP4 228
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+4
ADDRLP4 236
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 240
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+8
ADDRLP4 240
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 240
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
line 84
;82:
;83:		// see if we can make it there
;84:		pm->trace ( &trace, pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask);
ADDRLP4 128
ARGP4
ADDRLP4 244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 248
ADDRLP4 244
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 86
;85:
;86:		if (trace.allsolid) {
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $76
line 88
;87:			// entity is completely trapped in another solid
;88:			pm->ps->velocity[2] = 0;	// don't build up falling damage, but allow sideways acceleration
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 89
;89:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $51
JUMPV
LABELV $76
line 92
;90:		}
;91:
;92:		if (trace.fraction > 0) {
ADDRLP4 128+8
INDIRF4
CNSTF4 0
LEF4 $78
line 94
;93:			// actually covered some distance
;94:			VectorCopy (trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 128+12
INDIRB
ASGNB 12
line 95
;95:		}
LABELV $78
line 97
;96:
;97:		if (trace.fraction == 1) {
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $82
line 98
;98:			 break;		// moved the entire distance
ADDRGP4 $72
JUMPV
LABELV $82
line 102
;99:		}
;100:
;101:		// save entity for contact
;102:		PM_AddTouchEnt( trace.entityNum );
ADDRLP4 128+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 104
;103:
;104:		time_left -= time_left * trace.fraction;
ADDRLP4 188
ADDRLP4 188
INDIRF4
ADDRLP4 188
INDIRF4
ADDRLP4 128+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 106
;105:
;106:		if (numplanes >= MAX_CLIP_PLANES) {
ADDRLP4 96
INDIRI4
CNSTI4 5
LTI4 $87
line 108
;107:			// this shouldn't really happen
;108:			VectorClear( pm->ps->velocity );
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
CNSTF4 0
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
line 109
;109:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $51
JUMPV
LABELV $87
line 117
;110:		}
;111:
;112:		//
;113:		// if this is the same plane we hit before, nudge velocity
;114:		// out along it, which fixes some epsilon issues with
;115:		// non-axial planes
;116:		//
;117:		for ( i = 0 ; i < numplanes ; i++ ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $89
line 118
;118:			if ( DotProduct( trace.plane.normal, planes[i] ) > 0.99 ) {
ADDRLP4 256
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 128+24
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $93
line 119
;119:				VectorAdd( trace.plane.normal, pm->ps->velocity, pm->ps->velocity );
ADDRLP4 260
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 128+24
INDIRF4
ADDRLP4 260
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 264
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 264
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 268
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 120
;120:				break;
ADDRGP4 $91
JUMPV
LABELV $93
line 122
;121:			}
;122:		}
LABELV $90
line 117
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $92
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $89
LABELV $91
line 123
;123:		if ( i < numplanes ) {
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $107
line 124
;124:			continue;
ADDRGP4 $71
JUMPV
LABELV $107
line 126
;125:		}
;126:		VectorCopy (trace.plane.normal, planes[numplanes]);
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 128+24
INDIRB
ASGNB 12
line 127
;127:		numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 134
;128:
;129:		//
;130:		// modify velocity so it parallels all of the clip planes
;131:		//
;132:
;133:		// find a plane that it enters
;134:		for ( i = 0 ; i < numplanes ; i++ ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $110
line 135
;135:			into = DotProduct( pm->ps->velocity, planes[i] );
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 184
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 136
;136:			if ( into >= 0.1 ) {
ADDRLP4 184
INDIRF4
CNSTF4 1036831949
LTF4 $116
line 137
;137:				continue;		// move doesn't interact with the plane
ADDRGP4 $111
JUMPV
LABELV $116
line 141
;138:			}
;139:
;140:			// see how hard we are hitting things
;141:			if ( -into > pml.impactSpeed ) {
ADDRLP4 184
INDIRF4
NEGF4
ADDRGP4 pml+108
INDIRF4
LEF4 $118
line 142
;142:				pml.impactSpeed = -into;
ADDRGP4 pml+108
ADDRLP4 184
INDIRF4
NEGF4
ASGNF4
line 143
;143:			}
LABELV $118
line 146
;144:
;145:			// slide along the plane
;146:			PM_ClipVelocity (pm->ps->velocity, planes[i], clipVelocity, OVERCLIP );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 149
;147:
;148:			// slide along the plane
;149:			PM_ClipVelocity (endVelocity, planes[i], endClipVelocity, OVERCLIP );
ADDRLP4 116
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 152
;150:
;151:			// see if there is a second plane that the new move enters
;152:			for ( j = 0 ; j < numplanes ; j++ ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $125
JUMPV
LABELV $122
line 153
;153:				if ( j == i ) {
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $126
line 154
;154:					continue;
ADDRGP4 $123
JUMPV
LABELV $126
line 156
;155:				}
;156:				if ( DotProduct( clipVelocity, planes[j] ) >= 0.1 ) {
ADDRLP4 264
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $128
line 157
;157:					continue;		// move doesn't interact with the plane
ADDRGP4 $123
JUMPV
LABELV $128
line 161
;158:				}
;159:
;160:				// try clipping the move to the plane
;161:				PM_ClipVelocity( clipVelocity, planes[j], clipVelocity, OVERCLIP );
ADDRLP4 64
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 162
;162:				PM_ClipVelocity( endClipVelocity, planes[j], endClipVelocity, OVERCLIP );
ADDRLP4 104
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 165
;163:
;164:				// see if it goes back into the first clip plane
;165:				if ( DotProduct( clipVelocity, planes[i] ) >= 0 ) {
ADDRLP4 268
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $134
line 166
;166:					continue;
ADDRGP4 $123
JUMPV
LABELV $134
line 170
;167:				}
;168:
;169:				// slide the original velocity along the crease
;170:				CrossProduct (planes[i], planes[j], dir);
ADDRLP4 272
CNSTI4 12
ASGNI4
ADDRLP4 272
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 272
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 171
;171:				VectorNormalize( dir );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 172
;172:				d = DotProduct( dir, pm->ps->velocity );
ADDRLP4 276
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 173
;173:				VectorScale( dir, d, clipVelocity );
ADDRLP4 64
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 175
;174:
;175:				CrossProduct (planes[i], planes[j], dir);
ADDRLP4 284
CNSTI4 12
ASGNI4
ADDRLP4 284
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 284
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 176
;176:				VectorNormalize( dir );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 177
;177:				d = DotProduct( dir, endVelocity );
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 178
;178:				VectorScale( dir, d, endClipVelocity );
ADDRLP4 104
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 181
;179:
;180:				// see if there is a third plane the the new move enters
;181:				for ( k = 0 ; k < numplanes ; k++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $154
line 182
;182:					if (  k == i || k == j ) {
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $160
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $158
LABELV $160
line 183
;183:						continue;
ADDRGP4 $155
JUMPV
LABELV $158
line 185
;184:					}
;185:					if ( DotProduct( clipVelocity, planes[k] ) >= 0.1 ) {
ADDRLP4 296
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 296
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 296
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 296
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $161
line 186
;186:						continue;		// move doesn't interact with the plane
ADDRGP4 $155
JUMPV
LABELV $161
line 190
;187:					}
;188:
;189:					// stop dead at a tripple plane interaction
;190:					VectorClear( pm->ps->velocity );
ADDRLP4 300
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 304
CNSTF4 0
ASGNF4
ADDRLP4 300
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 304
INDIRF4
ASGNF4
ADDRLP4 300
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 304
INDIRF4
ASGNF4
ADDRLP4 300
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 304
INDIRF4
ASGNF4
line 191
;191:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $51
JUMPV
LABELV $155
line 181
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $157
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $154
line 193
;192:				}
;193:			}
LABELV $123
line 152
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $125
ADDRLP4 76
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $122
line 196
;194:
;195:			// if we have fixed all interactions, try another move
;196:			VectorCopy( clipVelocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRB
ASGNB 12
line 197
;197:			VectorCopy( endClipVelocity, endVelocity );
ADDRLP4 116
ADDRLP4 104
INDIRB
ASGNB 12
line 198
;198:			break;
ADDRGP4 $112
JUMPV
LABELV $111
line 134
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $113
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $110
LABELV $112
line 200
;199:		}
;200:	}
LABELV $71
line 78
ADDRLP4 204
ADDRLP4 204
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $73
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
LTI4 $70
LABELV $72
line 202
;201:
;202:	if ( gravity ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $167
line 203
;203:		VectorCopy( endVelocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
line 204
;204:	}
LABELV $167
line 207
;205:
;206:	// don't change velocity if in a timer (FIXME: is this correct?)
;207:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $169
line 208
;208:		VectorCopy( primal_velocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 212
INDIRB
ASGNB 12
line 209
;209:	}
LABELV $169
line 211
;210:
;211:	return ( bumpcount != 0 );
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $172
ADDRLP4 224
CNSTI4 1
ASGNI4
ADDRGP4 $173
JUMPV
LABELV $172
ADDRLP4 224
CNSTI4 0
ASGNI4
LABELV $173
ADDRLP4 224
INDIRI4
RETI4
LABELV $51
endproc PM_SlideMove 308 28
export PM_StepSlideMove
proc PM_StepSlideMove 156 28
line 220
;212:}
;213:
;214:/*
;215:==================
;216:PM_StepSlideMove
;217:
;218:==================
;219:*/
;220:void PM_StepSlideMove( qboolean gravity ) {
line 228
;221:	vec3_t		start_o, start_v;
;222:	vec3_t		down_o, down_v;
;223:	trace_t		trace;
;224://	float		down_dist, up_dist;
;225://	vec3_t		delta, delta2;
;226:	vec3_t		up, down;
;227:
;228:	VectorCopy (pm->ps->origin, start_o);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 229
;229:	VectorCopy (pm->ps->velocity, start_v);
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 231
;230:
;231:	if ( PM_SlideMove( gravity ) == 0 ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 PM_SlideMove
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $175
line 232
;232:		return;		// we got exactly where we wanted to go first try	
ADDRGP4 $174
JUMPV
LABELV $175
line 235
;233:	}
;234:
;235:	VectorCopy(start_o, down);
ADDRLP4 68
ADDRLP4 80
INDIRB
ASGNB 12
line 236
;236:	down[2] -= STEPSIZE;
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 237
;237:	pm->trace (&trace, start_o, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 132
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 132
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 132
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 238
;238:	VectorSet(up, 0, 0, 1);
ADDRLP4 136
CNSTF4 0
ASGNF4
ADDRLP4 56
ADDRLP4 136
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 136
INDIRF4
ASGNF4
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
line 240
;239:	// never step up when you still have up velocity
;240:	if ( pm->ps->velocity[2] > 0 && (trace.fraction == 1.0 ||
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $180
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $190
ADDRLP4 0+24
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
GEF4 $180
LABELV $190
line 241
;241:										DotProduct(trace.plane.normal, up) < 0.7)) {
line 242
;242:		return;
ADDRGP4 $174
JUMPV
LABELV $180
line 245
;243:	}
;244:
;245:	VectorCopy (pm->ps->origin, down_o);
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 246
;246:	VectorCopy (pm->ps->velocity, down_v);
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 248
;247:
;248:	VectorCopy (start_o, up);
ADDRLP4 56
ADDRLP4 80
INDIRB
ASGNB 12
line 249
;249:	up[2] += STEPSIZE;
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 252
;250:
;251:	// test the player position if they were a stepheight higher
;252:	pm->trace (&trace, up, pm->mins, pm->maxs, up, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 140
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 140
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 253
;253:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $192
line 254
;254:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $174
line 255
;255:			Com_Printf("%i:bend can't step\n", c_pmove);
ADDRGP4 $196
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 256
;256:		}
line 257
;257:		return;		// can't step up
ADDRGP4 $174
JUMPV
LABELV $192
line 261
;258:	}
;259:
;260:	// try slidemove from this position
;261:	VectorCopy (up, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 56
INDIRB
ASGNB 12
line 262
;262:	VectorCopy (start_v, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
line 264
;263:
;264:	PM_SlideMove( gravity );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 267
;265:
;266:	// push down the final amount
;267:	VectorCopy (pm->ps->origin, down);
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 268
;268:	down[2] -= STEPSIZE;
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 269
;269:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 148
ADDRLP4 144
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 270
;270:	if ( !trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $198
line 271
;271:		VectorCopy (trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 272
;272:	}
LABELV $198
line 273
;273:	if ( trace.fraction < 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $201
line 274
;274:		PM_ClipVelocity( pm->ps->velocity, trace.plane.normal, pm->ps->velocity, OVERCLIP );
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 275
;275:	}
LABELV $201
line 289
;276:
;277:#if 0
;278:	// if the down trace can trace back to the original position directly, don't step
;279:	pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, start_o, pm->ps->clientNum, pm->tracemask);
;280:	if ( trace.fraction == 1.0 ) {
;281:		// use the original move
;282:		VectorCopy (down_o, pm->ps->origin);
;283:		VectorCopy (down_v, pm->ps->velocity);
;284:		if ( pm->debugLevel ) {
;285:			Com_Printf("%i:bend\n", c_pmove);
;286:		}
;287:	} else 
;288:#endif
;289:	{
line 293
;290:		// use the step move
;291:		float	delta;
;292:
;293:		delta = pm->ps->origin[2] - start_o[2];
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 80+8
INDIRF4
SUBF4
ASGNF4
line 294
;294:		if ( delta > 2 ) {
ADDRLP4 152
INDIRF4
CNSTF4 1073741824
LEF4 $206
line 295
;295:			if ( delta < 7 ) {
ADDRLP4 152
INDIRF4
CNSTF4 1088421888
GEF4 $208
line 296
;296:				PM_AddEvent( EV_STEP_4 );
CNSTI4 9
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 297
;297:			} else if ( delta < 11 ) {
ADDRGP4 $209
JUMPV
LABELV $208
ADDRLP4 152
INDIRF4
CNSTF4 1093664768
GEF4 $210
line 298
;298:				PM_AddEvent( EV_STEP_8 );
CNSTI4 10
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 299
;299:			} else if ( delta < 15 ) {
ADDRGP4 $211
JUMPV
LABELV $210
ADDRLP4 152
INDIRF4
CNSTF4 1097859072
GEF4 $212
line 300
;300:				PM_AddEvent( EV_STEP_12 );
CNSTI4 11
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 301
;301:			} else {
ADDRGP4 $213
JUMPV
LABELV $212
line 302
;302:				PM_AddEvent( EV_STEP_16 );
CNSTI4 12
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 303
;303:			}
LABELV $213
LABELV $211
LABELV $209
line 304
;304:		}
LABELV $206
line 305
;305:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $214
line 306
;306:			Com_Printf("%i:stepped\n", c_pmove);
ADDRGP4 $216
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 307
;307:		}
LABELV $214
line 308
;308:	}
line 309
;309:}
LABELV $174
endproc PM_StepSlideMove 156 28
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_scopeScale
import pm_stopspeed
import pml
import pm
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
LABELV $216
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $196
byte 1 37
byte 1 105
byte 1 58
byte 1 98
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 10
byte 1 0
