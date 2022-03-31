
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_calc_types table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calc_types_Find
(

	@SearchUsingOR bit   = null ,

	@TypeID varchar (20)  = null ,

	@Description varchar (300)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [typeID]
	, [Description]
    FROM
	[dbo].[lookup_calc_types]
    WHERE 
	 ([typeID] = @TypeID OR @TypeID IS NULL)
	AND ([Description] = @Description OR @Description IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [typeID]
	, [Description]
    FROM
	[dbo].[lookup_calc_types]
    WHERE 
	 ([typeID] = @TypeID AND @TypeID is not null)
	OR ([Description] = @Description AND @Description is not null)
	SELECT @@ROWCOUNT			
  END
				


