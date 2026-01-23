"Z O R K   I  -  ZILF Library Definition Overrides File"

<REPLACE-DEFINITION DESCRIBE-OBJECTS

;"Describes the objects in a room.

Objects are described in four passes:
1. All non-person objects with DESCFCNs, FDESCS, and LDESCs, except vehicles containing WINNER.
2. All non-person objects not covered by #1, except vehicles containing WINNER.
3. The visible contents of containers and surfaces, excluding WINNER.
4. All objects with PERSONBIT other than WINNER.

Uses:
  WINNER

Args:
  RM: The room."

    <ROUTINE DESCRIBE-OBJECTS (RM "AUX" P N)
        <MAP-CONTENTS (I .RM)
            <COND
                ;"skip objects with NDESCBIT"
                (<FSET? .I ,NDESCBIT>)
                ;"skip vehicles containing WINNER"
                (<AND <FSET? .I ,VEHBIT> <HELD? ,WINNER .I>>)
                ;"objects with DESCFCNs"
                (<AND <SET P <GETP .I ,P?DESCFCN>> <APPLY .P ,M-OBJDESC?>>
                 <CRLF>
                 ;"The DESCFCN is responsible for listing the object's contents"
                 <APPLY .P ,M-OBJDESC>
                 <THIS-IS-IT .I>)
                ;"objects with applicable FDESCs or LDESCs"
                (<OR <AND <NOT <FSET? .I ,TOUCHBIT>>
                          <SET P <GETP .I ,P?FDESC>>>
                     <SET P <GETP .I ,P?LDESC>>>
                 <TELL CR .P CR>
                 <THIS-IS-IT .I>
                 ;"Describe contents if applicable"
                 <COND (<AND <SEE-INSIDE? .I> <FIRST? .I>>
                        <DESCRIBE-CONTENTS .I>)>)>>
        ;"See if there are any non fdesc, ndescbit, personbit objects in room"
        <MAP-CONTENTS (I .RM)
            <COND (<GENERIC-DESC? .I>
                   <SET N T>
                   <RETURN>)>>
        ;"go through the N objects - Hacked to remove initial CR by Alex Proudfoot!"
        <COND (.N
               <TELL ;CR "There ">
               <LIST-OBJECTS .RM GENERIC-DESC? ,L-ISMANY>
               <TELL " here." CR>
               <CONTENTS-ARE-IT .RM GENERIC-DESC?>)>
        ;"describe visible contents of generic-desc containers and surfaces"
        <MAP-CONTENTS (I .RM)
            <COND (<AND <SEE-INSIDE? .I>
                        <CONTENTS-DESC? .I>>
                   <DESCRIBE-CONTENTS .I>)>>
        ;"See if there are any NPCs"
        <SET N <>>
        <MAP-CONTENTS (I .RM)
            <COND (<NPC-DESC? .I>
                   <SET N T>
                   <RETURN>)>>
        ;"go through the N NPCs"
        <COND (.N
               <CRLF>
               <LIST-OBJECTS .RM NPC-DESC? <+ ,L-SUFFIX ,L-CAP>>
               <TELL " here." CR>
               <CONTENTS-ARE-IT .RM NPC-DESC?>)>>

    <ROUTINE GENERIC-DESC? (OBJ "AUX" P)
        <T? <NOT <OR <==? .OBJ ,WINNER>
                     <FSET? .OBJ ,NDESCBIT>
                     <FSET? .OBJ ,PERSONBIT>
                     <AND <NOT <FSET? .OBJ ,TOUCHBIT>>
                          <GETP .OBJ ,P?FDESC>>
                     <AND <FSET? .OBJ ,VEHBIT>
                          <HELD? ,WINNER .OBJ>>
                     <GETP .OBJ ,P?LDESC>
                     <AND <SET P <GETP .OBJ ,P?DESCFCN>> <APPLY .P ,M-OBJDESC?>>>>>>

    <ROUTINE NPC-DESC? (OBJ "AUX" P)
        <T? <AND <FSET? .OBJ ,PERSONBIT>
                 <NOT <OR <==? .OBJ ,WINNER>
                          <FSET? .OBJ ,NDESCBIT>
                          <AND <NOT <FSET? .OBJ ,TOUCHBIT>>
                               <GETP .OBJ ,P?FDESC>>
                          <GETP .OBJ ,P?LDESC>
                          <AND <SET P <GETP .OBJ ,P?DESCFCN>> <APPLY .P ,M-OBJDESC?>>>>>>>

    ;"Only describe contents if it contains something besides WINNER.
      Unlike GENERIC-DESC?, we might still describe the contents of a vehicle the player is in."
    <ROUTINE CONTENTS-DESC? (OBJ "AUX" P)
        <T? <AND <SET P <FIRST? .OBJ>>
                 <OR <N==? .P ,WINNER> <NEXT? .P>>
                 <NOT <OR <FSET? .OBJ ,NDESCBIT>
                          <FSET? .OBJ ,PERSONBIT>
                          <AND <NOT <FSET? .OBJ ,TOUCHBIT>>
                               <GETP .OBJ ,P?FDESC>>
                          <GETP .OBJ ,P?LDESC>
                          <AND <SET P <GETP .OBJ ,P?DESCFCN>> <APPLY .P ,M-OBJDESC?>>>>>>>
>


<REPLACE-DEFINITION PRINT-RANK
    <ROUTINE PRINT-RANK ('DEAD?)
        <COND (.DEAD? <TELL "This gives you the rank of ">)
              (ELSE <TELL "This would give you the rank of ">)>
        <COND (<EQUAL? ,SCORE 350> <TELL "Master Adventurer">)
              (<G? ,SCORE 330> <TELL "Wizard">)
              (<G? ,SCORE 300> <TELL "Master">)
              (<G? ,SCORE 200> <TELL "Adventurer">)
              (<G? ,SCORE 100> <TELL "Junior Adventurer">)
              (<G? ,SCORE 50> <TELL "Novice Adventurer">)
              (<G? ,SCORE 25> <TELL "Amateur Adventurer">)
              (ELSE <TELL "Beginner">)>
        <CRLF>
    >
>


<REPLACE-DEFINITION PRINT-GAME-OVER
    ;"Prints a message explaining that the game is over or the player has died.
      This is called after JIGS-UP has already printed the message passed in to
      describe the specific circumstances, so usually this should print a generic
      message appropriate for the game's theme."
    <ROUTINE PRINT-GAME-OVER ()
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
is completed in \"ZORK III: The Dungeon Master.\"">)
        (T
            <TELL "
ZORK: The Great Underground Empire.">)>
        <CRLF>
        <CRLF>>
>
