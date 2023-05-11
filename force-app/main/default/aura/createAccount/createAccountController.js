({
  doInit: function(component, event, helper) {
    component.set("v.columns", [
      {label: "Account Name", fieldName: "Name", type: "text"},
      {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"},
      {label: "Industry", fieldName: "Industry", type: "text"}
    ]);
    helper.fetchAccounts(component);
  },

  handleSuccess: function(component, event, helper) {
    component.find("notifLib").showToast({
      "variant": "success",
      "title": "Success",
      "message": "Account was successfully created"
    });
    helper.fetchAccounts(component);
  }
})
