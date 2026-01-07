;"FOREST.ZIL for Zork I: The Great Underground Empire"
;"The Forest (Including the Outside of the House)"

;"1 - Objects (Including their Action Routines)"
;"1a - Backdrops"

<OBJECT WHITE-HOUSE (IN LOCAL-GLOBALS)
    (ADJECTIVE WHITE BEAUTI COLONI) (SYNONYM HOUSE)
    (DESC "white house")
    ;(ACTION WHITE-HOUSE-F)
    (FLAGS NDESCBIT)>

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


<OBJECT BOARD (IN LOCAL-GLOBALS)
    (SYNONYM BOARD BOARDS)
    (DESC "board")
    ;(ACTION BOARD-F)
    (FLAGS NDESCBIT)>

<ROUTINE BOARD-F ()
	 <COND (<VERB? TAKE EXAMINE>
		<TELL "The boards are securely fastened." CR>)>>


<OBJECT FOREST (IN LOCAL-GLOBALS)
    (SYNONYM FOREST TREES PINES HEMLOCKS)
    (DESC "forest")
    ;(ACTION FOREST-F)
    (FLAGS NDESCBIT)>

<ROUTINE FOREST-F ()
	 <COND (<VERB? WALK-AROUND>
		<COND (<OR <EQUAL? ,HERE
			       ,WEST-OF-HOUSE ,NORTH-OF-HOUSE
			       ,SOUTH-OF-HOUSE>
			   <EQUAL? ,HERE ,EAST-OF-HOUSE>>
		       <TELL "You aren't even in the forest." CR>)>
		<GO-NEXT ,FOREST-AROUND>)
	       (<VERB? DISEMBARK>
		<TELL "You will have to specify a direction." CR>)
	       (<VERB? FIND>
		<TELL "You cannot see the forest for the trees." CR>)
	       (<VERB? LISTEN>
		<TELL "The pines and the hemlocks seem to be murmuring."
		      CR>)>>


<OBJECT BOARDED-WINDOW (IN LOCAL-GLOBALS)
    (ADJECTIVE BOARDED) (SYNONYM WINDOW)
    (DESC "boarded window")
    ;(ACTION BOARDED-WINDOW-FCN)
    (FLAGS NDESCBIT)>

<ROUTINE BOARDED-WINDOW-FCN ()
	 <COND (<VERB? OPEN>
		<TELL "The windows are boarded and can't be opened." CR>)
	       (<VERB? MUNG>
		<TELL "You can't break the windows open." CR>)>>


<OBJECT TREE
	(IN LOCAL-GLOBALS)
	(SYNONYM TREE BRANCH)
	(ADJECTIVE LARGE STORM ;"-TOSSED")
	(DESC "tree")
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT SONGBIRD
	(IN LOCAL-GLOBALS)
	(SYNONYM BIRD SONGBIRD)
	(ADJECTIVE SONG)
	(DESC "songbird")
	(FLAGS NDESCBIT)
	(ACTION SONGBIRD-F)>

<ROUTINE SONGBIRD-F ()
	 <COND (<VERB? ;FIND TAKE>
		<TELL "The songbird is not here but is probably nearby." CR>)
	       ;(<VERB? LISTEN>
		<TELL "You can't hear the songbird now." CR>)
	       ;(<VERB? FOLLOW>
		<TELL "It can't be followed." CR>)
	       (T
		<TELL "You can't see any songbird here." CR>)>>


;"1b - Doors to Nowhere"

<OBJECT FRONT-DOOR (IN WEST-OF-HOUSE)
    (ADJECTIVE FRONT BOARDED) (SYNONYM DOOR)
	(DESC "door")
	(ACTION FRONT-DOOR-F)
	(FLAGS DOORBIT NDESCBIT)>

<ROUTINE FRONT-DOOR-F ()
    <COND (<VERB? OPEN>
        <TELL "The door cannot be opened." CR>)
    (<VERB? BURN>
        <TELL "You cannot burn this door." CR>)
    ;(<VERB? MUNG>
        <TELL "You can't seem to damage the door." CR>)
    ;(<VERB? LOOK-BEHIND>
        <TELL "It won't open." CR>)>>


