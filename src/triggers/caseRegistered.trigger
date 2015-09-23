trigger caseRegistered on Case (after insert, after update) {
   if(trigger.isafter)
   {
     if(trigger.isUpdate || trigger.isInsert)
     {
        list<Task> lNewTasks = new list<Task>();
        List<Case> newCase = Trigger.new;
        for(Case i : newCase)
        {
          if(i.IsClosed == true)
          {           
           Account acc=[Select Owner.Id from Account where Id =: i.AccountId];
           lNewTasks.add(new Task(Subject = 'Case having '+i.Subject+' under '+i.reason ,Priority='HIGH', OwnerId= acc.Owner.Id, ActivityDate= system.today().addDays(1), whatId=i.AccountId));
          }
        }
        Database.DMLOptions dmlo = new Database.DMLOptions();
        dmlo.EmailHeader.triggerUserEmail = true;       
        database.insert(lNewTasks,dmlo);
     }
   }

}