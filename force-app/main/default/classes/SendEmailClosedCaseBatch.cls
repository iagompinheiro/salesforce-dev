public class SendEmailClosedCaseBatch implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([
            SELECT Id, 
                   ContactId, 
                   Status, 
                   Type,
                   Subject 
            FROM Case 
            WHERE Status = 'Closed' 
            AND ClosedDate <= LAST_N_DAYS:10

        ]);
    }

    public void execute(Database.BatchableContext BC, List<Case> cases) {
        try {
            CaseService.sendEmailCaseClosed(cases);
        } catch (Exception ex) {
            System.debug('Erro ao enviar e-mail' + ex.getMessage());
        }   
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Batch finalizada com sucesso!');
    }
}