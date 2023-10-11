//Example 4: Create new Opportunity when an account with no oppotunity is updated for Industry-Finance
//if there is no opp of account before, create a new one.
//Opp should be set as below:
//opp for updated account:
//Stage: "Prospecting", Amount = $100, CloseDate = "90 days from Today"

trigger AccountToNewOpp on Account (after update) {
    
 //Example 4: Create new Opportunity when an account with no oppotunity is updated for Industry-Finance
//if there is no opp of account before, create a new one.
//Opp should be set as below:
//opp for updated account:
//Stage: "Prospecting", Amount = $100, CloseDate = "90 days from Today"

    if(Trigger.isAfter && Trigger.isUpdate){
        Set<ID> accIds = new Set<ID>();
        
        for(Account acc : Trigger.new){
            
            if(acc.Industry == 'Finance'){
                
                accIds.add(acc.Id);
                
            }
        }
        
      List<Opportunity> oppList =[SELECT AccountId FROM Opportunity WHERE AccountId IN:accIds];
        
        if(oppList.size()==0){
            
            List<Opportunity> oppNewList = new List<Opportunity>();
            for(Account acc : Trigger.new){
                Opportunity opp = new Opportunity();
                
                opp.Name = acc.Name + ' Opp';
                opp.StageName = 'Prospecting';
                opp.AccountId = acc.Id;
                opp.Amount = 100;
                opp.CloseDate = System.today() + 90;
                oppNewList.add(opp);
                
                
            }
          insert oppNewList;
        }
        
     }
        
   }