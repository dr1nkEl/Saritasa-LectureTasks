CREATE TABLE [dbo].[lookup_rules] (
    [ruleID]      VARCHAR (20)  NOT NULL,
    [Description] VARCHAR (100) NULL,
    [GroupId]     INT           NOT NULL,
    CONSTRAINT [PK_lr_ruleID] PRIMARY KEY CLUSTERED ([ruleID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_lr_lrg_groupID] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[lookup_rule_groups] ([groupID])
);

