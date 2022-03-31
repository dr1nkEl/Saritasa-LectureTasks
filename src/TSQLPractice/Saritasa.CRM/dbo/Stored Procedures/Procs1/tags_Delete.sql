
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Tags table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tags_Delete]
(

	@TagID bigint   
)
AS


				DELETE FROM [dbo].[Tags] WITH (ROWLOCK) 
				WHERE
					[tagID] = @TagID