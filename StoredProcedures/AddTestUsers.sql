CREATE PROCEDURE [dbo].[AddTestUsers]
    @usersCount INT = 20
AS
    DECLARE @i INT = 0;

    WHILE @i < @usersCount
    BEGIN
        INSERT INTO Users (Id, Email, Username, Password)
        VALUES (
            NEWID(),
            CONCAT(N'user', @i, N'@mail.com'),
            CONCAT(N'user', @i),
            (SELECT HASHBYTES('SHA1', CONCAT(N'userpass', @i)) for xml path(''))
        )
        
        SET @i = @i + 1;
    END;