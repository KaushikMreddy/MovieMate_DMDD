-- Inserting Data into Tables

use MovieMate3;

GO

-- Inserting data into Movie table
INSERT INTO Movie (Movie_ID, Title, Description, Duration, Language, Certificate, Release_Date, Genre, Rating) 
VALUES 
    (1, 'Inception', 'A mind-bending thriller', 148, 'English', 'PG-13', '2010-07-16', 'Sci-Fi', 5),
    (2, 'The Shawshank Redemption', 'A story of hope and perseverance', 142, 'English', 'R', '1994-09-23', 'Drama', 4),
    (3, 'The Dark Knight', 'A gritty superhero saga', 152, 'English', 'PG-13', '2008-07-18', 'Action', 4),
    (4, 'Pulp Fiction', 'A nonlinear crime drama', 154, 'English', 'R', '1994-10-14', 'Crime', 5),
    (5, 'Forrest Gump', 'An epic journey through American history', 142, 'English', 'PG-13', '1994-07-06', 'Drama', 3),
	(6, 'Superman', 'An epic journey through DC', 142, 'English', 'PG-13', '2000-07-06', 'Action', 2),
	(7, 'The Avengers', 'A superhero ensemble', 143, 'English', 'PG-13', '2012-05-04', 'Action', 4),
	(8, 'The Social Network', 'A drama about Facebook', 120, 'English', 'PG-13', '2010-10-01', 'Biography', 4),
	(9, 'The Great Gatsby', 'A romantic drama', 143, 'English', 'PG-13', '2013-05-10', 'Romance', 3),
	(10, 'The Shawshank Redemption', 'A story of hope and perseverance', 142, 'English', 'R', '1994-09-23', 'Drama', 5),
	(11, 'The Martian', 'A sci-fi survival thriller', 144, 'English', 'PG-13', '2015-10-02', 'Sci-Fi', 4),
	(12, 'Toy Story', 'An animated family film', 81, 'English', 'G', '1995-11-22', 'Animation', 4),
	(13, 'Jurassic Park', 'An action-adventure', 127, 'English', 'PG-13', '1993-06-11', 'Adventure', 4),
	(14, 'The Godfather', 'A mafia epic', 175, 'English', 'R', '1972-03-24', 'Crime', 5),
	(15, 'The Sound of Music', 'A musical drama', 174, 'English', 'G', '1965-03-29', 'Musical', 4),
	(16, 'The Lion King', 'An animated musical', 88, 'English', 'G', '1994-06-24', 'Animation', 5);

	GO

-- Inserting data into City table
INSERT INTO City (City_ID, Name, State, ZipCode)
VALUES 
    (1, 'New York City', 'New York', 10001),
    (2, 'Los Angeles', 'California', 90001);

	GO

-- Inserting data into Theatre table
INSERT INTO Theatre (Theatre_ID, City_ID, Name, Total_Theatres)
VALUES 
    (1, 1, 'AMC Empire 25', 20),
    (2, 2, 'Hollywood Bowl', 15);

-- Inserting data into Screen table
INSERT INTO Screen (Screen_ID, Theatre_ID, Name, Total_Seats)
VALUES 
    (1, 1, 'Alpha', 30),
    (2, 2, 'Omega', 30),
	(3, 1, 'DOLBY', 3),
    (4, 1, 'Dreamland', 30),
    (5, 1, 'Starlight Cinemas', 30),
    (6, 1, 'Majestic Movie House', 30),
    (7, 1, 'Luminary Lounge', 30),
    (8, 2, 'Galaxy Cinemateque', 30),
    (9, 2, 'Paramount Picture Palace', 30),
    (10, 2, 'Golden Gate Cinemas', 30);

	GO


