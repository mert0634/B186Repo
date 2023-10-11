trigger LeadTrigger11 on Lead (before insert, after insert) { // Bu ornek LeadTrigger12`nin if`li halidir
    
    //Example 12: When a lead record is being created;
    //if leadsource is empty; assign 'Other',
    
    //and create a task for lead record after lead is created
    //finally you can call created task and leads on anonymous window
    
    if(Trigger.isBefore && Trigger.isInsert){
        
        for(Lead w : Trigger.new){
            
            if(String.isBlank(w.LeadSource)){
                w.LeadSource = 'Other';
                System.debug('Trigger Operation Type: ' + Trigger.operationType);
            }
        }
        
        
    }
    
    
    
    if(Trigger.isAfter && Trigger.isInsert){
        
        List<Task> taskList = new List<Task>();
        
        
        for(Lead w : Trigger.new){
            
             Task taskObj = new Task();
            taskObj.Subject = 'New Lead Record is Created! Check it out!';
            taskObj.WhoId =w.Id; //we connected newly created lead and task with ID's
            
            taskList.add(taskObj);
            
        }
        
      insert taskList;
    }
}