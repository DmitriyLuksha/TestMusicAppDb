CREATE PROCEDURE [dbo].[AddTestTracks]
    @trackFileNames TrackFilesTable READONLY,
    @tracksCount INT = 200
AS
    DECLARE @i INT = 0;

    WHILE @i < @tracksCount
    BEGIN
        DECLARE @playlistId UNIQUEIDENTIFIER = (
            SELECT TOP 1 Id
            FROM Playlists
            ORDER BY NEWID()
        )

        DECLARE @trackFileName VARCHAR(200) = (
            SELECT TOP 1 TrackFileName
            FROM @trackFileNames
            ORDER BY NEWID()
        )

        INSERT INTO Tracks (Id, PlaylistId, TrackName, FileName)
        VALUES (
            NEWID(),
            @playlistId,
            CONCAT(N'track', @i),
            @trackFileName
        )
        
        SET @i = @i + 1;
    END;