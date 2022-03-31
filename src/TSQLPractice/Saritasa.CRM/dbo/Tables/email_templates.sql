CREATE TABLE [dbo].[email_templates] (
    [emailTemplateID] INT           IDENTITY (1, 1) NOT NULL,
    [TemplateName]    VARCHAR (100) NULL,
    [Subject]         VARCHAR (MAX) NULL,
    [ccCopyTo]        VARCHAR (MAX) NULL,
    [Body]            VARCHAR (MAX) NULL,
    [FromName]        VARCHAR (50)  NULL,
    [FromAddress]     VARCHAR (50)  NULL,
    CONSTRAINT [PK_emailTemplateID] PRIMARY KEY CLUSTERED ([emailTemplateID] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_emailt_templateName]
    ON [dbo].[email_templates]([TemplateName] ASC) WITH (FILLFACTOR = 80);

