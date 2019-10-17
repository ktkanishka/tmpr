//
//  AppColor.swift
//  M.SMS
//
//  Created by Kanishka Raveendra on 6/13/18.
//  Copyright © 2018 Kanishka Raveendra. All rights reserved.
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
    //UIColor(red: 17/255, green: 14/255, blue: 181/255, alpha: Alphas.Opaque)
    static let appDefaultBackgroundColor = UIColor(red: 235/255, green: 239/255, blue: 248/255, alpha: Alphas.Opaque)
    
    //Dashboard
    
}
