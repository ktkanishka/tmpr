//
//  UIView+Extenstions.swift
//  M.SMS
//
//  Created by Kanishka Raveendra on 7/31/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit


//MARK: Draw Underline
//https://stackoverflow.com/questions/26800963/add-bottom-line-to-view-in-swift-objective-c-xamarin

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: Int = 16) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}

enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}

extension UIView {
    func addLine(position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .LINE_POSITION_TOP:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}

extension UIView {
    func roundedCorners(top: Bool){
        let corners:UIRectCorner = (top ? [.topLeft , .topRight] : [.bottomRight , .bottomLeft])
        let path = UIBezierPath(roundedRect: self.bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii:CGSize(width:8.0, height:8.0))
//        let maskLayer1 = CAShapeLayer()
//        maskLayer1.frame = self.bounds
//        maskLayer1.path = path.cgPath
//        self.layer.mask = maskLayer1
        let mask = CAShapeLayer()
        let rect = self.bounds
        mask.frame = rect
        mask.path = path.cgPath
        self.layer.mask = mask
        
        self.clipsToBounds = false
    }
}
