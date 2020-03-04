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
    
    override func read(from data: Data, ofType typeName: String) throws {
        // TODO: Read data
    }
    
    override func data(ofType typeName: String) throws -> Data {
        // TODO: Write data
    }
    
    override func makeWindowControllers() {
        addWindowController(QuoteWindowController(windowNibName: NSNib.Name("Quote"), owner: self))
    }
    
    override func windowControllerDidLoadNib(_ windowController: NSWindowController) {
        // TODO: Populate view elements with data
    }

}
