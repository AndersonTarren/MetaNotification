/**
 * Created by tarren.anderson on 2/9/18.
 */

public with sharing class MetaNotificationController {

	@AuraEnabled
	public static String getNotificationApex(String metaName){

		for(Notification__mdt n : [SELECT Content__c FROM Notification__mdt WHERE Label =: metaName LIMIT 1]){
			//Can't filter Content__c in query, so check value after. (Meta limitation)
			if(n.Content__c != null){
				return n.Content__c;
			}
		}
		return null;
	}
}