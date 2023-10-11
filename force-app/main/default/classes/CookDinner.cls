public class CookDinner {
    
    //create class constructor here and collect all method constructor in it
    //so in one single line we can execute all the methods
    public CookDinner(){// Mantik cok basit, line 5 deki yapiyi yazip ; ana classtaki butun methodlarin adlarini       			
        				// bu yapinin altina yazarsam; line 56 daki kodu anonymous windowda execute ederek; butun	
        makeSoup();		// methodlari tek bir line da run etmis olurum. Butun mantik bukadar.
        makeSalad();
       makeMeat();
       //makeDessert();
        fixTheCar();
        
    }
    
    
    public static void makeSoup(){
        
        System.debug('Soup is being prepared!');
    }
    
    public static void makeSalad(){
        
        System.debug('Salad is being prepared!');
    }
    
    public static void makeMeat(){
        
        
        
        System.debug('Meat is being prepared!');
    }
    
    @future
    public static void makeDessert(ID recId){ // Loglarda FutureHandler classta gorebiliriz. Ama method parameterin icini doldurmaliyiz.
        
        System.debug('Dessert is being prepared! ' + recId);
    }
    
 
    @future //it will be executed in another thread asynchronously => @future annotation
     public static void fixTheCar(){ // Loglarda FutureHandler classta system.debugi gorebiliriz.
        							 // Burdaki mantik ise eger method basina @future yazilirsa baska bir thread de run edilecek demektir.
        System.debug('Car is being repaired in mechanic!');
    }
}


//============================
  
//Account acct =[SELECT ID, NAME FROM ACCOUNT LIMIT 1];
//CookDinner.makeMeat(acct);
//CookDinner.makeDessert(acct.ID);


//just with class constructor we can call all the methods...
//CookDinner cd = new CookDinner();