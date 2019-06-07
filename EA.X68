*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
**********************************************************************************************************************
*****************************************  MAIN FUNCTIONS  ***********************************************************
**********************************************************************************************************************


_EA_MOVE                JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        JSR         PRINT_COMMA
                        
                        JSR         DEST_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        BRA         PRINT_BUFFER


_EA_MOVEA               JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        JSR         PRINT_COMMA
                        LEA         S_ADDRESS,A5
                        JSR         LOAD_STRING
                        
                        JSR         DEST_REG
                        BRA         PRINT_BUFFER

_EA_MOVEQ               JSR         Q_A
                        JSR         PRINT_COMMA
                        LEA         S_DATA,A5
                        JSR         LOAD_STRING
                        JSR         DEST_REG
                        BRA         PRINT_BUFFER
                        
                        
_EA_MOVEM               JSR         M_SZ
                        JSR         M_DIR
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        BRA         PRINT_BUFFER
                        
                        
_EA_LEA                 JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        CMPI.B      #2,D4                   *Check for valid mode
                        BEQ         CONT_LEA
                        CMPI.B      #70,D4                  *Check for valid mode
                        BEQ         CONT_LEA
                        CMPI.B      #71,D4                  *Check for valid mode
                        BEQ         CONT_LEA
                        BRA         EA_ERR                     *Any other source mode is invalid
                        
CONT_LEA                JSR         PRINT_COMMA
                        LEA         S_ADDRESS,A5
                        JSR         LOAD_STRING
                        JSR         DEST_REG
                        BRA         PRINT_BUFFER
                        

_EA_ADD_SUB             JSR         SIZE_0
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        JSR         DN_DIR
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        BRA         PRINT_BUFFER
                        
                        
_EA_ADDA                JSR         ADDA_SIZE
                        
                        JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        JSR         PRINT_COMMA
                        LEA         S_ADDRESS,A5
                        JSR         LOAD_STRING
                        
                        MOVEQ       #1,D4
                        JSR         DEST_REG
                        
                        BRA         PRINT_BUFFER
                        
                        
_EA_ADDQ_SUBQ           JSR         SIZE_0
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        JSR         Q_B
                        
                        JSR         PRINT_COMMA
                        
                        JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        CMPI.B      #1,D3
                        BNE         PRINT_BUFFER
                        
                        CMPI.B      #1,D4
                        BNE         PRINT_BUFFER
                        
                        BRA         EA_ERR
                        
                        
_EA_MUL_DIV             MOVEQ       #2,D3
                        
                        JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        CMPI.B      #1,D4
                        BEQ         EA_ERR
                        
                        JSR         PRINT_COMMA
                        LEA         S_DATA,A5
                        JSR         LOAD_STRING
                        
                        CLR.B       D4
                        JSR         DEST_REG
                        
                        BRA         PRINT_BUFFER                     
                        

_EA_JSR                 JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        CMPI.B      #1,D4
                        BLE         EA_ERR
                        
                        CMPI.B      #3,D4
                        BEQ         EA_ERR
                        
                        CMPI.B      #4,D4
                        BEQ         EA_ERR
                        
                        CMPI.B      #74,D4
                        BEQ         EA_ERR
                        
                        BRA         PRINT_BUFFER
                        
                        
_EA_BRANCH              LEA         HEX_$,A5        * Used for BRA,BGT,BLE,BEQ
                        JSR         LOAD_STRING
                        
                        MOVE.W      (A3),D0
                        ANDI.W      #$00FF,D0
                        
                        CMPI.W      #0,D0
                        BEQ         WORD_BRANCH
                        
                        BTST        #7,D0
                        BNE         COMPLEMENT_BYTE
                        
                        ADD.W       A4,D0
                        BRA         TO_BUFFER
                        
COMPLEMENT_BYTE         NEG.B       D0
                        
                        MOVE.W      A4,D1
                        SUB.W       D0,D1
                        MOVE.W      D1,D0
                        
                        BRA         TO_BUFFER
                        
WORD_BRANCH             MOVE.W      (A4),D0

                        BTST        #15,D0
                        BNE         COMPLEMENT_WORD

                        ADD.W       A4,D0
                        BRA         BEFORE_BUFFER
                        
