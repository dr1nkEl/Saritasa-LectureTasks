
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the LookupAddressTypes table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupAddressTypes_Find
(

	@SearchUsingOR bit   = null ,

	@Id char (2)  = null ,

	@Name varchar (55)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [Name]
    FROM
	[dbo].[LookupAddressTypes]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([Name] = @Name OR @Name IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [Name]
    FROM
	[dbo].[LookupAddressTypes]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([Name] = @Name AND @Name is not null)
	SELECT @@ROWCOUNT			
  END