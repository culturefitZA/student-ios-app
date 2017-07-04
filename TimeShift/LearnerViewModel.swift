//
//  LearnerViewModel.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/10/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

class LearnerViewModel {
	
	private var learner: Learner?
	
	var displayNameTest:String?{
		return learner?.displayname
	}
	
	var emailText:String? {
		return learner?.mail
	}
	
	var commonNameText:String? {
		return learner?.commonname
	}
	
	var surnameText:String?{
	 return learner?.surname
	}
	
	var titleText:String?{
	return learner?.title
	}
	
	init (learner: Learner) {
		self.learner = learner
	}
}
