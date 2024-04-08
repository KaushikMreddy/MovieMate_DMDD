---- TDE Column Level Data Encryption

use MovieMate3;

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




