//HANDLER CLASS------------------------------------------------------------

public class accTriggerHandler {
    
    
    public static void beforeInsert(List<Account> newAccList){
        
        Map<String, Account> nameAccMap = new Map<String, Account>(); // bos bir map olusturduk.
        
        
        
        for(Account acc : newAccList){
            
            nameAccMap.put(acc.Name, acc); //keep name of accounts and accounts in map 
            							   // => bos mapin icine account name(farkli olmalari gerektiginden dolayi ilk parta nameleri koyduk) ve account recordlari koyduk.
            if(acc.Phone == null){
                
                acc.addError('Please verify the Errors from the Account Trigger');
                acc.Phone.addError('Phone must not be blank!');
            }
        } // buraya kadar net anlasildi.
        
        if(nameAccMap.keySet().size()>0){ // anlasildi.
            
	List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name IN: nameAccMap.keyset()];    // anlasildi   
            
            for(Account acc : accounts){ // anlasildi.
                
              Account insertedAcc = nameAccMap.get(acc.Name); // yarim anlasildi.
                
                if(insertedAcc != null){ // yarim anlasildi.
                    
                    insertedAcc.addError('There is an account using this name already, change the name!'); // anlasildi.
                }
                
            }
            
        }
        
    }
    

}