public with sharing class CaseTriggerHandler {
    public static void onAfterInsert(List<Case> cases) {
        CaseService.sendEmailCase(cases);
    }
}