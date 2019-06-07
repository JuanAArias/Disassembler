*-----------------------------------------------------------
* Title      :OPCODE
* Written by :BERRY
* Date       :3/10/19
* Description:EAS
*-----------------------------------------------------------

OPCODESTART
    LEA     (2,A3),A4
    MOVE.B  (A3),D1
    ANDI.B  #$F0,D1 * Bitmask
    
    *BCLR    (A0),D0
    
    CMPI.B  #$00, D1    *OPCODE = 0000
    BEQ     _0
    
    CMPI.B  #$10, D1    *OPCODE = 0001
    BEQ     _1
    
    CMPI.B  #$20, D1    *OPCODE = 0010
    BEQ     _2
    
    CMPI.B  #$30, D1    *OPCODE = 0011
    BEQ     _3
    
    CMPI.B  #$40, D1    *OPCODE = 0100
    BEQ     _4
    
    CMPI.B  #$50, D1    *OPCODE = 0101
    BEQ     _5
    
    CMPI.B  #$60, D1    *OPCODE = 0110
    BEQ     _6
    
    CMPI.B  #$70, D1    *OPCODE = 0111
    BEQ     _7
    
    CMPI.B  #$80, D1    *OPCODE = 1000
    BEQ     _8
    
    CMPI.B  #$90, D1    *OPCODE = 1001
    BEQ     _9
    
    CMPI.B  #$A0, D1    *OPCODE = 1010
    BEQ     _A
    
    CMPI.B  #$B0, D1    *OPCODE = 1011
    BEQ     _B
    
    CMPI.B  #$C0, D1    *OPCODE = 1100
    BEQ     _C
    
    CMPI.B  #$D0, D1    *OPCODE = 1101
    BEQ     _D
    
    CMPI.B  #$E0, D1    *OPCODE = 1110
    BEQ     _E
    
    CMPI.B  #$F0, D1    *OPCODE = 1111
    BEQ     _F


_0: *[XXXXXXXXXX]   
    BRA         ERR

    
_1: *[MOVE.B]
    BRA         MOVEB_LOAD


_2: *[MOVE.L, MOVEA.L]
    MOVE.W      (A3),D2
    ANDI.W      #$01C0,D2
    
    CMPI.W      #$0040,D2
    BEQ         MOVEAL_LOAD
    
    BRA         MOVEL_LOAD


_3: *[MOVE.W, MOVEA.W]
    MOVE.W      (A3),D2
    ANDI.W      #$01C0,D2
    
    CMPI.W      #$0040,D2
    BEQ         MOVEAW_LOAD
    
    BRA         MOVEW_LOAD

    
_4: *[MOVEM, LEA, NEG, JSR, RTS, NOT, NOP]
    MOVE.W      (A3),D2
    
    CMPI.W      #RTS_OPCODE, D2
    BEQ         RTS_LOAD
    
    CMPI.W      #NOP_OPCODE, D2
    BEQ         NOP_LOAD      
    
    ANDI.W      #$0FC0,D2
    
    CMPI.W      #$0E80, D2
    BEQ         JSR_LOAD
    
    MOVE.W      (A3),D2
    
    ANDI.W      #$01C0,D2
    CMPI.W      #$01C0,D2
    
    BEQ         LEA_LOAD
    
    MOVE.W      (A3),D2
    ANDI.W      #$0B80,D2
    
    CMPI.W      #$0880,D2
    BEQ         MOVEM_LOAD
    
    MOVE.W      (A3),D2
    ANDI.W      #$0F00,D2
    
    CMPI.W      #$0600,D2
    BEQ         NOT_LOAD
    
    BRA         ERR  
    
    
_5: *[SUBQ, ADDQ]
    MOVE.W      (A3),D2
    
    ANDI.W      #$00C0,D2
    CMPI.W      #$00C0,D2
    BEQ         ERR
    
    MOVE.B      (A3),D2
    
    BTST        #0,D2
    BEQ         ADDQ_LOAD
    BRA         SUBQ_LOAD


