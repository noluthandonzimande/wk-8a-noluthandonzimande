# wk-8a-noluthandonzimande

-Categories and Books: Each book belongs to one category (1-M).

-Books and Authors: Many-to-many via BookAuthors.

-Members borrow Books tracked in Loans (many loans per member and book).

-Primary keys use AUTO_INCREMENT (MySQL syntax, can adjust for other DBMS).

-Foreign keys enforce referential integrity.

-Constraints like UNIQUE on ISBN and emails.

-copiesAvailable in Books to track stock.