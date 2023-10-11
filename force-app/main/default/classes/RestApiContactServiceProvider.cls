@RestResource(UrlMapping='/contacts/') //must be appended to end of endpoint as path parameter
global class RestApiContactServiceProvider {
    
        /*    get 50 records
    //I will provide all contact records to external system
    //this is a non void method; becase we will give something back to the requestor, so we need return type...
    @HttpGet
    global static List<Contact> getContactService(){
        
       List<Contact> contacts =  [SELECT ID, FirstName, LastName, Phone, Email FROM Contact LIMIT 50];
        
           
           return contacts;
    }  
        */
    //========================= ( one single get record)
    @HttpGet
    
    global static Contact provideContactRecsById(){
        
        RestRequest request = RestContext.request; //to be able to create value part of query parameter....
        
        //catch the ID coming in request from postman, and find related contact record from database
       String contID = request.params.get('contactId'); //enter key in get method, and it returns value (ID)
        
        // line 24 de getin icine contactId yazdik. Bu optional. Istersem baska birseyde yazabilirdim.
        // Cunku Postmanda key kismini contactId olarak tanimladim. Yani ben oraya hangi recordun idsini girersem
        // onu bana gosterecek.
        
        Contact con = [SELECT ID, FirstName, LastName, Phone, Email FROM Contact WHERE ID=:contID LIMIT 1];
        
        return con;
    }
 
    //request.params.get('contactId'); in this part we define key part of query parameter
    //what we define here must be used in postman as key
    //btw you can give any name instead of "contactId"... bus should summarize the functionality...
    
    
    
    
    // ================
    
    //we will create structure to welcome the body coming from postman (3rd party)
    @HttpPost
    global static Contact createContactService(Contact contFromPM){
        
        Contact newContact = new Contact();
        
        newContact.FirstName = contFromPM.FirstName; // esitligin sag tarafi postmanden geliyor
        newContact.LastName = contFromPM.LastName;// esitligin sag tarafi postmanden geliyor
        newContact.Phone =  contFromPM.Phone;// esitligin sag tarafi postmanden geliyor
        newContact.Email = contFromPM.Email;// esitligin sag tarafi postmanden geliyor
        
        insert newContact; //insert is done into database 
        
        return newContact; //as a response, after contact inserted we will return created contact to external system...
        
        
    } 
    
    
    
    
    //===============================
    
     @HttpPut
    
    global static Contact putContactService(Contact contToUpdate){
        //to be able to update; call the record from database first by using ID coming in Body from Postman
       Contact updateExistingRec = [SELECT Id FROM Contact WHERE ID =: contToUpdate.Id LIMIT 1];
        
        updateExistingRec.FirstName =  contToUpdate.FirstName;// esitligin sag tarafi postmanden geliyor
        updateExistingRec.LastName = contToUpdate.LastName;// esitligin sag tarafi postmanden geliyor
        updateExistingRec.Phone = contToUpdate.Phone;// esitligin sag tarafi postmanden geliyor
        updateExistingRec.Email =     contToUpdate.Email;// esitligin sag tarafi postmanden geliyor
        
        update updateExistingRec;
        
        return updateExistingRec; //return updated version as a response to Postman
         
    }
 
    
     //===================================
     //delete by ID
    @HttpDelete
    global static void deleteContactService(){
        
        //query parameter is needed for ID
        RestRequest request = RestContext.request;
     String conId  = request.params.get('contactID');
       Contact existingConToDelete =  [SELECT ID FROM CONTACT WHERE ID=: conId];
        
        delete existingConToDelete;
    }
     
    
   
    
}
//methods can be in two types: void and non-void
//non-void method must include "return" keyword and return data type in method creation line.