_6: *[BCC(BCS-BVC), BRA]
    MOVE.W      (A3),D2
    ANDI.W      #$0F00,D2
    
    CMPI.W      #$0000,D2
    BEQ         BRA_LOAD
    
    CMPI.W      #$0500,D2
    BEQ         BCS_LOAD

    CMPI.W      #$0C00,D2
    BEQ         BGE_LOAD
    
    CMPI.W      #$0D00,D2
    BEQ         BLT_LOAD
    
    CMPI.W      #$0800,D2
    BEQ         BVC_LOAD
    
    CMPI.W      #$0700,D2
    BEQ         BEQ_LOAD
    
    CMPI.W      #$0E00,D2
    BEQ         BGT_LOAD
    
    CMPI.W      #$0F00,D2
    BEQ         BLE_LOAD
    
    BRA         ERR
    
_7: *[MOVEQ]
    MOVE.B      (A3),D2
    BTST        #0,D2
    BEQ         MOVEQ_LOAD
    BRA         ERR
    
_8: *[DIVS, OR, DIVU]
    MOVE.W      (A3),D2
    ANDI.W      #$01C0,D2
    
    CMPI.B      #$C0, D2
    BEQ         DIV_LOAD
    
    BRA         OR_LOAD
    
    
_9: *[SUB]
    BRA         SUB_LOAD

_A: *[XXXXXXXXXX]
    BRA         ERR

_B: *[XXXXXXXXXX]
    BRA         ERR


_C: *[MULS, AND]
    MOVE.W      (A3),D2
    ANDI.W      #$01C0,D2
    
    CMPI.W      #$00C0,D2
    BEQ         MULU_LOAD
    
    CMPI.W      #$01C0,D2
    BEQ         MULS_LOAD
    
    BRA         AND_LOAD

_D: *[ADD, ADDA]
    MOVE.W      (A3),D2
    ANDI.W      #$00C0,D2
    
    CMPI.W      #$00C0,D2
    BEQ         ADDA_LOAD
    
    BRA         ADD_LOAD  
    

_E: *[LSR, LSL, ASR, ASL, ROL, ROR]
    MOVE.W      (A3),D2
    ANDI.W      #$00C0,D2
    
    CMPI.W      #$00C0,D2
    BEQ         SHIFT_MEMORY
    
    MOVE.W      (A3),D2
    ANDI.W      #$0118,D2
    
    CMPI.W      #$0000,D2
    BEQ         ASR_LOAD_I
    
    CMPI.W      #$0100,D2
    BEQ         ASL_LOAD_I

    CMPI.W      #$0008,D2
    BEQ         LSR_LOAD_I

    CMPI.W      #$0108,D2
    BEQ         LSL_LOAD_I

    CMPI.W      #$0018,D2
    BEQ         ROR_LOAD_I

    CMPI.W      #$0118,D2
    BEQ         ROL_LOAD_I

    BRA        ERR        
    
    
    
SHIFT_MEMORY:
    MOVE.W      (A3),D2
    ANDI.W       #$0F00,D2
    
    CMPI.W      #$0000,D2
    BEQ         ASR_LOAD_M
    
    CMPI.W      #$0100,D2
    BEQ         ASL_LOAD_M

    CMPI.W      #$0200,D2
    BEQ         LSR_LOAD_M
    
    CMPI.W       #$0300,D2
    BEQ         LSL_LOAD_M

    CMPI.W      #$0600,D2
    BEQ         ROR_LOAD_M

    CMPI.W      #$0700,D2
    BEQ         ROL_LOAD_M

    BRA        ERR    
    
    
_F: *[XXXXXXXXXX]
    BRA         ERR
    
    
*********************************** MOVE

MOVEB_LOAD:
    MOVEQ   #1,D3
    JSR     LOAD_MOVE
    LEA     S_BYTE,A5
    BRA     TO_MOVE_EA
    
MOVEW_LOAD:
    MOVEQ   #2,D3
    JSR     LOAD_MOVE
    LEA     S_WORD,A5
    BRA     TO_MOVE_EA
    
