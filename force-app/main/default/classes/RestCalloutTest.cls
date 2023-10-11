@isTest
public class RestCalloutTest {
    
    @isTest
    public static void getAnimalsTest(){
        RestCalloutMock mock = new RestCalloutMock(); // mock classina ait bir instance yaratmaliyim , mock classi kullanabilmke icin.
        
        Test.setMock(HttpCalloutMock.class, mock); // Bu kodda apex guide dan baktik, mock classi kullanmak icin zorunludur.
        /*  Now that you have specified the values of the fake response, 
            instruct the Apex runtime to send this fake response by calling Test.setMock in your test method.
            For the first argument, pass HttpCalloutMock.class, and for the second argument,
            pass a new instance of your interface implementation of HttpCalloutMock */
        
        Test.startTest();
        HttpResponse response = RestCallouts.getAnimals(); // RestCallouts.getAnimals() buradan gelen datalar gercek bir 3. party applicationdan gelmiyor. Kendi olusturdugumuz mock classtan geliyor.
        													// Gelen datalarida  HttpResponse konteynirina koyduk.
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        System.assertEquals('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}', response.getBody());
        Test.stopTest();
        
    }
}