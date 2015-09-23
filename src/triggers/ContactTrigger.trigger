trigger ContactTrigger on Contact (after insert, after delete, after undelete, after update) {
    
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete)){
    
      new ContactsTriggerSequenceController().afterInsert();
        
        }
    
    if(Trigger.isAfter && Trigger.isDelete){
    
        new ContactsTriggerSequenceController().afterDelete();
    
        }
        
    if(Trigger.isAfter && Trigger.isUpdate){
    
        new ContactsTriggerSequenceController().afterUpdate();
    
        }        

}