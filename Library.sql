-- Localhost: 127.0.0.1 ( server address  hosting mysql)
-- Multiple databases
-- LibraryDB, musicdb, atestdb.....

-- Display all database within this server
SHOW DATABASES; -- Is the read part of CRUD

-- CREATE DATABASE nameOfDB: statement creates a database
CREATE DATABASE Library; -- This  is the create part of CRUD

USE Library;

-- create a table in Library
-- tbl_Library is an entity
CREATE TABLE tbl_Library(
-- Create the attributes(columns/fields names)
-- ColumnName, datatype , constraints
Book_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Title VARCHAR(60) NOT NULL,
Author VARCHAR(40) NOT NULL,
Genre VARCHAR(30) NOT NULL,
Published_year VARCHAR(15)
);
-- Display tables within a database
SHOW TABLES;

DROP TABLE tbl_Library;

-- Create the Borrowers table
CREATE TABLE tbl_Borrowers(
Borrower_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
Lastname VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL,
Phone_number VARCHAR(15) 
);

-- Create the BorrowedBooks table
CREATE TABLE tbl_Borrowedbooks(
Borrowed_ID INT PRIMARY KEY AUTO_INCREMENT,
Book_ID INT,
Borrower_ID INT,
Borrow_Date DATE,
Return_Date DATE,
FOREIGN KEY (Book_id) REFERENCES tbl_Library(Book_id),
FOREIGN KEY (Borrower_id) REFERENCES tbl_Borrowers(Borrower_id)
);

-- See table structure
DESC tbl_Library;
EXPLAIN tbl_Library;

DESC tbl_Borrowers;
EXPLAIN tbl_Borrowers;

DESC tbl_Borrowedbooks;
EXPLAIN tbl_Borrowedbooks;

-- Display records in our
SELECT * FROM tbl_Library;
SELECT * FROM tbl_Borrowers;
SELECT * FROM tbl_Borrowedbooks;

INSERT INTO tbl_Library (Title, Author, Genre, Published_year) VALUES 
('Whimsical Wonders', 'Amanda White', 'Adventure', 2016),
('Midnight Moon', 'Emily Johnson', 'Romance', 2015),
('Twilight Symphony', 'Amanda White', 'Thriller', 2020),
('Twilight Symphony', 'Jessica Miller', 'Sci-Fi', 2021),
('Whispers in the Wind', 'Emily Johnson', 'Romance', 2014),
('Starlight Serenade', 'Sarah Wilson', 'Romance', 2015),
('Fireside Tales', 'Brian Thompson', 'Romance', 2016),
('Fireside Tales', 'Sarah Wilson', 'Comedy', 2013),
('Enchanted Dreams', 'Michael Brown', 'Comedy', 2016),
('Starlight Serenade', 'Olivia Martinez', 'Comedy', 2017);

INSERT INTO tbl_Borrowers (FirstName, Lastname, Email, Phone_number) VALUES 
('Daisy', 'Smith', 'katie.roberts@example.com', '555-5678'),
('Hannah', 'Davis', 'alex.wilson@example.com', '555-4567'),
('George', 'Moore', 'sara.jones@example.com', '555-7890'),
('Charlie', 'Davis', 'john.doe@example.com', '555-8901'),
('Alice', 'Jones', 'ryan.miller@example.com', '555-2345'),
('Hannah', 'Jones', 'alex.wilson@example.com', '555-2345'),
('Bob', 'Jones', 'sara.jones@example.com', '555-8901'),
('Hannah', 'Miller', 'jane.smith@example.com', '555-7890'),
('Hannah', 'Miller', 'mike.brown@example.com', '555-0123'),
('Jack', 'Brown', 'sara.jones@example.com', '555-0123');

-- Display a speific record using the WHERE clause
SELECT * FROM tbl_Borrowers WHERE Borrower_ID = 1;
SELECT * FROM tbl_Borrowers WHERE Lastname = 'Jones';

SELECT * FROM tbl_Library WHERE Book_ID = 1;
SELECT * FROM tbl_Library WHERE Published_year = '2016';

-- Insert sample data into BorrowedBooks table
INSERT INTO tbl_Borrowedbooks (Book_ID, Borrower_ID, Borrow_Date, Return_Date) VALUES
(1, 1, '2024-11-01', NULL),
(2, 2, '2024-11-05', '2024-11-15');

-- Update the return date for a borrowed book
UPDATE tbl_Borrowedbooks
SET Return_Date = '2024-11-20'
WHERE Borrowed_ID = 4;

-- Delete a borrower record if they have no borrowed books
DELETE FROM tbl_Borrowers 
WHERE Borrower_ID = 6
AND NOT EXISTS (
    SELECT 6
    FROM tbl_Borrowedbooks
    WHERE Borrower_ID = 6
);

-- Display records in our
SELECT * FROM tbl_Library;
SELECT * FROM tbl_Borrowers;
SELECT * FROM tbl_Borrowedbooks;

-- To check if a record with Borrowed_ID = 2 actually exists in the tbl_Borrowedbooks table.
SELECT * FROM tbl_Borrowers WHERE Borrower_ID = 6;









