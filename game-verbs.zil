"Z O R K   I  -  Verbs File"

"Directionless Walking"

<SYNTAX WALK = V-WALK-AROUND>
<SYNTAX WALK AROUND OBJECT = V-WALK-AROUND>

<ROUTINE V-WALK-AROUND ()
    <TELL "Use compass directions for movement." CR>>

<GLOBAL HOUSE-AROUND
    <LTABLE (PURE) WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
        WEST-OF-HOUSE>>

;<GLOBAL IN-HOUSE-AROUND
    <LTABLE (PURE) LIVING-ROOM KITCHEN ATTIC KITCHEN>>

;<GLOBAL ABOVE-GROUND
    <LTABLE (PURE) WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
        FOREST-1 FOREST-2 FOREST-3 PATH CLEARING GRATING-CLEARING
        CANYON-VIEW>>

<ROUTINE GO-NEXT (TBL "AUX" VAL)
    <COND
        (<SET VAL <LKP ,HERE .TBL>>
            <COND
                (<NOT <GOTO .VAL>> 2)
                    (T 1)>)>>

<ROUTINE LKP (ITM TBL "AUX" (CNT 0) (LEN <GET .TBL 0>))
    <REPEAT ()
        <COND
            (<G? <SET CNT <+ .CNT 1>> .LEN>
                <RFALSE>)
            (<EQUAL? <GET .TBL .CNT> .ITM>
                <COND
                    (<EQUAL? .CNT .LEN>
                        <RFALSE>)
                    (T
                        <RETURN <GET .TBL <+ .CNT 1>>>)>)>>>


"Finding"


"Listening"


