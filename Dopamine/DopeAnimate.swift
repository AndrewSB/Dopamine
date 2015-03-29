//
//  DopeAnimate.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

class DopeAnimate {
    var animatingObject: UIView
    
    init(animatingObject: UIView) {
        self.animatingObject = animatingObject
    }
    
    func fadeTo(color: UIColor) {
        let animation = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
        animation.toValue = color.CGColor
        
        self.animatingObject.pop_addAnimation(animation, forKey: "colorAnimation")
    }
}