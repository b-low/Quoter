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
        let windowController = QuoteWindowController(representedObject: quoteData)

        
        
        
        // DEBUG
        Swift.print("mwc")
        for item in quoteData.quoteItems {
            Swift.print("\(item.name): \(Float(item.subtotal) / 100)")
        }
        
        addWindowController(windowController)
    }
    
    override func windowControllerDidLoadNib(_ windowController: NSWindowController) {
        // TODO: Populate view elements with data
    }

}
