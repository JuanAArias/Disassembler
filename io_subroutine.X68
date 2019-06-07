*-----------------------------------------------------------
* Program    :INPUT
* Written by :ABJ
* Date       :4/10/19
* Description:Get input from user for starting and ending addresses
*-----------------------------------------------------------
* use trap 13 to print buffer

 *get begginning line in memory from user in hex
 *get ending line in memory user in hex
 *read in the file at the memory addresses specified
 *print all the addresses to the console
 
 
IO_START        JSR     CLEAR_BUFFER
                LEA     STRMSG,A1
                MOVE.B  #14,D0
                TRAP    #15
        
*-------Code for input------
                CLR.L   D5
                MOVEA.W #TEMP,A1        
                MOVE.B  #2,D0
                TRAP    #15
                JSR     ASSCI_HEX
                MOVE.W  D5,INPUTSTART * todo - I think there is a specific address this need to be at\
                MOVEA.L D5,A2

                LEA     ENDMSG,A1
                MOVE.B  #14,D0
                TRAP    #15        
                
                CLR.L   D5
                MOVEA.W #TEMP,A1
                MOVE.B  #2,D0
                TRAP    #15
                JSR     ASSCI_HEX
                MOVE.W  D5,INPUTEND

                JSR     NEW_LINE
    
        
NEXT_INSTR      CMPA.W  INPUTEND,A2 * A2 is the 'current index'
                BGT     NEXT_IMAGE
                
                MOVEA.L #TEMP,A4
                MOVE.L  A2,(A4)
                
                JSR     WORD_TO_BUFFER
                JSR     WORD_TO_BUFFER
                
                LEA     (A2),A3
                BRA     OPCODESTART
            
  
ASSCI_HEX:      MOVEM.L D4,-(SP)

ASSCI_LOOP      CMPI.B   #ASCII_NULL, D1  
                BEQ      ALL_CONVERTED  
                MOVE.B   (A1)+, D4 
                CMPI.B   #$40, D4   * IS IT 0-9 
                BLT      ITS_NUMBER    * YES, THEN BRANCHE IT 
                CMPI.B   #$47, D4   * IS IT A-F?  
                BLT      ITS_UPPER   * BRANCHE IT TO UPPER CASE 
                CMP.B    #$67, D4    * IS IT a-f ? 
                BLT      ITS_LOWER
                BRA      ASSCI_LOOP
 
ALL_CONVERTED   MOVEM.L (SP)+,D4
                RTS

CHAR_LOOP       SUBI.B  #$1, D1 
                ADD.B   D4, D5 
                CMPI.B  #ASCII_NULL, D1  * CHEAK IF ALL ASSIC HAVE CONVERTED 
                BEQ     ASSCI_LOOP
                *ROL.L  #4, D5    * SHIFET TO LEFT T ADD THE NEW VALUE TO THE LEFT 
                ASL.L   #4,D5        * SHIFET TO LEFT T ADD THE NEW VALUE TO THE LEFT 
                BRA     ASSCI_LOOP
                
ITS_NUMBER      SUBI.B  #$30, D4     * SUBSTRUCT 30 TO GET 1 - 9 
                BRA     CHAR_LOOP
                
ITS_UPPER       SUBI.B  #$37, D4     * SUBSTRUCT 37 TO GET A- F 
                BRA     CHAR_LOOP
          
ITS_LOWER       SUBI.B  #$57, D4   * SUBSTRUCT 57 TO GET a-f 
                BRA     CHAR_LOOP
                
PRINT_BUFFER    JSR     PRINT
                LEA     (A4),A2
                BRA     NEXT_INSTR
                
                
BYTE_TO_BUFFER  *MOVEM.L    D0-D7/A0-A7,-(SP)
                *RETURN:    A6 = updated address for buffer
                CMPI.B      #9,D1
                BLE         ASCII_NUM
                BRA         ASCII_CHAR            
                    
ASCII_NUM       ADDI.B      #ASCII_NO,D1
                BRA         LOAD
                    
ASCII_CHAR      ADDI.B      #ASCII_ALPHA,D1

LOAD            MOVE.B      D1,(A6)+
                    
                BRA         DONE
                
PRINT           MOVEA.W     #BUFFER,A1
                MOVEQ       #13,D0
                TRAP        #15
                JSR         CLEAR_BUFFER
                RTS
          
WORD_TO_BUFFER      *MOVEM.L    D0-D7/A0-A7,-(SP)
                    *RETURN:    A6 = updated address for buffer
                    *           A4 = updated address for next instruction
                    MOVE.W      (A4),D1
                    MOVEQ       #12,D7
                    LSR         D7,D1
                    JSR         BYTE_TO_BUFFER
                    
                    MOVE.W      (A4),D1
                    ANDI.W      #$0F00,D1
                    LSR         #8,D1
                    JSR         BYTE_TO_BUFFER
                    
                    MOVE.W      (A4),D1
                    ANDI.W      #$00F0,D1
                    LSR         #4,D1
                    JSR         BYTE_TO_BUFFER
                    
                    MOVE.W      (A4)+,D1
                    ANDI.W      #$000F,D1
                    JSR         BYTE_TO_BUFFER
                    
                    BRA         DONE
      
                
CLEAR_BUFFER    MOVEA.W #BUFFER,A6
                CLR.B   D0
CB_LOOP         CMPI.B  #100,D0
                BEQ     DONE
                CLR.B   (A6,D0)
                ADDQ    #1,D0
                BRA     CB_LOOP
                
NEW_LINE        MOVE.B  #CR,D1
                JSR     TRAP6
                MOVE.B  #LF,D1
                JSR     TRAP6
                RTS
                
TRAP6           MOVEQ   #6,D0
                TRAP    #15
                RTS
                
NEXT_IMAGE      JSR     NEW_LINE
                LEA     S_NEXT_IMAGE,A1
                MOVEQ   #14,D0
                TRAP    #15
                MOVE.B  #4,D0
                TRAP    #15
                BTST    #0,D1
                BEQ     OVER
                JSR     NEW_LINE
                BRA     IO_START
                
LOAD_STRING     CMPI.B  #ASCII_NULL,(A5)
                BEQ     LOAD_DONE
                MOVE.B  (A5)+,(A6)+
                BRA     LOAD_STRING
LOAD_DONE       RTS

_HASH           LEA      S_HASH, A5
                JSR      LOAD_STRING 
                RTS
                    
PRINT_COMMA     LEA     S_COMMA,A5
                JSR     LOAD_STRING
                RTS
***************************************DATA********************************                
CR              EQU     $0D      
LF              EQU     $0A
INPUTSTART      DS.L    2
INPUTEND        DS.L    2
TEMP            DS.L    2
STRMSG          DC.B    'Enter start address: ',0
ENDMSG          DC.B    'Enter end address:   ',0
S_NEXT_IMAGE    DC.B    'Enter 1 to continue: ',0









































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
