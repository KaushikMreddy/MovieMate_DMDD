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

-- Insert Gold seats for Show Table
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


	----------------------Stored Procedures---------------------------
	------------------------------------------------------------------\

	GO


	-------------------------------------SP1
	CREATE PROCEDURE GetMovieScreeningDetails
		@MovieTitle VARCHAR(255)
	AS
	BEGIN
		SELECT 
			M.Title AS Movie_Title,
			S.Show_Date,
			S.ShowTime,
			T.Name AS Theatre,
			C.Name AS City,
			SC.Total_Seats_Sold,
			CASE 
				WHEN (Scr.Total_Seats - SC.Total_Seats_Sold) < 0 THEN 0 
				ELSE (Scr.Total_Seats - SC.Total_Seats_Sold) 
			END AS Available_Seats
		FROM 
			MovieMate3.dbo.Movie M
		INNER JOIN 
			MovieMate3.dbo.Show S ON M.Movie_ID = S.Movie_ID
		INNER JOIN 
			MovieMate3.dbo.Screening SC ON S.Show_ID = SC.Show_ID
		INNER JOIN 
			MovieMate3.dbo.Screen Scr ON SC.Screen_ID = Scr.Screen_ID
		INNER JOIN 
			MovieMate3.dbo.Theatre T ON Scr.Theatre_ID = T.Theatre_ID
		INNER JOIN 
			MovieMate3.dbo.City C ON T.City_ID = C.City_ID
		WHERE 
			M.Title = @MovieTitle;
	END

	-- drop procedure GetMovieScreeningDetails;

	EXEC GetMovieScreeningDetails @MovieTitle = 'Inception';


	----------------------------------------------------SP2
	CREATE PROCEDURE UpdateSeatPrices
	AS
	BEGIN
		UPDATE MovieMate3.dbo.Seat
		SET Seat_Cost = 
			CASE 
				WHEN Type = 'Gold' THEN
					CASE
						WHEN MONTH(GETDATE()) IN (12, 1, 2, 3, 4, 5) THEN 100  -- Winter season pricing for Gold seats
						ELSE 80  -- Default pricing for Gold seats
					END
				WHEN Type = 'Silver' THEN
					CASE
						WHEN MONTH(GETDATE()) IN (6, 7, 8) THEN 80  -- Summer season pricing for Silver seats
						ELSE 60  -- Default pricing for Silver seats
					END
				WHEN Type = 'Handicap' THEN
					CASE
						WHEN MONTH(GETDATE()) IN (3, 4, 5) THEN 150  -- Spring season pricing for Handicap seats
						ELSE 120  -- Default pricing for Handicap seats
					END
			END
		WHERE Type IN ('Gold', 'Silver', 'Handicap'); -- Specify which seats should be updated
	END


	EXEC UpdateSeatPrices;

	--select * from Seat order by Show_ID;

	--DROP Procedure UpdateSeatPrices;

	------------------------------------------------------------------------SP3


	CREATE PROCEDURE GetTheatreScreenings
		@TheatreName VARCHAR(255)
    
	AS
	BEGIN
		SELECT
			M.Title AS Movie_Title,
			S.ShowTime,
			Scr.Screen_ID,
			SC.Total_Seats_Sold,
        
        
			(Scr.Total_Seats - SC.Total_Seats_Sold) AS Available_Seats
		FROM
			dbo.Movie M
		INNER JOIN
			dbo.Show S ON M.Movie_ID = S.Movie_ID
		INNER JOIN
			dbo.Screening SC ON S.Show_ID = SC.Show_ID
		INNER JOIN
			dbo.Screen Scr ON SC.Screen_ID = Scr.Screen_ID
		INNER JOIN
			dbo.Theatre T ON Scr.Theatre_ID = T.Theatre_ID
		WHERE
			T.Name = @TheatreName;
	END

	--drop procedure GetTheatreScreenings;

	EXEC GetTheatreScreenings @TheatreName = 'AMC Empire 25'  ;

	-----------------------------------------------------------------------------------
	---------------------User Defined Function-----------------------------------------

	--- UDF to calculate Tax


	CREATE FUNCTION CalculateAmountWithTax (
		@Amount DECIMAL(10, 2) -- Specify appropriate precision
	)
	RETURNS DECIMAL(10, 2) 
	AS
	BEGIN
		DECLARE @TotalAmount DECIMAL(10, 2)
		DECLARE @TaxRate DECIMAL(5,2) = 0.07 
 
		SET @TotalAmount = @Amount + (@Amount * @TaxRate)
 
		RETURN @TotalAmount
	END

	select * from Payment;

	-- drop Function CalculateAmountWithTax;

	SELECT *, dbo.CalculateAmountWithTax(p.Amount) as Total_Payable from Payment p;


	-------------------------------------------------------------------------------------
	--------------------------------Views------------------------------------------------


	-- View 1

	CREATE VIEW TopMoviesByGenre AS
	SELECT Genre, AVG(Rating) AS AverageRating, COUNT(*) AS NumberOfMovies
	FROM Movie
	GROUP BY Genre;


	SELECT * FROM TopMoviesByGenre
	ORDER BY AverageRating DESC;

	------------------------------------------------------------------

	--View 2

	select * from Screen;
	select * from Screening order by Show_ID;
	select * from Show;


	CREATE VIEW SeatsSoldPeriod AS
	SELECT 
		sh.Show_Date,
		CASE 
			WHEN DATEPART(HOUR, sh.ShowTime) >= 6 AND DATEPART(HOUR, sh.ShowTime) < 12 THEN 'Morning'
			WHEN DATEPART(HOUR, sh.ShowTime) >= 12 AND DATEPART(HOUR, sh.ShowTime) < 18 THEN 'Midday'
			ELSE 'Night' 
		END AS Period,
		SUM(sc.Total_Seats_Sold) AS Total_Seats_Sold
	FROM 
		Screening sc
	INNER JOIN 
		Show sh ON sc.Show_ID = sh.Show_ID
	GROUP BY 
		sh.Show_Date,
		CASE 
			WHEN DATEPART(HOUR, sh.ShowTime) >= 6 AND DATEPART(HOUR, sh.ShowTime) < 12 THEN 'Morning'
			WHEN DATEPART(HOUR, sh.ShowTime) >= 12 AND DATEPART(HOUR, sh.ShowTime) < 18 THEN 'Midday'
			ELSE 'Night' 
		END;

	select * from SeatsSoldPeriod;


	---------------------------------------
	--View 3

	-- To find the spending of customers

	CREATE VIEW CustomerMovieSpending AS
	SELECT 
		c.Customer_ID, 
		c.Name AS CustomerName, 
		c.Email as EmailID,
		SUM(p.Amount) AS TotalAmountSpentOnMovies
	FROM 
		Customer c
	LEFT JOIN 
		Booking b ON c.Customer_ID = b.Customer_ID
	LEFT JOIN 
		Payment p ON b.Booking_ID = p.Booking_ID
	GROUP BY 
		c.Customer_ID, 
		c.Name, 
		c.Email;

	select * from CustomerMovieSpending;

	-------------------------------------------------------------
	-- View 4


	CREATE VIEW MoviesByGrossRevenue AS
	SELECT m.Movie_ID, m.Title, SUM(p.Amount) AS TotalRevenue
	FROM Movie m
	JOIN Show s ON m.Movie_ID = s.Movie_ID
	JOIN Booking b ON s.Show_ID = b.Show_ID
	JOIN Payment p ON b.Booking_ID = p.Booking_ID
	GROUP BY m.Movie_ID, m.Title;

	 select * from TopMoviesByGrossRevenue;

	 ------------------------------------------------------------------
	 --------------------------Triggers--------------------------------


	----------------------------------------------------------------TRIGGER1

	CREATE TRIGGER Booking_Add
	ON Booking
	AFTER INSERT
	AS
	BEGIN
		-- Handle New Bookings
		IF EXISTS (SELECT * FROM inserted) 
		BEGIN 
			UPDATE scr
			SET scr.Total_Seats_Sold = scr.Total_Seats_Sold + 
						 (SELECT i.NumberOfSeats FROM inserted i WHERE i.Show_ID = scr.Show_ID)
			FROM Screening scr
			WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.Show_ID = scr.Show_ID); 
		END

	END

	DROP TRIGGER Booking_Add;

	----------------------------------------------------------------TRIGGER2

	CREATE TRIGGER Booking_Cancel
	ON Booking
	AFTER UPDATE
	AS
	BEGIN
		-- Check if the 'Status' column has been updated to 'Cancelled'
		IF UPDATE(Status)
		BEGIN
			-- Decrease total seats sold in the Screening table for cancelled bookings
			UPDATE s
			SET s.Total_Seats_Sold = s.Total_Seats_Sold - d.NumberOfSeats
			FROM inserted AS i
			INNER JOIN deleted AS d ON i.Booking_ID = d.Booking_ID
			INNER JOIN Screening AS s ON i.Show_ID = s.Show_ID
			WHERE i.Status = 'Cancelled';
		END
	END;

	DROP Trigger Booking_Cancel;



	---------------------------------------------------------------------
	--------------------Non-Clustered Indexes----------------------------

	

	CREATE NONCLUSTERED INDEX IDX_Movie_Genre ON Movie(Genre);

	CREATE NONCLUSTERED INDEX IDX_Movie_ReleaseDate ON Movie(Release_Date);

	CREATE NONCLUSTERED INDEX IDX_Movie_Rating ON Movie(Rating);

	CREATE NONCLUSTERED INDEX IDX_City_State
	ON City(State);


	-- checking the nonclustered index

	SELECT 
		t.name AS TableName,
		i.name AS IndexName,
		i.type_desc AS IndexType,
		COL_NAME(ic.object_id, ic.column_id) AS ColumnName
	FROM 
		sys.tables AS t
	INNER JOIN 
		sys.indexes AS i ON t.object_id = i.object_id
	INNER JOIN 
		sys.index_columns AS ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
	WHERE 
		i.type = 2  -- 2 = Non-clustered index
		AND (t.name = 'Movie' OR t.name = 'City');

	-----------------------------------------------------------------------------
	--------------------------------Data Encryption for Password-----------------

	---- TDE Column Level Data Encryption

	GO

	--Create master key
	create MASTER KEY
		ENCRYPTION BY PASSWORD = 'damg6210';

	GO

	-- Check if Master Key Exists
	SELECT name KeyName,
	symmetric_key_id KeyID,
	key_length KeyLength,
	algorithm_desc KeyAlgorithm
	FROM sys.symmetric_keys;

	GO

	--Create a Self Signed Certificate
	CREATE CERTIFICATE MovieCert
	WITH SUBJECT = 'Movie Password';

	GO

	--Create a symmetric key with AES 256 algorithm using the certificate, as encryption/decryption method
	CREATE SYMMETRIC KEY Movie_SK
	WITH ALGORITHM = AES_256
	ENCRYPTION BY CERTIFICATE MovieCert;

	GO

	--Open the symmetric key with which to encrypt the data.
	OPEN SYMMETRIC KEY Movie_SK
	DECRYPTION BY CERTIFICATE MovieCert;

	GO


	--Encrypt values in password column 
	UPDATE Customer
	set Password = EncryptByKey(Key_GUID('Movie_SK'), Password );

	GO

	--Openining the Symmetric Key has to be done  to decrypt
	OPEN SYMMETRIC KEY Movie_SK
	DECRYPTION BY CERTIFICATE MovieCert;

	GO

	-- decrypt to check if values are correct
	SELECT *,
	CONVERT(varchar, DecryptByKey(Password))
	AS 'Decrypted password'
	FROM Customer;


	--------------------------------------------------------------------------
	-----------------------------GUI Database Auth---------------------------- ( For certain SQL servers)

	-- Step 1: Create a Login at the SQL Server instance level
	CREATE LOGIN team16 WITH PASSWORD = 'Damg@6210';

	-- Step 2: Use the target database
	USE MovieMate3; -- Replace YourDatabaseName with the name of your database

	-- Step 3: Create a User in your database for that login
	CREATE USER team16 FOR LOGIN team16;

	-- Step 4: Assign read and write roles to the user
	EXEC sp_addrolemember 'db_datareader', 'team16';
	EXEC sp_addrolemember 'db_datawriter', 'team16';
	GRANT execute to team16





