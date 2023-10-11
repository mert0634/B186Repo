/*
When you declare a class using the "with sharing" keyword, the data access inside that class will respect the current user's field- and object-level permissions, as well as sharing rules.
    */
    public with sharing class TrialAccPractice {
        
        
      
        //Example 1: Change the value of Active__c field in all the accounts... Deactivate them....
                        
    public static void accStatusChange(List<ID> accountIds){
        //get accountIds as an argument in method parameter.../ call the records whose id is coming from paramater with active field
     List<Account> accList = [SELECT Id, Active__c FROM Account WHERE Id IN: accountIds AND Active__c != 'No'];// note: dikkat edilecek olursa Active__c != 'No'yazdik Active__c !=: 'No'  yazmadik, cunku parameter olarak disaridan sadece 1 tanede account id almiyorum, list halinde aldigim icin boyle yazdik. Ve WHERE`den sonra IN kullandik, cunku disaridan List aliyorum, eger tek bir record alsaydim ozaman kullanmak zorunda degildim. Bunun icin "Opportunity Manager" adli ornege bakabilirsin.COK ONEMLI BURASI.
                                                           
                                            //iterate to change value of field
                    for(Account acc : accList){
                        acc.Active__c = 'No'; //deactivate them....
                    }
                    update accList;  //update
                                                
        }
    }