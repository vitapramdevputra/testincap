@isTest
public class testViewAccountOpportunityController {
    //test delete opp correct scenario.
    static testMethod void testAccountOpportunity_1(){
        
        Account a = new Account();
        a.Name='Test';
        insert a;
        
        
        Opportunity op = new Opportunity();
        op.Name = 'test opp';
        op.AccountId = a.id;
        op.CloseDate = date.today();
        op.stagename = 'Qualification';
        insert op;
        
        Opportunity op2 = new Opportunity();
        op2.Name = 'test opp2';
        op2.AccountId = a.id;
        op2.CloseDate = date.today();
        op2.stagename = 'Qualification';
        insert op2;
        ApexPages.StandardController stdController = new ApexPages.StandardController(a);
        
        ApexPages.currentPage().getParameters().put('id',a.Id);
        
        ViewAccountsOpportunityController vp = new ViewAccountsOpportunityController(stdController);
        
        vp.OpportunityID = op2.Id;
        vp.DeleteOpp();
		system.assertEquals(vp.AccOpps.size(), 1);
    }
    //**later** added this test case later
    //to test failure scenario where id is not mentioned.
    static testMethod void testAccountOpportunity_2(){
        
        Account a = new Account();
        a.Name='Test';
        insert a;
        
        
        Opportunity op = new Opportunity();
        op.Name = 'test opp';
        op.AccountId = a.id;
        op.CloseDate = date.today();
        op.stagename = 'Qualification';
        insert op;

        Opportunity op2 = new Opportunity();
        op2.Name = 'test opp2';
        op2.AccountId = a.id;
        op2.CloseDate = date.today();
        op2.stagename = 'Qualification';
        insert op2;

        ApexPages.currentPage().getParameters().put('id',a.Id);
        ApexPages.StandardController stdController = new ApexPages.StandardController(a);
        
        ViewAccountsOpportunityController vp = new ViewAccountsOpportunityController(stdController);
        vp.DeleteOpp();
		system.assertEquals(vp.AccOpps.size(), 2);
    }
}