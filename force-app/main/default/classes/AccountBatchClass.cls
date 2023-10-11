public class AccountBatchClass implements Database.Batchable <sObject>, Database.Stateful {
            // Database.Stateful is used to follow number of records issued in class
    		//stateful sayesinde her bathcteki record sayisini tuttuk cumulative olarak; o yuzden line 6 daki Integeri ekledik.
    //EXAMPLE1: We need to display number of contacts in an account's custom field
    //All the records will be updated to display up-to-date value in "Number Of Contacs" custom field
    public Integer numOfAccountsForUpdate = 0; //counter will be increasing for each acc record by one
    
    
    //start method
    public Database.QueryLocator start(Database.BatchableContext batcon){ // Database.BatchableContext => we use this structure in method level; batcon=> herhangi bir isim verebiliriz.
        
        return Database.getQueryLocator('SELECT Id, Name, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account');
                    
    }
    
    
    //execute method
    public void execute(Database.BatchableContext batcon, List<Account> accList){ //to get query result from start method we need parameter as list
        																		// line 12 de query den alinan recordlar accList icine konuluyor default olarak.accList yerine baska isimde verebiliriz.
        for(Account acc : accList){
            
            if(acc.Contacts != null){ //acc.Contacts.size() != 0 // eger Account recordda bulunan Contacts bos degilse demektir bu line.
                
                
                acc.Number_Of_Contacts__c = acc.Contacts.size(); // Account objesinde kac tane contact bulunuyorsa ; bu bulunan adedi ; Account objesinde olusturdugumuz Number Of Contacts`a assign et demektir bu line.
                
                System.debug('Updated Account`s name!: ' +acc.Name);
                numOfAccountsForUpdate++;
            }
            
        }
    
        update accList;
        System.debug('total numbe of updated accounts: ' + numOfAccountsForUpdate); 
    
    }
    
    
    //finish method
    public void finish(Database.BatchableContext batcon){
        
        System.debug('Records are updated!');
        
    AsyncApexJob myUpdateJob  =  [SELECT Id, Status, NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE ID =: batcon.getJobId()];
        System.debug(myUpdateJob);
        
    }
}
// "start" method is authomatically connected with "execute" method 
// data sent from start is taken into execute by method parameter; that is why we create List in execute method parenthesis.

/*
  

AccountBatchClass abc = new AccountBatchClass(); //200 recs per batch => default
Database.executeBatch(abc);

AccountBatchClass abc = new AccountBatchClass(); 
Database.executeBatch(abc,5); //5 recs per batch => 17 batch created, I have 85 accounts to update

*/