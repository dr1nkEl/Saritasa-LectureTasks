
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the CalendarList table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarList_Find]
(

	@SearchUsingOR bit   = null ,

	@CID int   = null ,

	@Date datetime   = null ,

	@BranchId int   = null ,

	@Holiday bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [cID]
	, [Date]
	, [BranchId]
	, [Holiday]
    FROM
	[dbo].[CalendarList]
    WHERE 
	 ([cID] = @CID OR @CID IS NULL)
	AND ([Date] = @Date OR @Date IS NULL)
	AND ([BranchId] = @BranchId OR @BranchId IS NULL)
	AND ([Holiday] = @Holiday OR @Holiday IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [cID]
	, [Date]
	, [BranchId]
	, [Holiday]
    FROM
	[dbo].[CalendarList]
    WHERE 
	 ([cID] = @CID AND @CID is not null)
	OR ([Date] = @Date AND @Date is not null)
	OR ([BranchId] = @BranchId AND @BranchId is not null)
	OR ([Holiday] = @Holiday AND @Holiday is not null)
	SELECT @@ROWCOUNT			
  END