
/*
 * Remove isBugFixing column from jobs table.
 */
CREATE View _vucJobListWidget As
SELECT     jobID, billable, description, duration, targetID, createdBy, isError, errorBy, errorReason
FROM         dbo.jobs