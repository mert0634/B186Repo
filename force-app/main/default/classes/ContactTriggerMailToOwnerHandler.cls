//HANDLER
public class ContactTriggerMailToOwnerHandler {
    
    public static void sendEmailToContactOwner(List<Contact> conList){
        
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        
       Set<ID> ownerIds = new Set<ID>();        
        for(Contact con : conList){
            
           ownerIds.add(con.OwnerId);//collect ownerId of contacts in set to use later in Query
        }
        
        //query user object to retrieve owner email addresses.
       Map<Id, User> ownerMap = new Map<Id, User>([SELECT ID, Email, FirstName FROM User WHERE ID IN: ownerIds]); // [SELECT ID, Email, FirstName FROM User WHERE ID IN: ownerIds] aslinda bu bir list ; biz listi mapin icine atiyoruz.
        
        for(Contact con : conList){
           User owner =  ownerMap.get(con.OwnerId); //gives me user details of contact owner from map // one single user object container 
            // user data typeindaki owner objesinin birden cok fieldi var ; Email, owner ..so on.
            // ownerMap ve conList icindeki idler ayni oldugu icin mapten OwnerId yi aliyorum.
            
            if(owner != null && owner.Email != null){
                
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage(); //click on compose
                
                String[] toAddress = new String[]{owner.Email};
                    emailMsg.setToAddresses(toAddress); //put target address in email object
                String emailSubj = 'Hello ' + owner.FirstName;
                    emailMsg.setSubject(emailSubj);
                
                String displayName = 'Administrator of SF';
                   emailMsg.setSenderDisplayName(displayName);
                
                String bodyContent = 'Hi, ' + owner.FirstName + ',<br/>' +
                    'Contact has joined to Salesforce System! <br/>'+
                    'Study hard in your Salesforce journey! <br/>'+
                    'Happy learning my friends in B186 💯 😎 <br/>' + 
                    'Thank you! <br/><br/>'+
                    'Contact Firstname: ' + con.FirstName + '<br/>' + 
                    'Contact Lastname: ' + con.LastName;
                    
                   emailMsg.setHtmlBody(bodyContent);
                emailList.add(emailMsg);
                
            }
            
        }
        
        Messaging.sendEmail(emailList);
        
    }
 
}