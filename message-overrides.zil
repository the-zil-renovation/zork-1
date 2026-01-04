"MESSAGE-OVERRIDES.ZIL for Zork I: The Great Underground Empire"

"ZILF Library Message Overrides"

;"Support Semantic Versioning."
<COND (<NOT <GASSIGNED? UPDATE>> <CONSTANT UPDATE "0">)>
<COND (<NOT <GASSIGNED? BUGFIX>> <CONSTANT BUGFIX "0">)>
<REPLACE-LIBRARY-MESSAGES VERSION
    (RELEASE-AND-SERIAL "Release " N .RELEASE "." ,UPDATE "." ,BUGFIX " / Build ")>
