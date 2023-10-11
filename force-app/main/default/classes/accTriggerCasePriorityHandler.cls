//Example 5: Check the rating field of account, if it is updated;
// update cases of accounts as well
//if Rating is updated as Hot, Case Priority will be 'High'
//if Rating is updated as Warm, Case Priority will be 'Medium'
//if Rating is updated as Cold, Case Priority will be 'Low'


public class accTriggerCasePriorityHandler {
    
    
    public static void afterUpdate(Map<Id, Account> newAccounts, Map<Id, Account> oldAccounts){
        
        Set<Id> accIds = new Set<Id>(); //we have updated accounts' Ids.
        
        for(Account acc : newAccounts.values()){
            
            
         Account oldAcc =  oldAccounts.get(acc.Id); //I will get old account from value part by specifying key in get method.
            										// Burasi COK ONEMLI:  Account oldAcc =  oldAccounts.get(acc.Id) kodu hala for loopun icinde, o yuzden herhangi bir collection kullanmadik. Account recordlarinin hepsi oldAcc adli instance altinda tek tek loopa giriyor.
            if(oldAcc.Rating != acc.Rating){ // eger yeni ve eski degerler farkli ise record update edilmis demektir, ama idleri herzaman aynidir.
                
               accIds.add(acc.Id); // Eger Rating fieldlari update edilmis accountlar var ise ; id lerini bos olan set konteynirina ekliyorum.
                
            }
            
        }
        
        //update priority of cases in the accounts whose Ids are stored in Set
        //case update: .......
        
        if(!accIds.isEmpty()){
            //send account Ids to next method for updating child cases priority..
            updateCasePriority(accIds);
        }
    }
    
    //this method it to update cases in accounts of which rating is updated and fired the trigger...
    private static void updateCasePriority(Set<Id> accountIdsForCase){
       
        List<Case> cases = [SELECT Id, Priority, Account.Rating FROM Case WHERE AccountId IN: accountIdsForCase];
        
        for(Case cs : cases){
            
            if(cs.Account.Rating == 'Hot'){ // Buraya cok dikkat, 40. lineda ki query de Account.Rating fieldini cagirdigimdan dolayi burada kolaylikla Child Case den Paretin fieldina ulasabiliyorum.
                cs.Priority = 'High';
                
            }else if(cs.Account.Rating == 'Warm'){
                
                cs.Priority = 'Medium';
            }else{
                
                cs.Priority = 'Low';
            }
            
        }
        update cases;
        
    }
    
    
}