//
//  Quote.swift
//  Quoter
//
//  Created by Brandon Low on 8/17/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Cocoa

class Quote: NSDocument {

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }
    
    // TODO: Actually make the window controllers
    override func makeWindowControllers() {
        addWindowController(QuoteWindowController(windowNibName: NSNib.Name("Quote")))
    }

}
