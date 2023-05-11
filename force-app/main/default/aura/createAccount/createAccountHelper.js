({
  fetchAccounts: function(component) {
    let action = component.get("c.retrieveAccounts");
    action.setCallback(this, function(response) {
      let state = response.getState();
      
      if (state === "SUCCESS") {
        let responseVal = response.getReturnValue();
        component.set("v.data", responseVal);
      }
    });
    $A.enqueueAction(action);
  }
})
