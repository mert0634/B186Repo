//2. Trigger
trigger LeadTrigger01 on Lead (before insert) {
    
    //Example 2: When a user is creating a lead record, check lead source
    //if it is blank, assign value of "Other" to the lead source...
    

    for(Lead w : Trigger.new){
        
        if(String.isBlank(w.LeadSource)){
            
            w.LeadSource = 'Other';
            
        }
        
    }
}