public class AccountBatchIterable implements Database.Batchable <Account>{ // 1. ornekten farkli olarak Database.Batchable <Account> yazdik. Burada Accountin icine baska sObjectlerde yazilabilirdi. Ama 1. ornekte sadece <sObject> kullandik, yani buradaki gibi farkli turde sObjectler yazamiyoruz.
    
    //EXAMPLE 2: Use Batch Iterable and create 50 records in database
    // 
    public Iterable<Account> start(Database.BatchableContext bc){
        
        List<Account> accList = new List<Account>();
       for(Integer i=1; i<51; i++){
            
            Account acc = new Account(Name = 'Iterable Test V2 Acc ' + i);
            
            accList.add(acc);           
        }       
        
        return accList; //give to execute method
        
    }
    //---------------------------------------------------------------------
    //execute
    public void execute(Database.BatchableContext bc, List<Account> accList){ // burdaki accList i daha iyi anlasilsin diye yazdik. 15.line daki accList ile ayni olmasina gerek yok.      
        
        insert accList; 
        
    }
    
    //finish ---------------------------------------------------------------
    //when apex comes to finish method method, it means execution of job is done. and we can check the job details from database by query. 
    public void finish(Database.BatchableContext bc){
        
        System.debug('Records are created by Iterable!');
        
    AsyncApexJob myJob  =  [SELECT Id, Status, NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE ID =: bc.getJobId()];
        System.debug(myJob);
        
    }
    
}

//===================================================
/*
 AccountBatchIterable abi = new AccountBatchIterable();
Database.executeBatch(abi);
*/