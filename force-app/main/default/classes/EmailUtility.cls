public with sharing class EmailUtility {
    public Boolean sendMail(String address, String subject, String body) {
        // Create an email message object
        Boolean sendResult = false;
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                  new Messaging.SingleEmailMessage[] { mail });
        // Call a helper method to inspect the returned results
        sendResult = inspectResults(results);
        return sendResult;
     }
     // Helper method
     private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results. 
        // In this class, the methods send only one email, 
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
           if (res.isSuccess()) {
              System.debug('Email sent successfully');
           }
           else {
              sendResult = false;
              System.debug('The following errors occurred: ' + res.getErrors());                 
           }
        }
        return sendResult;
     }
}
