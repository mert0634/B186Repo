public class AnimalRestCallOut {
    
    //Example 2: Call the animal data from heroku website and print on the console...
    public static void getAnimals(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
            HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            
            /*1.way
            //Parse the data: convert from json to apex
           {
    	"animals": [
        "majestic badger",
        "fluffy bunny",
        "scary bear",
        "chicken"
    ]
}   17-24 linelari arasindkai kod object formatidir, key ve array listlerden olusmustur.

'https://th-apex-http-callout.herokuapp.com/animals' adresi {} formatina sahip oldugu icin 27.line da Map kullandik.
           Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                                        //Casting is like creating a template for data before assigning into container...
            
          List<Object> animals = (List<Object>) result.get('animals'); // key olan animals`in value degerleri list oldugundan ve o valuelari almak istedigimizden dolayi list olusturduk.
            for(Object w : animals){
                
                System.debug(w);
            }
            */
            
            //2. way - call parser helper class and use parse method...
            RestAnimalParser restAnmlPars = RestAnimalParser.parse(response.getBody());
            
            for(Object w : restAnmlPars.animals){
                
                System.debug(w);
            }
            
            
        }
    }    
}