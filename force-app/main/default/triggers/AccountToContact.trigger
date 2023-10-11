//Example 1: When an Account is inserted, insert a contact related to Account 
            
   trigger AccountToContact on Account (after insert) {
    
    //Example 1: When an Account is inserted, insert a contact related to Account 

    if(Trigger.isAfter && Trigger.isInsert){
        
        //if many account inserted, many contact will be inserted as well
        //so put the contact in a list
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : Trigger.new){
            
            Contact con = new Contact(LastName = acc.Name + ' Contact', AccountId =  acc.Id);
            conList.add(con);
            
        }        
        //now insert all the contacts together
        insert conList;
        System.debug(conList);
        
    }
    
}