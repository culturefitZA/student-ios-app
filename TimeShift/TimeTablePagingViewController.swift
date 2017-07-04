//
//  TablePagingViewController.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/11/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import UIKit

class TimeTablePagingViewController : UIPageViewController{
	
	private var persistencyManager = PersistencyManager()
	weak var tableDelegate : TimeTablePagingDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		dataSource = self
		setViewControllers([LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers().first!],
		                   direction: .forward,
		                   animated: true,
		                   completion: nil)
		self.delegate = self
		tableDelegate?.didPageViewControllerWithDayTitle(dayTitle:LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers()[0].getModel()[0].getDayTitle())
	}
	
	public func setTableDelegate(delegate:TimeTablePagingDelegate) {
		self.tableDelegate = delegate
	}
}

extension TimeTablePagingViewController: UIPageViewControllerDataSource,UIPageViewControllerDelegate {
	
	
	func pageViewController(_ viewControllerBeforepageViewController: UIPageViewController,
	                        viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers().index(of: viewController as! TimeTableViewController) else {
			return nil
		}
		
		let previousIndex = viewControllerIndex - 1
		

		guard previousIndex >= 0 else {
			return nil
		}
		
		guard LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers().count > previousIndex else {
			return nil
		}
		
		return LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers()[previousIndex]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController,
	                        viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers().index(of: viewController as! TimeTableViewController) else {
			return nil
		}
		
		let nextIndex = viewControllerIndex + 1
	
		
		let orderedViewControllersCount = LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers().count
		
		guard orderedViewControllersCount != nextIndex else {
			return nil
		}
		
		guard orderedViewControllersCount > nextIndex else {
			return nil
		}
		
		return LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers()[nextIndex]	}
	
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		
		if (finished) {
			let index =  pageViewController.viewControllers!.first!.view.tag
				
			tableDelegate?.didPageViewControllerWithDayTitle(dayTitle:LibraryAPI.sharedInstance.getPersistanceManager()._timeTableViewModel.getTableViewControllers()[index].getModel()[0].getDayTitle())
	
		}

	}
	
}
