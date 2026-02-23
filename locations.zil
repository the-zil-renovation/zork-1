"Z O R K   I  -  Locations File"

"SUBTITLE - Forest and Outside of House"

<OBJECT BOARD
    (IN LOCAL-GLOBALS)
    (SYNONYM BOARD BOARDS)
    (DESC "board")
    (FLAGS NDESCBIT)
    (ACTION BOARD-F)>

<OBJECT BOARDED-WINDOW
    (IN LOCAL-GLOBALS)
    (SYNONYM WINDOW)
    (ADJECTIVE BOARDED)
    (DESC "boarded window")
    (FLAGS NDESCBIT)
    (ACTION BOARDED-WINDOW-F)>

<OBJECT FOREST
    (IN LOCAL-GLOBALS)
    (SYNONYM FOREST TREES PINES HEMLOCKS)
    (DESC "forest")
    (FLAGS NDESCBIT)
    (ACTION FOREST-F)>

<OBJECT WHITE-HOUSE
    (IN LOCAL-GLOBALS)
    (SYNONYM HOUSE)
    (ADJECTIVE WHITE BEAUTI COLONI)
    (DESC "white house")
    (FLAGS NDESCBIT)
    ;(ACTION WHITE-HOUSE-F)>

<OBJECT	KITCHEN-WINDOW
    (IN LOCAL-GLOBALS)
    (SYNONYM WINDOW)
    (ADJECTIVE KITCHEN SMALL)
    (DESC "kitchen window")
    (FLAGS DOORBIT NDESCBIT OPENABLEBIT)
    ;(ACTION KITCHEN-WINDOW-F)>


