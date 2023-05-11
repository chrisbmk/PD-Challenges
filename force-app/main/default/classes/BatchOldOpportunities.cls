public class BatchOldOpportunities implements Database.Batchable<SObject> {
  public Database.QueryLocator start(Database.BatchableContext bc) {
    String query = 'SELECT Id, StageName, LastReferencedDate FROM Opportunity';
    return Database.getQueryLocator(query);
  }

  public void execute(Database.BatchableContext bc, List<SObject> lSObj) {
    List<Opportunity> oppsToDel = new List<Opportunity>();
    Opportunity oppToDel;

    for (SObject SObj : lSObj) {
      oppToDel = (Opportunity) SObj;

      if ((oppToDel.LastReferencedDate < DateTime.now().addMonths(-6)) &&
        (oppToDel.StageName != 'Closed Won' && oppToDel.StageName != 'Closed Lost')) {
        oppsToDel.add(oppToDel);
      }
    }

    if (!oppsToDel.isEmpty()) {
      delete oppsToDel;
    }
  }

  public void finish(Database.BatchableContext bc) {}
}
