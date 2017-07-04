//
//  IBTextField.swift
//  Netwerk24
//
//  Created by Vision Mkhabela on 2/14/17.
//  Copyright © 2017 24.com. All rights reserved.
//

import UIKit

 @IBDesignable

class IBTextField:UITextField, UITextFieldDelegate {
    
    let lineView = UIView()
    let textNameLabel = UILabel()
    var _isIPadTextfield = Bool()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }
 
    let underlineViewLayer = CALayer()
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
	
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
	
    @IBInspectable var underlineColorWidth: UIColor? {
        didSet {
            underlineViewLayer.borderColor = underlineColorWidth?.cgColor
        }
    }

    func addLineView(){

    }
    
    @IBInspectable var isIPadTextField : Bool = false {
        
        didSet {
            
         self.lineView.frame = CGRect(x: 0, y:self.frame.size.height - self.borderlineWidth - 12, width: self.frame.size.width+160, height: self.borderlineWidth)
        _isIPadTextfield = isIPadTextField
        }
    }
	
    func animateTitleLabel(){
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity:0.1, options: .curveEaseInOut, animations: {
            self.textNameLabel.frame = CGRect(x: 0, y: -3, width: self.bounds.size.width, height: 20)
            self.textNameLabel.font = UIFont.systemFont(ofSize:14)
        }, completion: nil)
        
    }
    
    @IBInspectable var titleName: String = "" {
        didSet {
            
        }
    }
    
    func addTitleLabel(){
        
        if( self.textNameLabel.text != nil) {
            self.textNameLabel.removeFromSuperview()
            self.textNameLabel.text = nil;
        }
        
        self.textNameLabel.frame = CGRect(x: 0, y: -6, width: self.bounds.size.width, height: 20)
        self.textNameLabel.text = self.titleName
        self.placeholder = ""
        
        self.textNameLabel.font = UIFont.systemFont(ofSize:12)
        if(self.text == ""){
            self.textNameLabel.frame = CGRect(x: 0, y: 16, width: self.bounds.size.width, height: 20)
            self.textNameLabel.font = UIFont.systemFont(ofSize:16)
        }
        
        self.textNameLabel.textColor = self.textColor;
        self.textNameLabel.alpha = 0.4;
        self.textNameLabel.text = titleName;
        self.addSubview(self.textNameLabel)
    }
    
    override func draw(_ rect: CGRect) {
        self.lineView.removeFromSuperview()
        self.lineView.frame = CGRect(x: 0, y:self.frame.size.height - self.borderlineWidth - 12, width: self.frame.size.width, height: self.borderlineWidth)
        self.lineView.alpha = 0.3
        self.lineView.backgroundColor = self.textColor;
        self.addSubview(self.lineView)
    }
    
    @IBInspectable var borderlineWidth: CGFloat = 0 {
        didSet{
            self.lineView.removeFromSuperview()
            self.lineView.frame = CGRect(x: 0, y:self.frame.size.height - self.borderlineWidth - 12, width: self.frame.size.width, height: self.borderlineWidth)
            self.lineView.alpha = 0.3
            self.lineView.backgroundColor = self.textColor;
            self.addSubview(self.lineView)

        }    
    }
 }
