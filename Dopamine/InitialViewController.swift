//
//  InitialViewController.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class InitialViewController: DopeViewController {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        insertDopeSlider()
        
        self.currentBackgroundColor = (UIColor.randomColor(), true)
    }
}
