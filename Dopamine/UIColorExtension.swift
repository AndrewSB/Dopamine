//
//  UIColor extension.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

extension UIColor {
    class func fromRGB(red: Double, green: Double, blue: Double) -> UIColor {
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
        
        var color = UIColor.fromRGB(Double(red), green: Double(green), blue: Double(blue))
        
        return color
    }
    
    class func randomColor() -> UIColor {
        return UIColor.fromRGB(Double(arc4random_uniform(255)), green: Double(arc4random_uniform(255)), blue: Double(arc4random_uniform(255)))
    }
    
    class func fadeBetweenColors(firstColor: UIColor, secondColor: UIColor, percent: Double) -> UIColor {
        
        let compOne = CGColorGetComponents(firstColor.CGColor)
        let compTwo = CGColorGetComponents(secondColor.CGColor)
        
        let red = Double(Double(compOne[0]) * (1-percent)) + Double(Double(compTwo[0]) * percent)
        let green = Double(Double(compOne[1]) * (1-percent)) + Double(Double(compTwo[1]) * percent)
        let blue = Double(Double(compOne[2]) * (1-percent)) + Double(Double(compTwo[2]) * percent)
        
        return UIColor.fromRGB(red*255, green: green*255, blue: blue*255)
    }
}