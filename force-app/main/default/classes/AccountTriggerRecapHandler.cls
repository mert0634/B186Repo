public class AccountTriggerRecapHandler {
    //Use-case1: While the user creating an account,
    // if the user provides Billing Address but not Shipping Address,
    //  write a logic to copy the Billing Address to Shipping Address.
    public static void copyBillingAddressToShippingAddress(List<Account> accounts){
        for(Account acc : accounts){
            if(acc.BillingStreet !=null && acc.BillingCity !=null && acc.ShippingStreet == null && acc.ShippingCity == null){
                acc.ShippingStreet = acc.BillingStreet;
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingState = acc.BillingState;
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
    
    //Use-Case-2: While a user creating an account,
    // if the Annual Revenue is less then $100,000,
    //  then write a logic to throw an error.
    
    public static void validateAnnualRevenue(List<Account> accounts){
        for(Account acc : accounts){
            if(acc.AnnualRevenue < 100000){
                acc.AddError('Hello Friend, Sorry. You cannot create an Account with less than $100,000 in this org!');
            }
        }
    }
   
    
    //Use -Case 5 : NOTE: Use case 3 and 4 are HW.
    //Use-Case-5: While updating an account,
    // if user changes billing address,
    //  copy the address to the contact's mailing address.
    //  
    public static void updateContactMailingAddress(Map<Id, Account> newAccounts, Map<Id, Account> oldAccounts){
        // Grab the accounts that billing address has changed.
      	// ======1.yol======
      	
        Set<Id> accountIds = new Set<Id>(); //This is an empty set to store the account ids which their billing address has changed.
        for(Id key : newAccounts.keySet()){
            Account newAccount = newAccounts.get(key);
            Account oldAccount = oldAccounts.get(key);
            if(oldAccount.BillingStreet != newAccount.BillingStreet || oldAccount.BillingCity != newAccount.BillingCity || oldAccount.BillingState !=newAccount.BillingState){
                accountIds.add(key);
            }
        } 
          // =====2.yol======== 
            
      /* Set<Id> accountIds = new Set<Id>(); 
        
        for(Account newAccount : newAccounts.values()){
          
           Account oldAccount =  oldAccounts.get(newAccount.Id); 
           
			if(oldAccount.BillingStreet != newAccount.BillingStreet || oldAccount.BillingCity != newAccount.BillingCity || oldAccount.BillingState !=newAccount.BillingState){
               
				accountIds.add(newAccount.Id);
            } */
       
         
        
            
            
            
        //This below contacts are the contacts whose account billing address has changed.
        List<Contact> contacts = [SELECT Id, AccountId, MailingStreet, MailingCity, MailingState
                                 FROM Contact
                                 WHERE AccountId IN:accountIds];
        
       
        for(Contact con : contacts){
            Account acc = newAccounts.get(con.AccountId); //this line of code gives me the Account that this iterated contact associated with.
            con.MailingStreet = acc.BillingStreet;
            con.MailingCity = acc.BillingCity;
            con.MailingState = acc.BillingState;   
        }
        update contacts;
 
        
    }
     
  }




//Use Case-3: When a user creates an account, write a logic to create contact with the same name and associate the contact to the same account
//Use-Case-4: While updating an account, if user changes account name, throw an error saying "Attention!!! Account name once created cannot be modified!
//Use-Case-5: While updating an account, if user changes billing address, copy the address to the contact's mailing address.