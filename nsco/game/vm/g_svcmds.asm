code
proc StringToFilter 160 8
file "../g_svcmds.c"
line 64
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// every line of code that differs from the quake3:arena SDK
;4:// is property of manfred nerurkar
;5:// no commercial explotation allowed
;6:// you are only allowed to use this code in navy seals: covert operations 
;7:// a quake3 arena modifiation
;8:// defcon-x@ns-co.net
;9:
;10:// this file holds commands that can be executed by the server console, but not remote clients
;11:
;12:#include "g_local.h"
;13:
;14:
;15:/*
;16:==============================================================================
;17:
;18:PACKET FILTERING
;19: 
;20:
;21:You can add or remove addresses from the filter list with:
;22:
;23:addip <ip>
;24:removeip <ip>
;25:
;26:The ip address is specified in dot format, and any unspecified digits will match any value, so you can specify an entire class C network with "addip 192.246.40".
;27:
;28:Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.
;29:
;30:listip
;31:Prints the current list of filters.
;32:
;33:g_filterban <0 or 1>
;34:
;35:If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.
;36:
;37:If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.
;38:
;39:
;40:==============================================================================
;41:*/
;42:
;43:// extern	vmCvar_t	g_banIPs;
;44:// extern	vmCvar_t	g_filterBan;
;45:
;46:
;47:typedef struct ipFilter_s
;48:{
;49:	unsigned	mask;
;50:	unsigned	compare;
;51:} ipFilter_t;
;52:
;53:#define	MAX_IPFILTERS	1024
;54:
;55:static ipFilter_t	ipFilters[MAX_IPFILTERS];
;56:static int			numIPFilters;
;57:
;58:/*
;59:=================
;60:StringToFilter
;61:=================
;62:*/
;63:static qboolean StringToFilter (char *s, ipFilter_t *f)
;64:{
line 70
;65:	char	num[128];
;66:	int		i, j;
;67:	byte	b[4];
;68:	byte	m[4];
;69:	
;70:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $69
line 71
;71:	{
line 72
;72:		b[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
CNSTU1 0
ASGNU1
line 73
;73:		m[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 0
ASGNU1
line 74
;74:	}
LABELV $70
line 70
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $69
line 76
;75:	
;76:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $73
line 77
;77:	{
line 78
;78:		if (*s < '0' || *s > '9')
ADDRLP4 144
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 48
LTI4 $79
ADDRLP4 144
INDIRI4
CNSTI4 57
LEI4 $77
LABELV $79
line 79
;79:		{
line 80
;80:			G_Printf( "Bad filter address: %s\n", s );
ADDRGP4 $80
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 81
;81:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $77
line 84
;82:		}
;83:		
;84:		j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
line 86
;85:		while (*s >= '0' && *s <= '9')
;86:		{
line 87
;87:			num[j++] = *s++;
ADDRLP4 148
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 156
CNSTI4 1
ASGNI4
ADDRLP4 128
ADDRLP4 148
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ASGNP4
ADDRLP4 148
INDIRI4
ADDRLP4 0
ADDP4
ADDRLP4 152
INDIRP4
INDIRI1
ASGNI1
line 88
;88:		}
LABELV $82
line 85
ADDRLP4 148
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 48
LTI4 $84
ADDRLP4 148
INDIRI4
CNSTI4 57
LEI4 $81
LABELV $84
line 89
;89:		num[j] = 0;
ADDRLP4 128
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 90
;90:		b[i] = atoi(num);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
ADDRLP4 152
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 91
;91:		if (b[i] != 0)
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $85
line 92
;92:			m[i] = 255;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 255
ASGNU1
LABELV $85
line 94
;93:
;94:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $87
line 95
;95:			break;
ADDRGP4 $75
JUMPV
LABELV $87
line 96
;96:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 97
;97:	}
LABELV $74
line 76
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $73
LABELV $75
line 99
;98:	
;99:	f->mask = *(unsigned *)m;
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRU4
ASGNU4
line 100
;100:	f->compare = *(unsigned *)b;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 136
INDIRU4
ASGNU4
line 102
;101:	
;102:	return qtrue;
CNSTI4 1
RETI4
LABELV $68
endproc StringToFilter 160 8
proc UpdateIPBans 1040 28
line 111
;103:}
;104:
;105:/*
;106:=================
;107:UpdateIPBans
;108:=================
;109:*/
;110:static void UpdateIPBans (void)
;111:{
line 116
;112:	byte	b[4];
;113:	int		i;
;114:	char	iplist[MAX_INFO_STRING];
;115:
;116:	*iplist = 0;
ADDRLP4 4
CNSTI1 0
ASGNI1
line 117
;117:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRGP4 $93
JUMPV
LABELV $90
line 118
;118:	{
line 119
;119:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 1028
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $94
line 120
;120:			continue;
ADDRGP4 $91
JUMPV
LABELV $94
line 122
;121:
;122:		*(unsigned *)b = ipFilters[i].compare;
ADDRLP4 0
ADDRLP4 1028
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ASGNU4
line 123
;123:		Com_sprintf( iplist + strlen(iplist), sizeof(iplist) - strlen(iplist), 
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 1036
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $98
ARGP4
ADDRLP4 0
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+1
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+2
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+3
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 125
;124:			"%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
;125:	}
LABELV $91
line 117
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $93
ADDRLP4 1028
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $90
line 127
;126:
;127:	trap_Cvar_Set( "g_banIPs", iplist );
ADDRGP4 $102
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 128
;128:}
LABELV $89
endproc UpdateIPBans 1040 28
export G_FilterPacket
proc G_FilterPacket 28 0
line 136
;129:
;130:/*
;131:=================
;132:G_FilterPacket
;133:=================
;134:*/
;135:qboolean G_FilterPacket (char *from)
;136:{
line 142
;137:	int		i;
;138:	unsigned	in;
;139:	byte m[4];
;140:	char *p;
;141:
;142:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 143
;143:	p = from;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $105
JUMPV
LABELV $104
line 144
;144:	while (*p && i < 4) {
line 145
;145:		m[i] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTU1 0
ASGNU1
ADDRGP4 $108
JUMPV
LABELV $107
line 146
;146:		while (*p >= '0' && *p <= '9') {
line 147
;147:			m[i] = m[i]*10 + (*p - '0');
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 10
ADDRLP4 16
INDIRP4
INDIRU1
CVUI4 1
MULI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 148
;148:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 149
;149:		}
LABELV $108
line 146
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $110
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $107
LABELV $110
line 150
;150:		if (!*p || *p == ':')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $113
ADDRLP4 20
INDIRI4
CNSTI4 58
NEI4 $111
LABELV $113
line 151
;151:			break;
ADDRGP4 $106
JUMPV
LABELV $111
line 152
;152:		i++, p++;
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
line 153
;153:	}
LABELV $105
line 144
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $114
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $104
LABELV $114
LABELV $106
line 155
;154:	
;155:	in = *(unsigned *)m;
ADDRLP4 12
ADDRLP4 8
INDIRU4
ASGNU4
line 157
;156:
;157:	for (i=0 ; i<numIPFilters ; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $115
line 158
;158:		if ( (in & ipFilters[i].mask) == ipFilters[i].compare)
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
BANDU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
NEU4 $119
line 159
;159:			return g_filterBan.integer != 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
EQI4 $124
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $125
JUMPV
LABELV $124
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $125
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $103
JUMPV
LABELV $119
LABELV $116
line 157
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $118
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $115
line 161
;160:
;161:	return g_filterBan.integer == 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
NEI4 $128
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $128
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $129
ADDRLP4 24
INDIRI4
RETI4
LABELV $103
endproc G_FilterPacket 28 0
proc AddIP 8 8
line 170
;162:}
;163:
;164:/*
;165:=================
;166:AddIP
;167:=================
;168:*/
;169:static void AddIP( char *str )
;170:{
line 173
;171:	int		i;
;172:
;173:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $131
line 174
;174:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $135
line 175
;175:			break;		// free spot
ADDRGP4 $133
JUMPV
LABELV $135
LABELV $132
line 173
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $131
LABELV $133
line 176
;176:	if (i == numIPFilters)
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $138
line 177
;177:	{
line 178
;178:		if (numIPFilters == MAX_IPFILTERS)
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $140
line 179
;179:		{
line 180
;180:			G_Printf ("IP filter list is full\n");
ADDRGP4 $142
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 181
;181:			return;
ADDRGP4 $130
JUMPV
LABELV $140
line 183
;182:		}
;183:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 184
;184:	}
LABELV $138
line 186
;185:	
;186:	if (!StringToFilter (str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $143
line 187
;187:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $143
line 189
;188:
;189:	UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 190
;190:}
LABELV $130
endproc AddIP 8 8
export G_ProcessIPBans
proc G_ProcessIPBans 1044 12
line 198
;191:
;192:/*
;193:=================
;194:G_ProcessIPBans
;195:=================
;196:*/
;197:void G_ProcessIPBans(void) 
;198:{
line 202
;199:	char *s, *t;
;200:	char		str[MAX_TOKEN_CHARS];
;201:
;202:	Q_strncpyz( str, g_banIPs.string, sizeof(str) );
ADDRLP4 8
ARGP4
ADDRGP4 g_banIPs+16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 204
;203:
;204:	for (t = s = g_banIPs.string; *t; /* */ ) {
ADDRLP4 1032
ADDRGP4 g_banIPs+16
ASGNP4
ADDRLP4 0
ADDRLP4 1032
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 1032
INDIRP4
ASGNP4
ADDRGP4 $151
JUMPV
LABELV $148
line 205
;205:		s = strchr(s, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 206
;206:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $156
line 207
;207:			break;
ADDRGP4 $150
JUMPV
LABELV $155
line 209
;208:		while (*s == ' ')
;209:			*s++ = 0;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1040
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI1 0
ASGNI1
LABELV $156
line 208
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $155
line 210
;210:		if (*t)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $158
line 211
;211:			AddIP( t );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 AddIP
CALLV
pop
LABELV $158
line 212
;212:		t = s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 213
;213:	}
LABELV $149
line 204
LABELV $151
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $148
LABELV $150
line 214
;214:}
LABELV $146
endproc G_ProcessIPBans 1044 12
export Svcmd_AddIP_f
proc Svcmd_AddIP_f 1028 12
line 223
;215:
;216:
;217:/*
;218:=================
;219:Svcmd_AddIP_f
;220:=================
;221:*/
;222:void Svcmd_AddIP_f (void)
;223:{
line 226
;224:	char		str[MAX_TOKEN_CHARS];
;225:
;226:	if ( trap_Argc() < 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
GEI4 $161
line 227
;227:		G_Printf("Usage:  addip <ip-mask>\n");
ADDRGP4 $163
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 228
;228:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 231
;229:	}
;230:
;231:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 233
;232:
;233:	AddIP( str );
ADDRLP4 0
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 235
;234:
;235:}
LABELV $160
endproc Svcmd_AddIP_f 1028 12
export Svcmd_RemoveIP_f
proc Svcmd_RemoveIP_f 1048 12
line 243
;236:
;237:/*
;238:=================
;239:Svcmd_RemoveIP_f
;240:=================
;241:*/
;242:void Svcmd_RemoveIP_f (void)
;243:{
line 248
;244:	ipFilter_t	f;
;245:	int			i;
;246:	char		str[MAX_TOKEN_CHARS];
;247:
;248:	if ( trap_Argc() < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $165
line 249
;249:		G_Printf("Usage:  sv removeip <ip-mask>\n");
ADDRGP4 $167
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 250
;250:		return;
ADDRGP4 $164
JUMPV
LABELV $165
line 253
;251:	}
;252:
;253:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 255
;254:
;255:	if (!StringToFilter (str, &f))
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $168
line 256
;256:		return;
ADDRGP4 $164
JUMPV
LABELV $168
line 258
;257:
;258:	for (i=0 ; i<numIPFilters ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $173
JUMPV
LABELV $170
line 259
;259:		if (ipFilters[i].mask == f.mask	&&
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ADDRLP4 4
INDIRU4
NEU4 $174
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ADDRLP4 4+4
INDIRU4
NEU4 $174
line 260
;260:			ipFilters[i].compare == f.compare) {
line 261
;261:			ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
line 262
;262:			G_Printf ("Removed.\n");
ADDRGP4 $179
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 264
;263:
;264:			UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 265
;265:			return;
ADDRGP4 $164
JUMPV
LABELV $174
line 267
;266:		}
;267:	}
LABELV $171
line 258
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $173
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $170
line 269
;268:
;269:	G_Printf ( "Didn't find %s.\n", str );
ADDRGP4 $180
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 270
;270:}
LABELV $164
endproc Svcmd_RemoveIP_f 1048 12
export Svcmd_EntityList_f
proc Svcmd_EntityList_f 16 8
line 277
;271:
;272:/*
;273:===================
;274:Svcmd_EntityList_f
;275:===================
;276:*/
;277:void	Svcmd_EntityList_f (void) {
line 281
;278:	int			e;
;279:	gentity_t		*check;
;280:
;281:	check = g_entities+1;
ADDRLP4 0
ADDRGP4 g_entities+1108
ASGNP4
line 282
;282:	for (e = 1; e < level.num_entities ; e++, check++) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $183
line 283
;283:		if ( !check->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $188
line 284
;284:			continue;
ADDRGP4 $184
JUMPV
LABELV $188
line 286
;285:		}
;286:		G_Printf("%3i:", e);
ADDRGP4 $190
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 287
;287:		switch ( check->s.eType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $191
ADDRLP4 8
INDIRI4
CNSTI4 25
GTI4 $191
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $243
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $243
address $194
address $196
address $198
address $204
address $226
address $228
address $230
address $232
address $234
address $236
address $238
address $240
address $191
address $200
address $191
address $206
address $224
address $202
address $208
address $210
address $212
address $214
address $216
address $218
address $220
address $222
code
LABELV $194
line 289
;288:		case ET_GENERAL:
;289:			G_Printf("ET_GENERAL          ");
ADDRGP4 $195
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 290
;290:			break;
ADDRGP4 $192
JUMPV
LABELV $196
line 292
;291:		case ET_PLAYER:
;292:			G_Printf("ET_PLAYER           ");
ADDRGP4 $197
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 293
;293:			break;
ADDRGP4 $192
JUMPV
LABELV $198
line 295
;294:		case ET_ITEM:
;295:			G_Printf("ET_ITEM             ");
ADDRGP4 $199
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 296
;296:			break;
ADDRGP4 $192
JUMPV
LABELV $200
line 298
;297:		case ET_FLARE:
;298:			G_Printf("ET_FLARE            ");
ADDRGP4 $201
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 299
;299:			break;
ADDRGP4 $192
JUMPV
LABELV $202
line 302
;300:#ifdef PARTICLEHOST
;301:		case ET_PARTICLEHOST:
;302:			G_Printf("ET_PARTICLEHOST            ");
ADDRGP4 $203
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 303
;303:			break;
ADDRGP4 $192
JUMPV
LABELV $204
line 306
;304:#endif
;305:		case ET_MISSILE:
;306:			G_Printf("ET_MISSILE          ");
ADDRGP4 $205
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 307
;307:			break;
ADDRGP4 $192
JUMPV
LABELV $206
line 309
;308:		case ET_DOOR:
;309:			G_Printf("ET_DOOR            ");
ADDRGP4 $207
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 310
;310:			break;
ADDRGP4 $192
JUMPV
LABELV $208
line 312
;311:		case ET_ELEVBUT0:
;312:			G_Printf("ET_ELEVBUT0            ");
ADDRGP4 $209
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 313
;313:			break;
ADDRGP4 $192
JUMPV
LABELV $210
line 315
;314:		case ET_ELEVBUT1:
;315:			G_Printf("ET_ELEVBUT1            ");
ADDRGP4 $211
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 316
;316:			break;
ADDRGP4 $192
JUMPV
LABELV $212
line 318
;317:		case ET_ELEVBUT2:
;318:			G_Printf("ET_ELEVBUT2            ");
ADDRGP4 $213
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 319
;319:			break;
ADDRGP4 $192
JUMPV
LABELV $214
line 321
;320:		case ET_ELEVBUT3:
;321:			G_Printf("ET_ELEVBUT3            ");
ADDRGP4 $215
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 322
;322:			break;
ADDRGP4 $192
JUMPV
LABELV $216
line 324
;323:		case ET_ELEVBUT4:
;324:			G_Printf("ET_ELEVBUT4            ");
ADDRGP4 $217
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 325
;325:			break;
ADDRGP4 $192
JUMPV
LABELV $218
line 327
;326:		case ET_ELEVBUT5:
;327:			G_Printf("ET_ELEVBUT5            ");
ADDRGP4 $219
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 328
;328:			break;
ADDRGP4 $192
JUMPV
LABELV $220
line 330
;329:		case ET_ELEVBUT6:
;330:			G_Printf("ET_ELEVBUT6            ");
ADDRGP4 $221
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 331
;331:			break;
ADDRGP4 $192
JUMPV
LABELV $222
line 333
;332:		case ET_ELEVBUT7:
;333:			G_Printf("ET_ELEVBUT7            ");
ADDRGP4 $223
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 334
;334:			break;
ADDRGP4 $192
JUMPV
LABELV $224
line 336
;335:		case ET_FUNCEXPLOSIVE:
;336:			G_Printf("ET_FUNCEXPLOSIVE            ");
ADDRGP4 $225
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 337
;337:			break;
ADDRGP4 $192
JUMPV
LABELV $226
line 339
;338:		case ET_MOVER:
;339:			G_Printf("ET_MOVER            ");
ADDRGP4 $227
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 340
;340:			break;
ADDRGP4 $192
JUMPV
LABELV $228
line 342
;341:		case ET_BEAM:
;342:			G_Printf("ET_BEAM             ");
ADDRGP4 $229
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 343
;343:			break;
ADDRGP4 $192
JUMPV
LABELV $230
line 345
;344:		case ET_PORTAL:
;345:			G_Printf("ET_PORTAL           ");
ADDRGP4 $231
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 346
;346:			break;
ADDRGP4 $192
JUMPV
LABELV $232
line 348
;347:		case ET_SPEAKER:
;348:			G_Printf("ET_SPEAKER          ");
ADDRGP4 $233
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 349
;349:			break;
ADDRGP4 $192
JUMPV
LABELV $234
line 351
;350:		case ET_PUSH_TRIGGER:
;351:			G_Printf("ET_PUSH_TRIGGER     ");
ADDRGP4 $235
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 352
;352:			break;
ADDRGP4 $192
JUMPV
LABELV $236
line 354
;353:		case ET_TELEPORT_TRIGGER:
;354:			G_Printf("ET_TELEPORT_TRIGGER ");
ADDRGP4 $237
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 355
;355:			break;
ADDRGP4 $192
JUMPV
LABELV $238
line 357
;356:		case ET_INVISIBLE:
;357:			G_Printf("ET_INVISIBLE        ");
ADDRGP4 $239
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 358
;358:			break;
ADDRGP4 $192
JUMPV
LABELV $240
line 360
;359:		case ET_GRAPPLE:
;360:			G_Printf("ET_GRAPPLE          ");
ADDRGP4 $241
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 361
;361:			break;
ADDRGP4 $192
JUMPV
LABELV $191
line 366
;362:/*		case ET_ACTOR:
;363:			G_Printf("ET_ACTOR          ");
;364:			break;*/
;365:		default:
;366:			G_Printf("%3i                 ", check->s.eType);
ADDRGP4 $242
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 367
;367:			break;
LABELV $192
line 370
;368:		}
;369:
;370:		if ( check->classname ) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $244
line 371
;371:			G_Printf("%s", check->classname);
ADDRGP4 $246
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 372
;372:		}
LABELV $244
line 373
;373:		G_Printf("\n");
ADDRGP4 $247
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 374
;374:	}
LABELV $184
line 282
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1108
ADDP4
ASGNP4
LABELV $186
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $183
line 375
;375:}
LABELV $181
endproc Svcmd_EntityList_f 16 8
export ClientForString
proc ClientForString 24 8
line 377
;376:
;377:gclient_t	*ClientForString( const char *s ) {
line 383
;378:	gclient_t	*cl;
;379:	int			i;
;380:	int			idnum;
;381:
;382:	// numeric values are just slot numbers
;383:	if ( s[0] >= '0' && s[0] <= '9' ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $249
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $249
line 384
;384:		idnum = atoi( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 385
;385:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $254
ADDRLP4 20
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $251
LABELV $254
line 386
;386:			Com_Printf( "Bad client slot: %i\n", idnum );
ADDRGP4 $255
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 387
;387:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $248
JUMPV
LABELV $251
line 390
;388:		}
;389:
;390:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 7668
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 391
;391:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $256
line 392
;392:			G_Printf( "Client %i is not connected\n", idnum );
ADDRGP4 $258
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 393
;393:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $248
JUMPV
LABELV $256
line 395
;394:		}
;395:		return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $248
JUMPV
LABELV $249
line 399
;396:	}
;397:
;398:	// check for a name match
;399:	for ( i=0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $262
JUMPV
LABELV $259
line 400
;400:		cl = &level.clients[i];
ADDRLP4 0
CNSTI4 7668
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 401
;401:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $264
line 402
;402:			continue;
ADDRGP4 $260
JUMPV
LABELV $264
line 404
;403:		}
;404:		if ( !Q_stricmp( cl->pers.netname, s ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $266
line 405
;405:			return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $248
JUMPV
LABELV $266
line 407
;406:		}
;407:	}
LABELV $260
line 399
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $262
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $259
line 409
;408:
;409:	G_Printf( "User %s is not on the server\n", s );
ADDRGP4 $268
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 411
;410:
;411:	return NULL;
CNSTP4 0
RETP4
LABELV $248
endproc ClientForString 24 8
export Svcmd_KillPlayer_f
proc Svcmd_KillPlayer_f 1032 12
line 423
;412:} 
;413:
;414:/*
;415:===================
;416:Svcmd_KillPlayer_f
;417:
;418:killplayer <player>
;419:===================
;420:*/
;421:void Cmd_Kill_f( gentity_t *ent );
;422:
;423:void	Svcmd_KillPlayer_f( void ) {
line 428
;424:	gclient_t	*cl;
;425:	char		str[MAX_TOKEN_CHARS];
;426:
;427:	// find the player
;428:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 429
;429:	cl = ClientForString( str );
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1028
INDIRP4
ASGNP4
line 430
;430:	if ( !cl ) { 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $270
line 431
;431:		return;
ADDRGP4 $269
JUMPV
LABELV $270
line 435
;432:	}
;433:
;434:	// set the team
;435:	Cmd_Kill_f( &g_entities[ cl->ps.clientNum ] );
CNSTI4 1108
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
line 436
;436:}
LABELV $269
endproc Svcmd_KillPlayer_f 1032 12
export Svcmd_Scorereset_f
proc Svcmd_Scorereset_f 8 12
line 446
;437:
;438:/*
;439:===================
;440:Svcmd_Scorereset_f
;441:
;442:	scorereset
;443:===================
;444:*/
;445:void Svcmd_Scorereset_f( void )
;446:{
line 451
;447:	int i;
;448:	gclient_t *cl; 
;449:
;450:  	// check for a name match
;451:	for ( i=0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $273
line 452
;452:		cl = &level.clients[i];
ADDRLP4 0
CNSTI4 7668
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 454
;453:
;454:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $278
line 455
;455:			continue;
ADDRGP4 $274
JUMPV
LABELV $278
line 458
;456:		}
;457:
;458:		cl->pers.nsPC.xp = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 459
;459:		cl->pers.nsPC.entire_xp = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1568
ADDP4
CNSTI4 0
ASGNI4
line 463
;460:		// we will give him  xp 
;461:
;462:		// and we will reset all these values
;463:		cl->pers.nsPC.stealth = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 1
ASGNI4
line 464
;464:		cl->pers.nsPC.strength = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 465
;465:		cl->pers.nsPC.stamina = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 1
ASGNI4
line 466
;466:		cl->pers.nsPC.speed = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 1
ASGNI4
line 467
;467:		cl->pers.nsPC.accuracy = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 1
ASGNI4
line 468
;468:		cl->pers.nsPC.technical = 1;  
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 1
ASGNI4
line 470
;469: 
;470:		cl->pers.nsPC.playerclass = CLASS_CUSTOM; 
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 7
ASGNI4
line 472
;471:
;472:		cl->ps.persistant[PERS_SCORE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 473
;473:		cl->ns.num_killed = 0;
ADDRLP4 0
INDIRP4
CNSTI4 3320
ADDP4
CNSTI4 0
ASGNI4
line 475
;474:	
;475:		if( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $280
line 476
;476:			NS_GiveXP( &g_entities[i], g_teamXp.integer, qfalse);			
CNSTI4 1108
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 g_teamXp+12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
ADDRGP4 $281
JUMPV
LABELV $280
line 478
;477:		else
;478:			NS_GiveXP( &g_entities[i], g_baseXp.integer, qfalse);
CNSTI4 1108
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 g_baseXp+12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 NS_GiveXP
CALLV
pop
LABELV $281
line 479
;479:	}
LABELV $274
line 451
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $276
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $273
line 481
;480:
;481:	G_Printf( "Resetted characters for all players.\n" );
ADDRGP4 $285
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 482
;482:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 483
;483:}
LABELV $272
endproc Svcmd_Scorereset_f 8 12
export Svcmd_Listplayers_f
proc Svcmd_Listplayers_f 16 40
line 492
;484:/*
;485:===================
;486:Svcmd_Listplayers_f
;487:
;488:listplayers
;489:===================
;490:*/ 
;491:void Svcmd_Listplayers_f( void )  
;492:{
line 496
;493:	int i;
;494:	gclient_t *cl; 
;495:
;496:	G_Printf( "clientnum | name | team | score | time | ping | xp | entire xp | waiting\n");
ADDRGP4 $287
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 498
;497: 	// check for a name match
;498:	for ( i=0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $291
JUMPV
LABELV $288
line 499
;499:		cl = &level.clients[i];
ADDRLP4 0
CNSTI4 7668
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 500
;500:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $293
line 501
;501:			continue;
ADDRGP4 $289
JUMPV
LABELV $293
line 504
;502:		}
;503:
;504:		G_Printf( "%i %s %s %i %i %i %i %i %i\n", cl->ps.clientNum, cl->pers.netname,
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $295
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1568
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 508
;505:		TeamName( cl->sess.sessionTeam ), cl->ps.persistant[PERS_SCORE], 
;506:		(level.time - cl->pers.enterTime)/60000, cl->ps.ping, cl->pers.nsPC.xp, cl->pers.nsPC.entire_xp, cl->sess.waiting );
;507:
;508:	}
LABELV $289
line 498
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $291
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $288
line 509
;509:}
LABELV $286
endproc Svcmd_Listplayers_f 16 40
export Svcmd_ForceTeam_f
proc Svcmd_ForceTeam_f 1032 12
line 519
;510:
;511: 
;512:/*
;513:===================
;514:Svcmd_ForceTeam_f
;515:
;516:forceteam <player> <team>
;517:===================
;518:*/
;519:void	Svcmd_ForceTeam_f( void ) {
line 524
;520:	gclient_t	*cl;
;521:	char		str[MAX_TOKEN_CHARS];
;522:
;523:	// find the player
;524:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 525
;525:	cl = ClientForString( str );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 526
;526:	if ( !cl ) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $298
line 527
;527:		return;
ADDRGP4 $297
JUMPV
LABELV $298
line 531
;528:	}
;529:
;530:	// set the team
;531:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 532
;532:	SetTeam( &g_entities[cl - level.clients], str );
CNSTI4 1108
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 7668
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 533
;533:}
LABELV $297
endproc Svcmd_ForceTeam_f 1032 12
export Svcmd_RestartRound_f
proc Svcmd_RestartRound_f 4 8
line 544
;534:
;535:/*
;536:===================
;537:Svcmd_RestartRound_f
;538:descr: restarts current round
;539:
;540:restartround
;541:===================
;542:*/
;543:void	Svcmd_RestartRound_f( void ) 
;544:{
line 545
;545: 	if (level.warmupTime != -1)
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $301
line 546
;546:		return;
ADDRGP4 $300
JUMPV
LABELV $301
line 548
;547:
;548: 	NS_WonRound(TEAM_FREE); // draw again
CNSTI4 0
ARGI4
ADDRGP4 NS_WonRound
CALLV
pop
line 550
;549:
;550:	level.done_objectives[TEAM_RED] = level.done_objectives[TEAM_BLUE] = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 level+7412+8
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 level+7412+4
ADDRLP4 0
INDIRI4
ASGNI4
line 553
;551:
;552:	// buffer time until the next round starts
;553:	NS_SetGameState( STATE_OVER );
CNSTI4 1
ARGI4
ADDRGP4 NS_SetGameState
CALLV
pop
line 554
;554:	level.warmupTime = -3;
ADDRGP4 level+16
CNSTI4 -3
ASGNI4
line 555
;555:	level.winTime = level.time + 10 * ONE_SECOND; // 10 seconds till next match
ADDRGP4 level+7464
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 556
;556:	level.xpTime = level.time + 5 * ONE_SECOND;
ADDRGP4 level+7484
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 557
;557:	level.roundstartTime = 0;
ADDRGP4 level+7392
CNSTI4 0
ASGNI4
line 559
;558: 
;559:	assault_field_stopall( );
ADDRGP4 assault_field_stopall
CALLV
pop
line 561
;560:
;561:	PrintMsg( NULL, "Server restarted round.\n");
CNSTP4 0
ARGP4
ADDRGP4 $314
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 562
;562:}
LABELV $300
endproc Svcmd_RestartRound_f 4 8
export ConsoleCommand
proc ConsoleCommand 1080 12
line 570
;563:char	*ConcatArgs( int start );
;564:/*
;565:=================
;566:ConsoleCommand
;567:
;568:=================
;569:*/ 
;570:qboolean	ConsoleCommand( void ) {
line 573
;571:	char	cmd[MAX_TOKEN_CHARS];
;572:
;573:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 575
;574:
;575:	if ( Q_stricmp (cmd, "entitylist") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $318
ARGP4
ADDRLP4 1024
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $316
line 576
;576:		Svcmd_EntityList_f();
ADDRGP4 Svcmd_EntityList_f
CALLV
pop
line 577
;577:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $316
line 580
;578:	}
;579:
;580:	if ( Q_stricmp (cmd, "forceteam") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $319
line 581
;581:		Svcmd_ForceTeam_f();
ADDRGP4 Svcmd_ForceTeam_f
CALLV
pop
line 582
;582:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $319
line 584
;583:	}
;584:	if ( Q_stricmp (cmd, "killplayer") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $322
line 585
;585:		Svcmd_KillPlayer_f();
ADDRGP4 Svcmd_KillPlayer_f
CALLV
pop
line 586
;586:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $322
line 588
;587:	}
;588:	if ( Q_stricmp (cmd, "restartround") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $327
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $325
line 589
;589:		Svcmd_RestartRound_f();
ADDRGP4 Svcmd_RestartRound_f
CALLV
pop
line 590
;590:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $325
line 593
;591:	}
;592:
;593:	if (Q_stricmp (cmd, "game_memory") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $330
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $328
line 594
;594:		Svcmd_GameMem_f();
ADDRGP4 Svcmd_GameMem_f
CALLV
pop
line 595
;595:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $328
line 598
;596:	}
;597:  
;598:	if (Q_stricmp (cmd, "addip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $333
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $331
line 599
;599:		Svcmd_AddIP_f();
ADDRGP4 Svcmd_AddIP_f
CALLV
pop
line 600
;600:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $331
line 603
;601:	}
;602:
;603:	if (Q_stricmp (cmd, "removeip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $334
line 604
;604:		Svcmd_RemoveIP_f();
ADDRGP4 Svcmd_RemoveIP_f
CALLV
pop
line 605
;605:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $334
line 608
;606:	}
;607:
;608:	if (Q_stricmp (cmd, "listip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $337
line 609
;609:		trap_SendConsoleCommand( EXEC_INSERT, "g_banIPs\n" );
CNSTI4 1
ARGI4
ADDRGP4 $340
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 610
;610:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $337
line 613
;611:	}  
;612:
;613:	if (Q_stricmp (cmd, "listplayers") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $343
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $341
line 614
;614:		Svcmd_Listplayers_f();
ADDRGP4 Svcmd_Listplayers_f
CALLV
pop
line 615
;615:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $341
line 618
;616:	}
;617:
;618:	if (Q_stricmp (cmd, "scorereset") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $346
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $344
line 619
;619:		Svcmd_Scorereset_f();
ADDRGP4 Svcmd_Scorereset_f
CALLV
pop
line 620
;620:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $344
line 622
;621:	}
;622:	if (Q_stricmp (cmd, "sv_nextmap") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $349
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $347
line 623
;623:		G_Printf("Nextmap: %s\n", NS_GetNextMap() );
ADDRLP4 1068
ADDRGP4 NS_GetNextMap
CALLP4
ASGNP4
ADDRGP4 $350
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 624
;624:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $347
line 627
;625:	}
;626: 
;627:	if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $351
line 628
;628:		if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $356
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $354
line 629
;629:			trap_SendServerCommand( -1, va("print \"server: %s\"", ConcatArgs(1) ) );
CNSTI4 1
ARGI4
ADDRLP4 1072
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $357
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 630
;630:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $354
line 633
;631:		}
;632:		// everything else will also be printed as a say command
;633:		trap_SendServerCommand( -1, va("print \"server: %s\"", ConcatArgs(0) ) );
CNSTI4 0
ARGI4
ADDRLP4 1072
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $357
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 634
;634:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $315
JUMPV
LABELV $351
line 637
;635:	}
;636:
;637:	return qfalse;
CNSTI4 0
RETI4
LABELV $315
endproc ConsoleCommand 1080 12
import ConcatArgs
import Cmd_Kill_f
bss
align 4
LABELV numIPFilters
skip 4
align 4
LABELV ipFilters
skip 8192
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
LABELV $357
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $356
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $350
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $349
byte 1 115
byte 1 118
byte 1 95
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $346
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $343
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $340
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $339
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $336
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $333
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $330
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $327
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $324
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $321
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $318
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $314
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $295
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
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
LABELV $287
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 124
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 124
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 124
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 124
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 124
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 124
byte 1 32
byte 1 120
byte 1 112
byte 1 32
byte 1 124
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 120
byte 1 112
byte 1 32
byte 1 124
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $285
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $268
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $258
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $255
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $247
byte 1 10
byte 1 0
align 1
LABELV $246
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $242
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $241
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $239
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 73
byte 1 83
byte 1 73
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $237
byte 1 69
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 0
align 1
LABELV $235
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 85
byte 1 83
byte 1 72
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $233
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 69
byte 1 65
byte 1 75
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $231
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $229
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $227
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $225
byte 1 69
byte 1 84
byte 1 95
byte 1 70
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 88
byte 1 80
byte 1 76
byte 1 79
byte 1 83
byte 1 73
byte 1 86
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $223
byte 1 69
byte 1 84
byte 1 95
byte 1 69
byte 1 76
byte 1 69
byte 1 86
byte 1 66
byte 1 85
byte 1 84
byte 1 55
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $221
byte 1 69
byte 1 84
byte 1 95
byte 1 69
byte 1 76
byte 1 69
byte 1 86
byte 1 66
byte 1 85
byte 1 84
byte 1 54
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $219
byte 1 69
byte 1 84
byte 1 95
byte 1 69
byte 1 76
byte 1 69
byte 1 86
byte 1 66
byte 1 85
byte 1 84
byte 1 53
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $217
byte 1 69
byte 1 84
byte 1 95
byte 1 69
byte 1 76
byte 1 69
byte 1 86
byte 1 66
byte 1 85
byte 1 84
byte 1 52
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $215
byte 1 69
byte 1 84
byte 1 95
byte 1 69
byte 1 76
byte 1 69
byte 1 86
byte 1 66
byte 1 85
byte 1 84
byte 1 51
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $213
byte 1 69
byte 1 84
byte 1 95
byte 1 69
byte 1 76
byte 1 69
byte 1 86
byte 1 66
byte 1 85
byte 1 84
byte 1 50
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $211
byte 1 69
byte 1 84
byte 1 95
byte 1 69
byte 1 76
byte 1 69
byte 1 86
byte 1 66
byte 1 85
byte 1 84
byte 1 49
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $209
byte 1 69
byte 1 84
byte 1 95
byte 1 69
byte 1 76
byte 1 69
byte 1 86
byte 1 66
byte 1 85
byte 1 84
byte 1 48
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $207
byte 1 69
byte 1 84
byte 1 95
byte 1 68
byte 1 79
byte 1 79
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $205
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $203
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 84
byte 1 73
byte 1 67
byte 1 76
byte 1 69
byte 1 72
byte 1 79
byte 1 83
byte 1 84
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $201
byte 1 69
byte 1 84
byte 1 95
byte 1 70
byte 1 76
byte 1 65
byte 1 82
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $199
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $197
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $195
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $190
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 0
align 1
LABELV $180
byte 1 68
byte 1 105
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
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $167
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 115
byte 1 118
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $163
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $142
byte 1 73
byte 1 80
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $102
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $98
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $80
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
