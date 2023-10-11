public class LeadTrigger14Handler {
    
    public static void afterInsertAndUpdateTrigger(List<Lead> myLeads){ // LeadTrigger14 deki line 9 ile baglantilidir bu line. yani aslinda Trigger.new demektir.
        
        List<Task> myTasks = new List<Task>();
        
        for(Lead w : myLeads){
            
            if(w.Industry == 'Education'){
                
                Task tObj = new Task();
                tObj.Subject = 'The task is created after for the lead record!';
                tObj.WhoId = w.Id;     /* Lead recordun id sini al task`in icine koy demektir bu line , ustelik Lead ve Task arasinda lookup vardir*/
                						// ayni zamanda da lead i al taskin icine koy; look up oldugundan dolayi lead dede task gozukecektir.
                myTasks.add(tObj);
            }            
            
            insert myTasks;
        }
        
        
    }

}