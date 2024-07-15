public with sharing class AccountCalculator {

    // Only Primitive or Collectgion data types can be passed as an argument and other data types are not supported.
    @future
    public static void countContact(List<Id> accIds) {
        List<Account> accList = [SELECT Id,  (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accIds];

        for(Account acc: accList) {
            // Create Number_of_Contacts field in Account object and un-comment the below line to run the code. 
            // Run the code from anonymous window.
            //acc.Number_of_Contacts__c = acc.Contacts.size();
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}