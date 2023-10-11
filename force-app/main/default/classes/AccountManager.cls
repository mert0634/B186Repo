public class AccountManager {
    public static void updateTypeField(String fieldValue){
        
        List<Account> accList =  [SELECT Id, Name, Type FROM Account WHERE Type =:fieldValue ];
        
        System.debug(accList);
        for(Account acc : accList){
            acc.Type = 'Prospect';
        }
        
        update accList;
    	System.debug(accList);
    }

}