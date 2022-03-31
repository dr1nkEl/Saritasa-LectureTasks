
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarPersonalPeriods table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[CalendarPersonalPeriods_GetByUserID]
(

	@UserId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[periodID],
					[UserId],
					[FileId],
					[Confirmed],
					[Type],
					[ApprovedBy],
					[StartDate],
					[EndDate],
					[ApprovedAt],
					[PaidAt],
					[ActualDays]
				FROM
					[dbo].[CalendarPersonalPeriods]
				WHERE
					[UserId] = @UserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON