"REPLACEMENTS.ZIL for Zork I: The Great Underground Empire"

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
        ;"go through the N objects - hacked to remove initial CR -- AAP"
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
