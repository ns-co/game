export G_SpawnString
code
proc G_SpawnString 8 8
file "../g_spawn.c"
line 12
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
;12:qboolean	G_SpawnString( const char *key, const char *defaultString, char **out ) {
line 15
;13:	int		i;
;14:
;15:	if ( !level.spawning ) {
ADDRGP4 level+4508
INDIRI4
CNSTI4 0
NEI4 $69
line 16
;16:		*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 18
;17://		G_Error( "G_SpawnString() called while not spawning" );
;18:	}
LABELV $69
line 20
;19:
;20:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $72
line 21
;21:		if ( !Q_stricmp( key, level.spawnVars[i][0] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4516
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $77
line 22
;22:			*out = level.spawnVars[i][1];
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4516+4
ADDP4
INDIRP4
ASGNP4
line 23
;23:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $68
JUMPV
LABELV $77
line 25
;24:		}
;25:	}
LABELV $73
line 20
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $75
ADDRLP4 0
INDIRI4
ADDRGP4 level+4512
INDIRI4
LTI4 $72
line 27
;26:
;27:	*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 28
;28:	return qfalse;
CNSTI4 0
RETI4
LABELV $68
endproc G_SpawnString 8 8
export G_SpawnFloat
proc G_SpawnFloat 16 12
line 31
;29:}
;30:
;31:qboolean	G_SpawnFloat( const char *key, const char *defaultString, float *out ) {
line 35
;32:	char		*s;
;33:	qboolean	present;
;34:
;35:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 36
;36:	*out = atof( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 37
;37:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $82
endproc G_SpawnFloat 16 12
export G_SpawnInt
proc G_SpawnInt 16 12
line 40
;38:}
;39:
;40:qboolean	G_SpawnInt( const char *key, const char *defaultString, int *out ) {
line 44
;41:	char		*s;
;42:	qboolean	present;
;43:
;44:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 45
;45:	*out = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 46
;46:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $83
endproc G_SpawnInt 16 12
export G_SpawnVector
proc G_SpawnVector 16 20
line 49
;47:}
;48:
;49:qboolean	G_SpawnVector( const char *key, const char *defaultString, float *out ) {
line 53
;50:	char		*s;
;51:	qboolean	present;
;52:
;53:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 54
;54:	sscanf( s, "%f %f %f", &out[0], &out[1], &out[2] );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 55
;55:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $84
endproc G_SpawnVector 16 20
data
export fields
align 4
LABELV fields
address $88
byte 4 524
byte 4 2
skip 4
address $89
byte 4 92
byte 4 4
skip 4
address $90
byte 4 540
byte 4 2
skip 4
address $91
byte 4 544
byte 4 2
skip 4
address $92
byte 4 528
byte 4 0
skip 4
address $93
byte 4 672
byte 4 1
skip 4
address $94
byte 4 648
byte 4 2
skip 4
address $95
byte 4 652
byte 4 2
skip 4
address $96
byte 4 636
byte 4 2
skip 4
address $97
byte 4 656
byte 4 2
skip 4
address $98
byte 4 796
byte 4 1
skip 4
address $99
byte 4 800
byte 4 1
skip 4
address $100
byte 4 760
byte 4 0
skip 4
address $101
byte 4 732
byte 4 0
skip 4
address $102
byte 4 0
byte 4 9
skip 4
address $103
byte 4 740
byte 4 0
skip 4
address $104
byte 4 116
byte 4 4
skip 4
address $105
byte 4 116
byte 4 5
skip 4
address $106
byte 4 660
byte 4 2
skip 4
address $107
byte 4 664
byte 4 2
skip 4
byte 4 0
skip 12
export spawns
align 4
LABELV spawns
address $109
address SP_info_player_start
address $110
address SP_info_player_deathmatch
address $111
address SP_info_player_intermission
address $112
address SP_info_null
address $113
address SP_info_notnull
address $114
address SP_info_camp
address $115
address SP_func_plat
address $116
address SP_func_button
address $117
address SP_func_door
address $118
address SP_func_static
address $119
address SP_func_rotating
address $120
address SP_func_bobbing
address $121
address SP_func_pendulum
address $122
address SP_func_train
address $123
address SP_func_elevator
address $124
address SP_func_elevator_button
address $125
address SP_info_null
address $126
address SP_func_timer
address $127
address SP_func_explosive
address $128
address SP_func_door_rotate
address $129
address SP_trigger_points
address $130
address SP_trigger_counter
address $131
address SP_func_ammo_train
address $132
address SP_trigger_explosion
address $133
address SP_info_bomb_disarm
address $134
address SP_func_wall
address $135
address SP_vip_rescue
address $136
address SP_vip_spawn
address $137
address SP_assault_field
address $138
address SP_doorlock_spawn
address $139
address SP_trigger_always
address $140
address SP_trigger_toggle
address $141
address SP_trigger_multiple
address $142
address SP_trigger_use
address $143
address SP_trigger_push
address $144
address SP_trigger_teleport
address $145
address SP_trigger_hurt
address $146
address SP_target_give
address $147
address SP_target_remove_powerups
address $148
address SP_target_delay
address $149
address SP_target_speaker
address $150
address SP_target_print
address $151
address SP_target_laser
address $152
address SP_target_score
address $153
address SP_target_teleporter
address $154
address SP_target_relay
address $155
address SP_target_kill
address $156
address SP_target_position
address $157
address SP_target_location
address $158
address SP_target_push
address $159
address SP_target_Particle
address $160
address SP_target_modifyxp
address $102
address SP_light
address $161
address SP_path_corner
address $162
address SP_path_elevator
address $163
address SP_misc_teleporter_dest
address $164
address SP_misc_model
address $165
address SP_misc_portal_surface
address $166
address SP_misc_portal_camera
address $167
address NS_SpawnFlare
address $168
address SP_shooter_rocket
address $169
address SP_shooter_grenade
address $170
address SP_shooter_plasma
address $171
address SP_team_CTF_redplayer
address $172
address SP_team_CTF_blueplayer
address $173
address SP_team_CTF_redspawn
address $174
address SP_team_CTF_bluespawn
byte 4 0
byte 4 0
export G_CallSpawn
code
proc G_CallSpawn 56 12
line 313
;56:}
;57:
;58:
;59:
;60://
;61:// fields are needed for spawning from the entity string
;62://
;63:typedef enum {
;64:	F_INT, 
;65:	F_FLOAT,
;66:	F_LSTRING,			// string on disk, pointer in memory, TAG_LEVEL
;67:	F_GSTRING,			// string on disk, pointer in memory, TAG_GAME
;68:	F_VECTOR,
;69:	F_ANGLEHACK,
;70:	F_ENTITY,			// index on disk, pointer in memory
;71:	F_ITEM,				// index on disk, pointer in memory
;72:	F_CLIENT,			// index on disk, pointer in memory
;73:	F_IGNORE
;74:} fieldtype_t;
;75:
;76:typedef struct
;77:{
;78:	char	*name;
;79:	int		ofs;
;80:	fieldtype_t	type;
;81:	int		flags;
;82:} field_t;
;83:
;84:field_t fields[] = {
;85:	{"classname", FOFS(classname), F_LSTRING},
;86:	{"origin", FOFS(s.origin), F_VECTOR},
;87:	{"model", FOFS(model), F_LSTRING},
;88:	{"model2", FOFS(model2), F_LSTRING},
;89:	{"spawnflags", FOFS(spawnflags), F_INT},
;90:	{"speed", FOFS(speed), F_FLOAT},
;91:	{"target", FOFS(target), F_LSTRING},
;92:	{"targetname", FOFS(targetname), F_LSTRING},
;93:	{"message", FOFS(message), F_LSTRING},
;94:	{"team", FOFS(team), F_LSTRING},
;95:	{"wait", FOFS(wait), F_FLOAT},
;96:	{"random", FOFS(random), F_FLOAT},
;97:	{"count", FOFS(count), F_INT},
;98:	{"health", FOFS(health), F_INT},
;99:	{"light", 0, F_IGNORE},
;100:	{"dmg", FOFS(damage), F_INT},
;101:	{"angles", FOFS(s.angles), F_VECTOR},
;102:	{"angle", FOFS(s.angles), F_ANGLEHACK},
;103:	{"targetShaderName", FOFS(targetShaderName), F_LSTRING},
;104:	{"targetShaderNewName", FOFS(targetShaderNewName), F_LSTRING},
;105:
;106:	{NULL}
;107:};
;108:
;109:
;110:typedef struct {
;111:	char	*name;
;112:	void	(*spawn)(gentity_t *ent);
;113:} spawn_t;
;114:
;115:void SP_info_player_start (gentity_t *ent);
;116:void SP_info_player_deathmatch (gentity_t *ent);
;117:void SP_info_player_intermission (gentity_t *ent);
;118:void SP_info_firstplace(gentity_t *ent);
;119:void SP_info_secondplace(gentity_t *ent);
;120:void SP_info_thirdplace(gentity_t *ent);
;121:void SP_info_podium(gentity_t *ent);
;122:
;123:void SP_func_plat (gentity_t *ent);
;124:void SP_func_static (gentity_t *ent);
;125:void SP_func_rotating (gentity_t *ent);
;126:void SP_func_bobbing (gentity_t *ent);
;127:void SP_func_pendulum( gentity_t *ent );
;128:void SP_func_button (gentity_t *ent);
;129:void SP_func_door (gentity_t *ent);
;130:void SP_func_train (gentity_t *ent);
;131:void SP_func_elevator (gentity_t *ent);
;132:void SP_func_elevator_button (gentity_t *ent);
;133:void SP_func_timer (gentity_t *self);
;134:
;135:void SP_trigger_always (gentity_t *ent);
;136:void SP_trigger_toggle (gentity_t *ent);
;137:void SP_trigger_multiple (gentity_t *ent);
;138:void SP_trigger_use (gentity_t *ent);
;139:void SP_trigger_push (gentity_t *ent);
;140:void SP_trigger_teleport (gentity_t *ent);
;141:void SP_trigger_hurt (gentity_t *ent);
;142:
;143:void SP_target_remove_powerups( gentity_t *ent );
;144:void SP_target_give (gentity_t *ent);
;145:void SP_target_delay (gentity_t *ent);
;146:void SP_target_speaker (gentity_t *ent);
;147:void SP_target_print (gentity_t *ent);
;148:void SP_target_laser (gentity_t *self);
;149:void SP_target_character (gentity_t *ent);
;150:void SP_target_score( gentity_t *ent );
;151:void SP_target_teleporter( gentity_t *ent );
;152:void SP_target_relay (gentity_t *ent);
;153:void SP_target_kill (gentity_t *ent);
;154:void SP_target_position (gentity_t *ent);
;155:void SP_target_location (gentity_t *ent);
;156:void SP_target_push (gentity_t *ent);
;157:
;158:void SP_light (gentity_t *self);
;159:void SP_info_null (gentity_t *self);
;160:void SP_info_notnull (gentity_t *self);
;161:void SP_info_camp (gentity_t *self);
;162:void SP_path_corner (gentity_t *self);
;163:void SP_path_elevator (gentity_t *self);
;164:
;165:void SP_misc_teleporter_dest (gentity_t *self);
;166:void SP_misc_model(gentity_t *ent);
;167:void SP_misc_portal_camera(gentity_t *ent);
;168:void SP_misc_portal_surface(gentity_t *ent);
;169:
;170:void SP_shooter_rocket( gentity_t *ent );
;171:void SP_shooter_plasma( gentity_t *ent );
;172:void SP_shooter_grenade( gentity_t *ent );
;173:
;174:void SP_team_CTF_redplayer( gentity_t *ent );
;175:void SP_team_CTF_blueplayer( gentity_t *ent );
;176:
;177:void SP_team_CTF_redspawn( gentity_t *ent );
;178:void SP_team_CTF_bluespawn( gentity_t *ent );
;179:
;180:#ifdef MISSIONPACK
;181:void SP_team_blueobelisk( gentity_t *ent );
;182:void SP_team_redobelisk( gentity_t *ent );
;183:void SP_team_neutralobelisk( gentity_t *ent );
;184:#endif 
;185:// Navy Seals ++
;186:void SP_func_door_rotate (gentity_t *ent);	// KnighthawK: rotatable doors
;187:void SP_func_explosive ( gentity_t *ent );
;188:void SP_func_door_rotate ( gentity_t *ent );
;189:void SP_trigger_points ( gentity_t *ent ); 
;190:void SP_trigger_counter( gentity_t *self );
;191:void SP_func_ammo_train( gentity_t *self );
;192:void SP_trigger_explosion( gentity_t *self );
;193:void SP_info_bomb_disarm( gentity_t *self );
;194:void SP_func_wall (gentity_t *self);
;195:void SP_vip_rescue ( gentity_t *self );
;196:void SP_vip_spawn ( gentity_t *self );
;197:void SP_assault_field( gentity_t *self ) ;
;198:void NS_SpawnFlare( gentity_t *self );
;199:void SP_trigger_fun_goal( gentity_t *self );
;200:void SP_fun_ball_spawn (gentity_t *ent );
;201:void SP_doorlock_spawn( gentity_t *ent );
;202:/* Vehicles ? Later again...
;203:void SP_func_vehicle_control( gentity_t *ent );
;204:void SP_func_vehicle( gentity_t *ent );
;205:*/
;206:void SP_target_Particle( gentity_t *ent );
;207:void SP_target_modifyxp ( gentity_t *ent );
;208:
;209:// Navy Seals --
;210:spawn_t	spawns[] = {
;211:	// info entities don't do anything at all, but provide positional
;212:	// information for things controlled by other processes
;213:	{"info_player_start", SP_info_player_start},
;214:	{"info_player_deathmatch", SP_info_player_deathmatch},
;215:	{"info_player_intermission", SP_info_player_intermission},
;216:	{"info_null", SP_info_null},
;217:	{"info_notnull", SP_info_notnull},		// use target_position instead
;218:	{"info_camp", SP_info_camp},
;219:
;220:	{"func_plat", SP_func_plat},
;221:	{"func_button", SP_func_button},
;222:	{"func_door", SP_func_door},
;223:	{"func_static", SP_func_static},
;224:	{"func_rotating", SP_func_rotating},
;225:	{"func_bobbing", SP_func_bobbing},
;226:	{"func_pendulum", SP_func_pendulum},
;227:	{"func_train", SP_func_train},
;228:	{"func_elevator", SP_func_elevator},
;229:	{"func_elevator_button", SP_func_elevator_button},
;230:	{"func_group", SP_info_null},
;231:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;232:// Navy Seals ++
;233:	{"func_explosive", SP_func_explosive},
;234:	{"func_door_rotating", SP_func_door_rotate},
;235:	{"trigger_missionobjective", SP_trigger_points}, 
;236:	{"trigger_counter", SP_trigger_counter },
;237:	{"func_ammo_train", SP_func_ammo_train },
;238:	{"trigger_explosion", SP_trigger_explosion },
;239:	{"info_bomb_disarm", SP_info_bomb_disarm },
;240:	{"func_wall", SP_func_wall },
;241:	{"info_vip_rescue", SP_vip_rescue },
;242:	{"info_vip_spawn", SP_vip_spawn },
;243:	{"trigger_assaultfield", SP_assault_field },
;244:	{"misc_doorlock", SP_doorlock_spawn },
;245:	/* Vehicles: Later again!
;246:	{"func_vehicle",SP_func_vehicle},
;247:	{"func_vehicle_control",SP_func_vehicle_control},
;248:	*/
;249:// Navy Seals --
;250:	// Triggers are brush objects that cause an effect when contacted
;251:	// by a living player, usually involving firing targets.
;252:	// While almost everything could be done with
;253:	// a single trigger class and different targets, triggered effects
;254:	// could not be client side predicted (push and teleport).
;255:	{"trigger_always", SP_trigger_always},
;256:	{"trigger_toggle", SP_trigger_toggle},
;257:	{"trigger_multiple", SP_trigger_multiple},
;258:	{"trigger_use", SP_trigger_use},
;259:	{"trigger_push", SP_trigger_push},
;260:	{"trigger_teleport", SP_trigger_teleport},
;261:	{"trigger_hurt", SP_trigger_hurt}, 
;262:
;263:
;264:	// targets perform no action by themselves, but must be triggered
;265:	// by another entity
;266:	{"target_give", SP_target_give},
;267:	{"target_remove_powerups", SP_target_remove_powerups},
;268:	{"target_delay", SP_target_delay},
;269:	{"target_speaker", SP_target_speaker},
;270:	{"target_print", SP_target_print},
;271:	{"target_laser", SP_target_laser},
;272:	{"target_score", SP_target_score},
;273:	{"target_teleporter", SP_target_teleporter},
;274:	{"target_relay", SP_target_relay},
;275:	{"target_kill", SP_target_kill},
;276:	{"target_position", SP_target_position},
;277:	{"target_location", SP_target_location},
;278:	{"target_push", SP_target_push},
;279:	{"target_particle", SP_target_Particle },
;280:	{"target_modifyxp", SP_target_modifyxp },
;281:
;282:	{"light", SP_light},
;283:	{"path_corner", SP_path_corner},
;284:	{"path_elevator", SP_path_elevator},
;285:
;286:	{"misc_teleporter_dest", SP_misc_teleporter_dest},
;287:	{"misc_model", SP_misc_model},
;288:	{"misc_portal_surface", SP_misc_portal_surface},
;289:	{"misc_portal_camera", SP_misc_portal_camera},
;290:	{"misc_flare", NS_SpawnFlare },
;291:
;292:	{"shooter_rocket", SP_shooter_rocket},
;293:	{"shooter_grenade", SP_shooter_grenade},
;294:	{"shooter_plasma", SP_shooter_plasma},
;295:
;296:	{"team_seal_player", SP_team_CTF_redplayer},
;297:	{"team_tango_player", SP_team_CTF_blueplayer},
;298:
;299:	{"team_seal_team", SP_team_CTF_redspawn},
;300:	{"team_tango_team", SP_team_CTF_bluespawn}, 
;301:
;302:	{0, 0}
;303:};
;304:
;305:/*
;306:===============
;307:G_CallSpawn
;308:
;309:Finds the spawn function for the entity and calls it,
;310:returning qfalse if not found
;311:===============
;312:*/
;313:qboolean G_CallSpawn( gentity_t *ent ) {
line 317
;314:	spawn_t	*s;
;315:	gitem_t	*item;
;316:
;317:	if ( !ent->classname ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $176
line 318
;318:		G_Printf ("G_CallSpawn: NULL classname\n");
ADDRGP4 $178
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 319
;319:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $175
JUMPV
LABELV $176
line 322
;320:	}
;321:// Navy Seals ++
;322:	if (g_gametype.integer == 0 ) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $179
line 323
;323:		if ( !strcmp( ("weapon_shotgun") , ent->classname) )  
ADDRGP4 $184
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $182
line 324
;324:			if ( random() < 0.5 ) 
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $185
line 325
;325:				ent->classname = "weapon_mac10";   
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $187
ASGNP4
LABELV $185
LABELV $182
LABELV $179
line 328
;326:
;327:	// hack for urban terror maps ( harhar )
;328:	if ( !strcmp( "func_breakable" , ent->classname ) )
ADDRGP4 $190
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $188
line 329
;329:		ent->classname = "func_explosive";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $127
ASGNP4
LABELV $188
line 330
;330:	if ( !strcmp( "team_CTF_redplayer" , ent->classname ) )
ADDRGP4 $193
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $191
line 331
;331:		ent->classname = "team_seal_player";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $171
ASGNP4
ADDRGP4 $192
JUMPV
LABELV $191
line 332
;332:	else if ( !strcmp( "team_CTF_blueplayer" , ent->classname ) )
ADDRGP4 $196
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $194
line 333
;333:		ent->classname = "team_tango_player";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $172
ASGNP4
ADDRGP4 $195
JUMPV
LABELV $194
line 334
;334:	else if ( !strcmp( "func_rotating_door", ent->classname ) )
ADDRGP4 $199
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $197
line 335
;335:		ent->classname = "func_door_rotating";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $128
ASGNP4
LABELV $197
LABELV $195
LABELV $192
line 338
;336:// Navy Seals --
;337:	// check item spawn functions
;338:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+56
ASGNP4
ADDRGP4 $203
JUMPV
LABELV $200
line 339
;339:		if ( !strcmp(item->classname, ent->classname) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $205
line 341
;340:			// found it
;341:			if (item->giType == IT_TEAM) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 9
NEI4 $207
line 343
;342:				// no teamplay items in arcade
;343:				if (g_gametype.integer < GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $209
line 344
;344:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $175
JUMPV
LABELV $209
line 346
;345:
;346:				if (!strcmp(item->classname, "team_briefcase" ) ) 
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 36
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $212
line 347
;347:				{
line 348
;348:					if ( g_gametype.integer != GT_LTS ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $215
line 349
;349:						G_Printf("removed team_briefcase: only in gametype %i(not %i) possible\n", GT_LTS, g_gametype.integer );
ADDRGP4 $218
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 350
;350:						return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $175
JUMPV
LABELV $215
line 353
;351:					}
;352:
;353:					level.num_objectives[TEAM_RED]++;
ADDRLP4 40
ADDRGP4 level+7396+4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 354
;354:				}
LABELV $212
line 356
;355:				// i really don't know why it doesn't spawn, gotta do it manually
;356:				if (!strcmp(item->classname, "team_briefcase_return") ) {		
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $224
ARGP4
ADDRLP4 40
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $222
line 359
;357:					gentity_t *flag;
;358:
;359:					if( g_gametype.integer != GT_LTS ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $225
line 360
;360:						G_Printf("removed team_briefcase: only in gametype %i(not %i) possible\n", GT_LTS, g_gametype.integer );
ADDRGP4 $218
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 361
;361:						return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $175
JUMPV
LABELV $225
line 364
;362:					}
;363:
;364:					flag = LaunchItem( item, ent->s.origin, ent->s.apos.trDelta );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 52
INDIRP4
ASGNP4
line 365
;365:					flag->flags = 0;
ADDRLP4 44
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 366
;366:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $175
JUMPV
LABELV $222
line 369
;367:				}
;368:				
;369:			}
LABELV $207
line 370
;370:			G_SpawnItem( ent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 371
;371:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $175
JUMPV
LABELV $205
line 373
;372:		}
;373:	}
LABELV $201
line 338
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
LABELV $203
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $200
line 376
;374:
;375:	// check normal spawn functions
;376:	for ( s=spawns ; s->name ; s++ ) {
ADDRLP4 4
ADDRGP4 spawns
ASGNP4
ADDRGP4 $232
JUMPV
LABELV $229
line 377
;377:		if ( !strcmp(s->name, ent->classname) ) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $233
line 379
;378:			// found it
;379:			s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 380
;380:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $175
JUMPV
LABELV $233
line 382
;381:		}
;382:	}
LABELV $230
line 376
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $232
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $229
line 383
;383:	G_Printf ("'%s' doesn't have a spawn function\n", ent->classname);
ADDRGP4 $235
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 384
;384:	return qfalse;
CNSTI4 0
RETI4
LABELV $175
endproc G_CallSpawn 56 12
export G_NewString
proc G_NewString 32 4
line 395
;385:}
;386:
;387:/*
;388:=============
;389:G_NewString
;390:
;391:Builds a copy of the string, translating \n to real linefeeds
;392:so message texts can be multi-line
;393:=============
;394:*/
;395:char *G_NewString( const char *string ) {
line 399
;396:	char	*newb, *new_p;
;397:	int		i,l;
;398:	
;399:	l = strlen(string) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 401
;400:
;401:	newb = G_Alloc( l );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 403
;402:
;403:	new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 406
;404:
;405:	// turn \n into a real linefeed
;406:	for ( i=0 ; i< l ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $237
line 407
;407:		if (string[i] == '\\' && i < l-1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $241
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $241
line 408
;408:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 409
;409:			if (string[i] == 'n') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $243
line 410
;410:				*new_p++ = '\n';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 10
ASGNI1
line 411
;411:			} else {
ADDRGP4 $242
JUMPV
LABELV $243
line 412
;412:				*new_p++ = '\\';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 92
ASGNI1
line 413
;413:			}
line 414
;414:		} else {
ADDRGP4 $242
JUMPV
LABELV $241
line 415
;415:			*new_p++ = string[i];
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 416
;416:		}
LABELV $242
line 417
;417:	}
LABELV $238
line 406
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $240
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $237
line 419
;418:	
;419:	return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $236
endproc G_NewString 32 4
export G_ParseField
proc G_ParseField 60 20
line 433
;420:}
;421:
;422:
;423:
;424:
;425:/*
;426:===============
;427:G_ParseField
;428:
;429:Takes a key/value pair and sets the binary values
;430:in a gentity
;431:===============
;432:*/
;433:void G_ParseField( const char *key, const char *value, gentity_t *ent ) {
line 439
;434:	field_t	*f;
;435:	byte	*b;
;436:	float	v;
;437:	vec3_t	vec;
;438:
;439:	for ( f=fields ; f->name ; f++ ) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $249
JUMPV
LABELV $246
line 440
;440:		if ( !Q_stricmp(f->name, key) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $250
line 442
;441:			// found it
;442:			b = (byte *)ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 444
;443:
;444:			switch( f->type ) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $245
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $245
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $265
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $265
address $261
address $262
address $255
address $245
address $256
address $263
address $245
address $245
address $245
address $245
code
LABELV $255
line 446
;445:			case F_LSTRING:
;446:				*(char **)(b+f->ofs) = G_NewString (value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 447
;447:				break;
ADDRGP4 $245
JUMPV
LABELV $256
line 449
;448:			case F_VECTOR:
;449:				sscanf (value, "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 450
;450:				((float *)(b+f->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 451
;451:				((float *)(b+f->ofs))[1] = vec[1];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 452
;452:				((float *)(b+f->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 453
;453:				break;
ADDRGP4 $245
JUMPV
LABELV $261
line 455
;454:			case F_INT:
;455:				*(int *)(b+f->ofs) = atoi(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 456
;456:				break;
ADDRGP4 $245
JUMPV
LABELV $262
line 458
;457:			case F_FLOAT:
;458:				*(float *)(b+f->ofs) = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 459
;459:				break;
ADDRGP4 $245
JUMPV
LABELV $263
line 461
;460:			case F_ANGLEHACK:
;461:				v = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 462
;462:				((float *)(b+f->ofs))[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
line 463
;463:				((float *)(b+f->ofs))[1] = v;
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 464
;464:				((float *)(b+f->ofs))[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 465
;465:				break;
line 468
;466:			default:
;467:			case F_IGNORE:
;468:				break;
line 470
;469:			}
;470:			return;
ADDRGP4 $245
JUMPV
LABELV $250
line 472
;471:		}
;472:	}
LABELV $247
line 439
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $249
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $246
line 473
;473:}
LABELV $245
endproc G_ParseField 60 20
data
align 4
LABELV $267
address $268
address $269
address $270
address $97
address $271
address $272
address $273
address $274
address $275
export G_SpawnGEntityFromSpawnVars
code
proc G_SpawnGEntityFromSpawnVars 40 12
line 486
;474:
;475:
;476:
;477:
;478:/*
;479:===================
;480:G_SpawnGEntityFromSpawnVars
;481:
;482:Spawn an entity and fill in all of the level fields from
;483:level.spawnVars[], then call the class specfic spawn function
;484:===================
;485:*/
;486:void G_SpawnGEntityFromSpawnVars( void ) {
line 493
;487:	int			i;
;488:	gentity_t	*ent;
;489:	char		*s, *value, *gametypeName;
;490:	static char *gametypeNames[] = {"ffa", "tournament", "single", "team", "ctf", "oneflag", "obelisk", "harvester", "teamtournament"};
;491:
;492:	// get the next free entity
;493:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 495
;494:
;495:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $276
line 496
;496:		G_ParseField( level.spawnVars[i][0], level.spawnVars[i][1], ent );
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+4516
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRGP4 level+4516+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
line 497
;497:	}
LABELV $277
line 495
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $279
ADDRLP4 0
INDIRI4
ADDRGP4 level+4512
INDIRI4
LTI4 $276
line 500
;498:  
;499:	// check for "notteam" flag (GT_FFA, GT_TOURNAMENT, GT_SINGLE_PLAYER)
;500:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
LTI4 $284
line 501
;501:		G_SpawnInt( "notteam", "0", &i );
ADDRGP4 $287
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 502
;502:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $285
line 503
;503:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 504
;504:			return;
ADDRGP4 $266
JUMPV
line 506
;505:		}
;506:	} else {
LABELV $284
line 507
;507:		G_SpawnInt( "notfree", "0", &i );
ADDRGP4 $291
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 508
;508:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $292
line 509
;509:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 510
;510:			return;
ADDRGP4 $266
JUMPV
LABELV $292
line 512
;511:		}
;512:	}
LABELV $285
line 514
;513:
;514:	if( G_SpawnString( "gametype", NULL, &value ) ) {
ADDRGP4 $296
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $294
line 515
;515:		if( g_gametype.integer >= GT_FFA && g_gametype.integer < GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $297
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
GEI4 $297
line 516
;516:			gametypeName = gametypeNames[g_gametype.integer];
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $267
ADDP4
INDIRP4
ASGNP4
line 518
;517:
;518:			s = strstr( value, gametypeName );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 519
;519:			if( !s ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $302
line 520
;520:				G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 521
;521:				return;
ADDRGP4 $266
JUMPV
LABELV $302
line 523
;522:			}
;523:		}
LABELV $297
line 524
;524:	}
LABELV $294
line 527
;525:
;526:	// move editor origin to pos
;527:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 528
;528:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 531
;529:
;530:	// if we didn't get a classname, don't bother spawning anything
;531:	if ( !G_CallSpawn( ent ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $304
line 532
;532:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 533
;533:	}
LABELV $304
line 534
;534:}
LABELV $266
endproc G_SpawnGEntityFromSpawnVars 40 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 543
;535:
;536:
;537:
;538:/*
;539:====================
;540:G_AddSpawnVarToken
;541:====================
;542:*/
;543:char *G_AddSpawnVarToken( const char *string ) {
line 547
;544:	int		l;
;545:	char	*dest;
;546:
;547:	l = strlen( string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 548
;548:	if ( level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS ) {
ADDRGP4 level+5028
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 2048
LEI4 $307
line 549
;549:		G_Error( "G_AddSpawnVarToken: MAX_SPAWN_VARS" );
ADDRGP4 $310
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 550
;550:	}
LABELV $307
line 552
;551:
;552:	dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+5028
INDIRI4
ADDRGP4 level+5032
ADDP4
ASGNP4
line 553
;553:	memcpy( dest, string, l+1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 555
;554:
;555:	level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+5028
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 557
;556:
;557:	return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $306
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 570
;558:}
;559:
;560:/*
;561:====================
;562:G_ParseSpawnVars
;563:
;564:Parses a brace bounded set of key / value pairs out of the
;565:level's entity strings into level.spawnVars[]
;566:
;567:This does not actually spawn an entity.
;568:====================
;569:*/
;570:qboolean G_ParseSpawnVars( void ) {
line 574
;571:	char		keyname[MAX_TOKEN_CHARS];
;572:	char		com_token[MAX_TOKEN_CHARS];
;573:
;574:	level.numSpawnVars = 0;
ADDRGP4 level+4512
CNSTI4 0
ASGNI4
line 575
;575:	level.numSpawnVarChars = 0;
ADDRGP4 level+5028
CNSTI4 0
ASGNI4
line 578
;576:
;577:	// parse the opening brace
;578:	if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2048
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $317
line 580
;579:		// end of spawn string
;580:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $317
line 582
;581:	}
;582:	if ( com_token[0] != '{' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $323
line 583
;583:		G_Error( "G_ParseSpawnVars: found %s when expecting {",com_token );
ADDRGP4 $321
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 584
;584:	}
ADDRGP4 $323
JUMPV
LABELV $322
line 587
;585:
;586:	// go through all the key / value pairs
;587:	while ( 1 ) {	
line 589
;588:		// parse key
;589:		if ( !trap_GetEntityToken( keyname, sizeof( keyname ) ) ) {
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2052
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $325
line 590
;590:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $327
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 591
;591:		}
LABELV $325
line 593
;592:
;593:		if ( keyname[0] == '}' ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $328
line 594
;594:			break;
ADDRGP4 $324
JUMPV
LABELV $328
line 598
;595:		}
;596:		
;597:		// parse value	
;598:		if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2056
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $330
line 599
;599:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $327
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 600
;600:		}
LABELV $330
line 602
;601:
;602:		if ( com_token[0] == '}' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $332
line 603
;603:			G_Error( "G_ParseSpawnVars: closing brace without data" );
ADDRGP4 $334
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 604
;604:		}
LABELV $332
line 605
;605:		if ( level.numSpawnVars == MAX_SPAWN_VARS ) {
ADDRGP4 level+4512
INDIRI4
CNSTI4 64
NEI4 $335
line 606
;606:			G_Error( "G_ParseSpawnVars: MAX_SPAWN_VARS" );
ADDRGP4 $338
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 607
;607:		}
LABELV $335
line 608
;608:		level.spawnVars[ level.numSpawnVars ][0] = G_AddSpawnVarToken( keyname );
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4512
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4516
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 609
;609:		level.spawnVars[ level.numSpawnVars ][1] = G_AddSpawnVarToken( com_token );
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4512
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4516+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 610
;610:		level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+4512
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 611
;611:	}
LABELV $323
line 587
ADDRGP4 $322
JUMPV
LABELV $324
line 613
;612:
;613:	return qtrue;
CNSTI4 1
RETI4
LABELV $314
endproc G_ParseSpawnVars 2072 8
export SP_worldspawn
proc SP_worldspawn 16 12
line 625
;614:}
;615:
;616:
;617:
;618:/*QUAKED worldspawn (0 0 0) ?
;619:
;620:Every map should have exactly one worldspawn.
;621:"music"		music wav file
;622:"gravity"	800 is default gravity
;623:"message"	Text to print during connection process
;624:*/
;625:void SP_worldspawn( void ) {
line 628
;626:	char	*s;
;627:
;628:	G_SpawnString( "classname", "", &s );
ADDRGP4 $88
ARGP4
ADDRGP4 $346
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 629
;629:	if ( Q_stricmp( s, "worldspawn" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $349
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $347
line 630
;630:		G_Error( "SP_worldspawn: The first entity isn't 'worldspawn'" );
ADDRGP4 $350
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 631
;631:	}
LABELV $347
line 634
;632:
;633:	// make some data visible to connecting client
;634:	trap_SetConfigstring( CS_GAME_VERSION, GAME_VERSION );
CNSTI4 20
ARGI4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 636
;635:// Navy Seals ++
;636:	trap_SetConfigstring( CS_LEVEL_START_TIME, va("%i", level.startTime ) );
ADDRGP4 $352
ARGP4
ADDRGP4 level+44
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 637
;637:	trap_SetConfigstring( CS_ROUND_START_TIME, "0" );
CNSTI4 28
ARGI4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 638
;638:	trap_SetConfigstring( CS_VIP_START_TIME, "0" );
CNSTI4 29
ARGI4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 639
;639:	trap_SetConfigstring( CS_BOMB_START_TIME, "0" );
CNSTI4 30
ARGI4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 640
;640:	trap_SetConfigstring( CS_ASSAULT_START_TIME, "0" );
CNSTI4 32
ARGI4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 641
;641:	trap_SetConfigstring( CS_ASSAULT2_START_TIME, "0" );
CNSTI4 33
ARGI4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 642
;642:	trap_SetConfigstring( CS_ASSAULT3_START_TIME, "0" );
CNSTI4 34
ARGI4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 643
;643:	trap_SetConfigstring( CS_ASSAULT4_START_TIME, "0" );
CNSTI4 35
ARGI4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 647
;644:
;645:// Navy Seals --
;646:
;647:	G_SpawnString( "music", "", &s );
ADDRGP4 $354
ARGP4
ADDRGP4 $346
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 648
;648:	trap_SetConfigstring( CS_MUSIC, s );
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 650
;649:
;650:	G_SpawnString( "message", "", &s );
ADDRGP4 $96
ARGP4
ADDRGP4 $346
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 651
;651:	trap_SetConfigstring( CS_MESSAGE, s );				// map specific message
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 653
;652:
;653:	trap_SetConfigstring( CS_MOTD, g_motd.string );		// message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 655
;654:
;655:	G_SpawnString( "gravity", "800", &s );
ADDRGP4 $356
ARGP4
ADDRGP4 $357
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 656
;656:	trap_Cvar_Set( "g_gravity", s );
ADDRGP4 $358
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 658
;657:
;658:	G_SpawnInt( "drawwiner", "0", &level.drawWinner ); 
ADDRGP4 $359
ARGP4
ADDRGP4 $288
ARGP4
ADDRGP4 level+7816
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 660
;659:
;660:	if ( level.drawWinner == 0 ) 
ADDRGP4 level+7816
INDIRI4
CNSTI4 0
NEI4 $361
line 661
;661:		G_SpawnInt( "drawwinner", "0", &level.drawWinner ); 
ADDRGP4 $364
ARGP4
ADDRGP4 $288
ARGP4
ADDRGP4 level+7816
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
LABELV $361
line 663
;662:
;663:	G_SpawnString( "enableDust", "0", &s );
ADDRGP4 $366
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 664
;664:	trap_Cvar_Set( "g_enableDust", s );
ADDRGP4 $367
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 666
;665:
;666:	G_SpawnString( "enableBreath", "0", &s );
ADDRGP4 $368
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 667
;667:	trap_Cvar_Set( "g_enableBreath", s );
ADDRGP4 $369
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 669
;668:
;669:	g_entities[ENTITYNUM_WORLD].s.number = ENTITYNUM_WORLD;
ADDRGP4 g_entities+1132376
CNSTI4 1022
ASGNI4
line 670
;670:	g_entities[ENTITYNUM_WORLD].classname = "worldspawn";
ADDRGP4 g_entities+1132376+524
ADDRGP4 $349
ASGNP4
line 673
;671:
;672:	// see if we want a warmup time
;673:	trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $346
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 674
;674:	if ( g_restarted.integer ) {
ADDRGP4 g_restarted+12
INDIRI4
CNSTI4 0
EQI4 $373
line 675
;675:		trap_Cvar_Set( "g_restarted", "0" );
ADDRGP4 $376
ARGP4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 676
;676:		level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 677
;677:	} else if ( g_doWarmup.integer ) { // Turn it on
ADDRGP4 $374
JUMPV
LABELV $373
ADDRGP4 g_doWarmup+12
INDIRI4
CNSTI4 0
EQI4 $378
line 678
;678:		level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 679
;679:		trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $352
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 680
;680:		G_LogPrintf( "Warmup:\n" );
ADDRGP4 $383
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 681
;681:	}
LABELV $378
LABELV $374
line 683
;682:
;683:}
LABELV $345
endproc SP_worldspawn 16 12
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 693
;684:
;685:
;686:/*
;687:==============
;688:G_SpawnEntitiesFromString
;689:
;690:Parses textual entity definitions out of an entstring and spawns gentities.
;691:==============
;692:*/
;693:void G_SpawnEntitiesFromString( void ) {
line 695
;694:	// allow calls to G_Spawn*()
;695:	level.spawning = qtrue;
ADDRGP4 level+4508
CNSTI4 1
ASGNI4
line 696
;696:	level.numSpawnVars = 0;
ADDRGP4 level+4512
CNSTI4 0
ASGNI4
line 701
;697:
;698:	// the worldspawn is not an actual entity, but it still
;699:	// has a "spawn" function to perform any global setup
;700:	// needed by a level (setting configstrings or cvars, etc)
;701:	if ( !G_ParseSpawnVars() ) {
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $387
line 702
;702:		G_Error( "SpawnEntities: no entities" );
ADDRGP4 $389
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 703
;703:	}
LABELV $387
line 704
;704:	SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
ADDRGP4 $391
JUMPV
LABELV $390
line 707
;705:
;706:	// parse ents
;707:	while( G_ParseSpawnVars() ) {
line 708
;708:		G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
line 709
;709:	}	
LABELV $391
line 707
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $390
line 711
;710:
;711:	level.spawning = qfalse;			// any future calls to G_Spawn*() will be errors
ADDRGP4 level+4508
CNSTI4 0
ASGNI4
line 712
;712:}
LABELV $384
endproc G_SpawnEntitiesFromString 8 4
import SP_target_modifyxp
import SP_target_Particle
import SP_doorlock_spawn
import SP_fun_ball_spawn
import SP_trigger_fun_goal
import SP_assault_field
import SP_vip_spawn
import SP_vip_rescue
import SP_func_wall
import SP_info_bomb_disarm
import SP_trigger_explosion
import SP_func_ammo_train
import SP_trigger_counter
import SP_trigger_points
import SP_func_explosive
import SP_func_door_rotate
import SP_team_CTF_bluespawn
import SP_team_CTF_redspawn
import SP_team_CTF_blueplayer
import SP_team_CTF_redplayer
import SP_shooter_grenade
import SP_shooter_plasma
import SP_shooter_rocket
import SP_misc_portal_surface
import SP_misc_portal_camera
import SP_misc_model
import SP_misc_teleporter_dest
import SP_path_elevator
import SP_path_corner
import SP_info_camp
import SP_info_notnull
import SP_info_null
import SP_light
import SP_target_push
import SP_target_location
import SP_target_position
import SP_target_kill
import SP_target_relay
import SP_target_teleporter
import SP_target_score
import SP_target_character
import SP_target_laser
import SP_target_print
import SP_target_speaker
import SP_target_delay
import SP_target_give
import SP_target_remove_powerups
import SP_trigger_hurt
import SP_trigger_teleport
import SP_trigger_push
import SP_trigger_use
import SP_trigger_multiple
import SP_trigger_toggle
import SP_trigger_always
import SP_func_timer
import SP_func_elevator_button
import SP_func_elevator
import SP_func_train
import SP_func_door
import SP_func_button
import SP_func_pendulum
import SP_func_bobbing
import SP_func_rotating
import SP_func_static
import SP_func_plat
import SP_info_podium
import SP_info_thirdplace
import SP_info_secondplace
import SP_info_firstplace
import SP_info_player_intermission
import SP_info_player_deathmatch
import SP_info_player_start
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
import trigger_teleporter_touch
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
import TriggerToggle_ResetState
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
LABELV $389
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $383
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $376
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $369
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
LABELV $368
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
LABELV $367
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
LABELV $366
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
LABELV $364
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 119
byte 1 105
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $359
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 119
byte 1 105
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $358
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $357
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $356
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $354
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $352
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $351
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
LABELV $350
byte 1 83
byte 1 80
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 39
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 39
byte 1 0
align 1
LABELV $349
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $346
byte 1 0
align 1
LABELV $338
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $334
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $327
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 69
byte 1 79
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $321
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 0
align 1
LABELV $310
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $296
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $291
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $288
byte 1 48
byte 1 0
align 1
LABELV $287
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $275
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $274
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $273
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $272
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $271
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $270
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $269
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $268
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $235
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $224
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
LABELV $218
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
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
byte 1 58
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 40
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $214
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
byte 1 0
align 1
LABELV $199
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $196
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $193
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $190
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $187
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
byte 1 0
align 1
LABELV $184
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $178
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $174
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $173
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $172
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $171
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $170
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $169
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $168
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $167
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $166
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $165
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $164
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $163
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
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
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $162
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 101
byte 1 108
byte 1 101
byte 1 118
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $161
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $160
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 120
byte 1 112
byte 1 0
align 1
LABELV $159
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $158
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $157
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $156
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
LABELV $155
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $154
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $153
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $150
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $149
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $147
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $146
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $144
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $143
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $142
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
LABELV $141
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
byte 1 0
align 1
LABELV $140
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
byte 1 0
align 1
LABELV $139
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $138
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $137
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
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
LABELV $136
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 118
byte 1 105
byte 1 112
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $135
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 118
byte 1 105
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 99
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $134
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $133
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $132
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 101
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
LABELV $131
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $130
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $129
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $128
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $127
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $126
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
byte 1 0
align 1
LABELV $125
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $124
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 108
byte 1 101
byte 1 118
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $123
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 101
byte 1 108
byte 1 101
byte 1 118
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $122
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $121
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 117
byte 1 108
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $120
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $119
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $118
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $117
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $116
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $115
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $113
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $112
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $111
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $110
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $109
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 101
byte 1 119
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $106
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $105
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $101
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $99
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $98
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $97
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $96
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $94
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $93
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $92
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $91
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 50
byte 1 0
align 1
LABELV $90
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $89
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $88
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $85
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
