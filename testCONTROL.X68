*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------

NOP         NOP
RTS         RTS

JSR         JSR     (A0)
            JSR     (A2)
            JSR     (A5)
            JSR     (SP)
            JSR     JSR
            JSR     RTS
            JSR     $E
            JSR     $50F
            JSR     $5000
            JSR     $FFFF9000
            JSR     $AAAA
            JSR     $F590
            JSR     $FFFF3000
            JSR     $FFFF0000
            
BRA         BRA     NOP
            BRA     RTS
            BRA     JSR
            BRA     DOWN
            BRA     BRA
            BRA     BGT
            BRA     BLE
            BRA     BEQ
            BRA     $1
            BRA     $31
DOWN        BRA     $44
            BRA     $A0
            BRA     $EF
            BRA     $FF
            BRA     $2000
            BRA     $3000
            BRA     $A000
            BRA     $A00A

BGT         BGT     NOP
            BGT     RTS
            BGT     JSR
            BGT     DOWN
            BGT     BRA
            BGT     BGT
            BGT     BLE
            BGT     BEQ
            BGT     $1
            BGT     $31
            BGT     $44
            BGT     $A0
            BGT     $EF
            BGT     $FF
            BGT     $2000
            BGT     $3000
            BGT     $A000
            BGT     $A00A
            
BLE         BLE     NOP
            BLE     RTS
            BLE     JSR
            BLE     DOWN
            BLE     BRA
            BLE     BGT
            BLE     BLE
            BLE     BEQ
            BLE     $1
            BLE     $31
            BLE     $44
            BLE     $A0
            BLE     $EF
            BLE     $FF
            BLE     $2000
            BLE     $3000
            BLE     $A000
            BLE     $A00A
            
BEQ         BEQ     NOP
            BEQ     RTS
            BEQ     JSR
            BEQ     DOWN
            BEQ     BRA
            BEQ     BGT
            BEQ     BLE
            BEQ     BEQ
            BEQ     $1
            BEQ     $31
            BEQ     $44
            BEQ     $A0
            BEQ     $EF
            BEQ     $FF
            BEQ     $2000
            BEQ     $3000
            BEQ     $A000
            BEQ     $A00A
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
