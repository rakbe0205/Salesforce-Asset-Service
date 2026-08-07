trigger AssetTrigger on Asset_Assignment__c (after insert) {

    AssetTriggerHandler.afterInsert(

        Trigger.new

    );

}