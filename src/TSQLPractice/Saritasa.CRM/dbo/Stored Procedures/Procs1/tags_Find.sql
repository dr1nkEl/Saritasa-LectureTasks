
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Tags table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tags_Find]
(

	@SearchUsingOR bit   = null ,

	@TagID bigint   = null ,

	@Title varchar (255)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [tagID]
	, [Title]
    FROM
	[dbo].[Tags]
    WHERE 
	 ([tagID] = @TagID OR @TagID IS NULL)
	AND ([Title] = @Title OR @Title IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [tagID]
	, [Title]
    FROM
	[dbo].[Tags]
    WHERE 
	 ([tagID] = @TagID AND @TagID is not null)
	OR ([Title] = @Title AND @Title is not null)
	SELECT @@ROWCOUNT			
  END