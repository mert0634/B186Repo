public class LeadTrigger16Handler {
    
   public static Boolean keyForLockTheDoor = true;
    
    public static void afterInsertHandlerLead(List<Lead> lead){
        
        
        if(keyForLockTheDoor){ // "keyForLockTheDoor" burada tru oldugu icin execution devam edecek.
            
            keyForLockTheDoor = false; //overwrite false on true and prevent recursion. 
            //"keyForLockTheDoor" burda false oldu; execution tamamlanacak;
            // sistem en bastan execute edilmeye basladiginda bu sefer "keyForLockTheDoor"
            //  false oldugunu gorecek ve if`ten sonrasini execute etmeyecek.
              
                 Lead newLead = new Lead(LastName= 'Recursion Test B186', Company='Test RC', Industry='Finance');
     insert newLead;
            
        }  
        
 
    }
    
}