public class ContactsTriggerSequenceController {

    /**
    * @Name: afterInsert
    * @param: NA
    * @return: NA
    * @Description: To call Business class method for after Insert trigger event.
    **/ 
    public void afterInsert(){
        ContactsTriggerOperation.insertUndeleteOperation(Trigger.new);
    }
    
       
        /**
    * @Name: afterUpdate
    * @param: NA
    * @return: NA
    * @Description: To call Business class method for after update trigger event.
    **/ 
    public void afterUpdate(){
        ContactsTriggerOperation.updateOperation(Trigger.oldMap,Trigger.newMap);
    }
    
       
    /**
    * @Name: afterDelete
    * @param: NA
    * @return: NA
    * @Description: To call Business class method for after Delete trigger event.
    **/ 
    public void afterDelete(){
       ContactsTriggerOperation.deleteOperation(Trigger.old); 
    }  
}