trigger LeadTrigger12 on Lead (before insert, after insert) {
    
    //Example 12: When a lead record is being created;
    //if leadsource is empty; assign 'Other',
    
    //and create a task for lead record after lead is created
    //finally you can call created task and leads on anonymous window
    
    switch on Trigger.operationType{
        
        when BEFORE_INSERT{
            
                for(Lead w : Trigger.new){
            
                    if(String.isBlank(w.LeadSource)){
                        w.LeadSource = 'Other';
                        System.debug('Trigger Operation Type: ' + Trigger.operationType);
                    }
                }
            
            
        }
        
        
        WHEN AFTER_INSERT{
            
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
}