<OBJECT BARROW-DOOR (IN STONE-BARROW)
    (ADJECTIVE HUGE STONE) (SYNONYM DOOR)
    (DESC "stone door")
    (ACTION BARROW-DOOR-F)
    (FLAGS DOORBIT NDESCBIT OPENBIT)>

<ROUTINE BARROW-DOOR-F ()
    <COND (<VERB? OPEN CLOSE>
        <TELL "The door is too heavy." CR>)>>


;"1c - Functional Doors"

<OBJECT	KITCHEN-WINDOW (IN LOCAL-GLOBALS)
    (ADJECTIVE KITCHEN SMALL) (SYNONYM WINDOW)
    (DESC "kitchen window")
    (ACTION KITCHEN-WINDOW-F)
    (FLAGS DOORBIT NDESCBIT)>

<GLOBAL KITCHEN-WINDOW-FLAG <>>

<ROUTINE KITCHEN-WINDOW-F ()
    <COND (<VERB? OPEN CLOSE>
        <SETG KITCHEN-WINDOW-FLAG T>
        <OPEN-CLOSE ,KITCHEN-WINDOW
"With great effort, you open the window far enough to allow entry."
"The window closes (more easily than it opened).">)
    (<AND <VERB? EXAMINE> <NOT ,KITCHEN-WINDOW-FLAG>>
        <TELL
"The window is slightly ajar, but not enough to allow entry." CR>)
    ;(<VERB? WALK ;BOARD ;THROUGH>
        <COND (<EQUAL? ,HERE ,KITCHEN>
            <DO-WALK ,P?EAST>)
        (T
            <DO-WALK ,P?WEST>)>
		<RTRUE>)
    ;(<VERB? LOOK-INSIDE>
        <TELL "You can see ">
            <COND (<EQUAL? ,HERE ,KITCHEN>
                <TELL "a clear area leading towards a forest." CR>)
            (T
                <TELL "what appears to be a kitchen." CR>)>)>>

<ROUTINE OPEN-CLOSE (OBJ STROPN STRCLS)
    <COND (<VERB? OPEN>
        <COND (<FSET? .OBJ ,OPENBIT>
            ;<TELL <PICK-ONE ,DUMMY>>)
        (T
            <TELL .STROPN>
        <FSET .OBJ ,OPENBIT>)>
		<CRLF>)
    (<VERB? CLOSE>
        <COND (<FSET? .OBJ ,OPENBIT>
            <TELL .STRCLS>
            <FCLEAR .OBJ ,OPENBIT>
            T)
		(T ;<TELL <PICK-ONE ,DUMMY>>)>
        <CRLF>)>>


<OBJECT GRATE
	(IN LOCAL-GLOBALS)
	(SYNONYM GRATE GRATING)
	(DESC "grating")
	(FLAGS DOORBIT NDESCBIT INVISIBLE)
	;(ACTION GRATE-FUNCTION)>

