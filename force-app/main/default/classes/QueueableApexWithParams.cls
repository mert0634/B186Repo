public class QueueableApexWithParams implements Queueable { // Bu ornegi anlamak icin Salesforce dosyasinin icindeki foto ya bakabilirsin. This is primary class
    //USING PARAMETER IN QUEUEABLE
//Example 2: Enter an account list to the parameter of method as an argument
//and update number_of_contacs field of accounts
//use queueable classss
    public List<Account> listOfAcc;// 6.7.9 line daki kodu fotoya bakarak daha iyi anlayabilirsin.
    public QueueableApexWithParams(List<Account> accToUpdate){
        
      this.listOfAcc = accToUpdate; // this butun QueueableApexWithParams classi demektir.
    }
    
    // bu line dan sonrasi hep eski seyler
    public void execute(QueueableContext context){
        
        for(Account acc : listOfAcc){
            
            if(acc.Contacts != null){
                
                acc.Number_Of_Contacts__c = acc.Contacts.size();
                
            }
            
        }
        update listOfAcc;
       
        for(Account a : listOfAcc){
            System.debug(a + ' and ' + a.Number_Of_Contacts__c); //updated accounts
        }
        
        // Primary class bura oldugu icin; bi sonraki olusturdugumuz ChainedQueueableContact classi burda chain yapiyoruz.
        //chain another class into this class
        //when this primary class is executed, following chained will be in queue as well        
        ChainedQueueableContact chainedQue = new ChainedQueueableContact();
        System.enqueueJob(chainedQue);
        // ChainedQueueableContact bu classi burda chain yaptik.
        
        
        
        
    }
    
}
//in queueable class; to be able to get data from outside as an argument in parameter:
// 1) We create a method different from execute method with same name of the class
// 2) SO class constructor and method constructor become same.
// 3) in outside of the class data can be sent in that method's parameter
// 4) but the data coming in this method is not accesible by execute method
// 5) because of that; we assign the data to another container global for whole class
// 6) finally we can work with data coming outside of the class by method parameter


//============================
//List<Account> accList = [SELECT Id, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account];
//QueueableApexWithParams queWithParams = new QueueableApexWithParams(accList);
//System.enqueueJob(queWithParams);