
Go

USE Libary

GO
----------------------------------------------------------------------------------------------------------------------------------
												--Full Assignment in Read Me Attached
----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--Create Library Tables
-----------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tbl_libraryBranch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL
)

CREATE TABLE tbl_publisher (
	PublisherName INT PRIMARY KEY NOT NULL IDENTITY (1000, 1),
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (10000, 1),
	Title VARCHAR(200) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_bookAuthors (
	BookID INT NOT NULL CONSTRAINT fk_bookID FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	Author VARCHAR(50) NOT NULL, 
)

CREATE TABLE tbl_bookCopies (
	BookID INT NOT NULL CONSTRAINT fk_copies_bookID FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES tbl_libraryBranch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	numberCopies INT NOT NULL
)

CREATE TABLE tbl_Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (100000, 1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_bookLoans (
	BookID INT NOT NULL CONSTRAINT fk_loans_bookID FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_loans_BranchID FOREIGN KEY REFERENCES tbl_libraryBranch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL, --DATE - format YYYY-MM-DD
	DateDue DATE NOT NULL,
)

-----------------------------------------------------------------------------------------------------------------------------------
					--POPULATE TABLES
-- Must haves--
-- Branch: Sharpstown, Central
-- Book:The Lost Tribe
-- Authors: Stephen King x2

-----------------------------------------------------------------------------------------------------------------------------------


					--REQUIRED!! 4 branches in the LIBRARY_BRANCH table. 
INSERT INTO tbl_libraryBranch
	(BranchName, Address)
	VALUES
	('Sharpstown', '123 Any Street'),
	('Central', '456 Made up Lane'),
	('Dulltown', '789 Not Creative Drive'),
	('Vague', '10 Downing Street')

					--20 Books minimum!!

INSERT INTO tbl_books
	(Title, PublisherName)
	VALUES
	('The Shining', 'Penguin Random House'),
	('Christine', 'Penguin Random House'),
	('The Lost Tribe', 'Picador'),
	('Becoming', 'Crown Publishing'),
	('The Hobbit', 'Allen and Unwin'),
	('And Then There Were None', 'Collins Crime Club'),
	('The Davinci Code', 'DoubleDay'),
	('Ben Hur', 'Harper'),
	('To Kill A Mockingbird', 'JB Lippincott and Co.'),
	('The Kite Runner', 'Riverhead Books'),
	('Harry Potter and the Philosophers Stone', 'Scholastic'),
	('Harry Potter and the Chamber of Secrets', 'Scholastic'),
	('Harry Potter and Perpetual Sequels', 'Scholastic'),
	('Gone With the Wind', 'Macmillan Publishers'),
	('The Great Gatsby', 'Charles Scribners Sons'),
	('Hunger Games', 'Scholastic'),
	('Gone Girl', 'Crown Publishing'),
	('The Girl On The Train', 'Riverhead Books'),
	('The Fault in Our Stars', 'Dutton Books'),
	('Caddyshack', 'The Best Movie')

	

					-- 10 authors minimum! (obviously use stephen king).
INSERT INTO tbl_bookAuthors
	(Author, BookID)
	VALUES
	('Stephen King', 10000),
	('Stephen King', 10001),
	('Mark Lee', 10002),
	('Michelle Obama', 10003),	
	('J.R.R. Tolkien', 10004),
	('Agatha Christie', 10005),
	('Dan Brown', 10006),
	('Lew Wallace', 10007),
	('Harper Lee', 10008),
	('Khaled Hosseini', 10009),
	('J. K. Rowling', 10010),
	('J. K. Rowling', 10011),
	('J. K. Rowling', 10012),
	('Margaret Mitchell', 10013),
	('F. Scott Fitzgerald', 10014),
	('Suzanne Collins', 10015),
	('Gillian Flynn', 10016),
	('Paula Hawkins', 10017),
	('John Green', 10018),
	('Doug Kenney', 10019)

					--10 book titles per branch! 2 copies/book minimum
					--2 books written by Stephen King at 'Central' branch.

INSERT INTO tbl_bookCopies
	(BranchID, BookID, numberCopies)
	VALUES
	(1, 10000, 2),
	(1, 10001, 2),
	(1, 10002, 2),
	(1, 10003, 2),
	(1, 10004, 2),
	(1, 10005, 2),
	(1, 10006, 2),
	(1, 10007, 2),
	(1, 10008, 2),
	(1, 10009, 2),
	(1, 10010, 2),
	(1, 10011, 2),
	(1, 10012, 2),
	(1, 10013, 2),
	(1, 10014, 2),
	(1, 10015, 2),
	(1, 10016, 2),
	(1, 10017, 2),
	(1, 10018, 2),
	(1, 10019, 2),
	(2, 10000, 2),
	(2, 10001, 2),
	(2, 10009, 2),
	(2, 10010, 2),
	(2, 10011, 2),
	(2, 10012, 2),
	(2, 10013, 2),
	(2, 10014, 2),
	(2, 10015, 2),
	(2, 10016, 2),
	(2, 10017, 2),
	(2, 10018, 2),
	(3, 10010, 2),
	(3, 10011, 2),
	(3, 10012, 2),
	(3, 10013, 2),
	(3, 10014, 2),
	(3, 10015, 2),
	(3, 10016, 2),
	(3, 10017, 2),
	(3, 10018, 2),
	(3, 10019, 2),
	(4, 10000, 2),
	(4, 10001, 2),
	(4, 10002, 2),
	(4, 10003, 2),
	(4, 10004, 2),
	(4, 10005, 2),
	(4, 10006, 2),
	(4, 10007, 2),
	(4, 10008, 2),
	(4, 10009, 2)

					--8 Borrowers minimum!, 2 of those borrowers have more than 5 books loaned out (greedy pigs)!

INSERT INTO tbl_Borrower
	(Name, Phone, Address)
	VALUES
	('Morton Schmidt', '204-313-4444', '21 Jump Street'),
	('Grego Jenko', '204-312-4444', '22 Jump Street'),
	('Homer Simpson', '204-311-4444', '742 Evergreen Terrace'),
	('Freddy Krueger', '204-310-4444', '1428 Elm Street'),
	('Sherlock Holmes', '204-309-4444', '221b Baker Street'),
	('Big Bird', '204-308-4444', '123 Sesame Street'),
	('Peter Griffin', '204-307-4444', '31 Spooner Street'),
	('Harry Potter', '204-306-4444', '4 Privet Drive')

	
					--50 BOOK_LOANS!

INSERT INTO tbl_bookLoans
	(CardNo, BranchID, BookID, DateOut, DateDue)
	VALUES
	(100000, 2, 10000, '2019-07-01', '2019-07-06'),
	(100000, 2, 10001, '2019-07-01', '2019-07-06'),
	(100000, 1, 10002, '2019-07-01', '2019-07-06'),
	(100000, 1, 10003, '2019-07-01', '2019-07-06'),
	(100000, 4, 10004, '2019-07-01', '2019-07-06'),
	(100000, 1, 10005, '2019-07-01', '2019-07-06'),
	(100000, 3, 10006, '2019-07-01', '2019-07-06'),
	(100000, 1, 10007, '2019-07-01', '2019-07-06'),
	(100000, 4, 10008, '2019-07-01', '2019-07-06'),
	(100000, 2, 10009, '2019-07-01', '2019-07-06'),
	(100000, 1, 10010, '2019-07-02', '2019-07-07'),
	(100000, 3, 10011, '2019-07-02', '2019-07-07'),
	(100000, 1, 10012, '2019-07-02', '2019-07-07'),
	(100000, 1, 10013, '2019-07-02', '2019-07-07'),
	(100000, 2, 10014, '2019-07-02', '2019-07-07'),
	(100000, 3, 10015, '2019-07-02', '2019-07-07'),
	(100000, 4, 10016, '2019-07-02', '2019-07-07'),
	(100000, 1, 10017, '2019-07-02', '2019-07-07'),
	(100000, 2, 10018, '2019-07-02', '2019-07-07'),
	(100000, 3, 10019, '2019-07-02', '2019-07-07'),
	(100001, 4, 10000, '2019-07-03', '2019-07-08'),
	(100001, 1, 10001, '2019-07-03', '2019-07-08'),
	(100001, 2, 10002, '2019-07-03', '2019-07-08'),
	(100001, 3, 10003, '2019-07-03', '2019-07-08'),
	(100001, 4, 10004, '2019-07-03', '2019-07-08'),
	(100001, 1, 10005, '2019-07-03', '2019-07-08'),
	(100001, 2, 10006, '2019-07-03', '2019-07-08'),
	(100001, 3, 10007, '2019-07-03', '2019-07-08'),
	(100001, 4, 10008, '2019-07-03', '2019-07-08'),
	(100001, 1, 10009, '2019-07-03', '2019-07-08'),
	(100001, 1, 10010, '2019-07-03', '2019-07-08'),
	(100001, 1, 10011, '2019-07-03', '2019-07-08'),
	(100001, 1, 10012, '2019-07-03', '2019-07-08'),
	(100001, 1, 10013, '2019-07-03', '2019-07-08'),
	(100001, 1, 10014, '2019-07-03', '2019-07-08'),
	(100001, 1, 10015, '2019-07-03', '2019-07-08'),
	(100001, 1, 10016, '2019-07-03', '2019-07-08'),
	(100001, 1, 10017, '2019-07-03', '2019-07-08'),
	(100001, 1, 10018, '2019-07-03', '2019-07-08'),
	(100001, 1, 10019, '2019-07-03', '2019-07-08'),
	(100002, 2, 10000, '2019-07-04', '2019-07-09'),
	(100002, 2, 10001, '2019-07-04', '2019-07-09'),
	(100002, 2, 10010, '2019-07-04', '2019-07-09'),
	(100002, 2, 10011, '2019-07-04', '2019-07-09'),
	(100002, 2, 10012, '2019-07-04', '2019-07-09'),
	(100002, 2, 10013, '2019-07-04', '2019-07-09'),
	(100002, 2, 10014, '2019-07-04', '2019-07-09'),
	(100002, 2, 10015, '2019-07-04', '2019-07-09'),
	(100002, 2, 10016, '2019-07-04', '2019-07-09'),
	(100002, 2, 10017, '2019-07-04', '2019-07-09'),
	(100002, 2, 10018, '2019-07-04', '2019-07-09'),
	(100002, 2, 10019, '2019-07-04', '2019-07-09')

-----------------------------------------------------------------------------------------------------------------------------------
					--STORED PROCEDURES
-----------------------------------------------------------------------------------------------------------------------------------



--1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch "Sharpstown"?

--book count of title in library branch if specified
CREATE PROCEDURE dbo.uspGetBookNumberBranch @Title nvarchar (100) = NULL, @Branch nvarchar (50) = NULL, @bookCount int OUT
AS
SELECT ISNULL(SUM(a1.numberCopies), 0) 'Copies of Title'
FROM tbl_bookCopies a1
FULL OUTER JOIN tbl_libraryBranch a2 ON a2.BranchID = a1.BranchID
FULL OUTER JOIN tbl_books		 a3 ON a3.BookID   = a1.BookID
WHERE a3.Title = ISNULL(@Title, a3.Title)
AND a2.BranchName LIKE '%' + ISNULL(@Branch, a2.BranchName) + '%'
GO



--copies of The Lost Tribe in the Sharpstown Branch:
DECLARE @bookCount int 
EXEC uspGetBookNumberBranch 'The Lost Tribe', 'Sharpstown', @bookCount OUTPUT


----------------------------------------------------------------------------------------------
--2.) Lost Tribe per Branch
----------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.uspGetBookNumberBranches @Title nvarchar (100) = NULL
AS
SELECT a1.BranchName, ISNULL(a2.numberCopies, 0) 'Copies of Title'
FROM tbl_libraryBranch a1
LEFT JOIN tbl_bookCopies  a2 ON a2.BranchID = a1.BranchID
FULL OUTER JOIN tbl_books a3 ON a3.BookID   = a2.BookID
WHERE a3.Title = ISNULL(@Title, a3.Title)

SELECT BranchName FROM tbl_libraryBranch

DROP PROCEDURE uspGetBookNumberBranches


--return number of copies of The Lost Tribe
EXEC uspGetBookNumberBranches 'The Lost Tribe'

----------------------------------------------------------------------------------------------
--3.) Retrieve the names of all borrowers who do not have any books checked out.
----------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.uspGetBorrowerNotCheckedOut
AS
SELECT a1.Name
FROM tbl_Borrower a1
LEFT JOIN tbl_bookLoans a2 ON a2.CardNo = a1.CardNo
WHERE a2.CardNo IS NULL  --card number isn't in a2.CardNo
GO

