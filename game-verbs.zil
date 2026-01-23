"Z O R K   I  -  Verbs File"

<ROUTINE FINISH ("AUX" W)
    <SETG P-CONT 0>
    <PRINT-GAME-OVER>
    <IF-SCORING <V-SCORE T>>
    <CRLF>
    <COND (<RESURRECT?> <RTRUE>)>
    <REPEAT PROMPT ()
        <IFFLAG (UNDO
                 <PRINTI <LIBRARY-MESSAGE JIGS-UP PROMPT-WITH-UNDO>>)
                (ELSE
                 <PRINTI <LIBRARY-MESSAGE JIGS-UP PROMPT-WITHOUT-UNDO>>)>
        <REPEAT ()
            <READLINE>
            <SET W <AND <GETB ,LEXBUF 1> <GET ,LEXBUF 1>>>
            <COND (<EQUAL? .W ,W?RESTART>
                   <RESTART>)
                  (<EQUAL? .W ,W?RESTORE>
                   <RESTORE>  ;"only returns on failure"
                   <TELL <LIBRARY-MESSAGE RESTORE FAILED> CR>
                   <AGAIN .PROMPT>)
                  (<EQUAL? .W ,W?QUIT>
                   <TELL CR <LIBRARY-MESSAGE QUIT GOODBYE> CR>
                   <QUIT>)
                  (<EQUAL? .W ,W?UNDO>
                   <V-UNDO>   ;"only returns on failure"
                   <TELL <LIBRARY-MESSAGE UNDO FAILED> CR>
                   <AGAIN .PROMPT>)
                  <IF-SCORING
                      (<EQUAL? .W ,W?FULL ,W?FULLSCORE>
                       <CRLF>
                       <V-FULLSCORE T>
                       <CRLF>
                       <AGAIN .PROMPT>)>
                  (T
                   <IFFLAG (UNDO
                            <TELL CR <LIBRARY-MESSAGE JIGS-UP REPROMPT-WITH-UNDO>>)
                           (ELSE
                            <TELL CR <LIBRARY-MESSAGE JIGS-UP REPROMPT-WITHOUT-UNDO>>)>)>>>>
