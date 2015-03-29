//
//  DopeSoundEffect.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 3/29/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation


private var instance: DopeSoundEffects?
class DopeSoundEffects {
    var effectURLs: [NSURL]
    var defaultEffects = [NSURL()]
    
    init() {
        effectURLs = [NSURL]()
        instance = self
    }
    
    init(urls: [NSURL]) {
        self.effectURLs = urls
        instance = self
    }
    
    func initWithDefaultSounds() -> DopeSoundEffects {
        return DopeSoundEffects(urls: defaultEffects)
        
    }
    
    func addSound(url: NSURL) {
        effectURLs.append(url)
    }
    
    class func getInstance() -> DopeSoundEffects {
        if let i = instance {
            return i
        } else {
            return DopeSoundEffects()
        }
    }
}