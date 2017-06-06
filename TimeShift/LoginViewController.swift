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
    var loginViewModel = UsserViewModel(usser:Usser(userName: "", passWord: "",loginStatus:""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        LibraryAPI.sharedInstance.httpDelegate = self
    }
    
    func didSetUser(sender: LibraryAPI,viewModel : UsserViewModel){
     checkIFLoginSucceeded(loginStatus:viewModel.loginStatusText!,
                           viewModel:viewModel)
    }
	
	  func didRecieveError(sender:LibraryAPI,errorModel:UserErrorViewModel){
			if(errorModel.tag == LoginConstants.failure){
				LoadingIndicator.sharedInstance.stopLoadingIndicator(parentView:self.view)
				self.performSegue(withIdentifier:LoginConstants.timeTableSegue, sender: self)
			}
	  }
	
    func checkIFLoginSucceeded(loginStatus:String,viewModel : UsserViewModel){
        if (loginStatus == LoginConstants.success) {
         loginViewModel = viewModel
         LoadingIndicator.sharedInstance.stopLoadingIndicator(parentView:self.view)
         self.performSegue(withIdentifier:LoginConstants.timeTableSegue, sender: self)
        } else {
         LoadingIndicator.sharedInstance.stopLoadingIndicator(parentView:self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SignInAction(_ sender: Any) {
      LibraryAPI.sharedInstance.authenticateUser(
        username:loginOutlets.username.text!,
        password:loginOutlets.password.text!)
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
