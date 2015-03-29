//
//  Slider.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class Slider: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = self.frame.height / 2
        
        let sliderGrabbyThing = UIView(frame: CGRectMake(2, 2, self.frame.height - 4, self.frame.height - 4))
        sliderGrabbyThing.layer.cornerRadius = self.frame.height / 2
        
        let imageWidth = (sliderGrabbyThing.frame.width * (2/3))
        let imageHeight = imageWidth * (54/87)
        let arrowImageFrame = CGRectMake((sliderGrabbyThing.frame.width / 6), (sliderGrabbyThing.frame.height / 2) + (imageHeight / 2), imageWidth, imageHeight)
        
        let arrowImage = UIImageView(frame: arrowImageFrame)
        
        sliderGrabbyThing.addSubview(arrowImage)
        self.addSubview(sliderGrabbyThing)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

