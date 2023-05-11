public class AccountController {
  @AuraEnabled
  public static List<Account> retrieveAccounts() {
    return [SELECT Id, Name, AnnualRevenue, Industry FROM Account];
  }
}