MOVEL_LOAD:
    MOVEQ   #4,D3
    JSR     LOAD_MOVE
    LEA     S_LONG,A5
    
TO_MOVE_EA:
    JSR     LOAD_STRING
    BRA     _EA_MOVE
    
*********************************** MOVEA

MOVEAW_LOAD:
    MOVEQ   #2,D3
    LEA     S_MOVEA,A5
    JSR     LOAD_STRING
    LEA     S_WORD,A5
    BRA     TO_MOVEA_EA

MOVEAL_LOAD:
    MOVEQ   #4,D3
    LEA     S_MOVEA,A5
    JSR     LOAD_STRING
    LEA     S_LONG,A5
    
TO_MOVEA_EA:
    JSR     LOAD_STRING
    BRA     _EA_MOVEA
    
*********************************** Bcc

BRA_LOAD:
    LEA     S_BRA,A5
    BRA     TO_BRANCH_EA
    
BCS_LOAD:
    LEA     S_BCS,A5
    BRA     TO_BRANCH_EA

BLE_LOAD:
    LEA     S_BLE,A5
    BRA     TO_BRANCH_EA

BLT_LOAD:
    LEA     S_BLT,A5
    BRA     TO_BRANCH_EA
            
BGT_LOAD:
    LEA     S_BGT,A5
    BRA     TO_BRANCH_EA
               
BEQ_LOAD:
    LEA     S_BEQ,A5
    BRA     TO_BRANCH_EA

BGE_LOAD:
    LEA     S_BGE,A5
    BRA     TO_BRANCH_EA

BVC_LOAD:
    LEA     S_BVC,A5

TO_BRANCH_EA:
    JSR     LOAD_STRING
    BRA    _EA_BRANCH

*********************************** ADD/SUB

ADD_LOAD:
    LEA     S_ADD,A5
    BRA     TO_ADD_SUB_EA

SUB_LOAD:
    LEA     S_SUB,A5
    
TO_ADD_SUB_EA:
    JSR     LOAD_STRING
    BRA     _EA_ADD_SUB
    
ADDQ_LOAD:
    LEA     S_ADDQ,A5
    BRA     TO_ADDQ_SUBQ_EA
    
SUBQ_LOAD:
    LEA     S_SUBQ,A5
    
TO_ADDQ_SUBQ_EA:    
    JSR     LOAD_STRING
    BRA    _EA_ADDQ_SUBQ
    
*********************************** MUL/DIV

DIV_LOAD:
    BTST    #8,D2
    BEQ     DIVU_LOAD

DIVS_LOAD:
    LEA     S_DIVS,A5
    BRA     TO_MUL_DIV_EA
    
DIVU_LOAD:
    LEA     S_DIVU,A5
    BRA     TO_MUL_DIV_EA
    
MULS_LOAD: 
    LEA     S_MULS,A5
    BRA     TO_MUL_DIV_EA
    
MULU_LOAD: 
    LEA     S_MULU,A5
    
TO_MUL_DIV_EA:
    JSR     LOAD_STRING
    BRA     _EA_MUL_DIV

*********************************** Logic

OR_LOAD:
    LEA     S_OR,A5
    JSR     LOAD_STRING
    BRA     _EA_LOGICAL
    
AND_LOAD:
    LEA     S_AND,A5
    JSR     LOAD_STRING
    BRA    _EA_LOGICAL
    
NOT_LOAD:
    LEA     S_NOT,A5
    JSR     LOAD_STRING
    BRA    _EA_NOT

*********************************** Shift/Rotate

ASR_LOAD_I:
    LEA     S_ASR,A5
    BRA     TO_SHIFT_ROT_EA
    
ASL_LOAD_I:
    LEA     S_ASL,A5
    BRA     TO_SHIFT_ROT_EA

LSR_LOAD_I:
    LEA     S_LSR,A5
    BRA     TO_SHIFT_ROT_EA
    
