trigger updateGuidFieldForProducts on Products__c (before insert) {
    for (Products__c obj: trigger.new)
    {
        string myGUID = GuidUtil.NewGuid().substring(0,30);
        obj.Product_GUID__c = myGUID;
    }

}