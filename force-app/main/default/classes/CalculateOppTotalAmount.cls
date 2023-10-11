public class CalculateOppTotalAmount {
//USE CASE 2: By using Account Ids, update account's annual revenue field with total amount of all the opportunities in an Account
// Account Id will be taken as an argument in method paramater
// use one single method....
    public static void updateAnnRevForAcc(Id accountId){
        
        //call the the total amounts with agg function from opportunities in an account 
      AggregateResult[] result = [SELECT SUM(Amount)totlAmnt FROM Opportunity WHERE AccountId =:  accountId];
        
        if(!result.isEmpty()){
            //normally aggregate result from a specific index should be stored in Object data type
            //so do the casting to be able store result in Decimal container
          Decimal totalAmount = (Decimal) result[0].get('totlAmnt'); // we did casting here , instead of using object format we used decimal, cunku result kusuratli olabilir.
            
            
            //Retrieve the Account record from DB that you want to do update in annual revenue           
            Account acc = [SELECT Id, AnnualRevenue FROM Account WHERE Id =: accountId];    
            
            
            //update annual revenue field by assigning total Amount from opportunities           
            acc.AnnualRevenue = totalAmount;
            
            update acc;
            
        }
        
        
    }
    
    
}

// CalculateOppTotalAmount.updateAnnRevForAcc('001Hn00001u8cMBIAY');