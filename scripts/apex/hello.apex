// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents
/*
List<Account> accounts = [SELECT Id FROM Account];
List<ID> accIds = new List<ID>();
for(Account acc : accounts){
    accIds.add(acc.Id);

}

TrialAccPractice.accStatusChange(accIds);*/

List<Opportunity> OppStage= OpportunityManager.OppMan('Closed Won');

for(Opportunity opp: OppStage){
    
    system.debug(opp);
}