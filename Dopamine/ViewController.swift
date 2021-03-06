//
//  ViewController.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 8/22/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

protocol Dopaminable {
    func add()
    func remove()
}


class ViewController: UIViewController {
    
    var currentDopamine: Dopaminable!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        addSlider()
    }
    
    func addSlider() {
        
        let centerRect = CGRect.centerWithSize(view.center, size: CGSize(width: 340, height: 44))
        let unlock = UnlockSlider(colors: (UIColor.fromHex("FFC0CB"), UIColor.fromHex("E9967A")), frame: centerRect)
        unlock.view = self
        
        self.currentDopamine = unlock
        
        view.addSubview(unlock)
    }
}

