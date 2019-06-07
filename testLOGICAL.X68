*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
AND         AND.B       D3,D3
            AND.W       D0,D5
            AND.L       D0,D5
          
            AND.B       D3,(A3)
            AND.W       D0,(A5)
            AND.L       D0,(SP)
          
            AND.W       D3,-(A3)
            AND.L       D7,-(A5)
            AND.B       D1,-(SP)
          
            AND.L       D3,(A3)+
            AND.B       D7,(A5)+
            AND.W       D1,(SP)+
          
            AND.B       D3,$89
            AND.L       D7,$3000
            AND.W       D1,$FFFFB000
          
            AND.B       D3,$E000
            AND.W       D7,$AFFF
            AND.L       D1,$FFFF2000
          
            AND.L       (A3),D3
            AND.B       (A5),D0
            AND.W       (SP),D0
          
            AND.L       -(A3),D3
            AND.W       -(A5),D7
            AND.B       -(SP),D1
          
            AND.W       (A3)+,D3
            AND.L       (A5)+,D7
            AND.B       (SP)+,D1
          
            AND.W       $89,D3
            AND.B       $3000,D7
            AND.L       $FFFFB000,D1
          
            AND.B       $E000,D3
            AND.W       $AFFF,D7
            AND.L       $FFFF2000,D1
            
            AND.B       #$0,D3
            AND.B       #$FF,D7
            AND.B       #$08,D1
            
            AND.W       #$E000,D3
            AND.W       #$AFFF,D7
            AND.W       #$FFFF,D1
            
            AND.L       #$E000,D3
            AND.L       #$AFFF,D7
            AND.L       #$FFFF2000,D1
            
          
OR          OR.B       D3,D3
            OR.W       D0,D5
            OR.L       D0,D5
          
            OR.B       D3,(A3)
            OR.W       D0,(A5)
            OR.L       D0,(SP)
          
            OR.W       D3,-(A3)
            OR.L       D7,-(A5)
            OR.B       D1,-(SP)
          
            OR.L       D3,(A3)+
            OR.B       D7,(A5)+
            OR.W       D1,(SP)+
          
            OR.B       D3,$89
            OR.L       D7,$3000
            OR.W       D1,$FFFFB000
          
            OR.B       D3,$E000
            OR.W       D7,$AFFF
            OR.L       D1,$FFFF2000
          
            OR.L       (A3),D3
            OR.B       (A5),D0
            OR.W       (SP),D0
          
            OR.L       -(A3),D3
            OR.W       -(A5),D7
            OR.B       -(SP),D1
          
            OR.W       (A3)+,D3
            OR.L       (A5)+,D7
            OR.B       (SP)+,D1
          
            OR.W       $89,D3
            OR.B       $3000,D7
            OR.L       $FFFFB000,D1
          
            OR.B       $E000,D3
            OR.W       $AFFF,D7
            OR.L       $FFFF2000,D1
            
            OR.B       #$0,D3
            OR.B       #$FF,D7
            OR.B       #$08,D1
            
            OR.W       #$E000,D3
            OR.W       #$AFFF,D7
            OR.W       #$FFFF,D1
            
            OR.L       #$E000,D3
            OR.L       #$AFFF,D7
            OR.L       #$FFFF2000,D1
            
NOT         NOT.B       D0
            NOT.W       D1
            NOT.L       D6
            
            NOT.W       (A0)
            NOT.B       (A1)
            NOT.L       (A6)
            
            NOT.W       -(A0)
            NOT.L       -(A1)
            NOT.B       -(A6)
            
            NOT.L       (A0)+
            NOT.L       (A1)+
            NOT.W       (A6)+
            
            NOT.W       $4
            NOT.B       $4000
            NOT.W       $FFFFA000
            
            NOT.B       $0000A000
            NOT.W       $FFFF4000
            NOT.L       $89BF89BE
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
