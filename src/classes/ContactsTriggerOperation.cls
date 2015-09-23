public class ContactsTriggerOperation{

    public static void insertUndeleteOperation(List<Contact> contactList){
         List<id> accIdList = new List<id>();
         for(Contact objCon : contactList){
             if(objCon.AccountId != null){
                 accIdList.add(objCon.AccountId);
             }
        }
         updateField(accIdList);
    }
    
    public static void deleteOperation(List<Contact> contactList){
        List<id> accIdList = new List<id>();
        for(Contact objCon : contactList){
             if(objCon.AccountId != null){
                 accIdList.add(objCon.AccountId);
             }
        }
         updateField(accIdList);
    }

    public static void updateOperation(Map<Id,SObject> contactOldMapTemp, Map<Id,SObject> contactNewMapTemp){
        List<id> accIdList = new List<id>();
        Map<Id,Contact> contactOldMap = (Map<Id,contact>) contactOldMapTemp;
        Map<Id,Contact> contactNewMap = (Map<Id,contact>) contactNewMapTemp;        
        
        for(Contact objCon : contactOldMap.values()){
          if(contactOldMap.get(objCon.Id).AccountId != null && contactNewMap.get(objCon.Id).AccountId != null){
             
                if(contactOldMap.get(objCon.Id).AccountId != contactNewMap.get(objCon.Id).AccountId){
                   accIdList.add(contactOldMap.get(objCon.Id).AccountId);
                   accIdList.add(contactNewMap.get(objCon.Id).AccountId); 
                }
          }
        }
         updateField(accIdList);
         
    }

    public static void updateField(List<id> accIdList)
    {
        List<Account> accUpdateList = new List<Account>();
        List<Error_Log__c> errorLogList = new List<Error_Log__c>();
         
        if(!accIdList.isEmpty())
        {
            for(Account acc : [SELECT no_of_contacts__c,(SELECT id FROM Contacts) FROM Account WHERE id =: accIdList]){
                acc.no_of_contacts__c = acc.Contacts.size();
                accUpdateList.add(acc);
            }

            List<Database.SaveResult> ListSaveResult = Database.update(accUpdateList, false);
            for(Database.SaveResult objSR : ListSaveResult){
                if(!objSR.isSuccess()){
                    Error_Log__c errorLog = new Error_Log__c();
                    errorLog.Apex_Class_Name__c = 'ContactsTriggerOperation';
                    errorLog.Error_Type__c = 'SFDC';
                    errorLog.Error_Message__c = objSR.getErrors()[0].getMessage();
                    errorLogList.add(errorLog);                       
                }
            }
            
            if(!errorLogList.isEmpty()){             
                insert errorLogList;
            } 
        }
    }
    
}