export CG_PositionEntityOnTag
code
proc CG_PositionEntityOnTag 84 24
file "../cg_ents.c"
line 26
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_ents.c -- present snapshot entities, happens every single frame
;4:
;5:// every line of code that differs from the quake3:arena SDK
;6:// is property of manfred nerurkar
;7:// no commercial explotation allowed
;8:// you are only allowed to use this code in navy seals: covert operations 
;9:// a quake3 arena modifiation
;10:// defcon-x@ns-co.net
;11:
;12:#include "cg_local.h"
;13:
;14:#include "variables.h"
;15:
;16:
;17:/*
;18:======================
;19:CG_PositionEntityOnTag
;20:
;21:Modifies the entities position and axis by the given
;22:tag location
;23:======================
;24:*/
;25:void CG_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;26:							qhandle_t parentModel, char *tagName ) {
line 31
;27:	int				i;
;28:	orientation_t	lerped;
;29:	
;30:	// lerp the tag
;31:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 35
;32:		1.0 - parent->backlerp, tagName );
;33:
;34:	// FIXME: allow origin offsets along tag?
;35:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 56
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 36
;36:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $85
line 37
;37:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 38
;38:	}
LABELV $86
line 36
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
line 41
;39:
;40:	// had to cast away the const to avoid compiler problems...
;41:	MatrixMultiply( lerped.axis, ((refEntity_t *)parent)->axis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 60
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 42
;42:	entity->backlerp = parent->backlerp;
ADDRLP4 64
CNSTI4 100
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 43
;43:}
LABELV $84
endproc CG_PositionEntityOnTag 84 24
export CG_PositionRotatedEntityOnTag
proc CG_PositionRotatedEntityOnTag 120 24
line 55
;44:
;45:
;46:/*
;47:======================
;48:CG_PositionRotatedEntityOnTag
;49:
;50:Modifies the entities position and axis by the given
;51:tag location
;52:======================
;53:*/
;54:void CG_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;55:							qhandle_t parentModel, char *tagName ) {
line 62
;56:	int				i;
;57:	orientation_t	lerped;
;58:	vec3_t			tempAxis[3];
;59:
;60:	// AxisClear( entity->axis );
;61:	// lerp the tag
;62:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 66
;63:		1.0 - parent->backlerp, tagName );
;64:
;65:	// FIXME: allow origin offsets along tag?
;66:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 92
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 67
;67:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $91
line 68
;68:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 69
;69:	}
LABELV $92
line 67
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $91
line 72
;70:
;71:	// had to cast away the const to avoid compiler problems...
;72:	MatrixMultiply( entity->axis, lerped.axis, tempAxis );
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 73
;73:	MatrixMultiply( tempAxis, ((refEntity_t *)parent)->axis, entity->axis );
ADDRLP4 52
ARGP4
ADDRLP4 96
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 74
;74:}
LABELV $90
endproc CG_PositionRotatedEntityOnTag 120 24
export CG_GetOriginFromTag
proc CG_GetOriginFromTag 88 24
line 84
;75:
;76:/*
;77:======================
;78:CG_GetOriginFromTag
;79:
;80:changes "out" to the given tag origin
;81:======================
;82:*/
;83:void CG_GetOriginFromTag( const refEntity_t *parent, 
;84:							qhandle_t parentModel, char *tagName, vec3_t out ) {
line 89
;85:	int				i;
;86:	orientation_t	lerped;
;87: 
;88:	// lerp the tag
;89:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 92
;90:		1.0 - parent->backlerp, tagName );
;91: 
;92:	VectorCopy( parent->origin, out );
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRB
ASGNB 12
line 94
;93:
;94:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $97
line 95
;95:		VectorMA( out , lerped.origin[i], parent->axis[i], out );
ADDRLP4 56
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 68
ADDRFP4 12
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 8
ASGNI4
ADDRLP4 80
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 96
;96:	}	
LABELV $98
line 94
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $97
line 97
;97:} 
LABELV $96
endproc CG_GetOriginFromTag 88 24
export CG_SetEntitySoundPosition
proc CG_SetEntitySoundPosition 24 8
line 115
;98:
;99:
;100:/*
;101:==========================================================================
;102:
;103:FUNCTIONS CALLED EACH FRAME
;104:
;105:==========================================================================
;106:*/
;107:
;108:/*
;109:======================
;110:CG_SetEntitySoundPosition
;111:
;112:Also called by event processing code
;113:======================
;114:*/
;115:void CG_SetEntitySoundPosition( centity_t *cent ) {
line 116
;116:	if ( cent->currentState.solid == SOLID_BMODEL ) {
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $102
line 120
;117:		vec3_t	origin;
;118:		float	*v;
;119:
;120:		v = cgs.inlineModelMidpoints[ cent->currentState.modelindex ];
ADDRLP4 12
CNSTI4 12
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+35592
ADDP4
ASGNP4
line 121
;121:		VectorAdd( cent->lerpOrigin, v, origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 704
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 122
;122:		trap_S_UpdateEntityPosition( cent->currentState.number, origin );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 123
;123:	} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 124
;124:		trap_S_UpdateEntityPosition( cent->currentState.number, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 125
;125:	}
LABELV $103
line 126
;126:}
LABELV $101
endproc CG_SetEntitySoundPosition 24 8
proc CG_EntityEffects 20 20
line 135
;127:
;128:/*
;129:==================
;130:CG_EntityEffects
;131:
;132:Add continuous entity effects, like local entity emission and lighting
;133:==================
;134:*/
;135:static void CG_EntityEffects( centity_t *cent ) {
line 138
;136:
;137:	// update sound origins
;138:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 141
;139:
;140:	// add loop sound
;141:	if ( cent->currentState.loopSound ) {
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $108
line 142
;142:		if (cent->currentState.eType != ET_SPEAKER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $110
line 143
;143:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 145
;144:				cgs.gameSounds[ cent->currentState.loopSound ] );
;145:		} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 146
;146:			trap_S_AddRealLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 148
;147:				cgs.gameSounds[ cent->currentState.loopSound ] );
;148:		}
LABELV $111
line 149
;149:	}
LABELV $108
line 153
;150:
;151:
;152:	// constant light glow
;153:	if ( cent->currentState.constantLight ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $114
line 157
;154:		int		cl;
;155:		int		i, r, g, b;
;156:
;157:		cl = cent->currentState.constantLight;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 158
;158:		r = cl & 255;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 159
;159:		g = ( cl >> 8 ) & 255;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 160
;160:		b = ( cl >> 16 ) & 255;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 161
;161:		i = ( ( cl >> 24 ) & 255 ) * 4;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CNSTI4 2
LSHI4
ASGNI4
line 162
;162:		trap_R_AddLightToScene( cent->lerpOrigin, i, r, g, b );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 163
;163:	}
LABELV $114
line 165
;164:
;165:}
LABELV $107
endproc CG_EntityEffects 20 20
proc CG_General 144 12
line 173
;166:
;167:
;168:/*
;169:==================
;170:CG_General
;171:==================
;172:*/
;173:static void CG_General( centity_t *cent ) {
line 177
;174:	refEntity_t			ent;
;175:	entityState_t		*s1;
;176:
;177:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 180
;178:
;179:	// if set to invisible, skip
;180:	if (!s1->modelindex) {
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $117
line 181
;181:		return;
ADDRGP4 $116
JUMPV
LABELV $117
line 184
;182:	}
;183:
;184:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 188
;185:
;186:	// set frame
;187:
;188:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 189
;189:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 190
;190:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 192
;191:
;192:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 193
;193:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 195
;194:
;195:	ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32516
ADDP4
INDIRI4
ASGNI4
line 198
;196:
;197:	// player model
;198:	if (s1->number == cg.snap->ps.clientNum) {
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $127
line 199
;199:		ent.renderfx |= RF_THIRD_PERSON;	// only draw from mirrors
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 200
;200:	}
LABELV $127
line 203
;201:
;202:	// convert angles to axis
;203:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 206
;204:
;205:	// add to refresh list
;206:	trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 207
;207:}
LABELV $116
endproc CG_General 144 12
proc CG_ParticleHost 96 48
line 238
;208:
;209:/*
;210:==================
;211:CG_ParticleHost
;212:
;213:Launches particles
;214:   
;215:"random"		randomizes amount of particles it spawns (full numbers)
;216:"randomdir"		randomizes velocity of each particle ( x/y NOT Z(up) ) (full numbers)
;217:"velocity"		velocity (full numbers)
;218:"particles"		amount of particles randomized by 'random' key (full numbers)
;219:"size"			size modifier (only for smoke) (full numbers)
;220:"dlight"		add a dynamic light (0=none)-(255=biggest dlight) (full numbers)
;221:"wait"			fire particles every X milliseconds. if you set a value you cannot "trigger" it. (full numbers)
;222: 
;223:==================
;224:*/
;225:
;226:#define PARTFLAGS_DIRT			1
;227:#define	PARTFLAGS_GLASS			2
;228:#define PARTFLAGS_SAND			4
;229:#define PARTFLAGS_SPARKS		8
;230:#define PARTFLAGS_METALSPARKS	16
;231:#define PARTFLAGS_SMOKE			32 
;232:#define PARTFLAGS_STARTOFF		64
;233:
;234:void CG_Spark( vec3_t org, vec3_t dir, float width );
;235:void CG_MetalSpark( vec3_t org, vec3_t dir, float width );
;236:void CG_SurfaceEffect( vec3_t origin, vec3_t dir, int surface, int weapon, float radius );
;237:
;238:static void CG_ParticleHost( centity_t *cent ) {
line 239
;239:	int random = 0, randomdir = 0, velocity = 0, particles = 0, size = 0, dlight = 0, wait = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 44
CNSTI4 0
ASGNI4
line 244
;240:	int i, spawnflags;
;241:	vec3_t	angles;
;242:
;243:	// miscTime? err, time to launch particles?
;244:	if ( cent->miscTime > cg.time )
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $133
line 245
;245:	{
line 247
;246:	//	CG_Printf("cent->miscTime > cg.time\n");
;247:		return;
ADDRGP4 $132
JUMPV
LABELV $133
line 250
;248:	}
;249:
;250:	random		=	cent->currentState.powerups;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 251
;251:	randomdir	=	cent->currentState.time2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
line 252
;252:	velocity	=	cent->currentState.torsoAnim;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 253
;253:	particles	=	cent->currentState.generic1;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 254
;254:	size		=	cent->currentState.legsAnim;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 255
;255:	dlight		=	cent->currentState.otherEntityNum2;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 256
;256:	wait		=	cent->currentState.time;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 257
;257:	spawnflags	=	cent->currentState.eventParm; 
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 265
;258:
;259:#if 0 // debug
;260:	CG_Printf( "spawned particle %s: random %i,randomdir %i,velocity %i,particles %i,size %i,dlight %i, wait %i spawnflags %i\n",
;261:		vtos ( cent->lerpOrigin), random,randomdir,velocity,particles,size,dlight,wait,spawnflags );
;262:#endif
;263:
;264:	// randomize amount of particle it will spawn
;265:	particles -= random()*random;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 40
INDIRI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 267
;266:
;267:	if ( particles < 1 )
ADDRLP4 24
INDIRI4
CNSTI4 1
GEI4 $136
line 268
;268:		particles = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
LABELV $136
line 270
;269:
;270:	VectorNormalize( cent->currentState.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 272
;271:
;272:	VectorScale(cent->currentState.angles, velocity - 10 + random()*10, cent->currentState.angles);
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 32
INDIRI4
CNSTI4 10
SUBI4
CVIF4 4
CNSTF4 1092616192
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
MULF4
ASGNF4
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 32
INDIRI4
CNSTI4 10
SUBI4
CVIF4 4
CNSTF4 1092616192
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
MULF4
ASGNF4
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 32
INDIRI4
CNSTI4 10
SUBI4
CVIF4 4
CNSTF4 1092616192
ADDRLP4 68
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
MULF4
ASGNF4
line 275
;273:
;274:	// spawn particles
;275:	for ( i = 0; i < particles; i ++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $141
JUMPV
LABELV $138
line 276
;276:	{
line 277
;277:		VectorCopy( cent->currentState.angles, angles );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 280
;278:
;279:		// randomize XY 
;280:		angles[0] += -(randomdir/2) + random()*randomdir;
ADDRLP4 76
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
NEGI4
CVIF4 4
ADDRLP4 76
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
ADDF4
ADDF4
ASGNF4
line 281
;281:		angles[1] += -(randomdir/2) + random()*randomdir;
ADDRLP4 80
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
NEGI4
CVIF4 4
ADDRLP4 80
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
ADDF4
ADDF4
ASGNF4
line 284
;282:
;283:		// spawn effect
;284:		if ( spawnflags & PARTFLAGS_DIRT )
ADDRLP4 20
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $143
line 285
;285:			CG_SurfaceEffect( cent->lerpOrigin, angles, BHOLE_DIRT, WP_M4, size );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 8
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 CG_SurfaceEffect
CALLV
pop
ADDRGP4 $144
JUMPV
LABELV $143
line 286
;286:		else if ( spawnflags & PARTFLAGS_GLASS )
ADDRLP4 20
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $145
line 287
;287:			CG_SurfaceEffect( cent->lerpOrigin, angles, BHOLE_GLASS, WP_M4, size );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 CG_SurfaceEffect
CALLV
pop
ADDRGP4 $146
JUMPV
LABELV $145
line 288
;288:		else if ( spawnflags & PARTFLAGS_SAND )
ADDRLP4 20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $147
line 289
;289:			CG_SurfaceEffect( cent->lerpOrigin, angles, BHOLE_SAND, WP_M4, size );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 3
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 CG_SurfaceEffect
CALLV
pop
ADDRGP4 $148
JUMPV
LABELV $147
line 290
;290:		else if ( spawnflags & PARTFLAGS_SPARKS )
ADDRLP4 20
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $149
line 291
;291:			CG_Spark( cent->lerpOrigin, angles, 1.0f );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_Spark
CALLV
pop
ADDRGP4 $150
JUMPV
LABELV $149
line 292
;292:		else if ( spawnflags & PARTFLAGS_METALSPARKS )
ADDRLP4 20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $151
line 293
;293:			CG_MetalSpark( cent->lerpOrigin, angles, 0.5f );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 1056964608
ARGF4
ADDRGP4 CG_MetalSpark
CALLV
pop
ADDRGP4 $152
JUMPV
LABELV $151
line 294
;294:		else if ( spawnflags & PARTFLAGS_SMOKE )
ADDRLP4 20
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $153
line 295
;295:			CG_SmokePuff( cent->lerpOrigin, angles, 0.5 + size + random(), 1, 1, 1, 1, 1000 + random()*500, cg.time, 0,LE_MOVE_SCALE_FADE, cgs.media.smokePuffShader );
ADDRLP4 84
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 88
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 28
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDF4
ADDRLP4 84
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDF4
ARGF4
ADDRLP4 92
CNSTF4 1065353216
ASGNF4
ADDRLP4 92
INDIRF4
ARGF4
ADDRLP4 92
INDIRF4
ARGF4
ADDRLP4 92
INDIRF4
ARGF4
ADDRLP4 92
INDIRF4
ARGF4
CNSTF4 1140457472
ADDRLP4 88
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1148846080
ADDF4
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+205084+104
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
ADDRGP4 $154
JUMPV
LABELV $153
line 297
;296:		else
;297:			CG_Spark( cent->lerpOrigin, angles, 1.0f );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_Spark
CALLV
pop
LABELV $154
LABELV $152
LABELV $150
LABELV $148
LABELV $146
LABELV $144
line 298
;298:	}
LABELV $139
line 275
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $141
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $138
line 301
;299:
;300:	// add dynamic light
;301:	if ( dlight )
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $158
line 302
;302:		trap_R_AddLightToScene( cent->lerpOrigin, (float)dlight,1.0f,1.0f,1.0f );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 76
CNSTF4 1065353216
ASGNF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
LABELV $158
line 305
;303:
;304: 	// set time next spawn will happen
;305:	cent->miscTime = cg.time + wait;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ASGNI4
line 306
;306:}
LABELV $132
endproc CG_ParticleHost 96 48
proc CG_Speaker 16 16
line 315
;307:
;308:/*
;309:==================
;310:CG_Speaker
;311:
;312:Speaker entities can automatically play sounds
;313:==================
;314:*/
;315:static void CG_Speaker( centity_t *cent ) {
line 316
;316:	if ( ! cent->currentState.clientNum ) {	// FIXME: use something other than clientNum...
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $162
line 317
;317:		return;		// not auto triggering
ADDRGP4 $161
JUMPV
LABELV $162
line 320
;318:	}
;319:
;320:	if ( cg.time < cent->miscTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
GEI4 $164
line 321
;321:		return;
ADDRGP4 $161
JUMPV
LABELV $164
line 324
;322:	}
;323:
;324:	if ((cg.DeafTime < cg.time)) trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.gameSounds[cent->currentState.eventParm] );
ADDRGP4 cg+116292
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $167
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $167
line 328
;325:
;326:	//	ent->s.frame = ent->wait * 10;
;327:	//	ent->s.clientNum = ent->random * 10;
;328:	cent->miscTime = cg.time + cent->currentState.frame * 100 + cent->currentState.clientNum * 100 * crandom();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 100
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 464
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
MULI4
ADDI4
CVIF4 4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
CVIF4 4
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
CVFI4 4
ASGNI4
line 329
;329:}
LABELV $161
endproc CG_Speaker 16 16
proc CG_Item 452 16
line 337
;330:
;331:void CG_AddWeaponWithPowerups( refEntity_t gun, weaponInfo_t	*weapon,int i_equipment, int weaponmode );
;332:/*
;333:==================
;334:CG_Item
;335:==================
;336:*/
;337:static void CG_Item( centity_t *cent ) {
line 342
;338:	refEntity_t			ent,ent2;
;339:	entityState_t		*es;
;340:	gitem_t				*item; 
;341:
;342:	es = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 343
;343:	if ( es->modelindex >= bg_numItems ) {
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $174
line 344
;344:		CG_Error( "Bad item index %i on entity", es->modelindex );
ADDRGP4 $176
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 345
;345:	}
LABELV $174
line 348
;346:
;347:	// if set to invisible, skip
;348:	if ( !es->modelindex || ( es->eFlags & EF_NODRAW ) ) {
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $179
ADDRLP4 144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 292
INDIRI4
EQI4 $177
LABELV $179
line 349
;349:		return;
ADDRGP4 $173
JUMPV
LABELV $177
line 352
;350:	}
;351:
;352:	item = &bg_itemlist[ es->modelindex ];
ADDRLP4 140
CNSTI4 56
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 357
;353:  
;354:	//
;355:	// if simpleitems are enable render as sprite and then return 
;356:	//
;357:	if ( cg_simpleItems.integer ) //&& item->giType != IT_TEAM ) 
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
EQI4 $180
line 358
;358:	{ 
line 359
;359:		memset( &ent, 0, sizeof( ent ) ); 
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 361
;360:
;361:	 	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 362
;362:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 363
;363:	 	ent.radius = 14;
ADDRLP4 0+132
CNSTF4 1096810496
ASGNF4
line 364
;364:		ent.customShader = cg_items[es->modelindex].icon;
ADDRLP4 0+112
CNSTI4 24
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ASGNI4
line 365
;365:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 366
;366:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 367
;367:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 368
;368:		ent.shaderRGBA[3] = 240; 
ADDRLP4 0+116+3
CNSTU1 240
ASGNU1
line 369
;369:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 370
;370:		return;
ADDRGP4 $173
JUMPV
LABELV $180
line 374
;371:	}  
;372: 
;373:	// briefcase return points are handled as items
;374:	if ( !strcmp( item->classname, "team_briefcase_return" ) )
ADDRLP4 140
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $196
ARGP4
ADDRLP4 296
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $194
line 375
;375:	{ 
line 376
;376:		memset( &ent, 0, sizeof( ent ) ); 
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 378
;377:
;378:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 379
;379:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 380
;380:		ent.radius = 26;
ADDRLP4 0+132
CNSTF4 1104150528
ASGNF4
line 381
;381:		ent.origin[2] += 16; // move up
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 382
;382:		ent.customShader = trap_R_RegisterShader("gfx/misc/baggage_return.tga"); 
ADDRGP4 $202
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+112
ADDRLP4 300
INDIRI4
ASGNI4
line 383
;383:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 384
;384:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 385
;385:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 386
;386:		ent.shaderRGBA[3] = 240;
ADDRLP4 0+116+3
CNSTU1 240
ASGNU1
line 388
;387:
;388:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 389
;389:		return;
ADDRGP4 $173
JUMPV
LABELV $194
line 391
;390:	}	// C4 is hovering above ground
;391:	else if ( item->giTag == WP_C4 ) 
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $210
line 392
;392:	{  
line 393
;393:		memset( &ent2, 0, sizeof( ent2 ) ); 
ADDRLP4 148
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 408
;394: 
;395:	 /*	ent2.reType = RT_SPRITE;
;396:		VectorCopy( cent->lerpOrigin, ent2.origin );
;397:		ent2.origin[2] += 1.5;
;398:	 	ent2.radius = 8;
;399:		ent2.customShader = cgs.media.flare;
;400:		ent2.shaderRGBA[0] = 255;
;401:		ent2.shaderRGBA[1] = 255;
;402:		ent2.shaderRGBA[2] = 255;
;403:		ent2.shaderRGBA[3] = 175; 
;404:
;405:		trap_R_AddRefEntityToScene(&ent2);  */
;406:
;407:		// prepare angles for bomb model
;408:		VectorCopy( cg.autoAngles, cent->lerpAngles );  
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 cg+108948
INDIRB
ASGNB 12
line 410
;409:
;410:		cent->lerpAngles[PITCH] += 40;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 411
;411:		cent->lerpAngles[ROLL] -= 180;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRF4
CNSTF4 1127481344
SUBF4
ASGNF4
line 412
;412:		cent->lerpOrigin[2] += 10; 
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 308
INDIRP4
ADDRLP4 308
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 413
;413:	}  
LABELV $210
line 415
;414:	 
;415:	memset( &ent, 0, sizeof( ent ) ); 
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 420
;416:
;417:	// the weapons have their origin where they attatch to player
;418:	// models, so we need to offset them or they will rotate
;419:	// eccentricly 
;420:	if (item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $213
line 421
;421:		ent.hModel = cg_weapons[item->giTag].viewweaponModel;
ADDRLP4 0+8
CNSTI4 296
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+60
ADDP4
INDIRI4
ASGNI4
line 422
;422:		cent->lerpOrigin[2] -= 3; // bring to ground
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRF4
CNSTF4 1077936128
SUBF4
ASGNF4
line 423
;423:	}
ADDRGP4 $214
JUMPV
LABELV $213
line 424
;424:	else if ( item->giTag == PW_BRIEFCASE )
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $217
line 425
;425:	{  
line 426
;426:		cent->lerpOrigin[2] -= 10;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRF4
CNSTF4 1092616192
SUBF4
ASGNF4
line 427
;427:		ent.hModel = cgs.media.briefcaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+205084+676
INDIRI4
ASGNI4
line 428
;428:	} 
ADDRGP4 $218
JUMPV
LABELV $217
line 430
;429:	else
;430:		ent.hModel = cg_items[es->modelindex].models[0];
ADDRLP4 0+8
CNSTI4 24
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+4
ADDP4
INDIRI4
ASGNI4
LABELV $218
LABELV $214
line 433
;431:  
;432:	// no model ? 
;433:	if ( !ent.hModel )
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $224
line 434
;434:		return; 
ADDRGP4 $173
JUMPV
LABELV $224
line 436
;435:
;436:	AnglesToAxis( cent->lerpAngles, ent.axis );  
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 438
;437: 
;438:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 439
;439:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 441
;440:
;441:	ent.nonNormalizedAxes = qfalse; 
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 444
;442:	
;443:	// add to refresh list
;444:	if ( item->giType == IT_WEAPON ) { 
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $231
line 448
;445:		 
;446:		weaponInfo_t	*weapon;
;447:   
;448:		weapon = &cg_weapons[item->giTag]; 
ADDRLP4 300
CNSTI4 296
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 451
;449:
;450:		//trap_R_AddRefEntityToScene(&ent); 
;451:		if ( BG_WeaponMods( item->giTag ) != 0 )
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 304
ADDRGP4 BG_WeaponMods
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $233
line 452
;452:			CG_AddWeaponWithPowerups( ent, weapon, cent->currentState.powerups, cent->currentState.eFlags );
ADDRLP4 308
ADDRLP4 0
INDIRB
ASGNB 140
ADDRLP4 308
ARGP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRLP4 448
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 448
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 448
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddWeaponWithPowerups
CALLV
pop
ADDRGP4 $232
JUMPV
LABELV $233
line 454
;453:		else
;454:			trap_R_AddRefEntityToScene(&ent); 
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 455
;455:	}
ADDRGP4 $232
JUMPV
LABELV $231
line 457
;456:	else
;457:		trap_R_AddRefEntityToScene(&ent); 
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
LABELV $232
line 458
;458:}
LABELV $173
endproc CG_Item 452 16
proc CG_Flare 372 28
line 473
;459:
;460://============================================================================
;461: 
;462:
;463:
;464:#define SUB_FLARES		11 
;465:#define DIST_START_FADE 2000
;466:#define DIST_END_FADE	3000  
;467:#define TIME_FADEOUT	200 
;468:/*
;469:===============
;470:CG_Flare
;471:===============
;472:*/   
;473:static void CG_Flare( centity_t *cent, vec3_t lerpOrigin, float size, float r, float g, float b, qboolean showCorona ) {
line 482
;474:	refEntity_t			ent; 
;475:	trace_t				trace;
;476:	float				distance;
;477:	vec3_t				angles;
;478:	int					i;
;479:	vec3_t				forward;
;480:	vec3_t				middle;
;481:	float				dot;
;482:	float				radius = 1;
ADDRLP4 216
CNSTF4 1065353216
ASGNF4
line 483
;483:	float				a = 1.0f;
ADDRLP4 252
CNSTF4 1065353216
ASGNF4
line 484
;484:	int					weaponstate = cg.snap->ps.weaponstate;
ADDRLP4 248
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 486
;485:
;486:	AngleVectors( cg.refdefViewAngles, forward,NULL,NULL );
ADDRGP4 cg+109412
ARGP4
ADDRLP4 224
ARGP4
ADDRLP4 256
CNSTP4 0
ASGNP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 488
;487:
;488:	VectorSubtract( cg.refdef.vieworg, lerpOrigin , angles );
ADDRLP4 260
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
ADDRGP4 cg+109044+24
INDIRF4
ADDRLP4 260
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRGP4 cg+109044+24+4
INDIRF4
ADDRLP4 260
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRGP4 cg+109044+24+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 490
;489:	
;490:	VectorNormalize( angles );
ADDRLP4 144
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 491
;491:	dot = DotProduct (angles, forward);
ADDRLP4 220
ADDRLP4 144
INDIRF4
ADDRLP4 224
INDIRF4
MULF4
ADDRLP4 144+4
INDIRF4
ADDRLP4 224+4
INDIRF4
MULF4
ADDF4
ADDRLP4 144+8
INDIRF4
ADDRLP4 224+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 495
;492:	
;493:	// not in same point contents
;494:	if ( 
;495:		 CG_PointContents( cg.refdef.vieworg , -1 ) & CONTENTS_WATER
ADDRGP4 cg+109044+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 264
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $252
line 497
;496:		)
;497:	{
line 499
;498://		CG_Printf("Flare not in same contents.\n");
;499:		return;
ADDRGP4 $235
JUMPV
LABELV $252
line 503
;500:	}
;501:
;502:	// if the flare isn't in the screen of the player don't render
;503:	if ( dot < -1 )
ADDRLP4 220
INDIRF4
CNSTF4 3212836864
GEF4 $256
line 504
;504:	{
line 505
;505:		cent->miscTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 0
ASGNI4
line 507
;506://		CG_Printf("Flare out of screen.\n");
;507:		return;
ADDRGP4 $235
JUMPV
LABELV $256
line 509
;508:	}
;509:	else if ( dot > -0.60 )
ADDRLP4 220
INDIRF4
CNSTF4 3206125978
LEF4 $258
line 510
;510:	{
line 511
;511:		cent->miscTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 0
ASGNI4
line 513
;512://		CG_Printf("Flare out of screen.\n");
;513:		return;
ADDRGP4 $235
JUMPV
LABELV $258
line 517
;514:	}
;515: 
;516:	// trace a line from flare origin to viewpoint to see if it's visible
;517:	CG_Trace( &trace, cg.refdef.vieworg, NULL, NULL, lerpOrigin, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 160
ARGP4
ADDRGP4 cg+109044+24
ARGP4
ADDRLP4 268
CNSTP4 0
ASGNP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 520
;518:
;519:	// if the flare is blocked, forget it
;520:	if (trace.fraction < 1 )
ADDRLP4 160+8
INDIRF4
CNSTF4 1065353216
GEF4 $264
line 521
;521:	{
line 522
;522:		if ( showCorona && cent )
ADDRFP4 24
INDIRI4
CNSTI4 0
EQI4 $235
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $235
line 523
;523:		{
line 524
;524:			int t = cent->miscTime - cg.time;
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 526
;525:
;526:			if ( t > 0 )
ADDRLP4 272
INDIRI4
CNSTI4 0
LEI4 $235
line 527
;527:			{
line 529
;528:				// get alpha
;529:				a = (float)(t / (float)TIME_FADEOUT);
ADDRLP4 252
ADDRLP4 272
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
ASGNF4
line 532
;530:
;531:				// create the base flare entity
;532:				memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 534
;533:
;534:				VectorCopy( lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 535
;535:				VectorCopy( lerpOrigin, ent.oldorigin); 
ADDRLP4 0+84
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 537
;536:
;537:				distance = Distance( cg.refdef.vieworg, lerpOrigin);
ADDRGP4 cg+109044+24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 276
INDIRF4
ASGNF4
line 539
;538:
;539:				if ( !BG_IsZooming(cg.snap->ps.stats[STAT_WEAPONMODE] ) ||
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 284
CNSTI4 0
ASGNI4
ADDRLP4 280
INDIRI4
ADDRLP4 284
INDIRI4
EQI4 $281
ADDRGP4 cg+107628
INDIRI4
ADDRLP4 284
INDIRI4
NEI4 $281
ADDRLP4 248
INDIRI4
CNSTI4 3
EQI4 $276
ADDRLP4 248
INDIRI4
CNSTI4 4
EQI4 $276
ADDRLP4 248
INDIRI4
CNSTI4 5
EQI4 $276
ADDRLP4 248
INDIRI4
ADDRLP4 284
INDIRI4
EQI4 $276
LABELV $281
line 543
;540:					cg.renderingThirdPerson ||
;541:					( weaponstate != WEAPON_FIRING && weaponstate !=	WEAPON_FIRING2 && weaponstate != WEAPON_FIRING3 && weaponstate != WEAPON_READY )
;542:					)
;543:					ent.radius = 1 + ( size * distance/175 ); 
ADDRLP4 0+132
ADDRFP4 8
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
CNSTF4 1127153664
DIVF4
CNSTF4 1065353216
ADDF4
ASGNF4
ADDRGP4 $277
JUMPV
LABELV $276
line 545
;544:				else
;545:				{
line 548
;546:					float newdist;
;547:
;548:					newdist = distance;
ADDRLP4 292
ADDRLP4 156
INDIRF4
ASGNF4
line 549
;549:					newdist -= 30;
ADDRLP4 292
ADDRLP4 292
INDIRF4
CNSTF4 1106247680
SUBF4
ASGNF4
line 550
;550:					if (newdist < 0.0f )
ADDRLP4 292
INDIRF4
CNSTF4 0
GEF4 $283
line 551
;551:						newdist = 0.0f;
ADDRLP4 292
CNSTF4 0
ASGNF4
LABELV $283
line 553
;552:
;553:					ent.radius = ( size * newdist/85 );
ADDRLP4 0+132
ADDRFP4 8
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
CNSTF4 1118437376
DIVF4
ASGNF4
line 554
;554:				} 
LABELV $277
line 557
;555:					 
;556:
;557:				ent.reType = RT_SPRITE;	
ADDRLP4 0
CNSTI4 2
ASGNI4
line 558
;558:				ent.renderfx = RF_DEPTHHACK;
ADDRLP4 0+4
CNSTI4 8
ASGNI4
line 559
;559:				ent.rotation = distance;
ADDRLP4 0+136
ADDRLP4 156
INDIRF4
ASGNF4
line 560
;560:				ent.customShader =  cgs.media.flare;
ADDRLP4 0+112
ADDRGP4 cgs+205084+716
INDIRI4
ASGNI4
line 563
;561:
;562:
;563:				if ( distance > DIST_START_FADE )
ADDRLP4 156
INDIRF4
CNSTF4 1157234688
LEF4 $291
line 564
;564:				{
line 566
;565:
;566:					if ( distance <= 0 )
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $293
line 567
;567:						distance = 0;
ADDRLP4 156
CNSTF4 0
ASGNF4
LABELV $293
line 569
;568:
;569:					if ( distance > DIST_END_FADE )
ADDRLP4 156
INDIRF4
CNSTF4 1161527296
LEF4 $295
line 570
;570:						distance = DIST_END_FADE;
ADDRLP4 156
CNSTF4 1161527296
ASGNF4
LABELV $295
line 572
;571:
;572:					a = a - ( (distance-DIST_START_FADE) / 1000.0f);
ADDRLP4 252
ADDRLP4 252
INDIRF4
ADDRLP4 156
INDIRF4
CNSTF4 1157234688
SUBF4
CNSTF4 1148846080
DIVF4
SUBF4
ASGNF4
line 575
;573:
;574:					// it already faded out
;575:					if ( a <= 0.0f )
ADDRLP4 252
INDIRF4
CNSTF4 0
GTF4 $297
line 576
;576:						a = 0.0f;
ADDRLP4 252
CNSTF4 0
ASGNF4
LABELV $297
line 577
;577:				}
LABELV $291
line 581
;578:				// alpha fade | custom color
;579:				// --- //
;580:				//
;581:				{
line 583
;582:
;583:					r /= 100.0f;
ADDRFP4 12
ADDRFP4 12
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 584
;584:					g /= 100.0f;
ADDRFP4 16
ADDRFP4 16
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 585
;585:					b /= 100.0f;
ADDRFP4 20
ADDRFP4 20
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 587
;586:
;587:					ent.shaderRGBA[0] = 0xff * r; 
ADDRLP4 296
CNSTF4 1132396544
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 300
CNSTF4 1325400064
ASGNF4
ADDRLP4 296
INDIRF4
ADDRLP4 300
INDIRF4
LTF4 $301
ADDRLP4 292
ADDRLP4 296
INDIRF4
ADDRLP4 300
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $302
JUMPV
LABELV $301
ADDRLP4 292
ADDRLP4 296
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $302
ADDRLP4 0+116
ADDRLP4 292
INDIRU4
CVUU1 4
ASGNU1
line 588
;588:					ent.shaderRGBA[1] = 0xff * g; 
ADDRLP4 308
CNSTF4 1132396544
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 312
CNSTF4 1325400064
ASGNF4
ADDRLP4 308
INDIRF4
ADDRLP4 312
INDIRF4
LTF4 $306
ADDRLP4 304
ADDRLP4 308
INDIRF4
ADDRLP4 312
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $307
JUMPV
LABELV $306
ADDRLP4 304
ADDRLP4 308
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $307
ADDRLP4 0+116+1
ADDRLP4 304
INDIRU4
CVUU1 4
ASGNU1
line 589
;589:					ent.shaderRGBA[2] = 0xff * b; 
ADDRLP4 320
CNSTF4 1132396544
ADDRFP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 324
CNSTF4 1325400064
ASGNF4
ADDRLP4 320
INDIRF4
ADDRLP4 324
INDIRF4
LTF4 $311
ADDRLP4 316
ADDRLP4 320
INDIRF4
ADDRLP4 324
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $312
JUMPV
LABELV $311
ADDRLP4 316
ADDRLP4 320
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $312
ADDRLP4 0+116+2
ADDRLP4 316
INDIRU4
CVUU1 4
ASGNU1
line 590
;590:					ent.shaderRGBA[3] = 0xff * a;  
ADDRLP4 332
CNSTF4 1132396544
ADDRLP4 252
INDIRF4
MULF4
ASGNF4
ADDRLP4 336
CNSTF4 1325400064
ASGNF4
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
LTF4 $316
ADDRLP4 328
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $317
JUMPV
LABELV $316
ADDRLP4 328
ADDRLP4 332
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $317
ADDRLP4 0+116+3
ADDRLP4 328
INDIRU4
CVUU1 4
ASGNU1
line 591
;591:				}
line 594
;592:
;593://				CG_Printf("rendering flare invisible w/ alpha %f and %i\n", a , t);
;594:  				trap_R_AddRefEntityToScene( &ent ); 
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 595
;595:			}
line 596
;596:		}
line 598
;597://		CG_Printf("Flare not inline with player (blocked).\n");
;598:		return;
ADDRGP4 $235
JUMPV
LABELV $264
line 601
;599:	}
;600:
;601:	if ( cent && showCorona ) // set fadeout time
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $318
ADDRFP4 24
INDIRI4
CNSTI4 0
EQI4 $318
line 602
;602:	{
line 603
;603:		cent->miscTime = cg.time + TIME_FADEOUT;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 605
;604:	//	CG_Printf("flare visible setted flaretime to %i\n", TIME_FADEOUT );
;605:	}
LABELV $318
line 607
;606:
;607:	distance = Distance( cg.refdef.vieworg, lerpOrigin);
ADDRGP4 cg+109044+24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 272
INDIRF4
ASGNF4
line 609
;608:
;609:	VectorMA( cg.refdef.vieworg,  distance/2 , forward, middle );
ADDRLP4 276
ADDRLP4 156
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
ADDRLP4 236
ADDRGP4 cg+109044+24
INDIRF4
ADDRLP4 224
INDIRF4
ADDRLP4 276
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236+4
ADDRGP4 cg+109044+24+4
INDIRF4
ADDRLP4 224+4
INDIRF4
ADDRLP4 276
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236+8
ADDRGP4 cg+109044+24+8
INDIRF4
ADDRLP4 224+8
INDIRF4
ADDRLP4 156
INDIRF4
CNSTF4 1073741824
DIVF4
MULF4
ADDF4
ASGNF4
line 610
;610:	VectorSubtract(middle, lerpOrigin , angles );
ADDRLP4 280
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 236
INDIRF4
ADDRLP4 280
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 236+4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 236+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 611
;611:	VectorNormalize( angles );
ADDRLP4 144
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 617
;612:	 
;613://	CG_Printf("Distance: %f Dot: %f\n", distance, dot);
;614: 
;615:
;616:	// create the base flare entity
;617:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 619
;618:
;619:	VectorCopy( lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 620
;620:	VectorCopy( lerpOrigin, ent.oldorigin);  
ADDRLP4 0+84
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 622
;621:	
;622:	if ( !BG_IsZooming( cg.snap->ps.stats[STAT_WEAPONMODE] ) ||
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ARGI4
ADDRLP4 284
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 288
CNSTI4 0
ASGNI4
ADDRLP4 284
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $345
ADDRGP4 cg+107628
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $341
LABELV $345
line 624
;623:		cg.renderingThirdPerson )
;624:	{
line 627
;625:		float newdist;
;626:
;627:		newdist = distance;
ADDRLP4 292
ADDRLP4 156
INDIRF4
ASGNF4
line 628
;628:		newdist -= 30;
ADDRLP4 292
ADDRLP4 292
INDIRF4
CNSTF4 1106247680
SUBF4
ASGNF4
line 629
;629:		if (newdist < 0.0f )
ADDRLP4 292
INDIRF4
CNSTF4 0
GEF4 $346
line 630
;630:			newdist = 0.0f;
ADDRLP4 292
CNSTF4 0
ASGNF4
LABELV $346
line 632
;631:
;632:		ent.radius = ( size * newdist/175 );
ADDRLP4 0+132
ADDRFP4 8
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
CNSTF4 1127153664
DIVF4
ASGNF4
line 633
;633:	}
ADDRGP4 $342
JUMPV
LABELV $341
line 635
;634:	else 
;635:		ent.radius = 1 + ( size * distance/85 );
ADDRLP4 0+132
ADDRFP4 8
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
CNSTF4 1118437376
DIVF4
CNSTF4 1065353216
ADDF4
ASGNF4
LABELV $342
line 637
;636:
;637:	if ( distance > DIST_START_FADE )
ADDRLP4 156
INDIRF4
CNSTF4 1157234688
LEF4 $350
line 638
;638:	{
line 640
;639:
;640:		if ( distance <= 0 )
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $352
line 641
;641:			distance = 0;
ADDRLP4 156
CNSTF4 0
ASGNF4
LABELV $352
line 643
;642:
;643:		if ( distance > DIST_END_FADE )
ADDRLP4 156
INDIRF4
CNSTF4 1161527296
LEF4 $354
line 644
;644:			distance = DIST_END_FADE;
ADDRLP4 156
CNSTF4 1161527296
ASGNF4
LABELV $354
line 646
;645:
;646:		a = 1.0f - ( (distance-DIST_START_FADE) / 1000.0f);
ADDRLP4 252
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
CNSTF4 1157234688
SUBF4
CNSTF4 1148846080
DIVF4
SUBF4
ASGNF4
line 648
;647: 
;648:	}
LABELV $350
line 651
;649://	CG_Printf("a %f dist %f \n", a, distance);
;650: 
;651: 	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 653
;652:	
;653:	ent.renderfx = RF_DEPTHHACK;
ADDRLP4 0+4
CNSTI4 8
ASGNI4
line 654
;654:	ent.rotation = distance;
ADDRLP4 0+136
ADDRLP4 156
INDIRF4
ASGNF4
line 655
;655:	ent.customShader =  cgs.media.flare;
ADDRLP4 0+112
ADDRGP4 cgs+205084+716
INDIRI4
ASGNI4
line 658
;656:
;657:	// alpha fade | custom color  
;658:	r /= 100.0f;
ADDRFP4 12
ADDRFP4 12
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 659
;659:	g /= 100.0f;
ADDRFP4 16
ADDRFP4 16
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 660
;660:	b /= 100.0f;
ADDRFP4 20
ADDRFP4 20
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 662
;661:
;662:	ent.shaderRGBA[0] = 0xff * r; 
ADDRLP4 296
CNSTF4 1132396544
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 300
CNSTF4 1325400064
ASGNF4
ADDRLP4 296
INDIRF4
ADDRLP4 300
INDIRF4
LTF4 $363
ADDRLP4 292
ADDRLP4 296
INDIRF4
ADDRLP4 300
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $364
JUMPV
LABELV $363
ADDRLP4 292
ADDRLP4 296
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $364
ADDRLP4 0+116
ADDRLP4 292
INDIRU4
CVUU1 4
ASGNU1
line 663
;663:	ent.shaderRGBA[1] = 0xff * g; 
ADDRLP4 308
CNSTF4 1132396544
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 312
CNSTF4 1325400064
ASGNF4
ADDRLP4 308
INDIRF4
ADDRLP4 312
INDIRF4
LTF4 $368
ADDRLP4 304
ADDRLP4 308
INDIRF4
ADDRLP4 312
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $369
JUMPV
LABELV $368
ADDRLP4 304
ADDRLP4 308
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $369
ADDRLP4 0+116+1
ADDRLP4 304
INDIRU4
CVUU1 4
ASGNU1
line 664
;664:	ent.shaderRGBA[2] = 0xff * b; 
ADDRLP4 320
CNSTF4 1132396544
ADDRFP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 324
CNSTF4 1325400064
ASGNF4
ADDRLP4 320
INDIRF4
ADDRLP4 324
INDIRF4
LTF4 $373
ADDRLP4 316
ADDRLP4 320
INDIRF4
ADDRLP4 324
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $374
JUMPV
LABELV $373
ADDRLP4 316
ADDRLP4 320
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $374
ADDRLP4 0+116+2
ADDRLP4 316
INDIRU4
CVUU1 4
ASGNU1
line 665
;665:	ent.shaderRGBA[3] = 0xff * a;   
ADDRLP4 332
CNSTF4 1132396544
ADDRLP4 252
INDIRF4
MULF4
ASGNF4
ADDRLP4 336
CNSTF4 1325400064
ASGNF4
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
LTF4 $378
ADDRLP4 328
ADDRLP4 332
INDIRF4
ADDRLP4 336
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $379
JUMPV
LABELV $378
ADDRLP4 328
ADDRLP4 332
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $379
ADDRLP4 0+116+3
ADDRLP4 328
INDIRU4
CVUU1 4
ASGNU1
line 670
;666:
;667:	//
;668:	// show corona?
;669:	//
;670:	if ( showCorona )
ADDRFP4 24
INDIRI4
CNSTI4 0
EQI4 $380
line 671
;671:		trap_R_AddRefEntityToScene( &ent );  
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
LABELV $380
line 676
;672:
;673:	//
;674:	// only render circlers / flash if we're scoping
;675:	//
;676:	if ( !BG_IsZooming(cg.snap->ps.stats[STAT_WEAPONMODE] ) ||
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ARGI4
ADDRLP4 340
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 344
CNSTI4 0
ASGNI4
ADDRLP4 340
INDIRI4
ADDRLP4 344
INDIRI4
EQI4 $387
ADDRGP4 cg+107628
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $387
ADDRLP4 248
INDIRI4
CNSTI4 3
EQI4 $382
ADDRLP4 248
INDIRI4
CNSTI4 4
EQI4 $382
ADDRLP4 248
INDIRI4
CNSTI4 5
EQI4 $382
ADDRLP4 248
INDIRI4
ADDRLP4 344
INDIRI4
EQI4 $382
LABELV $387
line 680
;677:		cg.renderingThirdPerson ||
;678:		( weaponstate != WEAPON_FIRING && weaponstate !=	WEAPON_FIRING2 && weaponstate != WEAPON_FIRING3 && weaponstate != WEAPON_READY )
;679:		)
;680:		return;
ADDRGP4 $235
JUMPV
LABELV $382
line 685
;681:
;682:	//
;683:	// blend code [ when looking directly into a flare with a scope the screen gets blended white ]
;684:	//
;685:	if ( dot >= -1.0f && dot <= -0.999f )
ADDRLP4 220
INDIRF4
CNSTF4 3212836864
LTF4 $388
ADDRLP4 220
INDIRF4
CNSTF4 3212820087
GTF4 $388
line 686
;686:	{
line 689
;687:		float alpha;
;688:		
;689:		alpha = -dot;
ADDRLP4 356
ADDRLP4 220
INDIRF4
NEGF4
ASGNF4
line 690
;690:		alpha -= 0.999f;
ADDRLP4 356
ADDRLP4 356
INDIRF4
CNSTF4 1065336439
SUBF4
ASGNF4
line 691
;691:		alpha *= 1000;
ADDRLP4 356
CNSTF4 1148846080
ADDRLP4 356
INDIRF4
MULF4
ASGNF4
line 693
;692:		 
;693:		if ( alpha > cg.blendAlpha )
ADDRLP4 356
INDIRF4
ADDRGP4 cg+117888
INDIRF4
LEF4 $390
line 694
;694:		{
line 695
;695:			cg.blendAlpha = alpha;  
ADDRGP4 cg+117888
ADDRLP4 356
INDIRF4
ASGNF4
line 696
;696:		}
LABELV $390
line 697
;697:	}
LABELV $388
line 702
;698:
;699:	//
;700:	// check if the flare is inside our scope. if not , or close the boarders then close the circles
;701:	//
;702:	if ( dot < -0.925 && dot > -0.975 )
ADDRLP4 220
INDIRF4
CNSTF4 3211578573
GEF4 $394
ADDRLP4 220
INDIRF4
CNSTF4 3212417434
LEF4 $394
line 703
;703:	{
line 704
;704:		radius = -dot;
ADDRLP4 216
ADDRLP4 220
INDIRF4
NEGF4
ASGNF4
line 705
;705:		radius -= 0.925f;
ADDRLP4 216
ADDRLP4 216
INDIRF4
CNSTF4 1064094925
SUBF4
ASGNF4
line 706
;706:		radius *= 20;
ADDRLP4 216
CNSTF4 1101004800
ADDRLP4 216
INDIRF4
MULF4
ASGNF4
line 708
;707:
;708:		if ( radius <= 0 )
ADDRLP4 216
INDIRF4
CNSTF4 0
GTF4 $395
line 709
;709:			return;
ADDRGP4 $235
JUMPV
line 711
;710:
;711:	}
LABELV $394
line 712
;712:	else if ( dot > -0.925 )
ADDRLP4 220
INDIRF4
CNSTF4 3211578573
LEF4 $398
line 713
;713:		return;
ADDRGP4 $235
JUMPV
LABELV $398
LABELV $395
line 717
;714: 
;715: //	CG_Printf("flare dot(%f) distance(%f)\n",  dot, distance);
;716:
;717:	for ( i = 1; i < SUB_FLARES + 1; i ++ )
ADDRLP4 140
CNSTI4 1
ASGNI4
LABELV $400
line 718
;718:	{
line 719
;719:		if ( i == 1 )
ADDRLP4 140
INDIRI4
CNSTI4 1
NEI4 $404
line 720
;720:		{
line 721
;721:			ent.radius = 2.5;
ADDRLP4 0+132
CNSTF4 1075838976
ASGNF4
line 722
;722:			ent.customShader = cgs.media.flare_flare_green;
ADDRLP4 0+112
ADDRGP4 cgs+205084+436
INDIRI4
ASGNI4
line 723
;723:			ent.shaderRGBA[3] = 100;  
ADDRLP4 0+116+3
CNSTU1 100
ASGNU1
line 724
;724:		}
ADDRGP4 $405
JUMPV
LABELV $404
line 725
;725:		else if ( i == 2 )
ADDRLP4 140
INDIRI4
CNSTI4 2
NEI4 $412
line 726
;726:		{
line 727
;727:			ent.radius = 5;
ADDRLP4 0+132
CNSTF4 1084227584
ASGNF4
line 728
;728:			ent.customShader = cgs.media.flare_circle_green;
ADDRLP4 0+112
ADDRGP4 cgs+205084+444
INDIRI4
ASGNI4
line 729
;729:			ent.shaderRGBA[3] = 60;  
ADDRLP4 0+116+3
CNSTU1 60
ASGNU1
line 730
;730:		}
ADDRGP4 $413
JUMPV
LABELV $412
line 731
;731:		else if ( i == 3 )
ADDRLP4 140
INDIRI4
CNSTI4 3
NEI4 $420
line 732
;732:		{
line 733
;733:			ent.radius = 3.7f;
ADDRLP4 0+132
CNSTF4 1080872141
ASGNF4
line 734
;734:			ent.customShader = cgs.media.flare_circle_green;
ADDRLP4 0+112
ADDRGP4 cgs+205084+444
INDIRI4
ASGNI4
line 735
;735:			ent.shaderRGBA[3] = 80;  
ADDRLP4 0+116+3
CNSTU1 80
ASGNU1
line 736
;736:		}
ADDRGP4 $421
JUMPV
LABELV $420
line 737
;737:		else if ( i == 4 )
ADDRLP4 140
INDIRI4
CNSTI4 4
NEI4 $428
line 738
;738:		{
line 739
;739:			ent.radius = 3;
ADDRLP4 0+132
CNSTF4 1077936128
ASGNF4
line 740
;740:			ent.customShader = cgs.media.flare_circle_orange;
ADDRLP4 0+112
ADDRGP4 cgs+205084+448
INDIRI4
ASGNI4
line 741
;741:			ent.shaderRGBA[3] = 120;  
ADDRLP4 0+116+3
CNSTU1 120
ASGNU1
line 742
;742:		}
ADDRGP4 $429
JUMPV
LABELV $428
line 743
;743:		else if ( i == 5 )
ADDRLP4 140
INDIRI4
CNSTI4 5
NEI4 $436
line 744
;744:		{
line 745
;745:			ent.radius = 2;
ADDRLP4 0+132
CNSTF4 1073741824
ASGNF4
line 746
;746:			ent.customShader = cgs.media.flare_flare_turkis;
ADDRLP4 0+112
ADDRGP4 cgs+205084+440
INDIRI4
ASGNI4
line 747
;747:			ent.shaderRGBA[3] = 230;  
ADDRLP4 0+116+3
CNSTU1 230
ASGNU1
line 748
;748:		}
ADDRGP4 $437
JUMPV
LABELV $436
line 749
;749:		else if ( i == 6 )
ADDRLP4 140
INDIRI4
CNSTI4 6
NEI4 $444
line 750
;750:		{
line 751
;751:			ent.radius = 4;
ADDRLP4 0+132
CNSTF4 1082130432
ASGNF4
line 752
;752:			ent.customShader = cgs.media.flare_flare_turkis;
ADDRLP4 0+112
ADDRGP4 cgs+205084+440
INDIRI4
ASGNI4
line 753
;753:			ent.shaderRGBA[3] = 100;  
ADDRLP4 0+116+3
CNSTU1 100
ASGNU1
line 754
;754:		}
ADDRGP4 $445
JUMPV
LABELV $444
line 755
;755:		else if ( i == 7 )
ADDRLP4 140
INDIRI4
CNSTI4 7
NEI4 $452
line 756
;756:		{
line 757
;757:			ent.radius = 6;
ADDRLP4 0+132
CNSTF4 1086324736
ASGNF4
line 758
;758:			ent.customShader = cgs.media.flare_circle_orange;
ADDRLP4 0+112
ADDRGP4 cgs+205084+448
INDIRI4
ASGNI4
line 759
;759:			ent.shaderRGBA[3] = 140;  
ADDRLP4 0+116+3
CNSTU1 140
ASGNU1
line 760
;760:		}
ADDRGP4 $453
JUMPV
LABELV $452
line 761
;761:		else if ( i == 7 )
ADDRLP4 140
INDIRI4
CNSTI4 7
NEI4 $460
line 762
;762:		{
line 763
;763:			ent.radius = 8;
ADDRLP4 0+132
CNSTF4 1090519040
ASGNF4
line 764
;764:			ent.customShader = cgs.media.flare_circle_fadein;
ADDRLP4 0+112
ADDRGP4 cgs+205084+432
INDIRI4
ASGNI4
line 765
;765:			ent.shaderRGBA[3] = 200;  
ADDRLP4 0+116+3
CNSTU1 200
ASGNU1
line 766
;766:		}
ADDRGP4 $461
JUMPV
LABELV $460
line 767
;767:		else if ( i == 8 )
ADDRLP4 140
INDIRI4
CNSTI4 8
NEI4 $468
line 768
;768:		{
line 769
;769:			ent.radius = 4;
ADDRLP4 0+132
CNSTF4 1082130432
ASGNF4
line 770
;770:			ent.customShader = cgs.media.flare_flare_turkis;
ADDRLP4 0+112
ADDRGP4 cgs+205084+440
INDIRI4
ASGNI4
line 771
;771:			ent.shaderRGBA[3] = 140;  
ADDRLP4 0+116+3
CNSTU1 140
ASGNU1
line 772
;772:		}
ADDRGP4 $469
JUMPV
LABELV $468
line 773
;773:		else if ( i == 9 )
ADDRLP4 140
INDIRI4
CNSTI4 9
NEI4 $476
line 774
;774:		{
line 775
;775:			ent.radius = 12;
ADDRLP4 0+132
CNSTF4 1094713344
ASGNF4
line 776
;776:			ent.customShader = cgs.media.flare_circle_blue;
ADDRLP4 0+112
ADDRGP4 cgs+205084+428
INDIRI4
ASGNI4
line 777
;777:			ent.shaderRGBA[3] = 200;  
ADDRLP4 0+116+3
CNSTU1 200
ASGNU1
line 778
;778:		}
ADDRGP4 $477
JUMPV
LABELV $476
line 779
;779:		else if ( i == 10 )
ADDRLP4 140
INDIRI4
CNSTI4 10
NEI4 $484
line 780
;780:		{
line 781
;781:			ent.radius = 8;
ADDRLP4 0+132
CNSTF4 1090519040
ASGNF4
line 782
;782:			ent.customShader = cgs.media.flare_circle_fadein;
ADDRLP4 0+112
ADDRGP4 cgs+205084+432
INDIRI4
ASGNI4
line 783
;783:			ent.shaderRGBA[3] = 180;  
ADDRLP4 0+116+3
CNSTU1 180
ASGNU1
line 784
;784:		}
ADDRGP4 $485
JUMPV
LABELV $484
line 785
;785:		else if ( i == 11 )
ADDRLP4 140
INDIRI4
CNSTI4 11
NEI4 $492
line 786
;786:		{
line 787
;787:			ent.radius = 16;
ADDRLP4 0+132
CNSTF4 1098907648
ASGNF4
line 788
;788:			ent.customShader = cgs.media.flare_circle_rainbow;
ADDRLP4 0+112
ADDRGP4 cgs+205084+452
INDIRI4
ASGNI4
line 789
;789:			ent.shaderRGBA[3] = 240;  
ADDRLP4 0+116+3
CNSTU1 240
ASGNU1
line 790
;790:		}
LABELV $492
LABELV $485
LABELV $477
LABELV $469
LABELV $461
LABELV $453
LABELV $445
LABELV $437
LABELV $429
LABELV $421
LABELV $413
LABELV $405
line 792
;791:
;792:		ent.shaderRGBA[3] *= radius;
ADDRLP4 364
ADDRLP4 0+116+3
INDIRU1
CVUI4 1
CVIF4 4
ADDRLP4 216
INDIRF4
MULF4
ASGNF4
ADDRLP4 368
CNSTF4 1325400064
ASGNF4
ADDRLP4 364
INDIRF4
ADDRLP4 368
INDIRF4
LTF4 $503
ADDRLP4 360
ADDRLP4 364
INDIRF4
ADDRLP4 368
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $504
JUMPV
LABELV $503
ADDRLP4 360
ADDRLP4 364
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $504
ADDRLP4 0+116+3
ADDRLP4 360
INDIRU4
CVUU1 4
ASGNU1
line 793
;793:		ent.radius *= radius;
ADDRLP4 0+132
ADDRLP4 0+132
INDIRF4
ADDRLP4 216
INDIRF4
MULF4
ASGNF4
line 795
;794:
;795:		VectorMA( trace.endpos,  (distance/SUB_FLARES + 1)*i-30 , angles, ent.origin );
ADDRLP4 0+68
ADDRLP4 160+12
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 156
INDIRF4
CNSTF4 1093664768
DIVF4
CNSTF4 1065353216
ADDF4
ADDRLP4 140
INDIRI4
CVIF4 4
MULF4
CNSTF4 1106247680
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 160+12+4
INDIRF4
ADDRLP4 144+4
INDIRF4
ADDRLP4 156
INDIRF4
CNSTF4 1093664768
DIVF4
CNSTF4 1065353216
ADDF4
ADDRLP4 140
INDIRI4
CVIF4 4
MULF4
CNSTF4 1106247680
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 160+12+8
INDIRF4
ADDRLP4 144+8
INDIRF4
ADDRLP4 156
INDIRF4
CNSTF4 1093664768
DIVF4
CNSTF4 1065353216
ADDF4
ADDRLP4 140
INDIRI4
CVIF4 4
MULF4
CNSTF4 1106247680
SUBF4
MULF4
ADDF4
ASGNF4
line 797
;796:	
;797:		trap_R_AddRefEntityToScene( &ent ); 
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 798
;798:	} 
LABELV $401
line 717
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 12
LTI4 $400
line 800
;799: 
;800:	return; 
LABELV $235
endproc CG_Flare 372 28
export _CG_Flare
proc _CG_Flare 0 28
line 804
;801:}
;802:
;803:void _CG_Flare( centity_t *cent, vec3_t lerpOrigin, float size, float r, float g, float b, qboolean showCorona )
;804:{
line 805
;805:	CG_Flare(cent,lerpOrigin,size,r,g,b,showCorona );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 CG_Flare
CALLV
pop
line 806
;806:}
LABELV $518
endproc _CG_Flare 0 28
proc CG_WaterBulletTrail 72 12
line 813
;807:/*
;808:==========================
;809:CG_WaterBulletTrail
;810:==========================
;811:*/
;812:void CG_RealBloodTrail( vec3_t start, vec3_t end, float spacing );
;813:static void CG_WaterBulletTrail( centity_t *ent ) {
line 822
;814:	int		step;
;815:	vec3_t	origin, lastPos;
;816:	int		t;
;817:	int		startTime, contents;
;818:	int		lastContents;
;819:	entityState_t	*es;
;820:	vec3_t	up;
;821: 
;822:	up[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 823
;823:	up[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 824
;824:	up[2] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 826
;825:
;826:	step = 35;
ADDRLP4 0
CNSTI4 35
ASGNI4
line 828
;827:
;828:	es = &ent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 829
;829:	startTime = ent->trailTime;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 830
;830:	t = step * ( (startTime + step) / step );
ADDRLP4 56
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
DIVI4
MULI4
ASGNI4
line 832
;831:
;832:	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 833
;833:	contents = CG_PointContents( origin, -1 );
ADDRLP4 20
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 64
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 64
INDIRI4
ASGNI4
line 836
;834:
;835:	// if object (e.g. grenade) is stationary, don't toss up smoke
;836:	if ( es->pos.trType == TR_STATIONARY ) {
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $523
line 837
;837:		ent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 838
;838:		return;
ADDRGP4 $519
JUMPV
LABELV $523
line 841
;839:	}
;840:
;841:	BG_EvaluateTrajectory( &es->pos, ent->trailTime, lastPos );
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 842
;842:	lastContents = CG_PointContents( lastPos, -1 );
ADDRLP4 32
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 68
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 68
INDIRI4
ASGNI4
line 844
;843:
;844:	ent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 846
;845:
;846:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 44
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $527
line 847
;847:		if ( contents & lastContents & CONTENTS_WATER ) {
ADDRLP4 44
INDIRI4
ADDRLP4 52
INDIRI4
BANDI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $519
line 848
;848:			CG_BubbleTrail( lastPos, origin, 8 );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 CG_BubbleTrail
CALLV
pop
line 849
;849:		}
line 850
;850:		return;
ADDRGP4 $519
JUMPV
LABELV $527
line 869
;851:	}
;852:
;853:	/*
;854:	for ( ; t <= ent->trailTime ; t += step ) {
;855:		BG_EvaluateTrajectory( &es->pos, t, lastPos );
;856:  
;857:
;858:		smoke = CG_SmokePuff( lastPos, up, 
;859:					  4, 
;860:					  1, 1, 1, 0.33f,
;861:					  1000, 
;862:					  cg.time,
;863:					  0, 0,
;864:					  cgs.media.smokePuffShader );
;865:		// use the optimized local entity add
;866:		smoke->leType = LE_SCALE_FADE;
;867:	}*/
;868:	// add trails 
;869:	if ( ent->currentState.powerups & ( 1 << 1 ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $531
line 871
;870:		/// blood trail 
;871:		CG_RealBloodTrail( lastPos, origin, 15 ); 
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
CNSTF4 1097859072
ARGF4
ADDRGP4 CG_RealBloodTrail
CALLV
pop
line 872
;872:	}
LABELV $531
line 873
;873:	if ( ent->currentState.powerups & ( 1 << 2 ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $533
line 876
;874:		// water trail
;875:		// blood trail
;876:	}
LABELV $533
line 877
;877:	if ( ent->currentState.powerups & ( 1 << 3 ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $535
line 879
;878:		// misc trail.
;879:	}
LABELV $535
line 880
;880:} 
LABELV $519
endproc CG_WaterBulletTrail 72 12
proc CG_BulletEnt 280 28
line 888
;881:/*
;882:
;883:/*
;884:===============
;885:CG_Bullet
;886:===============
;887:*/
;888:static void CG_BulletEnt( centity_t *cent ) {
line 896
;889:	entityState_t		*s1; 
;890:	vec3_t	oldOrigin;
;891://	int	col;
;892:	vec4_t		rgba;
;893:	vec3_t	curOrigin;
;894:	refEntity_t			ent;
;895:
;896:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 898
;897:
;898:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 26
LEI4 $538
line 899
;899:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 900
;900:	}
LABELV $538
line 904
;901:	  
;902:
;903:	// calculate the axis
;904:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 907
;905:
;906:	// 'prediction'
;907:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time,  curOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 172
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 909
;908://	CG_Printf("%s %s\n", vtos(cent->lerpOrigin ), vtos(curOrigin ) );
;909:	VectorCopy( curOrigin, cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 172
INDIRB
ASGNB 12
line 911
;910:
;911:	CG_WaterBulletTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_WaterBulletTrail
CALLV
pop
line 920
;912:
;913:	// add dynamic light
;914: 
;915://	BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
;916:
;917://	trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, cgs.media.tracerSound  );
;918: 
;919:	
;920:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time - cg_bulletTracerLength.value, oldOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ADDRGP4 cg_bulletTracerLength+8
INDIRF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 160
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 922
;921:
;922:	rgba[0] = rgba[1] = rgba[2] = 1;
ADDRLP4 184
CNSTF4 1065353216
ASGNF4
ADDRLP4 144+8
ADDRLP4 184
INDIRF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 184
INDIRF4
ASGNF4
ADDRLP4 144
ADDRLP4 184
INDIRF4
ASGNF4
line 923
;923:	rgba[3] = 0.75f;
ADDRLP4 144+12
CNSTF4 1061158912
ASGNF4
line 927
;924:
;925:	// create the render entity 
;926:									
;927:	CG_Tracer( oldOrigin , cent->lerpOrigin, cg_bulletTracerWidth.value, cgs.media.metalsparkShader , rgba );
ADDRLP4 160
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 cg_bulletTracerWidth+8
INDIRF4
ARGF4
ADDRGP4 cgs+205084+1084
INDIRI4
ARGI4
ADDRLP4 144
ARGP4
ADDRGP4 CG_Tracer
CALLV
pop
line 929
;928:
;929: 	if ( s1->otherEntityNum == 1 ) 
ADDRLP4 140
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 1
NEI4 $549
line 930
;930:	{
line 933
;931://		CG_Printf("#: %i oe: %i oe2: %i\n",s1->number,s1->otherEntityNum, s1->otherEntityNum2 );
;932:
;933:		if ( !cg.cameraActive && !cg.cameraFollowNumber  && cent->currentState.otherEntityNum2-1 == cg.snap->ps.clientNum )
ADDRLP4 188
CNSTI4 0
ASGNI4
ADDRGP4 cg+116652
INDIRI4
ADDRLP4 188
INDIRI4
NEI4 $551
ADDRGP4 cg+116660
INDIRI4
ADDRLP4 188
INDIRI4
NEI4 $551
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $551
line 934
;934:		{
line 935
;935:			cg.cameraFollowNumber = s1->number;
ADDRGP4 cg+116660
ADDRLP4 140
INDIRP4
INDIRI4
ASGNI4
line 936
;936:			cg.cameraActive = qtrue;
ADDRGP4 cg+116652
CNSTI4 1
ASGNI4
line 939
;937:
;938:		//	CG_Printf("Changed camera state to active and following %i \n", cg.cameraFollowNumber );
;939:		}
LABELV $551
line 940
;940:		if (  cg.cameraActive && cg.cameraFollowNumber == s1->number && cent->currentState.otherEntityNum2-1 == cg.snap->ps.clientNum )
ADDRGP4 cg+116652
INDIRI4
CNSTI4 0
EQI4 $558
ADDRGP4 cg+116660
INDIRI4
ADDRLP4 140
INDIRP4
INDIRI4
NEI4 $558
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $558
line 941
;941:		{
line 946
;942:			vec3_t oldOrigin2;
;943:			vec3_t origin;
;944:			trace_t trace;
;945:
;946:			BG_EvaluateTrajectory( &s1->pos, cg.time, origin );
ADDRLP4 140
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 948
;947:
;948:			if ( cg.cameraOrigin[0] == 0.0f && cg.cameraOrigin[1] == 0.0f && cg.cameraOrigin[2] == 0.0f )
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRGP4 cg+116640
INDIRF4
ADDRLP4 272
INDIRF4
NEF4 $564
ADDRGP4 cg+116640+4
INDIRF4
ADDRLP4 272
INDIRF4
NEF4 $564
ADDRGP4 cg+116640+8
INDIRF4
ADDRLP4 272
INDIRF4
NEF4 $564
line 949
;949:			{
line 951
;950:		//		CG_Printf("setted initial state.");
;951:				VectorCopy( origin, cg.cameraOrigin );
ADDRGP4 cg+116640
ADDRLP4 192
INDIRB
ASGNB 12
line 952
;952:			}
LABELV $564
line 953
;953:			VectorCopy( cg.cameraOrigin, oldOrigin2  );	
ADDRLP4 204
ADDRGP4 cg+116640
INDIRB
ASGNB 12
line 955
;954:
;955:			CG_Trace( &trace, oldOrigin2, NULL,NULL,origin, s1->number, MASK_SHOT );
ADDRLP4 216
ARGP4
ADDRLP4 204
ARGP4
ADDRLP4 276
CNSTP4 0
ASGNP4
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 957
;956:
;957:			if ( trace.fraction == 1.0f )
ADDRLP4 216+8
INDIRF4
CNSTF4 1065353216
NEF4 $573
line 958
;958:			{
line 959
;959:				VectorCopy( origin, cg.cameraOrigin  );	
ADDRGP4 cg+116640
ADDRLP4 192
INDIRB
ASGNB 12
line 960
;960:				cg.cameraRemainTime = cg.time + 1000; // remain 1.5s at the endpoint	
ADDRGP4 cg+116656
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 962
;961:			//	CG_Printf("Updated position.\n");
;962:			} 
LABELV $573
line 963
;963:		}
LABELV $558
line 964
;964:	}
LABELV $549
line 966
;965:	// create the render entity
;966:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 967
;967:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 968
;968:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 970
;969: 
;970:	if ( BG_IsShotgun(cent->currentState.weapon)  ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 188
ADDRGP4 BG_IsShotgun
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $581
line 971
;971:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 972
;972:		ent.radius = s1->frame / 3;
ADDRLP4 0+132
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 3
DIVI4
CVIF4 4
ASGNF4
line 973
;973:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 974
;974:		ent.customShader = cgs.media.flare;
ADDRLP4 0+112
ADDRGP4 cgs+205084+716
INDIRI4
ASGNI4
line 975
;975:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 976
;976:		return;
ADDRGP4 $537
JUMPV
LABELV $581
line 980
;977:	} 
;978:
;979:	// flicker between two skins 
;980:	ent.hModel = cgs.gameModels[ s1->modelindex ];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32516
ADDP4
INDIRI4
ASGNI4
line 981
;981:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 985
;982: 
;983:
;984:	// convert direction of travel into axis
;985:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 192
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 0
NEF4 $591
line 986
;986:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 987
;987:	}
LABELV $591
line 991
;988:
;989:	// spin as it moves
;990:	 
;991:	if ( s1->pos.trType != TR_STATIONARY ) {
ADDRLP4 140
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $596
line 992
;992:		RotateAroundDirection( ent.axis, cg.time / 4 );
ADDRLP4 0+28
ARGP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 993
;993:	} else {
ADDRGP4 $597
JUMPV
LABELV $596
line 1002
;994:	 
;995:		/*
;996:#ifdef MISSIONPACK
;997:		if ( s1->weapon == WP_PROX_LAUNCHER ) {
;998:			AnglesToAxis( cent->lerpAngles, ent.axis );
;999:		}
;1000:		else
;1001:#endif*/
;1002:		{
line 1003
;1003:			RotateAroundDirection( ent.axis, s1->time );
ADDRLP4 0+28
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 1004
;1004:		}
line 1005
;1005:	}
LABELV $597
line 1008
;1006:
;1007:	// add to refresh list, possibly with quad glow
;1008:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE );
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 1009
;1009:}
LABELV $537
endproc CG_BulletEnt 280 28
proc CG_Missile 264 48
line 1016
;1010:
;1011:/*
;1012:===============
;1013:CG_Missile
;1014:===============
;1015:*/
;1016:static void CG_Missile( centity_t *cent ) {
line 1022
;1017:	refEntity_t			ent;
;1018:	entityState_t		*s1;
;1019:	const weaponInfo_t		*weapon;
;1020://	int	col;
;1021:
;1022:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 1024
;1023:
;1024:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 26
LEI4 $602
line 1025
;1025:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 1026
;1026:	}
LABELV $602
line 1028
;1027:	// if it's a 40mm grenade, use m4 / ak47 as weapon
;1028:	if ( ( s1->frame == WP_AK47 || s1->frame == WP_M4 ) && s1->weapon == WP_GRENADE )
ADDRLP4 148
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 15
EQI4 $606
ADDRLP4 148
INDIRI4
CNSTI4 16
NEI4 $604
LABELV $606
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
NEI4 $604
line 1029
;1029:		weapon = &cg_weapons[s1->frame];
ADDRLP4 144
CNSTI4 296
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
ADDRGP4 $605
JUMPV
LABELV $604
line 1031
;1030:	else
;1031:		weapon = &cg_weapons[s1->weapon];
ADDRLP4 144
CNSTI4 296
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
LABELV $605
line 1034
;1032:
;1033:	// calculate the axis
;1034:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1037
;1035:
;1036:	// add trails 
;1037:	if ( weapon->missileTrailFunc && s1->generic1 != MF_SMOKE ) 
ADDRLP4 144
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $607
ADDRLP4 140
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
EQI4 $607
line 1038
;1038:	{
line 1039
;1039:		weapon->missileTrailFunc( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 244
ADDP4
INDIRP4
CALLV
pop
line 1040
;1040:	} 
LABELV $607
line 1042
;1041:
;1042:	if ( s1->generic1 == MF_SMOKE )
ADDRLP4 140
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $609
line 1043
;1043:	{
line 1046
;1044:		vec3_t up, orig;
;1045:		localEntity_t *smoke;  
;1046:		int seed = cent->currentState.frame & SEALS_SMOKEMASK_RNDNUM;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 63
BANDI4
ASGNI4
line 1047
;1047:		int radius = SEALS_SMOKEPUFF_RADIUS + Q_random(&seed)*8;
ADDRLP4 156
ARGP4
ADDRLP4 192
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 172
CNSTF4 1090519040
ADDRLP4 192
INDIRF4
MULF4
CNSTF4 1115684864
ADDF4
CVFI4 4
ASGNI4
line 1050
;1048:		int dummy;
;1049: 
;1050:		dummy = (cent->currentState.frame & SEALS_SMOKEMASK_RIGHT) >> SEALS_SMOKEMASK_SRIGHT;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 192
BANDI4
CNSTI4 6
RSHI4
ASGNI4
line 1051
;1051:		dummy += (cent->currentState.frame & SEALS_SMOKEMASK_LEFT) >> SEALS_SMOKEMASK_SLEFT;
ADDRLP4 152
ADDRLP4 152
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 768
BANDI4
CNSTI4 8
RSHI4
ADDI4
ASGNI4
line 1052
;1052:		dummy += (cent->currentState.frame & SEALS_SMOKEMASK_FORWARD) >> SEALS_SMOKEMASK_SFORWARD;
ADDRLP4 152
ADDRLP4 152
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 12288
BANDI4
CNSTI4 12
RSHI4
ADDI4
ASGNI4
line 1053
;1053:		dummy += (cent->currentState.frame & SEALS_SMOKEMASK_BACKWARD) >> SEALS_SMOKEMASK_SBACKWARD;
ADDRLP4 152
ADDRLP4 152
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 3072
BANDI4
CNSTI4 10
RSHI4
ADDI4
ASGNI4
line 1054
;1054:		dummy += (cent->currentState.frame & SEALS_SMOKEMASK_UP) >> SEALS_SMOKEMASK_SUP;
ADDRLP4 152
ADDRLP4 152
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 49152
BANDI4
CNSTI4 14
RSHI4
ADDI4
ASGNI4
line 1055
;1055:		radius *= 1.0 + (float)dummy/15.0;
ADDRLP4 172
ADDRLP4 172
INDIRI4
CVIF4 4
ADDRLP4 152
INDIRI4
CVIF4 4
CNSTF4 1097859072
DIVF4
CNSTF4 1065353216
ADDF4
MULF4
CVFI4 4
ASGNI4
line 1057
;1056:			
;1057:		if ( CG_PointContents( cent->lerpOrigin, -1 ) & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 196
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $611
line 1059
;1058:
;1059:			VectorCopy( cent->lerpOrigin, up );
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1061
;1060:
;1061:			up[0] += -10+Q_random(&seed)*20;
ADDRLP4 156
ARGP4
ADDRLP4 200
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 160
INDIRF4
CNSTF4 1101004800
ADDRLP4 200
INDIRF4
MULF4
CNSTF4 3240099840
ADDF4
ADDF4
ASGNF4
line 1062
;1062:			up[1] += -10+Q_random(&seed)*20;
ADDRLP4 156
ARGP4
ADDRLP4 204
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 160+4
INDIRF4
CNSTF4 1101004800
ADDRLP4 204
INDIRF4
MULF4
CNSTF4 3240099840
ADDF4
ADDF4
ASGNF4
line 1063
;1063:			up[2] += 5+Q_random(&seed)*5;
ADDRLP4 156
ARGP4
ADDRLP4 208
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160+8
ADDRLP4 160+8
INDIRF4
CNSTF4 1084227584
ADDRLP4 208
INDIRF4
MULF4
CNSTF4 1084227584
ADDF4
ADDF4
ASGNF4
line 1065
;1064:
;1065:			CG_BubbleTrail( cent->lerpOrigin , up, 4 );			
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 160
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 CG_BubbleTrail
CALLV
pop
line 1066
;1066:		}
ADDRGP4 $612
JUMPV
LABELV $611
line 1067
;1067:		else { 
line 1070
;1068:			float distance;
;1069:			// smoke blend
;1070:			distance = Distance( cent->lerpOrigin, cg.refdef.vieworg );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 cg+109044+24
ARGP4
ADDRLP4 204
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 200
ADDRLP4 204
INDIRF4
ASGNF4
line 1072
;1071:
;1072:			if ( distance < ( SEALS_SMOKEBLEND_RANGE * (1.0 + dummy / 15.0 ) ) ) {
ADDRLP4 200
INDIRF4
CNSTF4 1119879168
ADDRLP4 152
INDIRI4
CVIF4 4
CNSTF4 1097859072
DIVF4
CNSTF4 1065353216
ADDF4
MULF4
GEF4 $617
line 1075
;1073:
;1074:				// check the directions for the additional blend effect
;1075:				if ( (32 + ((cent->currentState.frame & SEALS_SMOKEMASK_RIGHT) >> SEALS_SMOKEMASK_SRIGHT) *
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 192
BANDI4
CNSTI4 6
RSHI4
CNSTI4 5
LSHI4
CNSTI4 32
ADDI4
CVIF4 4
ADDRGP4 cg+109044+24+4
INDIRF4
ADDRLP4 208
INDIRP4
CNSTI4 704
ADDP4
INDIRF4
SUBF4
LEF4 $619
line 1078
;1076:						 (int)(SEALS_SMOKEBLEND_RANGE / SEALS_SMOKEMASK_VALUE)) > 
;1077:						 (cg.refdef.vieworg[1] - cent->lerpOrigin[1])  )
;1078:					cg.smokeBlendAlpha = 1.0f - distance/( SEALS_SMOKEBLEND_RANGE * (1.0 + dummy/15.0));
ADDRLP4 212
CNSTF4 1065353216
ASGNF4
ADDRGP4 cg+202000
ADDRLP4 212
INDIRF4
ADDRLP4 200
INDIRF4
CNSTF4 1119879168
ADDRLP4 152
INDIRI4
CVIF4 4
CNSTF4 1097859072
DIVF4
ADDRLP4 212
INDIRF4
ADDF4
MULF4
DIVF4
SUBF4
ASGNF4
ADDRGP4 $620
JUMPV
LABELV $619
line 1079
;1079:				else if ( (32 + ((cent->currentState.frame & SEALS_SMOKEMASK_LEFT) >> SEALS_SMOKEMASK_SLEFT) *
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 768
BANDI4
CNSTI4 8
RSHI4
CNSTI4 5
LSHI4
CNSTI4 32
ADDI4
CVIF4 4
ADDRGP4 cg+109044+24+4
INDIRF4
NEGF4
ADDRLP4 216
INDIRP4
CNSTI4 704
ADDP4
INDIRF4
ADDF4
LEF4 $625
line 1082
;1080:						 (int)(SEALS_SMOKEBLEND_RANGE / SEALS_SMOKEMASK_VALUE)) > 
;1081:						 ( - cg.refdef.vieworg[1] + cent->lerpOrigin[1])  )
;1082:					cg.smokeBlendAlpha = 1.0f - distance/( SEALS_SMOKEBLEND_RANGE * (1.0 + dummy/15.0));
ADDRLP4 220
CNSTF4 1065353216
ASGNF4
ADDRGP4 cg+202000
ADDRLP4 220
INDIRF4
ADDRLP4 200
INDIRF4
CNSTF4 1119879168
ADDRLP4 152
INDIRI4
CVIF4 4
CNSTF4 1097859072
DIVF4
ADDRLP4 220
INDIRF4
ADDF4
MULF4
DIVF4
SUBF4
ASGNF4
ADDRGP4 $626
JUMPV
LABELV $625
line 1083
;1083:				else if ( (32 + ((cent->currentState.frame & SEALS_SMOKEMASK_FORWARD) >> SEALS_SMOKEMASK_SFORWARD) *
ADDRLP4 224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 12288
BANDI4
CNSTI4 12
RSHI4
CNSTI4 5
LSHI4
CNSTI4 32
ADDI4
CVIF4 4
ADDRGP4 cg+109044+24
INDIRF4
ADDRLP4 224
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
SUBF4
LEF4 $631
line 1086
;1084:						 (int)(SEALS_SMOKEBLEND_RANGE / SEALS_SMOKEMASK_VALUE)) > 
;1085:						 ( cg.refdef.vieworg[0] - cent->lerpOrigin[0])  )
;1086:					cg.smokeBlendAlpha = 1.0f - distance/( SEALS_SMOKEBLEND_RANGE * (1.0 + dummy/15.0));
ADDRLP4 228
CNSTF4 1065353216
ASGNF4
ADDRGP4 cg+202000
ADDRLP4 228
INDIRF4
ADDRLP4 200
INDIRF4
CNSTF4 1119879168
ADDRLP4 152
INDIRI4
CVIF4 4
CNSTF4 1097859072
DIVF4
ADDRLP4 228
INDIRF4
ADDF4
MULF4
DIVF4
SUBF4
ASGNF4
ADDRGP4 $632
JUMPV
LABELV $631
line 1087
;1087:				else if ( (32 + ((cent->currentState.frame & SEALS_SMOKEMASK_BACKWARD) >> SEALS_SMOKEMASK_SBACKWARD) *
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 3072
BANDI4
CNSTI4 10
RSHI4
CNSTI4 5
LSHI4
CNSTI4 32
ADDI4
CVIF4 4
ADDRGP4 cg+109044+24
INDIRF4
NEGF4
ADDRLP4 232
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ADDF4
LEF4 $636
line 1090
;1088:						 (int)(SEALS_SMOKEBLEND_RANGE / SEALS_SMOKEMASK_VALUE)) > 
;1089:						 ( - cg.refdef.vieworg[0] + cent->lerpOrigin[0])  )
;1090:					cg.smokeBlendAlpha = 1.0f - distance/( SEALS_SMOKEBLEND_RANGE * (1.0 + dummy/15.0));
ADDRLP4 236
CNSTF4 1065353216
ASGNF4
ADDRGP4 cg+202000
ADDRLP4 236
INDIRF4
ADDRLP4 200
INDIRF4
CNSTF4 1119879168
ADDRLP4 152
INDIRI4
CVIF4 4
CNSTF4 1097859072
DIVF4
ADDRLP4 236
INDIRF4
ADDF4
MULF4
DIVF4
SUBF4
ASGNF4
ADDRGP4 $637
JUMPV
LABELV $636
line 1091
;1091:				else if ( (32 + ((cent->currentState.frame & SEALS_SMOKEMASK_UP) >> SEALS_SMOKEMASK_SUP) *
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 49152
BANDI4
CNSTI4 14
RSHI4
CNSTI4 5
LSHI4
CNSTI4 32
ADDI4
CVIF4 4
ADDRGP4 cg+109044+24+8
INDIRF4
ADDRLP4 240
INDIRP4
CNSTI4 708
ADDP4
INDIRF4
SUBF4
LEF4 $641
line 1094
;1092:						 (int)(SEALS_SMOKEBLEND_RANGE / SEALS_SMOKEMASK_VALUE)) > 
;1093:						 ( cg.refdef.vieworg[2] - cent->lerpOrigin[2])  )
;1094:					cg.smokeBlendAlpha = 1.0f - distance/( SEALS_SMOKEBLEND_RANGE * (1.0 + dummy/15.0));
ADDRLP4 244
CNSTF4 1065353216
ASGNF4
ADDRGP4 cg+202000
ADDRLP4 244
INDIRF4
ADDRLP4 200
INDIRF4
CNSTF4 1119879168
ADDRLP4 152
INDIRI4
CVIF4 4
CNSTF4 1097859072
DIVF4
ADDRLP4 244
INDIRF4
ADDF4
MULF4
DIVF4
SUBF4
ASGNF4
LABELV $641
LABELV $637
LABELV $632
LABELV $626
LABELV $620
line 1096
;1095:
;1096:				if ( cg.smokeBlendAlpha > 0.8f )
ADDRGP4 cg+202000
INDIRF4
CNSTF4 1061997773
LEF4 $647
line 1097
;1097:					cg.smokeBlendAlpha = 0.8f;  
ADDRGP4 cg+202000
CNSTF4 1061997773
ASGNF4
LABELV $647
line 1098
;1098:			}
LABELV $617
line 1101
;1099:
;1100:			// main smokes
;1101:			if ( cent->trailTime < cg.time ) { 
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $651
line 1104
;1102:							
;1103:				// get the base speed for the smoke
;1104: 				up[0] = -6.0 + Q_random(&seed)*12;
ADDRLP4 156
ARGP4
ADDRLP4 208
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160
CNSTF4 1094713344
ADDRLP4 208
INDIRF4
MULF4
CNSTF4 3233808384
ADDF4
ASGNF4
line 1105
;1105:				up[1] = -6.0 + Q_random(&seed)*12;
ADDRLP4 156
ARGP4
ADDRLP4 212
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160+4
CNSTF4 1094713344
ADDRLP4 212
INDIRF4
MULF4
CNSTF4 3233808384
ADDF4
ASGNF4
line 1106
;1106:				up[2] =  4.0 + Q_random(&seed)*6;
ADDRLP4 156
ARGP4
ADDRLP4 216
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160+8
CNSTF4 1086324736
ADDRLP4 216
INDIRF4
MULF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 1109
;1107:
;1108:				// modify the speed according to open area stuff
;1109:				if (up[0] > 0.0)
ADDRLP4 160
INDIRF4
CNSTF4 0
LEF4 $656
line 1110
;1110:					up[0] += Q_random(&seed)*14.0* ((cent->currentState.frame & SEALS_SMOKEMASK_RIGHT) >> SEALS_SMOKEMASK_SRIGHT);
ADDRLP4 156
ARGP4
ADDRLP4 220
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 160
INDIRF4
CNSTF4 1096810496
ADDRLP4 220
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 192
BANDI4
CNSTI4 6
RSHI4
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $656
line 1111
;1111:				if (up[0] < 0.0)
ADDRLP4 160
INDIRF4
CNSTF4 0
GEF4 $658
line 1112
;1112:					up[0] -= Q_random(&seed)*14.0* ((cent->currentState.frame & SEALS_SMOKEMASK_LEFT) >> SEALS_SMOKEMASK_SLEFT);
ADDRLP4 156
ARGP4
ADDRLP4 224
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 160
INDIRF4
CNSTF4 1096810496
ADDRLP4 224
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 768
BANDI4
CNSTI4 8
RSHI4
CVIF4 4
MULF4
SUBF4
ASGNF4
LABELV $658
line 1114
;1113:				
;1114:				if (up[1] > 0.0)
ADDRLP4 160+4
INDIRF4
CNSTF4 0
LEF4 $660
line 1115
;1115:					up[1] += Q_random(&seed)*14.0* ((cent->currentState.frame & SEALS_SMOKEMASK_FORWARD) >> SEALS_SMOKEMASK_SFORWARD);
ADDRLP4 156
ARGP4
ADDRLP4 228
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 160+4
INDIRF4
CNSTF4 1096810496
ADDRLP4 228
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 12288
BANDI4
CNSTI4 12
RSHI4
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $660
line 1116
;1116:				if (up[1] < 0.0)
ADDRLP4 160+4
INDIRF4
CNSTF4 0
GEF4 $664
line 1117
;1117:					up[1] -= Q_random(&seed)*14.0* ((cent->currentState.frame & SEALS_SMOKEMASK_BACKWARD) >> SEALS_SMOKEMASK_SBACKWARD);
ADDRLP4 156
ARGP4
ADDRLP4 232
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 160+4
INDIRF4
CNSTF4 1096810496
ADDRLP4 232
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 3072
BANDI4
CNSTI4 10
RSHI4
CVIF4 4
MULF4
SUBF4
ASGNF4
LABELV $664
line 1119
;1118:				
;1119:				if ( up[2] > 0.0 )
ADDRLP4 160+8
INDIRF4
CNSTF4 0
LEF4 $668
line 1120
;1120:					up[2] += Q_random(&seed)*12.0* ((cent->currentState.frame & SEALS_SMOKEMASK_UP) >> SEALS_SMOKEMASK_SUP);
ADDRLP4 156
ARGP4
ADDRLP4 236
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 160+8
ADDRLP4 160+8
INDIRF4
CNSTF4 1094713344
ADDRLP4 236
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 49152
BANDI4
CNSTI4 14
RSHI4
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $668
line 1122
;1121:
;1122:				VectorCopy(cent->lerpOrigin, orig);
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1123
;1123:				orig[2] += 4.0;
ADDRLP4 176+8
ADDRLP4 176+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 1125
;1124:
;1125:				switch (cgs.camoType) {
ADDRLP4 240
ADDRGP4 cgs+214196
INDIRI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 1
LTI4 $673
ADDRLP4 240
INDIRI4
CNSTI4 4
GTI4 $673
ADDRLP4 240
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $692-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $692
address $684
address $688
address $680
address $676
code
LABELV $676
line 1127
;1126:					case CAMO_URBAN:
;1127:						smoke = CG_SmokePuff( orig, 
ADDRLP4 176
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 172
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1050589266
ARGF4
CNSTF4 1058306785
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1166843904
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 cgs+205084+104
INDIRI4
ARGI4
ADDRLP4 244
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 188
ADDRLP4 244
INDIRP4
ASGNP4
line 1139
;1128:							up, 
;1129:							radius, 
;1130:							SEALS_SMOKENADE_R_URBAN,
;1131:							SEALS_SMOKENADE_G_URBAN,
;1132:							SEALS_SMOKENADE_B_URBAN,
;1133:							1.0,
;1134:							SEALS_SMOKEPUFF_TIME,
;1135:							cg.time,
;1136:							0,
;1137:							LEF_PUFF_DONT_FADE, 
;1138:							cgs.media.smokePuffShader );
;1139:						break;
ADDRGP4 $674
JUMPV
LABELV $680
line 1141
;1140:					case CAMO_ARCTIC:
;1141:						smoke = CG_SmokePuff( orig, 
ADDRLP4 176
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 172
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1060320051
ARGF4
CNSTF4 1064346583
ARGF4
ADDRLP4 248
CNSTF4 1065353216
ASGNF4
ADDRLP4 248
INDIRF4
ARGF4
ADDRLP4 248
INDIRF4
ARGF4
CNSTF4 1166843904
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 cgs+205084+104
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 188
ADDRLP4 252
INDIRP4
ASGNP4
line 1153
;1142:							up, 
;1143:							radius, 
;1144:							SEALS_SMOKENADE_R_ARCTIC,
;1145:							SEALS_SMOKENADE_G_ARCTIC,
;1146:							SEALS_SMOKENADE_B_ARCTIC,
;1147:							1.0,
;1148:							SEALS_SMOKEPUFF_TIME,
;1149:							cg.time,
;1150:							0,
;1151:							LEF_PUFF_DONT_FADE, 
;1152:							cgs.media.smokePuffShader );
;1153:						break;
ADDRGP4 $674
JUMPV
LABELV $684
line 1155
;1154:					case CAMO_DESERT:
;1155:						smoke = CG_SmokePuff( orig, 
ADDRLP4 176
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 172
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1062333317
ARGF4
CNSTF4 1060655596
ARGF4
CNSTF4 1055957975
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1166843904
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 cgs+205084+104
INDIRI4
ARGI4
ADDRLP4 256
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 188
ADDRLP4 256
INDIRP4
ASGNP4
line 1167
;1156:							up, 
;1157:							radius, 
;1158:							SEALS_SMOKENADE_R_DESERT,
;1159:							SEALS_SMOKENADE_G_DESERT,
;1160:							SEALS_SMOKENADE_B_DESERT,
;1161:							1.0,
;1162:							SEALS_SMOKEPUFF_TIME,
;1163:							cg.time,
;1164:							0,
;1165:							LEF_PUFF_DONT_FADE, 
;1166:							cgs.media.smokePuffShader );
;1167:						break;
ADDRGP4 $674
JUMPV
LABELV $688
LABELV $673
line 1170
;1168:					case CAMO_JUNGLE:
;1169:					default:
;1170:						smoke = CG_SmokePuff( orig, 
ADDRLP4 176
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 172
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1059648963
ARGF4
CNSTF4 1062668861
ARGF4
CNSTF4 1050589266
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1166843904
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 cgs+205084+104
INDIRI4
ARGI4
ADDRLP4 260
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 188
ADDRLP4 260
INDIRP4
ASGNP4
line 1182
;1171:							up, 
;1172:							radius, 
;1173:							SEALS_SMOKENADE_R_JUNGLE,
;1174:							SEALS_SMOKENADE_G_JUNGLE,
;1175:							SEALS_SMOKENADE_B_JUNGLE,
;1176:							1.0,
;1177:							SEALS_SMOKEPUFF_TIME,
;1178:							cg.time,
;1179:							0,
;1180:							LEF_PUFF_DONT_FADE, 
;1181:							cgs.media.smokePuffShader );
;1182:						break;
LABELV $674
line 1188
;1183:				}
;1184:
;1185:				//smoke->leFlags = LEF_PUFF_DONT_FADE;
;1186:				//smoke->endTime = cg.time + 1000;			
;1187: 
;1188:				cent->trailTime = cg.time + SEALS_SMOKENADETIME;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1189
;1189:			} 
LABELV $651
line 1190
;1190:		}
LABELV $612
line 1191
;1191:	} 
LABELV $609
line 1194
;1192:
;1193:	// add dynamic light
;1194:	if ( weapon->missileDlight ) {
ADDRLP4 144
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
CNSTF4 0
EQF4 $695
line 1195
;1195:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 248
ADDP4
INDIRF4
ARGF4
ADDRLP4 144
INDIRP4
CNSTI4 252
ADDP4
INDIRF4
ARGF4
ADDRLP4 144
INDIRP4
CNSTI4 256
ADDP4
INDIRF4
ARGF4
ADDRLP4 144
INDIRP4
CNSTI4 260
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1197
;1196:			weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2] );
;1197:	}
LABELV $695
line 1200
;1198:
;1199:	// add missile sound
;1200:	if ( weapon->missileSound ) {
ADDRLP4 144
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 0
EQI4 $697
line 1203
;1201:		vec3_t	velocity;
;1202:
;1203:		BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1205
;1204:
;1205:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound );
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1206
;1206:	}
LABELV $697
line 1210
;1207:	 
;1208:
;1209:	// create the render entity
;1210:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1211
;1211:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1212
;1212:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1214
;1213:
;1214: 	if ( cent->currentState.weapon == WP_MP5 ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 14
NEI4 $702
line 1215
;1215:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1216
;1216:		ent.radius = 16;
ADDRLP4 0+132
CNSTF4 1098907648
ASGNF4
line 1217
;1217:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 1218
;1218:		ent.customShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $707
ARGP4
ADDRLP4 152
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+112
ADDRLP4 152
INDIRI4
ASGNI4
line 1219
;1219:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1220
;1220:		return;
ADDRGP4 $601
JUMPV
LABELV $702
line 1224
;1221:	} 
;1222:
;1223:	// flicker between two skins
;1224:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1225
;1225:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 1226
;1226:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1230
;1227: 
;1228:
;1229:	// convert direction of travel into axis
;1230:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 152
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 0
NEF4 $711
line 1231
;1231:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 1232
;1232:	}
LABELV $711
line 1235
;1233:
;1234:	// spin as it moves
;1235:	if ( s1->pos.trType != TR_STATIONARY ) {
ADDRLP4 140
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $716
line 1236
;1236:		RotateAroundDirection( ent.axis, cg.time / 4 );
ADDRLP4 0+28
ARGP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 1237
;1237:	} else {
ADDRGP4 $717
JUMPV
LABELV $716
line 1245
;1238:		/*
;1239:#ifdef MISSIONPACK
;1240:		if ( s1->weapon == WP_PROX_LAUNCHER ) {
;1241:			AnglesToAxis( cent->lerpAngles, ent.axis );
;1242:		}
;1243:		else
;1244:#endif*/
;1245:		{
line 1246
;1246:			RotateAroundDirection( ent.axis, s1->time );
ADDRLP4 0+28
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 1247
;1247:		}
line 1248
;1248:	}
LABELV $717
line 1251
;1249:
;1250:	// add to refresh list, possibly with quad glow
;1251:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE );
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 1252
;1252:}
LABELV $601
endproc CG_Missile 264 48
proc CG_Grapple 152 12
line 1261
;1253:
;1254:/*
;1255:===============
;1256:CG_Grapple
;1257:
;1258:This is called when the grapple is sitting up against the wall
;1259:===============
;1260:*/
;1261:static void CG_Grapple( centity_t *cent ) {
line 1266
;1262:	refEntity_t			ent;
;1263:	entityState_t		*s1;
;1264:	const weaponInfo_t		*weapon;
;1265:
;1266:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 1267
;1267:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 26
LEI4 $722
line 1268
;1268:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 1269
;1269:	}
LABELV $722
line 1270
;1270:	weapon = &cg_weapons[s1->weapon];
ADDRLP4 144
CNSTI4 296
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1273
;1271:
;1272:	// calculate the axis
;1273:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1283
;1274:
;1275:#if 0 // FIXME add grapple pull sound here..?
;1276:	// add missile sound
;1277:	if ( weapon->missileSound ) {
;1278:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->missileSound );
;1279:	}
;1280:#endif
;1281:
;1282:	// Will draw cable if needed
;1283:	CG_GrappleTrail ( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 CG_GrappleTrail
CALLV
pop
line 1286
;1284:
;1285:	// create the render entity
;1286:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1287
;1287:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1288
;1288:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1291
;1289:
;1290:	// flicker between two skins
;1291:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1292
;1292:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 1293
;1293:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1296
;1294:
;1295:	// convert direction of travel into axis
;1296:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 148
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 148
INDIRF4
CNSTF4 0
NEF4 $729
line 1297
;1297:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 1298
;1298:	}
LABELV $729
line 1300
;1299:
;1300:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1301
;1301:}
LABELV $721
endproc CG_Grapple 152 12
proc CG_Mover 144 12
line 1308
;1302:
;1303:/*
;1304:===============
;1305:CG_Mover
;1306:===============
;1307:*/
;1308:static void CG_Mover( centity_t *cent ) {
line 1312
;1309:	refEntity_t			ent;
;1310:	entityState_t		*s1;
;1311:
;1312:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 1315
;1313:
;1314:	// create the render entity
;1315:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1316
;1316:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1317
;1317:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1318
;1318:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1320
;1319:
;1320:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 1323
;1321:
;1322:	// flicker between two skins (FIXME?)
;1323:	ent.skinNum = ( cg.time >> 6 ) & 1;
ADDRLP4 0+104
ADDRGP4 cg+107604
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 1326
;1324:
;1325:	// get the model, either as a bmodel or a modelindex
;1326:	if ( s1->solid == SOLID_BMODEL ) {
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $741
line 1327
;1327:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34568
ADDP4
INDIRI4
ASGNI4
line 1328
;1328:	} else {
ADDRGP4 $742
JUMPV
LABELV $741
line 1329
;1329:		ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32516
ADDP4
INDIRI4
ASGNI4
line 1330
;1330:	}
LABELV $742
line 1333
;1331:
;1332:	// add to refresh list
;1333:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1336
;1334:
;1335:	// add the secondary model
;1336:	if ( s1->modelindex2 ) {
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $747
line 1337
;1337:		ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 1338
;1338:		ent.hModel = cgs.gameModels[s1->modelindex2];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32516
ADDP4
INDIRI4
ASGNI4
line 1339
;1339:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1340
;1340:	}
LABELV $747
line 1342
;1341:
;1342:}
LABELV $734
endproc CG_Mover 144 12
export CG_Beam
proc CG_Beam 144 12
line 1351
;1343:
;1344:/*
;1345:===============
;1346:CG_Beam
;1347:
;1348:Also called as an event
;1349:===============
;1350:*/
;1351:void CG_Beam( centity_t *cent ) {
line 1355
;1352:	refEntity_t			ent;
;1353:	entityState_t		*s1;
;1354:
;1355:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 1358
;1356:
;1357:	// create the render entity
;1358:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1359
;1359:	VectorCopy( s1->pos.trBase, ent.origin );
ADDRLP4 0+68
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1360
;1360:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1361
;1361:	AxisClear( ent.axis );
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 1362
;1362:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 1364
;1363:
;1364:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 1367
;1365:
;1366:	// add to refresh list
;1367:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1368
;1368:}
LABELV $752
endproc CG_Beam 144 12
proc CG_Portal 144 12
line 1376
;1369:
;1370:
;1371:/*
;1372:===============
;1373:CG_Portal
;1374:===============
;1375:*/
;1376:static void CG_Portal( centity_t *cent ) {
line 1380
;1377:	refEntity_t			ent;
;1378:	entityState_t		*s1;
;1379:
;1380:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 1383
;1381:
;1382:	// create the render entity
;1383:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1384
;1384:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRB
ASGNB 12
line 1385
;1385:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1386
;1386:	ByteToDir( s1->eventParm, ent.axis[0] );
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1387
;1387:	PerpendicularVector( ent.axis[1], ent.axis[0] );
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 1391
;1388:
;1389:	// negating this tends to get the directions like they want
;1390:	// we really should have a camera roll value
;1391:	VectorSubtract( vec3_origin, ent.axis[1], ent.axis[1] );
ADDRLP4 0+28+12
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0+28+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+28+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+28+12+8
INDIRF4
SUBF4
ASGNF4
line 1393
;1392:
;1393:	CrossProduct( ent.axis[0], ent.axis[1], ent.axis[2] );
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1394
;1394:	ent.reType = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1395
;1395:	ent.oldframe = s1->powerups;
ADDRLP4 0+96
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 1396
;1396:	ent.frame = s1->frame;		// rotation speed
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 1397
;1397:	ent.skinNum = s1->clientNum/256.0 * 360;	// roll offset
ADDRLP4 0+104
CNSTF4 1135869952
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
MULF4
CVFI4 4
ASGNI4
line 1400
;1398:
;1399:	// add to refresh list
;1400:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1401
;1401:}
LABELV $757
endproc CG_Portal 144 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 96 12
line 1411
;1402:
;1403:
;1404:/*
;1405:=========================
;1406:CG_AdjustPositionForMover
;1407:
;1408:Also called by client movement prediction code
;1409:=========================
;1410:*/
;1411:void CG_AdjustPositionForMover( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out ) {
line 1416
;1412:	centity_t	*cent;
;1413:	vec3_t	oldOrigin, origin, deltaOrigin;
;1414:	vec3_t	oldAngles, angles, deltaAngles;
;1415:
;1416:	if ( moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $793
ADDRLP4 76
INDIRI4
CNSTI4 1022
LTI4 $791
LABELV $793
line 1417
;1417:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1418
;1418:		return;
ADDRGP4 $790
JUMPV
LABELV $791
line 1421
;1419:	}
;1420:
;1421:	cent = &cg_entities[ moverNum ];
ADDRLP4 0
CNSTI4 728
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1422
;1422:	if ( cent->currentState.eType != ET_MOVER &&
ADDRLP4 80
CNSTI4 4
ASGNI4
ADDRLP4 84
ADDRLP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $794
ADDRLP4 84
INDIRI4
CNSTI4 15
EQI4 $794
line 1423
;1423:		cent->currentState.eType != ET_DOOR ) {
line 1424
;1424:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1425
;1425:		return;
ADDRGP4 $790
JUMPV
LABELV $794
line 1428
;1426:	}
;1427:
;1428:	BG_EvaluateTrajectory( &cent->currentState.pos, fromTime, oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1429
;1429:	BG_EvaluateTrajectory( &cent->currentState.apos, fromTime, oldAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1431
;1430:
;1431:	BG_EvaluateTrajectory( &cent->currentState.pos, toTime, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1432
;1432:	BG_EvaluateTrajectory( &cent->currentState.apos, toTime, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1434
;1433:
;1434:	VectorSubtract( origin, oldOrigin, deltaOrigin );
ADDRLP4 4
ADDRLP4 28
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 1435
;1435:	VectorSubtract( angles, oldAngles, deltaAngles );
ADDRLP4 64
ADDRLP4 52
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 52+4
INDIRF4
ADDRLP4 40+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 52+8
INDIRF4
ADDRLP4 40+8
INDIRF4
SUBF4
ASGNF4
line 1437
;1436:
;1437:	VectorAdd( in, deltaOrigin, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 92
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDF4
ASGNF4
line 1440
;1438:
;1439:	// FIXME: origin change when on a rotating object
;1440:}
LABELV $790
endproc CG_AdjustPositionForMover 96 12
proc CG_InterpolateEntityPosition 52 12
line 1448
;1441:
;1442:
;1443:/*
;1444:=============================
;1445:CG_InterpolateEntityPosition
;1446:=============================
;1447:*/
;1448:static void CG_InterpolateEntityPosition( centity_t *cent ) {
line 1454
;1449:	vec3_t		current, next;
;1450:	float		f;
;1451:
;1452:	// it would be an internal error to find an entity that interpolates without
;1453:	// a snapshot ahead of the current one
;1454:	if ( cg.nextSnap == NULL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $811
line 1455
;1455:		CG_Error( "CG_InterpoateEntityPosition: cg.nextSnap == NULL" );
ADDRGP4 $814
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1456
;1456:	}
LABELV $811
line 1458
;1457:
;1458:	if ( cent->currentState.eType == ET_MOVER || 
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $817
ADDRLP4 32
INDIRI4
CNSTI4 15
NEI4 $815
LABELV $817
line 1460
;1459:		cent->currentState.eType == ET_DOOR )
;1460:		return;
ADDRGP4 $810
JUMPV
LABELV $815
line 1462
;1461:
;1462:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+107588
INDIRF4
ASGNF4
line 1466
;1463:
;1464:	// this will linearize a sine or parabolic curve, but it is important
;1465:	// to not extrapolate player positions if more recent data is available
;1466:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, current );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1467
;1467:	BG_EvaluateTrajectory( &cent->nextState.pos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1469
;1468:
;1469:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
ADDRLP4 36
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 36
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1470
;1470:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1471
;1471:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1473
;1472:
;1473:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.snap->serverTime, current );
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1474
;1474:	BG_EvaluateTrajectory( &cent->nextState.apos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1476
;1475:
;1476:	cent->lerpAngles[0] = LerpAngle( current[0], next[0], f );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 1477
;1477:	cent->lerpAngles[1] = LerpAngle( current[1], next[1], f );
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 1478
;1478:	cent->lerpAngles[2] = LerpAngle( current[2], next[2], f );
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 1480
;1479:
;1480:}
LABELV $810
endproc CG_InterpolateEntityPosition 52 12
proc CG_CalcEntityLerpPositions 24 20
line 1488
;1481:
;1482:/*
;1483:===============
;1484:CG_CalcEntityLerpPositions
;1485:
;1486:===============
;1487:*/
;1488:static void CG_CalcEntityLerpPositions( centity_t *cent ) {
line 1491
;1489:
;1490:	// if this player does not want to see extrapolated players
;1491:	if ( !cg_smoothClients.integer ) {
ADDRGP4 cg_smoothClients+12
INDIRI4
CNSTI4 0
NEI4 $834
line 1493
;1492:		// make sure the clients use TR_INTERPOLATE
;1493:		if ( cent->currentState.number < MAX_CLIENTS ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $837
line 1494
;1494:			cent->currentState.pos.trType = TR_INTERPOLATE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 1495
;1495:			cent->nextState.pos.trType = TR_INTERPOLATE;
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 1
ASGNI4
line 1496
;1496:		}
LABELV $837
line 1497
;1497:	}
LABELV $834
line 1499
;1498:
;1499:	if ( cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $839
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
NEI4 $839
line 1500
;1500:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 1501
;1501:		return;
ADDRGP4 $833
JUMPV
LABELV $839
line 1506
;1502:	}
;1503:
;1504:	// first see if we can interpolate between two snaps for
;1505:	// linear extrapolated clients
;1506:	if ( cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $841
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $841
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $841
line 1507
;1507:											cent->currentState.number < MAX_CLIENTS) {
line 1508
;1508:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 1509
;1509:		return;
ADDRGP4 $833
JUMPV
LABELV $841
line 1513
;1510:	}
;1511:
;1512:	// just use the current frame and evaluate as best we can
;1513:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1514
;1514:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1518
;1515:
;1516:	// adjust for riding a mover if it wasn't rolled into the predicted
;1517:	// player state
;1518:	if ( cent != &cg.predictedPlayerEntity ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+108104
CVPU4 4
EQU4 $845
line 1519
;1519:		CG_AdjustPositionForMover( cent->lerpOrigin, cent->currentState.groundEntityNum, 
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 700
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 1521
;1520:		cg.snap->serverTime, cg.time, cent->lerpOrigin );
;1521:	}
LABELV $845
line 1522
;1522:}
LABELV $833
endproc CG_CalcEntityLerpPositions 24 20
proc CG_AddCEntity 12 28
line 1530
;1523: 
;1524:/*
;1525:===============
;1526:CG_AddCEntity
;1527:
;1528:===============
;1529:*/
;1530:static void CG_AddCEntity( centity_t *cent ) {
line 1532
;1531:	// event-only entities will have been dealt with already
;1532:	if ( cent->currentState.eType >= ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 26
LTI4 $851
line 1533
;1533:		return;
ADDRGP4 $850
JUMPV
LABELV $851
line 1537
;1534:	}
;1535:
;1536:	// calculate the current origin
;1537:	CG_CalcEntityLerpPositions( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 1540
;1538:
;1539:	// add automatic effects
;1540:	CG_EntityEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 1542
;1541:
;1542:	switch ( cent->currentState.eType ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $853
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $853
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $870
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $870
address $858
address $859
address $860
address $862
address $865
address $866
address $867
address $868
address $854
address $854
address $854
address $869
address $853
address $861
address $864
address $865
address $865
address $863
address $865
address $865
address $865
address $865
address $865
address $865
address $865
address $865
code
LABELV $853
line 1544
;1543:	default:
;1544:		CG_Error( "Bad entity type: %i\n", cent->currentState.eType );
ADDRGP4 $856
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1545
;1545:		break;
ADDRGP4 $854
JUMPV
line 1549
;1546:	case ET_INVISIBLE:
;1547:	case ET_PUSH_TRIGGER:
;1548:	case ET_TELEPORT_TRIGGER:
;1549:		break;
LABELV $858
line 1554
;1550:/*	case ET_ACTOR: 
;1551:		CG_Flare( cent, cent->lerpOrigin, 25, 0.3f,0.3f,1, qtrue );
;1552:		break;*/
;1553:	case ET_GENERAL:
;1554:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 1555
;1555:		break;
ADDRGP4 $854
JUMPV
LABELV $859
line 1557
;1556:	case ET_PLAYER:
;1557:		CG_Player( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 1558
;1558:		break;
ADDRGP4 $854
JUMPV
LABELV $860
line 1560
;1559:	case ET_ITEM:
;1560:		CG_Item( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 1561
;1561:		break;
ADDRGP4 $854
JUMPV
LABELV $861
line 1563
;1562:	case ET_FLARE: 
;1563:		CG_Flare( cent, cent->lerpOrigin, cent->currentState.frame, cent->currentState.generic1, cent->currentState.otherEntityNum, cent->currentState.otherEntityNum2, cent->currentState.eventParm );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Flare
CALLV
pop
line 1564
;1564:		break;
ADDRGP4 $854
JUMPV
LABELV $862
line 1566
;1565:	case ET_MISSILE:
;1566:		CG_Missile( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 1567
;1567:		break;
ADDRGP4 $854
JUMPV
LABELV $863
line 1571
;1568:#ifdef PARTICLEHOST
;1569:	case ET_PARTICLEHOST:
;1570:	//	CG_Printf("particlehost:\n");
;1571:		CG_ParticleHost( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ParticleHost
CALLV
pop
line 1572
;1572:		break;
ADDRGP4 $854
JUMPV
LABELV $864
line 1575
;1573:#endif
;1574:	case ET_BULLET:
;1575:		CG_BulletEnt( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_BulletEnt
CALLV
pop
line 1576
;1576:		break;
ADDRGP4 $854
JUMPV
LABELV $865
line 1588
;1577:	case ET_DOOR:
;1578:	case ET_FUNCEXPLOSIVE:
;1579:	case ET_ELEVBUT0:
;1580:	case ET_ELEVBUT1:
;1581:	case ET_ELEVBUT2:
;1582:	case ET_ELEVBUT3:
;1583:	case ET_ELEVBUT4:
;1584:	case ET_ELEVBUT5:
;1585:	case ET_ELEVBUT6:
;1586:	case ET_ELEVBUT7:
;1587:	case ET_MOVER:
;1588:		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1589
;1589:		break;
ADDRGP4 $854
JUMPV
LABELV $866
line 1591
;1590:	case ET_BEAM:
;1591:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1592
;1592:		break;
ADDRGP4 $854
JUMPV
LABELV $867
line 1594
;1593:	case ET_PORTAL:
;1594:		CG_Portal( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 1595
;1595:		break;
ADDRGP4 $854
JUMPV
LABELV $868
line 1597
;1596:	case ET_SPEAKER:
;1597:		CG_Speaker( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 1598
;1598:		break;
ADDRGP4 $854
JUMPV
LABELV $869
line 1600
;1599:	case ET_GRAPPLE:
;1600:		CG_Grapple( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Grapple
CALLV
pop
line 1601
;1601:		break; 
LABELV $854
line 1603
;1602:	}
;1603:}
LABELV $850
endproc CG_AddCEntity 12 28
export CG_AddPacketEntities
proc CG_AddPacketEntities 20 12
line 1611
;1604:
;1605:/*
;1606:===============
;1607:CG_AddPacketEntities
;1608:
;1609:===============
;1610:*/
;1611:void CG_AddPacketEntities( void ) {
line 1617
;1612:	int					num;
;1613:	centity_t			*cent;
;1614:	playerState_t		*ps;
;1615:
;1616:	// set cg.frameInterpolation
;1617:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $872
line 1620
;1618:		int		delta;
;1619:
;1620:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 12
ADDRGP4 cg+40
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
SUBI4
ASGNI4
line 1621
;1621:		if ( delta == 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $877
line 1622
;1622:			cg.frameInterpolation = 0;
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 1623
;1623:		} else {
ADDRGP4 $873
JUMPV
LABELV $877
line 1624
;1624:			cg.frameInterpolation = (float)( cg.time - cg.snap->serverTime ) / delta;
ADDRGP4 cg+107588
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 12
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1625
;1625:		}
line 1626
;1626:	} else {
ADDRGP4 $873
JUMPV
LABELV $872
line 1627
;1627:		cg.frameInterpolation = 0;	// actually, it should never be used, because 
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 1629
;1628:									// no entities should be marked as interpolating
;1629:	}
LABELV $873
line 1632
;1630:
;1631:	// the auto-rotating items will all have the same axis
;1632:	cg.autoAngles[0] = 0; 
ADDRGP4 cg+108948
CNSTF4 0
ASGNF4
line 1633
;1633:	cg.autoAngles[1] = ( cg.time & 2047 ) * 360 / 2048.0; 
ADDRGP4 cg+108948+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 1634
;1634:	cg.autoAngles[2] = 90;
ADDRGP4 cg+108948+8
CNSTF4 1119092736
ASGNF4
line 1636
;1635:
;1636:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+108996
CNSTF4 0
ASGNF4
line 1637
;1637:	cg.autoAnglesFast[1] = ( cg.time & 1023 ) * 360 / 1024.0f;
ADDRGP4 cg+108996+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 1149239296
DIVF4
ASGNF4
line 1638
;1638:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+108996+8
CNSTF4 0
ASGNF4
line 1640
;1639: 
;1640:	AnglesToAxis( cg.autoAngles, cg.autoAxis );
ADDRGP4 cg+108948
ARGP4
ADDRGP4 cg+108960
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1641
;1641:	AnglesToAxis( cg.autoAnglesFast, cg.autoAxisFast );
ADDRGP4 cg+108996
ARGP4
ADDRGP4 cg+109008
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1644
;1642:
;1643:	// generate and add the entity from the playerstate
;1644:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+107636
ASGNP4
line 1645
;1645:	BG_PlayerStateToEntityState( ps, &cg.predictedPlayerEntity.currentState, qfalse );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 cg+108104
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1646
;1646:	CG_AddCEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1649
;1647:
;1648:	// lerp the non-predicted value for lightning gun origins
;1649:	CG_CalcEntityLerpPositions( &cg_entities[ cg.snap->ps.clientNum ] );
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
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 1652
;1650:
;1651:	// add each entity sent over by the server
;1652:	for ( num = 0 ; num < cg.snap->numEntities ; num++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $907
JUMPV
LABELV $904
line 1653
;1653:		cent = &cg_entities[ cg.snap->entities[ num ].number ];
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
line 1654
;1654:		CG_AddCEntity( cent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1655
;1655:	}
LABELV $905
line 1652
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $907
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $904
line 1656
;1656:}
LABELV $871
endproc CG_AddPacketEntities 20 12
import CG_RealBloodTrail
import CG_AddWeaponWithPowerups
import CG_SurfaceEffect
import CG_MetalSpark
import CG_Spark
import ClientScript_Update
import ClientScript_Init
import CG_LightParticles
import CG_Tracer
import CG_CalculateWeaponPosition
import vtos
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
LABELV $856
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $814
byte 1 67
byte 1 71
byte 1 95
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 112
byte 1 111
byte 1 97
byte 1 116
byte 1 101
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 80
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
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
LABELV $707
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 49
byte 1 0
align 1
LABELV $202
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 97
byte 1 103
byte 1 103
byte 1 97
byte 1 103
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $196
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $176
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
