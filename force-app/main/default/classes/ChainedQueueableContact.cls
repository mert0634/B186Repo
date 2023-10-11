public class ChainedQueueableContact implements Queueable{ // this is secondry class
    //Create 20 contact records in this class
    public void execute(QueueableContext context){
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=1; i<21; i++){
            Contact con = new Contact();
            
            con.LastName = 'Chained Queueable x' + i;
            con.FirstName = 'Session ' + i;
            
            conList.add(con);
            
        }
        insert conList;
        
        System.debug('Number of Inserted Contacts : ' + conList.size());
        for(Contact c : conList){
            
            System.debug('Inserted Contact: ' + c);
        }
        
    }
    
    
}

//================================
//List<Account> accList = [SELECT Id, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account];
//QueueableApexWithParams queWithParams = new QueueableApexWithParams(accList);
//System.enqueueJob(queWithParams);