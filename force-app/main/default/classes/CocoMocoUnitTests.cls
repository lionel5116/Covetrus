@isTest
private class CocoMocoUnitTests {
  @isTest static void testForUniquGuid30Characters()
  {
    Test.startTest();
    string myGUID = GuidUtil.NewGuid().substring(0,30);
    Integer  guidLength = 0;
    guidLength = myGUID.length();
    Test.stopTest();
    System.assertEquals(30,guidLength ,'Was Expectin a GUID of 30 characters');
  }

  @isTest static void testCanCreateContact()
  {
      //brute force
      List<CMContact__c> mycontacts = new List<CMContact__c>();
      CMContact__c c = new CMContact__c(name='New Contact');
      insert c;
      Test.startTest();
      mycontacts = [SELECT Id FROM CMContact__c];
      Test.stopTest();
      System.assert(mycontacts.size() > 0, 'Was expecting to find at least one contact');

  }

  @isTest static void testAddContactWithOrder()
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
    myOrders = [SELECT Id FROM CMOrders__c];
    Test.stopTest();
    System.assert(myOrders.size() > 0, 'Was expecting to find at least one order');

  }

}
