//
//  CustomButton.swift
//  EatFirst
//
//  Created by Kanishka Raveendra on 5/11/19.
//  Copyright © 2019 ThinkSmart Solutions Private Limited. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    override func layoutSubviews() {
        
        self.clipsToBounds = false
        
        let corners:UIRectCorner = ([.topLeft , .topRight, .bottomRight , .bottomLeft])
        let maskPAth1 = UIBezierPath(roundedRect: self.bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii:CGSize(width:8.0, height:8.0))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = self.bounds
        maskLayer1.path = maskPAth1.cgPath
        self.layer.mask = maskLayer1
    }
    
}
