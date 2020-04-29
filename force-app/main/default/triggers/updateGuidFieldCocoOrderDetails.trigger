trigger updateGuidFieldCocoOrderDetails on CMOrderDetails__c (before insert) {
    for (CMOrderDetails__c obj: trigger.new)
    {
        string myGUID = GuidUtil.NewGuid().substring(0,30);
        obj.Product_GUID__c = myGUID;
    }

}