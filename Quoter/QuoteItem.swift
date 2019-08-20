//
//  QuoteItem.swift
//  Quoter
//
//  Created by Brandon Low on 8/19/19.
//  Copyright © 2019 Brandon Low. All rights reserved.
//

import Foundation

protocol QuoteItem {
    
    // The name of the quote item, which appears in the quote item list
    var name: String { get }
    
    // The subtotal of the item, in hundredths of cents
    var subtotal: Int { get }
    
}

class QuoteItemImpl: QuoteItem {
    
    var name: String
    var subtotal: Int
    
    init(name: String, subtotal: Int) {
        self.name = name
        self.subtotal = subtotal
    }
    
}
