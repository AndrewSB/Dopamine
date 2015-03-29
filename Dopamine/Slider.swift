//
//  Slider.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class Slider: UIView {
    var arrowColor: UIColor? {
        didSet {
            
            arrowImageView!.image! = arrowImageView!.image!.tint(arrowColor!)
        }
    }
    
    var sliderGrabbyThing: UIView?
    var arrowImageView: UIImageView?
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
        addGestures()
        
    }
    
    func setup() {
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        sliderGrabbyThing = UIView(frame: CGRectMake(2, 2, self.frame.height - 4, self.frame.height - 4))
        sliderGrabbyThing!.layer.cornerRadius = self.frame.height / 2
        sliderGrabbyThing!.backgroundColor = UIColor.whiteColor()
        
        let imageWidth = (sliderGrabbyThing!.frame.width * (2/3))
        let imageHeight = imageWidth * (54/87)
        let arrowImageFrame = CGRectMake((sliderGrabbyThing!.frame.width / 6), (sliderGrabbyThing!.frame.height / 2) - (imageHeight / 2), imageWidth, imageHeight)
        
        arrowImageView = UIImageView(frame: arrowImageFrame)
        
        let arrowImage = UIImage(named: "arrow")!
        
        arrowImageView!.image = UIImage(CGImage: arrowImage.CGImage, scale: arrowImage.scale, orientation: .Right)
        
        sliderGrabbyThing!.addSubview(arrowImageView!)
        self.addSubview(sliderGrabbyThing!)
    }
    
    func addGestures() {
        let dragGesture = UIPanGestureRecognizer(target: self, action: Selector("handleDrag:"))
        sliderGrabbyThing?.addGestureRecognizer(dragGesture)
    }
    
    func handleDrag(recognizer: UIPanGestureRecognizer) {
        if let myView = recognizer.view {
            switch (recognizer.state) {
            case .Changed:
                let translation = recognizer.translationInView(self)
                let newPos = CGPoint(x:recognizer.view!.center.x + translation.x, y:recognizer.view!.center.y + translation.y)
                
                let v = recognizer.view!.frame
                let f = sliderGrabbyThing!.frame

                if frameIsInFrame(CGRectMake(recognizer.view!.frame.origin.x + translation.x, recognizer.view!.frame.origin.y + translation.y, recognizer.view!.frame.width, recognizer.view!.frame.height), bgFrame: sliderGrabbyThing!.frame) {
                    myView.center = CGPointMake(newPos.x, myView.center.y)
                    recognizer.setTranslation(CGPointZero, inView: self)
                }
                
            default:
                break
            }
        }
    }
    
    func frameIsInFrame(frame: CGRect, bgFrame: CGRect) -> Bool {
        let small = frame.origin.x
        let big = frame.origin.x + frame.width

        let selfframe = self.frame
        
        let before = small < 0
        
        let beyond = big > self.frame.size.width
            
        return !before && !beyond
    }

    
    

}

