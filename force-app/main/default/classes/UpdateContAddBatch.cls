public class UpdateContAddBatch implements Database.Batchable <sObject>{
    // Example 4: If an account's Billing Country is USA, 
    // Billing City and Billing State should be assigned Mailing City and Mailing State of child Contact
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        String query = 'SELECT Id, BillingCity, BillingState, (SELECT Id, MailingCity, MailingState FROM Contacts)' + 
            ' FROM Account WHERE BillingCountry = \'USA\' ';// BillingCountry = \'USA\' demek BillingCountry fieldda USA yazan recordlar demektir.
        
       return Database.getQueryLocator(query);
        
    }
    
    
    public void execute(Database.BatchableContext BC, List<Account> accList){
        
        List<Contact> conList = new List<Contact>(); //put contacts into another new list and contacts only
        
        for(Account acc : accList){
            for(Contact con : acc.Contacts){ //reach out child contacts of account
                
              con.MailingCity = acc.BillingCity;
              con.MailingState = acc.BillingState; 
                
                conList.add(con);                
            }
            
        }
    update conList;
        
        
    
    }
    
    public void finish(Database.BatchableContext BC){
        System.debug('Contacts in he Accounts are updated!');
        
        AsyncApexJob myJob = [SELECT Id, Status, NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE ID =: BC.getJobId()];
        System.debug(myJob);
        
    }
    
}
//===========================
//UpdateContAddBatch uptAdd = new UpdateContAddBatch();
//Database.executeBatch(uptAdd);