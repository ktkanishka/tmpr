//
//  BottomRoundedCornersView.swift
//  EatFirst
//
//  Created by Kanishka Raveendra on 4/7/19.
//  Copyright © 2019 ThinkSmart Solutions Private Limited. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class BottomRoundedCornersView: UIView {
    override public func layoutSubviews() {
        
        let rectShapeLeft = CAShapeLayer()
        rectShapeLeft.bounds = self.frame
        rectShapeLeft.position = self.center
        rectShapeLeft.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        //Here I'm masking the View's layer with rectShape layer
        layer.mask = rectShapeLeft
    }
}
