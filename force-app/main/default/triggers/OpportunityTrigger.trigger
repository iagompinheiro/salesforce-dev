trigger OpportunityTrigger on Opportunity (after insert) {
    switch on Trigger.operationType {
        when AFTER_INSERT {
            OpportunityTriggerHandler.onAfterINsert(Trigger.new);
        }
    }
}