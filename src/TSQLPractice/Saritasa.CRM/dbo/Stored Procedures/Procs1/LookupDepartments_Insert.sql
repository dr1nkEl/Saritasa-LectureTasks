
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the LookupDepartments table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupDepartments_Insert
(

	@Id int    OUTPUT,

	@Name varchar (50)  ,

	@Utilization bit   ,

	@Deleted bit   
)
AS


				
				INSERT INTO [dbo].[LookupDepartments]
					(
					[name]
					,[utilization]
					,[deleted]
					)
				VALUES
					(
					@Name
					,@Utilization
					,@Deleted
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()