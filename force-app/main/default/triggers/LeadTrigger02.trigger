//3. Trigger

trigger LeadTrigger02 on Lead (before insert, before update) {
    
    //Example 3: When a new lead record is being created and update; 
    //and if industry field is blank, assign 'Education' to the industry field...
    
    
    for(Lead w : Trigger.new){
        
        if(String.isBlank(w.Industry)){
            
            w.Industry = 'Education';
        }
    }
    

}