COMPLEMENT_WORD         NEG.W       D0
                        
                        MOVE.W      A4,D1
                        SUB.W       D0,D1
                        MOVE.W      D1,D0
                        
BEFORE_BUFFER           ADDA.W      #2,A4
                        
TO_BUFFER               MOVE.W      D0,D1
                        MOVEQ       #12,D7
                        LSR         D7,D1
                        JSR         BYTE_TO_BUFFER
                    
                        MOVE.W      D0,D1
                        ANDI.W      #$0F00,D1
                        LSR         #8,D1
                        JSR         BYTE_TO_BUFFER
                    
                        MOVE.W      D0,D1
                        ANDI.W      #$00F0,D1
                        LSR         #4,D1
                        JSR         BYTE_TO_BUFFER
                    
                        MOVE.W      D0,D1
                        ANDI.W      #$000F,D1
                        JSR         BYTE_TO_BUFFER
                        
                        CLR.W       D1
                        BRA         PRINT_BUFFER


_EA_LOGICAL             JSR         SIZE_0
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        JSR         DN_DIR
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        CMPI.B      #1,D4               *Address register direct not allowed in source
                        BEQ         EA_ERR
                        BRA         PRINT_BUFFER
                        

_EA_NOT                 JSR         SIZE_0
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        CMPI.B      #1,D4               *Address register direct not allowed in dest
                        BEQ         EA_ERR
                        
                        CMPI.B      #74,D4              *Immediate not allowed in dest
                        BEQ         EA_ERR
                        
                        BRA         PRINT_BUFFER
                        
                        
_EA_SHIFT_ROT_MEM       JSR         SOURCE_MODE
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        CMPI.B      #1,D4               *Address and data register direct not allowed in dest
                        BLE         EA_ERR
                        
                        CMPI.B      #74,D4              *Immediate not allowed in dest
                        BEQ         EA_ERR
                        
                        BRA         PRINT_BUFFER



_EA_SHIFT_ROT           JSR         SIZE_0
                        CMPI.B      #EA_ERR_FLAG,D7
                        BEQ         EA_ERR
                        
                        JSR         SHIFT_ROT_M
                        JSR         PRINT_COMMA
                        
                        LEA         S_DATA,A5
                        JSR         LOAD_STRING
                        
                        JSR         SOURCE_REG
                        
                        BRA         PRINT_BUFFER
                        
                        
**********************************************************************************************************************
*****************************************  DESTINATION  **************************************************************
**********************************************************************************************************************
    
DEST_MODE           *MOVEM.L     A7-A0/D7-D1,-(SP)
                    *RETURN:    D7 = indication if EA ERROR occurred
                    *           D4 = mode number
                    *           A6 = updated address for buffer
                    *           A4 = updated address for next instruction
                    
                    MOVE.W      (A3),D0
                    ANDI.W      #$01C0,D0
                    
                    CMPI.W      #0,D0
                    BEQ         DEST_MODE_0
                    
                    CMPI.W      #$0040,D0
                    BEQ         DEST_MODE_1
                    
                    CMPI.W      #$0080,D0
                    BEQ         DEST_MODE_2
                    
                    CMPI.W      #$00C0,D0
                    BEQ         DEST_MODE_3
                    
                    CMPI.W      #$0100,D0
                    BEQ         DEST_MODE_4
                    
                    CMPI.W      #$01C0,D0          
                    BEQ         DEST_MODE_7
                    
                    BRA         EA_ERR_RTS
                    
                    
DEST_MODE_0         CLR.B       D4
                    LEA         S_DATA,A5       *Data register
                    JSR         LOAD_STRING
                    
                    JSR         DEST_REG
                    
                    BRA         DONE
                    
DEST_MODE_1         MOVEQ       #1,D4
                    LEA         S_ADDRESS,A5    *Address register direct
                    JSR         LOAD_STRING
                    
                    JSR         DEST_REG
                    
                    BRA         DONE
                    
DEST_MODE_2         MOVEQ       #2,D4

                    LEA         S_OPEN,A5       *Address register indirect
                    JSR         LOAD_STRING
                    
                    LEA         S_ADDRESS,A5
                    JSR         LOAD_STRING
                    
                    JSR         DEST_REG
                    
                    LEA         S_CLOSE,A5
                    JSR         LOAD_STRING
                    
                    BRA         DONE
                    
