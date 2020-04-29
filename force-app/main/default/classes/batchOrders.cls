global class batchOrders implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        String query = 'SELECT Order_ID__c,Product_Description__c,Product_Type__c,Quantity__c,Shipped_Date__c FROM CMOrderDetails__c';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<CMOrderDetails__c> orderDetailsList) {
       
        // process each batch of records
        for(CMOrderDetails__c orders : orderDetailsList)
        {        
            List<BatchTable__c> myBatch = new List<BatchTable__c>();
            BatchTable__c b = new BatchTable__c(
                BatchDate__c= Date.Today(),
                Order_ID__c = orders.Order_ID__c,
                Product_Description__c = orders.Product_Description__c
                );
            insert b;
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
        try {
            EmailUtility em = new EmailUtility();
            em.sendMail('lioneljones5116@gmail.com', 'Batch Order Process complete' ,
            'Batch Order Process was completed on ' + Date.Today());
        
        } 
        catch(Exception e) {
            System.debug(e);
        }
  }
}
