trigger AccountTriggerDT on Account (before insert) {
    
//Example 3: Create a trigger that is fired when account is being inserted
//account name cannot be "TechProEd"
//if account name is different from "TechProEd" 
//assign "Agriculture" into Industry field

    for(Account acc : Trigger.new){
        
        if(acc.Name == 'TechProEd'){
            acc.AddError('TechProEd can not be used in Account Name');
        }else{
            
            acc.Industry = 'Agriculture';
        }
              
    }

}