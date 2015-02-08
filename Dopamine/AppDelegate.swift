//
//  AppDelegate.swift
//  Dopamine
//
//  Created by Andrew Breckenridge on 2/8/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        pauseTheShit()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        pauseTheShit()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        startTheShit()
    }

    func applicationDidBecomeActive(application: UIApplication) {
        startTheShit()
    }

    func startTheShit() {
    
    }
    
    func pauseTheShit() {
        
    }
}

