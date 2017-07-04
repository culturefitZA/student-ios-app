//
//  TimeTableViewController.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/11/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import UIKit
class TimeTableViewController: UITableViewController {
	
	private var periodViewModels = [PeriodViewModel]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.tag = (periodViewModels[0].getViewTag())
		//self.view.backgroundColor = periodViewModels[0].getBackGroundColor()
		
		self.tableView.register(UINib(nibName: "PeriodCell", bundle: nil), forCellReuseIdentifier: "PeriodCell")
	}
	
	func setPeriodViewModel(viewModel:[PeriodViewModel]){
	 self.periodViewModels = viewModel
	}
	
 func getModel() -> [PeriodViewModel] {
	return periodViewModels
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (periodViewModels.count)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let classId = periodViewModels[indexPath.row].courseId
		
		let periodCell = tableView.dequeueReusableCell(withIdentifier: "PeriodCell", for:indexPath as IndexPath) as! PeriodCell
		
	 let	startTime = Date(fromString: periodViewModels[indexPath.row].startDateTime, format: .isoDateTimeSec)
		
		let endTime =  Date(fromString: periodViewModels[indexPath.row].endDateTime, format: .isoDateTimeSec)
		
		periodCell.periodStartTimeLabel.text = startTime?.toString(dateStyle: .none, timeStyle: .short)
		
		periodCell.periodEndTimeLabel.text = endTime?.toString(dateStyle: .none, timeStyle: .short)
		periodCell.periodNameButton.setTitle(classId, for: .normal)
		
		return periodCell
	}
	
}
