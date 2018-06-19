# Compiled useful information around ISDS

## Data Box

### Types

Symbol      | Number  | Description
------------|---------|------------
--          | 0       | ISDS system
OVM         | 10      | Standard government (state or municipality or similar) office
OVM_NOTAR   | 11      | Notary (stopped being used, replaced with OVM_PFO)
OVM_EXEKUT  | 12      | Executor (stopped being used, replaced with OVM_PFO)
OVM_REQ     | 13      | Subsidiary office with OVM status assigned on request (section 6 and 7 of act)
OVM_FO      | 14      | Natural person with OVM status (without identification number)
OVM_PFO     | 15      | Natural person in business with OVM status (e.g. notary or executor)
OVM_PO      | 16      | Juridical person with OVM status (arisen from previously existing PO or PO_REQ)
PO          | 20      | Standard commercial organization (in trade registry)
PO_ZAK      | 21      | Other organization based on law (stopped being used, replaced with PO)
PO_REQ      | 22      | Organization with box assigned on request
PFO         | 30      | Person in business
PFO_ADVOK   | 31      | Lawyer
PFO_DANPOR  | 32      | Tax consultant
PFO_INSSPR  | 33      | Administrator of insolvency
PFO_AUDITOR | 34      | Statutory auditor
FO          | 40      | Standard person

### States

Value      | Description
-----------|-------------
0 or empty | Error occurred while retrieving box state
1          | Box is accessible.
2          | Temporarily inaccessible (on owner's request)
3          | Not yet active
4          | Permanently inaccessible
5          | Box has been removed
6          | Temporarily inaccessible (by law)



## Data Message

Missing `@dmType` attribute means noncommercial standard message.

### Commercial messages

#### @dmType

Value  | Meaning
-------|----------
I      | Commercial message offering paying the response instead of the recipient (so called initiatory message)
K      | Commercial message
O      | Commercial message as a response paid by sender of initiatory message
V      | Noncommercial standard message

### Incomming or downloaded sent

#### @dmType

Value  | Meaning
-------|---------
A      | Subsidized initiatory commercial message which can pay a response
B      | Subsidized initiatory commercial message which has already paid the response
C      | Subsidized initiatory commercial message where the response offer has expired
D      | Externally subsidized commercial messsage
E      | Prepaid stamp
G      | Paid by a sponsor
I      | Initiatory commercial message which can pay a response
K      | Commercial message paid by sender
O      | Commercial message as a response paid by sended of initiatory message
X      | Initiatory commercial message where the response offer has expired
Y      | Initiatory commercial message which has already paid the response
Z      | Limitedly subsidized commercial message

### States

Value  | Meaning
-------|-------------------------------------------------------------------------
1      | Message has been put into ISDS
2      | Message stamped by TSA
3      | Message included viruses, infected document has been removed
4      | Message delivered (dmDeliveryTime stored)
5      | Message delivered through fiction (dmAcceptanceTime stored)
6      | Message delivered by user log-in or user explicit request (in case of commercial message) (dmAcceptanceTime stored)
7      | Message has been read by user
8      | Message could not been delivered (e.g. recipient box has been made inaccessible meantime)
9      | Message content deleted (thus can not be obtained on-line)
10     | Message saved in long term storage (this is optional commercial service)

### System messages

There exists special message type initiated by ISDS (i.e. from system, not
from other box). Such message has reserved from-box `aaaaaaa` (7 × `a`) value
and sender type `0` and it always contains a document of type HTML and
sometimes a document of type XML. The XML one provides structured reason of
sending the system message, the HTML one is a human-readable form. There are
following cases defined:

Case   | Meaning
-------|--------
1      | Outgoing message contained malicious code.
2      | You, administrator, deleted other user.
3      | Outgoing message could not been delivered because recipient box had been made inaccessible retrospectively.
4      | Outgoing commercial message has been deleted before accepting it by the recipient.
5      | User has been added to your box.
6      | User permissions has been changed.
7      | Box has been made temporary inaccessible on court desicion (e.g. user has been found eligable unresponsible).
8      | Box has been made temporary inaccessible on box owner or administrator request.
9      | Box has been made permanently inaccessible because organization does not exist anymore.
10     | Box has been made permanently inaccessible because owner has died.
11     | Personal data of box owner does not match central register.

The XML document has following structures:

SystemMessage – Attribute `type` is a number of case 1, or 4.
  - dmID – message ID
  - dbIDRecipient – recipient box ID

SystemMessage – Attribute `type` is a number of case 2, 5, or 6.
  - userID – user ID
  - userName – user proper name

SystemMessage – Attribute `type` is a number of case 3.
  - dmID – undeliverable message ID
  - dbIDRecipient – inaccessible recipient box ID
  - dbName – recipent box name
  - undelivDate – date when the box was made inaccessible
  - dmAnnotation – message subject
  - dmSenderRefNumber – sender's reference number of the message
  - dmSenderIdent – sender's identity number of the message

SystemMessage – Attribute `type` is a number of case 7, 8, 9, 10, or 11.
  - No elements are defined.
