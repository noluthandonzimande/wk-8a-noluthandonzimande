-- Library Management Database

-- Table: Categories (1 book belongs to 1 category)
CREATE TABLE Categories (
    categoryID INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Table: Books
CREATE TABLE Books (
    bookID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    categoryID INT NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publishedYear INT,
    copiesAvailable INT DEFAULT 1 CHECK (copiesAvailable >= 0),
    CONSTRAINT fk_books_category FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);

-- Table: Authors
CREATE TABLE Authors (
    authorID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL
);

-- Junction Table: BookAuthors (Many-to-Many between Books and Authors)
CREATE TABLE BookAuthors (
    bookID INT NOT NULL,
    authorID INT NOT NULL,
    PRIMARY KEY (bookID, authorID),
    CONSTRAINT fk_ba_book FOREIGN KEY (bookID) REFERENCES Books(bookID),
    CONSTRAINT fk_ba_author FOREIGN KEY (authorID) REFERENCES Authors(authorID)
);

-- Table: Members
CREATE TABLE Members (
    memberID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    joinDate DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Table: Loans (1-M relationship: Member to Loans, Book to Loans)
CREATE TABLE Loans (
    loanID INT PRIMARY KEY AUTO_INCREMENT,
    bookID INT NOT NULL,
    memberID INT NOT NULL,
    loanDate DATE NOT NULL DEFAULT CURRENT_DATE,
    dueDate DATE NOT NULL,
    returnDate DATE,
    CONSTRAINT fk_loans_book FOREIGN KEY (bookID) REFERENCES Books(bookID),
    CONSTRAINT fk_loans_member FOREIGN KEY (memberID) REFERENCES Members(memberID)
);
