//
//  CustomView.swift
//  2six4
//
//  Created by Macbook on 2/1/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

@IBDesignable

open class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var path : UIBezierPath!
    @IBInspectable var defaultColor : UIColor = UIColor.white
    @IBInspectable var activeColor : UIColor = UIColor.white
    @IBInspectable var isActive : Bool = false
    @IBInspectable var lineWidth : CGFloat = 0.0
    @IBInspectable var strokeColor : UIColor = UIColor.white
    

    override open func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor.clear
        path = UIBezierPath(ovalIn: rect)
        if isActive {
            activeColor.setFill()
        }else{
            defaultColor.setFill()
        }
        path.fill()
    }
    
    @IBInspectable var isBorder : Bool = true{
        didSet{
//            let layer = CAShapeLayer()
//            layer.path = path.cgPath
//            layer.lineWidth = lineWidth
//            layer.fillColor = UIColor.clear.cgColor
//            layer.strokeColor = strokeColor.cgColor
//            
//            for var subLayer in layer.sublayers! {
//                if(subLayer.isKind(of: CAShapeLayer.self)){
//                    let sub : CALayer = subLayer
//                    sub.removeFromSuperlayer()
//                }
//            }
//            
//            layer.addSublayer(layer)
            
        }
    }

}
