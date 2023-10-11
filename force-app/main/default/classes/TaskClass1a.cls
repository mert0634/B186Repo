public class TaskClass1a {
    
    //Example 1: Query the opportunities of which close date is passed and is closed checkbox is unchecked...
    //assign a Task to the Opp Owner that is stating "Update the opportunitites bcs close date is passed!"
    //and this class must work on weekdays 8 AM...
    

    public static void createTaskForOpp(List<Opportunity> oppList){ // oppList GetOpportunitiesSchedulable1 classindan geliyor.
        
        List<Task> taskList = new List<Task>();
        
        for(Opportunity opp : oppList){
            
            Task newTask = new Task();
            
  			newTask.Subject = opp.Name + ': Close Date of this opportunity needs to be checked!';
            newTask.WhatId = opp.Id;
            newTask.OwnerId = opp.OwnerId;
            taskList.add(newTask);
        }        
        
        if(taskList.size()>0){
         insert taskList;   
        }
        
    }
    
}