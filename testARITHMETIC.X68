*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
ADDB            ADD.B       D0,D1
                ADD.B       D3,D5
                ADD.B       D6,D7
                
                ADD.B       (A0),D1
                ADD.B       (A3),D5
                ADD.B       (SP),D7
                
                ADD.B       -(A0),D1
                ADD.B       -(A3),D5
                ADD.B       -(SP),D7
                
                ADD.B       (A0)+,D1
                ADD.B       (A3)+,D5
                ADD.B       (SP)+,D7
                
                ADD.B       #$9,D1         *These get converted to ADDI
                ADD.B       #$A9,D5
                ADD.B       #$7F,D7
                
                ADD.B       $9,D1
                ADD.B       $50A9,D5
                ADD.B       $FFFF9000,D7
                
                ADD.B       $12341234,D1
                ADD.B       $FFFF50A9,D5
                ADD.B       $9000,D7
                
                ADD.B       D1,(A0)
                ADD.B       D5,(A3)
                ADD.B       D7,(SP)
                
                ADD.B       D1,-(A0)
                ADD.B       D5,-(A3)
                ADD.B       D7,-(SP)
                
                ADD.B       D2,(A0)+
                ADD.B       D4,(A3)+
                ADD.B       D6,(SP)+
                
                ADD.B       D1,$9
                ADD.B       D5,$50A9
                ADD.B       D7,$FFFF9000
                
                ADD.B       D1,$12341234
                ADD.B       D5,$FFFF50A9
                ADD.B       D7,$9000
                
ADDW            ADD.W       D0,D1
                ADD.W       D3,D5
                ADD.W       D6,D7
                
                ADD.W       (A0),D1
                ADD.W       (A3),D5
                ADD.W       (SP),D7
                
                ADD.W       -(A0),D1
                ADD.W       -(A3),D5
                ADD.W       -(SP),D7
                
                ADD.W       (A0)+,D1
                ADD.W       (A3)+,D5
                ADD.W       (SP)+,D7
                
                ADD.W       #$9,D1         *These get converted to ADDI
                ADD.W       #$A9,D5
                ADD.W       #$7F,D7
                
                ADD.W       $9,D1
                ADD.W       $50A9,D5
                ADD.W       $FFFF9000,D7
                
                ADD.W       $12341234,D1
                ADD.W       $FFFF50A9,D5
                ADD.W       $9000,D7
                
                ADD.W       D1,(A0)
                ADD.W       D5,(A3)
                ADD.W       D7,(SP)
                
                ADD.W       D1,-(A0)
                ADD.W       D5,-(A3)
                ADD.W       D7,-(SP)
                
                ADD.W       D2,(A0)+
                ADD.W       D4,(A3)+
                ADD.W       D6,(SP)+
                
                ADD.W       D1,$9
                ADD.W       D5,$50A9
                ADD.W       D7,$FFFF9000
                
                ADD.W       D1,$12341234
                ADD.W       D5,$FFFF50A9
                ADD.W       D7,$9000
                
ADDL            ADD.L       D0,D1
                ADD.L       D3,D5
                ADD.L       D6,D7
                
                ADD.L       (A0),D1
                ADD.L       (A3),D5
                ADD.L       (SP),D7
                
                ADD.L       -(A0),D1
                ADD.L       -(A3),D5
                ADD.L       -(SP),D7
                
                ADD.L       (A0)+,D1
                ADD.L       (A3)+,D5
                ADD.L       (SP)+,D7
                
                *ADD.L      #$9,D1         These get converted to ADDI
                *ADD.L       #$A9,D5
                *ADD.L       #$7F,D7
                
                ADD.L       $9,D1
                ADD.L       $50A9,D5
                ADD.L       $FFFF9000,D7
                
                ADD.L       $12341234,D1
                ADD.L       $FFFF50A9,D5
                ADD.L       $9000,D7
                
                ADD.L       D1,(A0)
                ADD.L       D5,(A3)
                ADD.L       D7,(SP)
                
                ADD.L       D1,-(A0)
                ADD.L       D5,-(A3)
                ADD.L       D7,-(SP)
                
                ADD.L       D2,(A0)+
                ADD.L       D4,(A3)+
                ADD.L       D6,(SP)+
                
                ADD.L       D1,$9
                ADD.L       D5,$50A9
                ADD.L       D7,$FFFF9000
                
                ADD.L       D1,$12341234
                ADD.L       D5,$FFFF50A9
                ADD.L       D7,$9000
                
