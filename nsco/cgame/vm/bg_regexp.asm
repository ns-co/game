export regerror
code
proc regerror 0 4
file "../bg_regexp.c"
line 35
;1:  
;2:
;3:/*
;4: * regcomp and regexec -- regsub and regerror are elsewhere
;5: *
;6: *      Copyright (c) 1986 by University of Toronto.
;7: *      Written by Henry Spencer.  Not derived from licensed software.
;8: *
;9: *      Permission is granted to anyone to use this software for any
;10: *      purpose on any computer system, and to redistribute it freely,
;11: *      subject to the following restrictions:
;12: *
;13: *      1. The author is not responsible for the consequences of use of
;14: *              this software, no matter how awful, even if they arise
;15: *              from defects in it.
;16: *
;17: *      2. The origin of this software must not be misrepresented, either
;18: *              by explicit claim or by omission.
;19: *
;20: *      3. Altered versions must be plainly marked as such, and must not
;21: *              be misrepresented as being the original software.
;22: *
;23: * Beware that some of this code is subtly aware of the way operator
;24: * precedence is structured in regular expressions.  Serious changes in
;25: * regular-expression syntax might require a total rethink.
;26: */
;27:/*
;28:#include <stdio.h>
;29:#include <string.h>*/
;30:#include "regexp.h"
;31:#include "regmagic.h"
;32:#include "cg_local.h"
;33:
;34:void regerror( char *string ) 
;35:{
line 36
;36:	CG_Printf(string);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 37
;37:}
LABELV $84
endproc regerror 0 4
export regcomp
proc regcomp 52 8
line 200
;38:/*
;39: * The "internal use only" fields in regexp.h are present to pass info from
;40: * compile to execute that permits the execute phase to run lots faster on
;41: * simple cases.  They are:
;42: *
;43: * regstart     char that must begin a match; '\0' if none obvious
;44: * reganch      is the match anchored (at beginning-of-line only)?
;45: * regmust      string (pointer into program) that match must include, or NULL
;46: * regmlen      length of regmust string
;47: *
;48: * Regstart and reganch permit very fast decisions on suitable starting points
;49: * for a match, cutting down the work a lot.  Regmust permits fast rejection
;50: * of lines that cannot possibly match.  The regmust tests are costly enough
;51: * that regcomp() supplies a regmust only if the r.e. contains something
;52: * potentially expensive (at present, the only such thing detected is * or +
;53: * at the start of the r.e., which can involve a lot of backup).  Regmlen is
;54: * supplied because the test in regexec() needs it and regcomp() is computing
;55: * it anyway.
;56: */
;57:
;58:/*
;59: * Structure for regexp "program".  This is essentially a linear encoding
;60: * of a nondeterministic finite-state machine (aka syntax charts or
;61: * "railroad normal form" in parsing technology).  Each node is an opcode
;62: * plus a "next" pointer, possibly plus an operand.  "Next" pointers of
;63: * all nodes except BRANCH implement concatenation; a "next" pointer with
;64: * a BRANCH on both ends of it is connecting two alternatives.  (Here we
;65: * have one of the subtle syntax dependencies:  an individual BRANCH (as
;66: * opposed to a collection of them) is never concatenated with anything
;67: * because of operator precedence.)  The operand of some types of node is
;68: * a literal string; for others, it is a node leading into a sub-FSM.  In
;69: * particular, the operand of a BRANCH node is the first node of the branch.
;70: * (NB this is *not* a tree structure:  the tail of the branch connects
;71: * to the thing following the set of BRANCHes.)  The opcodes are:
;72: */
;73:
;74:/* definition   number        opnd?        meaning */
;75:#define END        0        /* no        End of program. */
;76:#define BOL        1        /* no        Match "" at beginning of line. */
;77:#define EOL        2        /* no        Match "" at end of line. */
;78:#define ANY        3        /* no        Match any one character. */
;79:#define ANYOF        4        /* str        Match any character in this string. */
;80:#define ANYBUT        5        /* str        Match any character not in this string. */
;81:#define BRANCH        6        /* node        Match this alternative, or the next... */
;82:#define BACK        7        /* no        Match "", "next" ptr points backward. */
;83:#define EXACTLY        8        /* str        Match this string. */
;84:#define NOTHING        9        /* no        Match empty string. */
;85:#define STAR        10        /* node        Match this (simple) thing 0 or more times. */
;86:#define PLUS        11        /* node        Match this (simple) thing 1 or more times. */
;87:#define OPEN        20        /* no        Mark this point in input as start of #n. */
;88:                        /*        OPEN+1 is number 1, etc. */
;89:#define CLOSE        30        /* no        Analogous to OPEN. */
;90:
;91:/*
;92: * Opcode notes:
;93: *
;94: * BRANCH       The set of branches constituting a single choice are hooked
;95: *              together with their "next" pointers, since precedence prevents
;96: *              anything being concatenated to any individual branch.  The
;97: *              "next" pointer of the last BRANCH in a choice points to the
;98: *              thing following the whole choice.  This is also where the
;99: *              final "next" pointer of each individual branch points; each
;100: *              branch starts with the operand node of a BRANCH node.
;101: *
;102: * BACK         Normal "next" pointers all implicitly point forward; BACK
;103: *              exists to make loop structures possible.
;104: *
;105: * STAR,PLUS    '?', and complex '*' and '+', are implemented as circular
;106: *              BRANCH structures using BACK.  Simple cases (one character
;107: *              per match) are implemented with STAR and PLUS for speed
;108: *              and to minimize recursive plunges.
;109: *
;110: * OPEN,CLOSE   ...are numbered at compile time.
;111: */
;112:
;113:/*
;114: * A node is one char of opcode followed by two chars of "next" pointer.
;115: * "Next" pointers are stored as two 8-bit pieces, high order first.  The
;116: * value is a positive offset from the opcode of the node containing it.
;117: * An operand, if any, simply follows the node.  (Note that much of the
;118: * code generation knows about this implicit relationship.)
;119: *
;120: * Using two bytes for the "next" pointer is vast overkill for most things,
;121: * but allows patterns to get big without disasters.
;122: */
;123:#define OP(p)        (*(p))
;124:#define NEXT(p)        (((*((p)+1)&0377)<<8) + (*((p)+2)&0377))
;125:#define OPERAND(p)        ((p) + 3)
;126:
;127:/*
;128: * See regmagic.h for one further detail of program structure.
;129: */
;130:
;131:
;132:/*
;133: * Utility definitions.
;134: */
;135:#ifndef CHARBITS
;136:#define UCHARAT(p)        ((int)*(unsigned char *)(p))
;137:#else
;138:#define UCHARAT(p)        ((int)*(p)&CHARBITS)
;139:#endif
;140:
;141:#define FAIL(m)        { regerror(m); return(NULL); }
;142:#define ISMULT(c)        ((c) == '*' || (c) == '+' || (c) == '?')
;143:#define META        "^$.[()|?+*\\"
;144:
;145:/*
;146: * Flags to be passed up and down.
;147: */
;148:#define HASWIDTH        01        /* Known never to match null string. */
;149:#define SIMPLE                02        /* Simple enough to be STAR/PLUS operand. */
;150:#define SPSTART                04        /* Starts with * or +. */
;151:#define WORST                0        /* Worst case. */
;152:
;153:/*
;154: * Global work variables for regcomp().
;155: */
;156:static char *regparse;          /* Input-scan pointer. */
;157:static int regnpar;             /* () count. */
;158:static char regdummy;
;159:static char *regcode;           /* Code-emit pointer; &regdummy = don't. */
;160:static long regsize;            /* Code size. */
;161:
;162:/*
;163: * Forward declarations for regcomp()'s friends.
;164: */
;165:#ifndef STATIC
;166:#define STATIC        static
;167:#endif
;168:STATIC char *reg();
;169:STATIC char *regbranch();
;170:STATIC char *regpiece();
;171:STATIC char *regatom();
;172:STATIC char *regnode();
;173:STATIC char *regnext();
;174:STATIC void regc();
;175:STATIC void reginsert();
;176:STATIC void regtail();
;177:STATIC void regoptail();
;178:#ifdef STRCSPN
;179:STATIC int strcspn();
;180:#endif
;181:
;182:/*
;183: - regcomp - compile a regular expression into internal code
;184: *
;185: * We can't allocate space until we know how big the compiled form will be,
;186: * but we can't compile it (and thus know how big it is) until we've got a
;187: * place to put the code.  So we cheat:  we compile it twice, once with code
;188: * generation turned off and size counting turned on, and once "for real".
;189: * This also means that we don't allocate space until we are sure that the
;190: * thing really will compile successfully, and we never have to move the
;191: * code and thus invalidate pointers into it.  (Note that it has to be in
;192: * one piece because free() must be able to free it all.)
;193: *
;194: * Beware that the optimization-preparation code in here knows about some
;195: * of the structure of the compiled regexp.
;196: */
;197:regexp *
;198:regcomp(exp)
;199:char *exp;
;200:{
line 209
;201:        register regexp *r;
;202:        register char *scan;
;203:        register char *longest;
;204:        register int len;
;205:        int flags;
;206:   //     extern char *malloc();
;207:
;208:		// reinit memory 
;209:		CG_InitMemory();
ADDRGP4 CG_InitMemory
CALLV
pop
line 211
;210:
;211:        if (exp == NULL)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $86
line 212
;212:                FAIL("NULL argument");
ADDRGP4 $88
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $85
JUMPV
LABELV $86
line 215
;213:
;214:        /* First pass: determine size, legality. */
;215:        regparse = exp;
ADDRGP4 regparse
ADDRFP4 0
INDIRP4
ASGNP4
line 216
;216:        regnpar = 1;
ADDRGP4 regnpar
CNSTI4 1
ASGNI4
line 217
;217:        regsize = 0L;
ADDRGP4 regsize
CNSTI4 0
ASGNI4
line 218
;218:        regcode = &regdummy;
ADDRGP4 regcode
ADDRGP4 regdummy
ASGNP4
line 219
;219:        regc(MAGIC);
CNSTI4 156
ARGI4
ADDRGP4 regc
CALLV
pop
line 220
;220:        if (reg(0, &flags) == NULL)
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 20
ADDRGP4 reg
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $89
line 221
;221:                return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $85
JUMPV
LABELV $89
line 224
;222:
;223:        /* Small enough for pointer-storage convention? */
;224:        if (regsize >= 32767L)                /* Probably could be 65535L. */
ADDRGP4 regsize
INDIRI4
CNSTI4 32767
LTI4 $91
line 225
;225:                FAIL("regexp too big");
ADDRGP4 $93
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $85
JUMPV
LABELV $91
line 228
;226:
;227:        /* Allocate space. */
;228:        r = (regexp *)CG_Alloc(sizeof(regexp) + (unsigned)regsize);
ADDRGP4 regsize
INDIRI4
CVIU4 4
CNSTU4 2656
ADDU4
CVUI4 4
ARGI4
ADDRLP4 24
ADDRGP4 CG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 229
;229:        if (r == NULL)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $94
line 230
;230:                FAIL("out of space");
ADDRGP4 $96
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $85
JUMPV
LABELV $94
line 233
;231:
;232:        /* Second pass: emit code. */
;233:        regparse = exp;
ADDRGP4 regparse
ADDRFP4 0
INDIRP4
ASGNP4
line 234
;234:        regnpar = 1;
ADDRGP4 regnpar
CNSTI4 1
ASGNI4
line 235
;235:        regcode = r->program;
ADDRGP4 regcode
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
ASGNP4
line 236
;236:        regc(MAGIC);
CNSTI4 156
ARGI4
ADDRGP4 regc
CALLV
pop
line 237
;237:        if (reg(0, &flags) == NULL)
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ADDRGP4 reg
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $97
line 238
;238:                return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $85
JUMPV
LABELV $97
line 241
;239:
;240:        /* Dig out information for optimizations. */
;241:        r->regstart = '\0';        /* Worst-case defaults. */
ADDRLP4 0
INDIRP4
CNSTI4 2640
ADDP4
CNSTI1 0
ASGNI1
line 242
;242:        r->reganch = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2641
ADDP4
CNSTI1 0
ASGNI1
line 243
;243:        r->regmust = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
CNSTP4 0
ASGNP4
line 244
;244:        r->regmlen = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
CNSTI4 0
ASGNI4
line 245
;245:        scan = r->program+1;                        /* First BRANCH. */
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 2653
ADDP4
ASGNP4
line 246
;246:        if (OP(regnext(scan)) == END) {                /* Only one top-level choice. */
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 regnext
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $99
line 247
;247:                scan = OPERAND(scan);
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
ASGNP4
line 250
;248:
;249:                /* Starting-point info. */
;250:                if (OP(scan) == EXACTLY)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 8
NEI4 $101
line 251
;251:                        r->regstart = *OPERAND(scan);
ADDRLP4 0
INDIRP4
CNSTI4 2640
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
ASGNI1
ADDRGP4 $102
JUMPV
LABELV $101
line 252
;252:                else if (OP(scan) == BOL)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 1
NEI4 $103
line 253
;253:                        r->reganch++;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 2641
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 1
ADDI4
CVII1 4
ASGNI1
LABELV $103
LABELV $102
line 263
;254:
;255:                /*
;256:                 * If there's something expensive in the r.e., find the
;257:                 * longest literal string that must appear and make it the
;258:                 * regmust.  Resolve ties in favor of later strings, since
;259:                 * the regstart check works with the beginning of the r.e.
;260:                 * and avoiding duplication strengthens checking.  Not a
;261:                 * strong reason, but sufficient in the absence of others.
;262:                 */
;263:                if (flags&SPSTART) {
ADDRLP4 16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $105
line 264
;264:                        longest = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 265
;265:                        len = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 266
;266:                        for (; scan != NULL; scan = regnext(scan))
ADDRGP4 $110
JUMPV
LABELV $107
line 267
;267:                                if (OP(scan) == EXACTLY && strlen(OPERAND(scan)) >= len) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 8
NEI4 $111
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $111
line 268
;268:                                        longest = OPERAND(scan);
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
ASGNP4
line 269
;269:                                        len = strlen(OPERAND(scan));
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 270
;270:                                }
LABELV $111
LABELV $108
line 266
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 regnext
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
ASGNP4
LABELV $110
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
line 271
;271:                        r->regmust = longest;
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 272
;272:                        r->regmlen = len;
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 273
;273:                }
LABELV $105
line 274
;274:        }
LABELV $99
line 276
;275:
;276:        return(r);
ADDRLP4 0
INDIRP4
RETP4
LABELV $85
endproc regcomp 52 8
proc reg 56 8
line 292
;277:}
;278:
;279:/*
;280: - reg - regular expression, i.e. main body or parenthesized thing
;281: *
;282: * Caller must absorb opening parenthesis.
;283: *
;284: * Combining parenthesis handling with the base level of regular expression
;285: * is a trifle forced, but the need to tie the tails of the branches to what
;286: * follows makes it hard to avoid.
;287: */
;288:static char *
;289:reg(paren, flagp)
;290:int paren;                      /* Parenthesized? */
;291:int *flagp;
;292:{
line 299
;293:        register char *ret;
;294:        register char *br;
;295:        register char *ender;
;296:        register int parno;
;297:        int flags;
;298:
;299:        *flagp = HASWIDTH;        /* Tentatively. */
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 302
;300:
;301:        /* Make an OPEN node, if parenthesized. */
;302:        if (paren) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $114
line 303
;303:                if (regnpar >= NSUBEXP)
ADDRGP4 regnpar
INDIRI4
CNSTI4 10
LTI4 $116
line 304
;304:                        FAIL("too many ()");
ADDRGP4 $118
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $113
JUMPV
LABELV $116
line 305
;305:                parno = regnpar;
ADDRLP4 12
ADDRGP4 regnpar
INDIRI4
ASGNI4
line 306
;306:                regnpar++;
ADDRLP4 20
ADDRGP4 regnpar
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 307
;307:                ret = regnode(OPEN+parno);
ADDRLP4 12
INDIRI4
CNSTI4 20
ADDI4
ARGI4
ADDRLP4 24
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 308
;308:        } else
ADDRGP4 $115
JUMPV
LABELV $114
line 309
;309:                ret = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $115
line 312
;310:
;311:        /* Pick up the branches, linking them together. */
;312:        br = regbranch(&flags);
ADDRLP4 16
ARGP4
ADDRLP4 20
ADDRGP4 regbranch
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 313
;313:        if (br == NULL)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $119
line 314
;314:                return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $113
JUMPV
LABELV $119
line 315
;315:        if (ret != NULL)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $121
line 316
;316:                regtail(ret, br);        /* OPEN -> first. */
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
ADDRGP4 $122
JUMPV
LABELV $121
line 318
;317:        else
;318:                ret = br;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
LABELV $122
line 319
;319:        if (!(flags&HASWIDTH))
ADDRLP4 16
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $123
line 320
;320:                *flagp &= ~HASWIDTH;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $123
line 321
;321:        *flagp |= flags&SPSTART;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 4
BANDI4
BORI4
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $125
line 322
;322:        while (*regparse == '|') {
line 323
;323:                regparse++;
ADDRLP4 32
ADDRGP4 regparse
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 324
;324:                br = regbranch(&flags);
ADDRLP4 16
ARGP4
ADDRLP4 36
ADDRGP4 regbranch
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
ASGNP4
line 325
;325:                if (br == NULL)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $128
line 326
;326:                        return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $113
JUMPV
LABELV $128
line 327
;327:                regtail(ret, br);        /* BRANCH -> BRANCH. */
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 328
;328:                if (!(flags&HASWIDTH))
ADDRLP4 16
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $130
line 329
;329:                        *flagp &= ~HASWIDTH;
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $130
line 330
;330:                *flagp |= flags&SPSTART;
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 4
BANDI4
BORI4
ASGNI4
line 331
;331:        }
LABELV $126
line 322
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
CNSTI4 124
EQI4 $125
line 334
;332:
;333:        /* Make a closing node, and hook it on the end. */
;334:        ender = regnode((paren) ? CLOSE+parno : END);        
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $133
ADDRLP4 32
ADDRLP4 12
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $133
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $134
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
ASGNP4
line 335
;335:        regtail(ret, ender);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 338
;336:
;337:        /* Hook the tails of the branches to the closing node. */
;338:        for (br = ret; br != NULL; br = regnext(br))
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $138
JUMPV
LABELV $135
line 339
;339:                regoptail(br, ender);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 regoptail
CALLV
pop
LABELV $136
line 338
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 regnext
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 40
INDIRP4
ASGNP4
LABELV $138
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $135
line 342
;340:
;341:        /* Check for proper termination. */
;342:        if (paren && *regparse++ != ')') {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $139
ADDRLP4 48
ADDRGP4 regparse
ASGNP4
ADDRLP4 44
ADDRLP4 48
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
CNSTI4 41
EQI4 $139
line 343
;343:                FAIL("unmatched ()");
ADDRGP4 $141
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $113
JUMPV
LABELV $139
line 344
;344:        } else if (!paren && *regparse != '\0') {
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $142
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
EQI4 $142
line 345
;345:                if (*regparse == ')') {
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
CNSTI4 41
NEI4 $144
line 346
;346:                        FAIL("unmatched ()");
ADDRGP4 $141
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $113
JUMPV
LABELV $144
line 348
;347:                } else
;348:                        FAIL("junk on end");        /* "Can't happen". */
ADDRGP4 $146
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $113
JUMPV
LABELV $142
line 352
;349:                /* NOTREACHED */
;350:        }
;351:
;352:        return(ret);
ADDRLP4 0
INDIRP4
RETP4
LABELV $113
endproc reg 56 8
proc regbranch 32 8
line 363
;353:}
;354:
;355:/*
;356: - regbranch - one alternative of an | operator
;357: *
;358: * Implements the concatenation operator.
;359: */
;360:static char *
;361:regbranch(flagp)
;362:int *flagp;
;363:{
line 369
;364:        register char *ret;
;365:        register char *chain;
;366:        register char *latest;
;367:        int flags;
;368:
;369:        *flagp = WORST;                /* Tentatively. */
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 371
;370:
;371:        ret = regnode(BRANCH);
CNSTI4 6
ARGI4
ADDRLP4 16
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 372
;372:        chain = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $149
JUMPV
LABELV $148
line 373
;373:        while (*regparse != '\0' && *regparse != '|' && *regparse != ')') {
line 374
;374:                latest = regpiece(&flags);
ADDRLP4 12
ARGP4
ADDRLP4 20
ADDRGP4 regpiece
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 375
;375:                if (latest == NULL)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $151
line 376
;376:                        return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $147
JUMPV
LABELV $151
line 377
;377:                *flagp |= flags&HASWIDTH;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 1
BANDI4
BORI4
ASGNI4
line 378
;378:                if (chain == NULL)        /* First piece. */
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $153
line 379
;379:                        *flagp |= flags&SPSTART;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 4
BANDI4
BORI4
ASGNI4
ADDRGP4 $154
JUMPV
LABELV $153
line 381
;380:                else
;381:                        regtail(chain, latest);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
LABELV $154
line 382
;382:                chain = latest;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 383
;383:        }
LABELV $149
line 373
ADDRLP4 20
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $156
ADDRLP4 20
INDIRI4
CNSTI4 124
EQI4 $156
ADDRLP4 20
INDIRI4
CNSTI4 41
NEI4 $148
LABELV $156
line 384
;384:        if (chain == NULL)        /* Loop ran zero times. */
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $157
line 385
;385:                (void) regnode(NOTHING);
CNSTI4 9
ARGI4
ADDRGP4 regnode
CALLP4
pop
LABELV $157
line 387
;386:
;387:        return(ret);
ADDRLP4 0
INDIRP4
RETP4
LABELV $147
endproc regbranch 32 8
proc regpiece 44 8
line 402
;388:}
;389:
;390:/*
;391: - regpiece - something followed by possible [*+?]
;392: *
;393: * Note that the branching code sequences used for ? and the general cases
;394: * of * and + are somewhat optimized:  they use the same NOTHING node as
;395: * both the endmarker for their branch list and the body of the last branch.
;396: * It might seem that this node could be dispensed with entirely, but the
;397: * endmarker role is not redundant.
;398: */
;399:static char *
;400:regpiece(flagp)
;401:int *flagp;
;402:{
line 408
;403:        register char *ret;
;404:        register char op;
;405:        register char *next;
;406:        int flags;
;407:
;408:        ret = regatom(&flags);
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 regatom
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 409
;409:        if (ret == NULL)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $160
line 410
;410:                return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $159
JUMPV
LABELV $160
line 412
;411:
;412:        op = *regparse;
ADDRLP4 4
ADDRGP4 regparse
INDIRP4
INDIRI1
ASGNI1
line 413
;413:        if (!ISMULT(op)) {
ADDRLP4 20
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 42
EQI4 $162
ADDRLP4 20
INDIRI4
CNSTI4 43
EQI4 $162
ADDRLP4 20
INDIRI4
CNSTI4 63
EQI4 $162
line 414
;414:                *flagp = flags;
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 415
;415:                return(ret);
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $159
JUMPV
LABELV $162
line 418
;416:        }
;417:
;418:        if (!(flags&HASWIDTH) && op != '?')
ADDRLP4 12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $164
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 63
EQI4 $164
line 419
;419:                FAIL("*+ operand could be empty");
ADDRGP4 $166
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $159
JUMPV
LABELV $164
line 420
;420:        *flagp = (op != '+') ? (WORST|SPSTART) : (WORST|HASWIDTH);
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 43
EQI4 $168
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $168
ADDRLP4 24
CNSTI4 1
ASGNI4
LABELV $169
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
line 422
;421:
;422:        if (op == '*' && (flags&SIMPLE))
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $170
ADDRLP4 12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $170
line 423
;423:                reginsert(STAR, ret);
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 reginsert
CALLV
pop
ADDRGP4 $171
JUMPV
LABELV $170
line 424
;424:        else if (op == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $172
line 426
;425:                /* Emit x* as (x&|), where & means "self". */
;426:                reginsert(BRANCH, ret);                        /* Either x */
CNSTI4 6
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 reginsert
CALLV
pop
line 427
;427:                regoptail(ret, regnode(BACK));                /* and loop */
CNSTI4 7
ARGI4
ADDRLP4 28
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 regoptail
CALLV
pop
line 428
;428:                regoptail(ret, ret);                        /* back */
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 regoptail
CALLV
pop
line 429
;429:                regtail(ret, regnode(BRANCH));                /* or */
CNSTI4 6
ARGI4
ADDRLP4 36
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 430
;430:                regtail(ret, regnode(NOTHING));                /* null. */
CNSTI4 9
ARGI4
ADDRLP4 40
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 431
;431:        } else if (op == '+' && (flags&SIMPLE))
ADDRGP4 $173
JUMPV
LABELV $172
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 43
NEI4 $174
ADDRLP4 12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $174
line 432
;432:                reginsert(PLUS, ret);
CNSTI4 11
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 reginsert
CALLV
pop
ADDRGP4 $175
JUMPV
LABELV $174
line 433
;433:        else if (op == '+') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 43
NEI4 $176
line 435
;434:                /* Emit x+ as x(&|), where & means "self". */
;435:                next = regnode(BRANCH);                        /* Either */
CNSTI4 6
ARGI4
ADDRLP4 28
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 436
;436:                regtail(ret, next);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 437
;437:                regtail(regnode(BACK), ret);                /* loop back */
CNSTI4 7
ARGI4
ADDRLP4 32
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 438
;438:                regtail(next, regnode(BRANCH));                /* or */
CNSTI4 6
ARGI4
ADDRLP4 36
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 439
;439:                regtail(ret, regnode(NOTHING));                /* null. */
CNSTI4 9
ARGI4
ADDRLP4 40
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 440
;440:        } else if (op == '?') {
ADDRGP4 $177
JUMPV
LABELV $176
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 63
NEI4 $178
line 442
;441:                /* Emit x? as (x|) */
;442:                reginsert(BRANCH, ret);                        /* Either x */
CNSTI4 6
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 reginsert
CALLV
pop
line 443
;443:                regtail(ret, regnode(BRANCH));                /* or */
CNSTI4 6
ARGI4
ADDRLP4 28
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 444
;444:                next = regnode(NOTHING);                /* null. */
CNSTI4 9
ARGI4
ADDRLP4 32
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 445
;445:                regtail(ret, next);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 446
;446:                regoptail(ret, next);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 regoptail
CALLV
pop
line 447
;447:        }
LABELV $178
LABELV $177
LABELV $175
LABELV $173
LABELV $171
line 448
;448:        regparse++;
ADDRLP4 28
ADDRGP4 regparse
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 449
;449:        if (ISMULT(*regparse))
ADDRLP4 32
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 42
EQI4 $183
ADDRLP4 32
INDIRI4
CNSTI4 43
EQI4 $183
ADDRLP4 32
INDIRI4
CNSTI4 63
NEI4 $180
LABELV $183
line 450
;450:                FAIL("nested *?+");
ADDRGP4 $184
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $159
JUMPV
LABELV $180
line 452
;451:
;452:        return(ret);
ADDRLP4 0
INDIRP4
RETP4
LABELV $159
endproc regpiece 44 8
proc regatom 128 8
line 466
;453:}
;454:
;455:/*
;456: - regatom - the lowest level
;457: *
;458: * Optimization:  gobbles an entire sequence of ordinary characters so that
;459: * it can turn them into a single node, which is smaller to store and
;460: * faster to run.  Backslashed characters are exceptions, each becoming a
;461: * separate node; the code is simpler that way and it's not worth fixing.
;462: */
;463:static char *
;464:regatom(flagp)
;465:int *flagp;
;466:{
line 470
;467:        register char *ret;
;468:        int flags;
;469:
;470:        *flagp = WORST;                /* Tentatively. */
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 472
;471:
;472:        switch (*regparse++) {
ADDRLP4 16
ADDRGP4 regparse
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
CNSTI4 63
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $222
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $242
LABELV $241
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $220
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $186
LABELV $243
ADDRLP4 8
INDIRI4
CNSTI4 36
LTI4 $186
ADDRLP4 8
INDIRI4
CNSTI4 46
GTI4 $186
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $244-144
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $244
address $190
address $186
address $186
address $186
address $217
address $220
address $222
address $222
address $186
address $186
address $191
code
LABELV $242
ADDRLP4 44
CNSTI4 91
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $192
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $224
ADDRLP4 8
INDIRI4
CNSTI4 94
EQI4 $189
ADDRLP4 8
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $186
LABELV $246
ADDRLP4 8
INDIRI4
CNSTI4 124
EQI4 $220
ADDRGP4 $186
JUMPV
LABELV $189
line 474
;473:        case '^':
;474:                ret = regnode(BOL);
CNSTI4 1
ARGI4
ADDRLP4 48
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 475
;475:                break;
ADDRGP4 $187
JUMPV
LABELV $190
line 477
;476:        case '$':
;477:                ret = regnode(EOL);
CNSTI4 2
ARGI4
ADDRLP4 52
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 478
;478:                break;
ADDRGP4 $187
JUMPV
LABELV $191
line 480
;479:        case '.':
;480:                ret = regnode(ANY);
CNSTI4 3
ARGI4
ADDRLP4 56
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 481
;481:                *flagp |= HASWIDTH|SIMPLE;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 482
;482:                break;
ADDRGP4 $187
JUMPV
LABELV $192
line 483
;483:        case '[': {
line 487
;484:                        register int class;
;485:                        register int classend;
;486:
;487:                        if (*regparse == '^') {        /* Complement of range. */
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $193
line 488
;488:                                ret = regnode(ANYBUT);
CNSTI4 5
ARGI4
ADDRLP4 72
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
line 489
;489:                                regparse++;
ADDRLP4 76
ADDRGP4 regparse
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 490
;490:                        } else
ADDRGP4 $194
JUMPV
LABELV $193
line 491
;491:                                ret = regnode(ANYOF);
CNSTI4 4
ARGI4
ADDRLP4 72
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
LABELV $194
line 492
;492:                        if (*regparse == ']' || *regparse == '-')
ADDRLP4 76
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 93
EQI4 $197
ADDRLP4 76
INDIRI4
CNSTI4 45
NEI4 $199
LABELV $197
line 493
;493:                                regc(*regparse++);
ADDRLP4 84
ADDRGP4 regparse
ASGNP4
ADDRLP4 80
ADDRLP4 84
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 80
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 regc
CALLV
pop
ADDRGP4 $199
JUMPV
LABELV $198
line 494
;494:                        while (*regparse != '\0' && *regparse != ']') {
line 495
;495:                                if (*regparse == '-') {
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $201
line 496
;496:                                        regparse++;
ADDRLP4 88
ADDRGP4 regparse
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 497
;497:                                        if (*regparse == ']' || *regparse == '\0')
ADDRLP4 92
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 93
EQI4 $205
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $203
LABELV $205
line 498
;498:                                                regc('-');
CNSTI4 45
ARGI4
ADDRGP4 regc
CALLV
pop
ADDRGP4 $202
JUMPV
LABELV $203
line 499
;499:                                        else {
line 500
;500:                                                class = UCHARAT(regparse-2)+1;
ADDRLP4 64
ADDRGP4 regparse
INDIRP4
CNSTI4 -2
ADDP4
INDIRU1
CVUI4 1
CNSTI4 1
ADDI4
ASGNI4
line 501
;501:                                                classend = UCHARAT(regparse);
ADDRLP4 68
ADDRGP4 regparse
INDIRP4
INDIRU1
CVUI4 1
ASGNI4
line 502
;502:                                                if (class > classend+1)
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
LEI4 $212
line 503
;503:                                                        FAIL("invalid [] range");
ADDRGP4 $208
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $185
JUMPV
line 504
;504:                                                for (; class <= classend; class++)
LABELV $209
line 505
;505:                                                        regc(class);
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 regc
CALLV
pop
LABELV $210
line 504
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $212
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $209
line 506
;506:                                                regparse++;
ADDRLP4 96
ADDRGP4 regparse
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 507
;507:                                        }
line 508
;508:                                } else
ADDRGP4 $202
JUMPV
LABELV $201
line 509
;509:                                        regc(*regparse++);
ADDRLP4 92
ADDRGP4 regparse
ASGNP4
ADDRLP4 88
ADDRLP4 92
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 88
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 regc
CALLV
pop
LABELV $202
line 510
;510:                        }
LABELV $199
line 494
ADDRLP4 88
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $213
ADDRLP4 88
INDIRI4
CNSTI4 93
NEI4 $198
LABELV $213
line 511
;511:                        regc('\0');
CNSTI4 0
ARGI4
ADDRGP4 regc
CALLV
pop
line 512
;512:                        if (*regparse != ']')
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
CNSTI4 93
EQI4 $214
line 513
;513:                                FAIL("unmatched []");
ADDRGP4 $216
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $185
JUMPV
LABELV $214
line 514
;514:                        regparse++;
ADDRLP4 92
ADDRGP4 regparse
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 515
;515:                        *flagp |= HASWIDTH|SIMPLE;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 516
;516:                }
line 517
;517:                break;
ADDRGP4 $187
JUMPV
LABELV $217
line 519
;518:        case '(':
;519:                ret = reg(1, &flags);
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 reg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 64
INDIRP4
ASGNP4
line 520
;520:                if (ret == NULL)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $218
line 521
;521:                        return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $185
JUMPV
LABELV $218
line 522
;522:                *flagp |= flags&(HASWIDTH|SPSTART);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 5
BANDI4
BORI4
ASGNI4
line 523
;523:                break;
ADDRGP4 $187
JUMPV
LABELV $220
line 527
;524:        case '\0':
;525:        case '|':
;526:        case ')':
;527:                FAIL("internal urp");        /* Supposed to be caught earlier. */
ADDRGP4 $221
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $185
JUMPV
line 528
;528:                break;
LABELV $222
line 532
;529:        case '?':
;530:        case '+':
;531:        case '*':
;532:                FAIL("?+* follows nothing");
ADDRGP4 $223
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $185
JUMPV
line 533
;533:                break;
LABELV $224
line 535
;534:        case '\\':
;535:                if (*regparse == '\0')
ADDRGP4 regparse
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $225
line 536
;536:                        FAIL("trailing \\");
ADDRGP4 $227
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $185
JUMPV
LABELV $225
line 537
;537:                ret = regnode(EXACTLY);
CNSTI4 8
ARGI4
ADDRLP4 72
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
line 538
;538:                regc(*regparse++);
ADDRLP4 80
ADDRGP4 regparse
ASGNP4
ADDRLP4 76
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 76
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 regc
CALLV
pop
line 539
;539:                regc('\0');
CNSTI4 0
ARGI4
ADDRGP4 regc
CALLV
pop
line 540
;540:                *flagp |= HASWIDTH|SIMPLE;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 541
;541:                break;
ADDRGP4 $187
JUMPV
LABELV $186
line 542
;542:        default: {
line 546
;543:                        register int len;
;544:                        register char ender;
;545:
;546:                        regparse--;
ADDRLP4 96
ADDRGP4 regparse
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 547
;547:                        len = strcspn(regparse, META);
ADDRGP4 regparse
INDIRP4
ARGP4
ADDRGP4 $228
ARGP4
ADDRLP4 100
ADDRGP4 strcspn
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 100
INDIRI4
ASGNI4
line 548
;548:                        if (len <= 0)
ADDRLP4 88
INDIRI4
CNSTI4 0
GTI4 $229
line 549
;549:                                FAIL("internal disaster");
ADDRGP4 $231
ARGP4
ADDRGP4 regerror
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $185
JUMPV
LABELV $229
line 550
;550:                        ender = *(regparse+len);
ADDRLP4 92
ADDRLP4 88
INDIRI4
ADDRGP4 regparse
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 551
;551:                        if (len > 1 && ISMULT(ender))
ADDRLP4 88
INDIRI4
CNSTI4 1
LEI4 $232
ADDRLP4 104
ADDRLP4 92
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 42
EQI4 $235
ADDRLP4 104
INDIRI4
CNSTI4 43
EQI4 $235
ADDRLP4 104
INDIRI4
CNSTI4 63
NEI4 $232
LABELV $235
line 552
;552:                                len--;                /* Back off clear of ?+* operand. */
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $232
line 553
;553:                        *flagp |= HASWIDTH;
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 554
;554:                        if (len == 1)
ADDRLP4 88
INDIRI4
CNSTI4 1
NEI4 $236
line 555
;555:                                *flagp |= SIMPLE;
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $236
line 556
;556:                        ret = regnode(EXACTLY);
CNSTI4 8
ARGI4
ADDRLP4 116
ADDRGP4 regnode
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
ADDRGP4 $239
JUMPV
LABELV $238
line 557
;557:                        while (len > 0) {
line 558
;558:                                regc(*regparse++);
ADDRLP4 124
ADDRGP4 regparse
ASGNP4
ADDRLP4 120
ADDRLP4 124
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 120
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 regc
CALLV
pop
line 559
;559:                                len--;
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 560
;560:                        }
LABELV $239
line 557
ADDRLP4 88
INDIRI4
CNSTI4 0
GTI4 $238
line 561
;561:                        regc('\0');
CNSTI4 0
ARGI4
ADDRGP4 regc
CALLV
pop
line 562
;562:                }
line 563
;563:                break;
LABELV $187
line 566
;564:        }
;565:
;566:        return(ret);
ADDRLP4 0
INDIRP4
RETP4
LABELV $185
endproc regatom 128 8
proc regnode 20 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 575
;567:}
;568:
;569:/*
;570: - regnode - emit a node
;571: */
;572:static char *                   /* Location. */
;573:regnode(op)
;574:char op;
;575:{
line 579
;576:        register char *ret;
;577:        register char *ptr;
;578:
;579:        ret = regcode;
ADDRLP4 0
ADDRGP4 regcode
INDIRP4
ASGNP4
line 580
;580:        if (ret == &regdummy) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 regdummy
CVPU4 4
NEU4 $248
line 581
;581:                regsize += 3;
ADDRLP4 8
ADDRGP4 regsize
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 582
;582:                return(ret);
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $247
JUMPV
LABELV $248
line 585
;583:        }
;584:
;585:        ptr = ret;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 586
;586:        *ptr++ = op;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRFP4 0
INDIRI1
ASGNI1
line 587
;587:        *ptr++ = '\0';                /* Null "next" pointer. */
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 588
;588:        *ptr++ = '\0';
ADDRLP4 16
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI1 0
ASGNI1
line 589
;589:        regcode = ptr;
ADDRGP4 regcode
ADDRLP4 4
INDIRP4
ASGNP4
line 591
;590:
;591:        return(ret);
ADDRLP4 0
INDIRP4
RETP4
LABELV $247
endproc regnode 20 0
proc regc 12 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 600
;592:}
;593:
;594:/*
;595: - regc - emit (if appropriate) a byte of code
;596: */
;597:static void
;598:regc(b)
;599:char b;
;600:{
line 601
;601:        if (regcode != &regdummy)
ADDRGP4 regcode
INDIRP4
CVPU4 4
ADDRGP4 regdummy
CVPU4 4
EQU4 $251
line 602
;602:                *regcode++ = b;
ADDRLP4 4
ADDRGP4 regcode
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRI1
ASGNI1
ADDRGP4 $252
JUMPV
LABELV $251
line 604
;603:        else
;604:                regsize++;
ADDRLP4 8
ADDRGP4 regsize
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $252
line 605
;605:}
LABELV $250
endproc regc 12 0
proc reginsert 40 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 616
;606:
;607:/*
;608: - reginsert - insert an operator in front of already-emitted operand
;609: *
;610: * Means relocating the operand.
;611: */
;612:static void
;613:reginsert(op, opnd)
;614:char op;
;615:char *opnd;
;616:{
line 621
;617:        register char *src;
;618:        register char *dst;
;619:        register char *place;
;620:
;621:        if (regcode == &regdummy) {
ADDRGP4 regcode
INDIRP4
CVPU4 4
ADDRGP4 regdummy
CVPU4 4
NEU4 $254
line 622
;622:                regsize += 3;
ADDRLP4 12
ADDRGP4 regsize
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 623
;623:                return;
ADDRGP4 $253
JUMPV
LABELV $254
line 626
;624:        }
;625:
;626:        src = regcode;
ADDRLP4 0
ADDRGP4 regcode
INDIRP4
ASGNP4
line 627
;627:        regcode += 3;
ADDRLP4 12
ADDRGP4 regcode
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 3
ADDP4
ASGNP4
line 628
;628:        dst = regcode;
ADDRLP4 4
ADDRGP4 regcode
INDIRP4
ASGNP4
ADDRGP4 $257
JUMPV
LABELV $256
line 630
;629:        while (src > opnd)
;630:                *--dst = *--src;
ADDRLP4 16
CNSTI4 -1
ASGNI4
ADDRLP4 20
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI1
ASGNI1
LABELV $257
line 629
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
GTU4 $256
line 632
;631:
;632:        place = opnd;                /* Op node, where operand used to be. */
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
line 633
;633:        *place++ = op;
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
ADDRFP4 0
INDIRI1
ASGNI1
line 634
;634:        *place++ = '\0';
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 0
ASGNI1
line 635
;635:        *place++ = '\0';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 0
ASGNI1
line 636
;636:}
LABELV $253
endproc reginsert 40 0
proc regtail 16 4
line 645
;637:
;638:/*
;639: - regtail - set the next-pointer at the end of a node chain
;640: */
;641:static void
;642:regtail(p, val)
;643:char *p;
;644:char *val;
;645:{
line 650
;646:        register char *scan;
;647:        register char *temp;
;648:        register int offset;
;649:
;650:        if (p == &regdummy)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 regdummy
CVPU4 4
NEU4 $260
line 651
;651:                return;
ADDRGP4 $259
JUMPV
LABELV $260
line 654
;652:
;653:        /* Find last node. */
;654:        scan = p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 655
;655:        for (;;) {
LABELV $262
line 656
;656:                temp = regnext(scan);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 regnext
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 657
;657:                if (temp == NULL)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $266
line 658
;658:                        break;
ADDRGP4 $264
JUMPV
LABELV $266
line 659
;659:                scan = temp;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 660
;660:        }
line 655
ADDRGP4 $262
JUMPV
LABELV $264
line 662
;661:
;662:        if (OP(scan) == BACK)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 7
NEI4 $268
line 663
;663:                offset = scan - val;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
ADDRGP4 $269
JUMPV
LABELV $268
line 665
;664:        else
;665:                offset = val - scan;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
LABELV $269
line 666
;666:        *(scan+1) = (offset>>8)&0377;
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 667
;667:        *(scan+2) = offset&0377;
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 668
;668:}
LABELV $259
endproc regtail 16 4
proc regoptail 8 8
line 677
;669:
;670:/*
;671: - regoptail - regtail on operand of first argument; nop if operandless
;672: */
;673:static void
;674:regoptail(p, val)
;675:char *p;
;676:char *val;
;677:{
line 679
;678:        /* "Operandless" and "op != BRANCH" are synonymous in practice. */
;679:        if (p == NULL || p == &regdummy || OP(p) != BRANCH)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 4
INDIRU4
CNSTU4 0
EQU4 $274
ADDRLP4 4
INDIRU4
ADDRGP4 regdummy
CVPU4 4
EQU4 $274
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 6
EQI4 $271
LABELV $274
line 680
;680:                return;
ADDRGP4 $270
JUMPV
LABELV $271
line 681
;681:        regtail(OPERAND(p), val);
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 regtail
CALLV
pop
line 682
;682:}
LABELV $270
endproc regoptail 8 8
export regexec
proc regexec 20 12
line 716
;683:
;684:/*
;685: * regexec and friends
;686: */
;687:
;688:/*
;689: * Global work variables for regexec().
;690: */
;691:static char *reginput;          /* String-input pointer. */
;692:static char *regbol;            /* Beginning of input, for ^ check. */
;693:static char **regstartp;        /* Pointer to startp array. */
;694:static char **regendp;          /* Ditto for endp. */
;695:
;696:/*
;697: * Forwards.
;698: */
;699:STATIC int regtry();
;700:STATIC int regmatch();
;701:STATIC int regrepeat();
;702:
;703:#ifdef DEBUG
;704:int regnarrate = 0;
;705:void regdump();
;706:STATIC char *regprop();
;707:#endif
;708:
;709:/*
;710: - regexec - match a regexp against a string
;711: */
;712:int
;713:regexec(prog, string)
;714:register regexp *prog;
;715:register char *string;
;716:{
line 721
;717:        register char *s;
;718:        extern char *strchr();
;719:
;720:        /* Be paranoid... */
;721:        if (prog == NULL || string == NULL) {
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $278
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $276
LABELV $278
line 722
;722:                regerror("NULL parameter");
ADDRGP4 $279
ARGP4
ADDRGP4 regerror
CALLV
pop
line 723
;723:                return(0);
CNSTI4 0
RETI4
ADDRGP4 $275
JUMPV
LABELV $276
line 727
;724:        }
;725:
;726:        /* Check validity of program. */
;727:        if (UCHARAT(prog->program) != MAGIC) {
ADDRFP4 0
INDIRP4
CNSTI4 2652
ADDP4
INDIRU1
CVUI4 1
CNSTI4 156
EQI4 $280
line 728
;728:                regerror("corrupted program");
ADDRGP4 $282
ARGP4
ADDRGP4 regerror
CALLV
pop
line 729
;729:                return(0);
CNSTI4 0
RETI4
ADDRGP4 $275
JUMPV
LABELV $280
line 734
;730:        }
;731:
;732:		
;733:        /* If there is a "must appear" string, look for it. */
;734:        if (prog->regmust != NULL) {
ADDRFP4 0
INDIRP4
CNSTI4 2644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $283
line 735
;735:                s = string;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $286
JUMPV
LABELV $285
line 736
;736:                while ((s = strchr(s, prog->regmust[0])) != NULL) {
line 737
;737:                        if (Q_strncmp(s, prog->regmust, prog->regmlen) == 0)
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 2644
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 2648
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $288
line 738
;738:                                break;        /* Found it. */
ADDRGP4 $287
JUMPV
LABELV $288
line 739
;739:                        s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 740
;740:                }
LABELV $286
line 736
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2644
ADDP4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $285
LABELV $287
line 741
;741:                if (s == NULL)        /* Not present. */
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $290
line 742
;742:                        return(0);
CNSTI4 0
RETI4
ADDRGP4 $275
JUMPV
LABELV $290
line 743
;743:        }
LABELV $283
line 746
;744:
;745:        /* Mark beginning of line for ^ . */
;746:        regbol = string;
ADDRGP4 regbol
ADDRFP4 4
INDIRP4
ASGNP4
line 749
;747:
;748:        /* Simplest case:  anchored match need be tried only once. */
;749:        if (prog->reganch)
ADDRFP4 0
INDIRP4
CNSTI4 2641
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $292
line 750
;750:                return(regtry(prog, string));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 regtry
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $292
line 753
;751:
;752:        /* Messy cases:  unanchored match. */
;753:        s = string;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 754
;754:        if (prog->regstart != '\0')
ADDRFP4 0
INDIRP4
CNSTI4 2640
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $294
ADDRGP4 $297
JUMPV
LABELV $296
line 756
;755:                /* We know what char it must start with. */
;756:                while ((s = strchr(s, prog->regstart)) != NULL) {
line 757
;757:                        if (regtry(prog, s))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 regtry
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $299
line 758
;758:                                return(1);
CNSTI4 1
RETI4
ADDRGP4 $275
JUMPV
LABELV $299
line 759
;759:                        s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 760
;760:                }
LABELV $297
line 756
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2640
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $296
ADDRGP4 $295
JUMPV
LABELV $294
LABELV $301
line 763
;761:        else
;762:                /* We don't -- general case. */
;763:                do {
line 764
;764:                        if (regtry(prog, s))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 regtry
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $304
line 765
;765:                                return(1);
CNSTI4 1
RETI4
ADDRGP4 $275
JUMPV
LABELV $304
line 766
;766:                } while (*s++ != '\0');
LABELV $302
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $301
LABELV $295
line 769
;767:
;768:        /* Failure. */
;769:        return(0);
CNSTI4 0
RETI4
LABELV $275
endproc regexec 20 12
proc regtry 20 4
line 779
;770:}
;771:
;772:/*
;773: - regtry - try match at specific point
;774: */
;775:static int                      /* 0 failure, 1 success */
;776:regtry(prog, string)
;777:regexp *prog;
;778:char *string;
;779:{
line 784
;780:        register int i;
;781:        register char **sp;
;782:        register char **ep;
;783:
;784:        reginput = string;
ADDRGP4 reginput
ADDRFP4 4
INDIRP4
ASGNP4
line 785
;785:        regstartp = prog->startp;
ADDRGP4 regstartp
ADDRFP4 0
INDIRP4
ASGNP4
line 786
;786:        regendp = prog->endp;
ADDRGP4 regendp
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
line 788
;787:
;788:        sp = prog->startp;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 789
;789:        ep = prog->endp;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
line 790
;790:        for (i = NSUBEXP; i > 0; i--) {
ADDRLP4 0
CNSTI4 10
ASGNI4
LABELV $307
line 791
;791:                *sp++ = NULL;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTP4 0
ASGNP4
line 792
;792:                *ep++ = NULL;
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTP4 0
ASGNP4
line 793
;793:        }
LABELV $308
line 790
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $307
line 794
;794:        if (regmatch(prog->program + 1)) {
ADDRFP4 0
INDIRP4
CNSTI4 2653
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 regmatch
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $311
line 795
;795:                prog->startp[0] = string;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 796
;796:                prog->endp[0] = reginput;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRGP4 reginput
INDIRP4
ASGNP4
line 797
;797:                return(1);
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $311
line 799
;798:        } else
;799:                return(0);
CNSTI4 0
RETI4
LABELV $306
endproc regtry 20 4
proc regmatch 80 12
line 815
;800:}
;801:
;802:/*
;803: - regmatch - main matching routine
;804: *
;805: * Conceptually the strategy is simple:  check to see whether the current
;806: * node matches, call self recursively to see whether the rest matches,
;807: * and then act accordingly.  In practice we make some effort to avoid
;808: * recursion, in particular by going through "ordinary" nodes (that don't
;809: * need to know whether the rest of the match failed) by a loop instead of
;810: * by recursion.
;811: */
;812:static int                      /* 0 failure, 1 success */
;813:regmatch(prog)
;814:char *prog;
;815:{
line 820
;816:        register char *scan;        /* Current node. */
;817:        char *next;                /* Next node. */
;818:        extern char *strchr();
;819:
;820:        scan = prog;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $315
JUMPV
LABELV $314
line 825
;821:#ifdef DEBUG
;822:        if (scan != NULL && regnarrate)
;823:                fprintf(stderr, "%s(\n", regprop(scan));
;824:#endif
;825:        while (scan != NULL) {
line 830
;826:#ifdef DEBUG
;827:                if (regnarrate)
;828:                        fprintf(stderr, "%s...\n", regprop(scan));
;829:#endif
;830:                next = regnext(scan);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 regnext
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 832
;831:
;832:                switch (OP(scan)) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $317
ADDRLP4 12
INDIRI4
CNSTI4 39
GTI4 $317
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $379
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $379
address $377
address $320
address $323
address $326
address $334
address $338
address $354
address $318
address $329
address $318
address $363
address $363
address $317
address $317
address $317
address $317
address $317
address $317
address $317
address $317
address $317
address $344
address $344
address $344
address $344
address $344
address $344
address $344
address $344
address $344
address $317
address $349
address $349
address $349
address $349
address $349
address $349
address $349
address $349
address $349
code
LABELV $320
line 834
;833:                case BOL:
;834:                        if (reginput != regbol)
ADDRGP4 reginput
INDIRP4
CVPU4 4
ADDRGP4 regbol
INDIRP4
CVPU4 4
EQU4 $318
line 835
;835:                                return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
line 836
;836:                        break;
LABELV $323
line 838
;837:                case EOL:
;838:                        if (*reginput != '\0')
ADDRGP4 reginput
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $318
line 839
;839:                                return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
line 840
;840:                        break;
LABELV $326
line 842
;841:                case ANY:
;842:                        if (*reginput == '\0')
ADDRGP4 reginput
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $327
line 843
;843:                                return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
LABELV $327
line 844
;844:                        reginput++;
ADDRLP4 20
ADDRGP4 reginput
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 845
;845:                        break;
ADDRGP4 $318
JUMPV
LABELV $329
line 846
;846:                case EXACTLY: {
line 850
;847:                                register int len;
;848:                                register char *opnd;
;849:
;850:                                opnd = OPERAND(scan);
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
ASGNP4
line 852
;851:                                /* Inline the first character, for speed. */
;852:                                if (*opnd != *reginput)
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRGP4 reginput
INDIRP4
INDIRI1
CVII4 1
EQI4 $330
line 853
;853:                                        return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
LABELV $330
line 854
;854:                                len = strlen(opnd);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
ASGNI4
line 855
;855:                                if (len > 1 && Q_strncmp(opnd, reginput, len) != 0)
ADDRLP4 24
INDIRI4
CNSTI4 1
LEI4 $332
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 reginput
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $332
line 856
;856:                                        return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
LABELV $332
line 857
;857:                                reginput += len;
ADDRLP4 44
ADDRGP4 reginput
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 24
INDIRI4
ADDRLP4 44
INDIRP4
INDIRP4
ADDP4
ASGNP4
line 858
;858:                        }
line 859
;859:                        break;
ADDRGP4 $318
JUMPV
LABELV $334
line 861
;860:                case ANYOF:
;861:                        if (*reginput == '\0' || strchr(OPERAND(scan), *reginput) == NULL)
ADDRLP4 24
ADDRGP4 reginput
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $337
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $335
LABELV $337
line 862
;862:                                return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
LABELV $335
line 863
;863:                        reginput++;
ADDRLP4 32
ADDRGP4 reginput
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 864
;864:                        break;
ADDRGP4 $318
JUMPV
LABELV $338
line 866
;865:                case ANYBUT:
;866:                        if (*reginput == '\0' || strchr(OPERAND(scan), *reginput) != NULL)
ADDRLP4 36
ADDRGP4 reginput
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $341
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $339
LABELV $341
line 867
;867:                                return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
LABELV $339
line 868
;868:                        reginput++;
ADDRLP4 44
ADDRGP4 reginput
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 869
;869:                        break;
ADDRGP4 $318
JUMPV
line 871
;870:                case NOTHING:
;871:                        break;
line 873
;872:                case BACK:
;873:                        break;
LABELV $344
line 882
;874:                case OPEN+1:
;875:                case OPEN+2:
;876:                case OPEN+3:
;877:                case OPEN+4:
;878:                case OPEN+5:
;879:                case OPEN+6:
;880:                case OPEN+7:
;881:                case OPEN+8:
;882:                case OPEN+9: {
line 886
;883:                                register int no;
;884:                                register char *save;
;885:
;886:                                no = OP(scan) - OPEN;
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 20
SUBI4
ASGNI4
line 887
;887:                                save = reginput;
ADDRLP4 52
ADDRGP4 reginput
INDIRP4
ASGNP4
line 889
;888:
;889:                                if (regmatch(next)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 regmatch
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $345
line 895
;890:                                        /*
;891:                                         * Don't set startp if some later
;892:                                         * invocation of the same parentheses
;893:                                         * already has.
;894:                                         */
;895:                                        if (regstartp[no] == NULL)
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 regstartp
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 896
;896:                                                regstartp[no] = save;
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 regstartp
INDIRP4
ADDP4
ADDRLP4 52
INDIRP4
ASGNP4
LABELV $347
line 897
;897:                                        return(1);
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
LABELV $345
line 899
;898:                                } else
;899:                                        return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
line 901
;900:                        }
;901:                        break;
LABELV $349
line 910
;902:                case CLOSE+1:
;903:                case CLOSE+2:
;904:                case CLOSE+3:
;905:                case CLOSE+4:
;906:                case CLOSE+5:
;907:                case CLOSE+6:
;908:                case CLOSE+7:
;909:                case CLOSE+8:
;910:                case CLOSE+9: {
line 914
;911:                                register int no;
;912:                                register char *save;
;913:
;914:                                no = OP(scan) - CLOSE;
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 30
SUBI4
ASGNI4
line 915
;915:                                save = reginput;
ADDRLP4 52
ADDRGP4 reginput
INDIRP4
ASGNP4
line 917
;916:
;917:                                if (regmatch(next)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 regmatch
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $350
line 923
;918:                                        /*
;919:                                         * Don't set endp if some later
;920:                                         * invocation of the same parentheses
;921:                                         * already has.
;922:                                         */
;923:                                        if (regendp[no] == NULL)
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 regendp
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $352
line 924
;924:                                                regendp[no] = save;
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 regendp
INDIRP4
ADDP4
ADDRLP4 52
INDIRP4
ASGNP4
LABELV $352
line 925
;925:                                        return(1);
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
LABELV $350
line 927
;926:                                } else
;927:                                        return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
line 929
;928:                        }
;929:                        break;
LABELV $354
line 930
;930:                case BRANCH: {
line 933
;931:                                register char *save;
;932:
;933:                                if (OP(next) != BRANCH)                /* No choice. */
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 6
EQI4 $355
line 934
;934:                                        next = OPERAND(scan);        /* Avoid recursion. */
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
ASGNP4
ADDRGP4 $318
JUMPV
LABELV $355
line 935
;935:                                else {
LABELV $357
line 936
;936:                                        do {
line 937
;937:                                                save = reginput;
ADDRLP4 48
ADDRGP4 reginput
INDIRP4
ASGNP4
line 938
;938:                                                if (regmatch(OPERAND(scan)))
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 regmatch
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $360
line 939
;939:                                                        return(1);
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
LABELV $360
line 940
;940:                                                reginput = save;
ADDRGP4 reginput
ADDRLP4 48
INDIRP4
ASGNP4
line 941
;941:                                                scan = regnext(scan);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 regnext
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 942
;942:                                        } while (scan != NULL && OP(scan) == BRANCH);
LABELV $358
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $362
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 6
EQI4 $357
LABELV $362
line 943
;943:                                        return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
line 946
;944:                                        /* NOTREACHED */
;945:                                }
;946:                        }
line 947
;947:                        break;
LABELV $363
line 949
;948:                case STAR:
;949:                case PLUS: {
line 959
;950:                                register char nextch;
;951:                                register int no;
;952:                                register char *save;
;953:                                register int min;
;954:
;955:                                /*
;956:                                 * Lookahead to avoid useless match attempts
;957:                                 * when we know what character comes next.
;958:                                 */
;959:                                nextch = '\0';
ADDRLP4 48
CNSTI1 0
ASGNI1
line 960
;960:                                if (OP(next) == EXACTLY)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 8
NEI4 $364
line 961
;961:                                        nextch = *OPERAND(next);
ADDRLP4 48
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
ASGNI1
LABELV $364
line 962
;962:                                min = (OP(scan) == STAR) ? 0 : 1;
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $367
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $368
JUMPV
LABELV $367
ADDRLP4 64
CNSTI4 1
ASGNI4
LABELV $368
ADDRLP4 60
ADDRLP4 64
INDIRI4
ASGNI4
line 963
;963:                                save = reginput;
ADDRLP4 56
ADDRGP4 reginput
INDIRP4
ASGNP4
line 964
;964:                                no = regrepeat(OPERAND(scan));
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 regrepeat
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 68
INDIRI4
ASGNI4
ADDRGP4 $370
JUMPV
LABELV $369
line 965
;965:                                while (no >= min) {
line 967
;966:                                        /* If it could work, try it. */
;967:                                        if (nextch == '\0' || *reginput == nextch)
ADDRLP4 72
ADDRLP4 48
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $374
ADDRGP4 reginput
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 72
INDIRI4
NEI4 $372
LABELV $374
line 968
;968:                                                if (regmatch(next))
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 regmatch
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $375
line 969
;969:                                                        return(1);
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
LABELV $375
LABELV $372
line 971
;970:                                        /* Couldn't or didn't -- back up. */
;971:                                        no--;
ADDRLP4 52
ADDRLP4 52
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 972
;972:                                        reginput = save + no;
ADDRGP4 reginput
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRP4
ADDP4
ASGNP4
line 973
;973:                                }
LABELV $370
line 965
ADDRLP4 52
INDIRI4
ADDRLP4 60
INDIRI4
GEI4 $369
line 974
;974:                                return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
line 976
;975:                        }
;976:                        break;
LABELV $377
line 978
;977:                case END:
;978:                        return(1);        /* Success! */
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
line 979
;979:                        break;
LABELV $317
line 981
;980:                default:
;981:                        regerror("memory corruption");
ADDRGP4 $378
ARGP4
ADDRGP4 regerror
CALLV
pop
line 982
;982:                        return(0);
CNSTI4 0
RETI4
ADDRGP4 $313
JUMPV
line 983
;983:                        break;
LABELV $318
line 986
;984:                }
;985:
;986:                scan = next;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 987
;987:        }
LABELV $315
line 825
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $314
line 993
;988:
;989:        /*
;990:         * We get here only if there's trouble -- normally "case END" is
;991:         * the terminating point.
;992:         */
;993:        regerror("corrupted pointers");
ADDRGP4 $380
ARGP4
ADDRGP4 regerror
CALLV
pop
line 994
;994:        return(0);
CNSTI4 0
RETI4
LABELV $313
endproc regmatch 80 12
proc regrepeat 40 8
line 1003
;995:}
;996:
;997:/*
;998: - regrepeat - repeatedly match something simple, report how many
;999: */
;1000:static int
;1001:regrepeat(p)
;1002:char *p;
;1003:{
line 1004
;1004:        register int count = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1008
;1005:        register char *scan;
;1006:        register char *opnd;
;1007:
;1008:        scan = reginput;
ADDRLP4 4
ADDRGP4 reginput
INDIRP4
ASGNP4
line 1009
;1009:        opnd = OPERAND(p);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
ASGNP4
line 1010
;1010:        switch (OP(p)) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
LTI4 $382
ADDRLP4 12
INDIRI4
CNSTI4 8
GTI4 $382
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $401-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $401
address $385
address $392
address $397
address $382
address $382
address $388
code
LABELV $385
line 1012
;1011:        case ANY:
;1012:                count = strlen(scan);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 1013
;1013:                scan += count;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1014
;1014:                break;
ADDRGP4 $383
JUMPV
LABELV $387
line 1016
;1015:        case EXACTLY:
;1016:                while (*opnd == *scan) {
line 1017
;1017:                        count++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1018
;1018:                        scan++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1019
;1019:                }
LABELV $388
line 1016
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
EQI4 $387
line 1020
;1020:                break;
ADDRGP4 $383
JUMPV
LABELV $391
line 1022
;1021:        case ANYOF:
;1022:                while (*scan != '\0' && strchr(opnd, *scan) != NULL) {
line 1023
;1023:                        count++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1024
;1024:                        scan++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1025
;1025:                }
LABELV $392
line 1022
ADDRLP4 24
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $394
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $391
LABELV $394
line 1026
;1026:                break;
ADDRGP4 $383
JUMPV
LABELV $396
line 1028
;1027:        case ANYBUT:
;1028:                while (*scan != '\0' && strchr(opnd, *scan) == NULL) {
line 1029
;1029:                        count++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1030
;1030:                        scan++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1031
;1031:                }
LABELV $397
line 1028
ADDRLP4 32
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $399
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $396
LABELV $399
line 1032
;1032:                break;
ADDRGP4 $383
JUMPV
LABELV $382
line 1034
;1033:        default:                /* Oh dear.  Called inappropriately. */
;1034:                regerror("internal foulup");
ADDRGP4 $400
ARGP4
ADDRGP4 regerror
CALLV
pop
line 1035
;1035:                count = 0;        /* Best compromise. */
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1036
;1036:                break;
LABELV $383
line 1038
;1037:        }
;1038:        reginput = scan;
ADDRGP4 reginput
ADDRLP4 4
INDIRP4
ASGNP4
line 1040
;1039:
;1040:        return(count);
ADDRLP4 0
INDIRI4
RETI4
LABELV $381
endproc regrepeat 40 8
proc regnext 12 0
line 1049
;1041:}
;1042:
;1043:/*
;1044: - regnext - dig the "next" pointer out of a node
;1045: */
;1046:static char *
;1047:regnext(p)
;1048:register char *p;
;1049:{
line 1052
;1050:        register int offset;
;1051:
;1052:        if (p == &regdummy)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 regdummy
CVPU4 4
NEU4 $404
line 1053
;1053:                return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $403
JUMPV
LABELV $404
line 1055
;1054:
;1055:        offset = NEXT(p);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 255
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 8
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
BANDI4
ADDI4
ASGNI4
line 1056
;1056:        if (offset == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $406
line 1057
;1057:                return(NULL);
CNSTP4 0
RETP4
ADDRGP4 $403
JUMPV
LABELV $406
line 1059
;1058:
;1059:        if (OP(p) == BACK)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 7
NEI4 $408
line 1060
;1060:                return(p-offset);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
SUBP4
RETP4
ADDRGP4 $403
JUMPV
LABELV $408
line 1062
;1061:        else
;1062:                return(p+offset);
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
RETP4
LABELV $403
endproc regnext 12 0
proc strcspn 16 0
line 1213
;1063:}
;1064:
;1065:#ifdef DEBUG
;1066:
;1067:STATIC char *regprop();
;1068:
;1069:/*
;1070: - regdump - dump a regexp onto stdout in vaguely comprehensible form
;1071: */
;1072:void
;1073:regdump(r)
;1074:regexp *r;
;1075:{
;1076:        register char *s;
;1077:        register char op = EXACTLY;        /* Arbitrary non-END op. */
;1078:        register char *next;
;1079:        extern char *strchr();
;1080:
;1081:
;1082:        s = r->program + 1;
;1083:        while (op != END) {        /* While that wasn't END last time... */
;1084:                op = OP(s);
;1085:                printf("%2d%s", s-r->program, regprop(s));        /* Where, what. */
;1086:                next = regnext(s);
;1087:                if (next == NULL)                /* Next ptr. */
;1088:                        printf("(0)");
;1089:                else 
;1090:                        printf("(%d)", (s-r->program)+(next-s));
;1091:                s += 3;
;1092:                if (op == ANYOF || op == ANYBUT || op == EXACTLY) {
;1093:                        /* Literal string, where present. */
;1094:                        while (*s != '\0') {
;1095:                                putchar(*s);
;1096:                                s++;
;1097:                        }
;1098:                        s++;
;1099:                }
;1100:                putchar('\n');
;1101:        }
;1102:
;1103:        /* Header fields of interest. */
;1104:        if (r->regstart != '\0')
;1105:                printf("start `%c' ", r->regstart);
;1106:        if (r->reganch)
;1107:                printf("anchored ");
;1108:        if (r->regmust != NULL)
;1109:                printf("must have \"%s\"", r->regmust);
;1110:        printf("\n");
;1111:}
;1112:
;1113:/*
;1114: - regprop - printable representation of opcode
;1115: */
;1116:static char *
;1117:regprop(op)
;1118:char *op;
;1119:{
;1120:        register char *p;
;1121:        static char buf[50];
;1122:
;1123:        (void) strcpy(buf, ":");
;1124:
;1125:        switch (OP(op)) {
;1126:        case BOL:
;1127:                p = "BOL";
;1128:                break;
;1129:        case EOL:
;1130:                p = "EOL";
;1131:                break;
;1132:        case ANY:
;1133:                p = "ANY";
;1134:                break;
;1135:        case ANYOF:
;1136:                p = "ANYOF";
;1137:                break;
;1138:        case ANYBUT:
;1139:                p = "ANYBUT";
;1140:                break;
;1141:        case BRANCH:
;1142:                p = "BRANCH";
;1143:                break;
;1144:        case EXACTLY:
;1145:                p = "EXACTLY";
;1146:                break;
;1147:        case NOTHING:
;1148:                p = "NOTHING";
;1149:                break;
;1150:        case BACK:
;1151:                p = "BACK";
;1152:                break;
;1153:        case END:
;1154:                p = "END";
;1155:                break;
;1156:        case OPEN+1:
;1157:        case OPEN+2:
;1158:        case OPEN+3:
;1159:        case OPEN+4:
;1160:        case OPEN+5:
;1161:        case OPEN+6:
;1162:        case OPEN+7:
;1163:        case OPEN+8:
;1164:        case OPEN+9:
;1165:                sprintf(buf+strlen(buf), "OPEN%d", OP(op)-OPEN);
;1166:                p = NULL;
;1167:                break;
;1168:        case CLOSE+1:
;1169:        case CLOSE+2:
;1170:        case CLOSE+3:
;1171:        case CLOSE+4:
;1172:        case CLOSE+5:
;1173:        case CLOSE+6:
;1174:        case CLOSE+7:
;1175:        case CLOSE+8:
;1176:        case CLOSE+9:
;1177:                sprintf(buf+strlen(buf), "CLOSE%d", OP(op)-CLOSE);
;1178:                p = NULL;
;1179:                break;
;1180:        case STAR:
;1181:                p = "STAR";
;1182:                break;
;1183:        case PLUS:
;1184:                p = "PLUS";
;1185:                break;
;1186:        default:
;1187:                regerror("corrupted opcode");
;1188:                break;
;1189:        }
;1190:        if (p != NULL)
;1191:                (void) strcat(buf, p);
;1192:        return(buf);
;1193:}
;1194:#endif
;1195:
;1196:#define STRCSPN
;1197:/*
;1198: * The following is provided for those people who do not have strcspn() in
;1199: * their C libraries.  They should get off their butts and do something
;1200: * about it; at least one public-domain implementation of those (highly
;1201: * useful) string routines has been published on Usenet.
;1202: */
;1203:#ifdef STRCSPN
;1204:/*
;1205: * strcspn - find length of initial segment of s1 consisting entirely
;1206: * of characters not from s2
;1207: */
;1208:
;1209:static int
;1210:strcspn(s1, s2)
;1211:char *s1;
;1212:char *s2;
;1213:{
line 1218
;1214:        register char *scan1;
;1215:        register char *scan2;
;1216:        register int count;
;1217:
;1218:        count = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1219
;1219:        for (scan1 = s1; *scan1 != '\0'; scan1++) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $414
JUMPV
LABELV $411
line 1220
;1220:                for (scan2 = s2; *scan2 != '\0';)        /* ++ moved down. */
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $418
JUMPV
LABELV $415
line 1221
;1221:                        if (*scan1 == *scan2++)
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
NEI4 $419
line 1222
;1222:                                return(count);
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $410
JUMPV
LABELV $419
LABELV $416
line 1220
LABELV $418
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $415
line 1223
;1223:                count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1224
;1224:        }
LABELV $412
line 1219
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $414
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $411
line 1225
;1225:        return(count);
ADDRLP4 8
INDIRI4
RETI4
LABELV $410
endproc strcspn 16 0
export regsub
proc regsub 68 12
line 1244
;1226:}
;1227:#endif
;1228: 
;1229:
;1230:#ifndef CHARBITS
;1231:#define UCHARAT(p)        ((int)*(unsigned char *)(p))
;1232:#else
;1233:#define UCHARAT(p)        ((int)*(p)&CHARBITS)
;1234:#endif
;1235:
;1236:/*
;1237: - regsub - perform substitutions after a regexp match
;1238: */
;1239:void
;1240:regsub(prog, source, dest)
;1241:regexp *prog;
;1242:char *source;
;1243:char *dest;
;1244:{
line 1252
;1245:        register char *src;
;1246:        register char *dst;
;1247:        register char c;
;1248:        register int no;
;1249:        register int len; 
;1250:        extern char *strncpy();
;1251:
;1252:        if (prog == NULL || source == NULL || dest == NULL) {
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $425
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $425
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
NEU4 $422
LABELV $425
line 1253
;1253:                regerror("NULL parm to regsub");
ADDRGP4 $426
ARGP4
ADDRGP4 regerror
CALLV
pop
line 1254
;1254:                return;
ADDRGP4 $421
JUMPV
LABELV $422
line 1256
;1255:        }
;1256:        if (UCHARAT(prog->program) != MAGIC) {
ADDRFP4 0
INDIRP4
CNSTI4 2652
ADDP4
INDIRU1
CVUI4 1
CNSTI4 156
EQI4 $427
line 1257
;1257:                regerror("damaged regexp fed to regsub");
ADDRGP4 $429
ARGP4
ADDRGP4 regerror
CALLV
pop
line 1258
;1258:                return;
ADDRGP4 $421
JUMPV
LABELV $427
line 1261
;1259:        }
;1260:
;1261:        src = source;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 1262
;1262:        dst = dest;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $431
JUMPV
LABELV $430
line 1263
;1263:        while ((c = *src++) != '\0') {
line 1264
;1264:                if (c == '&')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 38
NEI4 $433
line 1265
;1265:                        no = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $434
JUMPV
LABELV $433
line 1266
;1266:                else if (c == '\\' && '0' <= *src && *src <= '9')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $435
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
CNSTI4 48
ADDRLP4 24
INDIRI4
GTI4 $435
ADDRLP4 24
INDIRI4
CNSTI4 57
GTI4 $435
line 1267
;1267:                        no = *src++ - '0';
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $435
line 1269
;1268:                else
;1269:                        no = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $436
LABELV $434
line 1271
;1270:
;1271:                if (no < 0) {        /* Ordinary character. */
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $437
line 1272
;1272:                  if (c == '\\' && (*src == '\\' || *src == '&'))
ADDRLP4 32
CNSTI4 92
ASGNI4
ADDRLP4 8
INDIRI1
CVII4 1
ADDRLP4 32
INDIRI4
NEI4 $439
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $441
ADDRLP4 36
INDIRI4
CNSTI4 38
NEI4 $439
LABELV $441
line 1273
;1273:                    c = *src++;
ADDRLP4 40
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
INDIRI1
ASGNI1
LABELV $439
line 1274
;1274:                  *dst++ = c; }
ADDRLP4 44
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
ADDRGP4 $438
JUMPV
LABELV $437
line 1275
;1275:                else if (prog->startp[no] != NULL && prog->endp[no] != NULL) {
ADDRLP4 32
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $442
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $442
line 1276
;1276:                        len = prog->endp[no] - prog->startp[no];
ADDRLP4 44
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 40
ADDP4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
ADDP4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1277
;1277:                        (void) strncpy(dst, prog->startp[no], len);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1278
;1278:						(void) strncpy(prog->var[no], prog->startp[no], len);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 80
ADDP4
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 56
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1279
;1279:						CG_Printf("number %i var %s \n", no, prog->var[no] );
ADDRGP4 $444
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 8
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1280
;1280:                        dst += len;
ADDRLP4 4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1281
;1281:                        if (len != 0 && *(dst-1) == '\0') {/* strncpy hit NUL. */
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $445
ADDRLP4 4
INDIRP4
CNSTI4 -1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 64
INDIRI4
NEI4 $445
line 1282
;1282:                                regerror("damaged match string");
ADDRGP4 $447
ARGP4
ADDRGP4 regerror
CALLV
pop
line 1283
;1283:                                return;
ADDRGP4 $421
JUMPV
LABELV $445
line 1285
;1284:                        }
;1285:                }
LABELV $442
LABELV $438
line 1286
;1286:        }
LABELV $431
line 1263
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 8
ADDRLP4 28
INDIRI1
ASGNI1
ADDRLP4 28
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $430
line 1287
;1287:        *dst++ = '\0';
ADDRLP4 32
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 0
ASGNI1
line 1289
;1288: 
;1289:}
LABELV $421
endproc regsub 68 12
bss
align 4
LABELV regendp
skip 4
align 4
LABELV regstartp
skip 4
align 4
LABELV regbol
skip 4
align 4
LABELV reginput
skip 4
align 4
LABELV regsize
skip 4
align 4
LABELV regcode
skip 4
align 1
LABELV regdummy
skip 1
align 4
LABELV regnpar
skip 4
align 4
LABELV regparse
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
LABELV $447
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $444
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $429
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 32
byte 1 102
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 115
byte 1 117
byte 1 98
byte 1 0
align 1
LABELV $426
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 115
byte 1 117
byte 1 98
byte 1 0
align 1
LABELV $400
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 108
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $380
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $378
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $282
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $279
byte 1 78
byte 1 85
byte 1 76
byte 1 76
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
byte 1 0
align 1
LABELV $231
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $228
byte 1 94
byte 1 36
byte 1 46
byte 1 91
byte 1 40
byte 1 41
byte 1 124
byte 1 63
byte 1 43
byte 1 42
byte 1 92
byte 1 0
align 1
LABELV $227
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 92
byte 1 0
align 1
LABELV $223
byte 1 63
byte 1 43
byte 1 42
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $221
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 117
byte 1 114
byte 1 112
byte 1 0
align 1
LABELV $216
byte 1 117
byte 1 110
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 91
byte 1 93
byte 1 0
align 1
LABELV $208
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 91
byte 1 93
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 110
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 42
byte 1 63
byte 1 43
byte 1 0
align 1
LABELV $166
byte 1 42
byte 1 43
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $146
byte 1 106
byte 1 117
byte 1 110
byte 1 107
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $141
byte 1 117
byte 1 110
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 41
byte 1 0
align 1
LABELV $118
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 40
byte 1 41
byte 1 0
align 1
LABELV $96
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 98
byte 1 105
byte 1 103
byte 1 0
align 1
LABELV $88
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 97
byte 1 114
byte 1 103
byte 1 117
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