DEST_MODE_3         MOVEQ       #3,D4
                    
                    LEA         S_OPEN,A5       *Address register indirect post increment
                    JSR         LOAD_STRING
                    
                    LEA         S_ADDRESS,A5
                    JSR         LOAD_STRING
                    
                    JSR         DEST_REG
                    
                    LEA         S_CLOSE,A5
                    JSR         LOAD_STRING
                    
                    LEA         S_PLUS,A5
                    JSR         LOAD_STRING
                    
                    BRA         DONE
                    
                    
DEST_MODE_4         MOVEQ       #4,D4

                    LEA         S_MINUS,A5      *Address register indirect pre decrement
                    JSR         LOAD_STRING
                    
                    LEA         S_OPEN,A5
                    JSR         LOAD_STRING
                    
                    LEA         S_ADDRESS,A5
                    JSR         LOAD_STRING
                    
                    JSR         DEST_REG
                    
                    LEA         S_CLOSE,A5
                    JSR         LOAD_STRING
                    
                    BRA         DONE
                    
                    
DEST_MODE_7         MOVEQ       #7,D4

                    MOVE.W      (A3),D0         *Must check register to find mode
                    
                    ANDI.W      #$0E00,D0
                    
                    CMPI.W      #0,D0
                    BEQ         ABS_W
                    
                    CMPI.W      #$0200,D0
                    BEQ         ABS_L
                    
                    CMPI.W      #$0800,D0
                    BEQ         IMMEDIATE   *FIX
                    
                    BRA         DONE


DEST_REG            *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVE.W      (A3),D0
                    ANDI.W      #$0E00,D0
                    
                    CMPI.W      #0,D0
                    BEQ         REG_0
                    
                    CMPI.W      #$0200,D0
                    BEQ         REG_1
                    
                    CMPI.W      #$0400,D0
                    BEQ         REG_2
                    
                    CMPI.W      #$0600,D0
                    BEQ         REG_3
                    
                    CMPI.W      #$0800,D0
                    BEQ         REG_4
                    
                    CMPI.W      #$0A00,D0
                    BEQ         REG_5
                    
                    CMPI.W      #$0C00,D0
                    BEQ         REG_6
                    
                    BRA         REG_7              *ELSE, 7
                    
                    
**********************************************************************************************************************
*****************************************  SOURCE  *******************************************************************
**********************************************************************************************************************


SOURCE_MODE         *MOVEM.L     A7-A0/D7-D1,-(SP)
                    *RETURN:    D7 = indication if EA ERROR occurred
                    *           D4 = mode number
                    *           A6 = updated address for BUFFER
                    *           A4 = updated address for next instruction
                    
                    MOVE.W      (A3),D0
                    ANDI.W      #$0038,D0
                    
                    CMPI.W      #0,D0
                    BEQ         SOURCE_MODE_0
                    
                    CMPI.W      #$0008,D0
                    BEQ         SOURCE_MODE_1
                    
                    CMPI.W      #$0010,D0
                    BEQ         SOURCE_MODE_2
                    
                    CMPI.W      #$0018,D0
                    BEQ         SOURCE_MODE_3
                    
                    CMPI.W      #$0020,D0
                    BEQ         SOURCE_MODE_4
                    
                    CMPI.W      #$0038,D0
                    BEQ         SOURCE_MODE_7
                    
                    BRA         EA_ERR_RTS
                    
SOURCE_MODE_0       CLR.B       D4
                    LEA         S_DATA,A5       *Data register
                    JSR         LOAD_STRING
                    
                    JSR         SOURCE_REG
                    
                    BRA         DONE

SOURCE_MODE_1       MOVEQ       #1,D4
                    LEA         S_ADDRESS,A5    *Address register direct
                    JSR         LOAD_STRING
                    
                    JSR         SOURCE_REG
                    
                    BRA         DONE
                    
SOURCE_MODE_2       MOVEQ       #2,D4
                    LEA         S_OPEN,A5       *Address register indirect
                    JSR         LOAD_STRING
                    
                    LEA         S_ADDRESS,A5
                    JSR         LOAD_STRING
                    
                    JSR         SOURCE_REG
                    
                    LEA         S_CLOSE,A5
                    JSR         LOAD_STRING
                    
                    BRA         DONE
                    
