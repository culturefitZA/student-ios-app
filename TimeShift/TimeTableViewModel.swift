//
//  TimeTableViewModel.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/11/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation
import UIKit

class TimeTableViewModel {
	
	var timeTables : PeriodBase
	var _tableViewControllers  =  [TimeTableViewController]()
	
	private var timeTableDay : Any?
	
	private var modayDays : [Monday]?
	private var tuesdayDays : [Tuesday]?
	private var wednesdayDays : [Wednesday]?
	private var thursdayDays : [Thursday]?
	private var fridayDays : [Friday]?
	
	
	func getDayViewControllerGenericList(viewControllerDayIndex:Int,_day:Any) -> TimeTableViewController {
		
		var periodViewModel = PeriodViewModel(_roomId: "", _lecturers: "", _userId: "", _courseId: "", _startDateTime: "", _scheduleId: "", _buildingId: "", _classDescription: "", _endDateTime: "")
		
		var _periodViewModel = [PeriodViewModel]()
		
		let timeTableStoryBoad = UIStoryboard(name: TimeTableConstants.STORYBOARD_IDENTIFIER, bundle: nil) .
			instantiateViewController(withIdentifier:TimeTableConstants.STORYBOARD_IDENTIFIER) as! TimeTableViewController
		
		for day in getDayType(dayTypeIndex:viewControllerDayIndex,day:_day) {
			periodViewModel = getViewModel(roomId: (day as AnyObject).roomId, lecturers: (day as AnyObject).lecturers, userId: (day as AnyObject).userId, courseId: (day as AnyObject).courseId, startDateTime: (day as AnyObject).startDateTime, scheduleId: (day as AnyObject).scheduleId, buildingId: (day as AnyObject).buildingId, classDescription: (day as AnyObject).description, endDateTime: (day as AnyObject).endDateTime)
			
			periodViewModel.setDayTitle(_dayTitle: getDayTitle(dayIndex: viewControllerDayIndex))
			periodViewModel.setViewTag(_viewTag: viewControllerDayIndex)
			
			_periodViewModel.append(periodViewModel)
		}
		
		timeTableStoryBoad.setPeriodViewModel(viewModel:_periodViewModel)
		return timeTableStoryBoad
	}
	
	//MARK: days switch helper methods
	
	func getDayType(dayTypeIndex:Int,day:Any)-> [Any]{
		
		switch dayTypeIndex {
		case INDEX_ZERO:
			return (day as? [Monday])!
		case INDEX_ONE:
			return (day as? [Tuesday])!
		case INDEX_TWO:
			return (day as? [Wednesday])!
		case INDEX_THREE:
			return (day as? [Thursday])!
		case INDEX_FOUR:
			return (day as? [Friday])!
		default:
			return (day as? [Monday])!
		}
		
	}
	
	func getDayTitle(dayIndex:Int) -> String{
		
		switch dayIndex {
		case INDEX_ZERO:
			return TimeTableConstants.MONDAY
		case INDEX_ONE:
			return TimeTableConstants.TUESDAY
		case INDEX_TWO:
			return TimeTableConstants.WEDNESDAY
		case INDEX_THREE:
			return TimeTableConstants.THURSDAY
		case INDEX_FOUR:
			return TimeTableConstants.FRIDAY
		default:
			return TimeTableConstants.MONDAY
		}
	}
	
	//MARK: view controller helper methods

	func newTimeTableViewController(periodDay:Any,arrayVcIndex:Int) -> TimeTableViewController {
		
		return  getDayViewControllerGenericList(viewControllerDayIndex: arrayVcIndex, _day:periodDay)
		
	}
	
	func convertToDictionary(text: String) -> [String: Any]? {
		if let data = text.data(using: .utf8) {
			do {
				return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
			} catch {
				print(error.localizedDescription)
			}
		}
		return nil
	}
	
	func getTableViewControllers() -> [TimeTableViewController] {
	 return _tableViewControllers
	}
	
	init(_timeTableClass:PeriodBase) {
		self.timeTables = _timeTableClass
		
		if case self.timeTables = _timeTableClass {
			self.timeTables = _timeTableClass
			_tableViewControllers =  [TimeTableViewController]()
			
			if let _classes = self.timeTables.classes{
				
				if 	let periods = _classes[0] as? Classes {
					
					_tableViewControllers.append(newTimeTableViewController(periodDay:periods.monday
						,arrayVcIndex: INDEX_ZERO))
					
					_tableViewControllers.append(newTimeTableViewController(periodDay:periods.tuesday
						,arrayVcIndex: INDEX_ONE))
					
					_tableViewControllers.append(newTimeTableViewController(periodDay:periods.wednesday
						,arrayVcIndex: INDEX_TWO))
					
					_tableViewControllers.append(newTimeTableViewController(periodDay:periods.thursday
						,arrayVcIndex: INDEX_THREE))
					
					_tableViewControllers.append(newTimeTableViewController(periodDay:periods.friday
						,arrayVcIndex: INDEX_FOUR))
				}
			}
		}
	}
	
	func getViewModel(roomId:String,lecturers:String,userId:String,courseId:String,startDateTime:String,scheduleId:String,buildingId:String,classDescription:String,endDateTime:String) -> PeriodViewModel{
		
		let periodViewModel = PeriodViewModel(_roomId: roomId, _lecturers: lecturers, _userId: userId, _courseId: courseId, _startDateTime: startDateTime, _scheduleId: scheduleId, _buildingId: buildingId, _classDescription: classDescription, _endDateTime: endDateTime)
		return periodViewModel
	}
	
}
