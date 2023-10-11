trigger LeadTrigger10 on Lead (after update, after insert) {

    //Example 11: When a lead record is updated, 
    //create an account record by using company name of the lead
    //
    //when a lead record is inserted 
    //create an account record by using lead name an rating fields...
    
    if(Trigger.isAfter){
        
        //after update
        if(Trigger.isUpdate){
           
                        List<Account> accList = new List<Account>();//insert account records in list (bulkify)
                        
                        //we will iterate newly updated lead records...
                        for(Lead w : Trigger.new){
                            //for each lead record trigger will create account record by using company name of lead..
                            Account acc = new Account();
                            acc.Name = w.Company; //assign company name of lead to name of account 
                            accList.add(acc);
                        }
                        insert accList; //use dml out of the loop....
        }
        
        
        
        
        
        
        //after insert
        if(Trigger.isInsert){
             
            List<Account> accList = new List<Account>(); 
            
            //we will iterate newly created lead records...
            for(Lead w: Trigger.new){
                
                Account myAcc = new Account();
                myAcc.Name = w.LastName;
                myAcc.Rating = w.Rating; 
                accList.add(myAcc); //add account objects into the list above to insert at once
            }
            
            insert accList; 
            
        }
        
    }

}