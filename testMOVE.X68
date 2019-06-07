*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------

MOVEB		    MOVE.B	D0,D7
                MOVE.B	D5,D3
                
                MOVE.B  (A4),D2
                MOVE.B  -(A4),D2
                MOVE.B  (A4)+,D2
                MOVE.B  -(SP),D2
                MOVE.B  (SP)+,D2
                
                MOVE.B  D2,(A4)
                MOVE.B  D2,-(A4)
                MOVE.B  D2,(A4)+
                MOVE.B  D2,-(SP)
                MOVE.B  D2,(SP)+
                
                MOVE.B  (A2),(A2)
                MOVE.B  (A4),-(A0)
                MOVE.B  (A4),(A3)+
                MOVE.B  (SP),(SP)
                
                MOVE.B  -(A2),(A2)
                MOVE.B  -(A4),-(A0)
                MOVE.B  -(A4),(A3)+
                MOVE.B  -(SP),(SP)
                
                MOVE.B  (A2)+,(A2)
                MOVE.B  (A4)+,-(A0)
                MOVE.B  (A4)+,(A3)+
                MOVE.B  (SP)+,(SP)
                
                MOVE.B  #$AE,D0
                MOVE.B  #$1,D1
                MOVE.B  #$AE,(A0)
                MOVE.B  #$1,-(SP)
                MOVE.B  #$1,(A6)+
                
                MOVE.B  $AE09,D0
                MOVE.B  $1012,D1
                MOVE.B  $1A1E,(A0)
                MOVE.B  $9011,-(SP)
                MOVE.B  $7811,(A6)+
                
                MOVE.B  $12AE09,D0
                MOVE.B  $911012,D1
                MOVE.B  $FF1A1E,(A0)
                MOVE.B  $FFFF5011,-(SP)
                MOVE.B  $FFFF9011,-(SP)
                MOVE.B  $9011,-(SP)
                MOVE.B  $F8F97811,(A6)+
                MOVE.B  $00006811,(A6)+
                MOVE.B  $00008811,(A6)+
                MOVE.B  $00000000,(A6)+
                
                MOVE.B  D0,$AE09
                MOVE.B  (A0),$1012
                MOVE.B  -(A0),$1A1E
                MOVE.B  -(SP),$9011
                MOVE.B  (SP)+,$7811
                
                MOVE.B  $12AE09,$12AE08
                MOVE.B  $911012,$911011
                MOVE.B  $FF1A1E,$FF1A1A
                MOVE.B  $FFFF5011,$FF1A10
                MOVE.B  $FFFF9011,$9011
                MOVE.B  $9011,$FFFF9011
                MOVE.B  $F8F97811,$0000AE9A
                MOVE.B  $00006811,$89
                MOVE.B  $00008811,$8811
                MOVE.B  $00000000,$7FFF
                