SOURCE_MODE_3       MOVEQ       #3,D4

                    LEA         S_OPEN,A5       *Address register indirect post increment
                    JSR         LOAD_STRING
                    
                    LEA         S_ADDRESS,A5
                    JSR         LOAD_STRING
                    
                    JSR         SOURCE_REG
                    
                    LEA         S_CLOSE,A5
                    JSR         LOAD_STRING
                    
                    LEA         S_PLUS,A5
                    JSR         LOAD_STRING
                        
                    BRA         DONE
                    
                    
SOURCE_MODE_4       MOVEQ       #4,D4

                    LEA         S_MINUS,A5      *Address register indirect pre decrement
                    JSR         LOAD_STRING
                    
                    LEA         S_OPEN,A5
                    JSR         LOAD_STRING
                    
                    LEA         S_ADDRESS,A5
                    JSR         LOAD_STRING
                    
                    JSR         SOURCE_REG
                    
                    LEA         S_CLOSE,A5
                    JSR         LOAD_STRING
                    
                    
                    BRA         DONE
                    
                    
SOURCE_MODE_7       MOVE.W      (A3),D0         *Must check register to find mode
                    
                    ANDI.W      #$0007,D0
                    
                    CMPI.W      #0,D0
                    BEQ         ABS_W
                    
                    CMPI.W      #1,D0
                    BEQ         ABS_L
                    
                    CMPI.W      #4,D0
                    BEQ         IMMEDIATE
                    
                    BRA         EA_ERR_RTS


SOURCE_REG          *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVE.W      (A3),D0
                    ANDI.W      #$0007,D0
                    
                    CMPI.W      #0,D0
                    BEQ         REG_0
                    
                    CMPI.W      #$0001,D0
                    BEQ         REG_1
                    
                    CMPI.W      #$0002,D0
                    BEQ         REG_2
                    
                    CMPI.W      #$0003,D0
                    BEQ         REG_3
                    
                    CMPI.W      #$0004,D0
                    BEQ         REG_4
                    
                    CMPI.W      #$0005,D0
                    BEQ         REG_5
                    
                    CMPI.W      #$0006,D0
                    BEQ         REG_6
                    
                    BRA         REG_7
                    

**********************************************************************************************************************
*****************************************  REGISTER  *****************************************************************
**********************************************************************************************************************
                     
REG_0               LEA     HEX_0,A5
                    JSR     LOAD_STRING
                    BRA     DONE               
                    
REG_1               LEA     HEX_1,A5
                    JSR     LOAD_STRING
                    BRA     DONE

REG_2               LEA     HEX_2,A5
                    JSR     LOAD_STRING
                    BRA     DONE

REG_3               LEA     HEX_3,A5
                    JSR     LOAD_STRING
                    BRA     DONE

REG_4               LEA     HEX_4,A5
                    JSR     LOAD_STRING
                    BRA     DONE

REG_5               LEA     HEX_5,A5
                    JSR     LOAD_STRING
                    BRA     DONE

REG_6               LEA     HEX_6,A5
                    JSR     LOAD_STRING
                    BRA     DONE
                    
REG_7               CMPI.B  #0,D4
                    BNE     REG_SP
                    
                    LEA     HEX_7,A5
                    JSR     LOAD_STRING
                    BRA     DONE
                    
REG_SP              SUBA    #1,A6
                    LEA     S_STACK,A5
                    JSR     LOAD_STRING
                    BRA     DONE
                    
              
**********************************************************************************************************************
*****************************************  ABSOLUTE/IMMEDIATE  *******************************************************
**********************************************************************************************************************

ABS_W               MOVEQ   #70,D4

                    LEA     HEX_$,A5
                    JSR     LOAD_STRING
                    
                    JSR     WORD_TO_BUFFER
                    
                    BRA     DONE
                    
ABS_L               MOVEQ   #71,D4

                    LEA     HEX_$,A5
                    JSR     LOAD_STRING
                                       
                    JSR     WORD_TO_BUFFER
                    JSR     WORD_TO_BUFFER
                    
                    BRA     DONE
                    
                    
IMMEDIATE           MOVEQ   #74,D4
                    CLR.W   D1
                    
                    JSR     _HASH
                    LEA     HEX_$,A5
                    JSR     LOAD_STRING
                    
                    CMP     #1,D3
                    BEQ     IMM_BYTE
                    
                    CMP     #2,D3
                    BEQ     IMM_WORD
                    
                    BRA     IMM_LONG
                    
