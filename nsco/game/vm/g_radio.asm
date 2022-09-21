data
export num_seal_msgs
align 4
LABELV num_seal_msgs
byte 4 0
export num_tango_msgs
align 4
LABELV num_tango_msgs
byte 4 0
export sealdeathSoundIndex
align 4
LABELV sealdeathSoundIndex
byte 4 0
export tangodeathSoundIndex
align 4
LABELV tangodeathSoundIndex
byte 4 0
export PrecacheRadioSounds
code
proc PrecacheRadioSounds 0 4
file "../g_radio.c"
line 29
;1:/*
;2://
;3:// all code in this file is property of manfred nerurkar
;4:// no commercial explotation allowed
;5:// you are only allowed to use this code in navy seals: covert operations 
;6:// a quake3 arena modifiation
;7:// defcon-x@ns-co.net
;8://
;9:// very old code based on q2:nf code  
;10:// this sucks and should be rewritten anyway (or did i do already?)
;11: */
;12:
;13:#include "g_local.h" 
;14:
;15:void Cmd_Say_f ( gentity_t *ent, int mode, qboolean arg0 );
;16:void NS_GestureForNumber ( gentity_t *ent, int i );
;17:void NS_SendStatusMessageToTeam( gentity_t *affected, int status, int team );
;18:
;19:#define MAX_RADIO_MESSAGES	150
;20:// Each of the possible radio messages and their length
;21:radio_msg_t radio_seal_msgs[MAX_RADIO_MESSAGES];
;22:radio_msg_t	radio_tango_msgs[MAX_RADIO_MESSAGES];
;23:int			num_seal_msgs = 0;
;24:int			num_tango_msgs = 0;
;25:int			sealdeathSoundIndex = 0;
;26:int			tangodeathSoundIndex = 0;
;27:  
;28:void PrecacheRadioSounds()
;29:{
line 30
;30:    G_SoundIndex(RADIO_CLICK);  
ADDRGP4 $69
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 31
;31:} 
LABELV $68
endproc PrecacheRadioSounds 0 4
export DeleteFirstRadioQueueEntry
proc DeleteFirstRadioQueueEntry 16 12
line 34
;32:
;33:void DeleteFirstRadioQueueEntry(gentity_t *ent)
;34:{
line 37
;35:    int i;
;36:
;37:    if (ent->client->ns.radio_queue_size <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 0
GTI4 $71
line 38
;38:    {
line 40
;39:        //G_Printf("DeleteFirstRadioQueueEntry: attempt to delete without any entries\n");
;40:        return;
ADDRGP4 $70
JUMPV
LABELV $71
line 43
;41:    }
;42:
;43:    for (i = 1; i < ent->client->ns.radio_queue_size; i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $76
JUMPV
LABELV $73
line 44
;44:    {
line 45
;45:        memcpy(&(ent->client->ns.radio_queue[i - 1]),
ADDRLP4 4
CNSTI4 280
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3368
ADDP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 12
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 48
;46:                &(ent->client->ns.radio_queue[i]),
;47:                sizeof(radio_queue_entry_t));
;48:    }
LABELV $74
line 43
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $76
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
LTI4 $73
line 50
;49:
;50:    ent->client->ns.radio_queue_size--;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 51
;51:}
LABELV $70
endproc DeleteFirstRadioQueueEntry 16 12
export DeleteRadioQueueEntry
proc DeleteRadioQueueEntry 16 12
line 54
;52:
;53:void DeleteRadioQueueEntry(gentity_t *ent, int entry_num)
;54:{
line 57
;55:    int i;
;56:
;57:    if (ent->client->ns.radio_queue_size <= entry_num)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $78
line 58
;58:    {
line 60
;59:        //G_Printf("DeleteRadioQueueEntry: attempt to delete out of range queue entry\n");
;60:        return;
ADDRGP4 $77
JUMPV
LABELV $78
line 63
;61:    }
;62:
;63:    for (i = entry_num + 1; i < ent->client->ns.radio_queue_size; i++)
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $80
line 64
;64:    {
line 65
;65:        memcpy(&(ent->client->ns.radio_queue[i - 1]),
ADDRLP4 4
CNSTI4 280
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3368
ADDP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 12
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 68
;66:                &(ent->client->ns.radio_queue[i]),
;67:                sizeof(radio_queue_entry_t));
;68:    }
LABELV $81
line 63
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $83
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
LTI4 $80
line 70
;69:    
;70:    ent->client->ns.radio_queue_size--;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 71
;71:}
LABELV $77
endproc DeleteRadioQueueEntry 16 12
export RadioThink
proc RadioThink 52 16
line 75
;72:
;73:// RadioThink should be called once on each player per server frame.
;74:void RadioThink(gentity_t *ent)
;75:{
line 77
;76:	// Try to clean things up, a bit....
;77:  	if (ent->client->ns.radio_power_off)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $85
line 78
;78:	{
line 79
;79:		ent->client->ns.radio_queue_size = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
CNSTI4 0
ASGNI4
line 80
;80:		return;
ADDRGP4 $84
JUMPV
LABELV $85
line 83
;81:	}
;82:
;83:	if (ent->client->ns.radio_delay > 0 && (ent->client->ns.radio_queue[0].from_player == ent ) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 3360
ADDP4
INDIRI4
CNSTI4 0
LEI4 $87
ADDRLP4 4
INDIRP4
CNSTI4 3372
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
NEU4 $87
line 84
;84:		ent->client->ps.eFlags |= EF_RADIO_TALK;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $87
line 86
;85:	else
;86:		ent->client->ps.eFlags &= ~EF_RADIO_TALK;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -65537
BANDI4
ASGNI4
LABELV $88
line 88
;87:
;88:	if (ent->client->ns.radio_delay > 1)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3360
ADDP4
INDIRI4
CNSTI4 1
LEI4 $89
line 89
;89:	{
line 90
;90:		ent->client->ns.radio_delay--;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3360
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 91
;91:		return;
ADDRGP4 $84
JUMPV
LABELV $89
line 93
;92:	}
;93:	else if (ent->client->ns.radio_delay == 1)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3360
ADDP4
INDIRI4
CNSTI4 1
NEI4 $91
line 94
;94:	{
line 95
;95:		DeleteFirstRadioQueueEntry(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeleteFirstRadioQueueEntry
CALLV
pop
line 96
;96:		ent->client->ns.radio_delay = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3360
ADDP4
CNSTI4 0
ASGNI4
line 97
;97:	}
LABELV $91
line 99
;98:
;99:	if (ent->client->ns.radio_queue_size)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 0
EQI4 $93
line 100
;100:	{
line 104
;101:		gentity_t *from;
;102:		int check;
;103:
;104:		from = ent->client->ns.radio_queue[0].from_player;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3372
ADDP4
INDIRP4
ASGNP4
line 107
;105:
;106:		// suddently our caller died! insert dying message.
;107:		if (!ent->client->ns.radio_queue[0].click &&
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3644
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $95
ADDRLP4 20
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $97
ADDRLP4 20
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 67108864
NEI4 $95
LABELV $97
line 109
;108:			(!from->inuse || from->r.contents == CONTENTS_CORPSE ))
;109:		{ 
line 112
;110:		//	G_Printf("insert deathsound: %i %i\n", from->inuse , ( from->r.contents == CONTENTS_CORPSE ) );
;111:
;112:			if ( ent->client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $98
line 113
;113:				ent->client->ns.radio_queue[0].soundIndex = radio_seal_msgs[sealdeathSoundIndex].soundIndex;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3368
ADDP4
CNSTI4 396
ADDRGP4 sealdeathSoundIndex
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+128
ADDP4
INDIRI4
ASGNI4
line 114
;114:				ent->client->ns.radio_queue[0].length = radio_seal_msgs[sealdeathSoundIndex].soundLength;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3380
ADDP4
CNSTI4 396
ADDRGP4 sealdeathSoundIndex
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+132
ADDP4
INDIRI4
ASGNI4
line 115
;115:				strcpy( ent->client->ns.radio_queue[0].chatString , radio_seal_msgs[sealdeathSoundIndex].chatString );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3388
ADDP4
ARGP4
CNSTI4 396
ADDRGP4 sealdeathSoundIndex
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+136
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 116
;116:				ent->client->ns.radio_queue[0].gesture = radio_seal_msgs[sealdeathSoundIndex].signalType;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3384
ADDP4
CNSTI4 396
ADDRGP4 sealdeathSoundIndex
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+392
ADDP4
INDIRI4
ASGNI4
line 117
;117:			}
ADDRGP4 $99
JUMPV
LABELV $98
line 119
;118:			else
;119:			{
line 120
;120:				ent->client->ns.radio_queue[0].soundIndex = radio_tango_msgs[tangodeathSoundIndex].soundIndex;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3368
ADDP4
CNSTI4 396
ADDRGP4 tangodeathSoundIndex
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+128
ADDP4
INDIRI4
ASGNI4
line 121
;121:				ent->client->ns.radio_queue[0].length = radio_tango_msgs[tangodeathSoundIndex].soundLength;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3380
ADDP4
CNSTI4 396
ADDRGP4 tangodeathSoundIndex
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+132
ADDP4
INDIRI4
ASGNI4
line 122
;122:				strcpy( ent->client->ns.radio_queue[0].chatString , radio_tango_msgs[tangodeathSoundIndex].chatString );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3388
ADDP4
ARGP4
CNSTI4 396
ADDRGP4 tangodeathSoundIndex
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+136
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 123
;123:				ent->client->ns.radio_queue[0].gesture = radio_tango_msgs[tangodeathSoundIndex].signalType;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3384
ADDP4
CNSTI4 396
ADDRGP4 tangodeathSoundIndex
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+392
ADDP4
INDIRI4
ASGNI4
line 124
;124:			}
LABELV $99
line 127
;125:
;126: 
;127:			for (check = 1; check < ent->client->ns.radio_queue_size; check++)
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $108
line 128
;128:			{
line 129
;129:				if (ent->client->ns.radio_queue[check].from_player == from)
CNSTI4 280
ADDRLP4 16
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3368
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRP4
CVPU4 4
NEU4 $112
line 130
;130:				{
line 131
;131:					DeleteRadioQueueEntry(ent, check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 DeleteRadioQueueEntry
CALLV
pop
line 132
;132:					check--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 133
;133:				}
LABELV $112
line 134
;134:			}
LABELV $109
line 127
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $111
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
LTI4 $108
line 135
;135:		}                       
LABELV $95
line 139
;136:
;137:		//trap_R_SendClientCommand
;138:		//stuffcmd(ent, snd_play_cmd);
;139:		G_LocalSound(ent, CHAN_ANNOUNCER, ent->client->ns.radio_queue[0].soundIndex );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3368
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LocalSound
CALLV
pop
line 140
;140:		ent->client->ns.radio_queue[0].now_playing = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3376
ADDP4
CNSTI4 1
ASGNI4
line 141
;141:		ent->client->ns.radio_delay = ent->client->ns.radio_queue[0].length;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 3360
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 3380
ADDP4
INDIRI4
ASGNI4
line 142
;142:		if ( ent->client->ns.radio_queue[0].from_player == ent )
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3372
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRP4
CVPU4 4
NEU4 $114
line 143
;143:		{
line 144
;144:			G_Say( ent, NULL, SAY_RADIO, ent->client->ns.radio_queue[0].chatString );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3388
ADDP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 145
;145:			if ( ent->client->ns.radio_queue[0].gesture > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $116
line 146
;146:			{ 
line 147
;147:				NS_GestureForNumber( ent, ent->client->ns.radio_queue[0].gesture );				
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3384
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_GestureForNumber
CALLV
pop
line 148
;148:			}
LABELV $116
line 149
;149:		}
LABELV $114
line 150
;150:	}
LABELV $93
line 151
;151:}
LABELV $84
endproc RadioThink 52 16
export TotalNonClickMessagesInQueue
proc TotalNonClickMessagesInQueue 8 0
line 154
;152:
;153:int TotalNonClickMessagesInQueue(gentity_t *ent)
;154:{
line 155
;155:    int i, count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 157
;156:
;157:    for (i = 0; i < ent->client->ns.radio_queue_size; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $119
line 158
;158:    {
line 159
;159:        if (!ent->client->ns.radio_queue[i].click)
CNSTI4 280
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3368
ADDP4
ADDP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $123
line 160
;160:                count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
line 161
;161:    }
LABELV $120
line 157
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $122
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
LTI4 $119
line 163
;162:        
;163:    return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $118
endproc TotalNonClickMessagesInQueue 8 0
export AppendRadioMsgToQueue
proc AppendRadioMsgToQueue 12 8
line 167
;164:}
;165:
;166:void AppendRadioMsgToQueue(gentity_t *ent, int msg_num, int click, gentity_t *from_player)
;167:{
line 173
;168:	radio_queue_entry_t *newentry;
;169:
;170:	//	G_Printf("Appending: %s\n",msg);
;171:	
;172:
;173:	if (ent->client->ns.radio_queue_size >= MAX_RADIO_QUEUE_SIZE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 6
LTI4 $126
line 174
;174:	{
line 176
;175://		G_Printf("AppendRadioMsgToQueue: Maximum radio queue size exceeded\n");
;176:		return;
ADDRGP4 $125
JUMPV
LABELV $126
line 179
;177:	}
;178:
;179:	newentry = &(ent->client->ns.radio_queue[ent->client->ns.radio_queue_size]);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
CNSTI4 280
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 3368
ADDP4
ADDP4
ASGNP4
line 181
;180:
;181:	newentry->from_player = from_player;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 182
;182:	newentry->now_playing = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 184
;183:
;184:	if ( ent->client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $128
line 185
;185:		newentry->length = radio_seal_msgs[msg_num].soundLength;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+132
ADDP4
INDIRI4
ASGNI4
line 186
;186:	}
ADDRGP4 $129
JUMPV
LABELV $128
line 188
;187:	else
;188:		newentry->length = radio_tango_msgs[msg_num].soundLength;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+132
ADDP4
INDIRI4
ASGNI4
LABELV $129
line 190
;189:		
;190:	newentry->click = click;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 192
;191:
;192:	if ( ent->client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $132
line 193
;193:		strcpy( newentry->chatString , radio_seal_msgs[msg_num].chatString );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+136
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 194
;194:		newentry->soundIndex = radio_seal_msgs[msg_num].soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+128
ADDP4
INDIRI4
ASGNI4
line 195
;195:		newentry->gesture = radio_seal_msgs[msg_num].signalType;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+392
ADDP4
INDIRI4
ASGNI4
line 196
;196:	}
ADDRGP4 $133
JUMPV
LABELV $132
line 197
;197:	else {
line 198
;198:		strcpy( newentry->chatString , radio_tango_msgs[msg_num].chatString );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+136
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 199
;199:		newentry->soundIndex = radio_tango_msgs[msg_num].soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+128
ADDP4
INDIRI4
ASGNI4
line 200
;200:		newentry->gesture = radio_tango_msgs[msg_num].signalType;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+392
ADDP4
INDIRI4
ASGNI4
line 201
;201:	}
LABELV $133
line 205
;202:
;203:	
;204:
;205:	ent->client->ns.radio_queue_size++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
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
line 206
;206:}
LABELV $125
endproc AppendRadioMsgToQueue 12 8
export InsertRadioMsgInQueueBeforeClick
proc InsertRadioMsgInQueueBeforeClick 32 12
line 209
;207:
;208:void InsertRadioMsgInQueueBeforeClick(gentity_t *ent, int msg_num, gentity_t *from_player)
;209:{
line 212
;210:    radio_queue_entry_t *newentry;
;211:
;212:    if (ent->client->ns.radio_queue_size >= MAX_RADIO_QUEUE_SIZE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 6
LTI4 $141
line 213
;213:    {
line 215
;214:        //G_Printf("InsertRadioMsgInQueueBeforeClick: Maximum radio queue size exceeded\n");
;215:        return;
ADDRGP4 $140
JUMPV
LABELV $141
line 218
;216:    }
;217:
;218:    memcpy(&(ent->client->ns.radio_queue[ent->client->ns.radio_queue_size]),
ADDRLP4 4
CNSTI4 280
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 3368
ADDP4
ASGNP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 16
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 222
;219:            &(ent->client->ns.radio_queue[ent->client->ns.radio_queue_size - 1]),
;220:            sizeof(radio_queue_entry_t));
;221:
;222:    newentry = &(ent->client->ns.radio_queue[ent->client->ns.radio_queue_size - 1]);
ADDRLP4 20
CNSTI4 280
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
MULI4
ADDRLP4 20
INDIRI4
SUBI4
ADDRLP4 24
INDIRP4
CNSTI4 3368
ADDP4
ADDP4
ASGNP4
line 224
;223:
;224:    newentry->from_player = from_player;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 225
;225:    newentry->now_playing = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 226
;226:	if ( ent->client->sess.sessionTeam == TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $143
line 227
;227:		newentry->length = radio_seal_msgs[msg_num].soundLength;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+132
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
line 229
;228:	else
;229:		newentry->length = radio_tango_msgs[msg_num].soundLength;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+132
ADDP4
INDIRI4
ASGNI4
LABELV $144
line 231
;230:	
;231:    newentry->click = 0;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 232
;232:	if ( ent->client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $147
line 233
;233:		newentry->gesture = radio_seal_msgs[msg_num].signalType;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+392
ADDP4
INDIRI4
ASGNI4
line 234
;234:		strcpy( newentry->chatString , radio_seal_msgs[msg_num].chatString );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+136
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 235
;235:		newentry->soundIndex = radio_seal_msgs[msg_num].soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+128
ADDP4
INDIRI4
ASGNI4
line 236
;236:	}
ADDRGP4 $148
JUMPV
LABELV $147
line 237
;237:	else {
line 238
;238:		newentry->gesture = radio_tango_msgs[msg_num].signalType;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+392
ADDP4
INDIRI4
ASGNI4
line 239
;239:		strcpy( newentry->chatString , radio_tango_msgs[msg_num].chatString );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+136
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 240
;240:		newentry->soundIndex = radio_tango_msgs[msg_num].soundIndex; 
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+128
ADDP4
INDIRI4
ASGNI4
line 241
;241:	}
LABELV $148
line 243
;242:
;243:    ent->client->ns.radio_queue_size++;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5048
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 244
;244:}
LABELV $140
endproc InsertRadioMsgInQueueBeforeClick 32 12
export AddRadioMsg
proc AddRadioMsg 0 16
line 247
;245:
;246:void AddRadioMsg(gentity_t *ent, int msg_num, gentity_t *from_player)
;247:{ 
line 248
;248: 	AppendRadioMsgToQueue(ent, msg_num, 0, from_player); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AppendRadioMsgToQueue
CALLV
pop
line 249
;249:}
LABELV $155
endproc AddRadioMsg 0 16
export GetReportMsg
proc GetReportMsg 8 12
line 252
;250:
;251:char *GetReportMsg( gentity_t *ent )
;252:{
line 255
;253:	char *msg;
;254:
;255:	if ( !ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $157
line 256
;256:		return "not_valid_not_valid";
ADDRGP4 $159
RETP4
ADDRGP4 $156
JUMPV
LABELV $157
line 258
;257:
;258:	if ( ent->health <= 20 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 20
GTI4 $160
line 259
;259:	{
line 260
;260:		msg = "report1";
ADDRLP4 0
ADDRGP4 $162
ASGNP4
line 261
;261:		NS_SendStatusMessageToTeam( ent, MS_HEALTH1, ent->client->sess.sessionTeam );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 262
;262:	}
ADDRGP4 $161
JUMPV
LABELV $160
line 263
;263:	else if ( ent->health <= 40 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 40
GTI4 $163
line 264
;264:	{
line 265
;265:		msg = "report2";
ADDRLP4 0
ADDRGP4 $165
ASGNP4
line 266
;266:		NS_SendStatusMessageToTeam( ent, MS_HEALTH2, ent->client->sess.sessionTeam );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 267
;267:	}
ADDRGP4 $164
JUMPV
LABELV $163
line 268
;268:	else if ( ent->health <= 60 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 60
GTI4 $166
line 269
;269:	{
line 270
;270:		msg = "report3";
ADDRLP4 0
ADDRGP4 $168
ASGNP4
line 271
;271:		NS_SendStatusMessageToTeam( ent, MS_HEALTH3, ent->client->sess.sessionTeam );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 272
;272:	}
ADDRGP4 $167
JUMPV
LABELV $166
line 273
;273:	else if ( ent->health <= 80 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 80
GTI4 $169
line 274
;274:	{
line 275
;275:		msg = "report4";
ADDRLP4 0
ADDRGP4 $171
ASGNP4
line 276
;276:		NS_SendStatusMessageToTeam( ent, MS_HEALTH4, ent->client->sess.sessionTeam );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 277
;277:	}
ADDRGP4 $170
JUMPV
LABELV $169
line 278
;278:	else if ( ent->health > 80 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 80
LEI4 $172
line 279
;279:	{
line 280
;280:		msg = "report5";
ADDRLP4 0
ADDRGP4 $174
ASGNP4
line 281
;281:		NS_SendStatusMessageToTeam( ent, MS_HEALTH5, ent->client->sess.sessionTeam );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 282
;282:	}
ADDRGP4 $173
JUMPV
LABELV $172
line 284
;283:	else
;284:	{
line 285
;285:		msg = "report5";
ADDRLP4 0
ADDRGP4 $174
ASGNP4
line 286
;286:		NS_SendStatusMessageToTeam( ent, MS_HEALTH5, ent->client->sess.sessionTeam );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
ARGI4
ADDRGP4 NS_SendStatusMessageToTeam
CALLV
pop
line 287
;287:	}
LABELV $173
LABELV $170
LABELV $167
LABELV $164
LABELV $161
line 289
;288:
;289:	return msg;
ADDRLP4 0
INDIRP4
RETP4
LABELV $156
endproc GetReportMsg 8 12
data
export filterwords
align 4
LABELV filterwords
address $175
address $176
address $177
address $178
address $179
address $180
address $181
address $174
address $171
address $168
address $165
address $162
address $182
export FilterRadioMsg
code
proc FilterRadioMsg 16 8
line 309
;290:}
;291:
;292:char *filterwords[] = {
;293:	"aaah",
;294:	"edown",
;295:	"edown2",
;296:	"mdown",
;297:	"hdown",
;298:	"vdown",
;299:	"outgrenade",
;300:	"report5",
;301:	"report4",
;302:	"report3",
;303:	"report2",
;304:	"report1",
;305:	"-delimiter-"
;306:};
;307:// are we allowed to use that msg?
;308:qboolean FilterRadioMsg( gentity_t *caller, char *msg )
;309:{
line 312
;310:	int i;
;311:	
;312:	if ( !Q_stricmp( msg, "reportin" ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $188
line 313
;313:	{
line 314
;314:		GetReportMsg( caller );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 GetReportMsg
CALLP4
pop
line 315
;315:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $183
JUMPV
LABELV $187
line 319
;316:	}
;317:
;318:	while ( 0 )
;319:	{
line 321
;320:		// stop list
;321:		if ( !Q_stricmp( filterwords[i], "-delimiter-" ) )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 filterwords
ADDP4
INDIRP4
ARGP4
ADDRGP4 $182
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $190
line 322
;322:			break;
ADDRGP4 $189
JUMPV
LABELV $190
line 325
;323:
;324:		// found word, it is marked as not valid
;325:		if ( !Q_stricmp( msg, filterwords[i] ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 filterwords
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $192
line 326
;326:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $183
JUMPV
LABELV $192
line 328
;327:		
;328:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 329
;329:	}
LABELV $188
line 318
LABELV $189
line 330
;330:	return qfalse; 
CNSTI4 0
RETI4
LABELV $183
endproc FilterRadioMsg 16 8
export RadioBroadcast
proc RadioBroadcast 56 12
line 334
;331:
;332:}
;333:void RadioBroadcast(gentity_t *ent, char *msg, qboolean userinput )
;334:{
line 335
;335:	qboolean found = qfalse; 
ADDRLP4 4
CNSTI4 0
ASGNI4
line 336
;336:	int	clientNum = ent->client->ps.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 337
;337:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 339
;338:
;339:	if ( ent->r.contents == CONTENTS_CORPSE )
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 67108864
NEI4 $195
line 340
;340:		return; 
ADDRGP4 $194
JUMPV
LABELV $195
line 342
;341:
;342:	if ( g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $197
line 343
;343:		return;  // don't allow in a non-team setup...
ADDRGP4 $194
JUMPV
LABELV $197
line 345
;344:
;345:	if ( ent->client->sess.waiting )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $200
line 346
;346:	{
line 347
;347:		PrintMsg( ent, "You're dead. You can't use your radio.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $202
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 348
;348:		return;
ADDRGP4 $194
JUMPV
LABELV $200
line 350
;349:	}
;350:	if ( ent->client->ns.radio_power_off )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $203
line 351
;351:	{
line 352
;352:		PrintMsg( ent, va("print \"Your radio is currently turned off!\n\"" ) );
ADDRGP4 $205
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 353
;353:		return;
ADDRGP4 $194
JUMPV
LABELV $203
line 356
;354:	}
;355:
;356:	if ( FilterRadioMsg ( ent, msg ) && userinput )
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 FilterRadioMsg
CALLI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $206
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $206
line 357
;357:		return;
ADDRGP4 $194
JUMPV
LABELV $206
line 359
;358:
;359:	if ( !Q_stricmp( msg , "reportingin") )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $210
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $208
line 360
;360:		msg = GetReportMsg( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 GetReportMsg
CALLP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
ASGNP4
LABELV $208
line 362
;361:
;362:	if ( ent->client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $219
ADDRGP4 $214
JUMPV
LABELV $213
line 364
;363:		while ( i < num_seal_msgs )
;364:		{  
line 365
;365:			if ( !Q_stricmp(radio_seal_msgs[i].soundAlias, msg) )
CNSTI4 396
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $216
line 366
;366:			{
line 367
;367:				found = qtrue;  
ADDRLP4 4
CNSTI4 1
ASGNI4
line 368
;368:				break;
ADDRGP4 $212
JUMPV
LABELV $216
line 370
;369:			}
;370:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 371
;371:		}
LABELV $214
line 363
ADDRLP4 0
INDIRI4
ADDRGP4 num_seal_msgs
INDIRI4
LTI4 $213
line 372
;372:	}
ADDRGP4 $212
JUMPV
line 374
;373:	else
;374:	{
LABELV $218
line 376
;375:		while ( i < num_tango_msgs )
;376:		{
line 377
;377:			if ( !Q_stricmp(radio_tango_msgs[i].soundAlias, msg) )
CNSTI4 396
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $221
line 378
;378:			{
line 379
;379:				found = qtrue;  
ADDRLP4 4
CNSTI4 1
ASGNI4
line 380
;380:				break;
ADDRGP4 $220
JUMPV
LABELV $221
line 382
;381:			}
;382:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 383
;383:		}
LABELV $219
line 375
ADDRLP4 0
INDIRI4
ADDRGP4 num_tango_msgs
INDIRI4
LTI4 $218
LABELV $220
line 384
;384:	}
LABELV $212
line 386
;385:
;386:	if ( !found )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $223
line 387
;387:	{       
line 388
;388:		trap_SendServerCommand( clientNum, va("print \"'%s' is not a valid radio message.\n\"", msg) );
ADDRGP4 $225
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 389
;389:		return;
ADDRGP4 $194
JUMPV
LABELV $223
line 392
;390:	}
;391:
;392:	{
line 395
;393:		gentity_t *e;
;394:
;395:		e = g_entities;
ADDRLP4 28
ADDRGP4 g_entities
ASGNP4
line 397
;396:
;397:		for (; e < &g_entities[level.num_entities]; e++)
ADDRGP4 $229
JUMPV
LABELV $226
line 398
;398:		{
line 399
;399:			if (!e->inuse)
ADDRLP4 28
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $231
line 400
;400:				continue;  
ADDRGP4 $227
JUMPV
LABELV $231
line 402
;401:			// not a client
;402:			if (!e->client)
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $233
line 403
;403:				continue;
ADDRGP4 $227
JUMPV
LABELV $233
line 405
;404:			// not on same team
;405:			if (!OnSameTeam(ent,e) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $235
line 406
;406:				continue; 
ADDRGP4 $227
JUMPV
LABELV $235
line 408
;407:			// abviously dead.
;408:			if ( e->client->sess.waiting )
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $237
line 409
;409:				continue;
ADDRGP4 $227
JUMPV
LABELV $237
line 411
;410:			// not on same team
;411:			if ( ent->client->ns.radio_channel != e->client->ns.radio_channel )
ADDRLP4 36
CNSTI4 516
ASGNI4
ADDRLP4 40
CNSTI4 5052
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
EQI4 $239
line 412
;412:				continue;			
ADDRGP4 $227
JUMPV
LABELV $239
line 414
;413:			// stop sending msg twice to once player
;414:			if ( !Q_stricmp( e->classname, "player_bbox_head") )
ADDRLP4 28
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $243
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $241
line 415
;415:				continue;
ADDRGP4 $227
JUMPV
LABELV $241
line 420
;416:
;417://			PrintMsg(ent, "sending msg to %s %i\n", e->classname,e->s.number );
;418:
;419:			// if it's a bot react to report-in in requests
;420:			if ( !Q_stricmp( msg , "reportin" ) && NS_IsBot( e ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $244
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 NS_IsBot
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $244
line 421
;421:				RadioBroadcast( e, "reportingin", qfalse );
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $210
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 RadioBroadcast
CALLV
pop
LABELV $244
line 423
;422:
;423:			AddRadioMsg(e,i,ent);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 AddRadioMsg
CALLV
pop
line 424
;424:		}
LABELV $227
line 397
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 1108
ADDP4
ASGNP4
LABELV $229
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTI4 1108
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $226
line 425
;425:	}       
line 426
;426:}
LABELV $194
endproc RadioBroadcast 56 12
export Cmd_RadioChannel_f
proc Cmd_RadioChannel_f 8 12
line 430
;427:
;428: 
;429:void Cmd_RadioChannel_f ( gentity_t *ent )
;430:{
line 431
;431:	char *chan = "Unknown";
ADDRLP4 0
ADDRGP4 $247
ASGNP4
line 433
;432:	
;433:	if ( ent->client->ps.pm_flags & PMF_FOLLOW )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $248
line 434
;434:		return;
ADDRGP4 $246
JUMPV
LABELV $248
line 436
;435:
;436:	if ( ent->client->ns.radio_channel == 0 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 0
NEI4 $250
line 437
;437:		chan = "Bravo";
ADDRLP4 0
ADDRGP4 $252
ASGNP4
ADDRGP4 $251
JUMPV
LABELV $250
line 438
;438:	else if ( ent->client->ns.radio_channel == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 1
NEI4 $253
line 439
;439:		chan = "Charlie";
ADDRLP4 0
ADDRGP4 $255
ASGNP4
ADDRGP4 $254
JUMPV
LABELV $253
line 440
;440:	else if ( ent->client->ns.radio_channel == 2 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 2
NEI4 $256
line 441
;441:		chan = "Delta";
ADDRLP4 0
ADDRGP4 $258
ASGNP4
ADDRGP4 $257
JUMPV
LABELV $256
line 442
;442:	else if ( ent->client->ns.radio_channel == 3 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 3
NEI4 $259
line 443
;443:		chan = "Echo";
ADDRLP4 0
ADDRGP4 $261
ASGNP4
ADDRGP4 $260
JUMPV
LABELV $259
line 444
;444:	else if ( ent->client->ns.radio_channel == 4 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 4
NEI4 $262
line 445
;445:		chan = "Alpha ( Open Channel )";
ADDRLP4 0
ADDRGP4 $264
ASGNP4
LABELV $262
LABELV $260
LABELV $257
LABELV $254
LABELV $251
line 447
;446:
;447:	ent->client->ns.radio_channel++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5052
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 449
;448:
;449:	if ( ent->client->ns.radio_channel > 4 )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 4
LEI4 $265
line 450
;450:		ent->client->ns.radio_channel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5052
ADDP4
CNSTI4 0
ASGNI4
LABELV $265
line 451
;451:	PrintMsg( ent, "Changed radio channel to %s.\n", chan );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 452
;452:}
LABELV $246
endproc Cmd_RadioChannel_f 8 12
export Cmd_Radioteam_f
proc Cmd_Radioteam_f 4 12
line 456
;453:
;454:char *ConcatArgs(int start);
;455:void Cmd_Radioteam_f(gentity_t *ent)
;456:{	
line 457
;457:	if ( ent->client->sess.waiting ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $269
line 458
;458:		PrintMsg( ent, "You can't send radiocommands when you're on the waiting line.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $271
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 459
;459:		return;
ADDRGP4 $268
JUMPV
LABELV $269
line 461
;460:	}
;461:	if ( ent->client->ps.pm_flags & PMF_FOLLOW )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $272
line 462
;462:		return;
ADDRGP4 $268
JUMPV
LABELV $272
line 464
;463:
;464:	RadioBroadcast(ent, ConcatArgs( 1 ), qtrue );
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 RadioBroadcast
CALLV
pop
line 465
;465:}
LABELV $268
endproc Cmd_Radioteam_f 4 12
export Cmd_Radio_power_f
proc Cmd_Radio_power_f 16 12
line 468
;466: 
;467:void Cmd_Radio_power_f(gentity_t *ent)
;468:{
line 469
;469:	if (g_gametype.integer < GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
GEI4 $275
line 470
;470:		return;  // don't allow in a non-team setup...
ADDRGP4 $274
JUMPV
LABELV $275
line 471
;471:	if ( ent->client->ps.pm_flags & PMF_FOLLOW )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $278
line 472
;472:		return;
ADDRGP4 $274
JUMPV
LABELV $278
line 474
;473:
;474:	ent->client->ns.radio_power_off = !ent->client->ns.radio_power_off;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3364
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $281
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $281
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $282
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 476
;475:
;476:	if (ent->client->ns.radio_power_off)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $283
line 477
;477:	{
line 478
;478:		trap_SendServerCommand( ent->client->ps.clientNum, va("print \"Radio switched off\n\"") );
ADDRGP4 $285
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 479
;479:		G_LocalSound(ent, CHAN_ANNOUNCER, G_SoundIndex( RADIO_CLICK ) );
ADDRGP4 $69
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_LocalSound
CALLV
pop
line 480
;480:	}
ADDRGP4 $284
JUMPV
LABELV $283
line 482
;481:	else
;482:	{
line 483
;483:		trap_SendServerCommand( ent->client->ps.clientNum, va("print \"Radio switched on\n\"") );
ADDRGP4 $286
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 484
;484:		G_LocalSound(ent, CHAN_ANNOUNCER, G_SoundIndex( RADIO_CLICK ) );
ADDRGP4 $69
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_LocalSound
CALLV
pop
line 485
;485:	}
LABELV $284
line 486
;486:}
LABELV $274
endproc Cmd_Radio_power_f 16 12
export CG_GetSingalTypeForString
proc CG_GetSingalTypeForString 16 8
line 496
;487:
;488:
;489:typedef enum {
;490:	SIGNAL_NONE,
;491:	SIGNAL_POINT,
;492:	SIGNAL_FIST,
;493:	SIGNAL_WAVE
;494:} singalType_t;
;495:
;496:int CG_GetSingalTypeForString( char *string ) {
line 498
;497:	// return default
;498:	if (!string)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $289
line 499
;499:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $289
line 501
;500:
;501:	if ( !Q_stricmp( string , "point" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $293
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $291
line 502
;502:		return SIGNAL_POINT;
CNSTI4 1
RETI4
ADDRGP4 $288
JUMPV
LABELV $291
line 503
;503:	else if ( !Q_stricmp( string , "fist" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $296
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $294
line 504
;504:		return SIGNAL_FIST;
CNSTI4 2
RETI4
ADDRGP4 $288
JUMPV
LABELV $294
line 505
;505:	else if ( !Q_stricmp( string , "wave" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $297
line 506
;506:		return SIGNAL_WAVE;
CNSTI4 3
RETI4
ADDRGP4 $288
JUMPV
LABELV $297
line 507
;507:	else if ( !Q_stricmp( string , "none" ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $300
line 508
;508:		return SIGNAL_NONE;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $300
line 510
;509:	else
;510:		return SIGNAL_NONE; 
CNSTI4 0
RETI4
LABELV $288
endproc CG_GetSingalTypeForString 16 8
export G_ParseRadioConfigFileForTeam
proc G_ParseRadioConfigFileForTeam 20484 20
line 513
;511:}
;512: 
;513:void	G_ParseRadioConfigFileForTeam( int team ) {
line 524
;514:	char		*text_p;
;515:	int			len;
;516://	int			lines = 0;
;517:	char		*token;
;518://	float		fps;
;519:	int			skip;
;520: 	char		text[20000];
;521:	char		filename[128];
;522:	fileHandle_t	f;	
;523:	
;524:	if ( team == TEAM_BLUE )
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $304
line 525
;525:		Com_sprintf(filename, sizeof( filename), "scripts/radio_tango.cfg" );
ADDRLP4 8
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $306
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $305
JUMPV
LABELV $304
line 527
;526:	else
;527:		Com_sprintf(filename, sizeof( filename), "scripts/radio_seals.cfg" );
ADDRLP4 8
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $307
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $305
line 530
;528:
;529:	// load the file
;530:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRLP4 8
ARGP4
ADDRLP4 20140
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20148
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 20148
INDIRI4
ASGNI4
line 531
;531:	if ( len <= 0 ) {
ADDRLP4 136
INDIRI4
CNSTI4 0
GTI4 $308
line 532
;532:		return ;
ADDRGP4 $303
JUMPV
LABELV $308
line 534
;533:	}
;534:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 136
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $310
line 535
;535:		G_Printf( "File %s (%i>%i)too long\n", text, len, sizeof( text) );
ADDRGP4 $312
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
CNSTU4 20000
ARGU4
ADDRGP4 G_Printf
CALLV
pop
line 536
;536:		return ;
ADDRGP4 $303
JUMPV
LABELV $310
line 538
;537:	}
;538:	trap_FS_Read( text, len, f );
ADDRLP4 140
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 20140
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 539
;539:	text[len] = 0;
ADDRLP4 136
INDIRI4
ADDRLP4 140
ADDP4
CNSTI1 0
ASGNI1
line 540
;540:	trap_FS_FCloseFile( f );
ADDRLP4 20140
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 543
;541:
;542:	// parse the text
;543:	text_p = text;
ADDRLP4 4
ADDRLP4 140
ASGNP4
line 544
;544:	skip = 0;	// quite the compiler warning
ADDRLP4 20144
CNSTI4 0
ASGNI4
line 549
;545:   
;546:	//
;547:	// set defaults
;548:	//
;549:	if ( team == TEAM_RED )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $313
line 550
;550:		num_seal_msgs = 0;
ADDRGP4 num_seal_msgs
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $313
line 552
;551:	else
;552:		num_tango_msgs = 0; 
ADDRGP4 num_tango_msgs
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $315
line 555
;553:
;554:	// parse  
;555:	while ( 1 ) {
line 557
;556: 		
;557:		token = COM_Parse( &text_p ); 
ADDRLP4 4
ARGP4
ADDRLP4 20152
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20152
INDIRP4
ASGNP4
line 560
;558:
;559:		// no token? stop parsing...
;560:		if ( !token || !Q_stricmp( token, "-1") ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $321
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 20160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20160
INDIRI4
CNSTI4 0
NEI4 $318
LABELV $321
line 561
;561:			break;
ADDRGP4 $317
JUMPV
LABELV $318
line 564
;562:		}  
;563:
;564:		if ( team == TEAM_RED )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $322
line 565
;565:			radio_seal_msgs[num_seal_msgs].soundLength = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20164
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 396
ADDRGP4 num_seal_msgs
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+132
ADDP4
ADDRLP4 20164
INDIRI4
ASGNI4
ADDRGP4 $323
JUMPV
LABELV $322
line 567
;566:		else
;567:			radio_tango_msgs[num_tango_msgs].soundLength = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20168
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 396
ADDRGP4 num_tango_msgs
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+132
ADDP4
ADDRLP4 20168
INDIRI4
ASGNI4
LABELV $323
line 569
;568:  
;569:		token = COM_Parse( &text_p ); 
ADDRLP4 4
ARGP4
ADDRLP4 20172
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20172
INDIRP4
ASGNP4
line 572
;570:
;571:		// no token? stop parsing...
;572:		if ( !token || !Q_stricmp( token, "-1") ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $328
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 20180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20180
INDIRI4
CNSTI4 0
NEI4 $326
LABELV $328
line 573
;573:			break;
ADDRGP4 $317
JUMPV
LABELV $326
line 576
;574:		}  
;575:  
;576:		if ( team == TEAM_RED )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $329
line 577
;577:			radio_seal_msgs[num_seal_msgs].soundIndex = G_SoundIndex( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20184
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
CNSTI4 396
ADDRGP4 num_seal_msgs
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+128
ADDP4
ADDRLP4 20184
INDIRI4
ASGNI4
ADDRGP4 $330
JUMPV
LABELV $329
line 579
;578:		else
;579:			radio_tango_msgs[num_tango_msgs].soundIndex = G_SoundIndex( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20188
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
CNSTI4 396
ADDRGP4 num_tango_msgs
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+128
ADDP4
ADDRLP4 20188
INDIRI4
ASGNI4
LABELV $330
line 581
;580:
;581:		token = COM_Parse( &text_p ); 
ADDRLP4 4
ARGP4
ADDRLP4 20192
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20192
INDIRP4
ASGNP4
line 584
;582:
;583:		// no token? stop parsing...
;584:		if ( !token || !Q_stricmp( token, "-1") ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $335
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 20200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20200
INDIRI4
CNSTI4 0
NEI4 $333
LABELV $335
line 585
;585:			break;
ADDRGP4 $317
JUMPV
LABELV $333
line 589
;586:		}   
;587:  
;588:		// start parsing seals part
;589:		if ( !Q_stricmp( token, "{" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 20204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20204
INDIRI4
CNSTI4 0
NEI4 $336
line 590
;590:		{			
ADDRGP4 $340
JUMPV
LABELV $339
line 592
;591:			while ( 1 )
;592:			{ 
line 594
;593:				// get new token
;594:				token = COM_Parse( &text_p );
ADDRLP4 4
ARGP4
ADDRLP4 20208
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20208
INDIRP4
ASGNP4
line 596
;595:
;596:				if ( !token || !Q_stricmp( token, "$EOF") )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 20216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20216
INDIRI4
CNSTI4 0
NEI4 $342
LABELV $345
line 597
;597:				{
line 598
;598:					G_Error("Unexpected end of file (file:%s)\n", filename );
ADDRGP4 $346
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 599
;599:					break;
ADDRGP4 $341
JUMPV
LABELV $342
line 603
;600:				}
;601:
;602:				// stop parsing the string
;603:				if ( !Q_stricmp( token , "}" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $349
ARGP4
ADDRLP4 20220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20220
INDIRI4
CNSTI4 0
NEI4 $347
line 604
;604:					break;
ADDRGP4 $341
JUMPV
LABELV $347
line 606
;605:				
;606:				{
line 609
;607:					char temp[256];   				
;608:
;609:					if ( team == TEAM_RED )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $350
line 610
;610:					{
line 611
;611:						if ( strlen( radio_seal_msgs[num_seal_msgs].chatString ) <= 0 )
CNSTI4 396
ADDRGP4 num_seal_msgs
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+136
ADDP4
ARGP4
ADDRLP4 20480
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20480
INDIRI4
CNSTI4 0
GTI4 $352
line 612
;612:							Com_sprintf( temp, sizeof( temp ), "%s", token );
ADDRLP4 20224
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $355
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $353
JUMPV
LABELV $352
line 614
;613:						else
;614:							Com_sprintf( temp, sizeof( temp ), "%s %s", radio_seal_msgs[num_seal_msgs].chatString , token );
ADDRLP4 20224
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $356
ARGP4
CNSTI4 396
ADDRGP4 num_seal_msgs
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+136
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $353
line 616
;615: 
;616:						strcpy( radio_seal_msgs[num_seal_msgs].chatString , temp );
CNSTI4 396
ADDRGP4 num_seal_msgs
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+136
ADDP4
ARGP4
ADDRLP4 20224
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 617
;617:					}
ADDRGP4 $351
JUMPV
LABELV $350
line 619
;618:					else 
;619:					{
line 620
;620:						if ( strlen( radio_tango_msgs[num_tango_msgs].chatString ) <= 0 )
CNSTI4 396
ADDRGP4 num_tango_msgs
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+136
ADDP4
ARGP4
ADDRLP4 20480
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20480
INDIRI4
CNSTI4 0
GTI4 $359
line 621
;621:							Com_sprintf( temp, sizeof( temp ), "%s", token );
ADDRLP4 20224
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $355
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $360
JUMPV
LABELV $359
line 623
;622:						else
;623:							Com_sprintf( temp, sizeof( temp ), "%s %s", radio_tango_msgs[num_tango_msgs].chatString , token );
ADDRLP4 20224
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $356
ARGP4
CNSTI4 396
ADDRGP4 num_tango_msgs
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+136
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $360
line 625
;624: 
;625:						strcpy( radio_tango_msgs[num_tango_msgs].chatString , temp ); 
CNSTI4 396
ADDRGP4 num_tango_msgs
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+136
ADDP4
ARGP4
ADDRLP4 20224
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 626
;626:					}
LABELV $351
line 627
;627:				}
line 629
;628: 
;629:			}
LABELV $340
line 591
ADDRGP4 $339
JUMPV
LABELV $341
line 630
;630:		} 
LABELV $336
line 633
;631:
;632:
;633:		if ( team == TEAM_RED ) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $364
line 634
;634:		{
line 635
;635:			if (!Q_stricmp( radio_seal_msgs[num_seal_msgs].soundAlias , "aaah") )
CNSTI4 396
ADDRGP4 num_seal_msgs
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs
ADDP4
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 20208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20208
INDIRI4
CNSTI4 0
NEI4 $366
line 636
;636:				sealdeathSoundIndex = num_seal_msgs;
ADDRGP4 sealdeathSoundIndex
ADDRGP4 num_seal_msgs
INDIRI4
ASGNI4
LABELV $366
line 638
;637:
;638:			radio_seal_msgs[num_seal_msgs].signalType = CG_GetSingalTypeForString( COM_Parse( &text_p ) );
ADDRLP4 4
ARGP4
ADDRLP4 20212
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 20212
INDIRP4
ARGP4
ADDRLP4 20216
ADDRGP4 CG_GetSingalTypeForString
CALLI4
ASGNI4
CNSTI4 396
ADDRGP4 num_seal_msgs
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs+392
ADDP4
ADDRLP4 20216
INDIRI4
ASGNI4
line 640
;639:
;640: 			Com_sprintf( radio_seal_msgs[num_seal_msgs].soundAlias,sizeof(radio_seal_msgs[num_seal_msgs].soundAlias), "%s",  COM_Parse( &text_p  ) );  
ADDRLP4 4
ARGP4
ADDRLP4 20220
ADDRGP4 COM_Parse
CALLP4
ASGNP4
CNSTI4 396
ADDRGP4 num_seal_msgs
INDIRI4
MULI4
ADDRGP4 radio_seal_msgs
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $355
ARGP4
ADDRLP4 20220
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 642
;641:
;642: 			num_seal_msgs++;
ADDRLP4 20224
ADDRGP4 num_seal_msgs
ASGNP4
ADDRLP4 20224
INDIRP4
ADDRLP4 20224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 644
;643:	
;644:			if ( num_seal_msgs >= MAX_RADIO_MESSAGES )
ADDRGP4 num_seal_msgs
INDIRI4
CNSTI4 150
LTI4 $365
line 645
;645:				G_Error("num_seal_msgs >= MAX_RADIO_MESSAGES");
ADDRGP4 $371
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 646
;646:		}
ADDRGP4 $365
JUMPV
LABELV $364
line 648
;647:		else 
;648:		{
line 649
;649:			if (!Q_stricmp( radio_tango_msgs[num_tango_msgs].soundAlias , "aaah") )
CNSTI4 396
ADDRGP4 num_tango_msgs
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs
ADDP4
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 20208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20208
INDIRI4
CNSTI4 0
NEI4 $372
line 650
;650:				tangodeathSoundIndex = num_tango_msgs;
ADDRGP4 tangodeathSoundIndex
ADDRGP4 num_tango_msgs
INDIRI4
ASGNI4
LABELV $372
line 652
;651:
;652:			radio_tango_msgs[num_tango_msgs].signalType = CG_GetSingalTypeForString( COM_Parse( &text_p ) );
ADDRLP4 4
ARGP4
ADDRLP4 20212
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 20212
INDIRP4
ARGP4
ADDRLP4 20216
ADDRGP4 CG_GetSingalTypeForString
CALLI4
ASGNI4
CNSTI4 396
ADDRGP4 num_tango_msgs
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs+392
ADDP4
ADDRLP4 20216
INDIRI4
ASGNI4
line 654
;653:
;654: 			Com_sprintf( radio_tango_msgs[num_tango_msgs].soundAlias,sizeof(radio_tango_msgs[num_tango_msgs].soundAlias), "%s",  COM_Parse( &text_p  ) );  
ADDRLP4 4
ARGP4
ADDRLP4 20220
ADDRGP4 COM_Parse
CALLP4
ASGNP4
CNSTI4 396
ADDRGP4 num_tango_msgs
INDIRI4
MULI4
ADDRGP4 radio_tango_msgs
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $355
ARGP4
ADDRLP4 20220
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 656
;655:
;656: 			num_tango_msgs++;
ADDRLP4 20224
ADDRGP4 num_tango_msgs
ASGNP4
ADDRLP4 20224
INDIRP4
ADDRLP4 20224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 658
;657:	
;658:			if ( num_tango_msgs >= MAX_RADIO_MESSAGES )
ADDRGP4 num_tango_msgs
INDIRI4
CNSTI4 150
LTI4 $375
line 659
;659:				G_Error("num_tango_msgs >= MAX_RADIO_MESSAGES"); 
ADDRGP4 $377
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $375
line 660
;660:		}
LABELV $365
line 661
;661:	}  
LABELV $316
line 555
ADDRGP4 $315
JUMPV
LABELV $317
line 663
;662:   
;663:}
LABELV $303
endproc G_ParseRadioConfigFileForTeam 20484 20
import ConcatArgs
bss
export radio_tango_msgs
align 4
LABELV radio_tango_msgs
skip 59400
export radio_seal_msgs
align 4
LABELV radio_seal_msgs
skip 59400
import NS_SendStatusMessageToTeam
import NS_GestureForNumber
import Cmd_Say_f
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
LABELV $377
byte 1 110
byte 1 117
byte 1 109
byte 1 95
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 95
byte 1 109
byte 1 115
byte 1 103
byte 1 115
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 82
byte 1 65
byte 1 68
byte 1 73
byte 1 79
byte 1 95
byte 1 77
byte 1 69
byte 1 83
byte 1 83
byte 1 65
byte 1 71
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $371
byte 1 110
byte 1 117
byte 1 109
byte 1 95
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 95
byte 1 109
byte 1 115
byte 1 103
byte 1 115
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 82
byte 1 65
byte 1 68
byte 1 73
byte 1 79
byte 1 95
byte 1 77
byte 1 69
byte 1 83
byte 1 83
byte 1 65
byte 1 71
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $356
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $355
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $349
byte 1 125
byte 1 0
align 1
LABELV $346
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 40
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $344
byte 1 36
byte 1 69
byte 1 79
byte 1 70
byte 1 0
align 1
LABELV $338
byte 1 123
byte 1 0
align 1
LABELV $320
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $312
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 62
byte 1 37
byte 1 105
byte 1 41
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
LABELV $307
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 95
byte 1 115
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $306
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 95
byte 1 116
byte 1 97
byte 1 110
byte 1 103
byte 1 111
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $302
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $299
byte 1 119
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $296
byte 1 102
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $293
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $286
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $285
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $271
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
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 39
byte 1 114
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $267
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $264
byte 1 65
byte 1 108
byte 1 112
byte 1 104
byte 1 97
byte 1 32
byte 1 40
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 108
byte 1 32
byte 1 41
byte 1 0
align 1
LABELV $261
byte 1 69
byte 1 99
byte 1 104
byte 1 111
byte 1 0
align 1
LABELV $258
byte 1 68
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $255
byte 1 67
byte 1 104
byte 1 97
byte 1 114
byte 1 108
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $252
byte 1 66
byte 1 114
byte 1 97
byte 1 118
byte 1 111
byte 1 0
align 1
LABELV $247
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $243
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 98
byte 1 98
byte 1 111
byte 1 120
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $225
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $210
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $205
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $202
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 114
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 32
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
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $186
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $182
byte 1 45
byte 1 100
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 114
byte 1 45
byte 1 0
align 1
LABELV $181
byte 1 111
byte 1 117
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $180
byte 1 118
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $179
byte 1 104
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $178
byte 1 109
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $177
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 50
byte 1 0
align 1
LABELV $176
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $175
byte 1 97
byte 1 97
byte 1 97
byte 1 104
byte 1 0
align 1
LABELV $174
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 53
byte 1 0
align 1
LABELV $171
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 52
byte 1 0
align 1
LABELV $168
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 51
byte 1 0
align 1
LABELV $165
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $162
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 49
byte 1 0
align 1
LABELV $159
byte 1 110
byte 1 111
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $69
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 111
byte 1 47
byte 1 99
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
