//
//  CGeometery.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 9/13/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

extension CGRect {
    static func centerWithSize(center: CGPoint, size: CGSize) -> CGRect {
        return CGRectMake(center.x - (size.width/2), center.y - (size.height/2), size.width, size.height);
    }
}