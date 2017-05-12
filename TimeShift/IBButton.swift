//
//  IBButton.swift
//  Netwerk24
//
//  Created by Vision Mkhabela on 2/14/17.
//  Copyright © 2017 24.com. All rights reserved.
//

import UIKit

@IBDesignable

class IBButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }


    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet {
            layer.shadowRadius = shadowRadius
        }
    
    }
    
    @IBInspectable var shadowColor: UIColor?{
        didSet {
            layer.shadowColor = shadowColor?.cgColor
            layer.masksToBounds = false;
        }
  
    }
    
    @IBInspectable var borderColor: UIColor?{
        didSet {
            layer.shadowColor = borderColor?.cgColor
        }
        
    }
    
    @IBInspectable var shadowOffset: CGSize?{
        didSet {
         
         self.layer.shadowOffset = CGSize(width:(shadowOffset?.width)!,height:(shadowOffset?.height)!);
        }
    }
  
    override func draw(_ rect: CGRect) {
      
        self.layer.shadowOffset = CGSize(width:0,height:1);
        

    }

    
}
