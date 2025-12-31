"PLACES.ZIL for Zork I: The Great Underground Empire"

<GLOBAL WON-FLAG ;<> T>

<ROOM WEST-OF-HOUSE (IN ROOMS)
    (DESC "West of House")
    ;(NORTH TO NORTH-OF-HOUSE) ;(NE TO NORTH-OF-HOUSE)
    ;(SOUTH TO SOUTH-OF-HOUSE) ;(SE TO SOUTH-OF-HOUSE)
    (EAST "The door is boarded and you can't remove the boards.")
    ;(WEST TO FOREST-1)
    (SW TO STONE-BARROW IF WON-FLAG) (IN TO STONE-BARROW IF WON-FLAG)
    (ACTION WEST-OF-HOUSE-F)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)
    (GLOBAL WHITE-HOUSE BOARD FOREST)
>

<ROOM STONE-BARROW (IN ROOMS)
    (DESC "Stone Barrow")
    (LDESC
"You are standing in front of a massive barrow of stone. In the east face
is a huge stone door which is open. You cannot see into the dark of the tomb.")
    (NE TO WEST-OF-HOUSE)
    (ACTION STONE-BARROW-F)
    (FLAGS LIGHTBIT ;RLANDBIT ;SACREDBIT)>

