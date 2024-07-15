@isTest
public with sharing class updateParentTest {
    @TestSetup
    static void makeData(){
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name='Parent'));
        for(Integer i=0; i< 100; i++){
            accList.add(new Account(Name='Demo'+i));
        }
        insert accList;
    }
    @isTest
    public static void testQueueable() {
        Id parentId = [SELECT Id FROM Account WHERE Name='Parent'][0].Id;
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Name Like 'Demo%'];
        updateParent upd = new updateParent(accList, parentId);
        Test.startTest();
        Id jobId = System.enqueueJob(upd);
        Test.stopTest();

        System.assertEquals(100, [SELECT count() FROM Account WHERE ParentId =: parentId]);

    }
}