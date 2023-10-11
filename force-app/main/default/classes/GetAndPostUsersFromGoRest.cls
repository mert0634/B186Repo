public class GetAndPostUsersFromGoRest {
    
    //get users from GoRest
    public static void getUsersFromGoRest(){
        
        Http http = new Http(); //click on New on postman
        HttpRequest request = new HttpRequest(); //click on Http on postman
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('GET'); //GET Method to read data
         HttpResponse response = http.send(request); //SEND button; request returns response everytime...
        
        if(response.getStatusCode() == 200){
            
            //to display data coming in JSON, we will do parsing to convert into Apex
            
           List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody()); //parsing - Potsman de 8.linedaki url yi yazdigim zaman bana [] icinde userlari veriyor , o yuzden burada list kullaniyorum.
           	// token kullanmadim . cunku gerek yok burada 
            //System.debug(results);
            
      
            for(Object w: results){
                System.debug(w);
            }
            
        }    
        
    }
    
    
    
    public static void postUser(){ // salesforce icine kayit etmiyorum useri' sadece burada olusturup target sisteme gonderiyorum orada kayit oluyor.
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer 287faf7a36f177afa300e797dbb90f532472839ea3683ce579d5b820dcc5cdb2');
        request.setHeader('Content-Type', 'application/json;charset=utf-8');
        // 'Authorization','Content-Type' bu ikisini POST methodunda herzaman yazman gerekir.
        request.setBody('{ "name": "Mathias TK V3", "email": "mertcnbzkrt06@gmail.com", "gender": "male","status": "active"}');
       HttpResponse response = http.send(request);
       
        if(response.getStatusCode() == 201){
            
            System.debug('Result: ' + response.getBody());
        }else{
            System.debug('Error: ' + response.getStatusCode() + ' - ' + response.getStatus());
        }
        
    }  
}
//Data is transfered from GoRest to Salesforce in JSON format and in List data type
//So we will conver the data from JSON to Apex in Apex class and assign into a List
//Converting data from JSON to Apex is deserialize....