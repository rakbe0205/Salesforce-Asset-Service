public with sharing class AssetController {

    @AuraEnabled
    public static Asset_Assignment__c assignAsset(

        Id employeeId,
        Id assetId,
        Date assignedDate,
        Date expectedReturnDate

    ) {

        return AssetService.assignAsset(

            employeeId,
            assetId,
            assignedDate,
            expectedReturnDate

        );

    }

}