IMM_BYTE            ADDA    #1,A4

                    MOVE.B  (A4),D1
                    LSR     #4,D1
                    JSR     BYTE_TO_BUFFER
                    
                    MOVE.B  (A4)+,D1
                    ANDI    #$0F,D1
                    JSR     BYTE_TO_BUFFER
                    
                    BRA     DONE

                    
IMM_WORD            JSR     WORD_TO_BUFFER

                    BRA     DONE
                    
IMM_LONG            JSR     WORD_TO_BUFFER
                    JSR     WORD_TO_BUFFER
                    
                    BRA     DONE

**********************************************************************************************************************
*****************************************  SIZE_0  *******************************************************************
**********************************************************************************************************************
                    
SIZE_0              *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVE.W      (A3),D0
                    ANDI.W      #$00C0,D0
                    
                    CMPI.W      #0,D0
                    BEQ         SIZE_0_BYTE
                    
                    CMPI.W      #$0040,D0
                    BEQ         SIZE_0_WORD
                    
                    CMPI.W      #$0080,D0
                    BEQ         SIZE_0_LONG
                    
                    MOVE.B      #ASCII_SPACE,(A6)+
                    BRA         EA_ERR_RTS
                    
SIZE_0_BYTE         LEA         S_BYTE,A5
                    JSR         LOAD_STRING
                    MOVEQ       #1,D3
                    BRA         DONE
                    
SIZE_0_WORD         LEA         S_WORD,A5
                    JSR         LOAD_STRING
                    MOVEQ       #2,D3
                    BRA         DONE
                    
SIZE_0_LONG         LEA         S_LONG,A5
                    JSR         LOAD_STRING
                    MOVEQ       #4,D3
                    BRA         DONE
                    
                    
**********************************************************************************************************************
*****************************************  DN_DIR  *******************************************************************
**********************************************************************************************************************


DN_DIR              *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVE.W      (A3),D0
                    
                    BTST        #8,D0
                    
                    BEQ         DN_EA_SOURCE
                    BRA         DN_EA_DEST
                    
DN_EA_SOURCE        JSR         SOURCE_MODE
                    JSR         PRINT_COMMA
                    
                    LEA         S_DATA,A5
                    JSR         LOAD_STRING
                    
                    CLR.B       D4
                    JSR         DEST_REG
                    BRA         DONE
                    
DN_EA_DEST          LEA         S_DATA,A5
                    JSR         LOAD_STRING
                    
                    CLR.B       D4
                    JSR         DEST_REG
                    
                    JSR         PRINT_COMMA
                    JSR         SOURCE_MODE
                    
                    CMPI.B      #1,D4           *Check for invalid mode
                    BLE         EA_ERR_RTS
                    
                    CMPI.B      #74,D4          *Check for invalid mode
                    BEQ         EA_ERR_RTS
                    
                    BRA         DONE                   
                    
                    
**********************************************************************************************************************
*****************************************  M_SZ  *********************************************************************
**********************************************************************************************************************

M_SZ                *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVE.W      (A3),D0
                    BTST        #6,D0
                    BEQ         M_WORD
                    
M_LONG              LEA         S_LONG,A5              
                    BRA         M_LOAD
                    
M_WORD              LEA         S_WORD,A5
M_LOAD              JSR         LOAD_STRING
                    BRA         DONE

                    
**********************************************************************************************************************
*****************************************  M_DIR  ********************************************************************
**********************************************************************************************************************
                    
M_DIR               *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVEM.L     D1/D2,-(SP)
                    
                    MOVE.W      (A3),D0
                    MOVEQ       #15,D2
                    BTST        #10,D0
                    BEQ         REG_TO_MEM
                    
MEM_TO_REG          ADDA.W      #2,A4
                    JSR         SOURCE_MODE
                    
                    CMPI.B      #1,D4                  *Check for invalid modes
                    BLE         EA_ERR_RTS
                    
                    CMPI.B      #4,D4                  *Check for invalid modes
                    BEQ         EA_ERR_RTS
                    
                    CMPI.B      #74,D4                 *Check for invalid modes
                    BEQ         EA_ERR_RTS
                    
                    JSR         PRINT_COMMA
                    
                    MOVEA.W     A4,A2
                    LEA         (2,A3),A4
                    MOVE.W      (A4),D0
                    JSR         REG_LIST_0
                    MOVEA.W     A2,A4
                    
                    MOVEM.L     (SP)+,D1/D2
                    RTS
                    
