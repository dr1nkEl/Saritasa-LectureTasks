
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the UserNoteSettings table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[userNoteSettings_Find]
(

	@SearchUsingOR bit   = null ,

	@SetID int   = null ,

	@ContentType char (2)  = null ,

	@UserId int   = null ,

	@Type tinyint   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [setID]
	, [ContentType]
	, [UserId]
	, [Type]
    FROM
	[dbo].[UserNoteSettings]
    WHERE 
	 ([setID] = @SetID OR @SetID IS NULL)
	AND ([ContentType] = @ContentType OR @ContentType IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Type] = @Type OR @Type IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [setID]
	, [ContentType]
	, [UserId]
	, [Type]
    FROM
	[dbo].[UserNoteSettings]
    WHERE 
	 ([setID] = @SetID AND @SetID is not null)
	OR ([ContentType] = @ContentType AND @ContentType is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Type] = @Type AND @Type is not null)
	SELECT @@ROWCOUNT			
  END