<ROOM WEST-OF-HOUSE
    (IN ROOMS)
    (DESC "West of House")
    (NORTH TO NORTH-OF-HOUSE) (NE TO NORTH-OF-HOUSE)
    (SOUTH TO SOUTH-OF-HOUSE) (SE TO SOUTH-OF-HOUSE)
    (EAST "The door is boarded and you can't remove the boards.")
    (WEST TO FOREST-1)
    (SW TO STONE-BARROW IF WON-FLAG) (IN TO STONE-BARROW IF WON-FLAG)
    (ACTION WEST-OF-HOUSE-F)
    (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (GLOBAL BOARD FOREST WHITE-HOUSE)>

<OBJECT FRONT-DOOR
    (IN WEST-OF-HOUSE)
    (SYNONYM DOOR)
    (ADJECTIVE FRONT BOARDED)
    (DESC "door")
    (FLAGS DOORBIT NDESCBIT)
    ;(ACTION FRONT-DOOR-F)>

<OBJECT MAILBOX
    (IN WEST-OF-HOUSE)
    (SYNONYM MAILBOX BOX)
    (ADJECTIVE SMALL)
    (DESC "small mailbox")
    (FLAGS CONTBIT OPENABLEBIT)
    ;(ACTION MAILBOX-F)
    (CAPACITY 10)>

<OBJECT ADVERTISEMENT
    (IN MAILBOX)
    (SYNONYM ADVERTISEMENT LEAFLET BOOKLET MAIL)
    (ADJECTIVE SMALL)
    (DESC "leaflet")
    (LDESC "A small leaflet is on the ground.")
    (TEXT
"\"WELCOME TO ZORK!|
|
ZORK is a game of adventure, danger, and low cunning. In it you
will explore some of the most amazing territory ever seen by mortals.
No computer should be without one!\"")
    (FLAGS BURNBIT READBIT TAKEBIT)
    (SIZE 2)>


<ROOM STONE-BARROW
    (IN ROOMS)
    (DESC "Stone Barrow")
    (LDESC
"You are standing in front of a massive barrow of stone. In the east face
is a huge stone door which is open. You cannot see into the dark of the tomb.")
    (NE TO WEST-OF-HOUSE)
    (ACTION STONE-BARROW-F)
    (FLAGS LIGHTBIT RLANDBIT SACREDBIT)>

<OBJECT BARROW-DOOR
    (IN STONE-BARROW)
    (SYNONYM DOOR)
    (ADJECTIVE HUGE STONE)
    (DESC "stone door")
    (ACTION BARROW-DOOR-F)
    (FLAGS DOORBIT NDESCBIT OPENBIT)>

<OBJECT BARROW
    (IN STONE-BARROW)
    (SYNONYM BARROW TOMB)
    (ADJECTIVE MASSIVE STONE)
    (DESC "stone barrow")
    (FLAGS NDESCBIT)>


<ROOM NORTH-OF-HOUSE
    (IN ROOMS)
    (DESC "North of House")
    (LDESC
"You are facing the north side of a white house. There is no door here,
and all the windows are boarded up. To the north a narrow path winds through
the trees.")
    (NORTH TO PATH)
    (SOUTH "The windows are all boarded.")
    (EAST TO EAST-OF-HOUSE) (SE TO EAST-OF-HOUSE)
    (WEST TO WEST-OF-HOUSE) (SW TO WEST-OF-HOUSE)
    (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (GLOBAL BOARD BOARDED-WINDOW FOREST WHITE-HOUSE)>


<ROOM SOUTH-OF-HOUSE
    (IN ROOMS)
    (DESC "South of House")
    (LDESC
"You are facing the south side of a white house. There is no door here,
and all the windows are boarded.")
    (NORTH "The windows are all boarded.")
    (SOUTH TO FOREST-3)
    (EAST TO EAST-OF-HOUSE) (NE TO EAST-OF-HOUSE)
    (WEST TO WEST-OF-HOUSE) (NW TO WEST-OF-HOUSE)
    (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (GLOBAL BOARD BOARDED-WINDOW FOREST WHITE-HOUSE)>


<ROOM EAST-OF-HOUSE
    (IN ROOMS)
    (DESC "Behind House")
    (NORTH TO NORTH-OF-HOUSE) (NW TO NORTH-OF-HOUSE)
    (SOUTH TO SOUTH-OF-HOUSE) (SW TO SOUTH-OF-HOUSE)
    (EAST TO CLEARING)
    (WEST TO KITCHEN IF KITCHEN-WINDOW IS OPEN) (IN TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
    ;(ACTION EAST-OF-HOUSE-F)
    (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (GLOBAL FOREST KITCHEN-WINDOW WHITE-HOUSE)>


<ROOM FOREST-1 (IN ROOMS) (DESC "Forest") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC
"This is a forest, with trees in all directions. To the east,
there appears to be sunlight.")
    (NORTH TO GRATING-CLEARING)
    (SOUTH TO FOREST-3)
    (EAST TO PATH)
    (WEST "You would need a machete to go further west.")
    (UP "There is no tree here suitable for climbing.")
    ;(GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)>

<ROOM FOREST-2 (IN ROOMS) (DESC "Forest") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC "This is a dimly lit forest, with large trees all around.")
    (NORTH "The forest becomes impenetrable to the north.")
    (SOUTH TO CLEARING)
    (EAST TO MOUNTAINS)
    (WEST TO PATH)
    (UP "There is no tree here suitable for climbing.")
    ;(GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)>

<ROOM MOUNTAINS (IN ROOMS) (DESC "Forest") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC "The forest thins out, revealing impassable mountains.")
    (NORTH TO FOREST-2) (SOUTH TO FOREST-2) (WEST TO FOREST-2)
    (EAST "The mountains are impassable.")
    (UP "The mountains are impassable.")
    ;(GLOBAL TREE WHITE-HOUSE)>

<ROOM FOREST-3 (IN ROOMS) (DESC "Forest") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC "This is a dimly lit forest, with large trees all around.")
    (NORTH TO CLEARING)
    (SOUTH "Storm-tossed trees block your way.")
    (EAST "The rank undergrowth prevents eastward movement.")
    (WEST TO FOREST-1)
    (NW TO SOUTH-OF-HOUSE)
    (UP "There is no tree here suitable for climbing.")
    ;(GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)>

<ROOM PATH (IN ROOMS) (DESC "Forest Path") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC
"This is a path winding through a dimly lit forest. The path heads
north-south here. One particularly large tree with some low branches
stands at the edge of the path.")
    (NORTH TO GRATING-CLEARING)
    (SOUTH TO NORTH-OF-HOUSE)
    (EAST TO FOREST-2)
    (WEST TO FOREST-1)
    (UP TO UP-A-TREE)
    ;(GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)
>

<ROOM UP-A-TREE (IN ROOMS) (DESC "Up a Tree") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (UP "You cannot climb any higher.")
    (DOWN TO PATH)
    ;(GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION TREE-ROOM)>

<ROOM GRATING-CLEARING (IN ROOMS) (DESC "Clearing") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (NORTH "The forest becomes impenetrable to the north.")
    (SOUTH TO PATH)
    (EAST TO FOREST-2)
    (WEST TO FOREST-1)
    ;(DOWN PER GRATING-EXIT)
    ;(GLOBAL GRATE WHITE-HOUSE)
    ;(ACTION CLEARING-FCN)>

<ROOM CLEARING (IN ROOMS) (DESC "Clearing") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC
"You are in a small clearing in a well marked forest path that
extends to the east and west.")
    (NORTH TO FOREST-2)
    (SOUTH TO FOREST-3)
    ;(EAST TO CANYON-VIEW)
    (WEST TO EAST-OF-HOUSE)
    (UP "There is no tree here suitable for climbing.")
    ;(GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)>


"SUBTITLE - House"

<ROOM KITCHEN
    (IN ROOMS)
    (DESC "Kitchen")
    (EAST TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
    (OUT TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
    ;(WEST TO LIVING-ROOM)
    ;(UP TO ATTIC)
    ;(DOWN TO STUDIO IF FALSE-FLAG ELSE "Only Santa Claus climbs down chimneys.")
    ;(ACTION KITCHEN-FCN)
    (FLAGS RLANDBIT ONBIT SACREDBIT)
    (GLOBAL KITCHEN-WINDOW ;CHIMNEY ;STAIRS)
    (VALUE 10)
>

<ROOM ATTIC
    (IN ROOMS)
    (DESC "Attic")
    (LDESC "This is the attic. The only exit is a stairway leading down.")
    (DOWN TO KITCHEN)
    (FLAGS RLANDBIT SACREDBIT)
    ;(GLOBAL STAIRS)>

<ROOM LIVING-ROOM
    (IN ROOMS)
    (DESC "Living Room")
    (EAST TO KITCHEN)
    ;(WEST TO STRANGE-PASSAGE IF MAGIC-FLAG ELSE "The door is nailed shut.")
    ;(DOWN PER TRAP-DOOR-EXIT)
    ;(ACTION LIVING-ROOM-FCN)
    (FLAGS RLANDBIT ONBIT SACREDBIT)
    ;(GLOBAL STAIRS)
    (PSEUDO "NAILS" NAILS-PSEUDO "NAIL" NAILS-PSEUDO)>
