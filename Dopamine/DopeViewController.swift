//
//  DopeViewController.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

enum ScreenEdge: Int {
    case Top = 0
    case Left = 1
    case Right = 2
    case Bottom = 3
    
    static func random() -> ScreenEdge {
        return ScreenEdge(rawValue: Int(arc4random_uniform(4)))!
    }
}

class DopeViewController: UIViewController {
    var lastBackgroundColor: UIColor = UIColor.whiteColor() {
        didSet {
            
        }
    }
    
    var currentBackgroundColor: (UIColor, Bool) = (UIColor.whiteColor(), true) {
        didSet {
            if currentBackgroundColor.1 {
                lastBackgroundColor = currentBackgroundColor.0
            }
            
            DopeAnimate(animatingObject: self.view).fadeTo(currentBackgroundColor.0)
            
            currentDopeElement!.dopeColor = currentBackgroundColor.0
        }
    }
    
    var nextBackgroundColor: UIColor = UIColor.whiteColor() {
        didSet {
            
        }
    }
    
    var currentDopeElement: DopeView?
    
    func insert() {
        
    }
    
    func insertDopeSlider(atY: CGFloat = CGFloat(arc4random_uniform(UInt32(UIScreen.mainScreen().bounds.height)))) {
        let frame = CGRectMake(self.view.frame.width / 6, atY, self.view.frame.width * (2/3), 100)
        currentDopeElement = DopeSlider(frame: frame)
        (currentDopeElement as! DopeSlider).listners.append({ (percent: Double) in
            if percent > 0.9 {
                print("play sound")
            }
            
            self.currentBackgroundColor = (UIColor.fadeBetweenColors(self.lastBackgroundColor, secondColor: self.nextBackgroundColor, percent: percent), false)
        })
        
        self.view.addSubview(currentDopeElement!)
    }
    
    func insertDopePullToRefresh(from: ScreenEdge = ScreenEdge.random()) {
        
    }
}
