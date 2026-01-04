"MESSAGE-OVERRIDES.ZIL for Zork I: The Great Underground Empire"

"ZILF Library Message Overrides"

;"Support Semantic Versioning."
<COND (<AND <GASSIGNED? UPDATE> <GASSIGNED? BUGFIX>>
    <REPLACE-LIBRARY-MESSAGES VERSION
        (RELEASE-AND-SERIAL "Release " N .RELEASE "." ,UPDATE "." ,BUGFIX " / Build ")>)>
