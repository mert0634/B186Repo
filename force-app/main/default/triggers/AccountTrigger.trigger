trigger AccountTrigger on Account (after update, before delete) {
    
    //Example 17: When city field of account is updated,
    //update the city field of child contact with same value of parent's
    //
    //If there is any child Contact in Account record, 
    //and if user tries to delete the account record,
    //populate an error message on the account....
    
    if(Trigger.isAfter && Trigger.isUpdate){
        
        AccountTriggerHandler.assignCityFromAccToContact(Trigger.new, Trigger.oldMap);
    }

    
    
    if(Trigger.isBefore && Trigger.isDelete){
        
        AccountTriggerHandler.beforeDeleteAccMessagePopulate(Trigger.old, Trigger.oldMap);
    }
}