trigger LeadTrigger13 on Lead (/*after insert, after update : those dont work!*/ before insert, before update) { //after dml operations: records are read only....
    //we removed "after insert and after update".... 
    //after a lead is inserted, go to the inserted lead record and change industry field as 'Banking'
    
    for(Lead w : Trigger.new){
        
        w.Industry = 'Banking'; //you cannot do another change in inserted and updated records in TRIGGER logic
                                //they are read only
         
    }
    //in after insert and update go out of the current object..
    //if you try to change any field in inserted and updated record in after trigger
    //you get => FinalException: Record is read only error.....
    
}