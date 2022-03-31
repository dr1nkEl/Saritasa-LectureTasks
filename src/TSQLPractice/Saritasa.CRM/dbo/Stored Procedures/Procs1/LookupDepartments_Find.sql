
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the LookupDepartments table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupDepartments_Find
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@Name varchar (50)  = null ,

	@Utilization bit   = null ,

	@Deleted bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [name]
	, [utilization]
	, [deleted]
    FROM
	[dbo].[LookupDepartments]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
	AND ([utilization] = @Utilization OR @Utilization IS NULL)
	AND ([deleted] = @Deleted OR @Deleted IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [name]
	, [utilization]
	, [deleted]
    FROM
	[dbo].[LookupDepartments]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	OR ([utilization] = @Utilization AND @Utilization is not null)
	OR ([deleted] = @Deleted AND @Deleted is not null)
	SELECT @@ROWCOUNT			
  END