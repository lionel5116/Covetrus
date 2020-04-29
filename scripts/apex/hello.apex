
//string _myGUID = 'XXXX';
//string myGUID = GuidUtil.NewGuid();
//System.debug('My GUID is ' + myGUID);

EmailUtility em = new EmailUtility();
em.sendMail('lioneljones5116@gmail.com', 'Order Processed',
   'Your order was process with success on '
   + ' great success');
