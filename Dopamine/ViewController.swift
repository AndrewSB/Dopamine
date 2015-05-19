////
////  ViewController.swift
////  Dopamine
////
////  Created by Andrew Breckenridge on 2/8/15.
////  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    @IBOutlet weak var textLabel: UILabel!
//    @IBOutlet weak var sliderView: Slider!
//    
//    var lastFullSetColor: UIColor = UIColor.whiteColor() {
//        didSet {
//            backgroundColor = lastFullSetColor
//        }
//    }
//    
//    var nextColor: UIColor = UIColor.blueColor()
//    
//    var backgroundColor: UIColor = UIColor.whiteColor() {
//        didSet {
//            DopeAnimate(animatingObject: self.view).fadeTo(backgroundColor)
//            
//            sliderView.arrowImageView?.backgroundColor = backgroundColor
//        }
//    }
//
//    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//
//        self.lastFullSetColor = UIColor.randomColor()
////        self.nextColor = UIColor.randomColor()
//        sliderView.listners.append({ (percent: Double) in
//            
//            self.backgroundColor = UIColor.fadeBetweenColors(self.lastFullSetColor, secondColor: self.nextColor, percent: percent)
//            
//            if percent > 0.9 {
//                println("finish")
//            }
//        })
//    }
//    
//    @IBAction func buttonWasHit(sender: AnyObject) {
//        let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
//        sprintAnimation.toValue = NSValue(CGPoint: CGPointMake(0.9, 0.9))
//        sprintAnimation.velocity = NSValue(CGPoint: CGPointMake(2, 2))
//        sprintAnimation.springBounciness = 20
//        self.textLabel.pop_addAnimation(sprintAnimation, forKey: "springAnimation")
//        
//        lastFullSetColor = UIColor.randomColor()
//    }
//}
//
