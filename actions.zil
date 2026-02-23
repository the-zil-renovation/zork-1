"Z O R K   I  -  Actions File"

"Exploring Forest and Outside of House"

<ROUTINE BOARD-F ()
    <COND
        (<VERB? TAKE EXAMINE>
            <TELL "The boards are securely fastened." CR>)>>


<ROUTINE BOARDED-WINDOW-F ()
    <COND
        (<VERB? OPEN>
            <TELL "The windows are boarded and can't be opened." CR>)
        (<VERB? ATTACK>
            <TELL "You can't break the windows open." CR>)>>


<GLOBAL FOREST-AROUND
    <LTABLE (PURE) FOREST-1 FOREST-2 FOREST-3 PATH CLEARING FOREST-1>>

<ROUTINE FOREST-F ()
    <COND
        (<VERB? WALK-AROUND>
		    <COND
                (<EQUAL? ,HERE ,WEST-OF-HOUSE ,NORTH-OF-HOUSE ,SOUTH-OF-HOUSE ,EAST-OF-HOUSE>
                    <TELL "You aren't even in the forest." CR>)>
            <GO-NEXT ,FOREST-AROUND>)
        (<VERB? EXIT>
            <TELL "You will have to specify a direction." CR>)
        ;(<VERB? FIND>
            <TELL "You cannot see the forest for the trees." CR>)
        ;(<VERB? LISTEN>
            <TELL "The pines and the hemlocks seem to be murmuring." CR>)>>


<ROUTINE WHITE-HOUSE-F ()

    <COND (<EQUAL? ,HERE ,KITCHEN ,LIVING-ROOM ,ATTIC>
        <COND (<VERB? FIND> <TELL "Why not find your brains?" CR>)
        (<VERB? WALK-AROUND> <GO-NEXT ,IN-HOUSE-AROUND> T)>)

    (<NOT <OR <EQUAL? ,HERE ,EAST-OF-HOUSE ,WEST-OF-HOUSE> <EQUAL? ,HERE ,NORTH-OF-HOUSE ,SOUTH-OF-HOUSE>>>
        <COND (<VERB? FIND>
		  <COND (<EQUAL? ,HERE ,CLEARING>
			 <TELL "It seems to be to the west." CR>)
			(T
			 <TELL "It was here just a minute ago...." CR>)>)
		 (T <TELL "You're not at the house." CR>)>)

	  (<VERB? FIND>
	   <TELL
"It's right here! Are you blind or something?" CR>)

	  (<VERB? WALK-AROUND>
	   <GO-NEXT ,HOUSE-AROUND>
	   T)

	  (<VERB? EXAMINE>
	   <TELL
"The house is a beautiful colonial house which is painted white.
It is clear that the owners must have been extremely wealthy." CR>)

	  (<VERB? THROUGH OPEN>
	   <COND (<EQUAL? ,HERE ,EAST-OF-HOUSE>
		  <COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
			 <GOTO ,KITCHEN>)
			(T
			 <TELL "The window is closed." CR>
			 <THIS-IS-IT ,KITCHEN-WINDOW>)>)
		 (T
		  <TELL "I can't see how to get in from here." CR>)>)

	  (<VERB? BURN>
	   <TELL "You must be joking." CR>)>>


"Winning the Game"

"When the game is won, a secret path appears leading southwest from West of House to Stone Barrow."

<GLOBAL WON-FLAG ;<> T>

<ROUTINE WEST-OF-HOUSE-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
        <TELL "You are standing in an open field west of a white house, with a boarded front door.">
        <COND (,WON-FLAG
            <TELL " A secret path leads southwest into the forest.">)>
		<CRLF>)>>


"Entering the Stone Barrow finishes the game."

<ROUTINE STONE-BARROW-F (RARG)
    <COND (<AND <EQUAL? .RARG ,M-BEG>
        <OR <VERB? ENTER>
        <AND <VERB? WALK> <EQUAL? ,PRSO ,P?WEST ,P?IN>>>>
        <SETG MOVES <+ ,MOVES 1>>
        <FINISH>)>>

<ROUTINE BARROW-DOOR-F ()
    <COND (<VERB? OPEN CLOSE>
        <TELL "The door is too heavy." CR>)>>

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
