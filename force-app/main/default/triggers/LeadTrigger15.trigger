//15. Trigger
trigger LeadTrigger15 on Lead (before insert, before update) {

    //Example 15: When a lead record is being inserted, and if leadsource is empty
    //assign 'Other'
    //if industry is empty, populate error message: You can not proceed with null industry!
    //----
    //When a lead record is being updated, and if lead source is empty, 
    //assign 'Web'
    //When a lead record is being updated, Lead Status should not be changed to "Closed" before contacting with the lead!
    //"Before changing the status closed, you should contact to the lead!" ( burasi tammen kafa karisitirici , handler classtaki aciklama yeterli olucaktir)  
    
    Switch on Trigger.OperationType{
        when BEFORE_INSERT{
           //logic 
           LeadTrigger15Handler.beforeInsertHandling(Trigger.new);
        }
        
        when BEFORE_UPDATE{
            
            //logic
            LeadTrigger15Handler.beforeUpdateHandling(Trigger.new, Trigger.oldMap);
        }
    }
    
}