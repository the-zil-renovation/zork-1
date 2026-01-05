;"FIXTURES.ZIL for Zork I: The Great Underground Empire"

;"Objects Designed not to be Taken from their Initial Locations and their action routines"

<OBJECT MAILBOX (IN WEST-OF-HOUSE)
	(ADJECTIVE SMALL) (SYNONYM MAILBOX BOX)
	(DESC "small mailbox")
	(CAPACITY 10)
    ;(ACTION MAILBOX-F)
	(FLAGS CONTBIT OPENABLEBIT)>

<ROUTINE MAILBOX-F ()
    <COND (<AND <VERB? TAKE> <EQUAL? ,PRSO ,MAILBOX>>
        <TELL "It is securely anchored." CR>)>>
