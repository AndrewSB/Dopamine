//
//  UIColor extension.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

extension UIColor {
    class func fromRGB(red: Int, green: Int, blue: Int) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(1))
    }
    
    class func fromHex(hexString: String) -> UIColor {
        var rgbValue: UInt32 = 0
        var scanner = NSScanner(string: hexString)
        scanner.scanLocation = 0
        scanner.scanHexInt(&rgbValue)
        var red = (rgbValue & 0xFF0000) >> 16
        var green = (rgbValue & 0xFF00) >> 8
        var blue = (rgbValue & 0xFF)
        
        var color = UIColor.fromRGB(Int(red), green: Int(green), blue: Int(blue))
        
        return color
    }
    
    class func randomColor() -> UIColor {
        return UIColor.fromRGB(Int(arc4random_uniform(255)), green: Int(arc4random_uniform(255)), blue: Int(arc4random_uniform(255)))
    }
}