;<ROUTINE GRATE-FUNCTION ()
    	 <COND (<AND <VERB? OPEN> <EQUAL? ,PRSI ,KEYS>>
		<PERFORM ,V?UNLOCK ,GRATE ,KEYS>
		<RTRUE>)
	       (<VERB? LOCK>
		<COND (<EQUAL? ,HERE ,GRATING-ROOM>
		       <SETG GRUNLOCK <>>
		       <TELL "The grate is locked." CR>)
	              (<EQUAL? ,HERE ,GRATING-CLEARING>
		       <TELL "You can't lock it from this side." CR>)>)
	       (<AND <VERB? UNLOCK> <EQUAL? ,PRSO ,GRATE>>
		<COND (<AND <EQUAL? ,HERE ,GRATING-ROOM> <EQUAL? ,PRSI ,KEYS>>
		       <SETG GRUNLOCK T>
		       <TELL "The grate is unlocked." CR>)
		      (<AND <EQUAL? ,HERE ,GRATING-CLEARING>
			    <EQUAL? ,PRSI ,KEYS>>
		       <TELL "You can't reach the lock from here." CR>)
		      (T
		       <TELL
"Can you unlock a grating with a " D ,PRSI "?" CR>)>)
               (<VERB? PICK>
		<TELL "You can't pick the lock." CR>)
               (<VERB? OPEN CLOSE>
		<COND (,GRUNLOCK
		       <OPEN-CLOSE ,GRATE
				   <COND (<EQUAL? ,HERE ,CLEARING>
					  "The grating opens.")
					 (T
"The grating opens to reveal trees above you.")>
				   "The grating is closed.">
		       <COND (<FSET? ,GRATE ,OPENBIT>
			      <COND (<AND <NOT <EQUAL? ,HERE ,CLEARING>>
					  <NOT ,GRATE-REVEALED>>
				     <TELL
"A pile of leaves falls onto your head and to the ground." CR>
				     <SETG GRATE-REVEALED T>
				     <MOVE ,LEAVES ,HERE>)>
			      <FSET ,GRATING-ROOM ,ONBIT>)
			     (T <FCLEAR ,GRATING-ROOM ,ONBIT>)>)
		      (T <TELL "The grating is locked." CR>)>)
	       (<AND <VERB? PUT> <EQUAL? ,PRSI ,GRATE>>
		<COND (<G? <GETP ,PRSO ,P?SIZE> 20>
		       <TELL "It won't fit through the grating." CR>)
		      (T
		       <MOVE ,PRSO ,GRATING-ROOM>
		       <TELL
"The " D ,PRSO " goes through the grating into the darkness below." CR>)>)>>


;"1d - Scenery"

<OBJECT BARROW (IN STONE-BARROW)
(ADJECTIVE MASSIVE STONE) (SYNONYM BARROW TOMB)
    (DESC "stone barrow")
    ;(ACTION BARROW-FCN)
    (FLAGS NDESCBIT)>

<ROUTINE BARROW-FCN ()
	 <COND (<VERB? THROUGH>
		<DO-WALK ,P?WEST>)>>


;"1e - fixtures"

<OBJECT MAILBOX (IN WEST-OF-HOUSE)
	(ADJECTIVE SMALL) (SYNONYM MAILBOX BOX)
	(DESC "small mailbox")
	(CAPACITY 10)
    ;(ACTION MAILBOX-F)
	(FLAGS CONTBIT OPENABLEBIT)>

<ROUTINE MAILBOX-F ()
    <COND (<AND <VERB? TAKE> <EQUAL? ,PRSO ,MAILBOX>>
        <TELL "It is securely anchored." CR>)>>


;"1f - takeables"

<OBJECT ADVERTISEMENT (IN MAILBOX)
    (ADJECTIVE SMALL) (SYNONYM ADVERTISEMENT LEAFLET BOOKLET MAIL)
	(DESC "leaflet")
    (LDESC "A small leaflet is on the ground.")
    (TEXT
"\"WELCOME TO ZORK!|
|
ZORK is a game of adventure, danger, and low cunning. In it you
will explore some of the most amazing territory ever seen by mortals.
No computer should be without one!\"")
    (SIZE 2)
    (FLAGS ;BURNBIT READBIT TAKEBIT)
>


;"2 - Rooms (Including their Action Routines and Global Flags)"

<GLOBAL WON-FLAG <>>

<ROOM WEST-OF-HOUSE (IN ROOMS)
    (DESC "West of House")
    (NORTH TO NORTH-OF-HOUSE) (NE TO NORTH-OF-HOUSE)
    (SOUTH TO SOUTH-OF-HOUSE) (SE TO SOUTH-OF-HOUSE)
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


