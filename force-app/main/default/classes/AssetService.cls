public with sharing class AssetService {

    public static Asset_Assignment__c assignAsset(
        Id employeeId,
        Id assetId,
        Date assignedDate,
        Date expectedReturnDate
    ) {

        Asset__c asset = [
            SELECT Id, Status__c
            FROM Asset__c
            WHERE Id = :assetId
            LIMIT 1
        ];

        if (asset.Status__c != 'Available') {
            throw new AuraHandledException('Asset is already assigned.');
        }

        Asset_Assignment__c assignment = new Asset_Assignment__c();

        assignment.Employee__c = employeeId;
        assignment.Asset__c = assetId;
        assignment.Assigned_Date__c = assignedDate;
        assignment.Expected_Return_Date__c = expectedReturnDate;
        assignment.Status__c = 'Assigned';

        insert assignment;

        asset.Status__c = 'Assigned';
        update asset;

        return assignment;
    }

}