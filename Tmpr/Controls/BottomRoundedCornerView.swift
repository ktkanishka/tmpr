//
//  BottomRoundedCornerView.swift
//  M.SMS
//
//  Created by Kanishka Raveendra on 7/31/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class BottomRoundedCornerView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 8
    override func layoutSubviews() {
        
        self.clipsToBounds = false
        let corners:UIRectCorner = ([.bottomLeft , .bottomRight])
        let maskPAth1 = UIBezierPath(roundedRect: self.bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii:CGSize(width:8.0, height:8.0))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = self.bounds
        maskLayer1.path = maskPAth1.cgPath
        self.layer.mask = maskLayer1
        
    }
}