LSL_LOAD_I:
    LEA     S_LSL,A5
    BRA     TO_SHIFT_ROT_EA

ROR_LOAD_I:
    LEA     S_ROR,A5
    BRA     TO_SHIFT_ROT_EA

ROL_LOAD_I:
    LEA     S_ROL,A5
    
TO_SHIFT_ROT_EA:
    JSR     LOAD_STRING
    BRA     _EA_SHIFT_ROT


*********************************** Shift/Rotate Memory

ASR_LOAD_M:
    LEA     S_ASRM,A5
    BRA     TO_SHIFT_ROT_MEM_EA
    
ASL_LOAD_M:
    LEA     S_ASLM,A5
    BRA     TO_SHIFT_ROT_MEM_EA

LSR_LOAD_M:
    LEA     S_LSRM,A5
    BRA     TO_SHIFT_ROT_MEM_EA

LSL_LOAD_M:
    LEA     S_LSLM,A5
    BRA     TO_SHIFT_ROT_MEM_EA

ROR_LOAD_M:
    LEA     S_RORM,A5
    BRA     TO_SHIFT_ROT_MEM_EA

ROL_LOAD_M:
    LEA     S_ROLM,A5
    
TO_SHIFT_ROT_MEM_EA:
    JSR     LOAD_STRING
    BRA     _EA_SHIFT_ROT_MEM

*********************************** Static Opcodes

NOP_LOAD:
    LEA     S_NOP,A5
    BRA     TO_PRINT_BUFFER
    
RTS_LOAD:
    LEA     S_RTS,A5
    
TO_PRINT_BUFFER:
    JSR     LOAD_STRING
    LEA     (2,A2),A4
    BRA     PRINT_BUFFER

*********************************** Misc
    
MOVEQ_LOAD:
    LEA     S_MOVEQ,A5
    JSR     LOAD_STRING
    BRA     _EA_MOVEQ
       
JSR_LOAD:
    LEA     S_JSR,A5
    JSR     LOAD_STRING
    BRA     _EA_JSR 
    
LEA_LOAD:
    LEA     S_LEA,A5
    JSR     LOAD_STRING
    BRA     _EA_LEA
    
MOVEM_LOAD:
    LEA     S_MOVEM,A5
    JSR     LOAD_STRING
    BRA     _EA_MOVEM
    
ADDA_LOAD:
    LEA     S_ADDA,A5
    JSR     LOAD_STRING
    BRA     _EA_ADDA
   
ERR:
   LEA      S_ER,A5
   JSR      LOAD_STRING
   MOVEA.W  #TEMP,A4
   MOVE.W   (A3),(A4)
   JSR      WORD_TO_BUFFER
   LEA      (2,A2),A4     *Need to check if immediate or absolute operands
   BRA      PRINT_BUFFER
    
    
**********************************************************************************************************************
*****************************************  MISC  *********************************************************************
**********************************************************************************************************************

LOAD_MOVE       MOVEM.L     D0-D7/A0-A5/A7,-(SP) * RETURNS: A6 = updated address of buffer
                LEA         S_MOVE,A5
                JSR         LOAD_STRING
                MOVEM.L     (SP)+,D0-D7/A0-A5/A7
                RTS

DONE                *MOVEM.L     (SP)+,A7/A5-A0/D7-D1 *Branch here at end of subroutines
                    RTS
    
* Put variables and constants here

