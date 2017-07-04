//
//  RootViewController.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 6/29/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation
import UIKit
class RootViewController: UIViewController,SlidingMenuProtocol {
	@IBOutlet weak var sideMenuView: UIView!
	@IBOutlet weak var homeScreenView: UIView!
	let	baseNavigationViewController = BaseNavigationViewController()

	override func viewDidLoad() {
		super.viewDidLoad()
		baseNavigationViewController.delegate = self.navigationController as? UINavigationControllerDelegate
	}
	
	func showSlidingMenu(){
  		
	}
	
}
