public with sharing class CaseService {
    public static void sendEmailCase(List<Case> cases) {
        List<Case> casesInsert = new List<Case>();
        Set<String> typeCase = new Set<String>{'Eletronic', 'Electrical', 'Mechanical'};

        for (Case c : cases) {
            if (typeCase.contains(c.Type)) {
                casesInsert.add(c);
            }
        }
        if (!casesInsert.isEmpty()) {
            EmailUtils.sendEmailCase(casesInsert);
        }
    }
}