REG_TO_MEM          MOVE.W      (A3),D0
                    ANDI.W      #$0038,D0
                    CMPI.W      #$0020,D0
                    BEQ         PRE_DEC
                    
                    JSR         REG_LIST_0
                    BRA         EA_SOURCE
                    
PRE_DEC             JSR         REG_LIST_1

EA_SOURCE           JSR         PRINT_COMMA
                    JSR         SOURCE_MODE
                    
                    CMPI.B      #1,D4                  *Check for invalid modes
                    BLE         EA_ERR_RTS
                    
                    CMPI.B      #3,D4                  *Check for invalid modes
                    BEQ         EA_ERR_RTS
                    
                    CMPI.B      #74,D4                 *Check for invalid modes
                    BEQ         EA_ERR_RTS

                    MOVEM.L     (SP)+,D1/D2
                    RTS
                    

REG_LIST_0          *MOVEM.L     A7-A0/D7-D1,-(SP) 
                    MOVE.W      (A4)+,D0
                    
LIST_0_A            CMPI.B      #7,D2
                    BEQ         LIST_0_D
                    
                    BTST        D2,D0
                    BEQ         NEXT_0_A
                    
                    MOVE.B      D2,D1
                    
                    LEA         S_ADDRESS,A5
                    JSR         LOAD_STRING
                    
                    SUBQ        #8,D1
                    JSR         BYTE_TO_BUFFER
                    
                    LEA         S_SLASH,A5
                    JSR         LOAD_STRING
                    
NEXT_0_A            SUBQ        #1,D2
                    BRA         LIST_0_A
                    
LIST_0_D            CMPI.B      #0,D2
                    BLT         REMOVE_LAST
                    
                    BTST        D2,D0
                    BEQ         NEXT_0_D
                    
                    LEA         S_DATA,A5
                    JSR         LOAD_STRING
                    
                    MOVE.B      D2,D1
                    JSR         BYTE_TO_BUFFER
                    
                    LEA         S_SLASH,A5
                    JSR         LOAD_STRING
                    
NEXT_0_D            SUBQ        #1,D2
                    BRA         LIST_0_D
                    
                    
REG_LIST_1          *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVE.W      (A4)+,D0
                    CLR.B       D3
                    
LIST_1_D            CMPI.B      #7,D2
                    BEQ         LIST_1_NEXT
                    
                    BTST        D2,D0
                    BEQ         NEXT_1_D
                    
                    LEA         S_DATA,A5
                    JSR         LOAD_STRING
                    
                    MOVE.B      D3,D1
                    JSR         BYTE_TO_BUFFER
                    
                    LEA         S_SLASH,A5
                    JSR         LOAD_STRING
                    
NEXT_1_D            SUBQ        #1,D2
                    ADDQ        #1,D3
                    BRA         LIST_1_D
                    
LIST_1_NEXT         CLR.B       D3

LIST_1_A            CMPI.B      #0,D2
                    BLT         REMOVE_LAST
                    
                    BTST        D2,D0
                    BEQ         NEXT_1_A
                    
                    LEA         S_ADDRESS,A5
                    JSR         LOAD_STRING
                    
                    MOVE.B      D3,D1
                    JSR         BYTE_TO_BUFFER
                    
                    LEA         S_SLASH,A5
                    JSR         LOAD_STRING
                    
NEXT_1_A            SUBQ        #1,D2
                    ADDQ        #1,D3
                    BRA         LIST_1_A
                    
REMOVE_LAST         CLR.B       -(A6)
                    BRA         DONE

**********************************************************************************************************************
*****************************************  Q_A (MOVEQ)  *******************************************************************
**********************************************************************************************************************

Q_A                 *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVEM.L     D1,-(SP)
                    
                    JSR         _HASH
                    LEA         HEX_$,A5
                    JSR         LOAD_STRING
                    
                    MOVE.W      (A3),D1
                    ANDI.W      #$00F0,D1
                    LSR         #4,D1
                    JSR         BYTE_TO_BUFFER
                    
                    MOVE.W      (A3),D1
                    ANDI.W      #$000F,D1
                    JSR         BYTE_TO_BUFFER
                    
                    MOVEM.L     (SP)+,D1
                    RTS
                    
