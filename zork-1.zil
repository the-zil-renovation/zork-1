"Z O R K   I   -  Main File"

<CONSTANT GAME-TITLE "Zork I: The Great Underground Empire">
<CONSTANT GAME-DESCRIPTION
"A ZIL Renovation by Alex Proudfoot">

<CONSTANT RELEASEID 0> <VERSION ZIP>
<CONSTANT UPDATEID 0> <CONSTANT BUGFIXID 0>

<SETG USE-SCORING? T> <CONSTANT MAX-SCORE 350>

;"Z-machine version 3 - only 4/32 flags not already defined by ZILF Library"
<SETG EXTRA-FLAGS (BURNBIT CLIMBBIT RLANDBIT SACREDBIT)>

<INSERT-FILE "definition-delays">
<INSERT-FILE "parser">
<INSERT-FILE "definition-replacements">
<INSERT-FILE "message-replacements">
<INSERT-FILE "game-verbs">

<ROUTINE GO ()
    <V-VERSION> <CRLF>
    <SETG HERE ,WEST-OF-HOUSE>
    <MOVE ,PLAYER ,HERE>
    <V-LOOK>
    <MAIN-LOOP>>

<INSERT-FILE "locations">
<INSERT-FILE "actions">
