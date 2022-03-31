
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the ProjectCheckList table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectCheckList_Find]
(

	@SearchUsingOR bit   = null ,

	@ProjectCheckId int   = null ,

	@CheckId int   = null ,

	@ProjectId int   = null ,

	@PmCheck bit   = null ,

	@AmCheck bit   = null ,

	@ActualDate datetime   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [ProjectCheckId]
	, [CheckId]
	, [ProjectId]
	, [PmCheck]
	, [AmCheck]
	, [ActualDate]
    FROM
	[dbo].[ProjectCheckList]
    WHERE 
	 ([ProjectCheckId] = @ProjectCheckId OR @ProjectCheckId IS NULL)
	AND ([CheckId] = @CheckId OR @CheckId IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([PmCheck] = @PmCheck OR @PmCheck IS NULL)
	AND ([AmCheck] = @AmCheck OR @AmCheck IS NULL)
	AND ([ActualDate] = @ActualDate OR @ActualDate IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [ProjectCheckId]
	, [CheckId]
	, [ProjectId]
	, [PmCheck]
	, [AmCheck]
	, [ActualDate]
    FROM
	[dbo].[ProjectCheckList]
    WHERE 
	 ([ProjectCheckId] = @ProjectCheckId AND @ProjectCheckId is not null)
	OR ([CheckId] = @CheckId AND @CheckId is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([PmCheck] = @PmCheck AND @PmCheck is not null)
	OR ([AmCheck] = @AmCheck AND @AmCheck is not null)
	OR ([ActualDate] = @ActualDate AND @ActualDate is not null)
	SELECT @@ROWCOUNT			
  END