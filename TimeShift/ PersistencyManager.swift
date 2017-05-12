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
    
    func getUserAuthDetails() -> UsserViewModel  {
        return _userViewModel
    }
}
