//4. Trigger
trigger LeadTrigger03 on Lead (before update) { 
    //Example 4: When a lead record is being updated, 
    //and if industry field is blank or Technology or Finance;
    //Rating should be changed from Cold to Hot

    for(Lead w : Trigger.new){
       
        if((String.isBlank(w.Industry) || w.Industry =='Technology' || w.Industry == 'Finance') && w.Rating=='Cold') {

            
            w.Rating='Hot';
            
        }
        
    }
    
}

/* Aciklama : Lead objesindeki recordlarda; eger Industry field Technology yada blank
   yada Finance ile dolu ise ve Rating fiedl da Cold seciliyse ; o recordun herhangi 
  bir fieldinda bir degisiklik oldugu anda Rating fieldi otomatik Hot yap diyor.
*/