<ROOM EAST-OF-HOUSE (IN ROOMS)
    (DESC "Behind House")
    (NORTH TO NORTH-OF-HOUSE) (NW TO NORTH-OF-HOUSE)
    (SOUTH TO SOUTH-OF-HOUSE) (SW TO SOUTH-OF-HOUSE)
    ;(EAST TO CLEARING)
    ;(WEST TO KITCHEN IF KITCHEN-WINDOW IS OPEN) ;(IN TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
    ;(ACTION EAST-OF-HOUSE-F)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)
    ;(GLOBAL ;WHITE-HOUSE ;FOREST ;KITCHEN-WINDOW)>

;<ROUTINE EAST-OF-HOUSE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are behind the white house. A path leads into the forest
to the east. In one corner of the house there is a small window
which is ">
		<COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
		       <TELL "open.">)
		      (T <TELL "slightly ajar.">)>
		<CRLF>)>>


<ROOM FOREST-1 (IN ROOMS)
    (DESC "Forest")
    (LDESC
"This is a forest, with trees in all directions. To the east,
there appears to be sunlight.")
    (NORTH TO GRATING-CLEARING)
    (SOUTH TO FOREST-3)
    (EAST TO PATH)
    (WEST "You would need a machete to go further west.")
    (UP "There is no tree here suitable for climbing.")
    ;(ACTION FOREST-ROOM)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)
    (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM FOREST-2
      (IN ROOMS)
      (LDESC "This is a dimly lit forest, with large trees all around.")
      (DESC "Forest")
      (UP "There is no tree here suitable for climbing.")
      (NORTH "The forest becomes impenetrable to the north.")
      (EAST TO MOUNTAINS)
      (SOUTH TO CLEARING)
      (WEST TO PATH)
      ;(ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM MOUNTAINS
      (IN ROOMS)
      (LDESC "The forest thins out, revealing impassable mountains.")
      (DESC "Forest")
      (UP "The mountains are impassable.")
      (NORTH TO FOREST-2)
      (EAST "The mountains are impassable.")
      (SOUTH TO FOREST-2)
      (WEST TO FOREST-2)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE WHITE-HOUSE)>

<ROOM FOREST-3
      (IN ROOMS)
      (LDESC "This is a dimly lit forest, with large trees all around.")
      (DESC "Forest")
      (UP "There is no tree here suitable for climbing.")
      (NORTH TO CLEARING)
      (EAST "The rank undergrowth prevents eastward movement.")
      (SOUTH "Storm-tossed trees block your way.")
      (WEST TO FOREST-1)
      (NW TO SOUTH-OF-HOUSE)
      ;(ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM PATH
      (IN ROOMS)
      (LDESC
"This is a path winding through a dimly lit forest. The path heads
north-south here. One particularly large tree with some low branches
stands at the edge of the path.")
      (DESC "Forest Path")
      (UP TO UP-A-TREE)
      (NORTH TO GRATING-CLEARING)
      (EAST TO FOREST-2)
      (SOUTH TO NORTH-OF-HOUSE)
      (WEST TO FOREST-1)
      ;(ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM UP-A-TREE
      (IN ROOMS)
      (DESC "Up a Tree")
      (DOWN TO PATH)
      (UP "You cannot climb any higher.")
      ;(ACTION TREE-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE FOREST SONGBIRD WHITE-HOUSE)>

<ROOM GRATING-CLEARING
      (IN ROOMS)
      (DESC "Clearing")
      (NORTH "The forest becomes impenetrable to the north.")
      (EAST TO FOREST-2)
      (WEST TO FOREST-1)
      (SOUTH TO PATH)
      ;(DOWN PER GRATING-EXIT)
      ;(ACTION CLEARING-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE GRATE)>

<ROOM CLEARING
      (IN ROOMS)
      (LDESC
"You are in a small clearing in a well marked forest path that
extends to the east and west.")
      (DESC "Clearing")
      (UP "There is no tree here suitable for climbing.")
      ;(EAST TO CANYON-VIEW)
      (NORTH TO FOREST-2)
      (SOUTH TO FOREST-3)
      (WEST TO EAST-OF-HOUSE)
      ;(ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

