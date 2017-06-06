//
//   PersistencyManager.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 4/22/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

class PersistencyManager : NSObject{
   
    var _userViewModel = UsserViewModel(usser: Usser(userName:"", passWord:"",loginStatus:""))
    var _userErrorViewModel = UserErrorViewModel(userError: UserError(_status: "", _errorMessage:"", _tag: ""))
	
		func getUserError() -> UserErrorViewModel {
			return _userErrorViewModel
	  }
    func getUserAuthDetails() -> UsserViewModel  {
        return _userViewModel
    }
}
