//------------------------------------------------TEST CLASS----------------------

@isTest
public class AccountProcessorTest {
    
    @testSetup // setup kismi optional, logic daha iyi anlasilsin diye yazdik.
    public static void setup(){
        
  //insert a couple of accounts      
   List<Account> accList = new List<Account>();
    
    for(Integer i=1; i<11; i++){
        Account acc = new Account();
        acc.Name = 'Test Account - ' + i;
        acc.Phone = '43346545';
        acc.AnnualRevenue = 6565555;
        
        accList.add(acc);
        
    		}
    insert accList;  //accounts are inserted  
    System.debug(accList);    
        
  
        
       									// Bu kisim COK ONEMLI : Accountin icinde child contact insert ediyoruz.
                                        //insert child contacts for accounts
                                        List<Contact> conList = new List<Contact>();
                                        
                                        for(Account acc : accList){ //iterate newly inserted accounts to assign child contacts 
                                            for(Integer i=1; i<4; i++){
                                                Contact con = new Contact();
                                                con.FirstName = 'FirstName ' + i;
                                                con.LastName = 'LastName ' + i;
                                                con.AccountId = acc.Id;
                                                  conList.add(con);
                                                    } //for each account; 3 child contacts will be inserted...
                                            
                                        }
                                        insert conList;
                                        System.debug(conList);
    
    
    	}
    
    
    
    //SETUP IS DONE ABOVE AND CONTINUE WITH TESTING
    @isTest // ana classta asagidaki kodun mantigini acikladim, oradan bakabilirisin.
    public static void countContactsTest(){
        
        List<Account> accList = [SELECT Id FROM Account]; //call inserted account records in setup from database
        
        List<Id> accIds = new List<ID>(); //collect Ids of accounts
        
        for(Account acc : accList){
            
            accIds.add(acc.Id);
            
        }
        
        //testing methods should be done between startTest and stopTest Method for having fresh governor limits...
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        
        
        //ASSERTION => Burasi setup da yazan kodu test ediyor.Yazilmasi gerekiyor.
        List<Account> insertedAccounts = [SELECT Id, Number_Of_Contacts__c FROM Account];
        
        System.assertEquals(10, insertedAccounts.size());
       
        System.assertEquals(3, insertedAccounts[4].Number_Of_Contacts__c);
    }
    

}