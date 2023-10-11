//--------------TEST CLASS-------------------------------

@isTest

public class accTriggerCasePriorityHandlerTest {
    
    @testSetup 
    public static void testSetup(){
      List<Id> accIds = new List<Id>();
        
    List<Account> accounts  = TestSuite.createAccounts(3); //will return framwork of account creation
    insert accounts;   // 3 accounts
        System.assertEquals(3, [SELECT count() FROM Account]); //check inserted account number    
        
        for(Account acc : accounts){
            
            accIds.add(acc.Id); //put Id of inserted accounts to create child cases related with them....
            System.assertEquals('Cold', acc.Rating);
        }
        
        //Now I would like to pass those account Ids to my TestSuite class method to get Case framework 
        
        List<Case> cases = TestSuite.createCases(4, accIds);
        insert cases;
        System.assertEquals(12, [SELECT count() FROM Case]);
		        
    } // Buraya kadar yazdigimiz TestSuit classini (test environment) test ettik diyebiliriz.
    
    
    
    
    //=====================================================================
    
    
    
    
    //when we change Rating to Hot => Asil gercek test burdan sonra bas asliyor.
    @isTest
    public static void testAccountRatingHot(){
        
      List<Account> accounts = [SELECT Id, Rating FROM Account];
        for(Account acc : accounts){
            acc.Rating = 'Hot';
            
        }
        
        Test.startTest();
        update accounts; //when update the account rating, I expect Trigger will be fired.
        Test.stopTest();
        
       List<Case> cases = [SELECT Id, Priority, Account.Rating FROM Case];
        for(Case cs : cases){
            
            System.assertEquals('High', cs.Priority);
            System.assertEquals('Hot', cs.Account.Rating);
            System.debug(cs.Priority + ' - ' + cs.Account.Rating);
            
        }
        
    }
    
    
    //When we change Rating to Warm
    @isTest
    public static void testAccountRatingWarm(){
      
        List<Account> accounts = [SELECT Id, Rating FROM Account]; //3 acc
        
        for(Account acc : accounts){
            
            acc.Rating = 'Warm';
            
        }
        
        Test.startTest();
        update accounts;
        Test.stopTest();
                
        
       List<Case> cases= [SELECT Id, Priority, Account.Rating FROM Case];
        
        for(Case cs : cases){
            Assert.areEqual('Medium', cs.Priority);
            Assert.areEqual('Warm', cs.Account.Rating);
            System.debug(cs.Priority + ' - ' + cs.Account.Rating);
            
        }
        
        
    }
    
    
    //When we change Rating to Cold
     @isTest
    public static void testAccountRatingCold(){
      
        List<Account> accounts = [SELECT Id, Rating FROM Account]; //3 acc
        
        for(Account acc : accounts){
            
            acc.Rating = 'Cold';
            
        }
        
        Test.startTest();
        update accounts;
        Test.stopTest();
                
        
       List<Case> cases= [SELECT Id, Priority, Account.Rating FROM Case];
        
        for(Case cs : cases){
            Assert.areEqual('Low', cs.Priority);
            Assert.areEqual('Cold', cs.Account.Rating);
            System.debug(cs.Priority + ' - ' + cs.Account.Rating);
            
        }
        
        
    }


}

//in setup what do I need? 
// 1) I need account records ✅
// 2) I need Case records in the account records ✅
// 3) Update Rating field
// 4) Expect priority of case will be update by trigger