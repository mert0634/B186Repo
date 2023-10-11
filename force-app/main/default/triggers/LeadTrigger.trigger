trigger LeadTrigger on Lead (before insert) {
    
    //Example1: When a user creates a record,
    //before creating the record; lead rating should be assigned 'cold'

    //new records in Trigger.new: Triggers work with collections so starts with loop
    System.debug('Hello Trigger, here we are!');
    
    for(Lead w : Trigger.new){
        
        w.Rating= 'Cold';
        
    }
    
    
}