
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the ProjectCheckList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectCheckList_Delete]
(

	@ProjectCheckId int   
)
AS


				DELETE FROM [dbo].[ProjectCheckList] WITH (ROWLOCK) 
				WHERE
					[ProjectCheckId] = @ProjectCheckId