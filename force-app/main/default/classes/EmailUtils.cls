public with sharing class EmailUtils {
    public static Messaging.SingleEmailMessage createEmailMessage(String subject, String body, String toAddress) {
         Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 
         email.setSubject(subject);
         email.setHtmlBody(body);
         email.setToAddresses(new String[] { toAddress});

         return email; 

    }
}