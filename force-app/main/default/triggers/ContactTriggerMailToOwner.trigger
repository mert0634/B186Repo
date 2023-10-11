//TRIGGER
trigger ContactTriggerMailToOwner on Contact (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        
        ContactTriggerMailToOwnerHandler.sendEmailToContactOwner(Trigger.new);
        
    }
    
}