//5. Trigger

trigger LeadTrigger04 on Lead (before insert, before update) {
    
    //Example 5: When a lead record is about to be created or updated
    //and if industry is empty, populate an error message
    //Message: Industry can not be empty!
    
    for(Lead leadRec : Trigger.new){
        
        if(String.isBlank(leadRec.Industry)){
            
            leadRec.Industry.addError('Industry field can not be empty!');
        }
        
        
    }

}
//Note: addError() is used to populate error message when we do an operation on UI part....