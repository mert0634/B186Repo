//7. Trigger
trigger LeadTrigger06 on Lead (before insert, before update) {
    
    //Example 7: When a new lead is being created
    //if industry is blank, assign 'Education'
    
    //When a lead record is being updated
    //if industry is blank assign 'Banking'
    
    // Dikkat: LeadTrigger02 de before-insert ve before-update icin tek bir trigger kodu yazmistik, ama burada her ikisi icin ayri ayri yazdik.Farka dikkat.
    
    if(Trigger.isBefore && Trigger.isInsert){
        
        for(Lead w : Trigger.new){
            
            if(String.isBlank(w.Industry)){
                
                w.Industry = 'Education';
            }
        }
        
    }
    
       
    if(Trigger.isBefore && Trigger.isUpdate){
        
        for(Lead ld : Trigger.new){
            
            if(String.isBlank(ld.Industry)){
                
                ld.Industry = 'Banking';
            }
        }
        
    }
}