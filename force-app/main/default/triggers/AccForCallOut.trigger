//FUTURE METHOD CALL IN TRIGGER    
    
trigger AccForCallOut on Account (after insert) {

            
            //when account is inserted create a task 
            //and give me the available rooms from  medunna health system
    List<Task> taskList = new List<Task>();
    
    for(Account acc : Trigger.new){
        
        Task tsk = new Task();
        tsk.Subject = 'Follow up task for account and Room : ' + acc.Name;
        tsk.OwnerId = acc.OwnerId;
        
        taskList.add(tsk);
    }
    
    insert taskList;
    
    //get rooms from medunna
    MedunnaRoomCallOut.getRoom(5);
    
    /*Buradaki mantik sudur: Olusturdugum 'MedunnaRoomCallOut' adli ana classin hemen altina ' @future(callout=true) //send to async thread....'
     yazarsam ; burada olusturdugum methodu , olusturdugum baska bir Trigger`da kullanabilirim. Eger @future annotationunu yapmazsam 
     'Callout from triggers are currently not supported' adli hatayi gorurum.
     */ 
    
}