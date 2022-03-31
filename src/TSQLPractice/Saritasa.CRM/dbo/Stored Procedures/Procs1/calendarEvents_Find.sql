
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the CalendarEvents table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_Find]
(

	@SearchUsingOR bit   = null ,

	@CeID bigint   = null ,

	@Date datetime   = null ,

	@Text varchar (MAX)  = null ,

	@CreatedBy int   = null ,

	@DocumentId bigint   = null ,

	@TypeId varchar (3)  = null ,

	@SenderList varchar (200)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [ceID]
	, [Date]
	, [Text]
	, [CreatedBy]
	, [DocumentId]
	, [TypeId]
	, [SenderList]
    FROM
	[dbo].[CalendarEvents]
    WHERE 
	 ([ceID] = @CeID OR @CeID IS NULL)
	AND ([Date] = @Date OR @Date IS NULL)
	AND ([Text] = @Text OR @Text IS NULL)
	AND ([CreatedBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
	AND ([SenderList] = @SenderList OR @SenderList IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [ceID]
	, [Date]
	, [Text]
	, [CreatedBy]
	, [DocumentId]
	, [TypeId]
	, [SenderList]
    FROM
	[dbo].[CalendarEvents]
    WHERE 
	 ([ceID] = @CeID AND @CeID is not null)
	OR ([Date] = @Date AND @Date is not null)
	OR ([Text] = @Text AND @Text is not null)
	OR ([CreatedBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	OR ([SenderList] = @SenderList AND @SenderList is not null)
	SELECT @@ROWCOUNT			
  END