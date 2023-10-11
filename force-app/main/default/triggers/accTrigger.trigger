//Example 4: Write a trigger class to check if there is a phone number entered when creating an account
// dont allow insertion if there is no phone number in account record... 
// Also do not allow a new account to be created with the same name of any existing account...
// Please write trigger, handler class and write a test class with minimum 80% code coverage...


trigger accTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    if(Trigger.isBefore){
        
        if(Trigger.isInsert){
            
            
            //create handler and use reference
            accTriggerHandler.beforeInsert(Trigger.new);
            
        }
       
        
        if(Trigger.isUpdate){
            
        }
    }
    
    if(Trigger.isAfter){
        
        if(Trigger.isInsert){}
        
        if(Trigger.isUpdate){
            
            
            
            accTriggerCasePriorityHandler.afterUpdate(Trigger.newMap, Trigger.oldMap);
            
            
            
        }
        
    }

}