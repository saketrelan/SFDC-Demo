trigger updatePhonenumber on Contact (after insert, after update) {
  if(trigger.isafter)
  {
    if(trigger.isinsert || trigger.isupdate)
    {
      List<Account> acc=[Select Id, Phone from Account];
      List<Contact> con=[Select Id, Phone,Is_Primary__c  from Contact];
      for(Contact c: Trigger.new)
      {
         if(c.Is_Primary__c==true)
         {
            for(Account a : acc)
            {
              if(a.Id==c.AccountId)
              {
                for(Contact co: con)
                {
                  if(a.phone == co.phone && co.Is_Primary__c==true)
                  {
                    c.addError('Primary Contact already exists');
                  }
                }
                a.phone=c.phone;
               }
              }
            }
         }
         update acc;
      } 
    }
  }