-- Inserting data into Show table
INSERT INTO Show (Show_ID, Movie_ID, Show_Date, ShowTime)
VALUES 
    (1, 1, '2024-03-21', '14:00:00'),
    (2, 2, '2024-03-21', '15:00:00'),
	(3, 1, '2024-03-22', '09:00:00.0000000'),
	(4, 2, '2024-03-22', '13:00:00.0000000'),
	(5, 3, '2024-03-23', '18:00:00.0000000'),
	(6, 1, '2024-03-23', '22:00:00.0000000'),
	(7, 2, '2024-03-24', '10:00:00.0000000'),
	(8, 3, '2024-03-24', '14:00:00.0000000'),
	(9, 1, '2024-03-25', '19:00:00.0000000'),
	(10, 2, '2024-03-25', '23:00:00.0000000'),
	(11, 3, '2024-03-26', '06:00:00.0000000'),
	(12, 1, '2024-03-26', '10:00:00.0000000');

	GO

-- Inserting data into Screening table
INSERT INTO Screening (Screen_ID, Show_ID, Total_Seats_Sold)
VALUES 
    (1, 1, 30),
    (2, 2, 30),
	(1, 3, 25),
	(2, 4, 20),
	(1, 5, 15),
	(2, 6, 10),
	(1, 7, 28),
	(2, 8, 12),
	(1, 9, 18),
	(2, 10, 5),
	(1, 11, 23),
	(2, 12, 7);


	GO

-- Inserting data into Customer table
INSERT INTO Customer (Customer_ID, Name, Password, Email, Phone)
VALUES 
    (1, 'John Doe', (CONVERT(VARBINARY(400), 'password123')), 'john@example.com', '1234567890'),
    (2, 'Jane Smith', (CONVERT(VARBINARY(400), 'p@ssw0rd')) , 'jane@example.com', '9876543210'),
	(3, 'Caleb Smith',  (CONVERT(VARBINARY(400), 'caleb123')) , 'smith@example.com', '9237567890'),
	(4, 'Emily Johnson', (CONVERT(VARBINARY(400), 'emily456')) , 'emily@example.com', '4567890123'),
	(5, 'Michael Brown', (CONVERT(VARBINARY(400), 'michael789')) , 'michael@example.com', '7890123456');

	GO

-- Inserting data into Booking table
INSERT INTO Booking (Booking_ID, Customer_ID, Show_ID, NumberOfSeats, [Timestamp], Status)
VALUES 
    (1, 1, 1, 2,DEFAULT, 'Confirmed'),
    (2, 2, 2, 3, DEFAULT, 'Pending'),
	(3, 3, 3, 2, DEFAULT, 'Confirmed'),
	(4, 4, 4, 4,DEFAULT, 'Confirmed'),
	(5, 5, 5, 1,DEFAULT, 'Confirmed'),
	(6, 1, 6, 3,DEFAULT, 'Confirmed'),
	(7, 2, 7, 2,DEFAULT, 'Confirmed');

	GO

-- Inserting data into Payment table
INSERT INTO Payment (Payment_ID, Booking_ID, Account_Number, [Timestamp], Amount, PaymentMethod)
VALUES 
    (1, 1, '1234567890123456', DEFAULT, 25.50, 'Credit Card'),
	(3, 3, '9234567890123456', DEFAULT, 30.00, 'Debit Card'),
	(4, 4, '8765432109876543', DEFAULT, 50.25, 'Applepay'),
	(5, 5, '7654321098765432', DEFAULT, 12.50, 'Applepay'),
	(6, 6, '6543210987654321', DEFAULT, 45.00, 'Credit Card'),
	(7, 7, '5432109876543210', DEFAULT, 20.00, 'Gpay');

	GO

-- Inserting data into Movie_Staff table
INSERT INTO Movie_Staff (Staff_ID, Type, First_Name, Last_Name, Salary, Department, Role)
VALUES 
    (1, 'Non-Cast', 'John', 'Doe', 50000.00, 'Production', 'Producer'),
    (2, 'Cast', 'Leonardo', 'DiCaprio', 10000000.00, 'Acting', 'Lead Actor');

	GO

-- Inserting data into Staff_Assignment table
INSERT INTO Staff_Assignment (Assignment_ID, Movie_ID, Staff_ID, Role_In_Movie)
VALUES 
    (1, 1, 1, 'Producer'),
    (2, 1, 2, 'Lead Actor');

	GO

