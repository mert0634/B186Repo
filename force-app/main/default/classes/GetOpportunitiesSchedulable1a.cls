public class GetOpportunitiesSchedulable1a implements Schedulable{
    
    
    public void execute(SchedulableContext context){
        
        //type query to call opportunitites whose close date is passed....
        //close data will be in the past, ana isclosed checkbox will be unchecked.
        
        
       List<Opportunity> oppList = [SELECT ID, Name, CloseDate, IsClosed, OwnerId FROM Opportunity WHERE IsClosed = false AND CloseDate < TODAY];
        TaskClass1a.createTaskForOpp(oppList);
        //we send opportunity records in a list to other class 
        //in other class task will be created...
        
    }

}

/* Execute etmek icin bu kodu kullaniyorum; ama Setup search_ apex classesdan dan da schedule yaratabiliyorum. ve onu SCHEDULED JOBS dan takip edebiliyorum.
 GetOpportunitiesSchedulable schOpp = new GetOpportunitiesSchedulable();
String cronExp = '0 0 8 ? * MON-FRI'; //8 AM on weekdays every month
System.schedule('Periodically Maintenance', cronExp, schOpp);
===============================
This is extra code:
GetOpportunitiesSchedulable schOpp = new GetOpportunitiesSchedulable();
String cronExp = '0 0 8 ? * MON-FRI'; //8 AM on weekdays every month
ID jobID = System.schedule('Periodically Maintenance', cronExp, schOpp);
CronTrigger CT = [SELECT Id, StartTime, State, CronExpression FROM CronTrigger WHERE Id=: jobID];
System.debug('Starting Time: ' + CT.StartTime + ' - ' + 'Status: ' + CT.State + ' - ' 
             + 'Cron Expression: ' + CT.CronExpression);
*/