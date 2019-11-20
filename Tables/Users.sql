CREATE TABLE [dbo].[Users]
(
	[ClusteredId] INT NOT NULL IDENTITY, 
    [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY NONCLUSTERED, 
    [Email] NVARCHAR(256) NULL, 
    [Username] NVARCHAR(50) NULL, 
    [Password] VARCHAR(40) NULL, 
    CONSTRAINT [UN_Users_Username] UNIQUE(Username),
	CONSTRAINT [UN_Users_Email] UNIQUE(Email)

)

GO

CREATE CLUSTERED INDEX [IX_Users_ClusteredId] ON [dbo].[Users] ([ClusteredId])
