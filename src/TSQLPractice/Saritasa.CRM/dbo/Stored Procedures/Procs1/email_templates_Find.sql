
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the email_templates table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.email_templates_Find
(

	@SearchUsingOR bit   = null ,

	@EmailTemplateID int   = null ,

	@TemplateName varchar (100)  = null ,

	@Subject varchar (MAX)  = null ,

	@CcCopyTo varchar (MAX)  = null ,

	@Body varchar (MAX)  = null ,

	@FromName varchar (50)  = null ,

	@FromAddress varchar (50)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [emailTemplateID]
	, [templateName]
	, [subject]
	, [ccCopyTo]
	, [body]
	, [fromName]
	, [fromAddress]
    FROM
	[dbo].[email_templates]
    WHERE 
	 ([emailTemplateID] = @EmailTemplateID OR @EmailTemplateID IS NULL)
	AND ([templateName] = @TemplateName OR @TemplateName IS NULL)
	AND ([subject] = @Subject OR @Subject IS NULL)
	AND ([ccCopyTo] = @CcCopyTo OR @CcCopyTo IS NULL)
	AND ([body] = @Body OR @Body IS NULL)
	AND ([fromName] = @FromName OR @FromName IS NULL)
	AND ([fromAddress] = @FromAddress OR @FromAddress IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [emailTemplateID]
	, [templateName]
	, [subject]
	, [ccCopyTo]
	, [body]
	, [fromName]
	, [fromAddress]
    FROM
	[dbo].[email_templates]
    WHERE 
	 ([emailTemplateID] = @EmailTemplateID AND @EmailTemplateID is not null)
	OR ([templateName] = @TemplateName AND @TemplateName is not null)
	OR ([subject] = @Subject AND @Subject is not null)
	OR ([ccCopyTo] = @CcCopyTo AND @CcCopyTo is not null)
	OR ([body] = @Body AND @Body is not null)
	OR ([fromName] = @FromName AND @FromName is not null)
	OR ([fromAddress] = @FromAddress AND @FromAddress is not null)
	SELECT @@ROWCOUNT			
  END
				


