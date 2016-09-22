-- Problem 1
Problem Statement 1:
Draw an ERD containing the LabVisit and Patient entity types connected by a 1-M relationship from Patient to LabVisit. Choose an appropriate relationship name using your common knowledge of interactions between patients and lab visits. Define minimum cardinalities so that a patient is required for a lab visit. For the Patient entity type, add attributes PatNo (primary key), PatLastName, PatFirstName, PatDOB (date of birth). For the LabVisit entity type, add attributes for the LVNo (primary key), LVDate, LVProvNo, and optional LVOrdNo (for orders from physicians). If you are using a data modeling tool that supports data type specification, choose appropriate data types for the attributes based on your common knowledge.

-- Problem 2
Problem Statement 2
Extend problem 1 with the Lab entity type connected by a 1-M relationship from Lab to LabVisit. Choose an appropriate relationship name using your common knowledge of interactions between labs and lab visits. Define minimum cardinalities so that a lab is required for a lab visit. For the Lab entity type, add attributes LabNo (primary key), LabName, LabStreet, LabCity, LabState, and LabZip. If you are using a data modeling tool that supports data type specification, choose appropriate data types for the attributes based on your common knowledge.

-- Problem 3
Problem Statement 3
Augment your ERD from problem 2 with the Specimen entity type. For each specimen collected, the database should record a unique SpecNo, SpecArea (vaginal, cervical, or endocervical), and SpecCollMethod (thin prep or sure path). You should also add a 1-M relationship from LabVisit to Specimen. A lab visit must produce at least one specimen. A specimen is associated with exactly one lab visit.
