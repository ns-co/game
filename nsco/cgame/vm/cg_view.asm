export CG_TestModel_f
code
proc CG_TestModel_f 36 12
file "../cg_view.c"
line 63
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_view.c -- setup all the parameters (position, angle, etc)
;4:// for a 3D rendering
;5:
;6:// every line of code that differs from the quake3:arena SDK
;7:// is property of manfred nerurkar
;8:// no commercial explotation allowed
;9:// you are only allowed to use this code in navy seals: covert operations 
;10:// a quake3 arena modifiation
;11:// defcon-x@ns-co.net
;12:
;13:#include "cg_local.h"
;14:#include "../../ui/menudef.h"
;15:#include "variables.h"
;16:
;17:
;18:void CG_ForceCvar( const char *cvar, int value );
;19:
;20:/*
;21:=============================================================================
;22:
;23:  MODEL TESTING
;24:
;25:The viewthing and gun positioning tools from Q2 have been integrated and
;26:enhanced into a single model testing facility.
;27:
;28:Model viewing can begin with either "testmodel <modelname>" or "testgun <modelname>".
;29:
;30:The names must be the full pathname after the basedir, like 
;31:"models/weapons/v_launch/tris.md3" or "players/male/tris.md3"
;32:
;33:Testmodel will create a fake entity 100 units in front of the current view
;34:position, directly facing the viewer.  It will remain immobile, so you can
;35:move around it to view it from different angles.
;36:
;37:Testgun will cause the model to follow the player around and supress the real
;38:view weapon model.  The default frame 0 of most guns is completely off screen,
;39:so you will probably have to cycle a couple frames to see it.
;40:
;41:"nextframe", "prevframe", "nextskin", and "prevskin" commands will change the
;42:frame or skin of the testmodel.  These are bound to F5, F6, F7, and F8 in
;43:q3default.cfg.
;44:
;45:If a gun is being tested, the "gun_x", "gun_y", and "gun_z" variables will let
;46:you adjust the positioning.
;47:
;48:Note that none of the model testing features update while the game is paused, so
;49:it may be convenient to test with deathmatch set to 1 so that bringing down the
;50:console doesn't pause the game.
;51:
;52:=============================================================================
;53:*/
;54:
;55:/*
;56:=================
;57:CG_TestModel_f
;58:
;59:Creates an entity in front of the current position, which
;60:can then be moved around
;61:=================
;62:*/
;63:void CG_TestModel_f (void) {
line 66
;64:	vec3_t		angles;
;65:
;66:	memset( &cg.testModelEntity, 0, sizeof(cg.testModelEntity) );
ADDRGP4 cg+115408
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 67
;67:	if ( trap_Argc() < 2 ) {
ADDRLP4 12
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
GEI4 $87
line 68
;68:		return;
ADDRGP4 $84
JUMPV
LABELV $87
line 71
;69:	}
;70:
;71:	Q_strncpyz (cg.testModelName, CG_Argv( 1 ), MAX_QPATH );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 cg+115548
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 72
;72:	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
ADDRGP4 cg+115548
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+115408+8
ADDRLP4 20
INDIRI4
ASGNI4
line 74
;73:
;74:	if ( trap_Argc() == 3 ) {
ADDRLP4 24
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 3
NEI4 $93
line 75
;75:		cg.testModelEntity.backlerp = atof( CG_Argv( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 cg+115408+100
ADDRLP4 32
INDIRF4
ASGNF4
line 76
;76:		cg.testModelEntity.frame = 1;
ADDRGP4 cg+115408+80
CNSTI4 1
ASGNI4
line 77
;77:		cg.testModelEntity.oldframe = 0;
ADDRGP4 cg+115408+96
CNSTI4 0
ASGNI4
line 78
;78:	}
LABELV $93
line 79
;79:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+115408+8
INDIRI4
CNSTI4 0
NEI4 $101
line 80
;80:		CG_Printf( "Can't register model\n" );
ADDRGP4 $105
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 81
;81:		return;
ADDRGP4 $84
JUMPV
LABELV $101
line 84
;82:	}
;83:
;84:	VectorMA( cg.refdef.vieworg, 100, cg.refdef.viewaxis[0], cg.testModelEntity.origin );
ADDRGP4 cg+115408+68
ADDRGP4 cg+109044+24
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+109044+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+115408+68+4
ADDRGP4 cg+109044+24+4
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+109044+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+115408+68+8
ADDRGP4 cg+109044+24+8
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+109044+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 86
;85:
;86:	angles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 87
;87:	angles[YAW] = 180 + cg.refdefViewAngles[1];
ADDRLP4 0+4
ADDRGP4 cg+109412+4
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 88
;88:	angles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 90
;89:
;90:	AnglesToAxis( angles, cg.testModelEntity.axis );
ADDRLP4 0
ARGP4
ADDRGP4 cg+115408+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 91
;91:	cg.testGun = qfalse;
ADDRGP4 cg+115612
CNSTI4 0
ASGNI4
line 92
;92:}
LABELV $84
endproc CG_TestModel_f 36 12
export CG_TestGun_f
proc CG_TestGun_f 0 0
line 101
;93:
;94:/*
;95:=================
;96:CG_TestGun_f
;97:
;98:Replaces the current view weapon with the given model
;99:=================
;100:*/
;101:void CG_TestGun_f (void) {
line 102
;102:	CG_TestModel_f();
ADDRGP4 CG_TestModel_f
CALLV
pop
line 103
;103:	cg.testGun = qtrue;
ADDRGP4 cg+115612
CNSTI4 1
ASGNI4
line 104
;104:	cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;
ADDRGP4 cg+115408+4
CNSTI4 13
ASGNI4
line 105
;105:}
LABELV $137
endproc CG_TestGun_f 0 0
export CG_TestModelNextFrame_f
proc CG_TestModelNextFrame_f 4 8
line 108
;106:
;107:
;108:void CG_TestModelNextFrame_f (void) {
line 109
;109:	cg.testModelEntity.frame++;
ADDRLP4 0
ADDRGP4 cg+115408+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 110
;110:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $144
ARGP4
ADDRGP4 cg+115408+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 111
;111:}
LABELV $141
endproc CG_TestModelNextFrame_f 4 8
export CG_TestModelPrevFrame_f
proc CG_TestModelPrevFrame_f 4 8
line 113
;112:
;113:void CG_TestModelPrevFrame_f (void) {
line 114
;114:	cg.testModelEntity.frame--;
ADDRLP4 0
ADDRGP4 cg+115408+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 115
;115:	if ( cg.testModelEntity.frame < 0 ) {
ADDRGP4 cg+115408+80
INDIRI4
CNSTI4 0
GEI4 $150
line 116
;116:		cg.testModelEntity.frame = 0;
ADDRGP4 cg+115408+80
CNSTI4 0
ASGNI4
line 117
;117:	}
LABELV $150
line 118
;118:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $144
ARGP4
ADDRGP4 cg+115408+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 119
;119:}
LABELV $147
endproc CG_TestModelPrevFrame_f 4 8
export CG_TestModelNextSkin_f
proc CG_TestModelNextSkin_f 4 8
line 121
;120:
;121:void CG_TestModelNextSkin_f (void) {
line 122
;122:	cg.testModelEntity.skinNum++;
ADDRLP4 0
ADDRGP4 cg+115408+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 123
;123:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $161
ARGP4
ADDRGP4 cg+115408+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 124
;124:}
LABELV $158
endproc CG_TestModelNextSkin_f 4 8
export CG_TestModelPrevSkin_f
proc CG_TestModelPrevSkin_f 4 8
line 126
;125:
;126:void CG_TestModelPrevSkin_f (void) {
line 127
;127:	cg.testModelEntity.skinNum--;
ADDRLP4 0
ADDRGP4 cg+115408+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 128
;128:	if ( cg.testModelEntity.skinNum < 0 ) {
ADDRGP4 cg+115408+104
INDIRI4
CNSTI4 0
GEI4 $167
line 129
;129:		cg.testModelEntity.skinNum = 0;
ADDRGP4 cg+115408+104
CNSTI4 0
ASGNI4
line 130
;130:	}
LABELV $167
line 131
;131:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $161
ARGP4
ADDRGP4 cg+115408+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 132
;132:}
LABELV $164
endproc CG_TestModelPrevSkin_f 4 8
proc CG_AddTestModel 32 4
line 134
;133:
;134:static void CG_AddTestModel (void) {
line 138
;135:	int		i;
;136:
;137:	// re-register the model, because the level may have changed
;138:	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
ADDRGP4 cg+115548
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+115408+8
ADDRLP4 4
INDIRI4
ASGNI4
line 139
;139:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+115408+8
INDIRI4
CNSTI4 0
NEI4 $179
line 140
;140:		CG_Printf ("Can't register model\n");
ADDRGP4 $105
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 141
;141:		return;
ADDRGP4 $175
JUMPV
LABELV $179
line 145
;142:	}
;143:
;144:	// if testing a gun, set the origin reletive to the view origin
;145:	if ( cg.testGun ) {
ADDRGP4 cg+115612
INDIRI4
CNSTI4 0
EQI4 $183
line 146
;146:		VectorCopy( cg.refdef.vieworg, cg.testModelEntity.origin );
ADDRGP4 cg+115408+68
ADDRGP4 cg+109044+24
INDIRB
ASGNB 12
line 147
;147:		VectorCopy( cg.refdef.viewaxis[0], cg.testModelEntity.axis[0] );
ADDRGP4 cg+115408+28
ADDRGP4 cg+109044+36
INDIRB
ASGNB 12
line 148
;148:		VectorCopy( cg.refdef.viewaxis[1], cg.testModelEntity.axis[1] );
ADDRGP4 cg+115408+28+12
ADDRGP4 cg+109044+36+12
INDIRB
ASGNB 12
line 149
;149:		VectorCopy( cg.refdef.viewaxis[2], cg.testModelEntity.axis[2] );
ADDRGP4 cg+115408+28+24
ADDRGP4 cg+109044+36+24
INDIRB
ASGNB 12
line 152
;150:
;151:		// allow the position to be adjusted
;152:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $206
line 153
;153:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[0][i] * cg_gun_x.value;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 cg+115408+68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRI4
ADDRGP4 cg+109044+36
ADDP4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 154
;154:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[1][i] * cg_gun_y.value;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
ADDRLP4 16
INDIRI4
ADDRGP4 cg+115408+68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRGP4 cg+109044+36+12
ADDP4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 155
;155:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[2][i] * cg_gun_z.value;
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRGP4 cg+115408+68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRI4
ADDRGP4 cg+109044+36+24
ADDP4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 156
;156:		}
LABELV $207
line 152
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $206
line 157
;157:	}
LABELV $183
line 159
;158:
;159:	trap_R_AddRefEntityToScene( &cg.testModelEntity );
ADDRGP4 cg+115408
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 160
;160:}
LABELV $175
endproc CG_AddTestModel 32 4
proc CG_CalcVrect 12 8
line 174
;161:
;162:
;163:
;164://============================================================================
;165:
;166:
;167:/*
;168:=================
;169:CG_CalcVrect
;170:
;171:Sets the coordinates of the rendered window
;172:=================
;173:*/
;174:static void CG_CalcVrect (void) {
line 178
;175:	int		size;
;176:
;177:	// the intermission should allways be full screen
;178:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $229
line 179
;179:		size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 180
;180:	} else {
ADDRGP4 $230
JUMPV
LABELV $229
line 182
;181:		// bound normal viewsize
;182:		if (cg_viewsize.integer < 30) {
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 30
GEI4 $232
line 183
;183:			trap_Cvar_Set ("cg_viewsize","30");
ADDRGP4 $235
ARGP4
ADDRGP4 $236
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 184
;184:			size = 30;
ADDRLP4 0
CNSTI4 30
ASGNI4
line 186
;185:			
;186:		} else if (cg_viewsize.integer > 100) {
ADDRGP4 $233
JUMPV
LABELV $232
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 100
LEI4 $237
line 187
;187:			trap_Cvar_Set ("cg_viewsize","100");
ADDRGP4 $235
ARGP4
ADDRGP4 $240
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 188
;188:			size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 189
;189:		} else {
ADDRGP4 $238
JUMPV
LABELV $237
line 190
;190:			size = cg_viewsize.integer;
ADDRLP4 0
ADDRGP4 cg_viewsize+12
INDIRI4
ASGNI4
line 191
;191:		}
LABELV $238
LABELV $233
line 193
;192:
;193:	}
LABELV $230
line 196
;194:
;195:
;196:	cg.refdef.width = cgs.glconfig.vidWidth*size/100;
ADDRGP4 cg+109044+8
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 197
;197:	cg.refdef.width &= ~1;
ADDRLP4 4
ADDRGP4 cg+109044+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 199
;198:
;199:	cg.refdef.height = cgs.glconfig.vidHeight*size/100;
ADDRGP4 cg+109044+12
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 200
;200:	cg.refdef.height &= ~1;
ADDRLP4 8
ADDRGP4 cg+109044+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 202
;201:
;202:	cg.refdef.x = (cgs.glconfig.vidWidth - cg.refdef.width)/2;
ADDRGP4 cg+109044
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRGP4 cg+109044+8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 203
;203:	cg.refdef.y = (cgs.glconfig.vidHeight - cg.refdef.height)/2;
ADDRGP4 cg+109044+4
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRGP4 cg+109044+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 204
;204:}
LABELV $228
endproc CG_CalcVrect 12 8
data
align 4
LABELV $266
byte 4 3225419776
byte 4 3225419776
byte 4 3225419776
align 4
LABELV $267
byte 4 1077936128
byte 4 1077936128
byte 4 1077936128
code
proc CG_OffsetThirdPersonView 208 28
line 225
;205:
;206://==============================================================================
;207:
;208:
;209:/*
;210:===============
;211:CG_OffsetThirdPersonView
;212:
;213:===============
;214:*/
;215:#define	FOCUS_DISTANCE	512
;216:
;217:#define MIN_CAMERA_ZOOM		50
;218:#define MAX_CAMERA_ZOOM		200
;219:#define STEP_CAMERA_ZOOM	2
;220:
;221:int CG_FollowCycle( int dir );
;222:qboolean CG_ButtonPushed( int button );
;223:qboolean CG_LastButtonPushed( int button );
;224:
;225:static void CG_OffsetThirdPersonView( void ) {
line 236
;226:	vec3_t		forward, right, up;
;227:	vec3_t		view;
;228:	vec3_t		focusAngles;
;229:	trace_t		trace;
;230:	static vec3_t	mins = { -3, -3, -3 };
;231:	static vec3_t	maxs = { 3, 3, 3 };
;232:	vec3_t		focusPoint;
;233:	float		focusDist;
;234:	float		forwardScale, sideScale;
;235:
;236:	if ( cg.cameraActive && !cg.cameraSpectator )
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 cg+116652
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $268
ADDRGP4 cg+116676
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $268
line 237
;237:	{
line 238
;238:		VectorCopy( cg.cameraOrigin , cg.refdef.vieworg );
ADDRGP4 cg+109044+24
ADDRGP4 cg+116640
INDIRB
ASGNB 12
line 241
;239:
;240:		// turn off camera
;241:		if ( cg.cameraRemainTime < cg.time )
ADDRGP4 cg+116656
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $269
line 242
;242:		{
line 243
;243:			cg.cameraActive = qfalse;
ADDRGP4 cg+116652
CNSTI4 0
ASGNI4
line 244
;244:			cg.cameraFollowNumber = 0;
ADDRGP4 cg+116660
CNSTI4 0
ASGNI4
line 246
;245:			// so we won't run into bugs
;246:			VectorClear( cg.cameraOrigin );
ADDRLP4 144
CNSTF4 0
ASGNF4
ADDRGP4 cg+116640+8
ADDRLP4 144
INDIRF4
ASGNF4
ADDRGP4 cg+116640+4
ADDRLP4 144
INDIRF4
ASGNF4
ADDRGP4 cg+116640
ADDRLP4 144
INDIRF4
ASGNF4
line 247
;247:		}
line 248
;248:	}
LABELV $268
line 250
;249:	else
;250:	{
line 253
;251://		if ( cg.snap->ps.pm_flags & PMF_FOLLOW )
;252://			VectorCopy( cg.cameraOrigin , cg.refdef.vieworg ); 
;253:	}
LABELV $269
line 256
;254:
;255:
;256:	VectorCopy( cg.predictedPlayerState.viewangles, focusAngles );
ADDRLP4 56
ADDRGP4 cg+107636+152
INDIRB
ASGNB 12
line 269
;257:
;258:	/*
;259:	focusAngles[PITCH] = 25;
;260:	focusAngles[YAW] = focusAngles[ROLL] = 0;
;261:	*/
;262:
;263:	// if dead, look at killer
;264:/*	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
;265:		focusAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
;266:		cg.refdefViewAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
;267:	}
;268:*/
;269:	if ( focusAngles[PITCH] > 45 ) {
ADDRLP4 56
INDIRF4
CNSTF4 1110704128
LEF4 $288
line 270
;270:		focusAngles[PITCH] = 45;		// don't go too far overhead
ADDRLP4 56
CNSTF4 1110704128
ASGNF4
line 271
;271:	}
LABELV $288
line 275
;272://	if ( !(cg.predictedPlayerState.pm_flags & PMF_FOLLOW) )
;273:	//	cg.refdef.vieworg[2] += 20;
;274:
;275:	AngleVectors( focusAngles, forward, NULL, NULL );
ADDRLP4 56
ARGP4
ADDRLP4 24
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
ADDRGP4 AngleVectors
CALLV
pop
line 277
;276:
;277:	VectorMA( cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint );
ADDRLP4 148
CNSTF4 1140850688
ASGNF4
ADDRLP4 12
ADDRGP4 cg+109044+24
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+109044+24+4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+109044+24+8
INDIRF4
CNSTF4 1140850688
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 278
;278:	cg.refdef.vieworg[2] += 20;
ADDRLP4 152
ADDRGP4 cg+109044+24+8
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 280
;279:
;280:	VectorCopy( cg.refdef.vieworg, view );
ADDRLP4 0
ADDRGP4 cg+109044+24
INDIRB
ASGNB 12
line 286
;281:
;282://	view[2] += 8;
;283:
;284://	cg.refdefViewAngles[PITCH] *= 0.5;
;285:
;286:	AngleVectors( cg.predictedPlayerState.viewangles, forward, right, up );
ADDRGP4 cg+107636+152
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 288
;287: 
;288:	if ( cg.snap->ps.pm_flags & PMF_FOLLOW )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $309
line 289
;289:	{
line 294
;290:		// camera handling:
;291:  		usercmd_t	cmd;
;292:		int			cmdNum;
;293:
;294:		cmdNum = trap_GetCurrentCmdNumber();
ADDRLP4 184
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
line 295
;295:		trap_GetUserCmd( cmdNum, &cmd );    
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 156
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 297
;296:
;297:		if ( cmd.forwardmove < 0 )
ADDRLP4 156+21
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $312
line 298
;298:		{			
line 299
;299:			cg.cameraZoom += STEP_CAMERA_ZOOM;
ADDRLP4 188
ADDRGP4 cg+116668
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 301
;300:
;301:		}
ADDRGP4 $313
JUMPV
LABELV $312
line 302
;302:		else if ( cmd.forwardmove > 0 )
ADDRLP4 156+21
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $316
line 303
;303:		{
line 304
;304:			cg.cameraZoom -= STEP_CAMERA_ZOOM; 
ADDRLP4 188
ADDRGP4 cg+116668
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 306
;305:
;306:		} 
LABELV $316
LABELV $313
line 308
;307:
;308:		if ( cg.cameraZoom < MIN_CAMERA_ZOOM )
ADDRGP4 cg+116668
INDIRF4
CNSTF4 1112014848
GEF4 $320
line 309
;309:			cg.cameraZoom = MIN_CAMERA_ZOOM;
ADDRGP4 cg+116668
CNSTF4 1112014848
ASGNF4
LABELV $320
line 310
;310:		if ( cg.cameraZoom > MAX_CAMERA_ZOOM )
ADDRGP4 cg+116668
INDIRF4
CNSTF4 1128792064
LEF4 $324
line 311
;311:			cg.cameraZoom = MAX_CAMERA_ZOOM;
ADDRGP4 cg+116668
CNSTF4 1128792064
ASGNF4
LABELV $324
line 313
;312:
;313:		if ( cmd.rightmove < 0 )
ADDRLP4 156+22
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $328
line 314
;314:		{			
line 315
;315:			cg.cameraAngle += STEP_CAMERA_ZOOM;
ADDRLP4 188
ADDRGP4 cg+116680
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 317
;316:
;317:			if ( cg.cameraAngle > 360 )
ADDRGP4 cg+116680
INDIRF4
CNSTF4 1135869952
LEF4 $329
line 318
;318:				cg.cameraAngle -= 360;
ADDRLP4 192
ADDRGP4 cg+116680
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 319
;319:		}
ADDRGP4 $329
JUMPV
LABELV $328
line 320
;320:		else if ( cmd.rightmove > 0 )
ADDRLP4 156+22
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $336
line 321
;321:		{
line 322
;322:			cg.cameraAngle -= STEP_CAMERA_ZOOM; 
ADDRLP4 188
ADDRGP4 cg+116680
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 323
;323:		} 
LABELV $336
LABELV $329
line 325
;324:
;325:		if ( cg.cameraAngle < -360 )
ADDRGP4 cg+116680
INDIRF4
CNSTF4 3283353600
GEF4 $340
line 326
;326:			cg.cameraAngle += 360;
ADDRLP4 188
ADDRGP4 cg+116680
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $340
line 328
;327:  
;328:		forwardScale = cos( cg.cameraAngle / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg+116680
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 192
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 192
INDIRF4
ASGNF4
line 329
;329:		sideScale = sin( cg.cameraAngle / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg+116680
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 196
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 196
INDIRF4
ASGNF4
line 330
;330: 		VectorMA( view, -cg.cameraZoom * forwardScale, forward, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 cg+116668
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 cg+116668
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 cg+116668
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 331
;331:		VectorMA( view, -cg.cameraZoom * sideScale, right, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg+116668
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg+116668
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg+116668
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 332
;332:	}
ADDRGP4 $310
JUMPV
LABELV $309
line 333
;333:	else if ( cg.deathCam )
ADDRGP4 cg+201996
INDIRI4
CNSTI4 0
EQI4 $364
line 334
;334:	{
line 335
;335:		if ( cg.deathZoom < 80 )
ADDRGP4 cg+201992
INDIRI4
CNSTI4 80
GEI4 $367
line 336
;336:			cg.deathZoom += (cg.time - cg.oldTime)/12;
ADDRLP4 156
ADDRGP4 cg+201992
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+107608
INDIRI4
SUBI4
CNSTI4 12
DIVI4
ADDI4
ASGNI4
LABELV $367
line 338
;337:		
;338:		cg.deathRotation += (cg.time - cg.oldTime)/16;
ADDRLP4 160
ADDRGP4 cg+201988
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+107608
INDIRI4
SUBI4
CNSTI4 16
DIVI4
ADDI4
ASGNI4
line 340
;339:
;340:		forwardScale = cos( (float)cg.deathRotation / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg+201988
INDIRI4
CVIF4 4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 164
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 164
INDIRF4
ASGNF4
line 341
;341:		sideScale = sin( (float)cg.deathRotation / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg+201988
INDIRI4
CVIF4 4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 168
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 168
INDIRF4
ASGNF4
line 342
;342:		VectorMA( view, (float)-cg.deathZoom * forwardScale, forward, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 cg+201992
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 cg+201992
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 cg+201992
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 344
;343:
;344:		VectorCopy( cg.refdef.vieworg, focusPoint );
ADDRLP4 12
ADDRGP4 cg+109044+24
INDIRB
ASGNB 12
line 346
;345:
;346:		view[2] += (float)cg.deathZoom / 4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+201992
INDIRI4
CVIF4 4
CNSTF4 1082130432
DIVF4
ADDF4
ASGNF4
line 347
;347:		focusPoint[2] -= 30;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1106247680
SUBF4
ASGNF4
line 349
;348:
;349:		VectorMA( view, (float)-cg.deathZoom * sideScale, right, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg+201992
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg+201992
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg+201992
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 350
;350:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 352
;351:	else
;352:	{
line 353
;353:		forwardScale = cos( cg_thirdPersonAngle.value / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 156
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 156
INDIRF4
ASGNF4
line 354
;354:		sideScale = sin( cg_thirdPersonAngle.value / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 160
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 160
INDIRF4
ASGNF4
line 355
;355:		VectorMA( view, -cg_thirdPersonRange.value * forwardScale, forward, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 356
;356:		VectorMA( view, -cg_thirdPersonRange.value * sideScale, right, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 357
;357:	}
LABELV $365
LABELV $310
line 362
;358:
;359:	// trace a ray from the origin to the viewpoint to make sure the view isn't
;360:	// in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything
;361:
;362:	if (!cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
NEI4 $421
line 363
;363:		CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+109044+24
ARGP4
ADDRGP4 $266
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 365
;364:
;365:		if ( trace.fraction != 1.0 ) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
EQF4 $428
line 366
;366:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 367
;367:			view[2] += (1.0 - trace.fraction) * 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
CNSTF4 1065353216
ADDRLP4 72+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 371
;368:			// try another trace to this position, because a tunnel may have the ceiling
;369:			// close enogh that this is poking out
;370:
;371:			CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+109044+24
ARGP4
ADDRGP4 $266
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 372
;372:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 373
;373:		}
LABELV $428
line 374
;374:	}
LABELV $421
line 377
;375:
;376:
;377:	VectorCopy( view, cg.refdef.vieworg );
ADDRGP4 cg+109044+24
ADDRLP4 0
INDIRB
ASGNB 12
line 380
;378:
;379:	// select pitch to look at focus point from vieword
;380:	VectorSubtract( focusPoint, cg.refdef.vieworg, focusPoint );
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRGP4 cg+109044+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+109044+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+109044+24+8
INDIRF4
SUBF4
ASGNF4
line 381
;381:	focusDist = sqrt( focusPoint[0] * focusPoint[0] + focusPoint[1] * focusPoint[1] );
ADDRLP4 156
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 156
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 160
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 160
INDIRF4
ASGNF4
line 382
;382:	if ( focusDist < 1 ) {
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
GEF4 $455
line 383
;383:		focusDist = 1;	// should never happen
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
line 384
;384:	}
LABELV $455
line 385
;385:	cg.refdefViewAngles[PITCH] = -180 / M_PI * atan2( focusPoint[2], focusDist );
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 164
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRGP4 cg+109412
CNSTF4 3261411041
ADDRLP4 164
INDIRF4
MULF4
ASGNF4
line 387
;386:
;387: 	if ( cg.snap->ps.pm_flags & PMF_FOLLOW )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $459
line 388
;388:		cg.refdefViewAngles[YAW] -= cg.cameraAngle; 
ADDRLP4 168
ADDRGP4 cg+109412+4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
ADDRGP4 cg+116680
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $460
JUMPV
LABELV $459
line 389
;389:	else if ( cg.deathCam )
ADDRGP4 cg+201996
INDIRI4
CNSTI4 0
EQI4 $465
line 390
;390:		cg.refdefViewAngles[YAW] -= cg.deathRotation; 
ADDRLP4 172
ADDRGP4 cg+109412+4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRF4
ADDRGP4 cg+201988
INDIRI4
CVIF4 4
SUBF4
ASGNF4
ADDRGP4 $466
JUMPV
LABELV $465
line 392
;391:	else 
;392:		cg.refdefViewAngles[YAW] -= cg_thirdPersonAngle.value;
ADDRLP4 176
ADDRGP4 cg+109412+4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
SUBF4
ASGNF4
LABELV $466
LABELV $460
line 393
;393:}
LABELV $265
endproc CG_OffsetThirdPersonView 208 28
proc CG_StepOffset 8 0
line 397
;394:
;395:
;396:// this causes a compiler bug on mac MrC compiler
;397:static void CG_StepOffset( void ) {
line 401
;398:	int		timeDelta;
;399:	
;400:	// smooth out stair climbing
;401:	timeDelta = cg.time - cg.stepTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108924
INDIRI4
SUBI4
ASGNI4
line 402
;402:	if ( timeDelta < STEP_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
GEI4 $477
line 403
;403:		cg.refdef.vieworg[2] -= cg.stepChange 
ADDRLP4 4
ADDRGP4 cg+109044+24+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+108920
INDIRF4
CNSTI4 200
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 405
;404:			* (STEP_TIME - timeDelta) / STEP_TIME;
;405:	}
LABELV $477
line 406
;406:}
LABELV $474
endproc CG_StepOffset 8 0
proc CG_OffsetFirstPersonView 152 4
line 417
;407:
;408:/*
;409:===============
;410:CG_OffsetFirstPersonView
;411:
;412:===============
;413:*/
;414:extern vmCvar_t	cg_bobyaw;
;415:extern vmCvar_t	cg_runyaw;
;416:
;417:static void CG_OffsetFirstPersonView( void ) {
line 428
;418:	float			*origin;
;419:	float			*angles;
;420:	float			bob;
;421:	float			ratio;
;422:	float			delta;
;423:	float			speed;
;424:	float			f;
;425:	vec3_t			predictedVelocity;
;426:	int				timeDelta;
;427:	
;428:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $484
line 429
;429:		return;
ADDRGP4 $483
JUMPV
LABELV $484
line 432
;430:	}
;431:
;432:	origin = cg.refdef.vieworg;
ADDRLP4 20
ADDRGP4 cg+109044+24
ASGNP4
line 433
;433:	angles = cg.refdefViewAngles;
ADDRLP4 4
ADDRGP4 cg+109412
ASGNP4
line 445
;434:
;435:	// if dead, fix the angle and don't add any kick
;436:/*	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
;437:		angles[ROLL] = 40;
;438:		angles[PITCH] = -15;
;439:		angles[YAW] = cg.snap->ps.stats[STAT_DEAD_YAW];
;440:		origin[2] += cg.predictedPlayerState.viewheight;
;441:		return;
;442:	}*/
;443:
;444:	// add angles based on weapon kick
;445:	VectorAdd (angles, cg.kick_angles, angles);
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+115368
INDIRF4
ADDF4
ASGNF4
ADDRLP4 48
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRGP4 cg+115368+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 52
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRGP4 cg+115368+8
INDIRF4
ADDF4
ASGNF4
line 457
;446:
;447:
;448:	// add pitch based on fall kick
;449:#if 0
;450:	ratio = ( cg.time - cg.landTime) / FALL_TIME;
;451:	if (ratio < 0)
;452:		ratio = 0;
;453:	angles[PITCH] += ratio * cg.fall_value;
;454:#endif
;455:
;456:	// add angles based on velocity
;457:	VectorCopy( cg.predictedPlayerState.velocity, predictedVelocity );
ADDRLP4 8
ADDRGP4 cg+107636+32
INDIRB
ASGNB 12
line 459
;458:
;459:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[0]);
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRGP4 cg+109044+36
INDIRF4
MULF4
ADDRLP4 8+4
INDIRF4
ADDRGP4 cg+109044+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+8
INDIRF4
ADDRGP4 cg+109044+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 460
;460:	angles[PITCH] += delta * cg_runpitch.value;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runpitch+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 462
;461:	
;462:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[1]);
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRGP4 cg+109044+36+12
INDIRF4
MULF4
ADDRLP4 8+4
INDIRF4
ADDRGP4 cg+109044+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+8
INDIRF4
ADDRGP4 cg+109044+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 463
;463:	angles[ROLL] -= delta * cg_runroll.value;
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runroll+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 465
;464:
;465:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[0]);
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRGP4 cg+109044+36
INDIRF4
MULF4
ADDRLP4 8+4
INDIRF4
ADDRGP4 cg+109044+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+8
INDIRF4
ADDRGP4 cg+109044+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 466
;466:	angles[YAW] -= delta * cg_runyaw.value; 
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runyaw+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 469
;467:
;468:	// make sure the bob is visible even at low speeds
;469:	speed = cg.xyspeed > 180 ? cg.xyspeed : 180;
ADDRGP4 cg+115400
INDIRF4
CNSTF4 1127481344
LEF4 $536
ADDRLP4 68
ADDRGP4 cg+115400
INDIRF4
ASGNF4
ADDRGP4 $537
JUMPV
LABELV $536
ADDRLP4 68
CNSTF4 1127481344
ASGNF4
LABELV $537
ADDRLP4 24
ADDRLP4 68
INDIRF4
ASGNF4
line 471
;470:
;471:	delta = cg.bobfracsin * cg_bobpitch.value * speed;
ADDRLP4 0
ADDRGP4 cg+115392
INDIRF4
ADDRGP4 cg_bobpitch+8
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 472
;472:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED || 
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $547
ADDRGP4 cg+107636+184+36
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $540
LABELV $547
line 474
;473:		BG_IsZooming( cg.predictedPlayerState.stats[STAT_WEAPONMODE] ) )
;474:		delta *= 2;		// crouching
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $540
line 475
;475:	angles[PITCH] += delta;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 477
;476:
;477:	delta = cg.bobfracsin * cg_bobroll.value * speed; // 0.0035
ADDRLP4 0
ADDRGP4 cg+115392
INDIRF4
ADDRGP4 cg_bobroll+8
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 480
;478:
;479:	// sprinting
;480:	if ( CG_ButtonPushed( BUTTON_SPRINT ) && cg.predictedPlayerState.stats[STAT_STAMINA] > 0 &&
CNSTI4 32
ARGI4
ADDRLP4 80
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $550
ADDRGP4 cg+107636+184+40
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $550
ADDRGP4 cg+107636+4
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $550
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 84
INDIRI4
NEI4 $550
line 483
;481:		cg.predictedPlayerState.pm_type == PM_NORMAL &&
;482:		!(cg.predictedPlayerState.pm_flags & PMF_DUCKED) )
;483:		delta = cg.bobfracsin * cg_bobroll.value * speed; // 0.01
ADDRLP4 0
ADDRGP4 cg+115392
INDIRF4
ADDRGP4 cg_bobroll+8
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRGP4 $551
JUMPV
LABELV $550
line 484
;484:    else if (cg.predictedPlayerState.pm_flags & PMF_DUCKED ||
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $568
ADDRGP4 cg+107636+184+36
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $561
LABELV $568
line 486
;485:		BG_IsZooming( cg.predictedPlayerState.stats[STAT_WEAPONMODE] ) )
;486:		delta *= 2;		// crouching accentuates roll
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $561
LABELV $551
line 488
;487:
;488:	if (cg.bobcycle & 1)
ADDRGP4 cg+115396
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $569
line 489
;489:		delta = -delta;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
LABELV $569
line 490
;490:	angles[ROLL] += delta;
ADDRLP4 92
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 495
;491:
;492:
;493:	// yaw
;494:
;495:	delta = cg.bobfracsin * cg_bobyaw.value * speed; // 0.0035
ADDRLP4 0
ADDRGP4 cg+115392
INDIRF4
ADDRGP4 cg_bobyaw+8
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 498
;496:
;497:	// sprinting
;498:	if ( CG_ButtonPushed( BUTTON_SPRINT ) && cg.predictedPlayerState.stats[STAT_STAMINA] > 0 &&
CNSTI4 32
ARGI4
ADDRLP4 96
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $574
ADDRGP4 cg+107636+184+40
INDIRI4
ADDRLP4 100
INDIRI4
LEI4 $574
ADDRGP4 cg+107636+4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $574
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 100
INDIRI4
NEI4 $574
line 501
;499:		cg.predictedPlayerState.pm_type == PM_NORMAL &&
;500:		!(cg.predictedPlayerState.pm_flags & PMF_DUCKED) )
;501:		delta = cg.bobfracsin * cg_bobyaw.value * speed; // 0.01
ADDRLP4 0
ADDRGP4 cg+115392
INDIRF4
ADDRGP4 cg_bobyaw+8
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRGP4 $575
JUMPV
LABELV $574
line 502
;502:    else if (cg.predictedPlayerState.pm_flags & PMF_DUCKED ||
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $592
ADDRGP4 cg+107636+184+36
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_IsZooming
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $585
LABELV $592
line 504
;503:		BG_IsZooming( cg.predictedPlayerState.stats[STAT_WEAPONMODE] ) )
;504:		delta *= 2;		// crouching accentuates roll
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $585
LABELV $575
line 506
;505:
;506:	if (cg.bobcycle & 1)
ADDRGP4 cg+115396
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $593
line 507
;507:		delta = -delta;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
LABELV $593
line 508
;508:	angles[YAW] += delta;
ADDRLP4 108
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 513
;509:
;510://===================================
;511:
;512:	// add view height
;513:	origin[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 112
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 516
;514:
;515:	// smooth out duck height changes
;516:	timeDelta = cg.time - cg.duckTime;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108932
INDIRI4
SUBI4
ASGNI4
line 517
;517:	if ( timeDelta < DUCK_TIME) {
ADDRLP4 36
INDIRI4
CNSTI4 100
GEI4 $600
line 518
;518:		cg.refdef.vieworg[2] -= cg.duckChange 
ADDRLP4 116
ADDRGP4 cg+109044+24+8
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRGP4 cg+108928
INDIRF4
CNSTI4 100
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
SUBF4
ASGNF4
line 520
;519:			* (DUCK_TIME - timeDelta) / DUCK_TIME;
;520:	}
LABELV $600
line 523
;521:
;522:	// add bob height
;523:	bob = cg.bobfracsin * speed * cg_bobup.value;
ADDRLP4 28
ADDRGP4 cg+115392
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRGP4 cg_bobup+8
INDIRF4
MULF4
ASGNF4
line 524
;524:	if (bob > 6) {
ADDRLP4 28
INDIRF4
CNSTF4 1086324736
LEF4 $608
line 525
;525:		bob = 6;
ADDRLP4 28
CNSTF4 1086324736
ASGNF4
line 526
;526:	}
LABELV $608
line 528
;527:
;528:	origin[2] += bob;
ADDRLP4 116
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ASGNF4
line 532
;529:
;530:
;531:	// add fall height
;532:	delta = cg.time - cg.landTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108940
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 533
;533:	if ( delta < LAND_DEFLECT_TIME ) {
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
GEF4 $612
line 534
;534:		f = delta / LAND_DEFLECT_TIME;
ADDRLP4 40
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
DIVF4
ASGNF4
line 535
;535:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 120
ADDRGP4 cg+109044+24+8
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRGP4 cg+108936
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 536
;536:	} else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
ADDRGP4 $613
JUMPV
LABELV $612
ADDRLP4 0
INDIRF4
CNSTF4 1148846080
GEF4 $618
line 537
;537:		delta -= LAND_DEFLECT_TIME;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
SUBF4
ASGNF4
line 538
;538:		f = 1.0 - ( delta / LAND_RETURN_TIME );
ADDRLP4 40
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
DIVF4
SUBF4
ASGNF4
line 539
;539:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 120
ADDRGP4 cg+109044+24+8
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRGP4 cg+108936
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 540
;540:	}
LABELV $618
LABELV $613
line 543
;541:
;542:	// add step offset
;543:	CG_StepOffset();
ADDRGP4 CG_StepOffset
CALLV
pop
line 547
;544:
;545:	// add kick offset
;546:
;547:	VectorAdd (origin, cg.kick_origin, origin);
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRGP4 cg+115380
INDIRF4
ADDF4
ASGNF4
ADDRLP4 124
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRGP4 cg+115380+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRGP4 cg+115380+8
INDIRF4
ADDF4
ASGNF4
line 550
;548:
;549:	// pivot the eye based on a neck length
;550:	{
line 553
;551:		extern vmCvar_t cg_viewHeight;
;552:
;553:		cg.refdef.vieworg[2] += cg_viewHeight.value;
ADDRLP4 132
ADDRGP4 cg+109044+24+8
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRGP4 cg_viewHeight+8
INDIRF4
ADDF4
ASGNF4
line 554
;554:	}
line 555
;555:	VectorCopy( angles, cg.weaponAngles );
ADDRGP4 cg+117876
ADDRLP4 4
INDIRP4
INDIRB
ASGNB 12
line 557
;556:	// add angles based on damage kick
;557:	if ( cg.damageTime ) {
ADDRGP4 cg+115312
INDIRF4
CNSTF4 0
EQF4 $634
line 558
;558:		int returntime = ( cg.damageDuration / 5 ) * 4;
ADDRLP4 136
ADDRGP4 cg+117872
INDIRI4
CNSTI4 5
DIVI4
CNSTI4 2
LSHI4
ASGNI4
line 559
;559:		int time = cg.damageDuration;
ADDRLP4 140
ADDRGP4 cg+117872
INDIRI4
ASGNI4
line 560
;560:		int deflecttime = ( cg.damageDuration / 5 );
ADDRLP4 132
ADDRGP4 cg+117872
INDIRI4
CNSTI4 5
DIVI4
ASGNI4
line 562
;561:
;562:		ratio = cg.time - cg.damageTime;
ADDRLP4 32
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ADDRGP4 cg+115312
INDIRF4
SUBF4
ASGNF4
line 564
;563:
;564:		if ( ratio < deflecttime ) {
ADDRLP4 32
INDIRF4
ADDRLP4 132
INDIRI4
CVIF4 4
GEF4 $642
line 565
;565:			ratio /= deflecttime;
ADDRLP4 32
ADDRLP4 32
INDIRF4
ADDRLP4 132
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 566
;566:			angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+115360
INDIRF4
MULF4
ADDF4
ASGNF4
line 567
;567:			angles[ROLL] += ratio * cg.v_dmg_roll;
ADDRLP4 148
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+115364
INDIRF4
MULF4
ADDF4
ASGNF4
line 568
;568:		} else {
ADDRGP4 $643
JUMPV
LABELV $642
line 569
;569:			ratio = 1.0 - ( ratio - deflecttime ) / returntime;
ADDRLP4 32
CNSTF4 1065353216
ADDRLP4 32
INDIRF4
ADDRLP4 132
INDIRI4
CVIF4 4
SUBF4
ADDRLP4 136
INDIRI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 570
;570:			if ( ratio > 0 ) {
ADDRLP4 32
INDIRF4
CNSTF4 0
LEF4 $646
line 571
;571:				angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+115360
INDIRF4
MULF4
ADDF4
ASGNF4
line 572
;572:				angles[ROLL] += ratio * cg.v_dmg_roll;
ADDRLP4 148
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+115364
INDIRF4
MULF4
ADDF4
ASGNF4
line 573
;573:			}
LABELV $646
line 574
;574:		}
LABELV $643
line 575
;575:	}
LABELV $634
line 588
;576:
;577:#if 0
;578:	{
;579:#define	NECK_LENGTH		8
;580:	vec3_t			forward, up;
;581: 
;582:	cg.refdef.vieworg[2] -= NECK_LENGTH;
;583:	AngleVectors( cg.refdefViewAngles, forward, NULL, up );
;584:	VectorMA( cg.refdef.vieworg, 3, forward, cg.refdef.vieworg );
;585:	VectorMA( cg.refdef.vieworg, NECK_LENGTH, up, cg.refdef.vieworg );
;586:	}
;587:#endif
;588:}
LABELV $483
endproc CG_OffsetFirstPersonView 152 4
proc CG_CalcFov 64 8
line 603
;589:
;590://======================================================================
;591: 
;592:
;593:/*
;594:====================
;595:CG_CalcFov
;596:
;597:Fixed fov at intermissions, otherwise account for fov variable and zooms.
;598:====================
;599:*/
;600:#define	WAVE_AMPLITUDE	1
;601:#define	WAVE_FREQUENCY	0.4
;602:
;603:static int CG_CalcFov( void ) {
line 612
;604:	float	x;
;605:	float	phase;
;606:	float	v;
;607:	int		contents;
;608:	float	fov_x, fov_y;
;609:	float	zoomFov;
;610:	float	f;
;611:	int		inwater;
;612:	int		weaponstate = cg.predictedPlayerState.weaponstate;
ADDRLP4 24
ADDRGP4 cg+107636+148
INDIRI4
ASGNI4
line 614
;613:
;614:	if ( cg.predictedPlayerState.pm_type == PM_INTERMISSION || cg.cameraActive ) {
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 5
EQI4 $658
ADDRGP4 cg+116652
INDIRI4
CNSTI4 0
EQI4 $653
LABELV $658
line 616
;615:		// if in intermission, use a fixed value
;616:		fov_x = 75;
ADDRLP4 0
CNSTF4 1117126656
ASGNF4
line 617
;617:	} else {
ADDRGP4 $654
JUMPV
LABELV $653
line 619
;618:		// user selectable
;619:		if ( cgs.dmflags & DF_FIXED_FOV ) {
ADDRGP4 cgs+31460
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $659
line 621
;620:			// dmflag to prevent wide fov for all clients
;621:			fov_x = 75;
ADDRLP4 0
CNSTF4 1117126656
ASGNF4
line 622
;622:		} else {
ADDRGP4 $660
JUMPV
LABELV $659
line 623
;623:			fov_x = cg_fov.value;
ADDRLP4 0
ADDRGP4 cg_fov+8
INDIRF4
ASGNF4
line 624
;624:			if ( fov_x < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $663
line 625
;625:				fov_x = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 626
;626:			} else if ( fov_x > 160 ) {
ADDRGP4 $664
JUMPV
LABELV $663
ADDRLP4 0
INDIRF4
CNSTF4 1126170624
LEF4 $665
line 627
;627:				fov_x = 160;
ADDRLP4 0
CNSTF4 1126170624
ASGNF4
line 628
;628:			}
LABELV $665
LABELV $664
line 629
;629:		}
LABELV $660
line 632
;630:
;631:		// account for zooms
;632:		zoomFov = 75/8;
ADDRLP4 16
CNSTF4 1091567616
ASGNF4
line 633
;633:		if ( zoomFov < 1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $667
line 634
;634:			zoomFov = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 635
;635:		} else if ( zoomFov > 160 ) {
ADDRGP4 $668
JUMPV
LABELV $667
ADDRLP4 16
INDIRF4
CNSTF4 1126170624
LEF4 $669
line 636
;636:			zoomFov = 160;
ADDRLP4 16
CNSTF4 1126170624
ASGNF4
line 637
;637:		}
LABELV $669
LABELV $668
line 640
;638:
;639:		// only change fov when not in 3rd person
;640:		if ( !(cg.renderingThirdPerson) ) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $671
line 642
;641:
;642:			if ( ( cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM2X ) ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $674
line 643
;643:				zoomFov = 75/2; 
ADDRLP4 16
CNSTF4 1108606976
ASGNF4
LABELV $674
line 645
;644:
;645:			if ( (
ADDRLP4 40
CNSTI4 264
ASGNI4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 44
INDIRI4
NEI4 $681
ADDRGP4 cg+36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 44
INDIRI4
EQI4 $677
LABELV $681
ADDRLP4 48
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 3
EQI4 $684
ADDRLP4 48
INDIRI4
CNSTI4 4
EQI4 $684
ADDRLP4 48
INDIRI4
CNSTI4 5
EQI4 $684
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $677
LABELV $684
line 649
;646:				(cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM2X ) ) ||
;647:				(cg.snap->ps.stats[STAT_WEAPONMODE] & ( 1 << WM_ZOOM4X ) ) ) &&
;648:				(weaponstate == WEAPON_FIRING || weaponstate == WEAPON_FIRING2 || weaponstate == WEAPON_FIRING3 || weaponstate == WEAPON_READY) )
;649:			{
line 650
;650:				f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109796
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1125515264
DIVF4
ASGNF4
line 651
;651:				if ( f > 1.0 ) {
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
LEF4 $687
line 652
;652:					fov_x = zoomFov;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 653
;653:				} else {
ADDRGP4 $678
JUMPV
LABELV $687
line 654
;654:					fov_x = fov_x + f * ( zoomFov - fov_x );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 655
;655:				}
line 656
;656:			} else {
ADDRGP4 $678
JUMPV
LABELV $677
line 657
;657:				f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109796
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1125515264
DIVF4
ASGNF4
line 658
;658:				if ( f > 1.0 ) {
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
LEF4 $691
line 659
;659:					fov_x = fov_x;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ASGNF4
line 660
;660:				} else {
ADDRGP4 $692
JUMPV
LABELV $691
line 661
;661:					fov_x = zoomFov + f * ( fov_x - zoomFov );
ADDRLP4 52
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 52
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 662
;662:				}
LABELV $692
line 663
;663:			}
LABELV $678
line 664
;664:		} // if ( !cg.render...
LABELV $671
line 665
;665:	}
LABELV $654
line 667
;666:
;667:	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 8
ADDRGP4 cg+109044+8
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
DIVF4
ASGNF4
line 668
;668:	fov_y = atan2( cg.refdef.height, x );
ADDRGP4 cg+109044+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 44
INDIRF4
ASGNF4
line 669
;669:	fov_y = fov_y * 360 / M_PI;
ADDRLP4 4
CNSTF4 1135869952
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 672
;670:
;671:	//only render headdamage when not in 3rdperson
;672:	if ( !cg.renderingThirdPerson )
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $697
line 673
;673:	{
line 674
;674:		if(cg.snap->ps.stats[STAT_HEAD_DAMAGE] > 15 && cg.snap->ps.stats[STAT_HEALTH] > 0)
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 15
LEI4 $700
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $700
line 675
;675:		{
line 676
;676:			fov_x += 0.5 * cg.snap->ps.stats[STAT_HEAD_DAMAGE] * sin(cg.time / (500.0 - 2 * cg.snap->ps.stats[STAT_HEAD_DAMAGE]));
ADDRLP4 48
CNSTI4 260
ASGNI4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1140457472
ADDRGP4 cg+36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
SUBF4
DIVF4
ARGF4
ADDRLP4 52
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
ADDRGP4 cg+36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
line 677
;677:			if(fov_x < 1)
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $707
line 678
;678:				fov_x = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
LABELV $707
line 679
;679:			fov_y += 0.5 * cg.snap->ps.stats[STAT_HEAD_DAMAGE] * cos(cg.time / (500.0 - 2 * cg.snap->ps.stats[STAT_HEAD_DAMAGE]));
ADDRLP4 56
CNSTI4 260
ASGNI4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1140457472
ADDRGP4 cg+36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
SUBF4
DIVF4
ARGF4
ADDRLP4 60
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRGP4 cg+36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 60
INDIRF4
MULF4
ADDF4
ASGNF4
line 680
;680:			if(fov_y < 1)
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $712
line 681
;681:				fov_y = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
LABELV $712
line 682
;682:		}
LABELV $700
line 683
;683:	}		
LABELV $697
line 686
;684:
;685:	// warp if underwater
;686:	contents = CG_PointContents( cg.refdef.vieworg, -1 );
ADDRGP4 cg+109044+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 48
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 687
;687:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $716
line 688
;688:		phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
ADDRLP4 32
CNSTF4 1073741824
CNSTF4 1078530011
CNSTF4 1053609165
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ASGNF4
line 689
;689:		v = WAVE_AMPLITUDE * sin( phase );
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 28
CNSTF4 1065353216
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
line 690
;690:		fov_x += v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ASGNF4
line 691
;691:		fov_y -= v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 692
;692:		inwater = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 693
;693:	}
ADDRGP4 $717
JUMPV
LABELV $716
line 694
;694:	else {
line 695
;695:		inwater = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 696
;696:	}
LABELV $717
line 699
;697:
;698:	// concussion effect
;699:	if ( cg.ConcussionTime > cg.time ) {
ADDRGP4 cg+116288
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $719
line 700
;700:		fov_x *=  1.0 + 0.3 * 
ADDRLP4 52
CNSTF4 1177075712
ASGNF4
CNSTF4 1100401636
ADDRGP4 cg+116288
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDRLP4 52
INDIRF4
DIVF4
ARGF4
ADDRLP4 56
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1050253722
ADDRGP4 cg+116288
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDRLP4 52
INDIRF4
DIVF4
ADDRLP4 56
INDIRF4
MULF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 703
;701:			(cg.ConcussionTime - cg.time) / (SEALS_FLASHBANGTIME*SEALS_CONCUSSIONFACTOR) *
;702:			sin( 3 * 2.0 * M_PI * (cg.ConcussionTime - cg.time) / (SEALS_FLASHBANGTIME*SEALS_CONCUSSIONFACTOR) );
;703:		fov_y *= 1.0 + 0.3 *
CNSTF4 1100401636
ADDRGP4 cg+116288
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1177075712
DIVF4
ARGF4
ADDRLP4 60
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1050253722
ADDRGP4 cg+116288
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1175232512
DIVF4
ADDRLP4 60
INDIRF4
MULF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 706
;704:			(cg.ConcussionTime - cg.time) / (SEALS_FLASHBANGTIME) *
;705:			cos( 3 * 2.0 * M_PI * (cg.ConcussionTime - cg.time) / (SEALS_FLASHBANGTIME*SEALS_CONCUSSIONFACTOR) );
;706:	}
LABELV $719
line 709
;707:	
;708:	// set it
;709:	cg.refdef.fov_x = fov_x;
ADDRGP4 cg+109044+16
ADDRLP4 0
INDIRF4
ASGNF4
line 710
;710:	cg.refdef.fov_y = fov_y;
ADDRGP4 cg+109044+20
ADDRLP4 4
INDIRF4
ASGNF4
line 715
;711:
;712://	if ( fov_x < 90 ) {
;713://		cg.zoomSensitivity = 1;
;714://	} else {
;715:		cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
ADDRGP4 cg+109800
ADDRGP4 cg+109044+20
INDIRF4
CNSTF4 1117126656
DIVF4
ASGNF4
line 718
;716://	}
;717:
;718:	return inwater;
ADDRLP4 20
INDIRI4
RETI4
LABELV $650
endproc CG_CalcFov 64 8
proc CG_CalcViewValues 44 12
line 728
;719:} 
;720:
;721:/*
;722:===============
;723:CG_CalcViewValues
;724:
;725:Sets cg.refdef view values
;726:===============
;727:*/
;728:static int CG_CalcViewValues( void ) {
line 731
;729:	playerState_t	*ps;
;730:
;731:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+109044
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 738
;732:
;733:	// strings for in game rendering
;734:	// Q_strncpyz( cg.refdef.text[0], "Park Ranger", sizeof(cg.refdef.text[0]) );
;735:	// Q_strncpyz( cg.refdef.text[1], "19", sizeof(cg.refdef.text[1]) );
;736:
;737:	// calculate size of 3D view
;738:	CG_CalcVrect();
ADDRGP4 CG_CalcVrect
CALLV
pop
line 740
;739:
;740:	ps = &cg.predictedPlayerState;
ADDRLP4 0
ADDRGP4 cg+107636
ASGNP4
line 743
;741:
;742:	// intermission view
;743:	if ( ps->pm_type == PM_INTERMISSION ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $742
line 744
;744:		VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+109044+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 745
;745:		VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+109412
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 746
;746:		AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+109412
ARGP4
ADDRGP4 cg+109044+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 747
;747:		return CG_CalcFov();
ADDRLP4 4
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $738
JUMPV
LABELV $742
line 750
;748:	}
;749:
;750:	cg.bobcycle = ( ps->bobCycle & 128 ) >> 7;
ADDRGP4 cg+115396
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 7
RSHI4
ASGNI4
line 751
;751:	cg.bobfracsin = fabs( sin( ( ps->bobCycle & 127 ) / 127.0 * M_PI ) );
CNSTF4 1078530011
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 127
BANDI4
CVIF4 4
CNSTF4 1123942400
DIVF4
MULF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRGP4 cg+115392
ADDRLP4 8
INDIRF4
ASGNF4
line 752
;752:	cg.xyspeed = sqrt( ps->velocity[0] * ps->velocity[0] +
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 cg+115400
ADDRLP4 24
INDIRF4
ASGNF4
line 756
;753:		ps->velocity[1] * ps->velocity[1] );
;754:
;755:
;756:	VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+109044+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 757
;757:	VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+109412
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 759
;758:
;759:	if (cg_cameraOrbit.integer) {
ADDRGP4 cg_cameraOrbit+12
INDIRI4
CNSTI4 0
EQI4 $756
line 760
;760:		if (cg.time > cg.nextOrbitTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+115404
INDIRI4
LEI4 $759
line 761
;761:			cg.nextOrbitTime = cg.time + cg_cameraOrbitDelay.integer;
ADDRGP4 cg+115404
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg_cameraOrbitDelay+12
INDIRI4
ADDI4
ASGNI4
line 762
;762:			cg_thirdPersonAngle.value += cg_cameraOrbit.value;
ADDRLP4 28
ADDRGP4 cg_thirdPersonAngle+8
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRGP4 cg_cameraOrbit+8
INDIRF4
ADDF4
ASGNF4
line 763
;763:		}
LABELV $759
line 764
;764:	}
LABELV $756
line 766
;765:
;766:	if(ps->stats[STAT_HEAD_DAMAGE] > 15 && ps->stats[STAT_HEALTH] > 0)
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 15
LEI4 $768
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $768
line 767
;767:	{
line 768
;768:		cg.refdefViewAngles[ROLL] = ps->stats[STAT_HEAD_DAMAGE] * sin(cg.time / (1000.0 - ps->stats[STAT_HEAD_DAMAGE] * 5));
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
CNSTI4 5
ADDRLP4 32
INDIRI4
MULI4
CVIF4 4
SUBF4
DIVF4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 cg+109412+8
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 769
;769:	}
LABELV $768
line 772
;770:
;771:	// concussion effect
;772:	if ( cg.ConcussionTime > cg.time ) {
ADDRGP4 cg+116288
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $773
line 773
;773:		cg.refdefViewAngles[ROLL] = 16 * (cg.ConcussionTime - cg.time) / (SEALS_FLASHBANGTIME*SEALS_CONCUSSIONFACTOR) * 
ADDRLP4 32
CNSTF4 1177075712
ASGNF4
CNSTF4 1100401636
ADDRGP4 cg+116288
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDRLP4 32
INDIRF4
DIVF4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 cg+109412+8
ADDRGP4 cg+116288
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 4
LSHI4
CVIF4 4
ADDRLP4 32
INDIRF4
DIVF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 775
;774:			sin( 3 * 2.0 * M_PI * (cg.ConcussionTime - cg.time) / (SEALS_FLASHBANGTIME*SEALS_CONCUSSIONFACTOR) );
;775:	}
LABELV $773
line 778
;776:
;777:	// add error decay
;778:	if ( cg_errorDecay.value > 0 ) {
ADDRGP4 cg_errorDecay+8
INDIRF4
CNSTF4 0
LEF4 $783
line 782
;779:		int		t;
;780:		float	f;
;781:
;782:		t = cg.time - cg.predictedErrorTime;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108836
INDIRI4
SUBI4
ASGNI4
line 783
;783:		f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 32
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 784
;784:		if ( f > 0 && f < 1 ) {
ADDRLP4 40
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 0
LEF4 $790
ADDRLP4 40
INDIRF4
CNSTF4 1065353216
GEF4 $790
line 785
;785:			VectorMA( cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg );
ADDRGP4 cg+109044+24
ADDRGP4 cg+109044+24
INDIRF4
ADDRGP4 cg+108840
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+109044+24+4
ADDRGP4 cg+109044+24+4
INDIRF4
ADDRGP4 cg+108840+4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+109044+24+8
ADDRGP4 cg+109044+24+8
INDIRF4
ADDRGP4 cg+108840+8
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 786
;786:		} else {
ADDRGP4 $791
JUMPV
LABELV $790
line 787
;787:			cg.predictedErrorTime = 0;
ADDRGP4 cg+108836
CNSTI4 0
ASGNI4
line 788
;788:		}
LABELV $791
line 789
;789:	}
LABELV $783
line 791
;790:
;791:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $814
line 793
;792:		// back away from character
;793:		CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 794
;794:	}
ADDRGP4 $815
JUMPV
LABELV $814
line 795
;795:	else if ( cgs.gametype == GT_TEAM && cg.snap->ps.stats[STAT_HEALTH] <= 0 )
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $817
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $817
line 796
;796:	{
line 797
;797:		cg.renderingThirdPerson = qtrue;
ADDRGP4 cg+107628
CNSTI4 1
ASGNI4
line 798
;798:		cg.deathCam = qtrue;
ADDRGP4 cg+201996
CNSTI4 1
ASGNI4
line 799
;799:		CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 800
;800:	}
ADDRGP4 $818
JUMPV
LABELV $817
line 801
;801:	else if ( cg.cameraSpectator /* || cg.snap->ps.pm_flags & PMF_FOLLOW */ )
ADDRGP4 cg+116676
INDIRI4
CNSTI4 0
EQI4 $823
line 802
;802:	{  
line 803
;803:		cg.renderingThirdPerson = qtrue;
ADDRGP4 cg+107628
CNSTI4 1
ASGNI4
line 804
;804:		cg.cameraSpectator = qtrue;
ADDRGP4 cg+116676
CNSTI4 1
ASGNI4
line 805
;805:		CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 806
;806:	}	
ADDRGP4 $824
JUMPV
LABELV $823
line 807
;807:	else if ( cg.cameraActive /* || ( cg.snap->ps.pm_flags & PMF_FOLLOW ) */ ) {
ADDRGP4 cg+116652
INDIRI4
CNSTI4 0
EQI4 $828
line 808
;808:		cg.cameraActive = qtrue; 		
ADDRGP4 cg+116652
CNSTI4 1
ASGNI4
line 809
;809:		cg.cameraOrigin[2] += DEFAULT_VIEWHEIGHT;
ADDRLP4 32
ADDRGP4 cg+116640+8
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1104150528
ADDF4
ASGNF4
line 812
;810: 
;811:		// back away from character
;812:		CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 813
;813:	}
ADDRGP4 $829
JUMPV
LABELV $828
line 814
;814:	else {
line 816
;815:		// offset for local bobbing and kicks
;816:		CG_OffsetFirstPersonView();
ADDRGP4 CG_OffsetFirstPersonView
CALLV
pop
line 817
;817:	}
LABELV $829
LABELV $824
LABELV $818
LABELV $815
line 820
;818:
;819:	// position eye reletive to origin
;820:	AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+109412
ARGP4
ADDRGP4 cg+109044+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 822
;821:
;822:	if ( cg.hyperspace ) {
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
EQI4 $837
line 823
;823:		cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
ADDRLP4 32
ADDRGP4 cg+109044+76
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 5
BORI4
ASGNI4
line 824
;824:	}
LABELV $837
line 827
;825:
;826:	// field of view
;827:	return CG_CalcFov();
ADDRLP4 32
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
LABELV $738
endproc CG_CalcViewValues 44 12
export CG_AddBufferedSound
proc CG_AddBufferedSound 4 0
line 835
;828:}
;829: 
;830:/*
;831:=====================
;832:CG_AddBufferedSound
;833:=====================
;834:*/
;835:void CG_AddBufferedSound( sfxHandle_t sfx ) {
line 836
;836:	if ( !sfx )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $843
line 837
;837:		return;
ADDRGP4 $842
JUMPV
LABELV $843
line 838
;838:	cg.soundBuffer[cg.soundBufferIn] = sfx;
ADDRGP4 cg+115188
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+115200
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 839
;839:	cg.soundBufferIn = (cg.soundBufferIn + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+115188
ADDRGP4 cg+115188
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 840
;840:	if (cg.soundBufferIn == cg.soundBufferOut) {
ADDRGP4 cg+115188
INDIRI4
ADDRGP4 cg+115192
INDIRI4
NEI4 $849
line 841
;841:		cg.soundBufferOut++;
ADDRLP4 0
ADDRGP4 cg+115192
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 842
;842:	}
LABELV $849
line 843
;843:}
LABELV $842
endproc CG_AddBufferedSound 4 0
proc CG_PlayBufferedSounds 0 8
line 850
;844:
;845:/*
;846:=====================
;847:CG_PlayBufferedSounds
;848:=====================
;849:*/
;850:static void CG_PlayBufferedSounds( void ) {
line 851
;851:	if ( cg.soundTime < cg.time ) {
ADDRGP4 cg+115196
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $855
line 852
;852:		if (cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[cg.soundBufferOut]) {
ADDRGP4 cg+115192
INDIRI4
ADDRGP4 cg+115188
INDIRI4
EQI4 $859
ADDRGP4 cg+115192
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+115200
ADDP4
INDIRI4
CNSTI4 0
EQI4 $859
line 853
;853:			trap_S_StartLocalSound(cg.soundBuffer[cg.soundBufferOut], CHAN_ANNOUNCER);
ADDRGP4 cg+115192
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+115200
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 854
;854:			cg.soundBuffer[cg.soundBufferOut] = 0;
ADDRGP4 cg+115192
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+115200
ADDP4
CNSTI4 0
ASGNI4
line 855
;855:			cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+115192
ADDRGP4 cg+115192
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 856
;856:			cg.soundTime = cg.time + 1000;
ADDRGP4 cg+115196
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 857
;857:		}
LABELV $859
line 858
;858:	}
LABELV $855
line 859
;859:}
LABELV $854
endproc CG_PlayBufferedSounds 0 8
proc CG_WeaponDrop 0 0
line 869
;860: 
;861:/*
;862:===============
;863:CG_WeaponUpdate
;864:
;865:  Update client weapon with a new weapon.
;866:===============
;867:*/
;868:static void CG_WeaponDrop( int weapon )
;869:{
line 870
;870:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+115300
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 871
;871:	cg.weaponSelect = weapon;
ADDRGP4 cg+108944
ADDRFP4 0
INDIRI4
ASGNI4
line 872
;872:}
LABELV $873
endproc CG_WeaponDrop 0 0
export CG_GetTotalXPforLevel
proc CG_GetTotalXPforLevel 8 0
line 885
;873:
;874://=========================================================================
;875:
;876:/*
;877:===============
;878:CG_UpdateCharacterCvars
;879:
;880:  Updates cvars for UI with information from the server
;881:===============
;882:*/
;883:
;884:int CG_GetTotalXPforLevel( int level )
;885:{
line 886
;886:	int total=0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 889
;887:	int i;  
;888:
;889:	for (i=0;i<=level;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $881
JUMPV
LABELV $878
line 890
;890:	{
line 891
;891:		if ( i > 1 ) 
ADDRLP4 0
INDIRI4
CNSTI4 1
LEI4 $882
line 892
;892:			total += i;   
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
LABELV $882
line 893
;893:	} 
LABELV $879
line 889
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $881
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
LEI4 $878
line 894
;894:	return total;
ADDRLP4 4
INDIRI4
RETI4
LABELV $877
endproc CG_GetTotalXPforLevel 8 0
export CG_GetTotalXPforAllLevels
proc CG_GetTotalXPforAllLevels 28 4
line 897
;895:}
;896:int CG_GetTotalXPforAllLevels(  )
;897:{
line 898
;898:	int value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 900
;899:
;900:	value += CG_GetTotalXPforLevel( cg.snap->ps.persistant[PERS_STRENGTH] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_GetTotalXPforLevel
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 901
;901:	value += CG_GetTotalXPforLevel( cg.snap->ps.persistant[PERS_TECHNICAL] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_GetTotalXPforLevel
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 902
;902:	value += CG_GetTotalXPforLevel( cg.snap->ps.persistant[PERS_STAMINA] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_GetTotalXPforLevel
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 903
;903:	value += CG_GetTotalXPforLevel( cg.snap->ps.persistant[PERS_SPEED] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 CG_GetTotalXPforLevel
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 904
;904:	value += CG_GetTotalXPforLevel( cg.snap->ps.persistant[PERS_STEALTH] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 CG_GetTotalXPforLevel
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 905
;905:	value += CG_GetTotalXPforLevel( cg.snap->ps.persistant[PERS_ACCURACY] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 328
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 CG_GetTotalXPforLevel
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 907
;906:
;907:	return value;
ADDRLP4 0
INDIRI4
RETI4
LABELV $884
endproc CG_GetTotalXPforAllLevels 28 4
proc CG_UpdateCharacterCvars 12 8
line 910
;908:}
;909:static void CG_UpdateCharacterCvars( void )
;910:{ 
line 911
;911:	CG_ForceCvar("char_strength", cg.snap->ps.persistant[PERS_STRENGTH] );  
ADDRGP4 $892
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 912
;912:	CG_ForceCvar("char_technical", cg.snap->ps.persistant[PERS_TECHNICAL] );  
ADDRGP4 $894
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 913
;913: 	CG_ForceCvar("char_stamina", cg.snap->ps.persistant[PERS_STAMINA] );  
ADDRGP4 $896
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 914
;914: 	CG_ForceCvar("char_speed", cg.snap->ps.persistant[PERS_SPEED] );  
ADDRGP4 $898
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 915
;915: 	CG_ForceCvar("char_stealth", cg.snap->ps.persistant[PERS_STEALTH] );   
ADDRGP4 $900
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 916
;916: 	CG_ForceCvar("char_accuracy", cg.snap->ps.persistant[PERS_ACCURACY] );   
ADDRGP4 $902
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 328
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 917
;917: 	CG_ForceCvar("char_xp_total", cg.snap->ps.persistant[PERS_XP] );  
ADDRGP4 $904
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 918
;918:	CG_ForceCvar("char_xp", cg.snap->ps.persistant[PERS_XP] - CG_GetTotalXPforAllLevels() );
ADDRLP4 0
ADDRGP4 CG_GetTotalXPforAllLevels
CALLI4
ASGNI4
ADDRGP4 $906
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 921
;919:
;920:	// for the hud icons. 
;921:	CG_ForceCvar("ui_gotbriefcase", ( cg.snap->ps.powerups[PW_BRIEFCASE] ) );  
ADDRGP4 $908
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 922
;922:	CG_ForceCvar("ui_isvip", ( cg.snap->ps.eFlags & EF_VIP ) );   
ADDRGP4 $910
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 923
;923:	CG_ForceCvar("ui_gotbomb", BG_GotWeapon ( WP_C4, cg.snap->ps.stats ) );    
CNSTI4 3
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRGP4 $912
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 924
;924:	CG_ForceCvar("mi_blowup", cgs.mi_bombSpot );  
ADDRGP4 $914
ARGP4
ADDRGP4 cgs+214172
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 925
;925:	CG_ForceCvar("mi_viprescue", cgs.mi_vipRescue);   
ADDRGP4 $916
ARGP4
ADDRGP4 cgs+214176
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 926
;926:	CG_ForceCvar("mi_viptime", ( cgs.mi_vipTime ) ); 
ADDRGP4 $918
ARGP4
ADDRGP4 cgs+214180
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 927
;927:	CG_ForceCvar("mi_assaultfield", ( cgs.mi_assaultFields ) ); 
ADDRGP4 $920
ARGP4
ADDRGP4 cgs+214168
INDIRI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 928
;928:	CG_ForceCvar("ui_bombstate", ( cg.snap->ps.pm_flags & PMF_BOMBRANGE ) ); 
ADDRGP4 $922
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 930
;929:
;930:	if ( cg.snap->ps.pm_flags & PMF_BLOCKED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $924
line 931
;931:		CG_ForceCvar("ui_assaultstate",2 ); 
ADDRGP4 $927
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
ADDRGP4 $925
JUMPV
LABELV $924
line 932
;932:	else if ( cg.snap->ps.pm_flags & PMF_ASSAULTRANGE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $928
line 933
;933:		CG_ForceCvar("ui_assaultstate",1 ); 
ADDRGP4 $927
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
ADDRGP4 $929
JUMPV
LABELV $928
line 935
;934:	else
;935:		CG_ForceCvar("ui_assaultstate",0 ); 
ADDRGP4 $927
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
LABELV $929
LABELV $925
line 937
;936: 
;937:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $931
line 938
;938:	{ 
line 939
;939:		int team = cgs.clientinfo[cg.clientNum].team;
ADDRLP4 8
CNSTI4 2484
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+38664+68
ADDP4
INDIRI4
ASGNI4
line 941
;940:
;941:		if ( cgs.gametype >= GT_TEAM ) { 
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $937
line 942
;942:			if ( team == TEAM_RED ) 
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $940
line 943
;943:				CG_ForceCvar("ui_team",1 );  
ADDRGP4 $942
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
ADDRGP4 $938
JUMPV
LABELV $940
line 944
;944:			else if ( team == TEAM_BLUE ) 
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $943
line 945
;945: 				CG_ForceCvar("ui_team",2 );  
ADDRGP4 $942
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
ADDRGP4 $938
JUMPV
LABELV $943
line 947
;946:			else  
;947:				CG_ForceCvar("ui_team",0 );  
ADDRGP4 $942
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
line 948
;948:		}
ADDRGP4 $938
JUMPV
LABELV $937
line 949
;949:		else {
line 950
;950:			if ( team == TEAM_FREE )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $945
line 951
;951:				CG_ForceCvar("ui_team", 1 );
ADDRGP4 $942
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
ADDRGP4 $946
JUMPV
LABELV $945
line 953
;952:			else
;953:				CG_ForceCvar("ui_team", 0 );
ADDRGP4 $942
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_ForceCvar
CALLV
pop
LABELV $946
line 954
;954:		}
LABELV $938
line 955
;955:	} 
LABELV $931
line 956
;956:}
LABELV $891
endproc CG_UpdateCharacterCvars 12 8
export CG_DrawActiveFrame
proc CG_DrawActiveFrame 52 16
line 970
;957:
;958:/*
;959:=================
;960:CG_DrawActiveFrame
;961:
;962:Generates and draws a game scene and status information at the given time.
;963:=================
;964:*/
;965:
;966:#define KICKBACK_TIME	250
;967:int CG_GoChase ( );
;968:void CG_QCmd_HandleMenu( void );
;969:
;970:void CG_DrawActiveFrame( int serverTime, stereoFrame_t stereoView, qboolean demoPlayback ) {
line 973
;971:	int		inwater;
;972:
;973:	cg.time = serverTime;
ADDRGP4 cg+107604
ADDRFP4 0
INDIRI4
ASGNI4
line 974
;974:	cg.demoPlayback = demoPlayback;
ADDRGP4 cg+8
ADDRFP4 8
INDIRI4
ASGNI4
line 976
;975: 
;976:	CG_PrecacheWeapons( );
ADDRGP4 CG_PrecacheWeapons
CALLV
pop
line 978
;977:
;978:	if ( cg.smokeBlendAlpha > 0.0f ) // fadeout if smokegrenade stop smoking
ADDRGP4 cg+202000
INDIRF4
CNSTF4 0
LEF4 $950
line 979
;979:		cg.smokeBlendAlpha -= 0.1f;
ADDRLP4 4
ADDRGP4 cg+202000
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
LABELV $950
line 982
;980:
;981:	// update cvars
;982:	CG_UpdateCvars();
ADDRGP4 CG_UpdateCvars
CALLV
pop
line 986
;983:
;984:	// if we are only updating the screen as a loading
;985:	// pacifier, don't even try to read snapshots
;986:	if ( cg.infoScreenText[0] != 0 ) {
ADDRGP4 cg+109804
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $954
line 987
;987:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 988
;988:		return;
ADDRGP4 $947
JUMPV
LABELV $954
line 993
;989:	}
;990:
;991:	// any looped sounds will be respecified as entities
;992:	// are added to the render list
;993:	trap_S_ClearLoopingSounds(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 996
;994:
;995:	// clear all the render lists
;996:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 999
;997:
;998:	// set up cg.snap and possibly cg.nextSnap
;999:	CG_ProcessSnapshots();
ADDRGP4 CG_ProcessSnapshots
CALLV
pop
line 1003
;1000:
;1001:	// if we haven't received any snapshots yet, all
;1002:	// we can draw is the information screen
;1003:	if ( !cg.snap || ( cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $961
ADDRGP4 cg+36
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $957
LABELV $961
line 1004
;1004:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 1005
;1005:		return;
ADDRGP4 $947
JUMPV
LABELV $957
line 1009
;1006:	}
;1007:	
;1008:	// this counter will be bumped for every valid scene we generate
;1009:	cg.clientFrame++;
ADDRLP4 8
ADDRGP4 cg
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1012
;1010:
;1011:	// update cg.predictedPlayerState
;1012:	CG_PredictPlayerState();
ADDRGP4 CG_PredictPlayerState
CALLV
pop
line 1015
;1013:
;1014:	// decide on third person view
;1015:	cg.renderingThirdPerson = cg.thirdpersonCamera + cg_thirdPerson.integer;
ADDRGP4 cg+107628
ADDRGP4 cg+171492
INDIRI4
ADDRGP4 cg_thirdPerson+12
INDIRI4
ADDI4
ASGNI4
line 1018
;1016: 
;1017:	// build cg.refdef
;1018:	inwater = CG_CalcViewValues(); 
ADDRLP4 12
ADDRGP4 CG_CalcViewValues
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1021
;1019:	
;1020:	// if clientweapon state changed update it
;1021:	if ( cg.weaponSelect != cg.snap->ps.weapon && cg.time > cg.weaponSelectTime )
ADDRGP4 cg+108944
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $965
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+115300
INDIRI4
LEI4 $965
line 1022
;1022:		CG_WeaponDrop( cg.snap->ps.weapon );
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_WeaponDrop
CALLV
pop
LABELV $965
line 1025
;1023:
;1024:	// let the client system know what our weapon and zoom settings are 
;1025:	trap_SetUserCmdValue( cg.weaponSelect, cg.zoomSensitivity );
ADDRGP4 cg+108944
INDIRI4
ARGI4
ADDRGP4 cg+109800
INDIRF4
ARGF4
ADDRGP4 trap_SetUserCmdValue
CALLV
pop
line 1027
;1026: 
;1027:	if ( cg.snap->ps.powerups[PW_BRIEFCASE] && BG_IsPrimary( cg.snap->ps.weapon ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $974
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $974
line 1028
;1028:	{
line 1030
;1029:		int i;
;1030:		int wp = WP_NONE;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1032
;1031:
;1032:		for ( i = WP_SMOKE - 1; i > WP_NONE; i-- )
ADDRLP4 20
CNSTI4 24
ASGNI4
LABELV $978
line 1033
;1033:		{
line 1035
;1034:			//if ( i == WP_NUTSHELL ) continue;
;1035:			if ( i == WP_C4 ) // no c4 
ADDRLP4 20
INDIRI4
CNSTI4 3
NEI4 $982
line 1036
;1036:				continue;
ADDRGP4 $979
JUMPV
LABELV $982
line 1037
;1037:			if ( BG_IsPrimary( i ) )
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_IsPrimary
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $984
line 1038
;1038:				continue;
ADDRGP4 $979
JUMPV
LABELV $984
line 1039
;1039:			if ( !BG_GotWeapon( i , cg.snap->ps.stats ) )
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 BG_GotWeapon
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $986
line 1040
;1040:				continue;
ADDRGP4 $979
JUMPV
LABELV $986
line 1042
;1041:
;1042:			wp = i;
ADDRLP4 24
ADDRLP4 20
INDIRI4
ASGNI4
line 1043
;1043:			break;
ADDRGP4 $980
JUMPV
LABELV $979
line 1032
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $978
LABELV $980
line 1046
;1044:		}
;1045:
;1046:		cg.weaponSelect = wp;
ADDRGP4 cg+108944
ADDRLP4 24
INDIRI4
ASGNI4
line 1047
;1047:		cg.weaponSelectTime = cg.time + 1000;
ADDRGP4 cg+115300
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1048
;1048:	}
LABELV $974
line 1049
;1049:	if (cg.activeInventory) 
ADDRGP4 cg+115728
INDIRI4
CNSTI4 0
EQI4 $992
line 1050
;1050:	{
line 1054
;1051:		usercmd_t	cmd;
;1052:		int			cmdNum;
;1053:
;1054:		cmdNum = trap_GetCurrentCmdNumber();
ADDRLP4 48
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 1055
;1055:		trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1057
;1056:
;1057:		if (cg.InventoryTime == 0 && cg_enableTimeSelect.value > 0.0 )
ADDRGP4 cg+115736
INDIRI4
CNSTI4 0
NEI4 $995
ADDRGP4 cg_enableTimeSelect+8
INDIRF4
CNSTF4 0
LEF4 $995
line 1058
;1058:			cg.InventoryTime = cg.time + cg_enableTimeSelect.value*1000; 
ADDRGP4 cg+115736
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRGP4 cg_enableTimeSelect+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
LABELV $995
line 1060
;1059:
;1060:		if ( ( cg.InventoryTime < cg.time && cg_enableTimeSelect.value > 0.0 ) || ( cmd.buttons & BUTTON_USE ) ) {
ADDRGP4 cg+115736
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1009
ADDRGP4 cg_enableTimeSelect+8
INDIRF4
CNSTF4 0
GTF4 $1008
LABELV $1009
ADDRLP4 20+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $993
LABELV $1008
line 1061
;1061:			cg.weaponSelectTime = cg.time + 1000;
ADDRGP4 cg+115300
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1062
;1062:			CG_InvenSelect ( ); 			
ADDRGP4 CG_InvenSelect
CALLV
pop
line 1063
;1063:			cg.InventoryTime = 0;
ADDRGP4 cg+115736
CNSTI4 0
ASGNI4
line 1064
;1064:		}
line 1065
;1065:	}
ADDRGP4 $993
JUMPV
LABELV $992
line 1066
;1066:	else if (cg.InventoryTime != 0)
ADDRGP4 cg+115736
INDIRI4
CNSTI4 0
EQI4 $1013
line 1067
;1067:		cg.InventoryTime = 0;
ADDRGP4 cg+115736
CNSTI4 0
ASGNI4
LABELV $1013
LABELV $993
line 1069
;1068:   
;1069:	CG_UpdateCharacterCvars( );
ADDRGP4 CG_UpdateCharacterCvars
CALLV
pop
line 1071
;1070:
;1071:	if (cg.snap->ps.stats[STAT_HEALTH] <= 0)
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1017
line 1072
;1072:	{
line 1073
;1073:		cg.WaterTime = 0;
ADDRGP4 cg+115720
CNSTI4 0
ASGNI4
line 1074
;1074:		cg.FlashTime = 0;
ADDRGP4 cg+116284
CNSTI4 0
ASGNI4
line 1075
;1075:		cg.gunSmokeTime = 0;
ADDRGP4 cg+115724
CNSTI4 0
ASGNI4
line 1076
;1076:		cg.DeafTime = 0;
ADDRGP4 cg+116292
CNSTI4 0
ASGNI4
line 1078
;1077:
;1078:		cg.predictedPlayerEntity.pe.weapAnim = WANIM_IDLE;
ADDRGP4 cg+108104+472+152
CNSTI4 6
ASGNI4
line 1079
;1079:		cg.predictedPlayerEntity.pe.nextweapAnim = WANIM_IDLE;
ADDRGP4 cg+108104+472+156
CNSTI4 6
ASGNI4
line 1080
;1080:	}
LABELV $1017
line 1083
;1081:
;1082:	// build the render lists
;1083:	if ( !cg.hyperspace ) {
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
NEI4 $1030
line 1084
;1084:		CG_AddPacketEntities();			// adter calcViewValues, so predicted player state is correct
ADDRGP4 CG_AddPacketEntities
CALLV
pop
line 1085
;1085:		CG_AddMarks();
ADDRGP4 CG_AddMarks
CALLV
pop
line 1086
;1086:		CG_AddLocalEntities( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_AddLocalEntities
CALLV
pop
line 1087
;1087:		CG_AddAtmosphericEffects();	//add enviroment effects like rain/snow/
ADDRGP4 CG_AddAtmosphericEffects
CALLV
pop
line 1088
;1088:	}
LABELV $1030
line 1114
;1089:
;1090:#if 0 
;1091:	if ( cg.predictedPlayerState.eFlags & EF_IRONSIGHT )
;1092:	{
;1093:		if ( cg.ns_ironsightState == IS_NONE )
;1094:		{
;1095:			cg.ns_ironsightState = IS_PUTUP; 
;1096:
;1097:			if ( BG_IsRifle( cg.snap->ps.weapon ) )
;1098:				cg.ns_ironsightTimer = cg.time + IS_RIFLE_TIME;
;1099:			else
;1100:				cg.ns_ironsightTimer = cg.time + IS_TIME;
;1101:
;1102:			cg.ns_ironsightDeactivate = qfalse;
;1103:		}
;1104:	}
;1105:	else
;1106:	{
;1107:		if ( cg.ns_ironsightState != IS_NONE && !cg.ns_ironsightDeactivate )
;1108:		{
;1109:			cg.ns_ironsightDeactivate = qtrue;
;1110:		}
;1111:	}
;1112:#endif
;1113:
;1114:	if ( cg.crosshairMod && cg.crosshairModTime < cg.time )
ADDRGP4 cg+116364
INDIRI4
CNSTI4 0
EQI4 $1033
ADDRGP4 cg+116368
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1033
line 1115
;1115:	{ 
line 1116
;1116:		cg.crosshairModTime = cg.time + ( KICKBACK_TIME / 4 );
ADDRGP4 cg+116368
ADDRGP4 cg+107604
INDIRI4
CNSTI4 62
ADDI4
ASGNI4
line 1117
;1117:		cg.crosshairMod--;
ADDRLP4 20
ADDRGP4 cg+116364
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1118
;1118:	}
LABELV $1033
line 1120
;1119: 
;1120:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW ) && cg.cameraSpectator ) 
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $1041
ADDRGP4 cg+116676
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $1041
line 1121
;1121:		cg.cameraSpectator = qfalse; 
ADDRGP4 cg+116676
CNSTI4 0
ASGNI4
LABELV $1041
line 1124
;1122:  
;1123:	// add buffered sounds
;1124:	CG_PlayBufferedSounds();
ADDRGP4 CG_PlayBufferedSounds
CALLV
pop
line 1127
;1125:
;1126:	// handle newbee msgs (only if activated)
;1127:	if ( cg_newbeeTime.value > 0.0f )
ADDRGP4 cg_newbeeTime+8
INDIRF4
CNSTF4 0
LEF4 $1046
line 1128
;1128:		CG_HandleHelp();
ADDRGP4 CG_HandleHelp
CALLV
pop
LABELV $1046
line 1131
;1129:  
;1130:	// finish up the rest of the refdef
;1131:	if ( cg.testModelEntity.hModel ) {
ADDRGP4 cg+115408+8
INDIRI4
CNSTI4 0
EQI4 $1049
line 1132
;1132:		CG_AddTestModel();
ADDRGP4 CG_AddTestModel
CALLV
pop
line 1133
;1133:	}
LABELV $1049
line 1134
;1134:	cg.refdef.time = cg.time;
ADDRGP4 cg+109044+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1135
;1135:	memcpy( cg.refdef.areamask, cg.snap->areamask, sizeof( cg.refdef.areamask ) );
ADDRGP4 cg+109044+80
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1137
;1136:  
;1137:	if ( cg.predictedPlayerState.pm_flags & PMF_FOLLOW )
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1061
line 1138
;1138:	{
line 1139
;1139:		if ( CG_ButtonPushed( BUTTON_WEAPON2 ) && !cg.button3pushed )
CNSTI4 256
ARGI4
ADDRLP4 24
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1065
ADDRGP4 cg+171496
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1065
line 1140
;1140:		{
line 1141
;1141:			if ( cg.thirdpersonCamera )
ADDRGP4 cg+171492
INDIRI4
CNSTI4 0
EQI4 $1068
line 1142
;1142:				cg.thirdpersonCamera = qfalse;
ADDRGP4 cg+171492
CNSTI4 0
ASGNI4
ADDRGP4 $1069
JUMPV
LABELV $1068
line 1144
;1143:			else 
;1144:				cg.thirdpersonCamera = qtrue;
ADDRGP4 cg+171492
CNSTI4 1
ASGNI4
LABELV $1069
line 1146
;1145:
;1146:			cg.button3pushed = qtrue;
ADDRGP4 cg+171496
CNSTI4 1
ASGNI4
line 1147
;1147:		}
ADDRGP4 $1062
JUMPV
LABELV $1065
line 1148
;1148:		else if ( !CG_ButtonPushed( BUTTON_WEAPON2 ) )
CNSTI4 256
ARGI4
ADDRLP4 32
ADDRGP4 CG_ButtonPushed
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1062
line 1149
;1149:			cg.button3pushed = qfalse;
ADDRGP4 cg+171496
CNSTI4 0
ASGNI4
line 1150
;1150:	}
ADDRGP4 $1062
JUMPV
LABELV $1061
line 1152
;1151:	else
;1152:		cg.thirdpersonCamera = qfalse;
ADDRGP4 cg+171492
CNSTI4 0
ASGNI4
LABELV $1062
line 1155
;1153:	 
;1154:	// update audio positions
;1155:	trap_S_Respatialize( cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater );
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+109044+24
ARGP4
ADDRGP4 cg+109044+36
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_S_Respatialize
CALLV
pop
line 1158
;1156:
;1157:	// make sure the lagometerSample and frame timing isn't done twice when in stereo
;1158:	if ( stereoView != STEREO_RIGHT ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $1083
line 1159
;1159:		cg.frametime = cg.time - cg.oldTime;
ADDRGP4 cg+107600
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+107608
INDIRI4
SUBI4
ASGNI4
line 1160
;1160:		if ( cg.frametime < 0 ) {
ADDRGP4 cg+107600
INDIRI4
CNSTI4 0
GEI4 $1088
line 1161
;1161:			cg.frametime = 0;
ADDRGP4 cg+107600
CNSTI4 0
ASGNI4
line 1162
;1162:		}
LABELV $1088
line 1163
;1163:		cg.oldTime = cg.time;
ADDRGP4 cg+107608
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1164
;1164:		CG_AddLagometerFrameInfo();
ADDRGP4 CG_AddLagometerFrameInfo
CALLV
pop
line 1165
;1165:	}
LABELV $1083
line 1166
;1166:	if (cg_timescale.value != cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
EQF4 $1094
line 1167
;1167:		if (cg_timescale.value < cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $1098
line 1168
;1168:			cg_timescale.value += cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 24
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
ADDF4
ASGNF4
line 1169
;1169:			if (cg_timescale.value > cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
LEF4 $1099
line 1170
;1170:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
line 1171
;1171:		}
ADDRGP4 $1099
JUMPV
LABELV $1098
line 1172
;1172:		else {
line 1173
;1173:			cg_timescale.value -= cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 24
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
SUBF4
ASGNF4
line 1174
;1174:			if (cg_timescale.value < cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $1114
line 1175
;1175:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
LABELV $1114
line 1176
;1176:		}
LABELV $1099
line 1177
;1177:		if (cg_timescaleFadeSpeed.value) {
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
CNSTF4 0
EQF4 $1120
line 1178
;1178:			trap_Cvar_Set("timescale", va("%f", cg_timescale.value));
ADDRGP4 $1124
ARGP4
ADDRGP4 cg_timescale+8
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1123
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1179
;1179:		}
LABELV $1120
line 1180
;1180:	} 
LABELV $1094
line 1182
;1181:	// actually issue the rendering calls
;1182:	CG_DrawActive( stereoView );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawActive
CALLV
pop
line 1184
;1183:
;1184:	if ( cg_stats.integer ) {
ADDRGP4 cg_stats+12
INDIRI4
CNSTI4 0
EQI4 $1126
line 1185
;1185:		CG_Printf( "cg.clientFrame:%i\n", cg.clientFrame );
ADDRGP4 $1129
ARGP4
ADDRGP4 cg
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1186
;1186:	} 
LABELV $1126
line 1187
;1187:}
LABELV $947
endproc CG_DrawActiveFrame 52 16
import cg_viewHeight
import CG_QCmd_HandleMenu
import CG_GoChase
import cg_runyaw
import cg_bobyaw
import CG_LastButtonPushed
import CG_ButtonPushed
import CG_FollowCycle
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
import CG_ZoomUp_f
import CG_ZoomDown_f
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
LABELV $1129
byte 1 99
byte 1 103
byte 1 46
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1124
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $1123
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $942
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $927
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $922
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $920
byte 1 109
byte 1 105
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
LABELV $918
byte 1 109
byte 1 105
byte 1 95
byte 1 118
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $916
byte 1 109
byte 1 105
byte 1 95
byte 1 118
byte 1 105
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 99
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $914
byte 1 109
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $912
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 111
byte 1 116
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 0
align 1
LABELV $910
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 115
byte 1 118
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $908
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 111
byte 1 116
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $906
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 120
byte 1 112
byte 1 0
align 1
LABELV $904
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 120
byte 1 112
byte 1 95
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $902
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $900
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $898
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $896
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $894
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 99
byte 1 104
byte 1 110
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $892
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $240
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $236
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $235
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $161
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $144
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $105
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 10
byte 1 0
