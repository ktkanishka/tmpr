//
//  CardViewSmall.swift
//  EatFirst
//
//  Created by Kanishka Raveendra on 11/27/18.
//  Copyright © 2018 ThinkSmart Solutions Private Limited. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CardViewSmall: UIView {
    @IBInspectable var cornerRadius: CGFloat = 8
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        self.clipsToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.5
//        layer.shadowOffset = CGSize(width: 0, height: 1)
//        layer.shadowRadius = 4
    }
}
