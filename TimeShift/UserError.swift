//
//  File.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/6/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

class UserError {
	
	var status : String?
	var errorMessage : String?
	var tag : String?
	
	init (_status:String,_errorMessage:String,_tag:String) {
		self.status = _status
		self.errorMessage = _errorMessage
		self.tag = _tag
	}
}
