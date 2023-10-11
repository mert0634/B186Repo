trigger LeadTrigger05 on Lead (before delete, before update, before insert, after insert) {
    //Example 6: If industry is Education, do not allow any user to delete the record...
    
    //in best practices: we check trigger event and operations first...
    //bcs we can add some other trigger event and operations later...
    
    if(Trigger.isBefore && Trigger.isDelete){ // Bu trigger sadece before-delete icin calisir , cunku digerlerine birsey yazmadik. 
        
         for(Lead w : Trigger.old){ //in delete; we have trigger.old......
        if(w.Industry == 'Education'){
            w.addError('You can not delete the record when industry is education!');
            
        	}
        
    	}

    }
       
}