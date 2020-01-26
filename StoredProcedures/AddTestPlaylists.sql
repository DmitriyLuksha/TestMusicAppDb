CREATE PROCEDURE [dbo].[AddTestPlaylists]
    @playlistsCount INT = 50
AS
    DECLARE @i INT = 0;

    WHILE @i < @playlistsCount
    BEGIN
        DECLARE @userId UNIQUEIDENTIFIER = (
            SELECT TOP 1 Id
            FROM Users
            ORDER BY NEWID()
        )

        INSERT INTO Playlists(Id, Name, UserId)
        VALUES (
            NEWID(),
            CONCAT(N'playlist', @i),
            @userId
        )
        
        SET @i = @i + 1;
    END;