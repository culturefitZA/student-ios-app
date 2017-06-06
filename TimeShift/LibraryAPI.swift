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
    
    func authenticateUser(username:String,password:String){
        if (username != "" && password != "" ){
            httpClient.authenticateUser(method:"doStudentLogin?", params:"student_user_name="+username+"&student_pass="+password)
        }
    }
    
    func setUserViewModel(userViewModel:UsserViewModel){
        persistencyManager._userViewModel = userViewModel
        httpDelegate?.didSetUser(sender: self,viewModel:userViewModel)
    }
	
	  func setErrorViewModel(errorViewmodel:UserErrorViewModel){
	      persistencyManager._userErrorViewModel = errorViewmodel
			  httpDelegate?.didRecieveError(sender: self, errorModel: errorViewmodel)
	  }
	
    func getUserAuth() -> UsserViewModel {
       return persistencyManager.getUserAuthDetails()
    }
}


