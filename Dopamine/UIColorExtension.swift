//
//  UIColor extension.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

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
        
        let firstC = CGColorGetComponents(firstColor.CGColor)
        let secondC = CGColorGetComponents(secondColor.CGColor)
        
        let red = ((firstC[0].toDouble() * (1.0 - percent)) + (secondC[0].toDouble() * percent)) / 2
        let green = ((firstC[1].toDouble() * (1.0 - percent)) + (secondC[1].toDouble() * percent)) / 2
        let blue = ((firstC[2].toDouble() * (1.0 - percent)) + (secondC[2].toDouble() * percent)) / 2

        return UIColor.fromRGB(red, green: green, blue: blue)
    }
}