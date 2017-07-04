//
//  BaseNavigationViewController.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/29/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
	weak var slideMenuDelegate : SlidingMenuProtocol?
	
	override func viewDidLoad()  {
	 super.viewDidLoad()
		
	}
	
	override func didReceiveMemoryWarning() {
	 super.didReceiveMemoryWarning()
	}
	
	override func viewWillAppear(_ animated:Bool){
  super.viewWillAppear(animated)
	}
	
	func showSlidingMenu() -> Void {
		slideMenuDelegate?.showSlidingMenu()
	}
	
}
