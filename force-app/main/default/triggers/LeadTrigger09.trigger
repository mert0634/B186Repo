trigger LeadTrigger09 on Lead (after undelete) {
    
    //Example 10: When a lead record is restored from recycle bin, 
    //print a message on the console 'Record is restored!'
    

    if(Trigger.isAfter && Trigger.isUndelete){
        
        for(Lead w : Trigger.new){
            
            System.debug('The record is restored. Lead Name : ' + w.FirstName + ' ' + w.LastName);
        }
        
    }
}