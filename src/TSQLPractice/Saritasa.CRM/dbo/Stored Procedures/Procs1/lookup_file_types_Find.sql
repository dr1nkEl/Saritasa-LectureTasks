
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_file_types table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_file_types_Find
(

	@SearchUsingOR bit   = null ,

	@TypeID char (2)  = null ,

	@TypeName varchar (55)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [typeID]
	, [typeName]
    FROM
	[dbo].[lookup_file_types]
    WHERE 
	 ([typeID] = @TypeID OR @TypeID IS NULL)
	AND ([typeName] = @TypeName OR @TypeName IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [typeID]
	, [typeName]
    FROM
	[dbo].[lookup_file_types]
    WHERE 
	 ([typeID] = @TypeID AND @TypeID is not null)
	OR ([typeName] = @TypeName AND @TypeName is not null)
	SELECT @@ROWCOUNT			
  END
				


