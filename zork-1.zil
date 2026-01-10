;"ZORK-1.ZIL for Zork I: The Great Underground Empire"

<VERSION ZIP>
<CONSTANT RELEASEID 0>
<CONSTANT UPDATE 0>
<CONSTANT BUGFIX 0>

<CONSTANT GAME-BANNER
"Zork I: The Great Underground Empire|
A ZIL Renovation by Alex Proudfoot">

<ROUTINE GO ()
    <CRLF> <CRLF>
    <V-VERSION> <CRLF>
    <SETG HERE ,WEST-OF-HOUSE> <MOVE ,PLAYER ,HERE>
    <V-LOOK> <MAIN-LOOP>>

;"Z-machine version 3 - only 4/32 flags not already defined by ZILF Library"
<SETG EXTRA-FLAGS (BURNBIT CLIMBBIT RLANDBIT SACREDBIT)>

<INSERT-FILE "definitions">
<INSERT-FILE "parser">
<INSERT-FILE "messages">

<INSERT-FILE "forest">
