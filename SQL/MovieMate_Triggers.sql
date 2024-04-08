use MovieMate3;

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

------------------------------------------------------------------------------TRIGGER2

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



---------------------------------------------------

insert into Booking values (8, 1, 10, 5,DEFAULT, 'Pending');
update Booking set Status = 'Cancelled' where Booking_ID = 8;

select * from Booking;
Select * from Screening;

drop table Screening;