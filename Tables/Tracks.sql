CREATE TABLE [dbo].[Tracks]
(
    [ClusteredId] INT NOT NULL IDENTITY, 
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY NONCLUSTERED, 
    [PlaylistId] UNIQUEIDENTIFIER NOT NULL, 
    [TrackName] NVARCHAR(100) NOT NULL, 
    [FileName] VARCHAR(200) NOT NULL, 
    CONSTRAINT [FK_Tracks_PlaylistId] FOREIGN KEY ([PlaylistId]) REFERENCES [Playlists]([Id]), 
)

GO

CREATE CLUSTERED INDEX [IX_Tracks_ClusteredId] ON [dbo].[Tracks] ([ClusteredId])
