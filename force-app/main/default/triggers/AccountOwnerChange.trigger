trigger AccountOwnerChange on Account (after update) {
    
//Example 2: If the owner of an account is changed then owner of related contacts should be updated as well....
//(that might happen if a user leaves the job, the it can be required to update owners...)
    if(Trigger.isAfter && Trigger.isUpdate){
        
        AccountOwnerChangeHandler.updateOwner(Trigger.new,  Trigger.oldMap, Trigger.newMap);
 
    }
    
}