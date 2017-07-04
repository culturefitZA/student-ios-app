//
//  TimeTablePagingProtocol.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/21/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

protocol  TimeTablePagingDelegate : class {
	func didPageViewControllerWithDayTitle(dayTitle:String)
}
