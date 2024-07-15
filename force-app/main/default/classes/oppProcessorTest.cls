@isTest
public with sharing class oppProcessorTest {
    @isTest
    private static void testBatchClass() {
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i = 0; i < 200; i++){
            oppList.add(new Opportunity(Name='Test'+i, StageName='Prospecting', CloseDate=System.today()));
        }
        insert oppList;
        Test.startTest();
        oppProcessor opp = new oppProcessor();
        Id batchId = Database.executeBatch(opp, 200);
        Test.stopTest();
        List<Opportunity> updatedOpps = [SELECT Id, LeadSource FROM Opportunity WHERE LeadSource='Web'];
        System.assertEquals(200, updatedOpps.size());
    }
}