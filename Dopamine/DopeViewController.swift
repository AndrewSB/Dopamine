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
        }
    }
    
    var nextBackgroundColor: UIColor = UIColor.whiteColor() {
        didSet {
            
        }
    }
    
    var currentDopeElement: UIView?
    
    
    
    func loadTheDopeness() {
        
    }
    
    func insert() {
        
    }
    
    func insertDopeSlider(atY: CGFloat = UIScreen.mainScreen().bounds.height / 2) {
        
    }
    
    func insertDopePullToRefresh(from: ScreenEdge = ScreenEdge.random()) {
        
    }
}
