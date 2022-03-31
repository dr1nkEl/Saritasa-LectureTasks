CREATE TABLE [dbo].[EmploymentScores] (
    [scoreID]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserId]         INT           NOT NULL,
    [Points]         SMALLINT      NOT NULL,
    [CreatedBy]      INT           NOT NULL,
    [Created]        DATETIME      NOT NULL,
    [Description]    VARCHAR (MAX) NULL,
    [UseForRotation] BIT           CONSTRAINT [DF_employmentScores_useForRotation] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_EmploymentScores] PRIMARY KEY CLUSTERED ([scoreID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_employmentScores_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_employmentScores_users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_employmentScores_userID]
    ON [dbo].[EmploymentScores]([UserId] ASC) WITH (FILLFACTOR = 80, ALLOW_PAGE_LOCKS = OFF);


GO


-- =============================================
-- Author:		Alexander Far.
-- Create date: 
-- Description:	calculate score vaslue in table Users
-- =============================================
CREATE TRIGGER [dbo].[iud_employmentScores]
   ON  [dbo].[employmentScores]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	update employees 
	set score = isnull((select sum(points) from employmentScores es where employees.Id = es.UserId and created >  dateadd(day, -30, getdate())),0 )
	where Id in (SELECT Id FROM inserted union SELECT Id FROM deleted )
    -- Insert statements for trigger here
END