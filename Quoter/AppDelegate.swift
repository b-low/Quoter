//
//  AppDelegate.swift
//  Quoter
//
//  Created by Brandon Low on 8/17/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var preferencesController: NSWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func showPreferences(_ sender: Any) {
        if preferencesController == nil {
            let storyboard = NSStoryboard(name: NSStoryboard.Name("Prefrerences"), bundle: nil)
            preferencesController = storyboard.instantiateInitialController() as? NSWindowController
        }
        
        preferencesController!.showWindow(sender)
    }
}

