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
    
        window?.setFrame(NSMakeRect(window?.frame.origin.x ?? 0, window?.frame.origin.y ?? 0, 730, 500), display: false)
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        self.window?.orderOut(sender)
        return false
    }
}
