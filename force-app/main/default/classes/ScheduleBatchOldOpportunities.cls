public class ScheduleBatchOldOpportunities implements Schedulable {
  public static String scheSat2am = '0 00 02 ? * 7';  // every Saturday at 2AM

  public void execute(SchedulableContext sc) {
    BatchOldOpportunities batch = new BatchOldOpportunities();

    Database.executeBatch(batch);
  }

  public static String scheMeSat2Am() {
    ScheduleBatchOldOpportunities sboo = new ScheduleBatchOldOpportunities();
    return System.schedule('Remove Old Opportunities -- Saturday 2AM', scheSat2am, sboo);
  }
}
