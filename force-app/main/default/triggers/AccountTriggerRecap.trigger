trigger AccountTriggerRecap on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
       //No Code is allowed in here!!!!!!!
       //You will call your business logic class and methods here
       
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerRecapHandler.copyBillingAddressToShippingAddress(Trigger.new);
            AccountTriggerRecapHandler.validateAnnualRevenue(Trigger.new);
        }
        if(Trigger.isUpdate){
            AccountTriggerRecapHandler.copyBillingAddressToShippingAddress(Trigger.new);
             AccountTriggerRecapHandler.validateAnnualRevenue(Trigger.new);
        }
        if(Trigger.isDelete){
            
        }
        
    }
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            
        }
        if(Trigger.isUpdate){
            AccountTriggerRecapHandler.updateContactMailingAddress(Trigger.newMap, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            
        }
        if(Trigger.isUndelete){
            
        }
        
    }
	
}