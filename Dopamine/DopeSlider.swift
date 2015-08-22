//
//  Slider.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class DopeSlider: DopeView {
    var arrowColor: UIColor? {

        didSet {
            arrowImageView!.image! = arrowImageView!.image!.tint(arrowColor!)
        }
    }
    
    var sliderGrabbyThing: UIView?
    var arrowImageView: UIImageView?
    var slidPercentage: Double = 0 {
        didSet {
            for (index, element) in listners.enumerate() {
                element(slidPercentage)
            }
        }
    }
    
    var listners: [(Double) -> ()] = Array<(Double) -> ()>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
        addGestures()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addGestures()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        sliderGrabbyThing = UIView(frame: CGRectMake(4, 4, self.frame.height - 8, self.frame.height - 8))
        sliderGrabbyThing!.layer.cornerRadius = sliderGrabbyThing!.frame.height / 2
        sliderGrabbyThing!.backgroundColor = UIColor.whiteColor()
        
        let imageWidth = (sliderGrabbyThing!.frame.width * (2/3))
        let imageHeight = imageWidth * (54/87)
        let arrowImageFrame = CGRectMake((sliderGrabbyThing!.frame.width / 6), (sliderGrabbyThing!.frame.height / 2) - (imageHeight / 2), imageWidth, imageHeight)
        
        arrowImageView = UIImageView(frame: arrowImageFrame)
        
        let arrowImage = UIImage(named: "arrow")!
        
        arrowImageView!.image = ABImage(CGImage: arrowImage.CGImage!, scale: arrowImage.scale, orientation: .Right)
        
        colorListners.append({ (color: UIColor) in
            (self.arrowImageView!.image! as! ABImage).backgroundColor = color
        })
        
        sliderGrabbyThing!.addSubview(arrowImageView!)
        self.addSubview(sliderGrabbyThing!)
    }
    
    func addGestures() {
        let dragGesture = UIPanGestureRecognizer(target: self, action: Selector("handleDrag:"))
        sliderGrabbyThing?.addGestureRecognizer(dragGesture)
    }
    
    func handleDrag(recognizer: UIPanGestureRecognizer) {
        if let myView = recognizer.view {
            if recognizer.state == .Changed {
                let translation = recognizer.translationInView(self)
                let newPos = CGPoint(x:recognizer.view!.center.x + translation.x, y:recognizer.view!.center.y + translation.y)
                
                let f = CGRectMake(recognizer.view!.frame.origin.x + translation.x, recognizer.view!.frame.origin.y + translation.y, recognizer.view!.frame.width, recognizer.view!.frame.height)
                
                if frameIsInFrame(f, bgFrame: sliderGrabbyThing!.frame) {
                    myView.center = CGPointMake(newPos.x, myView.center.y)
                    recognizer.setTranslation(CGPointZero, inView: self)
                    
                    slidPercentage = sliderGrabbyThing!.center.x.toDouble() / (self.frame.width.toDouble() - sliderGrabbyThing!.frame.width.toDouble() / 2)
                } else if f.origin.x < 0 {
                    myView.frame.origin.x = 0
                }
            }
        }
    }
    
    func frameIsInFrame(frame: CGRect, bgFrame: CGRect) -> Bool {
        let before = frame.origin.x - 4 < 0
        let beyond = (frame.origin.x + frame.width + 4) > self.frame.size.width
            
        return !before && !beyond
    }
}

