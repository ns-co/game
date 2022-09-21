export vmMain
code
proc vmMain 16 12
file "../cg_main.c"
line 34
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_main.c -- initialization and primary entry point for cgame
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
;14:#ifdef MISSIONPACK
;15:#include "../ui/ui_shared.h"
;16:// display context for new ui stuff
;17:displayContextDef_t cgDC;
;18:#endif
;19:
;20://int forceModelModificationCount = -1;
;21:
;22:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum );
;23:void CG_Shutdown( void );
;24:
;25:int CG_LastAttacker();
;26:/*
;27:================
;28:vmMain
;29:
;30:This is the only way control passes into the module.
;31:This must be the very first function compiled into the .q3vm file
;32:================
;33:*/
;34:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 36
;35:
;36:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $94
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $94
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $110
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $110
address $96
address $97
address $98
address $99
address $100
address $101
address $102
address $103
address $108
code
LABELV $96
line 41
;37:	case CG_INIT:
;38:		// big thanks to apoxol! on 1.3.01
;39:		// Apoxol: Ok, huge hack here..  This will prevent any console messages from
;40:		// being displayed on the screen.  This is so we can move the chat window
;41: 		CG_Init( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Init
CALLV
pop
line 42
;42:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $97
line 44
;43:	case CG_SHUTDOWN:
;44:		CG_Shutdown();
ADDRGP4 CG_Shutdown
CALLV
pop
line 45
;45:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $98
line 47
;46:	case CG_CONSOLE_COMMAND:
;47:		return CG_ConsoleCommand();
ADDRLP4 4
ADDRGP4 CG_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $93
JUMPV
LABELV $99
line 49
;48:	case CG_DRAW_ACTIVE_FRAME:
;49:		CG_DrawActiveFrame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawActiveFrame
CALLV
pop
line 50
;50:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $100
line 52
;51:	case CG_CROSSHAIR_PLAYER:
;52:		return CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $93
JUMPV
LABELV $101
line 54
;53:	case CG_LAST_ATTACKER:
;54:		return CG_LastAttacker();
ADDRLP4 12
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $93
JUMPV
LABELV $102
line 56
;55:	case CG_KEY_EVENT:
;56:		CG_KeyEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_KeyEvent
CALLV
pop
line 57
;57:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $103
line 60
;58:	case CG_MOUSE_EVENT:
;59:#ifdef MISSIONPACK
;60:		cgDC.cursorx = cgs.cursorX;
ADDRGP4 cgDC+220
ADDRGP4 cgs+205008
INDIRI4
ASGNI4
line 61
;61:		cgDC.cursory = cgs.cursorY;
ADDRGP4 cgDC+224
ADDRGP4 cgs+205012
INDIRI4
ASGNI4
line 63
;62:#endif
;63:		CG_MouseEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_MouseEvent
CALLV
pop
line 64
;64:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $108
line 66
;65:	case CG_EVENT_HANDLING:
;66:		CG_EventHandling(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 67
;67:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $94
line 69
;68:	default:
;69:		CG_Error( "vmMain: unknown command %i", command );
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 70
;70:		break;
LABELV $95
line 72
;71:	}
;72:	return -1;
CNSTI4 -1
RETI4
LABELV $93
endproc vmMain 16 12
data
export cvarTable
align 4
LABELV cvarTable
address gameversion
address $112
address $113
byte 4 64
address cg_ignore
address $114
address $115
byte 4 0
address cg_autoswitch
address $116
address $117
byte 4 1
address cg_drawGun
address $118
address $117
byte 4 1
address cg_zoomFov
address $119
address $120
byte 4 1
address cg_fov
address $121
address $122
byte 4 64
address cg_viewsize
address $123
address $124
byte 4 1
address cg_stereoSeparation
address $125
address $126
byte 4 1
address cg_shadows
address $127
address $117
byte 4 1
address cg_gibs
address $128
address $117
byte 4 1
address cg_draw2D
address $129
address $117
byte 4 513
address cg_drawStatus
address $130
address $117
byte 4 1
address cg_drawTimer
address $131
address $115
byte 4 1
address cg_drawFPS
address $132
address $115
byte 4 1
address cg_drawSnapshot
address $133
address $115
byte 4 1
address cg_draw3dIcons
address $134
address $117
byte 4 1
address cg_drawIcons
address $135
address $117
byte 4 1
address cg_drawAmmoWarning
address $136
address $117
byte 4 1
address cg_drawAttacker
address $137
address $117
byte 4 1
address cg_drawCrosshair
address $138
address $139
byte 4 1
address cg_drawCrosshairNames
address $140
address $117
byte 4 1
address cg_drawRewards
address $141
address $117
byte 4 1
address cg_crosshairSize
address $142
address $143
byte 4 1
address cg_crosshairHealth
address $144
address $117
byte 4 1
address cg_crosshairX
address $145
address $115
byte 4 1
address cg_crosshairY
address $146
address $115
byte 4 1
address cg_brassTime
address $147
address $148
byte 4 1
address cg_simpleItems
address $149
address $115
byte 4 1
address cg_addMarks
address $150
address $151
byte 4 1
address cg_lagometer
address $152
address $115
byte 4 1
address cg_gun_x
address $153
address $115
byte 4 512
address cg_gun_y
address $154
address $115
byte 4 512
address cg_gun_z
address $155
address $115
byte 4 512
address cg_centertime
address $156
address $157
byte 4 512
address cg_runpitch
address $158
address $159
byte 4 1
address cg_runyaw
address $160
address $159
byte 4 1
address cg_runroll
address $161
address $162
byte 4 1
address cg_bobup
address $163
address $162
byte 4 1
address cg_bobpitch
address $164
address $159
byte 4 1
address cg_bobroll
address $165
address $159
byte 4 1
address cg_bobyaw
address $166
address $159
byte 4 1
address cg_swingSpeed
address $167
address $168
byte 4 513
address cg_animSpeed
address $169
address $117
byte 4 512
address cg_debugAnim
address $170
address $115
byte 4 512
address cg_debugPosition
address $171
address $115
byte 4 512
address cg_debugEvents
address $172
address $115
byte 4 512
address cg_errorDecay
address $173
address $124
byte 4 0
address cg_nopredict
address $174
address $115
byte 4 0
address cg_noPlayerAnims
address $175
address $115
byte 4 512
address cg_showmiss
address $176
address $115
byte 4 0
address cg_footsteps
address $177
address $117
byte 4 512
address cg_tracerChance
address $178
address $179
byte 4 512
address cg_tracerWidth
address $180
address $181
byte 4 512
address cg_tracerLength
address $182
address $124
byte 4 512
address cg_thirdPersonRange
address $183
address $184
byte 4 512
address cg_thirdPersonAngle
address $185
address $115
byte 4 512
address cg_thirdPerson
address $186
address $115
byte 4 512
address cg_teamChatTime
address $187
address $188
byte 4 1
address cg_teamChatHeight
address $189
address $190
byte 4 1
address cg_deferPlayers
address $191
address $117
byte 4 1
address cg_drawTeamOverlay
address $192
address $115
byte 4 1
address cg_teamOverlayUserinfo
address $193
address $115
byte 4 64
address cg_stats
address $194
address $115
byte 4 0
address cg_drawFriend
address $195
address $115
byte 4 1
address cg_teamChatsOnly
address $196
address $115
byte 4 1
address cg_noVoiceChats
address $197
address $115
byte 4 1
address cg_noVoiceText
address $198
address $115
byte 4 1
address cg_buildScript
address $199
address $115
byte 4 0
address cg_paused
address $200
address $115
byte 4 64
address cg_blood
address $201
address $117
byte 4 1
address cg_synchronousClients
address $202
address $115
byte 4 0
address cg_hudFiles
address $203
address $204
byte 4 1
address cg_cameraOrbit
address $205
address $115
byte 4 512
address cg_cameraOrbitDelay
address $206
address $207
byte 4 1
address cg_timescaleFadeEnd
address $208
address $117
byte 4 0
address cg_timescaleFadeSpeed
address $209
address $115
byte 4 0
address cg_timescale
address $210
address $117
byte 4 0
address cg_scorePlum
address $211
address $115
byte 4 515
address cg_smoothClients
address $212
address $115
byte 4 3
address cg_cameraMode
address $213
address $115
byte 4 512
address pmove_fixed
address $214
address $115
byte 4 0
address pmove_msec
address $215
address $190
byte 4 0
address cg_smallFont
address $216
address $217
byte 4 1
address cg_bigFont
address $218
address $126
byte 4 1
address test_x
address $219
address $115
byte 4 0
address test_y
address $220
address $115
byte 4 0
address test_h
address $221
address $115
byte 4 0
address test_w
address $222
address $115
byte 4 0
address pmodel_o
address $223
address $115
byte 4 512
address cg_gunSmoke
address $224
address $225
byte 4 1
address cg_enableDust
address $226
address $115
byte 4 4
address cg_enableBreath
address $227
address $117
byte 4 4
address cg_enableTimeSelect
address $228
address $117
byte 4 1
address cg_atmosphericEffects
address $229
address $117
byte 4 1
address cg_lowEffects
address $230
address $115
byte 4 1
address cg_customTracerColor
address $231
address $117
byte 4 1
address cg_gunSmokeTime
address $232
address $233
byte 4 1
address cg_particleTime
address $234
address $235
byte 4 1
address cg_crosshair_r
address $236
address $117
byte 4 1
address cg_crosshair_g
address $237
address $117
byte 4 1
address cg_crosshair_b
address $238
address $117
byte 4 1
address char_strength
address $239
address $115
byte 4 64
address char_stamina
address $240
address $115
byte 4 64
address char_stealth
address $241
address $115
byte 4 64
address char_speed
address $242
address $115
byte 4 64
address char_accuracy
address $243
address $115
byte 4 64
address char_technical
address $244
address $115
byte 4 64
address char_xp
address $245
address $115
byte 4 64
address ui_sealplayers
address $246
address $115
byte 4 64
address ui_tangoplayers
address $247
address $115
byte 4 64
address ui_players
address $248
address $115
byte 4 64
address ui_sealpoints
address $249
address $115
byte 4 64
address ui_tangopoints
address $250
address $115
byte 4 64
address ui_team
address $251
address $115
byte 4 64
address cg_bulletTracerLength
address $252
address $253
byte 4 0
address cg_bulletTracerWidth
address $254
address $255
byte 4 0
address cg_wakemarkTime
address $256
address $257
byte 4 1
address cg_wakemarkDistantTime
address $258
address $124
byte 4 1
address ui_assaultstate
address $259
address $115
byte 4 64
address ui_bombstate
address $260
address $115
byte 4 64
address mi_viprescue
address $261
address $115
byte 4 64
address mi_viptime
address $262
address $115
byte 4 64
address mi_blowup
address $263
address $115
byte 4 64
address mi_assaultfield
address $264
address $115
byte 4 64
address ui_gotbomb
address $265
address $115
byte 4 64
address ui_isvip
address $266
address $115
byte 4 64
address ui_gotbriefcase
address $267
address $115
byte 4 64
address cg_grenadeSparks
address $268
address $117
byte 4 1
address cg_correctgunFov
address $269
address $270
byte 4 1
address cg_isgun_z
address $271
address $115
byte 4 512
address cg_isgun_y
address $272
address $115
byte 4 512
address cg_isgun_x
address $273
address $115
byte 4 512
address cg_isgun_roll
address $274
address $115
byte 4 512
address cg_isgun_yaw
address $275
address $115
byte 4 512
address cg_isgun_pitch
address $276
address $115
byte 4 512
address cg_isgun_step
address $277
address $217
byte 4 512
address cg_newbeeHeight
address $278
address $279
byte 4 1
address cg_newbeeTime
address $280
address $281
byte 4 1
address cg_viewHeight
address $282
address $115
byte 4 512
address ui_gotbriefcase
address $267
address $115
byte 4 512
address ui_isvip
address $266
address $115
byte 4 512
address ui_gotbomb
address $265
address $115
byte 4 512
address mi_blowup
address $263
address $115
byte 4 512
address mi_viprescue
address $261
address $115
byte 4 512
address mi_viptime
address $262
address $115
byte 4 512
address mi_assaultfield
address $264
address $115
byte 4 512
address ui_assaultstate
address $259
address $115
byte 4 512
address ui_bombstate
address $260
address $115
byte 4 512
address ui_roundtimerworld
address $283
address $115
byte 4 512
address ui_viptimer
address $284
address $115
byte 4 512
address ui_assaulttimer1
address $285
address $115
byte 4 512
address ui_assaulttimer2
address $286
address $115
byte 4 512
address ui_assaulttimer3
address $287
address $115
byte 4 512
address ui_assaulttimer4
address $288
address $115
byte 4 512
address ui_bombtimer
address $289
address $115
byte 4 512
address ui_assaultblocked1
address $290
address $115
byte 4 512
address ui_assaultblocked2
address $291
address $115
byte 4 512
address ui_assaultblocked3
address $292
address $115
byte 4 512
address ui_assaultblocked4
address $293
address $115
byte 4 512
address cg_disableHeadstuff
address $294
address $115
byte 4 33
address cg_disableTangoHandSkin
address $295
address $115
byte 4 33
address raise_acc
address $296
address $115
byte 4 64
address raise_spd
address $297
address $115
byte 4 64
address raise_str
address $298
address $115
byte 4 64
address raise_stl
address $299
address $115
byte 4 64
address raise_sta
address $300
address $115
byte 4 64
address raise_tec
address $301
address $115
byte 4 64
address ui_teampointlimit
address $302
address $115
byte 4 64
address ui_timelimit
address $303
address $115
byte 4 64
address ui_roundtime
address $304
address $115
byte 4 64
address ui_friendlyfire
address $305
address $115
byte 4 64
address cg_chatTime
address $306
address $307
byte 4 1
address cg_chatHeight
address $308
address $309
byte 4 1
address cg_showConsole
address $310
address $117
byte 4 1
address cg_lightmarks
address $311
address $115
byte 4 1
address cg_smallGuns
address $312
address $117
byte 4 1
address cg_chatBeep
address $313
address $115
byte 4 1
address cg_goreLevel
address $314
address $117
byte 4 1
address cg_crosshairWidth
address $315
address $117
byte 4 1
address cg_antiLag
address $316
address $117
byte 4 3
address cg_autoReload
address $317
address $117
byte 4 3
address cg_useBandage
address $318
address $117
byte 4 3
address cg_qcmd_posx
address $319
address $207
byte 4 1
address cg_qcmd_posy
address $320
address $207
byte 4 1
address cg_qcmd_cmd1
address $321
address $322
byte 4 1
address cg_qcmd_cmd2
address $323
address $322
byte 4 1
address cg_qcmd_cmd3
address $324
address $322
byte 4 1
address cg_qcmd_cmd4
address $325
address $322
byte 4 1
address cg_qcmd_cmd5
address $326
address $322
byte 4 1
address cg_qcmd_cmd6
address $327
address $322
byte 4 1
address cg_qcmd_cmd7
address $328
address $322
byte 4 1
address cg_qcmd_cmd8
address $329
address $322
byte 4 1
address cg_qcmd_cmd9
address $330
address $322
byte 4 1
address cg_qcmd_cmd0
address $331
address $322
byte 4 1
address cg_qcmd_close
address $332
address $322
byte 4 1
address cg_qcmd_dscr1
address $333
address $322
byte 4 1
address cg_qcmd_dscr2
address $334
address $322
byte 4 1
address cg_qcmd_dscr3
address $335
address $322
byte 4 1
address cg_qcmd_dscr4
address $336
address $322
byte 4 1
address cg_qcmd_dscr5
address $337
address $322
byte 4 1
address cg_qcmd_dscr6
address $338
address $322
byte 4 1
address cg_qcmd_dscr7
address $339
address $322
byte 4 1
address cg_qcmd_dscr8
address $340
address $322
byte 4 1
address cg_qcmd_dscr9
address $341
address $322
byte 4 1
address cg_qcmd_dscr0
address $342
address $322
byte 4 1
address cg_qcmd_size
address $343
address $279
byte 4 1
address cg_qcmd_r
address $344
address $117
byte 4 1
address cg_qcmd_g
address $345
address $117
byte 4 1
address cg_qcmd_b
address $346
address $117
byte 4 1
address cg_qcmd_a
address $347
address $255
byte 4 1
address cg_drawRadar
address $348
address $117
byte 4 1
address cg_radarX
address $349
address $350
byte 4 1
address cg_radarY
address $351
address $352
byte 4 1
address cg_radarUpdate
address $353
address $354
byte 4 3
address cg_weaponYaw
address $355
address $117
byte 4 1
address cg_weaponPitch
address $356
address $117
byte 4 1
address cg_weaponRoll
address $357
address $117
byte 4 1
address cg_hudStyle
address $358
address $117
byte 4 1
address cg_hud1PosX
address $359
address $360
byte 4 1
address cg_hud1PosY
address $361
address $362
byte 4 1
address cg_hud2PosX
address $363
address $364
byte 4 1
address cg_hud2PosY
address $365
address $366
byte 4 1
address cg_hudScale
address $367
address $117
byte 4 1
address cg_hudAlpha1
address $368
address $369
byte 4 1
address cg_hudAlpha2
address $370
address $126
byte 4 1
address cg_timerPosX
address $371
address $115
byte 4 1
address cg_timerPosY
address $372
address $115
byte 4 1
address cg_timerCustom
address $373
address $157
byte 4 1
address cg_drawScriptedUI
address $374
address $117
byte 4 1
address r_lightVertex
address $375
address $115
byte 4 33
address cg_timetocache
address $376
address $377
byte 4 33
address cg_debugAlloc
address $378
address $115
byte 4 0
address cg_bulletpredict
address $379
address $117
byte 4 1
address cg_crosshairFade
address $380
address $115
byte 4 1
address cg_lowAmmoWarning
address $381
address $115
byte 4 1
export cvarTableSize
align 4
LABELV cvarTableSize
byte 4 235
export CG_CheckForCheats
code
proc CG_CheckForCheats 12 12
line 684
;73:}
;74:
;75:
;76:cg_t				cg;
;77:cgs_t				cgs;
;78:centity_t			cg_entities[MAX_GENTITIES];
;79:weaponInfo_t		cg_weapons[WP_NUM_WEAPONS*2];//MAX_WEAPONS]; had to fix this
;80:itemInfo_t			cg_items[MAX_ITEMS];
;81:
;82:
;83:vmCvar_t	cg_centertime;
;84:vmCvar_t	cg_runpitch;
;85:vmCvar_t	cg_runyaw;
;86:vmCvar_t	cg_runroll;
;87:vmCvar_t	cg_bobup;
;88:vmCvar_t	cg_bobpitch;
;89:vmCvar_t	cg_bobroll;
;90:vmCvar_t	cg_bobyaw;
;91:vmCvar_t	cg_swingSpeed;
;92:vmCvar_t	cg_shadows;
;93:vmCvar_t	cg_gibs;
;94:vmCvar_t	cg_drawTimer;
;95:vmCvar_t	cg_drawFPS;
;96:vmCvar_t	cg_drawSnapshot;
;97:vmCvar_t	cg_draw3dIcons;
;98:vmCvar_t	cg_drawIcons;
;99:vmCvar_t	cg_drawAmmoWarning;
;100:vmCvar_t	cg_drawCrosshair;
;101:vmCvar_t	cg_drawCrosshairNames;
;102:vmCvar_t	cg_drawRewards;
;103:vmCvar_t	cg_crosshairSize;
;104:vmCvar_t	cg_crosshairX;
;105:vmCvar_t	cg_crosshairY;
;106:vmCvar_t	cg_crosshairHealth;
;107:vmCvar_t	cg_draw2D;
;108:vmCvar_t	cg_drawStatus;
;109:vmCvar_t	cg_animSpeed;
;110:vmCvar_t	cg_debugAnim;
;111:vmCvar_t	cg_debugPosition;
;112:vmCvar_t	cg_debugEvents;
;113:vmCvar_t	cg_errorDecay;
;114:vmCvar_t	cg_nopredict;
;115:vmCvar_t	cg_noPlayerAnims;
;116:vmCvar_t	cg_showmiss;
;117:vmCvar_t	cg_footsteps;
;118:vmCvar_t	cg_addMarks;
;119:vmCvar_t	cg_brassTime;
;120:vmCvar_t	cg_viewsize;
;121:vmCvar_t	cg_drawGun;
;122:vmCvar_t	cg_gun_frame;
;123:vmCvar_t	cg_gun_x;
;124:vmCvar_t	cg_gun_y;
;125:vmCvar_t	cg_gun_z;
;126:vmCvar_t	cg_tracerChance;
;127:vmCvar_t	cg_tracerWidth;
;128:vmCvar_t	cg_tracerLength;
;129:vmCvar_t	cg_autoswitch;
;130:vmCvar_t	cg_ignore;
;131:vmCvar_t	cg_simpleItems;
;132:vmCvar_t	cg_fov;
;133:vmCvar_t	cg_zoomFov;
;134:vmCvar_t	cg_thirdPerson;
;135:vmCvar_t	cg_thirdPersonRange;
;136:vmCvar_t	cg_thirdPersonAngle;
;137:vmCvar_t	cg_stereoSeparation;
;138:vmCvar_t	cg_lagometer;
;139:vmCvar_t	cg_drawAttacker;
;140:vmCvar_t	cg_synchronousClients;
;141:vmCvar_t 	cg_teamChatTime;
;142:vmCvar_t 	cg_teamChatHeight;
;143:vmCvar_t 	cg_stats;
;144:vmCvar_t 	cg_buildScript;
;145://vmCvar_t 	cg_forceModel;
;146:vmCvar_t	cg_paused;
;147:vmCvar_t	cg_blood;
;148://vmCvar_t	cg_predictItems;
;149:vmCvar_t	cg_deferPlayers;
;150:vmCvar_t	cg_drawTeamOverlay;
;151:vmCvar_t	cg_teamOverlayUserinfo;
;152:vmCvar_t	cg_drawFriend;
;153:vmCvar_t	cg_teamChatsOnly;
;154:vmCvar_t	cg_noVoiceChats;
;155:vmCvar_t	cg_noVoiceText;
;156:vmCvar_t	cg_hudFiles;
;157:vmCvar_t 	cg_scorePlum;
;158:vmCvar_t 	cg_smoothClients;
;159:vmCvar_t	pmove_fixed;
;160://vmCvar_t	cg_pmove_fixed;
;161:vmCvar_t	pmove_msec;
;162:vmCvar_t	cg_pmove_msec;
;163:vmCvar_t	cg_cameraMode;
;164:vmCvar_t	cg_cameraOrbit;
;165:vmCvar_t	cg_cameraOrbitDelay;
;166:vmCvar_t	cg_timescaleFadeEnd;
;167:vmCvar_t	cg_timescaleFadeSpeed;
;168:vmCvar_t	cg_timescale;
;169:vmCvar_t	cg_smallFont;
;170:vmCvar_t	cg_bigFont; 
;171: 
;172:// Navy Seals ++
;173:vmCvar_t	test_x;
;174:vmCvar_t	test_y;
;175:vmCvar_t	test_h;
;176:vmCvar_t	test_w;
;177:vmCvar_t	cg_gunSmoke;
;178:vmCvar_t	pmodel_o;
;179:vmCvar_t	cg_enableDust;
;180:vmCvar_t	cg_enableBreath;
;181:vmCvar_t	cg_enableTimeSelect;
;182:vmCvar_t	cg_atmosphericEffects;
;183:vmCvar_t	cg_lowEffects;
;184:vmCvar_t	cg_customTracerColor;
;185:vmCvar_t	cg_gunSmokeTime;
;186:vmCvar_t	cg_particleTime;
;187:
;188:vmCvar_t	cg_crosshair_r;
;189:vmCvar_t	cg_crosshair_g;
;190:vmCvar_t	cg_crosshair_b;
;191:
;192:// character cvars
;193:vmCvar_t	char_stamina;
;194:vmCvar_t	char_stealth;
;195:vmCvar_t	char_speed;
;196:vmCvar_t	char_accuracy;
;197:vmCvar_t	char_technical;
;198:vmCvar_t	char_strength;
;199:vmCvar_t	char_xp;
;200:
;201:vmCvar_t	ui_sealplayers;
;202:vmCvar_t	ui_tangoplayers;
;203:vmCvar_t	ui_players;
;204:vmCvar_t	ui_sealpoints;
;205:vmCvar_t	ui_tangopoints;
;206:vmCvar_t	ui_team;
;207:
;208:vmCvar_t	ui_assaultstate;
;209:vmCvar_t	ui_bombstate;
;210:
;211:vmCvar_t	mi_viprescue;
;212:vmCvar_t	mi_viptime;
;213:vmCvar_t	mi_blowup;
;214:vmCvar_t	mi_assaultfield;
;215:
;216:vmCvar_t	ui_gotbomb;
;217:vmCvar_t	ui_isvip;
;218:vmCvar_t	ui_gotbriefcase; 
;219:
;220:vmCvar_t	cg_bulletTracerLength;
;221:vmCvar_t	cg_bulletTracerWidth;
;222:
;223:vmCvar_t	cg_wakemarkTime;
;224:vmCvar_t	cg_wakemarkDistantTime;
;225:
;226:vmCvar_t	cg_grenadeSparks;
;227:vmCvar_t	cg_correctgunFov;
;228:
;229:vmCvar_t	cg_isgun_z;
;230:vmCvar_t	cg_isgun_y;
;231:vmCvar_t	cg_isgun_x;
;232:vmCvar_t	cg_isgun_roll;
;233:vmCvar_t	cg_isgun_yaw;
;234:vmCvar_t	cg_isgun_pitch;
;235:vmCvar_t	cg_isgun_step;
;236:
;237:vmCvar_t	cg_newbeeHeight;
;238:vmCvar_t	cg_newbeeTime;
;239:vmCvar_t	cg_viewHeight; 
;240: 
;241:	// for the hud icons. 
;242:vmCvar_t	ui_gotbriefcase;
;243:vmCvar_t	ui_isvip;
;244:vmCvar_t	ui_gotbomb;
;245:vmCvar_t	mi_blowup;
;246:vmCvar_t	mi_viprescue;
;247:vmCvar_t	mi_viptime;
;248:vmCvar_t	mi_assaultfield;
;249:vmCvar_t	ui_assaultstate;
;250:vmCvar_t	ui_bombstate;
;251:   
;252:vmCvar_t	ui_roundtimerworld;
;253:vmCvar_t	ui_viptimer;
;254:vmCvar_t	ui_assaulttimer1;
;255:vmCvar_t	ui_assaulttimer2;
;256:vmCvar_t	ui_assaulttimer3;
;257:vmCvar_t	ui_assaulttimer4;
;258:vmCvar_t	ui_bombtimer;
;259:
;260:vmCvar_t	ui_assaultblocked1;
;261:vmCvar_t	ui_assaultblocked2;
;262:vmCvar_t	ui_assaultblocked3;
;263:vmCvar_t	ui_assaultblocked4;
;264:
;265:vmCvar_t	cg_disableHeadstuff;
;266:vmCvar_t	cg_disableTangoHandSkin;
;267:vmCvar_t    raise_acc;
;268:vmCvar_t    raise_spd;
;269:vmCvar_t    raise_str;
;270:vmCvar_t    raise_stl;
;271:vmCvar_t    raise_sta;
;272:vmCvar_t    raise_tec;
;273:
;274:vmCvar_t	ui_teampointlimit;
;275:vmCvar_t	ui_timelimit;
;276:vmCvar_t	ui_roundtime;
;277:vmCvar_t	ui_friendlyfire;
;278:
;279:vmCvar_t	cg_lightmarks;
;280:
;281:vmCvar_t 	cg_chatTime;
;282:vmCvar_t 	cg_chatHeight;
;283:vmCvar_t	cg_showConsole;
;284:
;285:vmCvar_t	cg_smallGuns;
;286:vmCvar_t	cg_chatBeep;
;287:
;288:vmCvar_t	cg_goreLevel;
;289:vmCvar_t	cg_antiLag;
;290:vmCvar_t	cg_autoReload;
;291:vmCvar_t	cg_useBandage;
;292:vmCvar_t	cg_crosshairWidth;
;293:
;294:
;295:vmCvar_t	cg_qcmd_posx;
;296:vmCvar_t	cg_qcmd_posy;
;297:vmCvar_t	cg_qcmd_cmd1;
;298:vmCvar_t	cg_qcmd_cmd2;
;299:vmCvar_t	cg_qcmd_cmd3;
;300:vmCvar_t	cg_qcmd_cmd4;
;301:vmCvar_t	cg_qcmd_cmd5;
;302:vmCvar_t	cg_qcmd_cmd6;
;303:vmCvar_t	cg_qcmd_cmd7;
;304:vmCvar_t	cg_qcmd_cmd8;
;305:vmCvar_t	cg_qcmd_cmd9;
;306:vmCvar_t	cg_qcmd_cmd0;
;307:vmCvar_t	cg_qcmd_dscr1;
;308:vmCvar_t	cg_qcmd_dscr2;
;309:vmCvar_t	cg_qcmd_dscr3;
;310:vmCvar_t	cg_qcmd_dscr4;
;311:vmCvar_t	cg_qcmd_dscr5;
;312:vmCvar_t	cg_qcmd_dscr6;
;313:vmCvar_t	cg_qcmd_dscr7;
;314:vmCvar_t	cg_qcmd_dscr8;
;315:vmCvar_t	cg_qcmd_dscr9;
;316:vmCvar_t	cg_qcmd_dscr0;
;317:vmCvar_t	cg_qcmd_size;
;318:vmCvar_t	cg_qcmd_r;
;319:vmCvar_t	cg_qcmd_g;
;320:vmCvar_t	cg_qcmd_b;
;321:vmCvar_t	cg_qcmd_a;
;322:vmCvar_t	cg_qcmd_close;
;323:
;324:
;325:vmCvar_t	cg_drawRadar;
;326:vmCvar_t	cg_radarUpdate;
;327:vmCvar_t	cg_radarX;
;328:vmCvar_t	cg_radarY;
;329:
;330:vmCvar_t	cg_weaponYaw;
;331:vmCvar_t	cg_weaponPitch;
;332:vmCvar_t	cg_weaponRoll;
;333:
;334:vmCvar_t	cg_hudStyle;
;335:vmCvar_t	cg_hudScale;
;336:
;337:vmCvar_t	cg_timerPosX;
;338:vmCvar_t	cg_timerPosY;
;339:
;340:vmCvar_t	cg_hud1PosX;
;341:vmCvar_t	cg_hud1PosY;
;342:
;343:vmCvar_t	cg_hud2PosX;
;344:vmCvar_t	cg_hud2PosY;
;345:
;346:vmCvar_t	cg_hudAlpha1;
;347:vmCvar_t	cg_hudAlpha2;
;348:
;349:vmCvar_t	cg_timerCustom;
;350:vmCvar_t	cg_drawScriptedUI;
;351:
;352:vmCvar_t	cg_drawScriptedUI;
;353:
;354:vmCvar_t	r_lightVertex;
;355:
;356:vmCvar_t	gameversion;
;357:vmCvar_t	cg_timetocache;
;358:
;359:// BLUTENGEL
;360:
;361:vmCvar_t  cg_bulletpredict;
;362:vmCvar_t  cg_crosshairFade;
;363:vmCvar_t  cg_lowAmmoWarning;
;364:
;365:// Navy Seals --
;366:typedef struct {
;367:	vmCvar_t	*vmCvar;
;368:	char		*cvarName;
;369:	char		*defaultString;
;370:	int			cvarFlags;
;371:} cvarTable_t;
;372:
;373:cvarTable_t		cvarTable[] = {
;374:	{ &gameversion, "gameversion", GAME_VERSION , CVAR_ROM },
;375:
;376:	{ &cg_ignore, "cg_ignore", "0", 0 },	// used for debugging
;377:	{ &cg_autoswitch, "cg_autoswitch", "1", CVAR_ARCHIVE },
;378:	{ &cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE },
;379:	{ &cg_zoomFov, "cg_zoomfov", "22.5", CVAR_ARCHIVE },
;380:	{ &cg_fov, "cg_fov", "80", CVAR_ROM },
;381:	{ &cg_viewsize, "cg_viewsize", "100", CVAR_ARCHIVE },
;382:	{ &cg_stereoSeparation, "cg_stereoSeparation", "0.4", CVAR_ARCHIVE  },
;383:	{ &cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE  },
;384:	{ &cg_gibs, "cg_gibs", "1", CVAR_ARCHIVE  },
;385:	{ &cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE | CVAR_CHEAT },
;386:	{ &cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE  },
;387:	{ &cg_drawTimer, "cg_drawTimer", "0", CVAR_ARCHIVE  },
;388:	{ &cg_drawFPS, "cg_drawFPS", "0", CVAR_ARCHIVE  },
;389:	{ &cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE  },
;390:	{ &cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE  },
;391:	{ &cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE  },
;392:	{ &cg_drawAmmoWarning, "cg_drawAmmoWarning", "1", CVAR_ARCHIVE  },
;393:	{ &cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE  },
;394:	{ &cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;395:	{ &cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;396:	{ &cg_drawRewards, "cg_drawRewards", "1", CVAR_ARCHIVE },
;397:	{ &cg_crosshairSize, "cg_crosshairSize", "24", CVAR_ARCHIVE },
;398:	{ &cg_crosshairHealth, "cg_crosshairHealth", "1", CVAR_ARCHIVE },
;399:	{ &cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE },
;400:	{ &cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE },
;401:	{ &cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;402:	{ &cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE },
;403:	{ &cg_addMarks, "cg_marks", "120", CVAR_ARCHIVE },
;404:	{ &cg_lagometer, "cg_lagometer", "0", CVAR_ARCHIVE },
;405:// BLUTENGEL 20040206 DEMOCRITUS
;406:// CHANGED TO 0 AS DEMOCRITUS REQUESTED
;407://	{ &cg_gun_x, "cg_gunX", "-1.5", CVAR_CHEAT },
;408:	{ &cg_gun_x, "cg_gunX", "0", CVAR_CHEAT },
;409:	{ &cg_gun_y, "cg_gunY", "0", CVAR_CHEAT },
;410:	{ &cg_gun_z, "cg_gunZ", "0", CVAR_CHEAT },
;411:	{ &cg_centertime, "cg_centertime", "3", CVAR_CHEAT },
;412:	{ &cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;413:	{ &cg_runyaw, "cg_runyaw", "0.002", CVAR_ARCHIVE},
;414:	{ &cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE },
;415:	{ &cg_bobup , "cg_bobup", "0.005", CVAR_ARCHIVE },
;416:	{ &cg_bobpitch, "cg_bobpitch", "0.002", CVAR_ARCHIVE },
;417:	{ &cg_bobroll, "cg_bobroll", "0.002", CVAR_ARCHIVE },
;418:	{ &cg_bobyaw, "cg_bobyaw", "0.002", CVAR_ARCHIVE },
;419:	{ &cg_swingSpeed, "cg_swingSpeed", "0.9", CVAR_ARCHIVE | CVAR_CHEAT },
;420:	{ &cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT },
;421:	{ &cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT },
;422:	{ &cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT },
;423:	{ &cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT },
;424:	{ &cg_errorDecay, "cg_errordecay", "100", 0 },
;425:	{ &cg_nopredict, "cg_nopredict", "0", 0 },
;426:	{ &cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT },
;427:	{ &cg_showmiss, "cg_showmiss", "0", 0 },
;428:	{ &cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT },
;429:	{ &cg_tracerChance, "cg_tracerchance", "0.1", CVAR_CHEAT },
;430:	{ &cg_tracerWidth, "cg_tracerwidth", "0.3", CVAR_CHEAT },
;431:	{ &cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT },
;432:	{ &cg_thirdPersonRange, "cg_thirdPersonRange", "40", CVAR_CHEAT },
;433:	{ &cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_CHEAT },
;434:	{ &cg_thirdPerson, "cg_thirdPerson", "0", CVAR_CHEAT },
;435:	{ &cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE  },
;436:	{ &cg_teamChatHeight, "cg_teamChatHeight", "8", CVAR_ARCHIVE  },
;437://	{ &cg_forceModel, "cg_forceModel", "0", CVAR_ARCHIVE  },
;438://	{ &cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE },
;439:#if 0
;440:	{ &cg_deferPlayers, "cg_deferPlayers", "0", CVAR_ARCHIVE },//0
;441:#else
;442:	{ &cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE },
;443:#endif
;444:	{ &cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE },
;445:	{ &cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM  },
;446:	{ &cg_stats, "cg_stats", "0", 0 },
;447:	{ &cg_drawFriend, "cg_drawFriend", "0", CVAR_ARCHIVE },
;448:	{ &cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE },
;449:	{ &cg_noVoiceChats, "cg_noVoiceChats", "0", CVAR_ARCHIVE },
;450:	{ &cg_noVoiceText, "cg_noVoiceText", "0", CVAR_ARCHIVE },
;451:	// the following variables are created in other parts of the system,
;452:	// but we also reference them here
;453:	{ &cg_buildScript, "com_buildScript", "0", 0 },	// force loading of all possible data amd error on failures
;454:	{ &cg_paused, "cl_paused", "0", CVAR_ROM },
;455:	{ &cg_blood, "com_blood", "1", CVAR_ARCHIVE },
;456:	{ &cg_synchronousClients, "g_synchronousClients", "0", 0 },	// communicated by systeminfo
;457:
;458:
;459:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;460:
;461:	{ &cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;462:	{ &cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;463:	{ &cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;464:	{ &cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;465:	{ &cg_timescale, "timescale", "1", 0},
;466:	{ &cg_scorePlum, "cg_scorePlums", "0", CVAR_USERINFO | CVAR_ARCHIVE | CVAR_CHEAT },
;467:	{ &cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;468:	{ &cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;469:
;470:	{ &pmove_fixed, "pmove_fixed", "0", 0},
;471:	{ &pmove_msec, "pmove_msec", "8", 0},
;472: 
;473:	{ &cg_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;474:	{ &cg_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;475:// Navy Seals ++
;476:	{	&test_x, "test_x", "0", 0 }, 
;477:	{	&test_y, "test_y", "0", 0 },
;478:	{	&test_h, "test_h", "0", 0 },
;479:	{	&test_w, "test_w", "0", 0 },
;480:	{	&pmodel_o, "pmodel_offset", "0", CVAR_CHEAT },
;481:	{	&cg_gunSmoke, "cg_gunSmoke", "-1", CVAR_ARCHIVE },
;482:	{	&cg_enableDust, "g_enableDust", "0", CVAR_SERVERINFO},
;483:	{	&cg_enableBreath, "g_enableBreath", "1", CVAR_SERVERINFO},
;484:
;485:	{	&cg_enableTimeSelect, "cg_enabletimeselect", "1", CVAR_ARCHIVE},
;486:
;487:	{	&cg_atmosphericEffects, "cg_enviromentFX", "1", CVAR_ARCHIVE },
;488:	{	&cg_lowEffects, "cg_enviromentFX_quality", "0", CVAR_ARCHIVE },
;489:	{	&cg_customTracerColor, "cg_customTracerColor", "1", CVAR_ARCHIVE },
;490:	{	&cg_gunSmokeTime, "cg_gunSmokeTime", "1500", CVAR_ARCHIVE },
;491:	{	&cg_particleTime, "cg_particleTime", "500", CVAR_ARCHIVE },
;492:
;493:	{	&cg_crosshair_r, "cg_crosshair_r", "1", CVAR_ARCHIVE },
;494:	{	&cg_crosshair_g, "cg_crosshair_g", "1", CVAR_ARCHIVE },
;495:	{	&cg_crosshair_b, "cg_crosshair_b", "1", CVAR_ARCHIVE }, 
;496:
;497:	{	&char_strength, "char_strength", "0", CVAR_ROM },
;498:	{	&char_stamina, "char_stamina", "0", CVAR_ROM },
;499:	{	&char_stealth, "char_stealth", "0", CVAR_ROM },
;500:	{	&char_speed, "char_speed", "0", CVAR_ROM },
;501:	{	&char_accuracy, "char_accuracy", "0", CVAR_ROM },
;502:	{	&char_technical, "char_technical", "0", CVAR_ROM },
;503:	{	&char_xp,	"char_total_xp","0",CVAR_ROM },
;504:
;505:	{	&ui_sealplayers, "ui_sealplayers", "0", CVAR_ROM },
;506:	{	&ui_tangoplayers, "ui_tangoplayers", "0", CVAR_ROM },
;507:	{	&ui_players,	"ui_players","0",CVAR_ROM },
;508:
;509:	{	&ui_sealpoints, "ui_sealpoints", "0", CVAR_ROM },
;510:	{	&ui_tangopoints,	"ui_tangopoints","0",CVAR_ROM },
;511:
;512:	// game cvars
;513:	{	&ui_team, "ui_team", "0", CVAR_ROM },
;514:
;515:	{	&cg_bulletTracerLength, "cg_bulletTracerLength", "75", 0 },
;516:	{	&cg_bulletTracerWidth, "cg_bulletTracerWidth", "0.75", 0 },
;517:
;518:	{	&cg_wakemarkTime, "cg_wakemarkTime", "20", CVAR_ARCHIVE },
;519:	{	&cg_wakemarkDistantTime, "cg_wakemarkDistantTime", "100", CVAR_ARCHIVE } ,
;520: 
;521: 	{	&ui_assaultstate, "ui_assaultstate", "0", CVAR_ROM },
;522:	{	&ui_bombstate, "ui_bombstate", "0", CVAR_ROM },
;523:
;524:	{	&mi_viprescue, "mi_viprescue", "0", CVAR_ROM },
;525:	{	&mi_viptime, "mi_viptime", "0", CVAR_ROM },
;526: 	{	&mi_blowup, "mi_blowup", "0", CVAR_ROM },
;527:	{	&mi_assaultfield, "mi_assaultfield", "0", CVAR_ROM } ,
;528: 
;529:	{	&ui_gotbomb, "ui_gotbomb", "0", CVAR_ROM },
;530:	{	&ui_isvip, "ui_isvip", "0", CVAR_ROM },
;531: 	{	&ui_gotbriefcase, "ui_gotbriefcase", "0", CVAR_ROM },
;532:
;533:	{	&cg_grenadeSparks, "cg_grenadeSparks", "1", CVAR_ARCHIVE },
;534: 	{	&cg_correctgunFov, "cg_correctgunFov", "65", CVAR_ARCHIVE },
;535:
;536:	{	&cg_isgun_z, "cg_isgunz", "0", CVAR_CHEAT },
;537: 	{	&cg_isgun_y, "cg_isguny", "0", CVAR_CHEAT },
;538: 	{	&cg_isgun_x, "cg_isgunx", "0", CVAR_CHEAT },
;539:   
;540:	{	&cg_isgun_roll, "cg_isgun_roll", "0", CVAR_CHEAT },
;541: 	{	&cg_isgun_yaw, "cg_isgun_yaw", "0", CVAR_CHEAT },
;542: 	{	&cg_isgun_pitch, "cg_isgun_pitch", "0", CVAR_CHEAT },
;543:	{	&cg_isgun_step, "cg_isgun_step", "0.25", CVAR_CHEAT },
;544:
;545:	{	&cg_newbeeHeight, "cg_newbeeHeight", "0.2", CVAR_ARCHIVE },
;546: 	{	&cg_newbeeTime, "cg_newbeeTime", "5.5", CVAR_ARCHIVE },
;547:
;548:	{	&cg_viewHeight, "cg_viewHeight", "0", CVAR_CHEAT },
;549:
;550:	{	&ui_gotbriefcase, "ui_gotbriefcase", "0", CVAR_CHEAT },
;551:	{	&ui_isvip, "ui_isvip", "0", CVAR_CHEAT },
;552:	{	&ui_gotbomb, "ui_gotbomb", "0", CVAR_CHEAT },
;553:	{	&mi_blowup, "mi_blowup", "0", CVAR_CHEAT },
;554:	{	&mi_viprescue, "mi_viprescue", "0", CVAR_CHEAT },
;555:	{	&mi_viptime, "mi_viptime", "0", CVAR_CHEAT },
;556:	{	&mi_assaultfield, "mi_assaultfield", "0", CVAR_CHEAT },
;557:	{	&ui_assaultstate, "ui_assaultstate", "0", CVAR_CHEAT },
;558:	{	&ui_bombstate, "ui_bombstate", "0", CVAR_CHEAT },
;559:
;560:	
;561:	{	&ui_roundtimerworld, "ui_roundtimerworld", "0", CVAR_CHEAT },
;562:	{	&ui_viptimer, "ui_viptimer", "0", CVAR_CHEAT },
;563:	{	&ui_assaulttimer1, "ui_assaulttimer1", "0", CVAR_CHEAT },
;564:	{	&ui_assaulttimer2, "ui_assaulttimer2", "0", CVAR_CHEAT },
;565:	{	&ui_assaulttimer3, "ui_assaulttimer3", "0", CVAR_CHEAT },
;566:	{	&ui_assaulttimer4, "ui_assaulttimer4", "0", CVAR_CHEAT },
;567:	{	&ui_bombtimer, "ui_bombtimer", "0", CVAR_CHEAT },
;568:	{	&ui_assaultblocked1, "ui_assaultblocked1", "0", CVAR_CHEAT },
;569:	{	&ui_assaultblocked2, "ui_assaultblocked2", "0", CVAR_CHEAT },
;570:	{	&ui_assaultblocked3, "ui_assaultblocked3", "0", CVAR_CHEAT },
;571:	{	&ui_assaultblocked4, "ui_assaultblocked4", "0", CVAR_CHEAT },
;572:
;573:	{	&cg_disableHeadstuff, "cg_disableHeadstuff", "0", CVAR_LATCH | CVAR_ARCHIVE },
;574:	{	&cg_disableTangoHandSkin, "cg_disableTangoHandSkin", "0", CVAR_LATCH  | CVAR_ARCHIVE },
;575:
;576:	{	&raise_acc, "raise_acc", "0", CVAR_ROM },
;577:	{	&raise_spd, "raise_spd", "0", CVAR_ROM },
;578:	{	&raise_str, "raise_str", "0", CVAR_ROM },
;579:	{	&raise_stl, "raise_stl", "0", CVAR_ROM },
;580:	{	&raise_sta, "raise_sta", "0", CVAR_ROM },
;581:	{	&raise_tec, "raise_tec", "0", CVAR_ROM },
;582:
;583:	{	&ui_teampointlimit, "ui_teampointlimit", "0", CVAR_ROM },
;584:	{	&ui_timelimit, "ui_timelimit", "0", CVAR_ROM },
;585:	{	&ui_roundtime, "ui_roundtime", "0", CVAR_ROM },
;586:	{	&ui_friendlyfire, "ui_friendlyfire", "0", CVAR_ROM },
;587:	
;588:	{	&cg_chatTime, "cg_chatTime", "8000", CVAR_ARCHIVE },
;589:	{	&cg_chatHeight, "cg_chatHeight", "12", CVAR_ARCHIVE },
;590:	{	&cg_showConsole, "cg_showConsole", "1", CVAR_ARCHIVE  }, 
;591:	
;592:	{	&cg_lightmarks, "cg_lightmarks", "0", CVAR_ARCHIVE },
;593:
;594:	{	&cg_smallGuns, "cg_smallGuns", "1", CVAR_ARCHIVE },
;595: 
;596:	{	&cg_chatBeep, "cg_chatBeep", "0", CVAR_ARCHIVE },
;597:
;598:	{	&cg_goreLevel, "cg_goreLevel", "1", CVAR_ARCHIVE },
;599:
;600:	{	&cg_crosshairWidth, "cg_crosshairWidth", "1", CVAR_ARCHIVE },
;601:
;602:	{	&cg_antiLag, "cg_antiLag", "1", CVAR_ARCHIVE | CVAR_USERINFO },
;603:	{	&cg_autoReload, "cg_autoReload", "1", CVAR_ARCHIVE | CVAR_USERINFO },
;604:	{	&cg_useBandage, "cg_useBandage", "1", CVAR_ARCHIVE | CVAR_USERINFO },
;605:
;606:	{	&cg_qcmd_posx, "cg_qcmd_posx", "50", CVAR_ARCHIVE },
;607:	{	&cg_qcmd_posy, "cg_qcmd_posy", "50", CVAR_ARCHIVE },
;608:	{	&cg_qcmd_cmd1, "cg_qcmd_cmd1", "", CVAR_ARCHIVE },
;609:	{	&cg_qcmd_cmd2, "cg_qcmd_cmd2", "", CVAR_ARCHIVE },
;610:	{	&cg_qcmd_cmd3, "cg_qcmd_cmd3", "", CVAR_ARCHIVE },
;611:	{	&cg_qcmd_cmd4, "cg_qcmd_cmd4", "", CVAR_ARCHIVE },
;612:	{	&cg_qcmd_cmd5, "cg_qcmd_cmd5", "", CVAR_ARCHIVE },
;613:	{	&cg_qcmd_cmd6, "cg_qcmd_cmd6", "", CVAR_ARCHIVE },
;614:	{	&cg_qcmd_cmd7, "cg_qcmd_cmd7", "", CVAR_ARCHIVE },
;615:	{	&cg_qcmd_cmd8, "cg_qcmd_cmd8", "", CVAR_ARCHIVE },
;616:	{	&cg_qcmd_cmd9, "cg_qcmd_cmd9", "", CVAR_ARCHIVE },
;617:	{	&cg_qcmd_cmd0, "cg_qcmd_cmd0", "", CVAR_ARCHIVE },
;618:	{	&cg_qcmd_close, "cg_qcmd_close", "", CVAR_ARCHIVE },
;619:	{	&cg_qcmd_dscr1, "cg_qcmd_dscr1", "", CVAR_ARCHIVE },
;620:	{	&cg_qcmd_dscr2, "cg_qcmd_dscr2", "", CVAR_ARCHIVE },
;621:	{	&cg_qcmd_dscr3, "cg_qcmd_dscr3", "", CVAR_ARCHIVE },
;622:	{	&cg_qcmd_dscr4, "cg_qcmd_dscr4", "", CVAR_ARCHIVE },
;623:	{	&cg_qcmd_dscr5, "cg_qcmd_dscr5", "", CVAR_ARCHIVE },
;624:	{	&cg_qcmd_dscr6, "cg_qcmd_dscr6", "", CVAR_ARCHIVE },
;625:	{	&cg_qcmd_dscr7, "cg_qcmd_dscr7", "", CVAR_ARCHIVE },
;626:	{	&cg_qcmd_dscr8, "cg_qcmd_dscr8", "", CVAR_ARCHIVE },
;627:	{	&cg_qcmd_dscr9, "cg_qcmd_dscr9", "", CVAR_ARCHIVE },
;628:	{	&cg_qcmd_dscr0, "cg_qcmd_dscr0", "", CVAR_ARCHIVE },
;629:	{	&cg_qcmd_size, "cg_qcmd_size", "0.2", CVAR_ARCHIVE },
;630:	{	&cg_qcmd_r, "cg_qcmd_r", "1", CVAR_ARCHIVE },
;631:	{	&cg_qcmd_g, "cg_qcmd_g", "1", CVAR_ARCHIVE },
;632:	{	&cg_qcmd_b, "cg_qcmd_b", "1", CVAR_ARCHIVE },
;633:	{	&cg_qcmd_a, "cg_qcmd_a", "0.75", CVAR_ARCHIVE },
;634:     
;635:	{	&cg_drawRadar, "cg_drawRadar", "1", CVAR_ARCHIVE },
;636:	{	&cg_radarX, "cg_radarX", "597", CVAR_ARCHIVE },
;637:	{	&cg_radarY, "cg_radarY", "300", CVAR_ARCHIVE },
;638:	{	&cg_radarUpdate, "cg_radarUpdate", "350", CVAR_ARCHIVE | CVAR_USERINFO },
;639: 
;640:	{	&cg_weaponYaw, "cg_weaponYaw", "1", CVAR_ARCHIVE },
;641:	{	&cg_weaponPitch, "cg_weaponPitch", "1", CVAR_ARCHIVE },
;642:	{	&cg_weaponRoll, "cg_weaponRoll", "1", CVAR_ARCHIVE },
;643:
;644:	{	&cg_hudStyle, "cg_hudStyle", "1", CVAR_ARCHIVE },
;645:  
;646:	{	&cg_hud1PosX, "cg_hud1PosX", "891", CVAR_ARCHIVE },
;647:	{	&cg_hud1PosY, "cg_hud1PosY", "545", CVAR_ARCHIVE },
;648:	{	&cg_hud2PosX, "cg_hud2PosX", "830", CVAR_ARCHIVE },
;649:	{	&cg_hud2PosY, "cg_hud2PosY", "676", CVAR_ARCHIVE },
;650:
;651:	{	&cg_hudScale, "cg_hudScale", "1", CVAR_ARCHIVE },
;652:
;653:	{	&cg_hudAlpha1, "cg_hudAlpha1", "0.5", CVAR_ARCHIVE },
;654:	{	&cg_hudAlpha2, "cg_hudAlpha2", "0.4", CVAR_ARCHIVE },
;655:
;656:	{	&cg_timerPosX, "cg_timerPosX", "0", CVAR_ARCHIVE },
;657:	{	&cg_timerPosY, "cg_timerPosY", "0", CVAR_ARCHIVE },
;658:  
;659:	{	&cg_timerCustom, "cg_timerCustom", "3", CVAR_ARCHIVE },
;660:
;661:	{	&cg_drawScriptedUI, "cg_drawScriptedUI", "1", CVAR_ARCHIVE },
;662:
;663:	{	&r_lightVertex, "r_lightVertex", "0", CVAR_ARCHIVE | CVAR_LATCH },
;664:
;665:	{	&cg_timetocache, "cg_timetocache", "750", CVAR_ARCHIVE | CVAR_LATCH },
;666: 
;667:
;668:	{	&cg_debugAlloc, "cg_debugAlloc", "0", 0 },
;669:	{ &cg_bulletpredict, "cg_bulletpredict", "1", CVAR_ARCHIVE},
;670:	{ &cg_crosshairFade, "cg_crosshairFade", "0", CVAR_ARCHIVE},
;671:	{ &cg_lowAmmoWarning, "cg_lowAmmoWarning", "0", CVAR_ARCHIVE},
;672: 	// Navy Seals -- 	
;673:};
;674:
;675:int		cvarTableSize = sizeof( cvarTable ) / sizeof( cvarTable[0] );
;676:
;677:
;678:/*
;679:=================
;680:CG_CheckForCheats
;681:=================
;682:*/
;683:qboolean CG_CheckForCheats( void )
;684:{
line 688
;685:	int	len;
;686:	fileHandle_t	f;
;687: 
;688:	len = trap_FS_FOpenFile( "../openGL32.dll",  &f, FS_READ );
ADDRGP4 $383
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 690
;689:	
;690:	if ( !f ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $384
line 691
;691:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $382
JUMPV
LABELV $384
line 693
;692:	}
;693:	trap_FS_FCloseFile( f );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 694
;694:	return qtrue;
CNSTI4 1
RETI4
LABELV $382
endproc CG_CheckForCheats 12 12
export CG_RegisterCvars
proc CG_RegisterCvars 1060 16
line 702
;695:}
;696:
;697:/*
;698:=================
;699:CG_RegisterCvars
;700:=================
;701:*/
;702:void CG_RegisterCvars( void ) {
line 708
;703:	int			i;
;704:	cvarTable_t	*cv;
;705:	char		var[MAX_TOKEN_CHARS];
;706:	int			zonemegs,hunkmegs,soundmegs;
;707:
;708:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $390
JUMPV
LABELV $387
line 709
;709:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 711
;710:			cv->defaultString, cv->cvarFlags );
;711:	}
LABELV $388
line 708
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $390
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $387
line 714
;712:
;713:	// see if we are also running the server on this machine
;714:	trap_Cvar_VariableStringBuffer( "sv_running", var, sizeof( var ) );
ADDRGP4 $391
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 715
;715:	cgs.localServer = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31452
ADDRLP4 1044
INDIRI4
ASGNI4
line 719
;716:
;717://	forceModelModificationCount = cg_forceModel.modificationCount;
;718:
;719:	trap_Cvar_VariableStringBuffer( "com_hunkmegs", var, sizeof( var ) );
ADDRGP4 $393
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 720
;720:	hunkmegs = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1048
INDIRI4
ASGNI4
line 722
;721:
;722:	trap_Cvar_VariableStringBuffer( "com_zonemegs", var, sizeof( var ) );
ADDRGP4 $394
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 723
;723:	zonemegs = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1052
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1052
INDIRI4
ASGNI4
line 725
;724:
;725:	trap_Cvar_VariableStringBuffer( "com_soundmegs", var, sizeof( var ) );
ADDRGP4 $395
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 726
;726:	soundmegs = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1056
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1056
INDIRI4
ASGNI4
line 731
;727:
;728:	// BLUTENGEL 07.01.2004
;729:	// removed as noone really wants to know that!
;730:	// CG_Printf("hunkmegs: %i zonemegs: %i soundmegs: %i\n", hunkmegs,zonemegs,soundmegs );
;731:	if ( hunkmegs < 150 )
ADDRLP4 1036
INDIRI4
CNSTI4 150
GEI4 $396
line 732
;732:	{
line 733
;733:		CG_Error(
ADDRGP4 $398
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 740
;734:			"You can't start NS-CO because of your memorysettings."
;735:			"You might have started NS-CO via the Quake3 mods menu."
;736:			"Please use a shortcut, start with the required parameters or use the launcher."
;737:			"Your 'com_hunkmegs' setting is %i, it must be atleast 150."
;738:			"Please refer to the troubleshooting faq for more information.", hunkmegs );
;739:			
;740:		return;
ADDRGP4 $386
JUMPV
LABELV $396
line 743
;741:	}
;742:	
;743:	if ( zonemegs < 16 )
ADDRLP4 1032
INDIRI4
CNSTI4 16
GEI4 $399
line 744
;744:	{
line 745
;745:		CG_Error(
ADDRGP4 $401
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 751
;746:			"You can't start NS-CO because of your memorysettings."
;747:			"You might have started NS-CO via the Quake3 mods menu."
;748:			"Please use a shortcut, start with the required parameters or use the launcher."
;749:			"Your 'com_zonemegs' setting is %i, it must be atleast 16."
;750:			"Please refer to the troubleshooting faq for more information.", zonemegs );
;751:		return;	
ADDRGP4 $386
JUMPV
LABELV $399
line 754
;752:	}
;753:
;754:	if ( soundmegs < 16 )
ADDRLP4 1040
INDIRI4
CNSTI4 16
GEI4 $402
line 755
;755:	{
line 756
;756:		CG_Error(
ADDRGP4 $404
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 762
;757:			"You can't start NS-CO because of your memorysettings."
;758:			"You might have started NS-CO via the Quake3 mods menu."
;759:			"Please use a shortcut, start with the required parameters or use the launcher."
;760:			"Your 'com_soundmegs' setting is %i, it must be atleast 16."
;761:			"Please refer to the troubleshooting faq for more information.", soundmegs );
;762:		return;	
ADDRGP4 $386
JUMPV
LABELV $402
line 766
;763:	}
;764:
;765:
;766:	trap_Cvar_Register(NULL, "model", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE ); 
CNSTP4 0
ARGP4
ADDRGP4 $405
ARGP4
ADDRGP4 $406
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 768
;767:
;768:	trap_Cvar_Register(NULL, "e_head", "", CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $407
ARGP4
ADDRGP4 $322
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 769
;769:	trap_Cvar_Register(NULL, "e_eyes", "", CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $408
ARGP4
ADDRGP4 $322
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 770
;770:	trap_Cvar_Register(NULL, "e_mouth", "", CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $409
ARGP4
ADDRGP4 $322
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 772
;771:
;772:	trap_Cvar_Register(NULL, "quitmsg", "www.ns-co.net / join our forum", CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $410
ARGP4
ADDRGP4 $411
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 773
;773:	trap_Cvar_Register(NULL, "character", "C111111", CVAR_USERINFO );
CNSTP4 0
ARGP4
ADDRGP4 $412
ARGP4
ADDRGP4 $413
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 775
;774:
;775:}
LABELV $386
endproc CG_RegisterCvars 1060 16
proc CG_CheckForceCvar 296 12
line 779
;776:
;777:
;778:static void CG_CheckForceCvar( void )
;779:{
line 780
;780:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 787
;781:
;782:	char str_value[MAX_CVAR_VALUE_STRING];
;783:	float minvalue;
;784:	float maxvalue;
;785:	float value;
;786:
;787:	qboolean	vid_restart = qfalse;
ADDRLP4 272
CNSTI4 0
ASGNI4
line 790
;788:
;789:
;790:	for ( i = 0; i < cg.num_blockedCvars ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $418
JUMPV
LABELV $415
line 791
;791:	{
line 792
;792:		trap_Cvar_VariableStringBuffer( cg.blockedCvars[i].string, str_value, sizeof( str_value ) );
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 794
;793:
;794:		minvalue = atof(cg.blockedCvars[i].minvalue);
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+256
ADDP4
ARGP4
ADDRLP4 276
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 268
ADDRLP4 276
INDIRF4
ASGNF4
line 795
;795:		maxvalue = atof(cg.blockedCvars[i].maxvalue);
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968
ADDP4
ARGP4
ADDRLP4 280
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 264
ADDRLP4 280
INDIRF4
ASGNF4
line 797
;796:
;797:		value = atof( str_value );
ADDRLP4 4
ARGP4
ADDRLP4 284
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 260
ADDRLP4 284
INDIRF4
ASGNF4
line 799
;798:  
;799:		if ( cg.cheatsEnabled )
ADDRGP4 cg+201980
INDIRI4
CNSTI4 0
EQI4 $425
line 800
;800:		{
line 801
;801:			if ( !Q_stricmp( cg.blockedCvars[i].string, "cg_thirdperson" ) )
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $428
line 802
;802:				continue;
ADDRGP4 $416
JUMPV
LABELV $428
line 803
;803:		}
LABELV $425
line 804
;804:		if ( value < minvalue )
ADDRLP4 260
INDIRF4
ADDRLP4 268
INDIRF4
GEF4 $433
line 805
;805:		{				
line 807
;806:
;807:			if (!Q_stricmp(cg.blockedCvars[i].string, "com_maxfps") ) {
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRGP4 $439
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $435
line 808
;808:				trap_Cvar_Set( cg.blockedCvars[i].string , cg.blockedCvars[i].maxvalue );
ADDRLP4 292
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 292
INDIRI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRLP4 292
INDIRI4
ADDRGP4 cg+117968
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 809
;809:				CG_Printf("forced cvar %s to %f\n", cg.blockedCvars[i].string, maxvalue );
ADDRGP4 $443
ARGP4
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRLP4 264
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 810
;810:			} else {
ADDRGP4 $436
JUMPV
LABELV $435
line 811
;811:				trap_Cvar_Set( cg.blockedCvars[i].string , cg.blockedCvars[i].minvalue );
ADDRLP4 292
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 292
INDIRI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRLP4 292
INDIRI4
ADDRGP4 cg+117968+256
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 812
;812:				CG_Printf("forced cvar %s to %f\n", cg.blockedCvars[i].string, minvalue );
ADDRGP4 $443
ARGP4
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRLP4 268
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 813
;813:			}
LABELV $436
line 815
;814:
;815:			if ( cg.blockedCvars[i].restart_video )
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $452
line 816
;816:				vid_restart = qtrue;
ADDRLP4 272
CNSTI4 1
ASGNI4
LABELV $452
line 817
;817:		}
LABELV $433
line 818
;818:		if ( value > maxvalue )
ADDRLP4 260
INDIRF4
ADDRLP4 264
INDIRF4
LEF4 $456
line 819
;819:		{
line 820
;820:			trap_Cvar_Set( cg.blockedCvars[i].string , cg.blockedCvars[i].maxvalue );
ADDRLP4 288
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 288
INDIRI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRLP4 288
INDIRI4
ADDRGP4 cg+117968
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 821
;821:			CG_Printf("forced cvar %s to %f\n", cg.blockedCvars[i].string, maxvalue );
ADDRGP4 $443
ARGP4
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRLP4 264
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 823
;822:
;823:			if ( cg.blockedCvars[i].restart_video )
CNSTI4 772
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+117968+512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $463
line 824
;824:				vid_restart = qtrue;
ADDRLP4 272
CNSTI4 1
ASGNI4
LABELV $463
line 825
;825:		} 
LABELV $456
line 826
;826:	}
LABELV $416
line 790
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $418
ADDRLP4 0
INDIRI4
ADDRGP4 cg+167376
INDIRI4
LTI4 $415
line 828
;827:
;828:	if ( vid_restart )
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $467
line 829
;829:	{
line 830
;830:		trap_SendConsoleCommand( "vid_restart\n" );
ADDRGP4 $469
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 831
;831:	}//
LABELV $467
line 832
;832:}
LABELV $414
endproc CG_CheckForceCvar 296 12
export CG_UpdateCvars
proc CG_UpdateCvars 8 8
line 840
;833:
;834:/*
;835:=================
;836:CG_UpdateCvars
;837:=================
;838:*/ 
;839:void ClientScript_ProcessWhileLoops( void );
;840:void CG_UpdateCvars( void ) {
line 844
;841:	int			i;
;842:	cvarTable_t	*cv;
;843:
;844:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $474
JUMPV
LABELV $471
line 845
;845:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 847
;846: 
;847:	}
LABELV $472
line 844
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $474
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $471
line 850
;848: 
;849:	// check for modications here
;850:	CG_CheckForceCvar(  ); 
ADDRGP4 CG_CheckForceCvar
CALLV
pop
line 855
;851: 
;852:
;853:	// If team overlay is on, ask for updates from the server.  If its off,
;854:	// let the server know so we don't receive it
;855:	if ( drawTeamOverlayModificationCount != cg_drawTeamOverlay.modificationCount ) {
ADDRGP4 drawTeamOverlayModificationCount
INDIRI4
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
EQI4 $475
line 856
;856:		drawTeamOverlayModificationCount = cg_drawTeamOverlay.modificationCount;
ADDRGP4 drawTeamOverlayModificationCount
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
ASGNI4
line 858
;857:
;858:		if ( cg_drawTeamOverlay.integer > 0 ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
LEI4 $479
line 859
;859:			trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $193
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 860
;860:		} else {
ADDRGP4 $480
JUMPV
LABELV $479
line 861
;861:			trap_Cvar_Set( "teamoverlay", "0" );
ADDRGP4 $193
ARGP4
ADDRGP4 $115
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 862
;862:		}
LABELV $480
line 864
;863:		// FIXME E3 HACK
;864:		trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $193
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 865
;865:	}
LABELV $475
line 869
;866:
;867:	
;868://	if ( forceModelModificationCount != cg_forceModel.modificationCount )
;869:}
LABELV $470
endproc CG_UpdateCvars 8 8
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 871
;870:
;871:int CG_CrosshairPlayer( void ) {
line 872
;872:	if ( cg.time > ( cg.crosshairClientTime + 1000 ) ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+115040
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $483
line 873
;873:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $482
JUMPV
LABELV $483
line 875
;874:	}
;875:	return cg.crosshairClientNum;
ADDRGP4 cg+115036
INDIRI4
RETI4
LABELV $482
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 878
;876:}
;877:
;878:int CG_LastAttacker( void ) { 
line 879
;879:	return -1; ;
CNSTI4 -1
RETI4
LABELV $488
endproc CG_LastAttacker 0 0
proc CG_RemoveEscapeChar 16 0
line 889
;880:}
;881: 
;882:void CG_AddToChat( const char *str );
;883:
;884:/*
;885:=================
;886:CG_RemoveEscapeChar
;887:=================
;888:*/
;889:static void CG_RemoveEscapeChar( char *text ) {
line 892
;890:	int i, l;
;891:
;892:	l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 893
;893:	for ( i = 0; text[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $493
JUMPV
LABELV $490
line 894
;894:		if (text[i] == '\x19')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 25
NEI4 $494
line 895
;895:			continue;
ADDRGP4 $491
JUMPV
LABELV $494
line 896
;896:		if (text[i] == '\n' )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $496
line 897
;897:			continue;
ADDRGP4 $491
JUMPV
LABELV $496
line 899
;898:
;899:		text[l++] = text[i];
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 900
;900:	}
LABELV $491
line 893
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $493
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $490
line 901
;901:	text[l] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 902
;902:}
LABELV $489
endproc CG_RemoveEscapeChar 16 0
export CG_Printf
proc CG_Printf 1028 12
line 904
;903:
;904:void QDECL CG_Printf( const char *msg, ... ) {
line 908
;905:	va_list		argptr;
;906:	char		text[1024];
;907:
;908:	va_start (argptr, msg);
ADDRLP4 1024
ADDRFP4 0+4
ASGNP4
line 909
;909:	vsprintf (text, msg, argptr);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 910
;910:	va_end (argptr);
ADDRLP4 1024
CNSTP4 0
ASGNP4
line 912
;911:
;912:	if ( cg_showConsole.integer )
ADDRGP4 cg_showConsole+12
INDIRI4
CNSTI4 0
EQI4 $500
line 913
;913: 		trap_Print( text ); 
ADDRLP4 0
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $500
line 915
;914:	
;915:	CG_RemoveEscapeChar( text );
ADDRLP4 0
ARGP4
ADDRGP4 CG_RemoveEscapeChar
CALLV
pop
line 916
;916:	CG_AddToChat( text );
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddToChat
CALLV
pop
line 917
;917:}
LABELV $498
endproc CG_Printf 1028 12
export CG_Error
proc CG_Error 1028 12
line 919
;918:
;919:void QDECL CG_Error( const char *msg, ... ) {
line 923
;920:	va_list		argptr;
;921:	char		text[1024];
;922:
;923:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 924
;924:	vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 925
;925:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 927
;926:
;927:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 928
;928:}
LABELV $503
endproc CG_Error 1028 12
export Com_Error
proc Com_Error 1028 12
line 933
;929:
;930:#ifndef CGAME_HARD_LINKED
;931:// this is only here so the functions in q_shared.c and bg_*.c can link (FIXME)
;932:
;933:void QDECL Com_Error( int level, const char *error, ... ) {
line 937
;934:	va_list		argptr;
;935:	char		text[1024];
;936:
;937:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 938
;938:	vsprintf (text, error, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 939
;939:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 941
;940:
;941:	CG_Error( "%s", text);
ADDRGP4 $507
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 942
;942:}
LABELV $505
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 944
;943:
;944:void QDECL Com_Printf( const char *msg, ... ) {
line 948
;945:	va_list		argptr;
;946:	char		text[1024];
;947:
;948:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 949
;949:	vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 950
;950:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 952
;951:
;952:	CG_Printf ("%s", text);
ADDRGP4 $507
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 953
;953:}
LABELV $508
endproc Com_Printf 1028 12
bss
align 1
LABELV $511
skip 1024
export CG_Argv
code
proc CG_Argv 0 12
line 962
;954:
;955:#endif
;956:
;957:/*
;958:================
;959:CG_Argv
;960:================
;961:*/
;962:const char *CG_Argv( int arg ) {
line 965
;963:	static char	buffer[MAX_STRING_CHARS];
;964:
;965:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $511
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 967
;966:
;967:	return buffer;
ADDRGP4 $511
RETP4
LABELV $510
endproc CG_Argv 0 12
proc CG_RegisterItemSounds 96 12
line 980
;968:}
;969:
;970:
;971://========================================================================
;972:
;973:/*
;974:=================
;975:CG_RegisterItemSounds
;976:
;977:The server says this item is used on this level
;978:=================
;979:*/
;980:static void CG_RegisterItemSounds( int itemNum ) {
line 986
;981:	gitem_t			*item;
;982:	char			data[MAX_QPATH];
;983:	char			*s, *start;
;984:	int				len;
;985:
;986:	item = &bg_itemlist[ itemNum ];
ADDRLP4 76
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 988
;987:
;988:	if( item->pickup_sound ) {
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $513
line 989
;989:		trap_S_RegisterSound( item->pickup_sound, qfalse );
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 990
;990:	}
LABELV $513
line 993
;991:
;992:	// parse the space seperated precache string for other media
;993:	s = item->sounds;
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 52
ADDP4
INDIRP4
ASGNP4
line 994
;994:	if (!s || !s[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $517
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $519
LABELV $517
line 995
;995:		return;
ADDRGP4 $512
JUMPV
LABELV $518
line 997
;996:
;997:	while (*s) {
line 998
;998:		start = s;
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $522
JUMPV
LABELV $521
line 999
;999:		while (*s && *s != ' ') {
line 1000
;1000:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1001
;1001:		}
LABELV $522
line 999
ADDRLP4 84
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $524
ADDRLP4 84
INDIRI4
CNSTI4 32
NEI4 $521
LABELV $524
line 1003
;1002:
;1003:		len = s-start;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1004
;1004:		if (len >= MAX_QPATH || len < 5) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $527
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $525
LABELV $527
line 1005
;1005:			CG_Error( "PrecacheItem: %s has bad precache string", 
ADDRGP4 $528
ARGP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1007
;1006:				item->classname);
;1007:			return;
ADDRGP4 $512
JUMPV
LABELV $525
line 1009
;1008:		}
;1009:		memcpy (data, start, len);
ADDRLP4 8
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1010
;1010:		data[len] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 1011
;1011:		if ( *s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $529
line 1012
;1012:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1013
;1013:		}
LABELV $529
line 1015
;1014:
;1015:		if ( !strcmp(data+len-3, "wav" )) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $531
line 1016
;1016:			trap_S_RegisterSound( data, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 1017
;1017:		}
LABELV $531
line 1018
;1018:	}
LABELV $519
line 997
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $518
line 1019
;1019:}
LABELV $512
endproc CG_RegisterItemSounds 96 12
proc CG_RegisterSounds 436 16
line 1029
;1020:
;1021:
;1022:/*
;1023:=================
;1024:CG_RegisterSounds
;1025:
;1026:called during a precache command
;1027:=================
;1028:*/
;1029:static void CG_RegisterSounds( void ) {
line 1038
;1030:	int		i;
;1031:	char	items[MAX_ITEMS+1];
;1032:	char	name[MAX_QPATH];
;1033:	const char	*soundName;
;1034: 
;1035: //	cgs.media.countFightSound = trap_S_RegisterSound( "sound/feedback/fight.wav", qfalse );
;1036://	cgs.media.countPrepareSound = trap_S_RegisterSound( "sound/feedback/prepare.wav", qfalse );
;1037: 
;1038:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) { 
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
GEI4 $540
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $536
LABELV $540
line 1040
;1039: 
;1040:		cgs.media.redLeadsSound = trap_S_RegisterSound( "sound/commentary/sls_lead.wav", qfalse );
ADDRGP4 $543
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1500
ADDRLP4 332
INDIRI4
ASGNI4
line 1041
;1041:		cgs.media.blueLeadsSound = trap_S_RegisterSound( "sound/commentary/tgs_lead.wav", qfalse );
ADDRGP4 $546
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1504
ADDRLP4 336
INDIRI4
ASGNI4
line 1044
;1042:
;1043:  
;1044:		cgs.media.redScoredSound = trap_S_RegisterSound( "sound/commentary/sls_won.wav", qfalse );
ADDRGP4 $549
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 340
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1492
ADDRLP4 340
INDIRI4
ASGNI4
line 1045
;1045:		cgs.media.blueScoredSound = trap_S_RegisterSound( "sound/commentary/tgs_won.wav", qfalse );
ADDRGP4 $552
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 344
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1496
ADDRLP4 344
INDIRI4
ASGNI4
line 1047
;1046:
;1047:		cgs.media.roundDrawSound = trap_S_RegisterSound( "sound/commentary/draw.wav", qfalse );
ADDRGP4 $555
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 348
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1488
ADDRLP4 348
INDIRI4
ASGNI4
line 1048
;1048:		cgs.media.captureYourTeamSound = trap_S_RegisterSound( "sound/commentary/bfc_stolen.wav", qfalse );
ADDRGP4 $558
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 352
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1508
ADDRLP4 352
INDIRI4
ASGNI4
line 1049
;1049:	}
LABELV $536
line 1052
;1050:// Navy Seals ++
;1051:
;1052:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $559
line 1053
;1053:		Com_sprintf (name, sizeof(name), "sound/debris/wood%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $563
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1055
;1054:	//	CG_Printf("CACHED: %s\n",name);
;1055:		cgs.media.sfxWood[i] = trap_S_RegisterSound (name,qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1016
ADDP4
ADDRLP4 332
INDIRI4
ASGNI4
line 1057
;1056:
;1057:		Com_sprintf (name, sizeof(name), "sound/debris/glass%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $566
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1059
;1058:	//	CG_Printf("CACHED: %s\n",name);
;1059:		cgs.media.sfxGlass[i] = trap_S_RegisterSound (name,qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1032
ADDP4
ADDRLP4 336
INDIRI4
ASGNI4
line 1060
;1060:	}
LABELV $560
line 1052
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $559
line 1061
;1061:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $569
line 1062
;1062:		Com_sprintf (name, sizeof(name), "sound/debris/metal%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $573
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1064
;1063:	//	CG_Printf("CACHED: %s\n",name);
;1064:		cgs.media.sfxMetal[i] = trap_S_RegisterSound (name,qfalse ); 
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1048
ADDP4
ADDRLP4 332
INDIRI4
ASGNI4
line 1065
;1065:	}
LABELV $570
line 1061
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $569
line 1066
;1066:	for (i=0;i<3;i++){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $576
line 1067
;1067:		Com_sprintf (name, sizeof(name), "sound/weapons/shellhit_%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $580
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1069
;1068:	//	CG_Printf("CACHED: %s\n",name);
;1069:		cgs.media.sfxShellHitWall[i] = trap_S_RegisterSound (name,qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1064
ADDP4
ADDRLP4 332
INDIRI4
ASGNI4
line 1070
;1070:	}
LABELV $577
line 1066
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $576
line 1071
;1071:	for (i=0;i<3;i++){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $583
line 1072
;1072:		Com_sprintf (name, sizeof(name), "sound/actors/player/death%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $587
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1074
;1073:	//	CG_Printf("CACHED: %s\n",name);
;1074:		cgs.media.deathSounds[i] = trap_S_RegisterSound (name,qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1432
ADDP4
ADDRLP4 332
INDIRI4
ASGNI4
line 1075
;1075:	}
LABELV $584
line 1071
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $583
line 1077
;1076:
;1077:	cgs.media.mk26_explode = trap_S_RegisterSound ("sound/weapons/mk26/explode.wav",qfalse );
ADDRGP4 $592
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1280
ADDRLP4 332
INDIRI4
ASGNI4
line 1078
;1078:	cgs.media.c4_explode = trap_S_RegisterSound ("sound/weapons/c4/explode.wav",qfalse );
ADDRGP4 $595
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1284
ADDRLP4 336
INDIRI4
ASGNI4
line 1079
;1079:	cgs.media.flashbang_explode = trap_S_RegisterSound ("sound/weapons/flashbang/explode.wav",qfalse );
ADDRGP4 $598
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 340
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1288
ADDRLP4 340
INDIRI4
ASGNI4
line 1080
;1080:	cgs.media.flashbanged = trap_S_RegisterSound ("sound/weapons/flashbang/flashbanged.wav",qfalse );
ADDRGP4 $601
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 344
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1292
ADDRLP4 344
INDIRI4
ASGNI4
line 1081
;1081:	cgs.media.flash_2sec = trap_S_RegisterSound ("sound/weapons/flashbang/flash_2sec.wav",qfalse );
ADDRGP4 $604
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 348
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1296
ADDRLP4 348
INDIRI4
ASGNI4
line 1082
;1082:	cgs.media.flash_4sec = trap_S_RegisterSound ("sound/weapons/flashbang/flash_4sec.wav",qfalse );
ADDRGP4 $607
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 352
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1300
ADDRLP4 352
INDIRI4
ASGNI4
line 1083
;1083:	cgs.media.flash_6sec = trap_S_RegisterSound ("sound/weapons/flashbang/flash_6sec.wav",qfalse );
ADDRGP4 $610
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1304
ADDRLP4 356
INDIRI4
ASGNI4
line 1084
;1084:	cgs.media.flash_8sec = trap_S_RegisterSound ("sound/weapons/flashbang/flash_8sec.wav",qfalse );
ADDRGP4 $613
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 360
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1308
ADDRLP4 360
INDIRI4
ASGNI4
line 1085
;1085:	cgs.media.newbeeMsgSound = trap_S_RegisterSound ("sound/misc/newbee_msg.wav", qfalse );
ADDRGP4 $616
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 364
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1312
ADDRLP4 364
INDIRI4
ASGNI4
line 1088
;1086:
;1087:// Navy Seals --
;1088:	cgs.media.tracerSound = trap_S_RegisterSound( "sound/weapons/machinegun/buletby1.wav", qfalse );
ADDRGP4 $619
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 368
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1316
ADDRLP4 368
INDIRI4
ASGNI4
line 1089
;1089:	cgs.media.selectSound = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $622
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 372
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1320
ADDRLP4 372
INDIRI4
ASGNI4
line 1097
;1090: //	cgs.media.gibSound = trap_S_RegisterSound( "sound/player/gibsplt1.wav", qfalse );
;1091://	cgs.media.gibBounce1Sound = trap_S_RegisterSound( "sound/player/gibimp1.wav", qfalse );
;1092://	cgs.media.gibBounce2Sound = trap_S_RegisterSound( "sound/player/gibimp2.wav", qfalse );
;1093://	cgs.media.gibBounce3Sound = trap_S_RegisterSound( "sound/player/gibimp3.wav", qfalse );
;1094:
;1095: 
;1096:
;1097:	cgs.media.teleInSound = trap_S_RegisterSound( "sound/world/telein.wav", qfalse );
ADDRGP4 $625
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1452
ADDRLP4 376
INDIRI4
ASGNI4
line 1098
;1098:	cgs.media.teleOutSound = trap_S_RegisterSound( "sound/world/teleout.wav", qfalse );
ADDRGP4 $628
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1456
ADDRLP4 380
INDIRI4
ASGNI4
line 1100
;1099: 
;1100:	cgs.media.noAmmoSound = trap_S_RegisterSound( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $631
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1460
ADDRLP4 384
INDIRI4
ASGNI4
line 1102
;1101:
;1102:	cgs.media.talkSound = trap_S_RegisterSound( "sound/player/talk.wav", qfalse );
ADDRGP4 $634
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1464
ADDRLP4 388
INDIRI4
ASGNI4
line 1103
;1103:	cgs.media.landSound = trap_S_RegisterSound( "sound/player/land1.wav", qfalse);
ADDRGP4 $637
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1468
ADDRLP4 392
INDIRI4
ASGNI4
line 1106
;1104:
;1105: 
;1106:	CG_LoadingBarUpdate(25);
CNSTI4 25
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1109
;1107:  
;1108: 
;1109:	cgs.media.watrInSound = trap_S_RegisterSound( "sound/player/watr_in.wav", qfalse);
ADDRGP4 $640
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1476
ADDRLP4 396
INDIRI4
ASGNI4
line 1110
;1110:	cgs.media.watrOutSound = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $643
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1480
ADDRLP4 400
INDIRI4
ASGNI4
line 1111
;1111:	cgs.media.watrUnSound = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $646
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1484
ADDRLP4 404
INDIRI4
ASGNI4
line 1113
;1112:
;1113: 	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $647
line 1114
;1114:		Com_sprintf (name, sizeof(name), "sound/actors/solid%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $651
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1115
;1115:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324
ADDP4
ADDRLP4 408
INDIRI4
ASGNI4
line 1117
;1116: 
;1117:		Com_sprintf (name, sizeof(name), "sound/actors/water%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $654
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1118
;1118:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+32
ADDP4
ADDRLP4 412
INDIRI4
ASGNI4
line 1120
;1119:
;1120:		Com_sprintf (name, sizeof(name), "sound/actors/metal%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $658
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1121
;1121:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+16
ADDP4
ADDRLP4 416
INDIRI4
ASGNI4
line 1123
;1122:
;1123:		Com_sprintf (name, sizeof(name), "sound/actors/dirt%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1124
;1124:		cgs.media.footsteps[FOOTSTEP_DIRT][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+48
ADDP4
ADDRLP4 420
INDIRI4
ASGNI4
line 1126
;1125:
;1126:		Com_sprintf (name, sizeof(name), "sound/actors/wood%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $666
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1127
;1127:		cgs.media.footsteps[FOOTSTEP_WOOD][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+64
ADDP4
ADDRLP4 424
INDIRI4
ASGNI4
line 1129
;1128:
;1129:		Com_sprintf (name, sizeof(name), "sound/actors/snow%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $670
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1130
;1130:		cgs.media.footsteps[FOOTSTEP_SNOW][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1324+80
ADDP4
ADDRLP4 428
INDIRI4
ASGNI4
line 1131
;1131:	}
LABELV $648
line 1113
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $647
line 1134
;1132:
;1133:	// only register the items that the server says we need
;1134:	strcpy( items, CG_ConfigString( CS_ITEMS ) );
CNSTI4 27
ARGI4
ADDRLP4 408
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1136
;1135:
;1136:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $677
JUMPV
LABELV $674
line 1137
;1137:		if ( items[ i ] == '1' /* || cg_buildScript.integer */ ) {
ADDRLP4 0
INDIRI4
ADDRLP4 72
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $678
line 1138
;1138:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 1139
;1139:		}
LABELV $678
line 1140
;1140:	}
LABELV $675
line 1136
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $677
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $674
line 1142
;1141:
;1142:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $680
line 1143
;1143:		soundName = CG_ConfigString( CS_SOUNDS+i );
ADDRLP4 0
INDIRI4
CNSTI4 292
ADDI4
ARGI4
ADDRLP4 412
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 412
INDIRP4
ASGNP4
line 1144
;1144:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $684
line 1145
;1145:			break;
ADDRGP4 $682
JUMPV
LABELV $684
line 1147
;1146:		}
;1147:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $686
line 1148
;1148:			continue;	// custom sound
ADDRGP4 $681
JUMPV
LABELV $686
line 1150
;1149:		}
;1150:		cgs.gameSounds[i] = trap_S_RegisterSound( soundName, qfalse );
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+33540
ADDP4
ADDRLP4 416
INDIRI4
ASGNI4
line 1151
;1151:	}
LABELV $681
line 1142
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $680
LABELV $682
line 1154
;1152:
;1153:	// FIXME: only needed with item
;1154: 	cgs.media.sfx_ric1 = trap_S_RegisterSound ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $691
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1420
ADDRLP4 412
INDIRI4
ASGNI4
line 1155
;1155:	cgs.media.sfx_ric2 = trap_S_RegisterSound ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $694
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1424
ADDRLP4 416
INDIRI4
ASGNI4
line 1156
;1156:	cgs.media.sfx_ric3 = trap_S_RegisterSound ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $697
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1428
ADDRLP4 420
INDIRI4
ASGNI4
line 1159
;1157:// 	cgs.media.sfx_rockexp = trap_S_RegisterSound ("sound/weapons/rocket/rocklx1a.wav", qfalse);
;1158:  
;1159:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $698
line 1160
;1160:		Com_sprintf (name, sizeof(name), "sound/actors/fleshhit_%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $702
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1161
;1161:		cgs.media.bulletHitFlesh[i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+972
ADDP4
ADDRLP4 424
INDIRI4
ASGNI4
line 1163
;1162:
;1163:		Com_sprintf (name, sizeof(name), "sound/actors/helmethit_%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $705
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1164
;1164:		cgs.media.bulletHitHelmet[i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1000
ADDP4
ADDRLP4 428
INDIRI4
ASGNI4
line 1166
;1165:
;1166:		if ( i < 3 )
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $708
line 1167
;1167:		{
line 1168
;1168:			Com_sprintf (name, sizeof(name), "sound/actors/kevlarhit_%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $710
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1169
;1169:			cgs.media.bulletHitKevlar[i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+988
ADDP4
ADDRLP4 432
INDIRI4
ASGNI4
line 1170
;1170:		}
LABELV $708
line 1171
;1171:	}
LABELV $699
line 1159
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $698
line 1175
;1172:
;1173: 
;1174:
;1175:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade_bounce1.wav", qfalse);
ADDRGP4 $715
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1444
ADDRLP4 424
INDIRI4
ASGNI4
line 1176
;1176:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade_bounce2.wav", qfalse);
ADDRGP4 $718
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1448
ADDRLP4 428
INDIRI4
ASGNI4
line 1186
;1177:
;1178:/*	cgs.media.regenSound = trap_S_RegisterSound("sound/items/regen.wav", qfalse);
;1179:	cgs.media.protectSound = trap_S_RegisterSound("sound/items/protect3.wav", qfalse);
;1180:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.wav", qfalse );
;1181:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
;1182:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
;1183:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
;1184:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
;1185:*/
;1186:}
LABELV $535
endproc CG_RegisterSounds 436 16
data
align 4
LABELV $720
address $721
address $722
address $723
address $724
address $725
address $726
address $727
address $728
address $729
address $730
code
proc CG_RegisterBombGraphics 40 8
line 1198
;1187:
;1188:
;1189://===================================================================================
;1190:
;1191:/*
;1192:=================
;1193:CG_RegisterBombGraphics
;1194:
;1195:  This function caches all required bomb graphics and shaders
;1196:=================
;1197:*/
;1198:static void CG_RegisterBombGraphics( void ) {
line 1216
;1199:	// Navy Seals ++
;1200:	int			i;
;1201:
;1202:	static char		*sb_digital_nums[10] = {
;1203:		"models/misc/bombcase/digit_0",
;1204:		"models/misc/bombcase/digit_1",
;1205:		"models/misc/bombcase/digit_2",
;1206:		"models/misc/bombcase/digit_3",
;1207:		"models/misc/bombcase/digit_4",
;1208:		"models/misc/bombcase/digit_5",
;1209:		"models/misc/bombcase/digit_6",
;1210:		"models/misc/bombcase/digit_7",
;1211:		"models/misc/bombcase/digit_8",
;1212:		"models/misc/bombcase/digit_9",
;1213:	};	
;1214:
;1215:	// precache status bar pics
;1216:	CG_LoadingString( "Bombcase Graphics" );
ADDRGP4 $731
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1219
;1217:
;1218:
;1219:	for ( i = 0 ; i < 11 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $732
line 1220
;1220:		cgs.media.bombCaseDigitShaders[i] = trap_R_RegisterShader( va("models/misc/bombcase/digit_%i", i+1) );
ADDRGP4 $738
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+872
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1221
;1221:		if ( i < 8 )
ADDRLP4 0
INDIRI4
CNSTI4 8
GEI4 $739
line 1222
;1222:			cgs.media.bombCaseWireModels[i] = trap_R_RegisterModel( va("models/misc/bombcase/wire_%i.md3", i+1) );
ADDRGP4 $743
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+916
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
LABELV $739
line 1223
;1223:		if ( i < 3 )
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $744
line 1224
;1224:			cgs.media.bombCaseDigitModels[i] = trap_R_RegisterModel( va("models/misc/bombcase/digit_%i.md3", i+1) );
ADDRGP4 $748
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+860
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
LABELV $744
line 1225
;1225:	}
LABELV $733
line 1219
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $732
line 1227
;1226:	
;1227:	cgs.media.bombCaseWireShaders[0] = trap_R_RegisterShader( "models/misc/bombcase/wire_grey" );
ADDRGP4 $751
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+948
ADDRLP4 4
INDIRI4
ASGNI4
line 1228
;1228:	cgs.media.bombCaseWireShaders[1] = trap_R_RegisterShader( "models/misc/bombcase/wire_red" );
ADDRGP4 $755
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+948+4
ADDRLP4 8
INDIRI4
ASGNI4
line 1229
;1229:	cgs.media.bombCaseWireShaders[2] = trap_R_RegisterShader( "models/misc/bombcase/wire_green" );
ADDRGP4 $759
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+948+8
ADDRLP4 12
INDIRI4
ASGNI4
line 1231
;1230:
;1231:	cgs.media.bombCaseModel = trap_R_RegisterModel( "models/misc/bombcase/1stperson.md3" );
ADDRGP4 $762
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+960
ADDRLP4 16
INDIRI4
ASGNI4
line 1232
;1232:	cgs.media.bombCaseTangoSkin = trap_R_RegisterSkin( "models/misc/bombcase/bombcase_t.skin");
ADDRGP4 $765
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+205084+964
ADDRLP4 20
INDIRI4
ASGNI4
line 1233
;1233:}
LABELV $719
endproc CG_RegisterBombGraphics 40 8
data
align 4
LABELV $767
address $768
address $769
address $770
address $771
address $772
address $773
address $774
address $775
address $776
address $777
address $778
align 4
LABELV $779
address $780
address $781
address $782
address $783
address $784
address $785
address $786
address $787
address $788
address $789
address $790
align 4
LABELV $791
address $792
address $793
address $794
address $795
address $796
address $797
address $798
address $799
address $800
address $801
address $802
code
proc CG_RegisterGraphics 760 16
line 1241
;1234:/*
;1235:=================
;1236:CG_RegisterGraphics
;1237:
;1238:This function may execute for a couple of minutes with a slow disk.
;1239:=================
;1240:*/
;1241:static void CG_RegisterGraphics( void ) {
line 1288
;1242:	int			i;
;1243:	char		items[MAX_ITEMS+1];
;1244:	static char		*sb_nums[11] = {
;1245:		"gfx/2d/numbers/zero_32b",
;1246:		"gfx/2d/numbers/one_32b",
;1247:		"gfx/2d/numbers/two_32b",
;1248:		"gfx/2d/numbers/three_32b",
;1249:		"gfx/2d/numbers/four_32b",
;1250:		"gfx/2d/numbers/five_32b",
;1251:		"gfx/2d/numbers/six_32b",
;1252:		"gfx/2d/numbers/seven_32b",
;1253:		"gfx/2d/numbers/eight_32b",
;1254:		"gfx/2d/numbers/nine_32b",
;1255:		"gfx/2d/numbers/minus_32b",
;1256:	};
;1257:	// Navy Seals ++
;1258:	static char		*sb_digital_nums[11] = {
;1259:		"gfx/2d/hud/0",
;1260:		"gfx/2d/hud/1",
;1261:		"gfx/2d/hud/2",
;1262:		"gfx/2d/hud/3",
;1263:		"gfx/2d/hud/4",
;1264:		"gfx/2d/hud/5",
;1265:		"gfx/2d/hud/6",
;1266:		"gfx/2d/hud/7",
;1267:		"gfx/2d/hud/8",
;1268:		"gfx/2d/hud/9",
;1269:		"gfx/2d/hud/line",
;1270:	};
;1271:	static char		*sb_digital_nums_small[11] = {
;1272:		"gfx/2d/hud/timer/number_0",
;1273:		"gfx/2d/hud/timer/number_1",
;1274:		"gfx/2d/hud/timer/number_2",
;1275:		"gfx/2d/hud/timer/number_3",
;1276:		"gfx/2d/hud/timer/number_4",
;1277:		"gfx/2d/hud/timer/number_5",
;1278:		"gfx/2d/hud/timer/number_6",
;1279:		"gfx/2d/hud/timer/number_7",
;1280:		"gfx/2d/hud/timer/number_8",
;1281:		"gfx/2d/hud/timer/number_9",
;1282:		"gfx/2d/hud/timer/number_slash",
;1283:	};
;1284:
;1285:	// Navy Seals --
;1286:
;1287:	// clear any references to old media
;1288:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+109044
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1289
;1289:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 1291
;1290:
;1291:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+31480
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1293
;1292:
;1293:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31480
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 1295
;1294:
;1295:	CG_LoadingBarUpdate(15);
CNSTI4 15
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1298
;1296:// Navy Seals ++
;1297:	// precache status bar pics
;1298:	CG_LoadingString( "HUD Number Graphics" );
ADDRGP4 $807
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1300
;1299:
;1300:	for ( i=0 ; i<11 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $808
line 1301
;1301:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 $767
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 cgs+205084+120
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 1304
;1302:// defcon-x: cache digital numbers (for hud)
;1303:		// process digital numbers
;1304:		cgs.media.digitalNumberShaders[i] = trap_R_RegisterShaderNoMip( sb_digital_nums[i] );
ADDRLP4 272
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 272
INDIRI4
ADDRGP4 $779
ADDP4
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
ADDRGP4 cgs+205084+500
ADDP4
ADDRLP4 276
INDIRI4
ASGNI4
line 1305
;1305:		cgs.media.smalldigitalNumberShaders[i] = trap_R_RegisterShaderNoMip( sb_digital_nums_small[i] );
ADDRLP4 280
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 280
INDIRI4
ADDRGP4 $791
ADDP4
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
ADDRGP4 cgs+205084+456
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 1307
;1306:// defcon-x: end
;1307:	}
LABELV $809
line 1300
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $808
line 1308
;1308:	CG_LoadingString( "HUD Graphics" );
ADDRGP4 $818
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1320
;1309:
;1310:// defcon-x: cache vests
;1311:	/*
;1312:	for ( i=0 ; i<3 ; i++) {
;1313:		cgs.media.vestShaders[i] = trap_R_RegisterShaderNoMip( sb_vests[i] );
;1314:	}
;1315:	*/
;1316:// defcon-x: end
;1317:// defcon-x: cache hud graphics
;1318:	// cgs.media.bulletIcon = trap_R_RegisterShaderNoMip( "gfx/2d/hud/bullets.tga" );
;1319:
;1320:	cgs.media.clipIcon[0] = trap_R_RegisterShaderNoMip( "gfx/2d/hud/ammo_mag-clip.tga" );
ADDRGP4 $821
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+548
ADDRLP4 264
INDIRI4
ASGNI4
line 1321
;1321:	cgs.media.clipIcon[1] = trap_R_RegisterShaderNoMip( "gfx/2d/hud/ammo_mag-shell.tga" );
ADDRGP4 $825
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+548+4
ADDRLP4 268
INDIRI4
ASGNI4
line 1322
;1322:	cgs.media.clipIcon[2] = trap_R_RegisterShaderNoMip( "gfx/2d/hud/ammo_mag-gren-frag.tga" );
ADDRGP4 $829
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+548+8
ADDRLP4 272
INDIRI4
ASGNI4
line 1323
;1323:	cgs.media.clipIcon[3] = trap_R_RegisterShaderNoMip( "gfx/2d/hud/ammo_mag-gren-flash.tga" );
ADDRGP4 $833
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+548+12
ADDRLP4 276
INDIRI4
ASGNI4
line 1324
;1324:	cgs.media.clipIcon[4] = trap_R_RegisterShaderNoMip( "gfx/2d/hud/ammo_mag-gren-40mm.tga" );
ADDRGP4 $837
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+548+16
ADDRLP4 280
INDIRI4
ASGNI4
line 1332
;1325:
;1326:	
;1327://	cgs.media.vipIcon = trap_R_RegisterShaderNoMip( "ui/assets/vip.tga" );
;1328://	cgs.media.bombIcon = trap_R_RegisterShaderNoMip( "ui/assets/bomb_tango.tga" );
;1329://	cgs.media.assaultIcon = trap_R_RegisterShaderNoMip( "ui/assets/assault_active.tga" );
;1330:
;1331:	  
;1332:	cgs.media.clockIcon = trap_R_RegisterShaderNoMip( "gfx/2d/hud/clock.tga" );
ADDRGP4 $840
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+568
ADDRLP4 284
INDIRI4
ASGNI4
line 1333
;1333:	cgs.media.slashIcon = trap_R_RegisterShaderNoMip( "gfx/2d/hud/line.tga" );
ADDRGP4 $843
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+588
ADDRLP4 288
INDIRI4
ASGNI4
line 1334
;1334:	cgs.media.colonIcon = trap_R_RegisterShaderNoMip( "gfx/2d/hud/colon.tga" );
ADDRGP4 $846
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+572
ADDRLP4 292
INDIRI4
ASGNI4
line 1337
;1335://	cgs.media.healthIcon = trap_R_RegisterShaderNoMip( "gfx/2d/hud/health.tga" );
;1336:
;1337:	CG_LoadingString( "HUD Damage Locator" );
ADDRGP4 $847
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1339
;1338:
;1339:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1342
;1340:
;1341:	// damage locator
;1342:	cgs.media.loc_headIcon				=	trap_R_RegisterShaderNoMip( "gfx/2d/hud/loc/head.tga" );
ADDRGP4 $850
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+608
ADDRLP4 296
INDIRI4
ASGNI4
line 1343
;1343:	cgs.media.loc_leftArmIcon			=	trap_R_RegisterShaderNoMip( "gfx/2d/hud/loc/larm.tga" );
ADDRGP4 $853
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+612
ADDRLP4 300
INDIRI4
ASGNI4
line 1344
;1344:	cgs.media.loc_rightArmIcon			=	trap_R_RegisterShaderNoMip( "gfx/2d/hud/loc/rarm.tga" );
ADDRGP4 $856
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+616
ADDRLP4 304
INDIRI4
ASGNI4
line 1345
;1345:	cgs.media.loc_leftLegIcon			=	trap_R_RegisterShaderNoMip( "gfx/2d/hud/loc/lleg.tga" );
ADDRGP4 $859
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+620
ADDRLP4 308
INDIRI4
ASGNI4
line 1346
;1346:	cgs.media.loc_rightLegIcon			=	trap_R_RegisterShaderNoMip( "gfx/2d/hud/loc/rleg.tga" );
ADDRGP4 $862
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+624
ADDRLP4 312
INDIRI4
ASGNI4
line 1347
;1347:	cgs.media.loc_stomachIcon			=	trap_R_RegisterShaderNoMip( "gfx/2d/hud/loc/stomach.tga" );
ADDRGP4 $865
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+628
ADDRLP4 316
INDIRI4
ASGNI4
line 1348
;1348:	cgs.media.loc_chestIcon				=	trap_R_RegisterShaderNoMip( "gfx/2d/hud/loc/chest.tga" );
ADDRGP4 $868
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+632
ADDRLP4 320
INDIRI4
ASGNI4
line 1349
;1349:	cgs.media.loc_bodyLines				=	trap_R_RegisterShaderNoMip( "gfx/2d/hud/loc/loc_lines.tga" );
ADDRGP4 $871
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+636
ADDRLP4 324
INDIRI4
ASGNI4
line 1351
;1350:
;1351:	CG_LoadingString( "Ingame Graphics" );
ADDRGP4 $872
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1356
;1352:
;1353://	cgs.media.ingameMenuTopShader		=	trap_R_RegisterShaderNoMip ( "gfx/2d/ingame_top.tga" );
;1354://	cgs.media.ingameMenuBottomShader	=	trap_R_RegisterShaderNoMip ( "gfx/2d/ingame_bottom.tga" );
;1355://	cgs.media.rocketExplosionShader		=	trap_R_RegisterShader( "rocketExplosion3D" );
;1356:	cgs.media.laserShader				=	trap_R_RegisterShader ( "gfx/misc/laserpoint" );
ADDRGP4 $875
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+640
ADDRLP4 328
INDIRI4
ASGNI4
line 1357
;1357:	cgs.media.radioIcon					=	trap_R_RegisterShaderNoMip ( "gfx/misc/radio_talking" );
ADDRGP4 $878
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+644
ADDRLP4 332
INDIRI4
ASGNI4
line 1360
;1358:
;1359:	
;1360:	{		
line 1376
;1361:		/*char	colorbits[64];
;1362:
;1363:		trap_Cvar_VariableStringBuffer( "r_colorbits", colorbits, sizeof(colorbits) );
;1364:
;1365:		if ( atoi(colorbits) >= 32 )
;1366:		{
;1367:			cgs.media.sniperScopeShader[0]		=	trap_R_RegisterShaderNoMip ( "gfx/misc/scope_m4" );
;1368:      cgs.media.sniperScopeShader[1]    = trap_R_RegisterShaderNoMip ( "gfx/misc/scope_ak47" );
;1369:      cgs.media.sniperScopeShader[2]    = trap_R_RegisterShaderNoMip ( "gfx/misc/scope_m14" );
;1370:			cgs.media.sniperScopeShader[3]		=	trap_R_RegisterShaderNoMip ( "gfx/misc/scope_psg-1" );
;1371:			cgs.media.sniperScopeShader[4]		=	trap_R_RegisterShaderNoMip ( "gfx/misc/scope_macmillan" );
;1372:			cgs.media.sniperScopeShader[5]		=	trap_R_RegisterShaderNoMip ( "gfx/misc/scope_sl8sd" );
;1373:		}
;1374:		else 
;1375:		{*/
;1376:			cgs.media.sniperScopeShader[0]		=	trap_R_RegisterShaderNoMip ( "gfx/misc/scope_m4_16" );
ADDRGP4 $881
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+648
ADDRLP4 336
INDIRI4
ASGNI4
line 1377
;1377:      cgs.media.sniperScopeShader[1]    = trap_R_RegisterShaderNoMip ( "gfx/misc/scope_ak47_16" );
ADDRGP4 $885
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+648+4
ADDRLP4 340
INDIRI4
ASGNI4
line 1378
;1378:      cgs.media.sniperScopeShader[2]    = trap_R_RegisterShaderNoMip ( "gfx/misc/scope_m14_16" );
ADDRGP4 $889
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+648+8
ADDRLP4 344
INDIRI4
ASGNI4
line 1379
;1379:			cgs.media.sniperScopeShader[3]		=	trap_R_RegisterShaderNoMip ( "gfx/misc/scope_psg-1_16" );
ADDRGP4 $893
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+648+12
ADDRLP4 348
INDIRI4
ASGNI4
line 1380
;1380:			cgs.media.sniperScopeShader[4]		=	trap_R_RegisterShaderNoMip ( "gfx/misc/scope_macmillan_16" );
ADDRGP4 $897
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+648+16
ADDRLP4 352
INDIRI4
ASGNI4
line 1381
;1381:			cgs.media.sniperScopeShader[5]		=	trap_R_RegisterShaderNoMip ( "gfx/misc/scope_sl8sd_16" );
ADDRGP4 $901
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+648+20
ADDRLP4 356
INDIRI4
ASGNI4
line 1383
;1382:		//}
;1383:	}
line 1385
;1384:
;1385:	cgs.media.grenadeExplosionShader	=	trap_R_RegisterShader( "grenadeExplosion3D" );
ADDRGP4 $904
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+216
ADDRLP4 336
INDIRI4
ASGNI4
line 1386
;1386:	cgs.media.waterExplosionShader		=	trap_R_RegisterShader( "grenadeExplosion3Dwater" );
ADDRGP4 $907
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+224
ADDRLP4 340
INDIRI4
ASGNI4
line 1388
;1387:
;1388:	cgs.media.thermalGogglesShader		=	trap_R_RegisterShaderNoMip ( "gfx/misc/goggle_screen" );
ADDRGP4 $910
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+708
ADDRLP4 344
INDIRI4
ASGNI4
line 1389
;1389:	cgs.media.thermalGogglesNoise		=	trap_R_RegisterShader ( "gfx/misc/goggle_noise" );
ADDRGP4 $913
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+712
ADDRLP4 348
INDIRI4
ASGNI4
line 1390
;1390:	cgs.media.flashedSpot				=	trap_R_RegisterShader( "gfx/misc/ns_blindspot1");
ADDRGP4 $916
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+720
ADDRLP4 352
INDIRI4
ASGNI4
line 1392
;1391:
;1392:	cgs.media.flare						=	trap_R_RegisterShader("gfx/misc/corona");
ADDRGP4 $919
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+716
ADDRLP4 356
INDIRI4
ASGNI4
line 1393
;1393:	cgs.media.smallFlare				=	trap_R_RegisterShader("gfx/misc/flare1");
ADDRGP4 $922
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+724
ADDRLP4 360
INDIRI4
ASGNI4
line 1396
;1394:
;1395:
;1396:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1398
;1397:
;1398:	CG_LoadingString( "Blood Graphics" );
ADDRGP4 $923
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1401
;1399://	cgs.media.bloodHitShader = trap_R_RegisterShader( "bloodHit" );
;1400: 
;1401:	cgs.media.bloodparticleShaders[0] = trap_R_RegisterShader( "hit_blood1" );
ADDRGP4 $926
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+688
ADDRLP4 364
INDIRI4
ASGNI4
line 1402
;1402:	cgs.media.bloodparticleShaders[1] = trap_R_RegisterShader( "hit_blood2" );
ADDRGP4 $930
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+688+4
ADDRLP4 368
INDIRI4
ASGNI4
line 1403
;1403:	cgs.media.bloodparticleShaders[2] = trap_R_RegisterShader( "hit_blood3" );
ADDRGP4 $934
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+688+8
ADDRLP4 372
INDIRI4
ASGNI4
line 1404
;1404:	cgs.media.bloodparticleShaders[3] = trap_R_RegisterShader( "hit_blood4" );
ADDRGP4 $938
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+688+12
ADDRLP4 376
INDIRI4
ASGNI4
line 1405
;1405:	cgs.media.bloodparticleShaders[4] = trap_R_RegisterShader( "hit_blood5" ); 
ADDRGP4 $942
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+688+16
ADDRLP4 380
INDIRI4
ASGNI4
line 1407
;1406: 
;1407:	if ( cgs.gametype == GT_TEAM )
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $943
line 1408
;1408:		cgs.media.respawnShader = trap_R_RegisterShader( "powerups/blueflag" );
ADDRGP4 $948
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+968
ADDRLP4 384
INDIRI4
ASGNI4
LABELV $943
line 1413
;1409:
;1410:	//
;1411:	// lensflare
;1412:	//
;1413:	CG_LoadingString( "Lensflare Graphics" );
ADDRGP4 $949
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1415
;1414:
;1415:	cgs.media.flare_circle_blue = trap_R_RegisterShader("circle_blue");
ADDRGP4 $952
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+428
ADDRLP4 388
INDIRI4
ASGNI4
line 1416
;1416:	cgs.media.flare_circle_fadein = trap_R_RegisterShader("circle_fadein");
ADDRGP4 $955
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+432
ADDRLP4 392
INDIRI4
ASGNI4
line 1417
;1417:	cgs.media.flare_flare_green = trap_R_RegisterShader("flare_green");
ADDRGP4 $958
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+436
ADDRLP4 396
INDIRI4
ASGNI4
line 1418
;1418:	cgs.media.flare_flare_turkis = trap_R_RegisterShader("flare_turkis");
ADDRGP4 $961
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+440
ADDRLP4 400
INDIRI4
ASGNI4
line 1419
;1419:	cgs.media.flare_circle_green = trap_R_RegisterShader("circle_green");
ADDRGP4 $964
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+444
ADDRLP4 404
INDIRI4
ASGNI4
line 1420
;1420:	cgs.media.flare_circle_orange = trap_R_RegisterShader("circle_orange");
ADDRGP4 $967
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+448
ADDRLP4 408
INDIRI4
ASGNI4
line 1421
;1421:	cgs.media.flare_circle_rainbow = trap_R_RegisterShader("circle_rainbow");
ADDRGP4 $970
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+452
ADDRLP4 412
INDIRI4
ASGNI4
line 1423
;1422:
;1423: 	CG_LoadingString( "Graphics" );
ADDRGP4 $971
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1425
;1424:
;1425:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $974
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1076
ADDRLP4 416
INDIRI4
ASGNI4
line 1429
;1426:
;1427://	cgs.media.ammoMag_back = trap_R_RegisterShader( "gfx/2d/hud/ammo_mag.tga" );
;1428:
;1429:	cgs.media.ammoMag_bullet[0] = trap_R_RegisterShader( "gfx/2d/hud/ammo_bullet-pistol.tga" );
ADDRGP4 $977
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+776
ADDRLP4 420
INDIRI4
ASGNI4
line 1430
;1430:	cgs.media.ammoMag_bullet[1] = trap_R_RegisterShader( "gfx/2d/hud/ammo_bullet-rifle.tga" );
ADDRGP4 $981
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+776+4
ADDRLP4 424
INDIRI4
ASGNI4
line 1431
;1431:	cgs.media.ammoMag_bullet[2] = trap_R_RegisterShader( "gfx/2d/hud/ammo_bullet-shotgun.tga" );
ADDRGP4 $985
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+776+8
ADDRLP4 428
INDIRI4
ASGNI4
line 1435
;1432:
;1433:
;1434:	// bombspot in this map, so register bombcase
;1435:	if ( cgs.mi_bombSpot )
ADDRGP4 cgs+214172
INDIRI4
CNSTI4 0
EQI4 $986
line 1436
;1436:		CG_RegisterBombGraphics( );
ADDRGP4 CG_RegisterBombGraphics
CALLV
pop
LABELV $986
line 1438
;1437:
;1438:	CG_LoadingBarUpdate(10);
CNSTI4 10
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1447
;1439:
;1440:	///
;1441:	/// Bloodpool
;1442:	///
;1443:	/*
;1444:	for ( i = 0 ; i < 5 ; i++ ) {
;1445:		cgs.media.ammoMag_stripes[i] = trap_R_RegisterShader( va("gfx/2d/hud/ammo_stripes_%i", i+1) );
;1446:	} */
;1447:	for ( i = 0 ; i < 15 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $989
line 1448
;1448:		cgs.media.ns_bloodStain[i] = trap_R_RegisterShader( va("gfx/damage/blood/ns_blood_stain_%i.tga", i+1) );
ADDRGP4 $995
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 436
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+324
ADDP4
ADDRLP4 440
INDIRI4
ASGNI4
line 1449
;1449:	}
LABELV $990
line 1447
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $989
line 1450
;1450:	for ( i = 0 ; i < 5 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $996
line 1451
;1451:		cgs.media.ns_brainStain[i] = trap_R_RegisterShader( va("gfx/damage/blood/ns_brain_stain_%i.tga", i+1) );
ADDRGP4 $1002
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 436
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+404
ADDP4
ADDRLP4 440
INDIRI4
ASGNI4
line 1452
;1452:	}	
LABELV $997
line 1450
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $996
line 1453
;1453:	for ( i = 0 ; i < 5 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1003
line 1454
;1454:		cgs.media.ns_bloodStainSmall[i] = trap_R_RegisterShader( va("gfx/damage/blood/ns_blood_stain_small_%i.tga", i+1) );
ADDRGP4 $1009
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 436
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+384
ADDP4
ADDRLP4 440
INDIRI4
ASGNI4
line 1455
;1455:	}	
LABELV $1004
line 1453
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $1003
line 1457
;1456:	
;1457:	cgs.media.ns_bloodPool = trap_R_RegisterShader( "gfx/damage/blood/ns_blood_pool.tga" );
ADDRGP4 $1012
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+424
ADDRLP4 432
INDIRI4
ASGNI4
line 1462
;1458:	 
;1459:	//
;1460:	// Inventory
;1461:	//
;1462:	for ( i = 0 ; i < 5 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1013
line 1463
;1463:		cgs.media.weaponMenuActive[i] = trap_R_RegisterShader( va("icons/menu_%i_active.tga", i+1) );
ADDRGP4 $1019
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+812
ADDP4
ADDRLP4 444
INDIRI4
ASGNI4
line 1464
;1464:	}
LABELV $1014
line 1462
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $1013
line 1465
;1465:	for ( i = 0 ; i < 5 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1020
line 1466
;1466:		cgs.media.weaponMenuInactive[i] = trap_R_RegisterShader( va("icons/menu_%i_inactive.tga", i+1) );
ADDRGP4 $1026
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+832
ADDP4
ADDRLP4 444
INDIRI4
ASGNI4
line 1467
;1467:	}
LABELV $1021
line 1465
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $1020
line 1468
;1468:	cgs.media.weaponSelInactiveBig = trap_R_RegisterShader( "icons/menu_item_inactive.tga" );
ADDRGP4 $1029
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+852
ADDRLP4 436
INDIRI4
ASGNI4
line 1469
;1469:	cgs.media.weaponSelInactiveSmall = trap_R_RegisterShader( "icons/menu_item_inactive_small.tga" );
ADDRGP4 $1032
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+856
ADDRLP4 440
INDIRI4
ASGNI4
line 1471
;1470:   
;1471:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1482
;1472:
;1473:	// precache status bar pics   
;1474://	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
;1475://	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
;1476://	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
;1477://	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
;1478://	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
;1479:
;1480://	cgs.media.viewBloodShader = trap_R_RegisterShader( "ns_viewBloodBlend" );
;1481:
;1482:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $1035
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+24
ADDRLP4 444
INDIRI4
ASGNI4
line 1484
;1483:  
;1484:	cgs.media.smokePuffShader = trap_R_RegisterShader( "ns_smokePuff" );
ADDRGP4 $1038
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+104
ADDRLP4 448
INDIRI4
ASGNI4
line 1485
;1485:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "ns_smokePuffRagePro" );
ADDRGP4 $1041
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+108
ADDRLP4 452
INDIRI4
ASGNI4
line 1486
;1486:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "ns_shotgunSmokePuff" );
ADDRGP4 $1044
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+112
ADDRLP4 456
INDIRI4
ASGNI4
line 1488
;1487:
;1488:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $1047
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+96
ADDRLP4 460
INDIRI4
ASGNI4
line 1489
;1489:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $1050
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+40
ADDRLP4 464
INDIRI4
ASGNI4
line 1491
;1490:
;1491:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $1053
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+116
ADDRLP4 468
INDIRI4
ASGNI4
line 1493
;1492:
;1493:	cgs.media.metalsparkShader = trap_R_RegisterShader( "gfx/misc/ns_metal_sparks" );
ADDRGP4 $1056
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1084
ADDRLP4 472
INDIRI4
ASGNI4
line 1494
;1494:	cgs.media.sparkShader = trap_R_RegisterShader( "gfx/misc/ns_sparks" );
ADDRGP4 $1059
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1080
ADDRLP4 476
INDIRI4
ASGNI4
line 1495
;1495:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $1062
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+52
ADDRLP4 480
INDIRI4
ASGNI4
line 1498
;1496://	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
;1497:
;1498:	for ( i = 0 ; i < NUM_CROSSHAIRS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1063
line 1499
;1499:		cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $1069
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 488
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 488
INDIRP4
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+56
ADDP4
ADDRLP4 492
INDIRI4
ASGNI4
line 1500
;1500:	}
LABELV $1064
line 1498
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $1063
line 1502
;1501:
;1502:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" ); 
ADDRGP4 $1072
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+100
ADDRLP4 484
INDIRI4
ASGNI4
line 1504
;1503:
;1504:	cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" ); 
ADDRGP4 $1075
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+20
ADDRLP4 488
INDIRI4
ASGNI4
line 1506
;1505:
;1506:	CG_LoadingBarUpdate(10);
CNSTI4 10
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1519
;1507:
;1508://	cgs.media.gibArm = trap_R_RegisterModel( "models/gibs/arm.md3" );
;1509://	cgs.media.gibChest = trap_R_RegisterModel( "models/gibs/chest.md3" );
;1510://	cgs.media.gibFist = trap_R_RegisterModel( "models/gibs/fist.md3" );
;1511://	cgs.media.gibFoot = trap_R_RegisterModel( "models/gibs/foot.md3" );
;1512://	cgs.media.gibForearm = trap_R_RegisterModel( "models/gibs/forearm.md3" );
;1513://	cgs.media.gibIntestine = trap_R_RegisterModel( "models/gibs/intestine.md3" );
;1514://	cgs.media.gibLeg = trap_R_RegisterModel( "models/gibs/leg.md3" );
;1515://	cgs.media.gibSkull = trap_R_RegisterModel( "models/gibs/skull.md3" );
;1516://	cgs.media.gibBrain = trap_R_RegisterModel( "models/gibs/brain.md3" );
;1517:
;1518://	cgs.media.smoke2 = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
;1519:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $1078
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+36
ADDRLP4 492
INDIRI4
ASGNI4
line 1520
;1520:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $1081
ARGP4
ADDRLP4 496
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+220
ADDRLP4 496
INDIRI4
ASGNI4
line 1521
;1521:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $1084
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+204
ADDRLP4 500
INDIRI4
ASGNI4
line 1526
;1522: 
;1523://	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/misc/telep.md3" );
;1524://	cgs.media.teleportEffectShader = trap_R_RegisterShader( "teleportEffect" );
;1525: 
;1526:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1527
;1527:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15392
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1530
;1528:
;1529:	// only register the items that the server says we need
;1530:	strcpy( items, CG_ConfigString( CS_ITEMS) );
CNSTI4 27
ARGI4
ADDRLP4 504
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 504
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1544
;1531:
;1532:	
;1533:#if 0 // def: precache weapons when finished connecting!
;1534:	for ( i = 1 ; i < bg_numItems ; i++ ) {
;1535:		if ( items[ i ] == '1' /* || cg_buildScript.integer */  ) {
;1536:			CG_LoadingItem( i );
;1537:			
;1538:			CG_RegisterItemVisuals( i );
;1539:		}
;1540:	}
;1541:#endif
;1542:
;1543:	// wall marks 	
;1544:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $1087
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+200
ADDRLP4 508
INDIRI4
ASGNI4
line 1545
;1545:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "ns_wake" ); 
ADDRGP4 $1090
ARGP4
ADDRLP4 512
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+184
ADDRLP4 512
INDIRI4
ASGNI4
line 1552
;1546:
;1547:	// SEALS START 
;1548:
;1549://	cgs.media.ammoMag = trap_R_RegisterModel("models/props/ammo_mag.md3");
;1550://	cgs.media.ammoShell = trap_R_RegisterModel("models/props/ammo_shell.md3");
;1551:	
;1552:	cgs.media.woodSmall = trap_R_RegisterModel( "models/props/wood_small.md3" );
ADDRGP4 $1093
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+244
ADDRLP4 516
INDIRI4
ASGNI4
line 1553
;1553:	cgs.media.woodMedium = trap_R_RegisterModel( "models/props/wood_medium.md3" );
ADDRGP4 $1096
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+248
ADDRLP4 520
INDIRI4
ASGNI4
line 1554
;1554:	cgs.media.woodBig = trap_R_RegisterModel( "models/props/wood_big.md3" );
ADDRGP4 $1099
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+252
ADDRLP4 524
INDIRI4
ASGNI4
line 1556
;1555:
;1556:	cgs.media.glassSmall = trap_R_RegisterModel( "models/props/glass_small.md3" );
ADDRGP4 $1102
ARGP4
ADDRLP4 528
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+256
ADDRLP4 528
INDIRI4
ASGNI4
line 1557
;1557:	cgs.media.glassMedium = trap_R_RegisterModel( "models/props/glass_medium.md3" );
ADDRGP4 $1105
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+260
ADDRLP4 532
INDIRI4
ASGNI4
line 1558
;1558:	cgs.media.glassBig = trap_R_RegisterModel( "models/props/glass_big.md3" );
ADDRGP4 $1108
ARGP4
ADDRLP4 536
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+264
ADDRLP4 536
INDIRI4
ASGNI4
line 1560
;1559:
;1560:	cgs.media.metalSmall = trap_R_RegisterModel( "models/props/metal_small.md3" );
ADDRGP4 $1111
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+268
ADDRLP4 540
INDIRI4
ASGNI4
line 1561
;1561:	cgs.media.metalMedium = trap_R_RegisterModel( "models/props/metal_medium.md3" );
ADDRGP4 $1114
ARGP4
ADDRLP4 544
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+272
ADDRLP4 544
INDIRI4
ASGNI4
line 1562
;1562:	cgs.media.metalBig = trap_R_RegisterModel( "models/props/metal_big.md3" );
ADDRGP4 $1117
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+276
ADDRLP4 548
INDIRI4
ASGNI4
line 1564
;1563:
;1564:	cgs.media.stoneSmall = trap_R_RegisterModel( "models/props/stone_small.md3" );
ADDRGP4 $1120
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+280
ADDRLP4 552
INDIRI4
ASGNI4
line 1565
;1565:	cgs.media.stoneMedium = trap_R_RegisterModel( "models/props/stone_medium.md3" );
ADDRGP4 $1123
ARGP4
ADDRLP4 556
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+284
ADDRLP4 556
INDIRI4
ASGNI4
line 1566
;1566:	cgs.media.stoneBig = trap_R_RegisterModel( "models/props/stone_big.md3" );
ADDRGP4 $1126
ARGP4
ADDRLP4 560
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+288
ADDRLP4 560
INDIRI4
ASGNI4
line 1568
;1567:
;1568:	cgs.media.nullModel = trap_R_RegisterModel("models/props/null.md3");
ADDRGP4 $1129
ARGP4
ADDRLP4 564
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+292
ADDRLP4 564
INDIRI4
ASGNI4
line 1570
;1569:	
;1570:	cgs.media.woodSplinter = trap_R_RegisterModel("models/props/wood_splinter.md3");
ADDRGP4 $1132
ARGP4
ADDRLP4 568
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+760
ADDRLP4 568
INDIRI4
ASGNI4
line 1571
;1571:	cgs.media.glassSplinter = trap_R_RegisterModel("models/props/glass_splinter.md3");
ADDRGP4 $1135
ARGP4
ADDRLP4 572
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+764
ADDRLP4 572
INDIRI4
ASGNI4
line 1572
;1572:	cgs.media.softSplinter = trap_R_RegisterModel("models/props/soft_chip.md3");
ADDRGP4 $1138
ARGP4
ADDRLP4 576
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+768
ADDRLP4 576
INDIRI4
ASGNI4
line 1574
;1573:	// 
;1574:	cgs.media.ns_bloodtrailShader = trap_R_RegisterShader( "ns_bloodTrail" ); 
ADDRGP4 $1141
ARGP4
ADDRLP4 580
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+296
ADDRLP4 580
INDIRI4
ASGNI4
line 1576
;1575:
;1576:	cgs.media.briefcaseModel =	trap_R_RegisterModel ( "models/misc/suitcase/suitcase.md3" );
ADDRGP4 $1144
ARGP4
ADDRLP4 584
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+676
ADDRLP4 584
INDIRI4
ASGNI4
line 1577
;1577: 	cgs.media.briefcaseModel_vweap =	trap_R_RegisterModel ( "models/misc/suitcase/suitcase_vweap.md3" );
ADDRGP4 $1147
ARGP4
ADDRLP4 588
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+680
ADDRLP4 588
INDIRI4
ASGNI4
line 1579
;1578:
;1579:	cgs.media.gibHeadShotBlown = trap_R_RegisterModel("models/misc/blownheads/stump.md3");
ADDRGP4 $1150
ARGP4
ADDRLP4 592
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+308
ADDRLP4 592
INDIRI4
ASGNI4
line 1580
;1580:	cgs.media.gibHeadShotFace  = trap_R_RegisterModel("models/misc/blownheads/faceshot.md3");
ADDRGP4 $1153
ARGP4
ADDRLP4 596
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+300
ADDRLP4 596
INDIRI4
ASGNI4
line 1581
;1581:	cgs.media.gibHeadShotNeck  = trap_R_RegisterModel("models/misc/blownheads/neckshot.md3");
ADDRGP4 $1156
ARGP4
ADDRLP4 600
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+304
ADDRLP4 600
INDIRI4
ASGNI4
line 1583
;1582:
;1583:	cgs.media.shellRifle = trap_R_RegisterModel("models/misc/shells/shell_rifle.md3");
ADDRGP4 $1159
ARGP4
ADDRLP4 604
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+312
ADDRLP4 604
INDIRI4
ASGNI4
line 1584
;1584:	cgs.media.shellPistol = trap_R_RegisterModel("models/misc/shells/shell_pistol.md3");
ADDRGP4 $1162
ARGP4
ADDRLP4 608
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+316
ADDRLP4 608
INDIRI4
ASGNI4
line 1585
;1585:	cgs.media.shellShotgun = trap_R_RegisterModel("models/misc/shells/shell_shotgun.md3");
ADDRGP4 $1165
ARGP4
ADDRLP4 612
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+320
ADDRLP4 612
INDIRI4
ASGNI4
line 1587
;1586:
;1587:	cgs.media.sphereFlashModel = trap_R_RegisterModel("models/weaphits/sphere.md3");
ADDRGP4 $1168
ARGP4
ADDRLP4 616
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+672
ADDRLP4 616
INDIRI4
ASGNI4
line 1589
;1588:
;1589:	CG_LoadingBarUpdate(10);
CNSTI4 10
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1594
;1590:
;1591:	//
;1592:	// head
;1593:	//  
;1594: 	cgs.media.playerSealHelmet[0] = trap_R_RegisterModel("models/players/heads/accessoires/helmet_s_desert.md3");
ADDRGP4 $1171
ARGP4
ADDRLP4 620
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+728
ADDRLP4 620
INDIRI4
ASGNI4
line 1595
;1595:	cgs.media.playerSealHelmet[1] = trap_R_RegisterModel("models/players/heads/accessoires/helmet_s_jungle.md3");
ADDRGP4 $1175
ARGP4
ADDRLP4 624
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+728+4
ADDRLP4 624
INDIRI4
ASGNI4
line 1596
;1596:	cgs.media.playerSealHelmet[2] = trap_R_RegisterModel("models/players/heads/accessoires/helmet_s_arctic.md3");
ADDRGP4 $1179
ARGP4
ADDRLP4 628
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+728+8
ADDRLP4 628
INDIRI4
ASGNI4
line 1597
;1597:	cgs.media.playerSealHelmet[3] = trap_R_RegisterModel("models/players/heads/accessoires/helmet_s_urban.md3");
ADDRGP4 $1183
ARGP4
ADDRLP4 632
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+728+12
ADDRLP4 632
INDIRI4
ASGNI4
line 1598
;1598:	cgs.media.playerTangoHelmet[0] = trap_R_RegisterModel("models/players/heads/accessoires/helmet_t_desert.md3");
ADDRGP4 $1186
ARGP4
ADDRLP4 636
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+744
ADDRLP4 636
INDIRI4
ASGNI4
line 1599
;1599:	cgs.media.playerTangoHelmet[1] = trap_R_RegisterModel("models/players/heads/accessoires/helmet_t_jungle.md3");
ADDRGP4 $1190
ARGP4
ADDRLP4 640
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+744+4
ADDRLP4 640
INDIRI4
ASGNI4
line 1600
;1600:	cgs.media.playerTangoHelmet[2] = trap_R_RegisterModel("models/players/heads/accessoires/helmet_t_arctic.md3");
ADDRGP4 $1194
ARGP4
ADDRLP4 644
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+744+8
ADDRLP4 644
INDIRI4
ASGNI4
line 1601
;1601:	cgs.media.playerTangoHelmet[3] = trap_R_RegisterModel("models/players/heads/accessoires/helmet_t_urban.md3");
ADDRGP4 $1198
ARGP4
ADDRLP4 648
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+205084+744+12
ADDRLP4 648
INDIRI4
ASGNI4
line 1606
;1602: 
;1603://	cgs.media.playerSniperscap = trap_R_RegisterModel("models/players/heads/accesoires/cappy.md3");
;1604://	cgs.media.playerheadScarp = trap_R_RegisterModel("models/players/heads/accesoires/scarf.md3");
;1605:	
;1606:	CG_LoadingBarUpdate(10);
CNSTI4 10
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1608
;1607:
;1608:	for (i=0;i<5;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1199
line 1609
;1609:	{
line 1610
;1610:		cgs.media.bulletholes[BHOLE_NORMAL][i] = trap_R_RegisterShader( va("gfx/damage/bhole_stone_%i",i+1) );
ADDRGP4 $1205
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 660
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100
ADDP4
ADDRLP4 660
INDIRI4
ASGNI4
line 1611
;1611:		cgs.media.bulletholes[BHOLE_GLASS][i] = trap_R_RegisterShader( va("gfx/damage/bhole_glass_%i",i+1) );
ADDRGP4 $1209
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 668
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 668
INDIRP4
ARGP4
ADDRLP4 672
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100+20
ADDP4
ADDRLP4 672
INDIRI4
ASGNI4
line 1612
;1612:		cgs.media.bulletholes[BHOLE_METAL][i] = trap_R_RegisterShader( va("gfx/damage/bhole_metal_%i",i+1) );
ADDRGP4 $1213
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 680
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 680
INDIRP4
ARGP4
ADDRLP4 684
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100+40
ADDP4
ADDRLP4 684
INDIRI4
ASGNI4
line 1613
;1613:		cgs.media.bulletholes[BHOLE_SAND][i] = trap_R_RegisterShader( va("gfx/damage/bhole_sand_%i",i+1) );
ADDRGP4 $1217
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 692
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 692
INDIRP4
ARGP4
ADDRLP4 696
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100+60
ADDP4
ADDRLP4 696
INDIRI4
ASGNI4
line 1614
;1614:		cgs.media.bulletholes[BHOLE_SNOW][i] = trap_R_RegisterShader( va("gfx/damage/bhole_snow_%i",i+1) );
ADDRGP4 $1221
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 704
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 704
INDIRP4
ARGP4
ADDRLP4 708
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100+80
ADDP4
ADDRLP4 708
INDIRI4
ASGNI4
line 1615
;1615:		cgs.media.bulletholes[BHOLE_SOFT][i] = trap_R_RegisterShader( va("gfx/damage/bhole_soft_%i",i+1) );
ADDRGP4 $1225
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 716
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 716
INDIRP4
ARGP4
ADDRLP4 720
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100+100
ADDP4
ADDRLP4 720
INDIRI4
ASGNI4
line 1616
;1616:		cgs.media.bulletholes[BHOLE_WOOD][i] = trap_R_RegisterShader( va("gfx/damage/bhole_wood_%i",i+1) );
ADDRGP4 $1229
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 728
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 728
INDIRP4
ARGP4
ADDRLP4 732
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100+120
ADDP4
ADDRLP4 732
INDIRI4
ASGNI4
line 1618
;1617:
;1618:		cgs.media.bulletholes[BHOLE_STONE][i] = trap_R_RegisterShader( va("gfx/damage/bhole_stone_%i",i+1) );
ADDRGP4 $1205
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 740
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 740
INDIRP4
ARGP4
ADDRLP4 744
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100+140
ADDP4
ADDRLP4 744
INDIRI4
ASGNI4
line 1619
;1619:		cgs.media.bulletholes[BHOLE_DIRT][i] = trap_R_RegisterShader( va("gfx/damage/bhole_dirt_%i",i+1) );
ADDRGP4 $1236
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 752
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 752
INDIRP4
ARGP4
ADDRLP4 756
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+1100+160
ADDP4
ADDRLP4 756
INDIRI4
ASGNI4
line 1620
;1620:	}  
LABELV $1200
line 1608
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $1199
line 1622
;1621:
;1622:	for (i=0;i<3;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1237
line 1623
;1623:	{
line 1624
;1624:		cgs.media.burnMarkShaders[i] = trap_R_RegisterShader( va("gfx/damage/bhole_explo_%i",i+1) );
ADDRGP4 $1243
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 660
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+205084+188
ADDP4
ADDRLP4 660
INDIRI4
ASGNI4
line 1625
;1625:	}
LABELV $1238
line 1622
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1237
line 1628
;1626:
;1627:	// register the inline models
;1628:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 652
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+34564
ADDRLP4 652
INDIRI4
ASGNI4
line 1629
;1629:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1248
JUMPV
LABELV $1245
line 1634
;1630:		char	name[10];
;1631:		vec3_t			mins, maxs;
;1632:		int				j;
;1633:
;1634:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 684
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $1250
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1635
;1635:		cgs.inlineDrawModel[i] = trap_R_RegisterModel( name );
ADDRLP4 684
ARGP4
ADDRLP4 696
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34568
ADDP4
ADDRLP4 696
INDIRI4
ASGNI4
line 1636
;1636:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34568
ADDP4
INDIRI4
ARGI4
ADDRLP4 660
ARGP4
ADDRLP4 672
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 1637
;1637:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 656
CNSTI4 0
ASGNI4
LABELV $1253
line 1638
;1638:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
ADDRLP4 700
ADDRLP4 656
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 704
ADDRLP4 700
INDIRI4
ADDRLP4 660
ADDP4
INDIRF4
ASGNF4
ADDRLP4 700
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+35592
ADDP4
ADDP4
ADDRLP4 704
INDIRF4
CNSTF4 1056964608
ADDRLP4 700
INDIRI4
ADDRLP4 672
ADDP4
INDIRF4
ADDRLP4 704
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1639
;1639:		}
LABELV $1254
line 1637
ADDRLP4 656
ADDRLP4 656
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 3
LTI4 $1253
line 1640
;1640:	}
LABELV $1246
line 1629
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1248
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+34564
INDIRI4
LTI4 $1245
line 1641
;1641:	CG_LoadingBarUpdate(10);
CNSTI4 10
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1644
;1642:
;1643:	// register all the server specified models
;1644:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1258
line 1647
;1645:		const char		*modelName;
;1646:
;1647:		modelName = CG_ConfigString( CS_MODELS+i );
ADDRLP4 0
INDIRI4
CNSTI4 36
ADDI4
ARGI4
ADDRLP4 660
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 656
ADDRLP4 660
INDIRP4
ASGNP4
line 1648
;1648:		if ( !modelName[0] ) {
ADDRLP4 656
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1262
line 1649
;1649:			break;
ADDRGP4 $1260
JUMPV
LABELV $1262
line 1651
;1650:		}
;1651:		cgs.gameModels[i] = trap_R_RegisterModel( modelName );
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32516
ADDP4
ADDRLP4 664
INDIRI4
ASGNI4
line 1652
;1652:	}
LABELV $1259
line 1644
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1258
LABELV $1260
line 1654
;1653:
;1654:	CG_LoadingBarUpdate(10);
CNSTI4 10
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 1657
;1655:
;1656: 	// new stuff
;1657: 	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $1267
ARGP4
ADDRLP4 656
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1088
ADDRLP4 656
INDIRI4
ASGNI4
line 1658
;1658:	cgs.media.sizeCursor = trap_R_RegisterShaderNoMip( "ui/assets/sizecursor.tga" );
ADDRGP4 $1270
ARGP4
ADDRLP4 660
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1092
ADDRLP4 660
INDIRI4
ASGNI4
line 1659
;1659:	cgs.media.selectCursor = trap_R_RegisterShaderNoMip( "ui/assets/selectcursor.tga" );
ADDRGP4 $1273
ARGP4
ADDRLP4 664
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+1096
ADDRLP4 664
INDIRI4
ASGNI4
line 1661
;1660:
;1661:}
LABELV $766
endproc CG_RegisterGraphics 760 16
data
export ticks
align 4
LABELV ticks
byte 4 0
export CG_PrecacheWeapons
code
proc CG_PrecacheWeapons 276 12
line 1672
;1662:
;1663:/*																																			
;1664:=======================
;1665:CG_PrecacheWeapons
;1666:
;1667:register all weapons (done after loading map and finished connecting)
;1668:=======================
;1669:*/
;1670:int ticks = 0; 
;1671:
;1672:void CG_PrecacheWeapons( ) {
line 1676
;1673:	int i;
;1674:	char		items[MAX_ITEMS+1]; 
;1675:
;1676:	if ( ticks > cg_timetocache.integer )
ADDRGP4 ticks
INDIRI4
ADDRGP4 cg_timetocache+12
INDIRI4
LEI4 $1275
line 1677
;1677:		return;
ADDRGP4 $1274
JUMPV
LABELV $1275
line 1679
;1678:
;1679:	if ( !cg.snap || !cg.snap->ps.persistant )
ADDRLP4 264
CNSTU4 0
ASGNU4
ADDRGP4 cg+36
INDIRP4
CVPU4 4
ADDRLP4 264
INDIRU4
EQU4 $1282
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
CVPU4 4
ADDRLP4 264
INDIRU4
NEU4 $1278
LABELV $1282
line 1680
;1680:		return;
ADDRGP4 $1274
JUMPV
LABELV $1278
line 1682
;1681: 
;1682:	ticks++;
ADDRLP4 268
ADDRGP4 ticks
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1684
;1683:
;1684:	if ( ticks == cg_timetocache.integer - 50 )
ADDRGP4 ticks
INDIRI4
ADDRGP4 cg_timetocache+12
INDIRI4
CNSTI4 50
SUBI4
NEI4 $1283
line 1685
;1685:		CG_CenterPrint( "Precaching Weapons", SCREEN_HEIGHT * 0.30, cg_newbeeHeight.value );
ADDRGP4 $1286
ARGP4
CNSTI4 143
ARGI4
ADDRGP4 cg_newbeeHeight+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
LABELV $1283
line 1686
;1686:	if ( ticks < cg_timetocache.integer )
ADDRGP4 ticks
INDIRI4
ADDRGP4 cg_timetocache+12
INDIRI4
GEI4 $1288
line 1687
;1687:		return;
ADDRGP4 $1274
JUMPV
LABELV $1288
line 1690
;1688:  
;1689:	// only register the weapons that the server says we need
;1690:	strcpy( items, CG_ConfigString( CS_ITEMS ) ); 
CNSTI4 27
ARGI4
ADDRLP4 272
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1692
;1691:
;1692:	for ( i = 1 ; i < WP_NUM_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1291
line 1694
;1693:		// if ( i == WP_NUTSHELL )	continue;
;1694:		CG_RegisterWeapon( i ); 
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 1695
;1695:	}
LABELV $1292
line 1692
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $1291
line 1696
;1696:}
LABELV $1274
endproc CG_PrecacheWeapons 276 12
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 16 16
line 1704
;1697:
;1698:/*																																			
;1699:=======================
;1700:CG_BuildSpectatorString
;1701:
;1702:=======================
;1703:*/
;1704:void CG_BuildSpectatorString() {
line 1706
;1705:	int i;
;1706:	cg.spectatorList[0] = 0;
ADDRGP4 cg+112940
CNSTI1 0
ASGNI1
line 1707
;1707:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1297
line 1708
;1708:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
ADDRLP4 4
CNSTI4 2484
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+38664
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1301
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+38664+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1301
line 1709
;1709:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s%s%s     ",S_COLOR_WHITE, cgs.clientinfo[i].name,S_COLOR_WHITE));
ADDRGP4 $1308
ARGP4
ADDRLP4 8
ADDRGP4 $1309
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 2484
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+38664+4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 cg+112940
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1710
;1710:		}
LABELV $1301
line 1711
;1711:	}
LABELV $1298
line 1707
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1297
line 1712
;1712:	i = strlen(cg.spectatorList);
ADDRGP4 cg+112940
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1713
;1713:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+113964
INDIRI4
EQI4 $1313
line 1714
;1714:		cg.spectatorLen = i;
ADDRGP4 cg+113964
ADDRLP4 0
INDIRI4
ASGNI4
line 1715
;1715:		cg.spectatorWidth = -1;
ADDRGP4 cg+113968
CNSTF4 3212836864
ASGNF4
line 1716
;1716:	}
LABELV $1313
line 1717
;1717:}
LABELV $1295
endproc CG_BuildSpectatorString 16 16
proc CG_RegisterClients 12 4
line 1725
;1718:
;1719:
;1720:/*																																			
;1721:===================
;1722:CG_RegisterClients
;1723:===================
;1724:*/
;1725:static void CG_RegisterClients( void ) {
line 1728
;1726:	int		i;
;1727:
;1728:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1729
;1729:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1731
;1730:
;1731:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1321
line 1734
;1732:		const char		*clientInfo;
;1733:
;1734:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1325
line 1735
;1735:			continue;
ADDRGP4 $1322
JUMPV
LABELV $1325
line 1738
;1736:		}
;1737:
;1738:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
ADDRLP4 0
INDIRI4
CNSTI4 548
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1739
;1739:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1328
line 1740
;1740:			continue;
ADDRGP4 $1322
JUMPV
LABELV $1328
line 1742
;1741:		}
;1742:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1743
;1743:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1744
;1744:	}
LABELV $1322
line 1731
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1321
line 1745
;1745:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1746
;1746:}
LABELV $1318
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1755
;1747:
;1748://===========================================================================
;1749:
;1750:/*
;1751:=================
;1752:CG_ConfigString
;1753:=================
;1754:*/
;1755:const char *CG_ConfigString( int index ) {
line 1756
;1756:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1333
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1331
LABELV $1333
line 1757
;1757:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $1334
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1758
;1758:	}
LABELV $1331
line 1759
;1759:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs
ADDP4
INDIRI4
ADDRGP4 cgs+4096
ADDP4
RETP4
LABELV $1330
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1770
;1760:}
;1761:
;1762://==================================================================
;1763:
;1764:/*
;1765:======================
;1766:CG_StartMusic
;1767:
;1768:======================
;1769:*/
;1770:void CG_StartMusic( void ) {
line 1775
;1771:	char	*s;
;1772:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1773:
;1774:	// start the background music
;1775:	s = (char *)CG_ConfigString( CS_MUSIC );
CNSTI4 2
ARGI4
ADDRLP4 132
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 1776
;1776:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1777
;1777:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1779
;1778:
;1779:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1780
;1780:}
LABELV $1336
endproc CG_StartMusic 144 12
bss
align 1
LABELV $1338
skip 32768
export CG_GetMenuBuffer
code
proc CG_GetMenuBuffer 16 16
line 1782
;1781:#ifdef MISSIONPACK
;1782:char *CG_GetMenuBuffer(const char *filename) {
line 1787
;1783:	int	len;
;1784:	fileHandle_t	f;
;1785:	static char buf[MAX_MENUFILE];
;1786:
;1787:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1788
;1788:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1339
line 1789
;1789:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
ADDRGP4 $1341
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1790
;1790:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1337
JUMPV
LABELV $1339
line 1792
;1791:	}
;1792:	if ( len >= MAX_MENUFILE ) {
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $1342
line 1793
;1793:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
ADDRGP4 $1344
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 32768
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1794
;1794:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1795
;1795:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1337
JUMPV
LABELV $1342
line 1798
;1796:	}
;1797:
;1798:	trap_FS_Read( buf, len, f );
ADDRGP4 $1338
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1799
;1799:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $1338
ADDP4
CNSTI1 0
ASGNI1
line 1800
;1800:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1802
;1801:
;1802:	return buf;
ADDRGP4 $1338
RETP4
LABELV $1337
endproc CG_GetMenuBuffer 16 16
export CG_Asset_Parse
proc CG_Asset_Parse 1136 12
line 1810
;1803:}
;1804:
;1805://
;1806:// ==============================
;1807:// new hud stuff ( mission pack )
;1808:// ==============================
;1809://
;1810:qboolean CG_Asset_Parse(int handle) {
line 1814
;1811:	pc_token_t token;
;1812:	const char *tempStr;
;1813:
;1814:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1346
line 1815
;1815:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1346
line 1816
;1816:	if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1351
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $1353
line 1817
;1817:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1352
line 1820
;1818:	}
;1819:    
;1820:	while ( 1 ) {
line 1821
;1821:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1355
line 1822
;1822:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1355
line 1824
;1823:
;1824:		if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1360
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1357
line 1825
;1825:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1357
line 1829
;1826:		}
;1827:
;1828:		// font
;1829:		if (Q_stricmp(token.string, "font") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1364
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1361
line 1831
;1830:			int pointSize;
;1831:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1068
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $1367
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ARGP4
ADDRLP4 1072
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1365
LABELV $1367
line 1832
;1832:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1365
line 1834
;1833:			}
;1834:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 cgDC+232+12
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1835
;1835:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1361
line 1839
;1836:		}
;1837:
;1838:		// smallFont
;1839:		if (Q_stricmp(token.string, "smallFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1374
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1371
line 1841
;1840:			int pointSize;
;1841:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1072
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $1377
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ARGP4
ADDRLP4 1076
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1375
LABELV $1377
line 1842
;1842:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1375
line 1844
;1843:			}
;1844:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 cgDC+232+20560
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1845
;1845:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1371
line 1849
;1846:		}
;1847:
;1848:		// font
;1849:		if (Q_stricmp(token.string, "bigfont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1384
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1381
line 1851
;1850:			int pointSize;
;1851:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $1387
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ARGP4
ADDRLP4 1080
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1385
LABELV $1387
line 1852
;1852:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1385
line 1854
;1853:			}
;1854:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 cgDC+232+41108
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1855
;1855:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1381
line 1859
;1856:		}
;1857:
;1858:		// gradientbar
;1859:		if (Q_stricmp(token.string, "gradientbar") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1394
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1391
line 1860
;1860:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1395
line 1861
;1861:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1395
line 1863
;1862:			}
;1863:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61660
ADDRLP4 1080
INDIRI4
ASGNI4
line 1864
;1864:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1391
line 1868
;1865:		}
;1866:
;1867:		// enterMenuSound
;1868:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1402
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1399
line 1869
;1869:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1080
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1403
line 1870
;1870:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1403
line 1872
;1871:			}
;1872:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61708
ADDRLP4 1084
INDIRI4
ASGNI4
line 1873
;1873:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1399
line 1877
;1874:		}
;1875:
;1876:		// exitMenuSound
;1877:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1410
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1407
line 1878
;1878:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1084
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1411
line 1879
;1879:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1411
line 1881
;1880:			}
;1881:			cgDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61712
ADDRLP4 1088
INDIRI4
ASGNI4
line 1882
;1882:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1407
line 1886
;1883:		}
;1884:
;1885:		// itemFocusSound
;1886:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1418
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1415
line 1887
;1887:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1088
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1419
line 1888
;1888:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1419
line 1890
;1889:			}
;1890:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1092
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61720
ADDRLP4 1092
INDIRI4
ASGNI4
line 1891
;1891:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1415
line 1895
;1892:		}
;1893:
;1894:		// menuBuzzSound
;1895:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1426
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1423
line 1896
;1896:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1092
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1427
line 1897
;1897:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1427
line 1899
;1898:			}
;1899:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1096
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61716
ADDRLP4 1096
INDIRI4
ASGNI4
line 1900
;1900:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1423
line 1903
;1901:		}
;1902:
;1903:		if (Q_stricmp(token.string, "cursor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1434
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1431
line 1904
;1904:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+4
ARGP4
ADDRLP4 1096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1435
line 1905
;1905:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1435
line 1907
;1906:			}
;1907:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr);
ADDRGP4 cgDC+232+4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61656
ADDRLP4 1100
INDIRI4
ASGNI4
line 1908
;1908:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1431
line 1911
;1909:		}
;1910:
;1911:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1446
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1443
line 1912
;1912:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61724
ARGP4
ADDRLP4 1100
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1353
line 1913
;1913:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
line 1915
;1914:			}
;1915:			continue;
LABELV $1443
line 1918
;1916:		}
;1917:
;1918:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1454
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1451
line 1919
;1919:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61728
ARGP4
ADDRLP4 1104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1353
line 1920
;1920:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
line 1922
;1921:			}
;1922:			continue;
LABELV $1451
line 1925
;1923:		}
;1924:
;1925:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1462
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1459
line 1926
;1926:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61732
ARGP4
ADDRLP4 1108
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1353
line 1927
;1927:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
line 1929
;1928:			}
;1929:			continue;
LABELV $1459
line 1932
;1930:		}
;1931:
;1932:		if (Q_stricmp(token.string, "shadowX") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1470
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1467
line 1933
;1933:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61736
ARGP4
ADDRLP4 1112
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1353
line 1934
;1934:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
line 1936
;1935:			}
;1936:			continue;
LABELV $1467
line 1939
;1937:		}
;1938:
;1939:		if (Q_stricmp(token.string, "shadowY") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1478
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1475
line 1940
;1940:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61740
ARGP4
ADDRLP4 1116
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1353
line 1941
;1941:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
line 1943
;1942:			}
;1943:			continue;
LABELV $1475
line 1946
;1944:		}
;1945:
;1946:		if (Q_stricmp(token.string, "shadowColor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1486
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1483
line 1947
;1947:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61744
ARGP4
ADDRLP4 1120
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1487
line 1948
;1948:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
LABELV $1487
line 1950
;1949:			}
;1950:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
ADDRGP4 cgDC+232+61760
ADDRGP4 cgDC+232+61744+12
INDIRF4
ASGNF4
line 1951
;1951:			continue;
ADDRGP4 $1353
JUMPV
LABELV $1483
line 1954
;1952:		} 
;1953:
;1954:		if (Q_stricmp(token.string, "sealscolor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1499
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1496
line 1955
;1955:			if (!PC_Color_Parse(handle, &cgDC.Assets.team1color)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61768
ARGP4
ADDRLP4 1124
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1353
line 1956
;1956:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
line 1958
;1957:			} 
;1958:			continue;
LABELV $1496
line 1960
;1959:		}  
;1960:		if (Q_stricmp(token.string, "tangoscolor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1507
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1504
line 1961
;1961:			if (!PC_Color_Parse(handle, &cgDC.Assets.team2color)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61784
ARGP4
ADDRLP4 1128
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1353
line 1962
;1962:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
line 1964
;1963:			} 
;1964:			continue;
LABELV $1504
line 1966
;1965:		} 
;1966:		if (Q_stricmp(token.string, "noteamcolor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1515
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1512
line 1967
;1967:			if (!PC_Color_Parse(handle, &cgDC.Assets.dmcolor)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+232+61800
ARGP4
ADDRLP4 1132
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1353
line 1968
;1968:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1345
JUMPV
line 1970
;1969:			} 
;1970:			continue;
LABELV $1512
line 1972
;1971:		} 
;1972:	}
LABELV $1353
line 1820
ADDRGP4 $1352
JUMPV
line 1973
;1973:	return qfalse;
CNSTI4 0
RETI4
LABELV $1345
endproc CG_Asset_Parse 1136 12
export CG_ParseMenu
proc CG_ParseMenu 1064 8
line 1976
;1974:}
;1975:
;1976:void CG_ParseMenu(const char *menuFile) {
line 1980
;1977:	pc_token_t token;
;1978:	int handle;
;1979:
;1980:	handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 1981
;1981:	if (!handle)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1521
line 1982
;1982:		handle = trap_PC_LoadSource("ui/testhud.menu");
ADDRGP4 $1523
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1048
INDIRI4
ASGNI4
LABELV $1521
line 1983
;1983:	if (!handle)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1527
line 1984
;1984:		return;
ADDRGP4 $1520
JUMPV
LABELV $1526
line 1986
;1985:
;1986:	while ( 1 ) {
line 1987
;1987:		if (!trap_PC_ReadToken( handle, &token )) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1529
line 1988
;1988:			break;
ADDRGP4 $1528
JUMPV
LABELV $1529
line 2001
;1989:		}
;1990:
;1991:		//if ( Q_stricmp( token, "{" ) ) {
;1992:		//	Com_Printf( "Missing { in menu file\n" );
;1993:		//	break;
;1994:		//}
;1995:
;1996:		//if ( menuCount == MAX_MENUS ) {
;1997:		//	Com_Printf( "Too many menus!\n" );
;1998:		//	break;
;1999:		//}
;2000:
;2001:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $1531
line 2002
;2002:			break;
ADDRGP4 $1528
JUMPV
LABELV $1531
line 2005
;2003:		}
;2004:
;2005:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1537
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1534
line 2006
;2006:			if (CG_Asset_Parse(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 CG_Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1528
line 2007
;2007:				continue;
ADDRGP4 $1527
JUMPV
line 2008
;2008:			} else {
line 2009
;2009:				break;
LABELV $1534
line 2014
;2010:			}
;2011:		}
;2012:
;2013:
;2014:		if (Q_stricmp(token.string, "menudef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1543
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1540
line 2016
;2015:			// start a new menu
;2016:			Menu_New(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 2017
;2017:		}
LABELV $1540
line 2018
;2018:	}
LABELV $1527
line 1986
ADDRGP4 $1526
JUMPV
LABELV $1528
line 2019
;2019:	trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 2020
;2020:}
LABELV $1520
endproc CG_ParseMenu 1064 8
export CG_Load_Menu
proc CG_Load_Menu 20 8
line 2022
;2021:
;2022:qboolean CG_Load_Menu(char **p) {
line 2025
;2023:	char *token;
;2024:
;2025:	token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2027
;2026:
;2027:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $1548
line 2028
;2028:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1544
JUMPV
LABELV $1547
line 2031
;2029:	}
;2030:
;2031:	while ( 1 ) {
line 2033
;2032:
;2033:		token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2035
;2034:    
;2035:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1360
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1550
line 2036
;2036:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1544
JUMPV
LABELV $1550
line 2039
;2037:		}
;2038:
;2039:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1554
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1552
LABELV $1554
line 2040
;2040:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1544
JUMPV
LABELV $1552
line 2043
;2041:		}
;2042:
;2043:		CG_ParseMenu(token); 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ParseMenu
CALLV
pop
line 2044
;2044:	}
LABELV $1548
line 2031
ADDRGP4 $1547
JUMPV
line 2045
;2045:	return qfalse;
CNSTI4 0
RETI4
LABELV $1544
endproc CG_Load_Menu 20 8
bss
align 1
LABELV $1556
skip 4096
export CG_LoadMenus
code
proc CG_LoadMenus 52 16
line 2050
;2046:}
;2047:
;2048:
;2049:
;2050:void CG_LoadMenus(const char *menuFile) {
line 2057
;2051:	char	*token;
;2052:	char *p;
;2053:	int	len, start;
;2054:	fileHandle_t	f;
;2055:	static char buf[MAX_MENUDEFFILE];
;2056:
;2057:	start = trap_Milliseconds();
ADDRLP4 20
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 2059
;2058:
;2059:	len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 2060
;2060:	if ( !f ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1557
line 2061
;2061:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
ADDRGP4 $1559
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 2062
;2062:		len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
ADDRGP4 $204
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 2063
;2063:		if (!f) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1560
line 2064
;2064:			trap_Error( va( S_COLOR_RED "default HUD scriptfile not found: ui/hud.txt, unable to continue!\n", menuFile ) );
ADDRGP4 $1562
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 2065
;2065:		}
LABELV $1560
line 2066
;2066:	}
LABELV $1557
line 2068
;2067:
;2068:	if ( len >= MAX_MENUDEFFILE ) {
ADDRLP4 12
INDIRI4
CNSTI4 4096
LTI4 $1563
line 2069
;2069:		trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", menuFile, len, MAX_MENUDEFFILE ) );
ADDRGP4 $1344
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 4096
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 2070
;2070:		trap_FS_FCloseFile( f );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 2071
;2071:		return;
ADDRGP4 $1555
JUMPV
LABELV $1563
line 2074
;2072:	}
;2073:
;2074:	trap_FS_Read( buf, len, f );
ADDRGP4 $1556
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 2075
;2075:	buf[len] = 0;
ADDRLP4 12
INDIRI4
ADDRGP4 $1556
ADDP4
CNSTI1 0
ASGNI1
line 2076
;2076:	trap_FS_FCloseFile( f );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 2078
;2077:	
;2078:	COM_Compress(buf);
ADDRGP4 $1556
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 2080
;2079:
;2080:	Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 2082
;2081:
;2082:	p = buf;
ADDRLP4 4
ADDRGP4 $1556
ASGNP4
ADDRGP4 $1566
JUMPV
LABELV $1565
line 2084
;2083:
;2084:	while ( 1 ) {
line 2085
;2085:		token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2086
;2086:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1571
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1571
ADDRLP4 36
INDIRI4
CNSTI4 125
NEI4 $1568
LABELV $1571
line 2087
;2087:			break;
ADDRGP4 $1567
JUMPV
LABELV $1568
line 2100
;2088:		}
;2089:
;2090:		//if ( Q_stricmp( token, "{" ) ) {
;2091:		//	Com_Printf( "Missing { in menu file\n" );
;2092:		//	break;
;2093:		//}
;2094:
;2095:		//if ( menuCount == MAX_MENUS ) {
;2096:		//	Com_Printf( "Too many menus!\n" );
;2097:		//	break;
;2098:		//}
;2099:
;2100:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1360
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1572
line 2101
;2101:			break;
ADDRGP4 $1567
JUMPV
LABELV $1572
line 2104
;2102:		}
;2103:
;2104:		if (Q_stricmp(token, "loadmenu") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1576
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1574
line 2105
;2105:			if (CG_Load_Menu(&p)) {
ADDRLP4 4
ARGP4
ADDRLP4 48
ADDRGP4 CG_Load_Menu
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1567
line 2106
;2106:				continue;
line 2107
;2107:			} else {
line 2108
;2108:				break;
LABELV $1574
line 2111
;2109:			}
;2110:		}
;2111:	}
LABELV $1566
line 2084
ADDRGP4 $1565
JUMPV
LABELV $1567
line 2117
;2112:
;2113:	// BLUTENGEL: 07.01.2004
;2114:	// removed this message as noone really needs it!
;2115:	// Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;2116:
;2117:}
LABELV $1555
endproc CG_LoadMenus 52 16
proc CG_OwnerDrawHandleKey 0 0
line 2121
;2118:
;2119:
;2120:
;2121:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
line 2122
;2122:	return qfalse;
CNSTI4 0
RETI4
LABELV $1579
endproc CG_OwnerDrawHandleKey 0 0
proc CG_FeederCount 8 0
line 2126
;2123:}
;2124:
;2125:
;2126:static int CG_FeederCount(float feederID) {
line 2128
;2127:	int i, count;
;2128:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2129
;2129:	if (feederID == FEEDER_REDTEAM_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
NEF4 $1581
line 2130
;2130:		for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1586
JUMPV
LABELV $1583
line 2131
;2131:			if (cg.scores[i].team == TEAM_RED) {
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848+24
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1588
line 2132
;2132:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2133
;2133:			}
LABELV $1588
line 2134
;2134:		}
LABELV $1584
line 2130
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1586
ADDRLP4 0
INDIRI4
ADDRGP4 cg+110832
INDIRI4
LTI4 $1583
line 2135
;2135:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
ADDRGP4 $1582
JUMPV
LABELV $1581
ADDRFP4 0
INDIRF4
CNSTF4 1086324736
NEF4 $1592
line 2136
;2136:		for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1597
JUMPV
LABELV $1594
line 2137
;2137:			if (cg.scores[i].team == TEAM_BLUE) {
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848+24
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1599
line 2138
;2138:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2139
;2139:			}
LABELV $1599
line 2140
;2140:		}
LABELV $1595
line 2136
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1597
ADDRLP4 0
INDIRI4
ADDRGP4 cg+110832
INDIRI4
LTI4 $1594
line 2141
;2141:	} else if (feederID == FEEDER_SCOREBOARD) {
ADDRGP4 $1593
JUMPV
LABELV $1592
ADDRFP4 0
INDIRF4
CNSTF4 1093664768
NEF4 $1603
line 2142
;2142:		return cg.numScores;
ADDRGP4 cg+110832
INDIRI4
RETI4
ADDRGP4 $1580
JUMPV
LABELV $1603
LABELV $1593
LABELV $1582
line 2144
;2143:	}
;2144:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1580
endproc CG_FeederCount 8 0
export CG_SetScoreSelection
proc CG_SetScoreSelection 28 16
line 2148
;2145:}
;2146:
;2147:
;2148:void CG_SetScoreSelection(void *p) {
line 2149
;2149:	menuDef_t *menu = (menuDef_t*)p;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
line 2150
;2150:	playerState_t *ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 2152
;2151:	int i, red, blue;
;2152:	red = blue = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 2153
;2153:	for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1611
JUMPV
LABELV $1608
line 2154
;2154:		if (cg.scores[i].team == TEAM_RED) {
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848+24
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1613
line 2155
;2155:			red++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2156
;2156:		} else if (cg.scores[i].team == TEAM_BLUE) {
ADDRGP4 $1614
JUMPV
LABELV $1613
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848+24
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1617
line 2157
;2157:			blue++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2158
;2158:		}
LABELV $1617
LABELV $1614
line 2159
;2159:		if (ps->clientNum == cg.scores[i].client) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848
ADDP4
INDIRI4
NEI4 $1621
line 2160
;2160:			cg.selectedScore = i;
ADDRGP4 cg+110836
ADDRLP4 0
INDIRI4
ASGNI4
line 2161
;2161:		}
LABELV $1621
line 2162
;2162:	}
LABELV $1609
line 2153
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1611
ADDRLP4 0
INDIRI4
ADDRGP4 cg+110832
INDIRI4
LTI4 $1608
line 2164
;2163:
;2164:	if (menu == NULL) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1625
line 2166
;2165:		// just interested in setting the selected score
;2166:		return;
ADDRGP4 $1606
JUMPV
LABELV $1625
line 2169
;2167:	}
;2168:
;2169:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $1627
line 2170
;2170:		int feeder = FEEDER_REDTEAM_LIST;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 2171
;2171:		i = red;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2172
;2172:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
ADDRGP4 cg+110836
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848+24
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1630
line 2173
;2173:			feeder = FEEDER_BLUETEAM_LIST;
ADDRLP4 24
CNSTI4 6
ASGNI4
line 2174
;2174:			i = blue;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2175
;2175:		}
LABELV $1630
line 2176
;2176:		Menu_SetFeederSelection(menu, feeder, i, NULL);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2177
;2177:	} else {
ADDRGP4 $1628
JUMPV
LABELV $1627
line 2178
;2178:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 cg+110836
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2179
;2179:	}
LABELV $1628
line 2180
;2180:}
LABELV $1606
endproc CG_SetScoreSelection 28 16
proc CG_InfoFromScoreIndex 8 0
line 2183
;2181:
;2182:// FIXME: might need to cache this info
;2183:static clientInfo_t * CG_InfoFromScoreIndex(int index, int team, int *scoreIndex) {
line 2185
;2184:	int i, count;
;2185:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $1637
line 2186
;2186:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2187
;2187:		for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1643
JUMPV
LABELV $1640
line 2188
;2188:			if (cg.scores[i].team == team) {
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848+24
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1645
line 2189
;2189:				if (count == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1649
line 2190
;2190:					*scoreIndex = i;
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2191
;2191:					return &cgs.clientinfo[cg.scores[i].client];
CNSTI4 2484
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+38664
ADDP4
RETP4
ADDRGP4 $1636
JUMPV
LABELV $1649
line 2193
;2192:				}
;2193:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2194
;2194:			}
LABELV $1645
line 2195
;2195:		}
LABELV $1641
line 2187
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1643
ADDRLP4 0
INDIRI4
ADDRGP4 cg+110832
INDIRI4
LTI4 $1640
line 2196
;2196:	}
LABELV $1637
line 2197
;2197:	*scoreIndex = index;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRI4
ASGNI4
line 2198
;2198:	return &cgs.clientinfo[ cg.scores[index].client ];
CNSTI4 2484
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+38664
ADDP4
RETP4
LABELV $1636
endproc CG_InfoFromScoreIndex 8 0
export xp_to_rank
proc xp_to_rank 84 0
line 2202
;2199:}
;2200: 
;2201:char *xp_to_rank(int xp,int team)
;2202:{
line 2203
;2203:	switch (team)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1692
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $1658
ADDRGP4 $1656
JUMPV
line 2204
;2204:	{ 
LABELV $1658
line 2206
;2205:	case TEAM_BLUE:
;2206:		if ( xp >= 0 && xp <= 10 )
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1659
ADDRLP4 4
INDIRI4
CNSTI4 10
GTI4 $1659
line 2207
;2207:			return "Pfc";
ADDRGP4 $1661
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1659
line 2208
;2208:		else if ( xp >= 11 && xp <= 15 )
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 11
LTI4 $1662
ADDRLP4 8
INDIRI4
CNSTI4 15
GTI4 $1662
line 2209
;2209:			return "Cpl";
ADDRGP4 $1664
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1662
line 2210
;2210:		else if ( xp >= 16 && xp <= 20 )
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 16
LTI4 $1665
ADDRLP4 12
INDIRI4
CNSTI4 20
GTI4 $1665
line 2211
;2211:			return "Sgt";
ADDRGP4 $1667
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1665
line 2212
;2212:		else if ( xp >= 21 && xp <= 30 )
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 21
LTI4 $1668
ADDRLP4 16
INDIRI4
CNSTI4 30
GTI4 $1668
line 2213
;2213:			return "Msgt";
ADDRGP4 $1670
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1668
line 2214
;2214:		else if ( xp >= 31 && xp <= 40 )
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 31
LTI4 $1671
ADDRLP4 20
INDIRI4
CNSTI4 40
GTI4 $1671
line 2215
;2215:			return "2ndLt";
ADDRGP4 $1673
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1671
line 2216
;2216:		else if ( xp >= 41 && xp <= 50 )
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 41
LTI4 $1674
ADDRLP4 24
INDIRI4
CNSTI4 50
GTI4 $1674
line 2217
;2217:			return "1stLt";
ADDRGP4 $1676
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1674
line 2218
;2218:		else if ( xp >= 51 && xp <= 60 )
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 51
LTI4 $1677
ADDRLP4 28
INDIRI4
CNSTI4 60
GTI4 $1677
line 2219
;2219:			return "Capt";
ADDRGP4 $1679
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1677
line 2220
;2220:		else if ( xp >=  61 && xp <= 70 )
ADDRLP4 32
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 61
LTI4 $1680
ADDRLP4 32
INDIRI4
CNSTI4 70
GTI4 $1680
line 2221
;2221:			return "Maj";
ADDRGP4 $1682
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1680
line 2222
;2222:		else if ( xp >= 71 && xp <= 80 )
ADDRLP4 36
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 71
LTI4 $1683
ADDRLP4 36
INDIRI4
CNSTI4 80
GTI4 $1683
line 2223
;2223:			return "LtCol";
ADDRGP4 $1685
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1683
line 2224
;2224:		else if ( xp >= 81 && xp <= 99 )
ADDRLP4 40
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 81
LTI4 $1686
ADDRLP4 40
INDIRI4
CNSTI4 99
GTI4 $1686
line 2225
;2225:			return "Col";
ADDRGP4 $1688
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1686
line 2226
;2226:		else if ( xp >= 100 )
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $1689
line 2227
;2227:			return "Gen";
ADDRGP4 $1691
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1689
line 2229
;2228:		else
;2229:			return "";
ADDRGP4 $322
RETP4
ADDRGP4 $1655
JUMPV
line 2230
;2230:		break;
LABELV $1692
LABELV $1656
line 2233
;2231:	case TEAM_RED:
;2232:	default:
;2233:		if ( xp >= 0 && xp <= 10 )
ADDRLP4 44
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $1693
ADDRLP4 44
INDIRI4
CNSTI4 10
GTI4 $1693
line 2234
;2234:			return "Seam";
ADDRGP4 $1695
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1693
line 2235
;2235:		else if ( xp >= 11 && xp <= 15 )
ADDRLP4 48
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 11
LTI4 $1696
ADDRLP4 48
INDIRI4
CNSTI4 15
GTI4 $1696
line 2236
;2236:			return "POf";
ADDRGP4 $1698
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1696
line 2237
;2237:		else if ( xp >= 16 && xp <= 20 )
ADDRLP4 52
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 16
LTI4 $1699
ADDRLP4 52
INDIRI4
CNSTI4 20
GTI4 $1699
line 2238
;2238:			return "CPof";
ADDRGP4 $1701
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1699
line 2239
;2239:		else if ( xp >= 21 && xp <= 30 )
ADDRLP4 56
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 21
LTI4 $1702
ADDRLP4 56
INDIRI4
CNSTI4 30
GTI4 $1702
line 2240
;2240:			return "MCPOf";
ADDRGP4 $1704
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1702
line 2241
;2241:		else if ( xp >= 31 && xp <= 40 )
ADDRLP4 60
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 31
LTI4 $1705
ADDRLP4 60
INDIRI4
CNSTI4 40
GTI4 $1705
line 2242
;2242:			return "Ens";
ADDRGP4 $1707
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1705
line 2243
;2243:		else if ( xp >= 41 && xp <= 50 )
ADDRLP4 64
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 41
LTI4 $1708
ADDRLP4 64
INDIRI4
CNSTI4 50
GTI4 $1708
line 2244
;2244:			return "Lt,j";
ADDRGP4 $1710
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1708
line 2245
;2245:		else if ( xp >= 51 && xp <= 60 )
ADDRLP4 68
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 51
LTI4 $1711
ADDRLP4 68
INDIRI4
CNSTI4 60
GTI4 $1711
line 2246
;2246:			return "Lt";
ADDRGP4 $1713
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1711
line 2247
;2247:		else if ( xp >=  61 && xp <= 70 )
ADDRLP4 72
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 61
LTI4 $1714
ADDRLP4 72
INDIRI4
CNSTI4 70
GTI4 $1714
line 2248
;2248:			return "LtCom";
ADDRGP4 $1716
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1714
line 2249
;2249:		else if ( xp >= 71 && xp <= 80 )
ADDRLP4 76
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 71
LTI4 $1717
ADDRLP4 76
INDIRI4
CNSTI4 80
GTI4 $1717
line 2250
;2250:			return "Com";
ADDRGP4 $1719
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1717
line 2251
;2251:		else if ( xp >= 81 && xp <= 99 )
ADDRLP4 80
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 81
LTI4 $1720
ADDRLP4 80
INDIRI4
CNSTI4 99
GTI4 $1720
line 2252
;2252:			return "Capt";
ADDRGP4 $1679
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1720
line 2253
;2253:		else if ( xp >= 100 )
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $1722
line 2254
;2254:			return "Adm";
ADDRGP4 $1724
RETP4
ADDRGP4 $1655
JUMPV
LABELV $1722
line 2256
;2255:		else
;2256:			return "";
ADDRGP4 $322
RETP4
line 2257
;2257:		break;
LABELV $1655
endproc xp_to_rank 84 0
export status_to_string
proc status_to_string 4 0
line 2262
;2258:	}
;2259:}
;2260:
;2261:char *status_to_string( int status )
;2262:{
line 2263
;2263:	switch (status) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $1726
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $1726
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1743-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1743
address $1736
address $1734
address $1732
address $1730
address $1728
address $1738
address $1740
code
LABELV $1728
line 2265
;2264:		case MS_HEALTH5:
;2265:			return "Excellent";
ADDRGP4 $1729
RETP4
ADDRGP4 $1725
JUMPV
LABELV $1730
line 2267
;2266:		case MS_HEALTH4:
;2267:			return "Good";
ADDRGP4 $1731
RETP4
ADDRGP4 $1725
JUMPV
LABELV $1732
line 2269
;2268:		case MS_HEALTH3:
;2269:			return "Wounded";
ADDRGP4 $1733
RETP4
ADDRGP4 $1725
JUMPV
LABELV $1734
line 2271
;2270:		case MS_HEALTH2:
;2271:			return "Injured";
ADDRGP4 $1735
RETP4
ADDRGP4 $1725
JUMPV
LABELV $1736
line 2273
;2272:		case MS_HEALTH1:
;2273:			return "Poor";
ADDRGP4 $1737
RETP4
ADDRGP4 $1725
JUMPV
LABELV $1738
line 2275
;2274:		case MS_DEAD:
;2275:			return "Dead";
ADDRGP4 $1739
RETP4
ADDRGP4 $1725
JUMPV
LABELV $1740
line 2277
;2276:		case MS_BOMB:
;2277:			return "Got Bomb";
ADDRGP4 $1741
RETP4
ADDRGP4 $1725
JUMPV
LABELV $1726
line 2279
;2278:		default:
;2279:			return "Unknown";
ADDRGP4 $1742
RETP4
LABELV $1725
endproc status_to_string 4 0
proc CG_FeederItemText 56 12
line 2282
;2280:	}
;2281:}
;2282:static const char *CG_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
line 2284
;2283://	gitem_t *item;
;2284:	int scoreIndex = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2285
;2285:	clientInfo_t *info = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2286
;2286:	int team = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 2287
;2287:	score_t *sp = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 2289
;2288:
;2289:	*handle = -1;
ADDRFP4 12
INDIRP4
CNSTI4 -1
ASGNI4
line 2291
;2290:
;2291:	if (feederID == FEEDER_REDTEAM_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
NEF4 $1746
line 2292
;2292:		team = TEAM_RED;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2293
;2293:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
ADDRGP4 $1747
JUMPV
LABELV $1746
ADDRFP4 0
INDIRF4
CNSTF4 1086324736
NEF4 $1748
line 2294
;2294:		team = TEAM_BLUE;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 2295
;2295:	}
LABELV $1748
LABELV $1747
line 2297
;2296:
;2297:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 16
ADDRGP4 CG_InfoFromScoreIndex
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 2298
;2298:	sp = &cg.scores[scoreIndex];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848
ADDP4
ASGNP4
line 2300
;2299:	
;2300:	if (info && info->infoValid) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1751
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1751
line 2301
;2301:		switch (column) {
ADDRLP4 24
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $1753
ADDRLP4 24
INDIRI4
CNSTI4 6
GTI4 $1753
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1787
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1787
address $1755
address $1760
address $1777
address $1782
address $1783
address $1785
address $1786
code
LABELV $1755
line 2303
;2302:			case 0:
;2303:				if ( cgs.gametype >= GT_TEAM )
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $1756
line 2304
;2304:					return va("%s. %s",xp_to_rank(info->score, team),info->name); 
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 xp_to_rank
CALLP4
ASGNP4
ADDRGP4 $1759
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $1745
JUMPV
LABELV $1756
line 2306
;2305:				else
;2306:					return va("%s",info->name);
ADDRGP4 $507
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
RETP4
ADDRGP4 $1745
JUMPV
line 2307
;2307:			break;
LABELV $1760
line 2309
;2308:			case 1:
;2309:				if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << sp->client ) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1761
line 2310
;2310:					return "Ready";
ADDRGP4 $1764
RETP4
ADDRGP4 $1745
JUMPV
LABELV $1761
line 2312
;2311:				}
;2312:				if (team == -1) { 
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $1765
line 2313
;2313:					if (info->infoValid && info->team == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1767
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1767
line 2314
;2314:						return "Spectator";
ADDRGP4 $1769
RETP4
ADDRGP4 $1745
JUMPV
LABELV $1767
line 2315
;2315:					} else {
line 2316
;2316:						return "";
ADDRGP4 $322
RETP4
ADDRGP4 $1745
JUMPV
LABELV $1765
line 2320
;2317:					}
;2318:				}   
;2319:				else
;2320:				{
line 2321
;2321:					return va("%s %s", ( !Q_stricmp( info->modelName, "vip_male") )?"V.I.P.":"", status_to_string( cg.playerStatus[ sp->client ] ) ) ; 
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ARGP4
ADDRGP4 $1771
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1775
ADDRLP4 40
ADDRGP4 $1772
ASGNP4
ADDRGP4 $1776
JUMPV
LABELV $1775
ADDRLP4 40
ADDRGP4 $322
ASGNP4
LABELV $1776
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+116384
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 status_to_string
CALLP4
ASGNP4
ADDRGP4 $1770
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
RETP4
ADDRGP4 $1745
JUMPV
line 2323
;2322:				}
;2323:			  break;
LABELV $1777
line 2325
;2324:			case 2:
;2325:				if ( sp->ping == -1 ) {
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1778
line 2326
;2326:					return "Connecting";
ADDRGP4 $1780
RETP4
ADDRGP4 $1745
JUMPV
LABELV $1778
line 2328
;2327:				} 
;2328:				return va("%4i", sp->ping); 
ADDRGP4 $1781
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
RETP4
ADDRGP4 $1745
JUMPV
line 2332
;2329:				/*
;2330:				
;2331:				*/
;2332:			break;
LABELV $1782
line 2334
;2333:			case 3:
;2334:				return va("%4i", sp->time);
ADDRGP4 $1781
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
RETP4
ADDRGP4 $1745
JUMPV
line 2336
;2335:				
;2336:			break;
LABELV $1783
line 2338
;2337:			case 4:
;2338:				return va("%i", info->score);
ADDRGP4 $1784
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
RETP4
ADDRGP4 $1745
JUMPV
line 2339
;2339:			break;
LABELV $1785
line 2341
;2340:			case 5:
;2341:				return "";//return info->name;				
ADDRGP4 $322
RETP4
ADDRGP4 $1745
JUMPV
line 2342
;2342:			break;
LABELV $1786
line 2344
;2343:			case 6:
;2344:				return "";				
ADDRGP4 $322
RETP4
ADDRGP4 $1745
JUMPV
line 2345
;2345:			break;
LABELV $1753
line 2347
;2346:		}
;2347:	}
LABELV $1751
line 2349
;2348:
;2349:	return "";
ADDRGP4 $322
RETP4
LABELV $1745
endproc CG_FeederItemText 56 12
proc CG_FeederItemImage 0 0
line 2352
;2350:}
;2351:
;2352:static qhandle_t CG_FeederItemImage(float feederID, int index) {
line 2353
;2353:	return 0;
CNSTI4 0
RETI4
LABELV $1788
endproc CG_FeederItemImage 0 0
proc CG_FeederSelection 16 0
line 2356
;2354:}
;2355:
;2356:static void CG_FeederSelection(float feederID, int index) {
line 2357
;2357:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
LTI4 $1790
line 2359
;2358:		int i, count;
;2359:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
NEF4 $1794
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $1795
JUMPV
LABELV $1794
ADDRLP4 12
CNSTI4 2
ASGNI4
LABELV $1795
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 2360
;2360:		count = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2361
;2361:		for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1799
JUMPV
LABELV $1796
line 2362
;2362:			if (cg.scores[i].team == team) {
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 cg+110848+24
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1801
line 2363
;2363:				if (index == count) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1805
line 2364
;2364:					cg.selectedScore = i;
ADDRGP4 cg+110836
ADDRLP4 0
INDIRI4
ASGNI4
line 2365
;2365:				}
LABELV $1805
line 2366
;2366:				count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2367
;2367:			}
LABELV $1801
line 2368
;2368:		}
LABELV $1797
line 2361
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1799
ADDRLP4 0
INDIRI4
ADDRGP4 cg+110832
INDIRI4
LTI4 $1796
line 2369
;2369:	} else {
ADDRGP4 $1791
JUMPV
LABELV $1790
line 2370
;2370:		cg.selectedScore = index;
ADDRGP4 cg+110836
ADDRFP4 4
INDIRI4
ASGNI4
line 2371
;2371:	}
LABELV $1791
line 2372
;2372:}
LABELV $1789
endproc CG_FeederSelection 16 0
proc CG_Cvar_Get 132 12
line 2375
;2373:#endif
;2374:#if 1
;2375:static float CG_Cvar_Get(const char *cvar) {
line 2377
;2376:	char buff[128];
;2377:	memset(buff, 0, sizeof(buff));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2378
;2378:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2379
;2379:	return atof(buff);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $1809
endproc CG_Cvar_Get 132 12
export CG_Text_PaintWithCursor
proc CG_Text_PaintWithCursor 0 32
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 2384
;2380:}
;2381:#endif
;2382:
;2383:#ifdef MISSIONPACK
;2384:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
line 2385
;2385:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2386
;2386:}
LABELV $1810
endproc CG_Text_PaintWithCursor 0 32
proc CG_OwnerDrawWidth 36 12
line 2388
;2387:
;2388:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
line 2389
;2389:	switch (ownerDraw) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 39
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1814
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $1812
LABELV $1817
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 49
EQI4 $1815
ADDRLP4 8
INDIRI4
CNSTI4 50
EQI4 $1816
ADDRGP4 $1812
JUMPV
LABELV $1814
line 2391
;2390:	  case CG_GAME_TYPE:
;2391:			return CG_Text_Width(CG_GameTypeString(), scale, 0);
ADDRLP4 12
ADDRGP4 CG_GameTypeString
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $1811
JUMPV
LABELV $1815
line 2393
;2392:	  case CG_GAME_STATUS:
;2393:			return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
ADDRLP4 20
ADDRGP4 CG_GetGameStatusText
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $1811
JUMPV
line 2394
;2394:			break;
LABELV $1816
line 2396
;2395:	  case CG_KILLER:
;2396:			return CG_Text_Width(CG_GetKillerText(), scale, 0);
ADDRLP4 28
ADDRGP4 CG_GetKillerText
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $1811
JUMPV
line 2397
;2397:			break;
LABELV $1812
line 2401
;2398: 
;2399:
;2400:	}
;2401:	return 0;
CNSTI4 0
RETI4
LABELV $1811
endproc CG_OwnerDrawWidth 36 12
proc CG_PlayCinematic 4 24
line 2404
;2402:}
;2403:
;2404:static int CG_PlayCinematic(const char *name, float x, float y, float w, float h) {
line 2405
;2405:  return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1818
endproc CG_PlayCinematic 4 24
proc CG_StopCinematic 0 4
line 2408
;2406:}
;2407:
;2408:static void CG_StopCinematic(int handle) {
line 2409
;2409:  trap_CIN_StopCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 2410
;2410:}
LABELV $1819
endproc CG_StopCinematic 0 4
proc CG_DrawCinematic 0 20
line 2412
;2411:
;2412:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
line 2413
;2413:  trap_CIN_SetExtents(handle, x, y, w, h);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 2414
;2414:  trap_CIN_DrawCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 2415
;2415:}
LABELV $1820
endproc CG_DrawCinematic 0 20
proc CG_RunCinematicFrame 0 4
line 2417
;2416:
;2417:static void CG_RunCinematicFrame(int handle) {
line 2418
;2418:  trap_CIN_RunCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 2419
;2419:}
LABELV $1821
endproc CG_RunCinematicFrame 0 4
export CG_DoWeaponConfig
proc CG_DoWeaponConfig 1196 60
line 2428
;2420:
;2421:
;2422:/*
;2423:================
;2424:configure the client weapon, set the current cvar
;2425:================
;2426:*/
;2427:void CG_DoWeaponConfig(char **args, int parameter )
;2428:{
line 2433
;2429:	const char *name; 
;2430:
;2431:	//CG_Printf(S_COLOR_RED"BLUTENGEL DEBUG MESSAGE: cg_main.c / CG_DoWeaponConfig\n");
;2432:
;2433:	if (String_Parse(args, &name))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1823
line 2434
;2434:	{
line 2435
;2435:		if (Q_stricmp(name, "setPrimaryWeapon") == 0) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1827
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1825
line 2436
;2436:		{
line 2438
;2437:			
;2438:			trap_Cvar_Set("inven_Primary", va("%i", parameter) );
ADDRGP4 $1784
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1828
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2439
;2439:		}
ADDRGP4 $1826
JUMPV
LABELV $1825
line 2440
;2440:		else if (Q_stricmp(name, "setSecondaryWeapon") == 0) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1831
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1829
line 2441
;2441:		{
line 2442
;2442:			trap_Cvar_Set("inven_Secondary", va("%i",parameter) );
ADDRGP4 $1784
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1832
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2443
;2443:		}
ADDRGP4 $1830
JUMPV
LABELV $1829
line 2444
;2444:		else if ( Q_stricmp(name, "setItem") == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1835
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $1833
line 2445
;2445:		{ 
line 2446
;2446:			char *cvarname = "cvarnone";
ADDRLP4 20
ADDRGP4 $1836
ASGNP4
line 2450
;2447:			char		var[MAX_TOKEN_CHARS];
;2448:			int	 Value;
;2449:
;2450:			if ( parameter == ITEM_HELMET )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $1837
line 2451
;2451:				cvarname = "inven_Helmet";
ADDRLP4 20
ADDRGP4 $1839
ASGNP4
ADDRGP4 $1838
JUMPV
LABELV $1837
line 2452
;2452:			else if ( parameter == ITEM_VEST )
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $1840
line 2453
;2453:				cvarname = "inven_Vest";
ADDRLP4 20
ADDRGP4 $1842
ASGNP4
ADDRGP4 $1841
JUMPV
LABELV $1840
line 2454
;2454:			else if ( parameter == ITEM_SCOPE )
ADDRFP4 4
INDIRI4
CNSTI4 7
NEI4 $1843
line 2455
;2455:				cvarname = "inven_Scope";
ADDRLP4 20
ADDRGP4 $1845
ASGNP4
ADDRGP4 $1844
JUMPV
LABELV $1843
line 2456
;2456:			else if( parameter == ITEM_GRENADELAUNCHER )
ADDRFP4 4
INDIRI4
CNSTI4 5
NEI4 $1846
line 2457
;2457:				cvarname = "inven_GrenadeLauncher";
ADDRLP4 20
ADDRGP4 $1848
ASGNP4
ADDRGP4 $1847
JUMPV
LABELV $1846
line 2458
;2458:			else if( parameter == ITEM_LASERSIGHT )
ADDRFP4 4
INDIRI4
CNSTI4 4
NEI4 $1849
line 2459
;2459:				cvarname = "inven_LaserSight";
ADDRLP4 20
ADDRGP4 $1851
ASGNP4
ADDRGP4 $1850
JUMPV
LABELV $1849
line 2460
;2460:			else if( parameter == ITEM_BAYONET )
ADDRFP4 4
INDIRI4
CNSTI4 6
NEI4 $1852
line 2461
;2461:				cvarname = "inven_Bayonet";
ADDRLP4 20
ADDRGP4 $1854
ASGNP4
ADDRGP4 $1853
JUMPV
LABELV $1852
line 2462
;2462:			else if( parameter == ITEM_SILENCER )
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $1855
line 2463
;2463:				cvarname = "inven_Silencer";
ADDRLP4 20
ADDRGP4 $1857
ASGNP4
LABELV $1855
LABELV $1853
LABELV $1850
LABELV $1847
LABELV $1844
LABELV $1841
LABELV $1838
line 2465
;2464:
;2465:			trap_Cvar_VariableStringBuffer(cvarname, var , sizeof(var ) );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2466
;2466:			Value = atoi(var ); 
ADDRLP4 28
ARGP4
ADDRLP4 1052
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1052
INDIRI4
ASGNI4
line 2469
;2467:
;2468:			// items only got activate or disable
;2469:			if ( Value == 1 ) // if it's activated, disable it
ADDRLP4 24
INDIRI4
CNSTI4 1
NEI4 $1858
line 2470
;2470:				Value = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $1859
JUMPV
LABELV $1858
line 2472
;2471:			else
;2472:				Value = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
LABELV $1859
line 2474
;2473:
;2474:			trap_Cvar_Set(cvarname, va("%i",Value) );			
ADDRGP4 $1784
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2475
;2475:		}
ADDRGP4 $1834
JUMPV
LABELV $1833
line 2476
;2476:		else if ( Q_stricmp(name, "removeAllSecondary") == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1862
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1860
line 2477
;2477:		{
line 2478
;2478:			Com_Printf("removed all Secondary\n");
ADDRGP4 $1863
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2479
;2479:		}
ADDRGP4 $1861
JUMPV
LABELV $1860
line 2480
;2480:		else if ( Q_stricmp(name, "quitCGmenu") == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1866
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1864
line 2481
;2481:		{
line 2482
;2482:		 	CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 2483
;2483:	 		trap_Key_SetCatcher(0); 
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 2484
;2484:		}
ADDRGP4 $1865
JUMPV
LABELV $1864
line 2485
;2485:		else if ( Q_stricmp(name, "updateInventory") == 0 )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1869
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1867
line 2486
;2486:		{
line 2512
;2487:			char *command;
;2488:
;2489:			int primary ;
;2490:			int secondary;
;2491:			int priammo;
;2492:			int secammo;
;2493:			int mmgrenades;
;2494:
;2495:			int grenades;
;2496:			int fl_grenades;
;2497:			int sm_grenades;
;2498:			int kevlar;
;2499:			int helmet;
;2500:			int scope;
;2501:
;2502:			int gl;
;2503:			int bayonet;
;2504:			int lasersight;
;2505:
;2506:			char		var[MAX_TOKEN_CHARS];
;2507:
;2508:			gitem_t *it_primary;
;2509:			gitem_t *it_secondary;
;2510:
;2511:
;2512:			trap_Cvar_VariableStringBuffer("inven_lasersight", var , sizeof(var ) );
ADDRGP4 $1870
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2513
;2513:			lasersight = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1112
ADDRLP4 1124
INDIRI4
ASGNI4
line 2515
;2514:
;2515:			trap_Cvar_VariableStringBuffer("inven_bayonet", var , sizeof(var ) );
ADDRGP4 $1871
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2516
;2516:			bayonet = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1108
ADDRLP4 1128
INDIRI4
ASGNI4
line 2518
;2517:
;2518:			trap_Cvar_VariableStringBuffer("inven_grenadelauncher", var , sizeof(var ) );
ADDRGP4 $1872
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2519
;2519:			gl = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1104
ADDRLP4 1132
INDIRI4
ASGNI4
line 2521
;2520:
;2521:			trap_Cvar_VariableStringBuffer("inven_scope", var , sizeof(var ) );
ADDRGP4 $1873
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2522
;2522:			scope = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1136
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1100
ADDRLP4 1136
INDIRI4
ASGNI4
line 2524
;2523:
;2524:			trap_Cvar_VariableStringBuffer("inven_helmet", var , sizeof(var ) );
ADDRGP4 $1874
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2525
;2525:			helmet = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1096
ADDRLP4 1140
INDIRI4
ASGNI4
line 2527
;2526:
;2527:			trap_Cvar_VariableStringBuffer("inven_kevlar", var , sizeof(var ) );
ADDRGP4 $1875
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2528
;2528:			kevlar = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1144
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1092
ADDRLP4 1144
INDIRI4
ASGNI4
line 2530
;2529:
;2530:			trap_Cvar_VariableStringBuffer("inven_ammo_flash", var , sizeof(var ) );
ADDRGP4 $1876
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2531
;2531:			fl_grenades = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1084
ADDRLP4 1148
INDIRI4
ASGNI4
line 2533
;2532:
;2533:			trap_Cvar_VariableStringBuffer("inven_ammo_smoke", var , sizeof(var ) );
ADDRGP4 $1877
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2534
;2534:			sm_grenades = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1088
ADDRLP4 1152
INDIRI4
ASGNI4
line 2536
;2535:
;2536:			trap_Cvar_VariableStringBuffer("inven_ammo_mk26", var , sizeof(var ) );
ADDRGP4 $1878
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2537
;2537:			grenades = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1080
ADDRLP4 1156
INDIRI4
ASGNI4
line 2539
;2538:
;2539:			trap_Cvar_VariableStringBuffer("inven_ammo_40mmgren", var , sizeof(var ) );
ADDRGP4 $1879
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2540
;2540:			mmgrenades = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1076
ADDRLP4 1160
INDIRI4
ASGNI4
line 2542
;2541:
;2542:			trap_Cvar_VariableStringBuffer("inven_primary", var , sizeof(var ) );
ADDRGP4 $1880
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2543
;2543:			primary = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1056
ADDRLP4 1164
INDIRI4
ASGNI4
line 2545
;2544:
;2545:			trap_Cvar_VariableStringBuffer("inven_secondary", var , sizeof(var ) );
ADDRGP4 $1881
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2546
;2546:			secondary = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1168
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1168
INDIRI4
ASGNI4
line 2548
;2547:
;2548:			trap_Cvar_VariableStringBuffer("inven_ammo_primary", var , sizeof(var ) );
ADDRGP4 $1882
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2549
;2549:			priammo = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1068
ADDRLP4 1172
INDIRI4
ASGNI4
line 2551
;2550:
;2551:			trap_Cvar_VariableStringBuffer("inven_ammo_secondary", var , sizeof(var ) );
ADDRGP4 $1883
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2552
;2552:			secammo = atoi(var);
ADDRLP4 32
ARGP4
ADDRLP4 1176
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1072
ADDRLP4 1176
INDIRI4
ASGNI4
line 2554
;2553:
;2554:			if ( primary )
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $1884
line 2555
;2555:				it_primary = BG_FindItemForWeapon( primary );
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1180
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1180
INDIRP4
ASGNP4
LABELV $1884
line 2556
;2556:			if ( secondary )
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1886
line 2557
;2557:				it_secondary = BG_FindItemForWeapon( secondary );
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1184
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1184
INDIRP4
ASGNP4
LABELV $1886
line 2561
;2558:
;2559:		//	<cmd>  <primary> <secondary> <PriAmmo> <SecAmmo> <40mm grenades> <Grenades> <Fl Grenades> <kevlar> <helmet> <scope> <gl> <bayonet> <lasersight> 
;2560:
;2561:			command = va("%i %i %i %i %i %i %i %i %i %i %i %i %i %i\n", primary,secondary,priammo,secammo,
ADDRGP4 $1888
ARGP4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRLP4 1084
INDIRI4
ARGI4
ADDRLP4 1088
INDIRI4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRLP4 1108
INDIRI4
ARGI4
ADDRLP4 1112
INDIRI4
ARGI4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1064
ADDRLP4 1188
INDIRP4
ASGNP4
line 2564
;2562:			mmgrenades,grenades,fl_grenades,sm_grenades, kevlar,helmet,scope,gl,bayonet,lasersight );
;2563:
;2564:			CG_Printf("sended inventory: %s\n",command );
ADDRGP4 $1889
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 2566
;2565:			//then send the commmand		
;2566:			trap_SendClientCommand( va("inventory %s",command) );  
ADDRGP4 $1890
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 2568
;2567:
;2568:		}
LABELV $1867
LABELV $1865
LABELV $1861
LABELV $1834
LABELV $1830
LABELV $1826
line 2569
;2569:	}
LABELV $1823
line 2570
;2570:} 
LABELV $1822
endproc CG_DoWeaponConfig 1196 60
export CG_Text
proc CG_Text 0 4
line 2573
;2571:
;2572:void CG_Text( int when, const char *text )
;2573:{
line 2574
;2574:	trap_SendConsoleCommand(text );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2575
;2575:}
LABELV $1891
endproc CG_Text 0 4
export CG_AssetCache
proc CG_AssetCache 68 4
line 2578
;2576:
;2577:void CG_AssetCache( void ) 
;2578:{
line 2584
;2579:	//if (Assets.textFont == NULL) {
;2580:	//  trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;2581:	//}
;2582:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;2583:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;2584:	cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
ADDRGP4 $1895
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61660
ADDRLP4 0
INDIRI4
ASGNI4
line 2585
;2585:	cgDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $1898
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61816
ADDRLP4 4
INDIRI4
ASGNI4
line 2586
;2586:	cgDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $1901
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61820
ADDRLP4 8
INDIRI4
ASGNI4
line 2587
;2587:	cgDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $1905
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61820+4
ADDRLP4 12
INDIRI4
ASGNI4
line 2588
;2588:	cgDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $1909
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61820+8
ADDRLP4 16
INDIRI4
ASGNI4
line 2589
;2589:	cgDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $1913
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61820+12
ADDRLP4 20
INDIRI4
ASGNI4
line 2590
;2590:	cgDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $1917
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61820+16
ADDRLP4 24
INDIRI4
ASGNI4
line 2591
;2591:	cgDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $1921
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61820+20
ADDRLP4 28
INDIRI4
ASGNI4
line 2592
;2592:	cgDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $1925
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61820+24
ADDRLP4 32
INDIRI4
ASGNI4
line 2593
;2593:	cgDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
ADDRGP4 $1928
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61680
ADDRLP4 36
INDIRI4
ASGNI4
line 2594
;2594:	cgDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
ADDRGP4 $1931
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61668
ADDRLP4 40
INDIRI4
ASGNI4
line 2595
;2595:	cgDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
ADDRGP4 $1934
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61664
ADDRLP4 44
INDIRI4
ASGNI4
line 2596
;2596:	cgDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
ADDRGP4 $1937
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61672
ADDRLP4 48
INDIRI4
ASGNI4
line 2597
;2597:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
ADDRGP4 $1940
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61676
ADDRLP4 52
INDIRI4
ASGNI4
line 2598
;2598:	cgDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
ADDRGP4 $1943
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61684
ADDRLP4 56
INDIRI4
ASGNI4
line 2599
;2599:	cgDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
ADDRGP4 $1946
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61700
ADDRLP4 60
INDIRI4
ASGNI4
line 2600
;2600:	cgDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
ADDRGP4 $1949
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+232+61704
ADDRLP4 64
INDIRI4
ASGNI4
line 2601
;2601:}
LABELV $1892
endproc CG_AssetCache 68 4
proc CG_RunMenuScript 12 8
line 2604
;2602: 
;2603:
;2604:static void CG_RunMenuScript(char **args) {
line 2607
;2605:	const char *name; 
;2606: 
;2607:	CG_Printf("uiscript \n" ); 
ADDRGP4 $1951
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 2609
;2608:
;2609:	if (String_Parse(args, &name))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1952
line 2610
;2610:	{
line 2611
;2611:		if (Q_stricmp(name, "quitCGmenu") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1866
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1954
line 2612
;2612:				CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 2613
;2613:	 			trap_Key_SetCatcher(0); 
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 2614
;2614:		}
LABELV $1954
line 2615
;2615:	}
LABELV $1952
line 2617
;2616: 
;2617:}
LABELV $1950
endproc CG_RunMenuScript 12 8
export CG_LoadHudMenu
proc CG_LoadHudMenu 1036 12
line 2624
;2618:/*
;2619:=================
;2620:CG_LoadHudMenu();
;2621:
;2622:=================
;2623:*/
;2624:void CG_LoadHudMenu() {
line 2628
;2625:	char buff[1024];
;2626:	const char *hudSet;
;2627:
;2628:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
ADDRGP4 cgDC
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 2629
;2629:	cgDC.setColor = &trap_R_SetColor;
ADDRGP4 cgDC+4
ADDRGP4 trap_R_SetColor
ASGNP4
line 2630
;2630:	cgDC.drawHandlePic = &CG_DrawPic;
ADDRGP4 cgDC+8
ADDRGP4 CG_DrawPic
ASGNP4
line 2631
;2631:	cgDC.drawStretchPic = &trap_R_DrawStretchPic;
ADDRGP4 cgDC+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 2632
;2632:	cgDC.drawText = &CG_Text_Paint;
ADDRGP4 cgDC+16
ADDRGP4 CG_Text_Paint
ASGNP4
line 2633
;2633:	cgDC.textWidth = &CG_Text_Width;
ADDRGP4 cgDC+20
ADDRGP4 CG_Text_Width
ASGNP4
line 2634
;2634:	cgDC.textHeight = &CG_Text_Height;
ADDRGP4 cgDC+24
ADDRGP4 CG_Text_Height
ASGNP4
line 2635
;2635:	cgDC.registerModel = &trap_R_RegisterModel;
ADDRGP4 cgDC+28
ADDRGP4 trap_R_RegisterModel
ASGNP4
line 2636
;2636:	cgDC.modelBounds = &trap_R_ModelBounds;
ADDRGP4 cgDC+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 2637
;2637:	cgDC.fillRect = &CG_FillRect;
ADDRGP4 cgDC+36
ADDRGP4 CG_FillRect
ASGNP4
line 2638
;2638:	cgDC.drawRect = &CG_DrawRect;   
ADDRGP4 cgDC+40
ADDRGP4 CG_DrawRect
ASGNP4
line 2639
;2639:	cgDC.drawSides = &CG_DrawSides;
ADDRGP4 cgDC+44
ADDRGP4 CG_DrawSides
ASGNP4
line 2640
;2640:	cgDC.drawTopBottom = &CG_DrawTopBottom;
ADDRGP4 cgDC+48
ADDRGP4 CG_DrawTopBottom
ASGNP4
line 2641
;2641:	cgDC.clearScene = &trap_R_ClearScene;
ADDRGP4 cgDC+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 2642
;2642:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
ADDRGP4 cgDC+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 2643
;2643:	cgDC.renderScene = &trap_R_RenderScene;
ADDRGP4 cgDC+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 2644
;2644:	cgDC.registerFont = &trap_R_RegisterFont;
ADDRGP4 cgDC+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 2645
;2645:	cgDC.ownerDrawItem = &CG_OwnerDraw;
ADDRGP4 cgDC+68
ADDRGP4 CG_OwnerDraw
ASGNP4
line 2646
;2646:	cgDC.getValue = &CG_GetValue;
ADDRGP4 cgDC+72
ADDRGP4 CG_GetValue
ASGNP4
line 2647
;2647:	cgDC.ownerDrawVisible = &CG_OwnerDrawVisible;
ADDRGP4 cgDC+76
ADDRGP4 CG_OwnerDrawVisible
ASGNP4
line 2648
;2648:	cgDC.runScript = &CG_RunMenuScript;
ADDRGP4 cgDC+80
ADDRGP4 CG_RunMenuScript
ASGNP4
line 2649
;2649:	cgDC.setWeapon = &CG_DoWeaponConfig; // ns!
ADDRGP4 cgDC+84
ADDRGP4 CG_DoWeaponConfig
ASGNP4
line 2650
;2650:	cgDC.getTeamColor = &CG_GetTeamColor;
ADDRGP4 cgDC+88
ADDRGP4 CG_GetTeamColor
ASGNP4
line 2651
;2651:	cgDC.setCVar = trap_Cvar_Set;
ADDRGP4 cgDC+100
ADDRGP4 trap_Cvar_Set
ASGNP4
line 2652
;2652:	cgDC.getCVarString = trap_Cvar_VariableStringBuffer;
ADDRGP4 cgDC+92
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 2653
;2653:	cgDC.getCVarValue = CG_Cvar_Get;
ADDRGP4 cgDC+96
ADDRGP4 CG_Cvar_Get
ASGNP4
line 2654
;2654:	cgDC.drawTextWithCursor = &CG_Text_PaintWithCursor;
ADDRGP4 cgDC+104
ADDRGP4 CG_Text_PaintWithCursor
ASGNP4
line 2657
;2655:	//cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;2656:	//cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;2657:	cgDC.startLocalSound = &trap_S_StartLocalSound;
ADDRGP4 cgDC+116
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 2658
;2658:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
ADDRGP4 cgDC+120
ADDRGP4 CG_OwnerDrawHandleKey
ASGNP4
line 2659
;2659:	cgDC.feederCount = &CG_FeederCount;
ADDRGP4 cgDC+124
ADDRGP4 CG_FeederCount
ASGNP4
line 2660
;2660:	cgDC.feederItemImage = &CG_FeederItemImage;
ADDRGP4 cgDC+132
ADDRGP4 CG_FeederItemImage
ASGNP4
line 2661
;2661:	cgDC.feederItemText = &CG_FeederItemText;
ADDRGP4 cgDC+128
ADDRGP4 CG_FeederItemText
ASGNP4
line 2662
;2662:	cgDC.feederSelection = &CG_FeederSelection;
ADDRGP4 cgDC+136
ADDRGP4 CG_FeederSelection
ASGNP4
line 2666
;2663:	//cgDC.setBinding = &trap_Key_SetBinding;
;2664:	//cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;2665:	//cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;2666:	cgDC.executeText = &CG_Text;
ADDRGP4 cgDC+152
ADDRGP4 CG_Text
ASGNP4
line 2667
;2667:	cgDC.Error = &Com_Error; 
ADDRGP4 cgDC+156
ADDRGP4 Com_Error
ASGNP4
line 2668
;2668:	cgDC.Print = &Com_Printf; 
ADDRGP4 cgDC+160
ADDRGP4 Com_Printf
ASGNP4
line 2669
;2669:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
ADDRGP4 cgDC+168
ADDRGP4 CG_OwnerDrawWidth
ASGNP4
line 2671
;2670:	//cgDC.Pause = &CG_Pause;
;2671:	cgDC.registerSound = &trap_S_RegisterSound;
ADDRGP4 cgDC+172
ADDRGP4 trap_S_RegisterSound
ASGNP4
line 2672
;2672:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 cgDC+176
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 2673
;2673:	cgDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
ADDRGP4 cgDC+180
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 2674
;2674:	cgDC.playCinematic = &CG_PlayCinematic;
ADDRGP4 cgDC+184
ADDRGP4 CG_PlayCinematic
ASGNP4
line 2675
;2675:	cgDC.stopCinematic = &CG_StopCinematic;
ADDRGP4 cgDC+188
ADDRGP4 CG_StopCinematic
ASGNP4
line 2676
;2676:	cgDC.drawCinematic = &CG_DrawCinematic;
ADDRGP4 cgDC+192
ADDRGP4 CG_DrawCinematic
ASGNP4
line 2677
;2677:	cgDC.runCinematicFrame = &CG_RunCinematicFrame;
ADDRGP4 cgDC+196
ADDRGP4 CG_RunCinematicFrame
ASGNP4
line 2679
;2678:	
;2679:	Init_Display(&cgDC);
ADDRGP4 cgDC
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 2683
;2680:
;2681: //	String_Init();
;2682:  
;2683:	cgDC.cursor	= trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $1267
ARGP4
ADDRLP4 1028
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+73460
ADDRLP4 1028
INDIRI4
ASGNI4
line 2684
;2684:	cgDC.whiteShader = trap_R_RegisterShaderNoMip( "white" );
ADDRGP4 $2002
ARGP4
ADDRLP4 1032
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+73452
ADDRLP4 1032
INDIRI4
ASGNI4
line 2686
;2685:
;2686:	CG_AssetCache();
ADDRGP4 CG_AssetCache
CALLV
pop
line 2688
;2687:
;2688:	Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 2690
;2689:	
;2690:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
ADDRGP4 $203
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2691
;2691:	hudSet = buff;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 2692
;2692:	if (hudSet[0] == '\0') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2003
line 2693
;2693:		hudSet = "ui/hud.txt";
ADDRLP4 0
ADDRGP4 $204
ASGNP4
line 2694
;2694:	}
LABELV $2003
line 2696
;2695:
;2696:	CG_LoadMenus(hudSet);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadMenus
CALLV
pop
line 2699
;2697:
;2698:	// parse the hardcoded menu
;2699:	CG_ParseMenu("ui/hud_radio.menu");
ADDRGP4 $2005
ARGP4
ADDRGP4 CG_ParseMenu
CALLV
pop
line 2700
;2700:}
LABELV $1956
endproc CG_LoadHudMenu 1036 12
proc CG_ParseCvarFile 20080 12
line 2714
;2701:
;2702:
;2703:#endif
;2704:
;2705:/*
;2706:======================
;2707:CG_ParseCvarFile
;2708:
;2709:Read a cvarfile for blocked cvars
;2710:======================
;2711:*/
;2712:#define CVAR_FILENAME	"scripts/cvars.cfg"
;2713:
;2714:static  qboolean	CG_ParseCvarFile( void ) {
line 2723
;2715:	char		*text_p;
;2716:	int			len;
;2717:	int			i;
;2718:	char		*token;
;2719: 	char		text[20000];
;2720:	fileHandle_t	f; 
;2721:
;2722: 
;2723:	memset( &cg.blockedCvars , 0, sizeof(cg.blockedCvars ) );
ADDRGP4 cg+117968
ARGP4
CNSTI4 0
ARGI4
CNSTI4 49408
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2725
;2724:	// load the file
;2725:	len = trap_FS_FOpenFile( CVAR_FILENAME, &f, FS_READ );
ADDRGP4 $2009
ARGP4
ADDRLP4 20016
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20020
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20020
INDIRI4
ASGNI4
line 2726
;2726:	if ( len <= 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $2010
line 2727
;2727:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2006
JUMPV
LABELV $2010
line 2729
;2728:	}
;2729:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $2012
line 2730
;2730:		CG_Printf( "File %s too long\n", CVAR_FILENAME );
ADDRGP4 $2014
ARGP4
ADDRGP4 $2009
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 2731
;2731:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2006
JUMPV
LABELV $2012
line 2733
;2732:	}
;2733:	trap_FS_Read( text, len, f );
ADDRLP4 16
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20016
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 2734
;2734:	text[len] = 0;
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 2735
;2735:	trap_FS_FCloseFile( f );
ADDRLP4 20016
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 2738
;2736:
;2737:	// parse the text
;2738:	text_p = text; 
ADDRLP4 8
ADDRLP4 16
ASGNP4
line 2740
;2739:
;2740:	cg.num_blockedCvars = 0; 
ADDRGP4 cg+167376
CNSTI4 0
ASGNI4
line 2743
;2741:
;2742:	// read information  
;2743:	for ( i = 0 ; i < MAX_BLOCKEDCVARS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2016
line 2746
;2744:
;2745:		// get string
;2746:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20024
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20024
INDIRP4
ASGNP4
line 2747
;2747:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2022
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20032
INDIRI4
CNSTI4 0
GTI4 $2020
LABELV $2022
line 2748
;2748:			break;
ADDRGP4 $2018
JUMPV
LABELV $2020
line 2750
;2749:		}
;2750:		strcpy( cg.blockedCvars[i].string, token ); 
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+117968+516
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2753
;2751: 
;2752:		// get min value
;2753:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 2754
;2754:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2027
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
GTI4 $2025
LABELV $2027
line 2755
;2755:			break;
ADDRGP4 $2018
JUMPV
LABELV $2025
line 2757
;2756:		} 
;2757:		strcpy( cg.blockedCvars[i].minvalue, token ); 
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+117968+256
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2760
;2758:
;2759:		// get max value
;2760:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 2761
;2761:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2032
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
GTI4 $2030
LABELV $2032
line 2762
;2762:			break;
ADDRGP4 $2018
JUMPV
LABELV $2030
line 2764
;2763:		} 
;2764:		strcpy( cg.blockedCvars[i].maxvalue, token ); 
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+117968
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2767
;2765:
;2766:		// vid_restart
;2767:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 2768
;2768:		if ( !token || strlen(token) <= 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2036
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
GTI4 $2034
LABELV $2036
line 2769
;2769:			break; 
ADDRGP4 $2018
JUMPV
LABELV $2034
line 2772
;2770:		}
;2771:		
;2772:		if ( !Q_stricmp( "yes", token ) )
ADDRGP4 $2039
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $2037
line 2773
;2773:			cg.blockedCvars[i].restart_video = qtrue;
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+117968+512
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2038
JUMPV
LABELV $2037
line 2775
;2774:		else
;2775:			cg.blockedCvars[i].restart_video = qfalse;
CNSTI4 772
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+117968+512
ADDP4
CNSTI4 0
ASGNI4
LABELV $2038
line 2777
;2776:
;2777:		cg.num_blockedCvars++;
ADDRLP4 20076
ADDRGP4 cg+167376
ASGNP4
ADDRLP4 20076
INDIRP4
ADDRLP4 20076
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2780
;2778:
;2779:	//	CG_Printf("parsed blocked cvar: %s min %s max %s restart video %i\n", cg.blockedCvars[i].string, cg.blockedCvars[i].minvalue, cg.blockedCvars[i].maxvalue, cg.blockedCvars[i].restart_video );
;2780:	}
LABELV $2017
line 2743
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $2016
LABELV $2018
line 2785
;2781:    
;2782:	// BLUTENGEL 07.01.2004
;2783:	// removes as noone really wants to know that!
;2784:	// CG_Printf("parsed %i blocked cvars.\n", cg.num_blockedCvars );
;2785:	return qtrue;
CNSTI4 1
RETI4
LABELV $2006
endproc CG_ParseCvarFile 20080 12
export CG_Init
proc CG_Init 68 12
line 2797
;2786:}
;2787:
;2788:/*
;2789:=================
;2790:CG_Init
;2791:
;2792:Called after every level change or subsystem restart
;2793:Will perform callbacks to make the loading info screen update.
;2794:=================
;2795:*/ 
;2796:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum )
;2797:{
line 2800
;2798:	const char	*s; 
;2799:	// clear everything
;2800:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 610676
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2801
;2801:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 202004
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2802
;2802:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 745472
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2803
;2803:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15392
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2804
;2804:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2806
;2805:
;2806:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 2808
;2807:
;2808:	trap_Cvar_Set ( "con_notifytime", "-2" );
ADDRGP4 $2047
ARGP4
ADDRGP4 $2048
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2810
;2809:  	
;2810:	trap_SendConsoleCommand( "bind f1 \"vote yes\"\n" );
ADDRGP4 $2049
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2811
;2811:	trap_SendConsoleCommand( "bind f2 \"vote no\"\n" );
ADDRGP4 $2050
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2814
;2812:
;2813:	// init loading bar.
;2814:	CG_LoadBarInit(); 
ADDRGP4 CG_LoadBarInit
CALLV
pop
line 2816
;2815:  
;2816:	CG_LoadingBarSetMax( 216 );
CNSTI4 216
ARGI4
ADDRGP4 CG_LoadingBarSetMax
CALLV
pop
line 2818
;2817:
;2818:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31448
ADDRFP4 0
INDIRI4
ASGNI4
line 2819
;2819:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31444
ADDRFP4 4
INDIRI4
ASGNI4
line 2822
;2820:	
;2821:	// load a few needed things before we do any screen updates
;2822:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $2054
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084
ADDRLP4 4
INDIRI4
ASGNI4
line 2823
;2823:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $2002
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+205084+16
ADDRLP4 8
INDIRI4
ASGNI4
line 2824
;2824:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $2059
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+4
ADDRLP4 12
INDIRI4
ASGNI4
line 2825
;2825:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $2062
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+8
ADDRLP4 16
INDIRI4
ASGNI4
line 2826
;2826:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $2065
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+205084+12
ADDRLP4 20
INDIRI4
ASGNI4
line 2829
;2827:	
;2828:	// init crosshair mod
;2829:	cg.crosshairMod = 0;
ADDRGP4 cg+116364
CNSTI4 0
ASGNI4
line 2830
;2830:	cg.ladderWeaponTime = 0;
ADDRGP4 cg+116380
CNSTI4 0
ASGNI4
line 2831
;2831:	cg.crosshairFadeIn = qtrue;
ADDRGP4 cg+116376
CNSTI4 1
ASGNI4
line 2832
;2832:	cg.crosshairTime = cg.time;
ADDRGP4 cg+115716
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2833
;2833:	cg.crosshairFinishedChange = qtrue;
ADDRGP4 cg+116372
CNSTI4 1
ASGNI4
line 2834
;2834:	cg.cameraActive = qfalse;
ADDRGP4 cg+116652
CNSTI4 0
ASGNI4
line 2836
;2835:
;2836:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2838
;2837:
;2838:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 2841
;2839:
;2840:	
;2841:	if ( r_lightVertex.integer )
ADDRGP4 r_lightVertex+12
INDIRI4
CNSTI4 0
EQI4 $2073
line 2842
;2842:		trap_Cvar_Set( "r_vertexlight", "1" );
ADDRGP4 $2076
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $2074
JUMPV
LABELV $2073
line 2844
;2843:	else
;2844:		trap_Cvar_Set( "r_vertexlight", "0" );
ADDRGP4 $2076
ARGP4
ADDRGP4 $115
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $2074
line 2846
;2845:
;2846:	CG_LoadingBarUpdate(3);
CNSTI4 3
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2848
;2847:
;2848:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 2850
;2849:
;2850:	CG_LoadingBarUpdate(2);
CNSTI4 2
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2852
;2851:
;2852:	cg.weaponSelect = WP_KHURKURI;
ADDRGP4 cg+108944
CNSTI4 1
ASGNI4
line 2854
;2853:
;2854:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
ADDRLP4 24
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+32504
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 cgs+32500
ADDRLP4 24
INDIRI4
ASGNI4
line 2855
;2855:	cgs.flagStatus = -1;
ADDRGP4 cgs+32508
CNSTI4 -1
ASGNI4
line 2859
;2856:	// old servers
;2857:
;2858:	// get the rendering configuration from the client system
;2859:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 2860
;2860:	cgs.screenXScale = cgs.glconfig.vidWidth / 640.0;
ADDRGP4 cgs+31432
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
ASGNF4
line 2861
;2861:	cgs.screenYScale = cgs.glconfig.vidHeight / 480.0;
ADDRGP4 cgs+31436
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1139802112
DIVF4
ASGNF4
line 2864
;2862:
;2863:	// get the gamestate from the client system
;2864:	trap_GetGameState( &cgs.gameState ); 
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 2866
;2865://	
;2866:	CG_LoadingBarUpdate(2);
CNSTI4 2
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2869
;2867:
;2868:	// check version
;2869:	s = CG_ConfigString( CS_GAME_VERSION );
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2870
;2870:	if ( strcmp( s, GAME_VERSION ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2088
line 2871
;2871:		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $2090
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2872
;2872:	}
LABELV $2088
line 2873
;2873:	else {
line 2877
;2874:		// BLUTENGEL 07.01.2004
;2875:		// removed as noone really wants to know that!
;2876:		// CG_Printf("Connecting to Server:%s Client: %s\n", s, GAME_VERSION );
;2877:	}
LABELV $2089
line 2879
;2878:
;2879:	s = CG_ConfigString( CS_LEVEL_START_TIME );
CNSTI4 21
ARGI4
ADDRLP4 36
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 2880
;2880:	cgs.levelStartTime = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+32488
ADDRLP4 40
INDIRI4
ASGNI4
line 2882
;2881:  
;2882:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 2884
;2883:
;2884:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2888
;2885:
;2886:
;2887:	// load the new map
;2888:	CG_LoadingString( "collision map" );
ADDRGP4 $2092
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2890
;2889:
;2890:	CG_LoadingBarUpdate(2);
CNSTI4 2
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2892
;2891:
;2892:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31480
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 2895
;2893:	
;2894:
;2895:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2899
;2896: //	String_Init();
;2897:
;2898://	CG_AssetCache();
;2899:	CG_LoadHudMenu();      // load new hud stuff 
ADDRGP4 CG_LoadHudMenu
CALLV
pop
line 2901
;2900:
;2901:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2903
;2902:
;2903:	{
line 2907
;2904:		const char	*info;
;2905:		const char	*s;
;2906:
;2907:		strcpy( cgs.cleanLastMap, "unknown");
ADDRGP4 cgs+214296
ARGP4
ADDRGP4 $2095
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2909
;2908:		
;2909:		info = CG_ConfigString( CS_SEALINFO );
CNSTI4 31
ARGI4
ADDRLP4 52
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 52
INDIRP4
ASGNP4
line 2910
;2910:		s = Info_ValueForKey( info, "lastmap" );
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $2096
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 56
INDIRP4
ASGNP4
line 2912
;2911:
;2912:		strcpy( cgs.cleanLastMap, s );
ADDRGP4 cgs+214296
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2916
;2913:
;2914://		CG_Printf("Lastmap: %s\n", cgs.cleanLastMap );
;2915:
;2916:		if ( !CG_ParseBriefingFile( cgs.cleanMapName ) )
ADDRGP4 cgs+214232
ARGP4
ADDRLP4 60
ADDRGP4 CG_ParseBriefingFile
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $2098
line 2917
;2917:			CG_Printf("Couldn't load briefing file for : %s\n", cgs.mapname);
ADDRGP4 $2101
ARGP4
ADDRGP4 cgs+31480
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
ADDRGP4 $2099
JUMPV
LABELV $2098
line 2919
;2918:		else 
;2919:			cg.viewMissionInfo = qtrue; // show the misson info on first connect
ADDRGP4 cg+171504
CNSTI4 1
ASGNI4
LABELV $2099
line 2921
;2920:
;2921:		CG_ParseHelpFile( );
ADDRGP4 CG_ParseHelpFile
CALLI4
pop
line 2922
;2922:	}
line 2924
;2923:
;2924:	CG_LoadingBarUpdate(2);
CNSTI4 2
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2926
;2925:
;2926:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 2928
;2927:
;2928:	CG_LoadingString( "sounds" );
ADDRGP4 $2105
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2930
;2929:
;2930:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 2932
;2931:
;2932:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2934
;2933:
;2934:	CG_LoadingString( "graphics" );
ADDRGP4 $2106
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2936
;2935:
;2936:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 2938
;2937:
;2938:	CG_LoadingBarUpdate(30);
CNSTI4 30
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2940
;2939:
;2940:	CG_LoadingString( "Playermodels" );
ADDRGP4 $2107
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2942
;2941:
;2942:	CG_CacheAllModels( );	
ADDRGP4 CG_CacheAllModels
CALLV
pop
line 2944
;2943:
;2944:	CG_RegisterClients();		// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2946
;2945:
;2946:	CG_LoadingBarUpdate(10); 
CNSTI4 10
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2948
;2947:
;2948:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2950
;2949:
;2950:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2952
;2951:
;2952:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2954
;2953:
;2954:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2956
;2955:
;2956:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2959
;2957:
;2958:	// remove the last loading update
;2959:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+109804
CNSTI1 0
ASGNI1
line 2962
;2960:
;2961:	// Make sure we have update values (scores)
;2962:	CG_SetConfigValues();
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 2964
;2963:
;2964:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2966
;2965:
;2966:	CG_LoadingString( "" );
ADDRGP4 $322
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2968
;2967:
;2968:	CG_LoadingBarUpdate(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 2971
;2969:
;2970:#ifdef MISSIONPACK
;2971:	CG_InitTeamChat();
ADDRGP4 CG_InitTeamChat
CALLV
pop
line 2974
;2972:#endif
;2973:
;2974:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2976
;2975:
;2976:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2978
;2977:// Navy Seals ++
;2978:	CG_ParseWeaponAnimationFile("scripts/weapon_mp5.cfg", WP_MP5);
ADDRGP4 $2110
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2979
;2979:	CG_ParseWeaponAnimationFile("scripts/weapon_pdw.cfg", WP_PDW);
ADDRGP4 $2111
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2980
;2980: 	CG_ParseWeaponAnimationFile("scripts/weapon_ak47-bg15.cfg", WP_AK47 );
ADDRGP4 $2112
ARGP4
CNSTI4 15
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2981
;2981:	CG_ParseWeaponAnimationFile("scripts/weapon_mk23.cfg", WP_MK23);
ADDRGP4 $2113
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2982
;2982:	CG_ParseWeaponAnimationFile("scripts/weapon_mk23.cfg", WP_P9S);
ADDRGP4 $2113
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2983
;2983:	CG_ParseWeaponAnimationFile("scripts/weapon_glock30.cfg", WP_GLOCK);
ADDRGP4 $2114
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2984
;2984:	CG_ParseWeaponAnimationFile("scripts/weapon_psg1.cfg", WP_PSG1);
ADDRGP4 $2115
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2985
;2985:	CG_ParseWeaponAnimationFile("scripts/weapon_macmillan.cfg", WP_MACMILLAN);
ADDRGP4 $2116
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2986
;2986: 	CG_ParseWeaponAnimationFile("scripts/weapon_m4-m203.cfg", WP_M4 );
ADDRGP4 $2117
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2987
;2987:	CG_ParseWeaponAnimationFile("scripts/weapon_knife_t.cfg", WP_KHURKURI);
ADDRGP4 $2118
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2988
;2988:	CG_ParseWeaponAnimationFile("scripts/weapon_knife_t.cfg", WP_SEALKNIFE);
ADDRGP4 $2118
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2989
;2989:	CG_ParseWeaponAnimationFile("scripts/weapon_870.cfg", WP_870);
ADDRGP4 $2119
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2990
;2990:	CG_ParseWeaponAnimationFile("scripts/weapon_m590.cfg", WP_M590);
ADDRGP4 $2120
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2991
;2991:	CG_ParseWeaponAnimationFile("scripts/weapon_g_mk26.cfg", WP_GRENADE);
ADDRGP4 $2121
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2992
;2992:	CG_ParseWeaponAnimationFile("scripts/weapon_c4.cfg", WP_C4);
ADDRGP4 $2122
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2993
;2993:	CG_ParseWeaponAnimationFile("scripts/weapon_mac10.cfg", WP_MAC10);
ADDRGP4 $2123
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2994
;2994:	CG_ParseWeaponAnimationFile("scripts/weapon_sw40t.cfg", WP_SW40T);
ADDRGP4 $2124
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2995
;2995:	CG_ParseWeaponAnimationFile("scripts/weapon_spas15.cfg", WP_SPAS15);
ADDRGP4 $2125
ARGP4
CNSTI4 21
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2996
;2996:	CG_ParseWeaponAnimationFile("scripts/weapon_g_flashbang.cfg", WP_FLASHBANG);
ADDRGP4 $2126
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2997
;2997:	CG_ParseWeaponAnimationFile("scripts/weapon_m14.cfg", WP_M14 );
ADDRGP4 $2127
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2998
;2998:	CG_ParseWeaponAnimationFile("scripts/weapon_deagle.cfg", WP_DEAGLE );
ADDRGP4 $2128
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 2999
;2999:	CG_ParseWeaponAnimationFile("scripts/weapon_sw629.cfg", WP_SW629 );
ADDRGP4 $2129
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 3000
;3000:	CG_ParseWeaponAnimationFile("scripts/weapon_g_smoke.cfg", WP_SMOKE );
ADDRGP4 $2130
ARGP4
CNSTI4 25
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 3001
;3001:	CG_ParseWeaponAnimationFile("scripts/weapon_m249.cfg", WP_M249 );
ADDRGP4 $2131
ARGP4
CNSTI4 23
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 3002
;3002:	CG_ParseWeaponAnimationFile("scripts/weapon_sl8sd.cfg", WP_SL8SD );
ADDRGP4 $2132
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 3005
;3003:	
;3004:
;3005:	CG_ParseWeaponAnimationFile("scripts/weapon_bombcase.cfg", 28 );	
ADDRGP4 $2133
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 CG_ParseWeaponAnimationFile
CALLI4
pop
line 3007
;3006:
;3007:	cgs.infoPicLeft = trap_R_RegisterShader( va("briefing/%s_left", cgs.cleanMapName ) );
ADDRGP4 $2135
ARGP4
ADDRGP4 cgs+214232
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+610660
ADDRLP4 48
INDIRI4
ASGNI4
line 3008
;3008:	cgs.infoPicMiddle = trap_R_RegisterShader( va("briefing/%s_middle", cgs.cleanMapName ) );
ADDRGP4 $2138
ARGP4
ADDRGP4 cgs+214232
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+610664
ADDRLP4 56
INDIRI4
ASGNI4
line 3009
;3009:	cgs.infoPicRight = trap_R_RegisterShader( va("briefing/%s_right", cgs.cleanMapName ) );
ADDRGP4 $2141
ARGP4
ADDRGP4 cgs+214232
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+610668
ADDRLP4 64
INDIRI4
ASGNI4
line 3012
;3010:
;3011:
;3012:	CG_LoadingBarUpdate(10);
CNSTI4 10
ARGI4
ADDRGP4 CG_LoadingBarUpdate
CALLV
pop
line 3015
;3013:
;3014: 	// starting Anim In Idle [ keep in loop ]
;3015:	cg.predictedPlayerEntity.pe.weapAnim = WANIM_IDLE;
ADDRGP4 cg+108104+472+152
CNSTI4 6
ASGNI4
line 3016
;3016:	cg.predictedPlayerEntity.pe.nextweapAnim = WANIM_IDLE;
ADDRGP4 cg+108104+472+156
CNSTI4 6
ASGNI4
line 3019
;3017:
;3018:	// init us w/ 0 XP points
;3019:	cg.xpPoints = 0;
ADDRGP4 cg+115708
CNSTI4 0
ASGNI4
line 3021
;3020:
;3021:	CG_ParseCvarFile();
ADDRGP4 CG_ParseCvarFile
CALLI4
pop
line 3024
;3022:
;3023:	// clientscript
;3024:	CG_InitMemory();
ADDRGP4 CG_InitMemory
CALLV
pop
line 3025
;3025:	ClientScript_Init( );
ADDRGP4 ClientScript_Init
CALLV
pop
line 3028
;3026:	
;3027:
;3028:	if ( r_lightVertex.integer )
ADDRGP4 r_lightVertex+12
INDIRI4
CNSTI4 0
EQI4 $2150
line 3029
;3029:	{
line 3030
;3030:		trap_Cvar_Set( "r_vertexlight", "0" );
ADDRGP4 $2076
ARGP4
ADDRGP4 $115
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3031
;3031:	}
LABELV $2150
line 3033
;3032:
;3033:	trap_SendConsoleCommand( ";exec nssl/autoexec.cfg;" );
ADDRGP4 $2153
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 3036
;3034: // Navy Seals --
;3035:
;3036:}
LABELV $2045
endproc CG_Init 68 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 3045
;3037:
;3038:/*
;3039:=================
;3040:CG_Shutdown
;3041:
;3042:Called before every level change or subsystem restart
;3043:=================
;3044:*/
;3045:void CG_Shutdown( void ) {
line 3048
;3046:	// some mods may need to do cleanup work here,
;3047:	// like closing files or archiving session data
;3048:}
LABELV $2154
endproc CG_Shutdown 0 0
import CG_AddToChat
import ClientScript_ProcessWhileLoops
bss
export cg_timetocache
align 4
LABELV cg_timetocache
skip 272
export gameversion
align 4
LABELV gameversion
skip 272
export r_lightVertex
align 4
LABELV r_lightVertex
skip 272
export cg_drawScriptedUI
align 4
LABELV cg_drawScriptedUI
skip 272
export cg_timerCustom
align 4
LABELV cg_timerCustom
skip 272
export cg_hudAlpha2
align 4
LABELV cg_hudAlpha2
skip 272
export cg_hudAlpha1
align 4
LABELV cg_hudAlpha1
skip 272
export cg_hud2PosY
align 4
LABELV cg_hud2PosY
skip 272
export cg_hud2PosX
align 4
LABELV cg_hud2PosX
skip 272
export cg_hud1PosY
align 4
LABELV cg_hud1PosY
skip 272
export cg_hud1PosX
align 4
LABELV cg_hud1PosX
skip 272
export cg_timerPosY
align 4
LABELV cg_timerPosY
skip 272
export cg_timerPosX
align 4
LABELV cg_timerPosX
skip 272
export cg_hudScale
align 4
LABELV cg_hudScale
skip 272
export cg_hudStyle
align 4
LABELV cg_hudStyle
skip 272
export cg_weaponRoll
align 4
LABELV cg_weaponRoll
skip 272
export cg_weaponPitch
align 4
LABELV cg_weaponPitch
skip 272
export cg_weaponYaw
align 4
LABELV cg_weaponYaw
skip 272
export cg_radarY
align 4
LABELV cg_radarY
skip 272
export cg_radarX
align 4
LABELV cg_radarX
skip 272
export cg_radarUpdate
align 4
LABELV cg_radarUpdate
skip 272
export cg_drawRadar
align 4
LABELV cg_drawRadar
skip 272
export cg_qcmd_close
align 4
LABELV cg_qcmd_close
skip 272
export cg_crosshairWidth
align 4
LABELV cg_crosshairWidth
skip 272
export cg_useBandage
align 4
LABELV cg_useBandage
skip 272
export cg_smallGuns
align 4
LABELV cg_smallGuns
skip 272
export cg_lightmarks
align 4
LABELV cg_lightmarks
skip 272
export ui_assaultblocked4
align 4
LABELV ui_assaultblocked4
skip 272
export ui_assaultblocked3
align 4
LABELV ui_assaultblocked3
skip 272
export ui_assaultblocked2
align 4
LABELV ui_assaultblocked2
skip 272
export ui_assaultblocked1
align 4
LABELV ui_assaultblocked1
skip 272
export ui_bombtimer
align 4
LABELV ui_bombtimer
skip 272
export ui_assaulttimer4
align 4
LABELV ui_assaulttimer4
skip 272
export ui_assaulttimer3
align 4
LABELV ui_assaulttimer3
skip 272
export ui_assaulttimer2
align 4
LABELV ui_assaulttimer2
skip 272
export ui_assaulttimer1
align 4
LABELV ui_assaulttimer1
skip 272
export ui_viptimer
align 4
LABELV ui_viptimer
skip 272
export ui_roundtimerworld
align 4
LABELV ui_roundtimerworld
skip 272
export cg_viewHeight
align 4
LABELV cg_viewHeight
skip 272
export cg_isgun_step
align 4
LABELV cg_isgun_step
skip 272
export cg_isgun_pitch
align 4
LABELV cg_isgun_pitch
skip 272
export cg_isgun_yaw
align 4
LABELV cg_isgun_yaw
skip 272
export cg_isgun_roll
align 4
LABELV cg_isgun_roll
skip 272
export cg_isgun_x
align 4
LABELV cg_isgun_x
skip 272
export cg_isgun_y
align 4
LABELV cg_isgun_y
skip 272
export cg_isgun_z
align 4
LABELV cg_isgun_z
skip 272
export ui_bombstate
align 4
LABELV ui_bombstate
skip 272
export ui_assaultstate
align 4
LABELV ui_assaultstate
skip 272
export ui_tangopoints
align 4
LABELV ui_tangopoints
skip 272
export ui_sealpoints
align 4
LABELV ui_sealpoints
skip 272
export ui_players
align 4
LABELV ui_players
skip 272
export ui_tangoplayers
align 4
LABELV ui_tangoplayers
skip 272
export ui_sealplayers
align 4
LABELV ui_sealplayers
skip 272
export cg_crosshair_b
align 4
LABELV cg_crosshair_b
skip 272
export cg_crosshair_g
align 4
LABELV cg_crosshair_g
skip 272
export cg_crosshair_r
align 4
LABELV cg_crosshair_r
skip 272
export cg_customTracerColor
align 4
LABELV cg_customTracerColor
skip 272
export cg_pmove_msec
align 4
LABELV cg_pmove_msec
skip 272
export cg_hudFiles
align 4
LABELV cg_hudFiles
skip 272
export cg_bobyaw
align 4
LABELV cg_bobyaw
skip 272
export cg_runyaw
align 4
LABELV cg_runyaw
skip 272
export cgDC
align 4
LABELV cgDC
skip 73468
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
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
import CG_GetSelectedScore
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
export cg_lowAmmoWarning
align 4
LABELV cg_lowAmmoWarning
skip 272
export cg_crosshairFade
align 4
LABELV cg_crosshairFade
skip 272
export cg_bulletpredict
align 4
LABELV cg_bulletpredict
skip 272
export cg_qcmd_a
align 4
LABELV cg_qcmd_a
skip 272
export cg_qcmd_b
align 4
LABELV cg_qcmd_b
skip 272
export cg_qcmd_g
align 4
LABELV cg_qcmd_g
skip 272
export cg_qcmd_r
align 4
LABELV cg_qcmd_r
skip 272
export cg_qcmd_size
align 4
LABELV cg_qcmd_size
skip 272
export cg_qcmd_dscr0
align 4
LABELV cg_qcmd_dscr0
skip 272
export cg_qcmd_dscr9
align 4
LABELV cg_qcmd_dscr9
skip 272
export cg_qcmd_dscr8
align 4
LABELV cg_qcmd_dscr8
skip 272
export cg_qcmd_dscr7
align 4
LABELV cg_qcmd_dscr7
skip 272
export cg_qcmd_dscr6
align 4
LABELV cg_qcmd_dscr6
skip 272
export cg_qcmd_dscr5
align 4
LABELV cg_qcmd_dscr5
skip 272
export cg_qcmd_dscr4
align 4
LABELV cg_qcmd_dscr4
skip 272
export cg_qcmd_dscr3
align 4
LABELV cg_qcmd_dscr3
skip 272
export cg_qcmd_dscr2
align 4
LABELV cg_qcmd_dscr2
skip 272
export cg_qcmd_dscr1
align 4
LABELV cg_qcmd_dscr1
skip 272
export cg_qcmd_cmd0
align 4
LABELV cg_qcmd_cmd0
skip 272
export cg_qcmd_cmd9
align 4
LABELV cg_qcmd_cmd9
skip 272
export cg_qcmd_cmd8
align 4
LABELV cg_qcmd_cmd8
skip 272
export cg_qcmd_cmd7
align 4
LABELV cg_qcmd_cmd7
skip 272
export cg_qcmd_cmd6
align 4
LABELV cg_qcmd_cmd6
skip 272
export cg_qcmd_cmd5
align 4
LABELV cg_qcmd_cmd5
skip 272
export cg_qcmd_cmd4
align 4
LABELV cg_qcmd_cmd4
skip 272
export cg_qcmd_cmd3
align 4
LABELV cg_qcmd_cmd3
skip 272
export cg_qcmd_cmd2
align 4
LABELV cg_qcmd_cmd2
skip 272
export cg_qcmd_cmd1
align 4
LABELV cg_qcmd_cmd1
skip 272
export cg_qcmd_posy
align 4
LABELV cg_qcmd_posy
skip 272
export cg_qcmd_posx
align 4
LABELV cg_qcmd_posx
skip 272
export cg_newbeeTime
align 4
LABELV cg_newbeeTime
skip 272
export cg_autoReload
align 4
LABELV cg_autoReload
skip 272
export cg_antiLag
align 4
LABELV cg_antiLag
skip 272
export cg_goreLevel
align 4
LABELV cg_goreLevel
skip 272
export cg_chatBeep
align 4
LABELV cg_chatBeep
skip 272
export cg_showConsole
align 4
LABELV cg_showConsole
skip 272
export cg_chatHeight
align 4
LABELV cg_chatHeight
skip 272
export cg_chatTime
align 4
LABELV cg_chatTime
skip 272
export ui_friendlyfire
align 4
LABELV ui_friendlyfire
skip 272
export ui_roundtime
align 4
LABELV ui_roundtime
skip 272
export ui_timelimit
align 4
LABELV ui_timelimit
skip 272
export ui_teampointlimit
align 4
LABELV ui_teampointlimit
skip 272
export raise_tec
align 4
LABELV raise_tec
skip 272
export raise_sta
align 4
LABELV raise_sta
skip 272
export raise_stl
align 4
LABELV raise_stl
skip 272
export raise_str
align 4
LABELV raise_str
skip 272
export raise_spd
align 4
LABELV raise_spd
skip 272
export raise_acc
align 4
LABELV raise_acc
skip 272
export cg_disableTangoHandSkin
align 4
LABELV cg_disableTangoHandSkin
skip 272
export cg_disableHeadstuff
align 4
LABELV cg_disableHeadstuff
skip 272
export cg_newbeeHeight
align 4
LABELV cg_newbeeHeight
skip 272
export cg_correctgunFov
align 4
LABELV cg_correctgunFov
skip 272
export cg_grenadeSparks
align 4
LABELV cg_grenadeSparks
skip 272
export ui_gotbriefcase
align 4
LABELV ui_gotbriefcase
skip 272
export ui_isvip
align 4
LABELV ui_isvip
skip 272
export ui_gotbomb
align 4
LABELV ui_gotbomb
skip 272
export mi_assaultfield
align 4
LABELV mi_assaultfield
skip 272
export mi_blowup
align 4
LABELV mi_blowup
skip 272
export mi_viptime
align 4
LABELV mi_viptime
skip 272
export mi_viprescue
align 4
LABELV mi_viprescue
skip 272
export cg_wakemarkDistantTime
align 4
LABELV cg_wakemarkDistantTime
skip 272
export cg_wakemarkTime
align 4
LABELV cg_wakemarkTime
skip 272
export cg_bulletTracerWidth
align 4
LABELV cg_bulletTracerWidth
skip 272
export cg_bulletTracerLength
align 4
LABELV cg_bulletTracerLength
skip 272
export ui_team
align 4
LABELV ui_team
skip 272
export char_xp
align 4
LABELV char_xp
skip 272
export char_strength
align 4
LABELV char_strength
skip 272
export char_technical
align 4
LABELV char_technical
skip 272
export char_accuracy
align 4
LABELV char_accuracy
skip 272
export char_speed
align 4
LABELV char_speed
skip 272
export char_stealth
align 4
LABELV char_stealth
skip 272
export char_stamina
align 4
LABELV char_stamina
skip 272
export cg_particleTime
align 4
LABELV cg_particleTime
skip 272
export cg_gunSmokeTime
align 4
LABELV cg_gunSmokeTime
skip 272
export cg_lowEffects
align 4
LABELV cg_lowEffects
skip 272
export cg_atmosphericEffects
align 4
LABELV cg_atmosphericEffects
skip 272
export cg_enableTimeSelect
align 4
LABELV cg_enableTimeSelect
skip 272
export cg_enableDust
align 4
LABELV cg_enableDust
skip 272
export cg_enableBreath
align 4
LABELV cg_enableBreath
skip 272
export pmodel_o
align 4
LABELV pmodel_o
skip 272
export cg_gunSmoke
align 4
LABELV cg_gunSmoke
skip 272
export test_w
align 4
LABELV test_w
skip 272
export test_h
align 4
LABELV test_h
skip 272
export test_y
align 4
LABELV test_y
skip 272
export test_x
align 4
LABELV test_x
skip 272
import cg_debugAlloc
export cg_bigFont
align 4
LABELV cg_bigFont
skip 272
export cg_smallFont
align 4
LABELV cg_smallFont
skip 272
export cg_cameraMode
align 4
LABELV cg_cameraMode
skip 272
export cg_timescale
align 4
LABELV cg_timescale
skip 272
export cg_timescaleFadeSpeed
align 4
LABELV cg_timescaleFadeSpeed
skip 272
export cg_timescaleFadeEnd
align 4
LABELV cg_timescaleFadeEnd
skip 272
export cg_cameraOrbitDelay
align 4
LABELV cg_cameraOrbitDelay
skip 272
export cg_cameraOrbit
align 4
LABELV cg_cameraOrbit
skip 272
export pmove_msec
align 4
LABELV pmove_msec
skip 272
export pmove_fixed
align 4
LABELV pmove_fixed
skip 272
export cg_smoothClients
align 4
LABELV cg_smoothClients
skip 272
export cg_scorePlum
align 4
LABELV cg_scorePlum
skip 272
export cg_noVoiceText
align 4
LABELV cg_noVoiceText
skip 272
export cg_noVoiceChats
align 4
LABELV cg_noVoiceChats
skip 272
export cg_teamChatsOnly
align 4
LABELV cg_teamChatsOnly
skip 272
export cg_drawFriend
align 4
LABELV cg_drawFriend
skip 272
export cg_deferPlayers
align 4
LABELV cg_deferPlayers
skip 272
export cg_blood
align 4
LABELV cg_blood
skip 272
export cg_paused
align 4
LABELV cg_paused
skip 272
export cg_buildScript
align 4
LABELV cg_buildScript
skip 272
export cg_stats
align 4
LABELV cg_stats
skip 272
export cg_teamChatHeight
align 4
LABELV cg_teamChatHeight
skip 272
export cg_teamChatTime
align 4
LABELV cg_teamChatTime
skip 272
export cg_synchronousClients
align 4
LABELV cg_synchronousClients
skip 272
export cg_drawAttacker
align 4
LABELV cg_drawAttacker
skip 272
export cg_lagometer
align 4
LABELV cg_lagometer
skip 272
export cg_stereoSeparation
align 4
LABELV cg_stereoSeparation
skip 272
export cg_thirdPerson
align 4
LABELV cg_thirdPerson
skip 272
export cg_thirdPersonAngle
align 4
LABELV cg_thirdPersonAngle
skip 272
export cg_thirdPersonRange
align 4
LABELV cg_thirdPersonRange
skip 272
export cg_zoomFov
align 4
LABELV cg_zoomFov
skip 272
export cg_fov
align 4
LABELV cg_fov
skip 272
export cg_simpleItems
align 4
LABELV cg_simpleItems
skip 272
export cg_ignore
align 4
LABELV cg_ignore
skip 272
export cg_autoswitch
align 4
LABELV cg_autoswitch
skip 272
export cg_tracerLength
align 4
LABELV cg_tracerLength
skip 272
export cg_tracerWidth
align 4
LABELV cg_tracerWidth
skip 272
export cg_tracerChance
align 4
LABELV cg_tracerChance
skip 272
export cg_viewsize
align 4
LABELV cg_viewsize
skip 272
export cg_drawGun
align 4
LABELV cg_drawGun
skip 272
export cg_gun_z
align 4
LABELV cg_gun_z
skip 272
export cg_gun_y
align 4
LABELV cg_gun_y
skip 272
export cg_gun_x
align 4
LABELV cg_gun_x
skip 272
export cg_gun_frame
align 4
LABELV cg_gun_frame
skip 272
export cg_brassTime
align 4
LABELV cg_brassTime
skip 272
export cg_addMarks
align 4
LABELV cg_addMarks
skip 272
export cg_footsteps
align 4
LABELV cg_footsteps
skip 272
export cg_showmiss
align 4
LABELV cg_showmiss
skip 272
export cg_noPlayerAnims
align 4
LABELV cg_noPlayerAnims
skip 272
export cg_nopredict
align 4
LABELV cg_nopredict
skip 272
export cg_errorDecay
align 4
LABELV cg_errorDecay
skip 272
export cg_debugEvents
align 4
LABELV cg_debugEvents
skip 272
export cg_debugPosition
align 4
LABELV cg_debugPosition
skip 272
export cg_debugAnim
align 4
LABELV cg_debugAnim
skip 272
export cg_animSpeed
align 4
LABELV cg_animSpeed
skip 272
export cg_draw2D
align 4
LABELV cg_draw2D
skip 272
export cg_drawStatus
align 4
LABELV cg_drawStatus
skip 272
export cg_crosshairHealth
align 4
LABELV cg_crosshairHealth
skip 272
export cg_crosshairSize
align 4
LABELV cg_crosshairSize
skip 272
export cg_crosshairY
align 4
LABELV cg_crosshairY
skip 272
export cg_crosshairX
align 4
LABELV cg_crosshairX
skip 272
export cg_teamOverlayUserinfo
align 4
LABELV cg_teamOverlayUserinfo
skip 272
export cg_drawTeamOverlay
align 4
LABELV cg_drawTeamOverlay
skip 272
export cg_drawRewards
align 4
LABELV cg_drawRewards
skip 272
export cg_drawCrosshairNames
align 4
LABELV cg_drawCrosshairNames
skip 272
export cg_drawCrosshair
align 4
LABELV cg_drawCrosshair
skip 272
export cg_drawAmmoWarning
align 4
LABELV cg_drawAmmoWarning
skip 272
export cg_drawIcons
align 4
LABELV cg_drawIcons
skip 272
export cg_draw3dIcons
align 4
LABELV cg_draw3dIcons
skip 272
export cg_drawSnapshot
align 4
LABELV cg_drawSnapshot
skip 272
export cg_drawFPS
align 4
LABELV cg_drawFPS
skip 272
export cg_drawTimer
align 4
LABELV cg_drawTimer
skip 272
export cg_gibs
align 4
LABELV cg_gibs
skip 272
export cg_shadows
align 4
LABELV cg_shadows
skip 272
export cg_swingSpeed
align 4
LABELV cg_swingSpeed
skip 272
export cg_bobroll
align 4
LABELV cg_bobroll
skip 272
export cg_bobpitch
align 4
LABELV cg_bobpitch
skip 272
export cg_bobup
align 4
LABELV cg_bobup
skip 272
export cg_runroll
align 4
LABELV cg_runroll
skip 272
export cg_runpitch
align 4
LABELV cg_runpitch
skip 272
export cg_centertime
align 4
LABELV cg_centertime
skip 272
import cg_markPolys
export cg_items
align 4
LABELV cg_items
skip 6144
export cg_weapons
align 4
LABELV cg_weapons
skip 15392
export cg_entities
align 4
LABELV cg_entities
skip 745472
export cg
align 4
LABELV cg
skip 202004
export cgs
align 4
LABELV cgs
skip 610676
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
LABELV $2153
byte 1 59
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 110
byte 1 115
byte 1 115
byte 1 108
byte 1 47
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 59
byte 1 0
align 1
LABELV $2141
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2138
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 109
byte 1 105
byte 1 100
byte 1 100
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2135
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $2133
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2132
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 108
byte 1 56
byte 1 115
byte 1 100
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2131
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 50
byte 1 52
byte 1 57
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2130
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2129
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 119
byte 1 54
byte 1 50
byte 1 57
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2128
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 103
byte 1 108
byte 1 101
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2127
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 49
byte 1 52
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2126
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2125
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 115
byte 1 49
byte 1 53
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2124
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 119
byte 1 52
byte 1 48
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2123
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 97
byte 1 99
byte 1 49
byte 1 48
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2122
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 99
byte 1 52
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2121
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 95
byte 1 109
byte 1 107
byte 1 50
byte 1 54
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2120
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 53
byte 1 57
byte 1 48
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2119
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 56
byte 1 55
byte 1 48
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2118
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 107
byte 1 110
byte 1 105
byte 1 102
byte 1 101
byte 1 95
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2117
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 52
byte 1 45
byte 1 109
byte 1 50
byte 1 48
byte 1 51
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2116
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 97
byte 1 99
byte 1 109
byte 1 105
byte 1 108
byte 1 108
byte 1 97
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2115
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 115
byte 1 103
byte 1 49
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2114
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 51
byte 1 48
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2113
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 107
byte 1 50
byte 1 51
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2112
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 97
byte 1 107
byte 1 52
byte 1 55
byte 1 45
byte 1 98
byte 1 103
byte 1 49
byte 1 53
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2111
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 100
byte 1 119
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2110
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 112
byte 1 53
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2107
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2106
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $2105
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $2101
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 98
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2096
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2095
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $2092
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2090
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 47
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2076
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2065
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2062
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2059
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2054
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2050
byte 1 98
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 50
byte 1 32
byte 1 34
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2049
byte 1 98
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 49
byte 1 32
byte 1 34
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2048
byte 1 45
byte 1 50
byte 1 0
align 1
LABELV $2047
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2039
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2014
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2009
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2005
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 46
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2002
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1951
byte 1 117
byte 1 105
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $1949
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 95
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1946
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1943
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 104
byte 1 117
byte 1 109
byte 1 98
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1940
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1937
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1934
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 117
byte 1 112
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1931
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 100
byte 1 119
byte 1 110
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1928
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1925
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1921
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $1917
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $1913
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1909
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $1905
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1901
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1898
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1895
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1890
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
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1889
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1888
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1883
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
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
LABELV $1882
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
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
LABELV $1881
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
LABELV $1880
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
LABELV $1879
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 52
byte 1 48
byte 1 109
byte 1 109
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1878
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 107
byte 1 50
byte 1 54
byte 1 0
align 1
LABELV $1877
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $1876
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $1875
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 107
byte 1 101
byte 1 118
byte 1 108
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $1874
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1873
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1872
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1871
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1870
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1869
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 73
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $1866
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 67
byte 1 71
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1863
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $1862
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 65
byte 1 108
byte 1 108
byte 1 83
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
LABELV $1857
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 83
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1854
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 66
byte 1 97
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1851
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 76
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1848
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1845
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 83
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1842
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 86
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1839
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 72
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1836
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1835
byte 1 115
byte 1 101
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $1832
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 83
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
LABELV $1831
byte 1 115
byte 1 101
byte 1 116
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1828
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $1827
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1784
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1781
byte 1 37
byte 1 52
byte 1 105
byte 1 0
align 1
LABELV $1780
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1772
byte 1 86
byte 1 46
byte 1 73
byte 1 46
byte 1 80
byte 1 46
byte 1 0
align 1
LABELV $1771
byte 1 118
byte 1 105
byte 1 112
byte 1 95
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1770
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1769
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1764
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $1759
byte 1 37
byte 1 115
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1742
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1741
byte 1 71
byte 1 111
byte 1 116
byte 1 32
byte 1 66
byte 1 111
byte 1 109
byte 1 98
byte 1 0
align 1
LABELV $1739
byte 1 68
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1737
byte 1 80
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1735
byte 1 73
byte 1 110
byte 1 106
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1733
byte 1 87
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1731
byte 1 71
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $1729
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1724
byte 1 65
byte 1 100
byte 1 109
byte 1 0
align 1
LABELV $1719
byte 1 67
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $1716
byte 1 76
byte 1 116
byte 1 67
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $1713
byte 1 76
byte 1 116
byte 1 0
align 1
LABELV $1710
byte 1 76
byte 1 116
byte 1 44
byte 1 106
byte 1 0
align 1
LABELV $1707
byte 1 69
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1704
byte 1 77
byte 1 67
byte 1 80
byte 1 79
byte 1 102
byte 1 0
align 1
LABELV $1701
byte 1 67
byte 1 80
byte 1 111
byte 1 102
byte 1 0
align 1
LABELV $1698
byte 1 80
byte 1 79
byte 1 102
byte 1 0
align 1
LABELV $1695
byte 1 83
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1691
byte 1 71
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1688
byte 1 67
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $1685
byte 1 76
byte 1 116
byte 1 67
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $1682
byte 1 77
byte 1 97
byte 1 106
byte 1 0
align 1
LABELV $1679
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $1676
byte 1 49
byte 1 115
byte 1 116
byte 1 76
byte 1 116
byte 1 0
align 1
LABELV $1673
byte 1 50
byte 1 110
byte 1 100
byte 1 76
byte 1 116
byte 1 0
align 1
LABELV $1670
byte 1 77
byte 1 115
byte 1 103
byte 1 116
byte 1 0
align 1
LABELV $1667
byte 1 83
byte 1 103
byte 1 116
byte 1 0
align 1
LABELV $1664
byte 1 67
byte 1 112
byte 1 108
byte 1 0
align 1
LABELV $1661
byte 1 80
byte 1 102
byte 1 99
byte 1 0
align 1
LABELV $1576
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1562
byte 1 94
byte 1 49
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 72
byte 1 85
byte 1 68
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 105
byte 1 110
byte 1 117
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $1559
byte 1 94
byte 1 51
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1543
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 100
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $1537
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 71
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 68
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $1523
byte 1 117
byte 1 105
byte 1 47
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1515
byte 1 110
byte 1 111
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1507
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 115
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1499
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1486
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1478
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 89
byte 1 0
align 1
LABELV $1470
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 88
byte 1 0
align 1
LABELV $1462
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 65
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1454
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1446
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $1434
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1426
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 66
byte 1 117
byte 1 122
byte 1 122
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1418
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1410
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1402
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1394
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $1384
byte 1 98
byte 1 105
byte 1 103
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1374
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1364
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1360
byte 1 125
byte 1 0
align 1
LABELV $1351
byte 1 123
byte 1 0
align 1
LABELV $1344
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1341
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1334
byte 1 67
byte 1 71
byte 1 95
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1309
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $1308
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1286
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1273
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1270
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1267
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $1250
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1243
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1236
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 100
byte 1 105
byte 1 114
byte 1 116
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1229
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1225
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 115
byte 1 111
byte 1 102
byte 1 116
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1221
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 115
byte 1 110
byte 1 111
byte 1 119
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1217
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 115
byte 1 97
byte 1 110
byte 1 100
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1213
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1209
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1205
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1198
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 95
byte 1 116
byte 1 95
byte 1 117
byte 1 114
byte 1 98
byte 1 97
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1194
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 95
byte 1 116
byte 1 95
byte 1 97
byte 1 114
byte 1 99
byte 1 116
byte 1 105
byte 1 99
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1190
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 95
byte 1 116
byte 1 95
byte 1 106
byte 1 117
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1186
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 95
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1183
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 95
byte 1 117
byte 1 114
byte 1 98
byte 1 97
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1179
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 99
byte 1 116
byte 1 105
byte 1 99
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1175
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 95
byte 1 106
byte 1 117
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1171
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1168
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1165
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1162
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1159
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 105
byte 1 102
byte 1 108
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1156
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 110
byte 1 101
byte 1 99
byte 1 107
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1153
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1150
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 117
byte 1 109
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1147
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 95
byte 1 118
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1144
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1141
byte 1 110
byte 1 115
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $1138
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 111
byte 1 102
byte 1 116
byte 1 95
byte 1 99
byte 1 104
byte 1 105
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1135
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 115
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1132
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1129
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1126
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1123
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1120
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1117
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1114
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1111
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1108
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1105
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1102
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1099
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1096
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1093
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1090
byte 1 110
byte 1 115
byte 1 95
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $1087
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1084
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1081
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1078
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $1075
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1072
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1069
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $1062
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1059
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 110
byte 1 115
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $1056
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 110
byte 1 115
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $1053
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 117
byte 1 98
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1050
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1047
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1044
byte 1 110
byte 1 115
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $1041
byte 1 110
byte 1 115
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $1038
byte 1 110
byte 1 115
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $1035
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1032
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1029
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1026
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 37
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1019
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 37
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1012
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 47
byte 1 110
byte 1 115
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 112
byte 1 111
byte 1 111
byte 1 108
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1009
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 47
byte 1 110
byte 1 115
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 105
byte 1 110
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1002
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 47
byte 1 110
byte 1 115
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 105
byte 1 110
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $995
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 47
byte 1 110
byte 1 115
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 105
byte 1 110
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $985
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 45
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $981
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 45
byte 1 114
byte 1 105
byte 1 102
byte 1 108
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $977
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 45
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $974
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $971
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $970
byte 1 99
byte 1 105
byte 1 114
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 98
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $967
byte 1 99
byte 1 105
byte 1 114
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 111
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $964
byte 1 99
byte 1 105
byte 1 114
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $961
byte 1 102
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 95
byte 1 116
byte 1 117
byte 1 114
byte 1 107
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $958
byte 1 102
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $955
byte 1 99
byte 1 105
byte 1 114
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $952
byte 1 99
byte 1 105
byte 1 114
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $949
byte 1 76
byte 1 101
byte 1 110
byte 1 115
byte 1 102
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $948
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $942
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 53
byte 1 0
align 1
LABELV $938
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $934
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $930
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $926
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $923
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 32
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $922
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $919
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 99
byte 1 111
byte 1 114
byte 1 111
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $916
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 110
byte 1 115
byte 1 95
byte 1 98
byte 1 108
byte 1 105
byte 1 110
byte 1 100
byte 1 115
byte 1 112
byte 1 111
byte 1 116
byte 1 49
byte 1 0
align 1
LABELV $913
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 103
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $910
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 103
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $907
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 51
byte 1 68
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $904
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 51
byte 1 68
byte 1 0
align 1
LABELV $901
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 115
byte 1 108
byte 1 56
byte 1 115
byte 1 100
byte 1 95
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $897
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 99
byte 1 109
byte 1 105
byte 1 108
byte 1 108
byte 1 97
byte 1 110
byte 1 95
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $893
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 112
byte 1 115
byte 1 103
byte 1 45
byte 1 49
byte 1 95
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $889
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 109
byte 1 49
byte 1 52
byte 1 95
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $885
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 97
byte 1 107
byte 1 52
byte 1 55
byte 1 95
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $881
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 95
byte 1 109
byte 1 52
byte 1 95
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $878
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 95
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $875
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $872
byte 1 73
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $871
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 95
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $868
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $865
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $862
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 47
byte 1 114
byte 1 108
byte 1 101
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $859
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 47
byte 1 108
byte 1 108
byte 1 101
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $856
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 47
byte 1 114
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $853
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 47
byte 1 108
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $850
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 111
byte 1 99
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $847
byte 1 72
byte 1 85
byte 1 68
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $846
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 110
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $843
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $840
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 99
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $837
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 97
byte 1 103
byte 1 45
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 45
byte 1 52
byte 1 48
byte 1 109
byte 1 109
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $833
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 97
byte 1 103
byte 1 45
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 45
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $829
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 97
byte 1 103
byte 1 45
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 45
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $825
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 97
byte 1 103
byte 1 45
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $821
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 97
byte 1 103
byte 1 45
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $818
byte 1 72
byte 1 85
byte 1 68
byte 1 32
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $807
byte 1 72
byte 1 85
byte 1 68
byte 1 32
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $802
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $801
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 57
byte 1 0
align 1
LABELV $800
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 56
byte 1 0
align 1
LABELV $799
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 55
byte 1 0
align 1
LABELV $798
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 54
byte 1 0
align 1
LABELV $797
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 53
byte 1 0
align 1
LABELV $796
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 52
byte 1 0
align 1
LABELV $795
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $794
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $793
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $792
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $790
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $789
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 57
byte 1 0
align 1
LABELV $788
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 56
byte 1 0
align 1
LABELV $787
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 55
byte 1 0
align 1
LABELV $786
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 54
byte 1 0
align 1
LABELV $785
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 53
byte 1 0
align 1
LABELV $784
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 52
byte 1 0
align 1
LABELV $783
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 51
byte 1 0
align 1
LABELV $782
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 50
byte 1 0
align 1
LABELV $781
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 49
byte 1 0
align 1
LABELV $780
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 48
byte 1 0
align 1
LABELV $778
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $777
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 110
byte 1 105
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $776
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $775
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $774
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 120
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $773
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $772
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 117
byte 1 114
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $771
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $770
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $769
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $768
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $765
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 95
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $762
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 49
byte 1 115
byte 1 116
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $759
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 119
byte 1 105
byte 1 114
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $755
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 119
byte 1 105
byte 1 114
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $751
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 119
byte 1 105
byte 1 114
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $748
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $743
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 119
byte 1 105
byte 1 114
byte 1 101
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $738
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $731
byte 1 66
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $730
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 57
byte 1 0
align 1
LABELV $729
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 56
byte 1 0
align 1
LABELV $728
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 55
byte 1 0
align 1
LABELV $727
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 54
byte 1 0
align 1
LABELV $726
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 53
byte 1 0
align 1
LABELV $725
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 52
byte 1 0
align 1
LABELV $724
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $723
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $722
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $721
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 100
byte 1 105
byte 1 103
byte 1 105
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $718
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 95
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $715
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 95
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $710
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 107
byte 1 101
byte 1 118
byte 1 108
byte 1 97
byte 1 114
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $705
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 109
byte 1 101
byte 1 116
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $702
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $697
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $694
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $691
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $670
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 110
byte 1 111
byte 1 119
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $666
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $662
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 105
byte 1 114
byte 1 116
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $658
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $654
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $651
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $646
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $643
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $640
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $637
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $634
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $631
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $628
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
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $625
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
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $622
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $619
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 101
byte 1 116
byte 1 98
byte 1 121
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $616
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
byte 1 110
byte 1 101
byte 1 119
byte 1 98
byte 1 101
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $613
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 95
byte 1 56
byte 1 115
byte 1 101
byte 1 99
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $610
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 95
byte 1 54
byte 1 115
byte 1 101
byte 1 99
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $607
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 95
byte 1 52
byte 1 115
byte 1 101
byte 1 99
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $604
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 95
byte 1 50
byte 1 115
byte 1 101
byte 1 99
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $601
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $598
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 47
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $595
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 52
byte 1 47
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $592
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 107
byte 1 50
byte 1 54
byte 1 47
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $587
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $580
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $573
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $566
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $563
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $558
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
byte 1 98
byte 1 102
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $555
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
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $552
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
byte 1 103
byte 1 115
byte 1 95
byte 1 119
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $549
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
byte 1 115
byte 1 108
byte 1 115
byte 1 95
byte 1 119
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $546
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
byte 1 103
byte 1 115
byte 1 95
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $543
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
byte 1 115
byte 1 108
byte 1 115
byte 1 95
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $534
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $528
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $507
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $469
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $443
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $439
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $432
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $413
byte 1 67
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $412
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
LABELV $411
byte 1 119
byte 1 119
byte 1 119
byte 1 46
byte 1 110
byte 1 115
byte 1 45
byte 1 99
byte 1 111
byte 1 46
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 47
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $410
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 109
byte 1 115
byte 1 103
byte 1 0
align 1
LABELV $409
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $408
byte 1 101
byte 1 95
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $407
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $406
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $405
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $404
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
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
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 118
byte 1 105
byte 1 97
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 99
byte 1 117
byte 1 116
byte 1 44
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 39
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 49
byte 1 54
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 113
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 0
align 1
LABELV $401
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
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
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 118
byte 1 105
byte 1 97
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 99
byte 1 117
byte 1 116
byte 1 44
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 39
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 122
byte 1 111
byte 1 110
byte 1 101
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 49
byte 1 54
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 113
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 0
align 1
LABELV $398
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
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
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 78
byte 1 83
byte 1 45
byte 1 67
byte 1 79
byte 1 32
byte 1 118
byte 1 105
byte 1 97
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 99
byte 1 117
byte 1 116
byte 1 44
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 39
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 49
byte 1 53
byte 1 48
byte 1 46
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 113
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 0
align 1
LABELV $395
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $394
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 122
byte 1 111
byte 1 110
byte 1 101
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $393
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $391
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $383
byte 1 46
byte 1 46
byte 1 47
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 71
byte 1 76
byte 1 51
byte 1 50
byte 1 46
byte 1 100
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $381
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $380
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $379
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $378
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 0
align 1
LABELV $377
byte 1 55
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $376
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 116
byte 1 111
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $375
byte 1 114
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 86
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $374
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 85
byte 1 73
byte 1 0
align 1
LABELV $373
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $372
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 80
byte 1 111
byte 1 115
byte 1 89
byte 1 0
align 1
LABELV $371
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 80
byte 1 111
byte 1 115
byte 1 88
byte 1 0
align 1
LABELV $370
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 65
byte 1 108
byte 1 112
byte 1 104
byte 1 97
byte 1 50
byte 1 0
align 1
LABELV $369
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $368
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 65
byte 1 108
byte 1 112
byte 1 104
byte 1 97
byte 1 49
byte 1 0
align 1
LABELV $367
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $366
byte 1 54
byte 1 55
byte 1 54
byte 1 0
align 1
LABELV $365
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 50
byte 1 80
byte 1 111
byte 1 115
byte 1 89
byte 1 0
align 1
LABELV $364
byte 1 56
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $363
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 50
byte 1 80
byte 1 111
byte 1 115
byte 1 88
byte 1 0
align 1
LABELV $362
byte 1 53
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $361
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 49
byte 1 80
byte 1 111
byte 1 115
byte 1 89
byte 1 0
align 1
LABELV $360
byte 1 56
byte 1 57
byte 1 49
byte 1 0
align 1
LABELV $359
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 49
byte 1 80
byte 1 111
byte 1 115
byte 1 88
byte 1 0
align 1
LABELV $358
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 83
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $357
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 82
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $356
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 80
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $355
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 89
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $354
byte 1 51
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $353
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $352
byte 1 51
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $351
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $350
byte 1 53
byte 1 57
byte 1 55
byte 1 0
align 1
LABELV $349
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $348
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 97
byte 1 100
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $347
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 0
align 1
LABELV $346
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 98
byte 1 0
align 1
LABELV $345
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 103
byte 1 0
align 1
LABELV $344
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $343
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $342
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 48
byte 1 0
align 1
LABELV $341
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 57
byte 1 0
align 1
LABELV $340
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 56
byte 1 0
align 1
LABELV $339
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 55
byte 1 0
align 1
LABELV $338
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 54
byte 1 0
align 1
LABELV $337
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 53
byte 1 0
align 1
LABELV $336
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $335
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $334
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $333
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $332
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $331
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 48
byte 1 0
align 1
LABELV $330
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 57
byte 1 0
align 1
LABELV $329
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 56
byte 1 0
align 1
LABELV $328
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 55
byte 1 0
align 1
LABELV $327
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 54
byte 1 0
align 1
LABELV $326
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 53
byte 1 0
align 1
LABELV $325
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $324
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $323
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $322
byte 1 0
align 1
LABELV $321
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $320
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 121
byte 1 0
align 1
LABELV $319
byte 1 99
byte 1 103
byte 1 95
byte 1 113
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 120
byte 1 0
align 1
LABELV $318
byte 1 99
byte 1 103
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 66
byte 1 97
byte 1 110
byte 1 100
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $317
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 82
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $316
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $315
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 87
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $314
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 111
byte 1 114
byte 1 101
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $313
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $312
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 71
byte 1 117
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $311
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $310
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $309
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $308
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $307
byte 1 56
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $306
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $305
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $304
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $303
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $302
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $301
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $300
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $299
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 95
byte 1 115
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $298
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 0
align 1
LABELV $297
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 100
byte 1 0
align 1
LABELV $296
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 0
align 1
LABELV $295
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 84
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 83
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $294
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 116
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $293
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
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $292
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
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $291
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
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $290
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
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $289
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $288
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
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $287
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
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $286
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
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $285
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
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $284
byte 1 117
byte 1 105
byte 1 95
byte 1 118
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $283
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $282
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $281
byte 1 53
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $280
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 98
byte 1 101
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $279
byte 1 48
byte 1 46
byte 1 50
byte 1 0
align 1
LABELV $278
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 98
byte 1 101
byte 1 101
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $277
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $276
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $275
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 121
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $274
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $273
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 120
byte 1 0
align 1
LABELV $272
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 121
byte 1 0
align 1
LABELV $271
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 122
byte 1 0
align 1
LABELV $270
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $269
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 101
byte 1 99
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 70
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $268
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $267
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
LABELV $266
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
LABELV $265
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
LABELV $264
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
LABELV $263
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
LABELV $262
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
LABELV $261
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
LABELV $260
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
LABELV $259
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
LABELV $258
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 68
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $257
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $256
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $255
byte 1 48
byte 1 46
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $254
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 84
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 87
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $253
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $252
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 84
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 76
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $251
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $250
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $249
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $248
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $247
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $246
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $245
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 120
byte 1 112
byte 1 0
align 1
LABELV $244
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
LABELV $243
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
LABELV $242
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
LABELV $241
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
LABELV $240
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
LABELV $239
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
LABELV $238
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 95
byte 1 98
byte 1 0
align 1
LABELV $237
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 95
byte 1 103
byte 1 0
align 1
LABELV $236
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $235
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $234
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $233
byte 1 49
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $232
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $231
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 84
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $230
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 70
byte 1 88
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $229
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 70
byte 1 88
byte 1 0
align 1
LABELV $228
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $227
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $226
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $225
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $224
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $223
byte 1 112
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $222
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 95
byte 1 119
byte 1 0
align 1
LABELV $221
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 95
byte 1 104
byte 1 0
align 1
LABELV $220
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 95
byte 1 121
byte 1 0
align 1
LABELV $219
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 95
byte 1 120
byte 1 0
align 1
LABELV $218
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $217
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $216
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $215
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
LABELV $214
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $213
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $212
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $211
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $210
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
LABELV $209
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $208
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $207
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $206
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $205
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $204
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $202
byte 1 103
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 104
byte 1 114
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $201
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $200
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $194
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $193
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $192
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $191
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $190
byte 1 56
byte 1 0
align 1
LABELV $189
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $188
byte 1 51
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $187
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $186
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $185
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $183
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $181
byte 1 48
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $180
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $179
byte 1 48
byte 1 46
byte 1 49
byte 1 0
align 1
LABELV $178
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $177
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $176
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $175
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $173
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $172
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $170
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $168
byte 1 48
byte 1 46
byte 1 57
byte 1 0
align 1
LABELV $167
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $166
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 121
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $165
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $164
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $163
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $162
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $161
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 121
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $159
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $158
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $157
byte 1 51
byte 1 0
align 1
LABELV $156
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $153
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $152
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $151
byte 1 49
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $150
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $144
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $143
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $140
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $139
byte 1 52
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $136
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $135
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $133
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $132
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $131
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $129
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $126
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $125
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 111
byte 1 83
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $124
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $123
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
LABELV $122
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $121
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $120
byte 1 50
byte 1 50
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $117
byte 1 49
byte 1 0
align 1
LABELV $116
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $115
byte 1 48
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 45
byte 1 49
byte 1 46
byte 1 57
byte 1 51
byte 1 0
align 1
LABELV $112
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 118
byte 1 109
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
