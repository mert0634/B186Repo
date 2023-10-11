public class ContactRestCallOutFromTypicode {  // AnimalRestCallOut ta yaptigimizin aslinda aynisini yapiyoruz burada
    
    public static void getUserToCreateContact(String userId){
        
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/users/'+ userId);
        // request.setEndpoint('https://jsonplaceholder.typicode.com/users/1); yazip sadece 1. user alacagima , userId yazarak dinamik yapiyorum ( ama yine sadece1 tane user aliyorum)
        request.setMethod('GET');
        HttpResponse response =http.send(request);
        
        if(response.getStatusCode() == 200){
            
            
       UserToContactParser myContact = UserToContactParser.parse(response.getBody()); //convert from json to apex and assign into "myContact" variable
            
            System.debug('Name of User: ' + myContact.name);
            System.debug('User Email: ' + myContact.email);
            System.debug('Company Name:' + myContact.Company.name); // boyle yazdim cunku name company classinin icinde; eger parser classa bakarsan.
            System.debug('City:' + myContact.Address.city);
            
            //lets create contact in salesforce...
            
            Contact con = new Contact();
            con.LastName = myContact.name;
            con.Email = myContact.email;
            con.MailingCity = myContact.Address.city;
            insert con;
            System.debug(con);
        }
    }
}


//ContactRestCallOutFromTypicode.getUserToCreateContact('10');
//ContactRestCallOutFromTypicode.getUserToCreateContact('9');
//ContactRestCallOutFromTypicode.getUserToCreateContact('8');
// Bunlari olusturduk salesforceda contact objesini gidilirse ; rahatlikla gorulebilir.





/*Example 3: typicode system must be integrated with salesforce....
// and call the user informations in typicode external system...
//by using those info, create contact record in Salesforce....

ContactRestCallOutFromTypicode.getUserToCreateContact('1');

for(Integer i=1; i<11; i++){
    
    ContactRestCallOutFromTypicode.getUserToCreateContact(String.valueOf(i));
    System.debug('------------------');
} //to display all the users from typicode
//but when you do multiple call out, you cannot do multiple DML at the same time
//so make insert part comment in class to call multiple callout

ContactRestCallOutFromTypicode.getUserToCreateContact('10');
ContactRestCallOutFromTypicode.getUserToCreateContact('9');
ContactRestCallOutFromTypicode.getUserToCreateContact('8');
ContactRestCallOutFromTypicode.getUserToCreateContact('7');
ContactRestCallOutFromTypicode.getUserToCreateContact('6');
*/