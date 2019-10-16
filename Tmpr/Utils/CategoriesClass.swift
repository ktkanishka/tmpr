//
//  CategoriesClass.swift
//  2six4
//
//  Created by Macbook on 2/2/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
import Foundation


extension String{
    func localStringForKey(key: String) -> String{
        let path = Bundle.main.path(forResource: self, ofType: "lproj")
        return (Bundle(path: path!)?.localizedString(forKey: key, value: nil, table: nil))!
    }
}
extension RawRepresentable where RawValue == String{
    func localStringForKey(key: String) -> String {
        let path = Bundle.main.path(forResource: rawValue, ofType: "lproj")
        return (Bundle(path: path!)?.localizedString(forKey: key, value: nil, table: nil))!
    }
    
}

public extension UIColor{
    public static func color(fromHexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        let hexint = Int(colorInteger(fromHexString: fromHexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    private static func colorInteger(fromHexString: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: fromHexString)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    var redValue: CGFloat{
        return cgColor.components! [0]
    }
    
    var greenValue: CGFloat{
        return cgColor.components! [1]
    }
    
    var blueValue: CGFloat{
        return cgColor.components! [2]
    }
    
    var alphaValue: CGFloat{
        return cgColor.components! [3]
    }
    
    var isWhiteText: Bool {
        let red = self.redValue * 255
        let green = self.greenValue * 255
        let blue = self.blueValue * 255
        let yiq = ((red * 299) + (green * 587) + (blue * 114)) / 1000
        return yiq < 192
    }
}
