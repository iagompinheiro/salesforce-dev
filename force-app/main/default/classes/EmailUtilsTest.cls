@isTest
public with sharing class EmailUtilsTest {
    @isTest
    static void sendEmail() {
        String subject = 'Subject';
        String body = 'Body'; 
        String toAddress = 'toAddress'; 

        Test.startTest();
        Messaging.SingleEmailMessage email = EmailUtils.createEmailMessage(subject, body, toAddress);
        Test.stopTest();

        System.assertNotEquals(null, email, 'O e-mail deve ser criado');
        System.assertEquals(subject, email.getSubject(), 'Assunto do E-mail' + subject);
        System.assertEquals(body, email.getHtmlBody(), 'Corpo do e-mail ' + body);
        System.assertEquals(1, email.getToAddresses().size(), 'Deve conter um destinatário para o e-mail'); 
        System.assertEquals(toAddress, email.getToAddresses()[0], 'O destinatário deve corresponder ao toAdrress');


    }
}