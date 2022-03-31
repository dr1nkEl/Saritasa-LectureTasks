/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Events table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[Events_Find]
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@Start_date datetime   = null ,

	@End_date datetime   = null ,

	@Description varchar (1000)  = null ,

	@CreatorID int   = null ,

	@EventType int   = null ,

	@Priority tinyint   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [start_date]
	, [end_date]
	, [description]
	, [creatorID]
	, [eventType]
	, [priority]
    FROM
	[dbo].[Events]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([start_date] = @Start_date OR @Start_date IS NULL)
	AND ([end_date] = @End_date OR @End_date IS NULL)
	AND ([description] = @Description OR @Description IS NULL)
	AND ([creatorID] = @CreatorID OR @CreatorID IS NULL)
	AND ([eventType] = @EventType OR @EventType IS NULL)
	AND ([priority] = @Priority OR @Priority IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [start_date]
	, [end_date]
	, [description]
	, [creatorID]
	, [eventType]
	, [priority]
    FROM
	[dbo].[Events]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([start_date] = @Start_date AND @Start_date is not null)
	OR ([end_date] = @End_date AND @End_date is not null)
	OR ([description] = @Description AND @Description is not null)
	OR ([creatorID] = @CreatorID AND @CreatorID is not null)
	OR ([eventType] = @EventType AND @EventType is not null)
	OR ([priority] = @Priority AND @Priority is not null)
	SELECT @@ROWCOUNT			
  END
