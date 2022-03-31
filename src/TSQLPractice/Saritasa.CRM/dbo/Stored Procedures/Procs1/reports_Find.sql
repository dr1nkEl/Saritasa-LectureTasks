
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Reports table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[reports_Find]
(

	@SearchUsingOR bit   = null ,

	@ReportID int   = null ,

	@ClientId int   = null ,

	@DocumentId bigint   = null ,

	@EmailedTo varchar (50)  = null ,

	@Email varchar (50)  = null ,

	@DateFrom datetime   = null ,

	@DateTo datetime   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [reportID]
	, [ClientId]
	, [DocumentId]
	, [EmailedTo]
	, [Email]
	, [DateFrom]
	, [DateTo]
    FROM
	[dbo].[Reports]
    WHERE 
	 ([reportID] = @ReportID OR @ReportID IS NULL)
	AND ([ClientId] = @ClientId OR @ClientId IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([EmailedTo] = @EmailedTo OR @EmailedTo IS NULL)
	AND ([Email] = @Email OR @Email IS NULL)
	AND ([DateFrom] = @DateFrom OR @DateFrom IS NULL)
	AND ([DateTo] = @DateTo OR @DateTo IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [reportID]
	, [ClientId]
	, [DocumentId]
	, [EmailedTo]
	, [Email]
	, [DateFrom]
	, [DateTo]
    FROM
	[dbo].[Reports]
    WHERE 
	 ([reportID] = @ReportID AND @ReportID is not null)
	OR ([ClientId] = @ClientId AND @ClientId is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([EmailedTo] = @EmailedTo AND @EmailedTo is not null)
	OR ([Email] = @Email AND @Email is not null)
	OR ([DateFrom] = @DateFrom AND @DateFrom is not null)
	OR ([DateTo] = @DateTo AND @DateTo is not null)
	SELECT @@ROWCOUNT			
  END