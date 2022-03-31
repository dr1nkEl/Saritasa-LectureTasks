
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the ProjectChangeOrders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectChangeOrders_Delete
(

	@ChangeOrderID int   
)
AS


				DELETE FROM [dbo].[ProjectChangeOrders] WITH (ROWLOCK) 
				WHERE
					[changeOrderID] = @ChangeOrderID