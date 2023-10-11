trigger LeadTrigger14 on Lead (after insert, after update) { // Dikkat edilirse after insert ve after update den sonra task objesinin uzerinde islem yapiyoruz; eger Lead uzerinde birsey yapmaya kalksaydik hata alicaktik.

    //Example 14: When a lead record is updated or inserted,
    //Create a task only when industry is 'Education'
    
    switch on Trigger.OperationType{ // istersem switch on yerine if de kullanabilirim.
        when AFTER_UPDATE, AFTER_INSERT{
            
           LeadTrigger14Handler.afterInsertAndUpdateTrigger(Trigger.new);// Trigger.new kullandik; cunku list ile calisiyoruz.
        }
    }
    
}
/*Aciklama : Lead objesinde ki recordlarda herhangi bir update yada herhangi bir record
 olusturma durumunda 'afterInsertAndUpdateTrigger(Trigger.new)' methodunu calistir
demek istiyor burada
*/

//We can use "Handler Class" for triggers to create our logic inside...
//"Handler Class" is an Apex Class helping trigger and connected with trigger
//By the help of "Handler Class", we will have readable and simple codes in Trigger
//and logic will be in Apex Class