//
//  LibraryAPI.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 4/22/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

class LibraryAPI {
	
	private let httpClient: HTTPClient
	private let isOnline: Bool
	public weak var httpDelegate  : LibraryAPIDelegate?
	private var persistencyManager: PersistencyManager
	
	class var sharedInstance: LibraryAPI {
		struct Singleton {
			static let instance = LibraryAPI()
		}
		return Singleton.instance
	}
	
	init() {
		persistencyManager = PersistencyManager()
		httpClient = HTTPClient()
		isOnline = false
	}
	
	func authenticateLearner(learnerUsername:String,learnerPassword:String){
		if (learnerUsername != "" && learnerPassword != "" ){
			httpClient.authenticateLearner(username:learnerUsername,password:learnerPassword)
		}
	}
	
	func  getAuthToken(isAuthentic:Bool){
		if (isAuthentic) {
			httpDelegate?.didAuthenticateLearner(isAuthentic:true)
		} else {
			httpDelegate?.didAuthenticateLearner(isAuthentic:false)
		}
	}
	
	func getTimeTable(){
		httpClient.getTimeTable()
	}
	
	func setTimeTableViewModel(viewModel:TimeTableViewModel){
		persistencyManager._timeTableViewModel = viewModel
	}
	
	func getPersistanceManager () -> PersistencyManager {
	 return persistencyManager
	}
}


