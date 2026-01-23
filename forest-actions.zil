;"FOREST-ACTIONS.ZIL for Zork I: The Great Underground Empire"

<ROUTINE WEST-OF-HOUSE-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
        <TELL "You are standing in an open field west of a white house, with a boarded front door.">
        <COND (,WON-FLAG
            <TELL " A secret path leads southwest into the forest.">)>
		<CRLF>)>>

;<ROUTINE STONE-BARROW-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-BEG>
		     <OR <VERB? ENTER>
			 <AND <VERB? WALK>
			      <EQUAL? ,PRSO ,P?WEST ,P?IN>>
			 ;<AND <VERB? THROUGH>
			      <EQUAL? ,PRSO ,BARROW>>>>
		<TELL
"Inside the Barrow|
As you enter the barrow, the door closes inexorably behind you. Around
you it is dark, but ahead is an enormous cavern, brightly lit. Through
its center runs a wide stream. Spanning the stream is a small wooden
footbridge, and beyond a path leads into a dark tunnel. Above the
bridge, floating in the air, is a large sign. It reads:  All ye who
stand before this bridge have completed a great and perilous adventure
which has tested your wit and courage. You have mastered">
		<COND (<EQUAL? <BAND <GETB 0 1> 8> 0>
		       <TELL "
the first part of the ZORK trilogy. Those who pass over this bridge must be
prepared to undertake an even greater adventure that will severely test your
skill and bravery!|
|
The ZORK trilogy continues with \"ZORK II: The Wizard of Frobozz\" and
is completed in \"ZORK III: The Dungeon Master.\"" CR>)
		      (T
		       <TELL "
ZORK: The Great Underground Empire.|" CR>)>
		<FINISH>)>>

<ROUTINE EAST-OF-HOUSE-F (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
        <TELL
"You are behind the white house. A path leads into the forest
to the east. In one corner of the house there is a small window
which is ">
        <COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
            <TELL "open.">)
        (T <TELL "slightly ajar.">)>
		<CRLF>)>>




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


<ROUTINE BOARD-F ()
	 <COND (<VERB? TAKE EXAMINE>
		<TELL "The boards are securely fastened." CR>)>>


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


<ROUTINE BOARDED-WINDOW-FCN ()
	 <COND (<VERB? OPEN>
		<TELL "The windows are boarded and can't be opened." CR>)
	       (<VERB? MUNG>
		<TELL "You can't break the windows open." CR>)>>


<ROUTINE SONGBIRD-F ()
	 <COND (<VERB? ;FIND TAKE>
		<TELL "The songbird is not here but is probably nearby." CR>)
	       ;(<VERB? LISTEN>
		<TELL "You can't hear the songbird now." CR>)
	       ;(<VERB? FOLLOW>
		<TELL "It can't be followed." CR>)
	       (T
		<TELL "You can't see any songbird here." CR>)>>


;"1b - Doors"

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


<ROUTINE GRATE-FUNCTION ()
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


<ROUTINE FRONT-DOOR-F ()
    <COND (<VERB? OPEN>
        <TELL "The door cannot be opened." CR>)
    (<VERB? BURN>
        <TELL "You cannot burn this door." CR>)
    ;(<VERB? MUNG>
        <TELL "You can't seem to damage the door." CR>)
    ;(<VERB? LOOK-BEHIND>
        <TELL "It won't open." CR>)>>


<ROUTINE BARROW-DOOR-F ()
    <COND (<VERB? OPEN CLOSE>
        <TELL "The door is too heavy." CR>)>>


<ROUTINE BARROW-FCN ()
	 <COND (<VERB? THROUGH>
		<DO-WALK ,P?WEST>)>>


<ROUTINE MAILBOX-F ()
    <COND (<AND <VERB? TAKE> <EQUAL? ,PRSO ,MAILBOX>>
        <TELL "It is securely anchored." CR>)>>

