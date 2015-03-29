//
//  UIImageExtension.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

extension UIImage {    
    func tint(color: UIColor) -> UIImage {
        let rect = CGRectMake(0, 0, self.size.width, self.size.height);
        UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale);
        let c = UIGraphicsGetCurrentContext();
        self.drawInRect(rect)
        CGContextSetFillColorWithColor(c, color.CGColor);
        CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
        CGContextFillRect(c, rect);
        let result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return result;
    }
}