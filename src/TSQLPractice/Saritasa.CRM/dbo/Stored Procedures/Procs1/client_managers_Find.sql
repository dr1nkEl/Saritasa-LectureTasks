
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the client_managers table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.client_managers_Find
(

	@SearchUsingOR bit   = null ,

	@CmID int   = null ,

	@ClientID int   = null ,

	@RoleID char (3)  = null ,

	@EmployeeUserID int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [cmID]
	, [clientID]
	, [roleID]
	, [employeeUserID]
    FROM
	[dbo].[client_managers]
    WHERE 
	 ([cmID] = @CmID OR @CmID IS NULL)
	AND ([clientID] = @ClientID OR @ClientID IS NULL)
	AND ([roleID] = @RoleID OR @RoleID IS NULL)
	AND ([employeeUserID] = @EmployeeUserID OR @EmployeeUserID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [cmID]
	, [clientID]
	, [roleID]
	, [employeeUserID]
    FROM
	[dbo].[client_managers]
    WHERE 
	 ([cmID] = @CmID AND @CmID is not null)
	OR ([clientID] = @ClientID AND @ClientID is not null)
	OR ([roleID] = @RoleID AND @RoleID is not null)
	OR ([employeeUserID] = @EmployeeUserID AND @EmployeeUserID is not null)
	SELECT @@ROWCOUNT			
  END
				


