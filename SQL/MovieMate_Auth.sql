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
