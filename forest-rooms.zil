;"FOREST-ROOMS.ZIL for Zork I: The Great Underground Empire"

<GLOBAL WON-FLAG <>>
<ROOM WEST-OF-HOUSE (IN ROOMS) (DESC "West of House") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (NORTH TO NORTH-OF-HOUSE) (NE TO NORTH-OF-HOUSE)
    (SOUTH TO SOUTH-OF-HOUSE) (SE TO SOUTH-OF-HOUSE)
    (EAST "The door is boarded and you can't remove the boards.")
    (WEST TO FOREST-1)
    (SW TO STONE-BARROW IF WON-FLAG) (IN TO STONE-BARROW IF WON-FLAG)
    (GLOBAL BOARD FOREST WHITE-HOUSE)
    (ACTION WEST-OF-HOUSE-F)>

<ROOM STONE-BARROW (IN ROOMS) (DESC "Stone Barrow") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC
"You are standing in front of a massive barrow of stone. In the east face
is a huge stone door which is open. You cannot see into the dark of the tomb.")
    (NE TO WEST-OF-HOUSE)
    ;(ACTION STONE-BARROW-F)>

<ROOM NORTH-OF-HOUSE (IN ROOMS) (DESC "North of House") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC
"You are facing the north side of a white house. There is no door here,
and all the windows are boarded up. To the north a narrow path winds through
the trees.")
    (NORTH TO PATH)
    (SOUTH "The windows are all boarded.")
    (EAST TO EAST-OF-HOUSE) (SE TO EAST-OF-HOUSE)
    (WEST TO WEST-OF-HOUSE) (SW TO WEST-OF-HOUSE)
    (GLOBAL BOARD BOARDED-WINDOW FOREST WHITE-HOUSE)>

<ROOM SOUTH-OF-HOUSE (IN ROOMS) (DESC "South of House") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC
"You are facing the south side of a white house. There is no door here,
and all the windows are boarded.")
    (NORTH "The windows are all boarded.")
    (SOUTH TO FOREST-3)
    (EAST TO EAST-OF-HOUSE) (NE TO EAST-OF-HOUSE)
    (WEST TO WEST-OF-HOUSE) (NW TO WEST-OF-HOUSE)
    (GLOBAL BOARD BOARDED-WINDOW FOREST WHITE-HOUSE)>

<ROOM EAST-OF-HOUSE (IN ROOMS) (DESC "Behind House") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (NORTH TO NORTH-OF-HOUSE) (NW TO NORTH-OF-HOUSE)
    (SOUTH TO SOUTH-OF-HOUSE) (SW TO SOUTH-OF-HOUSE)
    (EAST TO CLEARING)
    ;(WEST TO KITCHEN IF KITCHEN-WINDOW IS OPEN) ;(IN TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
    (GLOBAL FOREST KITCHEN-WINDOW WHITE-HOUSE)
    (ACTION EAST-OF-HOUSE-F)>

<ROOM FOREST-1 (IN ROOMS) (DESC "Forest") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC
"This is a forest, with trees in all directions. To the east,
there appears to be sunlight.")
    (NORTH TO GRATING-CLEARING)
    (SOUTH TO FOREST-3)
    (EAST TO PATH)
    (WEST "You would need a machete to go further west.")
    (UP "There is no tree here suitable for climbing.")
    (GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)>

<ROOM FOREST-2 (IN ROOMS) (DESC "Forest") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC "This is a dimly lit forest, with large trees all around.")
    (NORTH "The forest becomes impenetrable to the north.")
    (SOUTH TO CLEARING)
    (EAST TO MOUNTAINS)
    (WEST TO PATH)
    (UP "There is no tree here suitable for climbing.")
    (GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)>

<ROOM MOUNTAINS (IN ROOMS) (DESC "Forest") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC "The forest thins out, revealing impassable mountains.")
    (NORTH TO FOREST-2) (SOUTH TO FOREST-2) (WEST TO FOREST-2)
    (EAST "The mountains are impassable.")
    (UP "The mountains are impassable.")
    (GLOBAL TREE WHITE-HOUSE)>

<ROOM FOREST-3 (IN ROOMS) (DESC "Forest") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (LDESC "This is a dimly lit forest, with large trees all around.")
    (NORTH TO CLEARING)
    (SOUTH "Storm-tossed trees block your way.")
    (EAST "The rank undergrowth prevents eastward movement.")
    (WEST TO FOREST-1)
    (NW TO SOUTH-OF-HOUSE)
    (UP "There is no tree here suitable for climbing.")
    (GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
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
    (GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)
>

<ROOM UP-A-TREE (IN ROOMS) (DESC "Up a Tree") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (UP "You cannot climb any higher.")
    (DOWN TO PATH)
    (GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION TREE-ROOM)>

<ROOM GRATING-CLEARING (IN ROOMS) (DESC "Clearing") (FLAGS LIGHTBIT RLANDBIT SACREDBIT)
    (NORTH "The forest becomes impenetrable to the north.")
    (SOUTH TO PATH)
    (EAST TO FOREST-2)
    (WEST TO FOREST-1)
    ;(DOWN PER GRATING-EXIT)
    (GLOBAL GRATE WHITE-HOUSE)
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
    (GLOBAL FOREST SONGBIRD TREE WHITE-HOUSE)
    ;(ACTION FOREST-ROOM)>
