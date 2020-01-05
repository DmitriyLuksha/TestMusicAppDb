CREATE TABLE [dbo].[Playlists]
(
    [ClusteredId] INT NOT NULL IDENTITY, 
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY NONCLUSTERED, 
    [Name] NVARCHAR(100) NOT NULL, 
    [UserId] UNIQUEIDENTIFIER NOT NULL, 
    CONSTRAINT [FK_Playlists_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users]([Id]), 
)

GO

CREATE CLUSTERED INDEX [IX_Playlists_ClusteredId] ON [dbo].[Playlists] ([ClusteredId])