EXEC dbo.uspGetBorrowerNotCheckedOut
----------------------------------------------------------------------------------------------
--4.) For each book that is loaned out from the "Sharpstown" branch and whose DUE DATE (DateDue) is today, 
--retrieve the book title, the borrower's name, and the borrower's address.
----------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.uspGetDueToday
AS
SELECT a2.Title, a3.Name, a3.Address
FROM tbl_bookLoans a1
INNER JOIN tbl_books         a2 ON a2.BookID   = a1.BookID 
INNER JOIN tbl_Borrower      a3 ON a3.CardNo   = a1.CardNo
INNER JOIN tbl_libraryBranch a4 ON A4.BranchID = a1.BranchID
WHERE a4.BranchName = 'Sharpstown'
AND   a1.DateDue    = CAST(GETDATE() As date )
GO

EXEC uspGetDueToday
----------------------------------------------------------------------------------------------
--5.) For each library branch, retrieve the branch name and the total number of books loaned 
--out from that branch.
----------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.uspBooksLoanedByBranch
AS
SELECT a2.BranchName, COUNT(a1.BranchID) 'Books Checked Out'
FROM tbl_bookLoans a1
FULL OUTER JOIN tbl_libraryBranch a2 ON a2.BranchID = a1.BranchID
GROUP BY a2.BranchName
GO

