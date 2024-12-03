public with sharing class OpportunityService {
    public static void sendEmailCreateOpportunity(List<Opportunity> opps){
        List<Opportunity> updateOpportunity = new List<Opportunity>();

        for (Opportunity opp : opps) {
            updateOpportunity.add(opp);
        
        }
        if (!updateOpportunity.isEmpty()) {
            EmailUtils.sendEmail(updateOpportunity);
        }
    }
}