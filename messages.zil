"Z O R K   I  -  ZILF Library Message Overrides File"

"Game Version"

<COND (<AND <GASSIGNED? UPDATEID> <GASSIGNED? BUGFIXID>>
    <COND (<AND <0? ,RELEASEID> <0? ,UPDATEID> <0? ,BUGFIXID>>
        <REPLACE-LIBRARY-MESSAGES VERSION
            (RELEASE-AND-SERIAL "Development build ")>)
    (ELSE
        <REPLACE-LIBRARY-MESSAGES VERSION
            (RELEASE-AND-SERIAL "Release " N .RELEASE "." N ,UPDATEID "." N ,BUGFIXID "-")>)>)>


"Score"

<REPLACE-LIBRARY-MESSAGES SCORE
    (DEFAULT "Your score is " N .POINTS
             " (total of " N .MAX " point" IF <NOT <1? .MAX>> !\s
             "), in " N .MOVES " move" IF <NOT <1? .MOVES>> !\s ".")
    (NOTIFICATION "[Your score has gone " IFELSE .DOWN? "down" "up"
                  " by " N .POINTS " point" IF <NOT <1? .POINTS>> !\s ".]")>


"Jigs Up"

<IF-SCORING
    <REPLACE-LIBRARY-MESSAGES JIGS-UP
        (PROMPT-WITH-UNDO "Would you like to see your FULL score, RESTART, UNDO, RESTORE, or QUIT? >")
        (PROMPT-WITHOUT-UNDO "(Type RESTART, RESTORE, or QUIT):|>")
        (REPROMPT-WITH-UNDO "(Please type FULL, RESTART, UNDO, RESTORE, or QUIT) >")
        (REPROMPT-WITHOUT-UNDO "(Type RESTART, RESTORE, or QUIT):|>")>>
