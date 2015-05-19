//
//  ABImage.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class ABImage: UIImage {
    var backgroundColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.tint(backgroundColor)
        }
    }
}
