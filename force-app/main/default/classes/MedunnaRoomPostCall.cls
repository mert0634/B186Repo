public class MedunnaRoomPostCall {
    
    public static void postRoom(){
        //use Room wrapper class and fill out the data
        Room room = new Room();
        room.description = 'Mertcan Creates a room for Session';
        room.price = 339;
        room.roomNumber= 455587598;
        room.roomType = 'DELUXE';
        room.status = true;
        
       String apexToJson = JSON.serialize(room); //apex to json: serialize
            
            
            
            //create a POST request structure in APEX
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXR0MDYzNCIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDQ1fQ.Yvxd-3hfjQ-XigoES5-xD5qIbYGJJvWwgEhVw-YI-Ua56fn273Oluu1o6OOHbhdR0U2K0grdFCQA2FyRt7w8FQ');
        request.setHeader('Content-Type', 'application/json'); //body type 
        request.setBody(apexToJson); //body is defined by using wrapper class
        
       HttpResponse response = http.send(request);
       
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() ==201, 'Status code does not match!');
        //assertion is used to make sure result is successful, otherwise gives a message
        
    }
    
    
    
    
    //wrapper class : keeps containers for the data I want to send in POST request // 1.yol= Body yi olusturmak icin wrapper class olusturduk ve ana classin icinde serialize yaptik. Serialize demek apex kodu json`a cevir demektir. Sonuc olarak datayi cektik, manipule ettik ve external sisteme geri gonderdik.
    public class Room{
        
        public String description;
        public Integer price;
        public Integer roomNumber;
        public String roomType;
        public Boolean status;
        
    }
    
    
    public static void RoomPostRequest2(){
        
        String data = '{"roomNumber": 418978888, "roomType": "DAYCARE", "status": true, "price": 899.99, "description": "Last Mohican"}';
        // 2.yol= body yi direk tanimlamak. Biz burada direk json formatinda string konteynirin icine koyduk sonra`da onu gittik body de yazdik. Direk json formatinda yazdigimiz icin serialize yapmamiza gerek kalmadi.
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtdGtheWE2MSIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDIzfQ.zxZf9QTjrHk2fhRaQakXXT5jcKIS2hJunx2eriALK2nLAz0-UUUHGieYbS_H64aqe8e2f0jehIMeboope-nj-w');
        request.setHeader('Content-Type', 'application/json'); //body type 
        request.setBody(data); //body is defined by using wrapper class
        
       HttpResponse response = http.send(request);
       
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() ==201, 'Status code does not match!');
        
    }
}