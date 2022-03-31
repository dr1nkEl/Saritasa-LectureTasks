CREATE function [dbo].[getLocalUserTime](@userID int, @time  datetimeoffset(0))
RETURNS datetimeoffset(0)
AS BEGIN
 declare @userLocalTimeZone int;
 declare @summerOrWinterTime bit;
 declare @branchSaveLightOrNo bit;
 if (@time is null) 
    set @time = SYSDATETIMEOFFSET();
 set @userLocalTimeZone=(select users.timeZone from users where users.Id=@userId)
 if @userLocalTimeZone is null
 begin
   declare @branId int;
   set @branId=(select employees.branchID from employees where employees.Id=@userID)
   set @userLocalTimeZone =(select lb.[TimeZone] from [LookupBranch] lb  inner join 
              (select employees.branchID from employees
               where employees.Id=@userID) em on em.branchID=lb.[Id] )
 end
 set @summerOrWinterTime=dbo.DayLightSave(@time);  
 if(@summerOrWinterTime=1)
 begin
     set @branchSaveLightOrNo=(SELECT DayLightSaving  FROM  employees INNER JOIN 
                               [LookupBranch] ON employees.branchID = [LookupBranch].[Id] where employees.Id = @userId)
     if(@branchSaveLightOrNo=1) 
     begin 
  set @userLocalTimeZone=@userLocalTimeZone+1;  
     end
 end
 return SWITCHOFFSET(@time, dbo.getOffsetTimeZoneString(@userLocalTimeZone))
END