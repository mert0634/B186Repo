//Trigger
trigger ContactTriggerMail on Contact (after insert) {

    
    //Example 18: Send an email notification to the contact when its data saved into Salesforce system

    if(Trigger.isAfter && Trigger.isInsert){
        
        ContactTriggerMailHandler.sendEmailNotification(Trigger.new);
        
    }
}