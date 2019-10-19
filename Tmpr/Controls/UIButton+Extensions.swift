//
//  UIButton+Extensions.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/16/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func makeBorderLine(radius: CGFloat = 5.0, borderWidth: CGFloat = 1.0) {
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor.black.cgColor
    }
}

