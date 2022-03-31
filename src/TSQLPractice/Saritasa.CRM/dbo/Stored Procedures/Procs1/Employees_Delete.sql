
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Employees table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_Delete
(

	@Id int   
)
AS


				DELETE FROM [dbo].[Employees] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id