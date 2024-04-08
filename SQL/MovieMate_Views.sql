-- Views for MovieMate
use MovieMate3;
-- View 1

CREATE VIEW TopMoviesByGenre AS
SELECT Genre, AVG(Rating) AS AverageRating, COUNT(*) AS NumberOfMovies
FROM Movie
GROUP BY Genre;


SELECT * FROM TopMoviesByGenre
ORDER BY AverageRating DESC;

-------------------------------------------------

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

select * from Booking;

CREATE VIEW MoviesByGrossRevenue AS
SELECT m.Movie_ID, m.Title, SUM(p.Amount) AS TotalRevenue
FROM Movie m
JOIN Show s ON m.Movie_ID = s.Movie_ID
JOIN Booking b ON s.Show_ID = b.Show_ID
JOIN Payment p ON b.Booking_ID = p.Booking_ID
GROUP BY m.Movie_ID, m.Title;

drop View TopMoviesByGrossRevenue;

select * from MoviesByGrossRevenue;
select * from Booking order by Show_ID;
select * from Show;
select * from Payment;

select * from Booking;
select * from Payment;

delete from Payment where Payment_ID = 2;

