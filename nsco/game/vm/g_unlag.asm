export LerpVector
code
proc LerpVector 20 0
file "../g_unlag.c"
line 14
;1:// Copyright (C) 2001-2002 defcon-x/team-mirage
;2://
;3:// g_antilag.c -- handles server side anti-lag 
;4://
;5:// all code in this file is property of manfred nerurkar
;6:// no commercial explotation allowed
;7:// you are only allowed to use this code in navy seals: covert operations 
;8:// a quake3 arena modifiation
;9:// defcon-x@ns-co.net
;10:
;11:#include "g_local.h"
;12:
;13:void LerpVector ( vec3_t from, vec3_t to, float lerp, vec3_t out )
;14:{
line 15
;15:	out[0] = from[0] + (to[0]-from[0]) * lerp;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 16
;16:	out[1] = from[1] + (to[1]-from[1]) * lerp;
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 17
;17:	out[2] = from[2] + (to[2]-from[2]) * lerp;
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 18
;18:}
LABELV $68
endproc LerpVector 20 0
export G_UpdateClientAntiLag
proc G_UpdateClientAntiLag 28 0
line 26
;19:
;20:/*
;21:================
;22:G_UpdateClientAntiLag
;23:================
;24:*/
;25:void G_UpdateClientAntiLag ( gentity_t* ent )
;26:{
line 30
;27:	int			head;
;28:	int			newtime;
;29:
;30:	head = ent->client->antilagHead;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7656
ADDP4
INDIRI4
ASGNI4
line 34
;31:
;32:	// If on a new frame snap the head up to the end of the last frame and 
;33:	// add a new head
;34:	if ( ent->client->antilag[head].leveltime < level.time )
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 52
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $70
line 35
;35:	{
line 36
;36:		ent->client->antilag[head].time = level.previousTime;
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 48
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 39
;37:
;38:		// Move to the next position 
;39:		if ( (++ent->client->antilagHead) > MAX_ANTILAG )
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7656
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 40
LEI4 $74
line 40
;40:		{
line 41
;41:			ent->client->antilagHead = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7656
ADDP4
CNSTI4 0
ASGNI4
line 42
;42:		}
LABELV $74
line 44
;43:
;44:		head = ent->client->antilagHead;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7656
ADDP4
INDIRI4
ASGNI4
line 45
;45:	}
LABELV $70
line 48
;46:
;47:	// Bots only move once per frame
;48:	if ( ent->r.svFlags & SVF_BOT ) 
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $76
line 49
;49:	{
line 50
;50:		newtime = level.time;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 51
;51:	} 
ADDRGP4 $77
JUMPV
LABELV $76
line 53
;52:	else 
;53:	{
line 55
;54:		// calculate the actual server time		
;55:		newtime = level.previousTime + trap_Milliseconds() - level.frameStartTime;
ADDRLP4 8
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRGP4 level+40
INDIRI4
SUBI4
ASGNI4
line 57
;56:		
;57:		if ( newtime > level.time ) 
ADDRLP4 4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $81
line 58
;58:		{
line 59
;59:			newtime = level.time;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 60
;60:		} 
ADDRGP4 $82
JUMPV
LABELV $81
line 61
;61:		else if ( newtime <= level.previousTime ) 
ADDRLP4 4
INDIRI4
ADDRGP4 level+36
INDIRI4
GTI4 $85
line 62
;62:		{
line 63
;63:			newtime = level.previousTime + 1;
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 64
;64:		}
LABELV $85
LABELV $82
line 65
;65:	}
LABELV $77
line 68
;66:
;67:	// Copy the clients current state into the antilag cache
;68:	ent->client->antilag[head].leveltime = level.time;
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 69
;69:	ent->client->antilag[head].time = newtime;
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 48
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 72
;70:
;71:	// save inforamtion
;72:	VectorCopy ( ent->r.currentOrigin, ent->client->antilag[head].rOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 73
;73:	VectorCopy ( ent->r.currentAngles, ent->client->antilag[head].rAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 500
ADDP4
INDIRB
ASGNB 12
line 74
;74:	VectorCopy ( ent->r.mins, ent->client->antilag[head].mins );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 75
;75:	VectorCopy ( ent->r.maxs, ent->client->antilag[head].maxs );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 77
;76:
;77: 	ent->client->antilag[head].pm_flags  = ent->client->ps.pm_flags;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 56
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 79
;78://	ent->client->antilag[head].leanTime  = ent->client->ps.leanTime;
;79:}
LABELV $69
endproc G_UpdateClientAntiLag 28 0
export G_UndoClientAntiLag
proc G_UndoClientAntiLag 20 0
line 87
;80:
;81:/*
;82:================
;83:G_UndoClientAntiLag
;84:================
;85:*/
;86:void G_UndoClientAntiLag ( gentity_t* ent )
;87:{
line 90
;88:	// If the client isnt already in the past then 
;89:	// dont bother doing anything
;90:	if ( ent->client->antilagUndo.leveltime != level.time  )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7648
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
EQI4 $91
line 91
;91:		return;
ADDRGP4 $90
JUMPV
LABELV $91
line 94
;92:
;93:	// Move the client back into reality by moving over the undo information
;94:	VectorCopy ( ent->client->antilagUndo.rOrigin, ent->r.currentOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7596
ADDP4
INDIRB
ASGNB 12
line 95
;95:	VectorCopy ( ent->client->antilagUndo.rAngles, ent->r.currentAngles );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7608
ADDP4
INDIRB
ASGNB 12
line 96
;96:	VectorCopy ( ent->client->antilagUndo.mins, ent->r.mins );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7620
ADDP4
INDIRB
ASGNB 12
line 97
;97:	VectorCopy ( ent->client->antilagUndo.maxs, ent->r.maxs );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7632
ADDP4
INDIRB
ASGNB 12
line 99
;98:  
;99: 	ent->client->ps.pm_flags = ent->client->antilagUndo.pm_flags;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 7652
ADDP4
INDIRI4
ASGNI4
line 102
;100: 
;101:	// Mark the undo information so it cant be used again
;102:	ent->client->antilagUndo.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7648
ADDP4
CNSTI4 0
ASGNI4
line 103
;103:}
LABELV $90
endproc G_UndoClientAntiLag 20 0
export G_ApplyClientAntiLag
proc G_ApplyClientAntiLag 96 16
line 111
;104:
;105:/*
;106:================
;107:G_ApplyClientAntiLag
;108:================
;109:*/
;110:void G_ApplyClientAntiLag ( gentity_t* ent, int time )
;111:{
line 115
;112:	float	lerp;
;113:	int		from;
;114:	int		to;
;115:	int   steps = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 119
;116:
;117:	// Find the two pieces of history information that sandwitch the
;118:	// time we are looking for
;119:	from = ent->client->antilagHead;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7656
ADDP4
INDIRI4
ASGNI4
line 120
;120:	to   = ent->client->antilagHead;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7656
ADDP4
INDIRI4
ASGNI4
LABELV $95
line 121
;121:	do {
line 122
;122:		if ( (ent->client->antilag[from].time) <= time ) 
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 48
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $98
line 123
;123:			break; 
ADDRGP4 $97
JUMPV
LABELV $98
line 125
;124:
;125:		to = from;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 126
;126:		from--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 127
;127:		steps++;   // count the number of steps we do in antilag
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 129
;128:
;129:		if ( from < 0 ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $100
line 130
;130:			from = MAX_ANTILAG - 1; 
ADDRLP4 0
CNSTI4 39
ASGNI4
LABELV $100
line 131
;131:	}
LABELV $96
line 132
;132:	while ( from != ent->client->antilagHead );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7656
ADDP4
INDIRI4
NEI4 $95
LABELV $97
line 136
;133:
;134:	// If the from is equal to the to then there wasnt even
;135:	// one piece of information worth using so just use the current time frame
;136:	if ( from == to )
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $102
line 137
;137:	{
line 138
;138:		return;
ADDRGP4 $94
JUMPV
LABELV $102
line 142
;139:	}
;140:
;141:	// Save the undo information if its not already saved
;142:	if ( ent->client->antilagUndo.leveltime != level.time )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7648
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
EQI4 $104
line 143
;143:	{
line 145
;144:		// Save the undo information
;145:		ent->client->antilagUndo.leveltime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7648
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 147
;146:
;147:		VectorCopy ( ent->r.currentOrigin, ent->client->antilagUndo.rOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7596
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 148
;148:		VectorCopy ( ent->r.currentAngles, ent->client->antilagUndo.rAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7608
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 500
ADDP4
INDIRB
ASGNB 12
line 149
;149:		VectorCopy ( ent->r.mins, ent->client->antilagUndo.mins );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7620
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 150
;150:		VectorCopy ( ent->r.maxs, ent->client->antilagUndo.maxs );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7632
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 152
;151:
;152:		ent->client->antilagUndo.pm_flags  = ent->client->ps.pm_flags;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 7652
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 154
;153://		ent->client->antilagUndo.leanTime  = ent->client->ps.leanTime;
;154:	}
LABELV $104
line 158
;155:
;156:	// If the best history found was the last in the list then
;157:	// dont lerp, just use the last one
;158:	if ( from == ent->client->antilagHead )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 7656
ADDP4
INDIRI4
NEI4 $108
line 159
;159:	{
line 160
;160:		VectorCopy ( ent->client->antilag[to].rOrigin, ent->r.currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
INDIRB
ASGNB 12
line 161
;161:		VectorCopy ( ent->client->antilag[to].rAngles, ent->r.currentAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 162
;162:		VectorCopy ( ent->client->antilag[to].mins, ent->r.maxs );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 163
;163:		VectorCopy ( ent->client->antilag[to].maxs, ent->r.mins );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 165
;164:
;165:		ent->client->ps.pm_flags = ent->client->antilag[to].pm_flags;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 56
ADDP4
INDIRI4
ASGNI4
line 167
;166://		ent->client->ps.leanTime = ent->client->antilag[to].leanTime;
;167:	}
ADDRGP4 $109
JUMPV
LABELV $108
line 169
;168:	else
;169:	{
line 171
;170:		// Calculate the lerp value to use for the vectors
;171:		lerp = (float)(time - ent->client->antilag[from].time) / (float)(ent->client->antilag[to].time - ent->client->antilag[from].time);
ADDRLP4 16
CNSTI4 60
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ASGNP4
ADDRLP4 24
CNSTI4 48
ASGNI4
ADDRLP4 28
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 174
;172:
;173:		// Lerp all the vectors between the before and after history information
;174:		LerpVector ( ent->client->antilag[from].rOrigin, ent->client->antilag[to].rOrigin, lerp, ent->r.currentOrigin );
ADDRLP4 32
CNSTI4 60
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ASGNP4
ADDRLP4 32
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 40
INDIRP4
ADDP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 40
INDIRP4
ADDP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 LerpVector
CALLV
pop
line 175
;175:		LerpVector ( ent->client->antilag[from].rAngles, ent->client->antilag[to].rAngles, lerp, ent->r.currentAngles );
ADDRLP4 44
CNSTI4 60
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ASGNP4
ADDRLP4 56
CNSTI4 12
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
ARGP4
ADDRLP4 44
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 48
INDIRP4
CNSTI4 500
ADDP4
ARGP4
ADDRGP4 LerpVector
CALLV
pop
line 176
;176:		LerpVector ( ent->client->antilag[from].maxs, ent->client->antilag[to].maxs, lerp, ent->r.maxs );
ADDRLP4 60
CNSTI4 60
ASGNI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ASGNP4
ADDRLP4 72
CNSTI4 36
ASGNI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 68
INDIRP4
ADDP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 60
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 68
INDIRP4
ADDP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRGP4 LerpVector
CALLV
pop
line 177
;177:		LerpVector ( ent->client->antilag[from].mins, ent->client->antilag[to].mins, lerp, ent->r.mins );
ADDRLP4 76
CNSTI4 60
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 5196
ADDP4
ASGNP4
ADDRLP4 88
CNSTI4 24
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 84
INDIRP4
ADDP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 84
INDIRP4
ADDP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 80
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRGP4 LerpVector
CALLV
pop
line 181
;178:
;179:// 		ent->client->ps.leanTime = ent->client->antilag[from].leanTime + (ent->client->antilag[from].leanTime-ent->client->antilag[to].leanTime) * lerp;
;180:
;181: 		ent->client->ps.pm_flags = ent->client->antilag[to].pm_flags;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 92
INDIRP4
CNSTI4 5196
ADDP4
ADDP4
CNSTI4 56
ADDP4
INDIRI4
ASGNI4
line 182
;182:	}
LABELV $109
line 183
;183:}
LABELV $94
endproc G_ApplyClientAntiLag 96 16
export G_UndoAntiLag
proc G_UndoAntiLag 24 4
line 191
;184:
;185:/*
;186:================
;187:G_UndoAntiLag
;188:================
;189:*/
;190:void G_UndoAntiLag ( void )
;191:{
line 195
;192:	int i;
;193:
;194:	// Undo all history
;195:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $111
line 196
;196:	{
line 197
;197:		gentity_t* other = &g_entities[level.sortedClients[i]];
ADDRLP4 4
CNSTI4 1108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 199
;198:		
;199:		if ( other->client->pers.connected != CON_CONNECTED )
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $117
line 200
;200:		{
line 201
;201:			continue;
ADDRGP4 $112
JUMPV
LABELV $117
line 205
;202:		}
;203:
;204:		// Skip clients that are spectating
;205:		if ( other->client->sess.waiting ||
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $123
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $123
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $123
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $119
LABELV $123
line 209
;206:			other->client->ps.pm_type == PM_NOCLIP ||
;207:			other->client->ps.pm_type == PM_SPECTATOR ||
;208:			other->health <= 0 )
;209:		{
line 210
;210:			continue;
ADDRGP4 $112
JUMPV
LABELV $119
line 225
;211:		}
;212:#if 0
;213:		if ( other->r.svFlags & SVF_DOUBLED_BBOX )
;214:		{
;215:			// Put the hitbox back the way it was
;216:			other->r.maxs[0] /= 2;
;217:			other->r.maxs[1] /= 2;
;218:			other->r.mins[0] /= 2;
;219:			other->r.mins[1] /= 2;
;220:
;221:			other->r.svFlags &= (~SVF_DOUBLED_BBOX);
;222:		}
;223:#endif
;224:
;225:		G_UndoClientAntiLag ( other );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_UndoClientAntiLag
CALLV
pop
line 228
;226:
;227:		// update the head bbox
;228:		NS_ModifyClientBBox( other );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 NS_ModifyClientBBox
CALLV
pop
line 230
;229:		// Relink the entity into the world
;230:		trap_LinkEntity ( other );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 231
;231:	}
LABELV $112
line 195
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $114
ADDRLP4 0
INDIRI4
ADDRGP4 level+76
INDIRI4
LTI4 $111
line 232
;232:}
LABELV $110
endproc G_UndoAntiLag 24 4
export G_ApplyAntiLag
proc G_ApplyAntiLag 32 8
line 244
;233:
;234:/*
;235:================
;236:G_ApplyAntiLag
;237:================
;238:*/
;239:#if 0 
;240:void G_ApplyAntiLag ( gentity_t* ref, qboolean enlargeHitBox )
;241:#else
;242:void G_ApplyAntiLag ( gentity_t* ref )
;243:#endif
;244:{
line 249
;245:	int i;
;246:	int reftime;
;247:
;248:	// Figure out the reference time based on the reference clients server time
;249:	reftime = ref->client->pers.cmd.serverTime;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 250
;250:	if ( reftime > level.time )  
ADDRLP4 4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $125
line 251
;251:		reftime = level.time; 
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ASGNI4
LABELV $125
line 254
;252:
;253:	// Move all the clients back into the reference clients time frame.
;254:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 255
;255:	{
line 256
;256:		gentity_t* other = &g_entities[level.sortedClients[i]];
ADDRLP4 8
CNSTI4 1108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 258
;257:
;258:		if ( other->client->pers.connected != CON_CONNECTED ) 
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $135
line 259
;259:			continue; 
ADDRGP4 $130
JUMPV
LABELV $135
line 262
;260:
;261:		// Skip the reference client
;262:		if ( other == ref ) 
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $137
line 263
;263:			continue; 
ADDRGP4 $130
JUMPV
LABELV $137
line 266
;264:
;265:		// Skip entities not in use
;266:		if ( !other->inuse ) 
ADDRLP4 8
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $139
line 267
;267:			continue; 
ADDRGP4 $130
JUMPV
LABELV $139
line 270
;268:
;269:		// Skip clients that are spectating
;270:		if ( other->client->sess.waiting ||
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $145
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
EQI4 $145
ADDRLP4 24
INDIRI4
CNSTI4 2
EQI4 $145
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $141
LABELV $145
line 274
;271:			other->client->ps.pm_type == PM_NOCLIP ||
;272:			other->client->ps.pm_type == PM_SPECTATOR ||
;273:			other->health <= 0 )
;274:		{
line 275
;275:			continue;
ADDRGP4 $130
JUMPV
LABELV $141
line 279
;276:		}
;277:
;278:		// Dont bring them back in time unless requested
;279:		if ( !(ref->r.svFlags & SVF_BOT) & ref->client->pers.antiLag )
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $149
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $150
JUMPV
LABELV $149
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $150
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1604
ADDP4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $146
line 280
;280:		{
line 282
;281:			// Apply the antilag to this player
;282:			G_ApplyClientAntiLag ( other, reftime );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_ApplyClientAntiLag
CALLV
pop
line 283
;283:		}
LABELV $146
line 299
;284:
;285:#if 0
;286:		if ( enlargeHitBox )
;287:		{
;288:			// Adjust the hit box to account for hands and such 
;289:			// that are sticking out of the normal bounding box
;290:			other->r.maxs[0] *= 2;
;291:			other->r.maxs[1] *= 2;
;292:			other->r.mins[0] *= 2;
;293:			other->r.mins[1] *= 2;
;294:			other->r.svFlags |= SVF_DOUBLED_BBOX;
;295:		}
;296:#endif
;297:
;298:		// move his headbbox according to the coordinates.
;299:		NS_ModifyClientBBox( other );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 NS_ModifyClientBBox
CALLV
pop
line 301
;300:		// Relink the entity into the world
;301:		trap_LinkEntity ( other );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 302
;302:	}	
LABELV $130
line 254
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 0
INDIRI4
ADDRGP4 level+76
INDIRI4
LTI4 $129
line 303
;303:}
LABELV $124
endproc G_ApplyAntiLag 32 8
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
