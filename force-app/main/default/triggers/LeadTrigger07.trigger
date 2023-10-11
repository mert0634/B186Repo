trigger LeadTrigger07 on Lead (before update) {
    
    //Example 8: Go to the lead record, when name is being updated
    //print new lastname and old lastname of the lead record on the console...

    if(Trigger.isBefore && Trigger.isUpdate){
        
        for(Lead w : Trigger.new){
            
            System.debug('New Lastname of the Lead: ' + w.LastName);
            System.debug('Old Lastname of the Lead: ' + Trigger.oldMap.get(w.Id).LastName);
            
        }
        
    }
    
}

//for old name: you can use oldMap...
//NOTE: If you want to access a specific field valur of old version; you need to use id of the record...
//by using ID, you can access old version of the fields in oldMap....