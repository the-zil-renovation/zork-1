"ZORK-1.ZIL for Zork I: The Great Underground Empire"

<VERSION ZIP>
<CONSTANT RELEASEID 0>
<CONSTANT GAME-BANNER
"Zork I: The Great Underground Empire|
A ZIL Renovation by Alex Proudfoot">

<SETG EXTRA-FLAGS (;BURNBIT ;CLIMBBIT ;RLANDBIT ;SACREDBIT)>

<INSERT-FILE "replacements">
<INSERT-FILE "parser">

<ROUTINE PRINT-RELEASE-NUMBER ()
    <TELL N <BAND <LOWCORE RELEASEID> *3777*> ".0.0">>

<ROUTINE PRINT-SERIAL-NUMBER ()
    <LOWCORE-TABLE SERIAL 6 PRINTC>>

<ROUTINE PRINT-ZILF-VERSION ()
    <TELL %<STRING ,ZIL-VERSION " lib " ,ZILLIB-VERSION> CR CR>>

<ROUTINE GO ()
    <CRLF> <CRLF>
    ;<TELL "INTRODUCTORY TEXT!" CR CR>
    ;<V-VERSION> ;<CRLF>
    <PRINT-GAME-BANNER>
    <TELL "Release "> <PRINT-RELEASE-NUMBER> <TELL " / ">
    <TELL "Serial number "> <PRINT-SERIAL-NUMBER> <TELL " / ">
    <PRINT-ZILF-VERSION>
    <TELL "This ZIL Renovation is work in progress." CR>
    <TELL "Visit https://github.com/the-zil-renovation/zork-1/issues to report problems!" CR CR>
    <SETG HERE ,WEST-OF-HOUSE>
    <MOVE ,PLAYER ,HERE>
    <V-LOOK>
    <MAIN-LOOP>>

<INSERT-FILE "actions">
<INSERT-FILE "fixtures">
<INSERT-FILE "loot">
<INSERT-FILE "places">
<INSERT-FILE "scenery">
