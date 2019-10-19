//
//  AppColor.swift
//  Tmpr
//
//  Created by Kanishka Raveendra on 10/16/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit

struct AppColor {
    
    private struct Alphas {
        static let Opaque = CGFloat(1)
        static let SemiOpaque = CGFloat(0.8)
        static let SemiTransparent = CGFloat(0.5)
        static let Transparent = CGFloat(0.3)
    }
    
    static let appPrimaryColor = UIColor(red: 68/255, green: 150/255, blue: 83/255, alpha: Alphas.Opaque)
    static let appPrimaryDarkColor = UIColor(red: 56/255, green: 126/255, blue: 71/255, alpha: Alphas.Opaque)    
    static let appDefaultBackgroundColor = UIColor(red: 235/255, green: 239/255, blue: 248/255, alpha: Alphas.Opaque)
}
