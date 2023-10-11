public class RoomPutAndDeleteCallOut {
    
    public static void updateRoom(){
    
    String RoomToUpdate = '{"id": 77036,"roomNumber": 455587333, "roomType": "TWIN", "status": true, "price": 399.99, "description": "MATRIX"}';
        
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('PUT');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXR0MDYzNCIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDQ1fQ.Yvxd-3hfjQ-XigoES5-xD5qIbYGJJvWwgEhVw-YI-Ua56fn273Oluu1o6OOHbhdR0U2K0grdFCQA2FyRt7w8FQ');
        request.setHeader('Content-Type', 'application/json'); 
        request.setBody(RoomToUpdate); 
        
       HttpResponse response = http.send(request);
       
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() == 200, 'Status code does not match!');
    }
    
    //DELETE THE ROOM YOU CREATED
    public static void deleteRoomRequest(Integer roomId){ //get Id by method parameter
     
       	Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms/'+roomId); //Id will be concatenated when we enter in method parenthesis.
        request.setMethod('DELETE');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtdGtheWE2MSIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDIzfQ.zxZf9QTjrHk2fhRaQakXXT5jcKIS2hJunx2eriALK2nLAz0-UUUHGieYbS_H64aqe8e2f0jehIMeboope-nj-w');
        
       HttpResponse response = http.send(request);
        
         System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() == 204, 'Status code does not match!');
    }
    
}