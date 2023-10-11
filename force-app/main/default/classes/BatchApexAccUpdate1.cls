// batch classi nasil schedule ederiz:
public class BatchApexAccUpdate1 implements Database.Batchable <sObject>, Schedulable {
    
//Example 3: With Batch class update newly inserted 270 records in account object
//          make Active field 'Yes' and put a description....
//QueryLocator
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        String query = 'SELECT Id, Name, Active__c, Description FROM Account WHERE Name LIKE \'Iterable%\'';
        
        return Database.getQueryLocator(query);
    }
        
    public void execute(Database.BatchableContext BC, List<Account> accToUpdate){
        
        for(Account acc : accToUpdate){ //approximately it has 270 records in the list
            
            acc.Active__c = 'YES';
            acc.Description = 'Account has updated';
            System.debug(acc);
        }
        update accToUpdate;
    } 
    
    public void finish(Database.BatchableContext BC){
        
        System.debug('Account records are updated!');
        
    }
    
    // batch classi schedule yapmak icin alttaki 3 satiri yazdik ve 2.line daki koda Schedulable kelimesini ekledik.
    public void execute(SchedulableContext sc){
        BatchApexAccUpdate1 baup = new BatchApexAccUpdate1();
        Database.executeBatch(baup);
        
    }
}


//HOW TO IMPLEMENT SCHEDULABLE IN BATCH CLASS
//BatchApexAccUpdate bApex = new BatchApexAccUpdate();
//System.scheduleBatch(bApex, 'Batch Field Update', 120); //120 minutes later will run

//String cronExp = '0 0 10 * * ?';
//System.schedule('Schedule Batch Update', cronExp, bApex); //scheduled my batch class 

//Not: we can schedule Batch clas with two methods: 
// 1) System.schedule() 2) System.scheduleBatch
//second method accept only integer minutes in cron ecpression: it is delay time from now on.
















//===================================

/*
public class BatchApexAccUpdate implements Database.Batchable <sObject> {
    
//Example 3: With Batch class update newly inserted 270 records in account object
//			make Active field 'Yes' and put a description....
//QueryLocator

    public Database.QueryLocator start(Database.BatchableContext BC){
        
        String query = 'SELECT Id, Name, Active__c, Description FROM Account WHERE Name LIKE \'Iterable%\''; // \'Iterable%\' demek icinde Iterable ile baslayan recordlardemektir.
        // string olan query  sonraki satirda execute edince list olarak return oluyor zaten; query list de olur string de;onemli olan nasil dondugu
        return Database.getQueryLocator(query);
    }
    	
    public void execute(Database.BatchableContext BC, List<Account> accToUpdate){
        
        for(Account acc : accToUpdate){ //approximately it has 270 records in the list
            
            acc.Active__c = 'YES';
            acc.Description = 'Account has updated';
            System.debug(acc);
        }
        update accToUpdate;
    } 

    
    public void finish(Database.BatchableContext BC){
        
        System.debug('Account records are updated!');
        
    }
}
*/