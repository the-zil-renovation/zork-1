"PLACES.ZIL for Zork I: The Great Underground Empire"

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

<ROOM STONE-BARROW (IN ROOMS)
    (DESC "Stone Barrow")
    (LDESC
"You are standing in front of a massive barrow of stone. In the east face
is a huge stone door which is open. You cannot see into the dark of the tomb.")
    (NE TO WEST-OF-HOUSE)
    (ACTION STONE-BARROW-F)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)>

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
    ;(ACTION EAST-HOUSE)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)
    (GLOBAL WHITE-HOUSE FOREST KITCHEN-WINDOW)
>