ADDAW           ADDA.W       D0,A1
                ADDA.W       D3,A5
                ADDA.W       D6,SP
                
                ADDA.W       (A0),A1
                ADDA.W       (A3),A5
                ADDA.W       (SP),SP
                
                ADDA.W       -(A0),A1
                ADDA.W       -(A3),A5
                ADDA.W       -(SP),A6
                
                ADDA.W       (A0)+,A1
                ADDA.W       (A3)+,A5
                ADDA.W       (SP)+,A6
                
                ADDA.W       #$9,A1
                ADDA.W       #$A9,A5
                ADDA.W       #$7F,SP
                
                ADDA.W       $9,A1
                ADDA.W       $50A9,A5
                ADDA.w       $FFFF9000,A2
                
                ADDA.W      $12341234,A1
                ADDA.W      $FFFF50A9,A5
                ADDA.W      $9000,A4
                
ADDAL           ADDA.L       D0,A1
                ADDA.L       D3,A5
                ADDA.L       D6,SP
                
                ADDA.L       (A0),A1
                ADDA.L       (A3),A5
                ADDA.L       (SP),SP
                
                ADDA.L       -(A0),A1
                ADDA.L       -(A3),A5
                ADDA.L       -(SP),A6
                
                ADDA.L       (A0)+,A1
                ADDA.L       (A3)+,A5
                ADDA.L       (SP)+,A6
                
                ADDA.L       #$9,A1
                ADDA.L       #$A9,A5
                ADDA.L       #$7F,SP
                
                ADDA.L       #$9,A1
                ADDA.L       #$A9,A5
                ADDA.L       #$9000,SP
                ADDA.L       #$FF9000,SP
                ADDA.L       #$0999007F,SP
                
                ADDA.L       $9,A1
                ADDA.L       $50A9,A5
                ADDA.L       $FFFF9000,A2
                
                ADDA.L      $12341234,A1
                ADDA.L      $FFFF50A9,A5
                ADDA.L      $9000,A4
                
ADDQB           ADDQ.B        #3,D0
                ADDQ.B        #1,D1
                ADDQ.B        #4,D6
                ADDQ.B        #8,D7
                
                ADDQ.B        #2,-(A0)
                ADDQ.B        #5,-(A1)
                ADDQ.B        #7,-(A6)
                ADDQ.B        #6,-(SP)
                
                ADDQ.B        #2,(A0)+
                ADDQ.B        #5,(A1)+
                ADDQ.B        #7,(A6)+
                ADDQ.B        #6,(SP)+
                
                ADDQ.B        #3,$1000
                ADDQ.B        #5,$2000
                ADDQ.B        #7,$1
                ADDQ.B        #6,$FFFF9000
                
                ADDQ.B        #2,$FFFF1000
                ADDQ.B        #5,$FFFF2000
                ADDQ.B        #7,$A000
                ADDQ.B        #6,$8000

ADDQW           ADDQ        #3,D0
                ADDQ        #1,D1
                ADDQ        #4,D6
                ADDQ        #8,D7
                
                ADDQ.W        #3,D0         *should be same as above block
                ADDQ.W        #1,D1
                ADDQ.W        #4,D6
                ADDQ.W        #8,D7
                
                ADDQ        #3,A0
                ADDQ        #1,A1
                ADDQ        #4,A6
                ADDQ        #8,SP
                
                ADDQ        #2,(A0)
                ADDQ        #5,(A1)
                ADDQ        #7,(A6)
                ADDQ        #6,(SP)
                
                ADDQ        #2,-(A0)
                ADDQ        #5,-(A1)
                ADDQ        #7,-(A6)
                ADDQ        #6,-(SP)
                
                ADDQ        #2,(A0)+
                ADDQ        #5,(A1)+
                ADDQ        #7,(A6)+
                ADDQ        #6,(SP)+
                
                ADDQ        #3,$1000
                ADDQ        #5,$2000
                ADDQ        #7,$1
                ADDQ        #6,$FFFF9000
                
                ADDQ        #2,$FFFF1000
                ADDQ        #5,$FFFF2000
                ADDQ        #7,$A000
                ADDQ        #6,$8000
                
