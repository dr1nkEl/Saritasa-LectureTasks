
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Phones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_Delete]
(

	@PhoneID int   
)
AS


				DELETE FROM [dbo].[Phones] WITH (ROWLOCK) 
				WHERE
					[phoneID] = @PhoneID