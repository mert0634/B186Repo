public class QueueableApexClass implements Queueable { // Batch apexdeki sytaxdan farklidir bu  ilk line dikkat. Ve sadece execute method kullaniyoruz burada, finish ve start methodu kullanmiyoruz. Queueable syntax disindak hersey eski konulardan. Hersey anlasildi ve kolaydi.
    
        //Example: Create 100 Account records in database    
    
    public void execute(QueueableContext context){
        //there is only execute method... and type awesome code here...
        List<Account> accList = new List<Account>();
        
        for(Integer i=300; i<401 ; i++){
            
            Account acc = new Account(Name = 'Queueable Apex '+i);
            accList.add(acc);
        }
        insert accList;
        
        for(Account ac : accList){
            System.debug(ac); //display on the console after records are inserted..
        }
    }
}


/*
Bu kisim extra, istersek jobID yi bu sekilde yazdirabiliriz.
ID jobID = System.enqueueJob(queApex);
//execution above is returning ID and we store in ID data type.
System.debug(jobID); 707Hn0000Cbq9sK
*/




// ========================
// Execute icin asagidaki 2 satirlik kodu kullaniyoruz. Eger istersek hemen yukardaki kisa kodu ekstra olarak yazabiliriz eger jobID okumak istiyorsak.
// QueueableApexClass queApex = new QueueableApexClass();
//System.enqueueJob(queApex);