trigger LeadTrigger08 on Lead (before delete) {
    
    //Example 9: When a lead record is being deleted, 
    //use company name to print "The record is deleted with company name:...."
    

    if(Trigger.isBefore && Trigger.isDelete){
        
        for(Lead w : Trigger.old){
            System.debug('The record with ' + w.Company + ' name of the company is deleted!');
        }
    }
}