public class SupportPlanUpdateScheduler implements Schedulable{ // Burada batch classi schedulara ceviren methodu yazdik, daaha sonra orgdan serch setup app class dan bu batci schedule ettik. 

    
    public void execute(SchedulableContext SC){
        
        SupportPlanBatchUpdate batch = new SupportPlanBatchUpdate();
        Database.executeBatch(batch, 50); //one batch size is 50 
    }
}