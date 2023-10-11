//GET METHOD CLASS
//MedunnaRoomCallOut.getRoom(1);


//Call rooms from medunna
public class MedunnaRoomCallOut {
    @future(callout=true) //send to async thread....
    public static void getRoom(Integer roomResultSize){
        //create get request structure in Apex
        Http http = new Http();
        HttpRequest request = new HttpRequest();
       //request.setEndpoint('https://medunna.com/api/rooms?size=300');
       //request.setEndpoint('https://medunna.com/api/rooms');
        request.setEndpoint('https://medunna.com/api/rooms?size=' + roomResultSize);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtdGtheWE2MSIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDIzfQ.zxZf9QTjrHk2fhRaQakXXT5jcKIS2hJunx2eriALK2nLAz0-UUUHGieYbS_H64aqe8e2f0jehIMeboope-nj-w');
        
       HttpResponse response = http.send(request);
        
        System.debug('Status code: ' + response.getStatusCode());
        System.debug('Data: ' + response.getBody());
        
        
        if(response.getStatusCode() == 200){
            
         List<Object> Rooms = (List<Object>) JSON.deserializeUntyped(response.getBody()); //from json to apex: deserialize
            
            for(Object w : Rooms){
                
                System.debug(w);
            
            }
        }
    }

}