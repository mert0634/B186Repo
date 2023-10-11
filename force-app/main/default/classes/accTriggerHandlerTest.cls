@isTest
public class accTriggerHandlerTest {
    
    
    @isTest
    public static void beforeInsertPhoneTest(){
        
      Account acc = new Account();
        acc.Name = 'Pepsi Cola Inc.';
        acc.Industry = 'Banking';
        acc.AnnualRevenue = 35000000;
        
        Test.startTest();
        try{
            
            insert acc;
        }catch(exception e){
            
            System.assert(e.getMessage().contains('Phone must not be blank!')); // Record level error message
            System.debug(e.getMessage());
            //assertion need record level error message instead of field level when you use both. 
            //Eger birden fazla error mesaji var ise bu sekilde, apex test class`i record level error mesajini okur.
        }
        Test.stopTest();
        
        
    }
     
     @isTest
    public static void accountNameValidationTest(){
        
        Account acc = new Account();
        acc.Name = 'Apex Textile X';
        acc.Phone = '+1987456221';
         insert acc; //account is inserted with a name. then try to use same name below
        
        
        Account a = new Account();
        
        a.Name = 'Apex Textile X';
        a.Phone = '+1900006221';
        
       Test.startTest(); 
        try{
            
            insert a;
        
        }catch(Exception e){
            
            
            System.assert(e.getMessage().contains('There is an account using this name already, name!'), 
                          'Check your assertion part or validation message');
        }
        System.debug(acc);
        System.debug(a);
		Test.stopTest();        
    }
    
    
    
    
    
}

//summary of trigger scenario :
//1) dont allow inserting of account without phone : to test my scenario I will try to create an account without phone; 
//		I will expect error message that will be populated by trigger

//2) dont allow duplicate account name: to test insert an account first. then try to insert another one with same name
//		I will expect to catch error message that will be populated by trigger
//		
//	for validations, we use try catch in testing to catch error from trigger...