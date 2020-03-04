//
//  Quote.swift
//  Quoter
//
//  Created by Brandon Low on 8/17/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Cocoa

class Quote: NSDocument {
    
    var quoteData: QuoteData

    override init() {
        quoteData = QuoteData()
        
        super.init()
    }

    override class var autosavesInPlace: Bool {
        return true
    }
    
    override func read(from data: Data, ofType typeName: String) throws {
        quoteData = try! JSONDecoder().decode(QuoteData.self, from: data)
    }
    
    override func data(ofType typeName: String) throws -> Data {
        return try! JSONEncoder().encode(quoteData)
    }
    
    override func makeWindowControllers() {
        let windowController = QuoteWindowController(windowNibName: NSNib.Name("Quote"), owner: self)
        addWindowController(windowController)
        
        if let contentVC = windowController.contentViewController {
            contentVC.representedObject = quoteData
            // contentViewController = contentVC
        }
    }
    
    override func windowControllerDidLoadNib(_ windowController: NSWindowController) {
        // TODO: Populate view elements with data
    }

}
