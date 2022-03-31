
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Phones table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_Find]
(

	@SearchUsingOR bit   = null ,

	@PhoneID int   = null ,

	@Phone varchar (50)  = null ,

	@TargetId bigint   = null ,

	@TypeId char (3)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [phoneID]
	, [Phone]
	, [TargetId]
	, [TypeId]
    FROM
	[dbo].[Phones]
    WHERE 
	 ([phoneID] = @PhoneID OR @PhoneID IS NULL)
	AND ([Phone] = @Phone OR @Phone IS NULL)
	AND ([TargetId] = @TargetId OR @TargetId IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [phoneID]
	, [Phone]
	, [TargetId]
	, [TypeId]
    FROM
	[dbo].[Phones]
    WHERE 
	 ([phoneID] = @PhoneID AND @PhoneID is not null)
	OR ([Phone] = @Phone AND @Phone is not null)
	OR ([TargetId] = @TargetId AND @TargetId is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	SELECT @@ROWCOUNT			
  END