
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Files table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[files_Delete]
(

	@FileID int   
)
AS


				DELETE FROM [dbo].[Files] WITH (ROWLOCK) 
				WHERE
					[fileID] = @FileID