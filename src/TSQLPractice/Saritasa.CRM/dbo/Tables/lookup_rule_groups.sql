CREATE TABLE [dbo].[lookup_rule_groups] (
    [groupID]   INT           IDENTITY (1, 1) NOT NULL,
    [GroupName] VARCHAR (100) NULL,
    CONSTRAINT [PK_lrg_groupID] PRIMARY KEY CLUSTERED ([groupID] ASC) WITH (FILLFACTOR = 80)
);

