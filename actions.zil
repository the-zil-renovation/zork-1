"ACTIONS.ZIL for Zork I: The Great Underground Empire"

<ROUTINE WEST-OF-HOUSE-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
	    <TELL "You are standing in an open field west of a white house, with a boarded front door.">
		<COND (,WON-FLAG
		    <TELL " A secret path leads southwest into the forest.">)>
		<CRLF>)>>

<ROUTINE STONE-BARROW-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-BEG>
		     <OR <VERB? ENTER>
			 <AND <VERB? WALK>
			      <EQUAL? ,PRSO ,P?WEST ,P?IN>>
			 <AND <VERB? ENTER>
			      <EQUAL? ,PRSO ,BARROW>>>>
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
		<QUIT>)>
>
