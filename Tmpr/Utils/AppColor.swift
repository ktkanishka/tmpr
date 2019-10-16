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
    
    
    
    static let appSecondaryColor =  UIColor.blue.withAlphaComponent(Alphas.Opaque)
    static let appLightGrayColor =  UIColor(red: 232/255, green: 235/255, blue: 239/255, alpha: Alphas.Opaque)
    static let appCancelButtonColor =
        UIColor(red: 255/255, green: 69/255, blue: 0/255, alpha: Alphas.Opaque)
    static let appCompleteSVOButtonColor =
        UIColor(red: 24/255, green: 197/255, blue: 141/255, alpha: Alphas.Opaque)
    
    struct TextColors {
        static let Error = AppColor.appSecondaryColor
        static let Success = UIColor(red: 0.1303, green: 0.9915, blue: 0.0233, alpha: Alphas.Opaque)
    }
    
    struct TabBarColors{
        static let Selected = UIColor.white
        static let NotSelected = UIColor.black
    }
    
    struct OverlayColor {
        static let SemiTransparentBlack = UIColor.black.withAlphaComponent(Alphas.Transparent)
        static let SemiOpaque = UIColor.black.withAlphaComponent(Alphas.SemiOpaque)
        static let demoOverlay = UIColor.black.withAlphaComponent(0.6)
    }
}
