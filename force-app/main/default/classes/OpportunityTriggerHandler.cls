public with sharing class OpportunityTriggerHandler {
    public static void onAfterINsert(List<Opportunity> opps) {
        OpportunityService.sendEmailCreateOpportunity(opps);
    }
}