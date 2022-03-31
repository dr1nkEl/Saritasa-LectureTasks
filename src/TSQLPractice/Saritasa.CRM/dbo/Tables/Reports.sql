CREATE TABLE [dbo].[Reports] (
    [reportID]   INT          IDENTITY (1, 1) NOT NULL,
    [ClientId]   INT          NOT NULL,
    [DocumentId] BIGINT       NOT NULL,
    [EmailedTo]  VARCHAR (50) NULL,
    [Email]      VARCHAR (50) NULL,
    [DateFrom]   DATETIME     NULL,
    [DateTo]     DATETIME     NOT NULL,
    CONSTRAINT [PK_reports] PRIMARY KEY CLUSTERED ([reportID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_reports_clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([clientID]),
    CONSTRAINT [FK_reports_documents] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID])
);

