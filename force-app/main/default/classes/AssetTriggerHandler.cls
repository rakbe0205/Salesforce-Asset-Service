public with sharing class AssetTriggerHandler {

    public static void afterInsert(

        List<Asset_Assignment__c> assignments

    ) {

        List<Asset__c> assetsToUpdate = new List<Asset__c>();

        for (Asset_Assignment__c assignment : assignments) {

            assetsToUpdate.add(

                new Asset__c(

                    Id = assignment.Asset__c,

                    Status__c = 'Assigned'

                )

            );

        }

        if (!assetsToUpdate.isEmpty()) {

            update assetsToUpdate;

        }

    }

}