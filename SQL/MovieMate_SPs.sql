use MovieMate3;

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

drop procedure GetMovieScreeningDetails;

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

select * from Seat order by Show_ID;

DROP Procedure UpdateSeatPrices;

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

drop procedure GetTheatreScreenings;

EXEC GetTheatreScreenings @TheatreName = 'AMC Empire 25'  ;

select @@SERVERNAME;