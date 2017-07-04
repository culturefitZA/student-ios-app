//
//  HTTPClient.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 4/22/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class HTTPClient : NSObject{
	
	var url : String = "http://softwaregon-candella.rhcloud.com/rest/"
	var request : NSMutableURLRequest = NSMutableURLRequest()
	private var persistencyManager = PersistencyManager()
	
	func getDataBaseRef(tablePath:String) -> FIRDatabaseReference{
		var dataBaseRef:FIRDatabaseReference
		dataBaseRef = FIRDatabase.database().reference(withPath:tablePath)
		return dataBaseRef
	}
	
	func authenticateLearner(username:String,password:String){
		
		var isUserAuthentic = false
		
		getDataBaseRef(tablePath:"credentials").observe(.value, with: { snapshot in
			let credentialsBase = CredentialsBase.init(dictionary: snapshot.value as! Dictionary)
			
			for credential in (credentialsBase?.learnerCredentials)! {
				let leanerCredentials =  credential as? LearnerCredentials
				
				if (leanerCredentials?.email == username && leanerCredentials?.password == password){
					isUserAuthentic = true
				}
			}
			LibraryAPI.sharedInstance.getAuthToken(isAuthentic:isUserAuthentic)
		})
	}
	
	func getTimeTable(){
		
		getDataBaseRef(tablePath:"timetable").observe(.value, with: { snapshot in
			let timeTableBase = PeriodBase.init(dictionary: snapshot.value as? [AnyHashable : Any])
			LibraryAPI.sharedInstance.setTimeTableViewModel(viewModel:TimeTableViewModel(_timeTableClass:timeTableBase!))
		})
	}
}
