@isTest
public class batchOrdersUnitTests {

    static testMethod  void  testBatchOrder()
    {
        List<CMContact__c> mycontacts = new List<CMContact__c>();
        CMContact__c c = new CMContact__c(name='New Contact');
        insert c;

        List<CMOrders__c> myOrders = new List<CMOrders__c>();
        CMOrders__c o = new CMOrders__c(
            name='Starbucks Coffe Order',
            CMContact__c = c.id
        );
        insert o;

        Test.startTest();
        batchOrders obj = new batchOrders();
        DataBase.executeBatch(obj);
        Test.stopTest();
    }
   
}