ADDQL           ADDQ.L        #3,D0
                ADDQ.L        #1,D1
                ADDQ.L        #4,D6
                ADDQ.L        #8,D7
                
                ADDQ.L        #3,A0
                ADDQ.L        #1,A1
                ADDQ.L        #4,A6
                ADDQ.L        #8,SP
                
                ADDQ.L        #2,(A0)
                ADDQ.L        #5,(A1)
                ADDQ.L        #7,(A6)
                ADDQ.L        #6,(SP)
                
                ADDQ.L        #2,-(A0)
                ADDQ.L        #5,-(A1)
                ADDQ.L        #7,-(A6)
                ADDQ.L        #6,-(SP)
                
                ADDQ.L        #2,(A0)+
                ADDQ.L        #5,(A1)+
                ADDQ.L        #7,(A6)+
                ADDQ.L        #6,(SP)+
                
                ADDQ.L        #3,$1000
                ADDQ.L        #5,$2000
                ADDQ.L        #7,$1
                ADDQ.L        #6,$FFFF9000
                
                ADDQ.L        #2,$FFFF1000
                ADDQ.L        #5,$FFFF2000
                ADDQ.L        #7,$A000
                ADDQ.L        #6,$8000
                
                
SUBB            SUB.B       D0,D1
                SUB.B       D3,D5
                SUB.B       D6,D7
                
                SUB.B       (A0),D1
                SUB.B       (A3),D5
                SUB.B       (SP),D7
                
                SUB.B       -(A0),D1
                SUB.B       -(A3),D5
                SUB.B       -(SP),D7
                
                SUB.B       (A0)+,D1
                SUB.B       (A3)+,D5
                SUB.B       (SP)+,D7
                
                SUB.B       #$9,D1         These get converted to SUBI
                SUB.B       #$A9,D5
                SUB.B       #$7F,D7
                
                SUB.B       $9,D1
                SUB.B       $50A9,D5
                SUB.B       $FFFF9000,D7
                
                SUB.B       $12341234,D1
                SUB.B       $FFFF50A9,D5
                SUB.B       $9000,D7
                
                SUB.B       D1,(A0)
                SUB.B       D5,(A3)
                SUB.B       D7,(SP)
                
                SUB.B       D1,-(A0)
                SUB.B       D5,-(A3)
                SUB.B       D7,-(SP)
                
                SUB.B       D2,(A0)+
                SUB.B       D4,(A3)+
                SUB.B       D6,(SP)+
                
                SUB.B       D1,$9
                SUB.B       D5,$50A9
                SUB.B       D7,$FFFF9000
                
                SUB.B       D1,$12341234
                SUB.B       D5,$FFFF50A9
                SUB.B       D7,$9000
                
SUBW            SUB.W       D0,D1
                SUB.W       D3,D5
                SUB.W       D6,D7
                
                SUB.W       (A0),D1
                SUB.W       (A3),D5
                SUB.W       (SP),D7
                
                SUB.W       -(A0),D1
                SUB.W       -(A3),D5
                SUB.W       -(SP),D7
                
                SUB.W       (A0)+,D1
                SUB.W       (A3)+,D5
                SUB.W       (SP)+,D7
                
                SUB.W       #$9,D1         These get converted to SUBI
                SUB.W       #$A9,D5
                SUB.W       #$7F,D7
                
                SUB.W       $9,D1
                SUB.W       $50A9,D5
                SUB.W       $FFFF9000,D7
                
                SUB.W       $12341234,D1
                SUB.W       $FFFF50A9,D5
                SUB.W       $9000,D7
                
                SUB.W       D1,(A0)
                SUB.W       D5,(A3)
                SUB.W       D7,(SP)
                
                SUB.W       D1,-(A0)
                SUB.W       D5,-(A3)
                SUB.W       D7,-(SP)
                
                SUB.W       D2,(A0)+
                SUB.W       D4,(A3)+
                SUB.W       D6,(SP)+
                
                SUB.W       D1,$9
                SUB.W       D5,$50A9
                SUB.W       D7,$FFFF9000
                
                SUB.W       D1,$12341234
                SUB.W       D5,$FFFF50A9
                SUB.W       D7,$9000
                
