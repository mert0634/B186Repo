//EXAMPLE 19:
// EMAIL SEND WITH TEMPLATE

trigger EmailSendTriggerWithTemplate on Contact (after insert) {

     if(Trigger.isAfter && Trigger.isInsert){
        
        EmailSendTriggerWithTemplateHandler.emailSendWithTemplate(trigger.new);
        
    }
    
}