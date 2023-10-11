public class LeadTrigger15Handler {
    
    //before insert
    public static void beforeInsertHandling(List<Lead> insertList){
        for(Lead w : insertList){
            if(String.isBlank(w.LeadSource)){
                w.LeadSource = 'Other';
            }
            if(String.isBlank(w.Industry)){

                w.Industry.addError('You can not proceed with null industry!');                
            }
            //we created two independent if statement for two independent conditions in scenario...
        }
        
    }
    
    
    
    
    //before update
    public static void beforeUpdateHandling(List<Lead> updateList, Map<Id, Lead> leadOldMap){
        
        
        for(Lead w : updateList){
            if(String.isBlank(w.LeadSource)){
                w.LeadSource = 'Web';
            }
            
             //status part...
        //I need old version.... in old version I need specific value of a specific field... so I need oldMap
       Lead oldLead = leadOldMap.get(w.Id);//old version is taken... aslinda map ve list ayni lead id lere sahipler ama oldmap recordun old formatini tutar.
        				// for`un icinde oldugumdan dolayi; w`yu kullaniyorum.
        
            if(oldLead.Status =='Open - Not Contacted' && (w.Status == 'Closed - Converted' || w.Status == 'Closed - Not Converted')){
                // Status fieldinin eski hali 			// status fieldinin yeni hali    		// status fieldinin yeni hali
                w.Status.addError('Before changing the status to Closed, you should contact to the Lead first!');
                
            }
            
        }

    }

}



    //When a lead record is being updated, Lead Status should not be changed to "Closed" before contacting with the lead!
    //"Before changing the status closed, you should contact to the lead!" 
    /*
 		it means if current value of field is "Not Contacted"; you can not make it "Closed"...
		before making it closed; "You should contact with the lead..."
 
		Yani ; Eger en basta status field "Not Contacted" seciliyken; "Closed Converted" yada "Closed Not Converted"
				secilerek guncelleme yapilamaz, Sadece "Working Contacted" secilerek guncelleme yapilabilir denmektedir.
*/