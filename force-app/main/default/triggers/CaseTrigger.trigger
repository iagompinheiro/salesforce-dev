trigger CaseTrigger on Case (After insert) {
    switch on Trigger.operationType {
        when AFTER_INSERT {
            CaseTriggerHandler.onAfterINsert(Trigger.new);
        }
    }
            
 }