public class AccountTriggerHandler {
    
    
    public static void assignCityFromAccToContact(List<Account> accList, Map<Id, Account> oldAccMap){
        
        //I will collect Id of the accounts of that city field is updated 
        //And by using account ID's I will call child record of accounts from database...
        //Finally, I will assign new value of city field in account to the city field of child contact
        
        Set<ID> accIds = new Set<ID>(); //store the Ids of accounts to call child contacts later... ( bos bir set olusturdum. account Id lerini depoluyorum; child contactlari daha sonra cagirmak icin)
        
        for(Account acc : accList){
            if(acc.BillingCity != oldAccMap.get(acc.Id).BillingCity){//if old and new billing city is different form each other, it is really updated.. ( Bu kiyaslamayi yapabilmek icin Trigger.new, Trigger.oldMap kullandik)
                
               accIds.add(acc.Id); //put acc ids into set to use later caling child contacts... 
            }
            
        }
            //call the child contact records whose parent fires the trigger
        if(accIds.size()>0)  {
            
                       List<Contact> contList = [SELECT Id, MailingCity, Account.BillingCity FROM Contact WHERE AccountId IN:accIds];
                        
                        for(Contact con : contList){
                            
                            con.MailingCity = con.Account.BillingCity; // account objesindeki billing city fieldda bulunan city i contact objesinin malingcity adli fieldina assign ediyorum.
                        
                            }        
                        
                            update contList; //update contact records after asssigning billingcity of parent into mailingcity of contact 
            
                    }
                }
    
    
    
    public static void beforeDeleteAccMessagePopulate(List<Account> oldAccList, Map<Id, Account> oldAccMap){
        //to keep account ids we have set, and we will call child contacts of those accounts
        Set<Id> accountIds = new Set<Id>();
        
        for(Account acc : oldAccList){
            
            accountIds.add(acc.Id);//get id of accounts that you try to delete on the UI part
            
        }
        
        
        
        if(accountIds.size()>0){
              
            List<Contact> contactList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN: accountIds];
                
             if(contactList.size()>0){ //if there is child of contacts in query, iterate them
                         
                for(Contact con : contactList){
                    
                    Account acc = new Account();//we created an empty account instance
                    
                    acc = oldAccMap.get(con.AccountId);//we assigned parent account of contact into empty object
                    							// contactList de bulunan Accountlari alip; bos bir account objesine assign yapiyorum.
                    acc.addError('If there is any child Contact, you can not delete the Account record!'); //populate the message in parent...
        
                    //here we created empty account instance bcs we will populate error message on account level to prevent delete operation
                    //and by using accountId of iterated contact records in loop, we reached out to parent of the contact
                    //and we loaded parent of the contact into empty account instance
                    //finally we can populate message parent of contact...
                    
                }
                
            }
       
            
        }
     
        
    }
}