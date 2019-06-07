*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------

MOVEAW		    MOVEA.W	D0,A1
                MOVEA.W	D5,A3
                
                MOVEA.W  (A4),A2
                MOVEA.W  -(A4),A2
                MOVEA.W  (A4)+,A2
                MOVEA.W  -(SP),A2
                MOVEA.W  (SP)+,A2
                
                MOVEA.W  #$AE,A0
                MOVEA.W  #$121F,A1
                MOVEA.W  #$E,A5
                MOVEA.W  #$1,SP
                MOVEA.W  #$F11,A6
                
                MOVEA.W  $AE09,A0
                MOVEA.W  $1012,A1
                MOVEA.W  $1A1E,A4
                MOVEA.W  $9011,SP
                MOVEA.W  $7811,A5
                MOVEA.W  $11,A5
                
                MOVEA.W  $12AE09,A0
                MOVEA.W  $911012,A1
                MOVEA.W  $FF1A1E,A2
                MOVEA.W  $FFFF5011,A3
                MOVEA.W  $FFFF9011,A4
                MOVEA.W  $9011,SP
                MOVEA.W  $F8F97811,A5
                MOVEA.W  $00006811,A6
                MOVEA.W  $00008811,SP
                MOVEA.W  $00000000,SP
                

MOVEAL		    MOVEA.L	D0,A1
                MOVEA.L	D5,A3
                
                MOVEA.L  (A4),A2
                MOVEA.L  -(A4),A2
                MOVEA.L  (A4)+,A2
                MOVEA.L  -(SP),A2
                MOVEA.L  (SP)+,A2
                
                MOVEA.L  #$AE,A0
                MOVEA.L  #$121F,A1
                MOVEA.L  #$E,A5
                MOVEA.L  #$1,SP
                MOVEA.L  #$F11,A6
                MOVEA.L  #$FF90F1,A6
                MOVEA.L  #$7FFF,A6
                MOVEA.L  #$8000,A6
                MOVEA.L  #$01238000,A6
                
                MOVEA.L  $AE09,A0
                MOVEA.L  $1012,A1
                MOVEA.L  $1A1E,A4
                MOVEA.L  $9011,SP
                MOVEA.L  $7811,A5
                MOVEA.L  $11,A5
                
                MOVEA.L  $12AE09,A0
                MOVEA.L  $911012,A1
                MOVEA.L  $FF1A1E,A2
                MOVEA.L  $FFFF5011,A3
                MOVEA.L  $FFFF9011,A4
                MOVEA.L  $9011,SP
                MOVEA.L  $F8F97811,A5
                MOVEA.L  $00006811,A6
                MOVEA.L  $00008811,SP
                MOVEA.L  $00000000,SP
                
MOVEQ           MOVEQ   #$A,D0
                MOVEQ   #$0,D1
                MOVEQ   #$99,D2
                MOVEQ   #$A1,D3
                MOVEQ   #$7E,D4
                MOVEQ   #$E,D5
                MOVEQ   #$E1,D6
                MOVEQ   #$F4,D7
                
MOVEMW          MOVEM.W   A0,-(SP)
                MOVEM.W   D0,-(SP)
                MOVEM.W   A0-A4,-(SP)
                MOVEM.W   D4-D7,-(SP)
                MOVEM.W   A0-A4/A6/D2-D5,-(SP)
                MOVEM.W   D4,(A0)
                MOVEM.W   A2-A5,$5000
                MOVEM.W   D1/D3-D4/D6/A2-A4/A6,$FFFF5000
                
                MOVEM.W   (SP)+,A0
                MOVEM.W   (SP)+,D0
                MOVEM.W   (SP)+,A0-A4
                MOVEM.W   (SP)+,D4-D7
                MOVEM.W   (SP)+,A0-A4/A6/D2-D5
                MOVEM.W   (A0),D4
                MOVEM.W   $5000,A2-A5
                MOVEM.W   $FFFF5000,D1/D3-D4/D6/A2-A4/A6

MOVEML          MOVEM.L   A0,-(SP)
                MOVEM.L   D0,-(SP)
                MOVEM.L   A0-A4,-(SP)
                MOVEM.L   D4-D7,-(SP)
                MOVEM.L   A0-A4/A6/D2-D5,-(SP)
                MOVEM.L   D4,(A0)
                MOVEM.L   A2-A5,$5000
                MOVEM.L   D1/D3-D4/D6/A2-A4/A6,$FFFF5000
                
                MOVEM.L   (SP)+,A0
                MOVEM.L   (SP)+,D0
                MOVEM.L   (SP)+,A0-A4
                MOVEM.L   (SP)+,D4-D7
                MOVEM.L   (SP)+,A0-A4/A6/D2-D5
                MOVEM.L   (A0),D4
                MOVEM.L   $5000,A2-A5
                MOVEM.L   $FFFF5000,D1/D3-D4/D6/A2-A4/A6
                
LEA             LEA         (A0),A0
                LEA         (A1),A6
                LEA         (SP),A2
                LEA         (A3),SP
            
                LEA         $0,A0
                LEA         $90,A6
                LEA         $5690,A2
                LEA         $6000,SP
                LEA         $FFFFA000,SP
            
                LEA         $8000,A0
                LEA         $FFFF4000,A6
                LEA         $0000A000,A2
                LEA         $003389AE,SP


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
