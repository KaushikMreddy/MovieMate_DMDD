# MovieMate Database Project

## Overview
MovieMate is a movie reservation system database project created using SQLServer and integrated with the Streamlit Python library for a user-friendly graphical interface. This project aims to provide a comprehensive solution for managing movie reservations efficiently.

## Database Objects
The project includes the following database objects:

### Stored Procedures
1. **GetMovieScreeningDetails:** Fetches all the show times and seats sold for a certain movie.
2. **UpdateSeatPrices:** Updates the prices of seats by seat type set. This is useful in case the prices of seats need to be lowered during certain months for promotional purposes.
3. **GetTheatreScreenings:** Fetches all the Movies and their show times given a Theatre. 

### Views
1. **TopMoviesByGenre:** Generates a view to show genres and their average rating based on the number of movies present in that genre in that database. 
2. **SeatsSoldPeriod:** Generates a view to show the busiest time of the day by splitting the day into morning, midday, and night.
3. **CustomerMovieSpending:** Generates a view to find the most spending customer. This can be used for offering coupons or for promotional purposes.
4. **MoviesByGrossRevenue:** Generates a view to show which is the most popular movie based on Ticket-based earnings in the database.

### DML Trigger
- **Booking_Add:** This is a trigger to update the number of seats sold for that show in case there is a new booking made.
- **Booking_Cancel:** This is a trigger to update the number of seats sold for a show in case there is a cancellation.

### Table-level CHECK Constraints
1. **Rating_CHK:** A check to keep the rating a movie in a range of 1 - 5.
2. **Type_CHK:** A check to only have 3 types of seats available in the theatres.
3. **CHK_Booking_Status:** A check to see the status of a booking.
4. **CHK_Payment_Method:** A check to set only a certain type of payment method can be used.
5. **StaffType_CHK:** A check to state the type of disjoint discriminator value for a movie staff person

### User-Defined Function
- **CalculateAmountWithTax**: Calculates the price of tickets to a movie along with the tax to be paid.

### Column Data Encryption
- Implementation of column-level data encryption for sensitive information - This is done for the Password column in the Customer Table

### Non-Clustered Indexes
1. **IDX_Movie_Genre:** An Index on the Movie (Genre) Column.
2. **IDX_Movie_ReleaseDate:** An Index on the Movie (ReleaseDate) Column.
3. **IDX_Movie_Rating:** An Index on the Movie (Rating) Column.
4. **IDX_City_State:** An Index on the City (State) Column.

## Data Visualization
The data from MovieMate database views have been used to visualize desired details from the database to catch trends and patterns.

## Graphical User Interface (GUI)
MovieMate is integrated with a graphical user interface built using the Streamlit Python library, allowing users to perform CRUD operations seamlessly.

## Usage
To run MovieMate, follow these steps:
1. Clone the repository to your local machine.
2. Install the necessary python dependencies.
3. Set up the SQLServer database according to the provided schema (All_DDL_Qeueries.sql).
4. Execute the SQL scripts to create the required database objects (All_DML_Qeueries.sql).
5. Run the Streamlit Python script  to launch the graphical interface.
6. Run this code to run the UI
7. ```python writedb.py```  This is to check if Database connection is working
8. ``` streamlit run run.py ``` This is to start the streamlit app
9. Start managing movie reservations effortlessly! 2 Tab will open, 1 for User and 1 for Admin

## Contributors
- Kaushik Malikireddy, Muskan Agrawal, Shaun Pradeep Dsouza, Kusumanth Reddy Gali, Nikhil Srinivas Regulapati 

## License
This project is licensed under the [License Name]. See the LICENSE file for details.
