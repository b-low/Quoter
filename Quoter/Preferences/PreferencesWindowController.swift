//
//  PreferencesWindowController.swift
//  Quoter
//
//  Created by Brandon Low on 3/3/20.
//  Copyright © 2020 Brandon Low. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController, NSWindowDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        self.window?.orderOut(sender)
        return false
    }
}
