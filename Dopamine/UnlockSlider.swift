//
//  UnlockSlider.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 9/13/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class UnlockSlider: UISlider {
    
    var colors: (UIColor, UIColor) = (UIColor.greenColor(), UIColor.redColor())
    var currentColor: UIColor! {
        didSet {
            view?.view.backgroundColor = currentColor
            print(currentColor)
        }
    }
    
    var view: UIViewController?
    
    convenience init(colors: (UIColor, UIColor), frame: CGRect) {
        self.init(frame: frame)
        self.colors = colors
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        
        minimumTrackTintColor = UIColor.clearColor()
        maximumTrackTintColor = UIColor.clearColor()
        
        let backgroundView = UIView(frame: CGRect(origin: CGPoint.zero, size: self.frame.size))
        backgroundView.backgroundColor = UIColor.greenColor()
        backgroundView.userInteractionEnabled = false
        
        backgroundView.layer.cornerRadius = backgroundView.frame.height / 2
        backgroundView.clipsToBounds = true
        
        self.addTarget(self, action: "sliderValueChanged:", forControlEvents: .ValueChanged)
        
        sliderValueChanged(self)
        
        addSubview(backgroundView)
        sendSubviewToBack(backgroundView)
    }
    
    func sliderValueChanged(sender: UISlider) {
        currentColor = UIColor.fadeBetweenColors(colors.0, secondColor: colors.1, percent: Double(sender.value))
    }

}
