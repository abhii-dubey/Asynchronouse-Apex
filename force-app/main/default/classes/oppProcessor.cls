public with sharing class oppProcessor implements Database.Batchable<sObject>, Database.stateful {
    public integer recordCount = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // Data returned from here will be received in the execute()
        return Database.getQueryLocator([SELECT Id, Name FROM Opportunity]);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList) {
        for(Opportunity opp: oppList) {
            opp.LeadSource = 'Web';
        }

        update oppList;
        recordCount = recordCount + oppList.size();
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('Total Records Processed: ' + recordCount);
    }
}