//
//  DopeView.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class DopeView: UIView {
    var dopeColor: UIColor = UIColor.whiteColor() {
        didSet {
            for l in colorListners {
                l(dopeColor)
            }
        }
    }
    
    var colorListners: [((UIColor) -> ())] = Array<(UIColor) -> ()>()
        
    func construct() {
        
    }
    
    func deconstruct() {
        
    }
}
