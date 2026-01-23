"Z O R K   I   -  Main File"

"THE PROJECT"

<CONSTANT GAME-TITLE "Zork I: The Great Underground Empire">
<CONSTANT GAME-DESCRIPTION
"A ZIL Renovation by Alex Proudfoot">

<CONSTANT RELEASEID 0> <VERSION ZIP>
<CONSTANT UPDATEID 0> <CONSTANT BUGFIXID 0>


"THE MECHANICS"

<SETG USE-SCORING? T> <CONSTANT MAX-SCORE 350>

;"Z-machine version 3 - only 4/32 flags not already defined by ZILF Library"
<SETG EXTRA-FLAGS (BURNBIT CLIMBBIT RLANDBIT SACREDBIT)>

<INSERT-FILE "definitions">
<INSERT-FILE "parser">
<INSERT-FILE "messages">
<INSERT-FILE "game-hooks">
<INSERT-FILE "game-verbs">

<ROUTINE GO ()
    <SETG HERE WEST-OF-HOUSE>
    <MOVE PLAYER ,HERE>
    <CRLF> <V-VERSION>
    <CRLF> <V-LOOK>
    <MAIN-LOOP>>


"THE GAME"

<INSERT-FILE "locations">
<INSERT-FILE "actions">
