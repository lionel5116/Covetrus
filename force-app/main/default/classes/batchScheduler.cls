global class batchScheduler implements schedulable{
    global void execute(SchedulableContext sc)
    {
        batchOrders b = new batchOrders();
       database.executebatch(b);
    }
}
