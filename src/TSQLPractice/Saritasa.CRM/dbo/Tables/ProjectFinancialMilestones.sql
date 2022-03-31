CREATE TABLE [dbo].[ProjectFinancialMilestones] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [ProjectId]     INT           NOT NULL,
    [Name]          VARCHAR (100) NOT NULL,
    [SheduledDate]  DATETIME      NULL,
    [PaymentStatus] BIT           CONSTRAINT [DF_ProjectFinancialMilestones_PaymentStatus] DEFAULT ((0)) NOT NULL,
    [PaymentDate]   DATETIME      NULL,
    [OrderId]       INT           CONSTRAINT [DF_ProjectFinancialMilestones_OrderId] DEFAULT ((0)) NOT NULL,
    [PhaseDone]     BIT           CONSTRAINT [DF_ProjectFinancialMilestones_PhaseDone] DEFAULT ((0)) NOT NULL,
    [Completeness]  SMALLINT      DEFAULT ((100)) NOT NULL,
    CONSTRAINT [PK_projectMilestones] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ProjectFinancialMilestones_Projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID])
);

