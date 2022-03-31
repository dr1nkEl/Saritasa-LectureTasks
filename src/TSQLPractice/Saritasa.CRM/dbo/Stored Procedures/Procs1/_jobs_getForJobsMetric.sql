CREATE PROCEDURE [dbo].[_jobs_getForJobsMetric]
(
        @userID int   = null ,
        @clientID int   = null ,
        @onlyClose bit   = null ,
        @onlySumm bit   = null ,
        @from datetime   = null ,
        @to datetime   = null ,
        @onlyUserList bit   = null ,
        @onlyClientList bit   = null,
        @errorBy int = null,
        @roundMode bit = null,
        @utilizeProjectFilter int = 0,
        @paymentProjectFilter int = 0
)
AS
BEGIN        
        SET NOCOUNT ON;
		if(@roundMode is null) SET @roundMode = 0
        set @from = [dbo].[DateOnly](@from)
        set @to = [dbo].[DateOnly](dateadd(day,1,@to))
        if(@clientID is not null and @clientID <>0)
        begin
                create table #temp(id bigint) 
                create table #task(id bigint)
                insert into #temp  
                        select documentid from clients where clientID = @clientID
                insert into #temp
                        select documentid from projects where clientID = @clientID
                insert into #task 
                        select taskid from tasks where targetid in (select * from #temp)
                insert into #temp
                        select documentid from tasks where taskid in (select * from #task)
        end

        declare @sql nvarchar(4000)
        set @sql = N'SELECT *, doc.generalStatusID, accepted as acc, startedWork as start, finishedWork as finish, (CASE WHEN ta.durationLimit is NOT NULL AND  (ta.duration - ta.durationLimit) > 0 THEN (ta.duration - ta.durationLimit) ELSE NULL END) as overtime, main.isError, main.errorBy, (eu.FirstName +'' '' + eu.LastName) as errorByName, emp.photo  from _vJobsTarget as main
                 left outer join documents as doc on doc.documentid = targetid and targdoctypeid = ''T''
                 left outer join _vUsers as eu on eu.Id = main.errorBy
                 left outer join employees as emp on emp.Id = main.errorBy
                 left outer join _vucTaskAssignedListWidget as ta on ta.taskid = targetobjectid and targdoctypeid = ''T'' 
                 and ta.userid =  '+cast(@userID as varchar)+ ' '
        if(@onlySumm = 1)
                set @sql = N'select isnull(sum(case when main.billable=1 then (case when '+cast(@roundMode as varchar)+ '=1 then CAST((ceiling(CAST(duration AS DECIMAL(9,2)) / 30)*30) as int) else duration end) else 0 end), ''0'') as ''billable'',
                                isnull(sum(case when main.billable=0 then (case when '+cast(@roundMode as varchar)+ '=1 then CAST((ceiling(CAST(duration AS DECIMAL(9,2)) / 30)*30) as int) else duration end) else 0 end) , ''0'') as ''nobillable'',
                                isnull(sum((case when '+cast(@roundMode as varchar)+ '=1 then CAST((ceiling(CAST(duration AS DECIMAL(9,2)) / 30)*30) as int) else duration end)) , ''0'') as ''all'' from jobs as main'
            
        if(@onlyUserList = 1)
        begin
                set @sql = N'select distinct main.userID, fullName, SUM(ISNULL(duration,0)) duration
                                         from _vJobsTarget as main '
        end
        if(@onlyClientList = 1)
                set @sql = N'select distinct targetid from Jobs as main '
		if(@utilizeProjectFilter > 0 OR @paymentProjectFilter > 0)
			set @sql = @sql + ' left outer join projects as p on p.projectID=main.projectID '
		set @sql = @sql + ' where '
		if(@utilizeProjectFilter > 0)
		begin
			set @sql = @sql + ' (p.utilization='
			if(@utilizeProjectFilter=1)
				set @sql = @sql + '1) AND '
			else
				set @sql = @sql + '0) AND '
		end
		if(@paymentProjectFilter > 0)
			begin
			if(@paymentProjectFilter = 4)
				set @sql = @sql + ' (p.Overbudget = 1) AND '
			if(@paymentProjectFilter = 2)
				set @sql = @sql + ' (p.clientID in (2, 119, 9)) AND '
			else 
			begin
			set @sql = @sql + ' (p.clientID not in (2, 119, 9) AND '
			if(@paymentProjectFilter = 5)
				set @sql = @sql + ' main.billable=0) AND '
			else 
				if(@paymentProjectFilter = 3)
					set @sql = @sql + ' p.billingType=''I'') AND '
				else
				begin
					if(@paymentProjectFilter = 1)
						set @sql = @sql + 'p.billingType in (''F'', ''H'')) AND '	
					else
						set @sql = @sql + ' p.billingType = ''F'' AND main.billable=0) AND '
				end
			end
		end						
        if(@userID <> 0 and @userID is not null)
                set @sql = @sql+ '(main.createdBy = '+cast(@userID as varchar)+') AND '
        if(@clientID <> 0 and @clientID is not null)
		begin
			set @sql = @sql + '(main.targetid in (select * from #temp)) AND '
        end
        SET @sql = @sql + '((@eBy is Null AND (main.jobDate >= @start) and (main.jobDate < @fin) ) OR (@eBy is NOT Null AND main.errorBy=@eBy AND main.isError=1))'
        if(@onlySumm = 0 and @onlyUserList= 0 and @onlyClientList=0) SET @sql = @sql + '  order by main.projName, jobid desc'
        if(@onlyUserList=1) 
		begin	
			SET @sql=@sql + ' group by userID, fullName order by duration desc'
		end

        if(@onlyClientList = 1)
        begin
                create table #temp2(id bigint) 
                set @sql = 'insert into #temp2 '+  @sql 
                exec  sp_executesql  @sql, N'@start datetime, @fin datetime, @eBy int ', @start =@from, @fin=@to, @eBy=@errorBy
                print @sql
                if(@onlyClientList = 1)
                begin        	        
        	        create table #client(id bigint) 
        	        insert into #client  
        	                select clientid from clients where documentid in (select * from #temp2) 
        	        insert into #client  
        	             select objectID from documents where typeID = 'C' and documentid in 
        	                        (select targetID from tasks where documentid in (select * from #temp2))
        	        insert into #client  
        	                select clientid from projects where documentid in (select * from #temp2)  
        	        insert into #client  
        	                select clientid from projects where documentid in                               
        	                        (select targetID from tasks where documentid in (select * from #temp2))
        	                          

        	        select clientid, name from clients where clientid in (select * from #client)
                end
        end
        else    
        begin
 --               print @sql
                exec  sp_executesql  @sql, N'@start datetime, @fin datetime, @eBy int ', @start =@from, @fin=@to, @eBy=@errorBy
        end

        select TOP 1 * from documents;
END