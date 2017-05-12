//
//  User.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 4/19/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

class Usser {
    
    var userName : String?
    var passWord : String?
    var loginStatus : String?
    
    init (userName:String,passWord:String,loginStatus:String) {
        self.passWord = passWord
        self.userName = userName
        self.loginStatus = loginStatus
    }
    
}
