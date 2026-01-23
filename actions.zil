"Z O R K   I  -  Actions File"

"THE PLOT"

"Put action routines and interrupt routines here along with commentary showing
how they contribute to the story/puzzles."


"Winning the Game"

"When the game is won, a secret path appears leading southwest from West of House to Stone Barrow."

<GLOBAL WON-FLAG ;<> T>

<ROUTINE WEST-OF-HOUSE-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
        <TELL "You are standing in an open field west of a white house, with a boarded front door.">
        <COND (,WON-FLAG
            <TELL " A secret path leads southwest into the forest.">)>
		<CRLF>)>>

<ROUTINE STONE-BARROW-F (RARG)
    <COND (<AND <EQUAL? .RARG ,M-BEG>
        <OR <VERB? ENTER>
            <AND <VERB? WALK> <EQUAL? ,PRSO ,P?WEST ,P?IN>>
            ;<AND <VERB? THROUGH> <EQUAL? ,PRSO ,BARROW>>>>
        <SETG MOVES <+ ,MOVES 1>>
        <FINISH>)>>