SUBL            SUB.L       D0,D1
                SUB.L       D3,D5
                SUB.L       D6,D7
                
                SUB.L       (A0),D1
                SUB.L       (A3),D5
                SUB.L       (SP),D7
                
                SUB.L       -(A0),D1
                SUB.L       -(A3),D5
                SUB.L       -(SP),D7
                
                SUB.L       (A0)+,D1
                SUB.L       (A3)+,D5
                SUB.L       (SP)+,D7
                
                SUB.L      #$9,D1         These get converted to ADDI
                SUB.L       #$A9,D5
                SUB.L       #$7F,D7
                
                SUB.L       $9,D1
                SUB.L       $50A9,D5
                SUB.L       $FFFF9000,D7
                
                SUB.L       $12341234,D1
                SUB.L       $FFFF50A9,D5
                SUB.L       $9000,D7
                
                SUB.L       D1,(A0)
                SUB.L       D5,(A3)
                SUB.L       D7,(SP)
                
                SUB.L       D1,-(A0)
                SUB.L       D5,-(A3)
                SUB.L       D7,-(SP)
                
                SUB.L       D2,(A0)+
                SUB.L       D4,(A3)+
                SUB.L       D6,(SP)+
                
                SUB.L       D1,$9
                SUB.L       D5,$50A9
                SUB.L       D7,$FFFF9000
                
                SUB.L       D1,$12341234
                SUB.L       D5,$FFFF50A9
                SUB.L       D7,$9000
                
SUBQW           SUBQ        #3,D0
                SUBQ        #1,D1
                SUBQ        #4,D6
                SUBQ        #8,D7
                
                SUBQ.W        #3,D0         *should be same as above block
                SUBQ.W        #1,D1
                SUBQ.W        #4,D6
                SUBQ.W        #8,D7
                
                SUBQ        #3,A0
                SUBQ        #1,A1
                SUBQ        #4,A6
                SUBQ        #8,SP
                
                SUBQ        #2,(A0)
                SUBQ        #5,(A1)
                SUBQ        #7,(A6)
                SUBQ        #6,(SP)
                
                SUBQ        #2,-(A0)
                SUBQ        #5,-(A1)
                SUBQ        #7,-(A6)
                SUBQ        #6,-(SP)
                
                SUBQ        #2,(A0)+
                SUBQ        #5,(A1)+
                SUBQ        #7,(A6)+
                SUBQ        #6,(SP)+
                
                SUBQ        #3,$1000
                SUBQ        #5,$2000
                SUBQ        #7,$1
                SUBQ        #6,$FFFF9000
                
                SUBQ        #2,$FFFF1000
                SUBQ        #5,$FFFF2000
                SUBQ        #7,$A000
                SUBQ        #6,$8000

                
SUBQL           SUBQ.L        #3,D0
                SUBQ.L        #1,D1
                SUBQ.L        #4,D6
                SUBQ.L        #8,D7
                
                SUBQ.L        #3,A0
                SUBQ.L        #1,A1
                SUBQ.L        #4,A6
                SUBQ.L        #8,SP
                
                SUBQ.L        #2,(A0)
                SUBQ.L        #5,(A1)
                SUBQ.L        #7,(A6)
                SUBQ.L        #6,(SP)
                
                SUBQ.L        #2,-(A0)
                SUBQ.L        #5,-(A1)
                SUBQ.L        #7,-(A6)
                SUBQ.L        #6,-(SP)
                
                SUBQ.L        #2,(A0)+
                SUBQ.L        #5,(A1)+
                SUBQ.L        #7,(A6)+
                SUBQ.L        #6,(SP)+
                
                SUBQ.L        #3,$1000
                SUBQ.L        #5,$2000
                SUBQ.L        #7,$1
                SUBQ.L        #6,$FFFF9000
                
                SUBQ.L        #2,$FFFF1000
                SUBQ.L        #5,$FFFF2000
                SUBQ.L        #7,$A000
                SUBQ.L        #6,$8000

                
