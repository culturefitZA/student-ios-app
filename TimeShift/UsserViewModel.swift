//
//  UserViewModel.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 4/19/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

class UsserViewModel {
    
    private var usser: Usser?
    
    var userNameText:String?{
        return usser?.userName
    }
    
    var passwordText:String? {
        return usser?.passWord
    }
    
    var loginStatusText:String? {
        return usser?.loginStatus
    }
    
    init (usser: Usser) {
       self.usser = usser
    }
    
}
