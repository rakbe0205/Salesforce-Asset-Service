@isTest
private class AssetServiceTest {

    @isTest
    static void testAssignAsset() {

        Employee__c emp = new Employee__c(
            Name = 'John'
        );
        insert emp;

       Asset__c asset = new Asset__c(
    Name = 'Dell Laptop',
    Status__c = 'Available'
);
        insert asset;

        Test.startTest();

        Asset_Assignment__c assignment =
            AssetService.assignAsset(

                emp.Id,
                asset.Id,
                Date.today(),
                Date.today().addDays(30)

            );

        Test.stopTest();

        System.assertNotEquals(
            null,
            assignment.Id
        );

    }

}