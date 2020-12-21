CREATE TABLE BRANCH1
(BranchNo VARCHAR2(2),
BranchName VARCHAR2(20),
BranchLoc VARCHAR2(20),
NumberOfEmp NUMBER(3,0),
	CONSTRAINT branch1_BranchNo_pk PRIMARY KEY (BranchNo));

CREATE TABLE PUBLISHER1
(PubCode CHAR(2),
PubName VARCHAR2(20),
PubCity VARCHAR2(20),
	CONSTRAINT publisher1_PubCode_pk PRIMARY KEY (PubCode));

CREATE TABLE AUTHOR1
(AuthorNo VARCHAR2(3)
AuthorFName VARCHAR2(20),
AuthorLName VARCHAR2(20),
	CONSTRAINT author1_AuthorNo_pk PRIMARY KEY (AuthorNo));

CREATE TABLE WROTE1
(BookCode VARCHAR2(4),
AuthorNo VARCHAR2(3),
AuthorSeq VARCHAR2(2),
	CONSTRAINT wrote1_BookCodeAuthorNo_pk PRIMARY KEY (BookCode,AuthorNo),
	CONSTRAINT wrote1_BookCode_fk FOREIGN KEY (BookCode)
		REFERENCES book1 (BookCode),
	CONSTRAINT wrote1_AuthorNo_fk FOREIGN KEY (AuthorNo)
		REFERENCES author1 (AuthorNo));

CREATE TABLE BOOK1
(BookCode VARCHAR2(4),
BookTitle VARCHAR2(20),
BookType CHAR(3),
BookCover CHAR(2),
Price NUMBER(5,2)
	CONSTRAINT book1_BookCode_pk PRIMARY KEY (BookCode));

CREATE TABLE INVENTORY1
(BranchNo VARCHAR2(2),
BookCode VARCHAR2(4),
QtyOnHand VARCHAR2(3),
	CONSTRAINT inventory1_BranchNoBookCode_pk PRIMARY KEY (BranchNo, BookCode)
	CONSTRAINT inventory1_BranchNo_fk FOREIGN KEY (BranchNo)
		REFERENCES branch1 (BranchNo),
	CONSTRAINT inventory1_BookCode_fk FOREIGN KEY (BookCode)
		REFERENCES book1 (BookCode));