EXEC uspBooksLoanedByBranch
----------------------------------------------------------------------------------------------
--6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who 
--have more than five books checked out.
----------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.uspBooksCheckedByBorrower
AS
SELECT b.Name, b.Address, COUNT(l.CardNo) 'Book Count'
FROM tbl_bookLoans l
FULL OUTER JOIN tbl_Borrower b ON b.CardNo = l.CardNo
GROUP BY b.Name, b.Address
HAVING COUNT(l.CardNo) > 5
GO

EXEC uspBooksCheckedByBorrower

-------------------------------------------------------------------
--7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the 
--number of copies owned by the library branch whose name is "Central".
----------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.uspCopiesByAuthorBranch @Author nvarchar(100) = NULL, @Branch nvarchar(50) = NULL
AS
SELECT b.Title, c.numberCopies
FROM tbl_bookCopies c
INNER JOIN tbl_libraryBranch l ON l.BranchID = c.BranchID
INNER JOIN tbl_books		 b ON b.BookID   = c.BookID
INNER JOIN tbl_bookAuthors   a ON a.BookID   = c.BookID
WHERE a.Author     = ISNULL(@Author, a.Author)
AND   l.BranchName = ISNULL(@Branch, l.BranchName)
GO

EXEC uspCopiesByAuthorBranch 'Stephen King', 'Central'

