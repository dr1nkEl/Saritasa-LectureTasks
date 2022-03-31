
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the email_templates table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.email_templates_Delete
(

	@EmailTemplateID int   
)
AS


				DELETE FROM [dbo].[email_templates] WITH (ROWLOCK) 
				WHERE
					[emailTemplateID] = @EmailTemplateID
					
			


