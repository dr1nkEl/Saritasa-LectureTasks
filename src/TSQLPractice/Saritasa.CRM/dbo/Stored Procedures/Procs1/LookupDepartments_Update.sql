
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the LookupDepartments table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupDepartments_Update
(

	@Id int   ,

	@Name varchar (50)  ,

	@Utilization bit   ,

	@Deleted bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[LookupDepartments]
				SET
					[name] = @Name
					,[utilization] = @Utilization
					,[deleted] = @Deleted
				WHERE
[Id] = @Id