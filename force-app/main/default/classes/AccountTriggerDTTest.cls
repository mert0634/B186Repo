@isTest
private class AccountTriggerDTTest {
    
    @isTest
    static void test1(){
        Account acc = new Account(Name='TechProEd');
        
        try{
            insert acc;
        }catch(Exception e){
            
            System.assert(e.getMessage().contains('TechProEd can not be used in Account Name'));
            //if the message in validation and coming from exception equals each other, method will give me true;
            //and test will be susccessful
        }
        
         }
      @isTest
        static void test2(){
            Account acc = new Account(Name='Salesforce Apex Test');
            Database.insert(acc, false); //account is inserted with a different name from "TechProEd"
            
         acc =  [SELECT Industry FROM Account WHERE ID =: acc.Id];
            System.assertEquals('Agriculture', acc.Industry);
        }
        
}