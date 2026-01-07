;"ZORK-1.ZIL for Zork I: The Great Underground Empire"

<CONSTANT RELEASEID 0> <VERSION ZIP> ;"Z-machine version 3"
<CONSTANT UPDATE "0"> <CONSTANT BUGFIX "0"> ;"Semantic Versioning"
<CONSTANT GAME-BANNER
"Zork I: The Great Underground Empire|
A ZIL Renovation by Alex Proudfoot">

;"Z-machine version 3 - only 4/32 flags not already defined by ZILF Library"
<SETG EXTRA-FLAGS (BURNBIT CLIMBBIT RLANDBIT SACREDBIT)>

<INSERT-FILE "definition-overrides">
<INSERT-FILE "parser">
<INSERT-FILE "message-overrides">

<ROUTINE GO ()
    <CRLF> <CRLF>
    <V-VERSION> <CRLF>
    <SETG HERE ,WEST-OF-HOUSE> <MOVE ,PLAYER ,HERE>
    <V-LOOK> <MAIN-LOOP>>

<INSERT-FILE "forest">
