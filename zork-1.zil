;"ZORK-1.ZIL for Zork I: The Great Underground Empire"

<VERSION ZIP>
<CONSTANT RELEASEID 0>
<CONSTANT GAME-BANNER
"Zork I: The Great Underground Empire|
A ZIL Renovation by Alex Proudfoot">

;"Use Semantic Versioning for this game."
<CONSTANT UPDATE "0">
<CONSTANT BUGFIX "0">

;"Game specific flags - only 4 available for Z-machine version 3."
<SETG EXTRA-FLAGS (BURNBIT CLIMBBIT RLANDBIT SACREDBIT)>

<INSERT-FILE "definition-overrides">
<INSERT-FILE "parser">
<INSERT-FILE "message-overrides">

<ROUTINE GO ()
    <CRLF> <CRLF>
    <V-VERSION> <CRLF>
    <SETG HERE ,WEST-OF-HOUSE>
    <MOVE ,PLAYER ,HERE>
    <V-LOOK>
    <MAIN-LOOP>>

<INSERT-FILE "backdrops">
<INSERT-FILE "doors">
<INSERT-FILE "fixtures">
<INSERT-FILE "loot">
<INSERT-FILE "places">
<INSERT-FILE "scenery">
