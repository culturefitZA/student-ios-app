//
//  TimeTableViewController.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/11/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import UIKit

class TimeTablePagingContainerViewController : UIViewController,TimeTablePagingDelegate {
	@IBOutlet weak var dayTitile: UILabel!
	
	//MARK: life cycle methods
	override func viewDidLoad() {
				super.viewDidLoad()
		 // baseNavigationViewController.delegate = self
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	
		if (segue.identifier == TimeTableConstants.SEGUE) {
			  let destinationVc = segue.destination as? TimeTablePagingViewController
			  destinationVc?.setTableDelegate(delegate:self)
		}
		
	}
	
	@IBAction func openSideMenu(_ sender: Any) {
		let	baseNavigationViewController = BaseNavigationViewController()
		baseNavigationViewController.showSlidingMenu()
	}
	
	// MARK: Delegate methods
	func didPageViewControllerWithDayTitle(dayTitle:String) {
	 self.dayTitile.text = dayTitle
	}
	
}
