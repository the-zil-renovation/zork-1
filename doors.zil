;"DOORS.ZIL for Zork I: The Great Underground Empire"

;"Doors and their Action Routines"

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
