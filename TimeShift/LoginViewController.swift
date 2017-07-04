//
//  LoginViewController.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 4/19/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.

import Foundation
import UIKit

class LoginViewController: UIViewController,LibraryAPIDelegate{
	
	@IBOutlet var loginOutlets: LoginViewControllerIBOutlets!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.hideKeyboardOnTap()
		LibraryAPI.sharedInstance.httpDelegate = self
		LibraryAPI.sharedInstance.getTimeTable()
	}
	
	func didAuthenticateLearner(isAuthentic:Bool){
		if (isAuthentic) {
			self.performSegue(withIdentifier:LoginConstants.timeTableSegue, sender: self)
		}else {
			LoadingIndicator.sharedInstance.stopLoadingIndicator(parentView:self.view)
		}
	}
 
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func SignInAction(_ sender: Any) {
		LibraryAPI.sharedInstance.authenticateLearner(
			learnerUsername:loginOutlets.username.text!,
			learnerPassword:loginOutlets.password.text!)
		LoadingIndicator.sharedInstance.startLoadingIndicator(parentView: self.view)
	}
	
	@IBAction func signUpAction(_ sender: Any) {
	}
	
	@IBAction func forgotPasswordAction(_ sender: Any) {
	}
}

extension LoginViewController {
	
	func hideKeyboardOnTap() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	func dismissKeyboard() {
		view.endEditing(true)
	}
}