MULS            MULS        D0,D1
                MULS        D7,D4
                
                MULS        (A0),D1
                MULS        (A4),D4
                MULS        (SP),D6
                
                MULS        -(A1),D1
                MULS        -(A4),D4
                MULS        -(SP),D4
                
                MULS        (A1)+,D3
                MULS        (A4)+,D4
                MULS        (SP)+,D7
                
                MULS        $7,D3
                MULS        $7000,D4
                MULS        $350,D7
                MULS        $FFFF8000,D7
                
                MULS        $00009000,D3
                MULS        $FFFF7000,D4
                MULS        $123A350,D7
                MULS        $EF11,D7
                
                MULS        #$9,D3
                MULS        #$AE,D4
                MULS        #$FF,D7
                
                MULS        #$98E0,D7
                MULS        #$AA99,D7
                MULS        #$DA0A,D7
                
MULU            MULU        D0,D1
                MULU        D7,D4
                
                MULU        (A0),D1
                MULU        (A4),D4
                MULU        (SP),D6
                
                MULU        -(A1),D1
                MULU        -(A4),D4
                MULU        -(SP),D4
                
                MULU        (A1)+,D3
                MULU        (A4)+,D4
                MULU        (SP)+,D7
                
                MULU        $7,D3
                MULU        $7000,D4
                MULU        $350,D7
                MULU        $FFFF8000,D7
                
                MULU        $00009000,D3
                MULU        $FFFF7000,D4
                MULU        $123A350,D7
                MULU        $EF11,D7
                
                MULU        #$9,D3
                MULU        #$AE,D4
                MULU        #$FF,D7
                
                MULU        #$98E0,D7
                MULU        #$AA99,D7
                MULU        #$DA0A,D7
                
DIVS            DIVS        D0,D1
                DIVS        D7,D4
                
                DIVS        (A0),D1
                DIVS        (A4),D4
                DIVS        (SP),D6
                
                DIVS        -(A1),D1
                DIVS        -(A4),D4
                DIVS        -(SP),D4
                
                DIVS        (A1)+,D3
                DIVS        (A4)+,D4
                DIVS        (SP)+,D7
                
                DIVS        $7,D3
                DIVS        $7000,D4
                DIVS        $350,D7
                DIVS        $FFFF8000,D7
                
                DIVS        $00009000,D3
                DIVS        $FFFF7000,D4
                DIVS        $123A350,D7
                DIVS        $EF11,D7
                
                DIVS        #$9,D3
                DIVS        #$AE,D4
                DIVS        #$FF,D7
                
                DIVS        #$98E0,D7
                DIVS        #$AA99,D7
                DIVS        #$DA0A,D7

                
DIVU            DIVU        D0,D1
                DIVU        D7,D4
                
                DIVU        (A0),D1
                DIVU        (A4),D4
                DIVU        (SP),D6
                
                DIVU        -(A1),D1
                DIVU        -(A4),D4
                DIVU        -(SP),D4
                
                DIVU        (A1)+,D3
                DIVU        (A4)+,D4
                DIVU        (SP)+,D7
                
                DIVU        $7,D3
                DIVU        $7000,D4
                DIVU        $350,D7
                DIVU        $FFFF8000,D7
                
                DIVU        $00009000,D3
                DIVU        $FFFF7000,D4
                DIVU        $123A350,D7
                DIVU        $EF11,D7
                
                DIVU        #$9,D3
                DIVU        #$AE,D4
                DIVU        #$FF,D7
                
                DIVU        #$98E0,D7
                DIVU        #$AA99,D7
                DIVU        #$DA0A,D7


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
