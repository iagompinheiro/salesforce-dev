@isTest
public with sharing class CaseTriggerHandlerTest {
    @isTest
    static void shouldSendEmail() {
        Contact contact = new Contact(
            LastName = 'Test', 
            Email = 'test@example.com'
        );
        insert contact; 

        Case currentCase = new Case(
            ContactId = contact.Id, 
            Type = 'Mechanical', 
            Subject = 'Suporte ao produto', 
            Status = 'New', 
            Priority = 'High', 
            Origin = 'Email'
        ); 

        Test.startTest(); 
        insert currentCase; 
        Test.stopTest();
    }
}