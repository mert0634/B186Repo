//RestCallouts.getAnimals();

//EXAMPLE WITH MOCK CALLOUT.....

public class RestCallouts {
    //Example: Get the animal data from Heroku App
    
    public static HttpResponse getAnimals(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request); // line 10 ile 15 arasi http protokolu for get method
        
        if(response.getStatusCode() == 200){
            
           String jsonString = response.getBody(); //you can use map "String, Object", we did not want to desirealize , thats why we used string.
            System.debug('The response is: ' + jsonString);
            System.debug(response.getStatus() + ' - ' + response.getStatusCode());
        
        }else{
            System.debug(response.getStatusCode() + ' - '+ response.getStatus());
        }
        return response;
        
    }
    
}