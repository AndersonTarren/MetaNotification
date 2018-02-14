/**
 * Created by tarren.anderson on 2/9/18.
 */
({
    doInit : function(component, event, helper){

        var action = component.get("c.getNotificationApex");
        var notificationName = component.get('v.notificationName');
        if(notificationName.length){
            action.setParams({ metaName : component.get("v.notificationName")});
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log('State : ' + state);
                console.log("From server: " + response.getReturnValue());
                component.set('v.notificationText', response.getReturnValue());
            });
            $A.enqueueAction(action);
        }
    }

})