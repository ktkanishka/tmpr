//
//  CardImageView.swift
//  EatFirst
//
//  Created by Kanishka Raveendra on 10/8/18.
//  Copyright © 2018 ThinkSmart Solutions Private Limited. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class CardImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 20

    @IBInspectable var shadowOffsetWidth: Int = -1
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = .black
    @IBInspectable var shadowOpacity: Float = 0.2

    override public func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = shadowOpacity//0.2
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.masksToBounds = true
    }
}
