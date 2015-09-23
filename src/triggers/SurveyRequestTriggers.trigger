trigger SurveyRequestTriggers on Survey_Request__c (before update, before insert) {
   if(trigger.isbefore)
   {
     if(trigger.isinsert)
     {
       for(Survey_Request__c sr: Trigger.new)
       {
         if(sr.Status__c =='Stop')
         {
           sr.addError(' Cannot set status as Stopped at the time of Survey request creation');
         }
       }
     }
   }
   if(trigger.isbefore)
   {
    if(trigger.isupdate)
    {
      for(Survey_Request__c sr: Trigger.new)
      {           
        if(sr.Status__c == 'Stop')
        {
          sr.Stop_Started_Date__c= system.today();
        }
        if(Trigger.oldMap.get(sr.Id).Status__c == 'Close' && sr.Status__c != 'Close')
        {
          sr.addError('Cannot change status from Closed');
         
        }
        else if(Trigger.oldMap.get(sr.Id).Status__c == 'Stop' && sr.Status__c != 'Stop')
        {
          sr.Total_Stop_Duration__c = sr.Total_Stop_Duration__c + (System.today().day() - sr.Stop_Started_Date__c.day());
        }
      }
     }
       
    }
}