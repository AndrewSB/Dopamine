//
//  ViewController.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 2/8/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        fadeBackgroundTo(UIColor.randomColor())
    }
    
    @IBAction func buttonWasHit(sender: AnyObject) {
        let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        sprintAnimation.toValue = NSValue(CGPoint: CGPointMake(0.9, 0.9))
        sprintAnimation.velocity = NSValue(CGPoint: CGPointMake(2, 2))
        sprintAnimation.springBounciness = 20
        self.textLabel.pop_addAnimation(sprintAnimation, forKey: "springAnimation")
        
        fadeBackgroundTo(UIColor.randomColor())
    }
    
    func fadeBackgroundTo(color: UIColor) {
        let animation = POPSpringAnimation(propertyNamed: kPOPViewBackgroundColor)
        
        animation.toValue = color.CGColor
        
        self.view.pop_addAnimation(animation, forKey: "colorAnimation")
    }
    
    
}