MOVEW		    MOVE.W	D0,D1
                MOVE.W	D5,D3
                
                MOVE.W  (A4),D2
                MOVE.W  -(A4),D2
                MOVE.W  (A4)+,D2
                MOVE.W  -(SP),D2
                MOVE.W  (SP)+,D2
                
                MOVE.W  D2,(A4)
                MOVE.W  D2,-(A4)
                MOVE.W  D2,(A4)+
                MOVE.W  D2,-(SP)
                MOVE.W  D2,(SP)+
                
                MOVE.W  (A2),(A2)
                MOVE.W  (A4),-(A0)
                MOVE.W  (A4),(A3)+
                MOVE.W  (SP),(SP)
                
                MOVE.W  -(A2),(A2)
                MOVE.W  -(A4),-(A0)
                MOVE.W  -(A4),(A3)+
                MOVE.W  -(SP),(SP)
                
                MOVE.W  (A2)+,(A2)
                MOVE.W  (A4)+,-(A0)
                MOVE.W  (A4)+,(A3)+
                MOVE.W  (SP)+,(SP)
                
                MOVE.W  #$AE,D0
                MOVE.W  #$1,D1
                MOVE.W  #$AE,(A0)
                MOVE.W  #$1,-(SP)
                MOVE.W  #$1,(A6)+
                MOVE.W  #$AAAE,D0
                
                MOVE.W  $AE09,D0
                MOVE.W  $1012,D1
                MOVE.W  $1A1E,(A0)
                MOVE.W  $9011,-(SP)
                MOVE.W  $7811,(A6)+
                
                MOVE.W  $12AE09,D0
                MOVE.W  $911012,D1
                MOVE.W  $FF1A1E,(A0)
                MOVE.W  $FFFF5011,-(SP)
                MOVE.W  $FFFF9011,-(SP)
                MOVE.W  $9011,-(SP)
                MOVE.W  $F8F97811,(A6)+
                MOVE.W  $00006811,(A6)+
                MOVE.W  $00008811,(A6)+
                MOVE.W  $00000000,(A6)+
                
                MOVE.W  D0,$AE09
                MOVE.W  (A0),$1012
                MOVE.W  -(A0),$1A1E
                MOVE.W  -(SP),$9011
                MOVE.W  (SP)+,$7811
                
                MOVE.W  $12AE09,$12AE08
                MOVE.W  $911012,$911011
                MOVE.W  $FF1A1E,$FF1A1A
                MOVE.W  $FFFF5011,$FF1A10
                MOVE.W  $FFFF9011,$9011
                MOVE.W  $9011,$FFFF9011
                MOVE.W  $F8F97811,$0000AE9A
                MOVE.W  $00006811,$89
                MOVE.W  $00008811,$8811
                MOVE.W  $00000000,$7FFF

MOVEL		    MOVE.L	D0,D1
                MOVE.L	D5,D3
                
                MOVE.L  (A4),D2
                MOVE.L  -(A0),D0
                MOVE.L  (A4)+,D2
                MOVE.L  -(SP),D2
                MOVE.L  (SP)+,D2
                
                MOVE.L  D2,(A4)
                MOVE.L  D2,-(A4)
                MOVE.L  D2,(A4)+
                MOVE.L  D2,-(SP)
                MOVE.L  D2,(SP)+
                
                MOVE.L  (A2),(A2)
                MOVE.L  (A4),-(A0)
                MOVE.L  (A4),(A3)+
                MOVE.L  (SP),(SP)
                
                MOVE.L  -(A2),(A2)
                MOVE.L  -(A4),-(A0)
                MOVE.L  -(A4),(A3)+
                MOVE.L  -(SP),(SP)
                
                MOVE.L  (A2)+,(A2)
                MOVE.L  (A4)+,-(A0)
                MOVE.L  (A4)+,(A3)+
                MOVE.L  (SP)+,(SP)
                
                MOVE.L  #$AE,D0
                *MOVE.L  #$1,D1 test later changes to MOVEQ automatically
                MOVE.L  #$AE,(A0)
                MOVE.L  #$908811,-(SP)
                MOVE.L  #$1,(A6)+
                
                MOVE.L  $AE09,D0
                MOVE.L  $1012,D1
                MOVE.L  $1A1E,(A0)
                MOVE.L  $9011,-(SP)
                MOVE.L  $7811,(A6)+
                
                MOVE.L  $12AE09,D0
                MOVE.L  $911012,D1
                MOVE.L  $FF1A1E,(A0)
                MOVE.L  $FFFF5011,-(SP)
                MOVE.L  $FFFF9011,-(SP)
                MOVE.L  $9011,-(SP)
                MOVE.L  $F8F97811,(A6)+
                MOVE.L  $00006811,(A6)+
                MOVE.L  $00008811,(A6)+
                MOVE.L  $00000000,(A6)+
                
                MOVE.L  D0,$AE09
                MOVE.L  (A0),$1012
                MOVE.L  -(A0),$1A1E
                MOVE.L  -(SP),$9011
                MOVE.L  (SP)+,$7811
                
                MOVE.L  $12AE09,$12AE08
                MOVE.L  $911012,$911011
                MOVE.L  $FF1A1E,$FF1A1A
                MOVE.L  $FFFF5011,$FF1A10
                MOVE.L  $FFFF9011,$9011
                MOVE.L  $9011,$FFFF9011
                MOVE.L  $F8F97811,$0000AE9A
                MOVE.L  $00006811,$89
                MOVE.L  $00008811,$8811
                MOVE.L  $00000000,$7FFF




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
