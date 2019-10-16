//
//  CardView.swift
//  EatFirst
//
//  Created by Kanishka Raveendra on 10/9/18.
//  Copyright © 2018 ThinkSmart Solutions Private Limited. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {
    
//    @IBInspectable var cornerRadius: CGFloat = 20
    
    @IBInspectable var shadowOffsetWidth: Int = -1
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = .black
    @IBInspectable var shadowOpacity: Float = 0.2
    
    //https://stackoverflow.com/questions/18403578/how-can-i-add-shadow-to-a-circle-uiimageview-or-uiview
    override func layoutSubviews() {
        
//        layer.cornerRadius = cornerRadius
//        self.clipsToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.2
//        layer.shadowOffset = CGSize(width: 0, height: 1)
//        layer.shadowRadius = 4
        
       layer.cornerRadius = 20.0
       layer.shadowColor = UIColor.gray.cgColor
       layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
       layer.shadowRadius = 10.0
       layer.shadowOpacity = 0.4
        
//        layer.cornerRadius = 20
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.7//shadowOpacity//0.2
//        layer.shadowRadius = 10
//        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
//        layer.masksToBounds = true
    }
    
}
