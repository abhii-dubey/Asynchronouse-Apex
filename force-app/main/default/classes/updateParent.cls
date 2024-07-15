public with sharing class updateParent implements Queueable {
    private List<Account> accList;
    private Id parentAccId;
    public updateParent(List<Account> accRecords, Id id){
        this.accList = accRecords;
        this.parentAccId = id;
    }
    public void execute(QueueableContext context) {
        for(Account acc: accList) {
            acc.ParentId = parentAccId;
        }
        update accList;

        // Chaining of Job => Queue another job (class that implements Queueable interface);
        // System.enqueueJob(new firstJob());
    }
}