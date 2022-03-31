
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vJobsByClientAndProject view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobsByClientAndProject_Get_List

AS


				
				SELECT
					[JobId],
					[JobDuration],
					[JobDescription],
					[DurationWithJobRounding],
					[DurationBillable],
					[BillableWithJobRounding],
					[DurationNonBillable],
					[NonBillableWithJobRounding],
					[JobDate],
					[ClientId],
					[ProjectId],
					[ProjectName],
					[ProjectDocumentId],
					[ProjectMinHoursPerMonth],
					[ClientMinHoursPerMonth],
					[ClientName],
					[BillableNote],
					[ClientBillableType],
					[DepartmentId],
					[DepartmentName],
					[ClientDocumentID],
					[HasHosting],
					[HostingStart],
					[HostingFee],
					[HostingFrequency],
					[BillingVariable],
					[BillingType],
					[ProjectFrequency],
					[ProjectPriorityId],
					[ProjectUtilization],
					[JobBillable],
					[TargetName],
					[TargetDocumentTypeId],
					[TargetObjectId],
					[UserFullName],
					[UserTypeId],
					[Paid],
					[InHouse],
					[InvestmentFree],
					[Overbudget],
					[NonBillable],
					[BranchId],
					[WorkTypeId],
					[WorkTypeName],
					[JobCreatedByUserId]
				FROM
					[dbo].[_vJobsByClientAndProject]
					
				SELECT @@ROWCOUNT