**********************************************************************************************************************
*****************************************  Q_B (ADDQ,SUBQ,LSd,ASd,ROd)  *******************************************************************
**********************************************************************************************************************

                    
Q_B                 *MOVEM.L     A7-A0/D7-D1,-(SP)

                    MOVE.W      (A3),D0
                    JSR         _HASH
                    
                    ANDI.W      #$0E00,D0
                    
                    CMPI.W      #0,D0
                    BEQ         Q_B_0
                    
                    CMPI.W      #$0200,D0
                    BEQ         Q_B_1
                    
                    CMPI.W      #$0400,D0
                    BEQ         Q_B_2
                    
                    CMPI.W      #$0600,D0
                    BEQ         Q_B_3
                    
                    CMPI.W      #$0800,D0
                    BEQ         Q_B_4
                    
                    CMPI.W      #$0A00,D0
                    BEQ         Q_B_5
                    
                    CMPI.W      #$0C00,D0
                    BEQ         Q_B_6
                    
                    BRA         Q_B_7

                    
Q_B_0:              LEA         HEX_8, A5
                    JSR         LOAD_STRING 
                    BRA         DONE

Q_B_1:              LEA         HEX_1,A5
                    JSR         LOAD_STRING 
                    BRA         DONE

Q_B_2:              LEA         HEX_2,A5
                    JSR         LOAD_STRING 
                    BRA         DONE

Q_B_3:              LEA         HEX_3,A5
                    JSR         LOAD_STRING 
                    BRA         DONE

Q_B_4:              LEA         HEX_4,A5
                    JSR         LOAD_STRING 
                    BRA         DONE

Q_B_5:              LEA         HEX_5,A5
                    JSR         LOAD_STRING 
                    BRA         DONE

Q_B_6:              LEA         HEX_6,A5
                    JSR         LOAD_STRING 
                    BRA         DONE

Q_B_7:              LEA         HEX_7,A5
                    JSR         LOAD_STRING 
                    BRA         DONE
 

**********************************************************************************************************************
*****************************************  ADDA_SIZE  ****************************************************************
**********************************************************************************************************************
                   
ADDA_SIZE           *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVE.W      (A3),D0
                    
                    BTST        #8,D0
                    
                    BEQ         ADDA_WORD
                    BRA         ADDA_LONG
                    
                    
ADDA_WORD:          LEA         S_WORD,A5
                    JSR         LOAD_STRING
                    MOVEQ       #2,D3
                    BRA         DONE


ADDA_LONG:          LEA         S_LONG,A5
                    JSR         LOAD_STRING
                    MOVEQ       #4,D3
                    BRA         DONE
                    
                    
**********************************************************************************************************************
*****************************************  ROT_M  ********************************************************************
**********************************************************************************************************************                
                  
SHIFT_ROT_M               *MOVEM.L     A7-A0/D7-D1,-(SP)
                    MOVE.W      (A3),D0
                    
                    BTST        #5,D0
                    BNE         SHIFT_ROT_REG
                    
                    
SHIFT_ROT_IMM       JSR         Q_B
                    BRA         DONE
                    
SHIFT_ROT_REG       LEA         S_DATA,A5
                    JSR         LOAD_STRING
                    
                    CLR.B       D4
                    JSR         DEST_REG
                    
                    BRA         DONE
                    


**********************************************************************************************************************
*****************************************  EA_ERR  *******************************************************************
**********************************************************************************************************************

EA_ERR_RTS          MOVEQ      #$FF,D7     *Indicate that need to branch to EA_ERR after the RTS
                    RTS

EA_ERR              CLR.B       D7
                    JSR         CLEAR_EA
                    LEA         S_EA_ERR,A5
                    JSR         LOAD_STRING
                    BRA         PRINT_BUFFER
                    
CLEAR_EA            *MOVEM.L    D0-D7,-(SP)
                    
CLEAR_EA_LOOP       CMPI.B      #ASCII_SPACE,(-1,A6)
                    BEQ         CLEARED
                    
                    CLR.B       (A6)
                    SUBA.W      #1,A6
                    BRA         CLEAR_EA_LOOP
                    
CLEARED             RTS




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
