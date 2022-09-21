code
proc CG_CenterGiantLine 28 36
file "../cg_scoreboard.c"
line 71
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_scoreboard -- draw the scoreboard on top of the game screen
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
;14:
;15:#define	SCOREBOARD_X		(0)
;16:
;17:#define SB_HEADER			86
;18:#define SB_TOP				(SB_HEADER+32)
;19:
;20:// Where the status bar starts, so we don't overwrite it
;21:#define SB_STATUSBAR		420
;22:
;23:#define SB_NORMAL_HEIGHT	40
;24:#define SB_INTER_HEIGHT		16 // interleaved height
;25:
;26:#define SB_MAXCLIENTS_NORMAL  ((SB_STATUSBAR - SB_TOP) / SB_NORMAL_HEIGHT)
;27:#define SB_MAXCLIENTS_INTER   ((SB_STATUSBAR - SB_TOP) / SB_INTER_HEIGHT - 1)
;28:
;29:// Used when interleaved
;30:
;31:
;32:
;33:#define SB_LEFT_BOTICON_X	(SCOREBOARD_X+0)
;34:#define SB_LEFT_HEAD_X		(SCOREBOARD_X+32)
;35:#define SB_RIGHT_BOTICON_X	(SCOREBOARD_X+64)
;36:#define SB_RIGHT_HEAD_X		(SCOREBOARD_X+96)
;37:// Normal
;38:#define SB_BOTICON_X		(SCOREBOARD_X+32)
;39:#define SB_HEAD_X			(SCOREBOARD_X+64)
;40:
;41:#define SB_SCORELINE_X		112
;42:
;43:#define SB_RATING_WIDTH	    (6 * BIGCHAR_WIDTH) // width 6
;44:#define SB_SCORE_X			(SB_SCORELINE_X + BIGCHAR_WIDTH) // width 6
;45:#define SB_RATING_X			(SB_SCORELINE_X + 6 * BIGCHAR_WIDTH) // width 6
;46:#define SB_PING_X			(SB_SCORELINE_X + 12 * BIGCHAR_WIDTH + 8) // width 5
;47:#define SB_TIME_X			(SB_SCORELINE_X + 17 * BIGCHAR_WIDTH + 8) // width 5
;48:#define SB_NAME_X			(SB_SCORELINE_X + 22 * BIGCHAR_WIDTH) // width 15
;49:
;50:// The new and improved score board
;51://
;52:// In cases where the number of clients is high, the score board heads are interleaved
;53:// here's the layout
;54:
;55://
;56://	0   32   80  112  144   240  320  400   <-- pixel position
;57://  bot head bot head score ping time name
;58://  
;59://  wins/losses are drawn on bot icon now
;60:
;61:static qboolean localClient; // true if local client has been displayed
;62: 
;63:  
;64://================================================================================
;65:
;66:/*
;67:================
;68:CG_CenterGiantLine
;69:================
;70:*/
;71:static void CG_CenterGiantLine( float y, const char *string ) {
line 75
;72:	float		x;
;73:	vec4_t		color;
;74:
;75:	color[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 76
;76:	color[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 77
;77:	color[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 78
;78:	color[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 80
;79:
;80:	x = 0.5 * ( 640 - GIANT_WIDTH * CG_DrawStrlen( string ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
CNSTF4 1056964608
CNSTI4 640
ADDRLP4 20
INDIRI4
CNSTI4 5
LSHI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 82
;81:
;82:	CG_DrawStringExt( x, y, string, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
ADDRLP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTI4 48
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 83
;83:}
LABELV $84
endproc CG_CenterGiantLine 28 36
export CG_DrawOldTourneyScoreboard
proc CG_DrawOldTourneyScoreboard 92 36
line 92
;84:
;85:/*
;86:=================
;87:CG_DrawTourneyScoreboard
;88:
;89:Draw the oversize scoreboard for tournements
;90:=================
;91:*/
;92:void CG_DrawOldTourneyScoreboard( void ) {
line 101
;93:	const char		*s;
;94:	vec4_t			color;
;95:	int				min, tens, ones;
;96:	clientInfo_t	*ci;
;97:	int				y;
;98:	int				i;
;99:
;100:	// request more scores regularly
;101:	if ( cg.scoresRequestTime + 2000 < cg.time ) {
ADDRGP4 cg+110828
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $89
line 102
;102:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110828
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 103
;103:		trap_SendClientCommand( "score" );
ADDRGP4 $95
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 104
;104:	}
LABELV $89
line 106
;105:
;106:	color[0] = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 107
;107:	color[1] = 1;
ADDRLP4 8+4
CNSTF4 1065353216
ASGNF4
line 108
;108:	color[2] = 1;
ADDRLP4 8+8
CNSTF4 1065353216
ASGNF4
line 109
;109:	color[3] = 1;
ADDRLP4 8+12
CNSTF4 1065353216
ASGNF4
line 112
;110:
;111:	// draw the dialog background
;112:	color[0] = color[1] = color[2] = 0;
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
line 113
;113:	color[3] = 1;
ADDRLP4 8+12
CNSTF4 1065353216
ASGNF4
line 114
;114:	CG_FillRect( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, color );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 8
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 117
;115:
;116:	// print the mesage of the day
;117:	s = CG_ConfigString( CS_MOTD );
CNSTI4 4
ARGI4
ADDRLP4 52
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
ASGNP4
line 118
;118:	if ( !s[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $102
line 119
;119:		s = "Scoreboard";
ADDRLP4 4
ADDRGP4 $104
ASGNP4
line 120
;120:	}
LABELV $102
line 123
;121:
;122:	// print optional title
;123:	CG_CenterGiantLine( 8, s );
CNSTF4 1090519040
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CenterGiantLine
CALLV
pop
line 126
;124:
;125:	// print server time
;126:	ones = cg.time / 1000;
ADDRLP4 32
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 127
;127:	min = ones / 60;
ADDRLP4 36
ADDRLP4 32
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 128
;128:	ones %= 60;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 60
MODI4
ASGNI4
line 129
;129:	tens = ones / 10;
ADDRLP4 40
ADDRLP4 32
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 130
;130:	ones %= 10;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 10
MODI4
ASGNI4
line 131
;131:	s = va("%i:%i%i", min, tens, ones );
ADDRGP4 $106
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
ASGNP4
line 133
;132:
;133:	CG_CenterGiantLine( 64, s );
CNSTF4 1115684864
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CenterGiantLine
CALLV
pop
line 138
;134:
;135:
;136:	// print the two scores
;137:
;138:	y = 160;
ADDRLP4 24
CNSTI4 160
ASGNI4
line 139
;139:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $107
line 143
;140:		//
;141:		// teamplay scoreboard
;142:		//
;143:		CG_DrawStringExt( 8, y, "Red Team", color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
CNSTI4 8
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $110
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTI4 48
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 144
;144:		s = va("%i", cg.teamScores[0] );
ADDRGP4 $111
ARGP4
ADDRGP4 cg+110840
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 64
INDIRP4
ASGNP4
line 145
;145:		CG_DrawStringExt( 632 - GIANT_WIDTH * strlen(s), y, s, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
CNSTI4 632
ADDRLP4 68
INDIRI4
CNSTI4 5
LSHI4
SUBI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTI4 48
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 147
;146:		
;147:		y += 64;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 149
;148:
;149:		CG_DrawStringExt( 8, y, "Blue Team", color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
CNSTI4 8
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $113
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTI4 48
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 150
;150:		s = va("%i", cg.teamScores[1] );
ADDRGP4 $111
ARGP4
ADDRGP4 cg+110840+4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
ASGNP4
line 151
;151:		CG_DrawStringExt( 632 - GIANT_WIDTH * strlen(s), y, s, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 strlen
CALLI4
ASGNI4
CNSTI4 632
ADDRLP4 84
INDIRI4
CNSTI4 5
LSHI4
SUBI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTI4 48
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 152
;152:	} else {
ADDRGP4 $108
JUMPV
LABELV $107
line 156
;153:		//
;154:		// free for all scoreboard
;155:		//
;156:		for ( i = 0 ; i < MAX_CLIENTS ; i++ ) {
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $116
line 157
;157:			ci = &cgs.clientinfo[i];
ADDRLP4 0
CNSTI4 2484
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 cgs+38664
ADDP4
ASGNP4
line 158
;158:			if ( !ci->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $121
line 159
;159:				continue;
ADDRGP4 $117
JUMPV
LABELV $121
line 161
;160:			}
;161:			if ( ci->team != TEAM_FREE ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $123
line 162
;162:				continue;
ADDRGP4 $117
JUMPV
LABELV $123
line 165
;163:			}
;164:
;165:			CG_DrawStringExt( 8, y, ci->name, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
CNSTI4 8
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTI4 48
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 166
;166:			s = va("%i", ci->score );
ADDRGP4 $111
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 64
INDIRP4
ASGNP4
line 167
;167:			CG_DrawStringExt( 632 - GIANT_WIDTH * strlen(s), y, s, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
CNSTI4 632
ADDRLP4 68
INDIRI4
CNSTI4 5
LSHI4
SUBI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTI4 48
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 168
;168:			y += 64;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 169
;169:		}
LABELV $117
line 156
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 64
LTI4 $116
line 170
;170:	}
LABELV $108
line 173
;171:
;172:
;173:}
LABELV $88
endproc CG_DrawOldTourneyScoreboard 92 36
bss
align 4
LABELV localClient
skip 4
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
LABELV $113
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $111
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $110
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $106
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $104
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