S_ADD       DC.B        '    ADD',0       *Y
S_ADDA      DC.B        '    ADDA',0      *y
S_ASL       DC.B        '    ASL',0       *y
S_ASR       DC.B        '    ASR',0       *y
S_BRA       DC.B        '    BRA  ',0       *y
S_JSR       DC.B        '    JSR  ',0       *y
S_LEA       DC.B        '    LEA  ',0       *y
S_LSL       DC.B        '    LSL',0       *y
S_LSR       DC.B        '    LSR',0       *y
S_MOVE      DC.B        '    MOVE',0      *y
S_MOVEA     DC.B        '    MOVEA',0     *y
S_MOVEM     DC.B        '    MOVEM',0     *y
S_MULS      DC.B        '    MULS  ',0      *y
S_MULU      DC.B        '    MULU  ',0      *y
S_AND       DC.B        '    AND',0       *y
S_NOP       DC.B        '    NOP',0       *y
S_OR        DC.B        '    OR',0        *y
S_ORI       DC.B        '    ORI',0       *y
S_RTS       DC.B        '    RTS',0       *y
S_SUB       DC.B        '    SUB',0       *y
S_SUBQ      DC.B        '    SUBQ',0       *y
S_BGT       DC.B        '    BGT  ',0       *Y
S_BLE       DC.B        '    BLE  ',0       *y
S_BEQ       DC.B        '    BEQ  ',0       *y
S_BCS       DC.B        '    BCS  ',0       *y
S_BLT       DC.B        '    BLT  ',0       *y
S_BGE       DC.B        '    BGE  ',0       *y
S_BVC       DC.B        '    BVC  ',0       *y
S_BCLR      DC.B        '    BCLR  ',0      *y
S_CMP       DC.B        '    CMP',0       *y
S_CMPI      DC.B        '    CMPI',0      *y
S_NEG       DC.B        '    NEG',0       *y
S_DIVS      DC.B        '    DIVS  ',0      *y
S_EOR       DC.B        '    EOR',0       *y
S_ROR       DC.B        '    ROR',0       *y
S_ROL       DC.B        '    ROL',0       *y
S_ADDQ      DC.B        '    ADDQ',0      *y
S_DIVU      DC.B        '    DIVU  ',0      *y
S_MOVEQ     DC.B        '    MOVEQ  ',0     *y
S_NOT       DC.B        '    NOT',0       *y
S_LSLM      DC.B        '    LSL  ',0       *y
S_LSRM      DC.B        '    LSR  ',0       *y
S_RORM      DC.B        '    ROR  ',0       *y
S_ROLM      DC.B        '    ROL  ',0       *y
S_ASLM      DC.B        '    ASL  ',0       *y
S_ASRM      DC.B        '    ASR  ',0       *y

*****************************************

* Special codes
S_STACK     DC.B        'SP',0
S_BYTE      DC.B        '.B  ',0
S_WORD      DC.B        '.W  ',0
S_LONG      DC.B        '.L  ',0
S_COMMA     DC.B        ',',0
S_ADDRESS   DC.B        'A',0
S_DATA      DC.B        'D',0
S_OPEN      DC.B        '(',0
S_CLOSE     DC.B        ')',0
S_PLUS      DC.B        '+',0
S_MINUS     DC.B        '-',0
S_HASH      DC.B        '#',0
S_HEXSIGN   DC.B        '$',0
S_SLASH     DC.B        '/',0
S_SPACE     DC.B        ' ',0

* Static opcodes
NOP_OPCODE  EQU         $4E71
RTS_OPCODE  EQU         $4E75

* HEX
HEX_$       DC.B        '$',0
HEX_0       DC.B        '0',0
HEX_1       DC.B        '1',0
HEX_2       DC.B        '2',0
HEX_3       DC.B        '3',0
HEX_4       DC.B        '4',0
HEX_5       DC.B        '5',0
HEX_6       DC.B        '6',0
HEX_7       DC.B        '7',0
HEX_8       DC.B        '8',0
HEX_9       DC.B        '9',0
HEX_A       DC.B        'A',0
HEX_B       DC.B        'B',0
HEX_C       DC.B        'C',0
HEX_D       DC.B        'D',0
HEX_E       DC.B        'E',0
HEX_F       DC.B        'F',0

* ASCII
ASCII_SPACE     EQU         $20
ASCII_NULL      EQU         $0
ASCII_NO        EQU         $30
ASCII_ALPHA     EQU         $37

*ERROR handling
EA_ERR_FLAG     EQU         $FF
S_ER            DC.B        '    DATA $',0
S_EA_ERR        DC.B        'EA ERROR',0

* MISC
BUFFER          DS.B        100

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
