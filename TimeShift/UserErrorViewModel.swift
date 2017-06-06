//
//  UserErrorViewModel.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/6/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

class UserErrorViewModel {
	
private var userError: UserError?

var status:String?{
	return userError?.status
}

var errorMessage:String? {
	return userError?.errorMessage
}

var tag:String? {
	return userError?.tag
}

init (userError: UserError) {
	self.userError = userError
	}
}
