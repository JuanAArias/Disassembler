*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------

LSLM        LSL     (A0)
            LSL     (A5)
            LSL     (SP)
            
            LSL     -(A0)
            LSL     -(A5)
            LSL     -(SP)
            
            LSL     (A0)+
            LSL     (A5)+
            LSL     (SP)+
            
            LSL     $4000
            LSL     $FFFFA000
            LSL     $098
            
            LSL     $FFFF4000
            LSL     $A000
            LSL     $098098
            
LSRM        LSR     (A0)
            LSR     (A5)
            LSR     (SP)
            
            LSR     -(A0)
            LSR     -(A5)
            LSR     -(SP)
            
            LSR     (A0)+
            LSR     (A5)+
            LSR     (SP)+
            
            LSR     $4000
            LSR     $FFFFA000
            LSR     $098
            
            LSR     $FFFF4000
            LSR     $A000
            LSR     $098098
            
ASLM        ASL     (A0)
            ASL     (A5)
            ASL     (SP)
            
            aSL     -(A0)
            ASL     -(A5)
            ASL     -(SP)
            
            ASL     (A0)+
            ASL     (A5)+
            ASL     (SP)+
            
            ASL     $4000
            ASL     $FFFFA000
            ASL     $098
            
            ASL     $FFFF4000
            ASL     $A000
            ASL     $098098
            
ASRM        ASR     (A0)
            ASR     (A5)
            ASR     (SP)
            
            ASR     -(A0)
            ASR     -(A5)
            ASR     -(SP)
            
            ASR     (A0)+
            ASR     (A5)+
            ASR     (SP)+
            
            ASR     $4000
            ASR     $FFFFA000
            ASR     $098
            
            ASR     $FFFF4000
            ASR     $A000
            ASR     $098098
            
ROLM        ROL     (A0)
            ROL     (A5)
            ROL     (SP)
            
            ROL     -(A0)
            ROL     -(A5)
            ROL     -(SP)
            
            ROL     (A0)+
            ROL     (A5)+
            ROL     (SP)+
            
            ROL     $4000
            ROL     $FFFFA000
            ROL     $098
            
            ROL     $FFFF4000
            ROL     $A000
            ROL     $098098
            
RORM        ROR     (A0)
            ROR     (A5)
            ROR     (SP)
            
            ROR     -(A0)
            ROR     -(A5)
            ROR     -(SP)
            
            ROR     (A0)+
            ROR     (A5)+
            ROR     (SP)+
            
            ROR     $4000
            ROR     $FFFFA000
            ROR     $098
            
            ROR     $FFFF4000
            ROR     $A000
            ROR     $098098
            
LSL         LSL.L     #1,D0
            LSL.B     #2,D3
            LSL.B     #5,D1
            LSL.W     #7,D6
            LSL.L     #8,D7
            
            LSL.B     D1,D0
            LSL.W     D2,D3
            LSL.L     D5,D1
            LSL.W     D7,D6
            LSL.B     D0,D7
            
LSR         LSR.L     #1,D0
            LSR.B     #2,D3
            LSR.B     #5,D1
            LSR.W     #7,D6
            LSR.L     #8,D7
            
            LSR.B     D1,D0
            LSR.W     D2,D3
            LSR.L     D5,D1
            LSR.W     D7,D6
            LSR.B     D0,D7
            
ASL         ASL.L     #1,D0
            ASL.B     #2,D3
            ASL.B     #5,D1
            ASL.W     #7,D6
            ASL.L     #8,D7
            
            ASL.B     D1,D0
            ASL.W     D2,D3
            ASL.L     D5,D1
            ASL.W     D7,D6
            ASL.B     D0,D7
            
ASR         ASR.L     #1,D0
            ASR.B     #2,D3
            ASR.B     #5,D1
            ASR.W     #7,D6
            ASR.L     #8,D7
            
            ASR.B     D1,D0
            ASR.W     D2,D3
            ASR.L     D5,D1
            ASR.W     D7,D6
            ASR.B     D0,D7
            
ROL         ROL.L     #1,D0
            ROL.B     #2,D3
            ROL.B     #5,D1
            ROL.W     #7,D6
            ROL.L     #8,D7
            
            ROL.B     D1,D0
            ROL.W     D2,D3
            ROL.L     D5,D1
            ROL.W     D7,D6
            ROL.B     D0,D7
            
ROR         ROR.L     #1,D0
            ROR.B     #2,D3
            ROR.B     #5,D1
            ROR.W     #7,D6
            ROR.L     #8,D7
            
            ROR.B     D1,D0
            ROR.W     D2,D3
            ROR.L     D5,D1
            ROR.W     D7,D6
            ROR.B     D0,D7

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
