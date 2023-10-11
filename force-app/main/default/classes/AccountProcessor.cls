//EXAMPLE 2: Create an Apex class and method to update Number_Contacts__c field
// enter the ID of accounts to update as an argument in method parameter...
// then create unit test for the operation

//call account records from database and collect Ids in a list
//then send to apex class....
//
// =============== TURKCESI
// Number_Contacts__c field`i guncellemek icin Apex class ve method olustur.
// bu methoda disardan list seklinde Account Id`leri verdiginde calissin.
// Bu class icin bir de test classi olustur.

//CLASS---------------------------

public class AccountProcessor {
    
    public static void countContacts(List<Id> accIds){ //get Acc IDs as an argument in paramater outside of the class...
        
        //call accounts and child contacts from database whose ID sent into class method externally
        List<Account> accounts = [SELECT Id, Name, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accIds];
        
        for(Account acc : accounts){
            
          acc.Number_Of_Contacts__c =  acc.Contacts.size(); //calculate number of child contacts in an account and put into related field
        }
        update accounts;
    }
      
}

// -------------------------To execute this class , we used the code below
/*
 List<Account> accList = [SELECT Id FROM Account];  // Butun Account recordlarini Id' leriyle getir; accList icine koy.
													//
List<ID> acIds = new List<ID>();					// Sadece ID leri tutacak bos bir list olustur.
													//
for(Account acc : accList){							// accList de bulunan Account recordlari; tek tek ele al.
    												//
    acIds.add(acc.Id);								// Ele alinan Account recordlarinin Id lerini; bos olan acIds listine bir bir ekle.
    												//
}													//
													//
AccountProcessor.countContacts(acIds);				// Bu methodu ve classi run et.

*/