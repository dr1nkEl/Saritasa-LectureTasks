CREATE SYMMETRIC KEY [PasswordFieldSymmetricKey]
    AUTHORIZATION [dbo]
    WITH ALGORITHM = DES
    ENCRYPTION BY CERTIFICATE [PasswordFieldCertificate];

