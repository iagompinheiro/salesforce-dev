@istest
public with sharing class SendEmailClosedCaseBatchTest {
    
    @isTest
    static void ShouldSendEmailClosedCase() {
        Contact contactTest = new Contact(
            LastName = 'test', 
            Email = 'test@example.com'
        );
        insert contactTest; 

        Case testCase = new Case(
            ContactId = contactTest.Id, 
            Status = 'Closed', 
            Priority = 'High',
            Subject = 'Suporte ao produto',
            Origin = 'Web',
            Type = 'Mechanical'
        );
        insert testCase; 

        Test.startTest();
        Database.executeBatch(new SendEmailClosedCaseBatch());
        Test.stopTest();
    
    }
}