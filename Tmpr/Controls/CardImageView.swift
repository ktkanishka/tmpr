//
//  CardImageView.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/16/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class CardImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 8

    override public func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
