@IsTest
private class MetaNotificationControllerTest {

	//We have to do some interesting things here since we can't insert meta records at this time...
	private static testMethod void testGetNotificationApex(){

		//Need to find existing org data to test with (test meta queries can see all data, even without @SeeAllData).
		String testLabel = null;
		String testValue = null;
		for(Notification__mdt n : [SELECT Label, Content__c FROM Notification__mdt LIMIT 10]) {
			//Can't filter meta query on content__c != null, check after.
			if(n.Content__c != null){
				testLabel = n.Label;
				testValue = n.Content__c;
			}
		}

		//If test data found, proceed.
		if(testLabel != null){
			//Positive result
			System.assertEquals(testValue, MetaNotificationController.getNotificationApex(testLabel));
			//Negative result
			System.assertEquals(null, MetaNotificationController.getNotificationApex('faketestlabel999'));
		}
	}
}