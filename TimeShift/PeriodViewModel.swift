//
//  PeriodViewModel.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/22/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation
import UIKit

class PeriodViewModel {

 var roomId : String
 var lecturers: String
 var userId: String
 var courseId: String
	var startDateTime: String
	var scheduleId: String
 var buildingId: String
	var classDescription: String
	var endDateTime: String
	
	private var viewTag : Int?
	private var dayTitle : String?
	private var viewBackGroundColor : UIColor?

	init(_roomId:String,_lecturers:String,_userId:String,_courseId:String,_startDateTime:String,_scheduleId:String,_buildingId:String,_classDescription:String,_endDateTime:String) {
		
		self.roomId = _roomId
		self.lecturers = _lecturers
		self.userId = _userId
		self.courseId = _courseId
		self.startDateTime = _startDateTime
		self.endDateTime = _endDateTime
		self.scheduleId = _scheduleId
		self.buildingId = _buildingId
		self.classDescription = _classDescription
		self.endDateTime = _endDateTime

	}
	
	func setDayTitle(_dayTitle:String){
	self.dayTitle = _dayTitle
	}
	
	func setViewTag(_viewTag:Int) {
	self.viewTag = _viewTag
	}
	
	func setBackColor(_backColor:UIColor){
	self.viewBackGroundColor = _backColor
	}
	
	func getDayTitle() -> String {
	 return dayTitle!
	}
	
	func getViewTag() -> Int{
	 return viewTag!
	}
	
	func getBackGroundColor() -> UIColor {
	 return viewBackGroundColor!
	}
}
