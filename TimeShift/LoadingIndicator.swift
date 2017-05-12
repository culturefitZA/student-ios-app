//
//  LoadingIndicator.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 4/23/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation
import UIKit

class LoadingIndicator {
 
    var activityIndicator : UIActivityIndicatorView
    
    class var sharedInstance: LoadingIndicator {
        struct Singleton {
            static let instance = LoadingIndicator()
        }
        return Singleton.instance
    }
    
    init() {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    }
    
    func startLoadingIndicator(parentView:UIView){
     activityIndicator.center = parentView.center
     activityIndicator.startAnimating()
     parentView.alpha = 0.6
     parentView.addSubview(activityIndicator)
    }
    
    func stopLoadingIndicator(parentView:UIView){
     activityIndicator.stopAnimating()
    }
    
}




/*
 let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
 */
