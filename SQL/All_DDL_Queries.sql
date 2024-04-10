Create database MovieMate3;

GO

Use MovieMate3;

GO

CREATE TABLE Movie 
(
 Movie_ID INT not null,
 Title VARCHAR(255),
 Description VARCHAR (255),
 Duration INT,
 Language VARCHAR(50),
 Certificate VARCHAR(30),
 Release_Date DATE, 
 Genre VARCHAR(50),
 Rating INT CONSTRAINT 
	Rating_CHK CHECK ( Rating in (1,2,3,4,5)),
 CONSTRAINT Movie_PK PRIMARY KEY (Movie_ID)
 );

 GO

 CREATE TABLE City (
    City_ID INT,
    Name VARCHAR(255),
    State VARCHAR(255),
	ZipCode INT,
  CONSTRAINT City_PK PRIMARY KEY (City_ID)
);

GO

CREATE TABLE Theatre (
    Theatre_ID INT,
    City_ID INT,
    Name VARCHAR(255),
    Total_Theatres INT,
	CONSTRAINT Theatre_PK PRIMARY KEY (Theatre_ID),
    CONSTRAINT Theatre_FK FOREIGN KEY (City_ID)  REFERENCES City(City_ID)
);

GO

CREATE TABLE Screen (
    Screen_ID INT ,
    Theatre_ID INT,
    Name VARCHAR(255),
    Total_Seats INT,
	CONSTRAINT Screen_PK PRIMARY KEY (Screen_ID),
    CONSTRAINT Screen_FK FOREIGN KEY (Theatre_ID) REFERENCES Theatre(Theatre_ID)
);



GO

CREATE TABLE Show (
Show_ID INT, 
Movie_ID INT, 
Show_Date DATE, 
ShowTime TIME,
CONSTRAINT Show_PK PRIMARY KEY (Show_ID),
CONSTRAINT Show_FK FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);


GO

CREATE TABLE Seat (
    Seat_ID VARCHAR(3),
	Show_ID INT,
	isAvailable BIT,
    Seat_Cost INT,
    Type VARCHAR(30) CONSTRAINT Type_CHK CHECK ( Type in ('Gold','Silver','Handicap')),
	CONSTRAINT Seat_PK PRIMARY KEY (Seat_ID, Show_ID),
    CONSTRAINT Seat_FK FOREIGN KEY (Show_ID) REFERENCES Show(Show_ID)
);

GO

CREATE TABLE Screening (
    Screen_ID INT,
    Show_ID INT,
    Total_Seats_Sold INT,
    CONSTRAINT Screening_PK PRIMARY KEY (Show_ID),
    CONSTRAINT Screening_FK2 FOREIGN KEY (Screen_ID) REFERENCES Screen(Screen_ID),
    CONSTRAINT Screen_FK2 FOREIGN KEY (Show_ID) REFERENCES Show(Show_ID)
);

GO

CREATE TABLE Customer(
    Customer_ID INT,
    Name VARCHAR (255),
    Password VARBINARY(400),
    Email VARCHAR(255),
    Phone VARCHAR(10),
    CONSTRAINT Customer_PK PRIMARY KEY (Customer_ID)
)

GO

CREATE TABLE Booking (
    Booking_ID INT,
    Customer_ID INT,
    Show_ID INT,
    NumberOfSeats INT,
    Timestamp DATETIME DEFAULT GETDATE(),
    Status VARCHAR(50),
	CONSTRAINT Booking_PK PRIMARY KEY (Booking_ID),
    CONSTRAINT Booking_FK1 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT Booking_FK2 FOREIGN KEY (Show_ID) REFERENCES Show(Show_ID),
    CONSTRAINT CHK_Booking_Status CHECK (Status IN ('Confirmed', 'Pending', 'Cancelled'))
);

GO

CREATE TABLE Payment (
    Payment_ID INT,
    Booking_ID INT,
    Account_Number VARCHAR(50),
    Timestamp DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
	CONSTRAINT Payment_PK PRIMARY KEY (Payment_ID),
    CONSTRAINT Payment_FK FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID),
    CONSTRAINT CHK_Payment_Method CHECK (PaymentMethod IN ('Credit Card', 'Debit Card', 'GPay','Applepay'))
);

GO

CREATE TABLE Movie_Staff (
    Staff_ID INT,
    Type VARCHAR(50),
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Salary DECIMAL(10,2),
	Department VARCHAR(100),
	Role VARCHAR(100),
	CONSTRAINT MovieStaff_PK PRIMARY KEY (Staff_ID),
	CONSTRAINT StaffType_CHK CHECK (Type IN ('Non-Cast', 'Cast'))
);

GO

Create TABLE Staff_Assignment(
    Assignment_ID INT, -- Incase a person has multiple roles in a movie
    Movie_ID INT,
    Staff_ID INT,
    Role_In_Movie VARCHAR(50),
	CONSTRAINT Staff_Assignment_PK PRIMARY KEY (Assignment_ID),
    CONSTRAINT Staff_Assignment_FK1 FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    CONSTRAINT Staff_Assignment_FK2 FOREIGN KEY (Staff_ID) REFERENCES Movie_Staff(Staff_ID)
);






 