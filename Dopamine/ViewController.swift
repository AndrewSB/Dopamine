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
    @IBOutlet weak var sliderView: Slider!
    
    var backgroundColor: UIColor = UIColor.whiteColor() {
        didSet {
            DopeAnimate(animatingObject: self.view).fadeTo(backgroundColor)
            sliderView.arrowColor = backgroundColor
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        self.backgroundColor = UIColor.randomColor()
    }
    
    @IBAction func buttonWasHit(sender: AnyObject) {
        let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        sprintAnimation.toValue = NSValue(CGPoint: CGPointMake(0.9, 0.9))
        sprintAnimation.velocity = NSValue(CGPoint: CGPointMake(2, 2))
        sprintAnimation.springBounciness = 20
        self.textLabel.pop_addAnimation(sprintAnimation, forKey: "springAnimation")
        
        let fadeBG = DopeAnimate(animatingObject: self.view)
        fadeBG.fadeTo(UIColor.randomColor())
    }
    
}

