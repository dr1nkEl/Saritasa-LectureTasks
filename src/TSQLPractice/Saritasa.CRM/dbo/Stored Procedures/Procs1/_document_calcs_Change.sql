CREATE PROCEDURE dbo._document_calcs_Change
(
    @typeID varchar(100) = null
)
AS
BEGIN
    -- Count of project's tasks
    if (@typeID = 'PT')
    BEGIN
        delete from document_calcs where typeID=@typeID
        insert into document_calcs
        select t.targetID as documentID,@typeID as typeID, count(*) as val from tasks t
        inner join projects p on p.documentID=t.targetID
        group by targetID;
    END

    -- Current project for clients
    else if (@typeID = 'CP')
    BEGIN 
    delete from document_calcs where typeID=@typeID
        --select all change statuse all project
        --delete project with "bad" status
        --select last time of change for each client
        insert into document_calcs
        select c.documentID, @typeID as typeID,
        (select top 1 d.projectID 
        from document_status_history dsh
        left join documents d on d.documentid = dsh.documentid where typeid = 'PRO' 
        and dsh.statusID not in(select statusid from lookup_document_statuses 
        where trackid = (select trackid from document_tracks where typeid = 'PRO' and trackTypeID = 'GEN') 
        and statusname in ('Cancelled','Completed','On-Hold')) 
        and d.clientID = c.clientID order by dsh.statusHistoryID desc) as val from clients c 
        where exists(select 0 from document_status_history dsh 
        left join documents d on d.documentid = dsh.documentid 
        where typeid='PRO'and dsh.statusID not in(select statusid from lookup_document_statuses 
        where trackid = (select trackid from document_tracks where typeid = 'PRO' and trackTypeID = 'GEN') and statusname in ('Cancelled','Completed','On-Hold')) 
        and d.clientID = c.clientID)
    END

    -- Count of task men-hours (sum of all jobs'duration)
    else if (@typeID = 'TMH')
    BEGIN 
        delete from document_calcs where typeID=@typeID 
        insert into document_calcs
        select t.documentID as documentID, 'TMH' as typeID, (isnull(t.menHours, 0)) as val
        from tasks t;
    END

    -- Count of project men-hours (sum of all jobs' duration)
    else if (@typeID = 'PMH')
    BEGIN
        delete from document_calcs where typeID=@typeID
        delete from document_calcs where typeID='PMH_b'
        delete from document_calcs where typeID='PMH_nb'
        insert into document_calcs select documentID, 'PMH' as typeID, isnull(menHours,0) as val from projects
        insert into document_calcs select documentID, 'PMH_b' as typeID, isnull(billableMenHours,0) as val from projects
        insert into document_calcs select documentID, 'PMH_nb' as typeID, isnull(nonbillableMenHours,0) as val from projects
    END
    else if (@typeID = 'taskInProcess')
    BEGIN
        delete from document_calcs where typeID=@typeID
        insert into document_calcs select 1 as documentID, @typeID as typeID, count(*) as val from tasks
        inner join documents on tasks.documentid = documents.documentid
        inner join lookup_document_statuses lds on lds.statusID=documents.generalStatusID
        inner join document_tracks dt on dt.trackID=lds.trackID
        where dt.typeid='T' and dt.trackTypeID='GEN' and lds.statusname not in ('Cancelled','Completed','Fixed')
    END
    else if (@typeID = 'taskWillCompleted1')
        BEGIN
        delete from document_calcs where typeID=@typeID 
        insert into document_calcs
        select 1 as documentID, @typeID as typeID, count(*) as val
        from tasks
        inner join documents on tasks.documentid = documents.documentid
        inner join lookup_document_statuses lds on lds.statusID=documents.generalStatusID
        inner join document_tracks dt on dt.trackID=lds.trackID
        where dt.typeid = 'T' and dt.trackTypeID='GEN' and lds.statusname not in ('Cancelled','Completed','Fixed') and (finishDate is not null and [dbo].[DateOnly](finishDate) <= dateadd(day,1,datediff(day,0,getdate())))
    END
END