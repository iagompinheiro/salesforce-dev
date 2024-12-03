public with sharing class EmailUtils {
    public static void sendEmail(List<Opportunity> opps) {
         List<Messaging.SingleEmailMessage> emailMessages = new List<Messaging.SingleEmailMessage>();
 
         for (Opportunity opportunity : opps) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[] {opportunity.Account.Email__c};
                email.setToAddresses(toAddress);
                String subject = 'Parabéns pelo Fechamento da Oportunidade: ' + opportunity.Name; 
                email.setSubject(subject);
    
                String body = 'Prezado(a) ' + opportunity.Account.Name + ',<br><br>' +
                              'Estamos muito felizes em informar que sua oportunidade foi fechada com sucesso!<br><br>' +
                              '<strong>Detalhes da Oportunidade:</strong><br>' +
                              '<strong>Nome da Oportunidade:</strong> ' + opportunity.Name + '<br>' +
                              '<strong>Valor:</strong> R$' + opportunity.Amount + '<br>' +
                              '<strong>Data de Fechamento:</strong> ' + opportunity.CloseDate.format() + '<br><br>' +
                              'Agradecemos pela sua confiança em nossa empresa e esperamos continuar apoiando seu sucesso no futuro.<br><br>' +
                              'Atenciosamente,<br>Equipe da Sua Empresa';
    
                email.setHtmlBody(body);
                emailMessages.add(email);
            
         }
 
         if (!emailMessages.isEmpty()) {
             Messaging.sendEmail(emailMessages);
         }
    }

    public static void sendEmailCase(List<Case> cases) {
        List<Messaging.SingleEmailMessage> emailMessage = new List<Messaging.SingleEmailMessage>();

        for (Case c : cases) {
            Messaging.SingleEmailMessage email =  new Messaging.SingleEmailMessage(); 

            String [] toAddress = new String[] {c.ContactEmail};
            email.setToAddresses(toAddress);
            String subject = 'Caso: ' + c.CaseNumber;
            email.setSubject(subject);

            String body = 
            '<html>' +
            '<body>' +
            '<p>Estamos entrando em contato para informar que o seu caso com número <strong>' + c.CaseNumber + '</strong> foi registrado com sucesso em nosso sistema.</p>' +
            '<p>Resumo do Caso:</p>' +
            '<ul>' +
            '<li><strong>Assunto:</strong> ' + c.Subject + '</li>' +
            '<li><strong>Status:</strong> ' + c.Status + '</li>' +
            '<li><strong>Prioridade:</strong> ' + c.Priority + '</li>' +
            '<li><strong>Data de Abertura:</strong> ' + c.CreatedDate + '</li>' +
            '</ul>' +
            '<p>Estamos trabalhando para resolver a situação o mais rápido possível. Caso precise de mais informações, não hesite em responder este email ou acessar seu painel de atendimento.</p>' +
            '<p>Atenciosamente,<br/>Equipe de Suporte</p>' +
            '</body>' +
            '</html>';
            email.setHtmlBody(body);

            emailMessage.add(email);

            }
            if (!emailMessage.isEmpty()) {
                Messaging.SendEmail(emailMessage);
            }
        }
    }