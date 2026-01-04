;"PLACES.ZIL for Zork I: The Great Underground Empire"

;"Part - Forest and Outside of House"

;"Section - West of House"

<GLOBAL WON-FLAG <>>

<ROOM WEST-OF-HOUSE (IN ROOMS)
    (DESC "West of House")
    (NORTH TO NORTH-OF-HOUSE) (NE TO NORTH-OF-HOUSE)
    ;(SOUTH TO SOUTH-OF-HOUSE) ;(SE TO SOUTH-OF-HOUSE)
    (EAST "The door is boarded and you can't remove the boards.")
    ;(WEST TO FOREST-1)
    (SW TO STONE-BARROW IF WON-FLAG) (IN TO STONE-BARROW IF WON-FLAG)
    (ACTION WEST-OF-HOUSE-F)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)
    (GLOBAL WHITE-HOUSE BOARD FOREST)>

<ROUTINE WEST-OF-HOUSE-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
	    <TELL "You are standing in an open field west of a white house, with a boarded front door.">
		<COND (,WON-FLAG
		    <TELL " A secret path leads southwest into the forest.">)>
		<CRLF>)>>


;"Section - Stone Barrow"

<ROOM STONE-BARROW (IN ROOMS)
    (DESC "Stone Barrow")
    (LDESC
"You are standing in front of a massive barrow of stone. In the east face
is a huge stone door which is open. You cannot see into the dark of the tomb.")
    (NE TO WEST-OF-HOUSE)
    (ACTION STONE-BARROW-F)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)>

<ROUTINE STONE-BARROW-F (RARG)
    <COND (<AND <EQUAL? .RARG ,M-BEG>
        <OR <VERB? ENTER>
        <AND <VERB? WALK> <EQUAL? ,PRSO ,P?WEST ,P?IN>>>>
		<TELL
"Inside the Barrow|
As you enter the barrow, the door closes inexorably behind you. Around
you it is dark, but ahead is an enormous cavern, brightly lit. Through
its center runs a wide stream. Spanning the stream is a small wooden
footbridge, and beyond a path leads into a dark tunnel. Above the
bridge, floating in the air, is a large sign. It reads:  All ye who
stand before this bridge have completed a great and perilous adventure
which has tested your wit and courage. You have mastered
the first part of the ZORK trilogy. Those who pass over this bridge must be
prepared to undertake an even greater adventure that will severely test your
skill and bravery!|
|
The ZORK trilogy continues with \"ZORK II: The Wizard of Frobozz\" and
is completed in \"ZORK III: The Dungeon Master.\"" CR>
		<QUIT>)>>


;"Section - North of House"

<ROOM NORTH-OF-HOUSE (IN ROOMS)
    (DESC "North of House")
    (LDESC
"You are facing the north side of a white house. There is no door here,
and all the windows are boarded up. To the north a narrow path winds through
the trees.")
    ;(NORTH TO PATH)
    (SOUTH "The windows are all boarded.")
    (EAST TO EAST-OF-HOUSE) (SE TO EAST-OF-HOUSE)
    (WEST TO WEST-OF-HOUSE) (SW TO WEST-OF-HOUSE)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)
    (GLOBAL WHITE-HOUSE BOARD FOREST BOARDED-WINDOW)>


;"Section - South of House"

<ROOM SOUTH-OF-HOUSE (IN ROOMS)
    (DESC "South of House")
    (LDESC
"You are facing the south side of a white house. There is no door here,
and all the windows are boarded.")
    (NORTH "The windows are all boarded.")
    ;(SOUTH TO FOREST-3)
    (EAST TO EAST-OF-HOUSE) (NE TO EAST-OF-HOUSE)
    (WEST TO WEST-OF-HOUSE) (NW TO WEST-OF-HOUSE)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)
    (GLOBAL WHITE-HOUSE BOARD FOREST BOARDED-WINDOW)>


;"Section - East of House"

<ROOM EAST-OF-HOUSE (IN ROOMS)
    (DESC "Behind House")
    (NORTH TO NORTH-OF-HOUSE) (NW TO NORTH-OF-HOUSE)
    (SOUTH TO SOUTH-OF-HOUSE) (SW TO SOUTH-OF-HOUSE)
    ;(EAST TO CLEARING)
    ;(WEST TO KITCHEN IF KITCHEN-WINDOW IS OPEN) ;(IN TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
    ;(ACTION EAST-HOUSE)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)
    (GLOBAL WHITE-HOUSE FOREST KITCHEN-WINDOW)>


;"Part - Inside of House"

