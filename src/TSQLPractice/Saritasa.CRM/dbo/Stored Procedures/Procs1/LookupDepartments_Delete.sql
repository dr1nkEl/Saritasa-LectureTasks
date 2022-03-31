
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the LookupDepartments table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupDepartments_Delete
(

	@Id int   
)
AS


				DELETE FROM [dbo].[LookupDepartments] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id