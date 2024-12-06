@isTest
public with sharing class ScheduleSendEmailCaseClosedTest {

    public static String cronExp = '0 0 0 * * ?';

    @isTest
    static void ShouldSendEmailCaseClosed() {

        Test.startTest(); 
            ScheduleSendEmailCaseClosed.scheduleJob();
        Test.stopTest();

		CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE CronExpression =: cronExp LIMIT 1];

        Assert.areEqual(cronExp, ct.CronExpression, 'A expressão cron deve estar configurada para execução diária.');
        Assert.areEqual(0, ct.TimesTriggered, 'Não deve ter sido acionado ainda');
		Assert.isTrue(ct.NextFireTime != null , 'Próximo horário deve estar agendado.');
    }
}