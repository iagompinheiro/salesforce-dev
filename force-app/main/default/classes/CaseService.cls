public with sharing class CaseService {
    public static void sendEmailCase(List<Case> cases) {
        List<Case> casesInsert = new List<Case>();
        List<Messaging.SingleEmailMessage> emailToSend = new List<Messaging.SingleEmailMessage>(); 
        Set<String> typeCase = new Set<String>{'Eletronic', 'Electrical', 'Mechanical'};

        for (Case currentCase : cases) {
            if (typeCase.contains(currentCase.Type)) {
                casesInsert.add(currentCase);

                String subject = 'Caso aberto com sucesso: ' + currentCase.CaseNumber;
                String body = '<html>' +
                              '<body>' +
                              '<p>Estamos entrando em contato para informar que o seu caso com número <strong>' + currentCase.CaseNumber + '</strong> foi registrado com sucesso em nosso sistema.</p>' +
                              '<p>Resumo do Caso:</p>' +
                              '<ul>' +
                              '<li><strong>Assunto:</strong> ' + currentCase.Subject + '</li>' +
                              '<li><strong>Status:</strong> ' + currentCase.Status + '</li>' +
                              '<li><strong>Prioridade:</strong> ' + currentCase.Priority + '</li>' +
                              '<li><strong>Data de Abertura:</strong> ' + currentCase.CreatedDate + '</li>' +
                              '</ul>' +
                              '<p>Estamos trabalhando para resolver a situação o mais rápido possível. Caso precise de mais informações, não hesite em responder este email ou acessar seu painel de atendimento.</p>' +
                              '<p>Atenciosamente,<br/>Equipe de Suporte</p>' +
                              '</body>' +
                              '</html>';

                emailToSend.add(
                    EmailUtils.createEmailMessage(subject, body, currentCase.ContactEmail)
                );
            }
        }

             if (!emailToSend.isEmpty()) {
            Messaging.sendEmail(emailToSend);
        }
    }

    public static void sendEmailCaseClosed(List<Case> cases) { 
        List<Case> caseClosed = new List<Case>(); 
        List<Messaging.SingleEmailMessage> emailToSend = new List<Messaging.SingleEmailMessage>();

        for (Case currentCase : cases) {
            if (currentCase.Status == 'Closed') {
                caseClosed.add(currentCase);

                String subject = 'Seu caso foi fechado!';
                String body = '<html>' +
                              '<body>' +
                              '<p>Estamos entrando em contato para informar que seu caso <strong>' + currentCase.CaseNumber + '</strong> foi encerrado. Esperamos que sua solicitação tenha sido resolvida com sucesso.</p>' + +
                              '<p>Atenciosamente,<br/>Equipe de Suporte</p>' +
                              '</body>' +
                              '</html>';

                emailToSend.add( 
                    EmailUtils.createEmailMessage(subject, body, currentCase.ContactEmail)
                );
            }
        }

        if (!emailToSend.isEmpty()) {
            Messaging.sendEmail(emailToSend);
        }
    }
}