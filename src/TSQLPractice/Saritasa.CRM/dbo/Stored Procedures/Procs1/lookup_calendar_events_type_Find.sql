
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_calendar_events_type table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calendar_events_type_Find
(

	@SearchUsingOR bit   = null ,

	@TypeID varchar (3)  = null ,

	@TypeName varchar (100)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [typeID]
	, [typeName]
    FROM
	[dbo].[lookup_calendar_events_type]
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
	[dbo].[lookup_calendar_events_type]
    WHERE 
	 ([typeID] = @TypeID AND @TypeID is not null)
	OR ([typeName] = @TypeName AND @TypeName is not null)
	SELECT @@ROWCOUNT			
  END
				