-- Insert Seat Data
INSERT INTO Seat (Seat_ID, Show_ID, isAvailable, Seat_Cost, Type)
VALUES 
    ('A1', 1, 1, 0, 'Gold'),
    ('A2', 1, 1, 0, 'Gold'),
    ('A3', 1, 1, 0, 'Gold'),
    ('A4', 1, 1, 0, 'Gold'),
    ('A5', 1, 1, 0, 'Gold'),
    ('A6', 1, 1, 0, 'Gold'),
    ('A7', 1, 1, 0, 'Gold'),
    ('A8', 1, 1, 0, 'Gold'),
    ('A9', 1, 1, 0, 'Gold'),
    ('A10', 1, 1, 0, 'Gold'),
    ('B1', 1, 1, 0, 'Silver'),
    ('B2', 1, 1, 0, 'Silver'),
    ('B3', 1, 1, 0, 'Silver'),
    ('B4', 1, 1, 0, 'Silver'),
    ('B5', 1, 1, 0, 'Silver'),
    ('B6', 1, 1, 0, 'Silver'),
    ('B7', 1, 1, 0, 'Silver'),
    ('B8', 1, 1, 0, 'Silver'),
    ('B9', 1, 1, 0, 'Silver'),
    ('B10', 1, 1, 0, 'Silver'),
    ('C1', 1, 1, 0, 'Handicap'),
    ('C2', 1, 1, 0, 'Handicap'),
    ('C3', 1, 1, 0, 'Handicap'),
    ('C4', 1, 1, 0, 'Handicap'),
    ('C5', 1, 1, 0, 'Handicap'),
    ('C6', 1, 1, 0, 'Handicap'),
    ('C7', 1, 1, 0, 'Handicap'),
    ('C8', 1, 1, 0, 'Handicap'),
    ('C9', 1, 1, 0, 'Handicap'),
    ('C10', 1, 1, 0, 'Handicap'),
	 ('A1', 2, 1, 0, 'Gold'),
    ('A2', 2, 1, 0, 'Gold'),
    ('A3', 2, 1, 0, 'Gold'),
    ('A4', 2, 1, 0, 'Gold'),
    ('A5', 2, 1, 0, 'Gold'),
    ('A6', 2, 1, 0, 'Gold'),
    ('A7', 2, 1, 0, 'Gold'),
    ('A8', 2, 1, 0, 'Gold'),
    ('A9', 2, 1, 0, 'Gold'),
    ('A10', 2, 1, 0, 'Gold'),
    ('B1', 2, 1, 0, 'Silver'),
    ('B2', 2, 1, 0, 'Silver'),
    ('B3', 2, 1, 0, 'Silver'),
    ('B4', 2, 1, 0, 'Silver'),
    ('B5', 2, 1, 0, 'Silver'),
    ('B6', 2, 1, 0, 'Silver'),
    ('B7', 2, 1, 0, 'Silver'),
    ('B8', 2, 1, 0, 'Silver'),
    ('B9', 2, 1, 0, 'Silver'),
    ('B10', 2, 1, 0, 'Silver'),
    ('C1', 2, 1, 0, 'Handicap'),
    ('C2', 2, 1, 0, 'Handicap'),
    ('C3', 2, 1, 0, 'Handicap'),
    ('C4', 2, 1, 0, 'Handicap'),
    ('C5', 2, 1, 0, 'Handicap'),
    ('C6', 2, 1, 0, 'Handicap'),
    ('C7', 2, 1, 0, 'Handicap'),
    ('C8', 2, 1, 0, 'Handicap'),
    ('C9', 2, 1, 0, 'Handicap'),
    ('C10', 2, 1, 0, 'Handicap');

GO

select * from Movie;
select * from Booking;
select * from City;
select * from Customer;
select * from Movie_Staff;
select * from Payment;
select * from Screen;
select * from Screening;
select * from Seat;
select * from Show;
select * from Staff_Assignment;
select * from Theatre;
