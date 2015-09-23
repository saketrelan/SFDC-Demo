trigger SyncUserToEmployee on User (after insert, after update) {
  if(trigger.isafter)
  {
    if(trigger.isinsert || trigger.isupdate)
    {
      Integer flag;
      List<Employee__c> emp =[Select Id,Name,First_Name__c,Email_Id__c,Phone_Number__c,User__c from Employee__c];
      for(User us: Trigger.New)
      {
       flag=0;
       for(Employee__c e: emp)
        {
          if(us.email==e.Email_Id__c)
          {
            e.First_Name__c=us.FirstName;
            e.Phone_Number__c= us.Phone; 
            e.Email_Id__c = us.Email;
            e.User__c= us.Id;
            flag=1;          
          }
        }
        if(flag==0)
        {
          emp.add(new Employee__c(First_Name__c=us.FirstName,Email_Id__c = us.Email,Phone_Number__c= us.Phone,User__c=us.Id));
        }
      }
      upsert emp;
    }
  }
}